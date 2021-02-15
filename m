Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E22E31B637
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 10:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A176E152;
	Mon, 15 Feb 2021 09:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E600C6E152
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 09:10:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t15so7917340wrx.13
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 01:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/6nDMacFrNIhrtxVaAIMiVIG8yykvqcMlSO743DGgiA=;
 b=1h26KkjqGLZgyZcgOr0HbD9w1E5Yp37CilXDfdhNV1sBydAEEE8j4sFL0VqQ3F9Vib
 Qr+IJm6VG7YcdMuLf1b8cQC804lk7EkJIdd3PdASf3IMzIcXk+HNHksQFGOW3bZnfNk7
 Gk1hHR56puak7n348axn3zilou/hycUNRQx0mKdUfPtFSNyxkQ7zdamc1cjB6Nr1H2fX
 GMACM860rmBmGoF9AI8K8PYFCFkYJktx5fEmBg9Ez7qSIdD2k4PY2MyB1qitS2rVPz+L
 6K8ordM3FMCxluOY/A+T7st6GHegdN0K/jUd/FJ8ubPyfmoUvgcxDTcEY5aClINeVD5m
 Oqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/6nDMacFrNIhrtxVaAIMiVIG8yykvqcMlSO743DGgiA=;
 b=nCNakNobDGMFOA00uaVqI+CC7SZxIFSS/GpR46k6NBsSxq0WJ+DSSIjzB5vsfIVkkC
 5d7z9uDdudr/kiDpwcoIopN81krSe8WcBXaegHkmYB0Z3wGJY70b/nhA8IVF3KY+NxRe
 WAuU/JpNfS0X7GWhynZd4XNXEHMWtOLaCDrK2eaRh2BN6x7p4Wvx4L51UYe5LktHLObl
 bAxgZZt7HIAOf6KqKuGANIQQGIOqY/CNTNkRrXyEAmYMXuzC58NK7b4k+PuRKpXhY1dq
 CSXWSR+CJGXIs2QxF+ec80GvgyVnioDpYCReG7P1D3RyqPi8aEkMaAKH73Vb61zkzTvT
 NHug==
X-Gm-Message-State: AOAM532oGxaSMRdy8Ddp7/RU/tHnlm1gNr+eefaxbytgtHNYr0Ip8IGf
 I25EkVUXwLWTd86APXV8EdttHiCUSCE+fWf5
X-Google-Smtp-Source: ABdhPJyn5cGcoXq6bnOpOqvG/KNkJioEQbbcZi2vJSgA0PCigCiLhE3GFF4rTOjCu5eift/gXn7Hkw==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr18067059wru.115.1613380227239; 
 Mon, 15 Feb 2021 01:10:27 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:3627:e500:c425:5f5c?
 ([2a01:e0a:90c:e290:3627:e500:c425:5f5c])
 by smtp.gmail.com with ESMTPSA id w4sm23207187wmc.13.2021.02.15.01.10.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 01:10:26 -0800 (PST)
Subject: Re: [PATCH 0/3] NVIDIA Tegra NVDEC support
To: dri-devel@lists.freedesktop.org
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <8a50f133-12ed-e81c-47a5-07c51924ec6a@baylibre.com>
Date: Mon, 15 Feb 2021 10:10:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210213101512.3275069-1-mperttunen@nvidia.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 13/02/2021 11:15, Mikko Perttunen wrote:
> Hi all,
> 
> with the release of documentation headers for Tegra multimedia engines
> (NVDEC, NVENC, NVJPG) [1], I have started working on the corresponding
> implementations. Here's the first one, NVDEC.
> 
> The kernel driver is a simple Falcon boot driver based on the VIC
> driver. Some code sharing should be considered there in the future.
> The userspace driver to accompany this is a bit more complicated -
> I have expanded vaapi-tegra-driver[2] to support MPEG2 decoding.
> It should be noted that the implementation is still very clunky
> and has poor performance, but it's a start.

Funny how all this tries to avoid all the DRM, remoteproc, V4L2-M2M stateless & co
all the other vendors tries to make usage of...

Neil

> 
> This series is based on top of the "Host1x/TegraDRM UAPI" series.
> For testing, appropriate firmware should be obtained from a
> Linux for Tegra distribution for now; the GPU should also be
> enabled in the device tree.
> 
> Series was tested on Tegra186.
> 
> Thanks!
> 
> Mikko
> 
> [1] https://github.com/NVIDIA/open-gpu-doc/tree/master/classes/video
> [2] https://github.com/cyndis/vaapi-tegra-driver
> 
> Mikko Perttunen (3):
>   dt-bindings: Add YAML bindings for Host1x and NVDEC
>   arm64: tegra: Add NVDEC to Tegra186 device tree
>   drm/tegra: Add NVDEC driver
> 
>  .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 129 +++++
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     |  90 ++++
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  15 +
>  drivers/gpu/drm/tegra/Makefile                |   3 +-
>  drivers/gpu/drm/tegra/drm.c                   |   4 +
>  drivers/gpu/drm/tegra/drm.h                   |   1 +
>  drivers/gpu/drm/tegra/nvdec.c                 | 497 ++++++++++++++++++
>  drivers/gpu/host1x/dev.c                      |  12 +
>  include/linux/host1x.h                        |   1 +
>  10 files changed, 752 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>  create mode 100644 drivers/gpu/drm/tegra/nvdec.c
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
