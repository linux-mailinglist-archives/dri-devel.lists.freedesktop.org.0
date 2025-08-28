Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C9AB3A772
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A0010EA5A;
	Thu, 28 Aug 2025 17:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="U1vmJQuL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EADB10EA59
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 17:15:19 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-327d1fea06eso322334a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 10:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756401319; x=1757006119;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=g/D1R1ws5ojuN4WG3pCUGyU24UMqyGj6lojr+YSYQ0c=;
 b=U1vmJQuLewXbWwDYMROWIh9ioIbwYsAWVqk5XfQl0adeNoFvLXZFXXlev9iz92jZha
 mLQmuAUowXzr10nQqJEIYLCIbcp9yzifkSnS6pi270qIR6/gGbLZPrvWqPLaH5UCg4m0
 fwlpOEOLaO0aUeDWWPoAtxeqiO504/RziIUxgEFM1LJ4Bt0BoB3vZeVb+yP0ofQk5ZiX
 bYzEh5bcJcndK/i1gsacbvgoNYb4iP6hFnxnbzyG1Q13hrLOPQoQznKFdwueAnA2qc2X
 /VIcJt+EPbdtXgWqNRrpJOBpRNhw2zMK2D6PiQ6wAthM77kG7xhyminMq6SasZVal18b
 0qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756401319; x=1757006119;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=g/D1R1ws5ojuN4WG3pCUGyU24UMqyGj6lojr+YSYQ0c=;
 b=rZCdFOVi5erJF6N53LOdiySMBT1puWdsaEu5QbZZTxJEGS4nTUrw9oKiop1W2Ix5zY
 aTauRGBx1qiFeVbllRKcTKTBt2usxYrM4HvC5G1WBmCNK3CN7W7MBjMExrRSL9HIwZSs
 0nz8TLFP4eoeExCbdqFiEtNYLTL8cRnGNnogej6AldwxeryXmgi0kPAHtQWn1SBLj6Mj
 kjZ8BJ6L6pCm1e8pWSVZULPiBGadLiZrUwVSZj1uJvgM/q9b/7/+ICHRj2gC/Bb5aAXQ
 BvuEhwfquO7EbLy8Agx7mVR+FNOcXETKDaxRuKKCkeOc4t7ANxOxeU1k7qrDFA1WvNXF
 0zKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHctkmrqG68xujflU3SKeqiJWH12Fo2/qei9LsoLf+4NiQT/doQiNaYyh0+YPUjecJCDFf2FkxWYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjZk28NWsDvsvS5gzcckIuywsZsvHNOlAdJdGdQJoLbp4zigVC
 CGBGx02aWDaFhoQEzSCwzFNMf0U2+6Ay9CcOzU7uleaZ1qXjXZBhSGhfsMr8MFIMnTKN0EOJTVn
 kTaQAqA==
X-Google-Smtp-Source: AGHT+IEgfCMAj/kPGbx0Dj2C82B+XByTzBEnlSaJgGQHGzaozLp7T19v0PG28aEIfyLg5E6WkydfWYNcBOM=
X-Received: from pjhk31.prod.google.com ([2002:a17:90a:4ca2:b0:327:9b90:7a79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1dc3:b0:327:cec7:b8c6
 with SMTP id 98e67ed59e1d1-327cec7cb53mr1738031a91.32.1756401318775; Thu, 28
 Aug 2025 10:15:18 -0700 (PDT)
Date: Thu, 28 Aug 2025 10:15:17 -0700
In-Reply-To: <874d821e-8ea3-40ac-921b-c19bb380a456@kylinos.cn>
Mime-Version: 1.0
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-3-zhangzihuan@kylinos.cn> <aK8Sd30K64mbN1Nt@google.com>
 <874d821e-8ea3-40ac-921b-c19bb380a456@kylinos.cn>
Message-ID: <aLCOpfNkcQN9P-Wa@google.com>
Subject: Re: [PATCH v2 02/18] KVM: x86: Use __free(put_cpufreq_policy) for
 policy reference
From: Sean Christopherson <seanjc@google.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Markus Mayer <mmayer@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Zhang Rui <rui.zhang@intel.com>, 
 Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>, 
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, 
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-omap@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Thu, Aug 28, 2025, Zihuan Zhang wrote:
> > Hmm, this is technically buggy.  __free() won't invoke put_cpufreq_poli=
cy() until
> > policy goes out of scope, and so using __free() means the code is effec=
tively:
> >=20
> > 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
> > 			struct cpufreq_policy *policy;
> > 			int cpu;
> >=20
> > 			cpu =3D get_cpu();
> > 			policy =3D cpufreq_cpu_get(cpu);
> > 			if (policy && policy->cpuinfo.max_freq)
> > 				max_tsc_khz =3D policy->cpuinfo.max_freq;
> > 			put_cpu();
> >=20
> > 			if (policy)
> > 				cpufreq_cpu_put(policy);
> > 		}

...

> Yes, this will indeed change the execution order.
> Can you accept that?=20

No, because it's buggy.

> Personally, I don=E2=80=99t think it=E2=80=99s ideal either.
>=20
> 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
>  			int cpu;
> 			cpu =3D get_cpu();
> 			{
> 				struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_=
cpu_get(cpu);
> 				if (policy && policy->cpuinfo.max_freq)
> 					max_tsc_khz =3D policy->cpuinfo.max_freq;
> 			}
> 			put_cpu();
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }
>=20
> Other places may also have the same issue,
>=20
> maybe we should consider introducing a macro to handle this properly,
> so that initialization and cleanup are well defined without changing
> the existing order unexpected.
>=20
> like this:
>=20
> #define WITH_CPUFREQ_POLICY(cpu) {\
>=20
> for(struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D  \
> 			cpufreq_cpu_get(cpu);			\
> 			policy;)
>=20
> Then Use it:
>=20
> 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
>  			int cpu;
> 			cpu =3D get_cpu();
> 			WITH_CPUFREQ_POLICY(cpu){
> 				if (policy->cpuinfo.max_freq)
> 					max_tsc_khz =3D policy->cpuinfo.max_freq;
> 			}
> 			put_cpu();

This all feels very forced, in the sense that we have a shiny new tool and =
are
trying to use it everywhere without thinking critically about whether or no=
t
doing so is actually an improvement.

At a glance, this is literally the only instance in the entire kernel where=
 the
CPU to use is grabbed immediately before the policy.
=20
  $ git grep -B 20 cpufreq_cpu_get | grep -e get_cpu -e smp_processor_id
  arch/x86/kvm/x86.c-			cpu =3D get_cpu();
  drivers/cpufreq/cppc_cpufreq.c-static int cppc_get_cpu_power(struct devic=
e *cpu_dev,
  drivers/cpufreq/cppc_cpufreq.c-static int cppc_get_cpu_cost(struct device=
 *cpu_dev, unsigned long KHz,
  drivers/cpufreq/mediatek-cpufreq-hw.c-mtk_cpufreq_get_cpu_power(struct de=
vice *cpu_dev, unsigned long *uW,

Probably because KVM's usage is rather bizarre and honestly kind of dumb.  =
But
KVM has had this behavior for 15+ years, so as weird as it is, I'm not incl=
ined
to change it without a really, really strong reason to do so, e.g. to itera=
te
over all CPUs or something.

So given that this is the only intance of the problem patter, I think it ma=
kes
sense to leave KVM as-is, and not spend a bunch of time trying to figure ou=
t how
to make KVM's usage play nice with __free().
