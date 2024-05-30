Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA158D46D9
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2F611ACB9;
	Thu, 30 May 2024 08:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I4r8BC89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BE111ACB9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 08:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717056974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vOO2zUgoUpebiF0jkqV2Z5E5GhV9cME85XnjwVlc5U=;
 b=I4r8BC89f331RIGCNWymoanbRCbjwGFWdI+syy+iyBPhQDPdtjjg6bZPphdEMui82Ji++z
 47T9CimYBrH/VsVB5h050I9ihg7RbFZ698tidqtFGbN7wVnVINZ4up7fHTp1cUZplJqIqQ
 R+Q2gyqCZtN5V/KUeukr1vw335Vcv+I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-wNbYqHvLNHOfnP3gs0s2MQ-1; Thu, 30 May 2024 04:16:12 -0400
X-MC-Unique: wNbYqHvLNHOfnP3gs0s2MQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42109a85f5cso6308655e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 01:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717056971; x=1717661771;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4vOO2zUgoUpebiF0jkqV2Z5E5GhV9cME85XnjwVlc5U=;
 b=gTDwyc/Gmr1o81k7HSV6eqMzlsZS14pW2bGs/gnkW5nq1Kx37fgXJ5PwKB2OLR14eN
 /4rATyWrp19OVINa0zuZZfKa3j5CuoDVeRLfzKbf7wd5JEjuhTv/C2J6nrK0zrYOsaN5
 aDHABWS4rd7UiPUZ6WWGJuvOqDzu9fadM6QiKhYmXXQ3K2gLxRqwG8d4hb+Q3nUGQRGJ
 66chgr31Egb+EpEYi8/iaMiE6/zDYuTTJ+HQi2PpcM5nwObV2XMCVEEreOUNU8sxbA8L
 ip2GBOuOkvrvSW1SLy3O30Ez/TnQNTwoVTyPlK3L86bva1Sdn1kUfwskWlOrAFUPQRm/
 QysQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFCnQMnGdMjQPYL9/0/3GOfq5PWpsoiEvtE7p1j/j3wR3Q2cuiKRa6aqXcpde666tdro0Plm3q7HkRiDHwlCIdywM1c/vLnLH1Xv13TCek
X-Gm-Message-State: AOJu0YySHkoZK3Z9Fz1Lt9RwCahMwydxQ+z8X54lVNt68iV8eVUUU57W
 vLS0MoRLSj3mfLhm+lWQL6OC/60J5xaxf7yU2cDqakq/pXZphsv2yGOW9Ty7QM1KKgd4HnKs6m3
 OLrbGSm8HR/Y0Unr/Pgu36LXL8OE4dm6R5nY71j86prGbUobX7xp2CtN9/RauUI80QA==
X-Received: by 2002:a05:600c:3555:b0:41b:edf4:4071 with SMTP id
 5b1f17b1804b1-42127928149mr17474265e9.35.1717056971199; 
 Thu, 30 May 2024 01:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAr8v5wJMUdSt135qGEBduUrrTWYk6Wh2xc/V4SzrdIQg7Mb450fAmFs3OhYx7PxE9yWAuYg==
X-Received: by 2002:a05:600c:3555:b0:41b:edf4:4071 with SMTP id
 5b1f17b1804b1-42127928149mr17474045e9.35.1717056970775; 
 Thu, 30 May 2024 01:16:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b?
 ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42127056cc2sm17697845e9.2.2024.05.30.01.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 01:16:10 -0700 (PDT)
Message-ID: <e1cc6c86-d042-400c-b995-a8b78f62dbdd@redhat.com>
Date: Thu, 30 May 2024 10:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
 <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
 <20240529095506.GC19014@pendragon.ideasonboard.com>
 <ikryifdxh5hfbjl6c4yinyy52f2pr4pm4g4564jq4cob7ics2p@wa37stxn3sqm>
 <20240529133309.GO1436@pendragon.ideasonboard.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240529133309.GO1436@pendragon.ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29/05/2024 15:33, Laurent Pinchart wrote:
> On Wed, May 29, 2024 at 04:28:44PM +0300, Dmitry Baryshkov wrote:
>> On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
>>> On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
>>>>> Hi Dmitry,
>>>>>
>>>>> On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
>>>>>> On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
>>>>>>> On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
>>>>>>>> Add support for the drm_panic module, which displays a message on
>>>>>>>> the screen when a kernel panic occurs.
>>>>>>>>
>>>>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>>>> ---
>>>>>>>> Tested on Armadillo-800-EVA.
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
>>>>>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
>>>>>>>> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
>>>>>>>>   	.atomic_disable = shmob_drm_plane_atomic_disable,
>>>>>>>>   };
>>>>>>>>   
>>>>>>>> +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
>>>>>>>> +	.atomic_check = shmob_drm_plane_atomic_check,
>>>>>>>> +	.atomic_update = shmob_drm_plane_atomic_update,
>>>>>>>> +	.atomic_disable = shmob_drm_plane_atomic_disable,
>>>>>>>> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>>   static const struct drm_plane_funcs shmob_drm_plane_funcs = {
>>>>>>>>   	.update_plane = drm_atomic_helper_update_plane,
>>>>>>>>   	.disable_plane = drm_atomic_helper_disable_plane,
>>>>>>>> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>>>>>>>>   
>>>>>>>>   	splane->index = index;
>>>>>>>>   
>>>>>>>> -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
>>>>>>>> +	if (type == DRM_PLANE_TYPE_PRIMARY)
>>>>>>>> +		drm_plane_helper_add(&splane->base,
>>>>>>>> +				     &shmob_drm_primary_plane_helper_funcs);
>>>>>>>> +	else
>>>>>>>> +		drm_plane_helper_add(&splane->base,
>>>>>>>> +				     &shmob_drm_plane_helper_funcs);
>>>>>>>
>>>>>>> It's not very nice to have to provide different operations for the
>>>>>>> primary and overlay planes. The documentation of
>>>>>>> drm_fb_dma_get_scanout_buffer() states
>>>>>>>
>>>>>>>   * @plane: DRM primary plane
>>>>>>>
>>>>>>> If the intent is that only primary planes will be used to display the
>>>>>>> panic message, shouldn't drm_panic_register() skip overlay planes ? It
>>>>>>> would simplify drivers.
>>>>>>
>>>>>> What about the drivers where all the planes are actually universal?
>>>>>> In such a case the planes registered as primary can easily get replaced
>>>>>> by 'overlay' planes.
>>>>>
>>>>> Good point.
>>>>>
>>>>> Another option, if we wanted to avoid duplicating the drm_plane_funcs,
>>>>> would be to add a field to drm_plane to indicate whether the plane is
>>>>> suitable for drm_panic.
>>>>
>>>> ... or maybe let the driver decide. For the fully-universal-plane
>>>> devices we probably want to select the planes which cover the largest
>>>> part of the CRTC.
>>>
>>> Are there devices where certain planes can only cover a subset of the
>>> CRTC (apart from planes meant for cursors) ?
>>
>> On contemporary MSM devices any plane can cover any part of the screen,
>> including not having a plane that covers the full screen at all.
> 
> Ah, you meant picking the plane that is currently covering most of the
> screen. I thought you were talking about devices where some planes were
> restricted by the hardware to a subset of the CRTC.
> 
> I agree it would make sense to take both plane position and z-pos, as
> well as visibility and other related parameters, to pick the plane that
> is the most visible. Ideally this should be handled in drm_panic, not
> duplicated in drivers.

I'm not sure that drm_panic can figure out reliably on which plane it 
needs to draw. I think the driver has more information to take the right 
decision.
Also if you prefer, you can add the get_scanout_buffer() callback for 
all planes (to use the same helper fops), and then filter out in the 
callback for planes that are not suitable. I just find it cleaner to not 
register planes that the driver knows they will never be suitable (like 
cursor planes).

static void shmob_atomic_helper_get_scanout_buffer(struct drm_plane 
*plane, struct drm_scanout_buffer *sb))
{
	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
		return drm_fb_dma_get_scanout_buffer(plane, sb);
	return -EOPNOTSUPP;
}

.get_scanout_buffer = shmob_atomic_helper_get_scanout_buffer,


-- 

Jocelyn

> 
>>> I think that what would matter the most in the end is selecting the
>>> plane that is on top of the stack, and that doesn't seem to be addressed
>>> by the drm_panic infrastructure. This is getting out of scope for this
>>> patch though :-)
>>>
>>>>> I don't think this patch should be blocked just for this reason, but I'm
>>>>> a bit bothered by duplicating the ops structure to indicate drm_panic
>>>>> support.
>>>>>
>>>>>>>>   
>>>>>>>>   	return &splane->base;
>>>>>>>>   }
> 

