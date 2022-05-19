Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B052DA4A
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 18:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5DF10F1CF;
	Thu, 19 May 2022 16:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E6F10EB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 16:29:55 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id q8so7037016oif.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BWDg9SYEC+Mkg9KQnlntZ124XiWBKPicMuFquWJ2wyc=;
 b=TnW9KOItijvRkPW8zIQNgsLbUoppuc5z0udA2UQl1e4Of5rBSUBLWK9r8if4LgCM/G
 uH1mfldzCezGhWfjyZxiyJxOo2/t8hL5RwJfkZTJ+EsspUYhPa/WmcbALC7x32D1VEsY
 zEUXvvbBE9DGgBTCsifdHCY4ZSFSVLZbVrb7zy/MABAaD53d9eoWzws21MvKmYD7BAs/
 NV/VLEduZuP7yL6Q/cBYquie1/iDy3NoqDnBs3NiFx51qjYwasz2Rk5rp3FeX7bk3bt4
 RKuT7+iIIeoLKhZrWI9xHbDnmXTy2VKOV0HRYrKmKlBTygcDTYqBz1lUcosY9VF63Syh
 kqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BWDg9SYEC+Mkg9KQnlntZ124XiWBKPicMuFquWJ2wyc=;
 b=E0zgvsAEEtD3nWFmffXvUOHPKKS4/53nGe0fkBDclpTwGDR0ladinVh7+r2SVr2rlO
 7/j3uH24eGzBQiBQNiwWY/t3K09qRWfS1Ecw8HJPfeCSzzboKPAHELNi3T7EHMPkWNSp
 f2+72zwIYHCiH61ZdzRQZNxNcu7wwlFXgwQffjds8+9gt1dsjaKpXK/YoDfNSjgMKL3w
 4joBImE+PUYG2sPuLQFjlKO8zKuY8UNB5n+0rNeQb/XvHwPVC9HLWAFf7fypw0218K/x
 Ys5yske+z+/nlrc6lJzflRNfoJgm4AGICUT26VIRsuvKl/+A8ZlyaNkGi8LtUga1DPSh
 ryoQ==
X-Gm-Message-State: AOAM531yKhNXh0oFXECQseMi4xyG0S7cVCr7BUydfmU7FLnsb2VIZdct
 0yag31clCsWaqUyVIy5c8tmZMObyJ0l/tw==
X-Google-Smtp-Source: ABdhPJyGJUhU0e2OH+bkv9xAh0j0WZ/OUKDCSttYlF+cQ98VH3au6L7Ttsra47TeN1Zq/IJqqyLwag==
X-Received: by 2002:a05:6808:e89:b0:2f7:34db:6915 with SMTP id
 k9-20020a0568080e8900b002f734db6915mr3052967oil.284.1652977793212; 
 Thu, 19 May 2022 09:29:53 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:29:52 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND 3/6 v2] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date: Thu, 19 May 2022 11:29:32 -0500
Message-Id: <20220519162935.1585-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 emma@anholt.net, airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the MEDIA_BUS_FMT_RGB565_1X24_CPADHI format used by the Geekworm
MZP280 panel for the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/uapi/linux/media-bus-format.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11ee2..a7b765498 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,13 +34,14 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101e */
+/* RGB - next is	0x101f */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
 #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x101e
 #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
-- 
2.25.1

