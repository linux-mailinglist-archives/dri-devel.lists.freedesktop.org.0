Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FBUKyiMeGmqqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:58:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A79237A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E8010E50B;
	Tue, 27 Jan 2026 09:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MBo49mck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573EC10E509
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:57:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-47f3b7ef761so39290355e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769507868; x=1770112668; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
 b=MBo49mckmblMKjQgHMIBhWNB6cWZm8PHuvmHXJGRj/BWnP8k1tJ8KLAaEmaOYV9XuN
 V6C2Z40K5cwgkkjxhFl9+pLRbEP9uzKcLwuhSNIkCM9Q8GPD7BGIcoXsbHrcdSUcn3vI
 ZJorLDYq0gEkfmXL9vDFbQ7nwGFLWKokNOdjci9Nzrdk+4iTIkO4uECCGGejqtdMuoNl
 wt7e1wkIeP+5475CNfo1wl8UFBwjOdY1ZGbW4rdgXkOVhNZglRVkg3kJ4Q2PVOb6yhbd
 vR0qWOXeosy2bdjvpVoatDrGb3JcI19KDONrh4063jxdXmPEXvKUESZlHlmPJU6hKouE
 kqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769507868; x=1770112668;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
 b=XB1BzaBHIyQl98H5j+hV0GcYAQWxzIl+zCTjBwksO1Dv6tZ2OiO/q0aLcRm8yy2BEA
 ek9cvUS2SrDQguB4x/l38iU051Yy5EfH9lriqw5HJpVRpDEXrbZ18Gfj5uPecSa5Ck9t
 xVjF7DsyMJ+KdickIvu5+R+tHiavJHEqaXERmAjpia3gqN5VF7u2IeXCxGRbkFt/Ak7L
 wJWmF1BwVRS4qveDKm7q5LF5V3PpOkBY26PqVU0BYa0YVmvcWhyT4kjzCw10xFFQRx4d
 avt52q03qSC45apm26CE5civacJB82Kvs6aBY8oTGO6V7kv60RPgNf7kOfKcaZhi9pF5
 3Uwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV9pRkfp/bIhvRQs9wOavL6l6qCIQIX5van0AAmkaFmnQamm/rkd3x0FvZLQ9ovx/2tO/VxlOImAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD4AzEOutVMPf/d5OSXGUrfEwOcmN3vPvTM6JslE83DTzs/hQA
 y8DZAmTBk7tOl6nZiP9KRXi6KTTQMt6RMLRvSve+DlpwFUY2+Z4+RxdcSNAw4IW7hFc=
X-Gm-Gg: AZuq6aJcKXxv63lhabnKOD053aC8T4ZCcr9vpevfCYaau8nUZWxtPDF++gqR2AiVn/l
 CzL7jlsChWTp0suhCb4qJhCmOb9otj98R1Qaosv2b2ecoDUh6BpwpwIpJB3EI0qvx+o6nhMpsM8
 5ww/xTNdnTSCuknL8JfgzU/NTwxLMqwA2s35j4i0srfDe75qDEjfdNx7LR7ozJOfeODmyycJVqo
 VEX/FLGnpLVwSTJQAyk0tr6e5XG4cGMyGHB0T2j0+Yz77HyZrzGSK3qN65QP3VWsW0J+RFPst/S
 msMXx8WzUFCbJOaIepaG8iEl+DEMIdFrmcbdGPN/yoKfo9Tk2xfAuUMpvPz8nJw6So0MjWJwrCy
 qSP1e/oQ1QUPNuSp6/yqIsTnv+41cb+U2jmiUnUbtw6DVsarllZVPgCGmea4wAmW+wQ77ZOKqv9
 5/ojCnRNn8uB4uJTlz5xnonJRt2ZSy8nF3izPfLLPDaA==
X-Received: by 2002:a05:600c:34d0:b0:480:683f:76e8 with SMTP id
 5b1f17b1804b1-48069c7c265mr12611895e9.26.1769507867692; 
 Tue, 27 Jan 2026 01:57:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 01:57:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:32 +0100
Subject: [PATCH v2 5/7] dt-bindings: arm: qcom: document the Ayaneo Pocket S2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-5-c55ec1b5d8bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwTWMafMrwJi/UrUblmDswBaoYuUWQ2fwrzpDVA
 O9HMxsmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEwAKCRB33NvayMhJ0UFBEA
 DPXxue632XoOKUO20a+YCsKF2UAhWuEgIA/+CWcQ8AAkzX0mKU7Ada7O5tgYC+2C6JOx2B2DQX43te
 +5aBc/dnZY90jLZ3DsrXJS2l5r3LPEBqFYiU8u0M+pLDYuDucZBdExoCYmTVshHoXtkJ9LSKSo6nnD
 gqQ0rEjVHTYrjcLYTIxxrgyNitSAFvzcgsm572Gu4urrwcWKJPKHg+PGxRimxRLB53vR1LXsM4m9Eq
 3I/aPsGIlOU4qsl+NSziBRL0bQrh8FLncxI33/Yq+ApgJtf9GIFw5omCPOdmxRT2H87qAV5D4sbJYO
 iw7Ewf9u7IoCJgr9dhpmee043Nnnj9HipdhsM83tbrjn2mJPoSIgufB9qjTvP46AlXiEYtz+rDvilE
 iXYM+wcORtdDgiJgLxqX9LkYxY2s8syHgTWBQBm25ZuTUDuXoW1Ze5IVTFbnJzOY2klsyaFf+2V0Y4
 Ipxpetfml5c9XHYicXC1Kc31vpoAToQckxTjybcua6AmKRLOqqQiRbb0RoQgLEqWbw0QUeEXu97Do1
 fUEazfXdUSif4MYm7YFXrQuMnegrrN039OGFUJXegyNxbBjUSgsvyDGO4woBlxzYT6LmqCIThzJrIF
 gQq3gUt21+BhhuVP8g6tOCoqo602mIWnf7znRDzCQeo3vM7RmUPLTXT1z3jQ==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 631A79237A
X-Rspamd-Action: no action

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..351cc2eff14a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1042,6 +1042,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-s2
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd

-- 
2.34.1

