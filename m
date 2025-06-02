Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A94ACBC4D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 22:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5FC10E0B4;
	Mon,  2 Jun 2025 20:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="dQWGK9I5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30F210E0B4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 20:29:17 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250602202916euoutp01da2e7b87044119a27d24c4c0e9252799~FU8m8QfrJ1851218512euoutp01T
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 20:29:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250602202916euoutp01da2e7b87044119a27d24c4c0e9252799~FU8m8QfrJ1851218512euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748896156;
 bh=LuhVx3O/KQGQRsU4OiisGNAVlHn1IT4eSr0XOaKuRxg=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=dQWGK9I5Kymf2Oxbg083v5CScrK9gSjZ6LDDnbqgKc+GEtquZvl0xvNiffNHXllue
 J9ElVWxIBMYAp1IQkKn25cNMD39Txt060JVHBkQP3HXc0bNWvfKFM5PcBcVYZo7077
 8jSf9m0ScDbDtmphg4onBnUWGf+6HRAfxuyr6avA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250602202914eucas1p1246d0c3c93222b9f80224b994573a31b~FU8lmjGhp1197511975eucas1p1Z;
 Mon,  2 Jun 2025 20:29:14 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250602202913eusmtip29f78e7b1758034d46ee105342391380b~FU8kkyi-L0590905909eusmtip2D;
 Mon,  2 Jun 2025 20:29:13 +0000 (GMT)
Message-ID: <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
Date: Mon, 2 Jun 2025 22:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250602202914eucas1p1246d0c3c93222b9f80224b994573a31b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
X-EPHeader: CA
X-CMS-RootMailID: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
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



On 6/2/25 16:46, Bartosz Golaszewski wrote:
> On Fri, May 30, 2025 at 12:24 AM Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> Introduce device tree bindings for a new power sequencer provider
>> dedicated to the T-HEAD TH1520 SoC's GPU.
>>
>> The thead,th1520-gpu-pwrseq compatible designates a node that will
>> manage the complex power-up and power-down sequence for the GPU. This
>> sequencer requires a handle to the GPU's clock generator reset line
>> (gpu-clkgen), which is specified in its device tree node.
>>
>> This binding will be used by a new pwrseq driver to abstract the
>> SoC specific power management details from the generic GPU driver.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../bindings/power/thead,th1520-pwrseq.yaml        | 42 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  1 +
>>  2 files changed, 43 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml b/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..4c302abfb76fb9e243946f4eefa333c6b02e59d3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml
>> @@ -0,0 +1,42 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://protect2.fireeye.com/v1/url?k=55ca3a77-34b7d20f-55cbb138-74fe485fffb1-4da99284aaf5bdf2&q=1&e=085ffc69-21ad-4abd-9147-970a308c8818&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fpower%2Fthead%2Cth1520-pwrseq.yaml%23
>> +$schema: https://protect2.fireeye.com/v1/url?k=8e9b901c-efe67864-8e9a1b53-74fe485fffb1-c964471a6655716e&q=1&e=085ffc69-21ad-4abd-9147-970a308c8818&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>> +
>> +title: T-HEAD TH1520 GPU Power Sequencer
>> +
>> +maintainers:
>> +  - Michal Wilczynski <m.wilczynski@samsung.com>
>> +
>> +description: |
>> +  This binding describes the power sequencer for the T-HEAD TH1520 GPU.
>> +  This sequencer handles the specific power-up and power-down sequences
>> +  required by the GPU, including managing clocks and resets from both the
>> +  sequencer and the GPU device itself.
>> +
>> +properties:
>> +  compatible:
>> +    const: thead,th1520-gpu-pwrseq
>> +
> 
> Before I review the rest: is this actually a physical device that
> takes care of the power sequencing? Some kind of a power management
> unit for the GPU? If so, I bet it's not called "power sequencer" so
> let's use its actual name as per the datasheet?

Hi Bart,
Thanks for your feedback. 

The hardware block responsible for powering up the components in the
TH1520 SoC datasheet is called AON (Always On). However, we already have
a DT node named aon that serves as a power domain provider
(Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml).

Following the discussion [1] about needing a separate DT node for the
power sequencing capabilities of this AON block, and thinking further
about it, I think the binding should be more generic. The AON block can
manage power sequences for more than just the GPU (e.g. NPU, AUDIO,
DSP).

The compatible string could be updated like so:
"thead,th1520-aon-pwrseq"

And the description:
"
  This binding describes the hardware capabilities within the Always-On
  (AON) block of the T-HEAD TH1520 SoC responsible for controlling and
  sequencing the power supply to various integrated peripherals, such as
  the GPU, NPU, Audio, and DSP.
"

The exact power architecture of the SoC is described in the chapter
6.3.2 (Power Architecture) [2]. The "VDEC/NPU/VENC/GPU/DSP Power Up/
Power Down" is described in chapter 6.4.2.3.

[1] - https://lore.kernel.org/all/CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQhQMTWy1yyrRg@mail.gmail.com/
[2] - https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf

> 
> Bart
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
