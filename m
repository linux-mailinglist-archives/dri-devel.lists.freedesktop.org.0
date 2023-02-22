Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2D569F06E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 09:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1861410E427;
	Wed, 22 Feb 2023 08:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CAA10E427
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 08:37:57 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id x14so7676954vso.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 00:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sComzmbCpABMxGUkRsCiLtkyNheYwmjw48ljpFz3J24=;
 b=lj5Wy8MK1mwapRAvUlPMKSor05OyZO5FDMUF3vmS3b4AA19H4/OTNnPn7urBRBWgNH
 pDCjTxYoDNOOE7BuYRmNwu8P0aIwLJ3yduJkfc4bTH71uQwH93SttIJkswsYVXhj1J2Q
 T6Ad3ZCsTfC91iXkA1tnIcoklpBf4kIODobuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sComzmbCpABMxGUkRsCiLtkyNheYwmjw48ljpFz3J24=;
 b=aAUS517hyzdAHL154MqXjlP+y1hb3Qq+l4dL0DkQ/hbQD7o6UW80vmbITI3QjlaD+O
 3N7l6mm9rVZsh+f/EdgarDFvK/TrodGh27XuOLVSeJtDDlBr+p5sFlmqpi8/zcN5wqfH
 xV5R3MR2iUuvlHlVf7Ro4JX9BDiWqksUH23/tTRlL3AI1qK+a8W7GhitqOL7fDWGJYUT
 oMMS1NVHg/b4JCNs7/vZmewxpDOwPUzLCDa0PJwnHwYFINGEGMSKsppxUgQB3VBo3+36
 loZMXJZHuWanlWvfl40oCAIJRqcd/whtXm2JaxqzZo1wjnkbBC4XRYQUnc8gqarB7Sfc
 G0Ww==
X-Gm-Message-State: AO0yUKXGqWQBtVp7v6CEyXZjWCqHtJ387tIPq23uScz8zRsVas/Xii8M
 2cd9v9oohp4HenHXdqVuqnrdkQn8xOKmOV0I6M++nQ==
X-Google-Smtp-Source: AK7set9FVEBAsLpdo2AF0VsdpWJoDj/pIevIOUHBKq0lW8mgWZ/QSNKhLwdL5NxD1KgYlkJH1/ua8amP+kkHXYKWlsw=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1571526vsb.60.1677055076838; Wed, 22
 Feb 2023 00:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:37:45 +0800
Message-ID: <CAGXv+5Ed-5Nq0zNzCGzez3fnW2yxW7zFx9B6k58Y4yb8P+hvpw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: gpu: mali-bifrost: Add a compatible
 for MediaTek MT8186
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Get GPU support on MT8186 by adding its compatible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index be18b161959b..43a841d4e94d 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -15,6 +15,11 @@ properties:
>
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-mali
> +          - const: mediatek,mt8183b-mali
> +          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable

The MT8186 has Mali-G52 MC2 2EE, while the MT8183 has Mali-G72 MP3.
So we actually need a new entry with two power domains.

Our downstream Mali driver & DT use just that.

ChenYu
