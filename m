Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891934FB523
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 09:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F1710EF8A;
	Mon, 11 Apr 2022 07:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B58410EF8A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 07:42:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r13so21639786wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 00:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uIo1TxJf2bskNX+xU/BhYmUpV7qzLnEQ82MgMRNWWn0=;
 b=5F1CGod8hZIqXmDZp+Y4OIUI4DWzHlYf7YpN5wpa2VPw4697l16ql+hgFKmKvmS/lB
 7vZrldxV9N2s9CVZsbwddjjQvI0z8ein92szz37vAWdM8RcmeD5+i0a+zKftbTd1i/BS
 mzFiCsN54DqXCqNBCZFlDpuDczNVR+mMvoqOj7Xy2J5NrL8t/6Zj+wC2NX3V9ye8TyoX
 NS3OKkQOgfV8ZxtH4NhEgvjtLv0RXv1M5Km1HgTX3AnT7KgHVFGCVynWQVpnWOkyenJH
 sQSRorl0QhyEca/whGvxWSNAEngzRFyBoS3JUrO+qzHqpmWLunm4Bcxz2EYs/EzBbBFj
 v/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uIo1TxJf2bskNX+xU/BhYmUpV7qzLnEQ82MgMRNWWn0=;
 b=Sb7pd3WMxKxb8ztfnJuu0YKyyz2rSpoXnhWzj3OGgo+EW2gnycQCjtbtYzHiQwtqjs
 UGYNgstzH9MCELtn3GBuGuU4raw4fmT8gTTQQkbH8ksGzB+YNtoFogzy3MExw04rZMgu
 OvvB7W3QjYA3hrAnGacOuLczjhZGnJfhd0MrPfyq7xenOy7PGwiH6fV3pSbJxgwQFYhj
 GIjpE/bRf0cX0OH9xFljahqR2HvuKEU1jfuAnGTMiiorq1LQ67yJUm50OLXY5ttOOcmN
 u6bQJoUtubH9AJ6ROQDv6rT/b/Rt0f1unw8jMbkiHf67e9pZMdQfilqdwH5iCzdLMHny
 0PjA==
X-Gm-Message-State: AOAM533q31lcLyvl1ZVFwXMWGkc8Y5wqrb6VUSa00s5eK48NDG7VqRyG
 auHY3CSwCsIxmG8LxVVKjLAjqQ==
X-Google-Smtp-Source: ABdhPJznNBZpAPlfiaYL0jUXvfyWlr79JWR5P2Peay4juEQi1V+DtLvyfEvTOsxj1SQ7jGcaoJIBrw==
X-Received: by 2002:adf:ba8f:0:b0:1e9:4afb:179b with SMTP id
 p15-20020adfba8f000000b001e94afb179bmr24203852wrg.57.1649662947390; 
 Mon, 11 Apr 2022 00:42:27 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d68cc000000b00207a6461ecdsm2424762wrw.93.2022.04.11.00.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 00:42:26 -0700 (PDT)
Message-ID: <41211991-e755-21d8-1c94-62d91401d0c6@baylibre.com>
Date: Mon, 11 Apr 2022 09:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/5] drm: bridge: dw_hdmi: cec: Add cec suspend/resume
 function
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 hverkuil-cisco@xs4all.nl
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <45739041a743cd435415ca53264678e57a653147.1649412256.git.Sandor.yu@nxp.com>
 <4a6a4b70-3e24-3043-4e9d-f62e4798f28b@baylibre.com>
 <3658461.kQq0lBPeGt@jernej-laptop>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <3658461.kQq0lBPeGt@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: shengjiu.wang@nxp.com, cai.huoqing@linux.dev, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/04/2022 12:13, Jernej Škrabec wrote:
> Dne petek, 08. april 2022 ob 15:41:36 CEST je Neil Armstrong napisal(a):
>> On 08/04/2022 12:32, Sandor Yu wrote:
>>> CEC interrupt status/mask and logical address registers
>>> will be reset when device enter suspend.
>>> It will cause cec fail to work after device resume.
>>> Add CEC suspend/resume functions, reinitialize logical address registers
>>> and restore interrupt status/mask registers after resume.
>>>
>>> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
>>> ---
>>>
>>>    drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 37 +++++++++++++++++++
>>>    1 file changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c index
>>> c8f44bcb298a..ab176401b727 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>>> @@ -62,6 +62,10 @@ struct dw_hdmi_cec {
>>>
>>>    	bool rx_done;
>>>    	struct cec_notifier *notify;
>>>    	int irq;
>>>
>>> +
>>> +	u8 regs_polarity;
>>> +	u8 regs_mask;
>>> +	u8 regs_mute_stat0;
>>>
>>>    };
>>>    
>>>    static void dw_hdmi_write(struct dw_hdmi_cec *cec, u8 val, int offset)
>>>
>>> @@ -306,11 +310,44 @@ static int dw_hdmi_cec_remove(struct platform_device
>>> *pdev)>
>>>    	return 0;
>>>    
>>>    }
>>>
>>> +static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
>>> +{
>>> +	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
>>> +
>>> +	/* Restore logical address */
>>> +	dw_hdmi_write(cec, cec->addresses & 255, HDMI_CEC_ADDR_L);
>>> +	dw_hdmi_write(cec, cec->addresses >> 8, HDMI_CEC_ADDR_H);
>>> +
>>> +	/* Restore interrupt status/mask register */
>>> +	dw_hdmi_write(cec, cec->regs_polarity, HDMI_CEC_POLARITY);
>>> +	dw_hdmi_write(cec, cec->regs_mask, HDMI_CEC_MASK);
>>> +	dw_hdmi_write(cec, cec->regs_mute_stat0, HDMI_IH_MUTE_CEC_STAT0);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
>>> +{
>>> +	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
>>> +
>>> +	/* store interrupt status/mask register */
>>> +	 cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
>>> +	 cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
>>> +	 cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct dev_pm_ops dw_hdmi_cec_pm = {
>>> +	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_cec_suspend, dw_hdmi_cec_resume)
>>> +};
>>> +
>>>
>>>    static struct platform_driver dw_hdmi_cec_driver = {
>>>    
>>>    	.probe	= dw_hdmi_cec_probe,
>>>    	.remove	= dw_hdmi_cec_remove,
>>>    	.driver = {
>>>    	
>>>    		.name = "dw-hdmi-cec",
>>>
>>> +		.pm = &dw_hdmi_cec_pm,
>>>
>>>    	},
>>>    
>>>    };
>>>    module_platform_driver(dw_hdmi_cec_driver);
>>
>> As Hans said on v1, why don't you call dw_hdmi_cec_enable(cec->adap, false)
>> in suspend and dw_hdmi_cec_enable(cec->adap, true) in resume ?
>>
>> With this, CEC engine is not disabled on suspend.
> 
> This should not be done, at least not unconditionally. CEC wakeup
> functionality is used by Crust firmware for Allwinner boards. In fact, DW HDMI
> CEC controller was designed with suspend/resume functionality in mind. If
> properly set, it can autonomously scan for preset CEC messages and generate
> interrupt when found.
> 
> Actually, I'm not fan of this patch, since it looks like workaround for power
> management firmware not restoring previous state. Or is this HW issue? In any
> case, Allwinner SoCs with DW-HDMI CEC don't need restoring any register, so
> it's certainly not a general issue.

In this case I think it should explicit in the hdmi_plat_data to either let
CEC enabled on suspend or then disable CEC on suspend.

> 
>>
>> Do you plan to use the engine from the suspend code ?
> 
> As mentioned before, it's already done for Allwinner, so CEC should remain
> enabled

Thanks for confirming that

> 
> Best regards,
> Jernej
> 
>>
>> Neil
> 
> 
> 
> 

Neil
