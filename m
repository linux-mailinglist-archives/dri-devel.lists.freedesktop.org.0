Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FB741FD43
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 18:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1332C6F4F6;
	Sat,  2 Oct 2021 16:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE95B6F4F6
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 16:50:01 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x27so51870085lfu.5
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Csv37OXbbDiSxP1I27uaunb1tkkC28qGypuG9vbumlM=;
 b=f7QX1paUZLa6LbxjYrSrbM9jlt9yPMwzqTWrBad1TWIoRDz21l7WZy5J5Le2KzRQYy
 dg3j4YES0SMxOB8VBaDved+Q7R/c8muwjQwl638BnkC6zXtX+ZRK12dyoZgsWvzTnFhg
 wXyg6GfRhS+egEE51QHkoI6kOutXpxzaZGuHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Csv37OXbbDiSxP1I27uaunb1tkkC28qGypuG9vbumlM=;
 b=t3uXnCNpZGu8EdEP/NQGdF6NYDib1yXk+ZLxdjFZaE4APyKr6Zky9e4x3W0M34bO+7
 7ifVrMR4Dh5+CLeTitp03qibSOwBBirDnVLtDxZ/ZiGJ+TRKVmlEC/rixfx3dUsRqdgv
 x6TjZXgAG8mEgtz44Rp2Z2oUgC25CH3U8phYN3J57jtfJB7FNqzvdR2/5urWLYlM4rWu
 lqAKFtJXs7fqAh9hqgHVqZxh+qv3cYoLy9o+Iql2lnpLaTOBl3a+Zvrww9aaDFT4qKSa
 pj328ZOuRLF0DXQekaUBzHh1TjnF3Vc+iHjwWJw8+1J5WE8mZkCz/OuYD/CTTb2xGEJV
 dK4A==
X-Gm-Message-State: AOAM530eWVmPjEMMl8xAtUtr9mGj3SdV+I0frR+8kLnR+x/mhl5yThOn
 KT+jhhI0ZiT0+0os+TtqRDqr379m/iAOkQll3pg=
X-Google-Smtp-Source: ABdhPJwVNsJnBLxbGqLEk0zjf/8qiEjYEu5FKB6GXbe2v63H4ctL9RHqjL/cKBAoiAUnL0SrjlYEKA==
X-Received: by 2002:a2e:145c:: with SMTP id 28mr4560190lju.295.1633193399297; 
 Sat, 02 Oct 2021 09:49:59 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id br40sm1088184lfb.64.2021.10.02.09.49.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 09:49:58 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id b20so52094259lfv.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 09:49:57 -0700 (PDT)
X-Received: by 2002:a05:6512:3d26:: with SMTP id
 d38mr4500647lfv.474.1633193397167; 
 Sat, 02 Oct 2021 09:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211002020257.34a0e882@oasis.local.home>
 <259ff554-76b8-8523-033-9e996f549c70@google.com>
 <20211002081750.7eec92dd@oasis.local.home>
In-Reply-To: <20211002081750.7eec92dd@oasis.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 2 Oct 2021 09:49:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJsD3RaqpmAMv7yjpnQqrEuXvibXZZDY7f-nzO+PvULg@mail.gmail.com>
Message-ID: <CAHk-=whJsD3RaqpmAMv7yjpnQqrEuXvibXZZDY7f-nzO+PvULg@mail.gmail.com>
Subject: Re: [BUG 5.15-rc3] kernel BUG at
 drivers/gpu/drm/i915/i915_sw_fence.c:245!
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Hugh Dickins <hughd@google.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Caz Yokoyama <caz.yokoyama@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Sat, Oct 2, 2021 at 5:17 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Sat, 2 Oct 2021 03:17:29 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
>
> > Yes (though bisection doesn't work right on this one): the fix
>
> Interesting, as it appeared to be very reliable. But I didn't do the
> "try before / after" on the patch.

Well, even the before/after might well have worked, since the problem
depended on how that sw_fence_dummy_notify() function ended up
aligned. So random unrelated changes could re-align it just by
mistake.

Patch applied directly.

I'd also like to point out how that BUG_ON() actually made things
worse, and made this harder to debug. If it had been a WARN_ON_ONCE(),
this would presumably not even have needed bisecting, it would have
been obvious.

BUG_ON() really is pretty much *always* the wrong thing to do. It
onl;y results in problems being harder to see because you end up with
a dead machine and the message is often hidden.

                  Linus
