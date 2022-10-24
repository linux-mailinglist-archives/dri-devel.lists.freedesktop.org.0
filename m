Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8A160C446
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ECA10E14A;
	Tue, 25 Oct 2022 06:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A873A10E399
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:36:06 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id c24so8188112pls.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jd6ACh5yshC3v+wpibDWDf3qgLlWAznCMtTQxn1zcTM=;
 b=BWB1bsRo1D1/5aG2HUlQshwnot5GiQEKVcgQhO+OxWk4Yv6RJGjGc0+BnbVcAU1ilB
 NhLxiTmmJgpEWvIeGzC5nj6mZ2YWuafNwN+o0OYaPM29MksvUZTfQAH1/K+UrZCFM6bR
 i7w9/In5jUCFaBvu+D1VTFv7mFYSrjvbVqaokCOIPR/VUAMFVxjnDdpJCpz7bMR/BSkg
 Jq+u8O9YrnPI/nP0nolD9ycK218e8OEhDyBgyhXa6WYV51n2uaBY0GhjjlonI341V0zm
 ZR6a6kMTVC2I54CmN/XhCqU+xMvNbG8LWMhVeF721NMtiIvmVm8HCmwl7f0mofuKqBvv
 T6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jd6ACh5yshC3v+wpibDWDf3qgLlWAznCMtTQxn1zcTM=;
 b=Hi505wwWKbXHGGV56hNQTiHKUnNgmAzi1MvdYs1fd15QZ+vDcgYKzG5wtZESnV3B6U
 jIK8pDnnUdE3ZoVAcYMDM/m0pYn6d6w9RmUBQfOBNU0kUXiXQ5P46Wfr2AwXYcWC6UNe
 RQLKW8hTvqtTBSvU2j3Sbt1B+//er003kscJrP0zm/F8hFvptLeJffr6WTqnEA6W86ad
 NRFiaStqaWkvELyvLp9Mobg6pa61wmE/V7BnSiXgw5iZPJBGIdMe7n3sqIHJl36thBGN
 cz6v6GrbrxTg7knQOn04UV/Dbr7gaVG4oSEoYdqRdl81BGR8NebW0MjVbyvxbh6turGc
 6J5g==
X-Gm-Message-State: ACrzQf0xgKeUle2zdGwCBcYSBGpNHj0Vz339NzXD/urfoRoIbgTvQVg8
 M57LJWSf9+mk1epj4V99vsQZX9c7kHIjhhcl
X-Google-Smtp-Source: AMsMyM73/rjifhWGMHa1zueK60XfZjEW5Vq3d/GPCr3Dh4GubkmNIV3imNkhOdeBYtsFWNdeZJSquQ==
X-Received: by 2002:a17:902:da90:b0:185:5537:f388 with SMTP id
 j16-20020a170902da9000b001855537f388mr34408779plx.113.1666611366225; 
 Mon, 24 Oct 2022 04:36:06 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 04:36:05 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Subject: [PATCH 03/22] LoongArch: Use acpi_video_get_backlight_types()
Date: Mon, 24 Oct 2022 20:34:54 +0900
Message-Id: <20221024113513.5205-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:02 +0000
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 platform-driver-x86@vger.kernel.org, devel@acpica.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

acpi_video_get_backlight_type() is now deprecated.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/platform/loongarch/loongson-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index f0166ad5d2c2..3b54b4cefedb 100644
--- a/drivers/platform/loongarch/loongson-laptop.c
+++ b/drivers/platform/loongarch/loongson-laptop.c
@@ -454,9 +454,9 @@ static int __init event_init(struct generic_sub_driver *sub_driver)
 
 	/*
 	 * This hotkey driver handle backlight event when
-	 * acpi_video_get_backlight_type() gets acpi_backlight_vendor
+	 * acpi_video_get_backlight_types() gets ACPI_BACKLIGHT_VENDOR
 	 */
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor)
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		hotkey_backlight_set(true);
 	else
 		hotkey_backlight_set(false);
-- 
2.37.3

