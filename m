Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C703D424EC5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 10:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DA46E822;
	Thu,  7 Oct 2021 08:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3456E822
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633594223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+VohhbTpmdIijUgPEQubOj8dqkRlBcyjgTP3iTWqiA4=;
 b=Z3updvNpRuWDD1y0/3sUHQjhm4dxeZmVCE4cxfdqSxjK0ClKWySkTTUvkh4X/mG9Jx561g
 Hip670AosxiA8Q8C9W2NW6n0LVre/8awlMiXEk0BPo2CqhpcvQ8wta2In/WUTS0KWzOtof
 RvmZ0qp5SZRPA0rvlh6B5GatI6ACKiw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-9UGMv55bPp6xWY8jm8n5lA-1; Thu, 07 Oct 2021 04:10:22 -0400
X-MC-Unique: 9UGMv55bPp6xWY8jm8n5lA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z13-20020aa7c64d000000b003db3a3c396dso4039826edr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 01:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+VohhbTpmdIijUgPEQubOj8dqkRlBcyjgTP3iTWqiA4=;
 b=FEDlYSDMiLAWkNjPgmlLbnAA7PRfmy45KVZY+6iL00VyFtAOBF6lFkY3Mt4bKxYZfP
 TXqImQIa4opnXiJVfEAzyxrFee+WS9y6m1Btzi2C1J/CpGvVB7dvYP2Bfq5/B59gwKAN
 CW6+4G6a9M80oqy/bohgMf/rzoCJrMu0zJjJgWbwr5eeX0Y71KOQQB9A9jALqDqHv3/6
 i+yRxKkW3maySGEkA9iLM43Ht8IyMZPg/2y4J9k5tdH3+gyzqMb9ZWMRhhpt/hZfzw+2
 nTy2CR63xNmTiY3bFJtuIjEqd5Snh0/W1p0S+ka+53b5IQp+5Z2gw/WsOhUbaRfJmycq
 hmgw==
X-Gm-Message-State: AOAM530yz9LDZZiT+OlIiy3PB9+U/JsBGzDwdSJAdBlKRnSeeGby/E6v
 AtuYyTRB5CMZ5ntDoN7LSYvO0uBMHy29O8P/cZydcP74e4Kuq9MMlIDfhnwbYYAkEOlirfFPJYb
 2cjnpLrApnLiTzLdSkIb4hpb6IoA8
X-Received: by 2002:a17:906:d541:: with SMTP id
 cr1mr4090068ejc.81.1633594221067; 
 Thu, 07 Oct 2021 01:10:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwjnEiTW0nlHnEEgdIhGhP9tnuUMlKQh72WJ+IbrTHweONK/myIPqG6fi+19ynPw0Y4qBsWA==
X-Received: by 2002:a17:906:d541:: with SMTP id
 cr1mr4090060ejc.81.1633594220908; 
 Thu, 07 Oct 2021 01:10:20 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id l13sm234922eds.92.2021.10.07.01.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 01:10:20 -0700 (PDT)
Subject: Re: [PATCH RFC] drm: introduce DRM_MODE_FB_PERSIST
To: Pekka Paalanen <ppaalanen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Simon Ser <contact@emersion.fr>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dennis Filder <d.filder@web.de>
References: <20211006151921.312714-1-contact@emersion.fr>
 <CAKMK7uGsFDGR7TFR1A5utrtyOL19Vc2=MEXO3XLbEOexJcuj0A@mail.gmail.com>
 <20211007104521.24b75b95@eldfell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5e84cd22-b359-c33b-a19c-7ff9b91a8aff@redhat.com>
Date: Thu, 7 Oct 2021 10:10:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007104521.24b75b95@eldfell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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

Hi,

On 10/7/21 9:45 AM, Pekka Paalanen wrote:
> On Wed, 6 Oct 2021 21:24:44 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
>> On Wed, Oct 6, 2021 at 5:19 PM Simon Ser <contact@emersion.fr> wrote:
>>> This new ADDFB2 flag allows callers to mark a framebuffer as
>>> "persistent", and no longer have RMFB semantics when the DRM
>>> file is closed.
>>>
>>> [1]: https://lore.kernel.org/dri-devel/YTJypepF1Hpc2YYT@reader/
>>>
>>> Signed-off-by: Simon Ser <contact@emersion.fr>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Cc: Dennis Filder <d.filder@web.de>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>>> ---
>>>
>>> I'm not sure this is enough, but posting this to get initial
>>> feedback and allow to start e.g. Plymouth experiments. I'll
>>> follow up with an IGT test soon.
>>>
>>>  drivers/gpu/drm/drm_framebuffer.c |  6 ++++--
>>>  include/uapi/drm/drm_mode.h       | 15 +++++++++++++++
>>>  2 files changed, 19 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
>>> index 07f5abc875e9..9b398838e1f4 100644
>>> --- a/drivers/gpu/drm/drm_framebuffer.c
>>> +++ b/drivers/gpu/drm/drm_framebuffer.c
>>> @@ -292,7 +292,8 @@ drm_internal_framebuffer_create(struct drm_device *dev,
>>>         struct drm_framebuffer *fb;
>>>         int ret;
>>>
>>> -       if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS)) {
>>> +       if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS |
>>> +                        DRM_MODE_FB_PERSIST)) {
>>>                 DRM_DEBUG_KMS("bad framebuffer flags 0x%08x\n", r->flags);
>>>                 return ERR_PTR(-EINVAL);
>>>         }
>>> @@ -789,7 +790,8 @@ void drm_fb_release(struct drm_file *priv)
>>>          * at it any more.
>>>          */
>>>         list_for_each_entry_safe(fb, tfb, &priv->fbs, filp_head) {
>>> -               if (drm_framebuffer_read_refcount(fb) > 1) {
>>> +               if (drm_framebuffer_read_refcount(fb) > 1 &&
>>> +                   !(fb->flags & DRM_MODE_FB_PERSIST)) {
>>>                         list_move_tail(&fb->filp_head, &arg.fbs);
>>>                 } else {
>>>                         list_del_init(&fb->filp_head);
>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>> index e1e351682872..c7a7089ec31e 100644
>>> --- a/include/uapi/drm/drm_mode.h
>>> +++ b/include/uapi/drm/drm_mode.h
>>> @@ -662,6 +662,21 @@ struct drm_mode_fb_cmd {
>>>
>>>  #define DRM_MODE_FB_INTERLACED (1<<0) /* for interlaced framebuffers */
>>>  #define DRM_MODE_FB_MODIFIERS  (1<<1) /* enables ->modifer[] */
>>> +/**
>>> + * DRM_MODE_FB_PERSIST
>>> + *
>>> + * DRM framebuffers are normally implicitly removed when their owner closes the
>>> + * DRM FD. Passing this flag will make the framebuffer persistent: it will not
>>> + * be implicitly removed. This is useful to implement flicker-free transitions
>>> + * between two processes.
>>> + *
>>> + * This flag doesn't change the behavior of &DRM_IOCTL_MODE_RMFB.
>>> + *
>>> + * User-space should ensure the framebuffer doesn't expose any sensitive user
>>> + * information: persistent framebuffers can be read back by the next DRM
>>> + * master.  
>>
>> Should probably explain here that the persistent fb stays around for
>> as long as it's still in use by a plane, but will disappear
>> automatically when it's no longer in active use.
> 
> Yes, I think that is an important detail.
> 
>> Also I guess there was some discussion I've missed on why we exclude
>> rmfb from this (unlike the CLOSEFB thing robclark proposed ages ago).
> 
> What does that mean? Was the CLOSEFB proposal saying that doing an RMFB
> on a persistent FB does not actually RM the FB? If so, what effect did
> it have, did it only invalidate the userspace FB ID?
> 
> That is an interesting thought. Userspace would not need to
> deliberately "leak" the FB ID, it could still RMFB it which feels more
> clean to me.
> 
> What if persistence was a flag on RMFB instead? If userspace forgets to
> call RMFB at all, then closing the device removes the FB and avoids
> information leaks. Only by doing special RMFB would allow the FB to
> remain after closing the device. That should also encourage userspace
> to track their FBs better.
> 
>> The nice thing about closefb is that you can give it persistent
>> semantics retroactively, so don't need to re-wrap an gem_bo and do a
>> page flip when you quit.
> 
> When you quit, you are going to need to draw once more anyway to get
> rid of any potentially sensitive information for sure, so the re-wrap
> does not seem much extra to me.

Right that was my though too.

> OTOH, I guess userspace code would be a
> little simpler if it does not need to re-wrap (assuming the code
> already keeps FB IDs around and does not re-ADDFB on every flip -
> weston does this caching).
> 
> I think my order of favourites is:
>  1. RMFB flag
>  2. ioctl to set an existing FB as persistent
>  3. ADDFB flag
> 
> They all seem workable to me.

I fully agree with the above.

Regards,

Hans

