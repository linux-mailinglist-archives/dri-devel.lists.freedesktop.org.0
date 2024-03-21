Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187E885612
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 09:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C775410E3A7;
	Thu, 21 Mar 2024 08:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="Miyzv5ru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6492110E3A7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=baXGPugzpNhp5EWukSQW5hfM6IxZYyCnn6Z0nPisxm8=; 
 b=Miyzv5ruHAoxiUcwZ87t6mGmhcgWjZCHSLrAGf+D41PCzcjD8F/AVuIIe+5VtMOf/rfadsU/UQy
 4vmwlq+TtLiG5Kb9hu+6g0sBZ2VMGlqnSKeowrws/N0nmROt7bDVCHK3SvNN/ahFkvS9w9oIUePxM
 9kicmFLMm+7NC6h0BnIoH59HQ6Rr8pIWNCRgbmGcq3KKeMWktbgtKvDTrf3ciRYdI0X302Lja0b8x
 sH8ycjfwC3zxIeg1qiHubsmjRJ7iLfp7/pQVS8g4X5/gFStqIrP09IhqnCaNCuHv5qAc9Ww8slVoR
 i/8zdeA2Z1wsHmFzLoJkozM1M1BcvOCEPK7A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1rnE9Y-000OaP-HA; Thu, 21 Mar 2024 09:52:00 +0100
Received: from [185.17.218.86] (helo=smtpclient.apple)
 by sslproxy03.your-server.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sean@geanix.com>) id 1rnE9X-000NyH-2X;
 Thu, 21 Mar 2024 09:51:59 +0100
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: STM32 DSI controller driver: mode_valid clock tolerance
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <99dad358-0ca8-4f19-9d0c-e41c095db8c7@foss.st.com>
Date: Thu, 21 Mar 2024 09:51:58 +0100
Cc: yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Antonio Maria BORNEO - foss <antonio.borneo@foss.st.com>,
 =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E4D73AB8-C245-4931-9E18-BCA7219EA8CE@geanix.com>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
 <99dad358-0ca8-4f19-9d0c-e41c095db8c7@foss.st.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27220/Wed Mar 20 09:25:13 2024)
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

Hi Raphael,

> On 20 Mar 2024, at 15.14, Raphael Gallais-Pou =
<raphael.gallais-pou@foss.st.com> wrote:
>=20
>=20
> On 3/8/24 09:35, Sean Nyekjaer wrote:
>> Hi,
>=20
>=20
> Hi Sean,
>=20
>=20
> Sorry for not responding earlier.

NP :)

>=20
> I've also added Antonio Borneo, which is the author of the =
implementation of the
> mode_valid() hook.
>=20
>> I=E2=80=99m using a stm32mp157 with a sn65dsi83 DSI2LVDS bridge.
>> The LVDS display is having a minimum clock of 25.2 MHz, typical of =
27,2 MHz and a max of 30,5 MHz.
>>=20
>> I will fail the mode_valid check with MODE_CLOCK_RANGE.
>> It will request 27200000 Hz, but is getting 27250000. Guess the =
display is fine with this :)
>>=20
>> In this case it seems a bit harsh to fail if the output clock isn=E2=80=
=99t within 50 Hz of the requested clock.
>>=20
>> If HDMI is requiring a tolerance of 50 Hz, would it be better to do =
the check in the HDMI bridge driver?
>=20
> At the time when the driver was implemented, a large set of TVs/HDMI =
panels were
> tested, and it was the 'optimal' parameter found, even if the value is =
quite
> restrictive.

Ok, let=E2=80=99s keep til 50Hz tolerance as a default.

>=20
> As Maxime said earlier, it was also easier to implement this tolerance =
directly
> within the DSI driver, since only the display-controller and the =
driver itself
> have access to this clock.
>=20
>=20
> Eventually a device-tree parameter could be implemented, with default =
value to
> 50Hz, so that fine tuning can be done using other bridges.

It doesn=E2=80=99t look that difficult to add the tolerance as a device =
tree option.
Naming is always quite hard, could the name be st,clock_tolerance =3D =
<50>; ?

I can=E2=80=99t find other drivers that have this tolerance option nor =
have a device tree option.

/Sean
