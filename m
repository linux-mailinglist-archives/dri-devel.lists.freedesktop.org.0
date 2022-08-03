Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0B58950C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 01:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391BC2BE4B;
	Wed,  3 Aug 2022 23:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B9E2B6E6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 23:54:48 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id e13so4386491edj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 16:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=DGbVXvn0p8z6n16D3EkJmoWdnWBBlfc2vbyBDsF6Q28=;
 b=NAnbvqQK6mNA+dzF8+Uu9faxrmdyF6kLS4J+TEN26d99qUrFVu8GaiVn2uKvkZHHQS
 J0D34iOCELARm/Ip/tm3McyR6RjKXauNkPNcNzK/X/xYUli7bLDTwwztFCkx95aVRQJs
 4ewZm7Jtd1kMi5DVodhjw7aPkRHN71wwYXv4LnMyAQ3vNWvGIz4/b/fWFj7mhNITnIZM
 xfC7sUHf1KYOBPzeyQAB5R2+ykXK7oBxVfWwhZSKTWTNPOFtjatOqchrTFwEaVbMJaHp
 jyj8sA1W5mm9Zb/5im88cLhAjyjLW+3gIDJGCnXNV6ML/OJDSGTa8dFToJvYlzv7IpzV
 A70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=DGbVXvn0p8z6n16D3EkJmoWdnWBBlfc2vbyBDsF6Q28=;
 b=h3uX5FNmofdd6Z7FUICvbxs2C09DGIEaxDAMf7qZsX9JmNZqqQBTlNVEnbmlvrKojb
 zgfoI1h9gj5+Wa/66xUUPKwxt6AIj0nF+O0aO0BOStXSSFQOiFl9oyubOHIlrVvnut8t
 DYo8WrUm+p7hFEpKuSIF4h4GloGZAu0EAhjquooQwVDZIt1mYNMM6kG7/4FRX6NKXU3C
 K2R0GvoMwLHw6DZVxTMInO7UqyaAkDs9Eulxqa/AQz5FfinuxZqDG1QC0S3gKOLdhLs7
 7bj7C+VlgTBDeVhVNELJWjXan9CfU+VzGc8b58b3CvU4kT+/CwbN2MbQPuP69iXxxW38
 zMiQ==
X-Gm-Message-State: ACgBeo0Rw5+eEg64LwqefJRqjp+/eccid6ECO8NIttmtGRqdjL3hxG7W
 afoxtM9YsAPq0/T6p03q+GuBYprJgtH74rBdgig=
X-Google-Smtp-Source: AA6agR6u1Qozmw2noaYYlAg3nVjqWSctgEm6XiGd0jNCdGhoeBixL4WyU7qZW0uJcVBSVtOn5eX5KzZ8cwqumjb6iLI=
X-Received: by 2002:a05:6402:249b:b0:43c:8ce6:8890 with SMTP id
 q27-20020a056402249b00b0043c8ce68890mr11142175eda.74.1659570887205; Wed, 03
 Aug 2022 16:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
In-Reply-To: <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Aug 2022 09:54:35 +1000
Message-ID: <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: Oded Gabbay <oded.gabbay@gmail.com>,
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Aug 2022 at 06:21, Oded Gabbay <oded.gabbay@gmail.com> wrote:
>
> On Wed, Aug 3, 2022 at 10:04 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Sun, 31 Jul 2022 at 22:04, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > >
> > > Hi,
> > > Greg and I talked a couple of months ago about preparing a new accel
> > > subsystem for compute/acceleration devices that are not GPUs and I
> > > think your drivers that you are now trying to upstream fit it as well.
> >
> > We've had some submissions for not-GPUs to the drm subsystem recently.
> >
> > Intel GNA, Intel VPU, NVDLA, rpmsg AI processor unit.
> >
> > why is creating a new subsystem at this time necessary?
> >
> > Are we just creating a subsystem to avoid the open source userspace
> > consumer rules? Or do we have some concrete reasoning behind it?
> >
> > Dave.
>
> Hi Dave.
> The reason it happened now is because I saw two drivers, which are
> doing h/w acceleration for AI, trying to be accepted to the misc
> subsystem.
> Add to that the fact I talked with Greg a couple of months ago about
> doing a subsystem for any compute accelerators, which he was positive
> about, I thought it is a good opportunity to finally do it.
>
> I also honestly think that I can contribute much to these drivers from
> my experience with the habana driver (which is now deployed in mass at
> AWS) and contribute code from the habana driver to a common framework
> for AI drivers.

Why not port the habana driver to drm now instead? I don't get why it
wouldn't make sense?

Stepping up to create a new subsystem is great, but we need rules
around what belongs where, we can't just spawn new subsystems when we
have no clear guidelines on where drivers should land.

What are the rules for a new accel subsystem? Do we have to now
retarget the 3 drivers that are queued up to use drm for accelerators,
because 2 drivers don't?

There's a lot more to figure out here than merge some structures and
it will be fine.

I think the one area I can see a divide where a new subsystem is for
accelerators that are single-user, one shot type things like media
drivers (though maybe they could be just media drivers).

I think anything that does command offloading to firmware or queues
belongs in drm, because that is pretty much what the framework does. I
think it might make sense to enhance some parts of drm to fit things
in better, but that shouldn't block things getting started.

I'm considering if, we should add an accelerator staging area to drm
and land the 2-3 submissions we have and try and steer things towards
commonality that way instead of holding them out of tree.

I'd like to offload things from Greg by just not having people submit
misc drivers at all for things that should go elsewhere.

Dave.


>
> Regarding the open source userspace rules in drm - yes, I think your
> rules are too limiting for the relatively young AI scene, and I saw at
> the 2021 kernel summit that other people from the kernel community
> think that as well.
> But that's not the main reason, or even a reason at all for doing
> this. After all, at least for habana, we open-sourced our compiler and
> a runtime library. And Greg also asked those two drivers if they have
> matching open-sourced user-space code.
>
> And a final reason is that I thought this can also help in somewhat
> reducing the workload on Greg. I saw in the last kernel summit there
> was a concern about bringing more people to be kernel maintainers so I
> thought this is a step in the right direction.
>
> Oded
