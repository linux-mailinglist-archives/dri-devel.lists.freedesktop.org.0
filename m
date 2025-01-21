Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB2A1878C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 22:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282F710E2E3;
	Tue, 21 Jan 2025 21:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="FPlpSjTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297EA10E2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 21:58:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250121215833euoutp0128af6a97611213da1a393eac2c2232c1~c1A4OXknk3095230952euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 21:58:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250121215833euoutp0128af6a97611213da1a393eac2c2232c1~c1A4OXknk3095230952euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737496713;
 bh=dhS9VK6lKtJDwB/Wh8WM7ke0tY8Fdq91p1GikVh8Noc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=FPlpSjTb/LH/VDkNSL+s7N1Zr9LdQaKqXOZIRml7leQkVU6MyBsUCQXx+1lth2DDM
 iHENB757SBH0dOCHKJAF3wZHtXHg395o1iKq3x2ym+jdcwfPzJLaGYnc9Ywwh4lrEG
 wRiMZIvYqwIyhDQtfvVwG0Jgq+SI0AKZJPnOgqGc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250121215832eucas1p2853bd0813e860f5e8bb602baf341efe9~c1A3v2gpS1285912859eucas1p2t;
 Tue, 21 Jan 2025 21:58:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 81.63.20397.88810976; Tue, 21
 Jan 2025 21:58:32 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250121215831eucas1p128aaca6fb6e57b29dabac1b7f914d20d~c1A2d3S-l1222312223eucas1p1d;
 Tue, 21 Jan 2025 21:58:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250121215831eusmtrp171478958438ff0ec982029abb41b0548~c1A2bXl923058630586eusmtrp1P;
 Tue, 21 Jan 2025 21:58:31 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-fe-67901888090b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AD.74.19654.68810976; Tue, 21
 Jan 2025 21:58:31 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250121215829eusmtip27335b394e4a3e5f85167ea3b5fec4752~c1A1JlHHx1353513535eusmtip2X;
 Tue, 21 Jan 2025 21:58:29 +0000 (GMT)
Message-ID: <ff53263d-813f-43c3-9090-e73dc0031949@samsung.com>
Date: Tue, 21 Jan 2025 22:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 07/18] dt-bindings: reset: Add T-HEAD TH1520 SoC Reset
 Controller
To: Philipp Zabel <p.zabel@pengutronix.de>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <6018a750dcbb46fe1bd9f653f469d54928c23610.camel@pengutronix.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxzHd25v722bFS4FxhljUTB76DZEGMsJGjbRzbtkJnMLGcwFbMZd
 QXmthTEUHAzoaFeZPDqwIq8YRTIkQMGWgUQebVXssDgQhEIibINZoAWZQMBZL2789/l9f9/f
 +T1yeBxRG+HNi0tMYaSJ4ng/QoC3GpbNb+XD05KAX7XeyDRUg6GWVQ2JfukwY6iyx8xFVosW
 Q3cezhHo8lQ/if7qyMbRYO05EuUYGgg0rbESyK6yctFAWzmBFk71ANS6kEug+p4xElXbW3B0
 XtcGkFxxgYtu33gfjVlNOJoeUHGQXOOKHrfrSLQ+2Iijs7OdJNI+KOQiY/1nKLezBH/vZXru
 bh5JP5iexunu/EWS7liqwmm9ZoykVfo+QDfVKQh6dLCdoCuuH6LHfzRidPP57+jcegNG/7QW
 QM9d/Z2gC7R1gLbkDJEfiz4X7Ilh4uO+YaQ7Q48IYsvUt7jJNvdvB4syskAjpQR8HqTehr1r
 fbgSCHgiqhbAe2OXMDZYBLCwpYpggwUAqxvXsWcl99u7uUrAe5K4COA5X9ZjA9CR/zPH6RFS
 oXBWV0I4GadegUvt1g3dDV4/M4k72ZPaAsdHykgnu1MRUFGqBs6HPCg1Dosrpp8mONQVAE19
 Qpa94Mhk5dMhCCoQTlys5DqZT30E9Tl3Nvxb4BVbOYcd9LYAlgyGsbwfmhq6cZbd4YxRS7Ls
 A28Wqzb0JDjR4tiozYB6lXGDd8NR8wrhXJhDbYcNbTtZeS+8qlWTThlSLvCuzY2dwAUWtZZy
 WFkI8+Ui1v0qVKtO/dfUXNuKnQZ+mk1H0WzaUbNpF83/fasAXge8mFRZgoSRBSUyaf4ycYIs
 NVHi/2VSQhN48r1vrhsf6kDtjN2/C2A80AUgj+PnIfScV0lEwhhx+nFGmhQtTY1nZF3gJR7u
 5yWs6cyTiCiJOIU5xjDJjPRZFuPxvbOwiJRLdltShvRPqUMcNbVeGROuCI19dD8sGAi+AGVB
 uk+KDKprmR+83nKmNG13tuTopzXy8KFhB3gxvWHi8ejfq8rx7/knLHz8zcyKAaapb1towdc1
 YX/MhvRXKA+/k7a1eTzS7VaIT7NBr97aOxPOfFVcvbw3/EKMwvb8apFvQWDJtgMN8SsvDCtn
 In47GOvhM28OODK6/VhwVu+hk0dPhvWrCu3BNfP3rnnAfdXJUz8c8CddXToWxfr97wY51kKG
 yvZZ+jJXPgycHK+MokO0TZGvHfaNyy6vWt5lHF4iho5b/vEuTJcnT0bmuc5GN3lGmYat9Sce
 vbHjxsSe6MsjjrWU5/xwWax41w6OVCb+Fwrxck5NBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsVy+t/xe7rtEhPSDabfYLI4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xcKPW1ksluzYxWjR1rmM1eLiKVeLu/dOsFi8vNzDbNE2
 i9/i/54d7Bb/rm1ksZj9bj+7xZY3E1ktjq8Nt2jZP4XFQdbj/Y1Wdo83L1+yeBzu+MLusffb
 AhaPnbPusnv07DzD6LFpVSebx51re9g85p0M9LjffZzJY/OSeo+WtceYPPr/Gni833eVzaNv
 yypGj0vN19kDhKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
 Uov07RL0MmZMPcta8Fa44tqkmgbGjQJdjJwcEgImEo/3HGbtYuTiEBJYyiix9fhjZoiEjMS1
 7pcsELawxJ9rXWwQRa8ZJR7+ecYIkuAVsJN4t2MKG4jNIqAq8W3PPWaIuKDEyZlPwJpFBeQl
 7t+awQ5iCwtESHROn8oIMkhEYCqLxJGrf8FWMwtsZ5TYMBMiIyTQzSRx8eldsBZmAXGJW0/m
 M4HYbAJGEg+Wz2cFsTkFfCR2Nl8BquEAqlGXWD9PCKJcXmL72znMExiFZiE5ZBaSSbMQOmYh
 6VjAyLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMGltO/Zzyw7Gla8+6h1iZOJgPMQowcGs
 JMIr+qEnXYg3JbGyKrUoP76oNCe1+BCjKTAwJjJLiSbnA9NmXkm8oZmBqaGJmaWBqaWZsZI4
 L9uV82lCAumJJanZqakFqUUwfUwcnFINTHaqizJUOB7PC+sRCjc+cvGV9PVfXwXy0mrOfWry
 bd9VwXgleNKXVQmvQhuk2Bn0mlforlpZsdxN699um7kbizez/IvxyV/ZHXJO7eaDLw9fPvXN
 4O3J+2IR8CJYzkLbI3Zm0bHeNTP3sFYHaDxysKl+cHHHOhWth8LbF73qdtHcsTJNrWluR0VU
 86zuM7Pt9Jl1Vz34Nfcaw8xLzcZhteJu8d/k9W55vn/35k9SzvGWP5NSns7x4/bxPaWz9/7/
 6INv3x28O1ViovHdzpR5d1TMjnQnJ7RffvufYW3XuqTgJbJ/xP7WTjrioHv2pMEK8YvXH4d/
 bjofl7y3g6+QeWfWJQ7DmiPGE8Octsncd1ZiKc5INNRiLipOBAC406E84wMAAA==
X-CMS-MailID: 20250121215831eucas1p128aaca6fb6e57b29dabac1b7f914d20d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172128eucas1p2847f0863524b53d2d5029e5e9d238298
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172128eucas1p2847f0863524b53d2d5029e5e9d238298
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172128eucas1p2847f0863524b53d2d5029e5e9d238298@eucas1p2.samsung.com>
 <20250120172111.3492708-8-m.wilczynski@samsung.com>
 <6018a750dcbb46fe1bd9f653f469d54928c23610.camel@pengutronix.de>
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



On 1/21/25 09:35, Philipp Zabel wrote:
> On Mo, 2025-01-20 at 18:21 +0100, Michal Wilczynski wrote:
>> Add a YAML schema for the T-HEAD TH1520 SoC reset controller. This
>> controller manages resets for subsystems such as the GPU within the
>> TH1520 SoC.
> 
> This mentions "resets", plural, but the #reset-cells = <0> below and
> the driver implementation look like there only is a single reset
> control (for the GPU).
> 
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../bindings/reset/thead,th1520-reset.yaml    | 44 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 45 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>> new file mode 100644
>> index 000000000000..c15a80e00935
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://protect2.fireeye.com/v1/url?k=9a1e91c0-fb9584d9-9a1f1a8f-74fe485cbfec-4ac5a7f48f7ed305&q=1&e=57e2ad34-940c-48d4-b365-a5719457bd20&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Freset%2Fthead%2Cth1520-reset.yaml%23
>> +$schema: https://protect2.fireeye.com/v1/url?k=40dd1447-2156015e-40dc9f08-74fe485cbfec-5ae5fe2734d49263&q=1&e=57e2ad34-940c-48d4-b365-a5719457bd20&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>> +
>> +title: T-HEAD TH1520 SoC Reset Controller
>> +
>> +description:
>> +  The T-HEAD TH1520 reset controller is a hardware block that asserts/deasserts
>> +  resets for SoC subsystems.
> 
> Again, plural.

Yeah should be singular sorry.

> 
>> +
>> +maintainers:
>> +  - Michal Wilczynski <m.wilczynski@samsung.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - thead,th1520-reset
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#reset-cells":
>> +    const: 0
> 
> Should this be "const: 1" instead?

Right now I'm not planning to extend by more resets, I've thought about
this during the discussion on v2 of this patchset. At this point I just
can't see more interesting resets to have. Vendor kernel implements WDT
and NPU. I don't think NPU driver will be upstream anytime soon. That
would leave WDT reset potentially.

> 
> regards
> Philipp
> 
> 
