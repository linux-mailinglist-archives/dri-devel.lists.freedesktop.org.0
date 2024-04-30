Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531898B7973
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 16:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CC110FD97;
	Tue, 30 Apr 2024 14:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gyQXh2mK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912FA10FD97
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714487377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=veeRvTVp70/Jt5j8UzL/S/m3vD9WbQ9mqUFPwZXVxwQ=;
 b=gyQXh2mKr1WVP5dVIDVaGMKmqrJhgtwg2njcGI61/K96lbNBPNNuROtsRpp3suJ7nDaypm
 0k/RkKUtsbWd+Zup7JDvhCgp1IveSFyqrsgqbSorVh+/33Sb9wKr3p4A75tP+USdGNyVYn
 IHjTrb4qIGqGURknS9S4HFcrPsWPXbY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-EeRGRiPAOT6hgooHaoIhoA-1; Tue, 30 Apr 2024 10:29:36 -0400
X-MC-Unique: EeRGRiPAOT6hgooHaoIhoA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-34dad0465fdso169885f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 07:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714487375; x=1715092175;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=veeRvTVp70/Jt5j8UzL/S/m3vD9WbQ9mqUFPwZXVxwQ=;
 b=sTtdq0Xx5b8QqtBpGCZWz3Lb2UjOIWKptwgN2ifkG8QlV4uITNdRqOaubK9oIVCEp/
 hCOqEX7udDjBuAPA4E0ot8K+Nl9mt8W6UJ/AKeHCWHD0n8iW4/vNBRt54CeUgdNyJipb
 ev88WpEOCqa0SAC2LAdO29QEH5twiE2b+v9uRew0m2T9Rnof72p6AEZNvFdZ3npU9klc
 VMUjHimrpn53e1XV1+CqT8AX4LhMsT3Zjhpbly34TuONipAERxofV4uiu2aqLh/hLqXc
 5LhXPBjf71hIiFem0zmupuGhuKvd/ua7b7hJnhepCIe1bEQk+AxTNV1kH08Lx2Ckedj+
 jqtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqElHOhXbUYErzNwBomfDgXAhcvHy8y+Uf8JkhYP+zmjwqvE60w/7Y5lfsICdCZXY7GkvGpm1wa/MK0qKDo4qf1ByVpRYhZm2Z0IDOkMS/
X-Gm-Message-State: AOJu0Yz5cM5oFd7sswCtPUVi+sHUV94tLvS/M2TQd8I8QbK8Acgtkt7c
 aJ0YNyehPe7onn1gpOTPdQPA/mXdbPf0RDemHr129FpRzUQJaHU17xtuMAVBQuGTSo4yUQoQR5X
 JAia3xSuIO6werh10NqDXh9hAcUREQQkkqbxs7Rg+xjyRvo7aQvETR3kipGrnqak+3A==
X-Received: by 2002:a05:6000:92d:b0:34d:c8b:3349 with SMTP id
 cx13-20020a056000092d00b0034d0c8b3349mr1872141wrb.32.1714487375085; 
 Tue, 30 Apr 2024 07:29:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyIDITdGojZhuJceVh/PJrtxX5rD5H8J604mHl1DI0F1ItCd35fpX/M0WfDWqkvBK4LLOlyA==
X-Received: by 2002:a05:6000:92d:b0:34d:c8b:3349 with SMTP id
 cx13-20020a056000092d00b0034d0c8b3349mr1872125wrb.32.1714487374711; 
 Tue, 30 Apr 2024 07:29:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm24037402wrs.108.2024.04.30.07.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 07:29:34 -0700 (PDT)
Message-ID: <5f05f009-e403-4762-b836-7302f00665e2@redhat.com>
Date: Tue, 30 Apr 2024 16:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fb_dma: Add checks in drm_fb_dma_get_scanout_buffer()
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240426121121.241366-1-jfalempe@redhat.com>
 <fdcf1ede-866d-4720-9dc1-ee729ace62a2@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <fdcf1ede-866d-4720-9dc1-ee729ace62a2@suse.de>
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



On 29/04/2024 09:24, Thomas Zimmermann wrote:
> 
> 
> Am 26.04.24 um 14:10 schrieb Jocelyn Falempe:
>> plane->state and plane->state->fb can be NULL, so add a check before
>> dereferencing them.
>> Found by testing with the imx driver.
>>
>> Fixes: 879b3b6511fe9 ("drm/fb_dma: Add generic get_scanout_buffer() 
>> for drm_panic")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_fb_dma_helper.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c 
>> b/drivers/gpu/drm/drm_fb_dma_helper.c
>> index 96e5ab960f12..d7bffde94cc5 100644
>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
>> @@ -167,6 +167,9 @@ int drm_fb_dma_get_scanout_buffer(struct drm_plane 
>> *plane,
>>       struct drm_gem_dma_object *dma_obj;
>>       struct drm_framebuffer *fb;
>> +    if (!plane->state || !plane->state->fb)
>> +        return -ENODEV;
>> +
> 
> It's EINVAL here. With that fixed, free free to add

Thanks, I just merged it to drm-misc-next with that fixed.

> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Best regards
> Thomas
> 
>>       fb = plane->state->fb;
>>       /* Only support linear modifier */
>>       if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
>>
>> base-commit: 2e3f08a1ac99cb9a19a5cb151593d4f9df5cc6a7
> 

-- 

Jocelyn

