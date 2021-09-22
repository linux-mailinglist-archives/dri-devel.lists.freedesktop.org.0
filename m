Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874EF414F26
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 19:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593926EC63;
	Wed, 22 Sep 2021 17:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D856EC5C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 17:31:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t7so9043614wrw.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 10:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=q6yz4Rj2Yb85SboOfaCfWVjp3ckXrv2v2xvRSlhbhS4=;
 b=oCKd9Kb2l0T6kb81SffKU7Phf2iYRvRnxIT9JH9nYrk325y43X37E+7vvs+57M5SEJ
 AoUtGfuLNT/8cwHrOJoNZdAPm2/Ki7Ssz0myeaw/ks593qoTVcuzK9OXXt8pMihLGxcF
 7jEHPqzBVGOgzXSqV/ON5cWqaJqch7QKj9vHzJDIYngQA38DV78aaVLGeyIA1P5Q8XAR
 ZXiKKjSdMsJvhnp9V0M+NVTlf8Hfrfddq018WwJL3w3f5d+iXqYH4pOk/TJJXQRXvzYs
 xC9237Rw2w4GSK7BHToMVnl/BImKOuDposDftkN9+BujcUM0ENqNBrINAOQ2QmzaiYiS
 K/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=q6yz4Rj2Yb85SboOfaCfWVjp3ckXrv2v2xvRSlhbhS4=;
 b=vWVjlrzHcy5GQfSciR8GNmlgXfeQipN4DO3PsWLQSuwGh0TZ403Gm6G8r+Orbx6lG4
 50iSvr2YElgy7RYTwrJbzPXTF8dFbAXdINcFSI7pNuCrTjEnMaBhrMMHt734ELi+qeBh
 bKJUM4O0OtZ5LY8YvlS6uzZ/A2PIeW0OcXa/we3vB0533J9O2WIHoKXXN/owfcfoGp2M
 kOYNsQZODPVu3Owws96GyT+sYfkr9Y66EvbKcnWAb++xjsgMmeLJ0ozvFSmuW97tLhyI
 8/cE821pePtcaoK6ahpDbUne5+NlF107y78eQLCqHQpKjWSDBB671bCUHD6Rp/JgbGyI
 Y56A==
X-Gm-Message-State: AOAM531eNXSGv/8dYYOmAHVphgSFrd6tVPDwgG2mHzBlqKYCyaqWu+46
 0D6ltod8tMvKI3Bi+xCsPg==
X-Google-Smtp-Source: ABdhPJyRmt5dYYYJNhPvrXrmHChSBEJiG4WfdKirLrl5GZkSDWEHCFqhj5pTQ5RoSrnGMXkGTlXcvQ==
X-Received: by 2002:adf:f108:: with SMTP id r8mr195060wro.180.1632331908067;
 Wed, 22 Sep 2021 10:31:48 -0700 (PDT)
Received: from [192.168.200.23] (ip5b434083.dynamic.kabel-deutschland.de.
 [91.67.64.131])
 by smtp.gmail.com with ESMTPSA id q3sm1492343wmc.25.2021.09.22.10.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:31:47 -0700 (PDT)
Subject: Re: [PATCH][next] drm/rockchip: Remove redundant assignment of
 pointer connector
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Colin King <colin.king@canonical.com>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210922112416.182134-1-colin.king@canonical.com>
 <27c79f7a-8e4c-fad8-c6cf-a89793f2e3c6@gmail.com> <22365175.EbdSka62eY@diego>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <6d18a1a6-37e3-41f9-ddd1-1dae33864d23@gmail.com>
Date: Wed, 22 Sep 2021 19:31:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <22365175.EbdSka62eY@diego>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

Am 22.09.21 um 18:45 schrieb Heiko Stübner:
> Hi Alex,
>
> Am Mittwoch, 22. September 2021, 18:35:38 CEST schrieb Alex Bee:
>> Hi Colin,
>> Am 22.09.21 um 13:24 schrieb Colin King:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The pointer connector is being assigned a value that is never
>>> read, it is being updated immediately afterwards. The assignment
>>> is redundant and can be removed.
>> The pointer to the connector is used in rockchip_rgb_fini for
>> drm_connector_cleanup.
>> It's pretty much the same for the encoder, btw.
> I think the issue is more the two lines
>
> 	connector = &rgb->connector;
>   	connector = drm_bridge_connector_init(rgb->drm_dev, encoder);
>
> hence the connector = &rgb->connector being overwritten immediately after
>
> Now that I look at it again, the whole approach looks strange.
> drm_bridge_connector_init() creates the connector structure and
> returns a pointer to it.

Totally agreed.

The main reason I was doing it that way, was the way it was done already 
in rockchip_lvds.c, where the connector was already existent in the 
struct rockchip_lvds (and was already used in the panel-case - all 
places where it is used accept pointers also, btw) and is *no* pointer - 
and is done already this very strange way.

I wanted to re-use it for the bridge-case and didn't want to differ in 
coding in rockchip-rgb to much.

The only reason I can think of, why it was done that way is, that we 
might need a pointer to a fully initialized struct drm_connector for 
some reason (drm_connector_cleanup ?), what we wouldn't have if have 
just a pointer and something goes wrong before drm_connector_init 
respectivly drm_bridge_connector_init.

Alex


> So the first line below sets the connector pointer to point to the
> &rgb->connector element and the second line then set a completely
> different address into it.
>
> So the connector element in rockchip_lvds and rockchip_rgb should actually
> become a pointer itself to hold the connector element returned from
> drm_bridge_connector_init() .
>
>
> Heiko
>
>> Regards,
>>
>> Alex
>>> Addresses-Coverity: ("Unused value")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>    drivers/gpu/drm/rockchip/rockchip_rgb.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
>>> index 09be9678f2bd..18fb84068a64 100644
>>> --- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
>>> +++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
>>> @@ -150,7 +150,6 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
>>>    	if (ret)
>>>    		goto err_free_encoder;
>>>    
>>> -	connector = &rgb->connector;
>>>    	connector = drm_bridge_connector_init(rgb->drm_dev, encoder);
>>>    	if (IS_ERR(connector)) {
>>>    		DRM_DEV_ERROR(drm_dev->dev,
>>>
>>
>
>
>
