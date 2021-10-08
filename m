Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3904264E2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 08:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E446E0A8;
	Fri,  8 Oct 2021 06:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664B56E0A5;
 Fri,  8 Oct 2021 06:47:13 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u18so34850373lfd.12;
 Thu, 07 Oct 2021 23:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEg/iXKXyrcoMa+Ew76qsZK4tl1Mo+OyTmiRe6Q1KVk=;
 b=KidkhSHTDBpHHznAWyqXgxOx6fR8VxKnYYrHBykWD2HoCVrkZsrD+I1DzxWwLhR0bO
 QlTsa19H5SMHlv5h96tBXfxLWcMFNQ3Dicjc1ub+xM5mnKybgCobkEPHF0TIiFh/WuNS
 pNcsby8jdy2RK3YE1weZvKPRJfY21dP6tE43U2zsphDYeNTK6VKmaXoDM1tdfOrFYus8
 FAu0jyF84BBAIOPmrzw/16Jbt9sH7FJAYABD1LiLDLHHgBR5kzuLp6Y9gfisjXWocK1Z
 iZNSWdzA+CmWNTpdp8ANfBi65IRSZZGQBoi+os8G5L3u66Tx8Z05ictCqA0ZVC9F60ql
 3XOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEg/iXKXyrcoMa+Ew76qsZK4tl1Mo+OyTmiRe6Q1KVk=;
 b=Tes7IXVmLHWNIMm/4BXW6uEWajItUDgEqEei7IvAbz3WiaFapSkQDZvNmbe9iXmiRn
 UwwnZPQJoc9wPsnpeHc2dtn891ZPnDP26JejXKCm5pxgF3V9l23jBB8AORCAF/JSLcnK
 sxKw8Mvo4yKIwH6R38ubEcpnXBaKkicwMmQvJU4xCFDhCBP66YMSLsoe8CRP/+uhsvRU
 fr0l7BL0ukMUFznS31ogNYUTZ5+FqCgPj5OxMFlobBU2e8qcWOGqt8/uWwBD8sgLaBBW
 EF3/EFFQcJDa11oFBFEpsm5m1SswAYS1bl6IvN5g2K3LkD2fCGY62zYMOJHNXIfqBxr2
 YotQ==
X-Gm-Message-State: AOAM532VzJvZ1pkKyNA93l5YjDsv8Qn6CCNfAm4RUdw1fF/aWDDXgbjG
 TTbO3qsL3vAXZr8abJXmr6D2+Uxcu4RVMCmY2Zk=
X-Google-Smtp-Source: ABdhPJxkdOCPwKHB2SYU3+i4rG90rPpvwFB7mVFU4H92ROIUW3xUnvmp3M4AGIVByfkxNCw0cpF4kPXz8PJov4Xqj+0=
X-Received: by 2002:a2e:9f10:: with SMTP id u16mr1597954ljk.143.1633675631508; 
 Thu, 07 Oct 2021 23:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211007230903.4084-1-andi@etezian.org>
In-Reply-To: <20211007230903.4084-1-andi@etezian.org>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Thu, 7 Oct 2021 23:47:00 -0700
Message-ID: <CAKi4VAJ-HUR1=-VKeB0i21Q81i3aC00n2c-gp2zmw3ybeULUbw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/gt: move remaining debugfs interfaces into gt
To: Andi Shyti <andi@etezian.org>
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>, 
 DRI Devel <dri-devel@lists.freedesktop.org>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Andi Shyti <andi.shyti@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
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

On Thu, Oct 7, 2021 at 5:27 PM Andi Shyti <andi@etezian.org> wrote:
>
> From: Andi Shyti <andi.shyti@intel.com>
>
> The following interfaces:
>
>   i915_wedged
>   i915_forcewake_user
>   i915_gem_interrupt
>
> are dependent on gt values. Put them inside gt/ and drop the
> "i915_" prefix name. This would be the new structure:
>
>   dri/0/gt
>   |
>   +-- forcewake_user
>   |
>   +-- interrupt_info
>   |
>   \-- reset
>
> For backwards compatibility with existing igt (and the slight
> semantic difference between operating on the i915 abi entry
> points and the deep gt info):
>
>   dri/0
>   |
>   +-- i915_wedged
>   |
>   \-- i915_forcewake_user
>
> remain at the top level.
>
> Signed-off-by: Andi Shyti <andi.shyti@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
> Hi,
>
> I am reproposing this patch exactly as it was proposed initially
> where the original interfaces are kept where they have been
> originally placed. It might generate some duplicated code but,
> well, it's debugfs and I don't see any issue. In the future we
> can transform the upper interfaces to act upon all the GTs and
> provide information from all the GTs. This is, for example, how
> the sysfs interfaces will act.

NACK. We've made this mistake in the past for other debugfs files.
We don't want to do it again just to maintain 2 separate places for
one year and then finally realize we want to merge them.

>
> The reason I removed them in V1 is because igt as only user is
> not a strong reason to keep duplicated code, but as Chris
> suggested offline:
>
> "It's debugfs, igt is the primary consumer. CI has to be bridged over
> changes to the interfaces it is using in any case, as you want
> comparable results before/after the patches land.

That doesn't mean you have to copy and paste it. It may mean you
do the implementation in one of them and the other calls that implementation.
See how I did the deduplication in commit d0c560316d6f ("drm/i915:
deduplicate frequency dump on debugfs")

Alternative would be to prepare igt already and then add a Test-with:
in this patch
series.... But I think it makes more sense to support both locations
for some time and then later
remove the previous one.

Thanks
Lucas De Marchi
