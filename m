Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC6EC40kc2nCsgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 08:34:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D0D71C48
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 08:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EC910E279;
	Fri, 23 Jan 2026 07:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A3cXMtEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B7E10E279
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 07:34:31 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so18856295e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 23:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769153670; x=1769758470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cla95yKUKTBsgVaDvfogIRMWaCGGOWq4z1TFG4Fvu4Q=;
 b=A3cXMtEinY6CWU2UhqShFfZn0e5UAwzt2AaCNV9ayB28/JUp9Gl445NEykV9Sa5kVZ
 qmTNpM4c2zwnuyAiszfRjXFdChav3xSfAmOsq7i8gp3k/yvB5fTcG2v2oJhBrEa3eSoy
 cZ8sk80VlTrUndAXbwc2da7PeccOOw6S9bKWbmY6fZnKAguf2OVMCpydTGstNtv/Bud/
 9XEMfGSjQgUro8JRy8Ync9Y3Og9r6ZrDWFxiHLyuF1AyzL3D/bQBXDSS3OsE6dTb919I
 rVo5hTErEIq8LYMjJl15A4pud5P2nWey0aZvtt2D2h0xHLMR8C3h+6GnWB/GTqYMfjE4
 SE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769153670; x=1769758470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cla95yKUKTBsgVaDvfogIRMWaCGGOWq4z1TFG4Fvu4Q=;
 b=kVXsuqAahmlD5XRFur4+3+pbJWY1MQsXCLtalLIXY/KiICTrRR3obvszLPYw3iArVH
 WsLOj1guG7PgGFLiA1qJvEaoL26XT+dylVvx65PupBuRVJfeYxFYm3NtGfsBLfQ27Du+
 SYvEsLVl1taJFsUEvYU4C/Sxyiekg0NK/D1qdCOul6aFojr6jXQKX8If41SWSjW8iTEg
 MsrjHxQDYnrWL4CUJchjdEhtjLFOcaJCEWL4ghQ/tfZFJJG1r86P55PL/vyq1E9J5BDC
 OQfu+AJNzsgTTbgrNrT8KYCkH3M7jJIhrPhfnGa6KwQwTQaosDRQUDKIovIQlaHFhwrB
 31+w==
X-Gm-Message-State: AOJu0YzHhzeIza3x22Br+wTZ92ydw22Ttj+9WOn9Tqxh6ly0zvhTVnOM
 hhqMU9CLNxEbLVSofFBEMQRWC1PlIe7FOgxWhh3NYwPbK+vv3im9bv0D
X-Gm-Gg: AZuq6aJ+ITctM9F7BNMyUZlB1SJkMptWhCejyY5ObQA1pxyxZW0h9cGmtxeTzbIF2ns
 KKZfiJ5CExpHc58QvyEIDzcUZY7ZgQMJY5DrYLWIX0WpMj7WP6s7p4WJirY3qvJZBdnrdLID5L2
 iy+i/EWPLnCr9kAET2ysu1AhPLAFTialHP0yxLAnrCgFjGAdxLCO1mD8pHzBXA+EK10eQyIOG8j
 d5FS+UC7u9lwdGsj8nM0oHtXj/mcHhoAzpPzPni80frD15nzeICMV23bAwFRpfO+W5EMbmYPvEe
 beXU2DmCMbpthvURzlmxaqjXkvd7GBDct5yO0kqihVKbyuDDhrNbRbOgR1m+eiAUC+1OMrgidA8
 nprzH3thUKaotDokFKWr13YeJPnWSllbABLq9Tjg6P5SV6UmAashR90kiyy2N7dnyvrx/JSwj3S
 yk
X-Received: by 2002:a05:600c:46c9:b0:46e:2815:8568 with SMTP id
 5b1f17b1804b1-4804d2ebaf7mr32299855e9.10.1769153670241; 
 Thu, 22 Jan 2026 23:34:30 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d627871sm15890265e9.6.2026.01.22.23.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 23:34:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] dt-bindings: display: bridge: ssd2825: inherit
 dsi-controller properties
Date: Fri, 23 Jan 2026 09:34:09 +0200
Message-ID: <20260123073411.7736-1-clamor95@gmail.com>
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 96D0D71C48
X-Rspamd-Action: no action

SSD2825 being RGB-DSI bridge should inherit dsi-controller properties same
way other DSI controllers and DSI bridges do.

Svyatoslav Ryhel (1):
  dt-bindings: display: bridge: ssd2825: inherit dsi-controller
    properties

 .../devicetree/bindings/display/bridge/solomon,ssd2825.yaml    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.51.0

