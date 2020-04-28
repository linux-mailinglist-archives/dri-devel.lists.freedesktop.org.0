Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8E1BD4E8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F80B6ECAD;
	Wed, 29 Apr 2020 06:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83706E4D4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1588083017; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+w+KwDzaOwV/ww7pNfZrsFBOSdK2uRoIyYyszXC2jE=;
 b=vOy6cik5Ke533LRPLshMJ+qzIX64H6Cij9kixdoYn7wlFWU7BcpUORTgGjl00q+cPNyTHh
 BbFCg7mLoK1rJVPcplaMCp9tjrNaBELaA/yLJ5L01LwPb6aiWQha9Riei2/T2hz8Wp0kvk
 mMmfgtX5WwOdDWnDWKeSk5Jfz8HZyCs=
Date: Tue, 28 Apr 2020 16:10:05 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/8] dt-bindings: intc: Convert ingenic,intc.txt to YAML
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <TO4I9Q.UQRWC3A2ABT52@crapouillou.net>
In-Reply-To: <f865b39a-3e8d-a367-45b2-aa5e7412e81a@cogentembedded.com>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-2-paul@crapouillou.net>
 <f865b39a-3e8d-a367-45b2-aa5e7412e81a@cogentembedded.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sergei,

Le lun. 27 avril 2020 =E0 12:11, Sergei Shtylyov =

<sergei.shtylyov@cogentembedded.com> a =E9crit :
> Hello!
> =

> On 26.04.2020 21:58, Paul Cercueil wrote:
> =

>> Convert the ingenic,intc.txt doc file to ingenic,intc.yaml.
>> =

>> Some compatible strings now require a fallback, as the controller
>> generally works the same across the SoCs families.
>> =

>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> [...]
>> diff --git =

>> a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.ya=
ml =

>> b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.ya=
ml
>> new file mode 100644
>> index 000000000000..28b27e1a6e9d
>> --- /dev/null
>> +++ =

>> b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.ya=
ml
>> @@ -0,0 +1,63 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: =

>> http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Ingenic SoCs interrupt controller devicetree bindings
>> +
>> +maintainers:
>> +  - Paul Cercueil <paul@crapouillou.net>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^interrupt-controller@[0-9a-f]+$"
>> +
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +        - ingenic,jz4740-intc
>> +        - ingenic,jz4760-intc
>> +        - ingenic,jz4780-intc
>> +      - items:
>> +        - enum:
>> +          - ingenic,jz4775-intc
>> +          - ingenic,jz4770-intc
>> +        - const: ingenic,jz4760-intc
>> +      - items:
>> +        - const: ingenic,x1000-intc
>> +        - const: ingenic,jz4780-intc
>> +      - items:
>> +        - const: ingenic,jz4725b-intc
>> +        - const: ingenic,jz4740-intc
>> +
>> +  "#interrupt-cells":
>> +    const: 1
> =

>    Do double quotes work the same as the single ones?

Yes. The only difference is that you can escape characters in double =

quotes.

-Paul

> =

> [...]
> =

> MBR, Sergei


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
