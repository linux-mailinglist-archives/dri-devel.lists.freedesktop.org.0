Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908E1AEB36
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F8D6EB0E;
	Sat, 18 Apr 2020 09:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64BF89824
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587125782;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=RzdUw8/NV55WKlcwv7PC21SyWddKy4v1gy6xI/rF3XU=;
 b=sb2P5iCXrDb5PBZD9esuqals1ebyyGTwNqKQEse3IDPq1htogPJ+7/7wq/aoGjZWJU
 QoZVVbN8bP+DIklneZutnfxQIbUdRFOurWAkfMyLq+MVbuc1RQNlXYYztr2zxM1R9KOp
 oWvQK4VrJHUR8fcJbBE8q0TMCL/vln7I7rqaW1jna2kGybK/0Tk0p+Y9TyMSyg9fkp7w
 +o0oFi76I4JOiFKYaE5eHoqljYs5uaakPjcO/3q9iwkYMWVzLO7p163dc6bfo3BIsXxM
 HFc02c/RVFLD0hx/XPmg68pGVGGbBtMmrr3eQ9ZcD1BlabBgK0q6+6h4pLhqONWEJklG
 7Xew==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
 with ESMTPSA id g06d2dw3HCG81cE
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 17 Apr 2020 14:16:08 +0200 (CEST)
Subject: Re: [PATCH v6 01/12] dt-bindings: add img,
 pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20200416204158.GA1006@bogus>
Date: Fri, 17 Apr 2020 14:16:07 +0200
Message-Id: <C7C58E41-99CB-49F6-934E-68FA458CB8B1@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
 <20200416204158.GA1006@bogus>
To: Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, David Airlie <airlied@linux.ie>,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, linux-samsung-soc@vger.kernel.org,
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

> Am 16.04.2020 um 22:41 schrieb Rob Herring <robh@kernel.org>:
> 
> On Wed, 15 Apr 2020 10:35:08 +0200, "H. Nikolaus Schaller" wrote:
>> The Imagination PVR/SGX GPU is part of several SoC from
>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
>> Allwinner A83 and others.
>> 
>> With this binding, we describe how the SGX processor is
>> interfaced to the SoC (registers, interrupt etc.).
>> 
>> In most cases, Clock, Reset and power management is handled
>> by a parent node or elsewhere (e.g. code in the driver).
>> 
>> Tested by make dt_binding_check dtbs_check
>> 
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 122 ++++++++++++++++++
>> 1 file changed, 122 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml:  while parsing a block mapping
>  in "<unicode string>", line 74, column 13

It turned out that there was a stray " in line 74 from the last editing phase.
Will be fixed in v7.

Would it be possible to make dt_binding_check not only report line/column but the
contents of the line instead of "<unicode string>"?

> did not find expected key
>  in "<unicode string>", line 117, column 21
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/gpu/img,pvrsgx.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/gpu/img,pvrsgx.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1264: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1270997
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.

BR and thanks,
Nikolaus Schaller

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
