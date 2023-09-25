Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A377AD385
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 10:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716D410E1D1;
	Mon, 25 Sep 2023 08:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6BD10E1DA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 08:39:08 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so3634021a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1695631148; x=1696235948; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Kt531lV/49PNzylTwWw5xyk5QvUpAoPyaIHXHiJOv2c=;
 b=jXtL3XWp2ELNVYC1qD/wIweZs5A/mVIHNwdgRT+todbYBeDrnRX5a6U8J3jqlzITjg
 MMO16bEcQDhLSCikB2lSkSjwg7PFptu/JnLHeXmhfyjmPsIEaVQ90cllTR03gABi/Gpy
 Nz/CjrBtWCEsaVvwp9QGuAzcQNR54fkUwgrQZSy8XE7zKxGA4K/bV0qC3XsRC5zHHmdf
 AggWXmkWSCobTs6MOto2Z3AbFmTNinjgrZ4PKMCp3E75GKqyhAl3B0LqDNMLgivshf1H
 mfQm3bCkfvFtVxvGuxrc329StUd2deN9YGw91kj/zbv//8D6IpsXUKOjtoO0cThX2gfl
 vrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695631148; x=1696235948;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kt531lV/49PNzylTwWw5xyk5QvUpAoPyaIHXHiJOv2c=;
 b=uAv7BZEM9Hg+/LjOClUtumpeb1YffbdN7tTZaOuPxDEThMpytEzoWKt388Saj4EfUz
 0J+2lJZGHJTeane1pZcWfnlt/ro+ad4G9WNhxtLdkBTrn1NXkVlUHth85ZsjuI499oBR
 jC4fuHofm4wa8v8OINnilsm6uZRDz06j/jAMvJHwMwdoPl8dmp2HS+FqV0FZ9f4Qpp3R
 45iQlD3iRph5J6tpRUC+oMtZpDoLGR2k1hVC6gqEnfTfcFRvqQ2+TAn4RqZukN06GfmY
 CITxHQvTUBKNAvMF1EMDCDJLAna+KOfSZ132DO27oMu6lB3pe6mlzsdItlvCrM2z6c6/
 e6qg==
X-Gm-Message-State: AOJu0Yz4YrAmv/bGC0V4iPgtT4+j+8C8VdwqLhMQLDFYzZXVcDPev2L5
 ODHiGzz5Q9n5Pu7YyHdrPbRe7A==
X-Google-Smtp-Source: AGHT+IHx3J5ySfw9Wuxosg5Z6sG1PprCJbEmmIZOATHNOQ864gnhC7D7+VS5LClGiArL8V2tqHkKDQ==
X-Received: by 2002:a17:90a:e50c:b0:274:1bb1:415a with SMTP id
 t12-20020a17090ae50c00b002741bb1415amr3509215pjy.41.1695631147932; 
 Mon, 25 Sep 2023 01:39:07 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 14-20020a17090a004e00b0025dc5749b4csm10141132pjb.21.2023.09.25.01.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 01:39:07 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com, perex@perex.cz, trevor.wu@mediatek.com,
 broonie@kernel.org
Subject: [v1 1/2] ASoC: dt-bindings: mediatek,
 mt8188-mt6359: add RT5682S support
Date: Mon, 25 Sep 2023 16:38:46 +0800
Message-Id: <20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible string "mediatek,mt8188-rt5682" to support new board
with rt5682s codec.
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 43b3b67bdf3b..92da36137270 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
+      - mediatek,mt8188-rt5682
 
   audio-routing:
     description:
-- 
2.17.1

