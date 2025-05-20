Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22F8ABE7AF
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 00:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAB210E672;
	Tue, 20 May 2025 22:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XGDCK/jk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6395710E66D;
 Tue, 20 May 2025 22:56:28 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-85b41281b50so205726339f.3; 
 Tue, 20 May 2025 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747781787; x=1748386587; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfbTmppHxOLXCmtZNJSatt4EkTAJlAlHVYpSJyOZFfg=;
 b=XGDCK/jkVhCljpSz4S/HMujlUklSOiWQksG7fPQx45UMJyuYYhE9J6Mt+FwEV47rSk
 5vhcPgNd/CkHWDSvGMvspTjA3upplxJtu2M3jKBslfgBjjUt/juKGNpXImiBLx/BAKUp
 +oSaqQjR5qO9zJ2XESU0klEb3Oq5DYMm8ppm7fQJYnqlSMwluB1edS3ej9D8dpirnXrO
 qr+x62cxHPLH1GJChsKeT94DV3DEIBlpYQAyOMhJklTGA4zjrHX4o9XTAClpTvdbmcNP
 Ta9EupgSbnJ3YwnbeBokvz/M9M0LeGxA0nJ6e0ow/bbXzHdWL6YTryBP8Ul3994ca1l4
 BnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747781787; x=1748386587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfbTmppHxOLXCmtZNJSatt4EkTAJlAlHVYpSJyOZFfg=;
 b=ooFEFUPhfnIUO4un3bmeXceZdQXpRwx1Xuo7IoqAv0EMZXQ3i8L/j+BaWUWfYORKfR
 4j5KbFkyxz/GWrNq+pkEhN3EL+S22/nTfhKBq165aBwipkK8DZAFhrSTRrT1o/XXk/9s
 OG+pp1Sug0nOxsf1RJbHjhnCGAxqks0gz8YgPCWZH+ZQ3FCGdRRtSPOj+Mgl3DX7gnTe
 myj/OGBehNhzxA48ahRrrIPgirQ2ihO0h+hEtqQxzqi2TEuDNwmR4p0pKON299P6W4vq
 Y4rMP6mo/DMIJpGf92IrxTnX/qPgydtrxi3w6rtbSNESHy36AI5rSR7s+1t4n1dHWrRH
 KOZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLIV8vy+uMLxdzyITBnK01vD+QWOwHsGqxNFlUVKEmJ9FycdkCcpGdeEU2MlsjJopAeO13XN/+k9s3@lists.freedesktop.org,
 AJvYcCVUk8ci/y2uLAw2/ZYz4OJH7eHBLpacGXooNXxPPb85IHd5Zid/vF1mn2RYEkJ/70eAQSHs1155t1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6N6Ks/dqv0uSs+jZdYdSXSVvaSoIv8YrUVBlFSvJfA6eVjNFL
 XAmonfsuCeKXiVyi41AMlDWFyDOSDrYNDU0i2bfEkmeyXNvsqJ2FSc1q3ayIGsYlAgw/eF7ZJYW
 TMSzlhomy55ZCaKYn7GBBhB5RdShz8g8=
X-Gm-Gg: ASbGnctLxhD18Ku9bJv0Sx2OjNpnEgXxWsNbx98hGJZfTEsELa8z1A6dg6JTYrqf3ff
 dH77bg3CsHnT4as0WjjazAGokbpXOjcusJ6y2SF/+3Vu53PaM6MXwyEZzvnBkjJsY2UAJDkgV+T
 wn1MWR5o9QkOeYIsPgZxN2OUpSXGjU/RsKSAp8rbFhKR1x09S7s2rujX25ixvyyett1HrLN6NPk
 lI=
X-Google-Smtp-Source: AGHT+IGOPI/jkR0SE4Ah18tEgrGyD13jj9I35eWxSMfqfHBJtXz1Ptp5VDoU4Ml5gVYvLQqXk4RTcbwN8ZBaSDzk14Q=
X-Received: by 2002:a05:6602:3e82:b0:867:6c90:4867 with SMTP id
 ca18e2360f4ac-86a23256cadmr2998450939f.14.1747781787455; Tue, 20 May 2025
 15:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
 <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
 <aCb-72KH-NrzvGXy@pollux>
 <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
 <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com>
 <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com>
 <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
In-Reply-To: <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 15:56:15 -0700
X-Gm-Features: AX0GCFsoUmkG3s3L14GoLEL15C4sCyP3V1E3Uragg5_xADxJ_pxuus52D_2x7-E
Message-ID: <CAF6AEGvr6-9af9ZyccYF-g56j5-4sHocH+9JPk=cKfgdMTAjLg@mail.gmail.com>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
To: Dave Airlie <airlied@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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

On Tue, May 20, 2025 at 3:31=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Wed, 21 May 2025 at 07:53, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, May 20, 2025 at 2:25=E2=80=AFPM Dave Airlie <airlied@gmail.com>=
 wrote:
> > >
> > > On Sat, 17 May 2025 at 02:20, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > >
> > > > > On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > > > > > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr=
@kernel.org> wrote:
> > > > > > > Anyways, I don't agree with that. Even if you can tweak your =
driver to not run
> > > > > > > into trouble with this, we can't introduce a mode that violat=
es GOUVM's internal
> > > > > > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON=
().
> > > > > > >
> > > > > > > I still don't see a real technical reason why msm can't be re=
worked to follow
> > > > > > > those lifetime rules.
> > > > > >
> > > > > > The basic issue is that (a) it would be really awkward to have =
two
> > > > > > side-by-side VM/VMA management/tracking systems.  But in legacy=
 mode,
> > > > > > we have the opposite direction of reference holding.  (But at t=
he same
> > > > > > time, don't need/use most of the features of gpuvm.)
> > > > >
> > > > > Ok, let's try to move this forward; I see three options (in order=
 of descending
> > > > > preference):
> > > > >
> > > > >   1) Rework the legacy code to properly work with GPUVM.
> > > > >   2) Don't use GPUVM for the legacy mode.
> > > > >   .
> > > > >   .
> > > > >   .
> > > > >   3) Get an ACK from Dave / Sima to implement those workarounds f=
or MSM in
> > > > >      GPUVM.
> > > > >
> > > > > If you go for 3), the code introduced by those two patches should=
 be guarded
> > > > > with a flag that makes it very clear that this is a workaround sp=
ecifically
> > > > > for MSM legacy mode and does not give any guarantees in terms of =
correctness
> > > > > regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.
> > > >
> > > > I'm not even sure how #2 would work, other than just copy/pasta all=
 of
> > > > drm_gpuvm into msm, which doesn't really seem great.
> > > >
> > > > As for #1, even if I could get it to work, it would still be a lot
> > > > more mmu map/unmap (like on every pageflip, vs the current state th=
at
> > > > the vma is kept around until the object is freed).  For the
> > > > non-VM_BIND world, there are advantages to the BO holding the ref t=
o
> > > > the VMA, rather than the other way around.  Even at just a modest
> > > > single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the un=
map
> > > > costs a tlbinv).  So from that standpoint, #3 is the superior optio=
n.
> > > >
> > >
> > > Before we get to #3, I'll need a bit more info here on why you have t=
o
> > > map/unmap the VMA on every pageflip.
> >
> > Previously we'd keep the VMA hanging around until the GEM obj is
> > freed.  But that can't work if the VMA (via the VM_BO) is holding a
> > reference to the GEM obj.
> >
> > I was kinda thinking about keeping the VMA around until the handle is
> > closed.. but that doesn't cover the dma-buf case (ie. when you
> > re-import the dma-buf fd each frame.. I know android does this, unsure
> > about other wsi's).
> >
> > > But actually I think 2 is the best option, I think in nouveau this is
> > > where we ended up, we didn't modify the old submission paths at all
> > > and kept the old bo/vm lifetimes.
> > >
> > > We just added completely new bind/exec ioctls and you can only use on=
e
> > > method once you've opened an fd.
> >
> > hmm, but that means tracking VMAs against a single BO differently..
> > which.. at least seems ugly..
>
> I don't think it is if you already have the code to do that, and just
> add gpuvm support in parallel.
>
> You also have to figure out that the world is moving towards Vulkan
> for everything so any optimisations you've made for particular legacy
> paths will need to be dealt with in the future picture anyways.

fwiw, the case I'm more worried about is the kms vm for scanout, that
won't be using vk

BR,
-R

> But I'd rather not hack gpuvm into being something it isn't, if there
> is a meaningful commonality in legacy bo/vm bindings across drivers,
> we could create something new, but the ref counting and handling is
> pretty fundamental to gpuvm architecture.
>
> There should only be two paths, legacy and gpuvm, and you shouldn't
> ever be mixing them on a particular exec path, since you should only
> have a vm per userspace fd, and can pick which way to use it the first
> time someone calls it.
>
> Dave.
> Dave.
