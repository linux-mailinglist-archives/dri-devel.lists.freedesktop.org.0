Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E9A26028
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 17:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E770510E502;
	Mon,  3 Feb 2025 16:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ArvF0MjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A4910E502
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 16:33:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250203163312euoutp01c5224a1b571f4155a3cab588582e5644~gv9hme7ja0956609566euoutp010
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 16:33:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250203163312euoutp01c5224a1b571f4155a3cab588582e5644~gv9hme7ja0956609566euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738600392;
 bh=jgdfJb5XmANzNdoB6KpErLTImnQzyQ4B5YNgFymn8uo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ArvF0MjG65fVMg69mkVaEVQOM6koztY9TK3I68u4PfB9Btah+WikaNfHO5Oo/PTXM
 7TMg1K8w3oBy5zF124yeE403UwXtSsHwJCt8Y8Ivfpxrn6PZGs3Eu0KQOVK1+GeMry
 c5Wv4yZZu53nS6/sy2qyjNRjOBQnpmBS66hcz93k=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250203163311eucas1p2e70de128fc35f5c0eed7024ef5d4a289~gv9g78N882024920249eucas1p2r;
 Mon,  3 Feb 2025 16:33:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 26.35.20397.7CFE0A76; Mon,  3
 Feb 2025 16:33:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250203163311eucas1p17f75b2012c9341f93af43f586809a81e~gv9giSMB20911509115eucas1p1R;
 Mon,  3 Feb 2025 16:33:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250203163311eusmtrp2f22113419fcf9cc31b947cee8f00f0da~gv9ggTqyx3261232612eusmtrp27;
 Mon,  3 Feb 2025 16:33:11 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-37-67a0efc7874e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B5.E1.19654.7CFE0A76; Mon,  3
 Feb 2025 16:33:11 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250203163309eusmtip2fde20ae086616fd76f79d37061338a0b~gv9fQ-z-u2728927289eusmtip2B;
 Mon,  3 Feb 2025 16:33:09 +0000 (GMT)
Message-ID: <6bdd711e-6515-43b9-aec1-4d90b87ff09f@samsung.com>
Date: Mon, 3 Feb 2025 17:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/18] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
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
In-Reply-To: <ed7a463e-9654-41c3-91f6-f3f877fd9a20@imgtec.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTHfW5v771U6y4FwxN1MJvNbE4QqjEPG0Nwc7tx02z7MMxMNhu9
 KUYorpVtkGUg5VWLuAG+XOxaGRNWpAItBToKWEkLoo3oBEd4S3SDMl6KwBYxo7Nc3Pj2O+f8
 zzn/8+ShBBI7sZ46qjzBqpTyJCkhwq3OJ+5w17RBEdlVHYo6+8ox1PCUI9FVuxtD+g63EA3d
 tWDo1/lpApl+v0OiMftJHPVW6UikcV4jkIcbItCMdkiI7tkuEWi2sAMg62w2gWo6Bkl0eaYB
 RxVNNoByC64IUc/NPWhwqBNHnntaAcrlXkC+liYSLfbW4ahsqo1ElonvhMhVk4Cy20rwuBeZ
 6Qc5JDPh8eDMjfw5krH/ZcCZZm6QZLTNtwBTbywgmIHeFoL5oesjZvi0C2PMFRlMdo0TY4r+
 iWSmW+8TzBmLETB3NX3kh5JPRTFH2KSjX7KqbbGHRInltyax41mhX+eVXMYyQQs8BQIoSO+A
 jTo9cQqIKAldBaCJMwv5YA5Am6kM8MEsgK1PTMLnLT1jJcuqSgDPjd7E+WASwLnrfhVFielY
 qJlQ+Rtw+mVoKnbgfhbTgbDr4qMlXkeHweH+C6Sfg+gEmHW7aMlHMN1IwTPm4aWCgM4UwPyz
 3/IcAvsf6TE/E7QMjlTqlxwFPNs1VTiK85owqGkoE/gHQbpHBO/UOpZtvwMLz3cDnoPguMtC
 8rwR+pr5oZBOgSMNjwU8fwObta5lfhMOuBcI/2EC+jV4zbaNT8fDPGc77k9Dei18MBnIW1gL
 v7eeF/BpMczPlfDqzbBUW/jfUneVFTsLpNyKV+FWHMmtOIb7f68B4EYQwqaqkxWseruS/SpC
 LU9WpyoVEYdTkuvBsx/eveiabwJV4zMRDoBRwAEgJZAGi7sbDQqJ+Ig8LZ1VpXyuSk1i1Q6w
 gcKlIeLythyFhFbIT7DHWPY4q3pexaiA9ZlY1sMuma7voMVX1/1Wd3Uc9zCx8/1g7+OMvezq
 pHWriyT7UmLlitpN1e3EH7oDGfPRV3YVJxyK36pKn25UyVoy6vsURHXOwKUklzvhWMTCuc7J
 Ovt9bd4Yycn2Xf0kcTJ6g3HsC+Fn3sDMk8SUd5Px9dOeqFW1UzEjrUGhO4NjNqZ/MF/5dqzn
 lSjQ5BjPt635ZY2SzPJGrdqq+rh9Z6j0+hvh7xksu/dWbC4bcSuDrGE/qQ9rircjzVOvg2Z+
 i/txzp1m3r+QpousuNGh18u2HAi/0D82suPVNNo5Gv1nqb7AFu/bb1809bzb5Dv4sxO+RICa
 XTnK3ViBec/tUv3Fv6W4OlEetUWgUsv/BUg5I2RQBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsVy+t/xe7rH3y9IN2juYLE4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xcKPW1ksluzYxWjR1rmM1eLiKVeLu/dOsFi8vNzDbNE2
 i9/i/54d7Bb/rm1ksZj9bj+7xZY3E1ktjq8Nt2jZP4XFQdbj/Y1Wdo83L1+yeBzu+MLusffb
 AhaPnbPusnv07DzD6LFpVSebx51re9g85p0M9LjffZzJY/OSeo+WtceYPPr/Gni833eVzaNv
 yypGj0vN19kDhKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
 Uov07RL0MhadectU0CRX0T5lIVMD4x6JLkZODgkBE4mLL6awdjFycQgJLGWUmD7tMgtEQkbi
 WvdLKFtY4s+1LjYQW0jgNaPEjo/KXYwcHLwCdhLNb4pAwiwCKhLrJh8CK+cVEJQ4OfMJmC0q
 IC9x/9YMdhBbWCBcoulsPxvILhGBvRwSu278ZAFxmAUamCVWzb7BDHHFcUaJpVNvgLUzC4hL
 3HoynwnEZhMwkniwfD4riM0JtPld73MWkCuYBdQl1s8TgiiXl2jeOpt5AqPQLCSHzEIyaRZC
 xywkHQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEpqxtx35u2cG48tVHvUOMTByMhxgl
 OJiVRHhPb1+QLsSbklhZlVqUH19UmpNafIjRFBgYE5mlRJPzgUkzryTe0MzA1NDEzNLA1NLM
 WEmcl+3K+TQhgfTEktTs1NSC1CKYPiYOTqkGpkmT2wK0y0tzT+9dVDvl59kVnyQuebUsahCP
 lfc9mZou9mz1PQd141UTT1SL/v7xVFR+2ZcLvRUFkecMlWacLF9Xw9VotezFllduDWH3jCtL
 J2ys4ZvOd8FXV/dHkkHlhFMT+oNeatrecDu4e2bv+ygGGblPrtx/fA39WB5Ob+u9dDO2t3iG
 cJSufZjTNnZNl1nsiTdOPT20qcQjec4Zzjli35SmzZVYdK97+9X0d42Lgu54LNCr8J2n9si+
 eX5L+MlwJwmdnc8Tv+vlPc56cYuzdQ9TY9La7SXnl/ds0T34rmBexe4NjrdqNTz8WqU5j12Z
 7iodsEohKVYiQ+oYuyZvaGjTyy1ty2Y/vv30vxJLcUaioRZzUXEiAECvIAbiAwAA
X-CMS-MailID: 20250203163311eucas1p17f75b2012c9341f93af43f586809a81e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585
References: <CGME20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585@eucas1p1.samsung.com>
 <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <ed7a463e-9654-41c3-91f6-f3f877fd9a20@imgtec.com>
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
> On 28/01/2025 19:47, Michal Wilczynski wrote:
>> The LicheePi 4A board, featuring the T-HEAD TH1520 SoC, includes an Imagination
>> Technologies BXM-4-64 GPU. Initial support for this GPU was provided through a
>> downstream driver [1]. Recently, efforts have been made to upstream support for
>> the Rogue family GPUs, which the BXM-4-64 is part of [2].
>>
>> While the initial upstream driver focused on the AXE-1-16 GPU, newer patches
>> have introduced support for the BXS-4-64 GPU [3]. The modern upstream
>> drm/imagination driver is expected to support the BXM-4-64 as well [4][5]. As
>> this support is being developed, it's crucial to upstream the necessary glue
>> code including clock and power-domain drivers so they're ready for integration
>> with the drm/imagination driver.
>>
>> Recent Progress:
>>
>> Firmware Improvements:
>> Since August, the vendor has provided updated firmware
>> [6][7] that correctly initiates the firmware for the BXM-4-64.
>>
>> Mesa Driver Testing:
>> The vendor-supplied Mesa driver [8] partially works with Vulkan examples, such
>> as rendering a triangle using Sascha Willems' Vulkan samples [9]. Although the
>> triangle isn't rendered correctly (only the blue background appears), shader
>> job submissions function properly, and IOCTL calls are correctly invoked.  For
>> testing, we used the following resources:
>>
>> Kernel Source: Custom kernel with necessary modifications [10].
>> Mesa Driver: Vendor-provided Mesa implementation [11].
>>
>> Dependencies:
>> Testing required a functional Display Processing Unit (DPU) and HDMI driver,
>> which are currently not upstreamed. Efforts are underway to upstream the DPU
>> DC8200 driver used in StarFive boards [12], which is the same DPU used on the
>> LicheePi 4A. Once the DPU and HDMI drivers are upstreamed, GPU support can be
>> fully upstream.
>>
>> Testing Status:
>> This series has been tested by performing a probe-only operation, confirming
>> that the firmware begins execution. The probe function initiates firmware
>> execution and waits for the firmware to flip a specific status bit.
>>
>> [   12.637880] powervr ffef400000.gpu: [drm] loaded firmware powervr/rogue_36.52.104.182_v1.fw
>> [   12.648979] powervr ffef400000.gpu: [drm] FW version v1.0 (build 6645434 OS)
>> [   12.678906] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on minor 0
>>
>> Power Management:
>> Full power management capabilities require implementing the T-HEAD SoC AON
>> protocol messaging via the hardware mailbox. Support for the mailbox was merged
>> in kernel 6.13 [13], and the AON protocol implementation is part of this
>> series, since v2. Therefore this series support full power management
>> capabilities for the GPU driver.
>>
>> Thanks everyone for taking the time to review the last revision ! Your
>> guidance and the direction was very helpful.
> 
> Hi Michal,
> 
> This is awesome, thanks for contributing! I apologise for not responding
> to earlier versions (things have been pretty busy here), but they have
> very much been on my radar.
> 
> I see you're already aware of my other B-Series patchs[3]; would you
> mind rebasing these changes on top of those? We're making some not
> insignificant changes to the bindings which will conflict with any new
> GPUs added in the meantime. I'll leave comments in this series where I
> suspect the conflicts will appear.
> 
> Cheers,
> Matt


Hi Matt,

Thanks for your review, and no worries about the delay it’s totally
understandable. I appreciate the heads-up about the dt-bindings work in
progress. I just wanted to share a working solution for now, but I’ll
definitely rebase these patches once your changes are in place.

Cheers, Michal

> 

> 
