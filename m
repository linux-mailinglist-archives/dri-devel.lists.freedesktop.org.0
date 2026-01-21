Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJgYGIcBcWmgbAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:40:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCAC5A066
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB2810E855;
	Wed, 21 Jan 2026 16:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WVkIBrQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B1010E854
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 16:40:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so466225e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 08:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769013634; x=1769618434; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VvVjTCx3Ditk+y31Hp8YWb6pPY+/zpI3meniVBbynGc=;
 b=WVkIBrQTo5RaXl+rIRkXlsQ5un/UCjQ8zH9PtXwH5oh18aZK2VrdbjF4NiSrO2OhIR
 5xonOgHgTPsPAnFpvKycDeFgVlInOwBX9ImWLzJXfrxi7/cIiXwAMOjjfrn6agrYXQkU
 aiNFPxsNrlpkBBVD8HZpMYlqMqaLFLxv8cxH5CbKo+7sUgYxXDqoyXyA3OXYiUSEcTvj
 3X4U1oBzcQ/9TP0uLa8fFyGrEAz/RlSe9A5SO/O8NEG5REbvHMl40kqhEmSZtoOAnyz6
 eII4mE/1C3O9IlTJcqtNN19BsoZtGXFgHRyNoolSnQNNIYXJyAseZVJ9EDvrst8vEge6
 vX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769013634; x=1769618434;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VvVjTCx3Ditk+y31Hp8YWb6pPY+/zpI3meniVBbynGc=;
 b=uS7EE/UlJt6PDVKoTtcsASP1TgwbDGsG3KHyojCHn9qGzoRtmSrqx4D3UeajgMRmpd
 Tq6DKT+5CBQ1qCuiQTzWQ374aZfQcZ/mv3/Rj28qOZbOg+It9lMZaI1F73319m0KnfUG
 1N+BgJc+F7Y4bvZpAgxVJe3SI1UaRMPc2+nLXrLgC87rfYOMQzqX4M0T1BGAgPEOOGhy
 gCk0ObM6yoUTBSLRVh2TbazG0cjXuS8z6CtR/KWZ61W65NulJXUSwcqkl0bbIeb3JAP2
 8R0N7Heo148pdukglsxn/ZkeRC3PRc1SvpkYFhGuvBOJ6OCKqOsWUW13z7j2TpZtMkph
 hLSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOg9vgq2PYnzxbSF98tXyfipsTRcvc6vneTQ4QqMHtO30/QS1gjbLor709QPDCj7QWYPg+ZI3gXIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd+Q9aK+A+d+5eLnEsfoc61wcuZLd0FmpDDrr8OI8JRWHirYwE
 JtZKUb1xM1P7biOPQeXJfAJy/XoGLyw0d0kFPELyP0yohVDYlhUg/p2lt8W/kKqRK88=
X-Gm-Gg: AZuq6aJjCfopY3+ujfLZIywZm5/AYAFP3ZbfeqTIjHlVUW9KrjBnTPCrnAXLA9BWYnO
 MNNqy9Q6qxYBAkUd4c8BnzV+iFXJ+JiG5zTYSgr1fi9GvgYGyQ8+AIQSxcljl0ez72XrGRHwPfM
 NuxOtqlYcNRlqNWPfBeRFqrpA/j9S0Wsc7TI96BHhUpuOwYYt0Q1hB/MtQLNPC5umbTnXn5X/pa
 DgPNCx1sQrjWqQHoZhNnEnByx5ktCpv2e0hiDnVLlJgcrh7LJX7jhjrFxJdSUYgTP0IDW7uneuV
 S7v5edWfej0N/UM3Ip1J2OsPpNa/WpMGSzG9E0oCBUmOBIXvXsqXzSYGtx22kq6k4D9zn9D9n9m
 22fKn8XsZk/3okNrQs1AiFlEbV6+cPLJWSyl+Z9ma1MPEHY/WxTsFhA//WOc/J8d7IpAijUZEYZ
 nXYqBq8/qX1Tiu+1VlVpXTJUNzerfEW6o=
X-Received: by 2002:a05:600c:4448:b0:477:b0b9:312a with SMTP id
 5b1f17b1804b1-4801eab9db5mr233791535e9.7.1769013633652; 
 Wed, 21 Jan 2026 08:40:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470287c3sm1000255e9.3.2026.01.21.08.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 08:40:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 21 Jan 2026 17:40:27 +0100
Subject: [PATCH 2/3] dt-bindings: arm: qcom: document the Ayaneo Pocket S2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-2-bb3f95f1c085@linaro.org>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=729;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+fcuDogDNDoswfDYKDTTC9TUfs1ig7AC26I/0EuMufE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpcQF8bOQVCvJ5IZyZNj142dWwWiZrirOgpzuVv0/z
 H8T8X1mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXEBfAAKCRB33NvayMhJ0a1aEA
 DPOqbVJLNNWQdDBOiHJgKFMUbTwwrwCHnGqbUCJO2duIsFamNKfcXBd/26xrVR3KNseqpKXCaRjSCA
 mnG2wxacDF6kZ4niEOfXTocF53CT+6h2hm1EPxZg8lLfy44YkoO6DbKqXEAKIi30P8tlo88KZ0Xpxm
 4665czly93/U/+Z8vRrrvIyOA+dx+nbp75ForWhsCfoUlXbYfp0v7XlDVY4jhi53frb3hLc0iBinvF
 V79fU5qU/Vg/s1WgQ596SYTHhkg487EmXgVhoWtKlmtMIPuLWpdUo0aTZb2UUJoHmw1OlZ5rxuP9ps
 2LXQJ9fAYC6MxR/2qbMn/gr5x20jjNs8zpDiIFi+eqBwGb72RUYVFJnzQQc9CRb3RQnzNP78RIdF8Q
 GxgqTzsjqcZPDytROxMdpCMOeLnKgMgoZd2VFKlZdDPneETgpUsnDaFO7vvJQM9niGskXBNpIatDf9
 wSITeWkb0WjcLZh6f4Y1Vh38OQ+LwDFEN5WtETZMeH4x9+3IaTEeNjN/ouYgeoq6Bh8RTvAw5frMPV
 6Y0UnePIcteIBVXkFWqtNtzCWtAy4sVRpltELANp6GpW3Rprv627ca8yoLgg3UNZLw9Xploht6oEK3
 IgRpVTQizKse/wY+Y00ICWvwcehl2Np61GsisbDz0I16l22ar1O2PFFUMjiQ==
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 0FCAC5A066
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..c6786dac5b59 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1045,6 +1045,7 @@ properties:
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd
+              - ayaneo,pocket-s2
           - const: qcom,sm8650
 
       - items:

-- 
2.34.1

