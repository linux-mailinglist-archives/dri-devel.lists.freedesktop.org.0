Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C211912F0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5914789A94;
	Tue, 24 Mar 2020 14:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0458A89A94
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 14:24:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 65so4983492wrl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W59hMPJ3MBOlOz+nstlg61GCr1II2YZNKGokA96Ka3Y=;
 b=bF95E75ZbHF4bltt0flEXWimvDmZwYIVOAHOON+rk4yv3rlnqoFZd1mAem6cpnEP2k
 2C2/+YRPbwzX2em+Ea9ykPo2B5zhRDMmpxS3EWKODWsJQCB42i+x8e2wB1KkrA7WFRz0
 WJylrNwpLdpU9p/+Quw+KhURey8h/mLKqi0GmTxZ1dQrvALHqagSlkyJyMDAWwjzzd6x
 z92sIxf/wtiV2iZ5INfAcgQcHRiuwd3TA0H7DLNBmumJ2ao5PkiLHjTbw1MuhAzvSGx0
 AgEiLSPgrtUJIQE8MzbZ+EiAhmtXr8Ltkf0Fopj61Xoj6ML2q3dlsZPY9jd+AxreJprg
 1vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=W59hMPJ3MBOlOz+nstlg61GCr1II2YZNKGokA96Ka3Y=;
 b=nYMdosVITGIMUpD5J/TpM/Su4p03ivx5lSUq4XyA3LblHZEaLq57aVcPcMfOb51NWg
 6Q/4c92u9DIqR/saUkFC68zuh/4Fv8usE+1+VORW56S0fYm/8wDwjQerfSW7nbQz+3Og
 K9AUTSWQ51yLqmPgSc8njIDr8vfr7MQSAFqvlWwqqhv149sLQIDUu015uFbaOFM60VAD
 ZHqtcRaG7TZDNrwEYINWISQqLExJi72xQi+krn+dWsI9AfW4gRb5iNyYDmlwa2FAycup
 Phz9wXB6fep4LocBIh3dRxcLCnVXZJX7vj58hMPhuYXZyOSXaGORtWqpsUhiF0jzKzDk
 V8jg==
X-Gm-Message-State: ANhLgQ1E9vH9ajBd7kKUdyWIgWmA7w9RSIRJfStJY84YLTQuXntSFSLW
 gG34cSMO6a2VbK9R2dWyH3LacCGdSC4L3w==
X-Google-Smtp-Source: ADFU+vvyxr95jCX/2rV/XOcDppnOWCfL+Fvg56S/LxiVdgHdFzGDxvgseHm3o7OhEcX3qFUTmsbrpg==
X-Received: by 2002:a5d:45c7:: with SMTP id b7mr8857427wrs.44.1585059858483;
 Tue, 24 Mar 2020 07:24:18 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2?
 ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id u16sm29323057wro.23.2020.03.24.07.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 07:24:18 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20200324142016.31824-1-narmstrong@baylibre.com>
 <20200324142016.31824-7-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <1bb8c27c-7dcf-8833-ee13-f7227336179b@baylibre.com>
Date: Tue, 24 Mar 2020 15:24:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324142016.31824-7-narmstrong@baylibre.com>
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
Cc: mjourdan@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/03/2020 15:20, Neil Armstrong wrote:
> Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
> a different superblock size for the Memory Saving mode.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_overlay.c | 14 ++++++++++++--
>  include/uapi/drm/drm_fourcc.h         | 16 +++++++++++++++-
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 

[...]

> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -840,6 +840,19 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
>  
> +/*
> + * Amlogic FBC Scatter Memory layout
> + *
> + * Indicates the header contains IOMMU references to the compressed
> + * frames content to optimize memory access and layout.
> + *
> + * In this mode, only the header memory address is needed, thus the
> + * content memory organization is tied to the current producer
> + * execution and cannot be saved/dumped neither transferrable between
> + * Amlogic SoCs supporting this modifier.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER	(2ULL << 0)
> +
>  /*
>   * Amlogic FBC Layout Options
>   */
> @@ -852,7 +865,8 @@ extern "C" {
>   * memory.
>   *
>   * This mode reduces body layout to 3072 bytes per 64x32 superblock with
> - * the basic layout.
> + * the basic layout and 3200 bytes per 64x32 superblock combined with
> + * the scatter layout.
>   */
>  #define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING	(1ULL << 8)
>  
> 

Oops a commit got lost in the process... this change should be independent.

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
