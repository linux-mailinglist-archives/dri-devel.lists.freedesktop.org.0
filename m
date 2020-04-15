Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD51AB902
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8016EAF6;
	Thu, 16 Apr 2020 06:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F1E6E92E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 09:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586942815;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=QSUY1yUiWe9X6ZGNIO1eH3insGRwBB0CwHRK6fHg7uQ=;
 b=I3tvb/IOMKhGxv3BjlFUP5nl/Km4m/i/BRH3ftd/Zp2SEpNrMonitVTZUqGXq9mH3A
 WGFm+wBKPOdJ5SoZy1s6TZSvptzG3gQ6gcclp1Ju0il4AnPvvdmIQ+3pD6CeGIPde5mr
 dEP3TkgGefjlld2+Y7MGDGhDwtFIIwlwuB7AepKmoIUIZ9Lgk8jkhJlu3bJwDgvD0H/4
 TAtEcCVEp06BlTwiehK9wVD+FMu0CiTl+FfoDo/0fhXlNcxfmNqDkEUf9MPcoua/IkMi
 XSN5Y3TbuoEiBweJ7VX3KwKvEqME5jPwxydnEcCPKwc8MkqMmtPkyQqjb4uwQaGeVBTR
 0wkw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id 6028a2w3F9Qa0oW
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 11:26:36 +0200 (CEST)
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <b6ffa74a-acef-f329-0d9e-981483499e16@cogentembedded.com>
Date: Wed, 15 Apr 2020 11:26:35 +0200
Message-Id: <B1E898A7-73BB-4C20-98D2-2D32F0DC170F@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
 <b6ffa74a-acef-f329-0d9e-981483499e16@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Jonathan Bakker <xc-racer2@live.ca>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
 Paul Cercueil <paul@crapouillou.net>, linux-samsung-soc@vger.kernel.org,
 letux-kernel@openphoenux.org, Paul Burton <paulburton@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sergei and Jonathan,

> Am 15.04.2020 um 11:15 schrieb Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>:
> 
> Hello!
> 
> On 15.04.2020 11:35, H. Nikolaus Schaller wrote:
> 
>> From: Jonathan Bakker <xc-racer2@live.ca>
>> to add support for SGX540 GPU.
>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
>> index 2ad642f51fd9..e7fc709c0cca 100644
>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>>  			#interrupt-cells = <1>;
>>  		};
>>  +		g3d: g3d@f3000000 {
> 
>   Should be named generically, "gpu@f3000000", according to the DT spec 0.2, section 2.2.2. It's either "gpu" or "display" TTBOMK...

Yes, you are right and we have named it such for all other
devices in this series. I just missed that.

Jonathan, if you are ok, I'll fix that.

> 
> [...]
> 
> MBR, Sergei

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
