Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F12607AAF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 17:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D9D10E4CE;
	Fri, 21 Oct 2022 15:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F04410E3BF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 15:29:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so2240781wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VjZxqVwknh6rTHyizGvNMyan0rBuejjdovMyQ+KXz6Q=;
 b=PfPlpxaVD69iC/kMSPtqV9m9Du/JKNf7gFs5X95GrddDoi1ivdQq87vRJFCdd0tIfe
 sVLYLMgrAJivtuNepJjbZ9Kv2Y7qDv1O9aNJkguzTr71vYgfiokWBGqfIrpQOlZ+rBXN
 2j1SjU2b4QmBF4AYzpwJ2kPxQXtba+pevjuJFsjQMs/XUKcm82ZDo7Kf4hknClSlAhHW
 c1ClsChKLy2T7AP/QqyslmZFoI7DHKpGl3loWynWDI7ViI7tpRsH4sjT7cgGJAJ7QDwz
 YKqhaXvdcYV0zSEw28FabJn7IFk9Vy3cVWANB55q8PsvgF+tgLBN4WQSWET8xUuhb0kD
 QGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjZxqVwknh6rTHyizGvNMyan0rBuejjdovMyQ+KXz6Q=;
 b=U20JpLGGtSSYjnF7qFzUTYua146cDUeVjlsPJjmWIK5NMHyWN4jw7bpVvK5JwjtQHI
 Mr8BA+RMyTw3UeR296tfOgVaR5Y4PYmKmw8qZhA6UQ+fVfFxsZUi5gJ6I5oeQLar2Clu
 QCF6bOwgP/xs2jGt/asfyGgWQc1uV8Y+DjBMo6E16P/h7I2nEarOrXH11/FJ5TtmrUsx
 KQFt9X98ZvFueWr/jziknFKEFu/ivnB6/v42RHr9UjJAcdflZ6XRxZM4lXWw+sAzdmFq
 BVALvl2CS1r2DARjUZIEwXU8NVrxrK9eE6osRdQ8dM+sjHioV92zC8XUtuEJfpJGSvIV
 9aaA==
X-Gm-Message-State: ACrzQf0Ljg4TxdocSQUvnNLXKWQ5kdYjqY9JFnAuulbWM80SPwwhl3VV
 0K6+59Rr5Ukm9HshZTm2uFCSJw==
X-Google-Smtp-Source: AMsMyM4hXGO9U8al2JzyTEC39tKZD6qIgNLNXyIQi+DLXxN292zU+X+E3Bq7kmxXYB+Xrq4wIyj8gg==
X-Received: by 2002:a05:600c:1614:b0:3c6:ca05:3e02 with SMTP id
 m20-20020a05600c161400b003c6ca053e02mr35430814wmn.116.1666366158507; 
 Fri, 21 Oct 2022 08:29:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8104:adb4:5d77:2050?
 ([2a01:e0a:982:cbb0:8104:adb4:5d77:2050])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a05600c4e1500b003a83ca67f73sm3060390wmq.3.2022.10.21.08.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 08:29:18 -0700 (PDT)
Message-ID: <00d90039-c38a-ad8a-80a1-5a654a528756@linaro.org>
Date: Fri, 21 Oct 2022 17:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
 <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
Organization: Linaro Developer Services
In-Reply-To: <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amlogic@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 21/10/2022 17:02, Laurent Pinchart wrote:
> Hi Matti,
> 
> On Fri, Oct 21, 2022 at 04:18:01PM +0300, Matti Vaittinen wrote:
>> Simplify using the devm_regulator_get_enable_optional(). Also drop the
>> seemingly unused struct member 'hdmi_supply'.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> v3 => v4:
>> - split meson part to own patch
>>
>> RFCv1 => v2:
>> - Change also sii902x to use devm_regulator_bulk_get_enable()
>>
>> Please note - this is only compile-tested due to the lack of HW. Careful
>> review and testing is _highly_ appreciated.
>> ---
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>>   1 file changed, 3 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 5cd2b2ebbbd3..7642f740272b 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>>   	struct reset_control *hdmitx_apb;
>>   	struct reset_control *hdmitx_ctrl;
>>   	struct reset_control *hdmitx_phy;
>> -	struct regulator *hdmi_supply;
>>   	u32 irq_stat;
>>   	struct dw_hdmi *hdmi;
>>   	struct drm_bridge *bridge;
>> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>>   
>>   }
>>   
>> -static void meson_disable_regulator(void *data)
>> -{
>> -	regulator_disable(data);
>> -}
>> -
>>   static void meson_disable_clk(void *data)
>>   {
>>   	clk_disable_unprepare(data);
>> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>   	meson_dw_hdmi->data = match;
>>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
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
>> +		return ret;
> 
> As noted in the review of the series that introduced
> devm_regulator_get_enable_optional(), the right thing to do is to
> implement runtime PM in this driver to avoid wasting power.

While I agree, it's not really the same level of effort as this patch
should be functionally equivalent.

> 
>>   
>>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>>   						"hdmitx_apb");
> 

Neil
