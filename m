Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D661AB8FC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F409A6EAED;
	Thu, 16 Apr 2020 06:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9AC6E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586954827;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=6/o2eUBt4iN9I0U74c2I8jHNfikxj7yqfISGp3x31ZE=;
 b=onQBInnTZ632a/LE2p3u+7Q10lF8HLtAltgbGuJrpEjTmrwGXAaBgiCFexUMS7Ld3j
 +aFYlGEfxBQGTcbfDpuCONGwdT4LiTgU88CufrpYnoucujd8GWtxsdcLCDUziKEWz5BP
 PUYBqLqPYFzyHUzr4QRDUl+0CF7YZC0Sj7/xT/+QX4ApR7KQNrD9eDAjtZJSsn0Rd8Pw
 Q0zynYPoEC51wa/rzZeje4oI1YN6uZHg9uQohjx3k0rHTz1aAdE97IB0e38TRl9pOyAK
 g90KRgYZdvehuNzidvyzquoddMoyfU8iB14/g2ri6KhGiDEJV33pPSHUms64TI8In/zz
 nuEw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCz3b9m9rH79DVZTKLB3vWvm2T1hRBz6in0C9d6y"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:26b3:fd00:4058:8a66:740e:2249]
 by smtp.strato.de (RZmta 46.4.0 AUTH) with ESMTPSA id 6028a2w3FCkp1ws
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 14:46:51 +0200 (CEST)
Subject: Re: [PATCH v6 07/12] ARM: DTS: omap5: add sgx gpu child node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
Date: Wed, 15 Apr 2020 13:46:06 +0200
Message-Id: <EFA7F2F0-96EA-45D9-B8C8-00DC8C72344D@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
 <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com>
 <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-omap@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

> Am 15.04.2020 um 13:38 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
> 
> On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>> 
>> and add interrupt.
>> 
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # Pyra-Handheld.
> 
> Don't add your own Tested-by tags. These are implied by authorship,
> otherwise all patches people make should have such tag.

Ok I see. AFAIR it originates in several phases of editing to report on which device it was tested.

Is there a canonical way of writing "tested-on: ${HARDWARE}"?

E.g. would this be ok?

Signed-off: H. Nikolaus Schaller <hns@goldelico.com> # tested on Pyra-Handheld

BR and thanks,
Nikolaus Schaller

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
