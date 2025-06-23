Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96AAE3832
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CF010E1CC;
	Mon, 23 Jun 2025 08:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ac5AeUxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDB010E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:17:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250623081738euoutp01fb8e4ff7e66b865b4cf517c228e723fb~Lngz2Rivr1781017810euoutp018
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:17:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250623081738euoutp01fb8e4ff7e66b865b4cf517c228e723fb~Lngz2Rivr1781017810euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750666658;
 bh=luih2Qz/UMZ7UffUnmmhtm7LsPOMkm5qz+Oj9g8WGgY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ac5AeUxpahWu90BTdcQapKbM9aqN2n+swpFoyZNux/AMIjF1AoxaMEu6TC+F6O00G
 CbxTpQZx0/KGn24mBo75GFfhnJyXQpHwqTYXvdPIp1/fnN37faT4e/cFAaJl3GpaWy
 iPWHF/N4W8h/wcDf/tQOa6QvN+MDrwEIuSD2NECo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250623081738eucas1p125d25f5119cb753f78f01734b92487d6~LngzPqk8C1864418644eucas1p15;
 Mon, 23 Jun 2025 08:17:38 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250623081736eusmtip220e776f7d400c05e225edcce1c52eacc~LngyLH4rO2642326423eusmtip20;
 Mon, 23 Jun 2025 08:17:36 +0000 (GMT)
Message-ID: <12eed587-a8f3-4a67-8808-5e32617ded93@samsung.com>
Date: Mon, 23 Jun 2025 10:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add TH1520 GPU support with power sequencing
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
In-Reply-To: <aFNrRtbWzeRa7GmQ@x1>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250623081738eucas1p125d25f5119cb753f78f01734b92487d6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468
X-EPHeader: CA
X-CMS-RootMailID: 20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468
References: <CGME20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <aFNrRtbWzeRa7GmQ@x1>
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



On 6/19/25 03:43, Drew Fustini wrote:
> On Wed, Jun 18, 2025 at 12:22:06PM +0200, Michal Wilczynski wrote:
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
> 
> The powevr probe complains:
> 
> [    1.060383] powervr ffef400000.gpu: Direct firmware load for powervr/rogue_36.52.104.182_v1.fw failed with error -2
> 
> Where is the correct place to get the firmware?

Hi,

Apologies for the late reply, it was a long weekend in Poland and I was
away without access to e-mail.

This is the Imagination repository that hosts the firmware [1].
Admittedly I'm not using the newest firmware blobs available, as per
discussion here [2] I downloaded mine last year so haven't tested the
new ones yet.

For my own testing, I  embed the firmware directly into the kernel to
avoid issues with the initramfs. If you're compiling your own kernel,
you can do this with the following configuration options:

CONFIG_EXTRA_FIRMWARE="powervr/rogue_36.52.104.182_v1.fw"
CONFIG_EXTRA_FIRMWARE_DIR="/home/local_user"

[1] - https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr/powervr?ref_type=heads
[2] - https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/2#note_2642740

> 
> Thanks,
> Drew
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
