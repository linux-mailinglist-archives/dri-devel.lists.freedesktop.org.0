Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947089DFDF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B45D10E148;
	Tue,  9 Apr 2024 15:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5208310E148
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:59:08 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1e3f17c6491so22828845ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712678348; x=1713283148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AaAFxDesLCp1J9HNjP5kNxfAXTppheD2uL+QLjtaWsY=;
 b=i3L9kxrlSCa47Gsbko46CJOJDQ0xW1KqnzFILesNFmCn8qbjYBayM40WUlbMSowyhy
 IidQzCSDHgl+PmaV/TztWsgRHPNLy+3hBkse4y4lNafnWpSxXx7iD13VGePSzCbjYi14
 aC4L70xIjANWpwTWHJQ2CVKTp1KPu4F7inq9goITJ5JhvOToCbWUFtoM2kye9kOtDbVH
 mWEYV06PhI2KYi3F3Ixr6OiW9hO5dbzIEY2FEOGAhIMLxKup0fN1U18Dhmh6JldhiiHM
 DIGOp/MQvgYMa9lvS1NxNDmgrk1uPsngfOlsmFg4Y/3WZWrn22V03spODjgkxUoMsPeX
 CEAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdeiq6EHteNfMM78P89+uLRWljxsR4D4c5fQNGRokRTTtt8FYUvRiuBv9utKLXFPL1k85Skvo0bilWmHuI2UK/M3FaLJVT/yn26tatU12t
X-Gm-Message-State: AOJu0Yxs0xh9fwP9yXShuf+iaLNcgmGn8u16OeLlEQmAj0HDq1DQPX5O
 R3DJCvkIghMSXv8D3UAmttxqHOkVukdrx3/ZazT+4eEbCgC5bKEeKfqM9Rg4wRLHBR26FmHSFpr
 xzTl8EAdJwe0/i6G2cDEYkgfHENA=
X-Google-Smtp-Source: AGHT+IEoB3gl4csO3v2Yp3hXSGaET+RnrA2EP5yYdzwofOI00wbretEX9XVxg9tqhSnaCcQ3YUvMKRHsLVEF+2Slp70=
X-Received: by 2002:a17:903:240b:b0:1e3:e257:2c8d with SMTP id
 e11-20020a170903240b00b001e3e2572c8dmr182741plo.11.1712678347692; Tue, 09 Apr
 2024 08:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240408185520.1550865-1-namhyung@kernel.org>
 <20240408185520.1550865-2-namhyung@kernel.org>
 <874jcb9etk.fsf@intel.com> <ZhTwPLliHXKPAJUQ@gmail.com>
 <87pluy972m.fsf@intel.com>
In-Reply-To: <87pluy972m.fsf@intel.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 9 Apr 2024 08:58:55 -0700
Message-ID: <CAM9d7cizO8j3tLjxiVKh4qw3dOzqKmUKZg8BZwaCF=ChmbX81A@mail.gmail.com>
Subject: Re: [PATCH 1/9] tools/include: Sync uapi/drm/i915_drm.h with the
 kernel sources
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>, 
 Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
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

Hello,

On Tue, Apr 9, 2024 at 3:14=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:
>
> On Tue, 09 Apr 2024, Ingo Molnar <mingo@kernel.org> wrote:
> > * Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> >> On Mon, 08 Apr 2024, Namhyung Kim <namhyung@kernel.org> wrote:
> >> > To pick up changes from:
> >> >
> >> >    b112364867499 ("drm/i915: Add GuC submission interface version qu=
ery")
> >> >    5cf0fbf763741 ("drm/i915: Add some boring kerneldoc")
> >> >
> >> > This should be used to beautify DRM syscall arguments and it address=
es
> >> > these tools/perf build warnings:
> >> >
> >> >   Warning: Kernel ABI header differences:
> >> >     diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_=
drm.h
> >>
> >> All these years and I never realized there are header copies
> >> there. But... why copies?
> >
> > It's better than all the alternatives we tried so far:
> >
> >  - Symbolic links and direct #includes: this was the original approach =
but
> >    was pushed back on from the kernel side, when tooling modified the
> >    headers and broke them accidentally for kernel builds.
> >
> >  - Duplicate self-defined ABI headers like glibc: double the maintenanc=
e
> >    burden, double the chance for mistakes, plus there's no tech-driven
> >    notification mechanism to look at new kernel side changes.
> >
> > What we are doing now is a third option:
> >
> >  - A software-enforced copy-on-write mechanism of kernel headers to
> >    tooling, driven by non-fatal warnings on the tooling side build when
> >    kernel headers get modified:
> >
> >     Warning: Kernel ABI header differences:
> >       diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_d=
rm.h
> >       diff -u tools/include/uapi/linux/fs.h include/uapi/linux/fs.h
> >       diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
> >       ...
> >
> >    The tooling policy is to always pick up the kernel side headers as-i=
s,
> >    and integate them into the tooling build. The warnings above serve a=
s a
> >    notification to tooling maintainers that there's changes on the kern=
el
> >    side.
> >
> > We've been using this for many years now, and it might seem hacky, but
> > works surprisingly well.
> >
> > Does this make sense to you?
>
> Yes, although there are probably pieces of the puzzle I'm missing.
> Thanks for the explanation! (That might work almost as-is copied to
> tools/include/uapi/README. ;)
>
> It's also kind of funny to find this kind of back alleys of the kernel
> repo I've never wandered to before.

I have some explanation in the cover letter of the series but I forgot
to mention that in each commit message.  Probably I can update the
explanation with Ingo's reply.

Thanks,
Namhyung
