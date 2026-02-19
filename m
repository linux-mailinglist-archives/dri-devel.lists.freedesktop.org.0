Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEK1Ett6l2m6zAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:04:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94D81628A2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AC810E74F;
	Thu, 19 Feb 2026 21:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EWoneLC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A88610E74F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 21:04:23 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8cb3b3e643dso91626485a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 13:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771535062; x=1772139862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=EWoneLC10atKHe3Z4r8cewlvbG50MBANc2BpVjH2vnbtUcRZ/kIoUQ2UuqQWkBuiP7
 ZwiOYnWR5BuMg3X36O0+JSGWxVI5NOF6HSXED8zWEa7alClmOadfV6MdxGB8c+/JeuKR
 ULUJh9S5wf+J7rYqYpyI23CN9pC5OlU7KdjtjXA2ewUMbTdaXd/NLvqf8gJPVQal6lYa
 +Lqlj/hRHg/qXsz0n76TD5x8Fp6sXA1WfWap134MA1ZG1PBLg/iYh5OiGP44HX+3XGt3
 3GDGdUWLSKn6Lg695kiKrFWalr++86jq+R7hMund4VvAvA1xjRRfsFFu1jyCuhbKrss2
 172A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771535062; x=1772139862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=a5UnlLsSK3E3zc4N2TqC+cPL2FKt81SYK7CsGKOn+oNsNQE2/ZMV6WdNalaXzu5Sen
 kFYI8sOwVQCAA5nQ7ImMvnQXe2hHNpHJWoEHxkaV0cd9q/saGS4pHp7c1pb1Ltup/yUG
 Z12y6dpgU3+xtJX+OANWoiepcFj57yXu+bVrfX0kbPrxeoefLdnYRtSzfcDHVvHp1HGB
 RI9RtgUrK3SIrV/Wg+8Nkf7UbmPC4LkdULBNkyCo2/rZ5R2xJqSwSku3gKjA9ssCEW1M
 r/1fSsKQ5Y3xIFKlrPzk7dYYp8UfCICbD6X+aA5Ju46nlMsnzOKFU6A5T9g2KmpHeGnb
 Mxfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk1HFyP6sAV05SeHBJJzdopfZdPk+Hk/BslJUFGnjGTyIntJupuTVvHLBTPN5EYbFsw3Q1uZBkoKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUJDzbXuYnVktOTb2TQpBwUBPG4sY+sRv5qrq+pRvJ+zWSO/hj
 pBsCPqG1Kyk4BgtUu9KnKUB5+/L+SDlrHzWdQwQkVEjSZuNjxmM7MQrK
X-Gm-Gg: AZuq6aLGS0s659fBvkVd2NNM/CGDguQGtbKMeiAbepIJdWxmmgvnLluLuM3+FTcghjo
 a/AM6wYd3zcFwUiRVRd4rZR5/GzKOUxVOWdeyXDHNq+ebVEfWIGYN+YPJYbmVaaeRXcDAl/TGbV
 j//S1GMHnw2WVbi2Os7XuvC8Xky8fXXJEgMP9SOayvQW4s08ygkP/Gl+NHo1+l7jRYGoTJzJtqg
 gHqQWfYSSaaU0rmKV9jnILwbxzM1woPNo+rgpGN+ENcZTr2cRDlDQczGa9XdN+BvlXO3q7VzLS0
 Dl4/9qt0EkB46fjQDexqkmHngJ3fe5lKruHBEobGX2uWK9fWS6WMKyVfYvT2Bp2wh1+NSFNuCz8
 No3XF7nxn90Ya7uKbjKKTxcgsOEiowGRfKJtPSF6dIEZxv2LBEojUsb2R+XiZFm+RytRVwPaowC
 NeA6ts50PDYVDAjBRsoU+Dd4ciTrxgscL9NdtteHytN6ht9Ker7/2WD9Nwu0G/SyANpt0+YBen6
 N6EN909PTg=
X-Received: by 2002:ac8:7d55:0:b0:502:9e5b:2d83 with SMTP id
 d75a77b69052e-506e9264731mr79699451cf.75.1771535062155; 
 Thu, 19 Feb 2026 13:04:22 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-506b275d59fsm153971511cf.32.2026.02.19.13.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 13:04:21 -0800 (PST)
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
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 2/8] dt-bindings: vendor-prefixes: Add Doestek
Date: Thu, 19 Feb 2026 16:04:01 -0500
Message-ID: <20260219210408.5451-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219210408.5451-1-bavishimithil@gmail.com>
References: <20260219210408.5451-1-bavishimithil@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
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
X-Rspamd-Queue-Id: A94D81628A2
X-Rspamd-Action: no action

Add vendor prefix for Doestek Co., Ltd.
Link: http://www.doestek.co.kr/

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2ae..70a195fc6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -437,6 +437,8 @@ patternProperties:
     description: D-Link Corporation
   "^dmo,.*":
     description: Data Modul AG
+  "^doestek,.*":
+    description: Doestek Co., Ltd.
   "^domintech,.*":
     description: Domintech Co., Ltd.
   "^dongwoon,.*":
-- 
2.43.0

