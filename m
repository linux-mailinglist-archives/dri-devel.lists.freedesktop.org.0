Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B995EB59D82
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 18:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E744410E101;
	Tue, 16 Sep 2025 16:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e+ihVaCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC7910E101
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 16:25:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45f29e5e89bso35153255e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758039904; x=1758644704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DU6pi+jQiHmP3RrytVdY83shq/RxcYi5dWlcWv2Gn9U=;
 b=e+ihVaCaXwUfMJvHX3OcTD32zGDkL8l7u3dYYwd4r/+W90c7Z15vN6ikroYsxECGwR
 gbyTpgtTKqPJv2Mplbtq48hfMyWzT/+W4IBbhFWzFnUoNxC/jfwdE4/bfjlSuDtVc4j0
 HSIeUbzcuvZ+hF+U8r41o7QV17anon73B3lda8dkJpxxF5I0HqRn0dpRvE4S4G6JqiKg
 huTiGmxL9IxbfxZEuibu8tsIwAYqtSNP+OoBzSjBi4mgBHEZgzToNTHJEq9y0OXtrMO/
 lhU4DTzFPF4xiLIfzw5aPPyN7YqQx0xwYLUUKd4gnc1ul0a013EIoKqW00o+nhqL+PlR
 Z70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758039904; x=1758644704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DU6pi+jQiHmP3RrytVdY83shq/RxcYi5dWlcWv2Gn9U=;
 b=vOTYz1iEptRBnVfXcwCsFC+DdMncZBNvnCBEtQdsLxiLxudVLRmTFCgwrWj+If0Am0
 nUzzazj1SIRqgdqCu8x4bOdKdVHJjODoQfY5wCUUjaS3QPNkyVK5bNJw6LeU+NzHZZqv
 mFz157wbo9CICHOrg/T8Z3JhRS5RrBkMyooS39eaHwgaQ8osuez+LKAQsGa2+5MyhgnR
 sfoqlvzCD7LQ1zTAoFG0DCNGOc3ScUHvoagYabIwqDM0CBKEyo87UCkZPFS4FLCNdZyh
 ZpQ/l4C9K0tzAQN2mzWbLMu4T50XMzSGsRuXF7+cTNOYBku9xIZJAEOgvqi9XwQeHk9j
 bmmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXm0vtEmrDp8qr53l1+q2DaBHebwdiBDRkYmSqRpVD4gEi6rQdzt3Go26ofDZsy1yg5J373DwW/Ec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8Q9iY40+XNkap22cGsMwGg7vrn9blc5yXHgR5+72eP1Sv0Q0/
 zhZx3TZAm+GYU4n05+GKaRXdq077N9Oy/YovuShybNCZ38e8k+4miqmpa0hr1TphYISHijh0bJs
 pIN/iHg7SnzVlQkPEnXtVeRV8hn12cW0=
X-Gm-Gg: ASbGnctfKWB3QYBXVOEuh4iu5wY0Fj9jgSPKvWwxfiXugJBiDdmisW9qRWu+8aj7qtf
 nh0F7pkTA0BHEeAIAk8EZ9yaga1liqW4a8ZA4WoRMqyt3CLqX+d2qxbSNHIAln/KXqu3DRVz6mR
 wUzuMI7PR99Q4AEvROUuAgkZ/f1mip77+nklCARznbyz+wwgt/vgVUWoRfj4B2IZt8tt65ZcSJH
 M14tfs4
X-Google-Smtp-Source: AGHT+IFnC+ZB8Y8EWWSgcq7DryM/idg50aJ/eE+AB8zfjBLAVoKc5lX8wjY+HH9LKTM1j4AoLgwSfNow1JOz5yHjF94=
X-Received: by 2002:a7b:c857:0:b0:45b:7be1:be1f with SMTP id
 5b1f17b1804b1-45f211f300dmr100112085e9.32.1758039903439; Tue, 16 Sep 2025
 09:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-12-clamor95@gmail.com>
 <20250916180418.3fa270a9@booty>
In-Reply-To: <20250916180418.3fa270a9@booty>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 16 Sep 2025 19:24:52 +0300
X-Gm-Features: AS18NWDUsY2rg2kwucuKEpR6QKEKIqi67u-AOuSpm9Dlzkb81_NunB_TLA1wgsc
Message-ID: <CAPVz0n1Nvun5yBf_i3NB=kDmLfNFRjbFt1uTUW-hpLbp-h0g4w@mail.gmail.com>
Subject: Re: [PATCH v2 11/23] staging: media: tegra-video: csi: add a check to
 tegra_channel_get_remote_csi_subdev
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
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

=D0=B2=D1=82, 16 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:04 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Sat,  6 Sep 2025 16:53:32 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > By default tegra_channel_get_remote_csi_subdev returns next device in p=
ipe
> > assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VI=
P
> > or even HOST. Lets check if returned device is actually CSI by comparin=
g
> > subdevice operations.
>
> This is just for extra safety, or is there a real case where the lack
> of this check creates some issues in your use case?
>
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops =
=3D {
> >       .pad    =3D &tegra_csi_pad_ops,
> >  };
> >
> > +struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_v=
i_channel *chan)
> > +{
> > +     struct media_pad *pad;
> > +     struct v4l2_subdev *subdev;
> > +
> > +     pad =3D media_pad_remote_pad_first(&chan->pad);
> > +     if (!pad)
> > +             return NULL;
> > +
> > +     subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> > +     if (!subdev)
> > +             return NULL;
> > +
> > +     return subdev->ops =3D=3D &tegra_csi_ops ? subdev : NULL;
> > +}
>
> I tested your series on a Tegra20 with a parallel camera, so using the
> VIP for parallel input.
>
> The added check on subdev->ops breaks probing the video device:
>
>   tegra-vi 54080000.vi: failed to setup channel controls: -19
>   tegra-vi 54080000.vi: failed to register channel 0 notifier: -19
>
> This is because tegra20_chan_capture_kthread_start() is also calling
> tegra_channel_get_remote_csi_subdev(), but when using VIP subdev->ops
> points to tegra_vip_ops, not tegra_csi_ops.
>

Your assumption is wrong. 'tegra_channel_get_remote_csi_subdev' is
designed to get next device which is expected to be CSI, NOT VIP
(obviously, Tegra210 has no VIP). It seems that VIP implementation did
not take into account that CSI even exists.  -19 errors are due to
tegra_vi_graph_notify_complete not able to get next media device in
the line. Correct approach would be to add similar helper for VIP and
check if next device is VIP. Since I have no devices with VIP support
I could not test this properly. I can add this in next iteration if
you are willing to test.

Best regards,
Svyatoslav R.

> Surely the "csi" infix in the function name here is misleading. At
> quick glance I don't see a good reason for its presence however, as the
> callers are not CSI-specific.
>
> If such quick analysis is correct, instead of this diff we should:
>  * not move the function out of vi.c
>  * rename the function toremove the "_csi" infix
>  * if a check is really needed (see comment above), maybe extend it:
>    return (subdev->ops =3D=3D &tegra_csi_ops ||
>            subdev->ops =3D=3D &tegra_vip_ops) ? subdev : NULL;
>
> Let me know your thoughts.
>
> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
