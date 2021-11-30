Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA00462EBF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFFC6ECFC;
	Tue, 30 Nov 2021 08:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4D06ECC8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:44:52 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so16550331pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=11vV4m8heqI5jfZhEvv2BuX9Zj1wK0QiGndT+iEv+iE=;
 b=MwW6mlTEg5QZ5u5Z34dxnWNm2iDFkKqWSky/0uqfLixFsI1Vua56SrObY67WkC2KDM
 3vmpYwQ3JqM+3DrjOfVBiXEe8RqB4KYikV0EaIOAYQ2OIZ1Fh4/cv7AmC8dP5lOb0iwW
 FIXtY2jkc/4Msq18mSc/dEj+CyAOVui5P9TxWq6zhKLgUxUFtRejgzIbr+SZbT1L1f6N
 hc4zV043kRcRcdDLGNUfjkzrkRtm3X+HLJD6kQ+/S3FoikVKqXYyIwf8MGQXD01TuPSb
 C7QgmuMzpBTDOikOH2gVwbB/+V2ydecCOCDVEjx7S4YIwnb2ahNNw+Y0hQaOYCKzRMDL
 yeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=11vV4m8heqI5jfZhEvv2BuX9Zj1wK0QiGndT+iEv+iE=;
 b=fd0jyvHk8Qsf45Hkznjw0sdRT4EH0ZxCb3ZpwNUgtlZ05O+EPZ4LerPEyKP5qqMW7a
 omZB+KmBxheM/HXcj5QD7R7LUmKxa3V9LuALYjhGKisTVqWVrjUR5sua/qvNejWzfnYp
 SWfGqItrCnQvX4+9s/QB2wVReKTcdYdQAcUB5KfyKOhbK7Cf9O52YahU5WY+AjhwNUZd
 LRThlmI0Y6jxDZ5Okpka/EufRJDCQbzT/VDMUjQTzIpwBYPPMzjOS9ZEbDpOQ8+h5s8S
 wbjYH11F4ZcYj4TExPmAaDYXsL3H4wb8rGx6ILrkVWwF0ePKu41rUejWlf0fwNOr7Xo/
 BM5Q==
X-Gm-Message-State: AOAM533N5n8YJECYKD6ccMbDeoOiVySHT+161mQFTsyZj1EQz5qyv2vj
 q98U1L+6TJddhfjATdCNdcRn0A==
X-Google-Smtp-Source: ABdhPJzHsyxTA9d0E4E9vOrqsXyECK4Pd1PIDIXV2yj5ezMPHxc9dkL78T9Sq0/OyS9GPjGcB56oVw==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr4375849pjb.240.1638261891822; 
 Tue, 30 Nov 2021 00:44:51 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id b32sm14165582pgl.51.2021.11.30.00.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 00:44:51 -0800 (PST)
Message-ID: <6b27be2c-9b13-38ef-ca6a-77c986757386@igel.co.jp>
Date: Tue, 30 Nov 2021 17:44:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20190509054518.10781-1-etom@igel.co.jp>
 <20190509071429.GA4773@pendragon.ideasonboard.com>
 <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp>
 <20190511181027.GC13043@pendragon.ideasonboard.com>
 <YZZHuNgGr0kZXzyl@pendragon.ideasonboard.com>
 <CAPj87rNPiLve14H85ZBbn-oozqgeS26DGUCg2oJ8LupAdYcEqA@mail.gmail.com>
 <YZZdjlzFPDCbAfQU@pendragon.ideasonboard.com>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <YZZdjlzFPDCbAfQU@pendragon.ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 2021/11/18 23:05, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
>> Hi all,
>> Thanks for this Laurent. Esaki-san, could you please CC dri-devel@ on
>> discussions like this?
>>
>> On Thu, 18 Nov 2021 at 12:32, Laurent Pinchart wrote:
>>> On Sat, May 11, 2019 at 09:10:27PM +0300, Laurent Pinchart wrote:
>>>> On Thu, May 09, 2019 at 06:25:19PM +0900, Esaki Tomohito wrote:
>>>>> Weston compositor (v5.0.0 or later) uses the DRM API to get the
>>>>> supported modifiers and determines if the sprite plane can be used by
>>>>> comparing the modifiers with the client specified modifier.
>>>>> In currently driver, since the weston doesn't know supported modifiers,
>>>>> that cannot determine if the received dmabuf can be passed through to
>>>>> sprite plane.
>>>>> Since there are R-Car GPU which support linear modifier, the sprite
>>>>> plane cannot be used in a compositor similar to the weston if client
>>>>> specify linear modifier.
>>>>
>>>> I don't think the right solution is to expose the linear modifier from
>>>> all drivers that don't otherwise support modifiers. We should instead
>>>> fix it either in Weston, and treat drivers that don't support the
>>>> modifiers API as supporting the linear modifier only, or in the DRM/KMS
>>>> core by reporting the linear modifier for drivers that don't explicitly
>>>> support modifiers.
>>>
>>> I've been pointed to
>>> https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3350#note_1161827,
>>> and we had a discussion on the #dri-devel IRC channel today on this
>>> topic. It turns out I was wrong, not specifying modifiers in userspace
>>> is different than specifying a linear modifier. This is true for some
>>> legacy drivers only (e.g. radeon) that pre-date the modifiers API, and
>>> which select a tiling format internally based on some heuristics.
>>>
>>> I still don't like this patch though, as it would need to be replicated
>>> in most drivers. It would be better if we could handle this in the DRM
>>> core. Daniel kindly offered to summarize the IRC discussion in a reply
>>> to this e-mail.
>>
>> Just quickly, I believe the check for the linear modifier in fb_create
>> is unnecessary, as this should already be checked in the core through
>> format_mod_supported().
>>
>> There is indeed a difference between LINEAR and INVALID. Linear is an
>> explicit declaration of the layout; INVALID (i.e. no modifier) means
>> 'I don't know what this is, so you should guess'. Guessing is
>> obviously not reliable, so Weston only passes buffers with no modifier
>> to KMS in two cases. The first case is when we allocate a dumb buffer
>> and the driver does not support modifiers; this is safe since it's the
>> same driver. The second case is when either the GPU driver or KMS
>> driver do not support modifiers and we allocate a buffer via GBM with
>> USE_SCANOUT; in this case, it is GBM's responsibility to select the
>> 'right' layout.
>>
>> We will never create a DRM framebuffer with no modifiers when the
>> original buffer comes from a client. If the client does not support
>> modifiers but the KMS driver does, then we do not know that the client
>> has allocated a suitable layout, so this is not safe. If the client
>> does explicitly declare a modifier but the KMS driver does not support
>> modifiers, then we also do not know that this is safe to use. So
>> unless both sides (client/GPU and KMS) support modifiers, we do not do
>> direct scanout from client buffers.
>>
>> This patch would enable this usecase by declaring support for the
>> linear modifier from KMS; when used with a PVR driver which explicitly
>> declares the linear modifier, we know it is safe to pass that client
>> buffer to KMS.
>>
>> Laurent's concern is that the DRM core should handle this rather than
>> open-coding in every driver, which I agree with. Some drivers (e.g.
>> radeon, maybe legacy NV?) do not support modifiers, and _also_ do
>> magic inference of the actual layout of the underlying buffer.
>> However, these drivers are legacy and we do not accept any new
>> addition of inferring layout without modifiers.
>>
>> I think the best way forward here is:
>>    - add a new mode_config.cannot_support_modifiers flag, and enable
>> this in radeon (plus any other drivers in the same boat)
> 
> Is there an easy way to identify the drivers that need this ?

Should I find a driver that has not use drm_plane_funcs?

>>    - change drm_universal_plane_init() to advertise the LINEAR modifier
>> when NULL is passed as the modifier list (including installing a
>> default .format_mod_supported hook)
>>    - remove the mode_config.allow_fb_modifiers hook and always
>> advertise modifier support, unless
>> mode_config.cannot_support_modifiers is set
> 
> Looks good to me.

I agree with this way, I'll try to create a patches.

>> FWIW, the effective modifier API and also valid usage is documented
>> here, which should be finished and merged shortly:
>>      https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collabora.com/
> 

-- 
Best Regards
Tomohito Esaki
