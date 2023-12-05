Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9011805901
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC5910E57F;
	Tue,  5 Dec 2023 15:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583BC10E599
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:41:42 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5482df11e73so7468927a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701790901; x=1702395701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAoKJ4psFcjVNbAUMsdpr7K2aFVGd9hI1XgWuDzw694=;
 b=hZa0TM+bVNkKg+LArzCadpvbDH3AHMiIW0tKPKc3dvA+ervxT6+TjMB5wi6lh8o4xh
 oITAXJZbm0e9pAGe8Ns3eFRIBRrMdg8IO17HorAry6iJ5MWtA347Vf1GaQiiwo7O5+ny
 DYWuZ8o7mW1i8urynGWFQ6ABGBac3MPU55jpSt6sef/CYZ4sd8v9LqfWmpRVfYgC8L2x
 DFAPwXzggYAYDVaeJCrp5lg61KxXOmNXcelfLQTL+JvuxP4kxpQdSQbMDRs+n5xtWnWV
 RavLrIqc5R9nBpOmhsmwKAH+Q15RWGG2nHNSltSSKTFw5zS0lOKGQ9cs0i3T8J4uZqVM
 x/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701790901; x=1702395701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAoKJ4psFcjVNbAUMsdpr7K2aFVGd9hI1XgWuDzw694=;
 b=m87oep2we8iNRQQuIS2vCKbafHuAbu+zQ0dAzfPH5xqPXnvKJ+6IkkQ6IICoKwEups
 KOff47rhs3XAApzn0jjuiPezc8yz71X8WTP9UkH0swVOkmK6Pm/tI0Qhh6JlEfKC5luC
 PlAwfHGJZxcpslBKXCLWQg8tNfeIAObCQHGlH10AOLSW0BivIApMKagUCQlIK17h6mLh
 gRAAZCr4FaR1XmymysG/hxSvK9varLch6vFvQ6rfT1jnfE1fO2pSIjEst3M9tHwysYoD
 d7/f7m5Xu3w1ln0HBLx/dBpHcWy0rwvYMafQyOj/xh89066ppt2JlExV8i+jDEb5Onky
 2ITw==
X-Gm-Message-State: AOJu0YxvIyaWTRIcCLtkMcQH0YxSx9y1CAq4sLVS7MgnthEsUSKt1nC2
 c19OYFd72++j2zn7cM9W0coS1xv8NtuvOIrefEE=
X-Google-Smtp-Source: AGHT+IFvLDxUTjJzbdwumJSp5LkZc8AHSFgJ97zk7pTSy9rQCh4aUfX+yyZdXl8wOadp6BFbyKQzkAKuDXs3aKp15s8=
X-Received: by 2002:a50:d5cd:0:b0:54c:4837:9a9e with SMTP id
 g13-20020a50d5cd000000b0054c48379a9emr4921654edj.69.1701790900478; Tue, 05
 Dec 2023 07:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20230322224403.35742-1-robdclark@gmail.com>
 <b9fb81f1-ac9e-cf3f-5cf4-f2d972d3ed3d@amd.com>
 <CAF6AEGvMwZCLntfYeH3Vg_Z7kYynqdVrinp+pmcbREksK1WGMA@mail.gmail.com>
 <e2fa296b-9b71-a41b-d37d-33f0fac2cd4e@amd.com>
 <CAF6AEGvdVca_mnZVo9He9oKVfYp84e_kOPWaxX+K5aV4Es9kcQ@mail.gmail.com>
 <CAF6AEGt2D6Ei6OkUK5osz+jWzmkX8tmB1KGi305HaNd=bnQSoA@mail.gmail.com>
 <69d66b9e-5810-4844-a53f-08b7fd8eeccf@amd.com>
In-Reply-To: <69d66b9e-5810-4844-a53f-08b7fd8eeccf@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 5 Dec 2023 07:41:28 -0800
Message-ID: <CAF6AEGuSexYVL2RF4yVCJptfJgN9vvTgzGWn3CminbsYvctTaw@mail.gmail.com>
Subject: Re: [RFC] drm/scheduler: Unwrap job dependencies
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 4, 2023 at 10:46=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 04.12.23 um 22:54 schrieb Rob Clark:
> > On Thu, Mar 23, 2023 at 2:30=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> >> [SNIP]
> > So, this patch turns out to blow up spectacularly with dma_fence
> > refcnt underflows when I enable DRIVER_SYNCOBJ_TIMELINE .. I think,
> > because it starts unwrapping fence chains, possibly in parallel with
> > fence signaling on the retire path.  Is it supposed to be permissible
> > to unwrap a fence chain concurrently?
>
> The DMA-fence chain object and helper functions were designed so that
> concurrent accesses to all elements are always possible.
>
> See dma_fence_chain_walk() and dma_fence_chain_get_prev() for example.
> dma_fence_chain_walk() starts with a reference to the current fence (the
> anchor of the walk) and tries to grab an up to date reference on the
> previous fence in the chain. Only after that reference is successfully
> acquired we drop the reference to the anchor where we started.
>
> Same for dma_fence_array_first(), dma_fence_array_next(). Here we hold a
> reference to the array which in turn holds references to each fence
> inside the array until it is destroyed itself.
>
> When this blows up we have somehow mixed up the references somewhere.

That's what it looked like to me, but wanted to make sure I wasn't
overlooking something subtle.  And in this case, the fence actually
should be the syncobj timeline point fence, not the fence chain.
Virtgpu has essentially the same logic (there we really do want to
unwrap fences so we can pass host fences back to host rather than
waiting in guest), I'm not sure if it would blow up in the same way.

BR,
-R

> Regards,
> Christian.
>
> >
> > BR,
> > -R
