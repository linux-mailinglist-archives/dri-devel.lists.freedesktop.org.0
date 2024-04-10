Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4152189FB11
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 17:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BAE113406;
	Wed, 10 Apr 2024 15:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sxFIq8fa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDB0113402
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 15:07:28 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso7331640276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712761647; x=1713366447;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLKjsUom385xmd5NMGWlteZq1y2bkkhohjUJrbv4Shg=;
 b=sxFIq8fa89kqxMoUHZsXV6QpDS1MDFLDKB+phNPvJjUWWoy0qzhZjTDZy8FgzjEAZH
 /HB15j9C9QOlHq45Q0oFKPFOltRYCtjpidFN4n53Cfsz9ts2OJS+lGU3wgVtIzLYjD72
 VNV8K/PRnRTuIVquhSw532+d+8gy++GnqxAi8p18/1I1oL1zJvrjvqRqu677PtwpJbmn
 yjNW+l6QQw1pglXjPsf0bCuEh17LoFabV5A4lTLLrh5yXe6aKTJvqXVAcxAEcXVOtlE0
 n8mTVqdn11KJJXNzHIHmI/22Cnkg0F+xfPkASdR0JgjWYo3M1NFuHLyeaVRuHnumBpsd
 w2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712761647; x=1713366447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLKjsUom385xmd5NMGWlteZq1y2bkkhohjUJrbv4Shg=;
 b=f2qHJyCMqlTWfJMYP85Pr/fw8ewmVhVV6f6Eev6LTiBk1LCLWZ/Gvat5X7Uqxtd9cf
 RmEz1CC29vot6vOrRsYbATLppTb43lUnVQ8gJOSgo94v8G5xh8Ts1ZJnfuFFzjc9Gpzm
 9dQOaYXrQuQMtJmhTVuo72RrTYycYOvhB6DQYAtM/emfWHOJtQWGSuOX83iERsrXaXxr
 AxTeH75MTFNyN0xraKx+R4COBogBOfN/J67avniI2N7kYlaHLDPVZk9iJQ4a02XEAl/w
 m5Wua+yeHhPisRVxHCQ1lZs/0Ovw3NPNuLynO6QQR9iGr2SnVzKTDoBp5H+guiO8oISl
 mYfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuoI+04GYwyHm2xi/hIc44vVvs53Z8cvjr09NCeQn+PihPnKn27CKeYMuDHfoHnirdXqzgEzNUFjbmzBEaDcF35X+tU0HYKuAEfQOep6m0
X-Gm-Message-State: AOJu0YzyP/PFMryV05fokUeFCCBMGg5DjkxPZWs0hW/AS1VAqRrLBS/Z
 ver4XmKLRzKU7Q0qegdyXilHs3Y93uqm4WUwOq/GOBiokcYZHZw7ceP5CLxylBEXOEkUsTLGVar
 0GmKlNvTLYY2VrCIbopWN7BmckwQBKhsuFncx
X-Google-Smtp-Source: AGHT+IF7TCK2LqrJgp8hV7cq9+Ry/b6lOirZ5fldgud6E7mUjNo54gC130kLZJeYihDRzjoyYJ8Lubhyj/db/BZNZCo=
X-Received: by 2002:a05:6902:1b83:b0:dd0:c12:411b with SMTP id
 ei3-20020a0569021b8300b00dd00c12411bmr3692287ybb.8.1712761647378; Wed, 10 Apr
 2024 08:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
 <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
 <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com>
 <0df41277-ded5-4a42-9df5-864d2b6646f5@amd.com>
In-Reply-To: <0df41277-ded5-4a42-9df5-864d2b6646f5@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 10 Apr 2024 08:07:15 -0700
Message-ID: <CABdmKX03Of7OE_9PfAy5DWcCwwvQvJGXDjzAE8c4WRrz_0Z_eg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Rong Qianfeng <11065417@vivo.com>, Rong Qianfeng <rongqianfeng@vivo.com>, 
 Jianqun Xu <jay.xu@rock-chips.com>, sumit.semwal@linaro.org, 
 pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch, jason@jlekstrand.net, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
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

On Wed, Apr 10, 2024 at 7:22=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 09.04.24 um 18:37 schrieb T.J. Mercier:
> > On Tue, Apr 9, 2024 at 12:34=E2=80=AFAM Rong Qianfeng <11065417@vivo.co=
m> wrote:
> >>
> >> =E5=9C=A8 2024/4/8 15:58, Christian K=C3=B6nig =E5=86=99=E9=81=93:
> >>> Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
> >>>> [SNIP]
> >>>>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
> >>>>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf wi=
th
> >>>>>> offset and len.
> >>>>> You have not given an use case for this so it is a bit hard to
> >>>>> review. And from the existing use cases I don't see why this should
> >>>>> be necessary.
> >>>>>
> >>>>> Even worse from the existing backend implementation I don't even se=
e
> >>>>> how drivers should be able to fulfill this semantics.
> >>>>>
> >>>>> Please explain further,
> >>>>> Christian.
> >>>> Here is a practical case:
> >>>> The user space can allocate a large chunk of dma-buf for
> >>>> self-management, used as a shared memory pool.
> >>>> Small dma-buf can be allocated from this shared memory pool and
> >>>> released back to it after use, thus improving the speed of dma-buf
> >>>> allocation and release.
> >>>> Additionally, custom functionalities such as memory statistics and
> >>>> boundary checking can be implemented in the user space.
> >>>> Of course, the above-mentioned functionalities require the
> >>>> implementation of a partial cache sync interface.
> >>> Well that is obvious, but where is the code doing that?
> >>>
> >>> You can't send out code without an actual user of it. That will
> >>> obviously be rejected.
> >>>
> >>> Regards,
> >>> Christian.
> >> In fact, we have already used the user-level dma-buf memory pool in th=
e
> >> camera shooting scenario on the phone.
> >>
> >>   From the test results, The execution time of the photo shooting
> >> algorithm has been reduced from 3.8s to 3s.
> >>
> > For phones, the (out of tree) Android version of the system heap has a
> > page pool connected to a shrinker.
>
> Well, it should be obvious but I'm going to repeat it here: Submitting
> kernel patches for our of tree code is a rather *extreme* no-go.
>
Sorry I think my comment led to some confusion. I wasn't suggesting
you should take the patch; it's clearly incomplete. I was pointing out
another option to Rong. It appears Rong is creating a single oversized
dma-buf, and subdividing it in userspace to avoid multiple allocations
for multiple buffers. That would lead to a need for a partial sync of
the buffer from userspace. Instead of that, using a heap with a page
pool gets you kind of the same thing with a lot less headache in
userspace, and no need for partial sync. So I wanted to share that
option, and that can go in just Android if necessary without this
patch.

> That in kernel code *must* have an in kernel user is a number one rule.
>
> When somebody violates this rule he pretty much disqualifying himself as
> reliable source of patches since maintainers then have to assume that
> this person tries to submit code which doesn't have a justification to
> be upstream.
>
> So while this actually looks useful from the technical side as long as
> nobody does an implementation based on an upstream driver I absolutely
> have to reject it from the organizational side.
>
> Regards,
> Christian.
>
> >   That allows you to skip page
> > allocation without fully pinning the memory like you get when
> > allocating a dma-buf that's way larger than necessary. If it's for a
> > camera maybe you need physically contiguous memory, but it's also
> > possible to set that up.
> >
> > https://android.googlesource.com/kernel/common/+/refs/heads/android14-6=
.1/drivers/dma-buf/heaps/system_heap.c#377
> >
> >
> >> To be honest, I didn't understand your concern "...how drivers should =
be
> >> able to fulfill this semantics." Can you please help explain it in mor=
e
> >> detail?
> >>
> >> Thanks,
> >>
> >> Rong Qianfeng.
> >>
> >>>> Thanks
> >>>> Rong Qianfeng.
>
