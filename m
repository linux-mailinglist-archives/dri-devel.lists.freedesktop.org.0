Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06DB3C924A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 22:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E20A6E4D2;
	Wed, 14 Jul 2021 20:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8A36E4D2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 20:40:57 +0000 (UTC)
Date: Wed, 14 Jul 2021 21:40:46 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Innolux EJ030NA
To: Rob Herring <robh@kernel.org>
Message-Id: <YF59WQ.VTZ17PPSJ9I02@crapouillou.net>
In-Reply-To: <20210714203013.GA3287208@robh.at.kernel.org>
References: <20210625121045.81711-1-paul@crapouillou.net>
 <YOk60yTP9L1gT3+W@ravnborg.org> <HBW0WQ.NHPOJDIT9XWR1@crapouillou.net>
 <YOlvev0nvXVYU01y@ravnborg.org> <K4Y0WQ.MLS1MDCVFJWL3@crapouillou.net>
 <20210714203013.GA3287208@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Christophe Branchereau <cbranchereau@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Le mer., juil. 14 2021 at 14:30:13 -0600, Rob Herring <robh@kernel.org>=20
a =E9crit :
> On Sat, Jul 10, 2021 at 11:21:56AM +0100, Paul Cercueil wrote:
>>=20
>>  [...]
>>=20
>>  > >  I am not sure; the doc states that this (additionalProperties:
>>  > > false) "can't
>>  > >  be used in case where another schema is referenced", which is=20
>> the
>>  > > case here,
>>  > >  as we include "panel-common.yaml".
>>  >
>>  > This DT schema already list all relevant properties like:
>>  >
>>  > 	backlight: true
>>  >
>>  > So "additionalProperties: false" tells that no other properties=20
>> are
>>  > allowed other than the listed properties.
>>  >
>>  > To my best understanding unevaluatedProperties: false is less=20
>> strict and
>>  > should be used if one does not list all possilbe properties.
>=20
> Right. There's some value of listing which common properties you are
> using as well.
>=20
>>  > This could be the case for a panel haging below a SPI controller=20
>> as in
>>  > this case. So in other words giving this some extra thought I=20
>> think
>>  > unevaluatedProperties: false is OK here.
>>=20
>>  A panel below a SPI controller would have all its SPI-specific=20
>> properties
>>  covered by spi-controller.yaml, I believe? So maybe=20
>> "additionalProperties:
>>  false" would work?
>=20
> No. Because spi-controller.yaml is evaluated on the SPI host node and
> this one is evaluated on the SPI slave. There's some work to address
> this, but it means every SPI slave will have to reference a SPI device
> schema. The bigger issue here is SPI controller specific device
> properties. So for this case, we'll have to use unevaluatedProperties.

Thank you for the clarification.

Cheers,
-Paul


>>=20
>>  In any case, if I use "additionalProperties: false", "make=20
>> dt_binding_check"
>>  complains that my example's "spi-max-frequency" property is not=20
>> covered. So
>>  maybe you are right.
>>=20
>>  > So my r-b is ok if you keep it as it.
>>  >
>>  > PS. Where do you guys hang out with the downfall of freenode -=20
>> somewhere
>>  > on oftc?
>>=20
>>  We moved to #opendingux on Libera.
>>=20
>>  Cheers,
>>  -Paul
>>=20
>>=20
>>=20


