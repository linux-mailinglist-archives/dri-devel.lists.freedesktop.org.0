Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EetEurqm2km9gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 06:51:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D340C171F02
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 06:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD20910E237;
	Mon, 23 Feb 2026 05:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aVQfnQXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4114E10E237
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 05:51:31 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-5033387c80aso66226681cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 21:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771825890; x=1772430690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNC2r/k4VYyNvAPrupzATpkdJnOwaq0ecIMgKhToJ2I=;
 b=aVQfnQXyRGIRKbTJrS1KIM4eW/BssIX2cYBTCJD1AIG2qEuHgn3zHCeOT1fkwzmR8q
 QZ5aGdB9KCNtLQUZzBMn/H51eDMBNTdNW8PBea4jpO/1dOHPQ/lPCp7z1Z5lB1z1MG2z
 +Mt1xHbtDgEP03f4z3wWoSU+N0RPet6t+bOT6COgf/aax5aX7PucYVAy5mLQpmUW66Ib
 w4pOKrRX79WbGI4G789SbcMZ5LUC2ktrCmXZHCrwO8lsKraw3vv4o+fyuDXJG8+g2i1t
 2DoHfv8Vu5X4l0+hmKVHWY2CM0RQS2k3JEM3oJ7RISzSH3cBHKHJxZ2gyIPklBIFSxkK
 TPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771825890; x=1772430690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oNC2r/k4VYyNvAPrupzATpkdJnOwaq0ecIMgKhToJ2I=;
 b=wPzM7NqrzMsXl/fPTRlfu+TpM1J3JfRrQ5g9j+u9B+FWLVJCdmbVmWVJ8K4p1WNbWF
 PKmRnZLNhfoexQU6yEPDX+DfUwsYWUkegFwUzXaeke2FCEw7hHPORHDpIP+TvDEd1CZT
 sl7kWaGwjOL3LzOeQQc5qsAnc0BBlZwzHbzk8KZ12r6wlJ3MK9jsLx4qgt/9xbGZkMpt
 7blD1A2idxWQeuxBipeV9Dxs227K6Ozzu9UyUS/SrfXa2ff50VyD659p2L6vfE7aJHnD
 VccV6qYtb8jf4GUKW660ImAQPD7SQ6B5GGhQ16Bvca0F5ymTAdSAeE0lqaNhxcjiAmNt
 +BRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR9cjn5C8HiyCjIwAVEJdMJ/pOq2eq8/UHp3jfJ459e4orNDAKb/871blblbPb8lrPt+4FD3ULP1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/7RQdfMvTtyuLoJ4aVwN92+qXhhMJOO29notZkYzHQ7vq1CDo
 LU3PqzPFIgk0o1d/707mt0NvmkqIBVKOMzaYRXKqu4N5WiH3fgxJ5V6k
X-Gm-Gg: AZuq6aIn2fhH2GJHvkij32mlF48nIHJ/gOr19jXzktwALpQDm8a9GTbiHnvzs1FDEeq
 uCJ/ZqnYbSloJzKQyQUpJH6lbrr8vtZhuiKu6JItooDugfNDLwfXC/Ecd992DHGPJpnZ8k9dTNu
 Vl3lvW6xzUgXm5zwob74IB7iqKcMWNTaWx+DCGwz0lU9Ebo038KHKgjMmpKj2G2KF/vcA3nvCno
 kdv8LeUz0pF578nLHms88WylLVGGUgOePL2X5oTCvnZmXXYZniIvK5herYodidovbcBL6rK971F
 OhsoMqYobStXYTSOU0tn3Hxk6HgFVSPIyCHAopVwjeFrQm/aZiJAiMomvVc0uQfGCi8nVDWZNwl
 dKAMNktdQKQpxwVTXfoewPaOh3uREywb+TcU0Pvaa4HVcc9WRM5igBBGUrFsKn7+82/+xxjSGF7
 g2OdAGjCJhNlfTHEtOdMgkFScz076DY/mNBZs3jY+ItfEqq5qbo65yAaK0VnKi6EwbqEXGJ1cev
 0++1Mf0oVI=
X-Received: by 2002:a05:622a:120d:b0:502:ec9e:ded6 with SMTP id
 d75a77b69052e-506f317f931mr169944791cf.38.1771825890175; 
 Sun, 22 Feb 2026 21:51:30 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8997e62f453sm59459096d6.36.2026.02.22.21.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 21:51:29 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de,
 andrzej.hajda@intel.com, bavishimithil@gmail.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 6/8] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0 and
 10.1
Date: Mon, 23 Feb 2026 00:51:11 -0500
Message-ID: <20260223055113.1288-7-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223055113.1288-1-bavishimithil@gmail.com>
References: <20260223055113.1288-1-bavishimithil@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D340C171F02
X-Rspamd-Action: no action

Add samsung-espresso7 codename for the 7 inch variant
Add samsung-espresso10 codename for the 10 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 14f1b9d8f..f694dcbf2 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -144,6 +144,8 @@ properties:
               - motorola,droid-bionic   # Motorola Droid Bionic XT875
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
+              - samsung,espresso7
+              - samsung,espresso10
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.43.0

