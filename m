Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EEBCAFA31
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 11:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CC910E1C7;
	Tue,  9 Dec 2025 10:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PdxH7s/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C4B10E4F5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 10:30:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C9F4E1A206C;
 Tue,  9 Dec 2025 10:29:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9CA5E606E2;
 Tue,  9 Dec 2025 10:29:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9FE5E11930433; Tue,  9 Dec 2025 11:29:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765276198; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OfRulPgcDEOay4e5NW0RU0I2tAt3KSplEt8MJ/AIZAA=;
 b=PdxH7s/ZhJdHskB7asgrT0uirBRkmVSnH78UBu22ae/MlVaXSHShId23usgdMZkPuygi3F
 pARsmGEA5ZobWuRBPaQVFrcMwKLHYb+m1R6R1G2XC/HIZABjnrltEl4k2JgaT1UDmRnhJa
 fY8XCxppZJYdz71dXkG1u/YGiFC5zsLFZCMxXvLbd9P0aaWi6DeF7IGB9ZfaQBTclDBQiD
 K8R+e8lsOQND4vL18CzUvf+qZCV+9WsCRatsyNwBQbDxqseHIja3KTX1yDeqGIoddaU3FD
 7GbdFwXRbUcW5lfHfQSLGc3iMIlCjdC9qT49ZG9VvoZG4rG/tg2h12832wOnBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Dec 2025 11:29:51 +0100
Message-Id: <DETM6MTZRZII.28ERC771SST19@bootlin.com>
Cc: "Emanuele Ghidoli" <ghidoliemanuele@gmail.com>,
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, "Francesco Dolcini"
 <francesco@dolcini.it>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Philippe Schenker" <philippe.schenker@impulsing.ch>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: ignore PLL_UNLOCK errors
X-Mailer: aerc 0.20.1
References: <20251127-drm-ti-sn65dsi83-ignore-pll-unlock-v1-1-8a03fdf562e9@bootlin.com>
 <cd607656-90d3-4821-98ea-4dad48288fc9@gmail.com>
 <DEORF6XCJEOG.3BGTKVL2QFQKN@bootlin.com>
 <20251205-courageous-tortoise-of-abracadabra-2efeee@houat>
In-Reply-To: <20251205-courageous-tortoise-of-abracadabra-2efeee@houat>
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

Hello,

On Fri Dec 5, 2025 at 10:07 AM CET, Maxime Ripard wrote:
> On Wed, Dec 03, 2025 at 06:32:47PM +0100, Luca Ceresoli wrote:
>> On Tue Dec 2, 2025 at 12:19 PM CET, Emanuele Ghidoli wrote:
>> >
>> >
>> > On 27/11/2025 09:42, Luca Ceresoli wrote:
>> >> On hardware based on Toradex Verdin AM62 the recovery mechanism added=
 by
>> >> commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery
>> >> mechanism") has been reported [0] to make the display turn on and off=
 and
>> >> and the kernel logging "Unexpected link status 0x01".
>> >>
>> >> According to the report, the error recovery mechanism is triggered by=
 the
>> >> PLL_UNLOCK error going active. Analysis suggested the board is unable=
 to
>> >> provide the correct DSI clock neede by the SN65DSI84, to which the TI
>> >> SN65DSI84 reacts by raising the PLL_UNLOCK, while the display still w=
orks
>> >> apparently without issues.
>> >>
>> >> On other hardware, where all the clocks are within the components
>> >> specifications, the PLL_UNLOCK bit does not trigger while the display=
 is in
>> >> normal use. It can trigger for e.g. electromagnetic interference, whi=
ch is
>> >> a transient event and exactly the reason why the error recovery mecha=
nism
>> >> has been implemented.
>> >>
>> >> Idelly the PLL_UNLOCK bit could be ignored when working out of
>> >> specification, but this requires to detect in software whether it tri=
ggers
>> >> because the device is working out of specification but visually corre=
ctly
>> >> for the user or for good reasons (e.g. EMI, or even because working o=
ut of
>> >> specifications but compromising the visual output).
>> >>
>> >> The ongoing analysis as of this writing [1][2] has not yet found a wa=
y for
>> >> the driver to discriminate among the two cases. So as a temporary mea=
sure
>> >> mask the PLL_UNLOCK error bit unconditionally.
>> >>
>> >> [0] https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6lt=
cwexnrsjsdx@mgkdf6ztow42
>> >> [1] https://lore.kernel.org/all/b71e941c-fc8a-4ac1-9407-0fe7df73b412@=
gmail.com/
>> >> [2] https://lore.kernel.org/all/20251125103900.31750-1-francesco@dolc=
ini.it/
>> >>
>> >> Closes: https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6=
s6ltcwexnrsjsdx@mgkdf6ztow42
>> >> Cc: stable@vger.kernel.org # 6.15+
>> >> Co-developed-by: Herv=C3=A9 Codina <herve.codina@bootlin.com>
>> >> Signed-off-by: Herv=C3=A9 Codina <herve.codina@bootlin.com>
>> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> >> ---
>> >> Francesco, Emanuele, Jo=C3=A3o: can you please apply this patch and r=
eport
>> >> whether the display on the affected boards gets back to working as be=
fore?
>> >>
>> >> Cc: Jo=C3=A3o Paulo Gon=C3=A7alves <jpaulo.silvagoncalves@gmail.com>
>> >> Cc: Francesco Dolcini <francesco@dolcini.it>
>> >> Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
>> >> ---
>> >>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 11 +++++++++--
>> >>  1 file changed, 9 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/=
bridge/ti-sn65dsi83.c
>> >> index 033c44326552..fffb47b62f43 100644
>> >> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> >> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> >> @@ -429,7 +429,14 @@ static void sn65dsi83_handle_errors(struct sn65d=
si83 *ctx)
>> >>  	 */
>> >>
>> >>  	ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
>> >> -	if (ret || irq_stat) {
>> >> +
>> >> +	/*
>> >> +	 * Some hardware (Toradex Verdin AM62) is known to report the
>> >> +	 * PLL_UNLOCK error interrupt while working without visible
>> >> +	 * problems. In lack of a reliable way to discriminate such cases
>> >> +	 * from user-visible PLL_UNLOCK cases, ignore that bit entirely.
>> >> +	 */
>> >> +	if (ret || irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK) {
>> >>  		/*
>> >>  		 * IRQ acknowledged is not always possible (the bridge can be in
>> >>  		 * a state where it doesn't answer anymore). To prevent an
>> >> @@ -654,7 +661,7 @@ static void sn65dsi83_atomic_enable(struct drm_br=
idge *bridge,
>> >>  	if (ctx->irq) {
>> >>  		/* Enable irq to detect errors */
>> >>  		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
>> >> -		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff);
>> >> +		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff & ~REG_IRQ_EN_CHA_PLL_U=
NLOCK_EN);
>> >>  	} else {
>> >>  		/* Use the polling task */
>> >>  		sn65dsi83_monitor_start(ctx);
>> >>
>> >> ---
>> >> base-commit: c884ee70b15a8d63184d7c1e02eba99676a6fcf7
>> >> change-id: 20251126-drm-ti-sn65dsi83-ignore-pll-unlock-4a28aa29eb5c
>> >>
>> >> Best regards,
>>
>> Thanks for testing!
>>
>> We'll still need a R-by from a maintainer, after that this patch can be =
applied.
>>
>> > I would suggest a couple of tags, thanks.
>> > Emanuele
>> >
>> > Fixes: ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery me=
chanism")
>>
>> I'm not sure about this one. There is no known bug in that commit, right=
?
>> It's rather exposing a pre-existing issue. I thought about adding it for
>> stable branches pickup, but the 'Cc: stable...v6.15+' line is for that.
>
> Sigh. We had that discussion already. Wouldn't you consider "the display
> doesn't work" a bug on any platform? A real world device wasn't behaving
> the way the driver expected it to be. The root cause of it doesn't
> really matter: it was a bug.
>
> And whether it's technically correct or not isn't relevant: we only care
> about what actually happens, not what the datasheet is saying.
>>
>> So apart from blaming someone I don't see much point.
>>
>> That said, if there is a valid reason I'm not seeing for the Fixes: line=
,
>> I'll be OK in adding it while applying.
>
> It's not about blaming someone, it's about tracking that there was a
> regression, and it got fixed. Who's to blame is not relevant either, and
> I don't think anyone blamed anyone in that thread.
>
> Anyway, patch applied.

I'm glad we agree about the code and this patch got applied. Thanks! I
think it is the least invasive solution in the short term.

Now, looking at the long term, it's time to find out how to support both
Toradex hardware and the full error recovery on boards where PLL_UNLOCK
behaves as expected (it triggers only in visual error cases).

Emanuele, Francesco, did you gather more information on the issue? Such as
which clock combinations trigger the PLL_UNLOCK with a visually working
panel?

Also, can you report how the PLL_UNLOCK bit behaves over time on your
hardware? It stays asserted all the time, it goes on and off regularly,
irregularly, it disapperas after some time...?

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
