Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E5885601
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 09:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659DE10E370;
	Thu, 21 Mar 2024 08:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="GUm0AwRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B642710E03D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=k47p/mv2Nny8rLL23fZP28IM8cxC8c/zBHnuYWhK1GA=; 
 b=GUm0AwRvGY1vai6wrCmLN6xb21Mt6ldroFnKHgJ2ZLnCwE+Uaf6iGJV+5diTA9aYnckNcQ8nuFg
 euZXCQXxuBPnblBh6l8yqhY10tebrIGavsmoLH6dCvfUXDgT4CfbNNXi1X+r7wxjV29n5QLYtv2r+
 Ug7uEjrXcNTn6DV4oY6rUJD534vNoMmJYz7EIe47lVO+K+NLG8ZCr1y8Vdn3AINKm95lQ/H6qZknK
 SoxP2wTIpY76MWG/zBlbtrO1HwCgRPcPj/w6RFoGNrfPVLbEYj0ThODkc2n1abXOWUK9q6QMjTI81
 g3XmWn5JecCUwUEtmJ1L9Xv5S43aMFaW1X6Q==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1rnE5C-000NxO-At; Thu, 21 Mar 2024 09:47:30 +0100
Received: from [185.17.218.86] (helo=smtpclient.apple)
 by sslproxy03.your-server.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sean@geanix.com>) id 1rnE5B-000GHH-1c;
 Thu, 21 Mar 2024 09:47:29 +0100
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: STM32 DSI controller driver: mode_valid clock tolerance
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20240320-berserk-soft-crab-70d22c@houat>
Date: Thu, 21 Mar 2024 09:47:18 +0100
Cc: yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2A220F57-5DD2-4F28-9328-547A04185D3F@geanix.com>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
 <20240320-berserk-soft-crab-70d22c@houat>
To: Maxime Ripard <mripard@redhat.com>
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

Hi Maxime,

> On 20 Mar 2024, at 14.23, Maxime Ripard <mripard@redhat.com> wrote:
>=20
> Hi Sean,
>=20
> On Fri, Mar 08, 2024 at 09:35:27AM +0100, Sean Nyekjaer wrote:
>> I=E2=80=99m using a stm32mp157 with a sn65dsi83 DSI2LVDS bridge. The =
LVDS
>> display is having a minimum clock of 25.2 MHz, typical of 27,2 MHz =
and
>> a max of 30,5 MHz.
>>=20
>> I will fail the mode_valid check with MODE_CLOCK_RANGE. It will
>> request 27200000 Hz, but is getting 27250000. Guess the display is
>> fine with this :)
>>=20
>> In this case it seems a bit harsh to fail if the output clock isn=E2=80=
=99t
>> within 50 Hz of the requested clock.
>=20
> Even for HDMI, the tolerance is usually .5% of the pixel clock. 50Hz
> seems overly restrictive.

Ok

>=20
>> If HDMI is requiring a tolerance of 50 Hz, would it be better to do
>> the check in the HDMI bridge driver?
>=20
> Judging from the code, it would be hard to do because the clock that
> generates the pixel clock isn't exposed to the HDMI bridge.

What do you think about Raphael=E2=80=99s proposal to add the tolerance =
as a device tree option?

>=20
> Maxime

/Sean=
