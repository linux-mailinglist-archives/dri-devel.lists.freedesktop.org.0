Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EFC4F58D9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C23310E251;
	Wed,  6 Apr 2022 09:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3022F10E251
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:20:19 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m30so2268431wrb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 02:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=W2aIkhSbWTJlWRBmYZEWYtrp0yLkamumDlvUWGDjJiI=;
 b=JZIfw3GHWIPY0Sa9qHp8NyB6Oim7mUgr96GyW0rRJieHrrsLkU6hxeUahe3oK1e8+B
 SdRcfmSLRMGJtHdvfy5100qjasQeK4knEGgDa/HIhyJVZkW0EBr7mAdnuDa4S6kTwu6F
 4Zt1zYMhHFfBsGwHrZefb9/7qIemr9sk6Gfu/BIzlVHP2GL+aNMh+0jhOXRbDMpT9Xi3
 2uXQzkLloVh60g8safmJuPGdzuVqH0YqgDVQWys5IWngVxD9OOGBkIY943jthA4/PejL
 5UWBsOBja1Cumr69Sf3kr7WEni22hVGQCKaZL/W7Svvq5bq58aT6lSNg/dgmFgaaDJFl
 RDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=W2aIkhSbWTJlWRBmYZEWYtrp0yLkamumDlvUWGDjJiI=;
 b=wUA+qpduaq059pJi+vCRh9KIBtuP7L9Zo+vnqNCS1UvvmteuTDduxc048PbGYsacEA
 x0EDVZ5aP4aofiiJoU0BX+7Rkscxce7qDYEMrBO4MkQaLwxNE23Xm1WXo1eBx4E3l1q0
 KftS7HBaqHDONHHmRG23mw5mP6uNGRYp+wNPzJtAPnJbEA1WBpt1POiPjZEOo342tXu4
 Chx4jo+z7JGAZsTgYfLgfy38H/BJcXTXzBlv3QDq0HUIJTRcdRhcprP2nmOYYfIEzQ01
 bXDZJdB22tiuO+E9qlBzI+et3eZSr++ZVMp/Xx5LamYPJmY6tepcVoFq336HuVbcqsyf
 JhtA==
X-Gm-Message-State: AOAM533LeW+YdDSKpfy/9l2cNeDFzJf2LNnyE75rhfLRb7kcZRCQi/W0
 v/9F1FcTTtgp2RP1tN23YzTUUQ==
X-Google-Smtp-Source: ABdhPJzgMIrKDZHP11m0BbEp9aD8JUJktaSH2xen2F0e/uKtKJEwkgGvuV/pcq0Q6dfVMJZ6Km5hAg==
X-Received: by 2002:a5d:588a:0:b0:204:1f46:cf08 with SMTP id
 n10-20020a5d588a000000b002041f46cf08mr5911861wrf.133.1649236817626; 
 Wed, 06 Apr 2022 02:20:17 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d960:ec5e:e421:9c9e?
 ([2001:861:44c0:66c0:d960:ec5e:e421:9c9e])
 by smtp.gmail.com with ESMTPSA id
 q187-20020a1c43c4000000b0038e70f4f42dsm4318396wma.47.2022.04.06.02.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 02:20:17 -0700 (PDT)
Message-ID: <203a2b93-a842-8cf2-b265-864f520c16a6@baylibre.com>
Date: Wed, 6 Apr 2022 11:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 3/5] drm: bridge: dw_hdmi: Enable GCP only for Deep
 Color
Content-Language: en-US
To: Sandor.yu@nxp.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com
References: <cover.1649230434.git.Sandor.yu@nxp.com>
 <ebd9830fe35d79153cb0051bed0d255fb004fb63.1649230434.git.Sandor.yu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <ebd9830fe35d79153cb0051bed0d255fb004fb63.1649230434.git.Sandor.yu@nxp.com>
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
Cc: shengjiu.wang@nxp.com, amuel@sholland.org, cai.huoqing@linux.dev,
 maxime@cerno.tech, hverkuil-cisco@xs4all.nl
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2022 10:48, Sandor.yu@nxp.com wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> HDMI1.4b specification section 6.5.3:
> Source shall only send GCPs with non-zero CD to sinks
> that indicate support for Deep Color.
> 
> DW HDMI GPC default enabled, clear gpc_auto bit for bpp 24.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index b11577de4836..c7b11582529e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1160,6 +1160,14 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
>   		HDMI_VP_PR_CD_DESIRED_PR_FACTOR_MASK);
>   	hdmi_writeb(hdmi, val, HDMI_VP_PR_CD);
>   
> +	val = hdmi_readb(hdmi, HDMI_FC_DATAUTO3);
> +	if (color_depth == 4)
> +		/* disable Auto GCP when bpp 24 */
> +		val &= ~0x4;
> +	else
> +		val |= 0x4;
> +	hdmi_writeb(hdmi, val, HDMI_FC_DATAUTO3);
> +
>   	hdmi_modb(hdmi, HDMI_VP_STUFF_PR_STUFFING_STUFFING_MODE,
>   		  HDMI_VP_STUFF_PR_STUFFING_MASK, HDMI_VP_STUFF);
>   

Do you handle the case when color_depth == 0 when output is YUV422 ?

Neil
