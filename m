Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7093AFF3F8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 23:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC7C10E02C;
	Wed,  9 Jul 2025 21:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="J7WKn/R2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287BD10E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 21:36:52 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-7425efba1a3so352712b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 14:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752097012; x=1752701812;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=w3d6tzfJc09QAN3tOMltMcwq5vs2xgKEQEBLpFxZA4Y=;
 b=J7WKn/R29Qa6sKeebyaIWNb1+fV2SU1ocq4JznB3B0c1bGFTYQKtty67oQ05ssUhyz
 /2wMiYZDEskF+Ltxb02XKpmrMHnoEDkJtz5d9qX+666TWlxkGbsXdBgYUcc2pLFwZrBZ
 dxiKSbbWZz2YEmLICr655r30eTuRxU/d+KtDnfu2VOx5IzN+eALeHLnC+qyTQDPT+XgS
 PlIr5fI4kGrvKSltjcnrD3iHusAYGO/15kJwxwI4N4xImmOoObT7GeaFXtGWCBAIdW35
 xrIsoIj6aBrox7Z60Q9W0AWWjolim/OXZsBofTn+WKhI6xSvk/Kc5MiCH0DHSiLbh4kH
 BX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752097012; x=1752701812;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w3d6tzfJc09QAN3tOMltMcwq5vs2xgKEQEBLpFxZA4Y=;
 b=vJCaZpTbdn9tc42X8YsNU1SUXp196l+19R5tMHhRwUjNhiUG+da1l9GX6jilEbrPDK
 hzQ1Bj7zk75VAvlaZ7e0dS+rxJ7yPpD0hhA7oUI3zrJRlZhaeno2hPcu1Y3p4HQGTSCr
 mU8UXHupEpp7YzFm2z7i+/SRWkqIhEn5BP6TaIf3khOtk2QLGtfJP6mg+OQPFvxA/piU
 LFqXxwuWgbtMpXCr3Br1elzlEhFQF58vBVya0N35c0/AWB2RZv55F3VGihzAbfFIExqp
 9n/vt/dmytGj88Pgmrz2+PnfFG8rM5UW6ql5XjGHLJn3dKgZeBvpXSpNleuD3v5+Iu6O
 wxbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ4eNx3AMAM4SvRTvccFWuhR9bFqspJIARiFTsS7AK0DJLWVweh9GNUf9hUdm+7Gz9xMGpSbh9G3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn0R5YKC6DHp4CL5170r9U2CvuJQf/eLgximxYg9vhrKT1CbdY
 a0EAH9IT5R9nknwo7x6kr03v/NxNVvIs8CszK++Ba+Rpa1D7EBvYStbw19Kuvv4Dg2bofFZ7QMW
 aVIbyfA==
X-Google-Smtp-Source: AGHT+IFLEqNTh1QWENQoKcaGQJ6FjDiy9bAAhlEBb5QtB5Bh8MLqQr+R1uQHMdCvh3BdwLZPRf9uwMB9da4=
X-Received: from pfbct18.prod.google.com ([2002:a05:6a00:f92:b0:749:2cc7:bd89])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d21:b0:220:2fe9:f07a
 with SMTP id adf61e73a8af0-22fc2b18849mr1713280637.6.1752097011498; Wed, 09
 Jul 2025 14:36:51 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:36:50 -0700
In-Reply-To: <20250709185757.GDaG67tbGFYHUQxte2@fat_crate.local>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
 <aG6X__K8MvVYORkr@google.com>
 <20250709185757.GDaG67tbGFYHUQxte2@fat_crate.local>
Message-ID: <aG7g8vNejmxfftA-@google.com>
Subject: Re: [PATCH v3 0/8] x86, KVM: Optimize SEV cache flushing
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

On Wed, Jul 09, 2025, Borislav Petkov wrote:
> On Wed, Jul 09, 2025 at 09:25:35AM -0700, Sean Christopherson wrote:
> > On Thu, May 22, 2025, Sean Christopherson wrote:
> > > This is the combination of Kevin's WBNOINVD series[1] with Zheyun's targeted
> > > flushing series[2].  The combined goal is to use WBNOINVD instead of WBINVD
> > > when doing cached maintenance to prevent data corruption due to C-bit aliasing,
> > > and to reduce the number of cache invalidations by only performing flushes on
> > > CPUs that have entered the relevant VM since the last cache flush.
> > > 
> > > All of the non-KVM patches are frontloaded and based on v6.15-rc7, so that
> > > they can go through the tip tree (in a stable branch, please :-) ).
> > 
> > Tip tree folks, any feedback/thoughts on this series (patches 1-4 in particular)?
> > It'd be nice to get this into 6.17, and I'd really like land it by 6.18 at the
> > latest.
> 
> I'll take a look tomorrow.
> 
> If I queue 1-4, would you like an immutable branch to merge for the other 4?

Yes please, thanks!
