Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EFF490110
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 06:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A97510E632;
	Mon, 17 Jan 2022 05:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9A10E65C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 05:15:58 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id g2so9847981pgo.9
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 21:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MQeBrGkGEPprlAGgzRHSnT1m1Ox7Vg6LsQGd/Iu7NGs=;
 b=zv1yBiIyK4mMISwhtI4Pbr+dw8RVonPbi+fUCF0Xpuvz6C5K5mWFWEFBGDxt0XxQ/W
 cJXmztz1z9qEGFd5duOYIkhhcKAwVgigWrJah0RZJTHFkgg2KXkAPb2nblOOySKzR6zo
 xF9yuG9KfYQfL0YSLww/NV3NB2EME+iINMugre+MRNmHKB/gT1cEGFDwRS+FC2z481qJ
 b0dEd5MkZkDLA887VF8x3QW7/w/+iJeVmnjSSOxk6zNyoUaH1arGie2EaDF32cE3koBT
 FATnZjisTmkrXzQF0HwxO3ga5/2uWvDKoBGXsBPb8FJfxxVcFgHd1EYoeDJqWFciEHCZ
 dsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MQeBrGkGEPprlAGgzRHSnT1m1Ox7Vg6LsQGd/Iu7NGs=;
 b=IJN3D3c+voWl1dJbFLfw0lisW/z4x59i5MVi2x2TPpGMc10nvydfpJpS7kSTx/eeJt
 UEzH0xdEOMMsEQ0F1KEtXck+RYsQzz5EN2LF1DvW/yOVj725UnJjfog5unhPFLz9gauK
 JVnz5jk70w3+mivXMdPd3W+++i3rxf3ZrFRpM4PNCzMcfI6h8qJ6mO61vBf5sMqGUKtd
 7ImUhNWCyrTZoUMK/3F85XJNUIBlj2105mDjK1X5ikDiRDuElHbWq5fuAQFlu+tOpZbz
 J6fydfDTbyJr9LMo8GA14DCWdyG4JO3FeM5Bm8UOVAsLRwT93fs9YaWZxIrP6gYi7V08
 uP7w==
X-Gm-Message-State: AOAM531aC0MdNzshX9v3Y0jh2rQ9y0resXmbTD/RcNn8ht/mZNyRsoLo
 gA/8WWrl1RXGicnQ8jcCDphgXg==
X-Google-Smtp-Source: ABdhPJyd50JZ5TcZwpKKG06f3DkcKlsUMm/JuuJ/PhWjAmM8kxYt86DgraRr8zaKIruizzcn/MgB3g==
X-Received: by 2002:a05:6a00:2182:b0:4a7:ec46:29da with SMTP id
 h2-20020a056a00218200b004a7ec4629damr19626922pfi.68.1642396558414; 
 Sun, 16 Jan 2022 21:15:58 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id p18sm12346694pfq.174.2022.01.16.21.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 21:15:57 -0800 (PST)
Message-ID: <0cf405a1-0d2d-ed5e-abdf-be645e7a9209@igel.co.jp>
Date: Mon, 17 Jan 2022 14:15:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH v3 2/3] drm: add support modifiers for drivers whose
 planes only support linear layout
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220114101753.24996-1-etom@igel.co.jp>
 <20220114101753.24996-3-etom@igel.co.jp>
 <YeGFugZvwbF7l2I/@smile.fi.intel.com>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <YeGFugZvwbF7l2I/@smile.fi.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Takanari Hayama <taki@igel.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Evan Quan <evan.quan@amd.com>, Mark Yacoub <markyacoub@chromium.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you for your reviews.

On 2022/01/14 23:16, Andy Shevchenko wrote:
> On Fri, Jan 14, 2022 at 07:17:52PM +0900, Tomohito Esaki wrote:
>> The LINEAR modifier is advertised as default if a driver doesn't specify
>> modifiers.
> 
> ...
> 
>> +	const uint64_t default_modifiers[] = {
>> +		DRM_FORMAT_MOD_LINEAR,
>> +		DRM_FORMAT_MOD_INVALID
> 
> + Comma?

There is no mention in the coding style about adding/removing a comma to 
the last element of an array. Is there a policy in drm driver?

I think the advantage of adding a comma to the last element of an array 
is that diff is only one line when an element is added to the end.
However since INVALID is always the last element in the modifiers array, 
I think it can be either in this case.
If there is a policy, I will match it.

Thanks,
Tomohito Esaki
