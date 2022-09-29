Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E805F00C9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 00:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D5210E146;
	Thu, 29 Sep 2022 22:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2C210E18D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 22:38:10 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id u92so2630017pjh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=uRYofiYnG47hAF2aDgziR8isJuYRbsZpgovud56j32A=;
 b=JZPVhVcSMWJOlPWPeuO7TIk2QE8xzCYuAuPJMIvNL9e/7DEG7nT1s/j0a++TuIXoJt
 W5tOkUQ3APGpHGPx2aDs0EQFmPuIgBA+4T0avm1Lg0UJhYZ3xUC1RzFzgaGhbslD+zEA
 8NgZgevTkenFB0f0XOWYHbeCZsUerfUuHJ0MRFMwXM5XuUFT0t5SADRdJ0rMU3iZnQpx
 iMve53x366pyZVcyz/wlrlsM3/1JBISjrdscSFwoyHMKAyPnzbLjIdZA8bJqQmwrTVBh
 qX5XlvQpPaLRv1P2ont+Bp7rvzNsL9me5BwcB/JytVGVWSrVmlRW7tys/zv1TCWNsOeo
 isHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=uRYofiYnG47hAF2aDgziR8isJuYRbsZpgovud56j32A=;
 b=Q67F3SUBZNeM0G7UnquaBJoM3nc8dwtPOsHTchb7sy8px5GujzFtEHH2djlOb19j9w
 TJkRkSYPD6bdfqAJ+gAJ5AVdnJlJSunlvnkK+dhmnIie1yCoA6k1+aKXCy8vajOpHbi7
 tZq1GEXleY4plJpTKkN+XiKPlv5lm5ZJ8BLZAMW/C31dODR91Dw/+AH/WxVn+9EXm0mO
 Rqw+JLyCM7A6FfgpI/eFD2V8XVD4E/nHA9C4rGPmLuQNkYRTucGR6tQO9DOSvbmX7gyR
 b02Hjl0eqsLDyDasP6zfiuhn9P7FkZa0WbaTZQ2KR/tl4FR2Yc5wl9oFngmCKQF8Zr9n
 8uMA==
X-Gm-Message-State: ACrzQf2ERp3AdxJXv8RyMemFTeaRr+uneUaWLExDn4cFByxE0uHkT3wQ
 NNeM0cV6NZALE5QO87PTRcQdbA==
X-Google-Smtp-Source: AMsMyM6yC6NkaBuBd+HCYZGGqRfzh1aqwwfKXWPEPMxkZ/E1X0XuzRLSKCq/ziAdT/GnArgh0pqgvg==
X-Received: by 2002:a17:903:441:b0:179:f1cc:ba89 with SMTP id
 iw1-20020a170903044100b00179f1ccba89mr5683259plb.146.1664491089036; 
 Thu, 29 Sep 2022 15:38:09 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b0017829a3df46sm384797plg.204.2022.09.29.15.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 15:38:08 -0700 (PDT)
Date: Thu, 29 Sep 2022 22:38:04 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: Nested AVIC design (was:Re: [RFC PATCH v3 04/19] KVM: x86: mmu:
 allow to enable write tracking externally)
Message-ID: <YzYeTCsNfQWccKJ9@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com>
 <YoZyWOh4NPA0uN5J@google.com>
 <5ed0d0e5a88bbee2f95d794dbbeb1ad16789f319.camel@redhat.com>
 <c22a18631c2067871b9ed8a9246ad58fa1ab8947.camel@redhat.com>
 <Yt6/9V0S9of7dueW@google.com>
 <7c4cf32dca42ab84bdb427a9e4862dbf5509f961.camel@redhat.com>
 <YugLc5LLPJkt89z6@google.com>
 <fe76ea902a38a10e2d8078fd9e5a71a0c7724d84.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe76ea902a38a10e2d8078fd9e5a71a0c7724d84.camel@redhat.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 08, 2022, Maxim Levitsky wrote:
> Hi Sean, Paolo, and everyone else who wants to review my nested AVIC work.

Before we dive deep into design details, I think we should first decide whether
or not nested AVIC is worth pursing/supporting.

  - Rome has a ucode/silicon bug with no known workaround and no anticipated fix[*];
    AMD's recommended "workaround" is to disable AVIC.
  - AVIC is not available in Milan, which may or may not be related to the
    aforementioned bug.
  - AVIC is making a comeback on Zen4, but Zen4 comes with x2AVIC.
  - x2APIC is likely going to become ubiquitous, e.g. Intel is effectively
    requiring x2APIC to fudge around xAPIC bugs.
  - It's actually quite realistic to effectively force the guest to use x2APIC,
    at least if it's a Linux guest.  E.g. turn x2APIC on in BIOS, which is often
    (always?) controlled by the host, and Linux will use x2APIC.

In other words, given that AVIC is well on its way to becoming a "legacy" feature,
IMO there needs to be a fairly strong use case to justify taking on this much code
and complexity.  ~1500 lines of code to support a feature that has historically
been buggy _without_ nested support is going to require a non-trivial amount of
effort to review, stabilize, and maintain.

[*] 1235 "Guest With AVIC (Advanced Virtual Interrupt Controller) Enabled May Fail
    to Process IPI (Inter-Processor Interrupt) Until Guest Is Re-Scheduled" in
    https://www.amd.com/system/files/TechDocs/56323-PUB_1.00.pdf
