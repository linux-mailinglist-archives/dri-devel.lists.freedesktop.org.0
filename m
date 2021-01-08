Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4C72EFF3E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351146E942;
	Sat,  9 Jan 2021 11:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by gabe.freedesktop.org (Postfix) with ESMTP id E1DA2899D6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 14:46:20 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.198.163])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xt1vkp82vkRIKxt1vklwdv; Fri, 08 Jan 2021 15:46:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1610117179; bh=Blqzmpq0U9r4nhZ7OR6gwQDTJQ/ImDSkV134pTVz6qc=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=cDQdUe6s4DL3/XkPk9D4SPOXiz8w8NqfGthw81S5iZQLiQkZjcEIUDaCYhHtx1ffp
 zJ6Z8x5smnvs+RJI01BtTGkoPi1c1bKRulaoQZ3TLpfKUYO05s6peKMbQo7pHJNKiO
 sszDyTztrQyCVTwtYDFsoQEUkgl7B7HJfuAr2WF85gQQXxnCsBOSFiZgwb3H+ooaEG
 sW7GmJBcBLLJsBe3G1IFjNTsApNJsAuy1VTdiSRb1Be7ql95jRRYbAOqV6L6bUcwlO
 606fSJXuRyPeYJxi3Nv2vKUsYIu/x2k/veV2tyb762UWyFLJ90u1iDJaysLM7hoYoF
 FizaazJT4Sxag==
Subject: Re: [PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity handling
To: Marjan Pascolo <marjan.pascolo@trexom.it>,
 Maxime Ripard <maxime@cerno.tech>
References: <3685133.SLcexNTYsu@kista>
 <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
 <20210107023032.560182-3-giulio.benetti@benettiengineering.com>
 <20210108092355.7p5uakxt7lpdu3bn@gilmour>
 <00f21d15-7a88-2d01-dd48-dc49e9295e34@trexom.it>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <88789919-6f46-55f2-d432-d83c91b6e73f@benettiengineering.com>
Date: Fri, 8 Jan 2021 15:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00f21d15-7a88-2d01-dd48-dc49e9295e34@trexom.it>
Content-Language: en-US
X-CMAE-Envelope: MS4wfBV4oMJnIQTl60tHUg6AE4qjB2SIP43ay9fLYv9Au8MFSwL+mF6ITuJTHTBHfdFjFtn51kij6Zg8f9TFwGSOYrKH7HZPXptgfjO7/zm3g6nvN3L+BSgu
 zT4qzF5eiFQgqUxwfKJIEEi7DdFVonlfDhdhzty6aG2ThYR/UuvkXLsZjXStX9WAkSrcsYwOhpmDVfBPBmsFV9FDsOtCgEBCpzXPLg/D4ob/6AMNpkDRMOAa
 qG+CTHh6/GTPl8Rv5SFlBeXsgfVwnBHVmuKUqkjbdWg9HOUPdHJwqT1+iyd9tz97PEY9B9RqLd9BfVOk7F/FyOcJxZNeIdI2/EY5+gh0ygadHuuNYs3Xe0TN
 6ribpJFVDk037k3SWLrUxP80opIrd7vZM6MN57WwnUzOQsGDL0uZYJZc11CCBxLjRiHmrqDafqGsmSIYqMyUNfNz4L4xtj1NyRbZeyvVdkN1oRwiBMRWoXqI
 hSp13ZFaXOsqsEkfF7f3bChrXj+66muW1dKNa1E6WCLRQwTl3DTvF031o/rzVepQf/jiZ2EiK+toF7MI9Idp4qj0QwGjxBMyRXMxMg==
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
 treding@nvidia.com, Giulio Benetti <giulio.benetti@micronovasrl.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marjan,

On 1/8/21 10:32 AM, Marjan Pascolo wrote:
> Hi,

please don't top post, answer in-line as we do, and please use =

plain-test instead of HTML. These are the standards in Mailing Lists(ML).

> Quote "
> =

> I'm not really sure why we need the first patch of this series here?
> That patch only seem to undo what you did in patch 1
> =

> "

Already answered to Maxime

> =

> And another question (probably could be a stupid one):
> =

> in "/[PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity handling/" I =

> see you deleted:
> =

> -		clk_set_phase(tcon->dclk, 0);
> =

> Is safe to assume that phase register will be always set to 0?

We always assumed it is set to 0 by default.

> =

> Or maybe will be safer manually set it to 0 in every condition to avoid =

> surprises (dirt values due to previous condition)?

That would be a good idea, so something like this:

'''
	int phase =3D 0;

	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
		phase =3D 240;

	clk_set_phase(tcon->dclk, phase);
'''

because now DRM_BUS_FLAG_PIXDATA_SAMPLE_ and DRM_BUS_FLAG_PIXDATA_DRIVE_ =

are exclusive, while before not.

But then if bit 26 solution works everything gets easier.

Best Regards
Giulio

> =

> Marjan
> =

> Il 08/01/2021 10:23, Maxime Ripard ha scritto:
>> Hi,
>>
>> Thanks for those patches
>>
>> On Thu, Jan 07, 2021 at 03:30:32AM +0100, Giulio Benetti wrote:
>>> From: Giulio Benetti<giulio.benetti@micronovasrl.com>
>>>
>>> It turned out(Maxime suggestion) that bit 26 of SUN4I_TCON0_IO_POL_REG =
is
>>> dedicated to invert DCLK polarity and this makes thing really easier th=
an
>>> before. So let's handle DCLK polarity by adding
>>> SUN4I_TCON0_IO_POL_DCLK_POSITIVE as bit 26 and activating according to
>>> bus_flags the same way is done for all the other signals.
>>>
>>> Cc: Maxime Ripard<maxime@cerno.tech>
>> Suggested-by would be nice here :)
>>
>>> Signed-off-by: Giulio Benetti<giulio.benetti@micronovasrl.com>
>>> ---
>>>   drivers/gpu/drm/sun4i/sun4i_tcon.c | 20 +-------------------
>>>   drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
>>>   2 files changed, 2 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
>>> index 52598bb0fb0b..30171ccd87e5 100644
>>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>>> @@ -569,26 +569,8 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_=
tcon *tcon,
>>>   	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
>>>   		val |=3D SUN4I_TCON0_IO_POL_DE_NEGATIVE;
>>>   =

>>> -	/*
>>> -	 * On A20 and similar SoCs, the only way to achieve Positive Edge
>>> -	 * (Rising Edge), is setting dclk clock phase to 2/3(240=B0).
>>> -	 * By default TCON works in Negative Edge(Falling Edge),
>>> -	 * this is why phase is set to 0 in that case.
>>> -	 * Unfortunately there's no way to logically invert dclk through
>>> -	 * IO_POL register.
>>> -	 * The only acceptable way to work, triple checked with scope,
>>> -	 * is using clock phase set to 0=B0 for Negative Edge and set to 240=
=B0
>>> -	 * for Positive Edge.
>>> -	 * On A33 and similar SoCs there would be a 90=B0 phase option,
>>> -	 * but it divides also dclk by 2.
>>> -	 * Following code is a way to avoid quirks all around TCON
>>> -	 * and DOTCLOCK drivers.
>>> -	 */
>>>   	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
>>> -		clk_set_phase(tcon->dclk, 0);
>>> -
>>> -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>>> -		clk_set_phase(tcon->dclk, 240);
>>> +		val |=3D SUN4I_TCON0_IO_POL_DCLK_POSITIVE;
>> I'm not really sure why we need the first patch of this series here?
>> That patch only seem to undo what you did in patch 1
>>
>> Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
