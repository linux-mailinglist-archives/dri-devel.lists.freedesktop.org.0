Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC9260D69
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 10:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284CC6E197;
	Tue,  8 Sep 2020 08:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE296E197
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 08:20:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k18so1092216wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a/AA3h+yd5cV75/3ZaAsWRUd6pswz0Pgo7F9C5/t+7o=;
 b=TUls2Utzhmo8KxSTqqMznvG0bWzAE9UTJIOOYDt9DGqOMAVo8jgcScWJQYDFzvG4gs
 bFfuhTsyoNFB64l0haUzaP0eKK01RoDDPLyw+CXYHayMP4M+m/jmbX6hPRkzhgNjqvNZ
 7cXekrJ0XBIJSScAoaLJmDxZHXMKay8a7aVRgFxTs4jOhnh3HZRwM2JnR/SWnANWoII5
 bVAfHsp+lOwAWPx8zciLhdISKWbb/1ejyKEWz7bQzUXw2K2mG6gq6R+VZh5PRlvQ3Z+X
 K3NgTNGER0a1yczsApqtt4Zn7+E6BJgZCl6hoQjmqocpicN8s1E1/rV9pMY9FjldlDB/
 vx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=a/AA3h+yd5cV75/3ZaAsWRUd6pswz0Pgo7F9C5/t+7o=;
 b=pk1CtwkCuF4zOSBiwxHI42h1B5iVws+zQ6L/7cw1lGgiBpGLFE5q0a+p3N34Lm8SVF
 n1dg+8d3L2tCjgzzr4yYoD3UqmvBIwv5zphTlPl2Kfla/NsiV7FFS8JRM6pXWqhssYum
 Vpt7R28Ei9l6JyAJmWDUO0O0cDJt1xqJ7QTweMufMvntjwezl1y01JabB5goEgJ4S2an
 MdQGeh1rCavgA/TZrki0vacdDzKS3iIY8U96NkWn6B9Wyn93K6DKDvNYpmY7AbcCnG3m
 83s6sBdflbjPdvYfvS+PkFOx/zIHd97TCjJ71Rq4XvVeUzqKhCObN8vd8w3Sehaxkd9s
 gOZA==
X-Gm-Message-State: AOAM531MTfwj7N/TtqTtkdhsnVE7rADQAl2OdeL95GNCHMkG+kyZ0L6d
 vIcvOkh1PzwsBNdlQMO+iXnFUOQHPLQWgoWg
X-Google-Smtp-Source: ABdhPJyvhV5HoNDOJhiT0BEPrwMo3sh4XICc4LUD7XgB40yK2gcquWYVrZObOXLRMtuBbFQ4Mu2AfA==
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr3270280wms.165.1599553246262; 
 Tue, 08 Sep 2020 01:20:46 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm33676061wma.45.2020.09.08.01.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 01:20:45 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: fix
 dw_mipi_dsi_debugfs_show/write warnings
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200907102711.23748-1-narmstrong@baylibre.com>
 <20200907180452.GZ2352366@phenom.ffwll.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <aabe4835-96f5-8926-fdc7-59efb04f3223@baylibre.com>
Date: Tue, 8 Sep 2020 10:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200907180452.GZ2352366@phenom.ffwll.local>
Content-Language: en-US
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 angelo.ribeiro@synopsys.com, maxime@cerno.tech, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/09/2020 20:04, Daniel Vetter wrote:
> On Mon, Sep 07, 2020 at 12:27:11PM +0200, Neil Armstrong wrote:
>> This fixes the following warnings while building in W=1 :
>> dw-mipi-dsi.c:1002:5: warning: no previous prototype for 'dw_mipi_dsi_debugfs_write' [-Wmissing-prototypes]
>> dw-mipi-dsi.c:1027:5: warning: no previous prototype for 'dw_mipi_dsi_debugfs_show' [-Wmissing-prototypes]
>>
>> Fixes: e2435d69204c ("drm/bridge: dw-mipi-dsi.c: Add VPG runtime config through debugfs")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
>> Cc: Maxime Ripard <maxime@cerno.tech>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks,

Applied

> 
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> index 0b3825a4fbdb..52f5c5a2ed64 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> @@ -999,7 +999,7 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
>>  
>>  #ifdef CONFIG_DEBUG_FS
>>  
>> -int dw_mipi_dsi_debugfs_write(void *data, u64 val)
>> +static int dw_mipi_dsi_debugfs_write(void *data, u64 val)
>>  {
>>  	struct debugfs_entries *vpg = data;
>>  	struct dw_mipi_dsi *dsi;
>> @@ -1024,7 +1024,7 @@ int dw_mipi_dsi_debugfs_write(void *data, u64 val)
>>  	return 0;
>>  }
>>  
>> -int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
>> +static int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
>>  {
>>  	struct debugfs_entries *vpg = data;
>>  
>> -- 
>> 2.22.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
