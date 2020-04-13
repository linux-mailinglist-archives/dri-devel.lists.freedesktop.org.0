Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E81A6D1C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 22:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0057389E41;
	Mon, 13 Apr 2020 20:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CCD890CD;
 Mon, 13 Apr 2020 20:17:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a201so10995134wme.1;
 Mon, 13 Apr 2020 13:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dD5YUEDwlW8icDI+F/y9bZzsHxv/M2KUcD6dDQ+9NEo=;
 b=aNP6WsOcy9oz2oIOPIazkJvo8godHmXtmr1TwE8JPmYx+cwAVWXPfV6tSX5Lgfey/B
 3dXc7YsM8r6adTCmRF/bA55Ip/VGpC/QouxCgsQDUpe81/U9Fg7B4wijrK6SEei3kqkC
 ckFdpb5ffuQhmtYRxoPwQSvKez4TVEY/lFeJKCGRQKZmdMr2cji+OnaFGXEd0FDSvNJn
 ah9styOQohwsf/lT2taKcFugIxEvavHdQFOqN5eEXFGvhCRerpBZtJMXtQ8WAqk+o+8W
 kfwKC0+fOvq4LnzI7HYDNDHI9Ae9Lj/D123X3Ussr43iDtHsF6WcqZhku2VK0AvP2KfL
 8raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dD5YUEDwlW8icDI+F/y9bZzsHxv/M2KUcD6dDQ+9NEo=;
 b=DDqy0SDzVnQ1GvUtBrk+U94wf9+dZUKTD/3QX+XZpR8NsbRkP1JqWZiyqH5nL0Oy4n
 1Glns7qEe3yHBY0ETKqMt9YFD238MMevPoBNMkRKM/rhKRa2/FDmUi39i5xG47AK1ZLO
 1HtNa8xSQtfee596WMH3r8Yh8XpwISpAyGh92an0cJ24sSKjbTrc2nNpYvhhiwTHAyfF
 wky4mYtqwVG1Irk2x/wj6nExS5PHpzBEbCl5sA5CLqpLy2brlSueZQCBgXFV/QPFYMcs
 o6ne0WuY+Zt949efmDfZ3MfS8tK6IDD13ixH7yRrJqk4weyQUHiBlKCdg7JI11SkQh5r
 14tw==
X-Gm-Message-State: AGi0Pubemf1oYwmw4hwRVi6KJJAymr9K3iQzAap8mV2ZCcV5t/eyPzJA
 jQO9rrOM74gzBKXCwoP4bmc+ZP0lnFLcOzzS0Gw=
X-Google-Smtp-Source: APiQypKh7TZRCn8Mhrn8z14C0rhM0q0qetKx76lJiDA3Dok2HjocICF1CUGJ/iiEyAWJJZ3sG3pmNUO8e2TieXeSgbU=
X-Received: by 2002:a1c:a4c2:: with SMTP id
 n185mr21099181wme.104.1586809045201; 
 Mon, 13 Apr 2020 13:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
 <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
 <20200324184633.GH162390@mtj.duckdns.org>
 <CAOWid-cS-5YkFBLACotkZZCH0RSjHH94_r3VFH8vEPOubzSpPA@mail.gmail.com>
 <20200413191136.GI60335@mtj.duckdns.org>
In-Reply-To: <20200413191136.GI60335@mtj.duckdns.org>
From: Kenny Ho <y2kenny@gmail.com>
Date: Mon, 13 Apr 2020 16:17:14 -0400
Message-ID: <CAOWid-dM=38faGOF9=-Pq=sxssaL+gm2umctyGVQWVx2etShyQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(replying again in plain-text)

Hi Tejun,

Thanks for taking the time to reply.

Perhaps we can even narrow things down to just
gpu.weight/gpu.compute.weight as a start?  In this aspect, is the key
objection to the current implementation of gpu.compute.weight the
work-conserving bit?  This work-conserving requirement is probably
what I have missed for the last two years (and hence going in circle.)

If this is the case, can you clarify/confirm the followings?

1) Is resource scheduling goal of cgroup purely for the purpose of
throughput?  (at the expense of other scheduling goals such as
latency.)
2) If 1) is true, under what circumstances will the "Allocations"
resource distribution model (as defined in the cgroup-v2) be
acceptable?
3) If 1) is true, are things like cpuset from cgroup v1 no longer
acceptable going forward?

To be clear, while some have framed this (time sharing vs spatial
sharing) as a partisan issue, it is in fact a technical one.  I have
implemented the gpu cgroup support this way because we have a class of
users that value low latency/low jitter/predictability/synchronicity.
For example, they would like 4 tasks to share a GPU and they would
like the tasks to start and finish at the same time.

What is the rationale behind picking the Weight model over Allocations
as the first acceptable implementation?  Can't we have both
work-conserving and non-work-conserving ways of distributing GPU
resources?  If we can, why not allow non-work-conserving
implementation first, especially when we have users asking for such
functionality?

Regards,
Kenny

On Mon, Apr 13, 2020 at 3:11 PM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Kenny.
>
> On Tue, Mar 24, 2020 at 02:49:27PM -0400, Kenny Ho wrote:
> > Can you elaborate more on what are the missing pieces?
>
> Sorry about the long delay, but I think we've been going in circles for quite
> a while now. Let's try to make it really simple as the first step. How about
> something like the following?
>
> * gpu.weight (should it be gpu.compute.weight? idk) - A single number
>   per-device weight similar to io.weight, which distributes computation
>   resources in work-conserving way.
>
> * gpu.memory.high - A single number per-device on-device memory limit.
>
> The above two, if works well, should already be plenty useful. And my guess is
> that getting the above working well will be plenty challenging already even
> though it's already excluding work-conserving memory distribution. So, let's
> please do that as the first step and see what more would be needed from there.
>
> Thanks.
>
> --
> tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
