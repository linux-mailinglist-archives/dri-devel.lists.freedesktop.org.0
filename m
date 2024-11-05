Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D999BD3D0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 18:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DE910E418;
	Tue,  5 Nov 2024 17:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kK85pBkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4B110E418
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 17:56:35 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6ea7c9226bbso34578377b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 09:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730829394; x=1731434194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ov/f9wodCdcoHX6CtnPdt9zj/r382pau+gNNBIGmZj0=;
 b=kK85pBkmd3zLt+peDcSP/U7Umyp8mtWCPUbEDbra2w82Y3rSG1jNcQGleWrRYF4awE
 PHujjmvXzYVcU+bfTJxyEZxqSl003auR6mp1O6CiReNRuTkT3tOaQOiMjeIKjiFwg0Ad
 Eg3yPnDKqXTJFfma1IcaCLQkgeELT4NVbW1YgshRfYfL9NmcaqnOjSsLcMSAOVSCIQPo
 gIDIgWNqQC8aAqppBjcZge2t09zK7o1nBjvVdGwI5DUJ0kEn7kni9i4h3INFylEtyiKo
 HYcWhD1hb8iQDQi5hOiLWt/Qsmt7ack4nb0qRZ514p3ezztQWuGtQbTXE0QaWlGG/LfR
 mg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730829394; x=1731434194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ov/f9wodCdcoHX6CtnPdt9zj/r382pau+gNNBIGmZj0=;
 b=WGx/LAHrJw+5Ggr2kYd6etXyveDVLRKDfabAwRdRxw4mPkkBcujvHjre967x0NPcbc
 E2vS3Pt5ntwsToXBc6v7q1XduOJlfQ26dKpuRph60GgbbUhz6oqqzPj7+wTTheDnXVTX
 K6Tl3k1Th3bi2bUGh1ZpJ6ncFQMZcJmPofa2wvcnHhmd7JHu2gR2UELKVF+Opv1cqWD1
 jlcBgyzB9GSReeW82WqzUFAxRmUM61Vb2ZzClgmQ2HLyGmGbbrlljJ389M1d6MrTWjR6
 D+HCj5gLDPEPI1SEb+QIFu9GLp5oUk+In0O9Ly0dnQICAs47gvpfI+S1qtajRfgEV+xC
 8NvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUudcUTfpn6XyeMAms1AJSh8mNmvd+U4r/KRZ+KFtqwHW+HJXnGYNvwj7S59fjl+K3oHHp0jkf/R6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeNZ2w5nuhLtT5mFLicxITrCLGXKo4IjpcklTV1j9NJt9ajckw
 aWyNeFDoV0WFa0C33lS8+jjVinXx1V5S/sgQMgucOZlgj5tfquBRZ3pSR/Rb4O9DLSyBU7FDnY4
 qIGtCUAz4sY5xCKc6Iu6i5wicca0=
X-Google-Smtp-Source: AGHT+IHbpu4HwjZGZXhxAwIjzUksgDOJS9GbBH3EafkyWRfgBcFI24N6LWQk2NivLxsyP/a0bgW6sdPzhnvDpEipS/s=
X-Received: by 2002:a05:690c:4711:b0:6e5:ac5f:9c43 with SMTP id
 00721157ae682-6ea3b980f74mr194507837b3.39.1730829394260; Tue, 05 Nov 2024
 09:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20241022161825.228278-1-olvaffe@gmail.com>
 <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
 <CAPaKu7QwSq7a-ipSOdETFEBGMu4J4ud1SqxDfPp8bNMjCMM5RQ@mail.gmail.com>
 <CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com>
 <301110a2-c004-4385-9231-b9354904b5e0@amd.com>
In-Reply-To: <301110a2-c004-4385-9231-b9354904b5e0@amd.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 5 Nov 2024 09:56:22 -0800
Message-ID: <CAPaKu7Tbp1_sd7Eqj7tkWBJBVPSZYo6uYD+7jwP=CwM5YYauFg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: boris.brezillon@collabora.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Chunming Zhou <david1.zhou@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 faith.ekstrand@collabora.com, simona@ffwll.ch
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

On Mon, Nov 4, 2024 at 11:32=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 04.11.24 um 22:32 schrieb Chia-I Wu:
>
> On Tue, Oct 22, 2024 at 10:24=E2=80=AFAM Chia-I Wu <olvaffe@gmail.com> wr=
ote:
>
> On Tue, Oct 22, 2024 at 9:53=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
>
> Am 22.10.24 um 18:18 schrieb Chia-I Wu:
>
> Userspace might poll a syncobj with the query ioctl.  Call
> dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
> true in finite time.
>
> Wait a second, just querying the fence status is absolutely not
> guaranteed to return true in finite time. That is well documented on the
> dma_fence() object.
>
> When you want to poll on signaling from userspace you really need to
> call poll or the wait IOCTL with a zero timeout. That will also return
> immediately but should enable signaling while doing that.
>
> So just querying the status should absolutely *not* enable signaling.
> That's an intentional separation.
>
> I think it depends on what semantics DRM_IOCTL_SYNCOBJ_QUERY should have.
>
>
> Well that's what I pointed out. The behavior of the QUERY IOCTL is based =
on the behavior of the dma_fence and the later is documented to do exactly =
what it currently does.
>
> If DRM_IOCTL_SYNCOBJ_QUERY is mainly for vulkan timeline semaphores,
> it is a bit heavy if userspace has to do a
> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT before a query.
>
>
> Maybe you misunderstood me, you *only* have to call DRM_IOCTL_SYNCOBJ_TIM=
ELINE_WAIT and *not* _QUERY.
>
> The underlying dma_fence_wait_timeout() function is extra optimized so th=
at zero timeout has only minimal overhead.
>
> This overhead is actually lower than _QUERY because that one actually que=
ries the driver for the current status while _WAIT just assumes that the dr=
iver will signal the fence when ready from an interrupt.

The context here is that vkGetSemaphoreCounterValue calls QUERY to get
the timeline value.  WAIT does not replace QUERY.

Taking a step back, in the binary (singled/unsignaled) case, a WAIT
with zero timeout can get the up-to-date status.  But in the timeline
case, there is no direct way to get the up-to-date status if QUERY
must strictly be a wrapper for dma_fence_is_signaled.  It comes back
to what was QUERY designed for and can we change it?


>
> I filed a Mesa issue,
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094, and Faith
> suggested a kernel-side fix as well.  Should we reconsider this?
>
>
> Wait a second, you might have an even bigger misconception here. The diff=
erence between waiting and querying is usually intentional!
>
> This is done so that for example on mobile devices you don't need to enab=
le device interrupts, but rather query in defined intervals.
>
> This is a very common design pattern and while I don't know the wording o=
f the Vulkan timeline extension it's quite likely that this is the intended=
 use case.
Yeah, there are Vulkan CTS tests that query timeline semaphores
repeatedly for progress.  Those tests can fail because mesa translates
the queries directly to the QUERY ioctl.

As things are, enable_signaling is a requirement to query up-to-date
status no matter the syncobj is binary or a timeline.  Whether
enable_signaling enables interrupts or not depends on how the specific
fences are implemented.


>
> Regards,
> Christian.
