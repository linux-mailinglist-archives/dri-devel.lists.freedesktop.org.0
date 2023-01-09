Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF96629CF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 16:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CF610E0A1;
	Mon,  9 Jan 2023 15:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563E810E0A1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 15:23:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t5so4115185wrq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 07:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mwDtK5SOlKp9s6llajUedXIC1HMAZ5M22CTtekH3LV8=;
 b=S6ySBI7uqigQXENnTykYBBbp14SKe41Pt2NWwDA1dxeXXL2HK40XJbP1xs2Ik0w3Cp
 a0KdEICHraIPQUO/98sNK3gWydNFLPlGJqDuhNWk+JBS5GD3la9ERT0jAp/ecgXXQOQ6
 gijfZqFWEJ0wCcNygOL//+hNYl49FywqUK0DFHdeP0wy4WS8pt+VQhpftkaWg1yi1TGL
 4TDZrUMk4gHiN1Rn3Oc9R9JeJhcax7llDqj0la+kcFJFt/bTur4WKKeo8lkPIc2/Vn18
 TMeN54nHffkkBJlb726WhnqINHNoAoyNvM2+c0Q+68Jo6htDrYM+Zaj3YOUmL068HsJR
 AMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mwDtK5SOlKp9s6llajUedXIC1HMAZ5M22CTtekH3LV8=;
 b=jwkAsogljP8LDSNowv67jRxpH8o9dzAEdt7vmryk75qipfm9ZBANdtcp7gHmZ1gCU3
 bdUtjKyunKHMe2NLV3VNoY+gRJk3tLagVpBtS62cWnyqd1AcOPQOaymv7StLtiDDxyEW
 5cbkgkYAF86QA+cC6aEfhKjEX8GK3YaZAK6kQElakDJhDidc/XJ+4YEd/+Yl14qONcLy
 yGr2NZ1RSSBx0wSC9UExKILQSuaka1t9Ojz6RH3YHKOIN9MstENxBQFyJCq/ESZ9yN/q
 8yzB5qWqUcfHowQYBZXWcxiWpyZS0FwvB3r2jkZ8/PVtgJB5OH3plD7s/bCI9kdvc/9y
 uRaw==
X-Gm-Message-State: AFqh2kopAmP8VyiPBPT6O5P2LMBnUuVI++8uzTtRuPqWM8G2tImyjiLZ
 OYPfjre/IktzFVCZ7IvVRH3gDw==
X-Google-Smtp-Source: AMrXdXt+xgkeF/UUCTq0onixJ8Cw93/KniYtVUfF/Twv6688WJirU19TWN8EERjKQcTBYsklqsP3Tg==
X-Received: by 2002:adf:cf11:0:b0:24d:5866:fadf with SMTP id
 o17-20020adfcf11000000b0024d5866fadfmr51172294wrj.3.1673277832796; 
 Mon, 09 Jan 2023 07:23:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a010:fe57:993c:4842?
 ([2a01:e0a:982:cbb0:a010:fe57:993c:4842])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a5d6241000000b002bbdaf21744sm5844384wrv.113.2023.01.09.07.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 07:23:52 -0800 (PST)
Message-ID: <0ef85cba-fa9b-6d72-ca44-48c4d6cf2752@linaro.org>
Date: Mon, 9 Jan 2023 16:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RESEND2,v4,2/2] drm/meson: dw-hdmi: Use
 devm_regulator_*get_enable*()
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
References: <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
 <CGME20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83@eucas1p1.samsung.com>
 <6c865dd8-b6c3-4491-48ca-df3e3fa45a2d@samsung.com>
Organization: Linaro Developer Services
In-Reply-To: <6c865dd8-b6c3-4491-48ca-df3e3fa45a2d@samsung.com>
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 14:46, Marek Szyprowski wrote:
> Hi Matti,
> 
> On 30.11.2022 10:23, Matti Vaittinen wrote:
>> Simplify using the devm_regulator_get_enable_optional(). Also drop the
>> now unused struct member 'hdmi_supply'.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>> v4 resend 2:
>> Respinning unchanged code with the commit title changed as wa suggested
>> by Robert Foss and commit message changed as was suggested by Martin.
>>
>> I am doing a clean-up for my local git and encountered this one.
>> Respinning as it seems this one fell through the cracks.
>> ---
>>    drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>>    1 file changed, 3 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 5cd2b2ebbbd3..7642f740272b 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>>    	struct reset_control *hdmitx_apb;
>>    	struct reset_control *hdmitx_ctrl;
>>    	struct reset_control *hdmitx_phy;
>> -	struct regulator *hdmi_supply;
>>    	u32 irq_stat;
>>    	struct dw_hdmi *hdmi;
>>    	struct drm_bridge *bridge;
>> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>>    
>>    }
>>    
>> -static void meson_disable_regulator(void *data)
>> -{
>> -	regulator_disable(data);
>> -}
>> -
>>    static void meson_disable_clk(void *data)
>>    {
>>    	clk_disable_unprepare(data);
>> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>    	meson_dw_hdmi->data = match;
>>    	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>>    
>> -	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
>> -	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
>> -		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
>> -			return -EPROBE_DEFER;
>> -		meson_dw_hdmi->hdmi_supply = NULL;
>> -	} else {
>> -		ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
>> -		if (ret)
>> -			return ret;
>> -		ret = devm_add_action_or_reset(dev, meson_disable_regulator,
>> -					       meson_dw_hdmi->hdmi_supply);
>> -		if (ret)
>> -			return ret;
>> -	}
>> +	ret = devm_regulator_get_enable_optional(dev, "hdmi");
>> +	if (ret != -ENODEV)
> 
> The above line should be "if (ret < 0)", otherwise it breaks hdmi support.
> 
> I've noticed this once this change has been merged to linux-next and all
> my Amlogic Meson based boards failed to initialize HDMI. Is it possible
> to fix this in drm tree or do I need to send the incremental fixup?

Nop, please send an incremental fix and I'll apply it asap.

Thanks,
Neil


> 
>> +		return ret;
>>    
>>    	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>>    						"hdmitx_apb");
> 
> Best regards

