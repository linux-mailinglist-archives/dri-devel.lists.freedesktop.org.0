Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3844FBB0
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 22:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E6F6E088;
	Sun, 14 Nov 2021 21:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE846E088
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 21:00:56 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v11so62692541edc.9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 13:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VLydiT80fkzm1nSBPnsz/oh91R9+RWCWhLY9vbO/POc=;
 b=HremuCy+b4/gXnq04jxWJOwd+GtHq4kDaqtxzuqZ6yoo2e6E0mh8//7cnW08QrZiYw
 mXsDxvvWGNseMbnktMAxQt9Bta9YvNDFFKgmTNO7+zwpmhkUwdulkayrnL1G94UWxmjO
 lD8KNcl1KesfISQbLm31YKTDMiveW4G9F7J6atWnA2PPezgNwphGLpTGHNxCNK6WLD4t
 ko+WifWaEqPh3E3LhZEt/SAKwgnfCByI2d5HqsP9KbL0jfaSx9GicFWsP+MCkL417aal
 kXMT720ZoEZ3TuTMu7i/yAmgAuZ51m+Kjthtv1CApwjbaAb4wtFbiVtPWT2qcrDsxdyP
 V8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VLydiT80fkzm1nSBPnsz/oh91R9+RWCWhLY9vbO/POc=;
 b=WuYRGfxWeeBNRCmn06iqtDQ1Fdy49QjDmMxZe+WhLwM4AamIdZCgHISSc05O9FOZ6w
 R/lTtf45dQUBGcTG5hBLPx/E6Xbz17sBi5WtFzYJeFcV6lI3hekavRw7gp4NIMqjWLJa
 Leh7LpiG4KcSzZhtMM7ELDZztKu1DZIlNfYA28+xHx6PLPRtqnLUkgNh2l5oQxgATUCy
 OwR2FOSjexp+Cq/wV8QZAWkRHaCXEbGXCXGrTLlmuKvbj5Rmsqvp5YI4dVbgu8cU2JP9
 Os5KRrjsdDxf6asbkEirLupzbv5RMq21bgOb388fqbA70iwpNV23kEypz09uq5b+MGQv
 RVhA==
X-Gm-Message-State: AOAM530vqor5JQcSjb32qWTuboAvOt38zuPMcL5+FXBqUDuI8glxx70G
 ZwHkadPmzxQLcAPcLX7MZekejEzUDRORbLwREl8=
X-Google-Smtp-Source: ABdhPJzc0w601CEdSXYexgtN/EWynGjvsNEqRo7PjVsoHtwd3a61oAD0Q2tHz+1U6Bx6o7qDQ8XPzxzD7Zv0T4bjxN0=
X-Received: by 2002:a17:906:5d06:: with SMTP id
 g6mr42995465ejt.3.1636923655147; 
 Sun, 14 Nov 2021 13:00:55 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txVydO1fy8sEwVXRZF0zPfWwLYrk-UnGeKhRCEvrW4B7Q@mail.gmail.com>
 <CAHk-=wiZdONN=1Er5eN1bYurrWqhXF7LxQszpPia8hvYUOiZWQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiZdONN=1Er5eN1bYurrWqhXF7LxQszpPia8hvYUOiZWQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 15 Nov 2021 07:00:42 +1000
Message-ID: <CAPM=9tw=NTZ-1NbGupgg42gOA1aFKZ2C6wt++q5BxaocaUbmFA@mail.gmail.com>
Subject: Re: [git pull] drm fixes + one missed next for 5.16-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 Nov 2021 at 06:16, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Nov 11, 2021 at 7:25 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > I missed a drm-misc-next pull for the main pull last week. It wasn't
> > that major and isn't the bulk of this at all. This has a bunch of
> > fixes all over, a lot for amdgpu and i915.
>
> Ugh.
>
> The i915 conflict was trivial, but made me aware of that absolutely
> disgusting "wbinvd_on_all_cpus()" hack.
>
> And that thing is much too ugly to survive. I made my merge resolution
> remove that disgusting thing.
>
> That driver is x86-only anyway, so it all seemed completely bogus in
> the first place.
>
> And if there is some actual non-x86 work in progress for i915, then
> that wbinvd_on_all_cpus() needs to be replaced with something proper
> and architecture-neutral anyway, most definitely involving a name
> change, and almost certainly also involving a range for the cache
> writeback.
>
> Because that "create broken macro on other architectures" thing is
> *NOT* acceptable.
>
> And I sincerely hope to the gods that no cache-incoherent i915 mess
> ever makes it out of the x86 world. Incoherent IO was always a
> historical mistake and should never ever happen again, so we should
> not spread that horrific pattern around.

i915 will no longer be x86-64 only in theory, since Intel now produces
PCIe graphics cards using the same hw designs. These shouldn't AFAIK
require the same incoherent architecture, though PCIe unsnooped
transactions are a thing in the real world.

The thing is the same driver needs to build/work for the integrated
and discrete cards, hence this hack, but I'm sure someone can Intel
can do better.

I'll leave it to Daniel to figure out who/how.

Dave.
