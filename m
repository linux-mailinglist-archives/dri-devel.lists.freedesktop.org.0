Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95CA95FCD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2537310E514;
	Tue, 22 Apr 2025 07:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="CR8KgOZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A72110E514
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:47:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250422074737euoutp024e2a3468fed4ad8e0835ea270275e808~4lG5vvuPz2778427784euoutp02H
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:47:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250422074737euoutp024e2a3468fed4ad8e0835ea270275e808~4lG5vvuPz2778427784euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1745308057;
 bh=YhGFLkEzKgz+GfyN4OdYyuMG4I+CyiVDnG8UcSjurlI=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=CR8KgOZUrftR9/Eqo4u0/5IySoaChZq+JpkQg/Y5g60SlY35JuhD4tImWkpqj6N8f
 sdTxik2CqHBYBNHgAORBVan/z23C051OkWAlXzl2DM273g6WgEVfxTAB93Sk/AF14T
 t+Mqc2JfBTC27GyPmmbxcDSI3qW8lq4cAgmk2lRA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250422074736eucas1p26785e0aa606a0551d57b635f9f7cb724~4lG5EMJ6s0798107981eucas1p2P;
 Tue, 22 Apr 2025 07:47:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 57.65.06072.89947086; Tue, 22
 Apr 2025 08:47:36 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250422074736eucas1p229d8a46d24bc2b62fba4835f225d34cc~4lG4cllm00585305853eucas1p2Z;
 Tue, 22 Apr 2025 07:47:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250422074736eusmtrp25d4f37e4a76d45889912395ff4e4d1f6~4lG4brYS01493814938eusmtrp2h;
 Tue, 22 Apr 2025 07:47:36 +0000 (GMT)
X-AuditID: cbfec7f5-7f7fe700000017b8-f9-680749984146
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 3D.78.19920.89947086; Tue, 22
 Apr 2025 08:47:36 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250422074734eusmtip23ed507b3f619e62e76af9e5cdabc81a4~4lG3Mfp3_1123511235eusmtip20;
 Tue, 22 Apr 2025 07:47:34 +0000 (GMT)
Message-ID: <81e53e3a-5873-44c7-9070-5596021daa42@samsung.com>
Date: Tue, 22 Apr 2025 09:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/21] riscv: dts: thead: Introduce reset controller
 node
To: Drew Fustini <drew@pdp7.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aAP1BW3RmMb/Irya@x1>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTVxjHc25v773tLF4KhCOTuBRfoslA3D6cAXO66LxsixFiWELcsBnX
 4sZrC3MsQ0FeBKnAxAUpTLAQ6IroJgUpo4NUUoqMOwcIRGkhE5fBBCyIhBfpKBc3vv2e//M/
 z1sOJZCaCB/qdHwyq4yXx8oIMd5kWeDevBpKxux9NroHWQe1GGpc0pDohonDUEUHJ0T2XgOG
 +uemCXTzyX0S/W3KwNGA7gcSZVpuEWhcYyeQQ20Xor6WcgLNXuoAqGk2i0D1HTYSXXc04qi6
 uQWgnLwaIfrj3mFks1txNN6nFqAczWbkbG0m0crAzzgqm2ojkeHpd0LUWf8Jymq7gh/wZaaH
 sknm6fg4ztzNfU4ypheVOGPU2EhGbfwNMLf1eQQzPNBKMNe6wpiR/E6Maag+x2TVWzCm8OVe
 ZvrXBwRTYNADpjdzkDwmjRSHRLOxp79ilQH7T4pjfhzIJRO76a8n8yLTQavkIhBRkH4bnrdk
 EheBmJLSOgC5SquAD54DmGvWknwwC+Cyfkrw6kn65Zl1Vy2AZueNddckgDnL5WsuCb0fFuX3
 Ahfj9A74uKpjXXeHXaVjuIu96G1w5OFV0sUedDh85PxlTfek34CcrhdzFRXQdULY0T6LuRIC
 2hs+HKtYY4LeB0drK4QuFtEyWDs0D3jPNnhnsnxtPEh3iWG2th/wcx+CdVnFQp494ESngeR5
 K3Qa+aKQToCjjTPre34LjerOdQ6Gw9zi6pmo1Qa74a2WAF4+CH+vLgMuGdJucGjSnR/BDV5u
 KhHwsgTm5kh59074vfrSf005XRNWBGSaDVfRbFhSs2EZzf99KwGuB95siipOwareimfP+Kvk
 caqUeIX/5wlxt8HqD+9e6ZxrBroJh78ZYBQwA0gJZJ6SxQ/IGKkkWp76DatMiFKmxLIqM3id
 wmXeEm1btkJKK+TJ7Jcsm8gqX2UxSuSTjqUXPLYc/zN08/zHh5MWj2CiuffCSs+x6hoYdX3H
 iLJq+mZttDWYUqT5v2MOXzGKPJoKkxzWGT9lj5u76cLUrrRGR0g6WTfRnursfm1h+wlb0O6z
 RZ9tOmgq5E5FcTa0FPrP1EK7Ma0q+eX9XXORx4NNJ3XzDaKjrDRDlPHXdrzoTNHZxIiawaEt
 +e/7Ej2c3yOzJdJKBx5xnrqrfTLeUNcTmPJpyYOgyX6rZt6yEhSxLzXsxJZi8c5qqyAu5MWU
 b/By65WAytDw2jx1WJKnhwIRY5vchxv77F4lX7xbeuFDr6VrW4/95DcfoT90/kC04SOfO719
 xUZ5exn7rOBeWPhRGa6KkQfuEShV8n8BLph1sFAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsVy+t/xe7ozPNkzDH6d5LQ4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xcKPW1ksluzYxWjR1rmM1eLiKVeLu/dOsFi8vNzDbNE2
 i9/i/54d7Bb/rm1ksZj9bj+7xZY3E1ktjq8Nt2jZP4XFQdbj/Y1Wdo83L1+yeBzu+MLusffb
 AhaPnbPusnv07DzD6LFpVSebx51re9g85p0M9LjffZzJY/OSeo+WtceYPPr/Gni833eVzaNv
 yypGj0vN19kDhKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
 Uov07RL0MlZe62AvOC1Q8bYzqoFxD28XIyeHhICJRMOkT8xdjFwcQgJLGSXOz21mhEjISFzr
 fskCYQtL/LnWxQZR9JpR4mzPdrAiXgE7iQndl8BsFgFViceLjzBDxAUlTs58AtYsKiAvcf/W
 DHYQW1ggSOL2/91gcREBBYlzKy4xgQxlFljNKrH8611GiA0PGCU+73vAClLFLCAucevJfCYQ
 m03ASOLB8vlgcU4BJYnlN74DNXAA1ahLrJ8nBFEuL7H97RzmCYxCs5DcMQvJpFkIHbOQdCxg
 ZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRmLK2Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuH9
 5caeIcSbklhZlVqUH19UmpNafIjRFBgWE5mlRJPzgUkzryTe0MzA1NDEzNLA1NLMWEmc1+3y
 +TQhgfTEktTs1NSC1CKYPiYOTqkGpsyl17LvrjOo49vy7/j3PQ/+JHi9XtFQLyr2wdr9adcq
 xgNPf8w+7bH0EsvSidofU4MXXPJJNrnusYlJrzFdW8rwtWcmW5nRj7W+LuzKiRuvZ0j0He9X
 nnxxV+qr8C1nz6eskTpV+KXj5pVXzK9v/JX98C0sUXlReamww0krn/yKcvftCxQl/16Wf/Mg
 Ty/AqZzx+c8mjjSvw13NnTqT3gkvbDV2Xcl97zxL0D5nhVTNf7Y5yz44/WfecKv7REXesjlJ
 y+f9/8ttwsZw+Mwddo/XThOTHzpfYL3Aka7SoaK241xZpe7efbdOtjDFZDkYl+m8P+NcuzpK
 Trft/Kzrxy02tdqk5nsnbxY1eNHjpsRSnJFoqMVcVJwIAGzRxpviAwAA
X-CMS-MailID: 20250422074736eucas1p229d8a46d24bc2b62fba4835f225d34cc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140316eucas1p29a76023868946f090f261bf78d5103e3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140316eucas1p29a76023868946f090f261bf78d5103e3
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140316eucas1p29a76023868946f090f261bf78d5103e3@eucas1p2.samsung.com>
 <20250219140239.1378758-21-m.wilczynski@samsung.com> <aAP1BW3RmMb/Irya@x1>
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



On 4/19/25 21:09, Drew Fustini wrote:
> On Wed, Feb 19, 2025 at 03:02:38PM +0100, Michal Wilczynski wrote:
>> T-HEAD TH1520 SoC requires to put the GPU out of the reset state as part
>> of the power-up sequence.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
>> index 474f31576a1b..6b34aab4b455 100644
>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
>> @@ -7,6 +7,7 @@
>>  #include <dt-bindings/interrupt-controller/irq.h>
>>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>>  #include <dt-bindings/power/thead,th1520-power.h>
>> +#include <dt-bindings/reset/thead,th1520-reset.h>
> 
> Are you okay if I omit this hunk? My thead-dt-for-next branch is based
> on 6.15-rc1 but thead,th1520-reset.h only exists in next until the merge
> window.

Yeah, I'm not exactly sure how to coordinate such stuff, obviosuly it
would be best if this chunk would make it to the 6.16, but if you think
it would be problematic then omit it, no problem.

I will then update this patch series v3 [1] to gracefully handle lack of
reset, as the 6.16 will not contain the required reset line for sure.

[1] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com/

> 
>>  
>>  / {
>>  	compatible = "thead,th1520";
>> @@ -497,6 +498,12 @@ clk: clock-controller@ffef010000 {
>>  			#clock-cells = <1>;
>>  		};
>>  
>> +		rst: reset-controller@ffef528000 {
>> +			compatible = "thead,th1520-reset";
>> +			reg = <0xff 0xef528000 0x0 0x4f>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>>  		clk_vo: clock-controller@ffef528050 {
>>  			compatible = "thead,th1520-clk-vo";
>>  			reg = <0xff 0xef528050 0x0 0xfb0>;
>> -- 
>> 2.34.1
>>
> 
> With the above caveat:
> 
> Reviewed-by: Drew Fustini <drew@pdp7.com>
> 
> 
> -Drew
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
