Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDF70F0BA
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 10:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F00610E5B3;
	Wed, 24 May 2023 08:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5026E10E5A0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 08:30:49 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30644c18072so302087f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 01:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684917047; x=1687509047; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFkeXmTsUMY8GSw8DO1YxsHt1wzgz+ONEfDUI+8GUAE=;
 b=Ky164TgIAjXoNCRewjAvpvhOJ4Fq2aqesYTLjaP4MsCdZWaK7nNI1q4ACUHyf0yARP
 khE4z1B4Wq3htHoGGiNu+1mMFFRKUkdv/98piGwOHRcsYTzoseEHnt4dQ+gSAMSTXTSb
 1j75EhptJA+nEMLiybke6sENFCRCPbdkvcEZISCZtt8Ps/JPEsyGSZrxNu9oMC0r5Ecz
 9O72t84s/Ms51QhGIloJa0e3TS2IsckqzZwn1CpJz4yOfg0/yCZbJbjr8Q0u71l0fRdV
 HudbAm0rHClx0bTFzAbc85WUmKaoTxiHzJUYrkQYS5aT4NIx1ofDL7RZIuX5kDA6y4nB
 IbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684917047; x=1687509047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFkeXmTsUMY8GSw8DO1YxsHt1wzgz+ONEfDUI+8GUAE=;
 b=PY5vhfKF3MKiyemFtNVb1re77F//4Q4VJfjLSL9xkUHlyU3wIC5dKdUzY2/hVpP/lp
 M86y++x2nR9sXXyrad1VqBY4YVXQznm/OeoomvJqlWbB5Su4xnJFRBc1LrQcQqzkeAzz
 c7X7SoCyvb7Eg+9b4ABgYFrzdbexGrt7Ye3IC38wR+pL1VL6fYnKouJ+E3lIrduE4xSq
 zfAFZolMnS0EqPYsjq9P9jk8dvnvHgWGogxHl8K8gtaa/awNlZvKfIcFzl165VrHV1Sd
 yz83CIjuMWU+HTU2MqIHcJg0LvrtldMGvhDOxMN9RKX5Y03+XaaDLAK5U5ZwnJZ59O2M
 wjCA==
X-Gm-Message-State: AC+VfDx2zs0GToxZ/RDKAk9HNNkKBhUYJVdcJOLupNpVWQ3ffObH8qGu
 l6qz0hd8ECXhcN05KGuxAMMUEQ==
X-Google-Smtp-Source: ACHHUZ6JqNOn6TctkUQ6E/Zh8dcU2trBSmopBqGdD7CTtYD4boZi1njHtt373XgOG0bq+Mr+DhVFKQ==
X-Received: by 2002:adf:f80d:0:b0:306:4613:e0f0 with SMTP id
 s13-20020adff80d000000b003064613e0f0mr11012487wrp.68.1684917047325; 
 Wed, 24 May 2023 01:30:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d484b000000b00307c0afc030sm13871832wrs.4.2023.05.24.01.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:30:46 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Subject: [PATCH v3 1/3] dt-bindings: phy: add PHY_TYPE_CDPHY definition
Date: Wed, 24 May 2023 10:30:30 +0200
Message-Id: <20230524083033.486490-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524083033.486490-1-jstephan@baylibre.com>
References: <20230524083033.486490-1-jstephan@baylibre.com>
MIME-Version: 1.0
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, khilman@baylibre.com, mkorpershoek@baylibre.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add definition for CDPHY phy type that can be configured in either D-PHY
mode or C-PHY mode

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..a19d85dbbf16 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,6 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_CDPHY		13
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.40.1

