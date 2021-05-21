Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDCB38CEA5
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110F86E862;
	Fri, 21 May 2021 20:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25596E862
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 20:08:21 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i22so31240865lfl.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 13:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xvfpVd2OzH4+o/D/vVDC31Zzvji7CpUDutlyGbWSS2M=;
 b=EbaAG9yK/DK3FcwWC04VW6QzRYN89xRqlD00mrvuESUFgBxV9HY8hkAXOyT5Lt0xpx
 PppMV5UTCm21S4B9qt/ncdmHkOMYb27DbVQ9WV5E09GdcFKA0hRbhSVghHeaEPPoJaSb
 dEcBcUUDgAw4ejb0yilsMouDiF0KWMY5GDKlYDPEhctNS87/jVTGh5VE5vDzRgUx3Q1P
 ImYqL0JyA4p95+SC38XbOoxlTbUyOgGY7+aBPyPpC6NgRTzAHg92siUlFxEhm3olReik
 2zNUFAEeFXvA/EXlg42qs5DoJCeGPD0efucoC+esFnELqjhO9qUj2rveosnwnT78ncVZ
 PUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xvfpVd2OzH4+o/D/vVDC31Zzvji7CpUDutlyGbWSS2M=;
 b=ufI4gmnuYQjcHg9P6L1NCB1+pnsqd0pRE/3k+8BbLk0L9sCbnaQYtESO/hA93nEwpr
 V0pFwgMRqLBNdWMGgdNp2igOyfC74KSHbg+iSQHwexr9Gp/xliPFyTsBC+4apS/7CgLf
 30Sl+MC1gn2Q+H6pvShkHEvOZw6YV6BtsLSgtfMCq85wHkX64lNED9dRo4RmBTve30GQ
 EP7Su+i0146ISIl8OegO4V+HGMhb4m6kReM8paItjYkX9/s5c644VKUAtWpQbi0Pd1lX
 mb7++lrmfb/1FOSjVHEBhdD3xTCTIjSL1E4gk5Ht0Kk56dvFTgDjfrcF05i+Gkjphk7S
 WnCQ==
X-Gm-Message-State: AOAM531UTRmIP3gItULJOXTi/FdSzgOOU6DTCNcF30r3wuRONUCCkn2I
 +bPS8MDONs5+M8ePORZpNhQtB9HrvmEyNkDXedBHmw==
X-Google-Smtp-Source: ABdhPJwkNqh6VetR4pQ9osWleGLD8Gu670e5ZwNiJj7gabab2EtxcbnJLTI/hP8824g6eoId8EW/5PjT89tzRHZhP7w=
X-Received: by 2002:a19:8083:: with SMTP id b125mr3166068lfd.204.1621627700167; 
 Fri, 21 May 2021 13:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201110034934.70898-1-john.stultz@linaro.org>
 <CAF2Aj3iEUkBDyyWDT63iT_7KrquOcEo_L5rCteGF1OJg8Ux3ug@mail.gmail.com>
In-Reply-To: <CAF2Aj3iEUkBDyyWDT63iT_7KrquOcEo_L5rCteGF1OJg8Ux3ug@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 21 May 2021 13:08:07 -0700
Message-ID: <CALAqxLVPj_dhkME24hYc_fqMOfPRydQjVLSq26gKV+pEAWaw-g@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To: Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 2:40 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 10 Nov 2020 at 03:49, John Stultz <john.stultz@linaro.org> wrote:
>> This series reworks the system heap to use sgtables, and then
>> consolidates the pagelist method from the heap-helpers into the
>> CMA heap. After which the heap-helpers logic is removed (as it
>> is unused). I'd still like to find a better way to avoid some of
>> the logic duplication in implementing the entire dma_buf_ops
>> handlers per heap. But unfortunately that code is tied somewhat
>> to how the buffer's memory is tracked. As more heaps show up I
>> think we'll have a better idea how to best share code, so for
>> now I think this is ok.
>>
>> After this, the series introduces an optimization that
>> =C3=98rjan Eide implemented for ION that avoids calling sync on
>> attachments that don't have a mapping.
>>
>> Next, an optimization to use larger order pages for the system
>> heap. This change brings us closer to the current performance
>> of the ION allocation code (though there still is a gap due
>> to ION using a mix of deferred-freeing and page pools, I'll be
>> looking at integrating those eventually).
>>
>> Finally, a reworked version of my uncached system heap
>> implementation I was submitting a few weeks back. Since it
>> duplicated a lot of the now reworked system heap code, I
>> realized it would be much simpler to add the functionality to
>> the system_heap implementation itself.
>>
>> While not improving the core allocation performance, the
>> uncached heap allocations do result in *much* improved
>> performance on HiKey960 as it avoids a lot of flushing and
>> invalidating buffers that the cpu doesn't touch often.
>>
>
>
> John, did this ever make it past v5?  I don't see a follow-up.

So most of these have landed upstream already.

The one exception is the system-uncached heap implementation, as
DanielV wanted a usecase where it was beneficial to a device with an
open driver.
Unfortunately this hasn't been trivial to show with the open gpu
devices I have, but taking Nicolas Dufresne's note, we're looking to
enable v4l2 integration in AOSP on db845c, so we can hopefully show
some benefit there. The HAL integration work has been taking some time
to get working though.

So it's a bit blocked on that for now.

thanks
-john
