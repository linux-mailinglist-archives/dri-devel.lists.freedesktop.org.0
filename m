Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B3A4B99F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4551D10E072;
	Mon,  3 Mar 2025 08:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="D8WBJnEo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290A610E072
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:42:10 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250303084208euoutp0277a6f40a8d669dca64685e469dc90bb8~pPmOt72U61539715397euoutp02P
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:42:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250303084208euoutp0277a6f40a8d669dca64685e469dc90bb8~pPmOt72U61539715397euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1740991328;
 bh=AHzYo2Ru4n9BfduEfPoM21VtgML3aRIm0P2jGenVxNY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=D8WBJnEoW0Mx2Wegv6NF7hQPi2B++lufV+EkivYweUaE7WogMyjecETFlGKxLgjy/
 u8t67JjCiWQXGgpkQbHX+l87SnG+p/N0UNFer/olvaYnhadlbo3TieVb0RYK7EDbDH
 PTPeBqB2bvPS69Ga00BK/cniNSFKYHRtlzUADQ18=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250303084208eucas1p16a28fcf739d34b3864789af971ae7de5~pPmOOios61873218732eucas1p1G;
 Mon,  3 Mar 2025 08:42:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id EE.D7.20821.06B65C76; Mon,  3
 Mar 2025 08:42:08 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250303084207eucas1p1f947b4d89277675981f8fb8a42fb2a13~pPmNbQoZl0772407724eucas1p1x;
 Mon,  3 Mar 2025 08:42:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250303084207eusmtrp207ce82c07d64ce0f17a062330b575469~pPmNZ9iak0677306773eusmtrp2f;
 Mon,  3 Mar 2025 08:42:07 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-1d-67c56b60b96f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C0.99.19654.F5B65C76; Mon,  3
 Mar 2025 08:42:07 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250303084205eusmtip1c24745e8c9084816642c784905e3a325~pPmL4zWWQ1255112551eusmtip1H;
 Mon,  3 Mar 2025 08:42:05 +0000 (GMT)
Message-ID: <7296ddb3-2096-4414-bfa4-28fc5bb8ec86@samsung.com>
Date: Mon, 3 Mar 2025 09:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/21] dt-bindings: clock: thead: Add GPU clkgen
 reset property
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
In-Reply-To: <20250221-imaginary-ebony-macaque-aace8d@krzk-bin>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xTZxj2Oz09pzTADlXCN7bArLiNbdwMJt/Cwlg25tkM4eIWN5MhDZyU
 BgqshQ0dTA3lIlaZ6HAWGBcJl2onMMCWcXGAtCADB3KRcE0gUhEJ0G6KK4z24Ma/533e533e
 9/ny8TiCTsKVJ0lIZmQJonghwcebup8NeEXF3RH7/pZNIMNoOYYan6tIdKO1H0MlXf1cNDXY
 gKH75mUC/TJ/j0QLrWdwNFJdTKKM7psEMqqmCDQwUEuiFeUUFw01FxFo7XwXQE1rCgJpuiZJ
 VLbSiKMKbTNAWWcruejP3mA0OWXAkXFIyUFZqpfQZouWRBsjdTgqfNJOoobHF7lIrzmKFO2X
 8SA3enksk6QfG4043ZljIunWv0pxWqeaJGmlrg/Q9eqzBD0x0kLQP/eE09Pn9Bj9a8UpWqHp
 xug8iy+93DZM0Bca1IAezBglwwTH+O/FMPGSbxiZT2AUPzaj6CGWpKFSn5rywWkwYJ8L7HiQ
 8ofFg5V4LuDzBFQ1gKqqGowtTABujBpJtlgD8HlLKfliRJF3G7CNKgBL2lQEWywBmL1o4lpV
 DlQgnB7O5VgxTnnA2wYLxvJOsOfqHG7FzpQ7nB7/yea6m/oC/rF5xcbvoTzhqOVvrtWUQ7Vw
 YcHlWpsph3KB43MlNiOCOgBnqkpsvB31PizOytrWuMNbS0Uc6zCkhvnQ8mSew979EexbXsRZ
 vBs+0jds53kVbupYU0glwpnG1W19GtQp9ds4AE70r2/F5G0t8IQ3m31Y+gM4d8sagLeFHeHY
 khN7giPMb7rCYWkHmJMlYNWvwx+V5/9b2l/dhP0AhKodr6LaEVK1I4zq/72lAFcDFyZFLhUz
 cr8E5ltvuUgqT0kQe0cnSuvB1j+/u6Ff1YLiRyveHQDjgQ4AeRzhHoevI7rEAocY0YmTjCzx
 uCwlnpF3gFd4uNDFobw9UyygxKJkJo5hkhjZiy7Gs3M9jYW+Eb6+UJhwxByXmZqrGf9cmi7J
 jLa/fm2iz+/3gPlL5Fc+ofqwtkhFZJB8OVKtjZ0o3HVyKDnCLYRainANivtQ8cA/JGpvufBS
 qGdYwDvpbzeU9dX1jN2QasckGftnUrVE4amnc5ULdS1No4U1Ff4Hy1Zfrq01tcmffem1y+/T
 Q9ejZ2dzvB46l+md72zMFNfnjTxQm9wO5QdXEnvDLOBaY9+i5pPa3u/TsNQ35zyKDLPxeTpj
 9nfhr/1z5L6hX+2oPx4cyBxIchpWVt8ruHtu37vOB/nHzJ+ZsTPBR+WExGPIzr1m7YLvvrqP
 T4RI07xieg/rOg1jvWb7+XSvglbx+n4hLo8V+b3FkclF/wIWiPr2VgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsVy+t/xu7rx2UfTDZ584rE4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWZw/v4Hd
 4mPPPVaLy7vmsFl87j3CaLHtcwubxdojd9ktFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CX0TznOVPBWoGKH18mMTYwnufpYuTkkBAwkWjpP8DYxcjFISSwlFFi0vcJ
 bBAJGYlr3S9ZIGxhiT/Xutggil4zSizdtZMVJMErYCdx/2oXM4jNIqAiceDEXyaIuKDEyZlP
 wJpFBeQl7t+awQ5iCwtESNyecw/MFhHQlLj+9zsryFBmgT2sEoc3f4ba8J9R4vyly2BnMAuI
 S9x6Mh9sKpuAkcSD5fPBNnMK2EvMbWsDsjmAatQl1s8TgiiXl9j+dg7zBEahWUjumIVk0iyE
 jllIOhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQITF/bjv3csoNx5auPeocYmTgYDzFK
 cDArifAWBh1JF+JNSaysSi3Kjy8qzUktPsRoCgyLicxSosn5wASaVxJvaGZgamhiZmlgamlm
 rCTOy3blfJqQQHpiSWp2ampBahFMHxMHp1QDkxJL8Kt30xWUrnPsnfFuR2RNcYGAzH5Nk6st
 H01vsorZVDW66O4XD9pt+03qb7fHOV+GnZsu1iXbpC7ReZxjfT2J/ZabWeFO5nOvowoPylr+
 3OYXauFyb96BFSI/23/G8zz7t3LeuVa5ySsPO5S+rVjSayaz1so4bsWs3oBnx9NYliUuOXuG
 90XngjTBU9W+a+pnxt/y01VfcMlQ8tz6XX9nflkm+Wkpl43fqWNz723dXXVl7WQHwXdHNjex
 fbpl1K+6fMKfmRFH2O23yVoLT092nWXmcyj2VvqJpbVx/ktSNtwr/V//Vzj985P9mosa3ONF
 uzbu7Vha3N/kbl8oMvX+KXaJmk9PuyeKuNVfOavEUpyRaKjFXFScCADr3ZuJ6AMAAA==
X-CMS-MailID: 20250303084207eucas1p1f947b4d89277675981f8fb8a42fb2a13
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639@eucas1p2.samsung.com>
 <20250219140239.1378758-10-m.wilczynski@samsung.com>
 <20250221-imaginary-ebony-macaque-aace8d@krzk-bin>
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



On 2/21/25 10:11, Krzysztof Kozlowski wrote:
> On Wed, Feb 19, 2025 at 03:02:27PM +0100, Michal Wilczynski wrote:
>> Add a mandatory reset property for the TH1520 VO clock controller that
>> handles the GPU clocks. This reset line controls the GPU CLKGEN reset,
>> which is required for proper GPU clock operation.
>>
>> The reset property is only required for the "thead,th1520-clk-vo"
>> compatible, as it specifically handles the GPU-related clocks.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../bindings/clock/thead,th1520-clk-ap.yaml      | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>> index 9d058c00ab3d..6ea8202718d0 100644
>> --- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>> @@ -40,6 +40,12 @@ properties:
>>              (integer PLL) typically running at 792 MHz (FOUTPOSTDIV), with
>>              a maximum FOUTVCO of 2376 MHz.
>>  
>> +  resets:
>> +    maxItems: 1
>> +    description:
>> +      Required for "thead,th1520-clk-vo". This reset line controls the
> 
> You just added the compatible in other patch, so are you saying you
> added knowingly incomplete code?
> 
> No, this must be squashed.
> 
>> +      GPU CLKGEN reset which is required for proper GPU clock operation.
>> +
>>    "#clock-cells":
>>      const: 1
>>      description:
>> @@ -51,6 +57,16 @@ required:
>>    - clocks
>>    - "#clock-cells"
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: thead,th1520-clk-vo
>> +    then:
>> +      required:
>> +        - resets
> 
> else:
> ? What's there? Also reset or no?

If the else: case the reset is not required, as it's only required in
the th1520clk-vo, so there is no need for else:.

> 
> Best regards,
> Krzysztof
> 
> 
