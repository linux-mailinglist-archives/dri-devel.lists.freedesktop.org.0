Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 804156E2898
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 18:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7749610E1C2;
	Fri, 14 Apr 2023 16:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A6E10E1C2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 16:44:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v27so8939849wra.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681490673; x=1684082673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ExngqUZl/pg1Kd6E34uU7m6iwz6q/2qwB8gBrD6lrQ=;
 b=GhkswUhAKDkCiKoc9t/eyiaF53+6JyxpB18rycr+qlp/lNeetlGLuu6GC3ZG8hfb3p
 fqfpoGQ1pqAOcdlI8Y+sJ72mfNnaJ4FPwqnqMuQ+izLObeSwa41gXQt8sJodv5jGa/0T
 DCHyxVmFTXoiZAJKFeYg2l3HyO7R7QqyznuMMRwhr31tpWeC+kKGYa4XZgae5wk9hU5v
 VC7eE6Gxz4FTNBR5+PHuTW33T3KogEu+IssYXh1wsleN/owJgoVClrGYWJ1UOi2BxTfn
 OAH2m6K62WkIgosirUt4RSz7l1iPN9jNIyueDp5i7cjxMfGJCzjb0B8HHgaz47wDrAyd
 iNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681490673; x=1684082673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ExngqUZl/pg1Kd6E34uU7m6iwz6q/2qwB8gBrD6lrQ=;
 b=HYimgGq04CLxXl76XNPHS/Y3i1UFWuiZqunyDQLvR9NkIsgijIPgPUMXGWnKbkgo20
 ktSXFRkJ0T+lzDzST+b8CQ0TSDt8n1XxKOgHr/DLbTqprX+bRasIvtnuxiM230jBOOdt
 ktBrXULPYg/rjjQ/pd0VDcI3EuQdddROlgsrJBMWiPF1icrIeFl3DWClItXra0wc+JgW
 wtxwnYyCkU+VyOZZQYmPoP6oHlMByW5bJhscceZ7P0Kda63dfq3qTQRwqiNavG1mstuX
 NlIL3pJKaYo4AThBXYJQZmMZ9zqlUItO9D5YHWuAZXR6bUK5hpTjKm/6YmIswG2KzheQ
 Lt0A==
X-Gm-Message-State: AAQBX9cB/aabCfQazRJnLyoHhJjndXJQ1JVxCV+LNt6Q13dQ2qOm7Ce9
 KebwS8dFeGaq47xCrtLaGys=
X-Google-Smtp-Source: AKy350bpkl/XH9EejX97SLMedFqNtcocLz0dofiURStn1ZlIYfmxrsXsRPyGC/UDwV0n9ZyuKK9coQ==
X-Received: by 2002:adf:ed45:0:b0:2f7:faa0:3f19 with SMTP id
 u5-20020adfed45000000b002f7faa03f19mr349951wro.28.1681490673410; 
 Fri, 14 Apr 2023 09:44:33 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a056000015000b002f21a96c161sm3936139wrx.70.2023.04.14.09.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 09:44:32 -0700 (PDT)
Message-ID: <8e40e46a-edf4-96c5-7248-21f39a93a410@gmail.com>
Date: Fri, 14 Apr 2023 18:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/04/2023 18:07, Guillaume Ranquet wrote:
> The ret variable in mtk_hdmi_pll_calc() was used unitialized as reported
> by the kernel test robot.
> 
> Fix the issue by removing the variable altogether and testing out the
> return value of mtk_hdmi_pll_set_hw()
> 
> Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Looks good, but got unfortunately already fixed 4 hours ago with
20230414122253.3171524-1-trix@redhat.com

:)

Regards,
Matthias

> ---
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..054b73cb31ee 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
>   	u8 txpredivs[4] = { 2, 4, 6, 12 };
>   	u32 fbkdiv_low;
> -	int i, ret;
> +	int i;
>   
>   	pixel_clk = rate;
>   	tmds_clk = pixel_clk;
> @@ -292,13 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	if (!(digital_div <= 32 && digital_div >= 1))
>   		return -EINVAL;
>   
> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> +	return mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>   			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>   			    txposdiv, digital_div);
> -	if (ret)
> -		return -EINVAL;
> -
> -	return 0;
>   }
>   
>   static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> 
