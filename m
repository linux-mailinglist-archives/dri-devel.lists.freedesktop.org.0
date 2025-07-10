Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85CB00F4A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 01:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5056610E989;
	Thu, 10 Jul 2025 23:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3sGXjBuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527A410E989
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 23:09:53 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-31215090074so2463458a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752188993; x=1752793793;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=67GwB+aWyumwRZOh2fINIZ/EYoiexZgJdVtrS9LdzOY=;
 b=3sGXjBuVGIS4TuMXgvQJqXbxiDDmLsbr9ozRRiraPt0E/aj2dubd6/OBe06YTkbCM8
 xyQFU9RYQQxHWGKk4aUUF2dVYGKexGaSoSh6SHZ6FjnEFyabd5zwKTxIxQjaxBS6ASKa
 mwEZhEl0btLH1Y3IpqSf6rZBR70YQdTdLVK+0MCGgGIbPOjaNVX3KRe+hWAUc1efwMgU
 vIjZEVBGOBtedk/ULIoR/BuoSBilAX3DJGST9oYxDa0SfCEuxWrjEljbYVbRz3ly4aLW
 rjO0btncqtfQE1/ukYyIKOFr8cRn6SAcAO0fSuLcOkusPohw1LCTFNb/xhcNT1obOZSv
 g3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752188993; x=1752793793;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=67GwB+aWyumwRZOh2fINIZ/EYoiexZgJdVtrS9LdzOY=;
 b=VpNUb3YxkfQbj1/CIaoC06/msJT6dxedBqW8woEEfqc4XSV9kKmj4E2IBD9PaWadim
 bf6ll+1s4wwj5zKwJNHFh+JFtJtydbUgSnT+6CmiNTPyOvreXeBQX1hAKE2Sy1voIUv8
 /Z4HZ+dBlYvkrblPy4bydvAfU43BNZO15Xs+CDVO9p+QnpXosjQTtIqd8McewZxNrEU9
 S8YF12hzN7JizSGPdTJaX0mkYjjD6f7Dc6IkJsf53Dd9lgoi+UEyGHW7DwaMSjZHkaLu
 4bgWur/TfZ1RWwXerEK/qYpZkn6+CImn4tDYfS6+XnaVPFQgnU2djnRzWE1hx7a/K0Cb
 dX/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTzTT7B/FXTNIHpXvecWDFbl1sDFZyI2jBB98Zk3PIqaRqMO6zaflHKyaV/b+Q61hXU5VwfO7qcyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/dqzY7yzFlWT6j6RxioUjiTZ1+Coge49VEnL5h/3A6cCeLWaF
 7h71ehl49h22Qxy/ONKdf5zEGAUG1ZDFBAzNuZQdqI/8h/d1C1VdOjrDe6chxvrRMpwFZKGjTAm
 9rZBiFQ==
X-Google-Smtp-Source: AGHT+IEo94Y3+LJsQbHDiFEaMdeiLRqMSRnEEoCZTsH9vs3Gi2iRWPU6d3/xOwSjelhz6h4GAhCCPZ+Zu1E=
X-Received: from pjqq16.prod.google.com ([2002:a17:90b:5850:b0:2ff:6132:8710])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5710:b0:311:a314:c2ca
 with SMTP id 98e67ed59e1d1-31c4f4b557bmr528192a91.6.1752188992830; Thu, 10
 Jul 2025 16:09:52 -0700 (PDT)
Date: Thu, 10 Jul 2025 16:08:54 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <175218114710.1488061.16698832498491480621.b4-ty@google.com>
Subject: Re: [PATCH v3 0/8] x86, KVM: Optimize SEV cache flushing
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Kevin Loughlin <kevinloughlin@google.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, Kai Huang <kai.huang@intel.com>, 
 Ingo Molnar <mingo@kernel.org>, Zheyun Shen <szy0127@sjtu.edu.cn>, 
 Mingwei Zhang <mizhang@google.com>,
 Francesco Lavra <francescolavra.fl@gmail.com>
Content-Type: text/plain; charset="utf-8"
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

On Thu, 22 May 2025 16:37:24 -0700, Sean Christopherson wrote:
> This is the combination of Kevin's WBNOINVD series[1] with Zheyun's targeted
> flushing series[2].  The combined goal is to use WBNOINVD instead of WBINVD
> when doing cached maintenance to prevent data corruption due to C-bit aliasing,
> and to reduce the number of cache invalidations by only performing flushes on
> CPUs that have entered the relevant VM since the last cache flush.
> 
> All of the non-KVM patches are frontloaded and based on v6.15-rc7, so that
> they can go through the tip tree (in a stable branch, please :-) ).
> 
> [...]

Applied 5-8 to kvm-x86 sev (which is built on tip/x86_core_for_kvm).

[5/8] KVM: x86: Use wbinvd_on_cpu() instead of an open-coded equivalent
      https://github.com/kvm-x86/linux/commit/55aed8c2dbc4
[6/8] KVM: SVM: Remove wbinvd in sev_vm_destroy()
      https://github.com/kvm-x86/linux/commit/7e00013bd339
[7/8] KVM: SEV: Prefer WBNOINVD over WBINVD for cache maintenance efficiency
      https://github.com/kvm-x86/linux/commit/a77896eea33d
[8/8] KVM: SVM: Flush cache only on CPUs running SEV guest
      https://github.com/kvm-x86/linux/commit/d6581b6f2e26

--
https://github.com/kvm-x86/linux/tree/next
