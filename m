Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B5B3CA95
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 13:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486A310E24B;
	Sat, 30 Aug 2025 11:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RokLB8tw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59DE10E24B
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 11:32:45 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3d12c5224abso174373f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 04:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756553564; x=1757158364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=42CgFZpoDZA1WcUF+OxPFlrBffkIpHm2VCK1V3rCRQM=;
 b=RokLB8twXzQ0OQGp7OuLrqZqOdia70v0E+agRBnLYmH0PH8vapjTEK8h3i551Hu0t/
 3EJvJZxRL+T7GJUVRdzN8jFP5yjQbyzFXvqe6Ssv8gnEdIUbr/rWP7Le4iJzJsg/sAVl
 kz+ROynyz00ZCNXqSJsEtabXc2pcxu42No7NCamvGYl+M8vf0K9zzZKy4nyk1mvp5A5M
 cfD8+YpYeCjso2eSM4/JfF89v1igAkyNeQ/rrA5FX9aYegkivX8uDpRGdnRh5Eui/Lf/
 KxUTf08hKcRdMfbrsemT7b5dwSHr1mJmsaZubRUhJUxa0Ud4kugvqws1+y0u3Te7978K
 1RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756553564; x=1757158364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=42CgFZpoDZA1WcUF+OxPFlrBffkIpHm2VCK1V3rCRQM=;
 b=kFLaR3TfQQ+Mv/3fxkOs3zILVaaCvD5GppwQgXue+nuRMNpwTu/X3Lur0Rh8VdmkK3
 nSLpQhk1e8TToxbbOJvEoS/cMzkUzn2kPFbeN/byUqU83uHLZck9/59mUST+sUdfxzzq
 RVdRl1gVOqD2ilujP2Jl7//iLvpbofdv7+Phw51/a/i0Xc3HpIbX6JfBIehmmLkPGRfj
 /ywJ3imv4iDNNO4v73KfdPC2wnW03i+rAqLXZ82rPEoPcfXeNK21lilE3UecFdsgaT9c
 ZmBgErhBrGiW92dce7HIkPHsCjKlZ9miMgrt+TcKK1QKROJNKA3+zx6KDED43mlp1DlW
 kTDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2zO7cUc4UpKUNATCflAJ4FZUlgPo8nwYZ97z8mNKGmUyvBcEX8szcTBl5IF1xHtTkU2yw5SJp9J0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDkGOojGzawDDeWG2GmjvJDWoE8Qs5Sl2fx9VcHYTVyIyGOVZR
 qhiPX/6b1sX90pfXk4TqJt6MwyxS18m5f0Qv/+Ji7ksjSe+5DQwTClJUZZSjBPn07XU=
X-Gm-Gg: ASbGnctL61FSvUEZzrvigcfZHaeWtM17p07P9+z6Op7GRlDENTJVw3ShrFfGeMHp0Od
 Ao2M0e7QsRbXKrzaMEjEnwYlW5m4DOv1MBTV3dzcAucdE9S4gF5I0jh/ckZwtAbnZSkaVPCABYr
 8ZPMlMuSMROHLMT/FFmkfS/hoRxTcAFoaHsL24XdwBwF1452R510wD0fgUOCkT5KuPeoJDxdWaL
 s+oLu/QpFHevAUj478sVwhOzk8NaSbyPgr9NqTiEmYnsugvmy7rbu+PoxsNvEVA+iFwN8Qiw/Uw
 wYuG1u7f7ZcoeopCkD6ZOZnJapnjcz238P2yzrxpltqxbTP1rCKi6rLjlF0pnNhshYfsqX3KEU9
 fXXQux6oPYReIgh+wXrEXYlp6aGupQ4R3pPGrghejottH
X-Google-Smtp-Source: AGHT+IGWlub2tHYqZLn4Y+mI9xFcceW1rbNdyeQHTnc2M39YWAxzrQnRH8Sc7BJCl5PkCIgpr8GXqw==
X-Received: by 2002:a05:600c:1c9d:b0:45b:75d9:2363 with SMTP id
 5b1f17b1804b1-45b8016df84mr22260915e9.1.1756553564311; 
 Sat, 30 Aug 2025 04:32:44 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33fb9dbfsm6810544f8f.43.2025.08.30.04.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 04:32:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display: samsung: Drop S3C2410
Date: Sat, 30 Aug 2025 13:32:39 +0200
Message-ID: <20250830113238.131006-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=954;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=Oc2a4NpwxzUJtyJbjfj0lVP/6AEXYLaYIj96LTX3/ZM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosuFWMrOH9wMnIOUGeuz6fivJocB17MxIWX72q
 cv84YMrJ9GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLhVgAKCRDBN2bmhouD
 1xMjD/9yAHNChQiyhDuhCbIe0MWQK1qq9Jmh1fcZ9pRPq7eR79rxzW5FVpZOqYwEDhv9XC077d4
 nyWP0++jir3pNYebpsKp0huLFx9UQNiibETumy8WYb1jmax6S6nUqF5vgbowBKRK/k9YWKVzHSG
 IMhMdaVBFCbmFwMaGxKgoYx4iYVBG/D9oyf9pbm2igwHNK/zipAQb2smGD1A2DKstuP4ifgbDFG
 wSMiyl41rzWOeVldvTCZZNDTvV25zeF0h7oyz0zb6xEQCGGYkSrDbC70zIdUPo5De9L3vZtnvEZ
 mVc/nPUMBizPV/UG36lE6mt6kRx4JovQ/P8r+9kPfnRqWqs3+t4L968SMa0knB/7j1+6tzY/QL4
 i3dLQD6zxiQi/Mdraw4eo6b6HDS9mA/a1STsKkEfU+LxVgOTZf333HRRbvyekp16BwLm4Db3mxF
 97J1kznBRjsdEg5mhwjDai7lAyGkcLJedM3RQ3z62i3GY5XX0tOu2OBK64MUQP7psD5/2MkUh4k
 DoAK56/27e210XLhZWR3GUMSpm3O5iTNQkcydpUC2eMCDzupGusx9/QBoo+24by4huyWSoyk3B2
 cRd5ttVPsjaQR2Odol6ufCDNsoMUKW1jBK/RyvxMRbO425Hy0xpIpedLbjU64PFWzEUm+ysXm3J
 sB01Kv8ldlM1Qqg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Samsung S3C24xx family of SoCs was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/samsung/samsung,fimd.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
index 075231716b2f..ff685031bb2c 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
@@ -15,7 +15,6 @@ maintainers:
 properties:
   compatible:
     enum:
-      - samsung,s3c2443-fimd
       - samsung,s3c6400-fimd
       - samsung,s5pv210-fimd
       - samsung,exynos3250-fimd
-- 
2.48.1

