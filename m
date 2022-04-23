Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65CE50CB93
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 17:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390B91120DD;
	Sat, 23 Apr 2022 15:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF0B1120DD
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 15:12:58 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id r8so12281517oib.5
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hJqdgmbnnE4z5yQFjSn9VmYqnxd3ZoWcVXdf4ZS/6Yo=;
 b=Ie7F+0U/6mtM1NnLpFIz+op/AQ/NUW4B6ivoZJ3A29Q7Yao4GkRSpJS4xW7BgXBRne
 sR7LzH5nD1NYgE1W7p0av/3NFut7GHIUTW5COy7/F8yYJNXOsJl1X51QLrWi1omtxZ/7
 vGmMP90XmLl5gfV9jbBomGzxosAnAPgeSpynjIPvvXpwpgq74TL4rkM9cy/JEq1RLbD0
 TMjpvUOmVVtpS1fI+9h6HEF9tlcjTR2aJpeQpNtc+VkJFDt9lqFY/bPw2Gr1f8PJpRFz
 UEFh+BSO+AujME8Q+pl6jSdFwO+2QMWNTwJug03/vP9eUPPtcvR44hzzQeWDNiP9Kfwt
 sOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hJqdgmbnnE4z5yQFjSn9VmYqnxd3ZoWcVXdf4ZS/6Yo=;
 b=Q7ao7Lcuejnfp2MgVdY9ylQB0H1h2mg1UuHCUG27iWgtO036PODVGj5DfPX9J7+4Le
 6+h1q5u85f+lp7I7ghynQmBDhQcUOVsb0GmZrW2b4oDKGTrFYe+f1c9BNQSnlkbYvDue
 JMGsZCbjaD2SWtEZ0HIGMrEWZ/TEMbDzLZQP1BFdUXsxdqQyO+8ukPy5a2E/pr9PD0g0
 npfGLonG0tA9AIx+wFth48JiBLDWlfKVya88GPiDZJiuN/wgQYnzcz997tIAt2Jj/V28
 JauJDMn64ZKp0rHAwyojG/lDYWSVFc/we1NHpS0R8emWSQ3qBLeLI0f26ahmUdQhNOiU
 Xpgw==
X-Gm-Message-State: AOAM533aC3AT9LemvB6pk63jfP7fG2GM/N2FhanYznLPUB72zzFir0ou
 JSo+mvYVMcmmZn0cmKxVIIg=
X-Google-Smtp-Source: ABdhPJz/OnahVWFf6ViSIowNxHuL7vSSmhmPA879F+9/QHpNrLR0Dd1EMDcieBUuWgg2qokYEMfbkQ==
X-Received: by 2002:a05:6808:15a0:b0:322:f35d:b9e with SMTP id
 t32-20020a05680815a000b00322f35d0b9emr4475104oiw.135.1650726777160; 
 Sat, 23 Apr 2022 08:12:57 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:7532:da7c:53df:9a5f:fa64?
 ([2804:431:c7f5:7532:da7c:53df:9a5f:fa64])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a056870329500b000e91901c156sm548123oac.29.2022.04.23.08.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:12:56 -0700 (PDT)
Message-ID: <12fa5189-efab-11c9-3d08-6c5367748b1c@gmail.com>
Date: Sat, 23 Apr 2022 12:12:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 5/9] drm: vkms: Add fb information to
 `vkms_writeback_job`
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-6-igormtorrente@gmail.com>
 <20220420142305.3945f409@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220420142305.3945f409@eldfell>
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On 4/20/22 08:23, Pekka Paalanen wrote:
> On Mon,  4 Apr 2022 17:45:11 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> This commit is the groundwork to introduce new formats to the planes and
>> writeback buffer. As part of it, a new buffer metadata field is added to
>> `vkms_writeback_job`, this metadata is represented by the `vkms_composer`
>> struct.
> 
> Hi,
> 
> should this be talking about vkms_frame_info struct instead?

Yes it should. I will fix this. Thanks.

> 
>>
>> Also adds two new function pointers (`{wb,plane}_format_transform_func`)
>> are defined to handle format conversion to/from internal format.
>>
>> These things will allow us, in the future, to have different compositing
>> and wb format types.
>>
>> V2: Change the code to get the drm_framebuffer reference and not copy its
>>      contents(Thomas Zimmermann).
>> V3: Drop the refcount in the wb code(Thomas Zimmermann).
>> V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
>>      and vkms_plane_state (Pekka Paalanen)
>>
>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
>>   drivers/gpu/drm/vkms/vkms_drv.h       | 31 +++++++++++++++++++++------
>>   drivers/gpu/drm/vkms/vkms_plane.c     | 10 ++++-----
>>   drivers/gpu/drm/vkms/vkms_writeback.c | 20 ++++++++++++++---
>>   4 files changed, 49 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 2d946368a561..95029d2ebcac 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -153,7 +153,7 @@ static void compose_plane(struct vkms_frame_info *primary_plane_info,
>>   			  struct vkms_frame_info *plane_frame_info,
>>   			  void *vaddr_out)
>>   {
>> -	struct drm_framebuffer *fb = &plane_frame_info->fb;
>> +	struct drm_framebuffer *fb = plane_frame_info->fb;
>>   	void *vaddr;
>>   	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
>>   
>> @@ -175,7 +175,7 @@ static int compose_active_planes(void **vaddr_out,
>>   				 struct vkms_frame_info *primary_plane_info,
>>   				 struct vkms_crtc_state *crtc_state)
>>   {
>> -	struct drm_framebuffer *fb = &primary_plane_info->fb;
>> +	struct drm_framebuffer *fb = primary_plane_info->fb;
>>   	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
>>   	const void *vaddr;
>>   	int i;
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index 2e6342164bef..2704cfb6904b 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -22,13 +22,8 @@
>>   
>>   #define NUM_OVERLAY_PLANES 8
>>   
>> -struct vkms_writeback_job {
>> -	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>> -	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>> -};
>> -
>>   struct vkms_frame_info {
>> -	struct drm_framebuffer fb;
>> +	struct drm_framebuffer *fb;
>>   	struct drm_rect src, dst;
>>   	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>>   	unsigned int offset;
>> @@ -36,6 +31,29 @@ struct vkms_frame_info {
>>   	unsigned int cpp;
>>   };
>>   
>> +struct pixel_argb_u16 {
>> +	u16 a, r, g, b;
>> +};
>> +
>> +struct line_buffer {
>> +	size_t n_pixels;
>> +	struct pixel_argb_u16 *pixels;
>> +};
>> +
>> +typedef void
>> +(*wb_format_transform_func)(struct vkms_frame_info *frame_info,
>> +			    const struct line_buffer *buffer, int y);
>> +
>> +typedef void
>> +(*plane_format_transform_func)(struct line_buffer *buffer,
>> +			       const struct vkms_frame_info *frame_info, int y);
> 
> It wasn't immediately obvious to me in which direction these function
> types work from their names. The arguments are not wb and plane but
> vkms_frame_info and line_buffer in both. The implementations of these
> functions would have nothing specific to a wb or a plane either, would
> they?

No, there's nothing specific.

Do you think adding {dst_,src_} would be enough?

(*wb_format_transform_func)(struct vkms_frame_info *dst_frame_info,
			    const struct line_buffer *src_buffer

(*plane_format_transform_func)(struct line_buffer *dst_buffer,
			   const struct vkms_frame_info *src_frame_info,

> 
> What about naming them frame_to_line_func and line_to_frame_func?

Sounds good. I will rename it.

> 
>> +
>> +struct vkms_writeback_job {
>> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>> +	struct vkms_frame_info frame_info;
> 
> Which frame_info is this? Should the field be called wb_frame_info?

Considering it's already in the writeback_job struct do you think this
necessary?

In other words, what kind of misudertanding do you think can happen if
this variable stay without the `wb_` prefix?

I spent a few minutes trying to find a case, but nothing came to my
mind.

> 
>> +	wb_format_transform_func format_func;
> 
> line_to_frame_func wb_write;
> 
> perhaps? The type explains the general type of the function, and the
> field name refers to what it is used for.
> 
>> +};
>> +
>>   /**
>>    * vkms_plane_state - Driver specific plane state
>>    * @base: base plane state
>> @@ -44,6 +62,7 @@ struct vkms_frame_info {
>>   struct vkms_plane_state {
>>   	struct drm_shadow_plane_state base;
>>   	struct vkms_frame_info *frame_info;
>> +	plane_format_transform_func format_func;
> 
> Similarly here, maybe
> 
> frame_to_line_func plane_read;
> 
> perhaps?

Yeah, sure.

> 
>>   };
>>   
>>   struct vkms_plane {
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index a56b0f76eddd..28752af0118c 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -50,12 +50,12 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
>>   	struct vkms_plane_state *vkms_state = to_vkms_plane_state(old_state);
>>   	struct drm_crtc *crtc = vkms_state->base.base.crtc;
>>   
>> -	if (crtc) {
>> +	if (crtc && vkms_state->frame_info->fb) {
>>   		/* dropping the reference we acquired in
>>   		 * vkms_primary_plane_update()
>>   		 */
>> -		if (drm_framebuffer_read_refcount(&vkms_state->frame_info->fb))
>> -			drm_framebuffer_put(&vkms_state->frame_info->fb);
>> +		if (drm_framebuffer_read_refcount(vkms_state->frame_info->fb))
>> +			drm_framebuffer_put(vkms_state->frame_info->fb);
>>   	}
>>   
>>   	kfree(vkms_state->frame_info);
>> @@ -110,9 +110,9 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>>   	frame_info = vkms_plane_state->frame_info;
>>   	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
>>   	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
>> -	memcpy(&frame_info->fb, fb, sizeof(struct drm_framebuffer));
>> +	frame_info->fb = fb;
> 
> This change, replacing the memcpy with storing a pointer, seems to be
> another major point of this patch. Should it be a separate patch?
> It doesn't seem to fit with the current commit message.
> 
> I have no idea what kind of locking or referencing a drm_framebuffer
> would need, and I suspect that would be easier to review if it was a
> patch of its own.

Makes sense. I will do that.

> 
>>   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>> -	drm_framebuffer_get(&frame_info->fb);
>> +	drm_framebuffer_get(frame_info->fb);
> 
> Does drm_framebuffer_get() not return anything?

No, it doesn't actually. This function increments the ref count of this
struct and doesn't return anything.

> 
> To me it would be more idiomatic to write something like
> 
> 	frame_info->fb = drm_framebuffer_get(fb);
> I spend few minutes trying to find a case but nothing comes to my mind.
> I don't know if that pattern is used in the kernel, but I use it in
> userspace to emphasise that frame_info owns a new reference rather than
> borrowing someone else's.
> 
> 
> Thanks,
> pq
> 
>>   	frame_info->offset = fb->offsets[0];
>>   	frame_info->pitch = fb->pitches[0];
>>   	frame_info->cpp = fb->format->cpp[0];
>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
>> index 746cb0abc6ec..ad4bb1fb37ca 100644
>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>> @@ -74,12 +74,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
>>   	if (!vkmsjob)
>>   		return -ENOMEM;
>>   
>> -	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map, vkmsjob->data);
>> +	ret = drm_gem_fb_vmap(job->fb, vkmsjob->frame_info.map, vkmsjob->data);
>>   	if (ret) {
>>   		DRM_ERROR("vmap failed: %d\n", ret);
>>   		goto err_kfree;
>>   	}
>>   
>> +	vkmsjob->frame_info.fb = job->fb;
>> +	drm_framebuffer_get(vkmsjob->frame_info.fb);
>> +
>>   	job->priv = vkmsjob;
>>   
>>   	return 0;
>> @@ -98,7 +101,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>>   	if (!job->fb)
>>   		return;
>>   
>> -	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
>> +	drm_gem_fb_vunmap(job->fb, vkmsjob->frame_info.map);
>> +
>> +	drm_framebuffer_put(vkmsjob->frame_info.fb);
>>   
>>   	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
>>   	vkms_set_composer(&vkmsdev->output, false);
>> @@ -115,14 +120,23 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>>   	struct drm_writeback_connector *wb_conn = &output->wb_connector;
>>   	struct drm_connector_state *conn_state = wb_conn->base.state;
>>   	struct vkms_crtc_state *crtc_state = output->composer_state;
>> +	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
>> +	struct vkms_writeback_job *active_wb;
>> +	struct vkms_frame_info *wb_frame_info;
>>   
>>   	if (!conn_state)
>>   		return;
>>   
>>   	vkms_set_composer(&vkmsdev->output, true);
>>   
>> +	active_wb = conn_state->writeback_job->priv;
>> +	wb_frame_info = &active_wb->frame_info;
>> +
>>   	spin_lock_irq(&output->composer_lock);
>> -	crtc_state->active_writeback = conn_state->writeback_job->priv;
>> +	crtc_state->active_writeback = active_wb;
>> +	wb_frame_info->offset = fb->offsets[0];
>> +	wb_frame_info->pitch = fb->pitches[0];
>> +	wb_frame_info->cpp = fb->format->cpp[0];
>>   	crtc_state->wb_pending = true;
>>   	spin_unlock_irq(&output->composer_lock);
>>   	drm_writeback_queue_job(wb_conn, connector_state);
> 
