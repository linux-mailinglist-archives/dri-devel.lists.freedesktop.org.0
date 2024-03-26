Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA7888D38E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 01:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EB810EF0A;
	Wed, 27 Mar 2024 00:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YrKtJC7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC9910F201
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 19:50:29 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a4644bde1d4so767901066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 12:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711482628; x=1712087428;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7Ax8aAny0xqc+Z08/PPLf7PIhOXugensyc/ciexnqY=;
 b=YrKtJC7NeAU7D2t2600utq2WGNJpOApmAcUXsEIcQHndVlNk/L6vDrxS+FhZM0ysc0
 Bfe3TmT/5H2JicNjwFDDw1hIFhFBo8WDNSCYOZIxBAoDMMuNGYSjznWI2npydif07P7x
 SUu72IZZwH4WKTqeY9zNbDUkupJPFdsrSezMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711482628; x=1712087428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7Ax8aAny0xqc+Z08/PPLf7PIhOXugensyc/ciexnqY=;
 b=KTX0BUkiGAxc1sMp7CKpvQ9C8f6DYKlkCOs/WedlNgACE0ALm9OkkKHxFs2CnmVy5Q
 ma6XwZ+upaOjuiWCRV+VjJWOG4FgBcw7Lcr2LQVgCpXI5bWj8ANChk39Jp2xdhEkuFyU
 WGCeJnA24ibggVubBaKolRhUKv2HZqd9j0KQ4UD/W32BMnUNY3SYTAr3JFHXQIFi6D9Q
 IGsPsBc2NwIfYLdQwDx2lnWYytnCSfD8l4zCoznSzcX69o41zJ/AVRqlYxn2XYmGF1Z1
 YGZ0SRvb3Ixj5PNsLYIK+Z5WcxqAo0ZHtreMsQf4IAEIzb/21PM01yCCKuKSFvJClr42
 KOMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcDjAB4We+Dx0BzZgJK5jg986cVKgdi3mnGHXHqrz7fpu6H1ORe11fIvmDCCrrDkAGE7blCcIgbqaFocAd9OLA/6t9f+howe72voZDiPyb
X-Gm-Message-State: AOJu0YyzAvcxV6UexH2/u+AW6t4EJJs3UGVg6gt/IEv9f+q2tVrBYT9s
 X0HEcpGY2tIT28rQQtZBPNJwwcRSP6qr1YP3MldWNajq2NMQXFfOj7fJXGWdDbtFvavyh8+xwx5
 Ja9/b8BiNNCf0jbo3ZVLMptv5RoWsvv6JOYBMGdONg5VwbxQ=
X-Google-Smtp-Source: AGHT+IFG2bQK77xjXaXmz2DzCM53ln1KovXysvIBTJhpEART34opqr++GCvBUcrrBnq7gazq4dM4CWBo8h52v8T6TAM=
X-Received: by 2002:a17:906:6b13:b0:a47:340b:df71 with SMTP id
 q19-20020a1709066b1300b00a47340bdf71mr526469ejr.2.1711482627917; Tue, 26 Mar
 2024 12:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-2-imre.deak@intel.com>
 <2a35ee1b-4ef4-49e2-a481-d6929e522f16@intel.com>
In-Reply-To: <2a35ee1b-4ef4-49e2-a481-d6929e522f16@intel.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Tue, 26 Mar 2024 12:50:17 -0700
Message-ID: <CAE72mNmxJ9Fj8z=4RBZt1xAorN8KWtSfUNXy8VPgT7GcQ6WdRQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/i915/dp: Fix DSC line buffer depth programming
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 27 Mar 2024 00:59:10 +0000
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

Hi Imre,

Thanks for the DSC fixes.
Would the line buf depth calculation that was getting set to 0 impact
DSC on all platforms
or was this issue only specific to MTL and was getting set correctly
with older platforms?
We didnt notice any DSC issues/corruptions with ADL based systems.

The actual change makes sense, just want to confirm if this applies to
all platforms or any particular?
With that clarification:

Reviewed-by: Manasi Navare <navaremanasi@chromium.org>

Regards
Manasi

On Tue, Mar 26, 2024 at 3:01=E2=80=AFAM Nautiyal, Ankit K
<ankit.k.nautiyal@intel.com> wrote:
>
>
> On 3/21/2024 1:41 AM, Imre Deak wrote:
> > Fix the calculation of the DSC line buffer depth. This is limited both
> > by the source's and sink's maximum line buffer depth, but the former on=
e
> > was not taken into account. On all Intel platform's the source's maximu=
m
> > buffer depth is 13, so the overall limit is simply the minimum of the
> > source/sink's limit, regardless of the DSC version.
> >
> > This leaves the DSI DSC line buffer depth calculation as-is, trusting
> > VBT.
> >
> > On DSC version 1.2 for sinks reporting a maximum line buffer depth of 1=
6
> > the line buffer depth was incorrectly programmed as 0, leading to a
> > corruption in color gradients / lines on the decompressed screen image.
> >
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>
> LGTM.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> > ---
> >   drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++----------
> >   include/drm/display/drm_dsc.h           |  3 ---
> >   2 files changed, 6 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index af7ca00e9bc0a..dbe65651bf277 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -89,6 +89,9 @@
> >   #define DP_DSC_MAX_ENC_THROUGHPUT_0         340000
> >   #define DP_DSC_MAX_ENC_THROUGHPUT_1         400000
> >
> > +/* Max DSC line buffer depth supported by HW. */
> > +#define INTEL_DP_DSC_MAX_LINE_BUF_DEPTH              13
> > +
> >   /* DP DSC FEC Overhead factor in ppm =3D 1/(0.972261) =3D 1.028530 */
> >   #define DP_DSC_FEC_OVERHEAD_FACTOR          1028530
> >
> > @@ -1703,7 +1706,6 @@ static int intel_dp_dsc_compute_params(const stru=
ct intel_connector *connector,
> >   {
> >       struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> >       struct drm_dsc_config *vdsc_cfg =3D &crtc_state->dsc.config;
> > -     u8 line_buf_depth;
> >       int ret;
> >
> >       /*
> > @@ -1732,20 +1734,14 @@ static int intel_dp_dsc_compute_params(const st=
ruct intel_connector *connector,
> >                       connector->dp.dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CA=
P - DP_DSC_SUPPORT] &
> >                       DP_DSC_RGB;
> >
> > -     line_buf_depth =3D drm_dp_dsc_sink_line_buf_depth(connector->dp.d=
sc_dpcd);
> > -     if (!line_buf_depth) {
> > +     vdsc_cfg->line_buf_depth =3D min(INTEL_DP_DSC_MAX_LINE_BUF_DEPTH,
> > +                                    drm_dp_dsc_sink_line_buf_depth(con=
nector->dp.dsc_dpcd));
> > +     if (!vdsc_cfg->line_buf_depth) {
> >               drm_dbg_kms(&i915->drm,
> >                           "DSC Sink Line Buffer Depth invalid\n");
> >               return -EINVAL;
> >       }
> >
> > -     if (vdsc_cfg->dsc_version_minor =3D=3D 2)
> > -             vdsc_cfg->line_buf_depth =3D (line_buf_depth =3D=3D DSC_1=
_2_MAX_LINEBUF_DEPTH_BITS) ?
> > -                     DSC_1_2_MAX_LINEBUF_DEPTH_VAL : line_buf_depth;
> > -     else
> > -             vdsc_cfg->line_buf_depth =3D (line_buf_depth > DSC_1_1_MA=
X_LINEBUF_DEPTH_BITS) ?
> > -                     DSC_1_1_MAX_LINEBUF_DEPTH_BITS : line_buf_depth;
> > -
> >       vdsc_cfg->block_pred_enable =3D
> >               connector->dp.dsc_dpcd[DP_DSC_BLK_PREDICTION_SUPPORT - DP=
_DSC_SUPPORT] &
> >               DP_DSC_BLK_PREDICTION_IS_SUPPORTED;
> > diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_ds=
c.h
> > index bc90273d06a62..bbbe7438473d3 100644
> > --- a/include/drm/display/drm_dsc.h
> > +++ b/include/drm/display/drm_dsc.h
> > @@ -40,9 +40,6 @@
> >   #define DSC_PPS_RC_RANGE_MINQP_SHIFT                11
> >   #define DSC_PPS_RC_RANGE_MAXQP_SHIFT                6
> >   #define DSC_PPS_NATIVE_420_SHIFT            1
> > -#define DSC_1_2_MAX_LINEBUF_DEPTH_BITS               16
> > -#define DSC_1_2_MAX_LINEBUF_DEPTH_VAL                0
> > -#define DSC_1_1_MAX_LINEBUF_DEPTH_BITS               13
> >
> >   /**
> >    * struct drm_dsc_rc_range_parameters - DSC Rate Control range parame=
ters
