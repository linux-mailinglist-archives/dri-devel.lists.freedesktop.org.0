Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B8B00464
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 15:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6091610E217;
	Thu, 10 Jul 2025 13:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RdaoyjHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CF710E217
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 13:56:40 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-7398d70abbfso1435000b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752155800; x=1752760600;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jdivoy2i5Gr9aD8xwW1tsvlEITdtVn9BeGlg1mVQmjw=;
 b=RdaoyjHgpcLrx0f84J9uaN9AiOLvmmBi92TMADnm8EpiibwfMJVH/bezowFu/SxEIJ
 om+RYleaxOzEPcslRqJvRgK4hTbNT+LEc+a5RdG1R/bjACS/S/t5aXXx5VEszkDGKTJl
 +fu43S1Vov/5pq/4kiLesAmMOC50NKCe3o0EktoNwsrS5jfKRkf9ctzwfAoCREUp7aww
 ii27RIhuFgORpVW6B8I7mnGL+aCv7ZQa30iAc0rsN+DxnnaEMe2K0MKMljZmpwGdRr6q
 DhFvjYHBi2XfWBqsrSQNkUoGuuActB+mE7gWgYZMqFZ4uQaGauGxdJ6qdz8kz0JGtEal
 GMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752155800; x=1752760600;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jdivoy2i5Gr9aD8xwW1tsvlEITdtVn9BeGlg1mVQmjw=;
 b=OHisxHhUEIMytEw1hJZRlEhKrS/RyYXDZz5V9AxXo+lS5F68ET8RefvW8c8o7avpHY
 RI1nSf+MoOG94Fz3ZvbD12ullcyNppSyRdiIrV5siv/5ssFA6ZpihzknbJSTYdEgc8eM
 eLg8eAikTD9I+LQhqC8d449o6TlM/ILNMfF4ykBDJZVMwdEGMocGeZCC4RbkNzekAykk
 FSGYH/VY5+vgryy+FnjNN1NbBKKz0FpSTExjqg5+vfO3R+WxdIUmZLU/Fs0qedEeoSv9
 3fSq9i3SxhbKLVI/m18in4lVkBqLFaYSAa6A28T4XinMRQz6qvklyCU11WxoBRAS9HE5
 PnJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOXTcJ938WAlsL8fNdq8LlbzsEpH1uLkmMJ1wCKMgsm1CR1WQnXFTuHU4CNeN8kKjkfUOcSjZh5VE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC9q3vTR4ickw8iJvkbTs5Ga9qYd5iPSkzhoxbNbFG14A9WfZg
 3vmPOWPM8spdk/3LkXiTJkAljSXKEggDKgXkwPSu7b6WJPj6/gakJSIGP5fq1k6B+H73EoAcLEQ
 kgIFk8g==
X-Google-Smtp-Source: AGHT+IFQLmoe4r0uGjszcjS65GBUmZL9XmUcIofKbdPbRYIZxHVIlOanHmYbmqpsneWEQZcfGa1zcK869ME=
X-Received: from pfbfi6.prod.google.com ([2002:a05:6a00:3986:b0:746:247f:7384])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3c8c:b0:749:ad1:ac8a
 with SMTP id d2e1a72fcca58-74ea6684ae5mr10003879b3a.11.1752155800315; Thu, 10
 Jul 2025 06:56:40 -0700 (PDT)
Date: Thu, 10 Jul 2025 06:56:38 -0700
In-Reply-To: <20250710112902.GCaG-j_l-K6LYRzZsb@fat_crate.local>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
 <20250522233733.3176144-4-seanjc@google.com>
 <20250710112902.GCaG-j_l-K6LYRzZsb@fat_crate.local>
Message-ID: <aG_GlsJWRU0fVxt4@google.com>
Subject: Re: [PATCH v3 3/8] x86, lib: Add WBNOINVD helper functions
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Kevin Loughlin <kevinloughlin@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Kai Huang <kai.huang@intel.com>, Ingo Molnar <mingo@kernel.org>, 
 Zheyun Shen <szy0127@sjtu.edu.cn>, Mingwei Zhang <mizhang@google.com>, 
 Francesco Lavra <francescolavra.fl@gmail.com>
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

On Thu, Jul 10, 2025, Borislav Petkov wrote:
> On Thu, May 22, 2025 at 04:37:27PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
> > index 079c3f3cd32c..1789db5d8825 100644
> > --- a/arch/x86/lib/cache-smp.c
> > +++ b/arch/x86/lib/cache-smp.c
> > @@ -19,3 +19,14 @@ void wbinvd_on_all_cpus(void)
> >  	on_each_cpu(__wbinvd, NULL, 1);
> >  }
> >  EXPORT_SYMBOL(wbinvd_on_all_cpus);
> > +
> > +static void __wbnoinvd(void *dummy)
> > +{
> > +	wbnoinvd();
> > +}
> > +
> > +void wbnoinvd_on_all_cpus(void)
> > +{
> > +	on_each_cpu(__wbnoinvd, NULL, 1);
> > +}
> > +EXPORT_SYMBOL(wbnoinvd_on_all_cpus);
> 
> If there's no particular reason for the non-GPL export besides being
> consistent with the rest - yes, I did the change for wbinvd_on_all_cpus() but
> that was loooong time ago - I'd simply make this export _GPL.

Yeah, AFAIK, no reason other than consistency.  GPL it.
