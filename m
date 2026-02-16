Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHTbMstJk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A51465B8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E97810E3D3;
	Mon, 16 Feb 2026 16:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J1zM+Jw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2267810E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:50 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b8fa033d805so46899266b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260349; x=1771865149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvZ/+fVRqmKiJ2IIikBQGPpOWd0BdH2EkluaR3gmOLg=;
 b=J1zM+Jw5Njyc8vr+20rcnvRfxcISSY5zgoAobNokG/5Gq+i/VnGauzlLu0BSufHdhi
 x0c0IJf9ffYtesr5qVEqo00BS7BaNRWKtQ+fxagarwtGD2D915uBp7mQVFdENmgB7w+H
 ITJAMQnv79zmQGYfFwkQKuH2COov0RnxPr8mc+Vgn/1u1fVpdh1hE2q1z+MuxUqNOYDl
 hthA+/Hj55QxBTeAn7BpyTsc+xJxm8fjFn3zl6g+I1TkfAMAUgXLKYUiXZxKR3eFJgOs
 w/fK1uUIpcrxBEUSOL9wxKw3t02rmC8v/pAgx/XTm8Wrj6hYi6/PVS4N0XgW6HChlfi8
 yD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260349; x=1771865149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pvZ/+fVRqmKiJ2IIikBQGPpOWd0BdH2EkluaR3gmOLg=;
 b=Vbk9hJI4za1Lq0METQEQeyjM0238c20PwcNBiToevZpkkfLs36szfsLLD5zwWdmuNY
 QfZlPKYE8ttJxWj152PbkRGQXJz++RklqoRX+hIyroUKLTcQopNFux0ToBM//1y0lH2f
 jMA4/IZWiJPe15EAmsKtlNgoi5m6ev7BoPJRFp412AjUKDlxtzzi9IW8XoxDVQ+hKGXJ
 eTVh5FCKbgI5U92eETJ8qLw0exXXNXyR1f0WTstUuL5p0YrxibAam5II1e5/RmL5uHmI
 dOmNHu4DJbuZAjAeNgo1xU3buJ86hmVve1iLvy/pdzWwPLvla1GOyvwPgQiQtMvBUW5K
 040g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzm/0sCYiBkLsvsr2x7vz843mPsQTcBg0Ax2gROKRWFf55KJJRtwr5zI3EQiWQB2AtZvYj46idEyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5Ilq1VrpuppLi6CZn0b6+LRdwlX2kq1fxR8ZK/sDLkUWnOIYU
 cLKgLAOu6LG2OzpUU4dRU+6umCy5Tvxr6/cDZZK1R4P39D8MJqjw+81f
X-Gm-Gg: AZuq6aI0cZQP2wmYDHDs0drxKjFal/nhw5aKdiOiwOJSJb6jNleBp5Hb/QLTZqwE1cJ
 p/vdYNDSmQSu/lbHYvRkgnpR7GJOdrFOjdN6cVUgLyb7zuYrbIvsdoHFCujF3ofimj9f5K68Ksr
 sAJ/ejGuS37yA43Z9r2VJGBXvCdHKbUVHBwGB0KvB6uWYjVZp4BfTleAwHdo7dNnEvPI+xSLxrJ
 FgA412n7WFOvbFK/Z/HnyDRjEeP5FusXiqVmUyBcfJtxiBY5i1OO3aAcwLilZw6yzOZSjiXA0Xi
 rS+39/CvVUd/3WCMXs9RHjUWzUSZJ3WrPq4Cx5N4zmU0KissM6bzPb8WkqrBbqsdvCjZGMpnTwa
 eb2FwhYKcCmD1HxwZAKR53dpY0GQ4JiDOQXCuTyPi4cAp5kDicsq7WQhM+ZCwgkEooD+5ejxOFy
 o975KDicxwh495KEn5xGC4BTcP125czgzjf/Ai50OeiD34uDVEJj1nJchgdYJ1/HpZpVrJiC9i+
 vSr
X-Received: by 2002:a17:907:3e88:b0:b73:59b0:34c6 with SMTP id
 a640c23a62f3a-b8face510e0mr348092966b.4.1771260348524; 
 Mon, 16 Feb 2026 08:45:48 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:48 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 22/27] drm/amd/display: freesync_on_desktop support for
 HDMI VRR
Date: Mon, 16 Feb 2026 17:45:11 +0100
Message-ID: <20260216164516.36803-23-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 812A51465B8
X-Rspamd-Action: no action

[Why]
Many TVs and other HDMI sinks suffer from blanking and possibly other
glitches when VRR is toggled. With FreeSync present on such sinks, they
behave like the signal is always variable, even in fixed refresh rate
situations. DisplayPort and eDP enforce seamless VRR transitions but
HDMI unfortunately doesn't.

[How]
Keep HDMI VRR toggled if it's supported and not explicitly disabled.
Add logic that control this behavior and use this mode by default until
it can be controlled by connector KMS property.

Functionally, for an end user, this is the same as normal, fixed refresh
rate mode. The only difference is that sink is kept in VRR state which
enables seamless transitions into/out of variable refresh rate.

Uses the already established freesync_on_desktop field and logic.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/modules/info_packet/info_packet.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 7106b409ae54..7e0adb90af39 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -633,6 +633,14 @@ static void build_vtem_infopacket_data(const struct dc_stream_state *stream,
 
 	vrr_active = vrr->state == VRR_STATE_ACTIVE_VARIABLE ||
 		     vrr->state == VRR_STATE_ACTIVE_FIXED;
+	/*
+	 * Enables FreeSync-like behavior by keeping HDMI VRR signalling active
+	 * in fixed refresh rate conditions like normal desktop work/web browsing.
+	 * Functinally behaves like non-VRR mode by keeping the actual refresh
+	 * rate fixed.
+	 */
+	if (stream->freesync_on_desktop)
+		vrr_active |= vrr->state == VRR_STATE_INACTIVE;
 
 	infopacket->sb[VTEM_MD0] = VTEM_M_CONST << VTEM_M_CONST_BIT;
 	infopacket->sb[VTEM_MD0] |= VTEM_FVA_FACTOR << VTEM_FVA_BIT;
-- 
2.53.0

