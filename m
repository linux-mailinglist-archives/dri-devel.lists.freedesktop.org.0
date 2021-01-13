Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E892F5D8F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161766E175;
	Thu, 14 Jan 2021 09:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd15177.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by gabe.freedesktop.org (Postfix) with ESMTP id 06A556E46B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 10:48:50 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.213.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id zdhhkq3XHiSGyzdhjktF2U; Wed, 13 Jan 2021 11:48:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1610534929; bh=A0c7v5QF0kGnUG1xFhye+7y0Ji9UZ3lTSdIODU4p75Y=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=TsUGOj5TI5ANqq/CKrGkMw7tQy9vEnMVZpLMDV5u22zUYvbo/BSzjJNywlFgrg08a
 wHW8b5Zyjphql1bKaXC6t3PhAUF47LVhX8+mpmBBAAJVMMGBeSDluzkMQYtS6QLAOr
 Fjwog3UuJPodL+RWIllas6526qDTu50NbAPbwRvlwY28eJ8qeoRPBBbCgyRtvO71vh
 deDnM7syphT2ojLCiCu5+jIh7e67UJWfd2KATSXMQq7cOd4NScXyCtuyND+7U1Jx8A
 mnhKon9HP80or26SC+SD1L1gBV3VXvSEyzFwY7gofDOTf7ReypOz8UBRusIpn/a4r/
 HtSyo/UTXrzgg==
Subject: Re: [PATCH v3] drm/sun4i: tcon: fix inverted DCLK polarity
To: Maxime Ripard <maxime@cerno.tech>
References: <20210111172052.7v522xam74xkq6se@gilmour>
 <20210111174616.904674-1-giulio.benetti@benettiengineering.com>
 <20210113094214.5ijq3inmffticym6@gilmour>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <f74a69d0-079b-69a2-98fc-65aabc69daef@benettiengineering.com>
Date: Wed, 13 Jan 2021 11:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113094214.5ijq3inmffticym6@gilmour>
Content-Language: en-US
X-CMAE-Envelope: MS4wfHvWPh5pLOS3KfYu6MtfyvhEvIzfKXG6+TpmxOAcuM5RBEEiAvPgXV0bT4EIMPqrktqnbIcaBPUynjGHTCNM1rLhbOXO9d6p90gUYDXCjRED54d5tW9r
 aYOP3EVO77HSI3wim2LlCXRYZOeDXaDR/0swdv8Z4VdfNfQwsywDYEWXhfAsgwtr2h6VEEt2FezQo3QOy2OkFiTCdB3tPf5vOcmFHY0Qo/6l6RZDdxLYHat0
 bddRrSYCM/K6oyfWNRZI9sHDD8jSXKvup5GnMIknuEujIWLwk8BY8fqKQtV/TSu/fYe+bF8rN4G0oxHdKTOAX8esLmdq97s/8Bzglwt3q1qOUTjtmFDrUPQ2
 0kuCLobKHncDtmOAimCoQYkTL16VfAqXUuRqSHYDiPmOJU6AVmUEXIYsAnxBBLcYZ4z/vwvOr1c+PNyZ4VhApFZTi9zKc6Amixx3TD/TgfHFoOF87jjC8tdk
 YvTV7LrRT8XzT2BeFUgb7VwHYyJAPgUrJkDauKSUzB2DX9huoekpjJrECpRBMEobQ3bFfmlBRmessApxAuvWFmAzZc8ZjjhPHMpBPg==
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:32 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/21 10:42 AM, Maxime Ripard wrote:
> Hi,
> =

> On Mon, Jan 11, 2021 at 06:46:16PM +0100, Giulio Benetti wrote:
>> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>
>> During commit 88bc4178568b ("drm: Use new
>> DRM_BUS_FLAG_*_(DRIVE|SAMPLE)_(POS|NEG)EDGE flags") DRM_BUS_FLAG_*
>> macros have been changed to avoid ambiguity but just because of this
>> ambiguity previous DRM_BUS_FLAG_PIXDATA_(POS/NEG)EDGE were used meaning
>> _SAMPLE_ not _DRIVE_. This leads to DLCK inversion and need to fix but
>> instead of swapping phase values, let's adopt an easier approach Maxime
>> suggested:
>> It turned out that bit 26 of SUN4I_TCON0_IO_POL_REG is dedicated to
>> invert DCLK polarity and this makes things really easier than before. So
>> let's handle DCLK polarity by adding SUN4I_TCON0_IO_POL_DCLK_POSITIVE as
>> bit 26 and activating according to bus_flags the same way it is done for
>> all the other signals polarity.
>>
>> Fixes: 88bc4178568b ("drm: Use new DRM_BUS_FLAG_*_(DRIVE|SAMPLE)_(POS|NE=
G)EDGE flags")
>> Suggested-by: Maxime Ripard <maxime@cerno.tech>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   drivers/gpu/drm/sun4i/sun4i_tcon.c | 20 +-------------------
>>   drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
>>   2 files changed, 2 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/=
sun4i_tcon.c
>> index eaaf5d70e352..30171ccd87e5 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> @@ -569,26 +569,8 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_t=
con *tcon,
>>   	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
>>   		val |=3D SUN4I_TCON0_IO_POL_DE_NEGATIVE;
>>   =

>> -	/*
>> -	 * On A20 and similar SoCs, the only way to achieve Positive Edge
>> -	 * (Rising Edge), is setting dclk clock phase to 2/3(240=B0).
>> -	 * By default TCON works in Negative Edge(Falling Edge),
>> -	 * this is why phase is set to 0 in that case.
>> -	 * Unfortunately there's no way to logically invert dclk through
>> -	 * IO_POL register.
>> -	 * The only acceptable way to work, triple checked with scope,
>> -	 * is using clock phase set to 0=B0 for Negative Edge and set to 240=
=B0
>> -	 * for Positive Edge.
>> -	 * On A33 and similar SoCs there would be a 90=B0 phase option,
>> -	 * but it divides also dclk by 2.
>> -	 * Following code is a way to avoid quirks all around TCON
>> -	 * and DOTCLOCK drivers.
>> -	 */
>>   	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
>> -		clk_set_phase(tcon->dclk, 240);
>> -
>> -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>> -		clk_set_phase(tcon->dclk, 0);
>> +		val |=3D SUN4I_TCON0_IO_POL_DCLK_POSITIVE;
>>   =

>>   	regmap_update_bits(tcon->regs, SUN4I_TCON0_IO_POL_REG,
>>   			   SUN4I_TCON0_IO_POL_HSYNC_POSITIVE |
> =

> You need to add SUN4I_TCON0_IO_POL_DCLK_POSITIVE to the mask you're
> going to change here too

Ah, lost it during squash, I send a v4.

Thank you
Best regards
-- =

Giulio Benetti
Benetti Engineering sas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
