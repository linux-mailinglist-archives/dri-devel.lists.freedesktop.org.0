Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5016CFFDC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 11:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDE210ED76;
	Thu, 30 Mar 2023 09:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9568F10ED71
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:32:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0DA78B826C0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313B3C433D2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680168758;
 bh=1XPsBKCGwfqHUITf3iK1bP7dShrfwNmlGnTEoQNoyvI=;
 h=From:To:Subject:Date:From;
 b=QfAWb51pMhY32/DH8CweI+3joPtylGfcILjZPepnNRNY/2QD2INX7PXfMobMNFiCQ
 oiPtQNyAQNYnklm6HX2dWzFCPWNfstdkVnMBixAaIkJ8+EhVWfnXRivY5iP+Acop30
 HwiO7E5knBaK2Gq5ece0JdpnPHeXqHEfGVPrq5wQpWPYfgymTcYP5JUWYyE4QEf/kS
 ka9ntCnSdjwagjj3qSdvdSDgrie92wyVHe1ACXUV48XYOJ1+d3CXML5woLF0cL030Q
 gQmcMoELMdWXnPKaN5otckd4a9ZGDXKyHHCP+SCmQ8bXf3hMDKmHGAhCrq9kSP0w16
 cVmdSVJi2IgFA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/habanalabs/uapi: new Gaudi2 server type
Date: Thu, 30 Mar 2023 12:32:34 +0300
Message-Id: <20230330093234.1605251-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
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

Add definition of a new Gaudi2 server type. This represents
the connectivity between the cards in that server type.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 include/uapi/drm/habanalabs_accel.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index c139aab17c8a..d9ef1b151d04 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -708,7 +708,8 @@ enum hl_server_type {
 	HL_SERVER_GAUDI_HLS1H = 2,
 	HL_SERVER_GAUDI_TYPE1 = 3,
 	HL_SERVER_GAUDI_TYPE2 = 4,
-	HL_SERVER_GAUDI2_HLS2 = 5
+	HL_SERVER_GAUDI2_HLS2 = 5,
+	HL_SERVER_GAUDI2_TYPE1 = 7
 };
 
 /*
-- 
2.40.0

