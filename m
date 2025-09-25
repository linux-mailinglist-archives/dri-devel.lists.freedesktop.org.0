Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CF8B9DCC0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1482810E864;
	Thu, 25 Sep 2025 07:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DkjdADbe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D25810E866
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:07:41 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-6361a421b67so322443d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758784060; x=1759388860; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUjZGyLU19RcwCrMKmops0qcnCk7VMqAFUtNT7ECI+o=;
 b=DkjdADbe8e2vbhayRd1M+0Wy+2LZyUUI0j1PeL1fFoUx5AojKH0waWRDvHiskm1pon
 L4k4oTJ0t7kEBZqi6J5EsSETH39gYZ7WclNGZMKtQeebk0cSGeZrUJoobFBoCa1JwFzA
 ZR73hLNVEzsy5HNAVH8VFN3I73PYzvz97EYwTMarS6aLQeuLBW7dgZvQaIh8yzDy73Y3
 lvmNZB+GoQ5x3p/mpxZgwMVYwWojz31vVvqTskYmcfUjzHY+T6+Ppj4lZrvw73/7zu/W
 O4AhC4iCr98kNHuUcybb0zejmscTi0f+D2AvZablSwgaL5XBwsLSBkVeQhn4j+FS9jNB
 HbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758784060; x=1759388860;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUjZGyLU19RcwCrMKmops0qcnCk7VMqAFUtNT7ECI+o=;
 b=fzNsXzzd4YD8bZaLMZZfYGhbKojmsngYmjAopPWDWu/DM49kQZkjQSCCMkAEDfUVtL
 +pPTqnnYHhA7kdvnJRqEGy0VM4WSbW3vZEkJMp3707UYAXWVREyPCj79K308wQ93xV+d
 f/HVQ7NQAn2lQmuuHhJcCmF1ALMMmMqDrOcWTUB+lN3XVww6neJgjIO/5sba8WfFIeGW
 rQpZdNHHvyQ26PLbrj4FUJ6BmGih7IFjefhVCTwj9fvhpa2vaTmEwuuNlZye3pQxEvX9
 +b7WfFLKp9wlWeCwC4ZzsytxEhMPZ4ueVsiSGPnZ+dkecuieN7vvcbrmxI9fi8X9/GOW
 ToNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdxR/lIqg00HuYzW83CyqhEjlNbfUDI087LZF8EeivQZc1tN6faIpF+q6Akyc6YzA6hFxNJ1vnf/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNQnijA/rNVuFCg1LamGLYBA6HOHG+v0+P7dmHSTzsZvSfXjMQ
 LJ6ztYCnDExgn/FHzR9OM4pCI/5rMU3qYRXihZJiqxZtsPCqr7EnUovF5VaFIAARReuqjaAKQQN
 ZMlpMdwXXqAFc/I1L+6rghChbiuvEd87/SoNlMa2l1Q==
X-Gm-Gg: ASbGncv9J+52OIm2a53cLI5VaSdGsGBcQr+ensGCWNQPKX606Tdaufq3RHOWJ+lk7ua
 4so8HkeSlQ83HF7Q4N/ZwqYM3RKNEZOjiU5uT5SNGJ8VyJlcAXDsBXJNr9PiBCaxn69HBwNBNhe
 biCpHakBe8LCxOCHDxUcMSAnIiGpJafA3a6efAEsUdUxPvw3VwqcSoCKd3SSt14pQtDGT5Vqr6J
 qeBNDlJ/3vjgS09U6A=
X-Google-Smtp-Source: AGHT+IE/1OBpeA99Fiz9qQHctTOBOmzg3ShTn+n3h2sPgqDM5viSZqLLP6KS9wKGApYeUgzJ2QakSD5Xgh2kbf5v4G8=
X-Received: by 2002:a05:690e:15d3:b0:633:bbf3:6f47 with SMTP id
 956f58d0204a3-6361a70dfe7mr1067697d50.6.1758784060255; Thu, 25 Sep 2025
 00:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-1-6927284f1098@linaro.org>
 <5b75dckankcx55gbm734a23rvqxdbprlus3nkvqfry7lz5ksjf@jjmfsbiwqny6>
In-Reply-To: <5b75dckankcx55gbm734a23rvqxdbprlus3nkvqfry7lz5ksjf@jjmfsbiwqny6>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 25 Sep 2025 15:07:28 +0800
X-Gm-Features: AS18NWCK3VUPymi0j56jgt9f35ZcIhzOf9s-0_IEyrE9TQ0T232i-Rva5B1N9-o
Message-ID: <CABymUCNZmxzRaVVLU=U9QPupK0KpW_C1eqa8t_ijL6B5EdgnAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
9=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 03:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 24, 2025 at 11:08:10PM +0800, Jun Nie wrote:
> > Some panels support multiple slice to be sent in a single DSC packet. A=
nd
>
> s/support/require/
>
> If the panel supports something, then we can omit that and send 1 slice
> as we currently do. If the panel requires multiple slices, it's
> mandatory.
>
> > this feature is a must for specific panels, such as JDI LPM026M648C. Ad=
d a
>
> A panel driver which executes this API is appreciated. Otherwise in a
> few months / years somebody will submit a patch 'field foo is not used
> by the kernel drivers, drop it'.

OK, will add a panel driver in next version.
>
> > dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> > feature in msm mdss driver.
> >
> > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
> >  include/drm/drm_mipi_dsi.h         |  2 ++
> >  2 files changed, 12 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index f297e3de8c3dc4e1326e70c78c046b5a19568cef..de51cb02f267205320c5a94=
fc4188413e05907e6 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -157,6 +157,7 @@ struct msm_dsi_host {
> >
> >       struct drm_display_mode *mode;
> >       struct drm_dsc_config *dsc;
> > +     unsigned int dsc_slice_per_pkt;
> >
> >       /* connected device info */
> >       unsigned int channel;
> > @@ -849,17 +850,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_=
host *msm_host, bool is_cmd_mod
> >       slice_per_intf =3D dsc->slice_count;
> >
> >       total_bytes_per_intf =3D dsc->slice_chunk_size * slice_per_intf;
> > -     bytes_per_pkt =3D dsc->slice_chunk_size; /* * slice_per_pkt; */
> > +     bytes_per_pkt =3D dsc->slice_chunk_size * msm_host->dsc_slice_per=
_pkt;
> >
> >       eol_byte_num =3D total_bytes_per_intf % 3;
> > -
> > -     /*
> > -      * Typically, pkt_per_line =3D slice_per_intf * slice_per_pkt.
> > -      *
> > -      * Since the current driver only supports slice_per_pkt =3D 1,
> > -      * pkt_per_line will be equal to slice per intf for now.
> > -      */
> > -     pkt_per_line =3D slice_per_intf;
> > +     pkt_per_line =3D slice_per_intf / msm_host->dsc_slice_per_pkt;
> >
> >       if (is_cmd_mode) /* packet data type */
> >               reg =3D DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYP=
E(MIPI_DSI_DCS_LONG_WRITE);
> > @@ -1008,12 +1002,8 @@ static void dsi_timing_setup(struct msm_dsi_host=
 *msm_host, bool is_bonded_dsi)
> >               else
> >                       /*
> >                        * When DSC is enabled, WC =3D slice_chunk_size *=
 slice_per_pkt + 1.
> > -                      * Currently, the driver only supports default va=
lue of slice_per_pkt =3D 1
> > -                      *
> > -                      * TODO: Expand mipi_dsi_device struct to hold sl=
ice_per_pkt info
> > -                      *       and adjust DSC math to account for slice=
_per_pkt.
> >                        */
> > -                     wc =3D msm_host->dsc->slice_chunk_size + 1;
> > +                     wc =3D msm_host->dsc->slice_chunk_size * msm_host=
->dsc_slice_per_pkt + 1;
> >
> >               dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
> >                       DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> > @@ -1623,8 +1613,13 @@ static int dsi_host_attach(struct mipi_dsi_host =
*host,
> >       msm_host->lanes =3D dsi->lanes;
> >       msm_host->format =3D dsi->format;
> >       msm_host->mode_flags =3D dsi->mode_flags;
> > -     if (dsi->dsc)
> > +     if (dsi->dsc) {
> >               msm_host->dsc =3D dsi->dsc;
> > +             msm_host->dsc_slice_per_pkt =3D dsi->dsc_slice_per_pkt;
> > +             /* for backwards compatibility, assume 1 if not set */
> > +             if (!msm_host->dsc_slice_per_pkt)
> > +                     msm_host->dsc_slice_per_pkt =3D 1;
>
> msm_host->dsc_slice_per_pkt =3D dsi->dsc_slice_per_pkt ?: 1;
>
> Yes, I think it's more ideomatic.

Will add the change.
>
> > +     }
> >
> >       ret =3D dsi_dev_attach(msm_host->pdev);
> >       if (ret)
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 6d2c08e8110151a97620389197f1ef79c058329d..5a85ba01f402a3866b70828=
391bb417bb8dd5956 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -182,6 +182,7 @@ struct mipi_dsi_device_info {
> >   * be set to the real limits of the hardware, zero is only accepted fo=
r
> >   * legacy drivers
> >   * @dsc: panel/bridge DSC pps payload to be sent
> > + * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single =
packet
>
> s/as //

Will do.
>
> >   */
> >  struct mipi_dsi_device {
> >       struct mipi_dsi_host *host;
> > @@ -196,6 +197,7 @@ struct mipi_dsi_device {
> >       unsigned long hs_rate;
> >       unsigned long lp_rate;
> >       struct drm_dsc_config *dsc;
> > +     unsigned int dsc_slice_per_pkt;
>
> Why is it a part of the DSI device config? What if a device specifies
> dsc_slice_per_pkt, but not DSC config? What are the legit boundaries for
> this field?

You are right. drm_dsc_config is better place to add the info. Thus only
panels that support DSC can convey the info to host.
>
> >  };
> >
> >  /**
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
