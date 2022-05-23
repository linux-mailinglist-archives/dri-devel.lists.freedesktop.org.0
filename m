Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD5530EB2
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 14:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB74410F2D7;
	Mon, 23 May 2022 12:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C95410F27E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 12:46:17 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id f16so25188045ybk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 05:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O+ppO6uaT3HzCMb3hULH8hCXzl7PiBlC1jwCnqcgfHE=;
 b=WEtOarK4jpq+wCwX/9yC+UTrfJxpv7OHii0oCYtPbf3H56WwfrhYrsmCvVfpgKdwIa
 +pxhCdioQJtxmpQ9SJzV+cy5Vf/1hnJWlrslH6EiXg0KZClSN4C3pmVoFU+rd+Et80SY
 PKbZxRzi9Xtv/MuxGyKS4t87kUGCOWVLmrhc51oLcUzm0fpig+p9VS8WmTTPazWJxxb+
 LuJdDyw+uenhYOjkQdSuZiKM2PqkzOmR+BR00LbtMQnrUesNgG2B4Qhs2dec50umM7cb
 Dnah/hN+EzOePcrwGmlwc+KOl2q3a8ELivybRCpu47yEporw6ejYIS11ugKC6IZLToIu
 5wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O+ppO6uaT3HzCMb3hULH8hCXzl7PiBlC1jwCnqcgfHE=;
 b=X2OCyIqP0oHE8lmPhOac+H2XMNa0+HQmL/XapOtqsw//OMSBywOWmOlnN0l4ZSP+5U
 j+PzsG11O6H1uUSA4W7+NWC4U8DXEn6zbwl0quoYEiJ3qAxtnAYdxAUOetNgDnId+QhV
 TnTRAnFgQyEkHaQRL3PpWTWTGYU+4/SfLsHnBf8CNKj9Wi1/vf7W+5K2n6yOu/oLxkxQ
 0/OunX5YqNZcencL0uHW37ngC2A5QMGARo1BnVc7Wmi/bfrFhQabtVik5PREs8WT5n6z
 cxNoygVVUtGGAQ1neFPMmLL4PZLWBf0nRdgwsh+EIdmvLGa+nVHrb9l185SADgdMbVfg
 G9gQ==
X-Gm-Message-State: AOAM531J70fzh+9G19cUawrC4FGh3Yptnqd6NMBF8RjFfrOoWINlh6iP
 eEhCPnG00ZhuUkJI2dxX3+5ucsPXI4ShDvYza2QEeg==
X-Google-Smtp-Source: ABdhPJwouBMGBTgRpDxe5aoUB6mzxiwqDafQ4SxktusCLNK6ylCETjs4yu813XGYZcUR/Th38ypf5hUsI1iX0luoVyU=
X-Received: by 2002:a5b:302:0:b0:64b:a20a:fcd9 with SMTP id
 j2-20020a5b0302000000b0064ba20afcd9mr21068986ybp.492.1653309976782; Mon, 23
 May 2022 05:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220506123246.21788-1-yuehaibing@huawei.com>
In-Reply-To: <20220506123246.21788-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 May 2022 14:46:05 +0200
Message-ID: <CACRpkdZUwfVNZyS6RgcupJ+TRUZVM+1_3ABj_-f_3+v+wNE6mg@mail.gmail.com>
Subject: Re: [PATCH v2 -next] drm/display: Fix build error without CONFIG_OF
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
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 6, 2022 at 2:33 PM YueHaibing <yuehaibing@huawei.com> wrote:

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
> Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus supp=
ort")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to the DRM tree.

Yours,
Linus Walleij
