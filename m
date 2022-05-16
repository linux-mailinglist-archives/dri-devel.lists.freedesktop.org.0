Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE61527E5D
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 09:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ED910E213;
	Mon, 16 May 2022 07:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2958E10E213
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 07:14:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k30so6468702wrd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=zQsNNvUNi+z3KjnydWQZCY9VMHgpS2nBISZRem1ZpSM=;
 b=vG/J3EG4nIFFaIKEdNPZV0O+mo+pq//rR2qKLtQdzLDK92bNE3KRGzEqtPqMSQ3MGt
 5g45Mcf/8QFQx7o03NP5dXNIaDaMDoiaXT9i/4bh62p6jvEA8fNbuvSYVFKJxRflDRlZ
 M1ln9a2GoQraK/6fW8JKxzmpkTo7YIVCwYLohiczvkJRRq0T3jsAJ5HutJrdfXjKk0eB
 0he+v26QZ4F4brAdZVmHrOat4xGym01wm3/SjOtcfdsOK2U5sfEPhFvAWuqq0Uy+uQbj
 haXQ3ZRS6FnJumK4kI2YilQZrwZAd8N41PM/mTdVp2emI26gSVw4gHdR7S6gYnGvlDfp
 F+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zQsNNvUNi+z3KjnydWQZCY9VMHgpS2nBISZRem1ZpSM=;
 b=YJgoio7X3/AjOKbb0Yn36EhWxB8322n6lodiF/qwjCmJdK2XQPshJBVKixOYOJjCj9
 /d9rfvSNHb5V8PMIv3579UNWqwfHA9G83r0yxY4+01YMBA8RGcgQXNojQ0jIoTfzqAcK
 txOFRJRRv7/1CUZKTSz9Vd3fUHIHWGrHOpFWu7qvutoMogaTVfcPV9n0aGUBstVJV0Pn
 mcHx7Pk7x/p4nuM0N96F+xl0QhhZw5S7VDlpj50s5nWi19tLY0Z1g9/ybhur2VPQVK0b
 pCk7uIfPhOgW7T4YuGtEQLeah8SfsuYjLPRCnVLMgOw5tJRBjf1MdhB3pen1U7O51HcS
 mo/A==
X-Gm-Message-State: AOAM531ZL3w4l3I/qZdx1ug7i+hvuIIYO8mwP65jnLJQh89lgofom7CG
 ZJP07Lxu6SP/qobyMl8YA7DTzg==
X-Google-Smtp-Source: ABdhPJyT80VIVYKakoVYMbo5yyYAJS5OFAiVAhpJg6cjylzXy0C/ppjROORvRHaZSdFn7EcshbfFpw==
X-Received: by 2002:adf:fb04:0:b0:20c:dcbb:95bc with SMTP id
 c4-20020adffb04000000b0020cdcbb95bcmr13130849wrr.393.1652685261581; 
 Mon, 16 May 2022 00:14:21 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a9c0:1a19:4204:1dc9?
 ([2001:861:44c0:66c0:a9c0:1a19:4204:1dc9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020adf8b0c000000b0020cdf6ecafbsm10730539wra.81.2022.05.16.00.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 00:14:20 -0700 (PDT)
Message-ID: <80bd164e-5ce9-7347-dc6b-39cef2da9df3@baylibre.com>
Date: Mon, 16 May 2022 09:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/meson: fix HDMI2 420 display mode selection logic
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20220515204412.2733803-1-adrian.larumbe@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220515204412.2733803-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 15/05/2022 22:44, Adrián Larumbe wrote:
> Commit e67f6037ae1be34b2b68 ("drm/meson: split out encoder from
> meson_dw_hdmi") introduced a new way of calculating the display's pixel
> clock. However, it leads to the wrong value being reckoned for Odroid N2+
> boards, where clock frequency is never halved when the display's videomode
> supports YCBCR420 output format.

The current logic is designed to select YUV420 for:
- HDMI2 sinks when the selected mode is /only/ yu420
- non-HDMI2 sinks when the selected mode is /also/ yuv420

For the later, it's mainly for pre-HDMI2 TVs supporting 4k@24hz/30Hz but also
4k@60Hz in yuv420 mode, this is exposed using the drm_mode_is_420_also().

If I understand correctly, you want to always enable yuv420 when a mode /can/
use yu420, which is not how the code is written right now.

The current code code prioritizes YUV then RGB and 444->422>420 in case of YUV,
the when a HDMI2 sink is connected and support 4k@60Hz in RGB, YUV444 and YUV420,
the current logic will select 4k@60Hz-YUV444 because it the direct output (well
not exactly, the pipeline is 10bit) of the video pipeline with no color conversion
in the middle.

If you want to introduce different bus format priority, you should then
add HDMI content type, or non_desktop connector connector properties.

Not this should be done in meson driver and dw-hdmi.

Neil

> 
> Fix the selection logic.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..6c9640f4c82e 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -380,7 +380,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>   			 mode->clock > 340000 ? 40 : 10);
>   
>   	if (drm_mode_is_420_only(display, mode) ||
> -	    (!is_hdmi2_sink &&
> +	    (is_hdmi2_sink &&
>   	     drm_mode_is_420_also(display, mode)))
>   		mode_is_420 = true;
>   

