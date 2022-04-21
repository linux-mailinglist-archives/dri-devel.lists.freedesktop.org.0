Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC6C50A61F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7078310E1A6;
	Thu, 21 Apr 2022 16:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E5010E1A6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 16:47:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id r19so3569142wmq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 09:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TSBE+75DEItnElqK6i/9Llmt2S09XqfUaLkR6TjRbyo=;
 b=NXb7KRvWuPLwtdKDNwdZHcukQ9NuizddPugTM4tliMQvmLXPN1STsxMbESzFB6OjBb
 T0cjMh+liiDry+aW7ahUc3C6tGFvR5E4aj79ra6iTlNzdMhzUErpmpPnEni9BnZ9vOSX
 2mmhQ6KobQJWeEulTngmjSbJQJLQiS77r2oLiASzrwMGfk2bcvDHGYWK5Ap/sV3Mw8LX
 uKbJC/tlZDHWscq3LuA9iaRm4NQPfDr+2qV8HZa96prxedIg+lCt4FM6gUq3xIx16YKL
 Bw6BruhZlC4hlVmbYthpwobkw3iewSzb5ZvhVJpQIJuQB9kPCUPBE0bbysLX87aQkOzY
 3srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TSBE+75DEItnElqK6i/9Llmt2S09XqfUaLkR6TjRbyo=;
 b=w42EfsjSX/s2E2xV72rI2X4H6RU4SqhrGVSEyTmDF72U2YHcImqhizkP+QQFTm8h1v
 /JGENe2XophWKZHxIeDd9Bo1S7HmL+vyRJ2NcB2zNg0UdMjQdfpepn/fhbkBpl2DchS+
 mWT+RVt1+V8i5ghH2RjDmhC9SwdPfl6tFSRQf+Fs+HKX/z3EdansM+ciOID8mH/t57g1
 7Qfz7eIWC5sMWlV2f9VhBX+5J9EbgWDT/P6W9qyDktE+zKAjPi23Y70gkGRaWuK2EOZU
 ovq1EBYOKvQZTnyXXZsVtOWN/Ng01HimthCJdyNtws/V83urAItsypVKSlnxqk3ucOzz
 j6HQ==
X-Gm-Message-State: AOAM532RpPjxBrJ1HjEzXtBKKCb4w+ScmZ4WTqQSCiR4ZT2MxKApcn+X
 bSu6nwnA0SdQ4qENsfjK6kKrRw==
X-Google-Smtp-Source: ABdhPJzOCephvK5l4jzG/E57jouUNpfO0ypqRAA/i0utRt/u5B9jDkk6ogV5WOtk3t8EIkLiIXsmZQ==
X-Received: by 2002:a05:600c:3ca3:b0:392:990b:af11 with SMTP id
 bg35-20020a05600c3ca300b00392990baf11mr211439wmb.173.1650559660823; 
 Thu, 21 Apr 2022 09:47:40 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:35ba:2677:956:980d?
 ([2001:861:44c0:66c0:35ba:2677:956:980d])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a0560001a8d00b0020aab7cefc4sm2649396wry.46.2022.04.21.09.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 09:47:40 -0700 (PDT)
Message-ID: <b12c1e0c-7383-547d-b4ee-a9e60b2eea12@baylibre.com>
Date: Thu, 21 Apr 2022 18:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm: bridge: dw_hdmi: Audio: fix returnvar.cocci warnings
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Sandor Yu <Sandor.yu@nxp.com>
References: <202204212311.TnfpcTGm-lkp@intel.com>
 <YmFzutFV/iDyEQF2@dd18de969aa6>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YmFzutFV/iDyEQF2@dd18de969aa6>
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
Cc: dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kbuild-all@lists.01.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2022 17:09, kernel test robot wrote:
> From: kernel test robot <lkp@intel.com>
> 
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c:80:5-8: Unneeded variable: "ret". Return "0" on line 94
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c:105:5-8: Unneeded variable: "ret". Return "0" on line 112
> 
> 
>   Remove unneeded variable used to store return value.
> 
> Generated by: scripts/coccinelle/misc/returnvar.cocci
> 
> CC: Sandor Yu <Sandor.yu@nxp.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> ---
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   65eb92e4c9f0a962656f131521f4fbc0d24c9d4c
> commit: d970ce303ff80ae57bbd3e784f2772dbf3056e0c [4441/5346] drm: bridge: dw_hdmi: Audio: Add General Parallel Audio (GPA) driver
> :::::: branch date: 8 hours ago
> :::::: commit date: 2 days ago
> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |    6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
> @@ -77,7 +77,6 @@ static int audio_hw_params(struct device
>   			   struct hdmi_codec_params *params)
>   {
>   	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
> -	int ret = 0;
>   	u8 ca;
>   
>   	dw_hdmi_set_sample_rate(dw->data.hdmi, params->sample_rate);
> @@ -91,7 +90,7 @@ static int audio_hw_params(struct device
>   				   params->iec.status[0] & IEC958_AES0_NONAUDIO);
>   	dw_hdmi_set_sample_width(dw->data.hdmi, params->sample_width);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static void audio_shutdown(struct device *dev, void *data)
> @@ -102,14 +101,13 @@ static int audio_mute_stream(struct devi
>   			     bool enable, int direction)
>   {
>   	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
> -	int ret = 0;
>   
>   	if (!enable)
>   		dw_hdmi_audio_enable(dw->data.hdmi);
>   	else
>   		dw_hdmi_audio_disable(dw->data.hdmi);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int audio_get_eld(struct device *dev, void *data,

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
