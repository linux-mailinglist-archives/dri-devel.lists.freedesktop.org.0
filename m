Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9438B37B82
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1287C10E721;
	Wed, 27 Aug 2025 07:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CBC10E6EB;
 Wed, 27 Aug 2025 02:32:39 +0000 (UTC)
X-UUID: 1608347c82ee11f0b29709d653e92f7d-20250827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:9ef84008-8d93-4efc-b22c-c01a63cd65b6, IP:0,
 U
 RL:0,TC:0,Content:30,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:30
X-CID-META: VersionHash:6493067, CLOUDID:9b84e483923621b91582f098a4e5a9f9,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:4|50,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1608347c82ee11f0b29709d653e92f7d-20250827
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <zhangzihuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 1094580345; Wed, 27 Aug 2025 10:32:33 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 85EFFE008FAC;
 Wed, 27 Aug 2025 10:32:32 +0800 (CST)
X-ns-mid: postfix-68AE6E40-207889202
Received: from localhost.localdomain (unknown [172.25.120.24])
 by mail.kylinos.cn (NSMail) with ESMTPA id C0D71E008FAA;
 Wed, 27 Aug 2025 10:32:14 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
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
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v2 00/18] cpufreq: use __free() for all cpufreq_cpu_get()
 references
Date: Wed, 27 Aug 2025 10:31:44 +0800
Message-Id: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 27 Aug 2025 07:22:35 +0000
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

This patchset converts all remaining cpufreq users to rely on the
__free(put_cpufreq_policy) annotation for policy references, instead of
calling cpufreq_cpu_put() manually.

Motivation:
- Reduce the chance of reference counting mistakes
- Make the code more consistent with the latest kernel style
- behavior remains the same, but reference counting is now safer=20
  and easier to maintain.

The changes are split into 18 patches as they touch different subsystems
and are maintained by different people. There is no functional change.

V2:
 - Fix compile error in powernv-cpufreq.c
 - Split patch to separate logical changes

Zihuan Zhang (18):
  arm64: topology: Use __free(put_cpufreq_policy) for policy reference
  KVM: x86: Use __free(put_cpufreq_policy) for policy reference
  ACPI: processor: thermal: Use __free(put_cpufreq_policy) for policy
    reference
  cpufreq: brcmstb-avs-cpufreq: Use __free(put_cpufreq_policy) for
    policy reference
  cpufreq: CPPC: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: intel_pstate: Use __free(put_cpufreq_policy) for policy
    reference
  cpufreq: longhaul: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: mediatek: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: powernv: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: s5pv210: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: tegra186: Use __free(put_cpufreq_policy) for policy reference
  PM / devfreq: Use __free(put_cpufreq_policy) for policy reference
  drm/i915: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: powerpc: macintosh: Use __free(put_cpufreq_policy) for policy
    reference
  powercap: dtpm_cpu: Use __free(put_cpufreq_policy) for policy
    reference
  thermal: imx: Use __free(put_cpufreq_policy) for policy reference
  thermal/drivers/ti-soc-thermal:  Use __free(put_cpufreq_policy) for
    policy reference
  PM: EM: Use __free(put_cpufreq_policy) for policy reference

 arch/arm64/kernel/topology.c                  |  9 +++----
 arch/x86/kvm/x86.c                            | 10 ++++----
 drivers/acpi/processor_thermal.c              | 12 +++-------
 drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
 drivers/cpufreq/cppc_cpufreq.c                |  4 +---
 drivers/cpufreq/intel_pstate.c                |  3 +--
 drivers/cpufreq/longhaul.c                    |  3 +--
 drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
 drivers/cpufreq/powernv-cpufreq.c             |  7 +++---
 drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
 drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
 drivers/devfreq/governor_passive.c            | 19 ++++-----------
 drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
 drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
 drivers/powercap/dtpm_cpu.c                   | 24 ++++++-------------
 drivers/thermal/imx_thermal.c                 | 13 ++++------
 .../ti-soc-thermal/ti-thermal-common.c        | 12 ++++------
 kernel/power/energy_model.c                   |  7 ++----
 18 files changed, 46 insertions(+), 100 deletions(-)

--=20
2.25.1

