Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030FA851110
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F6B10EC00;
	Mon, 12 Feb 2024 10:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sHVTOyh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7AD10EC12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:37:37 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33aea66a31cso1664244f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 02:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707734256; x=1708339056; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P7lnJbOuvPncg4Drmi9E/eb7alLntKkvP9P/k+jc8V0=;
 b=sHVTOyh+sq4y7dyNI9ArtotDJOpKQHmHfOkWYP+tgfE1y8rqwXud91NbHb+073zCtw
 Aa5Tc6TyjnvgUUWeNYTgMUZGn/afAUKG4rSi1dtdEYfpsFvzChiwYVBxCbkd42huzF6s
 28tETRA113Px561gOxY3IQvQRT8T/FlTOA321AyT8RJPYHPEGB9Fv2oT7wEs1SR5bl+l
 30zCmuDc26P4TiXrVE6hWW5aFMCdgDV+hmj/wNF87wD5hM4fWwNV8r261XsNLDQw4XhM
 LBTRMzW2GfVa5FrNvIEBtM5BBRALwVDyyh9K0DYHtowocp+DGD56WwkefadEfVFRdNBW
 +bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707734256; x=1708339056;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7lnJbOuvPncg4Drmi9E/eb7alLntKkvP9P/k+jc8V0=;
 b=J/7oOKYKoKZu12Mh4Lg6u0T2vq9S4TOOgBmAiC9LquyObac3h8x53V1iV1w37d7gHU
 kIUdNnVfyx/6ux+nv/7nkAG1mGxnwRj8Totmn+TTJEA/hNQU7GpZnzjQZMKPPE3Hieq9
 xNRyYAFvpzlQVzYde2Ch+BJ8y4bL2KohI42a+dz4BPlpvbbtgd0q+pZgXrLfV6cYBPgh
 ulOn0JkRschS6OzvNjkhXlqFT5XIA8BPRVPJRU4uQq3ebnCOt+IVHH1fwwG7SYtxtf7X
 VmXnTe60q/D9cfLIVqQDlztcBFroHRC5tIYzcYPSU5ovWPpyVggRE7yxhVODfC+rJJkN
 FkxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUNpjO0RWQWU4lOBmb4kxi9SxrfeQESpejqYsA/nmTGD8EJlgVoac90dvU1xLlrrkjbzG8EWt10iigel3+3/u+cYBXtBqLxZXUr5BIZnLv
X-Gm-Message-State: AOJu0YxtMw3Z4mas7DqUERc3pMFIUHwBrJ2+rzg66HvrEF1OeofocK7F
 ZI3ZQpoNlw8ssWsAgFbfTjqn8ceR4+wlqLNFZFXl691zcOsCla5i5hUKk6uucuI=
X-Google-Smtp-Source: AGHT+IE8LrZKOL1gEnItXhiIYmNoGrgCbCa1tyDjAbBtBWO0QpB2pSJHJbxkKgN4VqsWxMQltjgyBg==
X-Received: by 2002:adf:e6cf:0:b0:33b:871e:e19a with SMTP id
 y15-20020adfe6cf000000b0033b871ee19amr774229wrm.40.1707734255845; 
 Mon, 12 Feb 2024 02:37:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUm81D8+86/YtXHUU5sPbxTWdDbHw6dSfxLG3VgV8DXlJx/v2wAywxucOi5jYbxwfr4olMUW7mo0GEPwyW4DwiIr4FKdYrJlw6L7w1utYy4qe2DHhWPfnZFOSSCTVDf42SAVjvVDKUauPicTN5iKVkiqyF0jLnCdzBQRJbaZM+z3Nwh2oxHQtdEcyIDyAiGqmbgyFcLYKAquVSbCbAy8gVs3n2mB1CBIW6mM4+TPDEdOgGHPeDoOU9PawWYiyujbTbPYeAE5+vuRoIeFddM4OFOWWevfc/Wjp03ab+qUFKeqe9Gp3mwL0X2P6MPQa5qmtMlhycJuEPkeuTXK0+IA4fWxewisXIQEkYvykVpQ5elbBUtZ/skwDyhfPUL0fudHVkk6KMRhxd/AV+6erVL1orOx/dKYmnnjBDHvYsVGQoJtDbTQUMeroR17+m7Z4wkpbyofV9WZ2wlDG1oNO2iGPNA9dhx6lcf7jN5Xt1rxle74RIMGZGLm0X6qeAczuTCNahOTX1X7lQiXy8qWWTfzyC/OYpKVxUeQz4sUSYvLut+9Vq+82Y/oM9Epa9xArL4LCo8cbWusY8rvj/Y9T3sS+5B0ynwaEr9OpUKBTUXspCiNUVsUTfxzoSVTAyS8Gzu2rQFOweVkHfEb5OkEvUR11S+wSpYGyq0oUFhcUYTSIPHzhhAtyIFLxriiOBqlZi1+wvGlfouBox9/eIq8EAGEDptetOW/1cq5tc5y+ENcWlfpGT3kjjLsq7Wb+FnpOzPIa/AeWDMz5lTGS4Fm9kmUYUU6CJOFf7UwQjNRvH3xLNlr342Aqmy7ijsstz/jdz4+wFIsOE+kV0YWAmoPEACpDw/hT+UBODv4PDT1U=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056000128e00b0033b50e0d493sm6404188wrx.59.2024.02.12.02.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:37:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Feb 2024 11:37:30 +0100
Subject: [PATCH 1/5] dt-bindings: display/msm/gmu: Document Adreno 750 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-topic-sm8650-gpu-v1-1-708a40b747b5@linaro.org>
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
In-Reply-To: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FwMqAyDAq3YcXix/6fFCYmJYb0SJdgOCR00xM3jvDsc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlyfTrTXGmf3HwuMGzIm+Mm1tqPdnV5l3IFqVvPZ9e
 wmETjgqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcn06wAKCRB33NvayMhJ0eu0EA
 CX7qWcam36CvfogCtEERjT8ajhoqfXUf9hOPUAhARt7k4Q29826znXQ63uEDXn9cGy6RrMlht8Xevl
 UiTeJ1+L5aUfB2mE1hpLiSkVwPAF4rCJYA4OHEjoTbXa9ji7z7cMkFlDkBqy5lCu6nJdvsCiNYzu/J
 O52MmpzVna4jSNoFTZ+X+K710+sqz/+Ng8/1Z46tCGMmUVMKu5Nxh7A3ENyMzf/Q/Y/FmgCUzId1JA
 fTU704/7+bgoivpOGobgXpj/P87OLgIz//Ty40crECbwu6WrB3T4V2dA5EfLyE5vdt+YLY/rr7Ex27
 gSxv8w7sO+/BhQrTR4+icuhRHxtXXhZjWOScBCLk/H3DCI/U1NUAcRzfKlsIzA9EqotFQnQHEPbYgn
 UVwXqq58Njpxp0nlw46+rYnwJgfai6NdvkLnzy0cwLlC+e63XLCYgW9jkH4t0leHzEx21M9gx1+OZj
 Ja1fayHqF7MJvyi+84sshdrTfsyCggYfkMdfQRoi++9ZFwzEmgIYbHOQx7ZbNsUGqdfsey+Be40K5A
 beGX1nx/cAFipmueayXMcS7PpumWczP/6hta0WiHJlkg5rZgU7O6JeHK3IpsdI/sspEF0NLfOHJv9/
 Hs1Y3Kb+sSCQflgoJ82wyit6O2Nd5BTA+GGNgU45OiDNWOcUDkcUZ/Gq6K8w==
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

Document the Adreno 750 GMU found on the SM8650 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4e1c25b42908..b3837368a260 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -224,6 +224,7 @@ allOf:
             enum:
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
+              - qcom,adreno-gmu-750.1
     then:
       properties:
         reg:

-- 
2.34.1

