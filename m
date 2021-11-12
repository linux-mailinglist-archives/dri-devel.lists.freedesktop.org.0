Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B005144E977
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 16:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9586EAC6;
	Fri, 12 Nov 2021 15:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB896EAC6;
 Fri, 12 Nov 2021 15:03:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b12so16057624wrh.4;
 Fri, 12 Nov 2021 07:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ICfZz6qpvCwy49JeWEKdT7liF7vXWYTFBWJG5poMPUM=;
 b=UCwg3+r8AsBltCAXSYCDB+fe3YMsuWdU6WrPc0tMscg2u5d4LY1ElyFG3y4VYqETi+
 wWzfb4hSF3E0hBHGqeSAzlRqMaiMEvC7wa724buL/cY05WuikvX4h0b1s7OJJVymv9+A
 9narbMwXQnpYwMnIQ3EX+0/uz2bcWtG2uvvkGfRJcR4wCLiL3iCmrUsTUfjCELMVvmha
 9rBZjPnxNOt7efsU6f0Nu24cq0AdDustR4/YlqRGuWdH2GGLmeGO26AGeS/aHK5rfhqJ
 ecV1B1sYSBp+9rfBPJthyK+4QzmptY4/XIKOj+o3P1I+bIQuQuYMta8SpXtGSs4j7b7i
 QALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ICfZz6qpvCwy49JeWEKdT7liF7vXWYTFBWJG5poMPUM=;
 b=qanjlmqOBqeZkVfavurzWDBOfd3xZGVLvT8zuyawO/pMfSqafwQrsZpFgbQSh8QJIp
 1FMJIWuP8NHVyg3yr+wVytaojE1Ovy9vpAABtoeQONMmbFMW5XZScqycf1mOfhZj7/XU
 bxOU9OwM1l+qIaZuHItwnBcQjoncwre5dJkeQhnnBLFsRdDjcFv0AOXwNeREGlsukXT0
 C9mNp5dJOFN4f7EXSa9JMawUX284xA125dQhAaxOdjDwJR07LtLzYs1O1+W54kUXtL2d
 6JOg6Q5MnQ5oYnpaeUdIHTNy0Cs62UwIsR4S93ZPwIsjLRiO2WSQV2FBRcp5J5HcMjbi
 XQrg==
X-Gm-Message-State: AOAM5333ScZ5+UMDC1EwK2aSkNjCNJKJZyspjD+3nAcsKqd2nX2F9HY7
 cuVXV03IcGu2bteUCsL+sVBB7dO7zz0=
X-Google-Smtp-Source: ABdhPJxXXqGKmnhW/7OU68Se8POe3mC2FpVLTfdkde6NiEyNHW3JPvAM6MLl9B34/sDEeGkIQi/iwQ==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr18672681wrx.64.1636729419736; 
 Fri, 12 Nov 2021 07:03:39 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:6e65:9f86:85:5884?
 ([2a02:908:1252:fb60:6e65:9f86:85:5884])
 by smtp.gmail.com with ESMTPSA id r17sm6693147wmq.11.2021.11.12.07.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 07:03:39 -0800 (PST)
Subject: Re: Questions about KMS flip
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Yu, Lang" <Lang.Yu@amd.com>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
 <YYV0W1CxT5torU7u@phenom.ffwll.local>
 <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
 <YYk7SkflDx8ToqYG@phenom.ffwll.local>
 <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
 <YYvIfXy9bwPokiK9@phenom.ffwll.local>
 <ab2fb071-12ab-da99-53c9-1411ca9acdaa@amd.com>
 <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
 <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
Date: Fri, 12 Nov 2021 16:03:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 12.11.21 um 15:30 schrieb Michel Dänzer:
> On 2021-11-12 15:29, Michel Dänzer wrote:
>> On 2021-11-12 13:47, Christian König wrote:
>>> Anyway this unfortunately turned out to be work for Harray and Nicholas. In detail it's about this bug report here: https://bugzilla.kernel.org/show_bug.cgi?id=214621
>>>
>>> Lang was able to reproduce the issue and narrow it down to the pin in amdgpu_display_crtc_page_flip_target().
>>>
>>> In other words we somehow have an unbalanced pinning of the scanout buffer in DC.
>> DC doesn't use amdgpu_display_crtc_page_flip_target AFAICT. The corresponding pin with DC would be in dm_plane_helper_prepare_fb, paired with the unpin in
>> dm_plane_helper_cleanup_fb.
>>
>>
>> With non-DC, the pin in amdgpu_display_crtc_page_flip_target is paired with the unpin in dm_plane_helper_cleanup_fb
> This should say amdgpu_display_unpin_work_func.

Ah! So that is the classic (e.g. non atomic) path?

>> & dce_v*_crtc_disable. One thing I notice is that the pin is guarded by if (!adev->enable_virtual_display), but the unpins seem unconditional. So could this be about virtual display, and the problem is actually trying to unpin a BO that was never pinned?

Nope, my educated guess is rather that we free up the BO before 
amdgpu_display_unpin_work_func is called.

E.g. not pin unbalance, but rather use after free.

Regards,
Christian.
