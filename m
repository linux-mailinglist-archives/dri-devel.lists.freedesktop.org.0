Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8829F69AB00
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC65010EF8A;
	Fri, 17 Feb 2023 12:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE5110EF8A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:06:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r5so630038wrz.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 04:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w+h7zVZ7vlfDQm11MKLgMfc7jN9kuJqUpjhT4UZhAaU=;
 b=OpQOPUNqld7KBqyBqA/75icbEOtub1/CEFzcZoxcKH+HqpviE9B+x+4bvNnzOLlxrq
 YNY0gcf/WprQen1P9r//H1oOWE/MYhGRCZoPWaiu5uZuQaAn+DuwtP5kD1tgn6ezjGtz
 9TZiDq7+/HEW01QvMU7GlbppFyLO0fSAGLwWhE5+oaIS3iB8oWfnZwdqUK1FiFZLEIdp
 YH7DXpPeFyRaiAZHiBohwxrSWkAgPvJBWJlItT56nxC7Nm/g/+zzkabwdLXpJCzNAOmL
 3ZJZ0ItUop2vvggq8Q/kzKWOWnxMqq+R8KN6Nsqah1osMCRrAJf0rim0+DT08Mo346OM
 F/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+h7zVZ7vlfDQm11MKLgMfc7jN9kuJqUpjhT4UZhAaU=;
 b=2sd18W8XsRJI/qeHcXBLhw1LQAlxdGw1+i84nQPqEG/tWxR7qWySd8MMo7tMuFALSt
 hg4ZyB7S1mcKLFTl6oq3Tb4/FMdqYxQlyGVfmqHwDENgpwI8fvFtC5x4N1qDhRB2GeJt
 dT1CT11D3r10XEUf8GgmAfRkTtYO6olz3JZuWNmkfFQD1Mlv/BGQ2Uqs8RDkRQZoLjJ0
 9gIitO3fs/XNsks380LOgL9lc3bgC6k6w0beZI779fh/Ln4KCVXjR58jfmJbhIOW1vw9
 PzbeyreohgHGqoZmY6frHl0C3rXYnvWURkBLDq1CyLMoCoEEJa7h2ogNgqfFmjQd7i0O
 PO1w==
X-Gm-Message-State: AO0yUKUHBIENYhW2qThUXqvojC/a5YOsa5O5kB13/YASffYXubMFk4Vh
 EbQHv77qau92Jr9QO8tE26Q=
X-Google-Smtp-Source: AK7set+g3f/8g35f4oAK2rlEcpWu3rDpj9946+73itya6bS2oqBUKCJ77tHiGuMLa/CvlakdX1ROog==
X-Received: by 2002:adf:de12:0:b0:2c5:98f2:5b16 with SMTP id
 b18-20020adfde12000000b002c598f25b16mr3036364wrm.1.1676635604063; 
 Fri, 17 Feb 2023 04:06:44 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:18f0:5eac:9f10:52b1?
 ([2a02:908:1256:79a0:18f0:5eac:9f10:52b1])
 by smtp.gmail.com with ESMTPSA id
 n15-20020adff08f000000b002c567b58e9asm4038231wro.56.2023.02.17.04.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 04:06:43 -0800 (PST)
Message-ID: <5438a01c-a8d5-a0c4-ba39-2bf80a7af8ce@gmail.com>
Date: Fri, 17 Feb 2023 13:06:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] drm/client: fix circular reference counting issue
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230126102814.8722-1-christian.koenig@amd.com>
 <0687b946-c542-6705-06c6-de3a8e9ff279@suse.de>
 <Y+4++/jQaXuGdAYF@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Y+4++/jQaXuGdAYF@phenom.ffwll.local>
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
Cc: noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.02.23 um 15:34 schrieb Daniel Vetter:
> On Thu, Jan 26, 2023 at 03:30:31PM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 26.01.23 um 11:28 schrieb Christian König:
>>> We reference dump buffers both by their handle as well as their
>>> object. The problem is now that when anybody iterates over the DRM
>>> framebuffers and exports the underlying GEM objects through DMA-buf
>>> we run into a circular reference count situation.
>>>
>>> The result is that the fbdev handling holds the GEM handle preventing
>>> the DMA-buf in the GEM object to be released. This DMA-buf in turn
>>> holds a reference to the driver module which on unload would release
>>> the fbdev.
>>>
>>> Break that loop by releasing the handle as soon as the DRM
>>> framebuffer object is created. The DRM framebuffer and the DRM client
>>> buffer structure still hold a reference to the underlying GEM object
>>> preventing its destruction.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Fixes: c76f0f7cb546 ("drm: Begin an API for in-kernel clients")
>>> Cc: <stable@vger.kernel.org>
>> I tested with Weston and Gnome in X11 and Wayland mode under simpledrm,
>> which I started stopped from the console. No obvious problems.
>>
>> I heard that sway/wlroots has issues with drivers that don't support
>> dma-buf. Maybe(!) that could be affected by this patch.
> dma-buf export should still work. Also the loop is imo a red herring, I
> think if you force unbind the driver then this should all get resolved
> automatically.
>
> What is true is that once we start refcounting everything correctly then
> there will be elevated module refcounts, which means you cannot use module
> unloading to provoke a driver unbind, which would kick out all the
> leftover references. You instead need to manually unbind the driver first,
> which should drop all remaining references to zero (might need to kill
> also any userspace), and only then can you unload the driver.
>
> But this confusion is extremely common, a lot of people think that just
> holding a module reference is enough, we really should also hold a
> drm_device reference for dma-buf ...

Yeah, hot plug removal of amdgpu revealed a couple of those as well.

Essentially what DMA-buf does with grabbing a module reference on the 
owner of a DMA-buf is a bad idea.

Instead we should reference the device or component which is exporting 
the buffer, but since we don't have a common structure here it's more 
work to generalize that approach.

Christian.

> -Daniel
>
>> Anyway, take my r-b, t-b tags.
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Thank you for fixing this bug.
>>
>> Best regards
>> Thomas
>>
>>> ---
>>>    drivers/gpu/drm/drm_client.c | 33 ++++++++++++++++++++-------------
>>>    include/drm/drm_client.h     |  5 -----
>>>    2 files changed, 20 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
>>> index 009e7b10455c..f6292ba0e6fc 100644
>>> --- a/drivers/gpu/drm/drm_client.c
>>> +++ b/drivers/gpu/drm/drm_client.c
>>> @@ -243,21 +243,17 @@ void drm_client_dev_restore(struct drm_device *dev)
>>>    static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>>>    {
>>> -	struct drm_device *dev = buffer->client->dev;
>>> -
>>>    	if (buffer->gem) {
>>>    		drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
>>>    		drm_gem_object_put(buffer->gem);
>>>    	}
>>> -	if (buffer->handle)
>>> -		drm_mode_destroy_dumb(dev, buffer->handle, buffer->client->file);
>>> -
>>>    	kfree(buffer);
>>>    }
>>>    static struct drm_client_buffer *
>>> -drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
>>> +drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
>>> +			 u32 format, u32 *handle)
>>>    {
>>>    	const struct drm_format_info *info = drm_format_info(format);
>>>    	struct drm_mode_create_dumb dumb_args = { };
>>> @@ -279,16 +275,15 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
>>>    	if (ret)
>>>    		goto err_delete;
>>> -	buffer->handle = dumb_args.handle;
>>> -	buffer->pitch = dumb_args.pitch;
>>> -
>>>    	obj = drm_gem_object_lookup(client->file, dumb_args.handle);
>>>    	if (!obj)  {
>>>    		ret = -ENOENT;
>>>    		goto err_delete;
>>>    	}
>>> +	buffer->pitch = dumb_args.pitch;
>>>    	buffer->gem = obj;
>>> +	*handle = dumb_args.handle;
>>>    	return buffer;
>>> @@ -375,7 +370,8 @@ static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
>>>    }
>>>    static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
>>> -				   u32 width, u32 height, u32 format)
>>> +				   u32 width, u32 height, u32 format,
>>> +				   u32 handle)
>>>    {
>>>    	struct drm_client_dev *client = buffer->client;
>>>    	struct drm_mode_fb_cmd fb_req = { };
>>> @@ -387,7 +383,7 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
>>>    	fb_req.depth = info->depth;
>>>    	fb_req.width = width;
>>>    	fb_req.height = height;
>>> -	fb_req.handle = buffer->handle;
>>> +	fb_req.handle = handle;
>>>    	fb_req.pitch = buffer->pitch;
>>>    	ret = drm_mode_addfb(client->dev, &fb_req, client->file);
>>> @@ -424,13 +420,24 @@ struct drm_client_buffer *
>>>    drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
>>>    {
>>>    	struct drm_client_buffer *buffer;
>>> +	u32 handle;
>>>    	int ret;
>>> -	buffer = drm_client_buffer_create(client, width, height, format);
>>> +	buffer = drm_client_buffer_create(client, width, height, format,
>>> +					  &handle);
>>>    	if (IS_ERR(buffer))
>>>    		return buffer;
>>> -	ret = drm_client_buffer_addfb(buffer, width, height, format);
>>> +	ret = drm_client_buffer_addfb(buffer, width, height, format, handle);
>>> +
>>> +	/*
>>> +	 * The handle is only needed for creating the framebuffer, destroy it
>>> +	 * again to solve a circular dependency should anybody export the GEM
>>> +	 * object as DMA-buf. The framebuffer and our buffer structure are still
>>> +	 * holding references to the GEM object to prevent its destruction.
>>> +	 */
>>> +	drm_mode_destroy_dumb(client->dev, handle, client->file);
>>> +
>>>    	if (ret) {
>>>    		drm_client_buffer_delete(buffer);
>>>    		return ERR_PTR(ret);
>>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>>> index 39482527a775..b5acdab73766 100644
>>> --- a/include/drm/drm_client.h
>>> +++ b/include/drm/drm_client.h
>>> @@ -134,11 +134,6 @@ struct drm_client_buffer {
>>>    	 */
>>>    	struct drm_client_dev *client;
>>> -	/**
>>> -	 * @handle: Buffer handle
>>> -	 */
>>> -	u32 handle;
>>> -
>>>    	/**
>>>    	 * @pitch: Buffer pitch
>>>    	 */
>> -- 
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>> (HRB 36809, AG Nürnberg)
>> Geschäftsführer: Ivo Totev
>
>
>

