Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E0B5013B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D23410E7A4;
	Tue,  9 Sep 2025 15:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="rHRRoMKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 41356 seconds by postgrey-1.36 at gabe;
 Mon, 08 Sep 2025 10:47:35 UTC
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FE110E1FC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 10:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757328453; x=1757587653;
 bh=GRAURU3Mqaf7KaktvQ1n9Gicg1JGR9+tA9y0iqtZSrw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=rHRRoMKiSM2IqxK/L4hzKFWIdzT4Omy5CUfdK75ZKOXkMBT44K9qh4djCHzv13vWS
 8y3TlB8Rr+MyqrLJlMv/Prh0+2eBS6smgYdNjK+7xjgCvb9PgeX+81cgPcPEHgp38y
 rajgb0ozlR2a6pNhphhRxkS2n9+6c0vGTHVCu3cZMkvIy3QdsVEb1r45mHFLvXj5ee
 P7vPxuBWlZIoqmaUkg+C6atj89phdhgsB8bW59T7QecoDbVoKN3HXF0m/XaM7dFfTU
 4/J/VZXNHFAgOZUEUFGJjvlbD+XK1cyoavMuQc6FmyNizU6VRx2SLNm/5RJ4DbY3eb
 QBy9qg40q+HcQ==
Date: Mon, 08 Sep 2025 10:47:27 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
Message-ID: <dMbLo1ph9fkRREvsauWvJiPeAWXSJwCHx1dgUC_1xcJvDPjOzydsGiEUipaM_KZqeiwgacNxZbAvSLndg1jo2LnFaKcnFJK72S-NFtjuHOA=@vinarskis.com>
In-Reply-To: <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
 <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
 <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org>
 <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: bdeaa268caab16c72c28850bbc5c56704aa415ad
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 09 Sep 2025 15:29:21 +0000
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






On Monday, September 8th, 2025 at 09:36, Konrad Dybcio <konrad.dybcio@oss.q=
ualcomm.com> wrote:

>=20
>=20
> On 9/8/25 9:33 AM, Hans de Goede wrote:
>=20
> > Hi,
> >=20
> > On 8-Sep-25 09:20, Konrad Dybcio wrote:
> >=20
> > > On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
> > >=20
> > > > A number of existing schemas use 'leds' property to provide
> > > > phandle-array of LED(s) to the consumer. Additionally, with the
> > > > upcoming privacy-led support in device-tree, v4l2 subnode could be =
a
> > > > LED consumer, meaning that all camera sensors should support 'leds'
> > > > and 'led-names' property via common 'video-interface-devices.yaml'.
> > > >=20
> > > > To avoid dublication, commonize 'leds' property from existing schem=
as
> > > > to newly introduced 'led-consumer.yaml'.
> > > >=20
> > > > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > > > ---
> > >=20
> > > [...]
> > >=20
> > > > + leds:
> > > > + minItems: 1
> > > > + maxItems: 1
> > >=20
> > > My brain compiler suggests this will throw a warning (minItems should
> > > be redundant in this case)

No complaints when running `dt_bindings_check` on this nor the camera senso=
r
that uses this binding. I thought it would be better to keep it even though
right now only one LED is supported, so that when `led-names` are extended
with new functions, one can just bump maxItems and not accidentally forget
to introduce minItems. No strong opinion though, perhaps Rob can decide
since he is the one that suggested to add minItems,maxItems that I didn't
think of?

> > >=20
> > > > +
> > > > + led-names:
> > > > + enum:
> > > > + - privacy-led
> > >=20
> > > Nit: "privacy" makes more sense without the suffix, as we inherently
> > > know this is supposed to be an LED
> >=20
> > Note "privacy-led" as name is already used on the x86/ACPI side and
> > the code consuming this will be shared.
> >=20
> > With that said if there is a strong preference for going with just
> > "privacy" the x86 side can be adjusted since the provider-info is
> > generated through a LED lookup table on the x86/ACPI side. So we can
> > just modify both the lookup table generation as well as the already
> > existing led_get(dev, "privacy-led") call to use just "privacy"
> > without problems.
>=20
>=20
> In that case, it may be cleaner to just go with what we have today
> (unless the dt maintainers have stronger opinions)

Sounds good, thanks both for the feedback.

Alex

>=20
> Konrad
