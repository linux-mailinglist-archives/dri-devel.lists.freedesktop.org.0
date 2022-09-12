Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341FE5B5AF2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 15:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CCC10E4D6;
	Mon, 12 Sep 2022 13:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DD210E461
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 13:15:39 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so8102066pjh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=/GKqbHrlKGhniFAuXQ/JKVgioJXltRIcYv2MoBL5H/o=;
 b=DTfXqxU0b3vyHjEZd5TNU4laThichZaMhdFZJadpIPBADcAYasJXX3lLU9M9P+l31l
 6euxazmZgPI8hEEgW7BZKcCIPSFPpMNjwGEjFSSix5xTsdNJvgoeK//Matqr1QYfJku6
 NcFXKj9HV2hguqaOomOjlKvjKAYv5474OaiBeacbkz3aUvlMjH+VnLo3ZrAoG+CEAZwL
 1EtJpOpgUh0Dqx0qeBxFO31wc6M9LYZrANjK6CMV2b+wemSN2i78wOJSQMClp8MmfVGq
 jN5xqnCmn2XeK9Rt6QzFA7P4jiZW7i+Cr56Q2RNL1uFR3CLg5j4QzoAQ4XvkKlTk8YQc
 2xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=/GKqbHrlKGhniFAuXQ/JKVgioJXltRIcYv2MoBL5H/o=;
 b=iYNgea14jwZPqMd5VjP3LiDpKSduHu6Qt3AJHaynMUzYnioY4hS33SulPICS5iah+b
 08RZPw01TuNkoDYlPIJCq/NkSBt9N+7eqFOvv6NWE3oSvG1YhfGt8duLtXFkya5h5i+r
 BaEZ37jpJVwjshwe1CFDBuYliOrHTnTkS+fjWiklYj552s7aY/TW45FneyG9IuZsJFJ5
 JvvL93+d1Us3N7Kuadidi5BvPBkCtEvfryHK5K+YCdJ40BRTLWWx+RimKxC6p5IVdD0/
 8W2VUbqJD4LwG/3A+OD6WmqzV8ev05YyAtFYJJ9z8NGdHujhBQQEcwXLJeee6hPIGfbY
 k6PA==
X-Gm-Message-State: ACgBeo2LFPpM1/s8JmJSpDmFeSFFesjWLLbBLS1TzEmjTcbPS/AfJNmj
 UpnLgnvR2DQHVFe/lNVLGc8N5BEuEJF0qz/4/OM=
X-Google-Smtp-Source: AA6agR4/lIc3Yi+YKD3YLoIT5G7DfT09LCeDFie/K3GzZL5KnZXxx21My01dQM4stkX9TAcag7msS4Fq1ewTuK1OoN0=
X-Received: by 2002:a17:90b:4d8e:b0:200:73b4:4da2 with SMTP id
 oj14-20020a17090b4d8e00b0020073b44da2mr24399728pjb.197.1662988539261; Mon, 12
 Sep 2022 06:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220906203852.527663-1-hdegoede@redhat.com>
 <20220906203852.527663-4-hdegoede@redhat.com>
 <CAMeQTsYwrtAwb2_Lj2RyrWCov88Nq=-_tScD5dXC548Fog3X0w@mail.gmail.com>
 <69fc33c6-b6b0-ba98-d2c6-0fb35df63933@redhat.com>
 <CAMeQTsae12K7WzCBQSVoMk5+CO1H6tO=r0iAfsqNo96ekp4SmA@mail.gmail.com>
 <07347903-f8b2-d2ad-4c86-651243a2090a@redhat.com>
 <1c320c35-fc93-f95e-5615-5a08412f2c5a@redhat.com>
In-Reply-To: <1c320c35-fc93-f95e-5615-5a08412f2c5a@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 12 Sep 2022 15:15:28 +0200
Message-ID: <CAMeQTsbXUbBzJbvp8D1GJdgVZZj3sLpTxEye6TLnhLZJ9oc8Dg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/gma500: Fix (vblank) IRQs not working after
 suspend/resume
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 10, 2022 at 9:50 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Patrik,
>
> On 9/9/22 10:45, Hans de Goede wrote:
> > Hi,
> >
> > On 9/9/22 09:34, Patrik Jakobsson wrote:
> >> On Thu, Sep 8, 2022 at 3:39 PM Hans de Goede
> >> <hdegoede@redhat.com> wrote:
> >>>
> >>> Hi,
> >>>
> >>> On 9/8/22 15:26, Patrik Jakobsson wrote:
>
> <snip>
>
> >>>> On Poulsbo I can see
> >>>> interrupts not getting handled during suspend/resume even with this
> >>>> patch applied.
> >>>
> >>> "during" ?  I guess you mean _after_ a suspend/resume ?
> >>
> >> Yes. I get: irq 16: nobody cared (try booting with the "irqpoll" option).
> >> But perhaps the system is just too slow to respond.
>
> So I've just tested on a Sony Vaio VPCX11S1E (Atom Z540 with PSB graphics)
> and with my entire patch-set (did not test without) suspend/resume works
> fine there without any "irq xx: nobody cared" messages.

Your patch fixes the problem on my FitPC (Atom Z530) as well. Great!

I have the Acer AOD270 so I can look further into the MSI problem. But
as you say, the current solution might be what we want.

-Patrik

>
> Note that on the Vaio VPCX11S1E the gma500 is using irq 18 rather then
> 16 and that irq is not shared with anything. So I wonder if this is
> related to the irq being shared?
>
> Regards,
>
> Hans
>
