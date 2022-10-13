Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D01065FE461
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 23:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81F510E3BE;
	Thu, 13 Oct 2022 21:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1922610E3BE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 21:49:17 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id h12so3228591pjk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 14:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=r9cxOWkaLwUeQEmdWZ6Osr4NdnwOIIR/+4k5UxCClaI=;
 b=mUNW9Hfwh4r9woIBVDSSKaH3GH7eLruLt0mUoX+0umhaCeMBEchty3s5SRxRhZ0Jxo
 2SEE3FdEVA/70VHeJjpWvo5wjQU22J2kTkN03OqqcQDOE1to1VOv5TirFffyuMQCfK+U
 +RZcMNJbwmMzmYlEXJ6VdIfdmnaKFMiai7MBikl8BiqGTQUUX1wFoO9dmwH1RwZI/nL9
 bpBeNo7D2z1tEr8bA6OQnwho5PaLrOabqyP+zK9/kf3lXHO4Gx7kLBX6dBjUlNxRfkZQ
 41YOfqL4H6IIYqZkugr8FncEta/fPAsCwsy89/iAJQNdtZNKMmqiOehDf8jip+bKKwVq
 Bk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r9cxOWkaLwUeQEmdWZ6Osr4NdnwOIIR/+4k5UxCClaI=;
 b=XZ+5fDV4WZPoudaVBnRyv1vjQAIU5K6zxgL1et3uoVEt7vXDlQaRec4JIJvxudLoI0
 qcqTd1P/yAG/LERg2KMiGiZb6zmU6GrjJtbkLmk8hHzYEQeMtV0ZDR5fubzBP7RMvNfb
 jDgM9FYGBxud+ebpNxE2VWK2LyIdOe3subzmWf8Z2YLtheZG7mGtFa39eX9e9cih3WG5
 oaBVRJs0Dr2JnSYMeEyPVFaFSuApHOqjB5wznxeofpUXvY3WzQ4nRMHpbaiMoM22cg9h
 XyBZw9lIvQs6CoORJrMPmx3PsSJDh0F9NRkEFLpUZli4muvWUIC4YvOUbJPzeRa39zTG
 YtOg==
X-Gm-Message-State: ACrzQf0Werrw8MXOIlVdDJCNotO4q5Lc1msMipgaOklv3MKm+Pa2NHP0
 ZLJ7Qos2Lnmj1GvZae2517uaMQ==
X-Google-Smtp-Source: AMsMyM49Xf5GbaXV9Mm4DB30QskT8F4+V++emnoaOgpXk9wy9meoGe0wpSTQ4m0Q5+hM7WJJGk5+4g==
X-Received: by 2002:a17:902:724b:b0:183:16f:fae4 with SMTP id
 c11-20020a170902724b00b00183016ffae4mr2043797pll.88.1665697756603; 
 Thu, 13 Oct 2022 14:49:16 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 a24-20020aa795b8000000b005627b3788b8sm153264pfk.181.2022.10.13.14.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:49:16 -0700 (PDT)
Subject: [PATCH] MAINTAINERS: git://github -> https://github.com for patjak
Date: Thu, 13 Oct 2022 14:46:39 -0700
Message-Id: <20221013214639.31034-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@rivosinc.com>
To: patrik.r.jakobsson@gmail.com, dri-devel@lists.freedesktop.org
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
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Github deprecated the git:// links about a year ago, so let's move to
the https:// URLs instead.

Reported-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://github.blog/2021-09-01-improving-git-protocol-security-github/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I've split these up by github username so folks can take them
independently, as some of these repos have been renamed at github and
thus need more than just a sed to fix them.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8da92ff58b9d..22a9acc7be07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6865,7 +6865,7 @@ DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://github.com/patjak/drm-gma500
+T:	git https://github.com/patjak/drm-gma500
 F:	drivers/gpu/drm/gma500/
 
 DRM DRIVERS FOR HISILICON
-- 
2.38.0

