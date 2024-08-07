Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B794ACD9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772A810E18A;
	Wed,  7 Aug 2024 15:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zyqJ3DYa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3+CHSE4Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zyqJ3DYa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3+CHSE4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051DA10E18A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 15:26:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 91DD41FB96;
 Wed,  7 Aug 2024 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723044409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8WMcN5aTLqlNS8KglPxh5aEU6v/N8Os3PDJA9fbZ3I=;
 b=zyqJ3DYamR7kHubC7o/Z4M3/7ygkweW9f0yuYuPBQ0rFIzc9R+UMXrmCLbdOqlLv44HfXR
 ieHL38SUxCwezYaEpc7qbyntDdLyrW90z8OaRGgLXSMzoNZluRErtfPkWOetE7sbrVAVZc
 vu9Djk6gIcKDFZLq+ZP3dTm77EJCbqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723044409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8WMcN5aTLqlNS8KglPxh5aEU6v/N8Os3PDJA9fbZ3I=;
 b=3+CHSE4Y/I3ANYIp+5/XIjvWXX1tWxpxRYgSc02a3iIhAiNrNEZwWUZT1cFv7MDFsVVNgB
 YZGR3uUFj5rmvxDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zyqJ3DYa;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3+CHSE4Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723044409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8WMcN5aTLqlNS8KglPxh5aEU6v/N8Os3PDJA9fbZ3I=;
 b=zyqJ3DYamR7kHubC7o/Z4M3/7ygkweW9f0yuYuPBQ0rFIzc9R+UMXrmCLbdOqlLv44HfXR
 ieHL38SUxCwezYaEpc7qbyntDdLyrW90z8OaRGgLXSMzoNZluRErtfPkWOetE7sbrVAVZc
 vu9Djk6gIcKDFZLq+ZP3dTm77EJCbqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723044409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8WMcN5aTLqlNS8KglPxh5aEU6v/N8Os3PDJA9fbZ3I=;
 b=3+CHSE4Y/I3ANYIp+5/XIjvWXX1tWxpxRYgSc02a3iIhAiNrNEZwWUZT1cFv7MDFsVVNgB
 YZGR3uUFj5rmvxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A67113297;
 Wed,  7 Aug 2024 15:26:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2K0hDTmSs2bxewAAD6G6ig
 (envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 15:26:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/bridge: dw-hdmi: Move vmalloc PCM buffer management
 into the driver
Date: Wed,  7 Aug 2024 17:27:22 +0200
Message-ID: <20240807152725.18948-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807152725.18948-1-tiwai@suse.de>
References: <20240807152725.18948-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCPT_COUNT_SEVEN(0.00)[11];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 91DD41FB96
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.51
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

The dw-hdmi drm bridge driver is the only one who still uses the ALSA
vmalloc helper API functions.  A previous attempt to change the way of
buffer management wasn't taken for this legacy stuff, as we had little
chance for test and some risk of major breaking.
Instead, this patch moves the vmalloc buffer stuff into the dw-hdmi
driver code itself, so that we can drop them from ALSA core code
afterwards.

There should be no functional changes.

Link: https://lore.kernel.org/20191210154536.29819-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index 67b8d17a722a..221e9a4edb40 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/vmalloc.h>
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_edid.h>
 
@@ -388,15 +389,36 @@ static int dw_hdmi_close(struct snd_pcm_substream *substream)
 
 static int dw_hdmi_hw_free(struct snd_pcm_substream *substream)
 {
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	vfree(runtime->dma_area);
+	runtime->dma_area = NULL;
+	return 0;
 }
 
 static int dw_hdmi_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	size_t size = params_buffer_bytes(params);
+
 	/* Allocate the PCM runtime buffer, which is exposed to userspace. */
-	return snd_pcm_lib_alloc_vmalloc_buffer(substream,
-						params_buffer_bytes(params));
+	if (runtime->dma_area) {
+		if (runtime->dma_bytes >= size)
+			return 0; /* already large enough */
+		vfree(runtime->dma_area);
+	}
+	runtime->dma_area = vzalloc(size);
+	if (!runtime->dma_area)
+		return -ENOMEM;
+	runtime->dma_bytes = size;
+	return 1;
+}
+
+static struct page *dw_hdmi_get_page(struct snd_pcm_substream *substream,
+				     unsigned long offset)
+{
+	return vmalloc_to_page(substream->runtime->dma_area + offset);
 }
 
 static int dw_hdmi_prepare(struct snd_pcm_substream *substream)
@@ -515,7 +537,7 @@ static const struct snd_pcm_ops snd_dw_hdmi_ops = {
 	.prepare = dw_hdmi_prepare,
 	.trigger = dw_hdmi_trigger,
 	.pointer = dw_hdmi_pointer,
-	.page = snd_pcm_lib_get_vmalloc_page,
+	.page = dw_hdmi_get_page,
 };
 
 static int snd_dw_hdmi_probe(struct platform_device *pdev)
-- 
2.43.0

