Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34542EAA1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 09:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BF86ECF2;
	Fri, 15 Oct 2021 07:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912FF6ECF2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:53:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e3so24709990wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 00:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r0spq/U0Y1vUnnJkuA8fNer3gwXr4La5+YzTv1JANT4=;
 b=OPKHsjsMlECFIRSoyAxu0nUIdT9MWAa07Xu3fjBTCoVAF0BBsOrOtvPtXCMdcLuPQ+
 3B3ZcONLcdihxRhdhBmgnow0TFyuzfxG1SAh1XPErSy5wm2DqBm/UtvpE4fdVtYS9bPU
 b6DWraJF69wd7i8OrBWEMwJHgfqLVjE5LAGTJ+PrjuPnK4u58nBjDdwCselzwtHbIZd1
 ulGl9TytTaixcaZjx8GGMa2LhIE3Epa6gc0G5A+4+anxFSYH1sOF/1bbnS+rrnKR6kq0
 W6uJti3CPiuwi6fyyPjd/bQ+luOL5WAkzx54V7LueZKdeSAYuV1tghauq6rVn/7mXHa8
 ydvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=r0spq/U0Y1vUnnJkuA8fNer3gwXr4La5+YzTv1JANT4=;
 b=xBlLUGsCshWAKqJ/IDHPZ9wuIEZq6ytb33JlZwxeWUjBupnZxrpn7k6I7Qw+ys9eu1
 JTudKENyaLGioabfH1yCnIvt3T0SJzTg/jS30YUqTH3+d1ORoquDfojOADxWqI980Rgu
 4PUXiZaS9ihpwH4AAuzdBdu6DMx5yIdvQ9TIXwPjASD3p1nyzwoHgUdGsWlqyvEJc91C
 YS99MFXPnafjnvUo5BWKainYyG8Yku2LyV2KluQz+e8GtIALmLw9MfnobAON3qSpPqGz
 kGBk9vGkWn05ebTYl05aFlnAW002tmLOoP/6H2z/oq/aZmqLpApb/Y3tizEDFTnxDYUa
 JtbQ==
X-Gm-Message-State: AOAM530an1xsbVNuN/n3O4jigAoT1/IB1GHmagloc5zOlvhhhhJDZXwu
 1pv57XeXRQn8jeUpkwU5WqpIFw==
X-Google-Smtp-Source: ABdhPJwNyqlhUMZpM2GkOpFAlS8ek+MAN89gKyE9g9mbwBMMGFkXf9TpS6bjzZ8K8545wj7L+GVp0A==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr12566299wrn.215.1634284411932; 
 Fri, 15 Oct 2021 00:53:31 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb?
 ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id b10sm4144098wrf.68.2021.10.15.00.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 00:53:31 -0700 (PDT)
Subject: Re: [PATCH 2/7] drm/meson: remove useless recursive components
 matching
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-3-narmstrong@baylibre.com>
 <YWhtuscoVWCdQAkY@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <56fe9cd4-6903-b1d3-d2bd-8b559fdd4304@baylibre.com>
Date: Fri, 15 Oct 2021 09:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWhtuscoVWCdQAkY@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 14/10/2021 19:49, Sam Ravnborg wrote:
> Hi Neil,
> 
> one comment below. Other than that
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> 
> On Thu, Oct 14, 2021 at 05:26:01PM +0200, Neil Armstrong wrote:
>> The initial design was recursive to cover all port/endpoints, but only the first layer
>> of endpoints should be covered by the components list.
>> This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
>> first endpoints instead of recursing.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_drv.c | 62 +++++++++++--------------------
>>  1 file changed, 21 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index bc0d60df04ae..b53606d8825f 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -427,46 +427,6 @@ static int compare_of(struct device *dev, void *data)
>>  	return dev->of_node == data;
>>  }
>>  
>> -/* Possible connectors nodes to ignore */
>> -static const struct of_device_id connectors_match[] = {
>> -	{ .compatible = "composite-video-connector" },
>> -	{ .compatible = "svideo-connector" },
>> -	{ .compatible = "hdmi-connector" },
>> -	{ .compatible = "dvi-connector" },
>> -	{}
>> -};
>> -
>> -static int meson_probe_remote(struct platform_device *pdev,
>> -			      struct component_match **match,
>> -			      struct device_node *parent,
>> -			      struct device_node *remote)
>> -{
>> -	struct device_node *ep, *remote_node;
>> -	int count = 1;
>> -
>> -	/* If node is a connector, return and do not add to match table */
>> -	if (of_match_node(connectors_match, remote))
>> -		return 1;
>> -
>> -	component_match_add(&pdev->dev, match, compare_of, remote);
>> -
>> -	for_each_endpoint_of_node(remote, ep) {
>> -		remote_node = of_graph_get_remote_port_parent(ep);
>> -		if (!remote_node ||
>> -		    remote_node == parent || /* Ignore parent endpoint */
>> -		    !of_device_is_available(remote_node)) {
>> -			of_node_put(remote_node);
>> -			continue;
>> -		}
>> -
>> -		count += meson_probe_remote(pdev, match, remote, remote_node);
>> -
>> -		of_node_put(remote_node);
>> -	}
>> -
>> -	return count;
>> -}
>> -
>>  static void meson_drv_shutdown(struct platform_device *pdev)
>>  {
>>  	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
>> @@ -478,6 +438,13 @@ static void meson_drv_shutdown(struct platform_device *pdev)
>>  	drm_atomic_helper_shutdown(priv->drm);
>>  }
>>  
>> +/* Possible connectors nodes to ignore */
>> +static const struct of_device_id connectors_match[] = {
>> +	{ .compatible = "composite-video-connector" },
>> +	{ .compatible = "svideo-connector" },
>> +	{}
>> +};
>> +
>>  static int meson_drv_probe(struct platform_device *pdev)
>>  {
>>  	struct component_match *match = NULL;
>> @@ -492,8 +459,21 @@ static int meson_drv_probe(struct platform_device *pdev)
>>  			continue;
>>  		}
>>  
>> -		count += meson_probe_remote(pdev, &match, np, remote);
>> +		/* If an analog connector is detected, count it as an output */
>> +		if (of_match_node(connectors_match, remote)) {
>> +			++count;
>> +			of_node_put(remote);
>> +			continue;
>> +		}
>> +
>> +		DRM_DEBUG_DRIVER("parent %pOF remote match add %pOF parent %s\n",
>> +				  np, remote, dev_name(&pdev->dev));
> Avoid the deprecated logging functions.
> Use drm_dbg() or if there is no drm_device just dev_dbg().
> 
> I assume the driver uses DRM_xxx all over, so I understand if you keep
> it as-is.

Since it's in the probe function, I will move to dev_dbg().
I'll probably do a print cleanup all over the driver.

> 
>> +
>> +		component_match_add(&pdev->dev, &match, compare_of, remote);
>> +
>>  		of_node_put(remote);
>> +
>> +		++count;
>>  	}
>>  
>>  	if (count && !match)
>> -- 
>> 2.25.1

Thanks,
Neil
