Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJJDNh6MeGmqqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5592321
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9381B10E500;
	Tue, 27 Jan 2026 09:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rft4o2T1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E6910E4F7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:57:44 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-48049955f7fso47014115e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 01:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769507863; x=1770112663; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3u70wj8BZadIrCLL0DylfNahosVjS1bY9wyGCplcMZQ=;
 b=Rft4o2T1+p9eqHfHEro0bun+dZN6Ztt/NXv3De6JJHskbvUOABIPB3CiqC8qGOTiMK
 FXf1SaBQ2toEvIB3PtgJcoOupXfXXBP2Xm3SuYd/Bdw/Bib/WcubtS2bpQwGcXbyKtGj
 YgrgaR4bGPktQiKbQH66/X3Wpk9u/728F8nrPkXRE5+lZgXMAu7NebpNeMSSKusUsyKr
 BIT28ypSerFuBGHLZ6RX559a/Jy917+p61HD+KWTG2+iDOYZ5J65ayJxTBfjCvKTnIm1
 yvvXJqZL19L3287V8E+g4cDvXoAUqbtEdkLIA5Z6I7TJjfxMobOGJj0FUF8PKUKQegmO
 nXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769507863; x=1770112663;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3u70wj8BZadIrCLL0DylfNahosVjS1bY9wyGCplcMZQ=;
 b=dzvBej+2UOi/DqC0gogTQk2eV80/wHjVO/0PMUic9CWzBH0wlnkS2M4HG8j3+YeYU1
 Ykk1zp1zTh71BbFyr0904cMT2zmBei4UWwapEJEi2xCX+kdM7qd6U6FKhUCL12R1LH8Z
 TUT1qp6CQMR4O1f8V9STlO2PFf8GDL0Ta/Q98/BoPPDUxBGuuBFrBOBCpYSd43vTyhTj
 ucaH2JRWqHeNf/WxrL3m+ze9547EJ3mw7k6f+/UtNHK7mX4WHq4zfIl3AUapJhrabo0K
 Mrqho4RtJVPaDh4ptX7HH3N9Cv8tkHik3wB3xsJVDgmzsJ4DNI2Tr4FZVLW1mOrYxtKC
 zZfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAb1ozKBvmhOfBcYIHDAfuCuFKzOEzMSIQqMJbl06ya9Gx1AE9gWHp6n/Oa530/UC6aL4Vv/et8xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybFNe8dbf8ohdFTycVuRf74wz769h7z2uzR7yWRlA8KpQiwLQI
 s9MmTkGusMjxJ1Wmam3flM8VB0pd91M8GxGZoUuwphRGjMjEUvKKVbjCeAU3yfBjAEo=
X-Gm-Gg: AZuq6aJcdFSxwTkUjXsjuhRZRpRSJOystAwccsFJj62/0bsykXXiCaGKjxJxxKMUut/
 ZzpujC2IPzJsg5rGfHZmIrzvDkHn8S/orsymBCbYntf/tgXa0LkqMuiAqVWMa9eMbntVPKKAgrP
 M9gOfd+SZl2l26bCO3dnfa4M7rsY04Yc44XYCVgodoyhKzqNkLNqb15/gAef7VGsw5skIbaTEuK
 P04zdbetRfPVZYN2vR1OQcQ5CxM9FIRsBk/wtoaOuZGPBCHsCjaCJ1wojAQhgTYsJ2uZk41xddF
 tBgQVL07uzsBBMaOjNHuQcph2LcoFVTD1g2sCeAlH2GgK7N/fwT+qUeEo4Uhys1qvK+3m6hqELf
 5IOdnMMuvsD6p4qIsSP3wtY7iG13Ng9uKpuZbMw/DWdUbDkPaoe3sjRNHpR8NFuG1mT4ifGd54l
 Fc8nrlcAUUa/6bZDeiVhys5pAEIpGoxMg=
X-Received: by 2002:a05:600c:4e15:b0:480:1e9e:f9c with SMTP id
 5b1f17b1804b1-48069c0e620mr16149515e9.10.1769507863045; 
 Tue, 27 Jan 2026 01:57:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 01:57:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:28 +0100
Subject: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2Ns+pMZa86LvrQfFtn8cdEtEqL3ywsq0lxHQPfJxOM4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwRkyAEHvuBwSj5jjPxvqdbtCoWiO6EneNxoN91
 55+erNGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEQAKCRB33NvayMhJ0fXCD/
 9kHeCaLqrPOrHsr8zRdoWZqqn6NsSYv1iH1ngKtU4xGPjeBMpPOv8BLxizH7VfWoCam9doS72L/gEQ
 TH6Sgs/ga90z3X4x0r1rCQPNMgPN00fYG24WkTjrKwPk/fsdLG5E6XzFrkT2aTAGvnRk3RYF6AVRJd
 obDwumygk61So6Y88MevHwXmosnbl964AmGhZwswMc2Jy6sFEPb1LsAM54SEdLIlnzG/0//5HTlvCs
 srMDrTmh4K7xxYEbLH0l97qRHYQ8XfGTpxr9QUG7E8ukPpK8oXZtPf3PVL8nUPPiC/cHYHLKMNdrU0
 QtlcKyiK25Db0yMFiwgQKVD/3jpHjZm8ecTOfMO6sCHG8U+HiTBYnyXYvjGLKPffGuKRKIaohB2udx
 3lev6ud9LG+nIMCIWaCEVfZd3KFDuebXssMYyMDty5vsaw9fWsP9MOMpcBkYdk5dfWDCEvW9WljSql
 DAxiJZrxDsSU4URwupdIX7WiCwVboCRr8YOJwRRf+vN/8J+nQYTpZ5yV5X0NgWzf2EiofXGLVlLiMV
 M4csdWIy6kPP+EyG7s7/QQEd9eJf7WP+I9eWgpAejbY6e7oi92cpoTyT76z/f/6PB9OuT2Onyf7znl
 8ry1Diq/B2DGLc24T9faUmz4goCJB1xWBvDM9Yr8VhmuO+PqsVGTDm3X2EjA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,linaro.org:email,linaro.org:dkim,linaro.org:mid,0.0.0.0:email]
X-Rspamd-Queue-Id: 86A5592321
X-Rspamd-Action: no action

Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
which connects over PCIe and requires specific power supplies to
start up.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/usb/renesas,upd720201-pci.yaml        | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
new file mode 100644
index 000000000000..df3cdcf44747
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
+  The UPD720202 up to two downstream ports, while UPD720201 supports up to
+  four downstream USB 3.0 rev1.0 ports.
+
+properties:
+  compatible:
+    const: pci1912,0014
+
+  reg:
+    maxItems: 1
+
+  avdd33-supply:
+    description: +3.3 V power supply for analog circuit
+
+  vdd10-supply:
+    description: +1.05 V power supply
+
+  vdd33-supply:
+    description: +3.3 V power supply
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie@0 {
+        reg = <0x0 0x1000>;
+        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+
+        usb@0 {
+            compatible = "pci1912,0014";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+        };
+    };

-- 
2.34.1

