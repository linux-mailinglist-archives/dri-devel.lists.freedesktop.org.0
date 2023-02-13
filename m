Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850626940AA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 10:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D4310E4FA;
	Mon, 13 Feb 2023 09:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6698710E4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 09:18:10 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4PFdzf3rD2z9sch;
 Mon, 13 Feb 2023 10:18:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676279886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gYqyG34jqUdKvdo77BmID3MiXQClrcvRYfpAOEWTeog=;
 b=va9KHKi4x3hya+Y/SLqoYKhU5czz8wMACdharbjeLHaqcStbhkkAhlDsLNkYvxyJuf4zSD
 DW8xejxEYyI3TWbdOa7guV73Z/Zrft/0Qo84UuN6M/xzGW3pUamZ5OCvMmSWiAdJ0tserS
 tkKfTSWOnzSSf3BJUy7pip3SkwTqxST488j8a9kPW3vESGmfS9jeyJVpvKg7neXHMxyUEE
 VIwcn4Fsbuvqq+NxDoYKSK9jnvsLBpR81V+xLVrriMcaAPyya9qUxsDu0CH7Neltp4Ho2m
 NFbKiMxDb9pr8SLLo78BRgW3QvOUZ07eQEcuuGfyLXqydo7eddIC8nSxMIibuw==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Fix resume of XBD599 panel
Date: Mon, 13 Feb 2023 08:47:16 +0100
References: <20230212120830.46880-1-frank@oltmanns.dev>
 <20230212120830.46880-2-frank@oltmanns.dev>
 <20230212123621.jo56yqlburd6g6ir@core> <874jrq20kz.fsf@oltmanns.dev>
 <20230212193533.3czfby4id4cpbu2s@core>
In-reply-to: <20230212193533.3czfby4id4cpbu2s@core>
Message-ID: <87bklxsz42.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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
Cc: Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ond=C5=99ej,

ok, now I get it. Thank you very much for your thorough explanation. It rea=
lly appreciate it!

Ond=C5=99ej Jirman <megous@megous.com> writes:
> On Sun, Feb 12, 2023 at 06:52:05PM +0100, Frank Oltmanns wrote:
>> Ond=C5=99ej Jirman <megi@xff.cz> writes:
>>
>> > On Sun, Feb 12, 2023 at 01:08:29PM +0100, Frank Oltmanns wrote:
>> Please let me point you to the discussion you and Guido had ~2.5 years a=
go:
>> <https://lore.kernel.org/all/20200729154809.GA435075@bogon.m.sigxcpu.org=
/>
>
> Guido references some unspecified datasheet. We only have a st7703 datash=
eet
> to go by, and that requires 120ms and is relevant for both panels.
>
> Also the patch that Guido tested removed a few 20ms delays from the init
> sequence for the librem panel. Maybe that broke the init for librem panel=
 and
> not the extra few ms after sleep out that the patch added.

Ok, I see. You removed the 20 msec delay after the panel specific
initialization sequence and before issuing SLPOUT in your original
patch.

>> I read that screenshot, that we need a 120 msec wait after sleep OUT bef=
ore we
>> can send another sleep in (see the =E2=80=9CRestriction=E2=80=9D row). I=
 can=E2=80=99t seem to find
>> the reference to the 120 msec delay after the sleep IN command. I read t=
he
>> flow chart at the bottom as informational about the duration of the whole
>> procedure that happens after issuing the sleep in command. The only
>> restriction is that we can=E2=80=99t issue any command for 5 msec after =
sleep in was
>> issued.
>
> It=E2=80=99s at the bottom, sleep in takes 120ms to execute. Part of the =
execution is
> draining the charge from the panel. You can=E2=80=99t shutdown power supp=
lies before
> sleep in completes, so you need the delay after sleep in and before regul=
ator
> powerdown, otherwise the flow chart will not have the time to execute pro=
perly,
> and the panel will be left in a bad state.

Ok, that makes sense.

>> > So there needs to be 120ms delay after sleep in and after sleep out,
>> > regardless of which panel is driven by this controller, to ensure the =
panel
>> > stays operational even when the user is quickly switching it on/off re=
peatedly.
>> >
>> > So I don=E2=80=99t think you should be doing panel specific quirks her=
e.
>>
>> Maybe. I can only say that without the timings in this patch (i.e. the o=
nes
>> from your kernel branch) the display on my pinephone is flickering after=
 the
>> first (and every subsequent) time the display is turned off. With your n=
ew
>> timing everything works great on the pinephone. Guido states that the ti=
mings
>> in your original patch (i.e. the XDB599 specific timings in this patch) =
the
>> Librem 5 devkit panel doesn=E2=80=99t work.
>
> Adding extra delays after sleep in/before sleep out should not break Libr=
em
> panel. Previous patches also changed the powerup sequence to hold the res=
et
> before powerup of the power supplies, and rearranged other delays.
>
> They were made before the problem with the panel discharge was properly
> understood.
>
> I suggest just going a bit more conservatively than what I did with my or=
iginal
> patch series, and just make sure there are 120ms delays after sleep out a=
nd
> before sleep in + extra delay after regulator powerup and don=E2=80=99t d=
o anything that
> may decrease delays for librem devkit panel. Just adding delays should no=
t break
> anything, sine the only timings that have maximums specified in the datas=
heet
> are for power rail voltage rampup times.

I agree, that the one 20 msec delay that you removed, is probably what
broke the JH057N panel and not the extra delays. Unfortunately, there is
no way for me to verify that statement, because I don=E2=80=99t have access=
 to
Librem=E2=80=99s devkit.

So, I can only offer to prepare a V2 and kindly ask Guido to test it. V2
will be much simpler:
=E2=80=A2 Increase the delay after issuing sleep out from 60 to 120 msec fo=
r all
  panels.
=E2=80=A2 Add a delay of 120 msec after issuing sleep in for all panels.
=E2=80=A2 Move the 20 msec delay between initialization and sleep out into =
the
  initialization function for the JH057N panel (like in this version of
  the patch).
=E2=80=A2 Remove a 20 msec delay from the initialization function of the XB=
D599
  panel (like in this version of the patch).

> (Also some timings during powerup/down may appear to have different needs=
 on
> Librem devkit simply because panel driver is not really affecting the
> regulators, because they are already powered up due to being referenced b=
y other
> drivers/devices, because they are shared. This is a bit tricky to test
> properly. It=E2=80=99s necessary to test both power sequence cases, where=
 the regulators
> are known to be off, and when they are already referenced by other driver=
s.
> On librem devkit, one of them seems to be shared by audio codec and touch=
screen,
> on pinephone there=E2=80=99s less sharing. Easiest way to do that is to u=
nload the
> relevant drivers for other devices that share the regulators and check wi=
th
> debugfs/regulator/regulator_summary that the refcount of lcd regulators)

Well, that was interesting! Thank you! I checked on my pinephone and I
only have refcounts of 1 on the relevant child nodes as you expeceted. :)

Thanks again,
  Frank

> regards,
> 	o.
>
>> Do you have a proposal how to proceed without implementing panel specific
>> timings?
>>
>> Thanks,
>>   Frank
>>
>> >
>> > regards,
>> > 	o.
>> >
>> >> Therefore, introduce panel specific functions for the delays.
>> >>
>> >> The XDB599 does not require a 20 msec delay between the SETBGP and
>> >> SETVCOM commands. Therefore, remove the delay from the device specific
>> >> initialization function.
>> >>
>> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> >> Cc: Ondrej Jirman <megi@xff.cz>
>> >> Reported-by: Samuel Holland <samuel@sholland.org>
>> >> =E2=80=94
>> >>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 40 ++++++++++++++++=
=E2=80=94
>> >>  1 file changed, 35 insertions(+), 5 deletions(-)
>> >>
>> >> diff =E2=80=93git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/d=
rivers/gpu/drm/panel/panel-sitronix-st7703.c
>> >> index 6747ca237ced..a149341c4a8b 100644
>> >> =E2=80=94 a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> >> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> >> @@ -66,6 +66,8 @@ struct st7703_panel_desc {
>> >>  	unsigned long mode_flags;
>> >>  	enum mipi_dsi_pixel_format format;
>> >>  	int (*init_sequence)(struct st7703 *ctx);
>> >> +	void (*wait_after_sleep_out)(void);
>> >> +	void (*drain_charge)(void);
>> >>  };
>> >>
>> >>  static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
>> >> @@ -126,10 +128,24 @@ static int jh057n_init_sequence(struct st7703 *=
ctx)
>> >>  				   0x18, 0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41,
>> >>  				   0x37, 0x07, 0x0B, 0x0D, 0x10, 0x11, 0x0F, 0x10,
>> >>  				   0x11, 0x18);
>> >> +	msleep(20);
>> >>
>> >>  	return 0;
>> >>  }
>> >>
>> >> +static void jh057n_wait_after_sleep_out(void)
>> >> +{
>> >> +	/*
>> >> +	 * Panel is operational 120 msec after reset, i.e. 60 msec after
>> >> +	 * sleep out.
>> >> +	 */
>> >> +	msleep(60);
>> >> +}
>> >> +
>> >> +static void jh057n_drain_charge(void)
>> >> +{
>> >> +}
>> >> +
>> >>  static const struct drm_display_mode jh057n00900_mode =3D {
>> >>  	.hdisplay    =3D 720,
>> >>  	.hsync_start =3D 720 + 90,
>> >> @@ -152,6 +168,8 @@ static const struct st7703_panel_desc jh057n00900=
_panel_desc =3D {
>> >>  		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
>> >>  	.format =3D MIPI_DSI_FMT_RGB888,
>> >>  	.init_sequence =3D jh057n_init_sequence,
>> >> +	.wait_after_sleep_out =3D jh057n_wait_after_sleep_out,
>> >> +	.drain_charge =3D jh057n_drain_charge,
>> >>  };
>> >>
>> >>  static int xbd599_init_sequence(struct st7703 *ctx)
>> >> @@ -273,7 +291,6 @@ static int xbd599_init_sequence(struct st7703 *ct=
x)
>> >>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
>> >>  			       0x07, /* VREF_SEL =3D 4.2V */
>> >>  			       0x07  /* NVREF_SEL =3D 4.2V */);
>> >> -	msleep(20);
>> >>
>> >>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
>> >>  			       0x2C, /* VCOMDC_F =3D -0.67V */
>> >> @@ -315,6 +332,18 @@ static int xbd599_init_sequence(struct st7703 *c=
tx)
>> >>  	return 0;
>> >>  }
>> >>
>> >> +static void xbd599_wait_after_sleep_out(void)
>> >> +{
>> >> +	msleep(120);
>> >> +}
>> >> +
>> >> +static void xbd599_drain_charge(void)
>> >> +{
>> >> +	/* Drain diplay of charge, to work correctly on next power on. */
>> >> +	msleep(120);
>> >> +}
>> >> +
>> >> +
>> >>  static const struct drm_display_mode xbd599_mode =3D {
>> >>  	.hdisplay    =3D 720,
>> >>  	.hsync_start =3D 720 + 40,
>> >> @@ -336,6 +365,8 @@ static const struct st7703_panel_desc xbd599_desc=
 =3D {
>> >>  	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULS=
E,
>> >>  	.format =3D MIPI_DSI_FMT_RGB888,
>> >>  	.init_sequence =3D xbd599_init_sequence,
>> >> +	.wait_after_sleep_out =3D xbd599_wait_after_sleep_out,
>> >> +	.drain_charge =3D xbd599_drain_charge,
>> >>  };
>> >>
>> >>  static int st7703_enable(struct drm_panel *panel)
>> >> @@ -350,16 +381,13 @@ static int st7703_enable(struct drm_panel *pane=
l)
>> >>  		return ret;
>> >>  	}
>> >>
>> >> -	msleep(20);
>> >> -
>> >>  	ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
>> >>  	if (ret < 0) {
>> >>  		dev_err(ctx->dev, =E2=80=9CFailed to exit sleep mode: %d\n=E2=80=
=9D, ret);
>> >>  		return ret;
>> >>  	}
>> >>
>> >> -	/* Panel is operational 120 msec after reset */
>> >> -	msleep(60);
>> >> +	ctx->desc->wait_after_sleep_out();
>> >>
>> >>  	ret =3D mipi_dsi_dcs_set_display_on(dsi);
>> >>  	if (ret)
>> >> @@ -384,6 +412,8 @@ static int st7703_disable(struct drm_panel *panel)
>> >>  	if (ret < 0)
>> >>  		dev_err(ctx->dev, =E2=80=9CFailed to enter sleep mode: %d\n=E2=80=
=9D, ret);
>> >>
>> >> +	ctx->desc->drain_charge();
>> >> +
>> >>  	return 0;
>> >>  }
>> >>
>> >> =E2=80=93
>> >> 2.39.1
>> >>

--=-=-=--
