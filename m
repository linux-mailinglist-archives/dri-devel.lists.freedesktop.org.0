Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07E39795E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 19:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6684F6EA9B;
	Tue,  1 Jun 2021 17:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AAC6EA95
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 17:42:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id g204so5493560wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tKi6UKXIxtLQvZnBQM6T1r5SkaEcCfPwBaukLgcFLzg=;
 b=YbHsGbBXGLiClmCpve7jbI0IddhidqoM1NItdiJJnk6RFAlDXYhdFeue2Ifa71mUNO
 DHUgPEKsFQGY2Mp9E5/vaUIFOqDmMnGcLJVfXdQp1PoFFWOFxcDWoeZeZ2V02GjwlqRV
 MZo3A87rTKJ2RXJ1fzbCG7Xgf89DWUbWsfcaX/FRJm2KHnrHaiRjKGcE4njy6L5NSmHF
 yZfXI3jqTIlevNsSjohip/w9altXZA9N0q1kfWrVaSPe7ePGFBMYOc8dtvfmc5Tm4FVO
 heDYJWkW9uZDjbA6wEt9LN78QUho8NRjdNXeRbQtefkNrQg/elVHJu/IDXtx022MlIZ9
 gykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tKi6UKXIxtLQvZnBQM6T1r5SkaEcCfPwBaukLgcFLzg=;
 b=kWw5RvC5QvoXNEmYl40w7pEY/Zm6oAmC4VaDsxmAZbSBF0cUxH/aOTnw/t4BurqjfE
 UUVnvWBfWeJ53i3Gj9rwKz0J71+weygy/UtsLitRG9INfCPdIr1N8tLMFLPNjV1rAKua
 C1DiD61GXxRFADbV+Sx99KPnp7ygLp9pz6+rg/ONggZz53n3tD/KAhhMGSL6w0Zf0GeS
 2CSoqNcJGP6N6Oe0q8Pg3FkG9kEHe1g6r935jnQzdrG0L8bEtsGn811TfFeGCppzb4c7
 49nxbfEGxm0gYG+gx2eerUHnzgP41Sx/PNdtj82tvz5cKghsVSsJXdio74Ri8DHDkNDF
 YAMA==
X-Gm-Message-State: AOAM533M3hd70YktxjSXIr7e4hqVTSiMhTq2roWEH8M8LbVm7DIdCy3n
 wVuqxDt/CMxm7zbSBPKhNfO4KncPuHYqUmZdj80RCQ==
X-Google-Smtp-Source: ABdhPJzlfRSN4CoZNDo1hDkr+7PNwm8HyUUx+FoLXGxJBJgzttyThGCOB+trGfaZeBSYgBL4PoGe+RhCAyIoemBs/98=
X-Received: by 2002:a1c:b782:: with SMTP id h124mr1047150wmf.168.1622569352248; 
 Tue, 01 Jun 2021 10:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <1945baa6-95d4-3f59-0c0e-01ae65033018@daenzer.net>
In-Reply-To: <1945baa6-95d4-3f59-0c0e-01ae65033018@daenzer.net>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 1 Jun 2021 18:42:21 +0100
Message-ID: <CAPj87rMNGZL4oaypFbQ8AuxvMyAFnaffPHXUzT=AkTpssD=H3A@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 1 Jun 2021 at 14:18, Michel D=C3=A4nzer <michel@daenzer.net> wrote:
> On 2021-06-01 2:10 p.m., Christian K=C3=B6nig wrote:
> > Am 01.06.21 um 12:49 schrieb Michel D=C3=A4nzer:
> >> There isn't a choice for Wayland compositors in general, since there c=
an be arbitrary other state which needs to be applied atomically together w=
ith the new buffer. (Though in theory, a compositor might get fancy and spe=
cial-case surface commits which can be handled by waiting on the GPU)

Yeah, this is pretty crucial.

> >> Latency is largely a matter of scheduling in the compositor. The laten=
cy incurred by the compositor shouldn't have to be more than single-digit m=
illiseconds. (I've seen total latency from when the client starts processin=
g a (static) frame to when it starts being scanned out as low as ~6 ms with=
 https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620, lower than ty=
pical with Xorg)
> >
> > Well let me describe it like this:
> >
> > We have an use cases for 144 Hz guaranteed refresh rate. That essential=
ly means that the client application needs to be able to spit out one frame=
/window content every ~6.9ms. That's tough, but doable.
> >
> > When you now add 6ms latency in the compositor that means the client ap=
plication has only .9ms left for it's frame which is basically impossible t=
o do.
>
> You misunderstood me. 6 ms is the lowest possible end-to-end latency from=
 client to scanout, but the client can start as early as it wants/needs to.=
 It's a trade-off between latency and the risk of missing a scanout cycle.

Not quite.

When weston-presentation-shm is reporting is a 6ms delta between when
it started its rendering loop and when the frame was presented to
screen. How w-p-s was run matters a lot, because you can insert an
arbitrary delay in there to simulate client rendering. It also matters
a lot that the client is SHM, because that will result in Mutter doing
glTexImage2D on whatever size the window is, then doing a full GL
compositing pass, so even if it's run with zero delay, 6ms isn't 'the
amount of time it takes Mutter to get a frame to screen', it's
measuring the overhead of a texture upload and full-screen composition
as well.

I'm assuming the 'guaranteed 144Hz' target is a fullscreen GL client,
for which you definitely avoid TexImage2D, and could hopefully
(assuming the client picks a modifier which can be displayed) also
avoid the composition pass in favour of direct scanout from the client
buffer; that would give you a much lower number.

Each compositor has its own heuristics around timing. They all make
their own tradeoff between low latency and fewest dropped frames.
Obviously, the higher your latency, the lower the chance of missing a
deadline. There's a lot of detail in the MR that Michel linked.

Cheers,
Daniel
