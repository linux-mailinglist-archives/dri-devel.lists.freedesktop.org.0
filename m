Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3204646D7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 06:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B826EC67;
	Wed,  1 Dec 2021 05:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7426EC67
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 05:47:21 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so359780pjj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 21:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0vl8jGuk8ygZNQM1djzOjudjxdPLuZhCms74Az9Cu+M=;
 b=v3RFHVtvn0perQkUO+UmWVKZVlPAVyXKpInbMnCQC/w9SUaYDjGcaGNpkIm9Pn9MjM
 NSs7EHvIYgLeG+Vo8+Dx6Wl/pBvZwjFMpjw/n6kVimtbNqOamsf1ElNzfhxqPBKfM1ci
 Ov1onRhZGw/c/8mRdFTTDAZgY17ETwHeI2ucuhsttT97ejRlnflpAR9GyM/yuARKRyvd
 M62HqxYd0FrBMwqdeVZnRoKhiumOdhnCdKojp/z+7th/mo+ujrS5q7XNrPghcCNZiJla
 ucmwl96A3dGShIBRvxYgmhlVW7Mo/M5k9RROh2eKROuBcFeDjTueDPIlrN98Z0biK4SU
 EwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0vl8jGuk8ygZNQM1djzOjudjxdPLuZhCms74Az9Cu+M=;
 b=2R3qPRZmmzrjCL2n6St/l5t5xorbCo1lnL9Jy3YPCCIyxfeaEYpXCZN6Ty8mBO3W/p
 T7ub2/20Of9qEmo9ewl/nRrsW/UMSLMKFNgnvVnvWrRd7pGMyqWHbWvygBbFhqkzfO2I
 5ZlFYduwgph4beX0yFaRen51yXKG5g/VHdVZdxiU+z+aV+dSx1Yrvz0/3dnXAFYGhhTG
 jkoL8u7eZ4qcgjdPDkl8xlCzbIS3B85SO3nNbgxodkbZ/i66YlOOuoZOozpc0hG7qIru
 o1LXoS1utL89DE1rgsupRVDh0tXdvCLx6oSl6tNkK/qIuBB1tKkW44ZRdyr1o9CXArPJ
 jMjg==
X-Gm-Message-State: AOAM532T/gyCPUWs8xjMTCrC3ZI2QOSxYtksBclcQHKkbVeDEN5rl29j
 b3mwtlzo/dq68+Xcy8PpfmRY0w==
X-Google-Smtp-Source: ABdhPJyjeePcUg3elGUeyHIY+xjbtAWuWlVjxEnXlkw/9J+Yz47E+OKGxm0xtGNZ7y02hgWbLjESXg==
X-Received: by 2002:a17:903:2305:b0:142:1bca:72eb with SMTP id
 d5-20020a170903230500b001421bca72ebmr4592242plh.67.1638337641073; 
 Tue, 30 Nov 2021 21:47:21 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id h18sm24732193pfh.172.2021.11.30.21.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 21:47:20 -0800 (PST)
Message-ID: <1bbd5d73-ea67-e9f2-65d0-f0d5ff854838@igel.co.jp>
Date: Wed, 1 Dec 2021 14:47:16 +0900
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
 <6b27be2c-9b13-38ef-ca6a-77c986757386@igel.co.jp>
 <CAPj87rPjCtXLtsfh2V=rPo_tcAQC64cWJXu89qCNb+iQCi1Wag@mail.gmail.com>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <CAPj87rPjCtXLtsfh2V=rPo_tcAQC64cWJXu89qCNb+iQCi1Wag@mail.gmail.com>
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

Hi Daniel-san,

On 2021/11/30 22:20, Daniel Stone wrote:
> On Tue, 30 Nov 2021 at 08:44, Esaki Tomohito <etom@igel.co.jp> wrote:
>> On 2021/11/18 23:05, Laurent Pinchart wrote:
>>> On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
>>>> Laurent's concern is that the DRM core should handle this rather than
>>>> open-coding in every driver, which I agree with. Some drivers (e.g.
>>>> radeon, maybe legacy NV?) do not support modifiers, and _also_ do
>>>> magic inference of the actual layout of the underlying buffer.
>>>> However, these drivers are legacy and we do not accept any new
>>>> addition of inferring layout without modifiers.
>>>>
>>>> I think the best way forward here is:
>>>>     - add a new mode_config.cannot_support_modifiers flag, and enable
>>>> this in radeon (plus any other drivers in the same boat)
>>>
>>> Is there an easy way to identify the drivers that need this ?
>>
>> Should I find a driver that has not use drm_plane_funcs?
> 
> I don't think there's a good way to systematically audit it. The only
> two I know are radeon (i.e. pre-amdgpu) and nouveau (pre-nv50), both
> of which pass no modifiers to drm_universal_plane_init(), but do have
> magic back channels to communicate tiling information. If anyone knows
> of any others, well, I guess we'll find out. :)
Thanks for the information.
I checked the driver code with the tiling keyword, and it seems that 
these are the only two drivers that require cannot_support_modifiers.
I will start creating patches for these two drivers first.

-- 
Best Regards
Tomohito Esaki
