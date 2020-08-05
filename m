Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3519223D780
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472D56E879;
	Thu,  6 Aug 2020 07:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F9D89C84
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 19:26:50 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id 185so38777910ljj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 12:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZTU1ryZMgdNgvon6zHxPMHD91Vlm3ggPKUxoZvrSmrE=;
 b=I7zNXpwlB05fG48rEMY+smjF47BpBAIrTUxB3lD7jCJxE/h2ak3SgOrg/hPoy59j3Q
 hmZAGKVCe9hVDufaZwNTwck/U6DiE6L+IkTFO7e80iXqNme89pWLWRPveExlLRtIzaN+
 /k7Om8LIHDhh1wlxBxn+QyolsKkd0DNaJw05/YOE7u2UsZXh7v+Jdu1vrh1jBajveNXZ
 9yIt4CpM1pBox8WRRyY79mZfm7a4xZF+GTS8eLgBkvhDAIsnotPsabJqH3Q2WgJsAHek
 3NgYuIZhD/ptS2leEk9mMbgFRsLVdbWMhrrHud4/y/nLcUU3LnDcBtc/9kSMA1iQ5ifq
 +PhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZTU1ryZMgdNgvon6zHxPMHD91Vlm3ggPKUxoZvrSmrE=;
 b=lIHmf6S7+M40nnNoJG0TeXJJM4i0VTL49pGZCblxlIUHypEvr73bp+LK63AVSxmLnk
 gRgXaHg46YIA+fq2KK0PQASqPrxbZYduFqCEvdrg8O+fp0e0fRqoZkknIYGRpPuotzO8
 +lW6IRUXPZ8HVuwStL4LaStZ7Oi5RwbZ3cwg31l5INVqu9j/5tgUjld0XiitdmPTc2e9
 7HFPI2xSMyKP2oqL9mTqgP0HNhJCB2mURWp104rw2x7wMyYqzc/vsjBso3NmFHDKGZ16
 VuHNYryMt329kEC9FvUR3kGqduOyW46FN4FQRBStBrUQbNq3jTHafD69Gr7fFdgZXtGm
 Mg3g==
X-Gm-Message-State: AOAM533uV7zkA3GL/r3T/JO35NsG5aK3g1AEHqbyEGD0ot4Zv3CO/Z7B
 1QQJhMTu73RyyL9iTYvhkEiRyHDoDM/bwLq2TrJi
X-Google-Smtp-Source: ABdhPJwodFmwO9+ZasCfCba0lyamicSQvfeG4yGBRJFEdOS/t/7uwSDWlTlb6RHR/Jq9n4jslAWxwlldpXOyS6e0RbM=
X-Received: by 2002:a2e:580a:: with SMTP id m10mr2046767ljb.71.1596655608761; 
 Wed, 05 Aug 2020 12:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAKT=dD=_8daRz2h9pCvRQV4bvM6Wu6QGsBu7676-Jujfaf-Tuw@mail.gmail.com>
 <CAP+8YyEn-+gq_RiM0sOmPagD46eGPT7wzAS9y_j52Or6ETBx2A@mail.gmail.com>
In-Reply-To: <CAP+8YyEn-+gq_RiM0sOmPagD46eGPT7wzAS9y_j52Or6ETBx2A@mail.gmail.com>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Wed, 5 Aug 2020 12:26:37 -0700
Message-ID: <CAKT=dDneYRs+ZEJmwP=_wmz+dodpk6Gp7j=eX4EA=b9vGYmkoA@mail.gmail.com>
Subject: Re: Question about per process GPU context global priority enforcement
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: Peiyong Lin <lpy@google.com>, Prahlad Kilambi <prahladk@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let me add more context. On Android, systemui and launcher should be
allowed to create high priority gpu contexts while the normal random
applications must be ceiled to default priority. However, systemui and
launcher are not allowed to create realtime threads so we can't grant
them CAP_SYS_NICE. Thus either a new cgroup is needed in this case or
we add sysui/launcher into some other present cgroup for the gfx
kernel driver to distinguish.

On Wed, Aug 5, 2020 at 4:47 AM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> I don't think we have a uniform mechanism, currently each driver
> decides on their own.
>
> For the amdgpu driver we check that the process either has
> CAP_SYS_NICE or is the DRM master.
>
> On Wed, Aug 5, 2020 at 9:14 AM Yiwei Zhang <zzyiwei@google.com> wrote:
> >
> > Hi friends,
> >
> > For Vulkan/EGL, upon creating gpu contexts, applications can ask for a
> > system-wide higher priority levels via VK_EXT_global_priority or
> > EGL_IMG_context_priority extensions.
> >
> > I'm curious if we have certain rules(some form of process privilege
> > check) in the kernel to limit non-privileged ones to never go beyond
> > default system-wide gpu scheduling priority. (e.g. not allow random
> > app processes to contend the GPU queues repeatedly/infinitely with
> > high/realtime priorities)
> >
> > Many thanks,
> > Yiwei - from Android Platform Graphics Team
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
