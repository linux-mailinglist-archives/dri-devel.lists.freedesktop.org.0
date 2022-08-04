Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF43A58A008
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 19:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982C8A13B8;
	Thu,  4 Aug 2022 17:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5B2A2A61
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 17:48:56 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so369863fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=RSuhwQUQ/rtlHZ0/kclF6sR3y8SDjI8wPdFTaAIfmE8=;
 b=pA5TqVCrqsfU3E1QS05RGTU3XdQaYQEL1rIkanyUCosL0FnWxJeieTDvzxMRKpF9LZ
 bcuNTTiH+XvLsEHA19T+IPa7YneFcn2RV9FtCUgLzQ3+SPqeyd0/hhScoCzRwfMncigD
 6odDNfaeIFS1OSBrRXhXp3hyDXwG02jFZ894kdfrwwZhuxDeYNul3r8lwOqTuZnfH17W
 oI2PHJeIESNUPGIlwPUtUnWDhbcqHPzgwjJ/X8Kvz7F+Cd+qhTpa4tj09VOyegKcmHKB
 a5/8yBAWDig6O/f0ubkESsFBPczUHPlT8nK728m/eaa7q/btLXyX+4pkjZlEwdgCutxk
 KA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=RSuhwQUQ/rtlHZ0/kclF6sR3y8SDjI8wPdFTaAIfmE8=;
 b=TiciMISSa3+ta1bYGBkqcyRjtqpQd8yIauo/xf7ccT2WSf3Qx0W53Upw0m0dId2Vki
 lDF+fMfrm385fe+VtQ8LtcmvFe7GwTQ4gaXvrXAHHr3o3i/zHHGXVh+2sfQsJmHwmSNO
 tYTA+ZXrGason4WKSAzDW03B0m4Mo0ak39cS5B5DZdqX1XLANYE4HHZFBZbapLGlch/6
 hy5c7KASGHeVJPaCW5qBj/+RsMCDDRJwkWn9kF5g7ZeMqzlvpclDltsRe3yNwW8tFBLP
 Okgks1yMPpsJxk966FgAChnwXpvB+xXmbf13tzVtZak6oWUOC+kuUHaH4HH1x0JvT9T7
 iN3Q==
X-Gm-Message-State: ACgBeo2pwidS0wAbBbyAhcU1fL7TuaPxJfolGKDTWBVTZHdigA4c6359
 skoB4cGP9LEh+in43Dk/a6ugYEKNvTEM+sefcrA=
X-Google-Smtp-Source: AA6agR641/SV2Bllh6acKzFzyf8aJ1w6LSNmQ+XzJeUciEYy5SIPAV4FucSy24dkiLjEytsbgNfuIm4AxMvAic576X8=
X-Received: by 2002:a05:6870:961d:b0:10d:7606:b212 with SMTP id
 d29-20020a056870961d00b0010d7606b212mr1395995oaq.166.1659635335065; Thu, 04
 Aug 2022 10:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <YuvctaLwRi+z0Gw4@nvidia.com>
In-Reply-To: <YuvctaLwRi+z0Gw4@nvidia.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Thu, 4 Aug 2022 20:48:28 +0300
Message-ID: <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiho Chu <jiho.chu@samsung.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 5:50 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Thu, Aug 04, 2022 at 10:43:42AM +0300, Oded Gabbay wrote:
>
> > After all, memory management services, or common device chars handling
> > I can get from other subsystems (e.g. rdma) as well. I'm sure I could
> > model my uAPI to be rdma uAPI compliant (I can define proprietary uAPI
> > there as well), but this doesn't mean I belong there, right ?
>
> You sure can, but there is still an expectation, eg in RDMA, that your
> device has a similarity to the established standards (like roce in
> habana's case) that RDMA is geared to support.
>
> I think the the most important thing to establish a new subsystem is
> to actually identify what commonalities it is supposed to be
> providing. Usually this is driven by some standards body, but the
> AI/ML space hasn't gone in that direction at all yet.
I agree. In the AI-world the standard doesn't exist and I don't see
anything on the horizon. There are the AI frameworks/compilers which
are 30,000 feet above us, and there is CUDA which is closed-source and
I have no idea what it does inside.
>
> We don't need a "subsystem" to have a bunch of drivers expose chardevs
> with completely unique ioctls.
I totally agree with this sentence and this is *exactly* why
personally I don't want to use DRM because when I look at the long
list of common IOCTLs in drm.h, I don't find anything that I can use.
It's simply either not relevant at all to my h/w or it is something
that our h/w implemented differently.

This is in contrast to the rdma, where as you said, we have ibverbs
API. So, when you asked that we write an IBverbs driver I understood
the reasoning. There is a common user-space library which talks to the
rdma drivers and all the rdma applications use that library and once I
will write a (somewhat) standard driver, then hopefully I can enjoy
all that.

>
> The flip is true of DRM - DRM is pretty general. I bet I could
> implement an RDMA device under DRM - but that doesn't mean it should
> be done.
>
> My biggest concern is that this subsystem not turn into a back door
> for a bunch of abuse of kernel APIs going forward. Though things are
How do you suggest to make sure it won't happen ?

> better now, we still see this in DRM where expediency or performance
> justifies hacky shortcuts instead of good in-kernel architecture. At
> least DRM has reliable and experienced review these days.
Definitely. DRM has some parts that are really well written. For
example, the whole char device handling with sysfs/debugfs and managed
resources code. This is something I would gladly either use or
copy-paste into the hw accel subsystem.
And of course more pairs of eyes looking at the code will usually
produce better code.

I think that it is clear from my previous email what I intended to
provide. A clean, simple framework for devices to register with, get
services for the most basic stuff such as device char handling,
sysfs/debugfs. Later on, add more simple stuff such as memory manager
and uapi for memory handling. I guess someone can say all that exists
in drm, but like I said it exists in other subsystems as well.

I want to be perfectly honest and say there is nothing special here
for AI. It's actually the opposite, it is a generic framework for
compute only. Think of it as an easier path to upstream if you just
want to do compute acceleration. Maybe in the future it will be more,
but I can't predict the future.

If that's not enough for a new subsystem, fair enough, I'll withdraw my offer.

Thanks,
Oded

>
> Jason
