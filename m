Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E7EACCD4D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 20:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9731C10E20A;
	Tue,  3 Jun 2025 18:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="p6R6G1I/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D831210E20A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 18:46:00 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250603184558euoutp01b6abf5bdb037bf79b3cc03b059401c58~FnLtl0PgF0588905889euoutp019
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 18:45:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250603184558euoutp01b6abf5bdb037bf79b3cc03b059401c58~FnLtl0PgF0588905889euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748976359;
 bh=uQI33aeDB3YvTs31NM2w9GJCDXa/2VEkwRCdI0P0nAY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=p6R6G1I/UJlWGGgHhiFgapjrXWtpYAp0wFUx+fMIeVC0whJhUVE4iLcwGu6uJQPDX
 tbymJJR4kt4AxTqJInTfFfiW/lTUg8oDgKpcT8YaXuF+Wcy7NCxP5XcIu6LOegllpE
 FPNMEGF9lWfUX5vjxWznVNzeajEcJYE5LuvBrQxA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250603184558eucas1p179c610c48e6f475d839e9e25585cbe2a~FnLs7Ny4R3131431314eucas1p1h;
 Tue,  3 Jun 2025 18:45:58 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250603184557eusmtip2e68f8fe1c77ac8990d75a102efcf9f08~FnLr3jqqk0715807158eusmtip2N;
 Tue,  3 Jun 2025 18:45:57 +0000 (GMT)
Message-ID: <c49ae9f2-3c3c-4253-be85-8fe5bbb4b42e@samsung.com>
Date: Tue, 3 Jun 2025 20:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] riscv: dts: thead: Add GPU power sequencer node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
 Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250603-gleaming-mammoth-of-kindness-538add@kuoka>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250603184558eucas1p179c610c48e6f475d839e9e25585cbe2a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333
X-EPHeader: CA
X-CMS-RootMailID: 20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-6-83d5744d997c@samsung.com>
 <20250603-gleaming-mammoth-of-kindness-538add@kuoka>
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



On 6/3/25 15:22, Krzysztof Kozlowski wrote:
> On Fri, May 30, 2025 at 12:23:53AM GMT, Michal Wilczynski wrote:
>> Add the device tree node for the T-HEAD TH1520 GPU power sequencer
>> (gpu_pwrseq) to the th1520.dtsi file.
>>
>> This node instantiates the thead,th1520-gpu-pwrseq driver, which
> 
> Explain the hardware, not what drivers do.
> 
>> is responsible for managing the GPU's power-on/off sequence. The node
>> specifies the gpu-clkgen reset, which is one of the resources
>> controlled by this sequencer.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  arch/riscv/boot/dts/thead/th1520.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
>> index bdbb1b985b0b76cf669a9bf40c6ec37258329056..6170eec79e919b606a2046ac8f52db07e47ef441 100644
>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
>> @@ -238,6 +238,12 @@ aon: aon {
>>  		#power-domain-cells = <1>;
>>  	};
>>  
>> +	gpu_pwrseq: pwrseq {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://protect2.fireeye.com/v1/url?k=a53ea5d3-c4434f50-a53f2e9c-74fe48600158-c81092475ef416b3&q=1&e=d333d06b-0b06-493e-a358-e29ca542dfe7&u=https%3A%2F%2Fdevicetree-specification.readthedocs.io%2Fen%2Flatest%2Fchapter2-devicetree-basics.html%23generic-names-recommendation
> 
>> +		compatible = "thead,th1520-gpu-pwrseq";
>> +		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
>> +		reset-names = "gpu-clkgen";
> 
> What is the point of pwrseq if there is no consumer/user of it? Looks
> like simple placeholder and anyway maybe the future consumer should just
> use reset directly.

Yeah I think you're right, I wanted to explore adding the pwrseq
provider in separate node per discussion in v2 [1]. But for the v4 I
think I'll revert to the v2 way of handling this reset [2].

[1] - https://lore.kernel.org/all/CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQhQMTWy1yyrRg@mail.gmail.com/
[2] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com/

> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
