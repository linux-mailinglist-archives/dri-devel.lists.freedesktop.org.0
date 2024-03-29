Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AE8892232
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 18:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FBB10E2AB;
	Fri, 29 Mar 2024 17:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="HXt1rRSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3ABA31127D5;
 Fri, 29 Mar 2024 17:02:28 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
 by linux.microsoft.com (Postfix) with ESMTPSA id E709B20E6F50;
 Fri, 29 Mar 2024 10:02:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E709B20E6F50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1711731748;
 bh=FBEap9UriasmuWH1luz/pYU8Vj/ov3W7GcXI5HcE8Oc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HXt1rRSU2n8RHfjdj+dQSPpD5mqqmQZS2xo1RoJb1Tx7aw63Shmx6szGeIXPbhjJ9
 KCJAEVxyAoSUBA0s8+2FYyT4zuT5SAC4MIJ9rIwYY/l4JyWAWCSaJhyxH+uk29eM4h
 Z+uxKwMTyQKbiiWtAXBnNEC7siWDf+GZGFaxGqY8=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Edward Cree <ecree.xilinx@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Easwar Hariharan <eahariha@linux.microsoft.com>,
 netdev@vger.kernel.org (open list:SFC NETWORK DRIVER),
 linux-net-drivers@amd.com (open list:SFC NETWORK DRIVER),
 linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:34 +0000
Message-Id: <20240329170038.3863998-11-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
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

I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/net/ethernet/sfc/falcon/falcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
index 7a1c9337081b..147e7c8e3c02 100644
--- a/drivers/net/ethernet/sfc/falcon/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon/falcon.c
@@ -367,7 +367,7 @@ static const struct i2c_algo_bit_data falcon_i2c_bit_operations = {
 	.getsda		= falcon_getsda,
 	.getscl		= falcon_getscl,
 	.udelay		= 5,
-	/* Wait up to 50 ms for slave to let us pull SCL high */
+	/* Wait up to 50 ms for client to let us pull SCL high */
 	.timeout	= DIV_ROUND_UP(HZ, 20),
 };
 
-- 
2.34.1

