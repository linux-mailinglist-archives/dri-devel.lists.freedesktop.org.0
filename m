Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKuAJ5y+gGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:11:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0640CDF43
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E660C88C3D;
	Mon,  2 Feb 2026 15:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="GITuG83D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com
 [203.205.221.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E22288C3D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1770045074;
 bh=iS3JGmgNk0JA7bQmNSECfvWhYQO/oHFnMzoT1MF10AQ=;
 h=From:To:Cc:Subject:Date;
 b=GITuG83D43w4zQ2n0Ch+cJnCmAl0khmOAB2RfO/rjvSL6qjaO2ROwSEcf0iNl0qUx
 OkbMf6SMLv3i3ww5n1v8CYYsvPUqE2wiVFe+XGkqVI6obZJqJSQKzhrOm5y5AHDARA
 X8aBzkWN0toYOQPSNPb+POE+bBHFqFQZvdXcsmoU=
Received: from localhost.localdomain ([171.223.89.62])
 by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
 id 2CB24491; Mon, 02 Feb 2026 23:11:11 +0800
X-QQ-mid: xmsmtpt1770045071tl2ohff2c
Message-ID: <tencent_6033C535EB4984626B679256F0A439587007@qq.com>
X-QQ-XMAILINFO: MIL63xn608kHUqml41qiQFJ1VH3ugNJHkkA4zOB4zGqzt95BBItQNj9wD+yVqS
 pP193s0l8gUoRarF0F9aTU6QA4ttBf+Jg1bYL+dOSiGPMQB5enZybfH593+C+GKxaTSDT9ouYlNJ
 /P6EDBzqKGrcPUQgu1TbkEgrI3yLNw/y/2aTi7/kE8Zmkj53QtCLn3Dcl8HRhmlmr61bJwUXwaIH
 Au5aQtHOPDDw8d691SUFsz6/vqRg1clwDkL+R3oObEMkwwofkVh/ZHg5ADZxzYmxbFofNfVhBrJV
 qddI20K77ghgnViOTkoZQr1z/fabJJqBYsxL61DGpyxPVfq3qhwX15Kconozxn02BBE5AMedHAob
 aDwhg9aKoBbHyowArmVoPJWVgDhgTrWr998yyiVa8LJL4BGZDxYB1yPq8/5/oEsbJQ8kR39mmxN0
 1KtOUCbV8KQ32QsFP6kIUkCWEpjoJPQKWnWY8jdJ1nwRIAcmOc3okN1gRKczeN7JzoIHPJ8KfTFS
 6wB+sIpSZdRhGCDTsMAyyijrsWirOP16t+wCfvxXnVaT6n+SI/7r02OgzOBj1/TU+2NXgZEL/WoF
 DDNHHsbDYW0EOPo6vtF10ZVpRA4EwhNM3QLZjGLTOaHgXULFgPlc/BbZARBS7+OQ6JWnhTsdJaHN
 v6HJ6eonGQxor+2dsOh3+JjZj0em9clJPvn/VkAUFzHO5Nuw8FBapkTvTxi7jMvaQcHAxnQAcdDl
 oyCw4SLEGTPtuy+ZEzlG5F0thBut3Ns3Qq7H90GlfimhBfOUNBqoiG75u8dFm1UWaSg9iQCpIQ8P
 mqe4lK0Lw3Mo/oqCDQHNQCVQx702POB7rw/KldDhZ4/rUZGf8C0Coxm9I+FwyP4aqizV2NvRT3xd
 aec9nBbSZv39E7fws4cRtUC7nKMQHcvuyqvcq3sIZxG63N6hZqAT72C3N/xV2wVQ0JPK7dGncceh
 VyYj/FQZBwVs8CG5Jbn003YtGoQpfcN5kRtHm/pXFQBUqY55H+PYQIhE4K3+9e1RDnBRMuDqvlSn
 Dt1w3IcAbQu5IZ+Z9F9Ad0r68Ifv81unkDfROb6HhbHnYZa7YQ0QOqQAaRAsHS957aPP9XnIpLuf
 GxlMaXlIkiaM9KYVbEX57QhFiw74p3lEWozEbiKFtTTcYgAlk=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Renjun Wang <renjunw0@foxmail.com>
To: louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, simona@ffwll.ch,
 melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH v2] drm/vkms: Add YUV410, YUV411, YVU410, and YVU411 support
Date: Mon,  2 Feb 2026 23:11:08 +0800
X-OQ-MSGID: <20260202151108.9081-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.47.3
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:renjunw0@foxmail.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[renjunw0@foxmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[foxmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,foxmail.com];
	FROM_NEQ_ENVFROM(0.00)[renjunw0@foxmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foxmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qq.com:mid,foxmail.com:email,foxmail.com:dkim]
X-Rspamd-Queue-Id: C0640CDF43
X-Rspamd-Action: no action

Add support for the following planar YUV formats:
- DRM_FORMAT_YUV410
- DRM_FORMAT_YUV411
- DRM_FORMAT_YVU410
- DRM_FORMAT_YVU411

These formats are handled by the existing planar_yuv_read_line()
function, which correctly handles the subsampling defined in each
format's drm_format_info.

The YVU variants (YVU410, YVU411) are also added to
get_conversion_matrix_to_argb_u16() to ensure the U and V columns
are swapped correctly in the conversion matrix.

v2:
 - update vkms_formats[] to add new formats.

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index dfb8e13cba87..5ef5d49a44ef 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -730,9 +730,13 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
 		return &YUV161616_semiplanar_read_line;
+	case DRM_FORMAT_YUV410:
+	case DRM_FORMAT_YUV411:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
 	case DRM_FORMAT_YUV444:
+	case DRM_FORMAT_YVU410:
+	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YVU444:
@@ -921,6 +925,8 @@ void get_conversion_matrix_to_argb_u16(u32 format,
 	memcpy(matrix, matrix_to_copy, sizeof(*matrix_to_copy));
 
 	switch (format) {
+	case DRM_FORMAT_YVU410:
+	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YVU444:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 19fe6acad306..44773a82fbfd 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -35,9 +35,13 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_NV21,
 	DRM_FORMAT_NV61,
 	DRM_FORMAT_NV42,
+	DRM_FORMAT_YUV410,
+	DRM_FORMAT_YUV411,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
 	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU410,
+	DRM_FORMAT_YVU411,
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
 	DRM_FORMAT_YVU444,
-- 
2.47.3

