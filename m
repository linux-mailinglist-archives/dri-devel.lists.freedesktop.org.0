Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE69557D9C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 16:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C2610E00F;
	Thu, 23 Jun 2022 14:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C492F10E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 14:18:57 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3177f4ce3e2so171933617b3.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 07:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ttjwutrYzRtOS2BJTBkTWyAMoMq6/UV2GWdzOFapio=;
 b=sfBsAoU06byqlOa+VeO2lPzCt3r5KJeWqK4XfqR/e8RsEwzGOfnOs2sO54HxJlwsMe
 5+uG9KuFnCwiTbujHCqRhYJ7B+PrG9xsGqoeEYZQs9bzM3zlPs5LxUnwHU8ZfCbEANAn
 u2Vi6juNku400dA/YZl9Kmph8Uo44ZIkjo2tQBAvi9OhEUu/wIGnQ0uprpINRFot8IgY
 FaW7a0TzEjuW1HnLDm4n8N8muv1UJxL4gETrdhqU+D1VqQfR2NtP/NgI07cIwc0WQ75F
 7VomjOBnH/Y55G/iSI5+rKIcn9NF++wZjVcPbPtFnv3HQrJUMyZCOQ5k9F+yXKwd5v0G
 cnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ttjwutrYzRtOS2BJTBkTWyAMoMq6/UV2GWdzOFapio=;
 b=4bincVBOI+1x0K2eNhoBdTRxdj9ZlAtV/259EnLpDhQb79FSF/bpjuLqO5r2A6zpbO
 8Pe/NElkC3nD1gJOCU43eKUSvUquBya8ChG6hKTZfLQWB6Fptxb63rVXJjtAwA3xDxvq
 QVWfuScTk6Gww7agEL8sr6RGof8ZikO/S/sTNXvvVAlWRGNx9ADPhBppd5uzMRJ1JDFm
 +pNf/MndHsVr74Airx2ss9d7WelSrWiQhluMO8hCae8+ThSk4GKhdDa0BZYlfNZK2fj2
 sLwCRmOv+VRo/hH6WC6emEhd05EAvX9/JPPDoU6rRmKYWWfze5iJxqRuSLgKUDfELhOV
 M5Eg==
X-Gm-Message-State: AJIora+9nE39dm4CgDyBk1oyc9gsv5SwadH4c0hOKQq5JgVTcTk3BW2j
 jsX7RHab6wqD+VyIeAKntkzHoRjQqEgow4QyiBL+cw==
X-Google-Smtp-Source: AGRyM1uhwbGkCiSphmkJsR9TFQpk35mHCv4z7e/K3gkNQ9fydR1ce9ALqQr5ErSs2vU6+fLkHj4bxleqmQps/4lpgyU=
X-Received: by 2002:a81:d05:0:b0:317:76a1:9507 with SMTP id
 5-20020a810d05000000b0031776a19507mr11294211ywn.151.1655993936782; Thu, 23
 Jun 2022 07:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220611041612.1976-1-yuehaibing@huawei.com>
In-Reply-To: <20220611041612.1976-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Jun 2022 16:18:45 +0200
Message-ID: <CACRpkda6OY3Cp0+pWmg0E=9nRLbEmwp8x0rF81McYFHVnTno1A@mail.gmail.com>
Subject: Re: [PATCH v3 -next] drm/display: Fix build error without CONFIG_OF
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 tzimmermann@suse.de, dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 11, 2022 at 6:16 AM YueHaibing <yuehaibing@huawei.com> wrote:

> While CONFIG_OF is n but COMPILE_TEST is y, we got this:
>
> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - DRM_MSM [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && (ARCH_QCOM || SOC=
_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT [=3Dy] =
&& (QCOM_OCMEM [=3Dn] || QCOM_OCMEM [=3Dn]=3Dn) && (QCOM_LLCC [=3Dy] || QCO=
M_LLCC [=3Dy]=3Dn) && (QCOM_COMMAND_DB [=3Dn] || QCOM_COMMAND_DB [=3Dn]=3Dn=
)
>
> Make DRM_DP_AUX_BUS depends on OF || COMPILE_TEST to fix this warning.
>
> Fixes: 1e0f66420b13 ("drm/display: Introduce a DRM display-helper module"=
)
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> v3: use correct Fixes tag

Patch applied for next as non-urgent fix.

Yours,
Linus Walleij
