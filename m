Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA6417181D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638D06ECB4;
	Thu, 27 Feb 2020 12:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388D26E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582808227;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=EHgVmvZBm7FfOuRidNTu7QhYG4ewtZHDd8hCpQzwN2Q=;
 b=ZTHblfUBCujf/obpCSnM3vLxvWSSNY1Uol0x5zT7Zh76pnKM04HuRDmjTjPDCzwU+1
 XNazIg06ZCx9TwkW805P6ma2ZIwMsPi/yrZTa0AV71RE59h6qEqYv/gzDYv+p+OGuv3k
 DYuOM26N745npmwKwypNwYiQm5rc7um+A6iJBYivws6VBr5FDSz9r5kU4iKu9kPGfmhh
 1300sZXLsIdIEmqiEXxtqkyqfSjZYUMW5vuh6AuaOB9F15QYKovCx3qAfoeA8aH9Jht4
 BiJp8BDtKZPJx9v8GaJ+IHJFSvMEH2l76Mu/QLDxzQRvZm8lqaZZ/ioL2QBICcysYohP
 D1Ow==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCygV4+2OGxpoAr2x7EvFYqujh1U+3K41Uc/x8xM"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2655:a800:8035:ee61:8f08:2eb7]
 by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id U06217w1RCuoAsJ
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 27 Feb 2020 13:56:50 +0100 (CET)
Subject: Re: [RFC 0/8] MIPS: CI20: add HDMI out support
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200227122325.GA7587@ravnborg.org>
Date: Thu, 27 Feb 2020 13:56:56 +0100
Message-Id: <8EE60F87-415A-44EA-AA49-632E232095FF@goldelico.com>
References: <cover.1582744379.git.hns@goldelico.com>
 <20200227122325.GA7587@ravnborg.org>
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>, linux-gpio@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org, "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

> Am 27.02.2020 um 13:23 schrieb Sam Ravnborg <sam@ravnborg.org>:
> 
> Hi Nikolaus.
> 
> On Wed, Feb 26, 2020 at 08:12:52PM +0100, H. Nikolaus Schaller wrote:
>> This patch series adds HDMI output to the jz4780/CI20 board.
>> 
>> It is based on taking the old 3.18 vendor kernel and trying
>> to achieve the same with modern DTS setup and new/modified
>> drivers.
>> 
>> Unfortunately, in this first RFC, only EDID and creation of
>> /dev/fb0 are working. Also, HDMI hot plugging is detected.
>> 
>> But there is no HDMI output signal. So some tiny piece seems
>> to be missing to enable/configure the Synposys HDMI controller.
>> 
>> We need help from the community to fix this.
>> 
>> Note: device tree bindings are from 2015 and still seem to
>> fit - except they are not in yaml format.
>> 
>> Original authors of most patches are
>> * Paul Boddie <paul@boddie.org.uk>
>> * Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> 
>> 
>> H. Nikolaus Schaller (2):
>>  drm: ingenic-drm: add MODULE_DEVICE_TABLE
>>  MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780
>> 
>> Paul Boddie (4):
>>  drm: ingenic: add jz4780 Synopsys HDMI driver.
>>  pinctrl: ingenic: add hdmi-ddc pin control group
>>  MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
>>  MIPS: DTS: CI20: add HDMI setup
>> 
>> Zubair Lutfullah Kakakhel (2):
>>  dt-bindings: video: Add jz4780-lcd binding
>>  dt-bindings: video: Add jz4780-hdmi binding
>> 
>> .../bindings/display/ingenic-jz4780-hdmi.txt  |  41 ++++++
>> .../bindings/display/ingenic-jz4780-lcd.txt   |  39 ++++++
> New bindings in DT Schema format please...
> We want to have then in a formal launguage so we can use these
> to verify the DT files.

Yes, I know. And I fully support the goal.

But I personally do not have the time to learn the (IMHO brain-twisting)
way the Schema format is working. Especially, I am not interested
in becoming volunteer translator for .txt based schemas developed
by someone else.

So I hope that someone from the community can and is willing to do
that.

Or that there will appear good tools soon. E.g. some GUI
based editor tool would be very helpful so that you don't have
to fight with the yaml indentation rules. Like there are XML
and DTD editors. And even HTML is rarely written manually any more.

IMHO such tools should have been developed and in place *before*
the rule to provide DT schemata is enforced.

Anyways, I have requested for comments (and did expect this one).

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
