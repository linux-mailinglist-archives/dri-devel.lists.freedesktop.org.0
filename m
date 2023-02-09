Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C3B690410
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B638210E0EB;
	Thu,  9 Feb 2023 09:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CCC10E0EB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:45:34 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id l8so1480856vsm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kXhHlY1h7nocfeF1bOOwlqa9GLmp058pSwMc5Nw8eCs=;
 b=AVQtBu6a+GAA0YuBWAkZuoZ1RiMhYbu91H+uxx6jbo4OyTg1oInL7ybjONKCA9fYgV
 tXH2621Wu1HMYvV00UxmOK9/0ti5yO/2O700FMrMeyTsHiUghbsmknayRo6UceHPmf2F
 MS4KjYawZ5imA3BDzv/iFFibjSN2z+XaxLaXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kXhHlY1h7nocfeF1bOOwlqa9GLmp058pSwMc5Nw8eCs=;
 b=rDQ5tFSiGJHOv7U52T4KS/1luU6dn43HilYLuDfMkxZ8zcxp5S1F8VNp3+hwDivPd6
 T/gc6axcYBfESl51vg3PitecfVqQ9MiFjFDS3EzgbHjjt/FT/TBkE0pzevQM2o+LdAVx
 kPQbzyfqIsr5IP09cyM6U9WSXhYsNBn39tv5aRalkho9aXO+iq0NEPB5widCtTjuixiL
 oCs5q4IhvQ2OOiZr/pIB3Jj23mHT4LnhQ7Fkes+aCni4bRVuENmM6VMka3EeekjC1LC6
 4d8pHyODu2hiOOtaoyC3y22gJW91g6vtgWMkr4Z2MZdFfW0LptNHZJB/GwIjzCxioqOx
 Qt/g==
X-Gm-Message-State: AO0yUKVF50nCfipAHq5Amb7SDRw6eVRtCcBAUM5kBgZndPAIx4Joro7N
 Cg50LYUfyuKkWntdImCuYLKTz/Sa05Pnc9egDQ7HFg==
X-Google-Smtp-Source: AK7set9hqvzMQiDk15uKKV/k2E6K/8sc6RF0LbaAJ63u86p8XV6MRsIUixqUkVvQiR03JwtLvsvHt9Z3UruyeBFDCFU=
X-Received: by 2002:a67:1904:0:b0:3e8:d5a8:3fbe with SMTP id
 4-20020a671904000000b003e8d5a83fbemr2433227vsz.9.1675935933578; Thu, 09 Feb
 2023 01:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FZqrGzzG8FrmLVzMd7=a23ZJPYGSy5yhYWgH+BFHNmxw@mail.gmail.com>
 <7784f5a2-3cfc-9999-0ad6-cb9cfc1f2822@collabora.com>
In-Reply-To: <7784f5a2-3cfc-9999-0ad6-cb9cfc1f2822@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 17:45:22 +0800
Message-ID: <CAGXv+5EhDGuzoBA9ZV2=3PVZ209eFq+wOOcTGVvG+gmOnf5txQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: gpu: mali-bifrost: Add a compatible for
 MediaTek MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 Fei Shao <fshao@chromium.org>, Nick Fan <Nick.Fan@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 9, 2023 at 5:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/02/23 09:49, Chen-Yu Tsai ha scritto:
> > On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Get GPU support on MT8186 by adding its compatible.
> >
> > I'd skip MT8186 for now. We have to work out some binning details for the
> > OPP, in particular how to deal with both Panfrost (or Mali) and SVS adding
> > the OPP table. We were just looking at the Mali driver today.
> >
>
> Dealing with binning is fairly easy... I have something already done for
> that one, but I'm not sure that it would be the best option.
> My solution makes use of opp-supported-hw by "standard means", but perhaps
> let's have a separated conversation about it?
>
> I don't think that skipping this would give any benefit though, because
> that is only adding a compatible and whatever binning support would have
> to be generic and 99% not bound to any mediatek specific compatible.

The binning is related to voltage range, not maximum OPP. So it's more
like fast/slow example in Documentation/devicetree/bindings/opp/opp-v2.yaml
or the opp/allwinner,sun50i-h6-operating-points.yaml, minus the efuse node.

The downstream DT currently looks like this:

opp-950000000 {
        opp-hz = /bits/ 64 <950000000>;

/* This is Mali specific; ignore
        opp-hz-real = /bits/ 64 <950000000>,
                      /bits/ 64 <950000000>;
*/
        opp-microvolt = <900000>, <1000000>;
        opp-microvolt-bin4 = <875000>, <975000>;
        opp-microvolt-bin5 = <850000>, <950000>;
};


ChenYu
