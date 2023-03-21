Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454AE6C3153
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 13:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863BF10E752;
	Tue, 21 Mar 2023 12:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD22B10E752
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 12:15:24 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id m6so9745238qvq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112; t=1679400924;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xgvMDTUc+iFEyljVKTC7sGSmLaAAICY4ostryzY7Ar4=;
 b=Clxj/MisBNS8Cdyr2dcFyf+xNtT1u3yHrrvvDTn5LC+1rDOIznP9ZQtgXx1vJUaQgt
 Rmxi1806e/H4o0IOnMFBgKoq/IMGyZ2LK4IFkpKg6KSZlv4RNkBS/XCfAlfbphX061gV
 1y2WUr5CT7HhaleDadM0TUvFBSRPsngJ7ry1vF5/Q+jugmP6uV8UGHWIz0R2Vy+WkLqG
 BIXWrEHY9zCHQ9kX4g8bzmeoTwxj+HHic4StKDb58Mhv9rWfPiiT0WdMO/UtaRsnRWdZ
 EvHlwx811GjLR7XcEKtmr2W02XQ3thlbU9RkpLqy5yZxzRIkPbJxI2oXqYgcF1vRnjXq
 EACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679400924;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xgvMDTUc+iFEyljVKTC7sGSmLaAAICY4ostryzY7Ar4=;
 b=AYCC5J+4uqTFNrFJi78IaqMZGhck127sr//QoJlwzH0oTGcmAyV6NKJy576rfnaXEB
 HETfnPzg9YXsXsDaRu1YEFgKXavkaWSf0NEud76T/pHJvcVq51NXLXlL06JnKMYazlEL
 +qgGthSycb1/wc5VBQE95tVWrRl3pgQU01CxkJ55foUQd3nKBe6iJUrfqQbz9T17VKJd
 mZH9L6Bl4Ml/uQ8rQE2ZkpKsP0RRdGjQ9EtrUKZF0OOuTJjcTgs4Q+GjCBLF+6o7EYwF
 g2PqxPJNJEYi7TQFh3Nl1sKtV8JjXsJ2I4EwLxq7qeVxonVwN/tJ5V5+nAM+rTSYleYx
 xAew==
X-Gm-Message-State: AO0yUKXNAm+DZKobydCDQfAwp9zWuiKrN+VDvhMdZgz5KuBwFLVKF6hx
 CL5g+/ma0xNKjEZ/CJia/vmXbtecjJllhJc9WrdbGfyYd4yrjdIq
X-Google-Smtp-Source: AK7set+fn7Uuj5yhPenGAOZh+W60JDQBZLkxGh7y7/fZabSSvDTd7XfpYr/hAvrsaj+nyYDtcJ5mv9Nl+LpDgaebFlk=
X-Received: by 2002:ad4:4d43:0:b0:571:e9d3:24a9 with SMTP id
 m3-20020ad44d43000000b00571e9d324a9mr378500qvm.10.1679400923850; Tue, 21 Mar
 2023 05:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
 <87ileu8jwh.fsf@intel.com>
 <CAOf5uw=g1mU1F=kD6M472LRaTWa2B=Sry4GDGXxDApoZknLfeA@mail.gmail.com>
 <87cz528hzk.fsf@intel.com>
 <CAPj87rPPA9oYkZyQ=Y3MRuyJUN71WHDWHpdaRUvuXAxFSLW5SA@mail.gmail.com>
 <87355y8fzk.fsf@intel.com>
In-Reply-To: <87355y8fzk.fsf@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 21 Mar 2023 12:15:12 +0000
Message-ID: <CAPj87rMnr343w+Nm3pZ-pF-y1LXdyzcMOXUxkid2kgViRaNY9g@mail.gmail.com>
Subject: Re: display band (display area vs real visible area)
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 21 Mar 2023 at 12:08, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 21 Mar 2023, Daniel Stone <daniel@fooishbar.org> wrote:
> > There have been some threads - mostly motivated by MacBooks and the
> > Asahi team - about creating a KMS property to express invisible areas.
> > This would be the same thing, and the userspace ecosystem will pick it
> > up when the kernel exposes it.
>
> In my case the kernel handled it completely internally, and the
> userspace didn't even know. But I guess it depends on the display being
> able to take a smaller framebuffer, otherwise I don't think it's
> feasible.
>
> I haven't checked the threads you mention but I assume it covers the
> more general case of having rounded corners or holes for the camera, not
> just the frame covering the edges or something like that. That couldn't
> possibly be handled by kernel alone, but it's also a bunch of
> infrastructure work both in kernel and userspace to make it happen.

Yeah, exactly. Just a connector property, which could come from DT or
ACPI or manual overrides or whatever. Userspace would still allocate a
full-size framebuffer, but look at that property and not render
anything useful into those areas. In the camera/notch case, it's a
matter of not putting useful content there. In the letterbox/pillarbox
case, it's about shrinking the reported screen size so that window
management, clients, etc, all believe that the screen is smaller than
it is.

Cheers,
Daniel
