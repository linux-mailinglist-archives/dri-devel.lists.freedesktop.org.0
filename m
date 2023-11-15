Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A582C7EC793
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CF210E05C;
	Wed, 15 Nov 2023 15:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7783510E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:48:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32df66c691dso4135139f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700063298; x=1700668098;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Atv1fK8QG9IRImkJmICqo13Yh62XKo59L6qcmg7lyPU=;
 b=gDeAIdNW4Wt13yAO/VDb90pFJ7oYT0hf/YCJXdX4ybO+k12l6INXvePw0pZFT+ywG8
 fnypESnZUsdKF66DfCalZnXoj6Y+wUSrPRiUwGittMC8DvZHpqwuBmccR+jzFQX28XCi
 0vqAHJwQO5a1ynKvsulkahnMLZHAwOaKppUXW+W8lYZd2EuEoEyyfYSFCiuNu3mZwfVa
 QJoZds43OU6QLy09LTs0voBvQwdlRNI6BNTpRRpR8bMX0aSoCc0/FQ1Mm1AGgZ9mfgm9
 ZsMmgcwC4LY/rq2oLW2kSiJ9FS8fo1EE0oACG0utyfTK5WzGocj41A8t+kdbIf5nT8X1
 Udbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700063298; x=1700668098;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Atv1fK8QG9IRImkJmICqo13Yh62XKo59L6qcmg7lyPU=;
 b=FtLXYvgVleNV+MhYn00h3hkK/9TTVv89yPO8szXW5wvG/++9QxijHkXO4mBarkYGor
 yNOkRYJgETm9GAZ8PRiIX2uoet1DHPLXl/xAze73DgO3Lkybynd7ePl1viBW86IDZQ0d
 X/vlRBWDoMeEhrG8gBEPWGFA4A2Nh67OcIKUcIA//+//74iQ5mffivSyGlMRIVbwa1nq
 ugHlRtXmr0NIm96G3JnLsDmkGkqqJtbJwNom00C0XWXhLml8++9moQXFjuIaZP8Trlwl
 omcr6YYzfNkRY8N/27X6ChxV6p04gMwEcY/R8wvjL9XF3CH6//tC09WzAuvCvOgIi7Ti
 Ybwg==
X-Gm-Message-State: AOJu0Yzp57FssPBqBNVtNSLKg5N/TjtarijRN+4XOxAO0fHDtwI3m90Z
 kRfqLgBgn3B2W/vbLszAbBhW/PB/9GUDLuz5kjjoxw==
X-Google-Smtp-Source: AGHT+IF5Klg+NpX9Rtaaff2D9OV1AcH1L/8K+XQh4GojJvYYnqeps6SlV4FJJ/bQKvzi3NGeS2TXTG8FuUUibi30yt8=
X-Received: by 2002:a05:6000:1447:b0:331:393d:aea1 with SMTP id
 v7-20020a056000144700b00331393daea1mr10693336wrx.13.1700063297529; Wed, 15
 Nov 2023 07:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20231114233859.274189-1-appsforartists@google.com>
 <70f12e96-0fcc-4954-8507-27cf5e15a3b2@redhat.com>
 <CAAL3-=9YYQBV-T-KhHdYrtGHH1RC29uzTuQ98roAY9GwrNrwmg@mail.gmail.com>
In-Reply-To: <CAAL3-=9YYQBV-T-KhHdYrtGHH1RC29uzTuQ98roAY9GwrNrwmg@mail.gmail.com>
From: Brenton Simpson <appsforartists@google.com>
Date: Wed, 15 Nov 2023 07:48:06 -0800
Message-ID: <CAAL3-=-b3-RZNNfQEYzQxK=SW4PPJ7cmrX8omBniec+tgC2frw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-orientation-quirks: add Lenovo Legion Go
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Patrick Thompson <ptf@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jared Baldridge <jrb@expunge.us>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Allen Ballway <ballway@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resending from the email address linked to my GitHub account.

-- >8 --

The Legion Go has a 2560x1600 portrait screen, with the native "up" facing =
the right controller (90=C2=B0 CW from the rest of the device).

Signed-off-by: Brenton Simpson <appsforartists@google.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/d=
rm/drm_panel_orientation_quirks.c
index d5c1529..3d92f66 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -336,6 +336,12 @@ static const struct dmi_system_id orientation_data[] =
=3D {
 =09=09  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
 =09=09},
 =09=09.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+=09}, {=09/* Lenovo Legion Go 8APU1 */
+=09=09.matches =3D {
+=09=09  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+=09=09  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
+=09=09},
+=09=09.driver_data =3D (void *)&lcd1600x2560_leftside_up,
 =09}, {=09/* Lenovo Yoga Book X90F / X90L */
 =09=09.matches =3D {
 =09=09  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
--=20
2.43.0.rc0.421.g78406f8d94-goog
