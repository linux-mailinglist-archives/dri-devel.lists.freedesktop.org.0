Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB0CABC49E
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D130610E47C;
	Mon, 19 May 2025 16:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ChOEc55z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE6910E47C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:34:40 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-30a39fa0765so7052011a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747672480; x=1748277280;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8zv3GTZ1OQoWAPfijjQY1dYYsvZlBkqwnY1otuI5HeM=;
 b=ChOEc55zSq82vpRD7xyYfg0dVKL54XTHYtBjUd6ovzUlxgbEWwhymjVkq5bHyTtlUT
 9COxLzW5353aZsuKP6nRBJ17qNKsfeHUMF3twgF2/joHvEh4Ux9KP2UZZa/yRh3CItHO
 ftZGttXlYBOepZiVQYuKvu9BjEEcUrJCX5Jb3QZzTSOlQzCGTTUZDVXR9mymo5nXHgdb
 MYhc4n23hIiK1eIxsQDBd5S89Zu2YcochAy1vw1OnlLpZBYvZ6I7oDhUWjBs531u1anz
 l72kiu3GCzeFsO88ElKMeeVSeKdQlsgvJ2NqRsggMjcMWKYzWPijAqJJ0Y7CTo6SVs8R
 OUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747672480; x=1748277280;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8zv3GTZ1OQoWAPfijjQY1dYYsvZlBkqwnY1otuI5HeM=;
 b=dRp+TSRRV9+tcGAxhV6nnamzMeJfAlV6lD+gFbaRoJs+EPFR7t9SO+akItddVA7ocm
 13wzZOMJkwrjv8bsGDVZsUEeuYKYUKKcHi/UeT4JEnHEDIIBeRW+d/XASzzeHz6q0NqW
 CwreQqcUttJshgMj5NZJt8tRgLaLhhXOP6XE1svoieSseHoQ2MeHpI0qlgDkJBC1AilQ
 8ABr4C13H87OXLFy4zCzUtFJvW5dWTOJ+PsERS1/iXF3qFIGuVKFljFAcxm7n4BPVipG
 LkdVo+pTPxoltQ0CJ9yYpmHL4a50Z9/6rSMop2yZgJ46a1YzpzhYIAimk+8kya7ej7b3
 dg4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWag/qaizm9sOkljKIq5zwXWmWnxvqXh9dFD1qQwD7A7QS9I6TGkkSMFPxOWPiayJVXT+IqEjbIwd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjrA5ejWuBjwHd0s09LPpiBRvmrbVu5tyFSFJtxkK76fWpnem1
 XeWlTMb7TDLudHKMqRimaLjHm+ZgsC/qIMkfl4Rm9i1SNBenexIRe0ijh6+6ySD4jH4yval+vNR
 UDevzIw==
X-Google-Smtp-Source: AGHT+IF7Pp0SGv2aGgzlEI/adpem8+WPZlHOMtK6iV/1Zu8WqJx6oDl5Gz/qVNTkZFz9jTihYXpZXJvKkyk=
X-Received: from pjbsw16.prod.google.com ([2002:a17:90b:2c90:b0:2ff:84e6:b2bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d4c:b0:301:1c11:aa74
 with SMTP id 98e67ed59e1d1-30e7d5a84a3mr22376515a91.28.1747672480225; Mon, 19
 May 2025 09:34:40 -0700 (PDT)
Date: Mon, 19 May 2025 09:34:38 -0700
In-Reply-To: <aCg0Xc9fEB2Qn5Th@gmail.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
 <20250516212833.2544737-8-seanjc@google.com>
 <aCg0Xc9fEB2Qn5Th@gmail.com>
Message-ID: <aCtdnqqvIbHr-ed5@google.com>
Subject: Re: [PATCH v2 7/8] x86, lib: Add wbinvd and wbnoinvd helpers to
 target multiple CPUs
From: Sean Christopherson <seanjc@google.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Zheyun Shen <szy0127@sjtu.edu.cn>, Tom Lendacky <thomas.lendacky@amd.com>, 
 Kevin Loughlin <kevinloughlin@google.com>, Kai Huang <kai.huang@intel.com>, 
 Mingwei Zhang <mizhang@google.com>
Content-Type: text/plain; charset="us-ascii"
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

On Sat, May 17, 2025, Ingo Molnar wrote:
> 
> * Sean Christopherson <seanjc@google.com> wrote:
> 
> > From: Zheyun Shen <szy0127@sjtu.edu.cn>
> > 
> > Extract KVM's open-coded calls to do writeback caches on multiple CPUs to
> > common library helpers for both WBINVD and WBNOINVD (KVM will use both).
> > Put the onus on the caller to check for a non-empty mask to simplify the
> > SMP=n implementation, e.g. so that it doesn't need to check that the one
> > and only CPU in the system is present in the mask.
> > 
> > Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
> > Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> > Link: https://lore.kernel.org/r/20250128015345.7929-2-szy0127@sjtu.edu.cn
> > [sean: move to lib, add SMP=n helpers, clarify usage]
> > Acked-by: Kai Huang <kai.huang@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/smp.h | 12 ++++++++++++
> >  arch/x86/kvm/x86.c         |  8 +-------
> >  arch/x86/lib/cache-smp.c   | 12 ++++++++++++
> >  3 files changed, 25 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> > index e08f1ae25401..fe98e021f7f8 100644
> > --- a/arch/x86/include/asm/smp.h
> > +++ b/arch/x86/include/asm/smp.h
> > @@ -113,7 +113,9 @@ void native_play_dead(void);
> >  void play_dead_common(void);
> >  void wbinvd_on_cpu(int cpu);
> >  void wbinvd_on_all_cpus(void);
> > +void wbinvd_on_many_cpus(struct cpumask *cpus);
> >  void wbnoinvd_on_all_cpus(void);
> > +void wbnoinvd_on_many_cpus(struct cpumask *cpus);
> 
> Let's go with the _on_cpumask() suffix:
> 
>     void wbinvd_on_cpu(int cpu);
>    +void wbinvd_on_cpumask(struct cpumask *cpus);
>     void wbinvd_on_all_cpus(void);

How about wbinvd_on_cpus_mask(), to make it more obvious that it operates on
multiple CPUs?  At a glance, wbinvd_on_cpumask() could be mistaken for a masked
version of wbinvd_on_cpu().
