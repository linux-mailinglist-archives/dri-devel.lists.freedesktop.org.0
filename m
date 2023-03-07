Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5FF6ADBB5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B54210E0FD;
	Tue,  7 Mar 2023 10:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B100510E0FD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:22:24 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id v48so8477147uad.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 02:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678184544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWiG787S02DtKSWxIcqlG+KIKtzAOyTFykUvF4kfhVw=;
 b=N5qvRVjsAdwkNSwUwDqtgDHZU/0wk3LSCRFuNQsOm3JBDr3OBRtcxbyTkGmTGB/52F
 hW7VLvNTROUl3ArDgWOt6P6FY+tKgbL0RsdWv+WZGU7Ay6uQww5qFn720RswFnh0Miqf
 dw77/ZBUeewZwaqCkQrr9y8K3t8GEAEe9Cd4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWiG787S02DtKSWxIcqlG+KIKtzAOyTFykUvF4kfhVw=;
 b=fKnnL9uG0I9S0QB/UGEIRhIRQ1re0Vh/r2LrrRHC700/HBimcwk/OGw9pqi1IKbBqg
 Nwr34gh3yHECaZpzaZmgjfUpKLOjJPy9uKTCP9N+Gdx95kS80WixlXEyxasOcpaCRjWx
 aaCQitFdILaAa7sKmazCm4bvauAJKaz603h27tPYGfI9H6UH9fRZO5zEuASR4SSyhC7d
 BJkwS9+Z9eDCPxzXclNRxFpzkRWdwa2vmIdI3rwKoA49ogEnem9wGyQJUfHL7StowVl5
 wvBDjXdqlcw24MkXtY8tfiOZyBk+ozpHzL91czrtgwQszMaOEZZFUVG3nfDcmF7dMzaW
 8WiQ==
X-Gm-Message-State: AO0yUKWVov7s3LlaGxRgb0V4UeZuSmAdkWvh8lhYHxCOg8QbicrMEgFg
 xjqndhLbN2c1yGk+Q2nw5wW1pbV4s0/KXQwQegNGfA==
X-Google-Smtp-Source: AK7set/cEE7A/fuEMWY6hxSLCJ3Mj28ipk4/B10pbN75eznTO0WQXN7YYB5vTg+N78zcYAoZyPErpNjf82NVfx6pFwM=
X-Received: by 2002:a1f:e584:0:b0:413:1498:e843 with SMTP id
 c126-20020a1fe584000000b004131498e843mr8568332vkh.0.1678184543768; Tue, 07
 Mar 2023 02:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:22:12 +0800
Message-ID: <CAGXv+5HDd-KuDEvPXCxwMtGTom+J=rOYHPrat7Pku7wPCU3zkQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/12] dt-bindings: gpu: mali-bifrost: Add support for
 MediaTek MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
> two power domains (one per core) for it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`
