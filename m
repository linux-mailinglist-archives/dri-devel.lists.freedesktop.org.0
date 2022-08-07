Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80F58BCA8
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 21:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B03610E1A0;
	Sun,  7 Aug 2022 19:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F0F10E0ED;
 Sun,  7 Aug 2022 19:09:42 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id r5so5593941iod.10;
 Sun, 07 Aug 2022 12:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=mL5GgcWfstWeGYJhJ68nNeLCVdUqveKpU3sfQrU4jS8=;
 b=dvGrmV5h9eO2wJVSL0XJhv1Gt/WJj0w//G0Gg6m1x9dhjd2Q8sgsgXxLilTvQN8kxr
 h6CR9GvgcqTRcdkfBgffcRaIH/mUkuoagRRMaMIoJjUK28IcYqSO4/je/HSI+etgG/w6
 coSfq8qxu+SHXlikM01+KZPY5AeJFgKaYfbCOuwMAd32iCOCxnRzU+woX4yklkY56Zv+
 T1+zdls2pLhfKINUz+g2kRI8IAgQslnLcPdll1vXs+QDV3IYbkNuthh6VkfKbfJ61eNt
 gCblRM3ng5kDS398+lAO461ZV/3nOe6RIVogM37JCukLRUorWdrIKXKsM3jcZBMFgflG
 gMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=mL5GgcWfstWeGYJhJ68nNeLCVdUqveKpU3sfQrU4jS8=;
 b=zvECqRLmwA/KBl1ggM9iwSH46rOWEheD3h7HLJfIITP7Y+AcQgV4ZXEKR1U+FLqzS4
 MQvep/qTcicXBhrYE92s9rK/nGNSEp8zm/nRJVdlfGoMng5dLPS/a/h4NcSvxhjFjp8z
 NKc/15hNVqf7yi54Cvpb2YAd712xnhRpQPI4ug0TWyS6hnHoBcCo3ojmCn/uhAmWj9zK
 IoPZ43aiVNijjHpiAhomDPQazjhZkiIuebJLuX583TwBl9X/TOfCc2lguJXw1h8ZQwU2
 TJWIRi58NyBDnWrYSK2YcQEt/dPs29X6F3PQ/j38T/fNLWG/Q6YrbWw+uLcmLffL3CE5
 Z+IA==
X-Gm-Message-State: ACgBeo2mZulCHg1Q3stDDDJ49zPmBjNdqHaWm1cnjB9TcCsSJNEkGx1+
 y50wlGGPB7NlQ4jR+geAEiTKGn0rFJhFeLntf6AyFllV/6Q=
X-Google-Smtp-Source: AA6agR4/h1SXw70tF50lChS9ED9MW5RLqXWMAX8bbOCiqDbjN0hp6NCcgS07c7xUttCKzfkifIBj3euZP66AmPA80ww=
X-Received: by 2002:a05:6638:2642:b0:33f:5172:e77 with SMTP id
 n2-20020a056638264200b0033f51720e77mr6852089jat.85.1659899382051; Sun, 07 Aug
 2022 12:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
 <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
 <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com>
 <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
 <2fc74efe-220f-b57a-e804-7d2b3880d14f@gmail.com>
 <CAF6AEGv9H+fSFKPNqwPxYUjkgj05AimpXbp-p_JL8nKLnzON=w@mail.gmail.com>
 <e2423bd7-ef73-8d43-c661-a19c80ad1a26@gmail.com>
In-Reply-To: <e2423bd7-ef73-8d43-c661-a19c80ad1a26@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 7 Aug 2022 12:10:08 -0700
Message-ID: <CAF6AEGsoYaXe2+qug_TfT99KXuXh9Ez2L2HjQZroE6c6GSW4SQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 7, 2022 at 11:05 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 07.08.22 um 19:56 schrieb Rob Clark:
> > On Sun, Aug 7, 2022 at 10:38 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> [SNIP]
> >> And exactly that was declared completely illegal the last time it came
> >> up on the mailing list.
> >>
> >> Daniel implemented a whole bunch of patches into the DMA-buf layer to
> >> make it impossible for KVM to do this.
> > This issue isn't really with KVM, it is not making any CPU mappings
> > itself.  KVM is just making the pages available to the guest.
>
> Well I can only repeat myself: This is strictly illegal.
>
> Please try this approach with CONFIG_DMABUF_DEBUG set. I'm pretty sure
> you will immediately run into a crash.
>
> See this here as well
> https://elixir.bootlin.com/linux/v5.19/source/drivers/dma-buf/dma-buf.c#L=
653
>
> Daniel intentionally added code to mangle the page pointers to make it
> impossible for KVM to do this.

I don't believe KVM is using the sg table, so this isn't going to stop
anything ;-)

> If the virtio/virtgpu UAPI was build around the idea that this is
> possible then it is most likely fundamental broken.

How else can you envision mmap'ing to guest userspace working?  The
guest kernel is the one that controls the guest userspace pagetables,
not the host kernel.  I guess your complaint is about VMs in general,
but unfortunately I don't think you'll convince the rest of the
industry to abandon VMs ;-)

But more seriously, let's take a step back here.. what scenarios are
you seeing this being problematic for?  Then we can see how to come up
with solutions.  The current situation of host userspace VMM just
guessing isn't great.  And sticking our heads in the sand and
pretending VMs don't exist isn't great.  So what can we do?  I can
instead add a msm ioctl to return this info and solve the problem even
more narrowly for a single platform.  But then the problem still
remains on other platforms.

Slightly implicit in this is that mapping dma-bufs to the guest won't
work for anything that requires DMA_BUF_IOCTL_SYNC for coherency.. we
could add a possible return value for DMA_BUF_INFO_VM_PROT indicating
that the buffer does not support mapping to guest or CPU access
without DMA_BUF_IOCTL_SYNC.  Then at least the VMM can fail gracefully
instead of subtly.

BR,
-R
