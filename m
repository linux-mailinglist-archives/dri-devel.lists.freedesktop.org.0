Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD066B26BD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0940E10E820;
	Thu,  9 Mar 2023 14:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3F610E824
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:08 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so1333714wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8/8S9zAhITTz9ARvUIM6rB3SshY/72TljcOdk5LeQ3Q=;
 b=Paw4lE7rgteiCmJbbCRSeVVGrswcjh3BFd8nPfVyBZ3qdom9iSJHtdx4mBHU8s71/G
 M+T5o6EMJy8BABjhb9Ep9NOpZpgHbYyOQuzm0hcfi1uXS3fHungtEqsxb7G7TMBKpadj
 dq14YlhWe5BfA+ubm9gQsad2YUTGsbmpq96lPY9MMY0qqmOLubh9rZGMnujrIoKZDF2c
 jscwueBQ9tM5SlsFHiJkgg7gu8MPXGIwDsjX0DBl0vzxK+WRqfZZMJl31eN6ElPolkWs
 I8dDxaKxdZX9rKZKEveZ9rrXk3nfKJnvmwlHT9z0kNJ1cmuTqfOEAuencjDWmeOjGagB
 BwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/8S9zAhITTz9ARvUIM6rB3SshY/72TljcOdk5LeQ3Q=;
 b=lNq2pLi1V61s78vqDxCtFWJXWOLr3F/bKNXNiwr3uW1Yeoa2j4YyQDdTKK3NQa305a
 0e3qcCsUQKdoYptG2Ag4bdXH1zbOldD/17Dd++9wtPiTymI9k6xK5dALkBJHtisWrNtC
 YXHGeE9Me6yHgVE+J7Aku0lXqC3lOl2KSIlCUOpMRcmidlqpfNFIylym5Wnrtmc7NvCG
 nlF9vwVM8PfZX3QeDE+zC/arYg/CEXmnZ1sIC21EnFP2hkS8c7Ir6cqaDDzAWz0AL64S
 VxACfwrrhsAT7l3677O7+RtBvtsecZDdQ/IdGhfMBUzEVJD+V6by2+BF9c0aYVwCKSEa
 sDlQ==
X-Gm-Message-State: AO0yUKU9TNPA9FOH0Wu4g9lb5c1FxMPlQlMC+xOin4Pk8ArawX9vpL1Q
 DZ9jPpv0HKmpxV1yW5spK5ap2w==
X-Google-Smtp-Source: AK7set9TwqlVJpH/8L0NR2uEUyatF1sOiuRce+ItUudlwqE8a6hDQbfysi1GTjePfgyv2cl9fWrcEA==
X-Received: by 2002:a05:600c:3506:b0:3dc:405b:99bf with SMTP id
 h6-20020a05600c350600b003dc405b99bfmr20382301wmq.15.1678371786930; 
 Thu, 09 Mar 2023 06:23:06 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:58 +0100
Subject: [PATCH 09/21] dt-bindings: display: mediatek: ovl: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-9-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=f+LlFWqL4iGgBIpxFelONT6kK+k+XvcRswfNvN3MNAo=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+di7JzQQWl74+GKipXG0KRdPPts/MfRxqEUVj
 mCLLlwKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURYYNEA
 CiXLD4ykIDwMU7sPiuItu/LUUcOiha1Izgc6NlWsxwBtccyIEZOxGxwTYFe/zYzCasLTRY/ux4E0F7
 /B75r5GMN3ef5WSWHAmw/1ogSmADe9IN+pIyoVoyAYewx+upkEDW9iXk9IH11rGJ3xxfaQSy5/Ww6k
 4kdB20shkoPrF4yHBs4kKBKFwHMf0gnNqxG6SwGqiI/hhI//4jMAE1//hUbefOCylvKZk4dUdA7gwV
 VjAISC7+SEmpuYuK84ami0QwftaIgZq9XZsjdV5N9iJXIxIOcDcpynPSR2EgZmTmFjg0Ce7I2Cv8ua
 3M2sY5K7ovJyJ6Z8aN0zRdj46P2n6XViqiqD9vi07vJxj/yQCcJeCgPvcRdel8ahAuFiaTL/sWxdGm
 8g6ldbUOu+JbKnteOZQtwp5vifrRz75asn0P1YuaQkuYzGVwLGt4Qj62xTtWkdM9qPkfa5mGmAKI8v
 BsoPIdLdz16pcViwP6bkRftEoP1y9+URkKPYore33ra9xLX49V4pTuPhMVoGmaDZWCKqz0CtYtiUb6
 uapQIS/7ycwhGVDvTYtg2DiH1gFld9VWQoKjqwDdbrqf5pQGfwQOmrZqexT61gdtajcNn8PzoUXVC9
 My54ek3cXzXKpB7xh/HxWpqAprRIskSMxwuKvvLPhPbUThj1YvCFXTdhYoUQ==
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

Display Overlay for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8192 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index a2a27d0ca038..20e4ca4fc915 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
b4 0.10.1
