Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B66B15F7B4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 21:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAE26E870;
	Fri, 14 Feb 2020 20:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2930E6E870;
 Fri, 14 Feb 2020 20:28:54 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a5so11274170wmb.0;
 Fri, 14 Feb 2020 12:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7pGksv/syYfMklkQS/MIxpCbqI6gBoN9ooNLnkw1E8=;
 b=N1XKAjyzrOIL2WzL1i8osQZXd6YVKxqkJSXnzZnFBy1EQOWFgDBfiObxlJ6bu7mVat
 eUdmeSjiexNOP2Prvp/0vLY5h/yLiURfC8HoGpPbpMX54OZ8mr/dUR29OBSMivfWUWXn
 iyguSO0yZXfkaIQtW7BYfxWDSegl8iR5+RdQ82QsOBT8A8FoilCfgTKeFMSqVwieUMZi
 U8o4gtsr1gm5O6AvmypSDqY/hNM0Gcg7QWEJ2WD9fhHMcr7QyfNgEhkD1woTpTAfdwvQ
 Eb3cQ7NrGnGi9ubqbT2kUO6hU52AeCwU0WutSeAT4c8nD40tE5hqBlMSInEIdyFR905L
 EXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7pGksv/syYfMklkQS/MIxpCbqI6gBoN9ooNLnkw1E8=;
 b=Ht+V+9mB/hCMdvbmJsa9t5BuDoFrqmYSQjeFMWPXlCawoFWrC9V3zR/6Y8vV0z8aWO
 Q26mbiJa9rBvTlTElZ9zJVW8AJyJUl+7rFGzCcQgZwVL/RGcaGzPz5sqVU4aZzEUzZYS
 xJU/UG40YqLUA+uDqkOHxeHqr9B/SX/gIQLD8RNKZxkTCqQyIjzw4gsutYhhYXMm/vxT
 ropO/J38GLjsLfw+diMSegTn7/g7bGv776SeXn07GaJF5BVZS7ZqXrktho3kgPhFtuAa
 ubm9Q2HItw9kU+NW3P8lK410J+kUSnTGxaudKCVxFAEgFZjRJX8jdhQg/o1XP9YNzvsA
 R/sg==
X-Gm-Message-State: APjAAAWWuF1lCEvToSas1yCP5CrFmIHTTVyyjWIKL+ICpyShzO3IjUGF
 BvW6IN3t8wFnSAJaBEfaSL9meDbtJbijUdsq2FI=
X-Google-Smtp-Source: APXvYqzQzqb+GYycoJ++mSYmrxDPTAkYNnz/M4iHUyk2dnbs4mPvr3G0FHTH7AAXaolWev+GH/6SQNwmuJwpuYt5d/E=
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr6419397wmm.143.1581712131806; 
 Fri, 14 Feb 2020 12:28:51 -0800 (PST)
MIME-Version: 1.0
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
 <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
 <CAOWid-f62Uv=GZXX2V2BsQGM5A1JJG_qmyrOwd=KwZBx_sr-bg@mail.gmail.com>
 <20200214183401.GY2363188@phenom.ffwll.local>
 <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
 <20200214191754.GA218629@mtj.thefacebook.com>
In-Reply-To: <20200214191754.GA218629@mtj.thefacebook.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 14 Feb 2020 15:28:40 -0500
Message-ID: <CAOWid-dA2Ad-FTZDDLOs4pperYbsru9cknSuXo_2ajpPbQH0Xg@mail.gmail.com>
Subject: Re: [PATCH 09/11] drm, cgroup: Introduce lgpu as DRM cgroup resource
To: Tejun Heo <tj@kernel.org>
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
Cc: juan.zuniga-anaya@amd.com, Kenny Ho <Kenny.Ho@amd.com>, "Kuehling,
 Felix" <felix.kuehling@amd.com>, jsparks@cray.com, nirmoy.das@amd.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, "Greathouse, Joseph" <joseph.greathouse@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Johannes Weiner <hannes@cmpxchg.org>,
 Alex Deucher <alexander.deucher@amd.com>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 damon.mcdougall@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tejun,

On Fri, Feb 14, 2020 at 2:17 PM Tejun Heo <tj@kernel.org> wrote:
>
> I have to agree with Daniel here. My apologies if I weren't clear
> enough. Here's one interface I can think of:
>
>  * compute weight: The same format as io.weight. Proportional control
>    of gpu compute.
>
>  * memory low: Please see how the system memory.low behaves. For gpus,
>    it'll need per-device entries.
>
> Note that for both, there one number to configure and conceptually
> it's pretty clear to everybody what that number means, which is not to
> say that it's clear to implement but it's much better to deal with
> that on this side of the interface than the other.

Can you elaborate, per your understanding, how the lgpu weight
attribute differ from the io.weight you suggested?  Is it merely a
formatting/naming issue or is it the implementation details that you
find troubling?  From my perspective, the weight attribute implements
as you suggested back in RFCv4 (proportional control on top of a unit
- either physical or time unit.)

Perhaps more explicit questions would help me understand what you
mean. If I remove the 'list' and 'count' attributes leaving just
weight, is that satisfactory?  Are you saying the idea of affinity or
named-resource is banned from cgroup entirely (even though it exists
in the form of cpuset already and users are interested in having such
options [i.e. userspace OpenCL] when needed?)

To be clear, I am not saying no proportional control.  I am saying
give the user the options, which is what has been implemented.

> cc'ing Johannes. Do you have anything on mind regarding how gpu memory
> configuration should look like? e.g. should it go w/ weights rather
> than absoulte units (I don't think so given that it'll most likely
> need limits at some point too but still and there are benefits from
> staying consistent with system memory).
>
> Also, a rather trivial high level question. Is drm a good controller
> name given that other controller names are like cpu, memory, io?

There was a discussion about naming early in the RFC (I believe
RFCv2), the consensuses then was to use drmcg to align with the drm
subsystem.  I have no problem renaming it to gpucg  or something
similar if that is the last thing that's blocking acceptance.  For
now, I would like to get some clarity on the implementation before
having more code churn.

Regards,
Kenny


> Thanks.
>
> --
> tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
