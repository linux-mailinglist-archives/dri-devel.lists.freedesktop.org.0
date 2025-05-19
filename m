Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A047DABC481
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DCA10E2D4;
	Mon, 19 May 2025 16:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FYmrjzl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B421610E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:30:36 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-30e9338430eso2402123a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747672236; x=1748277036;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=f4KSVGOuD15jSHI9/IXVbKsdZrrPjge70aQQi1SohTU=;
 b=FYmrjzl8QS8BWo7p4OMauc5/N+XAIW3KO3HFJuRvCfkw+IFBo2vrNecvXy/pifrXge
 KDOYtnEDRHF34qN5Jn3urtup+6GEHUDvTHgHwRESVUJRFHMFrpueXZdpfnE6vxfH9BIW
 VFNsYJOfTuu2G0kcs1d66d6bODA4oNac+LloEo2eSBt6sekqh8JJfILWfaiUFsw8WzKS
 7Mq4P955rEJPlh6Pt2Ii0PMT/ItUQVMVictTIL7L/7bvN8SWUzNiki6+SGNEg/M1Xdss
 Zjeq4ebCkd24pOqlnD4gmk9YBajA2M0xEDKfb8So132fuNUplMJrVoT3+7cbXtbcjLjg
 gF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747672236; x=1748277036;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f4KSVGOuD15jSHI9/IXVbKsdZrrPjge70aQQi1SohTU=;
 b=BzgGvGZsmnA1uU3Bs9m++IF1S9QOB4TtXMXFBe3qxX8452fj4xC6ISevYdaxj7Hzr1
 ruCW62Xr3nE6Q3anBw3PBtBtN56API11EbJo9CYMOCFqfMLMax+IN/2h9C7Gr2dFWdCy
 4HrAwzABLQQ5SoB094Ll7BOrxIKUOIKJ+wR14snu3WmjrzdhjO9wLlTHzrv9QVREOTHO
 iku3B29ZAStd/AuMYee7mGG+amLFEhWGpSPKszWy/WCKxDDf50yO6u1QycOWqg5Yyb5z
 AZiry7aqHakRoWxUcJj2EGOznadoMHjvhN5b89IeeTxNLmyNimcwbB3HRylZCpvo+mxf
 htaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2ajOayeGRbSLWOuFuEGbSvXBdSUftqe4EeWs2Wsq5O4ftL34k8gJbEoSfPp4swSL7YaD2xQ01AKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPOjCw79bRZNCwAcVhdA8xeH6rLjfoVZ/ibLdDKlbjgT+Msm44
 ZcDeP9kteG8Rp8kdBZgSgIVBC01ZtxzL2+RlxW2yYUzREiGuMndTTYYNjok6bZHqyVYtzAcQMIl
 9v/RHuw==
X-Google-Smtp-Source: AGHT+IHdD7pDTmybbOoF0eWUomF+Dc6wrJbhdQrr2AyQaxIc76a+qPVG6HhUpU53jIaifh6zWn/RWlywOgs=
X-Received: from pjbnw12.prod.google.com ([2002:a17:90b:254c:b0:2ef:8055:93d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28c5:b0:2fc:a3b7:108e
 with SMTP id 98e67ed59e1d1-30e7d4fea80mr21437627a91.4.1747672236291; Mon, 19
 May 2025 09:30:36 -0700 (PDT)
Date: Mon, 19 May 2025 09:30:34 -0700
In-Reply-To: <aCgw6sbpE6f42sC_@gmail.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
 <20250516212833.2544737-5-seanjc@google.com>
 <aCgw6sbpE6f42sC_@gmail.com>
Message-ID: <aCtcqlP8MAqgyTbd@google.com>
Subject: Re: [PATCH v2 4/8] x86, lib: Add WBNOINVD helper functions
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
>=20
> * Sean Christopherson <seanjc@google.com> wrote:
>=20
> > From: Kevin Loughlin <kevinloughlin@google.com>
> >=20
> > In line with WBINVD usage, add WBONINVD helper functions.  Fall back to
> > WBINVD (via alternative()) if WBNOINVD isn't supported, as WBINVD provi=
des
> > a superset of functionality, just more slowly.
> >=20
> > Note, alternative() ensures compatibility with early boot code as neede=
d.
> >=20
> > Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
> > Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> > [sean: massage changelog and comments, use ASM_WBNOINVD and _ASM_BYTES]
> > Reviewed-by: Kai Huang <kai.huang@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/smp.h           |  6 ++++++
> >  arch/x86/include/asm/special_insns.h | 19 ++++++++++++++++++-
> >  arch/x86/lib/cache-smp.c             | 11 +++++++++++
> >  3 files changed, 35 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> > index 028f126018c9..e08f1ae25401 100644
> > --- a/arch/x86/include/asm/smp.h
> > +++ b/arch/x86/include/asm/smp.h
> > @@ -113,6 +113,7 @@ void native_play_dead(void);
> >  void play_dead_common(void);
> >  void wbinvd_on_cpu(int cpu);
> >  void wbinvd_on_all_cpus(void);
> > +void wbnoinvd_on_all_cpus(void);
> > =20
> >  void smp_kick_mwait_play_dead(void);
> >  void __noreturn mwait_play_dead(unsigned int eax_hint);
> > @@ -153,6 +154,11 @@ static inline void wbinvd_on_all_cpus(void)
> >  	wbinvd();
> >  }
> > =20
> > +static inline void wbnoinvd_on_all_cpus(void)
> > +{
> > +	wbnoinvd();
> > +}
> > +
> >  static inline struct cpumask *cpu_llc_shared_mask(int cpu)
> >  {
> >  	return (struct cpumask *)cpumask_of(0);
> > diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/as=
m/special_insns.h
> > index 6266d6b9e0b8..46b3961e3e4b 100644
> > --- a/arch/x86/include/asm/special_insns.h
> > +++ b/arch/x86/include/asm/special_insns.h
> > @@ -117,7 +117,24 @@ static inline void wrpkru(u32 pkru)
> > =20
> >  static __always_inline void wbinvd(void)
> >  {
> > -	asm volatile("wbinvd": : :"memory");
> > +	asm volatile("wbinvd" : : : "memory");
> > +}
> > +
> > +/* Instruction encoding provided for binutils backwards compatibility.=
 */
> > +#define ASM_WBNOINVD _ASM_BYTES(0xf3,0x0f,0x09)
> > +
> > +/*
> > + * Cheaper version of wbinvd(). Call when caches need to be written ba=
ck but
> > + * not invalidated.
> > + */
> > +static __always_inline void wbnoinvd(void)
> > +{
> > +	/*
> > +	 * If WBNOINVD is unavailable, fall back to the compatible but
> > +	 * more destructive WBINVD (which still writes the caches back
> > +	 * but also invalidates them).

While poking around the SDM and APM to figure out a decent comment, I reali=
zed
this comment is somewhat misleading since WBNOINVD is itself backwards comp=
atible.
I still think it's a good idea to use alternative(), e.g. so that explicitl=
y
disabling WBNOINVD in the event of a hardware issue works as expected.

> > +	 */
> > +	alternative("wbinvd", ASM_WBNOINVD, X86_FEATURE_WBNOINVD);
> >  }
>=20
> Would be nice here to use the opportunity and document both WBINVD and=20
> WBNOINVD a bit more comprehensively, to point out that WBINVD writes=20
> back and flushes the caches (and point out which level of caches this=20
> affects typically),

Due to memory encryption technologies, I don't think there is a "typical" b=
ehavior
these days.  E.g. I'm pretty sure CPUs that support MKTME or SEV+ invalidat=
e all
caches on a package, but I wouldn't classify that as the typical behavior s=
ince
there are likely still a huge number of CPUs in the wild that don't poke in=
to the
lower level caches of other CPUs.

> and to point out that the 'invalidate' part of the WBNOINVD name is a
> misnomer, as it doesn't invalidate anything, it only writes back dirty
> cachelines.

I wouldn't call it a misnomer, the NO part makes it semantically accurate. =
 I
actually think the mnemonic was well chosen, as it helps capture the relati=
onships
and behaviors of INVD, WBINVD, and WBNOINVD.

How about this?

diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/sp=
ecial_insns.h
index 6266d6b9e0b8..f2240c4ac0ea 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -115,9 +115,39 @@ static inline void wrpkru(u32 pkru)
 }
 #endif
=20
+/*
+ * Write back all modified lines in all levels of cache associated with th=
is
+ * logical processor to main memory, and then invalidate all caches.  Depe=
nding
+ * on the micro-architecture, WBINVD (and WBNOINVD below) may or may not a=
ffect
+ * lower level caches associated with another logical processor that share=
s any
+ * level of this processor=E2=80=99s cache hierarchy.
+ *
+ * Note, AMD CPUs enumerate the behavior or WB{NO}{INVD} with respect to o=
ther
+ * logical, non-originating processors in CPUID 0x8000001D.EAX[N:0].
+ */
 static __always_inline void wbinvd(void)
 {
-       asm volatile("wbinvd": : :"memory");
+       asm volatile("wbinvd" : : : "memory");
+}
+
+/* Instruction encoding provided for binutils backwards compatibility. */
+#define ASM_WBNOINVD _ASM_BYTES(0xf3,0x0f,0x09)
+
+/*
+ * Write back all modified lines in all levels of cache associated with th=
is
+ * logical processor to main memory, but do NOT explicitly invalidate cach=
es,
+ * i.e. leave all/most cache lines in the hierarchy in non-modified state.
+ */
+static __always_inline void wbnoinvd(void)
+{
+       /*
+        * Explicitly encode WBINVD if X86_FEATURE_WBNOINVD is unavailable =
even
+        * though WBNOINVD is backwards compatible (it's simply WBINVD with=
 an
+        * ignored REP prefix), to guarantee that WBNOINVD isn't used if it
+        * needs to be avoided for any reason.  For all supported usage in =
the
+        * kernel, WBINVD is functionally a superset of WBNOINVD.
+        */
+       alternative("wbinvd", ASM_WBNOINVD, X86_FEATURE_WBNOINVD);
 }
=20
 static inline unsigned long __read_cr4(void)
