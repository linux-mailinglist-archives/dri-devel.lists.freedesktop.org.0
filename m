Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEAdACSMeGmqqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CFA9234C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F5510E50E;
	Tue, 27 Jan 2026 09:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dMGLfKfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F94110E504
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:57:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-48068127f00so4001935e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 01:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769507869; x=1770112669; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BpvSM11iZ+VIl5UylAE730s9GzN2gw5t3lFduUFl6UQ=;
 b=dMGLfKfquQZ1FgAI0ZdDENJ1FJef8QI4aFmvaq/MipseBD3CaJKIQPr/zRPOySjmL7
 LRc35VDKd3NVtlZEIDpSqkXbqsmbTDSsVZAvLi241M78J8Ai+yv55NK5Ug4XDkUnIsce
 jbrbMHUGSBlLr3Xd1de4jpzvUhwUcMqO0n7tCc1YpuGWpUJINauO2Pu7rPU0ba8aNG3C
 0Ct2/DPEwxbEp8gNqKZTJg8FjSWiX8guW5i4CztSxjgVHVJWCfIYaVWgCBX30rbYJgPV
 g3Jd9YnutQRi3A7+XxZfkXc7ej+mpGvBr94+ISlAwonJuNb8+4BYr9IgHY1NEuYoRNir
 IgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769507869; x=1770112669;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BpvSM11iZ+VIl5UylAE730s9GzN2gw5t3lFduUFl6UQ=;
 b=cXuKhSL8YVaP2ythPuMNMdc3Nnfab58oZQ2x6k/1kwvJXo6J9KXwgke3Kgiv/A/txx
 ouEMhzqokFP7NfqmICYlA2xDfSKOl5ZxoNeOwE7IR+AejtZTXPtNFEFNEqxMSh5J/iZK
 OqpBxhANV8JP/PdAYH7rIwq9oobWbAb+A9ZllFt3bvp7UR8KJXz3fn4bhqusis29VSok
 VRfNt5GHTcJKtPtNig/5vrJZRS2oRLZGidPwqyX/CMJ2397ygcUFsVIa1e7TOlOm0Kb7
 rl8ahmzVw42Wh0akrCqWdTui2izkU1HadqHZf1+nufcieXWpjY3w5rnFOx9CwLc3npIe
 ljUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPhnAD8BkcvKPgc4jI3ghcc65ge6seecvPJuKeq+HJ+06ckJ9si5XN7mkRApD65AoMzOLx0c7tNZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMW6dcmf8q+BtjL/D8KkmNhiTJUkbva9zgRDMKyIfEDhLOaNHd
 6AxXYu1445TIzUBjsZ362HpamdZUasHAFV2bsWMYPLXWMFKjyQeHYKKfPDhzRMbUTcU=
X-Gm-Gg: AZuq6aI13WmnoNa2Ihat7BqWoaQrzBOCs2toGlav6ikbu6oTjgJqyepts2+UaIJfua6
 SzppoQsKzQKz9qSBhqwrHbezrfOKo01H35s7xyZmpizIUBFV1IDIn5U/MaBM6Mz2usFI+Vv55hg
 nzj8y2chMdbJwVohuxCElxvCZKJpDme2Vk8zzJpZqJSceozk6VuXum6A5sViGysG/aTbjLtWHkA
 Gze+NR0IZk0JtPj3nfQ8++M5STR197zu+o4n/HIkVHa51e24uSq7gsWKcN6TUZ0DdGd/25d3aRn
 MUU5FzD1TkyU2dXheX8Cg3XcqfGKzqKeT40jlFlgrgMSBdb8QO901MsrWNF7jJFC43/kkctjE3o
 Z+KuBpG2WMcxIfe/WNIe1RnWXtiTSVbjCKgAYQ5sb7MNc0AJE/p7s/4aPmOQljj8zufJNgOU5RX
 AcmNMX9g6VHsNWLlpIF+G8YxQsGu9wi0Q=
X-Received: by 2002:a05:600c:8b26:b0:477:6d96:b3e5 with SMTP id
 5b1f17b1804b1-48069c164d8mr13882815e9.7.1769507868824; 
 Tue, 27 Jan 2026 01:57:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 01:57:48 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:33 +0100
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix for DP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=783;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gSbiWZ3nnwhx0HYBWb2dVDb/9iL5lwNnvS44cVKbvhY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwUQjm7QH1p8rQRVenNqQ0wOOWP6xu0215VvBsl
 7jSVnguJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMFAAKCRB33NvayMhJ0fKYEA
 DKjj+Z8YzdOvfOnzStvABIT7k4x4isAu30Z5CXb+Mvz29hh03cTeG7wTRJH565eZRDWPoHI6hlsk+O
 lghQtth1j1Bj9A6xh4ECqzUHAiG0TQjV7q5fUMkW8SzWm26L1+5CGPtVcm87qS3Yen0b+5tvYvgxz6
 TTEgeEYgtRwcHdadkjNJ5G0JqU14qQjbBe5SuUL1vBl+ZDk9Qv1kCm91KFO6Gn/g/CuQ6QDgrGx7Fq
 mJgLoa5rQgtu/Y1NwpO3isuBN/rJQ591y6uAhIIeeB0Ho6nONRW9w6FCp5ov06tnHm86iQ4AHaPs/t
 L618s3sK3FI+ATlXqBeL4YEezrCQrNJp4jrDOwCzuuS+m/VA2+kua1owqZZJE/kb2HapTJuOQ33/Uv
 9VjRaS1Qei63ln293HLt10bstkYS24I+dIJSPDUVM7O3GZOPswnUGaMcdXorpGME0zWJsQ72lkpeQ8
 oW7/+EdpozmLT9C+2KvgvBFX6Qk2tPU31WH+mCLLJ6l0cz8QgRYSEgJVuiAKVtZeeWif1IuCWFEBA/
 YC9wa0qsGXDhQAhu/iuSBZ0STVVAUOEL3HDtOKj6mLoJZIzhlbX9ST0yC6b+WT2Tr7oP3k74sff++m
 /XygLVHFHkC5UgxtwsQ1BypETfBo+w+LJx4oldHPIS4V/P464LimH/eMgrnA==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[af54000:email,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: A4CFA9234C
X-Rspamd-Action: no action

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ec79ba904f5d..db769baf4d58 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5721,6 +5721,7 @@ mdss_dp0: displayport-controller@af54000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 

-- 
2.34.1

