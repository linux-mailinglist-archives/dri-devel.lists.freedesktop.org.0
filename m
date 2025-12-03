Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A248CCA07D9
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 18:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040E710E00F;
	Wed,  3 Dec 2025 17:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hquDKHO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A768510E00F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 17:32:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E7CE61A1F0D;
 Wed,  3 Dec 2025 17:32:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B368E60706;
 Wed,  3 Dec 2025 17:32:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E27B119213EE; Wed,  3 Dec 2025 18:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764783174; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=l5N8LMUtN8xuEF/DzRqebJYXJKlpFf/+mVUj6hu5WNA=;
 b=hquDKHO9woxdbW7IaSDl2n7vRqA6PSN6uWGNOrFtN3/rtcT4Ep9S/RDobPX7b+BmseSD8U
 VJYemaoB7t55/5LypTEDb1e+ISuXRwefEbNjkjjNyRsQY01l9cHThfFPCdlWbuUbpYjOeX
 Mx4ozdPzsKQzdImQb/BbUiJC3YPqvIH73CSHkmnLE2eTX6P/X5/aqAfWKoW0ggku38/NFU
 rtAzbhIW6Iyt6jNZsgOeUyiYuesJ7xMqIo2D2cRkWySMC9/1QHDGejbe+qx91Ut9Y68pBt
 iliQT0cpBIFDHW02NreSWRNwKG3nqK6To0fyhAEtPeYxffIi4AFUgedb2GmA+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 18:32:47 +0100
Message-Id: <DEORF6XCJEOG.3BGTKVL2QFQKN@bootlin.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: ignore PLL_UNLOCK errors
Cc: "Philippe Schenker" <philippe.schenker@impulsing.ch>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>
To: "Emanuele Ghidoli" <ghidoliemanuele@gmail.com>,
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, "Francesco Dolcini"
 <francesco@dolcini.it>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251127-drm-ti-sn65dsi83-ignore-pll-unlock-v1-1-8a03fdf562e9@bootlin.com>
 <cd607656-90d3-4821-98ea-4dad48288fc9@gmail.com>
In-Reply-To: <cd607656-90d3-4821-98ea-4dad48288fc9@gmail.com>
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

Hi Emanuele,

On Tue Dec 2, 2025 at 12:19 PM CET, Emanuele Ghidoli wrote:
>
>
> On 27/11/2025 09:42, Luca Ceresoli wrote:
>> On hardware based on Toradex Verdin AM62 the recovery mechanism added by
>> commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery
>> mechanism") has been reported [0] to make the display turn on and off an=
d
>> and the kernel logging "Unexpected link status 0x01".
>>
>> According to the report, the error recovery mechanism is triggered by th=
e
>> PLL_UNLOCK error going active. Analysis suggested the board is unable to
>> provide the correct DSI clock neede by the SN65DSI84, to which the TI
>> SN65DSI84 reacts by raising the PLL_UNLOCK, while the display still work=
s
>> apparently without issues.
>>
>> On other hardware, where all the clocks are within the components
>> specifications, the PLL_UNLOCK bit does not trigger while the display is=
 in
>> normal use. It can trigger for e.g. electromagnetic interference, which =
is
>> a transient event and exactly the reason why the error recovery mechanis=
m
>> has been implemented.
>>
>> Idelly the PLL_UNLOCK bit could be ignored when working out of
>> specification, but this requires to detect in software whether it trigge=
rs
>> because the device is working out of specification but visually correctl=
y
>> for the user or for good reasons (e.g. EMI, or even because working out =
of
>> specifications but compromising the visual output).
>>
>> The ongoing analysis as of this writing [1][2] has not yet found a way f=
or
>> the driver to discriminate among the two cases. So as a temporary measur=
e
>> mask the PLL_UNLOCK error bit unconditionally.
>>
>> [0] https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwe=
xnrsjsdx@mgkdf6ztow42
>> [1] https://lore.kernel.org/all/b71e941c-fc8a-4ac1-9407-0fe7df73b412@gma=
il.com/
>> [2] https://lore.kernel.org/all/20251125103900.31750-1-francesco@dolcini=
.it/
>>
>> Closes: https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6l=
tcwexnrsjsdx@mgkdf6ztow42
>> Cc: stable@vger.kernel.org # 6.15+
>> Co-developed-by: Herv=C3=A9 Codina <herve.codina@bootlin.com>
>> Signed-off-by: Herv=C3=A9 Codina <herve.codina@bootlin.com>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>> Francesco, Emanuele, Jo=C3=A3o: can you please apply this patch and repo=
rt
>> whether the display on the affected boards gets back to working as befor=
e?
>>
>> Cc: Jo=C3=A3o Paulo Gon=C3=A7alves <jpaulo.silvagoncalves@gmail.com>
>> Cc: Francesco Dolcini <francesco@dolcini.it>
>> Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bri=
dge/ti-sn65dsi83.c
>> index 033c44326552..fffb47b62f43 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> @@ -429,7 +429,14 @@ static void sn65dsi83_handle_errors(struct sn65dsi8=
3 *ctx)
>>  	 */
>>
>>  	ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
>> -	if (ret || irq_stat) {
>> +
>> +	/*
>> +	 * Some hardware (Toradex Verdin AM62) is known to report the
>> +	 * PLL_UNLOCK error interrupt while working without visible
>> +	 * problems. In lack of a reliable way to discriminate such cases
>> +	 * from user-visible PLL_UNLOCK cases, ignore that bit entirely.
>> +	 */
>> +	if (ret || irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK) {
>>  		/*
>>  		 * IRQ acknowledged is not always possible (the bridge can be in
>>  		 * a state where it doesn't answer anymore). To prevent an
>> @@ -654,7 +661,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridg=
e *bridge,
>>  	if (ctx->irq) {
>>  		/* Enable irq to detect errors */
>>  		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
>> -		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff);
>> +		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff & ~REG_IRQ_EN_CHA_PLL_UNLO=
CK_EN);
>>  	} else {
>>  		/* Use the polling task */
>>  		sn65dsi83_monitor_start(ctx);
>>
>> ---
>> base-commit: c884ee70b15a8d63184d7c1e02eba99676a6fcf7
>> change-id: 20251126-drm-ti-sn65dsi83-ignore-pll-unlock-4a28aa29eb5c
>>
>> Best regards,

Thanks for testing!

We'll still need a R-by from a maintainer, after that this patch can be app=
lied.

> I would suggest a couple of tags, thanks.
> Emanuele
>
> Fixes: ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery mecha=
nism")

I'm not sure about this one. There is no known bug in that commit, right?
It's rather exposing a pre-existing issue. I thought about adding it for
stable branches pickup, but the 'Cc: stable...v6.15+' line is for that.

So apart from blaming someone I don't see much point.

That said, if there is a valid reason I'm not seeing for the Fixes: line,
I'll be OK in adding it while applying.

> Reported-by: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com>

Absolutely! Sorry I forgot to add this.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
