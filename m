Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLDbLMUgnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:41:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE117411E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3C910E2CD;
	Mon, 23 Feb 2026 09:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i/YNVvpl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D30C10E038
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 02:52:19 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8cb40149037so431338085a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 18:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771815138; x=1772419938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uW2bmrIf7wU/GXSosfCOnygemq0h5S29C3M+QhYhtC0=;
 b=i/YNVvplLtMBW0Qy7zftJJV6eDn77CPoiEonZuH/tGPFaLcRutME26c644ourf0bQf
 SCHvTbBTgXqgR+8zc+ZtmMiJxq9wRikiLw1Sz41tyD0K2jGqovFiGtPe+Ou8IUrA34Mi
 AdTv/L506nDgqOtqSQ4sxHQ4erg/vFav7SdKhYkHhNWsUsTTysIvlhQmfNg/BMX8WeP/
 a5v4sSwsreKfVyvF0kztyLouRaob8rMPNsLzAXuJAwiyOxEO1fYcqiCjvqUhwdAmYD4q
 kXIom8lmKh4JwkPbHga8b/PiBDNBkL7T/iA7N4e5m7dNAaOOC/t1yCAelvVxj5njbtCg
 dplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771815138; x=1772419938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uW2bmrIf7wU/GXSosfCOnygemq0h5S29C3M+QhYhtC0=;
 b=hsiu/h5xrQ5ilI5qzuQ4n5szSKY5cIjY3LUTvqojiyOdiFQQqXyu6q4aSL/sViNdyM
 tfKafKqRhfpioHHvpMcN+bYvfLgXVhlU6S2RT8m/mAvhMOupzzahMA9QpBXc+gBdqVEL
 JCu0H9l/wDgVG0VgL4VqHjVxSmzlb+FWvAPgnA3CrReiT6QMTy7lz6sM056kDpvbJGD4
 SfhDXHf77IvFqeJEPopC4Ji9nQEU42cYVRwxKs20UmqH77XLAnv6NCjWjHzfPAhELGeV
 bhJNVzgHyi/aJXM2sJnErApe1iQ9JbXJkn3nFM4CWxCcdeEN0Onvmd/fkfaqlUcX2DOM
 XH+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWMF2KhZHVM9nuiMfelABhKgrE3Y5M76jT5sCpVlVG1hUi13T1AMPtmii186bLy4sjiPHvtbmTdQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypmoRXI1LV5s342Wm1Q/wIyFkgBr+fdSsWEVuwqLqTqOIJ6DEF
 Gwiw2/kaEPRAWXE7Yh6tONVcycZO+WnC2vdbOQbUO8vsdA9iovrxByw5
X-Gm-Gg: AZuq6aIoC2w+08Tloj3cbWq0m3wdszy/78qbyCKlmsLFPxeZg0Rw5txf57ziKVyyKU+
 ayVAhzJw0/bn+vVlz9boAXFXs8QNiX5SmAus1t4slXoHmIyU+J41A5fmDvWAQ+UQdGjddJg96X4
 +tsliFz6WNiyOAtzv+8m4zfhcfwUkbl4OpgDvwLtq8LRQ60Xz4YX7L1MQQE9NGh4Okx33sKd774
 DoUsepMfBfFlVvjavj8++iSzdI2qsZ50StZHhzd4vlhMTjhXuf+zluHZVQHkfjXjdC84eHsrqE2
 mL9uEIwTBIxEQQzDVfjVLuATkkch2zPRHmLdovrSBckggTq2rQvHDmzx+dhRDRrwtoRDljgOirK
 +JaG8XShkslMrXjm9wogIOgY5GfLLa+vpg8gWPNdVaAN5Q4ehd+PkCxdFHzluht4lfbd1Ic5hPg
 nvwMKWPTAhnxxWI3sYaMRLfnMmlty6be9EdNWMNz/cjzJURjJnnjBYkheG7ClixzuO5Rz31e6GU
 U83bQCfurRxeRbIQN92Bh5vXU+8
X-Received: by 2002:a05:620a:bd6:b0:8ca:3e78:ef79 with SMTP id
 af79cd13be357-8cb8ca93037mr774653085a.77.1771815138182; 
 Sun, 22 Feb 2026 18:52:18 -0800 (PST)
Received: from fedora.phub.net.cable.rogers.com ([2607:fea8:2bde:a00::3345])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb8d06f422sm610608285a.20.2026.02.22.18.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 18:52:16 -0800 (PST)
From: Hayden Heins <hayden.heins@gmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Hayden Heins <hayden.heins@gmail.com>
Subject: [PATCH] drm/amd/display: Fix incorrect log message in LTTPR mode
 selection
Date: Sun, 22 Feb 2026 21:51:56 -0500
Message-ID: <20260223025156.27490-1-hayden.heins@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Feb 2026 09:41:15 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:hayden.heins@gmail.com,m:haydenheins@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[haydenheins@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haydenheins@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 65BE117411E
X-Rspamd-Action: no action

The driver was logging that it chose NON_TRANSPARENT mode while actually
returning TRANSPARENT mode in the case where vbios_lttpr_aware is set
but vbios_lttpr_force_non_transparent is not.This upgades the log message
to match what the code is actually doing.

Signed-off-by: Hayden Heins <hayden.heins@gmail.com>
---
 .../amd/display/dc/link/protocols/link_dp_training_8b_10b.c    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c
index 66d0fb1b9..889c81aba 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c
@@ -166,7 +166,8 @@ enum lttpr_mode dp_decide_8b_10b_lttpr_mode(struct dc_link *link)
 			DC_LOG_DC("chose LTTPR_MODE_NON_TRANSPARENT due to VBIOS DCE_INFO_CAPS_LTTPR_SUPPORT_ENABLE set to 1.\n");
 			return LTTPR_MODE_NON_TRANSPARENT;
 		} else {
-			DC_LOG_DC("chose LTTPR_MODE_NON_TRANSPARENT by default due to VBIOS not set DCE_INFO_CAPS_LTTPR_SUPPORT_ENABLE set to 1.\n");
+			DC_LOG_DC("chose LTTPR_MODE_TRANSPARENT by default due to VBIOS not set "
+				"DCE_INFO_CAPS_LTTPR_SUPPORT_ENABLE set to 1.\n");
 			return LTTPR_MODE_TRANSPARENT;
 		}
 	}
-- 
2.53.0

