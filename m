Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E41668FD54
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 03:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A661210E0A7;
	Thu,  9 Feb 2023 02:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5024F10E0A7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 02:50:30 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y2so195155iot.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 18:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BYIk4P2p6gp1gkykneVTXGgTOGI8BQeMJrJn0G8vBFQ=;
 b=HtmNzDuqZVPNnKVKdiDx+Z3cYsXnlZoWJEZPqX81nlx4s12FG5mKWN7Iz8QgRroITS
 uI/SE/a6wLxuTbZ2XqIIRFA0hAyZXeC//DLKyZBwhoYviw0jixTfnpdaGsaTmcSOV3n6
 NcyRBoPWk0t+FdFXhhVMlviUuItG+Tvvb8OQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BYIk4P2p6gp1gkykneVTXGgTOGI8BQeMJrJn0G8vBFQ=;
 b=31y4unuXc2hmxepik5wxnStgXTOeqtTXAyeRWnRXrDxUwlaMbWg3CTXmfh6S/hsBOw
 ETVqDAfzFQXwTaXCNbxIjc31VJESRHrDr6mcUfYaZ4HPWX5Y0aNhmxq2exqZ7LmRG0ZO
 tNYpS7kQQvAM6fX99ojsKwjWAWvKoI0wwhUXRo3j7pPE34A7Snv7gNM6JrJ6tuDOlFpC
 gZ4PZdkCr/0cPd0mCsWKtXuxqV4WqIXsIfoBbDBvNepcxHTKjt7krEZ+pgisPgd8FVb1
 eXBTIil0s5KtkKIS6md5IiRokGNdPUyXz9Sc6BkAyaJ+WCPz6eUTQ1YC3JXp72dQfZHR
 P28Q==
X-Gm-Message-State: AO0yUKW++lxrLRsB9SutoFi6j6UXDAHkkXnoURfWuMskfh+7lRbKVCcD
 SFdDkee7Ep0Mzy8n08rnLDjSAXKz16cxtqTI71ylgw==
X-Google-Smtp-Source: AK7set+bvKsydzGygJFYL5iQOvjw3Jv58rqgkJyZjXTUoGYryQCk+flVM83OAnzthJ9iLUo6Kt6Ev143YXLr6ftrCik=
X-Received: by 2002:a02:cc37:0:b0:3a9:6b85:41ed with SMTP id
 o23-20020a02cc37000000b003a96b8541edmr6496673jap.57.1675911029590; Wed, 08
 Feb 2023 18:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 10:50:18 +0800
Message-ID: <CAGXv+5Gm=Onu2RK+skLgN4Kzo9yP1n5Zb48oQNkQ019838QeEQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpu: mali-bifrost: Don't allow
 sram-supply by default
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The sram-supply is MediaTek-specific, it is and will ever be used
> only for the mediatek,mt8183-mali compatible due to the addition of
> the mediatek-regulator-coupler driver: change the binding to add
> this supply when mediatek,mt8183-mali is present as a compatible
> instead of disabling it when not present.
>
> This is done in preparation for adding new bindings for other
> MediaTek SoCs, such as MT8192 and others.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 78964c140b46..69212f3b1328 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -57,8 +57,6 @@ properties:
>
>    mali-supply: true
>
> -  sram-supply: true
> -

Have you tried actually validating the device trees against this?
Based on my previous tests this gives out errors.

The reason is that each conditional is a separate sub-schema, and the
validator is run against each schema and sub-schema separately, instead
of collapsing matching schemas and sub-schemas together and validating
once. So we'll get a validation error on sram-supply not being a valid
property when validating current mt8183 against the base schema.

We have a similar issue with power-domain-names, for which I'll send
a patch to fix. See the following for the fix:

    http://git.kernel.org/wens/c/d1adb38ab2ad0442755607c2bcc726cc17cce2c7

and the following for what I did for MT8192 on top of the previous patch:

    http://git.kernel.org/wens/c/049bd164884398d7e5f72c710da6aaa9a95bc10a


Regards
ChenYu

>    operating-points-v2: true
>
>    power-domains:
> @@ -157,6 +155,7 @@ allOf:
>              - const: core0
>              - const: core1
>              - const: core2
> +        sram-supply: true
>
>        required:
>          - sram-supply
> @@ -166,7 +165,6 @@ allOf:
>        properties:
>          power-domains:
>            maxItems: 1
> -        sram-supply: false
>    - if:
>        properties:
>          compatible:
> --
> 2.39.1
>
