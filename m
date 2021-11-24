Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00945B236
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 03:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24336E10F;
	Wed, 24 Nov 2021 02:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C90E6E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 02:49:19 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so3763412pjc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 18:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zAcr7UbqNsyeT5xq1K15hM3N4SxMPODnBdVS9Tm//dI=;
 b=CuHDagAAm/4jc5iuqSNjMgO0s11CWL8KUyqUsTp19dh2EQ9KhCF68qOmK4mITx8d/f
 ptOEPHcqFzCdPqmOxK49w0XkPMYc135vIJ1WbSoQn/iSj3wX/sA/qWvJIrRKaDr+XQel
 a8Z0iabpqaEtSP8ihym7KzVnDapDrIRyNMI0XOInTeeCfmgp54nLGyABYAGHdicUy5k+
 XuTCnOLlJkw/QKTJdWGYCPgZV/I/BkHXJGJd6sqlVb/ydj7RhX8SgFlgTtU0YGps/NVK
 yg+kK6IPIkRBBOle2GvHJfde+6SOcFivSBnDtAYu7eh6wU6Jhg3B5vK9wtvMR6deOqCp
 W8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zAcr7UbqNsyeT5xq1K15hM3N4SxMPODnBdVS9Tm//dI=;
 b=JyNMa4zbTbkmdI3NWhZT4NNYaU7ybOepGFf+JHOz6e4yupA5xOA9Za0L7Iy//sa5FN
 uXdjfX1W0Ak44hsdHarNVSaJstEjcb7+Jg4xyFs/aS6VmBmhgyR173GWwdB0Ry/JCzXs
 Q84zI4Ypt1cg45nBg4RnrOm6/o2dziHxvdIxxV1/gWTAZlx8MmSS6gRZGBLby9s6wLJk
 4KsdzQY14ZEvHVgFHZwolyMjHgL1dtPDFxIFrrMgPbcvBrUS4TZtnFkPM1GVe/Hg8aNp
 kvKVLPMl6dvk2m4yR1mQmzf43jeCmL67RoRn2PSQEM4XlmulhCgI307iWfVqkZxi67y/
 OmkQ==
X-Gm-Message-State: AOAM531/11Cxxu38QxB7DCXGzWraHNT1O84UfmypytuoUnfO4q+IvUtf
 vyC4EQ93S6toNIvIeRI2U3h8BqIphtW1fAPM
X-Google-Smtp-Source: ABdhPJxAwRxnRnRlEH/2GbmLJbmE50p3OawbIh3npDRonyQptITwnqPIO29mj6oyqYlT5htVjSHiHg==
X-Received: by 2002:a17:90a:9294:: with SMTP id
 n20mr3503095pjo.69.1637722159168; 
 Tue, 23 Nov 2021 18:49:19 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id p124sm13726407pfg.110.2021.11.23.18.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 18:49:18 -0800 (PST)
Message-ID: <d1dbd860-47f7-c96c-0455-a877e75f118c@igel.co.jp>
Date: Wed, 24 Nov 2021 11:49:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20190509054518.10781-1-etom@igel.co.jp>
 <20190509071429.GA4773@pendragon.ideasonboard.com>
 <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp>
 <20190511181027.GC13043@pendragon.ideasonboard.com>
 <YZZHuNgGr0kZXzyl@pendragon.ideasonboard.com>
 <CAPj87rNPiLve14H85ZBbn-oozqgeS26DGUCg2oJ8LupAdYcEqA@mail.gmail.com>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <CAPj87rNPiLve14H85ZBbn-oozqgeS26DGUCg2oJ8LupAdYcEqA@mail.gmail.com>
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

Hello Daniel

Thanks for the summary of the discussion.

On 2021/11/18 22:02, Daniel Stone wrote:
> Hi all,
> Thanks for this Laurent. Esaki-san, could you please CC dri-devel@ on
> discussions like this?

I'm sorry.
I will check using get_maintainer.pl next time.

> On Thu, 18 Nov 2021 at 12:32, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Sat, May 11, 2019 at 09:10:27PM +0300, Laurent Pinchart wrote:
>>> On Thu, May 09, 2019 at 06:25:19PM +0900, Esaki Tomohito wrote:
>>>> Weston compositor (v5.0.0 or later) uses the DRM API to get the
>>>> supported modifiers and determines if the sprite plane can be used by
>>>> comparing the modifiers with the client specified modifier.
>>>> In currently driver, since the weston doesn't know supported modifiers,
>>>> that cannot determine if the received dmabuf can be passed through to
>>>> sprite plane.
>>>> Since there are R-Car GPU which support linear modifier, the sprite
>>>> plane cannot be used in a compositor similar to the weston if client
>>>> specify linear modifier.
>>>
>>> I don't think the right solution is to expose the linear modifier from
>>> all drivers that don't otherwise support modifiers. We should instead
>>> fix it either in Weston, and treat drivers that don't support the
>>> modifiers API as supporting the linear modifier only, or in the DRM/KMS
>>> core by reporting the linear modifier for drivers that don't explicitly
>>> support modifiers.
>>
>> I've been pointed to
>> https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3350#note_1161827,
>> and we had a discussion on the #dri-devel IRC channel today on this
>> topic. It turns out I was wrong, not specifying modifiers in userspace
>> is different than specifying a linear modifier. This is true for some
>> legacy drivers only (e.g. radeon) that pre-date the modifiers API, and
>> which select a tiling format internally based on some heuristics.
>>
>> I still don't like this patch though, as it would need to be replicated
>> in most drivers. It would be better if we could handle this in the DRM
>> core. Daniel kindly offered to summarize the IRC discussion in a reply
>> to this e-mail.
> 
> Just quickly, I believe the check for the linear modifier in fb_create
> is unnecessary, as this should already be checked in the core through
> format_mod_supported().
> 
> There is indeed a difference between LINEAR and INVALID. Linear is an
> explicit declaration of the layout; INVALID (i.e. no modifier) means
> 'I don't know what this is, so you should guess'. Guessing is
> obviously not reliable, so Weston only passes buffers with no modifier
> to KMS in two cases. The first case is when we allocate a dumb buffer
> and the driver does not support modifiers; this is safe since it's the
> same driver. The second case is when either the GPU driver or KMS
> driver do not support modifiers and we allocate a buffer via GBM with
> USE_SCANOUT; in this case, it is GBM's responsibility to select the
> 'right' layout.
> 
> We will never create a DRM framebuffer with no modifiers when the
> original buffer comes from a client. If the client does not support
> modifiers but the KMS driver does, then we do not know that the client
> has allocated a suitable layout, so this is not safe. If the client
> does explicitly declare a modifier but the KMS driver does not support
> modifiers, then we also do not know that this is safe to use. So
> unless both sides (client/GPU and KMS) support modifiers, we do not do
> direct scanout from client buffers.
> 
> This patch would enable this usecase by declaring support for the
> linear modifier from KMS; when used with a PVR driver which explicitly
> declares the linear modifier, we know it is safe to pass that client
> buffer to KMS.
> 
> Laurent's concern is that the DRM core should handle this rather than
> open-coding in every driver, which I agree with. Some drivers (e.g.
> radeon, maybe legacy NV?) do not support modifiers, and _also_ do
> magic inference of the actual layout of the underlying buffer.
> However, these drivers are legacy and we do not accept any new
> addition of inferring layout without modifiers.
> 
> I think the best way forward here is:
>    - add a new mode_config.cannot_support_modifiers flag, and enable
> this in radeon (plus any other drivers in the same boat)
>    - change drm_universal_plane_init() to advertise the LINEAR modifier
> when NULL is passed as the modifier list (including installing a
> default .format_mod_supported hook)
>    - remove the mode_config.allow_fb_modifiers hook and always
> advertise modifier support, unless
> mode_config.cannot_support_modifiers is set
> 
> FWIW, the effective modifier API and also valid usage is documented
> here, which should be finished and merged shortly:
>      https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collabora.com/
> 
> Cheers,
> Daniel
> 

--
Best Regards
Tomohito Esaki
