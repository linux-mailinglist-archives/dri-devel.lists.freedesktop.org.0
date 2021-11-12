Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364644EDCA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 21:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D722E6E084;
	Fri, 12 Nov 2021 20:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779806E084
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 20:16:38 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b15so42071125edd.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ln4RXyBHR8doDkTvzPRGiuinGe7jyzb0IrpoLwi8jaI=;
 b=NI9uAcinaqpmJx5ILSYb8lXr26e0VJqphVU5LVvNQTyPCe/3VDYqvtuqe+/DyAePMH
 CQZD+o3avI3ug403ryG6GwE0OgouZXhed9c2/svOy5d3J0x/doML+D3z48oU2DmlaBAJ
 L9bpQDojkBXy1zxmyGS4uEKJR7MtcKtD5/luM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ln4RXyBHR8doDkTvzPRGiuinGe7jyzb0IrpoLwi8jaI=;
 b=TU6gGm5awFOozl4J+egIRqmd/stmPCmtH/6O+3MISuOpDHke2UXYgkVgNovIqupm15
 D4pxMn7hYoZF+T9qwqhcWZU7hoQmYgW1Ntc71yjNhIDYgHyIHAgR059Fyp3FfWHJMGmK
 GvH7IzdYJe9DNrLnicOFmV4qBb6rUTEFwDhz9FT6OvRBBvYL0oaW0IiAzziW5CSGtHhP
 UCkL0b24XFD/FMtGdCtHxinVoFcjBw1iSTXVy8Y8U9GAAf3Vj/jwh2M5JofRO4qzDre7
 AmdqyaX+cNCgaV/gJBe0HqDE42uqxsmV3pgswKJjUtSMTB2ajoxgXTeVU5xGLDfVUDI7
 7mZQ==
X-Gm-Message-State: AOAM5334ftHLs8Lg7mto822TJ8fGCY0kRyrC785FMNue/NP0OhZMYzc7
 Bh8+QgaRvAjtCNjnCsBWanLAiXA0uWbjpPFa7vk=
X-Google-Smtp-Source: ABdhPJxXy7Vj+1t0ej0JUXpQ6kF4svXcJGoNdATE8NDLvalNyE2kWRYe6CkeOKjC6Vg0USV/Fns8BQ==
X-Received: by 2002:a17:906:1697:: with SMTP id
 s23mr22486996ejd.60.1636748196778; 
 Fri, 12 Nov 2021 12:16:36 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id o5sm3775209edc.25.2021.11.12.12.16.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 12:16:36 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id i12so7884509wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:16:36 -0800 (PST)
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr37406491wmq.26.1636748195924; 
 Fri, 12 Nov 2021 12:16:35 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txVydO1fy8sEwVXRZF0zPfWwLYrk-UnGeKhRCEvrW4B7Q@mail.gmail.com>
In-Reply-To: <CAPM=9txVydO1fy8sEwVXRZF0zPfWwLYrk-UnGeKhRCEvrW4B7Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Nov 2021 12:16:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiZdONN=1Er5eN1bYurrWqhXF7LxQszpPia8hvYUOiZWQ@mail.gmail.com>
Message-ID: <CAHk-=wiZdONN=1Er5eN1bYurrWqhXF7LxQszpPia8hvYUOiZWQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes + one missed next for 5.16-rc1
To: Dave Airlie <airlied@gmail.com>, Matthew Auld <matthew.auld@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 7:25 PM Dave Airlie <airlied@gmail.com> wrote:
>
> I missed a drm-misc-next pull for the main pull last week. It wasn't
> that major and isn't the bulk of this at all. This has a bunch of
> fixes all over, a lot for amdgpu and i915.

Ugh.

The i915 conflict was trivial, but made me aware of that absolutely
disgusting "wbinvd_on_all_cpus()" hack.

And that thing is much too ugly to survive. I made my merge resolution
remove that disgusting thing.

That driver is x86-only anyway, so it all seemed completely bogus in
the first place.

And if there is some actual non-x86 work in progress for i915, then
that wbinvd_on_all_cpus() needs to be replaced with something proper
and architecture-neutral anyway, most definitely involving a name
change, and almost certainly also involving a range for the cache
writeback.

Because that "create broken macro on other architectures" thing is
*NOT* acceptable.

And I sincerely hope to the gods that no cache-incoherent i915 mess
ever makes it out of the x86 world. Incoherent IO was always a
historical mistake and should never ever happen again, so we should
not spread that horrific pattern around.

                Linus
