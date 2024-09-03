Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66D969EF6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 15:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B071110E5A4;
	Tue,  3 Sep 2024 13:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OoICB7M7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C07710E5A4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725369841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwcVi0dsf+2NifIj/3/2dNpYqva1wyq1DCiHGFfnhJU=;
 b=OoICB7M7e8yGlCj7w33MXprnHYCw/Hs0T8QugflG2O4akgK277f8dfR+JBO4/YjeZoy5Kq
 aUhysZGvTHRh17bv+6Ssk/SOaDGXaBJyglhjgyrU39gXr2wiYSlJvwgWNxh1ylPKmEsKe2
 o6QYLpQUVG+E7nUBSzxEgU+N1J85dWQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-PMRzaQYcNL-N3OXAZnTH2Q-1; Tue, 03 Sep 2024 09:24:00 -0400
X-MC-Unique: PMRzaQYcNL-N3OXAZnTH2Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42ac185e26cso49138585e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 06:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725369840; x=1725974640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XwcVi0dsf+2NifIj/3/2dNpYqva1wyq1DCiHGFfnhJU=;
 b=LTVbjZaC2BgmDiaEVWvj5sun155E0t9I4wrSXI606/GkkcWWvn6abHONpurWc6ITZV
 fcrI52gO8yl+l6U5aLMyT94wFET574/MNcpO5c0ctqVTIHCDUVcxR1tcsYAepXH0TFMq
 XGnY1W3ivN6MEw/Z1T/Ls66aq+up0S/QJkX4Fh2AtMK7o8AAZ6niVme0CDRWf+jkUBSP
 b2fSI5Y5sJReDsQPVErwY0FVRoDih5c+4pTaefahF5jtJWfj237nXgiw+73pc1h/AHVA
 fMMJRWSL8fE6qpA9ZuicT11oYIAqnxizWWzifqUVTf9/3mnooM9OLXtc2LVLwIS24+w3
 dKhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCABNTL3wMKg3EMrBZ5HWanl9Crc49ZWXR3GvbvgLNGt/Q2MJROYKJAd6PJDPND1t+s2AmiwtMzes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/dIzmXXo/OuhtKMUOekCZUx4lcYyBbPf3Nu6JCqdCcVM/2WeQ
 jTWDpXaf8eKin15Vt+nJ3ayKqpha2gV+pzYZZHIH/tkbcSHeSwEaDLZatKh2AVLXimDqc0+mqLj
 Gi8QjyJAbapOZtkFsMYsYdEM9axUZ0saG5AvqDei0mfHOCO8ga/wj9C2/rNJnI4N22A==
X-Received: by 2002:a05:600c:1d1d:b0:426:5269:1a50 with SMTP id
 5b1f17b1804b1-42bbb205a6bmr97108185e9.11.1725369839369; 
 Tue, 03 Sep 2024 06:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI3sCpKkpdI1X5z3naPCx6kQ6qbg21MF4Ajhry2O5a9Uet75grl/Vs9BZR3kM4tuFUpGq3xg==
X-Received: by 2002:a05:600c:1d1d:b0:426:5269:1a50 with SMTP id
 5b1f17b1804b1-42bbb205a6bmr97107895e9.11.1725369838804; 
 Tue, 03 Sep 2024 06:23:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bba3f2875sm151798035e9.41.2024.09.03.06.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 06:23:58 -0700 (PDT)
Message-ID: <180cfd85-8f1d-438a-928f-f13bea28323b@redhat.com>
Date: Tue, 3 Sep 2024 15:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 <e1cc6c86-d042-400c-b995-a8b78f62dbdd@redhat.com>
 <CAA8EJpoC9SiLr4QyksKLq796vdq7pFywwn9pPyrkj6-uo5zVog@mail.gmail.com>
 <CAMuHMdV1SQT4Lnah3-H6r19_xUuKO7iLcTw1PApg7v6naEF5Sg@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdV1SQT4Lnah3-H6r19_xUuKO7iLcTw1PApg7v6naEF5Sg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2024 15:53, Geert Uytterhoeven wrote:
> On Thu, May 30, 2024 at 10:33 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>> On Thu, 30 May 2024 at 11:16, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>> On 29/05/2024 15:33, Laurent Pinchart wrote:
>>>> On Wed, May 29, 2024 at 04:28:44PM +0300, Dmitry Baryshkov wrote:
>>>>> On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
>>>>>> On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
>>>>>>> On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
>>>>>>>> On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
>>>>>>>>> On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
>>>>>>>>>> On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
>>>>>>>>>>> Add support for the drm_panic module, which displays a message on
>>>>>>>>>>> the screen when a kernel panic occurs.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>>>>>>> ---
>>>>>>>>>>> Tested on Armadillo-800-EVA.
>>>>>>>>>>> ---
>>>>>>>>>>>    drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
>>>>>>>>>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>>>>> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>>>>> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
>>>>>>>>>>>         .atomic_disable = shmob_drm_plane_atomic_disable,
>>>>>>>>>>>    };
>>>>>>>>>>>
>>>>>>>>>>> +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
>>>>>>>>>>> +      .atomic_check = shmob_drm_plane_atomic_check,
>>>>>>>>>>> +      .atomic_update = shmob_drm_plane_atomic_update,
>>>>>>>>>>> +      .atomic_disable = shmob_drm_plane_atomic_disable,
>>>>>>>>>>> +      .get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
>>>>>>>>>>> +};
>>>>>>>>>>> +
>>>>>>>>>>>    static const struct drm_plane_funcs shmob_drm_plane_funcs = {
>>>>>>>>>>>         .update_plane = drm_atomic_helper_update_plane,
>>>>>>>>>>>         .disable_plane = drm_atomic_helper_disable_plane,
>>>>>>>>>>> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>>>>>>>>>>>
>>>>>>>>>>>         splane->index = index;
>>>>>>>>>>>
>>>>>>>>>>> -      drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
>>>>>>>>>>> +      if (type == DRM_PLANE_TYPE_PRIMARY)
>>>>>>>>>>> +              drm_plane_helper_add(&splane->base,
>>>>>>>>>>> +                                   &shmob_drm_primary_plane_helper_funcs);
>>>>>>>>>>> +      else
>>>>>>>>>>> +              drm_plane_helper_add(&splane->base,
>>>>>>>>>>> +                                   &shmob_drm_plane_helper_funcs);
>>>>>>>>>>
>>>>>>>>>> It's not very nice to have to provide different operations for the
>>>>>>>>>> primary and overlay planes. The documentation of
>>>>>>>>>> drm_fb_dma_get_scanout_buffer() states
>>>>>>>>>>
>>>>>>>>>>    * @plane: DRM primary plane
>>>>>>>>>>
>>>>>>>>>> If the intent is that only primary planes will be used to display the
>>>>>>>>>> panic message, shouldn't drm_panic_register() skip overlay planes ? It
>>>>>>>>>> would simplify drivers.
>>>>>>>>>
>>>>>>>>> What about the drivers where all the planes are actually universal?
>>>>>>>>> In such a case the planes registered as primary can easily get replaced
>>>>>>>>> by 'overlay' planes.
>>>>>>>>
>>>>>>>> Good point.
>>>>>>>>
>>>>>>>> Another option, if we wanted to avoid duplicating the drm_plane_funcs,
>>>>>>>> would be to add a field to drm_plane to indicate whether the plane is
>>>>>>>> suitable for drm_panic.
>>>>>>>
>>>>>>> ... or maybe let the driver decide. For the fully-universal-plane
>>>>>>> devices we probably want to select the planes which cover the largest
>>>>>>> part of the CRTC.
>>>>>>
>>>>>> Are there devices where certain planes can only cover a subset of the
>>>>>> CRTC (apart from planes meant for cursors) ?
>>>>>
>>>>> On contemporary MSM devices any plane can cover any part of the screen,
>>>>> including not having a plane that covers the full screen at all.
>>>>
>>>> Ah, you meant picking the plane that is currently covering most of the
>>>> screen. I thought you were talking about devices where some planes were
>>>> restricted by the hardware to a subset of the CRTC.
>>>>
>>>> I agree it would make sense to take both plane position and z-pos, as
>>>> well as visibility and other related parameters, to pick the plane that
>>>> is the most visible. Ideally this should be handled in drm_panic, not
>>>> duplicated in drivers.
>>>
>>> I'm not sure that drm_panic can figure out reliably on which plane it
>>> needs to draw. I think the driver has more information to take the right
>>> decision.
>>
>> I think there should be a default implementation which fits 80% of the
>> cases (single fixed PRIMARY plane per output) but if the driver needs
>> it, it should be able to override the behaviour.
> 
> Did anything like this materialize, or is this patch (and its rcar-du
> counterpart [1]) good to apply as-is?

No I didn't find a better option yet, and I think it is good as-is.

If duplicating the helper funcs is really a problem, I think the less 
intrusive option, would be to add a "bool panic_allow_overlay_plane" to 
struct drm_mode_config, and use that in drm_panic_register(), to 
register only primary planes if it's not set ?

So drivers that want to draw the panic on overlay plane can opt-in.

Best regards,

-- 

Jocelyn


> 
> Thank you!
> 
> [1] https://lore.kernel.org/r/b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be/
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 

