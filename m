Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20798A8B7C5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 13:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC89010E8D3;
	Wed, 16 Apr 2025 11:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="H61Hgze5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE9C10E8D3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 11:40:19 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250416114017euoutp02682a590618e8007e07082e976eeac798~2yaVnMnMr0481404814euoutp02S
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 11:40:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250416114017euoutp02682a590618e8007e07082e976eeac798~2yaVnMnMr0481404814euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744803617;
 bh=iOkOVT8MZOfj07enU9xlf2VRxKNwm4FnBqFYN8+mP38=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=H61Hgze5bsWiXUDEhCP9qk7plZqbYybFrRDuOaki+xRNR4tlXnED4xj6My5jnm6Aa
 EN2k0iBvPt3DGBgD3AEw8lwEXLhDdCnMKAO3En4fQIEJwIMPdypkNWO8Bygn+rTkVw
 Sin3fLhkR45xM8rrYbFrJQWpS3/7TyFsCET6viqk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250416114017eucas1p214e415a9c51977ab5661c72e5380aabc~2yaVRTdZH0471104711eucas1p2S;
 Wed, 16 Apr 2025 11:40:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 49.4E.20397.1279FF76; Wed, 16
 Apr 2025 12:40:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250416114016eucas1p1d5d662177196380940a4bbca0a68bb15~2yaUmqB071098910989eucas1p1Q;
 Wed, 16 Apr 2025 11:40:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250416114016eusmtrp21a7c9a3c416a8cc033c5b0ec9bdf518c~2yaUkpMPe1096310963eusmtrp2s;
 Wed, 16 Apr 2025 11:40:16 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-a6-67ff97212e29
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 09.16.19654.0279FF76; Wed, 16
 Apr 2025 12:40:16 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250416114015eusmtip14313da5dadc3c50b0ad139c80a4d9581~2yaTc4QMD0718907189eusmtip1o;
 Wed, 16 Apr 2025 11:40:15 +0000 (GMT)
Message-ID: <fe445d04-b488-4f11-a14d-9dfda07e3e88@samsung.com>
Date: Wed, 16 Apr 2025 13:40:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: firmware: thead,th1520: Add resets
 for GPU clkgen
To: Conor Dooley <conor@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, Drew Fustini
 <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, m.szyprowski@samsung.com,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250415-tycoon-naming-20ba5a55c469@spud>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGc+69vb1UIZfC5BQWKyxjc8uwoJsn2YbDuO2abJn6D5khcZ3e
 1EZKWQvINuOYMKUIEywIFqHFKB+dFYZtpQ1tJyKt6dahYxX5FIdOq4AM3dBAmeXqxn/P+5zf
 ed/nPTkULqwjYyl5Vg6rypJmJpACwtrz+Nc34qsXZBLDmAh5rp3E0BmHD0MtVUYS3Tv2gET6
 bh8PjVw1Y6jv0RSJzt7q5aM7jm8JdFc3QqLf7CdINFPWDZB1pohEpu5hPmqYthDoVIcdoIOa
 Rh4aHvEQqHiqAEd1D6twtNDZwUe1ky4+Mt+v4CG3KR0VuSqJ90SM428Dwdh0w3ym1PYzYNqN
 GpIZ8neSTP3lrczoYTfGnDv1DVNk6sGYI/MSZsr5O8l8bzYC5pz3a2amfeWWiO2Cd3axmfI8
 VrUm9TPB7tPWQ7zs+3H5+q7MAtCyogSEUZBeBzUltVgJEFBCuhlA/2wPzhUPAXTeLMdDlJCe
 AVCrZZ7f+OOHcR4HNQEYHLtIcsUEgJq2KiJEhdOpcLT4MQhpgn4Z2m4F+ZwfCS8fH19kXqDF
 cHSg5qlPUVF0BjQG9obsaPol2GfSgVBPnB4kYWOxdpHH6Rg4MK7HQpqkU+CNJj0vpMPo9XDW
 dxZwjBgWWmoXV4B0gwB6Dl8ludiboMd8Bed0FAy4zXxOvwgXbFxTSCvhDctfz5h90Fbqfqbf
 hkO+J2QoKE6vhq32NZydBp0H+hfzQzoC9k9EchEi4FFrNc7Z4bD4oJCjE2FVadl/Q33NVqwc
 JOiWPIpuyZK6Jcvo/p9rAIQRxLC5aoWMVa/NYvcmqaUKdW6WLGmnUtEOnv5gb9D9qAM0B6aT
 ugBGgS4AKTwhOty3PigThu+SfvkVq1LuUOVmsuouEEcRCTHhJ13fyYS0TJrD7mHZbFb1/BSj
 wmILMHmnx3p+U+vtmYLESNd+sFr4T6RRMZAbn3fJK5m+rtbvI4/PX7MpN9xZVkfPLUuRvFoZ
 e89SvcfZ9sD14xl9ouXTKx8UReT21ASTxd4G+Zwxdl1cIENEbWDEH15Ku96aN3HEsTmd9X9+
 fiFN0uuqMNTY34xyRDsDfb+k9uK35Yr9a4+aa8vmK5WyYyU7g7Z+w4XZlVK2KcX00Y6MVVu8
 oo0BZdvWQJh9c/b2A/XJRj95aLDeb9C89f7r6fjdyULjcpP24qqKj4V/DsVv7JzDn5h1KfIV
 F5ZP/uTc9u4Jd4V8m9b4SSMUCE6/4isn8kWF+TeHW1iqoewL8UCOoW1wLIFQ75Ymv4ar1NJ/
 ARmwujQwBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsVy+t/xu7oK0/+nGzw6pWVx4voiJos1e88x
 WaycuorN4vW0D2wW84+cY7W4d2kLk8WVr+/ZLNY9vcBu8WJvI4vFy1n32Cwu75rDZvG59wij
 xbbPLWwWa4/cZbdY+HEri8WSHbsYLdo6l7Fa3L13gsWi430Ds8XcL1OZLf7v2cFuMfvdfnaL
 LW8mslocXxtu0bJ/CouDpMfebwtYPHbOusvu0bPzDKPHplWdbB53ru1h85h3MtDjfvdxJo/N
 S+o9WtYeY/Lo/2vg8X7fVTaPvi2rGD02n672+LxJLoAvSs+mKL+0JFUhI7+4xFYp2tDCSM/Q
 0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j6bZ21oI30hXzD+U0MK4U62Lk5JAQMJF4
 vPoJaxcjF4eQwFJGiRct61khEjIS17pfskDYwhJ/rnWxQRS9ZpTYuPciE0iCV8BO4n7HT0YQ
 m0VAVWLn03/sEHFBiZMzn4A1iwrIS9y/NQMozsEhLBAjsepVOUhYREBZ4sraWYwgM5kF7rJJ
 zP75jQliQRuTxPVru8GuYBYQl7j1ZD7YMjYBI4kHy+eDxTkFzCV+nFvHCDKUWUBdYv08IYhy
 eYnmrbOZJzAKzUJyxiwkk2YhdMxC0rGAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYNLZ
 duznlh2MK1991DvEyMTBeIhRgoNZSYT3nPm/dCHelMTKqtSi/Pii0pzU4kOMpsCgmMgsJZqc
 D0x7eSXxhmYGpoYmZpYGppZmxkrivGxXzqcJCaQnlqRmp6YWpBbB9DFxcEo1MPkvPrVvrm/R
 Uns380g9VTeJhKiZZk7VV57NOBN3bqvM6zyvjOTA45dvShoU8D58MuVNbpLHzva9V5gfqt+v
 WiFm0bmTz6bZI+eHmsuVhf8qpmjkGJx4V8V1gbv4ucfe/0nn86w8rdK0P5Vaz2hae3ad7D7b
 L/9ZvL6b7zQK6RDxE/fvuBoiFlJ84u6NRx+2rchX1OAW0YjaPj/txYp6tSe3FnBNy9P1s/iU
 qXVcrbI4dcvVqGW7HDmF3uewt62Ps64RT8mdV7v1xk6N/5pNz+Uf8ifxrIh+/8Hza5DYxjcq
 bjL9x9yyQyet2Oy81fHL5c29c1IrWQ782K7tp6ygabcn1SrljWeG2aGLaVyvlFiKMxINtZiL
 ihMB7u4zXMMDAAA=
X-CMS-MailID: 20250416114016eucas1p1d5d662177196380940a4bbca0a68bb15
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <CGME20250414185315eucas1p1fae2d6250bfd30b12bb084e197c02948@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com>
 <20250415-tycoon-naming-20ba5a55c469@spud>
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



On 4/15/25 18:38, Conor Dooley wrote:
> On Mon, Apr 14, 2025 at 08:52:56PM +0200, Michal Wilczynski wrote:
>> Extend the TH1520 AON firmware bindings to describe the GPU clkgen reset
>> line, required for proper GPU clock and reset sequencing.
>>
>> The T-HEAD TH1520 GPU requires coordinated management of two clocks
>> (core and sys) and two resets (GPU core reset and GPU clkgen
>> reset).  Only the clkgen reset is exposed at the AON level, to support
>> SoC-specific initialization handled through a generic PM domain. The GPU
>> core reset remains described in the GPU device node, as from the GPU
>> driver's perspective, there is only a single reset line [1].
>>
>> This follows upstream maintainers' recommendations [2] to abstract
>> SoC specific details into the PM domain layer rather than exposing them
>> to drivers directly.
>>
>> [1] - https://lore.kernel.org/all/816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com/
>> [2] - https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../devicetree/bindings/firmware/thead,th1520-aon.yaml        | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
>> index bbc183200400de7aadbb21fea21911f6f4227b09..6ea3029c222df9ba6ea7d423b92ba248cfb02cc0 100644
>> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
>> @@ -32,6 +32,13 @@ properties:
>>      items:
>>        - const: aon
>>  
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: gpu-clkgen
>> +
>>    "#power-domain-cells":
>>      const: 1
>>  
>> @@ -39,6 +46,8 @@ required:
>>    - compatible
>>    - mboxes
>>    - mbox-names
>> +  - resets
>> +  - reset-names
> 
> Given these are new required properties, have you made sure in the
> driver that their absence will not cause problems with older
> devicetrees? I took a brief look at the driver, and it _looked_ like you
> were failing if they were not there? It was a brief look though, tbf.

Hi Conor,

Good point — but in this case, the devicetrees compatible with the
driver haven’t been merged upstream yet. In fact, the TH1520 PM domains
driver currently doesn’t even compile against mainline, since the
required commit [1] didn’t make it into 6.15.

That said, Drew has queued the DT changes for the next release [2], and
you’ve queued [1], so assuming this series lands in 6.16, there won’t be
any older devicetrees to support. As a result, I haven’t added a
fallback path in the driver for missing properties.

If, however this series doesn’t make it in for 6.16, then yes — we’d
need to revisit the driver and add a failure safe path for cases where
these properties aren’t present.

Thanks,
Michał

[1] - https://lore.kernel.org/all/20250407-synergy-staff-b1cec90ffe72@spud/
[2] - https://lore.kernel.org/all/Z%2F6p6MQDS8ZlQv5r@x1/

> 
>>    - "#power-domain-cells"
>>  
>>  additionalProperties: false
>> @@ -49,5 +58,7 @@ examples:
>>          compatible = "thead,th1520-aon";
>>          mboxes = <&mbox_910t 1>;
>>          mbox-names = "aon";
>> +        resets = <&rst 0>;
>> +        reset-names = "gpu-clkgen";
>>          #power-domain-cells = <1>;
>>      };
>>
>> -- 
>> 2.34.1
>>
