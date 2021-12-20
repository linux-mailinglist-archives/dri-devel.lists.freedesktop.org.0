Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6047BC90
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 10:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF4B10E3FB;
	Tue, 21 Dec 2021 09:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A434E113250
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 22:00:51 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p14so2676078plf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 14:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YFHQWppCbOEAFqrREcsgFmxNS+L3tGaGeD2fMDLbOQs=;
 b=Ooq5mtLbhHBGvrLO9N3S8DKVBu4TyC/0xH2U+HDtDjdxlgSelm9jw/ydcATf3RXlQP
 CfsR7D5NHa6uRY7xW7BpPUI5+zMENwBv4cgOFAMdIf1GgaAN7R0B6F89lLkLve554xs1
 /RGW6xm5kAzxntrHEmCa3m3PmpcjBik7p894+XCyH0RcbPLofRl/HBrhF1DvycTgntCw
 OLjmviW7arzpICMT8NIxpXdjfVLdzOzWWwLl0qljCVOXkYGBWsXVbjp5BII36UcnoCWf
 36mvnuSFus05DnP/5p1eze1ViCYgAdTZIJVXAHT7PSkcjGRMWWF4yRUdnwoZvZRhCCdJ
 OZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YFHQWppCbOEAFqrREcsgFmxNS+L3tGaGeD2fMDLbOQs=;
 b=6yiuXPFbSGD9u4IQyPXxbI9bVpoOHjjDChUzzLr5yhhXTH5ewXtiCJE/Nt/dvH8xie
 0qWVT8CCNTYXQ6ECx3wPndPPRFfjr+O2PpzXl94tOyRJQ6nWcFAvqCt0fXi9FIck2gq/
 uMnnaQYL/ov2KvqprCnWGpVQkwu2ChMq8F2Dw+Qq2iDyPx5IzQaEmxhqOTxn6Qbqb+XZ
 lAQ+HHBu2tfBwW2G4pSq4LxM7EiXk/f7isifG3HyYmXXhJotOvoknXAGIdNF9nX2jrlC
 70VDAEKvIZ67jMWmFqAW3K23BUzw/qTceLzxOHflA3q8CUIMejmJZVhgu6tSV45A59lB
 lQNQ==
X-Gm-Message-State: AOAM533PyN8FxxIkFItybY/CiKO3K5eZ9Y+2b+lKL5/4dndtcqhhAduy
 XPU9s0zs/LHVmGkkBtOEQmA=
X-Google-Smtp-Source: ABdhPJzfKbh00OOS2Ax3BYY7qkAjc5pZuaFM4J70J2a7kJRPCEM8RhMHTBoI3ntM0Oh5V8ddiStFyw==
X-Received: by 2002:a17:902:a601:b0:148:adf2:9725 with SMTP id
 u1-20020a170902a60100b00148adf29725mr142062plq.136.1640037651105; 
 Mon, 20 Dec 2021 14:00:51 -0800 (PST)
Received: from google.com ([2620:15c:202:201:9632:a1c4:968a:6f66])
 by smtp.gmail.com with ESMTPSA id d1sm16593583pfj.90.2021.12.20.14.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 14:00:49 -0800 (PST)
Date: Mon, 20 Dec 2021 14:00:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v2 2/2] drm/privacy_screen_x86: Add entry for ChromeOS
 privacy-screen
Message-ID: <YcD9DkYLrdexyP0p@google.com>
References: <20211217202850.1967594-1-rajatja@google.com>
 <20211217202850.1967594-2-rajatja@google.com>
 <YcDegV8wqljpU3J0@google.com>
 <CACK8Z6FyvpjhHqh3PRfRFYAhVaxgkxBT_1SnYH0PkvNv5qwOvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACK8Z6FyvpjhHqh3PRfRFYAhVaxgkxBT_1SnYH0PkvNv5qwOvw@mail.gmail.com>
X-Mailman-Approved-At: Tue, 21 Dec 2021 09:09:51 +0000
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
Cc: gwendal@google.com, Thomas Zimmermann <tzimmermann@suse.de>,
 seanpaul@google.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 rajatxjain@gmail.com, dri-devel@lists.freedesktop.org, marcheau@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 12:29:18PM -0800, Rajat Jain wrote:
> Hello,
> 
> On Mon, Dec 20, 2021 at 11:50 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Fri, Dec 17, 2021 at 12:28:50PM -0800, Rajat Jain wrote:
> > > Add a static entry in the x86 table, to detect and wait for
> > > privacy-screen on some ChromeOS platforms.
> > >
> > > Please note that this means that if CONFIG_CHROMEOS_PRIVACY_SCREEN is
> > > enabled, and if "GOOG0010" device is found in ACPI, then the i915 probe
> > > shall return EPROBE_DEFER until a platform driver actually registers the
> > > privacy-screen: https://hansdegoede.livejournal.com/25948.html
> > >
> > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > ---
> > > v2: * Use #if instead of #elif
> > >     * Reorder the patches in the series.
> > >     * Rebased on drm-tip
> > >
> > >  drivers/gpu/drm/drm_privacy_screen_x86.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
> > > index a2cafb294ca6..0c5699ad70a3 100644
> > > --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> > > +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> > > @@ -47,6 +47,18 @@ static bool __init detect_thinkpad_privacy_screen(void)
> > >  }
> > >  #endif
> > >
> > > +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
> > > +static bool __init detect_chromeos_privacy_screen(void)
> >
> > Does marking this __init work in case there is a deferral?
> 
> Yes, I have verified that for Chromeos case, it is a deferral.
> 
> > Can it happen
> > that privacy screen is a module and so will get loaded only after we
> > discarded __init sections.
> 
> Perhaps. But I do not think that  is a problem. All the functions and
> data in this file are in __init sections, and this entry is here to
> ensure that the drm probe will wait for the privacy screen driver
> (whenever it is loaded).

Ah, OK, we are not leaking detect() pointers outside this module. 

> That is the reason, ideally we  would want to
> somehow restrict the privacy screen to be built into the kernel so as
> to minimize the delay if any.

I understand, but we can not code to the config we expect to use on
Chrome OS, we need to make sure we cover all possibilities.

Thanks.
-- 
Dmitry
