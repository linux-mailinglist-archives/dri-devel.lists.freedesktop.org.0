Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265D45101E1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 17:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DBE10E750;
	Tue, 26 Apr 2022 15:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC3310E750
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 15:28:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e24so6110550wrc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VvHeXPeRp+l0umkp3zLFpUL9QE8qvJf0yCKCEof3gxA=;
 b=buq77vk5gnKXmPdRMlrIaECKUB6ReZFkK9jjEduILoQPFcZ4UqFbAXkY7sxvxnid+h
 Yo15E1M9u8FN1jC0h1MkDs4Q0tljFZaq3Mz1yFOgLwDZZoa6Y1nZDCxZOZxGOZ9emRRl
 tYKbeShhkMYMulIffkgOV2rF8qoWnjaUWGbftT8erqriq1GTfnH1SA7fdTKXpF4yLP7W
 DBgROt1/xsnPuby2ARGWEinPTWYZfZhv1M4Lqaril+1XRNnFxNi2gQYmPl9jxwnjdEs/
 B19jiHF/Rteq3osbm5IViD2jAJwIBy0iKAw5rJm55mKQrSmmOQiVc7DnBYCiMEHwXFj0
 gw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VvHeXPeRp+l0umkp3zLFpUL9QE8qvJf0yCKCEof3gxA=;
 b=vynMOom4oSPKs+7THfL5ah1qPh4wDotm0JxV5ofAivtd/xz+al2k9gAW9HfkWLt3uY
 ACp6GsVD+hy//FeM+65a1QVnO2m3rQxXDvTtpCpRrXM2/+bh1FQojaHXo0345w+gR2+S
 WrRrF1Q7efa7jHRLhGJpgxqfQiMzg3Q+e4Av4yA0EwcRmYEfA19u6758B5qoQeuOhk09
 AKv9ETwLFE61vj0cFF6JdgFkvCDSrDDe93ZWizrDr6dEUmGl108MthWZKR+xZyWmV1f+
 gYoHmZjMC/eiFpMPpFfohh7wle70bCzZ3IWXr+5ymUi2VjA+BdzB1w7dSkQQjnurZRON
 OySw==
X-Gm-Message-State: AOAM533/PhUZOB3ya+qVFn+d5huxTPB63w7L8+FXm4nImk1Pu8yC64LN
 fU86+pODkvWoFs2nKw6hz+rWo85/ESMINw==
X-Google-Smtp-Source: ABdhPJx9Uc6kKSe37g5dNJxiEA3I/nHqSTMZYaXUAKy2tRG8l+KXOhNYXNfBScM2Vq6X5f/eKAx6BA==
X-Received: by 2002:a5d:584e:0:b0:20a:9034:e312 with SMTP id
 i14-20020a5d584e000000b0020a9034e312mr19433566wrf.518.1650986881965; 
 Tue, 26 Apr 2022 08:28:01 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5959:ca32:2e01:b6fc?
 ([2001:861:44c0:66c0:5959:ca32:2e01:b6fc])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a056000051000b00207b5d9f51fsm11725738wrf.41.2022.04.26.08.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 08:28:00 -0700 (PDT)
Message-ID: <f946068e-4f97-b6e2-1671-6580aa1a0105@baylibre.com>
Date: Tue, 26 Apr 2022 17:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/bridge: fix it6505 Kconfig terms
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220403151637.15546-1-rdunlap@infradead.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220403151637.15546-1-rdunlap@infradead.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernel test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Allen Chen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Hermes Wu <hermes.wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 03/04/2022 17:16, Randy Dunlap wrote:
> Fix around 50 undefined references when DRM_ITE_IT6505=y while
> DRM_DP_AUX_BUS=m and DRM_DP_HELPER=m.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Allen Chen <allen.chen@ite.com.tw>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Hermes Wu <hermes.wu@ite.com.tw>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/bridge/Kconfig |    2 ++
>   1 file changed, 2 insertions(+)
> 
> --- linux-next-20220401.orig/drivers/gpu/drm/bridge/Kconfig
> +++ linux-next-20220401/drivers/gpu/drm/bridge/Kconfig
> @@ -78,6 +78,8 @@ config DRM_ITE_IT6505
>           tristate "ITE IT6505 DisplayPort bridge"
>           depends on OF
>           select DRM_KMS_HELPER
> +	select DRM_DP_AUX_BUS
> +	select DRM_DP_HELPER

The indentation is wrong here.

>           select EXTCON
>           help
>             ITE IT6505 DisplayPort bridge chip driver.

Neil
