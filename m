Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8364506EC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0575B6EC7A;
	Mon, 15 Nov 2021 14:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EAD6EC7A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:29:32 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w1so72946879edd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=0UUMiNTFIKe2uX/Ero+b5gxkPdB4ZNp4W0PHC433LjQ=;
 b=CtfLfjT+krpI3rNBs3m6jKFvdItW0jh32PIhCCJJJ58lns5DKon+y/AGNm1kkm65QB
 aI5lTkbhn76f6tLlmhfSkbot5QS1+vQAPTrbp4KOSNF+9R3aqak9NJILsYRcJUrLaCL/
 amKEtAih/gk1FTJ4ZcicuYqKRgXJyjetXMIqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=0UUMiNTFIKe2uX/Ero+b5gxkPdB4ZNp4W0PHC433LjQ=;
 b=2Hpsec34THjQtsvt33nl0rlN+ZqiZl2axP6cNYpBnZMWlibgCzrSQBAVmtX9GTpPhP
 92++nFQJWkIytDVtVHLY80rtgUYEYlVM10XqZQYBBu+mf5e1Aex+rb+BVDVeS9hwNk1s
 S5aZJsNr0MH5r2AyQkYLu3V2iD1mq6s0k0JXbtz+dWqNVW1fxEBHmpn9Q3OhVXeI5Sch
 i5rzxQaWEQ1aj4/qCbILT8RpcvUO2jrOqMRZqCfaSgXYFsPJYx786OeJkx41yxuckowv
 /5UGLjZyp3F+hkrWj6Z+WPeOI025F+meX+60yQTiRPV3PfrmYiUwc34ruX3QZzmanGvQ
 Jwwg==
X-Gm-Message-State: AOAM531GZNvGMiWowgqX7zCD4P3g8kf8i/6WwzXgFqmmsjS85nMQxSHz
 l0rcgUxBg6B5ZX2B2ylcxVjO2A==
X-Google-Smtp-Source: ABdhPJy7ye2Lcy7XtgIltmNJsEFp9VrxRsZFhHZn733SnYbJbPwuBIUAcRDXvTkI1eolOjbzI0y8qA==
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr55166334edh.318.1636986570621; 
 Mon, 15 Nov 2021 06:29:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s4sm6885990ejn.25.2021.11.15.06.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:29:30 -0800 (PST)
Date: Mon, 15 Nov 2021 15:29:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [git pull] drm fixes + one missed next for 5.16-rc1
Message-ID: <YZJuyJPdrJIc3mP+@phenom.ffwll.local>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <CAPM=9txVydO1fy8sEwVXRZF0zPfWwLYrk-UnGeKhRCEvrW4B7Q@mail.gmail.com>
 <CAHk-=wiZdONN=1Er5eN1bYurrWqhXF7LxQszpPia8hvYUOiZWQ@mail.gmail.com>
 <CAPM=9tw=NTZ-1NbGupgg42gOA1aFKZ2C6wt++q5BxaocaUbmFA@mail.gmail.com>
 <CAHk-=wjpPWyH5ff0LE8Mmt6OEiYbD3LwpvpD==FFZfTMTzL2FQ@mail.gmail.com>
 <1ff1389b-bf4c-cd09-8bfd-d4303d100eee@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ff1389b-bf4c-cd09-8bfd-d4303d100eee@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 08:18:53AM +0100, Thomas Hellström wrote:
> On 11/14/21 22:19, Linus Torvalds wrote:
> > On Sun, Nov 14, 2021 at 1:00 PM Dave Airlie <airlied@gmail.com> wrote:
> > > i915 will no longer be x86-64 only in theory, since Intel now produces
> > > PCIe graphics cards using the same hw designs.
> > Well, at least in my tree, it still has the "depends on X86", along
> > with several other x86-only things (like "select INTEL_GTT", which is
> > also x86-only)

Yeah it's work in progress and 12+ years of x86 pile up high&deep aren't
easy to fix. So please assume the depends on X86 is gone already (and
select INTEL_GTT is optional, it's only needed for igfx older than about 8
years or so), but we can't do that yet because all the build boots would
run out of air screaming so much :-)

> > So by the time that non-x86 theory becomes reality, hopefully the i915
> > people will also have figured out how to do the cache flushing
> > properly.
> > 
> > And hopefully that "do it properly" ends up being simply that the
> > particular configuration that ends up being portable simply doesn't
> > need to do it at all and can statically just not build it,
> > sidestepping the issue entirely.
> > 
> > Fingers crossed.
> 
> For non-x86 / discrete graphics, plan is only coherent mappings, although
> the "Just not build it" part hasn't been properly figured out yet I guess.
> But point taken.

Yeah for non-x86 it'll be standard dma-api all the way down. For x86 that
ship sailed long ago, but also I'm not clear on why we added a new cache
flush primitive for that instead of just continuing to use clflush like
we've done since forever. For x86 integrated gpu we _know_ which cpu is
there, clflush will exist. So any new horrors shouldn't be needed, not
sure why a wbinvd_on_all_cpus slipped in.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
