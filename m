Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269AA8AE20
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 04:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D8010E81A;
	Wed, 16 Apr 2025 02:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TvYUmw2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C82F10E81A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:23:21 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54b09cb06b0so6497657e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 19:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744770199; x=1745374999; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GAEhRfVvLPYYLIjgYZghgicd/uu3Yu/uY25U+BPErNI=;
 b=TvYUmw2L/7aXk+WjYcoONYzC4iAcF3JV/6AJQe0TaIWYxo8bt4IzKTHfEP8V07HMVK
 rrYnfiBqEKaZQWcPrzaS6pupX80KanSdkC9vr2iS+FdQdQhtL1AcqzSFixkmnDFbj3ig
 2Egk5GsrJf7CzxmqUeCJP+hnQ0J0rJq1kypUAmP4tzPIblO36sdZiZz0Us9NuB+sTd8y
 eka9Qqg088uXKwVShlVXps+Sa6ZhI1jtVRo/PlOjoNSXBuWZmiOUTfm4d6kN+9RVifeV
 Oy9hbq4rju6+LPSEdkhYz+LZvPvKb6/iNAUowoJYVJ2GEFxGx2OFMgX33N59vu70Ml76
 d5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744770199; x=1745374999;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GAEhRfVvLPYYLIjgYZghgicd/uu3Yu/uY25U+BPErNI=;
 b=AUgGxSiPPOUHQqJMJGiTZycRWJOFRkhCgJMBcBBrVGnZZpdJsuvVlrwOnvGskCWvpv
 Oj7G61lSR9Ms+HfB5RYoyaUFQr2WazXLNQMAwSW1SpQiucQHY5LCG2iwD57Iclno1Evw
 qZeGgABG7ITBiPSA26PSTm+KmBk2PB4OgqY5GdUJG5kuldopMlIhAaVUQqRje5tAZDxP
 nHu2LqEN2GQXC9Jki2eIhgyKcwsHQ3JVW7fzgon1RTpPbPvq3BhuKi9KDAWSrTuUVlXv
 Y6fHrFwXtdFrYuUH+Na6dPWH0wb26B2OQeKIGkz9KR/Af3hZcQJzL09LGmXYy3o55Fqz
 gaxQ==
X-Gm-Message-State: AOJu0YyJzMw0NOfCMIhwddHmUA8UYOjVrxb4RfWexrPFaUJX6mgN4WCn
 AO5Zv69Z6EV40W4kJ13jIlWTDnRovRQ/ORbtsuMe/MkqLTNpT572nHg5v2sRoAmz+x6chKaw8V1
 rxv+I2qO4TNl+9bUc4IwuVr9knSI=
X-Gm-Gg: ASbGnctmBCBob6G0CjVqbTikfUbXHOpZzXx5QQskyOKOK0tCWSQINKM5QmJbOKGsW6T
 oxcV62kioiMvHaKztQNaqjYztF4NakLund4hkVLWpaj+mOYWYJRO917TnOqN2prWjoOV7dAfiQY
 c7S7IbbdhRBVhWtyPUI92r1ygaG0MLOaQ8gtgryM4qDt/7CRyVFDe15w==
X-Google-Smtp-Source: AGHT+IGgLadvL8xpB1FE8kjofZeFmjsRRn/Nw1LTfEzbL2CFAY2973Ukkb5NiuVQCMFF04V3pG/H+Y53dNN4+Hal7u0=
X-Received: by 2002:a05:6512:33c9:b0:545:5d:a5cd with SMTP id
 2adb3069b0e04-54d64a7b6a8mr6538e87.6.1744770199119; Tue, 15 Apr 2025 19:23:19
 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 15 Apr 2025 23:23:07 -0300
X-Gm-Features: ATxdqUFel1EqgEh8tqbx0WySToQIZtSioyPQVmLRr2Yq00j1zy5yB2hEJ04bmJc
Message-ID: <CAOMZO5Dw9O_8E72ZsQhm7j+PX9XQfj9_w-WrkzaxczyyCGndVA@mail.gmail.com>
Subject: Reggression caused by "drm/fb-helper: Don't use the preferred depth
 for the BPP default"
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

I have a custom board populated with a cfaf240320x panel connected via
SPI and driven by the drivers/gpu/drm/tiny/panel-mipi-dbi.c driver.

It works well on kernel 6.1.

After upgrading the kernel to 6.12 (also tested Linux-next), the panel
no longer works correctly: the colors are wrong, and the image appears
twice, one in each half of the screen.

Running git bisect pointed to the following bad commit:

559358282e5b43b1b01e7f6afac6e0beb33cb4a2 is the first bad commit
commit 559358282e5b43b1b01e7f6afac6e0beb33cb4a2
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Nov 23 12:53:48 2022 +0100

    drm/fb-helper: Don't use the preferred depth for the BPP default

    If no preferred value for bits-per-pixel has been given, fall back
    to 32. Never use the preferred depth. The color depth is the number
    of color/alpha bits per pixel, while bpp is the overall number of
    bits in most cases.

    Most noteworthy, XRGB8888 has a depth of 24 and a bpp value of 32.
    Using depth for bpp would make the value 24 as well and format
    selection in fbdev helpers fails. Unfortunately XRGB8888 is the most
    common format and the old heuristic therefore fails for most of
    the drivers (unless they implement the 24-bit RGB888 format).

    Picking a bpp of 32 will later on result in a default depth of 24
    and the format XRGB8888. As XRGB8888 is the default format for most
    of the current and legacy graphics stack, all drivers must support
    it. So it is the safe choice.

    v2:
            * fix commit-message typo (Javier)

    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
    Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Link: https://patchwork.freedesktop.org/patch/msgid/20221123115348.2521-8-tzimmermann@suse.de

Then I did a quick hack like this:

--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -425,7 +425,7 @@ void drm_fb_helper_prepare(struct drm_device *dev,
struct drm_fb_helper *helper,
         *       format.
         */
        if (!preferred_bpp)
-               preferred_bpp = 32;
+               preferred_bpp = 16;

        INIT_LIST_HEAD(&helper->kernel_fb_list);
        spin_lock_init(&helper->damage_lock);

and the display correctly again.

What is the proper fix for this issue?

Thanks,

Fabio Estevam
