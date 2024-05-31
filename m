Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A48D74DB
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 13:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88CA10E0A3;
	Sun,  2 Jun 2024 11:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=danishpraka.sh header.i=@danishpraka.sh header.b="CZ9uHnDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 588 seconds by postgrey-1.36 at gabe;
 Fri, 31 May 2024 06:20:09 UTC
Received: from out-06.pe-b.jellyfish.systems (out-06.pe-b.jellyfish.systems
 [198.54.127.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6815410F71B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 06:20:01 +0000 (UTC)
Received: from output-router-d5c465c44-d7pgd (new-01.privateemail.com
 [198.54.118.220])
 by pe-b.jellyfish.systems (Postfix) with ESMTPA id 4VrCQX2qQmzFpjr;
 Fri, 31 May 2024 06:10:12 +0000 (UTC)
Received: from MTA-11-1.privateemail.com (unknown [10.50.14.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by NEW-01.privateemail.com (Postfix) with ESMTPS id 53FA918000D0;
 Fri, 31 May 2024 02:10:12 -0400 (EDT)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 26E3018000AB;
 Fri, 31 May 2024 02:10:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=danishpraka.sh;
 s=default; t=1717135812;
 bh=jgp/6vz5V2JFZNzmdgRvgt76fGnP/p9jwDavyuTA2x4=;
 h=From:To:Cc:Subject:Date:From;
 b=CZ9uHnDWJwYV0T89EfGrrHtbGYozHYy7/V6P5ziIKYLiwWAcT0ptbB0rXP5NAr9QG
 /Y9gKDGMzA74quXo5RDeOLrnidvSsA7e6FsYcQMa0I91iP9T+Drsh9SX6zRWX768Wy
 w1JAZq8fNAVLlOeX6+QS1cexlR4hcfNWnEGztFHD/F08MZ8mJ9l17kYgLshM2FmfTz
 SapSqOY81rlF5vYnF/CsqhijsQ3SdQGkm+rWed1SaMd4uImzQksFEdDTZoO9k3R1wv
 9GT9umEKVAXcmAiUUyLCmnBgs501S62DCBDfgDfZJIL6cYhHC9hSXHAh8GrFiEAHer
 syfTGYslsolwQ==
Received: from localhost.localdomain (unknown [106.196.30.82])
 by mta-11.privateemail.com (Postfix) with ESMTPA;
 Fri, 31 May 2024 02:09:55 -0400 (EDT)
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
Subject: [PATCH] Documentation/accel/qaic: Fix typo 'phsyical'
Date: Fri, 31 May 2024 11:39:26 +0530
Message-ID: <20240531060929.5281-1-contact@danishpraka.sh>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 02 Jun 2024 11:08:13 +0000
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

(as part of LFX Linux Mentorship program)

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

