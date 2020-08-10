Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D24A241370
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 00:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C81F89D30;
	Mon, 10 Aug 2020 22:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717F189CF1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 22:56:10 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id p191so6026292ybg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ckbscItG3D9X9bU57nAKJbw7oFgwmBm0zna135Ii13I=;
 b=eGXWwBGv5ArYE6y3kB7tDjjbtQK2KtLJ9mktmkkAVtjsku60CLdmq1VmrEhDpaFxym
 VA547nWwl+KGHdNZr5HprzKyMvt9JIkuzIhcxyHyf3wpIzNevCHwKfCIYiPPWyP/u4Up
 ATDbZUR9Vsx+tFWB+GmLG/zNEJ46gcZIRt0FvN6vUEAOA0unP/VyAdpwh7AwkuwFoPJ0
 l8YHWLmMjS3CdZLk08Ho+hMnBtOSkpWZklhE7hXXw8QBsZZKRJkZOCYawkKMvDaQzqjj
 kmu18QiQ5xOHSFStQ+as6G5BcjtyVUW1hiufdqVI7BL7+BH9/8rBKn0K9AE7/YzM3aiN
 hJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ckbscItG3D9X9bU57nAKJbw7oFgwmBm0zna135Ii13I=;
 b=fQYNCn0ktWPciG9nMNHKvsPIg15K3ZRUXavXkXeN0hqcES5fePsDCSF09G4boBgsT3
 3gncmkMbZVmCQeHfY3cXdXhr3GQxwiI6oKkbkZw8FwjxZwZZs0G42+ZUQmhCadfNtt7b
 W8T2yGkGbgUOhImNKt0sr71R3fMoy2FLEfXMmzqDtPUeqgomnKPlz0jSVj7B9AwyG1K3
 02q7ZvYgR15ShnBKxM/HrFuOvJoUUbfnQCwtfBeTDDbV2lZ5jk4YZduNh/Lp7e7r463C
 h7Y5iDlIYOnD2xL2B/rRRXS6b0T4YRsGQlUymlX4EjbtmZtdrREYG/tCiDrnmTwYYzhy
 Ivyg==
X-Gm-Message-State: AOAM532WK0dxqwL96/qEWtmyob5ye45PFrt7RxJ5S+JPnWdVY2yq/q6r
 iW222feq3O16yXbqQJ7xsfjMtkfMrzh9freguXA=
X-Google-Smtp-Source: ABdhPJwI6I3PWxjjF9fAO/CzjIWk8a566/WgK3q0G5Wp2QHc7OlifBoPBgUNdktdO71W5NXvBJmhchOQ7TOoYDCE0Ko=
X-Received: by 2002:a25:2e12:: with SMTP id u18mr40482048ybu.200.1597100169627; 
 Mon, 10 Aug 2020 15:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty8hOY0m2+RJdRiRADY5Li-hs3ZaDEK-DTf6rgFewar7g@mail.gmail.com>
 <20200810122320.GA20549@infradead.org>
 <CAPM=9tyDkW5rzz0PVQUXf0EnDoebRnD_Td=ZCWV1-LwvHE3Scg@mail.gmail.com>
In-Reply-To: <CAPM=9tyDkW5rzz0PVQUXf0EnDoebRnD_Td=ZCWV1-LwvHE3Scg@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 11 Aug 2020 08:55:58 +1000
Message-ID: <CACAvsv7B0dykiJYQwyoXepD004eF-VFC--xHcFUbCQtA6DO4Mw@mail.gmail.com>
Subject: Re: [git pull] drm next for 5.9-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-spdx@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Aug 2020 at 04:46, Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 10 Aug 2020 at 22:23, Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Thu, Aug 06, 2020 at 11:07:02AM +1000, Dave Airlie wrote:
> > > nouveau:
> > > - add CRC support
> > > - start using NVIDIA published class header files
> >
> > Where does Nvdia provide them?  I looked into the commits and the
> > Nouveau mailing list archives and could not find anything.
>
> https://github.com/NVIDIA/open-gpu-doc
>
> Is I believe the canonical upstream source for them.
> >
> > Note that various new files with a MIT boilerplate instead of
> > an SPDX tag.
>
> Ben might just have imported them directly, so SPDX tags might need to
> be sent upstream and see if they accept them.
Yeah, I decided to play it safe and keep NVIDIA's headers as-provided,
just trimmed down to the parts we're using.

Ben.

>
> Dave.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
