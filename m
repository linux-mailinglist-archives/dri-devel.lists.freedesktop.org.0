Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFB33D91C4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7156E5D1;
	Wed, 28 Jul 2021 15:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C761E6E5D1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 15:23:23 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d8so3045149wrm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gIJl6heK4Wu8LD+136XTBtnsYW2mvJjQU/D8Ms2H3as=;
 b=jmPs1tCUkBSl0nSXYR6gPia9DTZUsUuK6WuNawtSRaBMCEBxyDs7+QabJIoXdqZq/U
 ipyFUCHAbYE4ejN18peJE6bLtQ2Bi5RNYl8nKS6Tjj97CkA062FBKEmfWjDqKQgYK9EN
 3fZGAPjbfgcEnTQ2Ujrt4z3pi69aXGmnmeFMWo2wJdXup9LLrxLbA9G20eikcAjxV+Zm
 av3H6Os8s+gr10pPR3+ISY5lhp9rY5uSyGZCWkWk9iyUoOQiaflz7mC6JcfImucPIXmd
 fuYSCACdcYk3G4rFYcy0vppFGoGuG7uFFuQT+OruTr/oXEunbEXPHUXYUFT6vnnfcMUG
 HPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gIJl6heK4Wu8LD+136XTBtnsYW2mvJjQU/D8Ms2H3as=;
 b=K9chrtBqAvjJ7fPInxqn1Or1TnkfEZWkzbk267SX/BboEqkJt+HrRQ2xerR1QcmxGm
 L79jY158aoU/w9DQZpvzjZE70jwUZ+NIluueemCLfxgJ3WErBNwdOq5AftX8J7GXkpib
 utP8U6JGicVVHKkbxTrMJuQRF6BiMyrVdbg5sBiM6TVVvcNqXu2VSdXPFKpxOSWAEPjK
 r0Amith6ngPfKnyx/h7PZCf6A0+RhDfNEPuD+IT1jY13IDLcOZ8ymtyVLYw9mznYMv98
 kVHnZdrDqXC2Bc74fSmDI630Vq5z08QTUDr3z5k8cWC6kefIC4J/wSr+w4EahP5P2lNh
 bEdA==
X-Gm-Message-State: AOAM5311qtJOonIRZDYPhpmrEkApyvNyoMcHFPCrymwuou24DAuZkqli
 MlLtlx+EZQwDMBI2O9Yyxs93xcmuLPpnVgPXWkQ=
X-Google-Smtp-Source: ABdhPJztwMYMMPn6WPsHQkFz9OCw5D0yFU47cnfG0RLy4751ge1lVIRHbL2Nmyofslpb5wRcwFRa181hDEG1sC6o0cs=
X-Received: by 2002:adf:ea41:: with SMTP id j1mr17628736wrn.147.1627485802309; 
 Wed, 28 Jul 2021 08:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
In-Reply-To: <20210728165700.38c39cf8@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Jul 2021 08:27:31 -0700
Message-ID: <CAF6AEGs_tG4A=_gs7KLB0WeWQq8xyJuiY2CmRkXHnN7iyhUCqQ@mail.gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 6:57 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Wed, 28 Jul 2021 15:31:41 +0200
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>
> > Am 28.07.21 um 15:24 schrieb Michel D=C3=A4nzer:
> > > On 2021-07-28 3:13 p.m., Christian K=C3=B6nig wrote:
> > >> Am 28.07.21 um 15:08 schrieb Michel D=C3=A4nzer:
> > >>> On 2021-07-28 1:36 p.m., Christian K=C3=B6nig wrote:
>
> > >>>> At least AMD hardware is already capable of flipping frames on GPU=
 events like finishing rendering (or uploading etc).
> > >>>>
> > >>>> By waiting in userspace on the CPU before send the frame to the ha=
rdware you are completely killing of such features.
> > >>>>
> > >>>> For composing use cases that makes sense, but certainly not for fu=
ll screen applications as far as I can see.
> > >>> Even for fullscreen, the current KMS API only allows queuing a sing=
le page flip per CRTC, with no way to cancel or otherwise modify it. Theref=
ore, a Wayland compositor has to set a deadline for the next refresh cycle,=
 and when the deadline passes, it has to select the best buffer available f=
or the fullscreen surface. To make sure the flip will not miss the next ref=
resh cycle, the compositor has to pick an idle buffer. If it picks a non-id=
le buffer, and the pending rendering does not finish in time for vertical b=
lank, the flip will be delayed by at least one refresh cycle, which results=
 in visible stuttering.
> > >>>
> > >>> (Until the deadline passes, the Wayland compositor can't even know =
if a previously fullscreen surface will still be fullscreen for the next re=
fresh cycle)
> > >> Well then let's extend the KMS API instead of hacking together worka=
rounds in userspace.
> > > That's indeed a possible solution for the fullscreen / direct scanout=
 case.
> > >
> > > Not for the general compositing case though, since a compositor does =
not want to composite multiple output frames per display refresh cycle, so =
it has to make sure the one frame hits the target.
> >
> > Yeah, that's true as well.
> >
> > At least as long as nobody invents a mechanism to do this decision on
> > the GPU instead.
>
> That would mean putting the whole window manager into the GPU.
>

Hmm, seems like we could come up with a way for a shader to figure out
if a fence has signaled or not on the GPU, and then either sample from
the current or previous window surface?

BR,
-R
