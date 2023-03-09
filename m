Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30BC6B26C1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC45710E827;
	Thu,  9 Mar 2023 14:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB5510E816
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso3723938wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371791;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0qqXf5bg2DjJNJhs1P6NgIMh3qzJNF/ahtx7g412ZUk=;
 b=ndfvLtOXYALHaDJoXtdSp49ENX7vae8EKYXuZFkLtNANAPIAw34WH2YzswD/Nooya8
 3ebhfQvLhNLuXY991eVi0dufC1kR0NJQjyFafWcknNRvOk6qWvsjPYMTnnLUGOhnRPxp
 XBamqA2qJLM5tfm8kDGm/L3lZSPFFDoO0vSgdKDq0rpU9S7KIX/NQrw3scveeaH0aocX
 PWrHMSaBct8mxhXYatGIDHQaJ87pKP31naX6KtwQWEONyI7U3fNqB5fivuL17n607fMD
 9NN187wt/KupgjKichvlHjv+ExNGdwvTXMVQfMAIt24lt1BRmC+LTst+jCBPSz1bFigX
 gtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371791;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qqXf5bg2DjJNJhs1P6NgIMh3qzJNF/ahtx7g412ZUk=;
 b=3bTabkwkNMCsu/SUJqBdicRBDviGpdqslhCza5j8LK8zjeLhIioi3U33AaKVjt9XrN
 bqZda/gOFESGHD6fvsJohWkIOB62b1UFkvE3yx8TNAPOkdm6TlMqrsuLXQJb1x31fk9T
 clMo41WOBUOpxagHCBX8sV5N/uKHryjMgHHWIosqFZlwAUggtF44D1aD3RFvbr5qBhhs
 Op8+7/l8y/dz7nGfPbmgqsYWXQr/tJAReJUA6nf6s/0p74c/2vYAhLYRcvbbiGSbgKTo
 qe5MGHRIPw8flZVF5hc6awfVIgGesOws958kSbo02Hi+puK6zHiCIzHiCkBB8asE8zBK
 n43Q==
X-Gm-Message-State: AO0yUKXrfqnsi7MPBP0KxKAILDeHPt/NvLUajTeDWfxH8x24weoZVQyw
 JyMnrWhv0l0etmhcgpgz5HEjSg==
X-Google-Smtp-Source: AK7set+ZmmzWQ3/OgN4ZN4jVYsGr7tlWPXJoWbP47hxERR2B4SJlxzP0Kn/jCQ5T5s3oDQcnLlQkow==
X-Received: by 2002:a05:600c:470a:b0:3eb:2de9:8af1 with SMTP id
 v10-20020a05600c470a00b003eb2de98af1mr19799735wmo.32.1678371791471; 
 Thu, 09 Mar 2023 06:23:11 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:11 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:02 +0100
Subject: [PATCH 13/21] dt-bindings: pwm: add binding for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-13-45cbc68e188b@baylibre.com>
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
 bh=kwXNFyz1fOvgD/9TFtO82uJ5GaLXf7euau/EfzDL2xU=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+imHhsQxqvhUMp6CB6RG/Z7QlHhbuEB4qhZ/W
 nCE1zsmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZnDD/
 9HyJuOJIaZ0hAG+nBq1j7h6AbNDdMcZdzmMsE49awO2lTEJkNp4T+infRuAwKaenvmQT9F6zDOxBu0
 o8RSBTjcQYdNMN7kVUuNL2o85Twc5+iWy0kqVR8UNgBpQmdMds6ecyW+Z5dc0R3J/ZAn4NcUN1j4eQ
 2vueV9asBfmi6YN1FMJ2BKItAMlzNIqG9mQhYxbazbBaBnBESu3Oz159/le0uwfk/0fx4XXtfngJd6
 vAySbbBaZnRVep2Ky115GP3RlNXblBeN+0RpA7vPaINCFIT/s6tvDrYHrhio43mPAoUDR+p+iQh8BY
 btjIAGQ9ot/n8GC7VFnPK4NRl8Fex+PisqrF35RsvAos46iLMGf6QR2M9edbehXHhJk3UzB0EbDX/r
 vNV6qLdoaTf6d4VQtVNIqHi866Abd71ICI8cQ6+TTvXde/InqVYIFZ3gCGacdqbfZg/YBvCTuYuh/7
 LXFlMrLKWCgWOeymxy8eNDpvJgVxcloszuk+mj+YpimxwXMEvfbP4+97FhZoh7G0MynbBQO0s2HeDS
 145C5YHOxv9Tq3ouPIoJ99UgRyTUvrmS3PtX/EFB7C399hmrZV3ucxamRojktLfRRUE6ZB6mJ8yoqi
 fuBJGEBkA6C9sDxeMsACrza/GY9JsEcYJs17H9A6KIBU7dD/VjFS97DnkmnA==
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

Display PWM for MT8365 is compatible with MT8183. Then, add MT8365 binding
along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 8a0005a8bf40..889d2b376212 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-pwm
               - mediatek,mt8192-disp-pwm
               - mediatek,mt8195-disp-pwm
+              - mediatek,mt8365-disp-pwm
           - const: mediatek,mt8183-disp-pwm
 
   reg:

-- 
b4 0.10.1
