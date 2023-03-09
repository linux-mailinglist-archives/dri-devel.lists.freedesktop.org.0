Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA216B26BF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE8710E816;
	Thu,  9 Mar 2023 14:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE1A10E818
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:07 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso3714951wmi.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371785;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bQBBpVaIgUK0Rl4J+27gzzqfLCx1MN+pd5yYkTAPDPo=;
 b=6bENydDnCxC3x1qhCt63nkYEgu5eVEPjpplUjdxJBGpmG64LE2yex4EciZPHnnqbHC
 FRBBrYEpSBAx2vPl/dV7u3J/LlBHFNrvhyjqeGXefhLUeTA1qn8tIems4Y0W2+RnYvbU
 Q8a6X0fxw51Xvk1pzAuGqMzVq8JjuaSarXwVpJbCWWcYezZc6euQYLtO6HR9NFXm+H3R
 4rA35d16xymk6Dz4SqgU+4EQGIcdnZyzTE41riP3t04O6HSsuS04a8AxtKkMtXsK6fyb
 NOoav2EMZtD1EZS6L3/xDXg3IzdIz6Mbm5R8jh1A2r5ZoSB68J3faY9gB8gOsLeZRL/p
 2Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371785;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQBBpVaIgUK0Rl4J+27gzzqfLCx1MN+pd5yYkTAPDPo=;
 b=X6XBb0HjS2VK58peHKXOccFgeUXzcTfMP86OEZpaArIxaSPCegUiXuw9PYAU5iXKtV
 dFc1BioH39VUy2GuZ9YuXfwaesE96lSAzqlFXlfZEaydZCJB0T0pTMGuMn4fpEJzW20s
 rpb+L9XodwmemvZ4O0AGV/P/YVZrP3LZVCYUXLdoaEK69+HX8EnCLz9HqJ+aZPDJo0SF
 h1c62Qw678qvs8F6RiEJQ0fajURMFjzt2lBKHa40zyrMsjU23nHjtig67F/PmrcLX/9n
 IHejKQGqAXDh/rYKagU5qt+tUkGJnjfRjcAqmaDG7udd/GHO1R0bdmXyP1sEnz256xjo
 B9ww==
X-Gm-Message-State: AO0yUKVyNcehY0w7jj6tF9Fhu0kgL7qnQzOqWi97wR4tx9G97osWIQQ4
 FClpuoQvp4PuZ+a3s3t70EWRZnZgoui2hhomiAM=
X-Google-Smtp-Source: AK7set/Zn5fKLXmXdaKz4vQTYomyjS35f5C+OYc/Sfrm9FP4uqi4MCSseAditkhKpIAn90H5J/vqGg==
X-Received: by 2002:a05:600c:1c9e:b0:3ea:f883:180 with SMTP id
 k30-20020a05600c1c9e00b003eaf8830180mr19624210wms.7.1678371785809; 
 Thu, 09 Mar 2023 06:23:05 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:05 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:57 +0100
Subject: [PATCH 08/21] dt-bindings: display: mediatek: gamma: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-8-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=5HYYOhtuGUlOpyHwZ7LVltjoUezJ19v4l/4h/6CSVGo=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+VhKJ9LQzHj9VxhsKxYsiydf/VF/RzLpd9doS
 p/S1TfeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURV68EA
 CrpSeTubBhwYkMws/m8sMKVEppmg0ezRxgHhFia1QKuf/Qb/X6+dGncxyjlZNfGS0ar826v6ItsCP7
 F942GR0ouavp2NDUZ4ZBvTzuC9v/RYUivU6ijr54JQSDNpIZt3Z/1RIf2TnwC7cHCuU3rhdIP5+/Uh
 G5UitSz+osQKq5KHqb+uaYDmqAfhJtaE5KSDuS5IzTZXdk8HDyXMEhcHnLQTZqSkFgXsfAb6P63wD/
 a+7e69DuUGhyFTlEwcLzeTGxsRs5e3atv9hIj2IkjZI742Gs7iC+OkCXNVMzMhnxaJHDTfCU+OVb5s
 yjY0Zj+zfs//wU4uHKb7aZTpeazWvPdKFNt1SXoVaOexx8St+YVfnhn5btj1PuBKhqwzyHFYctXuau
 IG7/AD7kq7EpmLnNZ8PTW+xGoFKWt9cV33JNTLBr92E6EBpiKE5ZCouTYJMRi3QL0+mBNJMZlvHA8f
 6l86QRox+1zuXWohcQYFt8NFfXIql5tV4AEGlCC0FUndzCtn+QkSShypWYRHCWePclo2R14EoBCajf
 7q6J/xdUo+1xqqMBxOQGV7y8OBSRpHeRxvVcd2emG0x6cb43LKA8snoWHvXhJSVpemAWojP+twvzzs
 qEmb9BQUClARJ4ftqmFUB0T9vgoDIxmyvrsxFZnjE+/4FvWifJndDTgwq47Q==
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
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
index a89ea0ea7542..f54859cfc97b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8186-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:

-- 
b4 0.10.1
