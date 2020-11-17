Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A7B2B6CA0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 19:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E3E8855B;
	Tue, 17 Nov 2020 18:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF4E8855B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 18:10:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u12so16907698wrt.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 10:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HpQ/esQudbW0I9Ksreww0RcPWneBs9hkz/hyGa5QmKI=;
 b=o2J1KQnKfbokmhzNNPtv4ObUJ0nsSFcPtwUgVWUB6E7UEOKPHOLdDbTw/l82RyPo/Y
 FP1+NNzwR7U1uup8V8Q4hB9qwXUBVv/7bMVNF2pQo7vmQET7y+P7QNQS7++qJ8Oi4yWq
 yLHKiGOz7qD1uwTXGoL1jWILGl4ydKYrr+xTrMhuiA8yRPUX+hAxsXeP5Ieet2O6fhmw
 3KqFDbNM6BVzATBQpgjPEYo3Rrzkf6idIZOv8mgcWajNaETmdTLQQhuNhQJJLZBvoCO5
 s1AhtDq36w2JrW8v3ODUlJ9OIM4epBwt0x0Xeo7rh2WzYkHen0q/zoEaEZYv2zCG/deV
 0tKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HpQ/esQudbW0I9Ksreww0RcPWneBs9hkz/hyGa5QmKI=;
 b=W9rWK8S1C5O8Qu3t+UZ8mhUHi8LD/4cc+at0Cjbntlz9HY+R7H5O/IyUwKvRI6dFgt
 fgYu2qXAxy9T4x82kcZkHxXLWPPY0PwlIj6xPSSVCmJmEUMInaKGAdZy8HQ3FJsZnGiq
 /AG/ePZtrUDO3CbvZL8CTq9hoie4HelxI0TL3QNClhd+cmXNCyREGk6ZZbVp6UpGFisE
 LF96Q4+zopdR2+Or3QI4qvapXBlOT9FomJ1pWGBm5Z71x+vgRSxBD7Zx+T3HY8n11TK1
 lUutBbs5jhjQIBJpFWfq6RcdGgrEK/w+eQcADUpH6mQVQiN2QiV1RJUlUKX+18xM8IoG
 RclA==
X-Gm-Message-State: AOAM533gYM2ARNMa05fE4bqHgun77WAQhTBP/nfB22iNa2UKMv8OpdDh
 Gn17GUN7jGIywf+7viwI9Tc0N9xaUgvhQAILxKY=
X-Google-Smtp-Source: ABdhPJyptDWsbC5Qr/bge72gBd+jtcErHEBjEkkn6Es7hnZm6rsRA5sysyHGzsLrtoVBAJekq8Ez9alJA65GgFnG5+w=
X-Received: by 2002:adf:8028:: with SMTP id 37mr762462wrk.111.1605636635119;
 Tue, 17 Nov 2020 10:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20200820162738.33053904@oasis.local.home>
 <20201022173434.910879-1-lpy@google.com>
 <CA+0soAkD7BG6CjhMW6PYR4yAgDykU2uUizcHx1QQdXqgesCFFg@mail.gmail.com>
 <20201116160508.3e86496f@gandalf.local.home>
 <173158b7-e65e-257f-0e24-aa9d5401d1d1@intel.com>
In-Reply-To: <173158b7-e65e-257f-0e24-aa9d5401d1d1@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Nov 2020 13:10:23 -0500
Message-ID: <CADnq5_NxvGynXwtw8m8bjYETHwdXExjyxsLobbBSa+pehOkq+Q@mail.gmail.com>
Subject: Re: [PATCH v4] Add power/gpu_frequency tracepoint.
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, zzyiwei@android.com,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Peiyong Lin <lpy@google.com>, Prahlad Kilambi <prahladk@google.com>,
 Ingo Molnar <mingo@redhat.com>, Amit Kucheria <amit.kucheria@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>,
 Sidath Senanayake <sidaths@google.com>, android-kernel@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 1:00 PM Rafael J. Wysocki
<rafael.j.wysocki@intel.com> wrote:
>
> On 11/16/2020 10:05 PM, Steven Rostedt wrote:
> > On Mon, 16 Nov 2020 12:55:29 -0800
> > Peiyong Lin <lpy@google.com> wrote:
> >
> >> Hi there,
> >>
> >> May I ask whether the merge window has passed? If so is it possible to
> >> ask for a review?
> > This is up to the maintainers of power management to accept this.
> >
> > Rafael?
>
> I'd say up to the GPU people rather (dri-devel CCed) since that's where
> it is going to be used.
>
> Also it would be good to see at least one in-the-tree user of this (or a
> usage example at least).

Can you resend the patches and cc dri-devel or point out the previous
patch discussion?

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
