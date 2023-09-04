Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC232791BD1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 18:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD8E10E3AF;
	Mon,  4 Sep 2023 16:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51C110E3B0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 16:59:38 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-d7e387c33f3so1261788276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693846778; x=1694451578; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bDhYFJwsc72fnWtZtTj1LIiHVNNT1m2etRJ8fUWREuo=;
 b=UU9/ORcRj1JrvnZmGnu7T5p+EW88DhO95CAaTL5Z1QQz57hrx5c7NFn5MP2MnPLDXq
 De7aAZHJct560OFgIfgguFkO79sOQU7wsrMPXdnTQRKRcAaW2D56do04/TvTmIci0DVM
 +WoXymbFeNEmhSMlBmx0SUc+h7DRMbsD3m4PcKaBMh8sNB07WaKt012XSn2lxjx/OfRv
 gO8iX5rf8PJB11RSvaPW2A2k7lz+Fv27V3Hr8L32RPG5gwENIGuVwVDRepBlw5OdSUmk
 GHerLcZbY32hbf/SI2peu4qdNJ0qCRFW93Y/tmpHIUMr53aiv2A6Z4OoYkcwfVbezt8o
 t0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693846778; x=1694451578;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bDhYFJwsc72fnWtZtTj1LIiHVNNT1m2etRJ8fUWREuo=;
 b=AAOCPv6FJxzqA5GZHwNS878cK9MA7+USAsynRJkYsj0RUAw02rdbh0p2MN7kuhPI3+
 ildxN6RBKWdJvt8ebhajZn4148GpwE8gYa+RQWHQjmVy8JPlU5IeRuYB9QJ1XLAyh4rq
 6+hz623NPq0QxWzDgJZTbu0A9bRxjfNcKsqrusr5LHRJeIQ0K/cCxXBBo7qNFQ8VLby8
 uDrB1xJRW5j+5KYkohplIbxda/QehX5y+sgghJmrK9HtwV0yAMwqKS8xllSiz2UUqXfc
 VP2AeIWhOk6wcekZtjlhEIuav8rKA8/oxvuRJ/YrZEVhYgOTMuhMobeJTD13GmBBvTdJ
 hBow==
X-Gm-Message-State: AOJu0YxpRLQbu1iRfJm/IyUDS4TtW8/X7EdHGz+nfHLgOnzItQLGAvWE
 ddHfdkR0CPZ2TDyBrKRKCQuqYBRHmNndeHuaseRrKg==
X-Google-Smtp-Source: AGHT+IF/k/r0ySRsvTXjtMGk3oMS3ChIKX3SqVSvJ4wdwZ6HlhuHg/ElJKXsqxnttmxy4KSgE1/uIN6gA6j94CZFBuw=
X-Received: by 2002:a25:a2d2:0:b0:cfe:8cbf:5d28 with SMTP id
 c18-20020a25a2d2000000b00cfe8cbf5d28mr10283989ybn.31.1693846777856; Mon, 04
 Sep 2023 09:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
In-Reply-To: <20230904161516.66751-3-vignesh.raman@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Sep 2023 19:59:26 +0300
Message-ID: <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
To: Vignesh Raman <vignesh.raman@collabora.com>
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
Cc: robdclark@google.com, daniels@collabora.com, emma@anholt.net,
 gustavo.padovan@collabora.com, linux-kernel@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dri-devel@lists.freedesktop.org, mripard@kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 linux-arm-msm@vger.kernel.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Sept 2023 at 19:16, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
> Force db410c to host mode to fix network issue which results in failure
> to mount root fs via NFS.
> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
>
> Use fdtoverlay command to merge base device tree with an overlay
> which contains the fix for USB controllers to work in host mode.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>
> v2:
>   - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
>
> ---
>  drivers/gpu/drm/ci/build.sh                         |  5 +++++
>  .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 7b014287a041..92ffd98cd09e 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -92,6 +92,11 @@ done
>
>  if [[ -n ${DEVICE_TREES} ]]; then
>      make dtbs
> +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
> +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
> +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
> +    fi
>      cp ${DEVICE_TREES} /lava-files/.
>  fi
>
> diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> new file mode 100644
> index 000000000000..57b7604f1c23
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> @@ -0,0 +1,13 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +    fragment@0 {
> +        target-path = "/soc@0";
> +        __overlay__ {
> +            usb@78d9000 {
> +                dr_mode = "host";
> +            };
> +        };
> +    };
> +};
> --
> 2.40.1

Can we use normal dtso syntax here instead of defining fragments manually?

-- 
With best wishes
Dmitry
