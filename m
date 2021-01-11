Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF32F1687
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 14:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972C889E05;
	Mon, 11 Jan 2021 13:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF2889E05
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:53:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a12so16479405wrv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 05:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fMPNkX/8H1jC2xE24snow1oc8tDSRTOYv9vkli4KgJU=;
 b=mmNZ289a541WtDpTjP6vt2DymMxi9LdA45QjxzMGNyzSAl5pLWJx0Jv5lXuuRxB/4Q
 zQCLuMB/NaTPJsYobwz5mF7NKl7UAtFCIwYT/XvmSbeH+fy1yve2tr8l0AnBvML9oaCm
 ckboLyakm8FkZcK1dTodse5HIyH+ioNKtlCV7XxQmyJHXEWFxWAVL7yholk/vhlNC8K+
 mw9zjs6bZ/x3pv+UGNxJXImwCtTmJJyWj5ErLX8OrSdAbvyytjmrIolqZnd2d7+ANNyO
 qZyWUoQx9gzSLEPpsTtnY4KQEOE8orJCBqN/HXe1lk1vAI/7wMEOee+6yvP8+TYXS/yX
 fCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fMPNkX/8H1jC2xE24snow1oc8tDSRTOYv9vkli4KgJU=;
 b=ja/t4gR5dlRI2WaNwaY95POeD4gMjNgXhlBSW2gXiQa+fbVusBOEUrx64hjKA29dn5
 vYd2chODSipA4O9nZzrp6ZZQStvmwgIUObjarCHWmjo5vdY3nQlpD/t77rMH+oZ/d5GQ
 AvJ+AyN1kP17g52XvLnTb9z2yPXkx/Enxo4Dq48s89fnqxugkg3rFO/SZ+Agxb5hvyAv
 ADckpJIh62WW1utLHJ98TcbFpq8l2XmVMHNjLp/RIKMC9LJqNSqed5+tjx63VSIWAPWR
 Z2DE29XT2nv0SpqW0YBgbaC6B12kVjeHCiwiPVn6Or7dTgBGiTkn1nu2v4QAdBmdnvqo
 ZMAQ==
X-Gm-Message-State: AOAM530mU7BX2SJKAaGU7AfXLmJwBWmwA3k+wmMKdjVl2gOmsKqn7Uqw
 hchnGypnrOlyzbspHtHieeyrrA==
X-Google-Smtp-Source: ABdhPJzT7EI2kkkFtBM1pfsfjjE8i3e7EN6nVo3pNyaA/srTVAy7q+whoch68hF2WT+4RkrkvfEZ+w==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr16236608wrj.339.1610373225758; 
 Mon, 11 Jan 2021 05:53:45 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:7474:6cdc:8087:ca98?
 ([2a01:e35:2ec0:82b0:7474:6cdc:8087:ca98])
 by smtp.gmail.com with ESMTPSA id l16sm24598219wrx.5.2021.01.11.05.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 05:53:44 -0800 (PST)
Subject: Re: [PATCH] drm/fourcc: fix Amlogic format modifier masks
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20210110125103.15447-1-contact@emersion.fr>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <2805b9ce-f960-d903-10e3-bc1e2c38765d@baylibre.com>
Date: Mon, 11 Jan 2021 14:53:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210110125103.15447-1-contact@emersion.fr>
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
Cc: Kevin Hilman <khilman@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/01/2021 13:51, Simon Ser wrote:
> The comment says the layout and options use 8 bits, and the shift
> uses 8 bits. However the mask is 0xf, ie. 0b00001111 (4 bits).
> 
> This could be surprising when introducing new layouts or options
> that take more than 4 bits, as this would silently drop the high
> bits.

Indeed, but the masks are "private", and would be updated accordingly when introducing new layouts.

> 
> Make the masks consistent with the comment and the shift.
> 
> Found when writing a drm_info patch [1].
> 
> [1]: https://github.com/ascent12/drm_info/pull/67
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Fixes: d6528ec88309 ("drm/fourcc: Add modifier definitions for describing Amlogic Video Framebuffer Compression")
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/uapi/drm/drm_fourcc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 723c8e23ca87..5f42a14481bd 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1036,9 +1036,9 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   * Not all combinations are valid, and different SoCs may support different
>   * combinations of layout and options.
>   */
> -#define __fourcc_mod_amlogic_layout_mask 0xf
> +#define __fourcc_mod_amlogic_layout_mask 0xff
>  #define __fourcc_mod_amlogic_options_shift 8
> -#define __fourcc_mod_amlogic_options_mask 0xf
> +#define __fourcc_mod_amlogic_options_mask 0xff
>  
>  #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
>  	fourcc_mod_code(AMLOGIC, \
> 

Anyway:
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
