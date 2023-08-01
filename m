Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B7876AE2E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A2A10E376;
	Tue,  1 Aug 2023 09:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B9110E321
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 09:36:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742bso59099815e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 02:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690882597; x=1691487397;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VEE/213uFNcoZA1UJMhRsJszifwBFLP6R8lcV4+AfcI=;
 b=IvAebBA5BsMz0qDa2RB8atqf7DZKO2t1E9gyJ29old699f8bdN4uuIFfJHvPY1Jfml
 eL4Snq/oqIMgWL9v9xbCEd+sxoZ5/aFB1FuduyLuUf1ZOsyXkZ4XjFOoClGRTrrCgD08
 uUTWlblIp5uzXk5pNEBXn9VtfGTuPpttbPRemCJhoh4Z2Mlur8VKiSEjEYxQhZWX0ZFv
 K0YFqzvsYzpT5hUgDQdYNbOM7HwpBhsJaXIE9gKpD1rQpTf+pxQaCx4FaVRxwXyRIc8q
 Y7M5+de1dX+bY7HKviQ52bzdcq8VuB94WHOS4oJoLpobP/1escoglqr5Nlj5V/T8Wtc6
 w5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690882597; x=1691487397;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VEE/213uFNcoZA1UJMhRsJszifwBFLP6R8lcV4+AfcI=;
 b=cBSEZb93lIUMS7YtxG42hAA5DeN5YU8QzFHD8QnwHji998BFjTb6BWXsuX/PMC9L5K
 sp287CnYKtpuHiwtPHelmRTOyH1Zomb0Iip4xiQ1VYrzot1nAOaBtd/bjOHbJLHHF3bT
 935q1m7Bw6s9Hg/AkvHJ6QhNP6/r0rQZB+faVkLxYqZRGfUl5o+RieqAjnuFE/z55h2h
 DA1Tb35SM8cTKF3t4E5+WWcq5uByWCcQcMzcldctlTl/pKDxKnln9RP25gNzcXH0woQb
 JRR3EqLOuEFKMbFmexn2pMBFDOJXwhhqbbTUx0qcy5QkokZecqW+H5gitknpm1mcHXmt
 uVtA==
X-Gm-Message-State: ABy/qLYq0ofx1hRBYRMIhQjdfcSIgutUPLJuKlHZbt9cuPkBloT6Zu/I
 vZPznaAIsctgvjYAMO+faDL58w==
X-Google-Smtp-Source: APBJJlG/sqL4ZeXt7Eea5GDq/NoyXEJeYC7sfIU+ah8BQNHKJgRbhFfds389nYSSA/ksyDYHZKNlsw==
X-Received: by 2002:a5d:5051:0:b0:317:7362:3fe8 with SMTP id
 h17-20020a5d5051000000b0031773623fe8mr1995149wrt.9.1690882597725; 
 Tue, 01 Aug 2023 02:36:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3?
 ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a056000050100b003141f96ed36sm15668644wrf.0.2023.08.01.02.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 02:36:37 -0700 (PDT)
Message-ID: <d27c41a1-d50f-c346-d559-ab367383fc51@linaro.org>
Date: Tue, 1 Aug 2023 11:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm: bridge: dw_hdmi: Add cec suspend/resume functions
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, andrzej.hajda@intel.com, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 u.kleine-koenig@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230721124415.1513223-1-Sandor.yu@nxp.com>
Organization: Linaro Developer Services
In-Reply-To: <20230721124415.1513223-1-Sandor.yu@nxp.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/07/2023 14:44, Sandor Yu wrote:
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
> index 9389ce526eb13..be21c11de1f2a 100644
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
> @@ -304,11 +308,44 @@ static void dw_hdmi_cec_remove(struct platform_device *pdev)
>   	cec_unregister_adapter(cec->adap);
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
> +	/* Restore interrupt status/mask registers */
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
> +	/* store interrupt status/mask registers */
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
>   	.remove_new = dw_hdmi_cec_remove,
>   	.driver = {
>   		.name = "dw-hdmi-cec",
> +		.pm = &dw_hdmi_cec_pm,
>   	},
>   };
>   module_platform_driver(dw_hdmi_cec_driver);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
