Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0CC3DC001
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D726F4B0;
	Fri, 30 Jul 2021 20:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF696F4B0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 20:47:24 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id d73so17994676ybc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 13:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/0jhFaIN74qXsSiikohXu8cl1HOkpOoIv692ywasfb4=;
 b=f5K+q+/Oav1k+ND8XrBFrsylqIwwScjanXzx54x+wWsM1L30VD11ldf0yyGhC6g7KY
 DkQgH6qE9CkgcEjm6N3PPIKFeHC51RjCMNgjyCK/Ku+wzxIs2V8vvlseAhpSTeH2FyQh
 FwdDA+Xe5Iv+cqI/5Vz1svm6MMJWWO1MlXmmhFOVpuVQSBvop2X4AiHx9Nx5TO2JzdOv
 X2p1LiNz4owqBu0jMURSKY8F5ohal27/DFW7J839MGvrGXWNDKKBqiE5SY0SdNQnxmIC
 ugOf4UlvuhnYk10moYg/rK2MR5989RxMz4VkdYixaorPPCX435aCyGqionTt7tHiylWv
 9XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/0jhFaIN74qXsSiikohXu8cl1HOkpOoIv692ywasfb4=;
 b=l+WZ1NC+RswwHOEKK+ABPIA1/pmSL/pEpBqUnfpO8zzLZC44YunNuJq6FNp7jjlzMp
 NncehscVyhTV2E2yRTLmr4/66++PGciOHOntiTxYj7TGwx5O273bSf1uT0fR2L8uJJIR
 99IdjJuO7YLSfRQ/1/GlZB+p68fqxfxxYuHQHC3vdcNBQCfq8O6wlpzymoS7xP2iJ3mD
 LVyyB7G0bqbCXiFgaqHfgDjWAzvQqQQxdRz5kYdd5+CpxQnWH4etKX/pG1SVIgHNQtQY
 nkfdtAa7d1OJhCppVRJIBE0qA6aHAAI7bYPGaX3/beuUK7P1at64A75IxkeZAMcLU91V
 6VuA==
X-Gm-Message-State: AOAM5320wVioDNE5Ic/ZePFVMNddOMrJBqjsLyNtgMyQJ/Nmu1Ol1pXT
 8yq/3AXGotIuamr9rzB1spUcJrcoHyptl1/l/P/JKA==
X-Google-Smtp-Source: ABdhPJx/oaMRUi+rJ7Z7rv6fnGibfQ0yMvYpuQi7W+qHjbMi+UQmXv0MyKu1dcrOKPeHXBs23Hd2JO/NCMi+ib63UCE=
X-Received: by 2002:a25:2155:: with SMTP id h82mr5794127ybh.177.1627678043828; 
 Fri, 30 Jul 2021 13:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210729070330.41443-1-christian.koenig@amd.com>
 <20210729070330.41443-3-christian.koenig@amd.com>
 <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
 <CALAqxLVN7RVz3+z1ZvkRHeb2=Y4KbpbTOw-8St0D+Lzt5U-cFw@mail.gmail.com>
In-Reply-To: <CALAqxLVN7RVz3+z1ZvkRHeb2=Y4KbpbTOw-8St0D+Lzt5U-cFw@mail.gmail.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Fri, 30 Jul 2021 13:46:48 -0700
Message-ID: <CA+wgaPNVp4ci1otArWNA1k+TGdHYgwz-ObWR0M8YO5j+gCfmQQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dma-buf: nuke SW_SYNC debugfs files
To: John Stultz <john.stultz@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-media <linux-media@vger.kernel.org>, 
 Alistair Delva <adelva@google.com>, Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 29, 2021 at 9:52 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Jul 29, 2021 at 12:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jul 29, 2021 at 09:03:30AM +0200, Christian K=C3=B6nig wrote:
> > > As we now knew controlling dma_fence synchronization from userspace i=
s
> > > extremely dangerous and can not only deadlock drivers but trivially a=
lso the
> > > whole kernel memory management.
> > >
> > > Entirely remove this option. We now have in kernel unit tests to exer=
cise the
> > > dma_fence framework and it's containers.
> > >
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > There's also igts for this, and Android heavily uses this. So I'm not s=
ure
> > we can just nuke it.
>
> Eeeeh... I don't think that's actually the case anymore. As of
> android12-5.10 CONFIG_SW_SYNC is not turned on.
> Further, Android is disabling debugfs in their kernels as it exposes
> too much to userland.
>
> That said, there still are some references to it:
>   https://cs.android.com/android/platform/superproject/+/master:system/co=
re/libsync/sync.c;l=3D416

Hello,

Like John mentioned, CONFIG_SW_SYNC is not turned on for the *-5.4 and
newer branches in the Android Common Kernel. The references in AOSP
are only in place to support devices with older kernels upgrading to
newer Android versions.

Regards,
Hridya

>
> But it looks like the actual users are only kselftest and igt?
>
> Adding Alistair, Hridya and Sandeep in case they have more context.
>
> thanks
> -john
