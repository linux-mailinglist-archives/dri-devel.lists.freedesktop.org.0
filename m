Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826686EF701
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C5910E7A3;
	Wed, 26 Apr 2023 15:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 374 seconds by postgrey-1.36 at gabe;
 Wed, 26 Apr 2023 15:01:06 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7CF10E7A3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 15:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 18EFCFB03;
 Wed, 26 Apr 2023 16:54:50 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aI13pkttJeBQ; Wed, 26 Apr 2023 16:54:47 +0200 (CEST)
Date: Wed, 26 Apr 2023 16:54:46 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V3 1/3] dt-bindings: panel: Add Anbernic RG353V-V2 panel
 compatible
Message-ID: <ZEk7NlMKKTIG8amo@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230426143213.4178586-4-macroalpha82@gmail.com>
 <20230426143213.4178586-3-macroalpha82@gmail.com>
 <20230426143213.4178586-2-macroalpha82@gmail.com>
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
Cc: sam@ravnborg.org, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,
could you check if these two modifications by Frank of the init sequence

   https://lore.kernel.org/dri-devel/20230211171748.36692-2-frank@oltmanns.dev/
   https://lore.kernel.org/dri-devel/20230213123238.76889-2-frank@oltmanns.dev/

work for your panel too?
Cheers,
 -- Guido

On Wed, Apr 26, 2023 at 09:32:11AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Anbernic RG353V-V2 panel is a 3.5 inch 640x480 MIPI-DSI LCD panel.
> It's based on the ST7703 LCD controller just like rocktech,jh057n00900.
> It's used in a 2nd revision of the Anbernic RG353V handheld gaming
> device. Like the first revision of the RG353V the control chip is known
> but the panel itself is unknown, so name it for the device.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Guido Günther <agx@sigxcpu.org>
> ---
>  .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> index 09b5eb7542f8..150e81090af2 100644
> --- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> @@ -20,6 +20,8 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      # Anberic RG353V-V2 5.0" 640x480 TFT LCD panel
> +      - anbernic,rg353v-panel-v2
>        # Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel
>        - rocktech,jh057n00900
>        # Xingbangda XBD599 5.99" 720x1440 TFT LCD panel
> -- 
> 2.34.1
> 

On Wed, Apr 26, 2023 at 09:32:12AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> A later revision of the datasheet for the ST7703 refers to this command
> as "SETECO".
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 6747ca237ced..fc55b5fbb67f 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -41,8 +41,8 @@
>  #define ST7703_CMD_UNKNOWN_BF	 0xBF
>  #define ST7703_CMD_SETSCR	 0xC0
>  #define ST7703_CMD_SETPOWER	 0xC1
> +#define ST7703_CMD_SETECO	 0xC6
>  #define ST7703_CMD_SETPANEL	 0xCC
> -#define ST7703_CMD_UNKNOWN_C6	 0xC6
>  #define ST7703_CMD_SETGAMMA	 0xE0
>  #define ST7703_CMD_SETEQ	 0xE3
>  #define ST7703_CMD_SETGIP1	 0xE9
> @@ -249,8 +249,7 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>  				      * ESD_DET_TIME_SEL = 0 frames
>  				      */);
>  
> -	/* Undocumented command. */
> -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_C6, 0x01, 0x00, 0xFF, 0xFF, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETECO, 0x01, 0x00, 0xFF, 0xFF, 0x00);
>  
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
>  			       0x74, /* VBTHS, VBTLS: VGH = 17V, VBL = -11V */
> -- 
> 2.34.1
> 

On Wed, Apr 26, 2023 at 09:32:13AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Anbernic RG353V-V2 is a 5 inch panel used in a new revision of the
> Anbernic RG353V handheld gaming device. Add support for it.
> 
> Unfortunately it appears this controller is not able to support 120hz
> or 100hz mode like the first revision panel.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index fc55b5fbb67f..3aa31f3d6157 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -28,6 +28,7 @@
>  /* Manufacturer specific Commands send via DSI */
>  #define ST7703_CMD_ALL_PIXEL_OFF 0x22
>  #define ST7703_CMD_ALL_PIXEL_ON	 0x23
> +#define ST7703_CMD_SETAPID	 0xB1
>  #define ST7703_CMD_SETDISP	 0xB2
>  #define ST7703_CMD_SETRGBIF	 0xB3
>  #define ST7703_CMD_SETCYC	 0xB4
> @@ -42,11 +43,14 @@
>  #define ST7703_CMD_SETSCR	 0xC0
>  #define ST7703_CMD_SETPOWER	 0xC1
>  #define ST7703_CMD_SETECO	 0xC6
> +#define ST7703_CMD_SETIO	 0xC7
> +#define ST7703_CMD_SETCABC	 0xC8
>  #define ST7703_CMD_SETPANEL	 0xCC
>  #define ST7703_CMD_SETGAMMA	 0xE0
>  #define ST7703_CMD_SETEQ	 0xE3
>  #define ST7703_CMD_SETGIP1	 0xE9
>  #define ST7703_CMD_SETGIP2	 0xEA
> +#define ST7703_CMD_UNKNOWN_EF	 0xEF
>  
>  struct st7703 {
>  	struct device *dev;
> @@ -337,6 +341,98 @@ static const struct st7703_panel_desc xbd599_desc = {
>  	.init_sequence = xbd599_init_sequence,
>  };
>  
> +static int rg353v2_init_sequence(struct st7703 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +
> +	/*
> +	 * Init sequence was supplied by the panel vendor.
> +	 */
> +
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETAPID, 0x00, 0x00, 0x00,
> +			       0xda, 0x80);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0x00, 0x13, 0x70);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF, 0x10, 0x10, 0x28,
> +			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
> +			       0xf0, 0x63);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
> +			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x00, 0x44, 0x25, 0x00, 0x90, 0x0a,
> +			       0x00, 0x00, 0x01, 0x4f, 0x01, 0x00, 0x00, 0x37);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x47);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR, 0x73, 0x73, 0x50, 0x50,
> +			       0x00, 0x00, 0x12, 0x50, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER, 0x53, 0xc0, 0x32,
> +			       0x32, 0x77, 0xe1, 0xdd, 0xdd, 0x77, 0x77, 0x33,
> +			       0x33);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETECO, 0x82, 0x00, 0xbf, 0xff,
> +			       0x00, 0xff);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETIO, 0xb8, 0x00, 0x0a, 0x00,
> +			       0x00, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCABC, 0x10, 0x40, 0x1e,
> +			       0x02);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0b);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA, 0x00, 0x07, 0x0d,
> +			       0x37, 0x35, 0x3f, 0x41, 0x44, 0x06, 0x0c, 0x0d,
> +			       0x0f, 0x11, 0x10, 0x12, 0x14, 0x1a, 0x00, 0x07,
> +			       0x0d, 0x37, 0x35, 0x3f, 0x41, 0x44, 0x06, 0x0c,
> +			       0x0d, 0x0f, 0x11, 0x10, 0x12, 0x14, 0x1a);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ, 0x07, 0x07, 0x0b, 0x0b,
> +			       0x0b, 0x0b, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00,
> +			       0xc0, 0x10);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1, 0xc8, 0x10, 0x02, 0x00,
> +			       0x00, 0xb0, 0xb1, 0x11, 0x31, 0x23, 0x28, 0x80,
> +			       0xb0, 0xb1, 0x27, 0x08, 0x00, 0x04, 0x02, 0x00,
> +			       0x00, 0x00, 0x00, 0x04, 0x02, 0x00, 0x00, 0x00,
> +			       0x88, 0x88, 0xba, 0x60, 0x24, 0x08, 0x88, 0x88,
> +			       0x88, 0x88, 0x88, 0x88, 0x88, 0xba, 0x71, 0x35,
> +			       0x18, 0x88, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00,
> +			       0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2, 0x97, 0x0a, 0x82, 0x02,
> +			       0x03, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x81, 0x88, 0xba, 0x17, 0x53, 0x88, 0x88, 0x88,
> +			       0x88, 0x88, 0x88, 0x80, 0x88, 0xba, 0x06, 0x42,
> +			       0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x23, 0x00,
> +			       0x00, 0x02, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_EF, 0xff, 0xff, 0x01);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode rg353v2_mode = {
> +	.hdisplay	= 640,
> +	.hsync_start	= 640 + 40,
> +	.hsync_end	= 640 + 40 + 2,
> +	.htotal		= 640 + 40 + 2 + 80,
> +	.vdisplay	= 480,
> +	.vsync_start	= 480 + 18,
> +	.vsync_end	= 480 + 18 + 2,
> +	.vtotal		= 480 + 18 + 2 + 28,
> +	.clock		= 24150,
> +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.width_mm	= 70,
> +	.height_mm	= 57,
> +};
> +
> +static const struct st7703_panel_desc rg353v2_desc = {
> +	.mode = &rg353v2_mode,
> +	.lanes = 4,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_LPM,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init_sequence = rg353v2_init_sequence,
> +};
> +
>  static int st7703_enable(struct drm_panel *panel)
>  {
>  	struct st7703 *ctx = panel_to_st7703(panel);
> @@ -597,6 +693,7 @@ static void st7703_remove(struct mipi_dsi_device *dsi)
>  }
>  
>  static const struct of_device_id st7703_of_match[] = {
> +	{ .compatible = "anbernic,rg353v-panel-v2", .data = &rg353v2_desc },
>  	{ .compatible = "rocktech,jh057n00900", .data = &jh057n00900_panel_desc },
>  	{ .compatible = "xingbangda,xbd599", .data = &xbd599_desc },
>  	{ /* sentinel */ }
> -- 
> 2.34.1
> 

