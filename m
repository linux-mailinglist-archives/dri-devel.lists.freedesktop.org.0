Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC401AEB30
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2956E1A8;
	Sat, 18 Apr 2020 09:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3666EBCA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:09:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k11so2776711wrp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YQmfy5glSWEhJacmHQcBoh0P5gI+y1xLhn/MI5MwRqk=;
 b=a0P/bUJk6o4KfMmFecVMQRsWuelunj5M3QJxQxTu6to4WAQob5LfbxChfRH0a6dwDj
 iNR57ygB8uH7UURrRNzWkQ8vspIJVqgol9MkvvXSz/cm+AnLhC+uKmwA3jpvuOobCcgc
 KON4uK1f+5Y1OLIVlTxIEEI3ASLbbuSLQ3NiS2NUfo5xrqJo/Q5iMZpWAjtWhx5/M0KN
 hRvTCofOnBp3OUfJMfth7Ov6eIlNj9MXG1acK/G7uyIUgNEBLcPBcKJ+tIH80fWO6DuJ
 rWftpSBDDApCaJzKHUzzK+sJRq2rmfLKHntuqUrJ3fCT5oPSY1tJwYLhRQuZIlZ5M9eF
 pKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YQmfy5glSWEhJacmHQcBoh0P5gI+y1xLhn/MI5MwRqk=;
 b=WWTGCpgrSXoWVf3v1rBvacnPzgenOkQ3lDuPUMPhzYBncnHELJg3xPKCNMMZ6zm7td
 fM3Gzl4Ae3wstEzgSq4ZQmH1386drdtWxmuFiSW9fTpwn33BXEMqq605autLSmVApL2O
 6b3U72gW0zQFy0muGKM0lImwe1SihVjsw5WzcYS4cGr6a5YJ3X/qrdjCAU9kD8SK6vHI
 EGX9ZtVw8utuYPgPNvsVUpPPdeS4bYS5nwBH+mCec8yxcCXo+67jR5xpX4DtThVzaZ1i
 5Qb4uycs8sbOUkkqyv1TLkxTXUSCHup8Qfz4PBr+puv7b3wDi6ApBPJUfM2HAProsE33
 HKYg==
X-Gm-Message-State: AGi0PuYkMLeos2G2WavEZ8QuIcF8co8g0FTU/Y2SpGRb4LhcSNBhCkUG
 Pl4Gg1433fSsWkQmEbhtFVs=
X-Google-Smtp-Source: APiQypJw9RvOMBiofKtDCRe+QcAA+eB/l83Q4b2jSf0HWRF7CviGAUhDoTYoDphSTR+uEnZgPspyVA==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr3343798wrq.427.1587125348648; 
 Fri, 17 Apr 2020 05:09:08 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:14a4:6f21:1f15:2088?
 ([2a02:810d:340:2e50:14a4:6f21:1f15:2088])
 by smtp.gmail.com with ESMTPSA id n2sm10823975wrq.74.2020.04.17.05.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 05:09:08 -0700 (PDT)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Maxime Ripard <maxime@cerno.tech>
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
From: Philipp Rossak <embed3d@gmail.com>
Message-ID: <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
Date: Fri, 17 Apr 2020 14:09:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On 15.04.20 15:04, H. Nikolaus Schaller wrote:
> 
>> Am 15.04.2020 um 15:02 schrieb Maxime Ripard <maxime@cerno.tech>:
>>
>> On Wed, Apr 15, 2020 at 02:41:52PM +0200, H. Nikolaus Schaller wrote:
>>>>> The kernel modules built from this project have successfully
>>>>> demonstrated to work with the DTS definitions from this patch set on
>>>>> AM335x BeagleBone Black, DM3730 and OMAP5 Pyra and Droid 4. They
>>>>> partially work on OMAP3530 and PandaBoard ES but that is likely a
>>>>> problem in the kernel driver or the (non-free) user-space libraries
>>>>> and binaries.
>>>>>
>>>>> Wotk for JZ4780 (CI20 board) is in progress and there is potential
>>>>> to extend this work to e.g. BananaPi-M3 (A83) and some Intel Poulsbo
>>>>> and CedarView devices.
>>>>
>>>> If it's not been tested on any Allwinner board yet, I'll leave it
>>>> aside until it's been properly shown to work.
>>>
>>> Phillip has tested something on a83.
>>
Yes I'm currently working on the a83t demo. The kernel module is loading 
correctly and the clocks, interrupts and resets seems to be working 
correctly.

I'm currently working on getting the users space driver working with the 
kernel driver. This is hopefully done soon.

>> I'm a bit skeptical on that one since it doesn't even list the
>> interrupts connected to the GPU that the binding mandates.
> 
> I think he left it out for a future update.
> But best he comments himself.

I'm currently working on those bindings. They are now 90% done, but they 
are not finished till now. Currently there is some mainline support 
missing to add the full binding. The A83T and also the A31/A31s have a 
GPU Power Off Gating Register in the R_PRCM module, that is not 
supported right now in Mainline. The Register need to be written when 
the GPU is powered on and off.

@Maxime: I totally agree on your point that a demo needs to be provided 
before the related DTS patches should be provided. That's the reason why 
I added the gpu placeholder patches.
Do you have an idea how a driver for the R_PRCM stuff can look like? I'm 
not that experienced with the clock driver framework.

The big question is right now how to proceed with the A83T and A31s 
patches. I see there three options, which one do you prefer?:

1. Provide now placeholder patches and send new patches, if everything 
is clear and other things are mainlined
2. Provide now patches as complete as possible and provide later patches 
to complete them when the R_PRCM things are mainlined
3. Leave them out, till the related work is mainlined and the bindings 
are final.


Since this GPU IP core is very flexible and the SOC manufactures can 
configure it on their needs, I think the binding will extend in the 
future. For example the SGX544 GPU is available in different 
configurations: there is a SGX544 core and SGX544MPx core. The x stands 
for the count of the USSE (Universal Scalable Shader Engine) cores. For 
example the GPU in the A83T is a MP1 and the A31/A31s a MP2.
In addition to that some of the GPU's have also a 2D engine.
There might be even more differences in the GPU's that we don't know 
right now and should be described in the Devicetree, but that's a 
different topic that we should keep in mind.

Cheers
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
