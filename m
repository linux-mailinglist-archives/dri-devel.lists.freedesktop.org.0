Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E51912E4BC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9F289FEA;
	Thu,  2 Jan 2020 10:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F7889FEA;
 Thu,  2 Jan 2020 10:02:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so5165751wma.1;
 Thu, 02 Jan 2020 02:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpVrjWu9aDwxR+gFK4Bj/HRMRoCvr4WMHyXpeXsUZuI=;
 b=XUFS/11/wVNM+/r+f1Vd8xJZWbXqdYDFXoUsCi/mHVhJ2kU96cF9Z0riPvkbtgPWj3
 0lH9gaoXnNQ+wnIlKP/y9N9hcGkLde/8gYk8ikvBA52s4eWyoYK1Eb0UwgfWWvhblYhS
 DVXdgr17dnovrWtGu2yUIjWMhenQkIXA+/K5JkEPuEho7KHrCuz5DO/pE8Q79PTdBcZv
 xX4fKjNTMU7J4Z5fpB/8XQL1AoV97PNicKaDlNji5EGPFTgEOwEOxAevUoLrfBfixvdk
 LvVWWDWgAD+hP3sn/TWVT+Bqd1V1Ns/J92em8pAuluCRSxc91RLuvdrZoFpAVv13Vo2L
 bq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zpVrjWu9aDwxR+gFK4Bj/HRMRoCvr4WMHyXpeXsUZuI=;
 b=SyOVuE0osZynPeDRxgE6Xzx2T0hMK0rzm4MEDqxFwx9yjVhNyuxTMQ82McHBcklRpU
 wnRSl3mwEtTD5KigiQdzVfwNFWvUBVZokN9yHLloOMH9ZlM0vJBBB23vZnQWyK7594DO
 WutJcpMf+Dt/RXhPQ6Q+HfYfS4MltPcDhEulKNgzOVZdYfPe7lVMSMWMBVCaK4oiX5pd
 jasIYbhs/FfcQhlUHxCdocVegRCzyzB4g7IOXXDgSGs/ZdttjGaFg0N5wqDPYyosvVwn
 yDpszVje23gHaybex2iifEu7XVEyEea0hDP0Q4QpzdWFPW/5LAsZ0l14ipvw3/Swb92/
 v6tw==
X-Gm-Message-State: APjAAAUWXK/pdNXFzXvpeQPcQS8oanFNyBOT6lcRM7XgOp1Dr0fsqTyc
 Q88lR2E1wxoZCCV97jsm3nk=
X-Google-Smtp-Source: APXvYqylD8GwBP3d6yFUKkkJNL3QNwwyoYcJUzEPpB2RvAj973nYeo/AuM9KHExhcF+1SgfwUwNTwQ==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr14472812wmb.42.1577959370957; 
 Thu, 02 Jan 2020 02:02:50 -0800 (PST)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id r6sm55418683wrq.92.2020.01.02.02.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 02:02:50 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] drm/etnaviv: update gc7000 chip identity entry
Date: Thu,  2 Jan 2020 11:02:18 +0100
Message-Id: <20200102100230.420009-5-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102100230.420009-1-christian.gmeiner@gmail.com>
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use ~0U as marker for 'I do not care'. I am not sure what
GC7000 based devices are in the wild and I do not want to
break them. In the near future we should extend the hwdb.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 39b463db76c9..eb0f3eb87ced 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -9,6 +9,9 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 	{
 		.model = 0x7000,
 		.revision = 0x6214,
+		.product_id = ~0U,
+		.customer_id = ~0U,
+		.eco_id = ~0U,
 		.stream_count = 16,
 		.register_max = 64,
 		.thread_count = 1024,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
