Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8314F9714
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 15:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13B910F1A9;
	Fri,  8 Apr 2022 13:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E822E10F1A9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 13:41:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m30so12951745wrb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ttnjxeFPtnBDvb8Dmwr7pVkOvTYYrY+X3dFBMwXdT3Y=;
 b=uCwSmY+ePMLZWlx2IqWzxlM4xato0/+QGD8xW8s506c56i6Phvjwf2CmIivbe3yS6w
 fcPXSkc5zW5rgCjHzdYh1A7hSxsPFAKabvn+vAROfC/ZTb8yXBku323RGXkMfJ5Wbzsu
 D3Yll8aXkE2q5GMplOjbZAMXoQOHTpRRI6oeAtElp8B1Hcn9PEtM0sbvoCZlsqp7eGXH
 zG9boZBRQBoFEKfgSAOH+FI2rFAKijM+GQmlgVgVkyYkynvaeT5aiSPZ/BiP58yq5VAc
 TS+g+H3xOAEwIxCV2p5n7etg9jJ+/VRU6rZvSmoDb7tyskiS9SLnxcaslbiWnHq1D8Pn
 dDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ttnjxeFPtnBDvb8Dmwr7pVkOvTYYrY+X3dFBMwXdT3Y=;
 b=n8ByTC5NoaE7yckMVvfkMisnafQ+3K0i2eUHHOuKq6Ujzrul1Ae7m6uXMo7h3RcaNc
 cEYSIJ5DyYSkMMAiyqQcv1rt30QQPcvIoIf8kVax7+DnW358BzJHoJHiGGA1OtAzRIzK
 FRLCsP7oXjQGjsix2V/EdvBZrbjPWLVxAOQAvxnQ1IaS0FnZtwEMpSAmQO2VDf7AzK1I
 04BCPv4hBBwx4dAlddq85DZ2RwIA7r+962k4Ta0r1Tqf6mFBOxWFoI6aRGuxjWoDnNPd
 aODQUmn6MU/J69r3J+PdAJokxF/buOpMrN1blFktvIlWAj1GZaRCeHEgkuXQ6A457e0T
 510A==
X-Gm-Message-State: AOAM531co49Cu7VT9dnk/GYlV/Cdgaqixhes9q1On9bBJu9otxO0kaZ7
 YhHOz6soeSGCihUBp4haZcVKxw==
X-Google-Smtp-Source: ABdhPJzZMmsiiLeNmisRgf/QerRPfZJDrPAsPV0vAyABh/txaHHIq4rGE5g6fUSveEUfpckt8rBRGA==
X-Received: by 2002:a5d:414b:0:b0:205:89b7:91bf with SMTP id
 c11-20020a5d414b000000b0020589b791bfmr14754373wrq.217.1649425298367; 
 Fri, 08 Apr 2022 06:41:38 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:eacd:ce6:e294:acd1?
 ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm23576229wrb.8.2022.04.08.06.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 06:41:37 -0700 (PDT)
Message-ID: <4a6a4b70-3e24-3043-4e9d-f62e4798f28b@baylibre.com>
Date: Fri, 8 Apr 2022 15:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/5] drm: bridge: dw_hdmi: cec: Add cec suspend/resume
 function
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <45739041a743cd435415ca53264678e57a653147.1649412256.git.Sandor.yu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <45739041a743cd435415ca53264678e57a653147.1649412256.git.Sandor.yu@nxp.com>
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
Cc: shengjiu.wang@nxp.com, cai.huoqing@linux.dev, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04/2022 12:32, Sandor Yu wrote:
> CEC interrupt status/mask and logical address registers
> will be reset when device enter suspend.
> It will cause cec fail to work after device resume.
> Add CEC suspend/resume functions, reinitialize logical address registers
> and restore interrupt status/mask registers after resume.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index c8f44bcb298a..ab176401b727 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -62,6 +62,10 @@ struct dw_hdmi_cec {
>   	bool rx_done;
>   	struct cec_notifier *notify;
>   	int irq;
> +
> +	u8 regs_polarity;
> +	u8 regs_mask;
> +	u8 regs_mute_stat0;
>   };
>   
>   static void dw_hdmi_write(struct dw_hdmi_cec *cec, u8 val, int offset)
> @@ -306,11 +310,44 @@ static int dw_hdmi_cec_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
> +{
> +	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
> +
> +	/* Restore logical address */
> +	dw_hdmi_write(cec, cec->addresses & 255, HDMI_CEC_ADDR_L);
> +	dw_hdmi_write(cec, cec->addresses >> 8, HDMI_CEC_ADDR_H);
> +
> +	/* Restore interrupt status/mask register */
> +	dw_hdmi_write(cec, cec->regs_polarity, HDMI_CEC_POLARITY);
> +	dw_hdmi_write(cec, cec->regs_mask, HDMI_CEC_MASK);
> +	dw_hdmi_write(cec, cec->regs_mute_stat0, HDMI_IH_MUTE_CEC_STAT0);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
> +{
> +	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
> +
> +	/* store interrupt status/mask register */
> +	 cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
> +	 cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
> +	 cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops dw_hdmi_cec_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_cec_suspend, dw_hdmi_cec_resume)
> +};
> +
>   static struct platform_driver dw_hdmi_cec_driver = {
>   	.probe	= dw_hdmi_cec_probe,
>   	.remove	= dw_hdmi_cec_remove,
>   	.driver = {
>   		.name = "dw-hdmi-cec",
> +		.pm = &dw_hdmi_cec_pm,
>   	},
>   };
>   module_platform_driver(dw_hdmi_cec_driver);

As Hans said on v1, why don't you call dw_hdmi_cec_enable(cec->adap, false) in suspend and dw_hdmi_cec_enable(cec->adap, true) in resume ?

With this, CEC engine is not disabled on suspend.

Do you plan to use the engine from the suspend code ?

Neil
