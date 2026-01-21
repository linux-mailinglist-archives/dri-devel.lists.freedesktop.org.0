Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGHLNDbncGk+awAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:48:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E92658B66
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B241C10E834;
	Wed, 21 Jan 2026 14:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="S5+ZkMcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F7910E834;
 Wed, 21 Jan 2026 14:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769006892; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GRAq2EuTac6Mq6i0t+LyJMc7NglhbkgdhY9zkk+h8JURXr8zLYMzbtvSxbITyjSkOhrZK4N3eOqNjWhZvTBbd9BvI8VN53b2tDzYrMRYd6NcC1t2pg3P7wNFhD9ToYo8Wx/btaGGKu7Ii5qw+TxV6a40tM57fia4fl6msBkjJVE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769006892;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RSXhbmC3n6qv4fmbrHo/VYnmC01w0SpCKpxl71nPUq4=; 
 b=ccZcs+LpjWcyC0wPrr+pT6obmlIHpIht5naqvc0KJv2wNO8rBiHCHY+hhec7EjJDv2uMJJPlL+aEK+aSIOXUmLtWeeICoxMklEQWEOw58Ks5MDH4N9mz9tjcGKDZVz1RtvfsedgZTdsrlUSkb5BpbOKrf3yrAgyDN7J2937vjKU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769006892; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=RSXhbmC3n6qv4fmbrHo/VYnmC01w0SpCKpxl71nPUq4=;
 b=S5+ZkMcHjoohd3WfGKo9QzA0/sYp1/VYdj2z98zvmyqDNz9vmNPol7P68IKSExGM
 NMQ1yvUqnwhrEGG53K+IXzTOFii2rwj7uD+C1SPm/a/LC4Jy3ePBmZMeghMuqCLQg9T
 Vqe41P8HS0iWS2L8Zlyl6/vH9U2f8QE9vayouOqk=
Received: by mx.zohomail.com with SMTPS id 1769006890778410.0564390583087;
 Wed, 21 Jan 2026 06:48:10 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 15:45:27 +0100
Subject: [PATCH v7 20/22] drm/tests: edid: Add __maybe_unused attribute to
 EDID definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v7-20-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
In-Reply-To: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 6E92658B66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's normal for a test suite to need an EDID, but not all EDIDs across
every test. Silence compiler warnings caused by unused definitions by
using the appropriate attribute.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/tests/drm_kunit_edid.h | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
index f4923157f5bf..18bb7043d7e8 100644
--- a/drivers/gpu/drm/tests/drm_kunit_edid.h
+++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
@@ -54,7 +54,8 @@
  *
  * EDID conformity: PASS
  */
-static const unsigned char test_edid_dvi_1080p[] = {
+static const unsigned char __maybe_unused
+test_edid_dvi_1080p[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -160,7 +161,8 @@ static const unsigned char test_edid_dvi_1080p[] = {
  *
  * EDID conformity: FAIL
  */
-static const unsigned char test_edid_hdmi_1080p_rgb_max_100mhz[] = {
+static const unsigned char __maybe_unused
+test_edid_hdmi_1080p_rgb_max_100mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -268,7 +270,8 @@ static const unsigned char test_edid_hdmi_1080p_rgb_max_100mhz[] = {
  *
  * EDID conformity: PASS
  */
-static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
+static const unsigned char __maybe_unused
+test_edid_hdmi_1080p_rgb_max_200mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -387,7 +390,8 @@ static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
  *
  * EDID conformity: PASS
  */
-static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz_hdr[] = {
+static const unsigned char __maybe_unused
+test_edid_hdmi_1080p_rgb_max_200mhz_hdr[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -495,7 +499,8 @@ static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz_hdr[] = {
  *
  * EDID conformity: PASS
  */
-static const unsigned char test_edid_hdmi_1080p_rgb_max_340mhz[] = {
+static const unsigned char __maybe_unused
+test_edid_hdmi_1080p_rgb_max_340mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -609,7 +614,8 @@ static const unsigned char test_edid_hdmi_1080p_rgb_max_340mhz[] = {
  *
  * EDID conformity: PASS
  */
-static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz[] = {
+static const unsigned char __maybe_unused
+test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x1a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -723,7 +729,8 @@ static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz[] = {
  *
  * EDID conformity: PASS
  */
-static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz[] = {
+static const unsigned char __maybe_unused
+test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -841,7 +848,8 @@ static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz[] = {
  *     VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
  * Checksum: 0xca
  */
-static const unsigned char test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz[] = {
+static const unsigned char __maybe_unused
+test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x34, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0xff, 0x23, 0x01, 0x03, 0x80, 0x60, 0x36, 0x78,
 	0x0f, 0xee, 0x91, 0xa3, 0x54, 0x4c, 0x99, 0x26, 0x0f, 0x50, 0x54, 0x20,
@@ -955,7 +963,8 @@ static const unsigned char test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz[
  *   YCbCr 4:2:0 Video Data Block:
  * Checksum: 0x84
  */
-static const unsigned char test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz[] = {
+static const unsigned char __maybe_unused
+test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x34, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0xff, 0x23, 0x01, 0x03, 0x80, 0x60, 0x36, 0x78,
 	0x0f, 0xee, 0x91, 0xa3, 0x54, 0x4c, 0x99, 0x26, 0x0f, 0x50, 0x54, 0x20,

-- 
2.52.0

