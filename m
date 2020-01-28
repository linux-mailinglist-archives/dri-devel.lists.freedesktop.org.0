Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EE714C72D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947E76F476;
	Wed, 29 Jan 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AB46F3CE;
 Tue, 28 Jan 2020 19:58:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00SJr8rU027386; Tue, 28 Jan 2020 20:57:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/3y9knNrUPLx512U90lYgx5LJxtb0nFcRVZF9G4dV7c=;
 b=FnMs/gJ8hgBaG2vAVoOms5/1hq/D+pCgZg+mjhbd2W5LHTtKji+hbnYRG9phqnDVQFuy
 H9Ji10Sw953VP5TMQId4ScB/WYb9kv20FnvA9aS4AGNB+SZ/KgJDUd87ckHsIysuOdtO
 xWUd9v66gAGBEjM2G0WKXb6KeMK9UldCX2Kf/ks7mZo3L0jUpbZzZT7gHMext3C7G7Lk
 7ckx4nyNrqtj+WocwS9vfzE3EXAxwtvQGPcqThXTPc6RhFVrotiAZfK3EXt8t0zLaYx4
 67fLhxvg/O/I4ICwssZOUI7xrUmhN6t1TuP0mMyK4AxIuP2cJZuwQBDIQAPsIppofswT rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrcaxyjt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 20:57:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C668D10002A;
 Tue, 28 Jan 2020 20:57:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A90192B187B;
 Tue, 28 Jan 2020 20:57:55 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 20:57:55 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 28 Jan 2020 20:57:55 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: Convert etnaviv to json-schema
Thread-Topic: [PATCH v2] dt-bindings: display: Convert etnaviv to json-schema
Thread-Index: AQHV1bPEp8nzC2t1RkuTxNot9B0yK6f/6nAAgAAHBgCAAHaWAIAABj0A
Date: Tue, 28 Jan 2020 19:57:54 +0000
Message-ID: <676d7e79-c129-c13c-b804-25d41afdbef9@st.com>
References: <20200128082013.15951-1-benjamin.gaignard@st.com>
 <20200128120600.oagnindklixjyieo@gilmour.lan>
 <a7fa1b43-a188-9d06-73ec-16bcd4012207@st.com>
 <CAL_JsqJ80kSU7bHJt0_SeX5FVfxxjN5-ZKxt+tOfGy2cV62cbQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJ80kSU7bHJt0_SeX5FVfxxjN5-ZKxt+tOfGy2cV62cbQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <6B7144722ED05A40BD7357561F980001@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_07:2020-01-28,
 2020-01-28 signatures=0
X-Mailman-Approved-At: Wed, 29 Jan 2020 08:06:22 +0000
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 Philippe CORNU <philippe.cornu@st.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/28/20 8:35 PM, Rob Herring wrote:
> On Tue, Jan 28, 2020 at 6:31 AM Benjamin GAIGNARD
> <benjamin.gaignard@st.com> wrote:
>>
>> On 1/28/20 1:06 PM, Maxime Ripard wrote:
>>> Hi Benjamin,
>>>
>>> On Tue, Jan 28, 2020 at 09:20:13AM +0100, Benjamin Gaignard wrote:
>>>> Convert etnaviv bindings to yaml format.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>>>> ---
>>>>    .../bindings/display/etnaviv/etnaviv-drm.txt       | 36 -----------
>>>>    .../devicetree/bindings/gpu/vivante,gc.yaml        | 72 ++++++++++++++++++++++
>>>>    2 files changed, 72 insertions(+), 36 deletions(-)
>>>>    delete mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
>>>>    create mode 100644 Documentation/devicetree/bindings/gpu/vivante,gc.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
>>>> deleted file mode 100644
>>>> index 8def11b16a24..000000000000
>>>> --- a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
>>>> +++ /dev/null
>>>> @@ -1,36 +0,0 @@
>>>> -Vivante GPU core devices
>>>> -========================
>>>> -
>>>> -Required properties:
>>>> -- compatible: Should be "vivante,gc"
>>>> -  A more specific compatible is not needed, as the cores contain chip
>>>> -  identification registers at fixed locations, which provide all the
>>>> -  necessary information to the driver.
>>>> -- reg: should be register base and length as documented in the
>>>> -  datasheet
>>>> -- interrupts: Should contain the cores interrupt line
>>>> -- clocks: should contain one clock for entry in clock-names
>>>> -  see Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>> -- clock-names:
>>>> -   - "bus":    AXI/master interface clock
>>>> -   - "reg":    AHB/slave interface clock
>>>> -               (only required if GPU can gate slave interface independently)
>>>> -   - "core":   GPU core clock
>>>> -   - "shader": Shader clock (only required if GPU has feature PIPE_3D)
>>>> -
>>>> -Optional properties:
>>>> -- power-domains: a power domain consumer specifier according to
>>>> -  Documentation/devicetree/bindings/power/power_domain.txt
>>>> -
>>>> -example:
>>>> -
>>>> -gpu_3d: gpu@130000 {
>>>> -    compatible = "vivante,gc";
>>>> -    reg = <0x00130000 0x4000>;
>>>> -    interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
>>>> -    clocks = <&clks IMX6QDL_CLK_GPU3D_AXI>,
>>>> -             <&clks IMX6QDL_CLK_GPU3D_CORE>,
>>>> -             <&clks IMX6QDL_CLK_GPU3D_SHADER>;
>>>> -    clock-names = "bus", "core", "shader";
>>>> -    power-domains = <&gpc 1>;
>>>> -};
>>>> diff --git a/Documentation/devicetree/bindings/gpu/vivante,gc.yaml b/Documentation/devicetree/bindings/gpu/vivante,gc.yaml
>>>> new file mode 100644
>>>> index 000000000000..c4f549c0d750
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/gpu/vivante,gc.yaml
>>>> @@ -0,0 +1,72 @@
>>>> +# SPDX-License-Identifier: GPL-2.0
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Vivante GPU Bindings
>>>> +
>>>> +description: Vivante GPU core devices
>>>> +
>>>> +maintainers:
>>>> +  -  Lucas Stach <l.stach@pengutronix.de>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: vivante,gc
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: AXI/master interface clock
>>>> +      - description: GPU core clock
>>>> +      - description: Shader clock (only required if GPU has feature PIPE_3D)
>>>> +      - description: AHB/slave interface clock (only required if GPU can gate slave interface independently)
>>> Can you have an AHB slave interface clock without a shader clock?
>> No because the items in the list are ordered so you need to have, in
>> order: "bus", "core", "shader", "reg"
>>
>> If it is needed to allow any number of clock in any order I could write
>> it like this:
> Yes, but I prefer we don't allow any order if we don't have to. Did
> you run this schema against dtbs_check or just audit the dts files
> with vivante?

Both, I found these mix of reg-names:

"core"

"bus","core"

"bus","core","shader"

That not really match with original bindings description...


>
> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
