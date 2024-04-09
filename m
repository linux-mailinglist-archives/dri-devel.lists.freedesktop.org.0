Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420E389E0ED
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8390A112E2B;
	Tue,  9 Apr 2024 17:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MgYtO5Tj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6E4112E2B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 17:00:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E854861939;
 Tue,  9 Apr 2024 17:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36113C433B1;
 Tue,  9 Apr 2024 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712682058;
 bh=4WrtbOs8msag5qvCpx6Nx6EDmYJtha46rksweGE/IUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MgYtO5Tj2EoU/v1AvFrGNp8xJ8FBv7ZUQrP9IrkGf8gFF0Wewc2uyF3jdNxNbApkI
 Cmi45Fh24KdIDPs+RVXnjEc4VHazHSPw0iCqDakt3IMufLEb0ESclkjlkNCZRg9qjG
 x6xl5THoYixhoTQej9s12kSr033vdeKGMpb0ErzR0djdcukweuz63kACjq79TJOg0o
 9RIDZ316Bec+NnDjBJMwWfBxhcwB/H7QB8cv+0lPQ+Hz9xZsFGJnpyDUrgam6eBPXA
 vZklfbulNp0Zc0UoORNPGHZjsefhYZk7OQI5/4rqipKXvYabOAKYBiBg2gWK4YlFYG
 999SQuF2Bw3Qw==
Date: Tue, 9 Apr 2024 14:00:55 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Ian Rogers <irogers@google.com>,
 Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] tools/include: Sync uapi/drm/i915_drm.h with the
 kernel sources
Message-ID: <ZhV0R1lNRrcOYKkV@x1>
References: <20240408185520.1550865-1-namhyung@kernel.org>
 <20240408185520.1550865-2-namhyung@kernel.org>
 <874jcb9etk.fsf@intel.com> <ZhTwPLliHXKPAJUQ@gmail.com>
 <87pluy972m.fsf@intel.com>
 <CAM9d7cizO8j3tLjxiVKh4qw3dOzqKmUKZg8BZwaCF=ChmbX81A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM9d7cizO8j3tLjxiVKh4qw3dOzqKmUKZg8BZwaCF=ChmbX81A@mail.gmail.com>
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

On Tue, Apr 09, 2024 at 08:58:55AM -0700, Namhyung Kim wrote:
> Hello,
> 
> On Tue, Apr 9, 2024 at 3:14 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > On Tue, 09 Apr 2024, Ingo Molnar <mingo@kernel.org> wrote:
> > > * Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > >
> > >> On Mon, 08 Apr 2024, Namhyung Kim <namhyung@kernel.org> wrote:
> > >> > To pick up changes from:
> > >> >
> > >> >    b112364867499 ("drm/i915: Add GuC submission interface version query")
> > >> >    5cf0fbf763741 ("drm/i915: Add some boring kerneldoc")
> > >> >
> > >> > This should be used to beautify DRM syscall arguments and it addresses
> > >> > these tools/perf build warnings:
> > >> >
> > >> >   Warning: Kernel ABI header differences:
> > >> >     diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
> > >>
> > >> All these years and I never realized there are header copies
> > >> there. But... why copies?
> > >
> > > It's better than all the alternatives we tried so far:
> > >
> > >  - Symbolic links and direct #includes: this was the original approach but
> > >    was pushed back on from the kernel side, when tooling modified the
> > >    headers and broke them accidentally for kernel builds.
> > >
> > >  - Duplicate self-defined ABI headers like glibc: double the maintenance
> > >    burden, double the chance for mistakes, plus there's no tech-driven
> > >    notification mechanism to look at new kernel side changes.
> > >
> > > What we are doing now is a third option:
> > >
> > >  - A software-enforced copy-on-write mechanism of kernel headers to
> > >    tooling, driven by non-fatal warnings on the tooling side build when
> > >    kernel headers get modified:
> > >
> > >     Warning: Kernel ABI header differences:
> > >       diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
> > >       diff -u tools/include/uapi/linux/fs.h include/uapi/linux/fs.h
> > >       diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
> > >       ...
> > >
> > >    The tooling policy is to always pick up the kernel side headers as-is,
> > >    and integate them into the tooling build. The warnings above serve as a
> > >    notification to tooling maintainers that there's changes on the kernel
> > >    side.
> > >
> > > We've been using this for many years now, and it might seem hacky, but
> > > works surprisingly well.
> > >
> > > Does this make sense to you?
> >
> > Yes, although there are probably pieces of the puzzle I'm missing.
> > Thanks for the explanation! (That might work almost as-is copied to
> > tools/include/uapi/README. ;)
> >
> > It's also kind of funny to find this kind of back alleys of the kernel
> > repo I've never wandered to before.
> 
> I have some explanation in the cover letter of the series but I forgot
> to mention that in each commit message.  Probably I can update the
> explanation with Ingo's reply.

I think we can combine Ingo's with the reply I used and you adopted and
continue to have it when sending the update messages, probably keep it
in the cover letter (the combined text) and add a link to each
individual update:

"Please see tools/include/README.kernel-copies."

The recommendation that developers shouldn't update the copy seems
important to have there as well.

- Arnaldo
