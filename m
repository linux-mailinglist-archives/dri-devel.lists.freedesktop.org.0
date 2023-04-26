Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A0E6EF389
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 13:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD8010E952;
	Wed, 26 Apr 2023 11:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8194B10E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:43:30 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E77D660324E;
 Wed, 26 Apr 2023 12:43:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682509407;
 bh=LHVBsT9EmHiYRsufhxP3C7/xLomL6Pg/ovhoh+Syk1o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Fs4E+VJTXcXu0HIh3Az2PWq4QVtLzeQiYlCCf5uMvRydDn/IOEb9gXaq+SJMNWucM
 dQ/+vmjEfzlCUXG9ZhQLKhoOe/gnZ+b4RbHRuMzSQqdMX7uI4XCJnnvVpD+1Kfll0P
 JB/4fLORJx1VzJGtWVb9LMFxlXyJeuBfbdNfEf4GgD6WpKxIhVnkt/2gvFFBUVnyEy
 d+2aUJzV4l6KgkQT0I2EqNk1tabB/S8i2JXQ3MZ/WxwzMKCYlJTwl9h7OhT98m+FLO
 gRwPs9QANyW7PoxrW83MG+HUa4leBbV6vQXSp7gDtSEkwJq6FaCDBI/vGXgC32v1AH
 Sv49JFXKHirSQ==
Message-ID: <c6a12ebc-99f1-855d-e366-e5a4833dc562@collabora.com>
Date: Wed, 26 Apr 2023 13:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 0/9] Add gamma lut support for mt8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/09/22 03:29, Jason-JH.Lin ha scritto:
> Since the gamma_set_common() function for previous SoC,
> such as  mt8173 and mt8183, is designed for 9bit-to-10bit
> conversion.
> mt8195 is using 10bit-to-12bit conversion, which is
> not compatible with the previous function.
> 
> Thus, need to update the function to fit the need of mt8195.

Hello,
can you please respin and fix this series on the latest linux-next?

Besides, please test it carefully: as far as I can see, GNOME Night Light
(or others) are not working on MT8195 (color temperature/ccorr).
As for gamma itself, that's not working either; you can test it with a tool
that will create a color profile by applying a new VCGT table, please look
at [1] if you need tools.

We can confirm that color correction works on at least MT8192 (colord), so
it's MT8195 at fault.

[1]: https://github.com/zb3/gnome-gamma-tool

Regards,
Angelo

> ---
> Change in RESEND v3:
> Fix build warning
>>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:59:14: warning: no previous prototype for 'mtk_gamma_get_size' [-Wmissing-prototypes]
> 
> Change in v3:
> 1. separate 1 dt-binding patch to 2 patches, 1 is for modifying
>     multiple items list to one and 1 is for moving mt8195 compatible.
> 2. redefine variables to reduce memory usage.
> 3. delete unused symbols.
> 4. separate 1 drm/mediatek patch to 6 patches.
> 5. rebase on tag 'next-20220909'
> 
> Jason-JH.Lin (5):
>    drm/mediatek: Adjust mtk_drm_gamma_set_common parameters
>    drm/mediatek: Add gamma support different lut_size for other SoC
>    drm/mediatek: Add gamma support different lut_bits for other SoC
>    drm/mediatek: Add gamma support different bank_size for other SoC
>    drm/mediatek: Add clear RELAY_MODE bit to set gamma
> 
> zheng-yan.chen (4):
>    dt-bindings: mediatek: modify item formatting for gamma
>    dt-bindings: mediatek: Add gamma compatible for mt8195
>    drm/mediatek: Add gamma lut support for mt8195
>    arm64: dts: Modify gamma compatible for mt8195
> 
>   .../display/mediatek/mediatek,gamma.yaml      |   8 +-
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   2 +-
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c       |   2 +-
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +-
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 115 ++++++++++++++----
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   4 +-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   1 -
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   9 ++
>   8 files changed, 109 insertions(+), 35 deletions(-)
> 


