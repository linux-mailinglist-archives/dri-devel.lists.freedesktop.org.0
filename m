Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A2E510268
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 17:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE3310E835;
	Tue, 26 Apr 2022 15:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5EC10E6A0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 15:59:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso1843301wml.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vRh1gD0f3xCVRZNs5NMMVExn4xhUo4jC6Jov5ZrW884=;
 b=zIByLgjbM9QAGOhZjZJUJReDTpiz294N6O4cijYSvWgNxgsBeKlVwDzSCZ1vjSZdQZ
 ujbZ0h6ZxRNH/KxYzigENRyLkhdBp09Kbv/V3ggeGVpYJNEB+x3hcHqNARjAh1LFTxkW
 CtC8rV53NDnCsiINaTrGiz9iMA/6OKs0tzX8wNazK2W8QcPvMBTeuakxSHOtH3Y/t5yc
 0eW+pt+P0q1biVbFkn59q1784t5TunNpDIrbj/97BpnuWT48yoUy0GFLR0Wf0Jn1AO8D
 KoUnhcaSznftaUmhUHaxk6CmIezYyBhg6U+D16lfHnaEYl5ypf19bO2xRLSQeCmNZXjT
 8ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vRh1gD0f3xCVRZNs5NMMVExn4xhUo4jC6Jov5ZrW884=;
 b=KGvu9EsOIgzKTae5zVwXmHFzvWezPEN+VGzQLJcHlPTGfM9RqM+iRFaINsi3oLTa5o
 E3sh2WF8we1BL9r95JKbTSTSxzXOzMRnqOcgJPNVfZ3/HxBmNSeHFy8YDaqdma2ZzZRL
 RNDOTcx691aNhaUbPudmpXbS3eKSPG9Wep6IBMQkiPsZIP1/9pATizWpowEge5h4mvI1
 TxGdLytaljWtUjfjXDhAXCGcaF6oebEJLq4xsHSYbIGErmJyG57yuzq2auDTyCKmqBQg
 95qV/fsvq+IE/0+OuFdf+2ldT3KJPIdGChnLlK61zj/FGhPXAeCptSetT0ZlaPxybhgl
 /H5g==
X-Gm-Message-State: AOAM532VCHK9UpQvlKr0aoVhXWotDjMnb0JLkCLN5/N8oEbyTE16iLoa
 vrjF3ja74hj2SQTUH73UgTiykw==
X-Google-Smtp-Source: ABdhPJximPuxz37age9Ai2jn4zX6zE57K74hlGLzvJKA3IabgDDJmhry0esf/sX8PG4M5vD2xUx4GA==
X-Received: by 2002:a7b:c153:0:b0:38e:c1a6:453e with SMTP id
 z19-20020a7bc153000000b0038ec1a6453emr31697865wmi.131.1650988743282; 
 Tue, 26 Apr 2022 08:59:03 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5959:ca32:2e01:b6fc?
 ([2001:861:44c0:66c0:5959:ca32:2e01:b6fc])
 by smtp.gmail.com with ESMTPSA id
 k11-20020adfc70b000000b0020ad82e3ec8sm7150423wrg.62.2022.04.26.08.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 08:59:02 -0700 (PDT)
Message-ID: <13ca5824-c101-823a-b31e-ccf9a6971c20@baylibre.com>
Date: Tue, 26 Apr 2022 17:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/bridge: ite-it6505: add missing Kconfig option select
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>
References: <20220426141536.274727-1-fparent@baylibre.com>
 <fd02a183-bcaa-86a8-8a13-52a9ddb374d5@baylibre.com>
 <20220426153931.suiuc7o53dt6s2es@radium>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220426153931.suiuc7o53dt6s2es@radium>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hermes Wu <hermes.wu@ite.com.tw>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 26/04/2022 17:39, Fabien Parent wrote:
> On Tue, Apr 26, 2022 at 05:29:31PM +0200, Neil Armstrong wrote:
>> On 26/04/2022 16:15, Fabien Parent wrote:
>>> The IT6505 is using functions provided by the DRM_DP_HELPER driver.
>>> In order to avoid having the bridge enabled but the helper disabled,
>>> let's add a select in order to be sure that the DP helper functions are
>>> always available.
>>>
>>> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
>>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>>> ---
>>>    drivers/gpu/drm/bridge/Kconfig | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>>> index 007e5a282f67..2145b08f9534 100644
>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>> @@ -78,6 +78,7 @@ config DRM_ITE_IT6505
>>>            tristate "ITE IT6505 DisplayPort bridge"
>>>            depends on OF
>>>            select DRM_KMS_HELPER
>>> +        select DRM_DP_HELPER
>>>            select EXTCON
>>>            help
>>>              ITE IT6505 DisplayPort bridge chip driver.
>>
>> http://lore.kernel.org/r/20220403151637.15546-1-rdunlap@infradead.org also select DRM_DP_AUX_BUS,
>> can you check if this is really neaded ?
> 
> Oops, I didn't notice that patch.
> 
> Anyway I can successfully link with the following config:
> CONFIG_DRM_ITE_IT6505=y
> CONFIG_DRM_DP_AUX_BUS=m
> CONFIG_DRM_DP_HELPER=y
> 
> But I cannot with the following config:
> CONFIG_DRM_ITE_IT6505=y
> CONFIG_DRM_DP_AUX_BUS=m
> CONFIG_DRM_DP_HELPER=m
> 
> This suggest that DRM_DP_AUX_BUS is not required for that driver.

Thanks for confirming:
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

> 
> Fabien
> 
>>
>> Neil

