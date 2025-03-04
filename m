Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491FFA4D4E9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 08:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB0310E012;
	Tue,  4 Mar 2025 07:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="UVFJYAPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD76C10E012
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 07:38:15 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250304073813euoutp01c6a4007606075c88e63c05fe230db58c~piXtPSGBB1810918109euoutp01P
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 07:38:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250304073813euoutp01c6a4007606075c88e63c05fe230db58c~piXtPSGBB1810918109euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1741073893;
 bh=FQT5t9XP/qXk2cTrhE2jEyDzyfg+dccdB+ublyOMgPE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=UVFJYAPS8GJtDQS/u3HEPWiPOZSCOdfX45cJXXaI+vDMPzI0kl7iA6T4BZx3RcjAU
 njOr4havVtQlrUh/EIBVwBcw8POIRxr+ZZsJscMGjbG9KESYfWr1Aho5uH2E9kvtgX
 i8UlGs09pPXonqgOiHbz+ZN8iqDOvrBaewYY+5C0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250304073812eucas1p276848c08635d2c51ac99656118f6b8b7~piXslpw1y0388203882eucas1p2H;
 Tue,  4 Mar 2025 07:38:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 53.E5.20821.4EDA6C76; Tue,  4
 Mar 2025 07:38:12 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250304073812eucas1p15180503dcd7cc128c2f3c06a3425b415~piXsF8AA82194621946eucas1p1L;
 Tue,  4 Mar 2025 07:38:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250304073812eusmtrp1a8bee346d4242d1e3cc0a9553a2edaec~piXsE-O9C2862028620eusmtrp1Q;
 Tue,  4 Mar 2025 07:38:12 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-f8-67c6ade4b965
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E8.CA.19920.4EDA6C76; Tue,  4
 Mar 2025 07:38:12 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250304073811eusmtip2dd48a10474efd786272294b7dc01e293~piXq0DZaX3187031870eusmtip2r;
 Tue,  4 Mar 2025 07:38:11 +0000 (GMT)
Message-ID: <09411368-cd76-479f-ade3-5a87d3f9be38@samsung.com>
Date: Tue, 4 Mar 2025 08:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/21] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <7ba53937-7922-41da-a7ed-909ce620db1f@kernel.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxjOaW/vLR3FS8Fx1AlZh8YuisIGHp0hLA5ykyVDsh9kLkbruCs4
 vmylA7YMRyufRRCLbJc6xBlBBFGkDSBQA8iXjAoIZR0UfnTTEoTwNRwojPbixr/nfd7nPc/7
 vDl8rqgV386PiT9Hy+OlsWJcgBk6/jHts1V3yA6UvQpAXebrHKRfYQhU1dzHQaXtfTxkHajj
 oKeLMzi68+cTAj1v/hFDwxVXCaTqqMGRnbHiyGS6S6BZjZWHBht1OJrPawfIMK/GUXX7GIHK
 ZvUYulHfCFBG9k0e6u8JRWPWLgzZBzVclMFsQWtN9QRaHb6HoZJpI4Hqpi7xUGd1JFIbtViI
 NzUzcoGgpux2jGrLWiCo5r+vYVQDM0ZQmoZeQNVWZuPU6HATTv3SHUGN53ZyqPs30ih1dQeH
 yn99gJppGcKpi3WVgBpQmYljouOCI1F0bIySlu8PPiWIftZVzE2cFyZ3G8LOg/K3coALH5If
 Qm3XLSwHCPgisgLAv0aauWyxAKDaUrDRmV8vVGXgzUi2vRawjXIA84xrOFu8ALDh/u+4QyUk
 g+FKwaATY6QvzDJX8VjeHXb/bMMceCvpA8ctPxEO7EFGwofWTI4De5ISaH69xHM8yiWbePCK
 9q5zmEt6QYut1CnCyQA4UV7q5F3WzexlORir8YEqfYkzBCT7BVBnq8HYvT+BhZM9Gxk84GRn
 HcHid+Djy5oNTQKc0M9xWfw9bNB0buCP4Gjf8noa/rqBBNY07mfpj+HT/CInDUk3OPLCnV3B
 DRYairksLYRZGSJWvRsWafL+M+2rMHAKgJjZdBVmU0hmUxjmf99rAKsEXnSSIk5GK/zj6W/9
 FNI4RVK8zO+rhLhasP7NH692ztWDq5Ozfq2AwwetAPK5Yk+hJfORTCSMkqak0vKEk/KkWFrR
 CnbwMbGX8LrxgkxEyqTn6G9oOpGWv+ly+C7bz3P2HGbcT6a4plP4TsvOCqN7MuOtfDnuO9RW
 zBTpZpczC0v0oSdoJdXQtnpIGjTnmR4TJA7XKhYlS0dy8eOq8FMrOzIffBcWafoN3xak2tsV
 HXgseG9I1SHb+Cu3t4+eiOhdcPOP0592N5x5GPju7XT5r/kve0dHUgJbLvXcTryp8m0Rm/Jc
 tU8s+Z9LXEfv8D5bXlwLeRbDlLdNS07blmHY84Pq0DSPLyfHz0y/lzS8RVm1rTI1MPnrMHNq
 f9XhNSbC3N++6w/si13hyw8k0VMBFl1fyZLPwUflP9zyHPIvDt6958o+79yz9yZjSi7qBtKO
 ZpcqJzx8XT+YU5yNaoKfKraKMUW01P99rlwh/RcRosxdVQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsVy+t/xe7pP1h5LNzj2QtjixPVFTBZbf89i
 t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZnH+/AZ2
 i48991gtLu+aw2bxufcIo8W2zy1sFmuP3GW3WPhxK4vFkh27GC3aOpexWlw85Wpx994JFouX
 l3uYLdpm8Vv837OD3eLftY0sFrPf7We32PJmIqvF8bXhFi37p7A4yHm8v9HK7vHm5UsWj8Md
 X9g99n5bwOKxc9Zddo+enWcYPTat6mTzuHNtD5vHvJOBHve7jzN5bF5S79Gy9hiTR/9fA4/3
 +66yefRtWcXocan5OnuAUJSeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexvMT05kLPvNWnNzm1sC4nLuLkZNDQsBEovPlJkYQW0hgKaPE12XsEHEZ
 iWvdL1kgbGGJP9e62LoYuYBqXjNKPHh2E6yIV8BO4veEy2wgNouAikTH9TWsEHFBiZMzn4A1
 iwrIS9y/NQOsXlggXOLAvXYmEFtEQFPi+t/vrCBDmQX2sEoc3vwZasNmJon5rQuYQaqYBcQl
 bj2ZD9bBJmAk8WD5fLANnECbXy7sAtrAAVSjLrF+nhBEubxE89bZzBMYhWYhuWMWkkmzEDpm
 IelYwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzB1bTv2c/MOxnmvPuodYmTiYDzEKMHB
 rCTCe6v9aLoQb0piZVVqUX58UWlOavEhRlNgWExklhJNzgcmz7ySeEMzA1NDEzNLA1NLM2Ml
 cV63y+fThATSE0tSs1NTC1KLYPqYODilGpiYo/WWdH+RlJnx7UKw6sv3fJkf9TSPfAh6pND1
 R1A9vvntv3g/4YYenfPRhZb1L5blmUetDzBeXpUz/bjhujOzVlm99iplNTVY0Hdwq7dVgtpO
 1m/yQUEnGPgf3qm4rxg9s/nQ6fNMhgy6DFd3f70npuWdq/nm3a0LPzcuvOV//tfvp5emnnMS
 PvlY3WPriwUVDNVaCt29x/Qyzk6NXjh7y2L9Rbs/i604XOF2S5l/Vl7sAen0Tdt+hcXdqzq8
 4tQj7t/CJhI/XHbktrAd0/j/6/yOnSrFPv1Bb9e5RnS86DgpqXHp4YOpmi7CDE0O8u+F/ry/
 KqVi3lZupLNQrv+rzYLupd9ndbdsYdBez8CgxFKckWioxVxUnAgAez73NOYDAAA=
X-CMS-MailID: 20250304073812eucas1p15180503dcd7cc128c2f3c06a3425b415
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
References: <CGME20250219140249eucas1p1291eb86c932373c847a3314ae54789d5@eucas1p1.samsung.com>
 <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
 <90d0d409-f374-4e06-bc69-b9bf0622959d@samsung.com>
 <7ba53937-7922-41da-a7ed-909ce620db1f@kernel.org>
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



On 3/3/25 18:43, Krzysztof Kozlowski wrote:
> On 03/03/2025 09:38, Michal Wilczynski wrote:
>>
>>
>> On 2/21/25 10:12, Krzysztof Kozlowski wrote:
>>> On Wed, Feb 19, 2025 at 03:02:18PM +0100, Michal Wilczynski wrote:
>>>> The LicheePi 4A board, featuring the T-HEAD TH1520 SoC, includes an Imagination
>>>> Technologies BXM-4-64 GPU. Initial support for this GPU was provided through a
>>>> downstream driver [1]. Recently, efforts have been made to upstream support for
>>>> the Rogue family GPUs, which the BXM-4-64 is part of [2].
>>>>
>>>> While the initial upstream driver focused on the AXE-1-16 GPU, newer patches
>>>> have introduced support for the BXS-4-64 GPU [3]. The modern upstream
>>>> drm/imagination driver is expected to support the BXM-4-64 as well [4][5]. As
>>>> this support is being developed, it's crucial to upstream the necessary glue
>>>> code including clock and power-domain drivers so they're ready for integration
>>>> with the drm/imagination driver.
>>>>
>>>
>>> This is v5 of big patchset which became huge. I understand you did like
>>> that for v1 which was RFC. But it stopped being RFC.
>>>
>>> Split your patchset, keeping versioning and changelog, per subsystem.
>>
>> Sorry for the late reply—I didn't have access to email. I agree with
>> your suggestion and will send the clock changes, firmware/power domain,
>> reset, and drm/imagination updates as separate patchsets for merging.
> 
> 
> How did you implement above comment? You did the split, right? Where is
> versioning and where are changelogs?

So I thought the sub-series should be versioned independently from v1 ?
Then linked the previous discussions in the cover letter, without
copying them.

> 
> 
> Best regards,
> Krzysztof
> 
