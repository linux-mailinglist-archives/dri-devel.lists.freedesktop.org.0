Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4F6E23A7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 14:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18E910ED16;
	Fri, 14 Apr 2023 12:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F8710ED2A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 12:52:58 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id dd8so5144266qvb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681476777; x=1684068777; 
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c1mRBvmkKWpgvM1gONebrVKM3TA+ePdq5Jwjyb83ndI=;
 b=hfxcYBA6wKz0ja41R5GILX3KMG8FLrGhi8JWeM0W+y08tHIeAr1vzeBz6MD4JxzdBF
 QIhHkA3pbw59fZMAbr6b0i7r250bHgCCQTtKAKttdlfD8JhZyvUmQNuAj/uhdZtlKR7B
 KH05LZDkOItVIJbkhdHUcPbhGF37Iuzi2x+KKmUQGbaXez7ZikZDtNYtH6a64wNFe3lT
 DhyEQk8l44mdyq2Y4kI730hkh110qFH4d7oMA7EiD2VeMU9FLouu/qguZi9jRdHRRWaw
 +3u1tDfvw2LIjhSEsl0CC8jA7Lp6j743ttLMCvJJ42APWUvnVVahAUfe6mF3GO9ThAtK
 ehnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681476777; x=1684068777;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1mRBvmkKWpgvM1gONebrVKM3TA+ePdq5Jwjyb83ndI=;
 b=gXq1tpc2yDGmgysTP7iQsNPAp+khSVJFbe4+EHijJV27XLO8iYceoLwkGaDznJP+mz
 I0nzXWuS34CzeRynTQpWbXckvtPvFqXB0lg+V7VYmGJ8AzEr7PXq+MG9Sci3fuh5vqmU
 wOFF+RVSjzOl/8KeL+HFzHjweQI9Si+fKEc8iuyo61TXLNcC1AB8J4r/3zqMkp16mSo4
 d46hGRKZY4ktrJW1QWRmCT1dmZljYavOCtxv8kvzfoVByPSpEzw5+luJXF1RAGeeiyzA
 FMawsY2Gf0jB7HEjDpN/qpCTLPFBflheSVmbvv2GyPykg9C696ytTjpYFi/szTAzNdur
 vVNw==
X-Gm-Message-State: AAQBX9fAlWgxWsjHYkC+ceOx+ZXbxBHVeQMYiUB2EE9JBnaFA9lEpcxa
 tuILcaZxCk1bsOfs6xCCuoZE7n3ISvQ0XVL5B//sAQ==
X-Google-Smtp-Source: AKy350bwrlQ1k6Id6taPs74WKZ2MYVEoCM7n+Fk3n2G+lg7Txm3HQS1LILK4QlW1vfVH9uPVwc8hFNllM10fhh8EPyk=
X-Received: by 2002:a05:6214:2504:b0:56f:728:19d4 with SMTP id
 gf4-20020a056214250400b0056f072819d4mr3900460qvb.26.1681476777521; Fri, 14
 Apr 2023 05:52:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Apr 2023 05:52:57 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v1-1-b8482458df0d@baylibre.com>
 <ada769e0-0141-634f-3753-eb3a50f0eee3@collabora.com>
In-Reply-To: <ada769e0-0141-634f-3753-eb3a50f0eee3@collabora.com>
MIME-Version: 1.0
Date: Fri, 14 Apr 2023 05:52:57 -0700
Message-ID: <CABnWg9v+DXatKqUkwDZBRxivtg869SocPGtHibtFNr7tnyVggg@mail.gmail.com>
Subject: Re: [PATCH 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Apr 2023 12:31, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 13/04/23 14:46, Guillaume Ranquet ha scritto:
>> The ret variable in mtk_hdmi_pll_calc() was used unitialized as reported
>> by the kernel test robot.
>>
>> Fix the issue by removing the variable altogether and testing out the
>> return value of mtk_hdmi_pll_set_hw()
>>
>> Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> index abfc077fb0a8..e10da6c4147e 100644
>> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> @@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>>   	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
>>   	u8 txpredivs[4] = { 2, 4, 6, 12 };
>>   	u32 fbkdiv_low;
>> -	int i, ret;
>> +	int i;
>>
>>   	pixel_clk = rate;
>>   	tmds_clk = pixel_clk;
>> @@ -292,10 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>>   	if (!(digital_div <= 32 && digital_div >= 1))
>>   		return -EINVAL;
>>
>> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>> +	if (mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>>   			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>> -			    txposdiv, digital_div);
>> -	if (ret)
>> +			    txposdiv, digital_div))
>>   		return -EINVAL;
>>
>
>I don't get why we're returning -EINVAL unconditionally in the first place, here.
>
>Function mtk_hdmi_pll_set_hw() should return zero or a negative error number: in
>that case, the previous *intention* was fine, so this should be
>

Hi Angelo,
I was maybe a bit too quick on fixing this that way.
Anyway it doesn't change a thing as mtk_hdmi_pll_set_hw() eitheir
returns 0 or -EINVAL.
But I agree that the logic is dubious and propagating the return value
is the right thing
to do.

I see that Arnd and Tom posted versions that you might prefer:

https://lore.kernel.org/linux-phy/20230414075842.4006164-1-arnd@kernel.org/
https://lore.kernel.org/linux-phy/20230414122253.3171524-1-trix@redhat.com/

Thx,
Guillaume.

>	ret = mtk_hdmi_pll_set_hw(....)
>	if (ret)
>		return ret;
>
>	return 0;
>
>
>Regards,
>Angelo
