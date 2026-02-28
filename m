Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDBpNE/5omn18QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:18:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799EC1C3802
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CF510E2B9;
	Sat, 28 Feb 2026 14:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hoNiSyjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3262910E2B9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:18:52 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2ad4d639db3so14422545ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772288332; x=1772893132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
 b=hoNiSyjy741dpJ7mIrxD2fT+STuyryi97qfcThBTmse25U07ZysSnAy08Y767T79pT
 fgRohpY101FEw4f8rYllboGcXS8F6kLdKlUK2QkJ1zMYitj2vqLBlZ7RFu7R/36D/W8O
 1rJELaBdpNBfEKOIutHzw5RSkW1Ht6N6lKasv/4nUS76xYFdVkacEuRWQn5KyRL0+I+V
 k6u+ijrQ/XzD0H3btpoVRmBYnUZA6EkGxbeSAs248c8cc2i79irBA/8O9i3yj22rzfo3
 O3BFdADgZG+/cMujepEIcRFKQ+bH6Zgtd5YXebnVXmZad6jYLt1HxJzSgiNVap9WzhII
 +xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772288332; x=1772893132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
 b=kjcjgZ5KWk7uYnbSDHCepzyuB7LoxCIxIoOR0Q1qJFL0pfranNF/2cO6KuSrB3Od/R
 DllFAmy/jACSp0NKpFtUgsAGur1yT0Z3J3JKHvKNfWHqJOz0O9f6+Oru/S930r8s+XnL
 6CSXH6vd6XiDCUdfbLPkCwMBEKIYjagSB1jqmlyUb/BnOyKcJcI6d3KcFNDDPUkSH4e+
 0m0lNP+Dc2A9JUIC4Ze4MJ00YKegxL7DevBPqVpvBXN5OwhbkLbNPGWq3HxyBWwesHGq
 6F+QgvvqwHThFi/80MbdwjUNmZt5X08dTJ39ajdS/SV7r/ZwPfT2YCRMpqxsr5HmjgSG
 4lYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7nehnWPIqhd3gW6ftyOuWNtwQ6hQSBxcfz5BFUyAmgkEyAJk4zmAXcV2aS8GLYCzVftGPLblonSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQvhNG+PJZHjrMA3H0ZN0x+gGcRt0QhMN37iKfLtZjB4py7+oF
 YNl5GbAYEi2zEG9B1KWe3LOmsyxXFzpJD9yBbKKMuXmIyeGoZF8qP8mD
X-Gm-Gg: ATEYQzya33hmEe2VvjCLh2qOD0P2dKobEdBo24C+Nw0WJKz6JIKLVb/QvIOofCtC6iC
 1X5OAJAGN/vFxB1rp9xj/SbTHZI5/Rn+uDtc6OXxw8BfEExUHZH0hW/d/3L1fWZpaqOent7jVJI
 iBSB42/qA9Q3IfcFJRxeycuMjlNaeJad8wwCpXN1d7u1kwvHJilToNNCVo078qYd5hgB3T5DH5K
 mXjKGNCyNG9pwc6HTukVxsxjyVSx1G723n6Yqrd5dINGgVifn8Oqz+I8nKndvwwSN1Mt/PLdWJG
 exsda34SQReuaPdyInEabcDI5Hb8R6mPwYMEQKxyz7dlAkUzcd8e/mo8gwsmi0p1JMm05guyyDp
 BdpB0y3dy00TrcquIlEBREJMKlckCx10MjFxnpXe3FGZQeqjivx5q1ry9Eqx12JH5po4jEKDtoE
 Nd25S24jaa+LT3eOQjD4JiaTtSc1F1JD0=
X-Received: by 2002:a17:903:2f8c:b0:2aa:e570:6e6d with SMTP id
 d9443c01a7336-2ae2e4bcceemr62639155ad.40.1772288331616; 
 Sat, 28 Feb 2026 06:18:51 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae3d1b2c5esm18697235ad.6.2026.02.28.06.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 06:18:51 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
 White Lewis <liu224806@gmail.com>, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 3/4] dt-bindings: display: msm: Document DSI controller and
 DSI PHY on SC8280XP
Date: Sat, 28 Feb 2026 22:17:14 +0800
Message-ID: <20260228141715.35307-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228141715.35307-1-mitltlatltl@gmail.com>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.1:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.4:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 799EC1C3802
X-Rspamd-Action: no action

Document DSI controller and DSI phy on SC8280XP platform.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../display/msm/qcom,sc8280xp-mdss.yaml       | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
index af79406e1..a710cc84e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
@@ -50,6 +50,22 @@ patternProperties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sc8280xp-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sc8280xp-dsi-phy-5nm
+
 unevaluatedProperties: false
 
 examples:
@@ -129,6 +145,20 @@ examples:
                     };
                 };
 
+                port@1 {
+                    reg = <1>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi0_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi1_in>;
+                    };
+                };
+
                 port@4 {
                     reg = <4>;
                     endpoint {
-- 
2.53.0

