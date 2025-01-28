Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B1A20E80
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FCF10E6C2;
	Tue, 28 Jan 2025 16:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="TFmaGkOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860AC10E6C2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:27:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128162712euoutp01067d5e3256cf5dd3353e8550a935024b~e6AlBTQhX0270402704euoutp01P
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:27:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250128162712euoutp01067d5e3256cf5dd3353e8550a935024b~e6AlBTQhX0270402704euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738081632;
 bh=fFbTh+PWSmdRFBoGu9O4DUva9iXla1md7758aeiDLz4=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=TFmaGkOaOngHdMQ/pXWXbzPxRWkXqYTQQ7blYdU3MnDfl4Ui55OQEmZS92nkRU0QK
 9TX/PY4ci0p5GYDsRhsOWS2re8kN/l4fph6zMyF8e9fF3u2UyhZjQvigLMkKzbjp+H
 aiwUFOqcNtxzG4ahagzXxHPBOw/dUlGvc2SLwdcg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128162712eucas1p1c6f2938e96b8144aaccff7d0c3905440~e6Akmdgug0040500405eucas1p1R;
 Tue, 28 Jan 2025 16:27:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 6C.C2.20409.06509976; Tue, 28
 Jan 2025 16:27:12 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250128162711eucas1p2bfe8403d51943e5d5e7bc99c165a3a3b~e6AkKpP0F2095320953eucas1p2R;
 Tue, 28 Jan 2025 16:27:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250128162711eusmtrp14491c4910474d6a0c0a4fb4333444735~e6AkJufsr1458214582eusmtrp1e;
 Tue, 28 Jan 2025 16:27:11 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-38-67990560a4fa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 84.F2.19654.F5509976; Tue, 28
 Jan 2025 16:27:11 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128162710eusmtip144e6661f192407d315ac892b5ee175de~e6Ai2D0jv2024520245eusmtip1G;
 Tue, 28 Jan 2025 16:27:10 +0000 (GMT)
Message-ID: <51846fb3-3d86-4ba7-8504-0725d3cd738f@samsung.com>
Date: Tue, 28 Jan 2025 17:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 04/18] firmware: thead: Add AON firmware protocol driver
From: Michal Wilczynski <m.wilczynski@samsung.com>
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
In-Reply-To: <0324973c-2180-4077-a000-b7b6d895b7aa@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxbZRTGfW9v771tUrgUTF9Rx0LG4pyygajvnEPmmLlomGiWmGwaaLa7
 DsdX2nXTzY/yMdygncCQj4IWcANsVj5qYaWhVFltGczC2AZIoEyFZCDIKh1kKMXRdsp/v/Oc
 5815zslLcYRXiVAqNeM4K80Qp4UTfLzd9qD/+RRupWR72QqJeobrMNT2t5pEl80ODGmsDi5y
 DhowdOv+PIGapgZIdNecjaOhxq9JlGtrJtC02kmg/v4WErmUTi66aaom0ILKClD7Qh6BdNZx
 EtW62nB00WgCKP9cPRfd6N2Lxp09OJq+qeSgfHUgWu00ksgz1Iqjqj8tJDLMFnORXfceyrOU
 4nEbmPmRMyQzOz2NM1fPuknGvFiDMx3qcZJRdlwHjF57jmDGhjoJ5ptr7zAThXaM+f7i50ye
 zoYxX65sZ+a7bhPMeYMWMIO5w2SS8AD/1cNsWuoJVrotNoV/tLbBCrLs/I+Gij2EAgxQBYBH
 QToGDruNnALAp4R0I4AaTTnmK9wANiunuL5iAcAC8yLn0ZOl7y75XQ0AFlsq/cUcgNcNjfia
 S0DHQu3UIrnGOB0Bq1ZngE8PgtcqJ72ex+kwODFa4fUE02/DpsLb3DUm6Gh4p0Hj5RB6Cxxe
 WfLG4NCdXFhW2uJtcGgRHJ3UYGvMo1+D5TmDmE8Pg1fmqr0bQfoGH2p6nf7c8bDngRv3cTCc
 sRtIHz8F+y4o/XomvNP2l9//CexQ2v28E445lokCQD0csAU2m7b55N2wtWTWK0M6AI7MBfki
 BMCS9nKOTxbAs/lCn3sz/Eqp+m+oo7EdKwLh6nVXUa9bTL1uGfX/c2sArgUiVi5Ll7Cy6Az2
 ZKRMnC6TZ0giD2Wm68HDf97nsbuNoGHGFdkNMAp0A0hxwkMEHzgqJELBYfHHp1hpZrJUnsbK
 usGTFB4uEtRZzkiEtER8nD3Gslms9FEXo3ihCuwIoGZsn5bxkuIU708I5LlGg+HyclhOb32x
 2Fl193Rl4NYBUXCmsui5mOVC4Hol+V7r6hPchJgR3bGTp35sUaTMHjwR77miv9WVwB9SyWP7
 E7+oFWe/+Fn2rpyDNaKc0Q8jdrwRVb/pH0dKyB8Hdr+ZzFv1MBx4vvDbH5Rq+87ZIzNxqKKl
 7d6cqeunsYSquv18W6i1ZE+QfrDnLVFAoCL/UFGWLnSxQOdOTFrauO/dkR1btYmWpgu1P0ed
 Rpd6m2o8Val79728oflpV/DqZOnvGf3teboJ3saA/fH66vL7quG53wBm6vvlGVWAxbVnl/Yx
 2vBr9EutParNEamvv7Ap0WwOx2VHxVHPcqQy8b+TFE+hVgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsVy+t/xu7rxrDPTDXauU7c4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWZw/v4Hd
 4mPPPVaLy7vmsFl87j3CaLHtcwubxdojd9ktFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CXsXD5EcaC41wV1yb+Y2tgvMDRxcjJISFgIvF95VKmLkYuDiGBpYwSyy5e
 ZoNIyEhc637JAmELS/y51sUGUfSaUWJFywZ2kASvgJ3EqqffwGwWAVWJ2f9fMULEBSVOznwC
 1iwqIC9x/9YMsBphAV+JJdf2M4HYbAJGEg+Wz2cFsUUENCWu//3OCrKAWWAPq8ThzZ+htq1n
 krj0cRVYB7OAuMStJ/PBbE4Be4npTZeAbA6guLrE+nlCECXyEtvfzmGewCg0C8kds5B0z0Lo
 mIWkYwEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzA9LXt2M8tOxhXvvqod4iRiYPxEKME
 B7OSCG/suRnpQrwpiZVVqUX58UWlOanFhxhNgWExkVlKNDkfmEDzSuINzQxMDU3MLA1MLc2M
 lcR52a6cTxMSSE8sSc1OTS1ILYLpY+LglGpgmhkpFen85fHhW6F71sgEGC2b/zmMNytTba3N
 NM17uwImv+WVYYrSZg97kSPq0bX01u+rglURPc0PJzoVvVnw58WZd73fXs6Wd02+UH7jgvf/
 3pD2SUfCHJ8V+HvH7i4tvNPq5c/IsPjmD7v1lp9+C68MvPg3Mrty9oO6KdbZFdd331TRPnPV
 Vdjo5xXbFvuPHhGu0Y/W73g1adGZdXc4F0nlcfHtvTu/43tjfpTo5h+af7lbP025rhj6zTro
 tFLjguldRU0GqqFCL2bU/3l8omxxs1T024LqCFPV7Qrdhx85aXuJMB+vVX2oxe92vfJ7s8jk
 0IVPTnZvL5zWF/ux7PbZtnVzPj8IbjfpXXzxpRJLcUaioRZzUXEiAD4ihYDoAwAA
X-CMS-MailID: 20250128162711eucas1p2bfe8403d51943e5d5e7bc99c165a3a3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29@eucas1p2.samsung.com>
 <20250120172111.3492708-5-m.wilczynski@samsung.com>
 <20250121-small-ruby-seahorse-7475d0@krzk-bin>
 <0324973c-2180-4077-a000-b7b6d895b7aa@samsung.com>
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



On 1/28/25 16:54, Michal Wilczynski wrote:
> 
> 
> On 1/21/25 10:56, Krzysztof Kozlowski wrote:
> 
>>> diff --git a/include/linux/firmware/thead/thead,th1520-aon.h b/include/linux/firmware/thead/thead,th1520-aon.h
>>> new file mode 100644
>>> index 000000000000..3daa17c01d17
>>> --- /dev/null
>>> +++ b/include/linux/firmware/thead/thead,th1520-aon.h
>>> @@ -0,0 +1,186 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2021 Alibaba Group Holding Limited.
>>> + */
>>> +
>>> +#ifndef _THEAD_AON_H
>>> +#define _THEAD_AON_H
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/types.h>
>>> +
>>> +#define AON_RPC_MSG_MAGIC (0xef)
>>> +#define TH1520_AON_RPC_VERSION 2
>>> +#define TH1520_AON_RPC_MSG_NUM 7
>>> +
>>> +extern struct th1520_aon_chan *aon_chan;
>>
>> Drop all externs.
> 
> This is required so the code will compile as the
> int th1520_aon_call_rpc(struct th1520_aon_chan *aon_chan, void *msg);
> is non static and exposed in the same header.
> 
> I really would like to keep th1520_aon_call_rpc in this header, as it
> could be useful for other drivers to construct their own RPC calls to
> reboot or shutdown the system e.g watchdog.

Oh I get it, simply drop extern not the whole expression, sorry it's
fine.

> 
>>
>>
>> Best regards,
>> Krzysztof
>>
>>
