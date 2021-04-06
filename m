Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506213563DA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 08:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C126E06B;
	Wed,  7 Apr 2021 06:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Tue, 06 Apr 2021 23:41:25 UTC
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EA16E029
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 23:41:25 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4FFP5m4ZlVz9vBth
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 23:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id te5MddeWZ8z4 for <dri-devel@lists.freedesktop.org>;
 Tue,  6 Apr 2021 18:35:24 -0500 (CDT)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4FFP5m2x0sz9vBtf
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 18:35:23 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4FFP5m2x0sz9vBtf
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4FFP5m2x0sz9vBtf
Received: by mail-il1-f198.google.com with SMTP id f14so12654837ilr.21
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Apr 2021 16:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFBsXOVlHHjdSzZeWJyJvvBdMued/K0xOEkGtWU402Q=;
 b=jw0JK6OAT3hKXrthWczTi8kJcQy2JrposNHUiEHoienPromNuX/6FDiFYTdHNKtFwO
 IuZ1sVYvgK7ysivr4tQcIvOpxT7R2k45lK8OCc1Kq8CiYi2aqfag7FK2nQ/TATZkvFuB
 TyRJms8yqv928MC35tBPy00HM3O8AbwScP0OAiPv3R/yaKb9ExXiFxZRlvTb7qEVsNgq
 2vo9FwBN7/Osc73xCQYo+aMRBo5xhEvh/pyaCrGz/Iyslz5Gg+mo4bdedc6aC536kvr6
 XoZ8Wb1OkX+FJVOAWs1phd/Tj0byJiuyLKvd8rdWz1RRJpcMfhM9BZsYZjXbsdD8EPx2
 eHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFBsXOVlHHjdSzZeWJyJvvBdMued/K0xOEkGtWU402Q=;
 b=mdY9bhQJpf/yEaeOtbfBHTcBXcgpZocrySuf68LZ22vCFrgFOMCLau/0oPhA9+JX6W
 e9Epf91UHQj0vgejaAlZh+zgdDDW0r51PQlJsdNe4O37ZfYifGOBoKZjDW83ZzHV97lf
 pxEOPTUkvlqt/+npMACR5Yd5wlErE4Lm8rZrqvgkxHU9uDFBSUfeHzGEldNQqCIQrXwo
 XdFBAiarIRfvrSBQycgste60qZAJassRcdf1M7z1+9iAenJQTqvJ3527NHcXs1f3SHpz
 3PnjcaQgNNG8H3xnmwrVPLQrQvpcr//p4vcOH3sawwn5ViWnCwUZ1paH2IWA6oXkGj4J
 oAsw==
X-Gm-Message-State: AOAM530rGKhoAmOHTW63VWReOEjm36ScaS/qfq8R80KfLaCHP/6gF+Ns
 MssfSIio+RZrkiBaI3vrzXR1VlOOPiEb7lPV57upBRBqzSEEQeXVpWtL2B2kBZaSGotEBtAv8QI
 4cfN9Eb16LXM2yWgjbbnWBrDFIOwcwqNx
X-Received: by 2002:a05:6e02:1a24:: with SMTP id
 g4mr541658ile.56.1617752123132; 
 Tue, 06 Apr 2021 16:35:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaO3ytfZodkyajwuLbl1Y4fWouzIS2WVmGek9UP7t+cDJ+s7ZY5VtwQFZ3Q8QArUTuCz1zEw==
X-Received: by 2002:a05:6e02:1a24:: with SMTP id
 g4mr541645ile.56.1617752122966; 
 Tue, 06 Apr 2021 16:35:22 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:6ecd:6512:5d03:eeb6])
 by smtp.googlemail.com with ESMTPSA id
 h128sm14399373ioa.32.2021.04.06.16.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 16:35:22 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] video: fbdev: sm501fb:  Fix deallocation of buffers order
Date: Tue,  6 Apr 2021 18:35:17 -0500
Message-Id: <20210406233519.2205389-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Apr 2021 06:23:45 +0000
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
Cc: linux-fbdev@vger.kernel.org, kjlu@umn.edu,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The resource release in sm501fb_remove() is not in the inverse order of
sm501fb_probe(), for the buffers. Release the info object after
deallocating the buffers.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/video/fbdev/sm501fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index 6a52eba64559..4c32c9e88850 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -2060,11 +2060,11 @@ static int sm501fb_remove(struct platform_device *pdev)
 		unregister_framebuffer(fbinfo_pnl);
 
 	sm501fb_stop(info);
-	kfree(info);
 
 	framebuffer_release(fbinfo_pnl);
 	framebuffer_release(fbinfo_crt);
 
+	kfree(info);
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
