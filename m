Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E3BB3FE36
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9460610E32A;
	Tue,  2 Sep 2025 11:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HPfsH/6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA3710E32A;
 Tue,  2 Sep 2025 11:47:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B1D7844AEF;
 Tue,  2 Sep 2025 11:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8731AC116C6;
 Tue,  2 Sep 2025 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756813665;
 bh=gAWv/p7BEF+KhNFGeotQ/1FrGNmecWyX1X5tGPHcCbM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HPfsH/6ZQcNOGF26sYaQeEFwmNMIdemb3Sta1S24MP4Zqrzhp4xCYmME5rlpIalRH
 wypS78addLryNXm+pxr8ZGRJ6CcNSwygSiD1yVSMsso71z9NbVxptxqSwM6eYw/hYg
 E0n3a2RupUKViIi/xlJEoNXhZ7BEfE1ktdGaf5/LFZ2Ez9stJf6othwGdlk629boGF
 /qfOkz7gPd4OTUDCeTkBwoG5jhFrt7JDvzdGAjA8tfRoviw73ahpeW1eDDr4LJyfaL
 kf0/YFTRyn96EDkuB2SQEiQU90yOjmPyWIIFwn87EXpdsYgRoiI9E5Ci5ZKOtauLQA
 Z0F2061pPrGmQ==
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-74381e207a0so3751728a34.0; 
 Tue, 02 Sep 2025 04:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV3KRazyPGiAkjzaORMUz4KisEFCheCSjyg2314D2Il4hCrZBqIj4ZVNSuW2qib10n0M+u1nBffei0=@lists.freedesktop.org,
 AJvYcCVdjmjkzBJ22OIpFwAjgGCa9g9qF+ioK7SgFU7WwUgmoOH0Ems1HZ6//nAeMlVJ4XzrGwW0z1AcQaDc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNUFlYfTWRGPPRBX9x3i4uphkJRX94Rr+KUv/EIOVo9NcVb+Km
 RGeGdowoQWAZA9LWtErp0IX6nEdIRLtZwESoO8wEFO4V5VUMYOghdidlqHLMSw8Wr5yR8Ikw/xS
 SmsLDvVX+6i+e1R9rsty2J1okrWrPFqM=
X-Google-Smtp-Source: AGHT+IECJJHjGAnU1NUr4ozcxCWnRFCL9WRpq+BEhjBinEbwysmqVcNyjx+zeZUwmYMUKeDdT6dFc6CYWYPr3CoZ3wk=
X-Received: by 2002:a05:6830:3746:b0:743:8af2:1b0e with SMTP id
 46e09a7af769-74569e90f29mr6034860a34.19.1756813664724; Tue, 02 Sep 2025
 04:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
 <20250901085748.36795-4-zhangzihuan@kylinos.cn>
 <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
 <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn>
In-Reply-To: <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 2 Sep 2025 13:47:33 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
X-Gm-Features: Ac12FXxFwO1d3JYj5phS50T_U2DONG2wuxBfs8rK_GU-NaLU6wYAD3eFplzuixw
Message-ID: <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] cpufreq: intel_pstate: Use scope-based cleanup
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

On Tue, Sep 2, 2025 at 12:33=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
>
> =E5=9C=A8 2025/9/1 23:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
> >> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >> annotation for policy references. This reduces the risk of reference
> >> counting mistakes and aligns the code with the latest kernel style.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >> ---
> >>   drivers/cpufreq/intel_pstate.c | 8 +++-----
> >>   1 file changed, 3 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_ps=
tate.c
> >> index f366d35c5840..4abc1ef2d2b0 100644
> >> --- a/drivers/cpufreq/intel_pstate.c
> >> +++ b/drivers/cpufreq/intel_pstate.c
> >> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(struc=
t cpufreq_policy *policy,
> >>
> >>   static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
> >>   {
> >> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpudata->cpu);
> >>
> >> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
> >>          if (!policy)
> >>                  return false;
> > The structure of the code is intentional here and there's no reason to
> > change it.
>
>
> Got it. Thanks for clarifying.
>
> So for this case the current structure is intentional -

Note that I'm talking about this particular change only.  The other
change in the $subject patch is fine.

> should I also avoid similar changes in other drivers?

That depends on who maintains them, which is why I wanted you to split
the patch into smaller changes in the first place.

My personal view is that code formatting changes, which effectively is
what this particular one is, are pointless unless they make the code
much easier to follow.
