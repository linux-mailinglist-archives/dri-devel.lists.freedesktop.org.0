Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48F419AF1F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 17:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D057688FA6;
	Wed,  1 Apr 2020 15:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1A788FA6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 15:53:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h9so633535wrc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0f/XYTR4UBnbJHjjMTX3zk6+hslXkQMltd9uJrLBVTU=;
 b=o/xL3cVwbsk5S+1jaLiA9E7tuX20XDwz5Iw1vFJNv3HMx+ytz0Qhw53lYFBslJA4sp
 eN6HyRtQY/s09nA0fseoxM7U9vRC2P/yegP/W3ijTxcwd+aX3Jk65GIxoYa171QCToR1
 FcUf4s2u3N/CgKtA7jaVApjed7DXm5qciq0hYqo7Rg01dJHXa6H7WkQc8h0UpPqlx2/5
 WxHEKiqbVX03mona9u1WuOtFyq1mHzbJPolXra/1cIAOu2GzoM7X6ne595bBt6HLJ3yX
 bz1+goAaqqfVGt37ld2q9iWwBGDKqrojGLIXHuuiP199vD52PQDJsbg/umcNABlAht0t
 E9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0f/XYTR4UBnbJHjjMTX3zk6+hslXkQMltd9uJrLBVTU=;
 b=KSAiKSoa3ZmUih2IkRtTNy/uBU55sr5FLgKbLGb823yI8OOyVWAe/i7HwpmIv9i0SV
 y9AD3HY4FrT3kv2QprnY60x3Itdi8TsnhnjRGNBhwBclQmJ4tIHwGKGsQWzAr8ZABKP9
 VXuvOqWDPprG2Wqq5s3djmmwS2dXghe3P9JQvaAwYKs4D+wkWm9a09gL7MrBP0gb11DX
 SKpJeXk91mElWuqpsZfSbr6p4nQgTOuLLi8LWQ87hd0e1th08mLLz55IisvF1ULoX7RF
 PrnCNpaUzmNQNw+GelgRk/ksvDhBKIzNl63bAl0cZqnNXg4Nqp3mrtKIWAZms6fSp1t+
 JBnQ==
X-Gm-Message-State: ANhLgQ2RHju9qtxNSVSu/mlsAmo1U245UfgNfRdVQG+W8P4Vric/1Jab
 iVj5RxCrZ+So1PbqOrqt1UBlWeILT9A=
X-Google-Smtp-Source: ADFU+vvWMwpkGrYxV7aTLQS97LCfnWSQDP/ltzKEi4H3YGEsHoktO0RrIcp+5M4UhyLWwlmca0VMwg==
X-Received: by 2002:adf:9071:: with SMTP id
 h104mr26875795wrh.359.1585756408702; 
 Wed, 01 Apr 2020 08:53:28 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id p21sm141457wmg.34.2020.04.01.08.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2020 08:53:27 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] drm/mediatek: Move tz_disabled from mtk_hdmi_phy
 to mtk_hdmi driver
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200331155728.18032-1-chunkuang.hu@kernel.org>
 <20200331155728.18032-2-chunkuang.hu@kernel.org>
 <1585707361.28859.19.camel@mhfsdcap03>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ceae861b-b5ee-1d33-67dd-0a2ff4af2816@gmail.com>
Date: Wed, 1 Apr 2020 17:53:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1585707361.28859.19.camel@mhfsdcap03>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 01/04/2020 04:16, Chunfeng Yun wrote:
> On Tue, 2020-03-31 at 23:57 +0800, Chun-Kuang Hu wrote:
>> From: CK Hu <ck.hu@mediatek.com>
>>
>> tz_disabled is used to control mtk_hdmi output signal, but this variable
>> is stored in mtk_hdmi_phy and mtk_hdmi_phy does not use it. So move
>> tz_disabled to mtk_hdmi where it's used.
>>
>> Signed-off-by: CK Hu <ck.hu@mediatek.com>
>> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> ---
>>  drivers/gpu/drm/mediatek/mtk_hdmi.c           | 22 ++++++++++++++++---
>>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.h       |  1 -
>>  .../gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c    |  1 -
>>  3 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 5e4a4dbda443..878433c09c9b 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -144,11 +144,16 @@ struct hdmi_audio_param {
>>  	struct hdmi_codec_params codec_params;
>>  };
>>  
>> +struct mtk_hdmi_conf {
>> +	bool tz_disabled;
>> +};
>> +
>>  struct mtk_hdmi {
>>  	struct drm_bridge bridge;
>>  	struct drm_bridge *next_bridge;
>>  	struct drm_connector conn;
>>  	struct device *dev;
>> +	const struct mtk_hdmi_conf *conf;
>>  	struct phy *phy;
>>  	struct device *cec_dev;
>>  	struct i2c_adapter *ddc_adpt;
>> @@ -230,7 +235,6 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
>>  static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
>>  {
>>  	struct arm_smccc_res res;
>> -	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(hdmi->phy);
>>  
>>  	/*
>>  	 * MT8173 HDMI hardware has an output control bit to enable/disable HDMI
>> @@ -238,7 +242,7 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
>>  	 * The ARM trusted firmware provides an API for the HDMI driver to set
>>  	 * this control bit to enable HDMI output in supervisor mode.
>>  	 */
>> -	if (hdmi_phy->conf && hdmi_phy->conf->tz_disabled)
>> +	if (hdmi->conf->tz_disabled)

Wouldn't we need to check:
if (hdmi->conf && hdmi->conf->tz_disabled)

>>  		regmap_update_bits(hdmi->sys_regmap,
>>  				   hdmi->sys_offset + HDMI_SYS_CFG20,
>>  				   0x80008005, enable ? 0x80000005 : 0x8000);
>> @@ -1688,6 +1692,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>>  		return -ENOMEM;
>>  
>>  	hdmi->dev = dev;
>> +	hdmi->conf = of_device_get_match_data(dev);
>>  
>>  	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
>>  	if (ret)
>> @@ -1765,8 +1770,19 @@ static int mtk_hdmi_resume(struct device *dev)
>>  static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
>>  			 mtk_hdmi_suspend, mtk_hdmi_resume);
>>  
>> +static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
>> +	.tz_disabled = true,
>> +};
>> +
>> +static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173;
>> +
>>  static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
>> -	{ .compatible = "mediatek,mt8173-hdmi", },
>> +	{ .compatible = "mediatek,mt2701-hdmi",
>> +	  .data = &mtk_hdmi_conf_mt2701,
>> +	},
>> +	{ .compatible = "mediatek,mt8173-hdmi",
>> +	  .data = &mtk_hdmi_conf_mt8173,

We don't have any data? Then we should set data to NULL instead.

Regards,
Matthias

>> +	},
>>  	{}
>>  };
>>  
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
>> index 2d8b3182470d..fc1c2efd1128 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
>> @@ -20,7 +20,6 @@
>>  struct mtk_hdmi_phy;
>>  
>>  struct mtk_hdmi_phy_conf {
>> -	bool tz_disabled;
>>  	unsigned long flags;
>>  	const struct clk_ops *hdmi_phy_clk_ops;
>>  	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
>> index d3cc4022e988..99fe05cd3598 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
>> @@ -237,7 +237,6 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
>>  }
>>  
>>  struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
>> -	.tz_disabled = true,
>>  	.flags = CLK_SET_RATE_GATE,
>>  	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
>>  	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
> 
> Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
