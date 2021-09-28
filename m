Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9579141AC9E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 12:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9338982F;
	Tue, 28 Sep 2021 10:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19119894C1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632823591;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=DyJsQy6DBgEboRxYZDiRbGkfeA7thSMpO532KcupjQE=;
 b=ajexmnBSbqidqvIr0mE4XgsuXEE30n2YlrUmM1vqtlXyOPNQGjfb+Wdkg3y6h4jWol
 lDv7uxlRFc6R3+QYUTrI4q699N+JW1mkJff3BRqR5sJJ/UmCD9E7paGxkN4CxxWhHmwv
 DzbMaVIlKSTMvzneDXhyA9c0rXkAeKGnBymrzDA56P4RPdUGtNvmJyV//QPb9bqo6FK6
 tVBDeLmHHa+NnCGujT5JQDhuGTAPDF6MizjsF4EyLOJ9PMnpNNWJUxndKtJJdHWGhiXj
 jtghRe/AFwjZMcUKOky1d6Igdldt6RlgmAHYZfio6Drz0QaQUX8xk7a7CgELkEuTIuhZ
 dRHQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43sT7Q="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8SA6TdXv
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 28 Sep 2021 12:06:29 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 10/10] drm/ingenic: add some jz4780 specific features
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <AE250R.2UXAKOURL8O52@crapouillou.net>
Date: Tue, 28 Sep 2021 12:06:28 +0200
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E40D4D33-536F-4218-BEDD-C64539F15D40@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <8cbfba68ce45e10106eb322d622cb7ac64c0e4d4.1632761068.git.hns@goldelico.com>
 <AE250R.2UXAKOURL8O52@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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

Hi Paul,

> Am 28.09.2021 um 11:58 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi,
>=20
> Le lun., sept. 27 2021 at 18:44:28 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>> The jz4780 has some features which need initialization
>> according to the vendor kernel.
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 39 =
+++++++++++++++++++++++
>> 1 file changed, 39 insertions(+)
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =
b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index e2df4b085905..605549b316b5 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -66,6 +66,10 @@ struct jz_soc_info {
>> 	bool needs_dev_clk;
>> 	bool has_osd;
>> 	bool map_noncoherent;
>> +	bool has_alpha;
>> +	bool has_pcfg;
>> +	bool has_recover;
>> +	bool has_rgbc;
>> 	bool use_extended_hwdesc;
>> 	unsigned int max_width, max_height;
>> 	const u32 *formats_f0, *formats_f1;
>> @@ -732,6 +736,9 @@ static void =
ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>> 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>> 	}
>> +	if (priv->soc_info->has_recover)
>> +		cfg |=3D JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN;
>=20
> Did you actually test this? I know that in theory it sounds like =
something we'd want, but unless there is a proven use for it, it's =
better to keep it disabled.
>=20
>> +
>> 	/* set use of the 8-word descriptor and OSD foreground usage. */
>> 	if (priv->soc_info->use_extended_hwdesc)
>> 		cfg |=3D JZ_LCD_CFG_DESCRIPTOR_8;
>> @@ -1321,6 +1328,25 @@ static int ingenic_drm_bind(struct device =
*dev, bool has_components)
>> 	if (soc_info->has_osd)
>> 		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>> +	if (soc_info->has_alpha)
>> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_ALPHAEN);
>=20
> I remember you saying that OSD mode was not yet working on the JZ4780. =
So I can't see how you could have tested this.

Basically this is all stuff from the vendor kernel under the assumption =
that they know better than everyone of us.
On the other hand this whole patch is sort of optional and we know that =
the basic milestone to get HDMI working
is reached without it. So if you prefer we can drop it for the moment in =
v5 and leave it for further analysis later.

>=20
>> +
>> +	/* Magic values from the vendor kernel for the priority =
thresholds. */
>> +	if (soc_info->has_pcfg)
>> +		regmap_write(priv->map, JZ_REG_LCD_PCFG,
>> +			     JZ_LCD_PCFG_PRI_MODE |
>> +			     JZ_LCD_PCFG_HP_BST_16 |
>> +			     (511 << JZ_LCD_PCFG_THRESHOLD2_OFFSET) |
>> +			     (400 << JZ_LCD_PCFG_THRESHOLD1_OFFSET) |
>> +			     (256 << JZ_LCD_PCFG_THRESHOLD0_OFFSET));
>=20
> Unless you add a big comment that explains what these values do and =
why we do want them, I don't want magic values in here. The fact that =
the kernel vendor sets this doesn't mean it's needed and/or wanted.

Well, who has a contact within Ingenic?

>=20
>> +
>> +	/* RGB output control may be superfluous. */
>> +	if (soc_info->has_rgbc)
>> +		regmap_write(priv->map, JZ_REG_LCD_RGBC,
>> +			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
>> +			     JZ_LCD_RGBC_ODD_RGB |
>> +			     JZ_LCD_RGBC_EVEN_RGB);
>=20
> ingenic-drm only supports RGB output right now, so I guess the =
RGB_FORMAT_ENABLE bit needs to be set in patch [2/10], otherwise patch =
[2/10] cannot state that it adds support for the JZ4780, if it doesn't =
actually work.
>=20
> The other two bits can be dropped, they are already set in =
ingenic_drm_encoder_atomic_mode_set().

Ok.

>=20
>> +
>> 	mutex_init(&priv->clk_mutex);
>> 	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixclk;
>> @@ -1484,6 +1510,9 @@ static const struct jz_soc_info jz4740_soc_info =
=3D {
>> 	.needs_dev_clk =3D true,
>> 	.has_osd =3D false,
>> 	.map_noncoherent =3D false,
>> +	.has_pcfg =3D false,
>> +	.has_recover =3D false,
>> +	.has_rgbc =3D false,
>> 	.max_width =3D 800,
>> 	.max_height =3D 600,
>> 	.formats_f1 =3D jz4740_formats,
>> @@ -1496,6 +1525,9 @@ static const struct jz_soc_info =
jz4725b_soc_info =3D {
>> 	.needs_dev_clk =3D false,
>> 	.has_osd =3D true,
>> 	.map_noncoherent =3D false,
>> +	.has_pcfg =3D false,
>> +	.has_recover =3D false,
>> +	.has_rgbc =3D false,
>=20
> This is wrong, the JZ4725B and JZ4770 SoCs both have the RGBC register =
and the RECOVER bit.

Ok, good to know! Will change.

BR and thanks,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>> 	.max_width =3D 800,
>> 	.max_height =3D 600,
>> 	.formats_f1 =3D jz4725b_formats_f1,
>> @@ -1509,6 +1541,9 @@ static const struct jz_soc_info jz4770_soc_info =
=3D {
>> 	.needs_dev_clk =3D false,
>> 	.has_osd =3D true,
>> 	.map_noncoherent =3D true,
>> +	.has_pcfg =3D false,
>> +	.has_recover =3D false,
>> +	.has_rgbc =3D false,
>> 	.max_width =3D 1280,
>> 	.max_height =3D 720,
>> 	.formats_f1 =3D jz4770_formats_f1,
>> @@ -1521,6 +1556,10 @@ static const struct jz_soc_info =
jz4770_soc_info =3D {
>> static const struct jz_soc_info jz4780_soc_info =3D {
>> 	.needs_dev_clk =3D true,
>> 	.has_osd =3D true,
>> +	.has_alpha =3D true,
>> +	.has_pcfg =3D true,
>> +	.has_recover =3D true,
>> +	.has_rgbc =3D true,
>> 	.use_extended_hwdesc =3D true,
>> 	.max_width =3D 4096,
>> 	.max_height =3D 2048,
>> --
>> 2.31.1

