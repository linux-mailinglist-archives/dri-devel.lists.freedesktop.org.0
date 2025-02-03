Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94ABA26044
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 17:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CCA10E094;
	Mon,  3 Feb 2025 16:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="eqIlO/HO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D1B10E094
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 16:37:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250203163712euoutp01da0b8f9e06ab982457a30c9a7cc7e57c~gwBBnO1l91604216042euoutp01B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 16:37:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250203163712euoutp01da0b8f9e06ab982457a30c9a7cc7e57c~gwBBnO1l91604216042euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738600632;
 bh=/cjF2im7siOiRdn6B6izW0xKqowa+3BJEzUkFArNsjo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=eqIlO/HOAFpoGziSEqaOMHHc+ydxjJJu8CpeLv0ufip4qyRX9/GVe4MwHyM18GO4p
 G5Htabhaa706MiR8mAA5vpe5FN9TkY04l613ObrzbTiQKPG4DHUXQM3TU5TaBHFGeS
 9JUVGgJaBHcG8CnDnpnKYrsINeOmFOSXzWQODxQg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250203163712eucas1p196275d9f0ceacf6984a9f5673ad536bb~gwBBPupgn2798727987eucas1p1N;
 Mon,  3 Feb 2025 16:37:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C1.B5.20397.8B0F0A76; Mon,  3
 Feb 2025 16:37:12 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250203163711eucas1p2ab0c98052dc0a04ce4987506bd35a049~gwBAlOVr90838708387eucas1p2D;
 Mon,  3 Feb 2025 16:37:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250203163711eusmtrp25c9d58ffb8e37537f418fd4b3409e540~gwBAkaHwf0261902619eusmtrp2P;
 Mon,  3 Feb 2025 16:37:11 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-81-67a0f0b809ad
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 64.52.19654.7B0F0A76; Mon,  3
 Feb 2025 16:37:11 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250203163709eusmtip19af3cc094845c3ff2a93337b7ae89a3b~gwA_S6qf32821528215eusmtip1O;
 Mon,  3 Feb 2025 16:37:09 +0000 (GMT)
Message-ID: <ac770f68-8518-460c-ae07-7655b4dd2dea@samsung.com>
Date: Mon, 3 Feb 2025 17:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] clk: thead: Add clock support for VO subsystem
 in T-Head TH1520 SoC
To: Matt Coster <Matt.Coster@imgtec.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "jszhang@kernel.org" <jszhang@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <cf668998-4f86-4a85-8137-7a8f689c2aa9@imgtec.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTZxzGfXtOzzltUjgUGC86A6mOOeOwG3V5iYYogXFwH7YlZDP7oFQ5
 qSi39ABublM2LgGsiIBBi0DxMlgn4LgWUmDSCnZVoHQrxEFhG2SAXGT1Mh2DUQ9ufPvl+V+e
 //PmpTCpkdhIxSelsuokZYKMEOMtPc/63zQ81Knk9puvoDtDVwSo+W8tiW509AlQpblPiJyD
 TQL00+MFAtVNDpBoquMrHDlqykmU2VNPoGmtk0CLGqcQ2dsvE8h11gxQiyuLQLXmURJVLTbj
 6JqhHaCcvG+EyPZjJBp13sHRtF2DoRytJ1oxGki07PgeR2XzXSRqmj0vRL21H6OsrhJ872Zm
 YTibZGanp3HGlPuIZDqe6HCmTTtKMpq2u4Bp0OcRzIjDSDAVlg+ZsTO9Aqbx2mkmq7ZHwJz7
 R84sdP5MMAVNesAMZg6RH0g/Ee+JYxPi01n1zrBY8dG79gEspZz9dPaXQmEGeBKTD0QUpBWw
 KKME5AMxJaVrAJycN5HugpR+BKDT/A5fcAH4YHgKezlhzJhYm6gGsOKHBYKfmAPQZPVys4QO
 g+Z6G3AzTm+Fi+Zsgte9oOXSBO5mXzoAjt2/+MLNmz4Cr56bFLqX+tCtFCxoHHtRwOgMDOYW
 nuLZD96fqBS4maDfhuPVlUI3i1bNzpuyAN8TAFvnLmPuRZC+J4ZPbzmE/NkRsG6pai2CN5zp
 bSJ5fhWutPFLIZ0Mx5v/XOv5ArZpetd4Nxzpe76agFo1eAPWt+/k5X1wvPw26ZYh7QGH57z4
 EzxgUUspxssSmJsj5buD4AXN2f9M+2paBIVApl33Ktp1IbXrwmj/99UBXA/82DQuUcVyIUns
 iWBOmcilJamCjyQnNoDVD25d7n1sADUzi8HdQECBbgApTOYjsbbqVFJJnPKzk6w6+ZA6LYHl
 usEmCpf5Sa50ZauktEqZyh5n2RRW/bIqoEQbMwSb+vee9IigLv1eF1lxVTVVPONDK7KHd7TT
 +3yrDx/ovBmeeHprkF0dcEv17LbveH93bObn1lKPyHe37WeWg4pB4475wcKDZbrQsl2HuMOp
 qqHimfiPxCmG8uvRCnHMif0rYeH96QOug9fzOxWnZHLV7p5joX+UBIso/1C5PjBkaVEs3OAa
 fD2ZEln8l6LSrJ6eN4y/vn/stYGGvD1/VR33ezAz4giJKoivimtLln9bFBhSvhJvVBQn/Vbq
 76SzYzu8N39niYo+0FApfy/wjE6hD8+MiJVHx+yyLV20lT3kvvSO0mzgpiK23MMTbRav9Jav
 Tf7GUf0Fq23789Gn2xyVW2Q4d1T51nZMzSn/BQp3GV1PBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsVy+t/xu7rbPyxIN+h+oWZx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i4Uft7JYLNmxi9GirXMZq8XFU64Wd++dYLF4ebmH2aJt
 Fr/F/z072C3+XdvIYjH73X52iy1vJrJaHF8bbtGyfwqLg6zH+xut7B5vXr5k8Tjc8YXdY++3
 BSweO2fdZffo2XmG0WPTqk42jzvX9rB5zDsZ6HG/+ziTx+Yl9R4ta48xefT/NfB4v+8qm0ff
 llWMHpear7MHCEXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSW
 pRbp2yXoZZy5fIG5YG5qxZvbE1gbGL+FdDFyckgImEjsaXjC2MXIxSEksJRRYuKxFawQCRmJ
 a90vWSBsYYk/17rYIIpeM0r8PX2ZCSTBK2AncWT9RUYQm0VAReLjkVY2iLigxMmZT8CaRQXk
 Je7fmsEOYgsLJEss7n/KCjJIRGAvh8SuGz9ZQBxmgQZmiVWzbzBDrPjLKHH09hKwFcwC4hK3
 nswHs9kEjCQeLJ8Pdh8n0OqJh1uAVnMA1ahLrJ8nBFEuL7H97RzmCYxCs5AcMgvJpFkIHbOQ
 dCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRmLa2Hfu5ZQfjylcf9Q4xMnEwHmKU4GBW
 EuE9vX1BuhBvSmJlVWpRfnxRaU5q8SFGU2BgTGSWEk3OBybOvJJ4QzMDU0MTM0sDU0szYyVx
 XrYr59OEBNITS1KzU1MLUotg+pg4OKUamBadD7rj/1l//7y3gaz7TvfK3/qR5ajo0rVCouH6
 p6m+tg6sBUVNdmfFfrH/uG1x1Kbec+WxG9maUu1di0+wCe2PyCu8e2TDj9OvDEOmMFkZ8pee
 dBDa92xxaA6L7ql7BvyTGy/9PV1lfGGnSna8auSNqw/qko//ehK6okLusubJvX/tz8lZW3qE
 cpq38h1/0DSRt8Te8arwe7ezaxUuuaZ8Z2K+++rfVZ9SfvUlLLnW5e2ruSz2VW7SSrXJbnNb
 XvXd8+fMZq3lzBba1UL19s5J7gzTo17z2U1xefe1q3nD1b9KH4VtBCaz3lXtuhSrer7hWrDF
 BJ51fOf+vsj/4tN15//RjVda/vE+mvnllBJLcUaioRZzUXEiAJshIF/kAwAA
X-CMS-MailID: 20250203163711eucas1p2ab0c98052dc0a04ce4987506bd35a049
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194827eucas1p25db822456e223563b8b411f77754c760
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194827eucas1p25db822456e223563b8b411f77754c760
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194827eucas1p25db822456e223563b8b411f77754c760@eucas1p2.samsung.com>
 <20250128194816.2185326-3-m.wilczynski@samsung.com>
 <cf668998-4f86-4a85-8137-7a8f689c2aa9@imgtec.com>
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



On 1/31/25 16:39, Matt Coster wrote:
> On 28/01/2025 19:48, Michal Wilczynski wrote:
>> The T-Head TH1520 SoC integrates a variety of clocks for its subsystems,
>> including the Application Processor (AP) and the Video Output (VO) [1].
>> Up until now, the T-Head clock driver only supported AP clocks.
>>
>> This commit extends the driver to provide clock functionality for the VO
>> subsystem. At this stage, the focus is on implementing the VO clock
>> gates, as these are currently the most relevant and required components
>> for enabling and disabling the VO subsystem functionality.  Future
>> enhancements may introduce additional VO-related clocks as necessary.
>>
>> Link: https://protect2.fireeye.com/v1/url?k=e2f52701-bd6e1e1e-e2f4ac4e-000babdfecba-2c98780e6a3b772c&q=1&e=4ed72090-09ae-4d99-9a05-caed33873a2b&u=https%3A%2F%2Fopenbeagle.org%2Fbeaglev-ahead%2Fbeaglev-ahead%2F-%2Fblob%2Fmain%2Fdocs%2FTH1520%2520System%2520User%2520Manual.pdf  [1]
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/clk/thead/clk-th1520-ap.c | 197 +++++++++++++++++++++++++-----
>>  1 file changed, 169 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
>> index 4c9555fc6184..57972589f120 100644
>> --- a/drivers/clk/thead/clk-th1520-ap.c
>> +++ b/drivers/clk/thead/clk-th1520-ap.c
>> @@ -847,6 +847,67 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
>>  static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
>>  static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
>>  
>> +static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(0), 0);
>> +static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
>> +		0x0, BIT(3), 0);
>> +static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(4), 0);
> 
> I see CORE and CFG clocks here; what about MEM? It's listed in the
> linked TRM as BIT(2).

It is however marked as 'Reserved' in manual, so I assumed I shouldn't
touch it.

Additionally referring to the vendor kernel, only two clocks are used to
program the GPU [1] in the old non-upstream driver.

[1] - https://github.com/revyos/thead-kernel/blob/lpi4a/drivers/gpu/drm/img-rogue/thead_sys.c#L400

> 
> Cheers,
> Matt
> 
>> +static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
>> +		video_pll_clk_pd, 0x0, BIT(5), 0);
>> +static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
>> +		video_pll_clk_pd, 0x0, BIT(6), 0);
>> +static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
>> +		BIT(7), 0);
>> +static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
>> +		BIT(8), 0);
>> +static CCU_GATE(CLK_DPU_CCLK, dpu_cclk, "dpu-cclk", video_pll_clk_pd, 0x0,
>> +		BIT(9), 0);
>> +static CCU_GATE(CLK_HDMI_SFR, hdmi_sfr_clk, "hdmi-sfr-clk", video_pll_clk_pd,
>> +		0x0, BIT(10), 0);
>> +static CCU_GATE(CLK_HDMI_PCLK, hdmi_pclk, "hdmi-pclk", video_pll_clk_pd, 0x0,
>> +		BIT(11), 0);
>> +static CCU_GATE(CLK_HDMI_CEC, hdmi_cec_clk, "hdmi-cec-clk", video_pll_clk_pd,
>> +		0x0, BIT(12), 0);
>> +static CCU_GATE(CLK_MIPI_DSI0_PCLK, mipi_dsi0_pclk, "mipi-dsi0-pclk",
>> +		video_pll_clk_pd, 0x0, BIT(13), 0);
>> +static CCU_GATE(CLK_MIPI_DSI1_PCLK, mipi_dsi1_pclk, "mipi-dsi1-pclk",
>> +		video_pll_clk_pd, 0x0, BIT(14), 0);
>> +static CCU_GATE(CLK_MIPI_DSI0_CFG, mipi_dsi0_cfg_clk, "mipi-dsi0-cfg-clk",
>> +		video_pll_clk_pd, 0x0, BIT(15), 0);
>> +static CCU_GATE(CLK_MIPI_DSI1_CFG, mipi_dsi1_cfg_clk, "mipi-dsi1-cfg-clk",
>> +		video_pll_clk_pd, 0x0, BIT(16), 0);
>> +static CCU_GATE(CLK_MIPI_DSI0_REFCLK, mipi_dsi0_refclk, "mipi-dsi0-refclk",
>> +		video_pll_clk_pd, 0x0, BIT(17), 0);
>> +static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
>> +		video_pll_clk_pd, 0x0, BIT(18), 0);
>> +static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
>> +		0x0, BIT(19), 0);
>> +static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(20), 0);
>> +static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(21), 0);
>> +static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
>> +		video_pll_clk_pd, 0x0, BIT(22), 0);
>> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
>> +		"iopmp-vosys-dpu-pclk", video_pll_clk_pd, 0x0, BIT(23), 0);
>> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
>> +		"iopmp-vosys-dpu1-pclk", video_pll_clk_pd, 0x0, BIT(24), 0);
>> +static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
>> +		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, BIT(25), 0);
>> +static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(27), 0);
>> +static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(28), 0);
>> +static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(29), 0);
>> +static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
>> +		video_pll_clk_pd, 0x0, BIT(30), 0);
>> +static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
>> +		video_pll_clk_pd, 0x0, BIT(31), 0);
>> +static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll_clk_pd,
>> +		0x4, BIT(0), 0);
>> +
>>  static CLK_FIXED_FACTOR_HW(gmac_pll_clk_100m, "gmac-pll-clk-100m",
>>  			   &gmac_pll_clk.common.hw, 10, 1, 0);
>>  
>> @@ -963,7 +1024,38 @@ static struct ccu_common *th1520_gate_clks[] = {
>>  	&sram3_clk.common,
>>  };
>>  
>> -#define NR_CLKS	(CLK_UART_SCLK + 1)
>> +static struct ccu_common *th1520_vo_gate_clks[] = {
>> +	&axi4_vo_aclk.common,
>> +	&gpu_core_clk.common,
>> +	&gpu_cfg_aclk.common,
>> +	&dpu0_pixelclk.common,
>> +	&dpu1_pixelclk.common,
>> +	&dpu_hclk.common,
>> +	&dpu_aclk.common,
>> +	&dpu_cclk.common,
>> +	&hdmi_sfr_clk.common,
>> +	&hdmi_pclk.common,
>> +	&hdmi_cec_clk.common,
>> +	&mipi_dsi0_pclk.common,
>> +	&mipi_dsi1_pclk.common,
>> +	&mipi_dsi0_cfg_clk.common,
>> +	&mipi_dsi1_cfg_clk.common,
>> +	&mipi_dsi0_refclk.common,
>> +	&mipi_dsi1_refclk.common,
>> +	&hdmi_i2s_clk.common,
>> +	&x2h_dpu1_aclk.common,
>> +	&x2h_dpu_aclk.common,
>> +	&axi4_vo_pclk.common,
>> +	&iopmp_vosys_dpu_pclk.common,
>> +	&iopmp_vosys_dpu1_pclk.common,
>> +	&iopmp_vosys_gpu_pclk.common,
>> +	&iopmp_dpu1_aclk.common,
>> +	&iopmp_dpu_aclk.common,
>> +	&iopmp_gpu_aclk.common,
>> +	&mipi_dsi0_pixclk.common,
>> +	&mipi_dsi1_pixclk.common,
>> +	&hdmi_pixclk.common
>> +};
>>  
>>  static const struct regmap_config th1520_clk_regmap_config = {
>>  	.reg_bits = 32,
>> @@ -972,8 +1064,44 @@ static const struct regmap_config th1520_clk_regmap_config = {
>>  	.fast_io = true,
>>  };
>>  
>> +struct th1520_plat_data {
>> +	struct ccu_common **th1520_pll_clks;
>> +	struct ccu_common **th1520_div_clks;
>> +	struct ccu_common **th1520_mux_clks;
>> +	struct ccu_common **th1520_gate_clks;
>> +
>> +	int nr_clks;
>> +	int nr_pll_clks;
>> +	int nr_div_clks;
>> +	int nr_mux_clks;
>> +	int nr_gate_clks;
>> +};
>> +
>> +static const struct th1520_plat_data th1520_ap_platdata = {
>> +	.th1520_pll_clks = th1520_pll_clks,
>> +	.th1520_div_clks = th1520_div_clks,
>> +	.th1520_mux_clks = th1520_mux_clks,
>> +	.th1520_gate_clks = th1520_gate_clks,
>> +
>> +	.nr_clks = CLK_UART_SCLK + 1,
>> +
>> +	.nr_pll_clks = ARRAY_SIZE(th1520_pll_clks),
>> +	.nr_div_clks = ARRAY_SIZE(th1520_div_clks),
>> +	.nr_mux_clks = ARRAY_SIZE(th1520_mux_clks),
>> +	.nr_gate_clks = ARRAY_SIZE(th1520_gate_clks),
>> +};
>> +
>> +static const struct th1520_plat_data th1520_vo_platdata = {
>> +	.th1520_gate_clks = th1520_vo_gate_clks,
>> +
>> +	.nr_clks = CLK_HDMI_PIXCLK + 1,
>> +
>> +	.nr_gate_clks = ARRAY_SIZE(th1520_vo_gate_clks),
>> +};
>> +
>>  static int th1520_clk_probe(struct platform_device *pdev)
>>  {
>> +	const struct th1520_plat_data *plat_data;
>>  	struct device *dev = &pdev->dev;
>>  	struct clk_hw_onecell_data *priv;
>>  
>> @@ -982,11 +1110,17 @@ static int th1520_clk_probe(struct platform_device *pdev)
>>  	struct clk_hw *hw;
>>  	int ret, i;
>>  
>> -	priv = devm_kzalloc(dev, struct_size(priv, hws, NR_CLKS), GFP_KERNEL);
>> +	plat_data = device_get_match_data(&pdev->dev);
>> +	if (!plat_data) {
>> +		dev_err(&pdev->dev, "Error: No device match data found\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	priv = devm_kzalloc(dev, struct_size(priv, hws, plat_data->nr_clks), GFP_KERNEL);
>>  	if (!priv)
>>  		return -ENOMEM;
>>  
>> -	priv->num = NR_CLKS;
>> +	priv->num = plat_data->nr_clks;
>>  
>>  	base = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(base))
>> @@ -996,35 +1130,35 @@ static int th1520_clk_probe(struct platform_device *pdev)
>>  	if (IS_ERR(map))
>>  		return PTR_ERR(map);
>>  
>> -	for (i = 0; i < ARRAY_SIZE(th1520_pll_clks); i++) {
>> -		struct ccu_pll *cp = hw_to_ccu_pll(&th1520_pll_clks[i]->hw);
>> +	for (i = 0; i < plat_data->nr_pll_clks; i++) {
>> +		struct ccu_pll *cp = hw_to_ccu_pll(&plat_data->th1520_pll_clks[i]->hw);
>>  
>> -		th1520_pll_clks[i]->map = map;
>> +		plat_data->th1520_pll_clks[i]->map = map;
>>  
>> -		ret = devm_clk_hw_register(dev, &th1520_pll_clks[i]->hw);
>> +		ret = devm_clk_hw_register(dev, &plat_data->th1520_pll_clks[i]->hw);
>>  		if (ret)
>>  			return ret;
>>  
>>  		priv->hws[cp->common.clkid] = &cp->common.hw;
>>  	}
>>  
>> -	for (i = 0; i < ARRAY_SIZE(th1520_div_clks); i++) {
>> -		struct ccu_div *cd = hw_to_ccu_div(&th1520_div_clks[i]->hw);
>> +	for (i = 0; i < plat_data->nr_div_clks; i++) {
>> +		struct ccu_div *cd = hw_to_ccu_div(&plat_data->th1520_div_clks[i]->hw);
>>  
>> -		th1520_div_clks[i]->map = map;
>> +		plat_data->th1520_div_clks[i]->map = map;
>>  
>> -		ret = devm_clk_hw_register(dev, &th1520_div_clks[i]->hw);
>> +		ret = devm_clk_hw_register(dev, &plat_data->th1520_div_clks[i]->hw);
>>  		if (ret)
>>  			return ret;
>>  
>>  		priv->hws[cd->common.clkid] = &cd->common.hw;
>>  	}
>>  
>> -	for (i = 0; i < ARRAY_SIZE(th1520_mux_clks); i++) {
>> -		struct ccu_mux *cm = hw_to_ccu_mux(&th1520_mux_clks[i]->hw);
>> +	for (i = 0; i < plat_data->nr_mux_clks; i++) {
>> +		struct ccu_mux *cm = hw_to_ccu_mux(&plat_data->th1520_mux_clks[i]->hw);
>>  		const struct clk_init_data *init = cm->common.hw.init;
>>  
>> -		th1520_mux_clks[i]->map = map;
>> +		plat_data->th1520_mux_clks[i]->map = map;
>>  		hw = devm_clk_hw_register_mux_parent_data_table(dev,
>>  								init->name,
>>  								init->parent_data,
>> @@ -1040,10 +1174,10 @@ static int th1520_clk_probe(struct platform_device *pdev)
>>  		priv->hws[cm->common.clkid] = hw;
>>  	}
>>  
>> -	for (i = 0; i < ARRAY_SIZE(th1520_gate_clks); i++) {
>> -		struct ccu_gate *cg = hw_to_ccu_gate(&th1520_gate_clks[i]->hw);
>> +	for (i = 0; i < plat_data->nr_gate_clks; i++) {
>> +		struct ccu_gate *cg = hw_to_ccu_gate(&plat_data->th1520_gate_clks[i]->hw);
>>  
>> -		th1520_gate_clks[i]->map = map;
>> +		plat_data->th1520_gate_clks[i]->map = map;
>>  
>>  		hw = devm_clk_hw_register_gate_parent_data(dev,
>>  							   cg->common.hw.init->name,
>> @@ -1057,19 +1191,21 @@ static int th1520_clk_probe(struct platform_device *pdev)
>>  		priv->hws[cg->common.clkid] = hw;
>>  	}
>>  
>> -	ret = devm_clk_hw_register(dev, &osc12m_clk.hw);
>> -	if (ret)
>> -		return ret;
>> -	priv->hws[CLK_OSC12M] = &osc12m_clk.hw;
>> +	if (plat_data == &th1520_ap_platdata) {
>> +		ret = devm_clk_hw_register(dev, &osc12m_clk.hw);
>> +		if (ret)
>> +			return ret;
>> +		priv->hws[CLK_OSC12M] = &osc12m_clk.hw;
>>  
>> -	ret = devm_clk_hw_register(dev, &gmac_pll_clk_100m.hw);
>> -	if (ret)
>> -		return ret;
>> -	priv->hws[CLK_PLL_GMAC_100M] = &gmac_pll_clk_100m.hw;
>> +		ret = devm_clk_hw_register(dev, &gmac_pll_clk_100m.hw);
>> +		if (ret)
>> +			return ret;
>> +		priv->hws[CLK_PLL_GMAC_100M] = &gmac_pll_clk_100m.hw;
>>  
>> -	ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
>> -	if (ret)
>> -		return ret;
>> +		ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
>>  	if (ret)
>> @@ -1081,6 +1217,11 @@ static int th1520_clk_probe(struct platform_device *pdev)
>>  static const struct of_device_id th1520_clk_match[] = {
>>  	{
>>  		.compatible = "thead,th1520-clk-ap",
>> +		.data = &th1520_ap_platdata,
>> +	},
>> +	{
>> +		.compatible = "thead,th1520-clk-vo",
>> +		.data = &th1520_vo_platdata,
>>  	},
>>  	{ /* sentinel */ },
>>  };
> 
