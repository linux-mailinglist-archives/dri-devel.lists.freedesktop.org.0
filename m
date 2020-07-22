Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F11229039
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 07:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DF18984E;
	Wed, 22 Jul 2020 05:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4478984E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 05:58:26 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id w126so439669pfw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 22:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iv7QKTOnsxus+CuHI4vvy3vYG7WJhwMve42jwP65b5A=;
 b=Q8ZTcKkPG2FtXDevUXUXT12Cpg5/QNeaH242BUf0y4hS76xUFB35tplhoVeBGSKbS4
 nxJjcK2bjH2Ng8pExvUvJglYqCEh2TV/OysI2eX6f3Ji0ukDLKJ94gBLHct284DHZUU7
 toCbiRUHv2GuqSy7+56Y+0vMFa/fd87OE07bWJ15ufJYS9VQkOXaxTIeb9SHk5J1Ykpi
 uvX7Lzdf1g9+d5sRziXlGX9eGp922bso9G+WGwTe0fw5wtKFdsa5GHTVx5dexv25xvqO
 wFO7hzq1D/GCtGeckSZ25talOW5mcJ/PrNdI7oQiGF/d1gaVIFDPt1szOx3Vzuwv6Ut4
 3wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iv7QKTOnsxus+CuHI4vvy3vYG7WJhwMve42jwP65b5A=;
 b=txbSk3eiKcw6okMumPnqES069VAJiM7Dl/GI2VrD4TejXV4slQ14KG19uS+ZkceYxZ
 OFahzK0uSx4NphdPfFF48fytul/1WBOiqqpdyiKy6ae8Li/IlIbAVwk5P+xOEtDXmJOc
 oXzHliPiGVpPQxp5K+BeP7IKolUFHWucd8UfCLv1d0b5vcL37/PGBRoQ91TAQDNqbRC2
 bzIIx0FhRiLws5VrCkcn1f9lEisINC0DDpKKRMUSiw946qGLyMKiu0R/0+IHHP4ovgVa
 Ok+Bc+23Xs/NltW2+ehDQDWZf05lfEckIhq/HenTTsA5sB+yHAXmhIUQghPrT7iJcgZN
 jrBw==
X-Gm-Message-State: AOAM531iD/aVZmfM2ze1UoDoXZNW5BCHD4HCGz2beqSwXNVnb7Pj4Ddy
 Z8mEoYbp+JhCNhame6DCuxtP1Q==
X-Google-Smtp-Source: ABdhPJwCCobUwQ+e2qBFBRCdirZxriYS+99wEqbUE93tZXMYMdKpU/YWU6y9v2U/frBlQbsxu1858Q==
X-Received: by 2002:a62:33c5:: with SMTP id
 z188mr27044385pfz.180.1595397506096; 
 Tue, 21 Jul 2020 22:58:26 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id e191sm22144010pfh.42.2020.07.21.22.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 22:58:25 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/2] Add support for Tianma nt36672a video mode panel
Date: Wed, 22 Jul 2020 11:28:14 +0530
Message-Id: <20200722055816.20768-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Poco F1 phones from Xiaomi have an nt36672a video mode panel; add support
for the same.
Most of the panel data is taken from downstream panel dts, and is converted to
drm-panel based driver by me.
It has been validated with v5.8-rc5 on Poco F1 phone; my tree with other
dependent patches is here [1]

---
v2: In dt-binding, removed ports node, making port@0 directly under panel@0 node.
    Also updated the panel_on delay to a safer 200ms as needed for latest Android.


Sumit Semwal (2):
  dt-bindings: display: panel: Add bindings for Tianma nt36672a panel
  drm: panel: Add tianma nt36672a panel driver

 .../display/panel/tianma,nt36672a.yaml        | 104 +++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-tianma-nt36672a.c | 859 ++++++++++++++++++
 5 files changed, 982 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-tianma-nt36672a.c

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
