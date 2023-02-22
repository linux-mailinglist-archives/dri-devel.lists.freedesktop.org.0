Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48969EFC6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 09:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC61D10E42B;
	Wed, 22 Feb 2023 08:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682BC10E42A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 08:00:36 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id d12so2360013uak.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 00:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E/ELBQfN+/3lXdDB7LXB4Z2052sqoav27oBRvmxfX5Y=;
 b=AT+IRCu07svzL8m3gIIkCn+JEKk2W/8SCpGDCVA+oSKuwo58MRo4ZcEhc6RxVyyV5h
 SH4xpigfLJChb7OmNwlbmVHd/ccstGcS85QW1xb9r0cVu1WFt+Nf9hV2DweSdhHYdjPX
 0Ij/WbhQi5RvciOPshvUX0SJhh8dn1E+l2nQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E/ELBQfN+/3lXdDB7LXB4Z2052sqoav27oBRvmxfX5Y=;
 b=TJXZ/1arHEwXcLQdNe+WV2QC77C1+0zl0kfik4ZPRyUNHEg0mM/s25eDM9qeWz7T3G
 tb/UkTDkn8+zTbLv8iGS43AEyuIh8+VySMiDDQ7FtWmj6oO50jSf0cEs1wU6EtuJmDZC
 /ppOjP5zRFxnNeRW6o3fOYvMKXL9HESeZk82Pwb+Kpt2coXWH2dK7P5rrGACrMlIcBNZ
 /eCk8KPHvZZq0uGjrLNEMCKlykE6juPcmuohyCVg77Zz+pSllrDbJ+ey3gJCjP+WuhNy
 sJ6BwlxOpKrbPo9u/3MbWOBt1xUXTI+NhvmmYUwHyxVILKm68imviIuxRe3C85ZJ2gkD
 eytQ==
X-Gm-Message-State: AO0yUKU7XT7NpW2a9dZWIkXHboQVGSeA5rdnNNA1Bu685F2Ix9T+n+W7
 9a+piiQZbILC8K5TyvRHQ0HB7w9P7B/vRqyvf+BUWKFCz/MTWhwI
X-Google-Smtp-Source: AK7set9gHg9xT1t3caYU+/EH6XDWBjScNBL58kOvjAujH1+xQR8y6JHp+iLrLSPt9BTYSv2avB7S3b74hbnrFiwCMsk=
X-Received: by 2002:a1f:208d:0:b0:3e8:66ce:a639 with SMTP id
 g135-20020a1f208d000000b003e866cea639mr1301210vkg.2.1677052835469; Wed, 22
 Feb 2023 00:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:00:24 +0800
Message-ID: <CAGXv+5EhuZ4oqEc-gK+F8fktFra+0MD5pMi_qzDwnFXxgjUsAg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: gpu: mali-bifrost: Allow up to 5
 power domains for MT8192
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
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so.
>
> Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
