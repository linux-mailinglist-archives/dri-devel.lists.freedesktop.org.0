Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDE3D8CD1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 13:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A37C6E161;
	Wed, 28 Jul 2021 11:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5EC6E161
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 11:36:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e2so2109449wrq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ctxTTD1eYmR1KRXoZD+iD1SFLdswDK3qL2mBNRwqgG8=;
 b=E0kWDXP8TwH7fnA4mxIdiCoU1hLAGIlJMVS+k17SaGveAyHftFfgbwPHOm/YiLeUr4
 jb6Bipbwe5pC3EKXwqn03YESjhqRx6aZpObuU9qufR80JS44PD0VHj6UyueHYcubsjbA
 o+WRN7cd+fg77gPxVnOIjSU1hvKycRaZ+k2QskO+Lowgq2w588/39uDXHrO1gKmVNiMx
 VNh0fPm2Qs82PniLOq5ZY6ucPzyAJ7nHJSXiAAW6mYAZbYJmyQGA4hxxAo8XP62SLd9s
 Sgngnlrqq+XvwResuspUbmIhFstjNh26TmGQsGWr9I7GQMlYNDWybrdev4mDHGU0sSuM
 MGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ctxTTD1eYmR1KRXoZD+iD1SFLdswDK3qL2mBNRwqgG8=;
 b=oIB+F44IHpA5nmOdoUdqAvxLXudd2L5euLo5JswoW++JIUtDdmlBwIGc0FM9lVGMlI
 7sg+9GPZb+g9SRc7VjMN0zY0h3LUlT8MJ66TFZI7wyqgQWQfhkB6N8tGR+4xilyRdj1M
 Q652JWHtPg1bVOPXHwSOcpU4a/DVyJ++Pj7cJzJkXqAj7w/gIHiZsFyf3MJMLL8aEepj
 jmDzCDzyUcwplTPTZNnUcwaNHQprzJa9yV+tyLAK8cpUrYitwHiaRSljpv9Rq/mKhbOd
 ufghYvQ0Vw7SqgQRGI2eKY+wKPosTL6IMXmSiM0ujezrvGjWCjMAu/RXRUa0QD4b8Jh+
 4ccA==
X-Gm-Message-State: AOAM531vHV+EuUuvOyj4eW1Hj5x5QPASW3HVrVTHlz8q+4YrX9YjH2/f
 qS9Bfv77Szi8OCBbltacG/c=
X-Google-Smtp-Source: ABdhPJzN9Ejho84SxZ+EisMXOSRndfBgocIDirO7z0vMJboAiMYiBMMrvLO9l+kIT1zNAyv6NKqgbg==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr20680621wrw.354.1627472188541; 
 Wed, 28 Jul 2021 04:36:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:6a5d:b580:2891:cbac?
 ([2a02:908:1252:fb60:6a5d:b580:2891:cbac])
 by smtp.gmail.com with ESMTPSA id o19sm6086953wmr.18.2021.07.28.04.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:36:28 -0700 (PDT)
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: Rob Clark <robdclark@chromium.org>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
Date: Wed, 28 Jul 2021 13:36:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.07.21 um 17:37 schrieb Rob Clark:
> On Tue, Jul 27, 2021 at 8:19 AM Michel Dänzer <michel@daenzer.net> wrote:
>> On 2021-07-27 5:12 p.m., Rob Clark wrote:
>>> On Tue, Jul 27, 2021 at 7:50 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> Based on discussion from a previous series[1] to add a "boost" mechanism
>>>>> when, for example, vblank deadlines are missed.  Instead of a boost
>>>>> callback, this approach adds a way to set a deadline on the fence, by
>>>>> which the waiter would like to see the fence signalled.
>>>>>
>>>>> I've not yet had a chance to re-work the drm/msm part of this, but
>>>>> wanted to send this out as an RFC in case I don't have a chance to
>>>>> finish the drm/msm part this week.
>>>>>
>>>>> Original description:
>>>>>
>>>>> In some cases, like double-buffered rendering, missing vblanks can
>>>>> trick the GPU into running at a lower frequence, when really we
>>>>> want to be running at a higher frequency to not miss the vblanks
>>>>> in the first place.
>>>>>
>>>>> This is partially inspired by a trick i915 does, but implemented
>>>>> via dma-fence for a couple of reasons:
>>>>>
>>>>> 1) To continue to be able to use the atomic helpers
>>>>> 2) To support cases where display and gpu are different drivers
>>>>>
>>>>> [1] https://patchwork.freedesktop.org/series/90331/
>>>> Unfortunately, none of these approaches will have the full intended effect once Wayland compositors start waiting for client buffers to become idle before using them for an output frame (to prevent output frames from getting delayed by client work). See https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 (shameless plug :) for a proof of concept of this for mutter. The boost will only affect the compositor's own GPU work, not the client work (which means no effect at all for fullscreen apps where the compositor can scan out the client buffers directly).
>>>>
>>> I guess you mean "no effect at all *except* for fullscreen..."?
>> I meant what I wrote: The compositor will wait for the next buffer to become idle, so there's no boost from this mechanism for the client drawing to that buffer. And since the compositor does no drawing of its own in this case, there's no boost from that either.
>>
>>
>>> I'd perhaps recommend that wayland compositors, in cases where only a
>>> single layer is changing, not try to be clever and just push the
>>> update down to the kernel.
>> Even just for the fullscreen direct scanout case, that would require some kind of atomic KMS API extension to allow queuing multiple page flips for the same CRTC.
>>
>> For other cases, this would also require a mechanism to cancel a pending atomic commit, for when another surface update comes in before the compositor's deadline, which affects the previously single updating surface as well.
>>
> Well, in the end, there is more than one compositor out there.. and if
> some wayland compositors are going this route, they can also implement
> the same mechanism in userspace using the sysfs that devfreq exports.
>
> But it sounds simpler to me for the compositor to have a sort of "game
> mode" for fullscreen games.. I'm less worried about UI interactive
> workloads, boosting the GPU freq upon sudden activity after a period
> of inactivity seems to work reasonably well there.

At least AMD hardware is already capable of flipping frames on GPU 
events like finishing rendering (or uploading etc).

By waiting in userspace on the CPU before send the frame to the hardware 
you are completely killing of such features.

For composing use cases that makes sense, but certainly not for full 
screen applications as far as I can see.

Regards,
Christian.

>
> BR,
> -R
>
>> --
>> Earthling Michel Dänzer               |               https://redhat.com
>> Libre software enthusiast             |             Mesa and X developer

