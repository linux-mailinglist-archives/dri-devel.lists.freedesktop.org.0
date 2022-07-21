Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3742457C929
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 12:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21862A360;
	Thu, 21 Jul 2022 10:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21542A360
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658399924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaxNNmAMeKmY5Be3rBByjMwZvM0Y1Hkwf+IaULdYHwI=;
 b=FJ0KpZdBMa1/n9kv0k49dbOIkEzznKkCun12XVfsmQGI+bTa8vUVkESpCGDiqIlkmjhVpr
 5flytQ4JpgUR1X5EC31EB2ugNDFqp3RXMflgS+ReMMcVzjgiCVB8cxuiE3F177Bqexzzuz
 tyB0v5jwo/JFIV2OtuNtA+mhw90oLck=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-8J1g_22UPyS4rMd50RLBdg-1; Thu, 21 Jul 2022 06:38:43 -0400
X-MC-Unique: 8J1g_22UPyS4rMd50RLBdg-1
Received: by mail-ed1-f70.google.com with SMTP id
 h17-20020a056402281100b0043aa5c0493dso857236ede.16
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 03:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SaxNNmAMeKmY5Be3rBByjMwZvM0Y1Hkwf+IaULdYHwI=;
 b=VRsLl9cbCwIDDF6l8ZCSWRnyFxhlnyVcXefoWwqEHLcGLvrp/k+1odIkyB0pteZuvo
 6uI2z1f7zB0p0dRZ7aCxPi8bIg3Y3UnYLw917gNLgV4/fmVG+SNFmNtNMC/TxvVqNDzu
 ymTlVSY1WYcECvDpeUCF5LE02KP3r+j+waweUAtzILtgouTqKYSX1WAezuRDYpDkvn/k
 EFLi81oK5dUbhjbcl246roQRGCSgbRzG3Zfq46dliIJXW6lEAgNl94qDuQR/dCySQHrU
 a5XUEQm3FMk99QGwH5HpuKAwnjSan87isqf9J+Xzu2JgVjDHfMMYlzEt+kpFyVZXjSwb
 gTkg==
X-Gm-Message-State: AJIora/GnIGOVZwCZl7vIzyNvLG+mXuudjfJZJDf4W7xEdUlg2n4y32r
 VGIR2z6oS1MWUDjsPeSPm3IHCc5zxqz5GTi23f62yD6iZ1oliv90m8JnbmOGnX0Mffom58XRSZp
 Roq+/M1I0NdtdAc2Z0B0044Dz1xTl
X-Received: by 2002:a17:907:9620:b0:72b:5822:93d0 with SMTP id
 gb32-20020a170907962000b0072b582293d0mr40705119ejc.235.1658399922143; 
 Thu, 21 Jul 2022 03:38:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFrGgrvPUPCiOk65wuDavzKJ5p4duaVmlJufhQdl7r0gqIa3EUYvRtGcGU6K/FAoYY/CVYzA==
X-Received: by 2002:a17:907:9620:b0:72b:5822:93d0 with SMTP id
 gb32-20020a170907962000b0072b582293d0mr40705088ejc.235.1658399921751; 
 Thu, 21 Jul 2022 03:38:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa7d407000000b0043b5adf54b3sm747999edq.61.2022.07.21.03.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 03:38:41 -0700 (PDT)
Message-ID: <2c3b55f9-7b18-4083-1b61-ad0ce6a13660@redhat.com>
Date: Thu, 21 Jul 2022 12:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RESEND 1/2] drm/virtio: plane: use drm managed resources
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220720140214.199492-1-dakr@redhat.com>
 <20220720140214.199492-2-dakr@redhat.com> <YtgcgovHX6jAqbt8@ravnborg.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <YtgcgovHX6jAqbt8@ravnborg.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@linux.ie, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 7/20/22 17:17, Sam Ravnborg wrote:
> Hi Danilo,
> 
> thanks for submitting this patch.
> 
> On Wed, Jul 20, 2022 at 04:02:13PM +0200, Danilo Krummrich wrote:
>> Use drm managed resource allocation (drmm_universal_plane_alloc()) in
>> order to cleanup/simplify drm plane .destroy callback.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/virtio/virtgpu_plane.c | 30 +++++++-------------------
>>   1 file changed, 8 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> index 6d3cc9e238a4..3008551d6a05 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> @@ -67,16 +67,10 @@ uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
>>   	return format;
>>   }
>>   
>> -static void virtio_gpu_plane_destroy(struct drm_plane *plane)
>> -{
>> -	drm_plane_cleanup(plane);
>> -	kfree(plane);
>> -}
>> -
>>   static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
>>   	.update_plane		= drm_atomic_helper_update_plane,
>>   	.disable_plane		= drm_atomic_helper_disable_plane,
>> -	.destroy		= virtio_gpu_plane_destroy,
>> +	.destroy		= drm_plane_cleanup,
> 
>  From the documentation of drmm_universal_plane_alloc:
> 
>      The @drm_plane_funcs.destroy hook must be NULL.
> 
> So the above assignment looks wrong.

Good catch! Indeed it registers the drm_plane_cleanup() with 
drmm_add_action_or_reset() already.

I'll send a v2.

> 
> The rest of this patch looks OK.
> 
> 	Sam

Danilo

> 
> 
>>   	.reset			= drm_atomic_helper_plane_reset,
>>   	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>>   	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
>> @@ -379,11 +373,7 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
>>   	const struct drm_plane_helper_funcs *funcs;
>>   	struct drm_plane *plane;
>>   	const uint32_t *formats;
>> -	int ret, nformats;
>> -
>> -	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
>> -	if (!plane)
>> -		return ERR_PTR(-ENOMEM);
>> +	int nformats;
>>   
>>   	if (type == DRM_PLANE_TYPE_CURSOR) {
>>   		formats = virtio_gpu_cursor_formats;
>> @@ -394,17 +384,13 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
>>   		nformats = ARRAY_SIZE(virtio_gpu_formats);
>>   		funcs = &virtio_gpu_primary_helper_funcs;
>>   	}
>> -	ret = drm_universal_plane_init(dev, plane, 1 << index,
>> -				       &virtio_gpu_plane_funcs,
>> -				       formats, nformats,
>> -				       NULL, type, NULL);
>> -	if (ret)
>> -		goto err_plane_init;
>> +
>> +	plane = drmm_universal_plane_alloc(dev, struct drm_plane, dev,
>> +					   1 << index, &virtio_gpu_plane_funcs,
>> +					   formats, nformats, NULL, type, NULL);
>> +	if (IS_ERR(plane))
>> +		return plane;
>>   
>>   	drm_plane_helper_add(plane, funcs);
>>   	return plane;
>> -
>> -err_plane_init:
>> -	kfree(plane);
>> -	return ERR_PTR(ret);
>>   }
>> -- 
>> 2.36.1
> 

