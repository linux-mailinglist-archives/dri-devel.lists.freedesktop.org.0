Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4C32F8CEC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1A06E580;
	Sat, 16 Jan 2021 10:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4716E450
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:58:39 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id i6so8769984otr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 06:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k6zq/oTDBPEVQXeNZprpbOkQyyC64uIYxfSBvN3TmvM=;
 b=oOF/c9xBVldXUxxpi5Nc9ut3B7Nh2a3hdjV57iOvIg45toFBIufjv13Ie7fe6Wj1RA
 o9ljw7wuQ+Y+htcKPGPjQCLM2KcCDAzugoe1ixiWaTOBV/zO2UDAYoFQZtiKzbp4Cm5K
 z+0Gdd7wgrXztPZ3WX/wUg1TmWHop0b432ag5WCu8IHI8zWgSjysAksx1aqXBPTX2N6i
 5PxYf2r3QumTuVL/C7wUQrxRB70MHx2CwOzYjUlYuBwLNCCl0ZKPeCkK8BFTkt/oeCrh
 CJ50pKjmnbfcmNHTbAwAr+XBlETGaCQ2xVVClNoqptOrz2gPT5noNs11dnN0dy76t8ib
 dvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k6zq/oTDBPEVQXeNZprpbOkQyyC64uIYxfSBvN3TmvM=;
 b=J6PknUZ+W3TUi7E4qI3prbuXDoQdSXA650+SUF0IBbyGk628j86VyRniOMrGnxbDnV
 Bnw+za/matnk3L97A5hdj9OUQL6pS4UiTAu9JhQ9WmT5a+H49kMm+LE2Mj5MDrqygYID
 GwAoJfFfqEEoE8t1ZqkFeOqxUMdhOsc/v2tS2T8E26CApNGelvcuv2YaMydjQYyC3Byg
 sTrapU8Iu4vMKTmRZfTrZIPuuwy9/eWsphblBtwfYHrzw+aeczgVljr1Oet9cJWw5NlG
 M918koZpnS05w4Kfwl3fq+OVCUBn4iRK7+4OlZ6k7zuqL4Wfz23D+j7wevcz8NoS10DB
 nSFA==
X-Gm-Message-State: AOAM532CEZMXCMycJO8ZiyIeZ2NE+PZ81B0LtPBC8SRIeCUJvtXTpgrr
 twr4r+TonPFyeb5htfM1FcwDBw==
X-Google-Smtp-Source: ABdhPJzrz6ko7/CrZVI8YHHgYTiqBb6tK1nxWMvciQsEf/hPcvcxI/0P3D2Mc94/pd9tQ0qfn6xkTA==
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr8487364otc.145.1610722718969; 
 Fri, 15 Jan 2021 06:58:38 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x20sm1796368oov.33.2021.01.15.06.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:58:38 -0800 (PST)
Date: Fri, 15 Jan 2021 08:58:36 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/3] drm/bridge/lontium-lt9611uxc: fix waiting for
 EDID to become available
Message-ID: <YAGtnPqxe90wj+8K@builder.lan>
References: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
 <20210115110225.127075-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115110225.127075-2-dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 15 Jan 05:02 CST 2021, Dmitry Baryshkov wrote:

> - Call wake_up() when EDID ready event is received to wake
>   wait_event_interruptible_timeout()
> 
> - Increase waiting timeout, reading EDID can take longer than 100ms, so
>   let's be on a safe side.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 0c98d27f84ac..a59e811f1705 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
>  
>  	lt9611uxc_unlock(lt9611uxc);
>  
> -	if (irq_status & BIT(0))
> +	if (irq_status & BIT(0)) {
>  		lt9611uxc->edid_read = !!(hpd_status & BIT(0));
> +		wake_up_all(&lt9611uxc->wq);
> +	}
>  
>  	if (irq_status & BIT(1)) {
>  		if (lt9611uxc->connector.dev)
> @@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>  static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
>  {
>  	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
> -			msecs_to_jiffies(100));
> +			msecs_to_jiffies(500));
>  }
>  
>  static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
