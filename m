Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B33B23D4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 01:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01DF6E948;
	Wed, 23 Jun 2021 23:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF006E948
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 23:07:27 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id s19so5540623ioc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GZLDpuA79csUJoyxxQRsR7ORuZFy0jjxYyRC2e/q9a4=;
 b=lX/Mty6StYtIynI3ilX7Ff68Kkn2SjBUz0+jtpZ6zX9JARhjaUBoqUAd36isYzEjyH
 JSR1wIJokfsrHcrPxL7C8U63w0bDqlX2Jolf8YHFnL0PaWn09ZPu9NtSzzH2W74MtB95
 uKR2JLoHnxaEflcoHM53dYGR8dOJego/kKAotuhK16MFod6brx7xT5qIA++PMUWoy9wB
 gE5LM4B0+xXyKdEaWnhPNC/jK2/Q+Ih3siEq7TbzZLGqqnd87yoWt0CwVTTBjp6gWsyx
 /n9JNFG5rsHd4LpNM1kATj+R2ubKlTCXTubNPCp/aPSNO/7kHygpnuqRZTtn1AF/SVnm
 I8lA==
X-Gm-Message-State: AOAM533hrv2mgJw6VHepXjHgXoJ1fvXuhXcha0CMcMEZi2a844tPL3va
 p6UzFEZ4kJbbtHGeyR6DFw==
X-Google-Smtp-Source: ABdhPJysSMr49GWdevfUQIaAcqS/oiimDgEHRxZO4ul4XB2m7ky2tCzGBT3YSnBk7BCX9Fdml+iFXg==
X-Received: by 2002:a05:6602:2595:: with SMTP id
 p21mr1570908ioo.51.1624489647011; 
 Wed, 23 Jun 2021 16:07:27 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id t15sm694356ile.28.2021.06.23.16.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 16:07:26 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 0/2] dt-bindings: Convert OPP bindings to DT schema
Date: Wed, 23 Jun 2021 17:07:20 -0600
Message-Id: <20210623230722.3545986-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, Georgi Djakov <djakov@kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OPP bindings are one of the most common occurring bindings that are
not yet converted to schema, so let's convert them.

Note this depends on a dtschema change in property-units.yaml to allow 
a matrix for opp-microvolt.

Rob

Rob Herring (2):
  dt-bindings: Clean-up OPP binding node names in examples
  dt-bindings: opp: Convert to DT schema

 .../bindings/gpu/arm,mali-bifrost.yaml        |   2 +-
 .../bindings/gpu/arm,mali-midgard.yaml        |   2 +-
 .../bindings/interconnect/fsl,imx8m-noc.yaml  |   4 +-
 .../allwinner,sun50i-h6-operating-points.yaml |   4 +
 .../devicetree/bindings/opp/opp-v1.yaml       |  51 ++
 .../devicetree/bindings/opp/opp-v2-base.yaml  | 213 ++++++
 .../devicetree/bindings/opp/opp-v2.yaml       | 475 +++++++++++++
 Documentation/devicetree/bindings/opp/opp.txt | 622 ------------------
 8 files changed, 747 insertions(+), 626 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/opp/opp-v1.yaml
 create mode 100644 Documentation/devicetree/bindings/opp/opp-v2-base.yaml
 create mode 100644 Documentation/devicetree/bindings/opp/opp-v2.yaml
 delete mode 100644 Documentation/devicetree/bindings/opp/opp.txt

-- 
2.27.0

