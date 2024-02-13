Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143FB852EE1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0507A10E043;
	Tue, 13 Feb 2024 11:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PltzndGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31D110E043
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 11:15:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4AC50CE1A55;
 Tue, 13 Feb 2024 11:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E826C433F1;
 Tue, 13 Feb 2024 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707822914;
 bh=APFYotw86p62/fng4yVxpcCYH9lo/o/Vcj6fOv/RC1A=;
 h=From:To:Cc:Subject:Date:From;
 b=PltzndGWBmDv79/xBrq7AJdgFkZVFxH4Z7szGa1fV9ivAucdRuutHaGUAmMbNdof0
 hTslWXhiMAUBoDqPxv9tRx9LoEYjG80z2S03ce1B3dJkmYpDyQzSmAhtkqTcTWZG2m
 /Sq2wGU72W5seadfu8veobnkvhVUi5stEviuesGw6p7bsMr1LK546aF0OzHCULWolj
 cDPGehGbrTcMivrgAAtuBMa4ibhwstKGXZAmr51g9aYcYYpRhP9y7wLAaWz4hd2XwD
 BmYb/bSV+32WkP0LxQboQ6N24ox+m+Uoij43J7hJsbUtdpLKEk+zy9CdKPMH3eLwCT
 1FpLSK85fkOrw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: airlied@redhat.com
Cc: linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] char/agp: remove agp_bridge_data::type
Date: Tue, 13 Feb 2024 12:15:11 +0100
Message-ID: <20240213111511.25187-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.1
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

agp_bridge_data::type is unused (and I cannot find when was used last).

Therefore, remove it.

Found by https://github.com/jirislaby/clang-struct.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: David Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/char/agp/agp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/agp.h b/drivers/char/agp/agp.h
index 5c36ab85f80b..67d7be800a7c 100644
--- a/drivers/char/agp/agp.h
+++ b/drivers/char/agp/agp.h
@@ -138,7 +138,6 @@ struct agp_bridge_data {
 	unsigned long gart_bus_addr;
 	unsigned long gatt_bus_addr;
 	u32 mode;
-	enum chipset_type type;
 	unsigned long *key_list;
 	atomic_t current_memory_agp;
 	atomic_t agp_in_use;
-- 
2.43.1

