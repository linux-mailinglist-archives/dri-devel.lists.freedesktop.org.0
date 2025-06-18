Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFF2ADE7C3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 12:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD0889A5D;
	Wed, 18 Jun 2025 10:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="GC3BPgKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B7D10E80A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:02:15 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250618100214euoutp013d1cddc67f74ff406795cdd5466fdcef~KGttPgkKl2874528745euoutp01U
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:02:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250618100214euoutp013d1cddc67f74ff406795cdd5466fdcef~KGttPgkKl2874528745euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750240934;
 bh=mnBVL+TiGzXcC6y2voLdZWspxbuthkDVJJY2G1jD6rI=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=GC3BPgKISPlo40xYj6LKCbLn1TG1GuRBIKI9k6RDE0adYjbjWW3V+CNPIUK9POa+G
 rg5JrO6X8a5L6Cb9k6vfyFay+hzBb0YwAiYLKJJETW4/vcj5VXxJiUG4KTiBXAVNCG
 6dlS2WNdMZmzVtCi5Co7nZdwml43AG3hXU3q4lFQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250618100213eucas1p10ead7541682e1c8b8985121bf634c83a~KGts1_7dl0901009010eucas1p1v;
 Wed, 18 Jun 2025 10:02:13 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250618100212eusmtip23b29d2b5e5877af3f8f5b7582a97d35d~KGtr0JUpH2681926819eusmtip2Q;
 Wed, 18 Jun 2025 10:02:12 +0000 (GMT)
Message-ID: <4772bf3d-c7d7-4108-8bc6-ee28953c89c1@samsung.com>
Date: Wed, 18 Jun 2025 12:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Add TH1520 GPU support with power sequencing
To: Drew Fustini <drew@pdp7.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aFHosEvn35Fr3LFv@x1>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250618100213eucas1p10ead7541682e1c8b8985121bf634c83a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3
X-EPHeader: CA
X-CMS-RootMailID: 20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3
References: <CGME20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3@eucas1p1.samsung.com>
 <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
 <aFHosEvn35Fr3LFv@x1>
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



On 6/18/25 00:14, Drew Fustini wrote:
> On Sat, Jun 14, 2025 at 08:06:06PM +0200, Michal Wilczynski wrote:
>> This patch series introduces support for the Imagination IMG BXM-4-64
>> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
>> managing the GPU's complex power-up and power-down sequence, which
>> involves multiple clocks and resets.
>>
>> The TH1520 GPU requires a specific sequence to be followed for its
>> clocks and resets to ensure correct operation. Initial discussions and
>> an earlier version of this series explored managing this via the generic
>> power domain (genpd) framework. However, following further discussions
>> with kernel maintainers [1], the approach has been reworked to utilize
>> the dedicated power sequencing (pwrseq) framework.
>>
>> This revised series now employs a new pwrseq provider driver
>> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
>> encapsulates the SoC specific power sequence details. The Imagination
>> GPU driver (pvr_device.c) is updated to act as a consumer of this power
>> sequencer, requesting the "gpu-power" target. The sequencer driver,
>> during its match phase with the GPU device, acquires the necessary clock
>> and reset handles from the GPU device node to perform the full sequence.
>>
>> This approach aligns with the goal of abstracting SoC specific power
>> management details away from generic device drivers and leverages the
>> pwrseq framework as recommended.
>>
>> The series is structured as follows:
>>
>> Patch 1: Introduces the pwrseq-thead-gpu auxiliary driver to manage the
>>          GPU's power-on/off sequence.
>> Patch 2: Adds device tree bindings for the gpu-clkgen reset to the
>>          existing thead,th1520-aon binding.
>> Patch 3: Extends the pm-domains driver to detect the gpu-clkgen reset
>>          and spawn the pwrseq-thead-gpu auxiliary driver.
>> Patch 4: Updates the Imagination DRM driver to utilize the pwrseq
>>          framework for TH1520 GPU power management.
>> Patch 5: Adds the thead,th1520-gpu compatible string to the PowerVR GPU
>>          device tree bindings.
>> Patch 6: Adds the gpu-clkgen reset property to the aon node in the
>>          TH1520 device tree source.
>> Patch 7: Adds the device tree node for the IMG BXM-4-64 GPU and its
>>          required fixed-clock.
>> Patch 8: Enables compilation of the Imagination PowerVR driver on the
>>          RISC-V architecture.
>>
>> This patchset finishes the work started in bigger series [2] by adding
>> all remaining GPU power sequencing piece. After this patchset the GPU
>> probes correctly.
>>
>> This series supersedes the previous genpd based approach. Testing on
>> T-HEAD TH1520 SoC indicates the new pwrseq based solution works
>> correctly.
>>
>> An open point in Patch 7/8 concerns the GPU memory clock (gpu_mem_clk),
>> defined as a fixed-clock. The specific hardware frequency for this clock
>> on the TH1520 could not be determined from available public
>> documentation. Consequently, clock-frequency = <0>; has been used as a
>> placeholder to enable driver functionality.
>>
> 
> I don't have any more information that what is in the public PDFs [1],
> so I think it is okay to have a placeholder frequency.
> 
> Is it the case that the frequency doesn't really matter from the
> perspective of the driver?

Yeah it doesn't matter, I asked simply because it would be better in the
DT to accurately describe the HW. I would omit the 'clock-frequency'
altogether, but doing that makes the driver probe fail.

> 
> Thanks,
> Drew
> 
> [1] https://protect2.fireeye.com/v1/url?k=260051e8-477bfb60-2601daa7-74fe4860018a-782a548f971ff58f&q=1&e=7e973bd1-ed36-4a12-af1c-1cf44bea2e5c&u=https%3A%2F%2Fgit.beagleboard.org%2Fbeaglev-ahead%2Fbeaglev-ahead%2F-%2Ftree%2Fmain%2Fdocs
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
