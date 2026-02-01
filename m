Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMAEKGpkf2lSpgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:34:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48278C62B0
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9498310E051;
	Sun,  1 Feb 2026 14:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="qrUJq3Lc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1820 seconds by postgrey-1.36 at gabe;
 Sun, 01 Feb 2026 14:34:11 UTC
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com
 [203.205.221.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC89810E051
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1769956449;
 bh=Zg92kv/PO0LRs0cpMZQfzAyaHbuQKHUP2Sto20d9X3k=;
 h=From:To:Cc:Subject:Date;
 b=qrUJq3LcGoBL/NUIfigXAcQoFrrTCAA2LrDTFKCAh2jNQXnfqA2K3EGDCQ08yyG/t
 r3p1AimQo1sX1L1bwoPlNgLu4//B1tyvFK5JRA+QrIuwDGRfIoRFu0kZh9PEWH6PH1
 NTnXJwYNohywlszoLw0OVcmfI8g8WHzJU6z3+fCI=
Received: from localhost.localdomain ([171.223.89.62])
 by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
 id 9626860; Sun, 01 Feb 2026 22:02:22 +0800
X-QQ-mid: xmsmtpt1769954542t6fqav76i
Message-ID: <tencent_8D922FAC8459EF1AC3A4503196336AEB6006@qq.com>
X-QQ-XMAILINFO: NZQ6sbOBcc+vn1x5tkBlm+uvBmg4DgIMTb3rG07k5JrGfRIZ4UaFb1n2e9QkjB
 JbTwpTHZSQ2kHuXg9I/9Y5RK2bFRHvOlwFZmR/NvQHABeRJ94htiSotXIk7w3gHht00xZGXk2e+9
 HzyPcIyAT/e4l8W29rgDWPoT/YsWbLFFTonJ1Gc264Gpycj3o1MOLCIhJ642JYA6sPau1yFhe40a
 UsxyO4Zr025+0vjzbTkEw3u4LXdqt49KakVuKsEoZEAz/e0NROhuNA/n+IxHF6TIkiBpbPiKRqz4
 AXkytzNSs+iQa/U8sQBf88VijeE5Q3+WiZGRLwOI1agyf0bCflB0kj7pzElS5cL3ihruwtD8W4IV
 FHxGVf1r6ZDTS2awEcOLhz2NrktSIXAIj/JEg2fjqD/FJDhEt3yJcxLRuPrpLZujQJJ9q0OG1Iqm
 rsMsRnybULbmsyehDaW4RUjW1rCrNTzPwHxFO9huSReZznjZETHbODU5LiASjq1hB3eVRK36PUJT
 Wzr7XwJ1DdJII0wK/hbJ1S8qacSYvskguPKqa1Got1nvhokDruf9LYotvVGvaQphOgm+wlj8B2H5
 eZLMUlb2E7Mx9BJEvMUBlvsbgrM+/IBwN032sKIrY9hfx1Q78PqmZdmv6gkoLrpqKPREVwAyg7KO
 q89MPXd2k7B+22NZ/aEDZbA6xDwPAZ9XEoJO1r4GzxG2k6iHp9ZLpTeadgvhAQaKJntwWGZv1IYg
 FkxvTDASN8yzh49JV3vxuacckdAdqnQw99phx0NsCA1VrHZxp7zSmMMBaBJW9LVe8ZnBHhPe4byw
 n0EasM2OIzbSApKnIINj+RNgT/J8+TTmIAflS4UHMMDO28bB3zm7TuOFvtx4iNJ1TqsI1DU8soJT
 Tu6DgRMCFQPHcdSfRyYDhUru6n+UQdy35JZMjZi3aPAbzG3oNV5dJAp99+4fuaCEdPknmtTNSWWP
 C2UXBE0ZdlO+Jg3+CcZAd/m5hLd/xEZXGFK/3eBfJcoA9C9nJTSoY4VaO0EEG7InPS034W3PbM17
 WyWSw82IWH6t22KOGcFIh5XWi7fha6Bbf77Pe+PUt0IJ0DfhKlqu1Lu0Si/0K2x1SaSqPn/hvQjy
 4PUW+8UjqEPYvTiuM=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Renjun Wang <renjunw0@foxmail.com>
To: louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, simona@ffwll.ch,
 melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH] drm/vkms: Add YUV410, YUV411, YVU410, and YVU411 support
Date: Sun,  1 Feb 2026 22:02:09 +0800
X-OQ-MSGID: <20260201140209.8227-1-renjunw0@foxmail.com>
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
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:renjunw0@foxmail.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[renjunw0@foxmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[foxmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,foxmail.com];
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
X-Rspamd-Queue-Id: 48278C62B0
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

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
 1 file changed, 6 insertions(+)

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
-- 
2.47.3

