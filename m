Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIJCIvN0eGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D693691018
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D8210E4D9;
	Tue, 27 Jan 2026 08:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PwvlOnJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CED10E105
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:59:22 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-34e730f5fefso2871276a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 00:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769417962; x=1770022762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=15BA5riHYfgjJikydQ+3AqLkz5CGwlAFj0WC+7ODSWs=;
 b=PwvlOnJQUJaZsuD2RPxEry1dGO9CGVM6rwLqNO4ukcpNdUo7BKBRgro/MU3KhBObBP
 syqQAe2ite0V8Qd6GOxx29KXemxnJtOKrElrFqT/lQtYqvVGk7MFO6ZeT7WdiuN0n1th
 Ky2e3O75foRku02s1oYFIbitXOUvxAiymMI+kJwgTsPk7YJa9lwCxlo/y9ERzfdZPMq0
 Ry4g6UpxWEXCWgw6lbqfFNmHfVb8jYt6Q0/rOr8hMbZ+lOuAIgjK0Tt6VurJ9kjWHkID
 SPPoc79F+1lG20qvcSOyMML78rMitriiceKX00U+85Lrve0yE/waAdZDCNxvy2Wp1LTT
 gKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769417962; x=1770022762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=15BA5riHYfgjJikydQ+3AqLkz5CGwlAFj0WC+7ODSWs=;
 b=uXoBP3NEc+CpRojh0t23XMpjoqrFflja3RV9A+yuRSbdDHAzvIwJtk1xtoAEtpx1Ne
 E5KnphCgq7ijOSrxsJWxRY8yAH5fKYIOc72ylor9ggg9MCmJu9HtEcaONYJK74foIj47
 /FID71J7Pjv5p4ix8b174ND9YE3nzgZafa+krELIXSI2VZQ24ncbquInSr3hvMoVK2sB
 WtQUC/XQV8NM5M4rCmizFff5D3Jv61zivAHJuMHHeVCvGbfFizshgwU/VW7KpLO876cI
 9WKdDQWco4v6qHgwhN+XHbG9L3DE4djEq3CN78FzADZJMi08Sr58qgj092z1nuJFPaM7
 7xmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUykSPIfHX5NHASn1GJA9c8v89XEw5lnPcjJEb1IZPrlbhRNe6NcILx7pRO4JfBT8GqXM/ELzCwnYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFmmfoMtacDc6BLsuOAjmmGuPn7nBbRkPUD0SIV4T0PcslRc/4
 t/otp3ql3RhUTcOvnadGzF6bByJxpG+BiMdRDIKu7uYEQfmj6GRXSJxO
X-Gm-Gg: AZuq6aJ826mx+9FZgJO65OGnhB1DMOpKuFgeXCb+x/MleYF10MJ+NE/3nlzCEgOfq3F
 Ea9jbHdoueaAbxNpNkjSlXKqO6hvljTy+ZRKKy/nHBJ8g3CjqoofoFNf6vUUp0fWNp2xguDFZXX
 UBFSq2LT3Q4AzWA7KLUQ99ePYERH16Vx8tEWCTsQtpwDMO/OlrOKGlIRvGgOWKiUpABQTV8wYgg
 vXhLgHqpX00j+NSyn5jzidFWAi5bdSbzS092QN0lY29ZrZrZLgE/4cj9VI2rgZcBORJvVoQDnzN
 zCwuDRgY9Cs+KSXvnAgsetExjBBDKxnl/TkfG3lsBvSIsZnQLIImG021YreKHfFfzqcTr6FHgqn
 oOSPfGYSdGei6Q/pgnT5VmLdwykaBTiro5M53xTNBD+2VSNISKhijFZ8i8iJmBtMfoAgFrhZd9s
 0jTgONSiG6thbZt/nRq90SsiJTHxInJ5LbywKn/MHgcyfpj0V1vpE/3j80ybKpk7LeP8ldJ8A5
X-Received: by 2002:a17:90b:248e:b0:34c:cb3c:f536 with SMTP id
 98e67ed59e1d1-353c41d1ec5mr2498102a91.36.1769417962171; 
 Mon, 26 Jan 2026 00:59:22 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536dc3e0ecsm8251798a91.10.2026.01.26.00.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 00:59:21 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: nuvoton: ma35d1: add display controller
 support
Date: Mon, 26 Jan 2026 16:57:26 +0800
Message-ID: <20260126085727.2568958-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126085727.2568958-1-a0987203069@gmail.com>
References: <20260126085727.2568958-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Jan 2026 08:18:47 +0000
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:a0987203069@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nuvoton.com,gmail.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,2.102.81.160:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,2.111.199.128:email]
X-Rspamd-Queue-Id: D693691018
X-Rspamd-Action: no action

Enable the Display Control Unit (DCU) for the Nuvoton MA35D1 SoC.

This patch adds the DCU node to the SoC dtsi and enables it on
the MA35D1 SOM board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 42 +++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 26 ++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..406dd7998324 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -98,6 +98,42 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	dcu {
+		pinctrl_display: display-pins {
+			nuvoton,pins =
+					   <6 8 6>,  /* VSYNC */
+					   <6 9 6>,  /* HSYNC */
+					   <6 10 6>, /* CLK */
+					   <10 4 6>, /* DE */
+					   <8 8 6>,  /* D0 - D23 */
+					   <8 9 6>,
+					   <8 10 6>,
+					   <8 11 6>,
+					   <8 12 6>,
+					   <8 13 6>,
+					   <8 14 6>,
+					   <8 15 6>,
+					   <7 0 6>,
+					   <7 1 6>,
+					   <7 2 6>,
+					   <7 3 6>,
+					   <7 4 6>,
+					   <7 5 6>,
+					   <7 6 6>,
+					   <7 7 6>,
+					   <2 12 6>,
+					   <2 13 6>,
+					   <2 14 6>,
+					   <2 15 6>,
+					   <7 12 6>,
+					   <7 13 6>,
+					   <7 14 6>,
+					   <7 15 6>;
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -129,3 +165,9 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&display {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_display>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7293b5eff046 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,31 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		panel: panel {
+			compatible = "panel-dpi";
+
+			port {
+				panel_in: endpoint@0 {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+		};
+
+		display: display@40260000 {
+			compatible = "nuvoton,ma35d1-dcu";
+			reg = <0x0 0x40260000 0x0 0x2000>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+			clock-names = "dcu_gate", "dcup_div";
+			resets = <&sys MA35D1_RESET_DISP>;
+			status = "disabled";
+
+			port {
+				dpi_out: endpoint@0 {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
 	};
 };
-- 
2.43.0

