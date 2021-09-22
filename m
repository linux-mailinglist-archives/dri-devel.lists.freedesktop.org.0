Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47649414CF8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 17:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08316EC1B;
	Wed, 22 Sep 2021 15:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79C46EC1B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 15:26:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i4so13375823lfv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sVblMwcY20Jt1iJwJZzOQQzmXaPjWYdpKIFg44drlAI=;
 b=Iv8Fu1IRNg70EMHGzFeMTd8j/ThtaiAem9UrK07EGRyvDmdYcny/SyCehISsXmkqpx
 l92lTNBSyBbDXYg1Yhc6RFGTAV9NS5ml7ZmwcQJaPFjWpMPUte3T+pogP3++9F+/Z1A/
 kzeL2ruJbqjYn3yHBIgPlbAR8WOp/hvzXBCGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sVblMwcY20Jt1iJwJZzOQQzmXaPjWYdpKIFg44drlAI=;
 b=SF34WPH7sSOJCqFY2FEMthPJN2mFZK6WOPkMNToTfthEHJdkLsZ+JvFc92Yc9ZVucr
 j/5UDdjEa3AAXRia6KHnKPafMzB/FXa+PVlskLxNr4UGg2PnO0hZyLxtIBN+xZkO5VpG
 WVRzFPP3dck0XH26l5WBaX7aQXoUztWsQSQmTWa5UbG3Bmn9XuYoG0aidAEumEwqO67d
 kMexkzd1sD/hEWU81Bdt9GjkmK3azi/mwSKYM4rm0eNU17HBUx2UmQxJHesI1p67jVc8
 qRtpX9YfgmwJ4Ddxt/+07VVoujhzO9tZV8GLOfUOrXOgUu1h1Ht/W/l+mC9Q/22CphrM
 FV3Q==
X-Gm-Message-State: AOAM530kh49Jr73gB6A3ONd5oqvQtAnPES+C599pbSt6M7jqwUJ/3mZS
 GJ02B+3t/6X/ptEXKmA3E70txv62ZqLypF5UP0A=
X-Google-Smtp-Source: ABdhPJwlUzvBRY4x82HlIDfuuh9lefwdvrj1cz33vB3KduleXtGkQMHV+KpRp6rjgLE9WQw5+MzWLQ==
X-Received: by 2002:ac2:4c47:: with SMTP id o7mr214495lfk.202.1632324279030;
 Wed, 22 Sep 2021 08:24:39 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id a11sm199823lfj.166.2021.09.22.08.24.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 08:24:38 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id i25so13458637lfg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:24:38 -0700 (PDT)
X-Received: by 2002:a2e:5815:: with SMTP id m21mr126446ljb.95.1632324177022;
 Wed, 22 Sep 2021 08:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210903160302.yh42vpkuob45dbpb@gilmour>
 <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
 <20210904091050.g5axxctgelciihjn@gilmour>
 <CADVatmN+9euG5Fegor1+kaSPewbW8vRwBgnxmr5SsK3mOE6FEg@mail.gmail.com>
 <20210920144730.d7oabqfbx7pmyyfb@gilmour>
 <20210920154333.vunyxeshdb7jt5ka@gilmour>
 <20210920155350.h6624mt65vwg72p2@gilmour>
 <CADVatmNi+jN+EwiWuoDoocZFyErDVNt1ND0BxtjuKiV63aNuJg@mail.gmail.com>
 <20210920171042.oq3ndp3ox4xv5odh@gilmour>
 <CADVatmOs7Cc1EdCZXMyXcWM-3-J4bU_3zF1thkOohVUL-G6ZrQ@mail.gmail.com>
 <20210922095725.dk4vk42zb3kh7y6s@gilmour>
 <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
In-Reply-To: <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Sep 2021 08:22:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
Message-ID: <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
Subject: Re: Regression with mainline kernel on rpi4
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 22, 2021 at 3:11 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> That test script is triggering the openqa job, but its running only
> after lava is able to login. The trace is appearing before the login
> prompt even, so test_mainline.sh should not matter here.

Side note: the traces might be more legible if you have debug info in
the kernel, and run the dmesg through the script in

  scripts/decode_stacktrace.sh

which should give line numbers and inlining information.

That often makes it much easier to see which access it is that hits a
NULL pointer dereference.

On x86-64, generally just decode the instruction stream, and look at
the instruction patterns and try to figure out where an oops is coming
from, but that's much less useful on arm64 (partly because I'm not as
used to it, but because the arm64 oopses don't print out much of the
instructions so there's often little to go by).

         Linus
