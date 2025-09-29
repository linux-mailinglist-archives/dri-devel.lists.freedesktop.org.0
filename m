Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B7BA948B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 15:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B3B10E418;
	Mon, 29 Sep 2025 13:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hKTf7M4G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798DB10E418
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 13:09:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cb1jd0W9Pz9syH;
 Mon, 29 Sep 2025 15:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759151349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3i8sgEYTGUHy8kVjZ5huWXY9cu39rjsciOdj7sJSMg=;
 b=hKTf7M4GViZx9i0g741/kIoaDKF/Ama5ONUp3M3XghqN1f/SdH+In8q4URpmUNaJzHGqyq
 Gs7gAw0+qvzRMaoumWU5sNbOPrl2Yj7Kj5ZK3ZtBuTNTwK6CXCa2Z7Aa0BeWPQXK5ocE1T
 pot54Tu9AoOuZaTtbM++A8WQBTgXbB/LA/sGNfa6Xqeofw1jZR4Yl4ERrYCp5ERuKjY6bD
 PxlOrFk+r/ilfEfq4omrWHGiRTsipaTHCKBB5UMU14fKa456DmMiAM82nESvkFoggh5JIu
 M2ACFchy+OWbxfsLKp0DAosl/b44SS55aKBpy8g0iu2nClriNun9SRG4MweRdg==
Message-ID: <cc873c8b-435c-467f-b1e9-dc78ddbfb483@mailbox.org>
Date: Mon, 29 Sep 2025 15:09:01 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.Li@nxp.com, airlied@gmail.com, alexander.stein@ew.tq-group.com,
 boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
 <8f4ed393-f94a-4abb-9cdd-60dd693f3ec6@mailbox.org>
 <aNpYG5VITPmKkNgl@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aNpYG5VITPmKkNgl@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: xz6qms6rn9anx7ejke9eg1k6bifj7mya
X-MBO-RS-ID: 2ab65ce22c334a37a55
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

On 9/29/25 11:57 AM, Rain Yang wrote:
> On Mon, Sep 29, 2025 at 02:23:01AM +0200, Marek Vasut wrote:
>> On 9/26/25 7:57 AM, Peng Fan wrote:
>>
>> Hello Peng,
>>
>>> On Thu, Sep 25, 2025 at 10:38:31PM +0200, Marek Vasut wrote:
>>>> The instance of the GPU populated in i.MX95 is the G310, describe this
>>>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>>>>
>>>>
>>>> +		gpu: gpu@4d900000 {
>>>> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>>>> +			reg = <0 0x4d900000 0 0x480000>;
>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>>>> +			clock-names = "core", "coregroup";
>>>> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			interrupt-names = "job", "mmu", "gpu";
>>>> +			mali-supply = <&gpu_fixed_reg>;
>>>> +			operating-points-v2 = <&gpu_opp_table>;
>>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>>>> +			#cooling-cells = <2>;
>>>> +			dynamic-power-coefficient = <1013>;
>>>
>>> Sorry for my ignorance, would you please share how to get the value?
>> Copy-pasted from NXP downstream kernel fork DT bindings, see:
>>
>> https://github.com/nxp-imx/linux-imx.git
>>
>> 11495de7c24a ("MGS-7621-4 dts: gpu: update devfreq para")
> Hi Marek,
> 
> 1. this "mali: gpu@4d900000" label can be found in this commit you showed.
> please correct this to be compatible with the downstream

No, sorry, that's not how it works. Upstream is not being adjusted to 
match decisions made by downstream kernel forks unless there is a good 
rationale for such a change. "Downstream does this" is not a good one. (*)

> and upstream kernel

All of imx*.dts* use gpu: or gpu2d:/gpu3d:/vpuvg: for the GPU label.
Also, variants of gpu: label seems more popular:

linux$ grep -hro '[a-z0-9_]\+: gpu@' arch/ | sort | uniq -c
       3 adreno_gpu: gpu@
       1 bb2d: gpu@
       1 gpu2d: gpu@
       1 gpu3d: gpu@
      80 gpu: gpu@
       4 gpu_2d: gpu@
       1 gpu_3d0: gpu@
       4 gpu_3d: gpu@
       6 gpu_mem: gpu@
       1 gpu_reserved: gpu@
       2 gpu_vg: gpu@
      17 mali: gpu@
       1 v3d: gpu@
       2 zap_shader_region: gpu@

> 2. the compatible string is different from our downstream kernel,

See above (*)

> also you dropped the "nxp,imx95-mali" compatible patch in the panthor
> driver, why?

Because it is unnecessary, the generic compatible string is sufficient 
for the in-tree kernel driver.

> this will impact the mali property driver too, which
> has already been used in many customer project.

See above (*)

All the more reason to focus on upstream and avoid deployment of various 
downstream components, blobs and so on. They cannot be maintained in the 
long run, they break, and cause all kinds of maintenance problems.

Upstream cannot be hindered by downstream blobs and their issues, sorry.

> 3. the number of frequency in opp-table is only one, but there are two clocks
> in clocks property, this really make people confused.
> CLK/CLK_COREGROUP/CLK_STACK in i.MX95 are from the same source
> <&scmi_clk IMX95_CLK_GPU>, the other clock <&scmi_clk IMX95_CLK_GPUAPB>
> is always-on APB clock, which can't be changed by A-cores, and has been removed
> from clocks property in the latest release.

Can the APB clock be enabled/disabled from Linux, e.g. to save power ?
