Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A1D48701E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 03:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE2E10EDD9;
	Fri,  7 Jan 2022 02:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AB310EDE6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:02:17 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id 202so4532344qkg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 18:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Li/jQ4nlT3gPpvd1NyTQnIxzc9JA+p42BI5110gVryI=;
 b=D48pMHDKbceVDw3lQnRewim5ayodaSN8T49QKqKck52RgM8Mk1qDNvXzqQZTnFoxUT
 cwf++gs/8Oewu2oZnv8+2UTTs7QjqQsCOUDMLb0NapFC1w3DOCVRufqCim/OZ4C9dUnd
 +oFMPFlkmFwfvmJkbdujiDwc5O++ZtZBcOkcjZZr3S53UF7oR3YhsJXqyoY14X2DverP
 Xcr+jZjlMins+iJLvn1DvIBZOpTRisZoI2kgWnfl8q0elZmlT2h63bzyNpNF+n5BWqPE
 OU4hOI1VfzBTi4rMdyRztgoAn4DZL0e1MMRPnNtUXCBRL4xOzpTOasUJgChGwtosRfzR
 uiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Li/jQ4nlT3gPpvd1NyTQnIxzc9JA+p42BI5110gVryI=;
 b=Rzxb3Klr7kH8eX6rVCYhWyE2IR7WK7orBokPvIkEAGGj596oSV7DneKAUkYRj2O7El
 JhP1psOYJjb1m9Syk9KWnMNOq7WnBHbyjF9KGqzxqwuSmLn3dctgktHOmkSY4wuknnxD
 Kek+yLSgfeXsHbFQyBasqPgpCrALkBbsZSCo1koMDYBPC3UgFizWdBES/1Y1IYG90Vhc
 sEtTGe5FxzVJLiuc4OATaZ0CXNZ1ujOXVNl9TlkIDK6cx3lx+E2Mdn3ENYHCx+BxRhEb
 P8Bm7191g2gAVRv6QOQkmY+SVujfMuD1RuMOHZmy3JuU2VmBN4QTogwRreZbfOO0vcpl
 DczA==
X-Gm-Message-State: AOAM533OGe4rGnfl9SPePY/5z1j1/eBnLl35oKhZaZwtFNXVLxciQ8Bo
 SDYSMIKfwoyD236/d0nbXOI=
X-Google-Smtp-Source: ABdhPJyFLUnXGpl/Ej//ERbkZnC0lZ7GVhRcnFLH5j/9dsaix5WLKtzn9XSDUBszz5HWPfy/+38YFw==
X-Received: by 2002:a37:34c:: with SMTP id 73mr44285797qkd.726.1641520936215; 
 Thu, 06 Jan 2022 18:02:16 -0800 (PST)
Received: from master-x64.sparksnet (c-98-233-193-225.hsd1.dc.comcast.net.
 [98.233.193.225])
 by smtp.gmail.com with ESMTPSA id m20sm2960331qtx.39.2022.01.06.18.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 18:02:15 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: 
Subject: [PATCH 0/4] add pine64 touch panel support to rockpro64
Date: Thu,  6 Jan 2022 20:22:06 -0500
Message-Id: <20220107012207.3779449-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds support for the Pine64 touch panel to the
rockpro64 single board computer.
This panel attaches to the dsi port and includes an i2c touch screen.

The first two patches involve making the reset pin to the Feiyang
fy07024di26a30d panel optional. On the rockpro64 and quartz64-a this pin
is tied to dvdd and automatically comes high when power is applied.
The third patch adds the device tree nodes to rockpro64 to permit the
panel to be used.
The fourth patch is an example patch to enable this support, tagged do
not merge as this is something for the end user to enable only when they
have the panel attached.

Peter Geis (4):
  dt-bindings: display: panel: feiyang,fy07024di26a30d: make reset gpio
    optional
  drm/panel: feiyang-fy07024di26a30d: make reset gpio optional
  arm64: dts: rockchip: add pine64 touch panel display to rockpro64
  arm64: dts: rockchip: enable the pine64 touch screen on rockpro64

 .../panel/feiyang,fy07024di26a30d.yaml        |  1 -
 .../boot/dts/rockchip/rk3399-rockpro64.dtsi   | 80 ++++++++++++++++++-
 .../drm/panel/panel-feiyang-fy07024di26a30d.c | 11 ++-
 3 files changed, 83 insertions(+), 9 deletions(-)

-- 
2.32.0

