Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6C65B0FF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 12:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A6510E316;
	Mon,  2 Jan 2023 11:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7A410E311
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 11:29:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1C9034089;
 Mon,  2 Jan 2023 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672658970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BpCEvIzU5hnOUZLwjP5klkPNr/bP1MWU1cvM4S7AZQ=;
 b=tVdJRaum55wmgkkFAjvT1s8PdhnhoxWG5VRQY/HXIQMR3k+D56VQ3dOQ/OoZ7fB91Ydsy0
 3k/sykn9dC8UTIvbZQYRzQlE5B6lKV9QhmVk7Wb9OcFrRLf5J1iUQF/TFyslkT6TjLaHXd
 MQHTX6bG7s7/Ihp6NLQXrG1c6zFrshA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672658970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BpCEvIzU5hnOUZLwjP5klkPNr/bP1MWU1cvM4S7AZQ=;
 b=MpvkTc6eWsZxZ5s85M/+DoPNZeg5ZxHqVMNGvG5jb/zMEm9udnDYcmxWfT0k9uTkQcSgzJ
 Myp0mU5Fx2cjD4Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD3FE13427;
 Mon,  2 Jan 2023 11:29:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJRYKRrAsmOOcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jan 2023 11:29:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 02/13] drm/format-helper: Comment on RGB888 byte order
Date: Mon,  2 Jan 2023 12:29:16 +0100
Message-Id: <20230102112927.26565-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102112927.26565-1-tzimmermann@suse.de>
References: <20230102112927.26565-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGB888 is different than the other formats as most of its pixels are
unaligned and therefore helper functions do not use endianness conversion
helpers. Comment on this in the source code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/drm_format_helper.c            | 1 +
 drivers/gpu/drm/tests/drm_format_helper_test.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 74ff33c2ddaa..b98bd7c5caee 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -404,6 +404,7 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
 
 	for (x = 0; x < pixels; x++) {
 		pix = le32_to_cpu(sbuf32[x]);
+		/* write blue-green-red to output in little endianness */
 		*dbuf8++ = (pix & 0x000000FF) >>  0;
 		*dbuf8++ = (pix & 0x0000FF00) >>  8;
 		*dbuf8++ = (pix & 0x00FF0000) >> 16;
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 2191e57f2297..cd1d7da3483c 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -407,6 +407,10 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
 	iosys_map_set_vaddr(&src, xrgb8888);
 
+	/*
+	 * RGB888 expected results are already in little-endian
+	 * order, so there's no need to convert the test output.
+	 */
 	drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 }
-- 
2.39.0

