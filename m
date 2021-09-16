Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61AC40E1BC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 19:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320A66EBA7;
	Thu, 16 Sep 2021 17:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACC76EBA7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 17:05:05 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0690B4026A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631811904;
 bh=OstzCEYmtVLZNRdG6WO7Mm1Vo0KZNtl5VBM7iApmnEE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=rra7U5efaiOXE+xiznz8KE/3OV7kc0Y+OsQ6cZCC20dvoFlx72aRJ2j6kAoy5jhM5
 GZStM7UxC04qjfxQbHXEYsf7rouSH6OvmkCrIeGWCn/VpSh0YguptRzIR59T+t4OWy
 zieQ5huQfbD72q5iKrDdy5hAR16yAy0h4OppmZ66s21BlcxQ0zmUBV21comac2TxMs
 xsKZ2V8sth6BPRgo61tGPwBfBDfDsOx0lwk9Ksg47/IDgtoClpHiuLmsyVAqfoagPD
 EIDWFdEQEZakMHuaaY4KT08MwIVHQa+HDEPtp4Cf47qpyMIPPVjvk71VTHPcmcLfOZ
 SuwivjzT5apcw==
Received: by mail-wm1-f69.google.com with SMTP id
 17-20020a05600c029100b00305eac9f29aso1388003wmk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 10:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OstzCEYmtVLZNRdG6WO7Mm1Vo0KZNtl5VBM7iApmnEE=;
 b=Zj1i+nxS5/GKFkdLn3ja2WilPLqAtOBbcq58rYiti23nqR3NQ22VTsks69OvibnMWr
 C/hyDQKtsdXEs8xdEpleNlQXlHdMQaf8GFId5N9uB4YKZANGq7bAIFSPKma/e5en0x2a
 EsFKzr61PaYtYAmtf0Q1Y5xdd8C++iPx+rBRSnV4wa5uyOoo5upXdEAskosLb/JoWmvw
 vfxxC99lSvWWiEGogNCdp7gqfmQB6STeMF00rU7r2LGN6MueDhOCTUzZl+U1mHEifbRu
 QI9nQXou8rbwqHLgtuodZ836a+vlmPiwi9C5F+HR31pvLQ9ZrlO+BH1V4OdOyrdUlmDE
 2p8g==
X-Gm-Message-State: AOAM532GbbUiojxz/TyvSN5GQw55dsq2i0Gf1l6wfbVyorxzCBGC6+gl
 SimUi046sR2JaH+TsctORa9LplEU2VeIF/XYFpmGJxCSTKcuqY1MHbhC5oF4EDw3dH7P4ZBeq3b
 KA7KPJa9uZuDMyOOYOwTnSs1NThV1OO7A5jAV2Orli40a4Q==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr7347748wrm.313.1631811903561; 
 Thu, 16 Sep 2021 10:05:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4kl/6AH0mpphfd4mDrnsfnhni4/TUU7nT32lFb3Prdb2KZaNGd9Q9JLbukKSrmVp+BXBQqQ==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr7347728wrm.313.1631811903378; 
 Thu, 16 Sep 2021 10:05:03 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id h16sm3971694wre.52.2021.09.16.10.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 10:05:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: s3c-fb: drop unneeded MODULE_ALIAS
Date: Thu, 16 Sep 2021 19:04:59 +0200
Message-Id: <20210916170459.137696-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/video/fbdev/s3c-fb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 3b134e1bbc38..1d88dcd3e26b 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -1810,4 +1810,3 @@ module_platform_driver(s3c_fb_driver);
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
 MODULE_DESCRIPTION("Samsung S3C SoC Framebuffer driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:s3c-fb");
-- 
2.30.2

