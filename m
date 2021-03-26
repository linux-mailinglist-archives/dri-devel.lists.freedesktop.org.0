Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20DB34A95E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FED6F3EB;
	Fri, 26 Mar 2021 14:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558506F3EF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:13:47 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id z15so5819141oic.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C9rvIar3XG3Cwro/2o/WuA1e6XVFuhifCTuMigmHCAM=;
 b=XLR7muxMvapDl3GkTtIxvva7j0aMYUVtTRarXwH0csCuYCKTdmmhlPWN5mrWnK0qs8
 zGbndCKb8OVZhZaKNeBBE5/jlqugcO3HpdINuGDkf+4Q66wf98lp81X23ureKThrBYe0
 U4lYiqaD3MrQsvdTZWRDI9kHYWCzylvAuK7NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9rvIar3XG3Cwro/2o/WuA1e6XVFuhifCTuMigmHCAM=;
 b=IiqJHv8m/jR6aJM0iwtVHFuyKAQgyIfLKXBe3WyPdwDTNCqi76FVWrj9cQBSIWQHy+
 2nVc+ckNP5ibAvJ6pHVZFCHkSL0uhYjrwZDgY6liuRQqg8r0Jp70b/nuCrTq9NNU26Mf
 a6uakXua/rSBm13xDiAOYmPs0KzwrmIrV/YPBCmDMkQLsat9sTcFDIxyavNBlZGKAAXV
 M+rT5cslQ1i639RQQ0W62nxr6mILMC8jMWmjqI5uv3hem7iM9Xg9tku13QMvz71vVJal
 gg5QGXJEkF2yhvWucbXu9piA64mohz/0SY2jtgqnQrn7b0T9CoN8eEO42WOFlC1vo3J/
 gYiQ==
X-Gm-Message-State: AOAM531JQYigCmG9P25qIXNXRgNG1PIFVca9FC1FBa10osATBAgZtIns
 bKneeenXcSQBY8SK2WxO5rLcHbUAYEbSm3DbcURIlA==
X-Google-Smtp-Source: ABdhPJxbqveX0o/R/vt/zoskbt7wYBXF30iz5dTxxFvXaxOn89gn0FNWbXoElEwLaeTx2wQlH7IzCyyMnljB667Af84=
X-Received: by 2002:aca:170a:: with SMTP id j10mr9977535oii.128.1616768026242; 
 Fri, 26 Mar 2021 07:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <YF24MHoOSjpKFEXA@phenom.ffwll.local> <874kgy2g9m.fsf@intel.com>
In-Reply-To: <874kgy2g9m.fsf@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 26 Mar 2021 15:13:35 +0100
Message-ID: <CAKMK7uHG9XYbv5N2CnA6BbGOOFaR4mgpo7HvaTdUGLv5GJ_a5A@mail.gmail.com>
Subject: Re: [PULL] topic/i915-gem-next
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 2:31 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Fri, 26 Mar 2021, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > The rough plan we discussed somewhat ad-hoc with Jani&Rodrigo (Joonas was
> > out this week, but back next) is that they send out a pull with what's
> > there right now. Then once both this branch here and the -gt-next pull are
> > in drm-next they will backmerge, and the -gt-next tree is open for
> > business again.
>
> I guess worth noting is that drm-intel-gt-next is now rebased on top of
> current drm-next. Since the topic branch is part of drm-tip, I presume
> the conflicts are manageable.

Ah yes the only conflict between i915-gem-next and drm-intel-gt-next
is in a header where 2 function prototypes got changed next to each
another. Otherwise I didn't hit anything, and CI seems to approve of
both drm-tip and dign. So probably about as good as it will get with a
big shuffle like this one here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
