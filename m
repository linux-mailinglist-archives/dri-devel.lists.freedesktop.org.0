Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96C8C785F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 16:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E005610ED3A;
	Thu, 16 May 2024 14:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="U00D9AVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36D210ED3A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 14:22:07 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-dc6b26783b4so10654466276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715869326; x=1716474126;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=4m68YkA2S92Eguxrloa+GQL1JjaiZ2vojYrAtugN7XQ=;
 b=U00D9AVruCO5OwFm28JQeRRQKTBjFW1XkfXqmNPNZHfwUM30bdasPcr0OeJ+Q29Ywl
 ay22K3k5/Tg8MMEEZuWtpFmAguhBleN+lEvLkwqFicLhFC0F26ywcy6h6oGlmIbCwezB
 Eh5g8Zn3HMO98ErDz+JYwVJ3CtIgK9O7oEo+VoTU3GTGXgOkVSAchKy4Mj3wcmjO9caP
 PUdHuGeKPXqHD5SGjYH+3kN8ALER8VCME20u2ygYIBysG/Z4uUDooWJCby44b6cZuN75
 S/pqisbCJSUN9l9nJ8wiCFadQ7eeC4/rXeZvXU6+TyQi7mE49ueThN0h0JXjerPOTIbi
 YU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715869326; x=1716474126;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4m68YkA2S92Eguxrloa+GQL1JjaiZ2vojYrAtugN7XQ=;
 b=EgqOOJZEsi0SIqfTM25p6mHdXaa+5rjArp1wwDfTY5uE88IY4tQFq9S/RQ8AnZA2Sx
 XCCp0+gyJnVQylZlFnSUZSt6OmtUx4meAcxAW6ZmoC5CwRg7hgZMeUH88vmD1fBLFPiy
 MsmwBBWCEeY0PNdC+L1gasf/+9j4hQO7D2UuKy3/b3j8jio6GVnuD13ScMzJc7X+0gh7
 BVvap0aHasUSIXxodDCsPY/ZO1nFQ9w/JZB7WPYhDiycgdQJCTWOEZAMHUarBQ9ThIsG
 8ru9dckZru6bdmF3vb3UP9eN2AgVFtdAOsuPQuPuytb8cmSSsxL31FrqwHHY77rlDH0o
 5WZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeu7F1lthrAwq3a0A+K6H9JKxB+eBTOdNCAmt1nbzfFHaG/v0RYqyIGFsfOqK7hJAy/C7H7ifq36YfPrlzuNaL309y6E1lFtPCJN0p3zD0
X-Gm-Message-State: AOJu0YywIFei0jg8K8MvGLfrC+I/JguArL1ptmiFXmle/y/zlHW9yUCS
 FKS8NtfaLvQHwNBSbfLe5ELXZJYftmhCLN5hgzNBYnZQ17sIDGAk7TZCzwuJmYi3FcwV1mcOix0
 E1A==
X-Google-Smtp-Source: AGHT+IELwAHgmf9QMA0EShOsWWV59MMoouxKZtjoShq1IflB10ZDo2Cz/CCMHIFS6TX9j2SWARMjV9r/sG8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:10c3:b0:dee:7c5c:e336 with SMTP id
 3f1490d57ef6-dee7c5ce8a4mr1028023276.10.1715869326194; Thu, 16 May 2024
 07:22:06 -0700 (PDT)
Date: Thu, 16 May 2024 07:22:04 -0700
In-Reply-To: <CAPM=9twCVkx9OqndCcvjjgx+P7ixBRwttiz25-R=bkycEo5vrQ@mail.gmail.com>
Mime-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
 <CAPM=9tyOtH24Mw_2X+bgV9iChOQV3LtmRCoR5x6KXhSUD6FjUg@mail.gmail.com>
 <CAHk-=wh8DWSMrtuhZOzanfBCFcuJCihO9x7fkzx-dBhLddXF-Q@mail.gmail.com>
 <CAPM=9twCVkx9OqndCcvjjgx+P7ixBRwttiz25-R=bkycEo5vrQ@mail.gmail.com>
Message-ID: <ZkYWjEaPcsT2-4dz@google.com>
Subject: Re: [git pull] drm for 6.10-rc1
From: Sean Christopherson <seanjc@google.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, May 16, 2024, Dave Airlie wrote:
> On Thu, 16 May 2024 at 08:56, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > If the *main* CONFIG_WERROR is on, then it does NOT MATTER if somebody
> > sets CONFIG_DRM_WERROR or not. It's a no-op. It's pointless.

+1

> It's also possible it's just that hey there's a few others in the tree
> 
> KVM_WERROR not tied to it
> PPC_WERROR (why does CXL uses this?)
> AMDGPU, I915 and XE all have !COMPILE_TEST on their variants
> 
> We should probably add !WERROR to all of these at this point.

That creates its own weirdness though, e.g. I guarantee I'll forget about the
global WERROR at some point and wonder why I'm seeing -Werror despite having
KVM_WERROR=n in my .config.  I would rather force KVM_WERROR if WERROR=y, so this?

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 2a7f69abcac3..75082c4a9ac4 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -44,6 +44,7 @@ config KVM
        select KVM_VFIO
        select HAVE_KVM_PM_NOTIFIER if PM
        select KVM_GENERIC_HARDWARE_ENABLING
+       select KVM_WERROR if WERROR
        help
          Support hosting fully virtualized guest machines using hardware
          virtualization extensions.  You will need a fairly recent
@@ -66,7 +67,7 @@ config KVM_WERROR
        # FRAME_WARN, i.e. KVM_WERROR=y with KASAN=y requires special tuning.
        # Building KVM with -Werror and KASAN is still doable via enabling
        # the kernel-wide WERROR=y.
-       depends on KVM && EXPERT && !KASAN
+       depends on KVM && ((EXPERT && !KASAN) || WERROR)
        help
          Add -Werror to the build flags for KVM.
