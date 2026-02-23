Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJMIHAGMnGmdJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:18:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CCA17A9A8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE89C10E402;
	Mon, 23 Feb 2026 17:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=singulared.space header.i=@singulared.space header.b="sjvkAzmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Mon, 23 Feb 2026 17:18:52 UTC
Received: from forward203a.mail.yandex.net (forward203a.mail.yandex.net
 [178.154.239.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBF910E402
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 17:18:52 +0000 (UTC)
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
 by forward203a.mail.yandex.net (Yandex) with ESMTPS id 47B8885E4D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:13:04 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c15:290e:0:640:f317:0])
 by forward100a.mail.yandex.net (Yandex) with ESMTPS id 5A1A1C01BC;
 Mon, 23 Feb 2026 20:13:01 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id tCjubsTG8qM0-wNbjLToA; 
 Mon, 23 Feb 2026 20:13:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=singulared.space;
 s=mail; t=1771866780;
 bh=Yv48tyg2Jbrr8T4MkG23DycC+tfe6owKAJ+NMPUcZAc=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=sjvkAzmWG7+Jmj7IrlzdvQBefZrcsCdnSJDNoyc091toZMko612UjsaFZPw9Bm6nr
 CgwdpHcuDVrtYrYOnh4Rl9WwlJzcKiKOkW5Jq8pqVKlV5UCmcZPGK+s6iTH1Nh0G0A
 93aoiqcGmmgkvMde/2Odv73cCWR+FWM1/LiXBg64=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net;
 dkim=pass header.i=@singulared.space
From: Belousov Maksim <mail@singulared.space>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Belousov Maksim <mail@singulared.space>
Subject: [PATCH] drm/tiny: ili9486: use DRM_MODE_INIT for proper vrefresh
Date: Mon, 23 Feb 2026 21:12:47 +0400
Message-ID: <20260223171247.503277-1-mail@singulared.space>
X-Mailer: git-send-email 2.51.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[singulared.space:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kamlesh.gurudasani@gmail.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mail@singulared.space,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[singulared.space];
	FORGED_SENDER(0.00)[mail@singulared.space,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,singulared.space];
	FREEMAIL_TO(0.00)[gmail.com,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@singulared.space,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[singulared.space:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,singulared.space:mid,singulared.space:dkim,singulared.space:email]
X-Rspamd-Queue-Id: E2CCA17A9A8
X-Rspamd-Action: no action

The ili9486 driver uses DRM_SIMPLE_MODE() which sets the pixel
clock to 1 kHz. Since htotal==hdisplay and vtotal==vdisplay,
the calculated vrefresh is:

    1000 / (480 * 320) = 0.006 Hz

This breaks Wayland compositors in two ways. Compositors that
use the mode's refresh rate to schedule their repaint loop
(such as Weston) compute a repaint delay of over a second,
triggering abnormal delay warnings and degrading rendering.
Compositors that are page-flip driven (such as wlroots-based
compositors) are unaffected at the compositor level, but still
report the near-zero rate to clients via wl_output.mode. This
causes toolkits such as GTK4 to not schedule redraws, so
applications render their initial frame but never visually
update in response to input.

Replace DRM_SIMPLE_MODE() with DRM_MODE_INIT(30, ...) which
properly calculates the pixel clock for a 30 Hz target refresh
rate. 30 Hz is a conservative default achievable on most SPI
setups. The actual frame rate remains bounded by SPI bus
throughput; the mode's vrefresh only affects how compositors
and clients schedule rendering.

Note: other tiny DRM drivers (hx8357d, ili9163, ili9225,
ili9341, mi0283qt, repaper, sharp-memory) have the same issue
and would benefit from the same change.

Tested on Raspberry Pi 4 with ILI9486-based MHS-3.5" SPI LCD
(480x320). With Weston, the compositor logs "computed repaint
delay is abnormal" warnings. With sway (wlroots), GTK4 clients
fail to visually update. Both issues are resolved by this
patch.

Signed-off-by: Belousov Maksim <mail@singulared.space>
---
 drivers/gpu/drm/tiny/ili9486.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 1e411a0f4..83eda43bd 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -165,7 +165,7 @@ static const struct drm_simple_display_pipe_funcs waveshare_pipe_funcs = {
 };
 
 static const struct drm_display_mode waveshare_mode = {
-	DRM_SIMPLE_MODE(480, 320, 73, 49),
+	DRM_MODE_INIT(30, 480, 320, 73, 49),
 };
 
 DEFINE_DRM_GEM_DMA_FOPS(ili9486_fops);
-- 
2.51.0

