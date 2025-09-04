Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4EEB43CDC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 15:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75CA10E23F;
	Thu,  4 Sep 2025 13:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rSeeYMQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1410E23F;
 Thu,  4 Sep 2025 13:17:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2570644C65;
 Thu,  4 Sep 2025 13:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A68C4CEF6;
 Thu,  4 Sep 2025 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756991858;
 bh=J37h8zaAlmHnvnALjyhUgHlYpkvFqaV8s8bqNB0XjFQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rSeeYMQC35U85BwNUUpTccZq+hmNBZVbOybxyuurDfaGkCAOruDMl/BJ+6V3r+u6h
 58CWTnMu+bkN110RdLUvsucq93Jc3d5+kS4frgCgo3FVx3GWK1mqvcgH10uQaLNdrC
 SjzoQa4PZZYmq/Cxf5GId4h0wwWgehrTcd3/KL9uaLs131Bk/JxcPE98Jb6fe/jKYz
 z9ZzUD2u+kcZHrqVDT3DoVuv24+ayotdgqIP+Ft/7HhGElCcWzJX7QOvWcqV7tq8AE
 Dyj7Rt7r/bwUN6zrO9NKAoaO0vQbLGPtbHKeSIOKcrHhUaGW45oySjjKxi6/1oZJq4
 26vW+iK8JHIJQ==
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7459de59821so897776a34.1; 
 Thu, 04 Sep 2025 06:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCViIgPx4RNjnn97vt7DIwy//XKhv+F8zi+fR5ViyY3rM5/TQU8rj1la30IJMUVbEEjQp+kNmZK70cO8@lists.freedesktop.org,
 AJvYcCWkG5ARAqUWbz+mQOTl6z0jC6VHw6fGMmEgelTk2ew3SoyCNYnuqf9luMI4HM1GIKJl1LDcrFuriHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHnjo1AaL6biwcVLNgPAXUQKKhZpKv4DAVxV9uUMX0uLc5kJp3
 owCaoxfpjFNQJWbi+B+NcQ1eDcV+YkLmqd4zPe0BkcnACG2X4c4VEP5bVE4cxhiep+ETlHI6LAY
 0mgPJ0efEr+mQEzQCai0NkwJ0iSaiO4k=
X-Google-Smtp-Source: AGHT+IEjDfW+3hJPUPYu26F2xz+pxJ+KiqPGjYP79H7T0/I1zIoWql1eDpgpdg2oH+VBSzMp/G1t2kU5l5bZBE+Bi2g=
X-Received: by 2002:a05:6830:4901:b0:73e:8c8b:749 with SMTP id
 46e09a7af769-74569c6739fmr14127345a34.0.1756991857138; Thu, 04 Sep 2025
 06:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-8-zhangzihuan@kylinos.cn>
 <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
 <52e322e5-2dd4-488c-a98e-3a4018f0c323@kylinos.cn>
In-Reply-To: <52e322e5-2dd4-488c-a98e-3a4018f0c323@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 4 Sep 2025 15:17:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g__9g_dfA3=4GVi351f4CKBegKkW9nU81j+Qu=2Hfg1Q@mail.gmail.com>
X-Gm-Features: Ac12FXwmEGaidQr8PE8Gnv5hzk4SwGXFsXwEgV1BR4I0F2oh9v2_Dsc7pRXgYnA
Message-ID: <CAJZ5v0g__9g_dfA3=4GVi351f4CKBegKkW9nU81j+Qu=2Hfg1Q@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] powercap: dtpm_cpu: Use scope-based cleanup
 helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Ben Horgan <ben.horgan@arm.com>, 
 zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui <rui.zhang@intel.com>, 
 Len Brown <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>, 
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, 
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Sep 4, 2025 at 12:38=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
>
> =E5=9C=A8 2025/9/3 21:45, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
> >> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >> annotation for policy references. This reduces the risk of reference
> >> counting mistakes and aligns the code with the latest kernel style.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >> ---
> >>   drivers/powercap/dtpm_cpu.c | 30 +++++++++++-------------------
> >>   1 file changed, 11 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> >> index 99390ec1481f..f76594185fa2 100644
> >> --- a/drivers/powercap/dtpm_cpu.c
> >> +++ b/drivers/powercap/dtpm_cpu.c
> >> @@ -144,19 +144,17 @@ static int update_pd_power_uw(struct dtpm *dtpm)
> >>   static void pd_release(struct dtpm *dtpm)
> >>   {
> >>          struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
> >> -       struct cpufreq_policy *policy;
> >>
> >>          if (freq_qos_request_active(&dtpm_cpu->qos_req))
> >>                  freq_qos_remove_request(&dtpm_cpu->qos_req);
> >>
> >> -       policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
> >> -       if (policy) {
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> >> +               cpufreq_cpu_get(dtpm_cpu->cpu);
> >> +
> >> +       if (policy)
> >>                  for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
> >>                          per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL=
;
> >>
> >> -               cpufreq_cpu_put(policy);
> >> -       }
> >> -
> >>          kfree(dtpm_cpu);
> >>   }
> >>
> >> @@ -192,7 +190,6 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
> >>   static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
> >>   {
> >>          struct dtpm_cpu *dtpm_cpu;
> >> -       struct cpufreq_policy *policy;
> >>          struct em_perf_state *table;
> >>          struct em_perf_domain *pd;
> >>          char name[CPUFREQ_NAME_LEN];
> >> @@ -202,21 +199,19 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm=
 *parent)
> >>          if (dtpm_cpu)
> >>                  return 0;
> >>
> >> -       policy =3D cpufreq_cpu_get(cpu);
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> >> +               cpufreq_cpu_get(cpu);
> >> +
> >>          if (!policy)
> >>                  return 0;
> >>
> >>          pd =3D em_cpu_get(cpu);
> >> -       if (!pd || em_is_artificial(pd)) {
> >> -               ret =3D -EINVAL;
> >> -               goto release_policy;
> >> -       }
> >> +       if (!pd || em_is_artificial(pd))
> >> +               return -EINVAL;
> >>
> >>          dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
> >> -       if (!dtpm_cpu) {
> >> -               ret =3D -ENOMEM;
> >> -               goto release_policy;
> >> -       }
> >> +       if (!dtpm_cpu)
> >> +               return -ENOMEM;
> >>
> >>          dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
> >>          dtpm_cpu->cpu =3D cpu;
> >> @@ -239,7 +234,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *=
parent)
> >>          if (ret < 0)
> >>                  goto out_dtpm_unregister;
> > So this change kind of goes against another recommendation given in cle=
anup.h:
> >
> >   * Lastly, given that the benefit of cleanup helpers is removal of
> >   * "goto", and that the "goto" statement can jump between scopes, the
> >   * expectation is that usage of "goto" and cleanup helpers is never
> >   * mixed in the same function. I.e. for a given routine, convert all
> >   * resources that need a "goto" cleanup to scope-based cleanup, or
> >   * convert none of them.
>
>
> Should I replace all the memory allocation cleanups here with `__free`?
> That would allow us to drop all the `goto`s, but since this function has
> quite a few of them, I=E2=80=99m concerned it might introduce new issues.=
 What=E2=80=99s
> your recommendation?

Frankly, don't use __free() in this code at all, at least for the time bein=
g.

There is a problem with dropping the reference to policy at the end of
__dtpm_cpu_setup() because that policy may be subsequently indirectly
used in set_pd_power_limit() which calls
freq_qos_update_request(&dtpm_cpu->qos_req, freq) and
dtpm_cpu->qos_req->qos is policy->constraints, so using it will cause
policy->constraints to be dereferenced in freq_qos_apply() which will
crash and burn if the policy goes away in the meantime.  So AFAICS
__dtpm_cpu_setup() shouldn't call cpufreq_cpu_put() at all and the
policy should be released in pd_release() without acquiring a new
reference to it.

You may as well try to fix this if you have free cycles.
