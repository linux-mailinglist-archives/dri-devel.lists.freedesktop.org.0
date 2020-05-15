Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6958D1D602C
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1535B6E1B7;
	Sat, 16 May 2020 09:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F07F6EC1E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589529601;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=bU5sZyM8w1KL+vZGRsgMWFgVeXL93IV+Cv0ulYGm/2A=;
 b=Dc19P3PpMAMwnksHlTsSsqQkvU8yS9mo3E+LrlGaSmKq4PlVYbNYWM6Ifdba1GFE3D
 VWHbO8TJSAhEc/3acbTiBtVqLWrkxId8q2XW7gZWmu381ETazdpUDj44V729AYaFJvPe
 oZhuI8DpXPO9O2HeQknf3x2cX2Vikqd5d21kdw/Q7RP0vs8XMljuwpYwwWrqPavupUBG
 U6ZPxtnZis1JMSposdUn6C5asGruUfWmtONZkb+VnzBMxSjoGxSUYdHKy3lzRKNGT8JH
 +ucP957F0I8U4R2h+JNkiOUvqSopsm2pPmc2ecwKHEJwlml9yadA5bgdFuSIOI2CHKaC
 V6Bw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vtwDOvBTU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
 with ESMTPSA id R0acebw4F7xbYgL
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 15 May 2020 09:59:37 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,
 pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200505155311.GA18025@bogus>
Date: Fri, 15 May 2020 09:59:36 +0200
Message-Id: <DD3BF759-4F3D-4147-9A80-DB6C18B13400@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
 <20200505155311.GA18025@bogus>
To: Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Sat, 16 May 2020 09:58:59 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-omap@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 05.05.2020 um 17:53 schrieb Rob Herring <robh@kernel.org>:
> 
> On Fri, Apr 24, 2020 at 10:34:04PM +0200, H. Nikolaus Schaller wrote:
>> The Imagination PVR/SGX GPU is part of several SoC from
>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
>> Allwinner A83 and others.
>> 
>> With this binding, we describe how the SGX processor is
>> interfaced to the SoC (registers and interrupt).
>> 
>> The interface also consists of clocks, reset, power but
>> information from data sheets is vague and some SoC integrators
>> (TI) deciced to use a PRCM wrapper (ti,sysc) which does
>> all clock, reset and power-management through registers
>> outside of the sgx register block.
>> 
>> Therefore all these properties are optional.
>> 
>> Tested by make dt_binding_check
>> 
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150 ++++++++++++++++++
>> 1 file changed, 150 insertions(+)
>> +    oneOf:
>> +      - description: SGX530-121 based SoC
>> +        items:
>> +          - enum:
>> +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora 600MHz and similar
> 
> Should be indented 2 more here and elsewhere where you have a list 
> under a list.

added for patch v8 series.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
