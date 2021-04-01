Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E73515AF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 16:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A556E11F;
	Thu,  1 Apr 2021 14:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B17B6E11F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 14:39:23 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso1134198pjh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VJd+MUFo0XX0bZ87nAzur9O3CX6wH0hMl9szGovIO+U=;
 b=lT8rLoA46GAsqanEivZwqwGf8FFfuPDGksXMy8dE1ySACchbIqAtpInKtAyJ5Yqe9k
 GzsqRT4MRlwH4ev0c46sD16C2EaZsJ/87dxJ7+FFNKu77qJwACz5JF/bzLCymjmyvRN/
 LDm/EiPP1kwy8nckigs4rv4bEV/e0Y2iRMMQGt0KldiN+C813ng5sRuB4ND1ZdUqlJc0
 nUMWRadeX1yrZ4kCF3vYWwcRtZuP46Dw95sEGcBSwhgtMAzTBu+rSTnLf4K9p2jwvg5A
 VYwpulwlpikyBGlMD1XMbyeomiajTx5AsFgoSmcc7IUS8Ivon4jhXB6SM9pUeyhmKoA5
 Avyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJd+MUFo0XX0bZ87nAzur9O3CX6wH0hMl9szGovIO+U=;
 b=WQKPCteZ2Q5OT+QxIO5i1dgEQP1m1paMX1G3s++yWPKc5IU8JzJgV6hZrt1VvP9pto
 h+rTC0k7ymKB3IiCc8ybIgrLYHWfLtrepiltMxLwYus4FY+7i6CEI1WqAgmPGpbRXvDn
 jZg/jzseLcreeT3we5nJggr/VuFdEs2nH+PtWau+0dORTsny4GDpBIquVdi9FzbKshRi
 0WeFFIGvYUI2VPXmvJYdSFRvG1IozaHRpW9nzzCC9doNGbxN7YB2aoA0UKNmn/sc+CPr
 4QvlOvbj4vE/+ZluLRdsaAgl3WyrbwMpsQVLr7To35R0oQQ1azOvep3VldptCUCjDcB4
 B/hA==
X-Gm-Message-State: AOAM531FFV0wUUP9tMcFfF5LMto6h0WW4wjjgT6Qp264RX1yVeeG/k8Q
 oFqnbEubi6sHR0vFMBySeCaZD3PokdAUmHIzGnLv6A==
X-Google-Smtp-Source: ABdhPJx5J2TMYKbVuGkqz4CgIBmuDV05Jucwa3rkV95Iqq7+kFDcfqmogyShve1r3BsgBXZyMLNsn0GDbOWgYFavOpQ=
X-Received: by 2002:a17:90a:be07:: with SMTP id
 a7mr9381570pjs.75.1617287962645; 
 Thu, 01 Apr 2021 07:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210222215502.24487-1-julianbraha@gmail.com>
In-Reply-To: <20210222215502.24487-1-julianbraha@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 1 Apr 2021 16:39:11 +0200
Message-ID: <CAG3jFysbOHbDGDWNnyOUH5tyLAxAWutp6HHnO-97BagnLqA8Yg@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: bridge: fix kconfig dependency on
 DRM_KMS_HELPER
To: Julian Braha <julianbraha@gmail.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Julian,

Nice catch, this patch looks good to me. I've pushed it to drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=62066d3164467167fc27b2383f67d097e39bf176

On Mon, 22 Feb 2021 at 22:56, Julian Braha <julianbraha@gmail.com> wrote:
>
> When DRM_TOSHIBA_TC358762 is enabled and DRM_KMS_HELPER is disabled,
> Kbuild gives the following warning:
>
> WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
>   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
>   Selected by [y]:
>   - DRM_TOSHIBA_TC358762 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]
>
> This is because DRM_TOSHIBA_TC358762 selects DRM_PANEL_BRIDGE,
> without depending on or selecting DRM_KMS_HELPER,
> despite that config option depending on DRM_KMS_HELPER.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index e4110d6ca7b3..909d0a5643c2 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -183,6 +183,7 @@ config DRM_TOSHIBA_TC358762
>         tristate "TC358762 DSI/DPI bridge"
>         depends on OF
>         select DRM_MIPI_DSI
> +       select DRM_KMS_HELPER
>         select DRM_PANEL_BRIDGE
>         help
>           Toshiba TC358762 DSI/DPI bridge driver.
> --
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
