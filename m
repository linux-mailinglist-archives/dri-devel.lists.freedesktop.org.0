Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD39C4B9CD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 07:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080EA10E4E2;
	Tue, 11 Nov 2025 06:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="SbWyT8kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857B410E4E2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 06:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PMcxZNEUscYbQoI/8aFEfvoW5j0WBCUVW2IFzxcGTQs=; b=SbWyT8knLDaV2s5Q3FJGumK4KC
 talk5Fvc7x5t2voIR65pu0h/3SvP3Vhn8OpiElG8XSTWm7KEh34EEzByW+dscHjuYJyLmDaGcGq9J
 vfF/Ial/wUueKaD10zTRqe7zV7QjdHm52u8cC2IdJXI69eGoEIqsZaiveLwF6RVAveRT3KqswC87J
 geEkRbQ4qi0z019JniNwPW6FWcqpW0+Y3KvL/yxyx/hZ2SrZSqP4M/xLomHAEzvRbxp6JPNqyug4i
 E36tnSo9tN1NAAi/hHW8npaLlyAmRhHRQEsUiFapfXKqfDn62ipleecNv/31hmjWIUBpHvuc1Vz3I
 AP3oorMQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vIhZ7-00000006b0J-0blW; Tue, 11 Nov 2025 06:09:17 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: lp855x: fix lp855x.h kernel-doc warnings
Date: Mon, 10 Nov 2025 22:09:16 -0800
Message-ID: <20251111060916.1995920-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
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

Add a missing struct short description and a missing leading " *" to
lp855x.h to avoid kernel-doc warnings:

Warning: include/linux/platform_data/lp855x.h:126 missing initial short
 description on line:
 * struct lp855x_platform_data
Warning: include/linux/platform_data/lp855x.h:131 bad line:
   Only valid when mode is PWM_BASED.

Fixes: 7be865ab8634 ("backlight: new backlight driver for LP855x devices")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 include/linux/platform_data/lp855x.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251107.orig/include/linux/platform_data/lp855x.h
+++ linux-next-20251107/include/linux/platform_data/lp855x.h
@@ -124,12 +124,12 @@ struct lp855x_rom_data {
 };
 
 /**
- * struct lp855x_platform_data
+ * struct lp855x_platform_data - lp855 platform-specific data
  * @name : Backlight driver name. If it is not defined, default name is set.
  * @device_control : value of DEVICE CONTROL register
  * @initial_brightness : initial value of backlight brightness
  * @period_ns : platform specific pwm period value. unit is nano.
-		Only valid when mode is PWM_BASED.
+ *		Only valid when mode is PWM_BASED.
  * @size_program : total size of lp855x_rom_data
  * @rom_data : list of new eeprom/eprom registers
  */
