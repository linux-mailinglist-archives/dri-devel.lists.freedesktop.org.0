Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C402A64728
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C985B10E3D7;
	Mon, 17 Mar 2025 09:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="KNfQC63V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D2F10E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:24:32 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id AE7892E073D6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 11:24:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1742203471;
 bh=bpaJAokI/NQ/T1FCGS5iJELae0H5brpgDUQIsXXbr10=;
 h=Received:From:Subject:To;
 b=KNfQC63VoP9nOeB0nxYGRUaDm3A1LnL73JXsXXousVbVQl7fYof0zZGCziV6M8SYQ
 860MJ5QrHKiRqhXGwmWuluG5T1MfT9UaOG0Q19IKHojq3eEFgXiZQmmpWiXzkxA3p6
 VUvkcNaWjRy7+EOkMTK3jVXE2GphOTC0Km1zPmag=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30bef9b04adso45704161fa.1
 for <dri-devel@lists.freedesktop.org>;
 Mon, 17 Mar 2025 02:24:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVw9LRcKK41aKKRWUoqNitlTSZ27A4vj7xFLxyMqczaLKgMF2V2cEw4c9TIs13bsH++/7AA5sCh+M4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPlqizJYVXPWKSdHYooDlAPp6zMKq/PjEENWNI3ai1Gvx78btv
 zFxchCP3jD95QTJom1iJ2EjeR7fhCwtNFKbnnpxiHpNalDgFsQNDRi1lffiE8Qk8TUnUXLRW1LB
 ooAzpOOTB1KrKUIQsx9kJjrK6kXM=
X-Google-Smtp-Source: AGHT+IG393WDcLxj+nSCn5lGo0OfnHjTTcYTFzDoGSO/uYVmGzb6auCXghb6wLrVDzKXWRc1QRDf0xlBxHPaJlSuMtE=
X-Received: by 2002:a2e:9842:0:b0:30b:c6fe:4500 with SMTP id
 38308e7fff4ca-30c4a863bb0mr55001111fa.10.1742203470092; Mon, 17 Mar 2025
 02:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-6-lkml@antheas.dev>
 <65813e62-aa0f-4167-83c1-49200fc4ca20@redhat.com>
 <CAGwozwE9=Vh6M5CVAkTCDj5x8twtm3n_28DH1DFbbBKekhn9hw@mail.gmail.com>
In-Reply-To: <CAGwozwE9=Vh6M5CVAkTCDj5x8twtm3n_28DH1DFbbBKekhn9hw@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 17 Mar 2025 10:24:18 +0100
X-Gmail-Original-Message-ID: <CAGwozwH_htUrKukTQ1QDa+qHJjKnU-A2QCzFharVGiiTC-vCRw@mail.gmail.com>
X-Gm-Features: AQ5f1JpyVorMHWlhiauUBhSWuscYucyza1t1M5lYYzEnht5BWKBWX2AD_k03mpY
Message-ID: <CAGwozwH_htUrKukTQ1QDa+qHJjKnU-A2QCzFharVGiiTC-vCRw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm: panel-orientation-quirks: Add Zotac Gaming Zone
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
X-PPP-Message-ID: <174220347114.27629.16855194469106065228@linux1587.grserver.gr>
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

On Mon, 17 Mar 2025 at 10:23, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Mon, 17 Mar 2025 at 10:20, Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> > > The Zotac Gaming Zone handheld features a 1080p portrait OLED screen.
> > > Add the rotation to the panel orientation quirks.
> > >
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > > index f08cdc81dd9a..bbbe707f541d 100644
> > > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > > @@ -479,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
> > >                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
> > >               },
> > >               .driver_data = (void *)&lcd1080x1920_leftside_up,
> > > +     }, {    /* Zotac Gaming Zone (OLED) */
> > > +             .matches = {
> > > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
> > > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ZOTAC GAMING ZONE"),
> > > +             },
> > > +             .driver_data = (void *)&lcd1080x1920_leftside_up,
> > >       }, {    /* OrangePi Neo */
> >
> > The entries in this list are alphabetically sorted. Please post
> > a v2 (of just this patch) with this entry moved to the end, just
> > above the special "One Mix 2S" entry which is at the very end
> > because its DMI matches are all "Default string".
> >
> > Note another entry for another Zotac device, with a board name of
> > "G0A1W" has been added in drm-misc/next, so please base your v2
> > on top of drm-misc/next.
> >
> > Also the freedesktop.org infra is currently being migrated to
> > another data center, so the drm-misc tree currently is not
> > available I think.
> >
> > Regards,
> >
> > Hans
> >
> >
> >
> >
> > >               .matches = {
> > >                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
> >
>
> Ok thanks. I will do that in a few days. Patches 1-4 hopefully should
> be good to merge.
>
> Antheas

Actually nevermind, this is the Zotac Zone so it is a dupe. It is fine
to drop this patch from the series and merge the rest.

Antheas
