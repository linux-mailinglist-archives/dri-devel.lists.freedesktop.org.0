Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF61EA646FF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2717110E3D6;
	Mon, 17 Mar 2025 09:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="bMeBRn6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0234310E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:21:38 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id B7AA72E02C03
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 11:21:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1742203287;
 bh=BXcfOF08ViHrsQBfZ+rJ2oo3QoNtkI4oSo8dH1AIiSo=;
 h=Received:From:Subject:To;
 b=bMeBRn6XXsHpGqHt2nIdZoY49nwGkFvQf2HOFCJ78DtIoFUTx3KyuQEP5METugpPG
 3Cla3pIBnjOSAPDtB3U/7E05+BllLIaP5xtuHxs0YBZkF2krGSnNztyCGlOCxx42pu
 1QM1idL3aQ7BaQsLxQVDhv7VxRk+mgOx+hJksVAU=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30bfe0d2b6dso47565811fa.3
 for <dri-devel@lists.freedesktop.org>;
 Mon, 17 Mar 2025 02:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXIihrKebEY+THLQbBOPm5NHvWB/ahVmaDCVp8XIJHbhewuHpST7MnPNBgmyW/hifBJ5xwQVD4eCKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXU6PhkOXZKfIEbeqjSqRu4VoH14M7v1ZeqMfKhY3QjWjajE5U
 xrmQ3+yGtlliy3lahWZKTynRF7D+qkDsFA46CP6si1t8k5gcQwAn2kt027SLvTHFZVOBLHZOgXk
 NPN2us2AevLKoMz85LlV7zLnS+tw=
X-Google-Smtp-Source: AGHT+IGGgDjr9jB21RMJBMF2G0m7hDY1KPdRlnVvBOzz+dWYQDMCT353VmXdXjgLUxLHjyh97KXBeSTx0QeN2PHcvjU=
X-Received: by 2002:a2e:be06:0:b0:30c:1fc4:418e with SMTP id
 38308e7fff4ca-30c4a8d225bmr68178521fa.26.1742203286038; Mon, 17 Mar 2025
 02:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-4-lkml@antheas.dev>
 <bce3cdbf-2056-4735-9c6e-d67e0cd1dcd4@redhat.com>
In-Reply-To: <bce3cdbf-2056-4735-9c6e-d67e0cd1dcd4@redhat.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 17 Mar 2025 10:21:14 +0100
X-Gmail-Original-Message-ID: <CAGwozwGub9FVh0rTnaE3FkuGrc5qRQJQ+_25-Jo61=OtmxXNMA@mail.gmail.com>
X-Gm-Features: AQ5f1JqWmYcGUB_R7mLjJE59S9cK3w1pEurwt-0kdg5gnLR_vSOrWvA3nrJWhvQ
Message-ID: <CAGwozwGub9FVh0rTnaE3FkuGrc5qRQJQ+_25-Jo61=OtmxXNMA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm: panel-orientation-quirks: Add OneXPlayer F1Pro
 quirk
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <174220328708.13334.8620458234996434428@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
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

On Mon, 17 Mar 2025 at 10:15, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> > The OneXPlayer F1Pro has a 144hz 1920x1080 portrait OLED panel.
> > Add a quirk to correct the panel portrait orientation. In addition,
> > it comes with a red limited edition variant in the Chinese market,
> > so add that as well.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> drm-misc maintainers, I'm dealing with a huge backlog of
> patch-review, bugs and other work.
>
> So I would appreciate it if one of you can merge patches 1-3
> into drm-misc.
>
> Regards,
>
> Hans
>
> > ---
> >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > index 1378690b7287..f08cdc81dd9a 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -467,6 +467,18 @@ static const struct dmi_system_id orientation_data[] = {
> >                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 mini"),
> >               },
> >               .driver_data = (void *)&lcd1600x2560_leftside_up,
> > +     }, {    /* OneXPlayer OneXFly F1 Pro (OLED) */
> > +             .matches = {
> > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1Pro"),
> > +             },
> > +             .driver_data = (void *)&lcd1080x1920_leftside_up,
> > +     }, {    /* OneXPlayer OneXFly F1 Pro (OLED) LE Red variant */
> > +             .matches = {
> > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
> > +             },
> > +             .driver_data = (void *)&lcd1080x1920_leftside_up,
> >       }, {    /* OrangePi Neo */
> >               .matches = {
> >                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
>

Hi Hans,
patch 5 is also a panel quirk. Can you review that real quick as well
so it is not dangling?

Thanks,
Antheas
