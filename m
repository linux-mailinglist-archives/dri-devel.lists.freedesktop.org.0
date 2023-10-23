Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562927D39BB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B949610E1FA;
	Mon, 23 Oct 2023 14:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BCD10E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:41:15 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7781bc3783fso240857285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072074; x=1698676874;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GnW1vwbTtC2HOu/cZzh2Qo1PkLHHngu1dkPjgS4ENio=;
 b=EGife5T0RiY9Rr6glc8HLFyVca+VCnfcSxoAsFda46iu0+bOG5ETRXBuzCH4OdCujU
 s52q1u/FGN4WEOS74wDqDKQ7fIZpoXstQAcpSaNXvEI/2o2NmF0cw1XM1ufKnJYopkW3
 DWjtKoEdAqUEiWHTnffjSAd4ettOXLXK2EKhNIdFvoGqNyu2F3au6/9oNYdC7K+DehIC
 JWB+UE18Gz1ZdJ/zIcVh+jMLfMko/U3YRcVwve/DaQGBhNJ07CLvF05W4+vitl+gda0N
 E2zc4kDGMbmcB3hIVOAx/iFDRTbC5R56Gpmm8G3ueS2FSViCARwN9xi9E+pyYl3ZisXV
 9jDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072074; x=1698676874;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GnW1vwbTtC2HOu/cZzh2Qo1PkLHHngu1dkPjgS4ENio=;
 b=Q4Y2uJhkkV5ToljLN6oDXoE0HFEirPelx7X4HH/vWxrkBzfW9nJBywjjw7cXMk6zVv
 b4WAjJztTPKid9YG6mr96sfb6Ae4quY+ThYy63HiraTjDhQ7YwmyHDMRF2pRi/gme0L4
 /9q+hDBsSE68uHnf5rXfLWVObE8w38HKtwEwAEsPfs0Rx55e8+eFHcQ9mpjm1UJwnOu/
 N1VNy+OwcUWC+9BI22GJJIkO+MaMvbrDfzAi4/E4nK4nfsDL25vw11f1N/uc5/5WsGhj
 7Mt4wN3PBObLr/+0eH818bQHvbeYbpwuvlaD6dWkVqzzO6/Rhn3AwSpKBO6I0jLhK6HD
 omoA==
X-Gm-Message-State: AOJu0YwuFf9EtQU/Ai5yUN0VNeD3df7V/muNNyQA0fmUdnQN1DfTQiGI
 jNbh+EHr/lV33ul/cEBto1O5eQ==
X-Google-Smtp-Source: AGHT+IG05HZAMl6qM23cmvchPry/9vyia7XBR6CQbmQYA7BGiJRGKziIDoX543mAemU07ICYeQfxig==
X-Received: by 2002:a05:620a:2b8c:b0:773:d86f:ec88 with SMTP id
 dz12-20020a05620a2b8c00b00773d86fec88mr9784107qkb.35.1698072074736; 
 Mon, 23 Oct 2023 07:41:14 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:41:14 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:16 +0200
Subject: [PATCH 16/18] arm64: defconfig: enable display connector support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-16-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=UiHNb4i6ojEuqkwvKy30tzrI8LnM4UXa6wUtnNRc7vw=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPSDmUpXOWQ9V2uW9CzePYmobdbyaSkVPMW+Ev
 5NfjLaiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURffnD/
 wM151OCbx3hPLNKgDMuV9MTWFsZul3HyMZSqmD8UVRycvM0Z//6XVSw1gyZYj0W/s9GK6kMKZqs2sO
 7c4yH5v+aCP1yvhujwT8YOQlbOii0IrL/umKyYWlhqYzV7wGlmuwk8gYk0JjHZmE5r35l1TpYdDdfp
 +7tmPg8In/SSN/fxjenTyNXInxy4wVs7upezcGhDIU7jfNubTm8MogNu6F0kiPMyPRlQuzGK8O8GPd
 3eT7cLUatFHFfSp2zFnX4G2a8990z4H7mhWu41aYHKQ/zFc25YeIgLPb8l3niEyTl3x3dGQLwpcYc2
 VOfvJD+nCnmQn14NAhvC4Ln/Gg/V69TduURz6Aixd0GxREtlKpzQF6Ebk4+BfMmujIOu6dh+5D3i7m
 injvvrxDSaVuqpEhy7ofrRB26+TDj0z+pPASQyxkoc5CfRT3tfZRm60TQ0G8aPOJFd4XlNe9EHEy5C
 +Wq3GQD0s1mghVWSiXZWiHo38d8vvevolFLn6+OkeVYNyjCBlqQbEnEmqeIyamH0rT1zC5gnFNdiJT
 FjfkD3Hv/9iWexMBG2WgPeQm/cRJt1VQOncH+Se8YcD1H5QoDTeVv3dl1bVtUdCCnjdBuREG3NpcRQ
 bUDH4oZTFn1aUt9JzckJmJ0r/DqF/rEceT+liWPK1MWQP3Omymc94kMzEotA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..0a60e7616abe 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -839,6 +839,7 @@ CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1

