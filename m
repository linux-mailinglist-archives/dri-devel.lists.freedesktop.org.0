Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D856F661D
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 09:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738BB10E3B2;
	Thu,  4 May 2023 07:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE64610E3AF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 07:45:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB07E1FE18;
 Thu,  4 May 2023 07:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683186342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAY+hm0JbdoN9GPmL+mpKXDG9FbIByWtP6OGBMiB+YI=;
 b=SfvhRD7/OQC2IWHOWciJ9HdwjaPnHJi/7wkmielkw7MBRP0CGthMS1XzW7ps78veqxW56+
 ypDohSk3/F3CyUjCQF6sG00fhMLyxN0H1vdryOJPsqDzTlh53TcNlc5+sY30lJxFQeSGMK
 IOJlZIMH6e/xmqfeWRb00MoDnN2ICDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683186342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAY+hm0JbdoN9GPmL+mpKXDG9FbIByWtP6OGBMiB+YI=;
 b=o3jir1Fnhy+c/kM2blJkLwj6kjFtLc+LCQRJj8YJKER0SLpQFQ373ww5WgVDf34JtlAs0m
 0Sc3/6rwfIqHK5AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46ACE133F7;
 Thu,  4 May 2023 07:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sK9xEKZiU2S6HAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 04 May 2023 07:45:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@HansenPartnership.com, arnd@arndb.de,
 sam@ravnborg.org
Subject: [PATCH v4 2/6] ipu-v3: Include <linux/io.h>
Date: Thu,  4 May 2023 09:45:35 +0200
Message-Id: <20230504074539.8181-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504074539.8181-1-tzimmermann@suse.de>
References: <20230504074539.8181-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code uses readl() and writel(). Include the header file to
get the declarations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/ipu-v3/ipu-prv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/ipu-v3/ipu-prv.h b/drivers/gpu/ipu-v3/ipu-prv.h
index 291ac1bab66d..d4621b1ea7f1 100644
--- a/drivers/gpu/ipu-v3/ipu-prv.h
+++ b/drivers/gpu/ipu-v3/ipu-prv.h
@@ -8,6 +8,7 @@
 
 struct ipu_soc;
 
+#include <linux/io.h>
 #include <linux/types.h>
 #include <linux/device.h>
 #include <linux/clk.h>
-- 
2.40.1

