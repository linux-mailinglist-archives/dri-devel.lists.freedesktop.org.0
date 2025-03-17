Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C83A64718
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C15D10E25E;
	Mon, 17 Mar 2025 09:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="DYq68q0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F49810E25E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:23:21 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id F29FD2E02BFB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 11:23:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1742203399;
 bh=bMWZV6Y+CvWUJMijtT6uLEoH46eXhT+qDmoUd1vNxBw=;
 h=Received:From:Subject:To;
 b=DYq68q0tx8z2lJ5DhJQ3+CdkVNWOH+DCzZcSLsCLd2MNb1tqiF3vYPvnXsDdK96Qk
 UfVSZ9pj3b9cr94dist4RsNUvZOFggYEr3IiphtfydU4j/JURZIa4VHeg9M+VntAo5
 d0CYoEahz0drxmbcwRq3o10a5BfbBNmKYDm2/8cM=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30beedb99c9so38426061fa.3
 for <dri-devel@lists.freedesktop.org>;
 Mon, 17 Mar 2025 02:23:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUk5TG0J4u0vVCGXSBXfAIZs8yZtLHMSl4dwXXVlyaT8oixrb84hQ/L67/PG67qcLsZwAQcHrc7GOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRKV+MeD2dwXcQxE53BxJm3vyvKCMLZ/AqzWk/eb0MHd2u6kOE
 nsK/jAA9Wn4KxTE2/VuH3K3Fja2d2zf8Bg/7Wdk7YLQQXB1XrS6kroOgNpdRspJowZVeOL0fmOf
 CGQqk1G9kGWbnNBot+ikPZzlxjDo=
X-Google-Smtp-Source: AGHT+IGnX0Dxok6dcb+rjWQwufCJAoqGhc6ZRb6GFGcDlijV4M5H5bpenR0zhTIAvk4LfpODCGWQbJmvgBgIb4j1so0=
X-Received: by 2002:a2e:bc09:0:b0:30b:b78e:c473 with SMTP id
 38308e7fff4ca-30c4a754732mr55899831fa.7.1742203398342; Mon, 17 Mar 2025
 02:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-6-lkml@antheas.dev>
 <65813e62-aa0f-4167-83c1-49200fc4ca20@redhat.com>
In-Reply-To: <65813e62-aa0f-4167-83c1-49200fc4ca20@redhat.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 17 Mar 2025 10:23:06 +0100
X-Gmail-Original-Message-ID: <CAGwozwE9=Vh6M5CVAkTCDj5x8twtm3n_28DH1DFbbBKekhn9hw@mail.gmail.com>
X-Gm-Features: AQ5f1JrQiT3dbA-hsykAHt-BAHevZp__oLHonDIs7jMsVuuegGkdIf4udvIsUfo
Message-ID: <CAGwozwE9=Vh6M5CVAkTCDj5x8twtm3n_28DH1DFbbBKekhn9hw@mail.gmail.com>
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
X-PPP-Message-ID: <174220339985.22449.4000143322113105195@linux1587.grserver.gr>
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

On Mon, 17 Mar 2025 at 10:20, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> > The Zotac Gaming Zone handheld features a 1080p portrait OLED screen.
> > Add the rotation to the panel orientation quirks.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > index f08cdc81dd9a..bbbe707f541d 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -479,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
> >                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
> >               },
> >               .driver_data = (void *)&lcd1080x1920_leftside_up,
> > +     }, {    /* Zotac Gaming Zone (OLED) */
> > +             .matches = {
> > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
> > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ZOTAC GAMING ZONE"),
> > +             },
> > +             .driver_data = (void *)&lcd1080x1920_leftside_up,
> >       }, {    /* OrangePi Neo */
>
> The entries in this list are alphabetically sorted. Please post
> a v2 (of just this patch) with this entry moved to the end, just
> above the special "One Mix 2S" entry which is at the very end
> because its DMI matches are all "Default string".
>
> Note another entry for another Zotac device, with a board name of
> "G0A1W" has been added in drm-misc/next, so please base your v2
> on top of drm-misc/next.
>
> Also the freedesktop.org infra is currently being migrated to
> another data center, so the drm-misc tree currently is not
> available I think.
>
> Regards,
>
> Hans
>
>
>
>
> >               .matches = {
> >                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
>

Ok thanks. I will do that in a few days. Patches 1-4 hopefully should
be good to merge.

Antheas
