Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHQaIi//imnJPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:49:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C1119199
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B561310E529;
	Tue, 10 Feb 2026 09:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WMEyudNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B033510E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:49:29 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id
 38308e7fff4ca-385b5174f54so4999111fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770716968; x=1771321768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MMvCNjWR7MERKti0fKDG3wrcg24MnDacQ8c/Hcdig+U=;
 b=WMEyudNGhB4sZglnEIk1CTmPGQKBe+y3uBQ5xDm3RaTCxbyAQCs/X8s4mIvdRbN9dx
 GwdJ+g9wrxqsGxtoOnjwcNJKd8jhHTnq66B1zFJsxDclw8CQGoK6KUj1646xo8KMZpIR
 yBS4mNSh5ApT/KcYk+ZF9HDQBUOQwSKUTbLYb25m8UScGRAhufuVvBgpR+f2PwdOetpM
 ih6yd1BD0YzSgrPnbkPkcN/hxtNumNXExBn4+7uH1wnpdv7epADlvKYQqfXWnu5xrXJa
 4lQOlOmxVw4M885TKbFC8uW3mOgldoMQadLoo+ulT0BWC7Sso/SB5CfTIkillW1pjEp/
 XvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770716968; x=1771321768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MMvCNjWR7MERKti0fKDG3wrcg24MnDacQ8c/Hcdig+U=;
 b=QrjSjEpUdqBH89yIdOV6G+ly6/bOyAdHWg52uhS0SSRmIml9379+2r4A0qgZywO9RF
 FencIXWEVkpTfaSaS2/3ji1WQohMUBt+WkRH25U5lZatlAso3lFzGdYXAgSLVIjbd5iv
 W54Zu6/r/rItXMurVVlutnODzsxstBlIB2ey45suoz7M092VMMJgnQ/prBKnYoIfyopi
 PU05TUlvWOL5g3mlU6Fci0TTo+lxqaORp+2FtCU1xvAIDpuj+XL4HkpkAtf8G/qHndDS
 oCXOEM4+I3O1Sh0HcmoRjPEpdLE+jLALPjMG/Yi3betrqDf35hTXrXjYIhX18gImE7RA
 Q6yw==
X-Gm-Message-State: AOJu0Yyj5FK8w5K/CsLT0pPcey2vQNmLe8R3glEPyvk/cIEaazFP3H+9
 ogitGyo3LWqxf9cBBmNhypc42jbdeO9hUzxFeMKtVhnm/qDsCZNxD/QI
X-Gm-Gg: AZuq6aJh+UZ6xFajECPR0UDEEtIRExD5QtK/tPI08aracmc0JkN+Vdch+ixHiWJr1jU
 0bPdXVGT4kpttwihqRL98HbLA6LD0Opz1CaTav9aTRgYzIxW4ROqVMp3kCae8ahc9cQ6vDaA0ks
 7PYC8ZSpFGoGskTWuBi6EAlUqbSzfP9oRolvZNYDZqT8Sk0nIaAhKCDeK/8GBQ2B1g/mD2RrPTj
 jXF43zAZhrgpHRfHJZlO6Gn1rRvXahrctM0yyKIrymgl3SKUw83uUJM0mPuy+VuJ+6AThQz4/oX
 SLKAmRXReq/x/jGdWjQAdMHix3nBAvyKQty3JRyooQUQI35DB2GyMm8Vw6iVJH0x5vPBnjw8rm5
 dfEE13M/VoCGH2q9oyRJVTufUMuZ2oTXuDMDmt0wikN6dSkgOSwILc4ZCjU0MZYieU1x+n4Nv8Y
 /etZCIUkhZY6aM
X-Received: by 2002:a05:6512:4010:b0:59e:3e8f:ccc3 with SMTP id
 2adb3069b0e04-59e45153338mr4748050e87.32.1770716967558; 
 Tue, 10 Feb 2026 01:49:27 -0800 (PST)
Received: from xeon ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e44e231d5sm3191691e87.81.2026.02.10.01.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 01:49:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: display: tegra: document Tegra20 HDMI port
Date: Tue, 10 Feb 2026 11:49:07 +0200
Message-ID: <20260210094908.14276-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210094908.14276-1-clamor95@gmail.com>
References: <20260210094908.14276-1-clamor95@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 385C1119199
X-Rspamd-Action: no action

Tegra HDMI can be modeled using an OF graph. Reflect this in the bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
index f77197e4869f..f33b700bf0ee 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
@@ -82,6 +82,10 @@ properties:
     description: phandle of a display panel
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: connection to controller receiving HDMI signals
+    $ref: /schemas/graph.yaml#/properties/port
+
   "#sound-dai-cells":
     const: 0
 
@@ -97,8 +101,13 @@ required:
   - reset-names
   - pll-supply
   - vdd-supply
-  - nvidia,ddc-i2c-bus
-  - nvidia,hpd-gpio
+
+anyOf:
+  - required:
+    - nvidia,ddc-i2c-bus
+    - nvidia,hpd-gpio
+  - required:
+    - port
 
 examples:
   - |
-- 
2.51.0

