Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19327A21A1B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBB410E751;
	Wed, 29 Jan 2025 09:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ibsOXJKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4975F10E751
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1738143622; x=1738748422; i=markus.elfring@web.de;
 bh=RmUlpFblDQ0X0FrPNxA6WyeicYW3HpJ3EyGlM0jP5z0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ibsOXJKPJKhZo8FqJFepmaYQoSFoyR2qxzl8lohWNNUQx+2NF2ManFbNjUNGq/F2
 gbw8iml79L7rvtKd56Ir7+yYHXrAe1EUIefoTtrBNrmtFI2yM2WYsLj1b568yC1rb
 SKGUWYn0X41jPRogXjuGLSd6Gt6171dGmUJ2Fp3bc0pBO92HArHd48fDFFdCCxzPK
 pf78m0ogusJQNS3QQ3zn1K/mM4iA6yn4B0KggTtABnb9cI7MMqnv247Vl4f+VntcE
 +DVoabadzyBcjKoDGRsAmxtyEkjkG+dxMfHbTqq28F/8W87L00uXvdFhKdqm9Gctj
 xUEgsrypLeLKtXHbAg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MG994-1tgKE62NvY-00Fdf6; Wed, 29
 Jan 2025 10:40:22 +0100
Message-ID: <9ca0337d-e378-4de5-99be-1dfa1d4f8cff@web.de>
Date: Wed, 29 Jan 2025 10:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [01/16] coccinelle: misc: secs_to_jiffies: Patch expressions too
To: Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-xfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 imx@lists.linux.dev, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Carlos Maiolino <cem@kernel.org>,
 Chris Mason <clm@fb.com>, Christoph Hellwig <hch@lst.de>,
 Damien Le Moal <dlemoal@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 David Sterba <dsterba@suse.com>, Dick Kennedy <dick.kennedy@broadcom.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 James Smart <james.smart@broadcom.com>, Jaroslav Kysela <perex@perex.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
 Josef Bacik <josef@toxicpanda.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Dryomov <idryomov@gmail.com>,
 Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
 Keith Busch <kbusch@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, Niklas Cassel <cassel@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Ricardo Ribalda <ribalda@google.com>,
 Sagi Grimberg <sagi@grimberg.me>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>,
 Selvin Xavier <selvin.xavier@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Victor Gambier <victor.gambier@inria.fr>, Xiubo Li <xiubli@redhat.com>,
 Yaron Avizrat <yaron.avizrat@intel.com>
References: <20250128-converge-secs-to-jiffies-part-two-v1-1-9a6ecf0b2308@linux.microsoft.com>
 <565fb1db-3618-4636-8820-1ca77dad07a2@web.de>
 <2402812d-b818-4d1b-9653-767c9cd89dda@linux.microsoft.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2402812d-b818-4d1b-9653-767c9cd89dda@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VVUayMb32w7y67C7tTjgB5AAr0xhckczX0N8TokrIpC9jN6eUE9
 EFsN7wRaBX0tQgtAxOLriEuyy3B/8avbPqaD1zz3GlxmzANwcYY0B13b3+dGcse9e29fR2B
 x1FDILYMT0Hm6Op4dZPmgiuO2ynGivSf8q+hlfpEEa8MIXRg6GY1vfPop11AepKnCCaop1O
 +p76d5j2Efo5XT3k24tTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tcxCLGC+RCc=;ey0yBxZW/tRSJQW6qo2D+Q6kDrW
 B7ti/3QUhXC8WrcBjNzI4u6z+d1rV4adoqTUoUSMt/DqJcKI/DlrivOEoz806s/5+Kn56DDqL
 LU9xtxxU9vsLyCTP7I8gL7dl6Qx1gz/cso735SydkffMPYwAsbCaRqy9WGoFqBlIQ9QCxafc3
 W4RbDo3aQwMCu9VcGvB6j+H5tbohMyIwgg8IKKOqedJ1nboWwMgz4OIZ7EST+13jVvGHzPDUP
 RMgEYGdAiBMWyxIajIWHh0tiMSE3p1A+yPFCKxzA51+Jsl4lqfDwp6i6xfZI0wLLB4pLlY9o9
 4q4fn10BcFNZy38f62U9iuLflyBSQy3IDj2SnmtLJbJzYINTq3rTIPHq21PIW76G8fDbFN0aG
 3ac6gqwYlxfQhltWeUu6Jf+r0y/8ZDSvg6BenYTc1SAFAqZHEM4upcrvZQorHyWClmJeL4R1d
 pwRYkmLBgkDzN9R/bb0jfrgkgXUIzdRpQYEu62HTHwYHvlMnYXeCcivCQRHgqKox7R6hNuIrn
 rxTrTFacoaE+vqTHL959kdf+7baowrszBGfdV4G67c90sFgZ24V7UDmogT/jAdPtbbKWpCJ3F
 kMrOyabr3gWq6SX50hyVFHIUca6hdwNAbHNQqpbFNzCXjeuhFqIkBldPkgoHIWodZqGhWHxbJ
 rh9yga8+A7Xz90bS7If3X8UB0JOiOJoqee5k8VuGqGUor7M8/IYAWxEzk0sfRhZN5x9gzYIwj
 z5v+Opf6qMCYFMEpDc5oZNLzukYChx6b04HyYvuAIbzbqHM64L8pCx9PjiofRQqAAUENSsyVK
 wSLOByWJNd0hj3dnFK4MWKIc72WDX2na+gBRF+CITUiUaTapl8UB+IMJ1+mNkz1dW85FtBpIj
 tD/0moj9gcbkIb1LR6m5OI0uHLkCOXIBTrIfx3IHv6b13SsYXuqGkV/RzTBhQpQUsnir3VJIj
 cVkG88L1qB1XMwvpL5WZaIlaVUahCedhQsFB49sgDWhVH58n5+/Z9aWfVKo9SGwG1/1EYyVhs
 xdj7mKATCRxJL8YFYbK1K5zFB2c5chXeAOrRuI6GfbxLg4Jr5TwIV+gUIoOLkM9oBMdE3PZmY
 FmuKpySVCwL9uRLQ0lYfPXIDXqcQix+7IQpKOnC7/mKJSccV7o1cXqpz0osAScgdxIeUIW7Oo
 TT3dPmTAxqyMA5HLb2IdqDbNqBt78hG7Vp0fBYOvquK98imV2V34SSApTC+PTRD9nO5SEk1WD
 M5c0DPUlZtR3e/lmnDioWB77iUkT5JV0a7FRF40QmlHGvbSs8vfTQg9ZFgjUq8jYaGVb32YjP
 AEhromp4VpaoN9T5CJol8F+orrIemlZIcgjTh9W5NmdUN4pRCbHOUfJ/tbXwdPtCw5lPPfB1R
 5kdsgtTCg2hWVnV9uMjqAZCd/Sr1UngGlxpd0=
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

>> =E2=80=A6
>>> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
>>> @@ -11,12 +11,22 @@
>>>
>>>  virtual patch
>> =E2=80=A6
>>> -@depends on patch@ constant C; @@
>>> +@depends on patch@
>>> +expression E;
>>> +@@
>>>
>>> -- msecs_to_jiffies(C * MSEC_PER_SEC)
>>> -+ secs_to_jiffies(C)
>>> +-msecs_to_jiffies
>>> ++secs_to_jiffies
>>> + (E
>>> +- * \( 1000 \| MSEC_PER_SEC \)
>>> + )
>>
>> 1. I do not see a need to keep an SmPL rule for the handling of constan=
ts
>>    (or literals) after the suggested extension for expressions.
>
> Can you explain why? Would the expression rule also address the cases
> where it's a constant or literal?

Probably, yes.


>> 2. I find it nice that you indicate an attempt to make the shown SmPL c=
ode
>>    a bit more succinct.
>>    Unfortunately, further constraints should be taken better into accou=
nt
>>    for the current handling of isomorphisms (and corresponding SmPL dis=
junctions).
>>    Thus I would find an SmPL rule (like the following) more appropriate=
.
>>
>
> Sorry, I couldn't follow your sentence construction or reasoning here.
> I don't see how my patch is deficient, or different from your suggestion
> below, especially given that it follows your feedback from part 1:
> https://lore.kernel.org/all/9088f9a2-c4ab-4098-a255-25120df5c497@web.de/

I tend also to present possibilities for succinct SmPL code.
Unfortunately, software dependencies can trigger corresponding target conf=
licts.


> Can you point out specifically what SmPL isomorphisms or disjunctions
> are broken with the patch in its current state?

Please take another look at related information sources.
Would you like to achieve any benefits from commutativity (for multiplicat=
ions)?
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/bd08cad3f802229dc629a=
13eefef2018c620e905/standard.iso#L241
https://github.com/coccinelle/coccinelle/blob/cca22217d1b4316224e80a18d0b0=
8dd351234497/standard.iso#L241


Regards,
Markus

