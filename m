Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B058D650CC5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 14:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C42710E078;
	Mon, 19 Dec 2022 13:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEDC10E2A0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 13:43:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso8825315wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 05:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FcJ82GGLWcA9YJ8tR5Iaod2DuXgS0nv7MKzMcf1yMiM=;
 b=okHBtBIhbvCRep+pxNLz9lBYrDAmFORXzEx6qK8V0FRSuRR0jezAYYpXAzZTwxe3qj
 gETGKsaOF6cK37DyiAQp8BOkWzIgFzepwajcjCqCT8hfhnnJBEFMoQrBGdIxO2K6BVSd
 lkxt0flRjnIPfe7A1RKSfqQbMe2pwzRh9X06sAChU5eeyiHqRH/hZXDDgVsow7nHlAR5
 p1r6/UUrkupYkijuId+Vll4GwY04Dmr6BzhC6oGs95yAV75N90ZxyKpoVvjRNUhnVIW2
 Kw4OLsGqNuqB/cdGTu4Lq9+ecqa1m2xQ4iHqwU5/Jai1D2LsRk3WoxDruckJ2S62PmPJ
 vltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FcJ82GGLWcA9YJ8tR5Iaod2DuXgS0nv7MKzMcf1yMiM=;
 b=h4ouSrbaGdjlSSvQtHAtyDQSqI/GPdhm1A6z0yX5HgocUNx9ah9aoPtbM2uyyzTe59
 IOJuHXGrIZiD9j8x4IJOitugiViZLWlKUi3SzGqxKL3zg8QpNtSreFcAPa6YqsqXk6cQ
 PPA3y1HcDWRFcuS5BTLSHBn05wN9GARZMvjQg9aMox0nhwaN64DaOiVQ6CN4ge8P2ndA
 gs1Emo3gvKt3w25OUXLl3INgWF1IcUPyfKzgWx3GBCGiPXYHTFYldrKXtuEUTq3li91/
 mgipnqX+SOGW8AtJBz8iVpID+Dp44ebnV3nHlm6v0iPNdF5Oo5jbd5U5dBnoiwcF3jjF
 6cLw==
X-Gm-Message-State: ANoB5pmIa8bjrC9wbYq+tjyf35LeRFx4OGk3TugGbVjRK8Jfdg/QQ+dq
 FU6hW3wKIqTpvxDjcp+nwuEdzA==
X-Google-Smtp-Source: AA0mqf53Kpb/M5xFybthDz4K5oNolr3LAaNDmyfZESzL/sgF3C0EEbJieuv2vvb8y2QRsRkV2N9sVA==
X-Received: by 2002:a05:600c:5570:b0:3d1:ee6c:f897 with SMTP id
 ja16-20020a05600c557000b003d1ee6cf897mr32073903wmb.3.1671457400483; 
 Mon, 19 Dec 2022 05:43:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:976a:eb00:7b11:28de?
 ([2a01:e0a:982:cbb0:976a:eb00:7b11:28de])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c154900b003b49bd61b19sm17513376wmg.15.2022.12.19.05.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 05:43:20 -0800 (PST)
Message-ID: <19de9bfc-2012-451d-f5d1-59a04ea9d813@linaro.org>
Date: Mon, 19 Dec 2022 14:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/2] Make ILI9486 driver working with 16-bits SPI
 controllers
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kamlesh,

On 19/12/2022 10:02, Carlo Caione wrote:
> This patchset is trying to fix problems seen on S905X boards when interfacing
> with an ILI9486 equipped SPI panel.

I fully reviewed both patches, but I'd like a review from the maintainer,
can you have a look ?

Thanks,
Neil

> 
> To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Mark Brown <broonie@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Kevin Hilman <khilman@baylibre.com>
> To: Jerome Brunet <jbrunet@baylibre.com>
> To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> 
> ---
> Changes in v4:
> - Removed NAK-ed patch from patchset
> - Link to v3: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com
> 
> Changes in v3:
> - Added trailers
> - Added new patch to use drm_aperture_remove_framebuffers()
> - Link to v2: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com
> 
> Changes in v2:
> - Removed SPICC patch
> - Reworked commit message
> - Link to v1: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com
> 
> ---
> Carlo Caione (2):
>        drm/tiny: ili9486: Enable driver module autoloading
>        drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
> 
>   drivers/gpu/drm/tiny/ili9486.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> ---
> base-commit: 84e57d292203a45c96dbcb2e6be9dd80961d981a
> change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21
> 
> Best regards,

