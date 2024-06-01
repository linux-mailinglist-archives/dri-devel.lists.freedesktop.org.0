Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3908D74D6
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 13:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917E410E045;
	Sun,  2 Jun 2024 11:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=danishpraka.sh header.i=@danishpraka.sh header.b="rqZM/y3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-15.pe-b.jellyfish.systems (out-15.pe-b.jellyfish.systems
 [198.54.127.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C60A10E199
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 14:52:53 +0000 (UTC)
Received: from output-router-d5c465c44-45n78 (new-01.privateemail.com
 [198.54.118.220])
 by pe-b.jellyfish.systems (Postfix) with ESMTPA id 4Vs2z80JgnzGq2w;
 Sat,  1 Jun 2024 14:52:52 +0000 (UTC)
Received: from MTA-07.privateemail.com (unknown [10.50.14.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by NEW-01.privateemail.com (Postfix) with ESMTPS id EB84D18000D0;
 Sat,  1 Jun 2024 10:52:51 -0400 (EDT)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
 by mta-07.privateemail.com (Postfix) with ESMTP id C2E2918000B0;
 Sat,  1 Jun 2024 10:52:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=danishpraka.sh;
 s=default; t=1717253571;
 bh=lo3WERO5Od+lCrB7tZFl4JPJAq2xflULTe7KYhW0Ip4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rqZM/y3iohM9HsGn1TL+LI2bnfmZBtSDmTndpPLP5aColQqUihT4nopGxg9WBwE9Z
 1hB13aEVLuf3WMdV+xW4vqPvHvWIqumpiCEmpmgBJnLTYC96oxrvsPHYMhmaXbmPyb
 G+uNScvNqe4p9K+z360D+1exRHkQpuVoph96Ng62KovldpxMBMOFMuVmNXIWiTwZns
 9DAtrZ/FUnhOUfyYLe4UV1aCRL5knt3sP348n/gHXN+OdCkY4sHgemNJA4hj3/Ig1x
 pIoqtgNbYi17KQa9TGCUb/rd58VI+5iBaXgtVPFE8G+eqzLxb4iYb5dxBJFBjjS2LT
 IDXsBXgSe9ecw==
Received: from localhost.localdomain (unknown [122.171.21.36])
 by mta-07.privateemail.com (Postfix) with ESMTPA;
 Sat,  1 Jun 2024 10:52:37 -0400 (EDT)
From: Danish Prakash <contact@danishpraka.sh>
To: 
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Danish Prakash <contact@danishpraka.sh>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-msm@vger.kernel.org (open list:QUALCOMM CLOUD AI (QAIC) DRIVER),
 dri-devel@lists.freedesktop.org (open list:QUALCOMM CLOUD AI (QAIC) DRIVER),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Documentation/accel/qaic: Fix typo
Date: Sat,  1 Jun 2024 20:21:24 +0530
Message-ID: <20240601145216.32232-1-contact@danishpraka.sh>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
References: <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 02 Jun 2024 11:08:14 +0000
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

Fixed a typo in the docs where 'phsyical'
was corrected to 'physical'.

Signed-off-by: Danish Prakash <contact@danishpraka.sh>
---
 Documentation/accel/qaic/qaic.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index efb7771273bb..628bf2f7a416 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -93,7 +93,7 @@ commands (does not impact QAIC).
 uAPI
 ====
 
-QAIC creates an accel device per phsyical PCIe device. This accel device exists
+QAIC creates an accel device per physical PCIe device. This accel device exists
 for as long as the PCIe device is known to Linux.
 
 The PCIe device may not be in the state to accept requests from userspace at
-- 
2.45.1

