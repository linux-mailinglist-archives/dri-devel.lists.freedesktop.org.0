Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5747D39C6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9155F10E1FB;
	Mon, 23 Oct 2023 14:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A699710E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:47 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-779d603af2aso75738485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072046; x=1698676846;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zXrQ0v5fD2lZpUHoVr89BN0KsiA1JdGijnakOGhbvJo=;
 b=BqSdxK/zbXDLyzrcND/SOxh9utMQKY4JqSM5BeJn4ktf9AhAFun+RzrX4STkV6ggVd
 0tAEs5XtP8Kqmi3cLc22mKSO+KbneUB7A8G5JScWiU6BAnLE+/r08b3t+LNXbIodA1yc
 aQXaJ//0AocrBPQcEADfF7GsQisADgOL/9jN/AkT3GA1joVW/4dRhAEN9wmcMCkISCiO
 ugbUepgVsfmNpusG25aVMQIzskEgBf317ZzaG/Y8VoKiIq0i7zpXqwjPElmPOUTBKh/Y
 ksUmk9tva3H+GuvRtspI7JptlCzL2dSHYy6fhAv3seOA7qo5Dmrn9i0z6bB7E3sdwxzj
 4dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072046; x=1698676846;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXrQ0v5fD2lZpUHoVr89BN0KsiA1JdGijnakOGhbvJo=;
 b=wMF4awfUcpUMIAkzo1elun+BQdSbaILrmbNhrr7S/z3uMK2Gm3D8eJJyMT3xwdL3wt
 XR6tsQvJ5EaKRT9x3YqRK0zwZ2K+boTibew4W5nghTsUC8x6YA6zZ+qgqlJGHYtthQnZ
 EZXChoZUyfF2fRB8Rum/4lcecYLHCVJTG+N424COkQS0GwqsD+0LB/6QgUI6aCHzFGiE
 9so/qfmJHzihJ9bsCm7MVmNw+YteAhq3076cv1d0yTxgKMPpO1QMCtxi8xEdnqkxzHPJ
 s+uRc87MIx73AmAD1GS2/ArxtxEACHR3sH8blITR1XkEmX27wH9KUBOfX6lhajLcMKXi
 ZoVw==
X-Gm-Message-State: AOJu0Yxxv3KCz3r1rIzaVNEpWDoDIJtz3BpaPBiDou+tkF0kyIpAHm4u
 MxOJczrjJia+crntsAopZikCcQ==
X-Google-Smtp-Source: AGHT+IEkEU6nuvyYg1bDt8UbuCs4r9wvONRIxcXy7le7F3scWSafhsyS4RhIdhies0FoEz8LuDnOPg==
X-Received: by 2002:a05:620a:27cc:b0:778:5736:6573 with SMTP id
 i12-20020a05620a27cc00b0077857366573mr10157809qkp.31.1698072046662; 
 Mon, 23 Oct 2023 07:40:46 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:08 +0200
Subject: [PATCH 08/18] dt-bindings: display: mediatek: gamma: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-8-5c860ed5c33b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=hW7CMZcG0C+Hg+3PvnUAIZENabLnRa3N/UE7I5J44y0=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPEQMUcJaJNgJr3/lL5DFQPL4QTvWap+9SYsL7
 GBQJdOeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURZZmD/
 9N3k86URyJUUC2IPzR/C/E06OuIfEdO/WWkaFc6N2660KaCRzYBuOxzm+5WTjHcQH12qnokpsIan4i
 UbvSoS49lwSoAdA2lOMAHUQG2iVnSiLZkIk4DQVuCWR3KKKaiT4axb+gIwNgwudahNgnGjlRGJBSb4
 idDjG/7kpcFUaMobATpLY1cJpvjquWo/J1ItJLvO/I+FX0lbJlysMwJrjWFh5UoEa/JoTrX8jqpAsR
 PVFdrFMFsVckUZ9k40MwwZ6el2829PmGPymCSz9qXhT/9p1LexRpMD6oAO0KlS/wC7kDG3QMYfZIQN
 36jlHWwE4lMDOvMt8LE5Z8Epo2fASlTYIHFnxyaupk4DEl0upHREnx0nHOiO1ap6gH1QIfqRtvIeZ5
 /FO9tZXHFCRFHMvP0I0yBvszwaQFhOdxmzYyJyiDeQYo2j7L8mHDKWse2DLb/DnOgiBAK9BW4g/9Al
 1tRFHGgS5gnGldzq34E/8Fs2IT9IAarAAKISEteu1g8y583FKR6RYttn7ci7aELb3rENNaGqqXtqO6
 3XO7jIXtZ92IzbpuH0Dqyl73qBqBIrwSXDRpsA1RNJnM9XRWYA438HTXoWRULyjPksmURYnOplrAz8
 N1RKi8Sr7TAccueYnMTnO66rtxOgPGthiJUujC/+V1TToV7cGvIyKKZ7c8lw==
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

Display GAMMA for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index c6641acd75d6..f447f4320e8b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt8188-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:

-- 
2.25.1

