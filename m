Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C547AA870
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 07:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2769610E0DC;
	Fri, 22 Sep 2023 05:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40BA10E0DC;
 Fri, 22 Sep 2023 05:35:27 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-503056c8195so2803787e87.1; 
 Thu, 21 Sep 2023 22:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695360926; x=1695965726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i42xK5t65z1xprFx6v1CK1qTSluTmpGd73+0+lQ9aw0=;
 b=VP+qzOZ5YNgwkIbNRNiekkuwd5C2wpUq4QCmn/oxJQNoO4RJK7vwu1hWmL7SwLE43c
 OpjFyIHDH+b/IHmcAoEGfNGtaKyhx0ZDfkFclNxY1UPGzBmD7owZQYZ2QxcRdzBAsnBM
 ILXqTXM7Mk62p1pwllsWo+CopCBPB7KPmtZbu6QRobimAtYxLuAwQGBoDzvvsBTBbd2N
 DUB6jaZDqBXCHowoKFrt2IvH95g0A/gydOjWMlzj2Sfc75RPIwyq1ESqC/ygdpG4ckew
 3FO6YKVzbUvJrQ9f5SagqXUqLVnLJMNEwSPEP7PQ0KjuqwZuNLLnUApJCr1fW9fLOQL4
 3xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695360926; x=1695965726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i42xK5t65z1xprFx6v1CK1qTSluTmpGd73+0+lQ9aw0=;
 b=FJBuV8PVHvlVpdptuf/OCFYjdib+vcHQSkVy6FLyBDULqVGV6PU6uYC5P/1yynvpjP
 KE0F9YMB+W/SW+ksCSclvVGKgENxJUfr/xWWU7y+QIloYRfIoEApL3YWtVd2cTaWuIdF
 hkEGnh9g9qGCUV305DdFt2lUaavckEZ9PgtdO14GZiNBnaR+MRq615brPItY5pve0Q0a
 3xDgYkV+aKS3MRXzf0Jxs9IceXfWq9Up+OuWQ1tczvbsyVaVTcv4Ysyt+TOveAvBe9Vb
 qawq5MeIeYsyTDnu7QHAH8CbWImICHWGRCgSYFfuBSHk54aenbu9DKmwc8NHJUNsOErH
 ZrDA==
X-Gm-Message-State: AOJu0Yzptw97/IYEaHSy5OztClOjZQccHqUH10GFGuiiKkxUgA3xAuhz
 ocqJ9n75vruR0yo8OzaGoNgQ4wrRNS5t5g==
X-Google-Smtp-Source: AGHT+IHTBooWoo5hRYy8Ssr/YFsYaamY0TW14KjJjgAFotrZ2DQDmblW/Yf2Wgv2L5MHpeF5AKPqtw==
X-Received: by 2002:a05:6512:32b1:b0:500:b2f6:592 with SMTP id
 q17-20020a05651232b100b00500b2f60592mr6403529lfe.50.1695360925554; 
 Thu, 21 Sep 2023 22:35:25 -0700 (PDT)
Received: from [192.168.178.25] ([134.19.96.130])
 by smtp.gmail.com with ESMTPSA id
 l14-20020aa7cace000000b0053331f9094dsm1803111edt.52.2023.09.21.22.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 22:35:24 -0700 (PDT)
Message-ID: <6b101d03-57c2-148e-9da8-2a548a4522b6@gmail.com>
Date: Fri, 22 Sep 2023 07:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: WARNING in amdgpu_sync_keep_later / dma_fence_is_later should be
 rate limited
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
References: <CACna6rxtaHG6QTinuHyNyA7rck_aEBiMHtxSCLktArU1OoqxLg@mail.gmail.com>
 <BL1PR12MB51444F28FD848B91BAEDE88AF7F8A@BL1PR12MB5144.namprd12.prod.outlook.com>
 <8bc269a0-b720-4f7b-a9df-c50d90ea41c3@gmail.com>
 <CADnq5_NDokcoJ_bht+oEEyo+PYHJmTjyH5mGLCpWkL++F_Ok8w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_NDokcoJ_bht+oEEyo+PYHJmTjyH5mGLCpWkL++F_Ok8w@mail.gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Yu, Lang" <Lang.Yu@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.09.23 um 23:30 schrieb Alex Deucher:
> On Thu, Sep 21, 2023 at 4:21 PM Rafał Miłecki <zajec5@gmail.com> wrote:
>> On 21.09.2023 21:52, Deucher, Alexander wrote:
>>>> backporting commit 187916e6ed9d ("drm/amdgpu: install stub fence into
>>>> potential unused fence pointers") to stable kernels resulted in lots of
>>>> WARNINGs on some devices. In my case I was getting 3 WARNINGs per
>>>> second (~150 lines logged every second). Commit ended up being reverted for
>>>> stable but it exposed a potential problem. My messages log size was reaching
>>>> gigabytes and was running my /tmp/ out of space.
>>>>
>>>> Could someone take a look at amdgpu_sync_keep_later / dma_fence_is_later
>>>> and make sure its logging is rate limited to avoid such situations in the future,
>>>> please?
>>>>
>>>> Revert in linux-5.15.x:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=li
>>>> nux-5.15.y&id=fae2d591f3cb31f722c7f065acf586830eab8c2a
>>>>
>>>> openSUSE bug report:
>>>> https://bugzilla.opensuse.org/show_bug.cgi?id=1215523
>>> These patches were never intended for stable.  They were picked up by Sasha's stable autoselect tools and automatically applied to stable kernels.
>> Are you saying massive WARNINGs in dma_fence_is_later() can't happen
>> in any other case? I understand it was an incorrect backport action but
>> I thought we may learn from it and still add some rate limit.
> All of the current places where that function is used check the
> contexts before calling it so it should be safe as is in the tree.
> That said, something like this could potentially happen again.  I
> don't think using WARN_ON_RATELIMIT() would be a problem.

Yeah, but it also shouldn't be necessary.

When this triggers you have a major driver bug at hand, spamming the 
logs is then the least of your problems.

Christian.

>
> Alex

