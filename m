Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127179D6F5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C0610E448;
	Tue, 12 Sep 2023 16:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF8E10E448
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 16:57:02 +0000 (UTC)
Received: from [192.168.0.106] (unknown [186.235.7.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AC1966071C9;
 Tue, 12 Sep 2023 17:56:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694537820;
 bh=HBRi9Hhlgh4EDnkDLig1ZLdAN0tTXejvnyzq+J8F68E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GTWXXG06C++Uo5WfJQzOUXkpnQStgPoetnWMMASam4EhpbXuwDH6Ku9xtwu0mpw1t
 f5J4/pqRt9bIrBL4y2H/6DsAw74oUyqYTUKEM3JCfXMpTDk1oF2J91qHXGBA5U7r0V
 9G0gugYAliu2T+QNNMeW/0+9ElxNLsNiKrBSWoo6iT5Q2N3s/qYYf2BDvH0pYLRRrb
 5v9pLr0FyIGScMIJjbei3sZ4YjVbuoKLmTJ8e1zjBZRuzG1yZrbdKK4l34lGEZuI90
 RWI8IlsOk1xk8FgN0eo3e27d4VrjdZfEsVhNVWtuHj77T9k0UY53s4E34RUqn1ZI9a
 3uVlsBT+spg8A==
Message-ID: <3f1f1679-2d0a-d501-da9c-cb38088acef2@collabora.com>
Date: Tue, 12 Sep 2023 13:56:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 6/9] arm64: defconfig: Enable DA9211 regulator
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-7-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-7-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org, andersson@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/09/2023 12:22, Vignesh Raman wrote:
> Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
> Enabling CONFIG_REGULATOR_DA9211=y in drm-ci fixes the issue.
> 
> So enable it in the defconfig since kernel-ci also requires it.

tbh, =m doesn't solve for mesa-ci (since we don't use an initrd, not 
sure if it solves for kernel-ci.

> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.co
In any case:

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v3:
>    - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
> 
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index a25d783dfb95..ef22b532b63a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -711,6 +711,7 @@ CONFIG_REGULATOR_AXP20X=y
>   CONFIG_REGULATOR_BD718XX=y
>   CONFIG_REGULATOR_BD9571MWV=y
>   CONFIG_REGULATOR_CROS_EC=y
> +CONFIG_REGULATOR_DA9211=m

Question for the maintainers: would it be acceptable to make it a =y 
instead of =m here ? Since this is something required for booting.

Regards,
Helen

>   CONFIG_REGULATOR_FAN53555=y
>   CONFIG_REGULATOR_GPIO=y
>   CONFIG_REGULATOR_HI6421V530=y
