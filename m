Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H4MOCeMeGmqqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946AB92372
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC70D10E505;
	Tue, 27 Jan 2026 09:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SVbIa1nd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC9A10E505
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:57:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-4801d24d91bso55668995e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769507867; x=1770112667; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mro/HVDsckTjaIY+Cj9g2EfEbDMs6DWKlUVvgKAipvA=;
 b=SVbIa1ndZ7IEtgtsfYavyQrNHbEeCnVgSdfKepGEiD3SFLm8CYlhY8T5TL3PIu5GRx
 8hTT3um63HB65dX7E1pR72DGEkG6IgwoKEraor9JJbGCaw8hTn0guPCnKlzHUDmHbIfa
 ZzO7Jyo9tvJyUoMMqhG41qJjinGNrZZRka8blp3qKywI1c/MDu0lp2z7Rby/cqaEWMoh
 eB78clnc3OIY+M78W2qaZn24anekHgjtDECYn68rb+LKHGM0CyiFW0fwhPFy0r5IZLb1
 cvAdaEXaEpHmWpOdrpM3rdk41qJhKglAfw33T696sKIZxC8hqOfsW+1PW6TKHuo2QBLV
 ldKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769507867; x=1770112667;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mro/HVDsckTjaIY+Cj9g2EfEbDMs6DWKlUVvgKAipvA=;
 b=m695HUigHet1DSIWSoPgCbVRh82mFxwYEtfaHrnBm7OEaUS1eJ8/MNhmEElrc6ZBQw
 2NX/6gK3rtftNIffgMAaE+scCV4ks0UdRe2DZyt7lGSuBXA6rXdpW29hwLtTC4q/aTsA
 izw196vZhNO8vWSh+q7EEohMnOLfnFFTVNn2CoBUu/EdGaTceMaE3JjOV5IDszVA0Cst
 iinwX5HGcacx4AFscmdb2I/Fqn5Ycci+khMghyEf4wcVlp29ljhtrJcHyaUtRLKEFE3I
 /yRBJKynsPCi9yHpjZwni/BTZGJWSBGJPN5gydD/wZbtekhmvhST1VRJ/bEpLZggh8y0
 dYKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqDI6ritkhWKaf43i8RRWUt0+uC44cN2S0OPJdjcLe2wsBMg+A2ayYs2EYJlfcS4Aoh1OKjqwoeIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK2QQc8AW1sHTnZBm+lQiyjQxA6ha2J//mEayZBdlXMHkkt1eV
 KUcgJQwnXLHZ7UVBIrFy6rD4PqS1EdC7mq7Y6RhbrrDMvY2gUfHGn6FL8gBi/NUOAdc=
X-Gm-Gg: AZuq6aKz1OAH7kyGwo1U9YbXyrhwCeSAlGVdl42lIbrGAWk2ICL6j8uXt40vlIIMuip
 KUEMKcs83T5PfJwfl4NYp9CR87we6gnFW50yZA3Cp68/Hp/RUCUWfqKwZx8bH01R262jcrYcqqi
 u/2i++NVGLvMdk/uxZJqwEbh6jNFQhSZgZjCVfHKMj5WWZjJmnhAhrGlTK6URWIHOp6p/sG0gnp
 aD6+d9cy116C+u2fJ2N7dWuOv++hnO99UAEGt44gWEdG0RuQc2z3UlOCvftp0+H37xH3k5jQrG9
 EGnD0uUKQKqIgn9BA7+EXGaAA1FfbV+rVBAS2Q5ikmampalzmR1A4OWjSJzWQgP6zHfQaI6nWp+
 oaBdmfMKJj0avQvahCQaJoE5Og+pXnTnPMkx00t7y28LEyeIdnFIihc9bNNLYDqbBpOC5JcUnEM
 aG1ipF5S4TOTHO4IArQAo5DXWV5ucH6tE=
X-Received: by 2002:a05:600c:4fd4:b0:480:4a90:1b06 with SMTP id
 5b1f17b1804b1-48069c98e19mr11551965e9.34.1769507866543; 
 Tue, 27 Jan 2026 01:57:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 01:57:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:31 +0100
Subject: [PATCH v2 4/7] dt-binding: vendor-prefixes: document the Ayaneo brand
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-4-c55ec1b5d8bf@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fcj1K5xSZY2CMfrsTNN0Bq9cIxFPL5cWnSbqgyt59Gg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwTy1WJEkWNVBZZ8GsnLPMgeoTuWCtSL4q9ZjBA
 vBm3YM+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEwAKCRB33NvayMhJ0YdaEA
 Chfx3yxxt8m0b/7ToR+hIGbpDEVi7dVvk6HKyCCaysmFwc2cME9eEAVY1DDLbe0Sp15ZqVcAig2Ely
 ueoQa+X/k7gq72oejejmwrUHBpFATZOTgbrz3LR/V8lQLvDhfAv1qiDCYgg8u6G6rkFFTjMSUSxzdP
 3ZuRxvVH+Vtcio7JnzBXwwKr81foFIYPmO6JKZb9aj+cJERy/L9s3TJFKClo2oo02X7QLnm3EdRChk
 q1E327z7zx69Bi7fB2LKQwFZtedEPfx6JpN5ozzrJcefNAu54VP0msYBiOx1F3WLx36f3gwa3VvT0d
 oA2xRTNH+kOKLKEEpAywczEpr4ZierR+1aHP+VdsUlkng2IoagqYEbXzA19LkvHKwLjiLmtBlNLkFZ
 6dUoaVzya+MF0iLBlW4zAT+xTidSVe0j5htwHAg2qo7OaUBf57OFty+TjcvKK5JcrCikSDQpHV9DYr
 8LX5fn21nozGZqcOS1BKfFTE7yx9CqqMRPnfFuSBZMWB8x442MjvnTVQAQKf+li85BD/fRD79eThwb
 +9vyeYty8GKTfgIr2HfUNKYl5FHVWa0v2Af0wkQgtaQhdMQd8ygTDtTspYpj+uEC9y6dTZ+YosqxLu
 CZQfK9wFEx1ZCyq4bdFewiGlK38T2VvDZfRGHWC1+ayaebc0iciFDCy2xzTA==
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
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ayaneo.com:url,linaro.org:email,linaro.org:dkim,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 946AB92372
X-Rspamd-Action: no action

Document the Ayaneo from the Anyun Intelligent Technology
(Hong Kong) Co., Ltd company.
Website: https://www.ayaneo.com/product/ayaneobrand.html

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..1f83979e0d09 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -216,6 +216,8 @@ patternProperties:
   "^axiado,.*":
     description: Axiado Corporation
   "^axis,.*":
+    description: Anyun Intelligent Technology (Hong Kong) Co., Ltd
+  "^ayaneo,.*":
     description: Axis Communications AB
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd

-- 
2.34.1

