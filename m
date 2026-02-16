Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM5QIsBJk2mi3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8D014659A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0A510E3D2;
	Mon, 16 Feb 2026 16:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DWRvg1+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DCF10E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:46 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-65c1d6c2459so156899a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260344; x=1771865144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TM/8v34pas6+agtqG0yBbCtyfKtfnXSHfIXKjiQpv5A=;
 b=DWRvg1+J87lMjpzFlROuynMyfQrM4HL4RNyxayztuphQPtqGCfIKgHyQnLv4fgZ32J
 htRpMVqKFCTK30POxww0gFsNxw3bKE0O8lmdQQ6zKnNc2ODmzXwJUCM7Jl3Iy2HguNSk
 6qV3m/A7P3rw5GlPTO/mA0b3goWZDxAtEOvyuUME783iqWO2zKP2NnqsvzcGtEnh4icR
 8+0Q8HRg2ZdLXTwnzjgLT8M3lGQEGv2JkBt3AzmtiXNds//+jUl7F+YOlx3KhToM3qUK
 ZBbeTe190RlSz5s1gRaP9n2XuNVh+mySB3rkvgAd9Ijlqq53TI0+YBOdbGrc3rAYkjo3
 B0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260344; x=1771865144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TM/8v34pas6+agtqG0yBbCtyfKtfnXSHfIXKjiQpv5A=;
 b=OQrXSQruNapKE+49aF3IsLcExOxqukWPpj+TJ8vdUbIsY0nfAsOH3zUKiNoZHNUEWI
 8BR4nbn9y5Tpmwf9CO4xABt2KzTtMj3gkoTwnVhobj2DkwiRMbGELJ7xjO2H2KS/u0+N
 0vdB9BgaA+dxnGxDDgN2DR60Bev7mFnYFacoNzTZZ45h29BrXQgJwgsYQtq3KUX5oR05
 5iRzHeQfhx/c3O+CR2UxKW1n9Z8EBvmH+RaUGQPL/8vEHw7NCRLIbHjQlo87mTfZfEPI
 HL0nFxptZbnkYkAjwiU+BLEJCgVV645gTao/f7YGciBga597vgDT4NeE2cTE0GSIo4iY
 jhjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNggmi8vx9P1YnrBpSgeW/+D3/6koosxasEqRFJ0pBa6/y5fJHWV9/fwQhbGqZRBLk4dBA8o9sXK0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+Hzlm0HBi7TrnDbKnrQ9apOJtpBRS85vMod6dGgjNJFwMzFPx
 cz8ODayHkLDNvMvOkYP3DbygBPLYKNJHW+UT+EMK/RSl7lI6xElpTm4Y
X-Gm-Gg: AZuq6aLMr1IoKSzzYs82m5EVMRhS811OXyEUvJA125g8KpclLsRldPibkXJ/ZV/a7wU
 efP4rrJocX5IG32JPMew1hUwBvC9PkbEgJwCx9YqoMP05gDdMgmFbqu1HwNrdc2CUPVL32y4lK0
 9hBSVWh/bu7O+jRaRKik2aRIsztSzDz35Y+oSRVjz953wTUAMlgaavTAY6sanVM6n75GCoyESla
 ERu/pVtB5jHyfmElkhB9VCIXf08GqRyPfFUX9QNrqkvH83Ydu9RfdakpgyR64AJLV+fSTkBe7Dk
 Lo3n5cNW8WxEGaMf+Bw0LAxyLPMeaF3kxJHszZbDvjRESjbibzcxVgvlEycYzxddUQ3XPdAaGKm
 QJqo6YzvFHBvH7EN6+ES2/hUpbNKJj9PIbvBQ/2KWjnordwOTDNe77qst1qc5jmiW+PYUoQB7x4
 WQosiCviUnYggvXXEb4DoObFjFsZpQTndBDhVQwfNBztfWo1ewlkCStHGI5/pZS8OBn+UATcxwP
 Fs/
X-Received: by 2002:a17:906:c108:b0:b8e:9ac2:9e0d with SMTP id
 a640c23a62f3a-b8face3fd6fmr326209466b.8.1771260344450; 
 Mon, 16 Feb 2026 08:45:44 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:44 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 19/27] drm/amd/display: Trigger ALLM if it's available
Date: Mon, 16 Feb 2026 17:45:08 +0100
Message-ID: <20260216164516.36803-20-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Queue-Id: 3C8D014659A
X-Rspamd-Action: no action

[Why]
ALLM automatically puts TVs into low latency modes (gaming modes) which
we basically always want for PC use, be it gaming, or using precise
inputs like mice and keyboards.

[How]
Read the ALLM info from HDMI caps and use it to determine if ALLM should
be indicated in HDMI Forum vsif. Additionally, make sure VIC modes are
translated in case of ALLM active as VIC cannot be used in conjunction
with hf-vsif. I learned this the hard way...

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/modules/info_packet/info_packet.c  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 8e110c86bdd4..53e488fdb4ea 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -541,9 +541,10 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 
 		info_packet->valid = false;
 
-		format = stream->timing.timing_3d_format;
-		if (stream->view_format == VIEW_3D_FORMAT_NONE)
-			format = TIMING_3D_FORMAT_NONE;
+		allm = stream->link->local_sink->edid_caps.allm;
+		format = stream->view_format == VIEW_3D_FORMAT_NONE ?
+			 TIMING_3D_FORMAT_NONE :
+			 stream->timing.timing_3d_format;
 		stereo = format != TIMING_3D_FORMAT_NONE;
 		hdmi_vic_mode = is_hdmi_vic_mode(stream);
 
-- 
2.53.0

