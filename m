Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AD043263F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 20:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898556E0A5;
	Mon, 18 Oct 2021 18:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7728F6E0A5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 18:21:38 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id q13so5599972uaq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 11:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lZDaJ6I97l+zgpuqXCY7HKN0+kSM7lYmy2Jajm6goGM=;
 b=q1R7VbyvwV8jMq0ZqNhoj0dNLW/yngbqdggMKb+Wm6DRZ2pRqp8nd2gQXjXQH58zm0
 x1GZoNG3/qMMHdPpBNS8OV+A7lgWbcFJe5V3oZFhFt3dIUs776ZflY22RQwZs4+V2N8w
 Uv+yBcA2WBH7VF2N8t9Y9teyPhSt7DU43HXpLlQAbwFj1+70WJpb0kr3L6wb0FOF6QXn
 yVE7CvNfWkZulbP2vuo5mus4MmS+uc1SmzSLrCyW3svG2M1SaIE08BohFEFI5fEyOxOs
 ev3fzkn/oa+iaovc9PaOHNG+28fz1SPjJXyAwMlOzLXv0YBopEZfhopXWtFi+Rc+lWnl
 HjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lZDaJ6I97l+zgpuqXCY7HKN0+kSM7lYmy2Jajm6goGM=;
 b=N3Fus3irdCJf3vERI9xusVOR50+ETXvETwwv9z4O4hfJFQbrLI7A2MtHrcC+9pyv/X
 XGmFMFFBOyEoJR6TwybqV91a30XM1jRjp86jkBh3T0GMrFYuWQm9tu90FOBnpLeKz0sq
 nX0JpK+kwUBN9FmqXVh2DYHnrib9+bI9ZMtnQpjGNEFl/ow+rib19llG7uhYbYIpyDFC
 ho3G74Uj3Cy8Jrq7j9ugQkLyQwxOchN2xmq7lLxxAL3hKBkNdn5jJLEpERf4fxuVK2wS
 71ulZ2Vn7wx2dZQcVpZvVn8yDVx0awDIGdaDPRxbw0/jSkurPhoPZSiy2wCsjDxmE4dm
 g2Fw==
X-Gm-Message-State: AOAM532mFVXqDoM925/4TU2W5h23yMjS1ztUBuw3b5g3oyL4PskxP6Sg
 yPEiqpG4erinOveVdLjBLgU=
X-Google-Smtp-Source: ABdhPJxczTrnCdY8VAkqDM1eNfTk/NiwWc/PeGLRzLa4qVrkYXoC2q7O3lKzF7nHEsJkoHqeA/7W6w==
X-Received: by 2002:a67:7282:: with SMTP id n124mr28662890vsc.15.1634581297564; 
 Mon, 18 Oct 2021 11:21:37 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f4:b20b:2ce0:3c04:a56a:40cc?
 ([2804:431:c7f4:b20b:2ce0:3c04:a56a:40cc])
 by smtp.gmail.com with ESMTPSA id o40sm8655507vkf.3.2021.10.18.11.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:21:36 -0700 (PDT)
Subject: Re: [PATCH 1/6] drm: vkms: Replace the deprecated drm_mode_config_init
To: Thomas Zimmermann <tzimmermann@suse.de>, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-2-igormtorrente@gmail.com>
 <87f347bf-801f-7fba-bb52-009367cd30a0@suse.de>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Message-ID: <644a375d-18b4-e2c7-0e2a-6eb1471b4d07@gmail.com>
Date: Mon, 18 Oct 2021 15:21:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87f347bf-801f-7fba-bb52-009367cd30a0@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi Thomas,

On 10/18/21 7:02 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.10.21 um 22:16 schrieb Igor Matheus Andrade Torrente:
>> The `drm_mode_config_init` was deprecated since c3b790e commit, and it's
>> being replaced by the `drmm_mode_config_init`.
>>
>> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_drv.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c 
>> b/drivers/gpu/drm/vkms/vkms_drv.c
>> index 0ffe5f0e33f7..828868920494 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>> @@ -140,8 +140,11 @@ static const struct drm_mode_config_helper_funcs 
>> vkms_mode_config_helpers = {
>>   static int vkms_modeset_init(struct vkms_device *vkmsdev)
>>   {
>>       struct drm_device *dev = &vkmsdev->drm;
>> +    int ret = drmm_mode_config_init(dev);
>> +
>> +    if (ret < 0)
>> +        return ret;
> 
> The style looks awkward IMHO. Rather use
I don't think it's awkward. But I don't mind change it anyway.

> 
>   int ret
> 
>   ret = drmm_mode_config_init()
>   if (ret)
>      return ret;
> 
>> -    drm_mode_config_init(dev);
>>       dev->mode_config.funcs = &vkms_mode_funcs;
>>       dev->mode_config.min_width = XRES_MIN;
>>       dev->mode_config.min_height = YRES_MIN;
>>
> 
