Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297FA5E98AD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 07:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C8310E1F8;
	Mon, 26 Sep 2022 05:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7863D10E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 05:09:38 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id nb11so11595030ejc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 22:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vrb/QOBCOlwnil4xOu2RseRmD1KSKb1sCTEzWBoOr7A=;
 b=CjyMr8K5Wev1LqZH4hcWNR4hCa7hpv03fz6sO4CQoigIqQfzbByI+PeL62qb6OS5f6
 B6/UPRBG20hOIgzFCctOTxKGY7MWWmlbPU/fK1U2S6LaPHoAmR3Xm7v0Rx0GkuSc2vyE
 VrIRqSRv6Ih1HnvvylK+fBM5Zj+XYDUmwevzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vrb/QOBCOlwnil4xOu2RseRmD1KSKb1sCTEzWBoOr7A=;
 b=Rl33pi49XS8v+dLxAW6zEIU2iFfBkNt0QCjfYu0OAKQu8/QYVNAizjQLMJKPDGHdjQ
 IHsUGUArPo52iaOYRbMFIfMm4ebv1nEguvDfbPplvUqFlcIziBOWG/GTFLWbBCeUpvYt
 lsh8oSCCfQ5a33AKQ3dBizyzws/2ucKxST8yrehxYdjZSr7H8xcc0kCFgT/07WG7i2M2
 0PWxNLVgCyaak1uJlN60PqLVhMpJlUKMJAoOkjf1pxbkVX7ULRPmEGNrCYPdVkYsD/Up
 ExYpxNaFlOHAedAoYcc46NfCJ/xdWW2YXKEThMWCqDeLL1CCK6SZVJHLeeK+Agjc4cpE
 qQTQ==
X-Gm-Message-State: ACrzQf03ZN1683Ycn/KIF4QI/6oCUBo29G+jUSI26cY5ZM+diUI4e0N3
 0Qp5ErQBqc1ieqCCMhBeeNKQauKbh2pZbXwwguCmXg==
X-Google-Smtp-Source: AMsMyM7cfU1/JdOhkGvuQyhuRRKePnKXOOE9bin+YefFjefQP/PV7uR2GeazW9Tvxl2PgbNtWjbFZGX0+Elzhi37gGQ=
X-Received: by 2002:a17:906:8455:b0:773:c45b:d970 with SMTP id
 e21-20020a170906845500b00773c45bd970mr16504544ejy.46.1664168976587; Sun, 25
 Sep 2022 22:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-2-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-2-4844816c9808@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 13:09:24 +0800
Message-ID: <CAGXv+5GJrjxG0pEGqseEacz_KFCRhWJSiLoiwuwwUTaSeO0RBg@mail.gmail.com>
Subject: Re: [PATCH v1 02/17] clk: mediatek: add VDOSYS1 clock
To: Guillaume Ranquet <granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
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
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 12:59 AM Guillaume Ranquet
<granquet@baylibre.com> wrote:
>
> From: Pablo Sun <pablo.sun@mediatek.com>
>
> Add the clock gate definition for the DPI1 hardware
> in VDOSYS1.
>
> The parent clock "hdmi_txpll" is already defined in
> `mt8195.dtsi`.
>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
