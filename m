Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493336B127
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 11:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157416E18F;
	Mon, 26 Apr 2021 09:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C0D6E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:59:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x5so4889886wrv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+nTBzmgMD86ImXMmoPl5Di6Ae0iGMljkfREQq3cZsyk=;
 b=AEIsnJHXmaziJJTcgjFu6iegjOYSLr4FvBPv8J6WWXQxKc3lc6++Dy3OIInY1TdP/n
 MLwhkUhLB4HB61oGv0Vc8PgQL+cvIZ0o3Apk6vGrtY25BHIgJJoMdFgao9oqWHJOQcFe
 rdSVpyh7fixWesbou2peoQ28bg3JUeMSbErXv2EHJh79B+Nrf6LvpW7tfgbDO9tg19Fo
 DPiALE+fVXvMDIHYe30066lKYfmo5V5WQVEdS4J6mv75o6GN443YeEaEa+aaC4kZnP3J
 jyJcCw+LXQ2w4gUnZ0kPgsTl8YZNPTM1GyUhqsd13uQ6NzESdxMZse2nicVNzBYFSQ5m
 vGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+nTBzmgMD86ImXMmoPl5Di6Ae0iGMljkfREQq3cZsyk=;
 b=NGB77sfQrgKLW5Zjzbzj2uY9lTvNCApEUw4QI8msAGLEbjKB/ek+uNlX/Yo6KjqIH0
 EgmSaYVIXMTX+D2Fgg4Yt17FwT1tPhT3+Ykk7/uW1z289ATcbs6N8X5Mf3XWg06XXtJ5
 8i4QAYcPvN13+gg3azQqJqdSH1Xcxr7lH+rs7R5l4JMrYoTyaBSNAPFlP5SDu+iDACK1
 tIqhJYzZFjxd5EGyjv8FfYnGzgYzSrxltxz1K5rMfmrLHFGFpdo06Z4K08LFdC0kuwDI
 UEWORV+UnMS/7ftQ+VAYLfjsRKN0DO/GXAniKoGRHvztdanhKLfVLfUeyO8hK+E4asrZ
 BLeA==
X-Gm-Message-State: AOAM533Q+l5XcRT33PqjtrxAkzLe1BDdIT5IsOuBE4+AfzOoQVMrXvxm
 zoUYufYXxq5XMorjnYrLXHcChQ==
X-Google-Smtp-Source: ABdhPJxYhyoXc/WYgqEkHVidVk+IAkNDRwY4zw/XR8iI1ER3qAtb06MVw/1o5q4L+sF01UOiVWbjng==
X-Received: by 2002:adf:bc49:: with SMTP id a9mr22362575wrh.109.1619431141308; 
 Mon, 26 Apr 2021 02:59:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3?
 ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id g12sm7617152wmh.24.2021.04.26.02.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 02:59:00 -0700 (PDT)
Subject: Re: [PATCH v13 0/4] drm/panfrost: Add support for mt8183 GPU
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c91746ce-88b6-5612-74a5-74600c7761e8@baylibre.com>
Date: Mon, 26 Apr 2021 11:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210421052855.1279713-1-drinkcat@chromium.org>
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
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 boris.brezillon@collabora.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 21/04/2021 07:28, Nicolas Boichat wrote:
> Hi!
> 
> This is just a rebase of the v11, untested (but it seems like
> Neil Armstrong recently tested it), with small changes in
> binding and dts. v11 cover follows:
> 
> Follow-up on the v5 [1], things have gotten significantly
> better in the last year, thanks to the efforts on Bifrost
> support by the Collabora team (and probably others I'm not
> aware of).
> 
> I've been testing this series on a MT8183/kukui device, with a
> chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
> mesa 20.3.2 (lots of artifacts though).
> 
> devfreq is currently not supported, as we'll need:
>  - Clock core support for switching the GPU core clock (see 2/4).
>  - Platform-specific handling of the 2-regulator (see 3/4).
> 
> Since the latter is easy to detect, patch 3/4 just disables
> devfreq if the more than one regulator is specified in the
> compatible matching table.
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
> [2] https://crrev.com/c/2608070
> 
> Changes in v13:
>  - devfreq: Fix conflict resolution mistake when rebasing, didn't
>    even compile. Oops.
> 
> Changes in v12:
>  - binding: Fix min/maxItems logic (Rob Herring)
>  - Add gpu node to mt8183-pumpkin.dts as well (Neil Armstrong).
> 
> Changes in v11:
>  - binding: power-domain-names not power-domainS-names
>  - mt8183*.dts: remove incorrect supply-names
> 
> Changes in v10:
>  - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v9:
>  - Explain why devfreq needs to be disabled for GPUs with >1
>    regulators.
> 
> Changes in v8:
>  - Use DRM_DEV_INFO instead of ERROR
> 
> Changes in v7:
>  - Fix GPU ID in commit message
>  - Fix GPU ID in commit message
> 
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
>  - Add gpu regulators to kukui dtsi as well.
>  - Power domains are now attached to spm, not scpsys
>  - Drop R-B.
>  - devfreq: New change
>  - Context conflicts, reflow the code.
>  - Use ARRAY_SIZE for power domains too.
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
>  - Rename "2d" power domain to "core2" (keep R-B again).
>  - Change power domain name from 2d to core2.
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
>  - Add power-domain-names to describe the 3 domains.
>    (kept Alyssa's reviewed-by as the change is minor)
>  - Add power domain names.
> 
> Changes in v3:
>  - Match mt8183-mali instead of bifrost, as we require special
>    handling for the 2 regulators and 3 power domains.
> 
> Changes in v2:
>  - Use sram instead of mali_sram as SRAM supply name.
>  - Rename mali@ to gpu@.
> 
> Nicolas Boichat (4):
>   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>   arm64: dts: mt8183: Add node for the Mali GPU
>   drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
>   drm/panfrost: Add mt8183-mali compatible string
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  30 ++++-
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
>  .../boot/dts/mediatek/mt8183-pumpkin.dts      |   5 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
>  7 files changed, 168 insertions(+), 1 deletion(-)
> 

Seems this version is ready to be applied if we get a review on the DT ?

Mathias ? could you have a look ?

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
