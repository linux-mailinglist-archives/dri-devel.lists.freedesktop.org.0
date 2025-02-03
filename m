Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A18FA261CA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE1C10E539;
	Mon,  3 Feb 2025 17:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="mUURczHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81C810E539
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:58:28 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250203175827euoutp0259e45a6576eda70d34a152424598e8c7~gxH9EzVf73024030240euoutp02B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:58:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250203175827euoutp0259e45a6576eda70d34a152424598e8c7~gxH9EzVf73024030240euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738605507;
 bh=oB8LLzwbooAPaWEM+Y0kHxlx9ubp+CpytH8cBLFeUhQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=mUURczHtAoTDbB0FbnYUwVZAVREebzKDnEFfXDG5T8nQP5dp0MpaixNHgpf3pdV/n
 qvKCtOFjhW1ipbrSb1w0nSZomMuJINZ3EhMr85fHx6PAuhAlapsP6WZP+mQ6cxoArr
 jNtbebyCSRmJmrerNcvsFvRn22J+EMMuMe499H/4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250203175826eucas1p1f91a7a22351ac258c5dc7954ded52990~gxH8Y55o92679526795eucas1p1T;
 Mon,  3 Feb 2025 17:58:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 38.40.20397.2C301A76; Mon,  3
 Feb 2025 17:58:26 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250203175824eucas1p183992086c6d11614686d9c3a5bd69141~gxH7IYZ161697816978eucas1p1k;
 Mon,  3 Feb 2025 17:58:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250203175824eusmtrp29bb55cb77fc80cea7f96c94fb56fc8c2~gxH7HlxyW1484114841eusmtrp2D;
 Mon,  3 Feb 2025 17:58:24 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-4e-67a103c294ba
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 39.88.19654.0C301A76; Mon,  3
 Feb 2025 17:58:24 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250203175823eusmtip2f86af6640dd3450e986c7e1d73c09e1b~gxH56OqW11343113431eusmtip2d;
 Mon,  3 Feb 2025 17:58:23 +0000 (GMT)
Message-ID: <c7a441bc-8465-46fe-a883-2a7eee3d3922@samsung.com>
Date: Mon, 3 Feb 2025 18:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] dt-bindings: gpu: Add support for T-HEAD
 TH1520 GPU
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
In-Reply-To: <2fe3d93f-62ac-4439-ac17-d81137f6410a@imgtec.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUVRzHOffevXdZW7isOJygWlsayjQUZepkjeGMTjfDChtn7eFjzTsL
 8bJdyKQEGoHBZaFdgxFXZQEdQYZH4bIPBHbakBXIHcJ4yGOhGWDkFW5g6CYQy7Xiv8/v9/ue
 7+8xh4+LGshAfkxCEqtIkMVJSAFhbHnkeMWGl8i3GLsE6FZPKYbq/tZRqLLRgSF9s4OHnJ0G
 DP32YIZE1aMdFLrX+C2BussvUeh0Sw2JxnVOErnUTh66U3+RRLO5zQAZZzNIVNU8SKESVx2B
 rpjrAco6c5WHfm3bjQadtwg0fkeNoyydL1pqMFNosftHAl34w0ohw5SWh+xVUpRhzScinmVm
 ejMpZmp8nGB+zp6jmMa/ignGohukGLXlF8DUVpwhmYHuBpIpao1ihnLsGHP9ShqTUdWCMd8t
 bGFmmrpIJs9QAZjO0z3UB6KPBW8eY+NivmQVm3ccEUQvNY6Sx++Jv+oZrCHTwVyACvD5kA6H
 OWPhKuDNF9HlALYVbVcBwTLPAaianwRcMAvgYksrz6PyPLCprRhXKANw8GoeyQXTABpmb1Ae
 lZDeASuvuYCHCfoFOPy4n8fl/WDr+RHCw+toMRzqK1zRr6U/hN1l7hVXf9rEh3nXh1YKOJ2O
 w2xNKscBsG9Ej3mYpLfC4TL9iqn3cjOT2YVzGjE0TV/EPUaQvi2Avf3tODf3Lmi+PUdwvBZO
 2A0Ux8/AJQtnCulEOFz35xP9N9Citj/hN+CAw016DobTG2BN/WYuvRP+lHOX4O7oA3un/bgR
 fOBZ4zmcSwthdpaIU4fAAnXuf00d5UZMAyS6VVfRrVpSt2oZ3f99iwFRAQLYZGW8nFVuS2BP
 hCpl8crkBHnoZ4nxtWD5g7cv2h+YQfmEK9QGMD6wAcjHJf7CdlOxXCQ8JjuZwioSDyuS41il
 DQTxCUmAsNSaKRfRclkSG8uyx1nFv1WM7x2YjvmaH56NMyURbMTGduppt+pFef3A0fbzXQVr
 Qr5+Var/pKT5ix/eXn/gbk16Ssqa6tLHG1yiSYnE7pY2fCSNmjz1vdJXGnjTOypy/cS+dYWp
 bz1K22VVl73v9Nf0BucdbD36Uv9zoe4bvwf0AK3p9ViX9PLO0uAi7d6N782bxMzh4HOjqQ+j
 ver8+nbfVGoPdGA+lWnzW+uN217bG85T1X5aZNgjaAqrHiugN22P3198sinfeW0kaKIktT/C
 ViTC7cITC1OHQoI6JL0tmlPPHxHff2e/RR3pUGVrw7wOjsV4zeWqLPrMGeVTbZ3vau4X7mla
 8M2P7eiYij60L3LT5c9zSHGShFBGy8JexhVK2T+FywTjTwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsVy+t/xe7oHmBemG9zZZGpx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i4Uft7JYLNmxi9GirXMZq8XFU64Wd++dYLF4ebmH2aJt
 Fr/F/z072C3+XdvIYjH73X52iy1vJrJaHF8bbtGyfwqLg6zH+xut7B5vXr5k8Tjc8YXdY++3
 BSweO2fdZffo2XmG0WPTqk42jzvX9rB5zDsZ6HG/+ziTx+Yl9R4ta48xefT/NfB4v+8qm0ff
 llWMHpear7MHCEXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSW
 pRbp2yXoZfzf+5St4IV8xfW769kaGL+IdzFyckgImEgc6tnP1MXIxSEksJRR4vDifjaIhIzE
 te6XLBC2sMSfa11sEEWvGSVOTZ3FBJLgFbCTWLPyIyOIzSKgIvHgz21WiLigxMmZT8CaRQXk
 Je7fmsEOYgsLBEtMnvGPEWSQiMBeDoldN36ygDjMAg3MEqtm32CGWPGPUeL6jTdgdzALiEvc
 ejIfbB2bgJHEg+XzwVZwAq3evuMjUAMHUI26xPp5QhDl8hLb385hnsAoNAvJIbOQTJqF0DEL
 SccCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgWlr27GfW3Ywrnz1Ue8QIxMH4yFGCQ5m
 JRHe09sXpAvxpiRWVqUW5ccXleakFh9iNAUGxkRmKdHkfGDizCuJNzQzMDU0MbM0MLU0M1YS
 52W7cj5NSCA9sSQ1OzW1ILUIpo+Jg1OqgWnBxjfK2euWe5yxcmi05vfcsNVE49rL/bM8vHlU
 Am7qM9zOX7RKMXndI5miDFHNp/ZhfBOEZQ33dj6RWHBkj+y5mmyXMjbjV6ma3s2fQ6yConcs
 f51c5nvbecs227Ovvyfzf7cWPCgS3GllomS1k5+lerWnWG/H+vkp12+WqN25sSzt9KbZD/bJ
 qHVN3rVAKnDl7IM9eeGq3LaZG75LTzoZ3Ml29nvn49Syi4/XNIeoXpsdXf/hfPBcxXZ5yW8/
 ZE5ekL7846m4z/XLM47xrGd2++kb7b5h/o29iyPaU+JVAtn6pp7SbTnSo9Ko8jmpeWfYytd8
 CetuK6m2SH9WCPWYK6byRn6nkJVSo1ffPCWW4oxEQy3mouJEAMgz11fkAwAA
X-CMS-MailID: 20250203175824eucas1p183992086c6d11614686d9c3a5bd69141
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25@eucas1p2.samsung.com>
 <20250128194816.2185326-13-m.wilczynski@samsung.com>
 <2fe3d93f-62ac-4439-ac17-d81137f6410a@imgtec.com>
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
>> Add bindings for the PowerVR BXM-4-64 GPU integrated in the T-HEAD
>> TH1520 SoC.  This GPU requires two clocks.
> 
> None of the IMG Rogue GPUs use two clocks; they're all either one or
> three. The TRM for the TH1520 I have shows the standard three (core,
> cfg and mem). I mentioned this on P2 ("clk: thead: Add clock support for
> VO subsystem in T-Head TH1520 SoC"); can you add the missing clock here
> too?
> 
>> Document the integration details including clock, reset, power domain
>> and interrupt assignments. Add a dt-bindings example showing the proper
>> usage of the compatible string "thead,th1520-gpu" along with
>> "img,img-bxm".
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../bindings/gpu/img,powervr-rogue.yaml       | 39 +++++++++++++++++--
>>  1 file changed, 35 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index bb607d4b1e07..b0d9635704d8 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -12,10 +12,15 @@ maintainers:
>>  
>>  properties:
>>    compatible:
>> -    items:
>> -      - enum:
>> -          - ti,am62-gpu
>> -      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - ti,am62-gpu
>> +          - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
>> +      - items:
>> +          - enum:
>> +              - thead,th1520-gpu
>> +          - const: img,img-bxm
> 
> This is going to be the main conflict between this series and the other
> B-Series series I mentioned on the cover letter. One of the main changes
> in that series is to rework how our compatible strings are structured;
> that would make this "thead,th1520-gpu", "img,img-bxm-4-64",
> "img,img-rogue". Would you mind holding this change back until the other
> series lands so we can avoid carrying a second deprecated compatible
> string?

Sure that's completely fine !

> 
>>  
>>    reg:
>>      maxItems: 1
>> @@ -60,6 +65,17 @@ allOf:
>>          clocks:
>>            maxItems: 1
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: thead,th1520-gpu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
> 
> As mentioned before, this doesn't represent the hardware. Please bump to
> 3 and add the missing clock.
> 
>> +
>>  examples:
>>    - |
>>      #include <dt-bindings/interrupt-controller/irq.h>
>> @@ -74,3 +90,18 @@ examples:
>>          interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>>          power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
>>      };
>> +
>> +    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>> +    #include <dt-bindings/power/thead,th1520-power.h>
>> +    #include <dt-bindings/reset/thead,th1520-reset.h>
>> +
>> +    gpu: gpu@fff0000 {
>> +        compatible = "thead,th1520-gpu", "img,img-bxm";
>> +        reg = <0xfff0000 0x1000>;
>> +        interrupt-parent = <&plic>;
>> +        interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clk CLK_GPU_CORE>, <&clk CLK_GPU_CFG_ACLK>;
>> +        clock-names = "core", "mem";
> 
> You have CFG mapped to "mem" here. Out of curiosity, was that mismatch
> required to make things work?

Yeah exactly, I understand that from the GPU perspective there are three
clocks, but only two are programmable from the SoC perspective.

So maybe a placeholder clock should be added in the devicetree then,
since the clock exists, but is reserved.

> 
> Cheers,
> Matt
> 
>> +        power-domains = <&pd TH1520_GPU_PD>;
>> +        resets = <&rst TH1520_RESET_ID_GPU>;
>> +    };
> 
