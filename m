Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMdCDLlJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E6146572
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45DE10E3C8;
	Mon, 16 Feb 2026 16:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="juya/zF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9C110E3CC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:42 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b8fa19e6186so64122266b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260340; x=1771865140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ejmSd8nb43tZXdHKG5XI+JEcgisrugoqcCJvx2EkNE=;
 b=juya/zF79o4YcOv0zi4UfdD2FyfDOY/DxRaDmTdho2PugtxITgaD0NMzCMRWKO08c/
 bNYWYXP2mA77bkoQxKq0pD8vt+ZGlIlsURftFchJQ6rkH6P4hG3A2ar5g3dP5RHHkcch
 OPrIexaeCpWicOnliyDGlSHHG6OzfzCZ8WzwJ9OBfWTVWIHS1Xeicdnt4Mm50cTyW8Zh
 MN7PQOOMGW34rolayhaG04QQxuM/rxiFP01imBuyJydW3TKCgy+hcOWjzinQvwklBY+S
 RDlasQMEHCGNyA+MUT6W0F3gDMhvaT0JlZt0tlYqyp8w6oVWV/aDwuEw9ODxKUOSkfYq
 LKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260340; x=1771865140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4ejmSd8nb43tZXdHKG5XI+JEcgisrugoqcCJvx2EkNE=;
 b=TTAdC/PKp93X4oHWiUBxvx8G7VF6GS1utx5lQF3Sfj/xgYtz4puotjtCAqKSz5PIE3
 w0nsAIDBBlnbiF4Ka5GpD7MKdGwoUuLsDGQPT0EOjzSD99XGdO7g2Ey+WP/HoXpeUmN0
 XuBLI90Rs2JKvpPER1l96GhNx8D//e2eE84ZYEGm1j/Arj0niuKVTtkP9RorPJ73p/U5
 pIxtcp3rVhgvczffWesR70c6t3tG8L3fIho2/rlWdWBUfzygi4oTmPWZyJ9+Di11QdgG
 qwHaneeMk8zw0EeI/voVNssHMBQZP6H3ZX5qM+dhJkEJhUMdalQpf93l5eFvWIqWbJMb
 gdfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj1ZStO2o+CPQRMgfO2Y/OO31R4Xky5A+8PR+KXlGRbxq9bcbQM4NNq51Dt46KCJPJPQ09gDWI9i8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx84tiSAbLGzEueutxCTEHiJ1rWbXEtNRR0bBu9qbYk97Lsv5LC
 C097AXMVWPJv2BXjyb2TuGszs56WioCn8SBXCwLUY3OVm/lEMfsgWDwG
X-Gm-Gg: AZuq6aI/EPQyGmYh3+tNeQEMnyNRskKqKQTiw0r04y9aZUVu8MTk65DQhjYwMo+0Hpx
 /TYjI+KTLwi8QsA0bmc3rLGu5DUNXgLBwQdliHXdIdaoTnebPESuCYGh4K7wc2ESx/4gOVQJJvm
 JjkM2ymUA6PONOYqN3JedFHuExkyF8EpKuiCXsj74sAp9BuZ9oyEmRp/wTYeI8HOdQH/0+YRnTd
 EieqgqyBet9g2Fxa+hsAh9a6VyrT6oXaDa8UfGgMqSDAkO0nlAVzfvCMll3xpUxpIjk8XFwTnIJ
 Q2bQOL2IJ6UkfLhkrHlGJc2JVnCpCEn8IrtL8wD1sqsDVL/vnyFhEjJEwmiXp3ZIP1f7Anq2Kar
 6LJRfdbZxn5QvYkvy3LRRX+1ttR1Gedf/W34dPDJYmzc28T0DsUs0fywHx1QQqtYr5seTi0eR9F
 Fg5eEAWtfO7kaQvAu6VZOdGJROxs4qqcJACEVSdUBN5nXW9sbcTiqKTtxemgA/sc+09dmboMHbX
 aHR+Fk/5UnMchQ=
X-Received: by 2002:a17:907:2da6:b0:b8d:fc50:c2f0 with SMTP id
 a640c23a62f3a-b8facc5a3aamr377443266b.2.1771260340409; 
 Mon, 16 Feb 2026 08:45:40 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:40 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 16/27] drm/amd/display: Build HDMI vsif in correct slot
Date: Mon, 16 Feb 2026 17:45:05 +0100
Message-ID: <20260216164516.36803-17-tomasz.pakula.oficjalny@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D75E6146572
X-Rspamd-Action: no action

[Why]
HDMI vsif was assigned to vsp_infopacket (FreeSync) field

[How]
Build HDMI vsif in the correct hfvsif_infopacket field

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 991e2262ecbc..288437ada2a5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7391,7 +7391,7 @@ create_stream_for_sink(struct drm_connector *connector,
 	update_stream_signal(stream, sink);
 
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		mod_build_hf_vsif_infopacket(stream, &stream->vsp_infopacket);
+		mod_build_hf_vsif_infopacket(stream, &stream->hfvsif_infopacket);
 
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST ||
-- 
2.53.0

