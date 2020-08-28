Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E810B256668
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAB16EC0C;
	Sat, 29 Aug 2020 09:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E216E4CA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 15:01:50 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c8so875999lfh.9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 08:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6ORqEBn3MQVjfqHgaJlncWKBp1Osp1LWkDwguAMB8RA=;
 b=mPq8tCUi0dIQrdG29c8UfphLhSnIkHJhnkkcnjJZQTUl1LuDWx8KtEV7yDOFPU0fqF
 v4l3EpgDsjbMJSPRoOfnHSABi3bcSMiNB/F9T/MaqQfy+xjPIgrQJ1dmVDcCckOevHC6
 92RmMRrF042iFBqI0RRphUWLHmL+aCBuX0IrbiS/W8vyU9t6sGXKCOiCthIIOw7JQrRH
 m8j0NOwTLnJAoNeMb5SwN6LkYliy95h0wMuagQARSqxorOE2zuCzmvqg4+pRvRi3P0dh
 T8rOURl5TTQgFQwFfBKgxbM8o8qmawR0iFN2LbmeKNP93nxNp3+JjB93inct7yc/5c6c
 YmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ORqEBn3MQVjfqHgaJlncWKBp1Osp1LWkDwguAMB8RA=;
 b=GrGhMwQjLOIz8ElCeQerjuhw1sWlfJH5BdUbSLz4PPRPNbqnm9eg2xww2KEQqvMg9x
 3AqgYCDcaa6138uElI42aSh/O1qISbpQ3vgFyu48voFTy2xZsuF0dQsw/BWnvxKZrCqI
 ryZMXzVQ4BlCzzXJ60jmz4Uw6GH9gG2k8b1kOt02ccjtVz/JRggi9HbLzJZekIxp1ROx
 S5+y6AhoiJNGBiNcTTIeqRXJdrn+YWymgawyXCj0lLLhHPyR92ysyf/DG4KJVFIGUHfQ
 bLjKN9HH/g2mQB/d6c6/eLpfEXd4AA8MLUWdHACOqxTkVj4jyir3UetftEEG/PVKWt/K
 I/eA==
X-Gm-Message-State: AOAM533jmjSLnPZToTYsT055cOX0xyXP1CS7bFOJxWvYrYoQjQXlkOkg
 h4dKlN7Rj6qdNd0gTnQj0am+tQ==
X-Google-Smtp-Source: ABdhPJzZj4EU+C53WrVm3puMlke4NYSKHE83tyvJQxfUAoQwWK/xY6ai+1okc7Ccixt5ZD0X8L3Q9A==
X-Received: by 2002:a19:ae0a:: with SMTP id f10mr999042lfc.100.1598626908397; 
 Fri, 28 Aug 2020 08:01:48 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.62])
 by smtp.gmail.com with ESMTPSA id s127sm246691lja.119.2020.08.28.08.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 08:01:47 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] drm: bridge: add support for lontium LT9611UXC
 bridge
To: Vinod Koul <vkoul@kernel.org>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
 <20200828141848.GX2639@vkoul-mobl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d2afbd86-eb53-e273-6de6-dfae64624b37@linaro.org>
Date: Fri, 28 Aug 2020 18:01:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828141848.GX2639@vkoul-mobl>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/08/2020 17:18, Vinod Koul wrote:
> On 28-08-20, 15:04, Dmitry Baryshkov wrote:
>> +static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
>> +				enum drm_bridge_attach_flags flags)
>> +{
>> +	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
>> +	int ret;
>> +
>> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>> +		dev_err(lt9611uxc->dev, "Fix bridge driver to make connector optional!");
> 
> Can we support both modes as I have done in lt9611, that way once the
> conversion is done we can drop the init part and support conversion.
> 
> I have patch for msm driver to set DRM_BRIDGE_ATTACH_NO_CONNECTOR, you
> can use that to test

Probably the message text is misleading. The driver as is does not work 
w/o DRM_BRIDGE_ATTACH_NO_CONNECTOR. Do you plan to push that patch into 
upstream tree?

>> +static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
>> +				 struct hdmi_codec_daifmt *fmt,
>> +				 struct hdmi_codec_params *hparms)
>> +{
>> +	/*
>> +	 * LT9611UXC will automatically detect rate and sample size, so no need
>> +	 * to setup anything here.
>> +	 */
>> +	return 0;
>> +}
> 
> Do we need dummy function?

Yes, this callback is mandatory (and audio_shutdown).


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
