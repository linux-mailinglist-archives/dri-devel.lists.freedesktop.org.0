Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A8AC373CF
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 19:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EF410E073;
	Wed,  5 Nov 2025 18:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="vVMTH8oh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC8D10E073
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 18:03:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E7D404E4153C;
 Wed,  5 Nov 2025 18:03:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A597E60693;
 Wed,  5 Nov 2025 18:03:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B833410B510C2; Wed,  5 Nov 2025 19:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762365835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FCxsKgZxhNgnJkvj/KGRREoRR8EGeTXpZ8jT6eg79s4=;
 b=vVMTH8ohHbUDKCAY5bjisKQTkA5E7XO7aW5dd5QnefShbzI9TBfbfer0ecT2S47DQwHrk5
 ocCj35krYsCkye6YFFj6xLJ+WP1uNrYBY0Fe0lBr7p8+AF0Ai1lkzetCQFaV2UOuKI3TKM
 n90TQy49xvU3plCaFhv4lmVSFeI0EOyUpv0wqv2HkAGFLiwmTVw+dG9C6XpBg/PxhE5h34
 /2w62xT5eU9HLv3N4Iy4hdHByhGz6phq74ak7WZI2a8AkNBcPqoqF1NyYe2FpvCRePQGHa
 hkZl8u3GOYy2zs/p8h2JCbNB6dHcXA0M+PbQZn6aBzZ9gsfEyNRhfqCKOWWWMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 19:03:50 +0100
Message-Id: <DE0YJPERKME9.2CYGFAPULFMZV@bootlin.com>
Cc: "Abel Vesa" <abelvesa@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Fabio Estevam" <festevam@gmail.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>,
 "Lucas Stach" <l.stach@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob Herring"
 <robh@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Marek Vasut" <marek.vasut@mailbox.org>,
 <dri-devel@lists.freedesktop.org>, "Laurentiu Palcu"
 <laurentiu.palcu@oss.nxp.com>
X-Mailer: aerc 0.20.1
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
 <DDZ6KCUVYB55.330X4X5ETRXR3@bootlin.com>
 <25cd3b11-8417-44d3-af28-fa73419c713b@mailbox.org>
In-Reply-To: <25cd3b11-8417-44d3-af28-fa73419c713b@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Marek,

On Tue Nov 4, 2025 at 12:08 AM CET, Marek Vasut wrote:
> On 11/3/25 4:55 PM, Luca Ceresoli wrote:
>
> Hello Luca,
>
>> On Sun Nov 2, 2025 at 6:02 PM CET, Marek Vasut wrote:
>>> The DT binding for this bridge describe register offsets for the LDB,
>>> parse the register offsets from DT instead of hard-coding them in the
>>> driver. No functional change.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>
>> I was initially a bit skeptical because normally register offsets are
>> derived from the compatible string, not from device tree. But then I
>> realized this is about the LDB which has its two registers in the
>> MEDIA_BLK. This means all in all this looks somewhat like an integration
>> aspect (the LDB component uses two resources of the MEDIA_CLK component)
>> and your patch mekse sense.
>>
>> So my only remark is that the above may be in the commit message, to mak=
e
>> the "why" clear from the beginning. It took a bit of research for me to
>> find out.
>
> Actually, the LDB was always meant to parse the 'reg' offsets out of the
> DT, it then went somewhat ... wrong ... and we ended up with hard-coded
> reg<->compatible mapping. It was never intended to be that way. That is
> all there is to it, there isn't any deeper reason behind it.
>
> What would you add into the commit message ?

The above paragraph is a good draft of what I woudl add.

>> [0] https://lore.kernel.org/dri-devel/20251103-dcif-upstreaming-v6-3-76f=
cecfda919@oss.nxp.com/
>>
>>> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *p=
dev)
>>>   	fsl_ldb->dev =3D &pdev->dev;
>>>   	fsl_ldb->bridge.of_node =3D dev->of_node;
>>>
>>> +	/* No "reg-names" property likely means single-register LDB */
>>
>> Uh? If it is "likely" it means we are not sure this code is not introduc=
ing
>> regressions, and that would be bad.
>
> I can drop the 'likely' part.

If you are sure it's not "likely" but "sure", then OK. However it all
depends on the bindings, which leads to the below question.

>>> +	idx =3D of_property_match_string(dev->of_node, "reg-names", "ldb");
>>> +	if (idx < 0) {
>>> +		fsl_ldb->single_ctrl_reg =3D true;
>>> +		idx =3D 0;
>>> +	}
>>
>>  From the bindings I understand that having two 'reg' values and no
>> 'reg-names' at all is legal. Your patch implies differently. Who's right
>> here?
> I think if you have two two reg values, you should have reg-names , so
> the binding should be updated ?

If the bindings are unclear or ambiguous (or wrong) then they should be
fixed in the first place. With bad bindings we can either have a bad but
compliant implementation or a good but non-compliant implementation.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
