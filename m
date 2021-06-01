Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D6397336
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC286EA46;
	Tue,  1 Jun 2021 12:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C476EA4A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 12:30:21 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso13946285otu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9CVuECGP+ngG8kCpf9iHMJirwaI/jhJpxfFXjok8z+0=;
 b=RbswaBKEeVFsooJg0a8OXXcvU52yjfK4dXMrbcR+0rSmushymIlH1OjTLkR1zPQDuF
 Eq5rY8Rg4bF3M+hqzYtA9KGwRF0m+ACW8SoNtcft3hbBZYxBZK0Qy/yJI6O9PPTftyma
 uQemfssuD/18IKTTqgWLdwvU8+O/GIUqXKf74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9CVuECGP+ngG8kCpf9iHMJirwaI/jhJpxfFXjok8z+0=;
 b=NBtb6JB64SVUe3jA/Zychefucb8A8kJAxhPsh0XVHobX7a/UVQQK0AcbMz+1hcMlcm
 eumKJomAaohVtJjysrxY/7dlHzWBtuADeD0f4MuCMj/cSuJEhdImR/B6VXawRqsNujQ5
 1/FAUN3bc4jIEYIYj3E2VFRBU08YTG3nTiWYp7TBieu5BC2yvmp4VDaj8o+rJGcQeX9M
 Na1RV1cpTSYW6X4kCzqlBjptlHLzgxgGelLZd4KZ/1K8w0ronDUVD793KN/52Qcp6UGQ
 TRCWLWlsEBh9q+Hpe5feIT+YFtwQmUmAKbVkajCTzc9wjQIxh4M9d7VLY/CHps8BpN63
 /f4A==
X-Gm-Message-State: AOAM533CfwnzyPv2ND5IjiLx2+KZLkWFFVgfwTYiOheB5NlpTwCQJrSw
 qhG7sBBYbYH1CBVXBRHyn6Nni58AUYfipkf4QcLDV3m/B8s=
X-Google-Smtp-Source: ABdhPJyJ13SFeNB0xu3oxmcu2eXE4PCYdARS26/VhNEKtWYZcNyRRLf7cmmJtolQBRGJ7hvmZ4x5LzAD3JBGs4UCf3c=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr21098200otq.303.1622550620634; 
 Tue, 01 Jun 2021 05:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
In-Reply-To: <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 1 Jun 2021 14:30:09 +0200
Message-ID: <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 1, 2021 at 2:10 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 01.06.21 um 12:49 schrieb Michel D=C3=A4nzer:
> > On 2021-06-01 12:21 p.m., Christian K=C3=B6nig wrote:
> >> Am 01.06.21 um 11:02 schrieb Michel D=C3=A4nzer:
> >>> On 2021-05-27 11:51 p.m., Marek Ol=C5=A1=C3=A1k wrote:
> >>>> 3) Compositors (and other privileged processes, and display flipping=
) can't trust imported/exported fences. They need a timeout recovery mechan=
ism from the beginning, and the following are some possible solutions to ti=
meouts:
> >>>>
> >>>> a) use a CPU wait with a small absolute timeout, and display the pre=
vious content on timeout
> >>>> b) use a GPU wait with a small absolute timeout, and conditional ren=
dering will choose between the latest content (if signalled) and previous c=
ontent (if timed out)
> >>>>
> >>>> The result would be that the desktop can run close to 60 fps even if=
 an app runs at 1 fps.
> >>> FWIW, this is working with
> >>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 , even wi=
th implicit sync (on current Intel GPUs; amdgpu/radeonsi would need to prov=
ide the same dma-buf poll semantics as other drivers and high priority GFX =
contexts via EGL_IMG_context_priority which can preempt lower priority ones=
).
> >> Yeah, that is really nice to have.
> >>
> >> One question is if you wait on the CPU or the GPU for the new surface =
to become available?
> > It's based on polling dma-buf fds, i.e. CPU.
> >
> >> The former is a bit bad for latency and power management.
> > There isn't a choice for Wayland compositors in general, since there ca=
n be arbitrary other state which needs to be applied atomically together wi=
th the new buffer. (Though in theory, a compositor might get fancy and spec=
ial-case surface commits which can be handled by waiting on the GPU)
> >
> > Latency is largely a matter of scheduling in the compositor. The latenc=
y incurred by the compositor shouldn't have to be more than single-digit mi=
lliseconds. (I've seen total latency from when the client starts processing=
 a (static) frame to when it starts being scanned out as low as ~6 ms with =
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620, lower than typ=
ical with Xorg)
>
> Well let me describe it like this:
>
> We have an use cases for 144 Hz guaranteed refresh rate. That
> essentially means that the client application needs to be able to spit
> out one frame/window content every ~6.9ms. That's tough, but doable.
>
> When you now add 6ms latency in the compositor that means the client
> application has only .9ms left for it's frame which is basically
> impossible to do.
>
> See for the user fences handling the display engine will learn to read
> sequence numbers from memory and decide on it's own if the old frame or
> the new one is scanned out. To get the latency there as low as possible.

This won't work with implicit sync at all.

If you want to enable this use-case with driver magic and without the
compositor being aware of what's going on, the solution is EGLStreams.
Not sure we want to go there, but it's definitely a lot more feasible
than trying to stuff eglstreams semantics into dma-buf implicit
fencing support in a desperate attempt to not change compositors.

I still think the most reasonable approach here is that we wrap a
dma_fence compat layer/mode over new hw for existing
userspace/compositors. And then enable userspace memory fences and the
fancy new features those allow with a new model that's built for them.
Also even with dma_fence we could implement your model of staying with
the previous buffer (or an older buffer at that's already rendered),
but it needs explicit involvement of the compositor. At least without
adding eglstreams fd to the kernel and wiring up all the relevant
extensions.
-Daniel

> >> Another question is if that is sufficient as security for the display =
server or if we need further handling down the road? I mean essentially we =
are moving the reliability problem into the display server.
> > Good question. This should generally protect the display server from fr=
eezing due to client fences never signalling, but there might still be corn=
er cases.
> >
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
