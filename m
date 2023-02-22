Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1B769EFCF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 09:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9868810E42A;
	Wed, 22 Feb 2023 08:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9130A10E42A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 08:01:58 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id f23so7334200vsa.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 00:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tlzo2IJo5C30mjLFPDclNhtFd2xIEgosfbXcJe2YvVE=;
 b=MeWMKnUvCa5h3wnNxrVJwgGjMGC7euso+9Epxo9WZnMC3zklZnUMAdZ6JmNt6tv94J
 wnGbHnAcop4UQ5kLLD/AngU8vKm9bLOO7c19mmm5R8uwYNy7xW8gjJozc4V+7pdANJmi
 Me6WFN7P7gptD+fkV3vqzODRL+tt7nUGbDd3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tlzo2IJo5C30mjLFPDclNhtFd2xIEgosfbXcJe2YvVE=;
 b=udZ5qAIEUn7RK/sKdn9qq3sjPdVa2yUDkL5mE2kWbUDh9xIDBV3yc7aw4ZzGV6LlRM
 WlGBmydA06tIxKSjXxWyNjHrqWZR5UZnN7d4z+o+lidrlceN5nCeZrtLJcjaBDAybmpt
 mxWwuv2XXPQ7V0kW0Ll+4pGF9T7ThMW+2IZy4XLdfe+BvXMNaQb9S4EQHrbapyV5BwBq
 OOZ383vZTHP2J6FfBppPoFPRj6XY7slgIxSxcXiI0J386BHo6S/lGQHJXJAVQ02lckh7
 WI6cGoulW7NugMAC6OIbel94qFpgTZS3iZ1MC6QPQhI+pX2qLLyOAuy4pVb2H/GQ6nU+
 X9/g==
X-Gm-Message-State: AO0yUKUzvKdNWbacCyM74u1ugSY0Def6bCLgSHrsQ3ES70t//VqdFcIF
 Iv4tqf7fmy4i525GGacvTVKcHOpzBUO1zoai8Thqbw==
X-Google-Smtp-Source: AK7set/K733MxVsNaWaZ582QR4RHXcNoi9G2ZoQ2+vNsIwgFsMxrfQGCDYAD5F2km2PqCut/v0ZaIlykDJA2RFfbm3I=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1556381vsb.60.1677052917662; Wed, 22
 Feb 2023 00:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:01:46 +0800
Message-ID: <CAGXv+5FJ6ze5tECGMoJT3yALDoSkshQPj0dUy_KwLJoWo9AYCg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: gpu: mali-bifrost: Add new MT8183
 compatible
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
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
