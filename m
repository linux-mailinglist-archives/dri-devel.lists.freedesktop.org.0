Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3519F7CB005
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 18:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B602F10E215;
	Mon, 16 Oct 2023 16:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 402 seconds by postgrey-1.36 at gabe;
 Mon, 16 Oct 2023 16:14:40 UTC
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4832E10E207
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 16:14:40 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1697472474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jpJXh+F8Que6Ly1O84hVmMpL38Sv9O8Q4HxxoFE777w=;
 b=Hk9MIFJSOGWCkiikQa5vpDld+AzmxMsKZ9klIADDzrsPkT/i8ubFFdv4jHLhLTelZ4+s7U
 HmJA/5KMsprz7dU38pbY+nK/TvdOSvt2L95czmveU6jxqRnVw7e9PI57EyrTM373d1OtrA
 +MjPmOOdVI6RrcqdFgSvtBL5pmt4ok+fw/UeGloSkCifRY1C57w7Ks+YXTe95jNuZRwgr+
 V841n5EpoyQHH/tuiLZOS/8+pxEHyWHhzw53UuHimJigr7VukeVjn0um4tY6lj7AmO08ym
 uSApglWhsFSloEKGi2Bha8AikBUhcibg8fqThwgMDthr/IFjw884lP/Rl168jA==
Date: Mon, 16 Oct 2023 18:07:52 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: st7703: Add Powkiddy RGB30 Panel Support
In-Reply-To: <CADcbR4+i_B26g_gLrjTm8dxVzprb-WHRrx=r07wKhcJuei+96w@mail.gmail.com>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
 <20231013183918.225666-4-macroalpha82@gmail.com>
 <ZSz1PeHhFp0AHtMl@qwark.sigxcpu.org>
 <CADcbR4+i_B26g_gLrjTm8dxVzprb-WHRrx=r07wKhcJuei+96w@mail.gmail.com>
Message-ID: <e52152b6783e3fce9aebb64a553c6922@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-Mailman-Approved-At: Mon, 16 Oct 2023 16:40:53 +0000
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 kernel@puri.sm, krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, sebastian.reichel@collabora.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Ondrej Jirman <megi@xff.cz>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <guido.gunther@puri.sm>, jagan@edgeble.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-16 17:52, Chris Morgan wrote:
> Confirmed that those pending patches DO fix the panel suspend issues. 
> Thank you.

Awesome, that's great to hear!  Perhaps a "Tested-by" in the original 
LKML thread [1] could help with having the patch pulled sooner.

Links:
[1] 
https://lore.kernel.org/lkml/33b72957-1062-1b66-85eb-c37dc5ca259b@redhat.com/T/


> On Mon, Oct 16, 2023 at 3:41 AM Guido Günther <guido.gunther@puri.sm> 
> wrote:
>> 
>> Hi Chris,
>> On Fri, Oct 13, 2023 at 01:39:16PM -0500, Chris Morgan wrote:
>> > From: Chris Morgan <macromorgan@hotmail.com>
>> >
>> > The Powkiddy RGB30 4 inch panel is a 4 inch 720x720 DSI panel used in
>> > the Powkiddy RGB30 handheld gaming device. Add support for it.
>> >
>> > TODO: The panel seems to not resume properly from suspend. I've
>> > confirmed on the other ST7703 based devices it works correctly.
>> 
>> Regarding drm-misc-next has improvements regarding this prompted by 
>> the
>> PinePhone. Maybe that fixes suspend for you too?
>> 
>> Cheers,
>>  -- Guido
>> 
>> >
>> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> > ---
>> >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 89 +++++++++++++++++++
>> >  1 file changed, 89 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> > index 6a3945639535..a9892a4447fb 100644
>> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> > @@ -433,6 +433,94 @@ static const struct st7703_panel_desc rg353v2_desc = {
>> >       .init_sequence = rg353v2_init_sequence,
>> >  };
>> >
>> > +static int rgb30panel_init_sequence(struct st7703 *ctx)
>> > +{
>> > +     struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>> > +
>> > +     /* Init sequence extracted from Powkiddy RGB30 BSP kernel. */
>> > +
>> > +     /*
>> > +      * For some reason this specific panel must be taken out of sleep
>> > +      * before the full init sequence, or else it will not display.
>> > +      */
>> > +     mipi_dsi_dcs_exit_sleep_mode(dsi);
>> > +     msleep(250);
>> > +
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xf1, 0x12, 0x83);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05, 0xf9,
>> > +                            0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00,
>> > +                            0x00, 0x00, 0x44, 0x25, 0x00, 0x90, 0x0a, 0x00,
>> > +                            0x00, 0x01, 0x4f, 0x01, 0x00, 0x00, 0x37);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22, 0xf0,
>> > +                            0x63);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF, 0x10, 0x10, 0x28,
>> > +                            0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR, 0x73, 0x73, 0x50, 0x50,
>> > +                            0x00, 0x00, 0x12, 0x70, 0x00);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x46);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0b);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0x3c, 0x12, 0x30);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ, 0x07, 0x07, 0x0b, 0x0b,
>> > +                            0x03, 0x0b, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00,
>> > +                            0xc0, 0x10);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER, 0x36, 0x00, 0x32,
>> > +                            0x32, 0x77, 0xf1, 0xcc, 0xcc, 0x77, 0x77, 0x33,
>> > +                            0x33);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x88, 0x88);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1, 0xc8, 0x10, 0x0a, 0x10,
>> > +                            0x0f, 0xa1, 0x80, 0x12, 0x31, 0x23, 0x47, 0x86,
>> > +                            0xa1, 0x80, 0x47, 0x08, 0x00, 0x00, 0x0d, 0x00,
>> > +                            0x00, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00,
>> > +                            0x48, 0x02, 0x8b, 0xaf, 0x46, 0x02, 0x88, 0x88,
>> > +                            0x88, 0x88, 0x88, 0x48, 0x13, 0x8b, 0xaf, 0x57,
>> > +                            0x13, 0x88, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00,
>> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> > +                            0x00, 0x00, 0x00);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2, 0x96, 0x12, 0x01, 0x01,
>> > +                            0x01, 0x78, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
>> > +                            0x4f, 0x31, 0x8b, 0xa8, 0x31, 0x75, 0x88, 0x88,
>> > +                            0x88, 0x88, 0x88, 0x4f, 0x20, 0x8b, 0xa8, 0x20,
>> > +                            0x64, 0x88, 0x88, 0x88, 0x88, 0x88, 0x23, 0x00,
>> > +                            0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
>> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> > +                            0x00, 0x00, 0x40, 0xa1, 0x80, 0x00, 0x00, 0x00,
>> > +                            0x00);
>> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA, 0x00, 0x0a, 0x0f,
>> > +                            0x29, 0x3b, 0x3f, 0x42, 0x39, 0x06, 0x0d, 0x10,
>> > +                            0x13, 0x15, 0x14, 0x15, 0x10, 0x17, 0x00, 0x0a,
>> > +                            0x0f, 0x29, 0x3b, 0x3f, 0x42, 0x39, 0x06, 0x0d,
>> > +                            0x10, 0x13, 0x15, 0x14, 0x15, 0x10, 0x17);
>> > +
>> > +     return 0;
>> > +}
>> > +
>> > +static const struct drm_display_mode rgb30panel_mode = {
>> > +     .hdisplay       = 720,
>> > +     .hsync_start    = 720 + 45,
>> > +     .hsync_end      = 720 + 45 + 4,
>> > +     .htotal         = 720 + 45 + 4 + 45,
>> > +     .vdisplay       = 720,
>> > +     .vsync_start    = 720 + 15,
>> > +     .vsync_end      = 720 + 15 + 3,
>> > +     .vtotal         = 720 + 15 + 3 + 11,
>> > +     .clock          = 36570,
>> > +     .flags          = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>> > +     .width_mm       = 76,
>> > +     .height_mm      = 76,
>> > +};
>> > +
>> > +static const struct st7703_panel_desc rgb30panel_desc = {
>> > +     .mode = &rgb30panel_mode,
>> > +     .lanes = 4,
>> > +     .mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>> > +                   MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_LPM,
>> > +     .format = MIPI_DSI_FMT_RGB888,
>> > +     .init_sequence = rgb30panel_init_sequence,
>> > +};
>> > +
>> >  static int st7703_enable(struct drm_panel *panel)
>> >  {
>> >       struct st7703 *ctx = panel_to_st7703(panel);
>> > @@ -694,6 +782,7 @@ static void st7703_remove(struct mipi_dsi_device *dsi)
>> >
>> >  static const struct of_device_id st7703_of_match[] = {
>> >       { .compatible = "anbernic,rg353v-panel-v2", .data = &rg353v2_desc },
>> > +     { .compatible = "powkiddy,rgb30-panel", .data = &rgb30panel_desc },
>> >       { .compatible = "rocktech,jh057n00900", .data = &jh057n00900_panel_desc },
>> >       { .compatible = "xingbangda,xbd599", .data = &xbd599_desc },
>> >       { /* sentinel */ }
>> > --
>> > 2.34.1
>> >
>> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
