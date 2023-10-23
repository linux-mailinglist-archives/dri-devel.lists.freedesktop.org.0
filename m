Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F8E7D39C7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4325F10E205;
	Mon, 23 Oct 2023 14:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C6C10E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:41:01 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6ce532451c7so543682a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072060; x=1698676860;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qudfebjcrf3NxTvPd9cnhg6s1+eggmH9h9XstTC+9Nc=;
 b=AE9jpFtOhfV4gdENK5GrtId2OcrbClk4CK0kMWRruEpp+ZuL7al1+ZgJJ8GKVkfeTb
 E7R3uou+/phkIg8wkZu672oruqF1Pqrkv3Vy8j3tPBObI1cjOodrFAuQvqM8jW6HhGJ9
 EfWWHNVbM6V87iW1MllP0oVS8Hl4YKSdSHlBZF1uncupbBD2kJazxQKiT1kp2FAPG1jD
 kEqDgA0PHxvRn2MKpIjTNUkSUrhMbpaTVSKNqGWr6L5Nfwtv+hN2E/PvmpwbcNcc1uU/
 6x6QC7V3mbnAeVEyvtOoanSkjrOMiw027I07ZBi8X5DNFEpt0e3jNWmZ2NOrabv/N4xy
 S2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072060; x=1698676860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qudfebjcrf3NxTvPd9cnhg6s1+eggmH9h9XstTC+9Nc=;
 b=VheCwGK+JQl5U6mNwUL/fqWtj9nZz9LVv5O1UCWb+GiYyAouNv/0xgeBmRew9jK4Vy
 LonfOmfWa4UcjTTkyr1UudnEcK1chPRu7GSpoR+r2ga+hMVf2gynbCl0dFdaCQlNKCN3
 D7jlwnJj4Xj/Hz3vHGqVlkNM+5+Kakz9Sc97em/UiGtjfrvgPlSZDN0DZTRBWoO4uaPh
 kHWzNTYGKuSapKNGaH5EF2YV8opbFh0TaukR2wdyrNSMdvAza7WoUg9mLl9aYXoQzjWi
 t2b9s5OQ1ehQKExlhBourLyoAvFPGKsqUrHB1phjFEOozjnhOwZ0ao0lkqUp9BhOopo6
 IKjw==
X-Gm-Message-State: AOJu0YzQUfv/DNsfH5j84f5uZWfXWSiRxkDF+qTQp/W26edzQBtxItUt
 uC/490HDSserPN1uzfJ6twn2iQ==
X-Google-Smtp-Source: AGHT+IEm9PyIg3Jn6Sranv/OuVsKx3BtStd2/S2hWeKlYnsrLCZVCoCeMweFPm/ILO9p7wr+RzI5HQ==
X-Received: by 2002:a05:6830:12d8:b0:6b9:c41f:ede9 with SMTP id
 a24-20020a05683012d800b006b9c41fede9mr8427446otq.16.1698072060546; 
 Mon, 23 Oct 2023 07:41:00 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:41:00 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:12 +0200
Subject: [PATCH 12/18] dt-bindings: pwm: add binding for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-12-5c860ed5c33b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=ffAXKXJ9cZhbqlXUqaqX2HWdbChLJu80R5DE84NCORA=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPMQfrIcZqNQJQO0Ys25obPGYM1stc5OlxnvAk
 nFfDrjyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURdavD/
 0ZHAZ0Cjk4mWoa9zs6Fp9jRc9KI2yB7gYjoYxe/765Z3sfJIriT6yE7EbmApJeAFwZXuxMtXTxp1ap
 LVnEtyhFnLZn9KfHA+ALiIERlyx6i1MPCmiGtdhBSH2kgn5rVrELtf/LrFTJ9LUEuy5MMzV6vnxU3R
 E+uKJAxMTzdrTUBbvpmehqvKKL05WgmgdrInZWPK+kJHrJ1AYdlXFrFnBPb/WOnmIKBe5agU5m46tc
 fwUSK/zMXFAjySNrRw+spBLwPUIo5T8iCdLo1VnjYRvJtzkMeyc1hzZGTDWkmKoHGmPx3p0Ee5RUFA
 7OMDbifvVvc5t1VQ5KlsyuJcr2nNZWaVFtNotj2PjUSFaiqVubPTbRdk3hcZAKtGSnA9reIBsmViaJ
 z0e9t0zUGEHa6oTIHkBpFQStDh8lgpeoM+tKKh9RL/OtyNDRvIocFqYTOU8/JVcsUSWlJ0xi3w0EDA
 Uy1/BPSzCu3Xi4oAs2iNbnzwElhIXn7l4/2+s6fXHQL49j8l9+wkpBITfsWZM0++zwWxgIE89bW0q9
 kTB2XBw2jQMfD6NtU9QnfS7D4PztrSV36Dqn0v20qW51tyHLvq4sxPAq2b6GBE9LKE8LKQYx77NnT2
 3/+4xLlLo34+v7R651isf4We2qMe+NsPxHGpuHQMIF03yxjM02olxLhcaoaQ==
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

Display PWM for MT8365 is compatible with MT8183. Then, add MT8365 binding
along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index efe0cacf55b7..e4069bcbf8d5 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -32,6 +32,7 @@ properties:
               - mediatek,mt8188-disp-pwm
               - mediatek,mt8192-disp-pwm
               - mediatek,mt8195-disp-pwm
+              - mediatek,mt8365-disp-pwm
           - const: mediatek,mt8183-disp-pwm
 
   reg:

-- 
2.25.1

