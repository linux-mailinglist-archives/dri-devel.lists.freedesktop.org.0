Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582437238D3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 09:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8389810E02E;
	Tue,  6 Jun 2023 07:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E64710E02E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 07:21:11 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Qb22V4rWtz9svT;
 Tue,  6 Jun 2023 09:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1686036066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPHDHUNWBl9tQhy8uYzq8MbiZONxfHLxis8G686KM9I=;
 b=SDGb+iRm9Hbp+8AQTw7V0kj+x/+atASEN00h79bNbT2IGmBFFwVkhtAvNF54EM3KqYtsDQ
 UNdVqvSx2peQqNQspQLRkiOVfw8RrMt6jhiPmVCCzsdIPdeL8GKXZOD/y49XFNIFBWYVLe
 RaquM+CzCdZdqH5PXPkHC3iZ5dLamYFNds9DkdyB+Oc6s6+H2vlNQwGVY94TUcvnVhDpo/
 9Zxe1MpLwxs8GrIX9AR2yoikqYXDVSm69VYff8vqPLFtJu7RU86P4gov8QMRDTs22dqz82
 eE+sh9spz0yix5tBtadu7v4pAKWE196BJphNtILZz3bJ9Y+38AR7pwHLKM/oQg==
References: <20230426143213.4178586-4-macroalpha82@gmail.com>
 <20230426143213.4178586-3-macroalpha82@gmail.com>
 <20230426143213.4178586-2-macroalpha82@gmail.com>
 <ZEk7NlMKKTIG8amo@qwark.sigxcpu.org>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>
Subject: Re: [PATCH V3 1/3] dt-bindings: panel: Add Anbernic RG353V-V2 panel
 compatible
Date: Tue, 06 Jun 2023 08:12:36 +0200
In-reply-to: <ZEk7NlMKKTIG8amo@qwark.sigxcpu.org>
Message-ID: <8735352h0q.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4Qb22V4rWtz9svT
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
Cc: neil.armstrong@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,
hi Guido,

On 2023-04-26 at 16:54:46 +0200, Guido G=C3=BCnther <guido.gunther@puri.sm>=
 wrote:
> Hi Chris,
> could you check if these two modifications by Frank of the init sequence
>
>    https://lore.kernel.org/dri-devel/20230211171748.36692-2-frank@oltmann=
s.dev/
>    https://lore.kernel.org/dri-devel/20230213123238.76889-2-frank@oltmann=
s.dev/
>
> work for your panel too?

I saw that Chris' patchset got accepted into drm-next, and I'm glad that
more panels will therefore work out of the box. But: Did anyone check if
the modifications I submitted in February and that Guido referenced
above work with the new panel?

Thanks,
  Frank

> Cheers,
>  -- Guido
>
> On Wed, Apr 26, 2023 at 09:32:11AM -0500, Chris Morgan wrote:
>> From: Chris Morgan <macromorgan@hotmail.com>
>>
>> The Anbernic RG353V-V2 panel is a 3.5 inch 640x480 MIPI-DSI LCD panel.
>> It's based on the ST7703 LCD controller just like rocktech,jh057n00900.
>> It's used in a 2nd revision of the Anbernic RG353V handheld gaming
>> device. Like the first revision of the RG353V the control chip is known
>> but the panel itself is unknown, so name it for the device.
>>
>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Guido G=C3=BCnther <agx@sigxcpu.org>
>> ---
>>  .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh=
057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,j=
h057n00900.yaml
>> index 09b5eb7542f8..150e81090af2 100644
>> --- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n009=
00.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n009=
00.yaml
>> @@ -20,6 +20,8 @@ allOf:
>>  properties:
>>    compatible:
>>      enum:
>> +      # Anberic RG353V-V2 5.0" 640x480 TFT LCD panel
>> +      - anbernic,rg353v-panel-v2
>>        # Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel
>>        - rocktech,jh057n00900
>>        # Xingbangda XBD599 5.99" 720x1440 TFT LCD panel
>> --
>> 2.34.1
>>
>
> On Wed, Apr 26, 2023 at 09:32:12AM -0500, Chris Morgan wrote:
>> From: Chris Morgan <macromorgan@hotmail.com>
>>
>> A later revision of the datasheet for the ST7703 refers to this command
>> as "SETECO".
>>
>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> Reviewed-by: Guido G=C3=BCnther <agx@sigxcpu.org>
>> ---
>>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu=
/drm/panel/panel-sitronix-st7703.c
>> index 6747ca237ced..fc55b5fbb67f 100644
>> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> @@ -41,8 +41,8 @@
>>  #define ST7703_CMD_UNKNOWN_BF	 0xBF
>>  #define ST7703_CMD_SETSCR	 0xC0
>>  #define ST7703_CMD_SETPOWER	 0xC1
>> +#define ST7703_CMD_SETECO	 0xC6
>>  #define ST7703_CMD_SETPANEL	 0xCC
>> -#define ST7703_CMD_UNKNOWN_C6	 0xC6
>>  #define ST7703_CMD_SETGAMMA	 0xE0
>>  #define ST7703_CMD_SETEQ	 0xE3
>>  #define ST7703_CMD_SETGIP1	 0xE9
>> @@ -249,8 +249,7 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>>  				      * ESD_DET_TIME_SEL =3D 0 frames
>>  				      */);
>>
>> -	/* Undocumented command. */
>> -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_C6, 0x01, 0x00, 0xFF, 0=
xFF, 0x00);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETECO, 0x01, 0x00, 0xFF, 0xFF,=
 0x00);
>>
>>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
>>  			       0x74, /* VBTHS, VBTLS: VGH =3D 17V, VBL =3D -11V */
>> --
>> 2.34.1
>>
>
> On Wed, Apr 26, 2023 at 09:32:13AM -0500, Chris Morgan wrote:
>> From: Chris Morgan <macromorgan@hotmail.com>
>>
>> The Anbernic RG353V-V2 is a 5 inch panel used in a new revision of the
>> Anbernic RG353V handheld gaming device. Add support for it.
>>
>> Unfortunately it appears this controller is not able to support 120hz
>> or 100hz mode like the first revision panel.
>>
>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> Reviewed-by: Guido G=C3=BCnther <agx@sigxcpu.org>
>> ---
>>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 97 +++++++++++++++++++
>>  1 file changed, 97 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu=
/drm/panel/panel-sitronix-st7703.c
>> index fc55b5fbb67f..3aa31f3d6157 100644
>> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> @@ -28,6 +28,7 @@
>>  /* Manufacturer specific Commands send via DSI */
>>  #define ST7703_CMD_ALL_PIXEL_OFF 0x22
>>  #define ST7703_CMD_ALL_PIXEL_ON	 0x23
>> +#define ST7703_CMD_SETAPID	 0xB1
>>  #define ST7703_CMD_SETDISP	 0xB2
>>  #define ST7703_CMD_SETRGBIF	 0xB3
>>  #define ST7703_CMD_SETCYC	 0xB4
>> @@ -42,11 +43,14 @@
>>  #define ST7703_CMD_SETSCR	 0xC0
>>  #define ST7703_CMD_SETPOWER	 0xC1
>>  #define ST7703_CMD_SETECO	 0xC6
>> +#define ST7703_CMD_SETIO	 0xC7
>> +#define ST7703_CMD_SETCABC	 0xC8
>>  #define ST7703_CMD_SETPANEL	 0xCC
>>  #define ST7703_CMD_SETGAMMA	 0xE0
>>  #define ST7703_CMD_SETEQ	 0xE3
>>  #define ST7703_CMD_SETGIP1	 0xE9
>>  #define ST7703_CMD_SETGIP2	 0xEA
>> +#define ST7703_CMD_UNKNOWN_EF	 0xEF
>>
>>  struct st7703 {
>>  	struct device *dev;
>> @@ -337,6 +341,98 @@ static const struct st7703_panel_desc xbd599_desc =
=3D {
>>  	.init_sequence =3D xbd599_init_sequence,
>>  };
>>
>> +static int rg353v2_init_sequence(struct st7703 *ctx)
>> +{
>> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
>> +
>> +	/*
>> +	 * Init sequence was supplied by the panel vendor.
>> +	 */
>> +
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xf1, 0x12, 0x83);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETAPID, 0x00, 0x00, 0x00,
>> +			       0xda, 0x80);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0x00, 0x13, 0x70);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF, 0x10, 0x10, 0x28,
>> +			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
>> +			       0xf0, 0x63);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
>> +			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00,
>> +			       0x00, 0x00, 0x00, 0x44, 0x25, 0x00, 0x90, 0x0a,
>> +			       0x00, 0x00, 0x01, 0x4f, 0x01, 0x00, 0x00, 0x37);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x47);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR, 0x73, 0x73, 0x50, 0x50,
>> +			       0x00, 0x00, 0x12, 0x50, 0x00);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER, 0x53, 0xc0, 0x32,
>> +			       0x32, 0x77, 0xe1, 0xdd, 0xdd, 0x77, 0x77, 0x33,
>> +			       0x33);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETECO, 0x82, 0x00, 0xbf, 0xff,
>> +			       0x00, 0xff);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETIO, 0xb8, 0x00, 0x0a, 0x00,
>> +			       0x00, 0x00);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCABC, 0x10, 0x40, 0x1e,
>> +			       0x02);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0b);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA, 0x00, 0x07, 0x0d,
>> +			       0x37, 0x35, 0x3f, 0x41, 0x44, 0x06, 0x0c, 0x0d,
>> +			       0x0f, 0x11, 0x10, 0x12, 0x14, 0x1a, 0x00, 0x07,
>> +			       0x0d, 0x37, 0x35, 0x3f, 0x41, 0x44, 0x06, 0x0c,
>> +			       0x0d, 0x0f, 0x11, 0x10, 0x12, 0x14, 0x1a);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ, 0x07, 0x07, 0x0b, 0x0b,
>> +			       0x0b, 0x0b, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00,
>> +			       0xc0, 0x10);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1, 0xc8, 0x10, 0x02, 0x00,
>> +			       0x00, 0xb0, 0xb1, 0x11, 0x31, 0x23, 0x28, 0x80,
>> +			       0xb0, 0xb1, 0x27, 0x08, 0x00, 0x04, 0x02, 0x00,
>> +			       0x00, 0x00, 0x00, 0x04, 0x02, 0x00, 0x00, 0x00,
>> +			       0x88, 0x88, 0xba, 0x60, 0x24, 0x08, 0x88, 0x88,
>> +			       0x88, 0x88, 0x88, 0x88, 0x88, 0xba, 0x71, 0x35,
>> +			       0x18, 0x88, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00,
>> +			       0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +			       0x00, 0x00, 0x00);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2, 0x97, 0x0a, 0x82, 0x02,
>> +			       0x03, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +			       0x81, 0x88, 0xba, 0x17, 0x53, 0x88, 0x88, 0x88,
>> +			       0x88, 0x88, 0x88, 0x80, 0x88, 0xba, 0x06, 0x42,
>> +			       0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x23, 0x00,
>> +			       0x00, 0x02, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +			       0x00);
>> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_EF, 0xff, 0xff, 0x01);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct drm_display_mode rg353v2_mode =3D {
>> +	.hdisplay	=3D 640,
>> +	.hsync_start	=3D 640 + 40,
>> +	.hsync_end	=3D 640 + 40 + 2,
>> +	.htotal		=3D 640 + 40 + 2 + 80,
>> +	.vdisplay	=3D 480,
>> +	.vsync_start	=3D 480 + 18,
>> +	.vsync_end	=3D 480 + 18 + 2,
>> +	.vtotal		=3D 480 + 18 + 2 + 28,
>> +	.clock		=3D 24150,
>> +	.flags		=3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>> +	.width_mm	=3D 70,
>> +	.height_mm	=3D 57,
>> +};
>> +
>> +static const struct st7703_panel_desc rg353v2_desc =3D {
>> +	.mode =3D &rg353v2_mode,
>> +	.lanes =3D 4,
>> +	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>> +		      MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_LPM,
>> +	.format =3D MIPI_DSI_FMT_RGB888,
>> +	.init_sequence =3D rg353v2_init_sequence,
>> +};
>> +
>>  static int st7703_enable(struct drm_panel *panel)
>>  {
>>  	struct st7703 *ctx =3D panel_to_st7703(panel);
>> @@ -597,6 +693,7 @@ static void st7703_remove(struct mipi_dsi_device *ds=
i)
>>  }
>>
>>  static const struct of_device_id st7703_of_match[] =3D {
>> +	{ .compatible =3D "anbernic,rg353v-panel-v2", .data =3D &rg353v2_desc =
},
>>  	{ .compatible =3D "rocktech,jh057n00900", .data =3D &jh057n00900_panel=
_desc },
>>  	{ .compatible =3D "xingbangda,xbd599", .data =3D &xbd599_desc },
>>  	{ /* sentinel */ }
>> --
>> 2.34.1
>>
