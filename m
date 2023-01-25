Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE4E67AA8A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 07:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF66910E72D;
	Wed, 25 Jan 2023 06:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CCB10E72D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:49:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qx13so44870935ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 22:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ozus+0qYsIbAXlCWlVO4az3ZOy6ejjY80Axt0gWDsp0=;
 b=fYfVtEjijVRpyI/7GNZGvb8H8GTnfXzIAQVUTtrNnMpDNEvEKhneAypONjhD6Nkgex
 a1OWI/gsB72UpheGUaE9ppyKJEgstlsa/peTd52NYx0OPfhmLuOy8o4WPFs3ikKuMuQe
 QlafFbJX+u1OtTxLlytIbFZkQbqlZ3jahM0gTZQojsr8iEMm1vOOTiodxBy38zs3DdPw
 Suk7vfQA7E1dPXYaiUmoCLCigZerkXyQ6Up1leBQIFFePuMc4ndW3uovfdMqUYKh0bxl
 dSH26PBNzmx8YY6nOa04AetuCHP7WJRtfLPaSEWwWxIhX+EMkYXO3UXz9rZUYPQlY2HC
 cqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ozus+0qYsIbAXlCWlVO4az3ZOy6ejjY80Axt0gWDsp0=;
 b=GAwRi7AeRd9lroElPrKr3KqKE/NbxKBYkX0m4Vr08ZuceYoNVhSn1z3UvUiMEcqxsT
 kurGOBXbHcnesC2JQzP/9euQ2AD/yuk84b+XcRU8vUrXHobiZ8kRrSRfOJL85jzsg9oF
 lodkMBog+bL3kWObKirs6UmMKZ0g2L3+7IHbWmM1RFXGOuZguRymtFCfON2KDSxy9yb+
 GjjSDnTFLw5h2nc44gdKGNkqje9uvhwcNeWrnC0HVwQ5Y7zdpn9zNVoLZcqIBlqftipW
 TNgpjoBVun66rfUUi9ii2XIEYjP7c5GqZNyCZ8kqGEUSdAbL8eLvHmoYIH1GtltfosmL
 FpUw==
X-Gm-Message-State: AFqh2kqx4Pgq1GXbX/+2noBV6PMLbbyN/9CjdnrlANg7lhprlAouVLC8
 7ZNv1FVLf9iw4FQ5wbzw+2M=
X-Google-Smtp-Source: AMrXdXude+YMwOZk4XEvmnV90Nm9cg2qi8s++4dn07gjdGjTVNi50xCZNyGJMJOBboULKx0evE1/mQ==
X-Received: by 2002:a17:906:edc9:b0:870:2f70:c63e with SMTP id
 sb9-20020a170906edc900b008702f70c63emr30982804ejb.18.1674629346588; 
 Tue, 24 Jan 2023 22:49:06 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:180c:8737:8e57:6be7?
 ([2a02:908:1256:79a0:180c:8737:8e57:6be7])
 by smtp.gmail.com with ESMTPSA id
 lx11-20020a170906af0b00b00870ebda9479sm1891578ejb.100.2023.01.24.22.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 22:49:05 -0800 (PST)
Message-ID: <13c3e3d3-8271-49d1-16d3-3e34fa419432@gmail.com>
Date: Wed, 25 Jan 2023 07:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Amdgpu module is references even after unbinding the vtcon
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <04384589-3bb3-bbb6-ba0d-7a223555c5f4@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <04384589-3bb3-bbb6-ba0d-7a223555c5f4@suse.de>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, "Slivka,
 Danijel" <Danijel.Slivka@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.01.23 um 17:15 schrieb Thomas Zimmermann:
> Hi
>
> Am 24.01.23 um 15:12 schrieb Christian König:
>> Hi Thomas,
>>
>> we ran into a problem with the general fbcon/fbdev implementation and 
>> though that you might have some idea.
>>
>> What happens is the following:
>> 1. We load amdgpu and get our normal fbcon.
>> 2. fbcon allocates a dump BO as backing store for the console.
>> 3. GDM/X/Applications start, new framebuffers are created BOs 
>> imported, exported etc...
>> 4. Somehow X or GDM iterated over all the framebuffer objects the 
>> kernels knows about and export them as DMA-buf.
>> 5. Application/X/GDM are stopped, handles closed, framebuffers 
>> released etc...
>> 6. We unbind vtcon.
>>
>> At this point the amdgpu module usually has a reference count of 0 
>> and can be unloaded, but since GDM/X/Whoever iterated over all the 
>> known framebuffers and exported them as DMA-buf (for whatever reason 
>> idk) we now still have an exported DMA-buf and with it a reference to 
>> the module.
>>
>> Any idea how we could prevent that?
>
> No real clue, sorry.
>
> But does it change if you use a shadow buffer on top of the amdgpu BO? 
> Set prefer_shadow_fbdev = 1. [1]   I once tried to run generic fbdev 
> without prefer_shadow_fbdev and it never worked. I suspected that some 
> reference counting got wrong, but could never pin it down.  Maybe your 
> issue is similar.
>
> That said, generic fbdev is not so super-optimal for TTM-based 
> drivers. I'm working on improving that, but it's not there yet.

If I'm not completely mistaken this problem is unrelated to TTM and 
could happen with any generic fbdev based driver which supports DMA-buf.

Does VKMS could be used with generic fbdev as well? If yes I think I can 
stitch together a test case demonstrating the issue.

Regards,
Christian.

>
> Best regards
> Thomas
>
>
> [1] 
> https://elixir.bootlin.com/linux/v6.0/source/include/drm/drm_mode_config.h#L890
>
>>
>> Thanks,
>> Christian.
>

