Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EDE16EEF1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 20:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A74892E0;
	Tue, 25 Feb 2020 19:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52387892E0;
 Tue, 25 Feb 2020 19:27:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 11:27:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; d="scan'208";a="317179148"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 25 Feb 2020 11:27:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Feb 2020 21:27:20 +0200
Date: Tue, 25 Feb 2020 21:27:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
Message-ID: <20200225192720.GG13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CGME20200219203620eucas1p24b4990a91e758dbcf3e9b943669b0c8f@eucas1p2.samsung.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
 <0f278771-79ce-fe23-e72c-3935dbe82d24@samsung.com>
 <20200225112114.GA13686@intel.com>
 <3ca785f2-9032-aaf9-0965-8657d31116ba@samsung.com>
 <20200225154506.GF13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225154506.GF13686@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Josh Wu <josh.wu@atmel.com>,
 Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org,
 Gustaf =?iso-8859-1?Q?Lindstr=F6m?= <gl@axentia.se>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>,
 Stefan Mavrodiev <stefan@olimex.com>, Adam Ford <aford173@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Robert Chiras <robert.chiras@nxp.com>, Heiko Schocher <hs@denx.de>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, Randy Li <ayaka@soulik.info>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Riccardo Bortolato <bortolato@navaltechitalia>,
 linux-amlogic@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Andreas Pretzsch <apr@cn-eng.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Purism Kernel Team <kernel@puri.sm>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 05:45:06PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Feb 25, 2020 at 04:19:27PM +0100, Andrzej Hajda wrote:
> > On 25.02.2020 12:21, Ville Syrj=E4l=E4 wrote:
> > > On Mon, Feb 24, 2020 at 03:14:54PM +0100, Andrzej Hajda wrote:
> > >> On 19.02.2020 21:35, Ville Syrjala wrote:
> > >>> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >>>
> > >>> Get rid of mode->vrefresh and just calculate it on demand. Saves
> > >>> a bit of space and avoids the cached value getting out of sync
> > >>> with reality.
> > >>>
> > >>> Mostly done with cocci, with the following manual fixups:
> > >>> - Remove the now empty loop in drm_helper_probe_single_connector_mo=
des()
> > >>> - Fix __MODE() macro in ch7006_mode.c
> > >>> - Fix DRM_MODE_ARG() macro in drm_modes.h
> > >>> - Remove leftover comment from samsung_s6d16d0_mode
> > >> ...
> > >>> diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/=
gpu/drm/panel/panel-arm-versatile.c
> > >>> index 41444a73c980..47b37fef7ee8 100644
> > >>> --- a/drivers/gpu/drm/panel/panel-arm-versatile.c
> > >>> +++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
> > >>> @@ -143,7 +143,6 @@ static const struct versatile_panel_type versat=
ile_panels[] =3D {
> > >>>  			.vsync_start =3D 240 + 5,
> > >>>  			.vsync_end =3D 240 + 5 + 6,
> > >>>  			.vtotal =3D 240 + 5 + 6 + 5,
> > >>> -			.vrefresh =3D 116,
> > >>
> > >> Are you sure vrefresh calculated (from totals and clock) is different
> > >> than this field? If not, we risk regressions.
> > >>
> > >> This case is OK, but there is plenty other cases.
> > > IIRC I did spot check a few of them. But which code exactly do you th=
ink
> > > is abusing vrefresh and thus could break?
> > =

> > =

> > I guess suspect/potential victim is every code which uses
> > drm_mode_vrefresh - after this patch the function can return different
> > value(if there are differences between provided and calculated vrefresh=
).
> > =

> > Quick examples where output of this function matters:
> > =

> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/disp=
/dpu1/dpu_encoder_phys_cmd.c#L387
> =

> Already looks quite sketchy due to rounding.
> =

> > =

> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/pa=
nel-sharp-lq101r1sx01.c#L42
> =

> msleep() is in no way accurate so looks rather sketchy as well.
> =

> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/tilcdc/t=
ilcdc_crtc.c#L810
> =

> Another thing that suffers from rounding issues.
> =

> So to me these all look like code that someone should fix regardless.

OK, so I went ahead a wrote a bit of cocci [1] to find the bad apples.

Unfortunately it found a lot of strange stuff:
panel-sony-acx424akp.c:51/sony_acx424akp_vid_mode: 60 vs. 727 (.clock=3D330=
000 .htotal=3D480 + 15 + 0 + 15 .vtotal=3D864 + 14 + 1 + 11)
panel-sony-acx424akp.c:71/sony_acx424akp_cmd_mode: 60 vs. 711 (.clock=3D420=
160 .htotal=3D480 + 154 + 16 + 32 .vtotal=3D864 + 1 + 1 + 1)
panel-ilitek-ili9322.c:543/srgb_320x240_mode: 60 vs. 10168 (.clock=3D245350=
0 .htotal=3D320 + 359 + 1 + 241 .vtotal=3D262)
panel-ilitek-ili9322.c:587/yuv_640x320_mode: 60 vs. 7768 (.clock=3D2454000 =
.htotal=3D640 + 252 + 1 + 28 .vtotal=3D320 + 4 + 1 + 18)
panel-ilitek-ili9322.c:616/itu_r_bt_656_640_mode: 60 vs. 5358 (.clock=3D245=
4000 .htotal=3D640 + 3 + 1 + 272 .vtotal=3D500)
panel-ilitek-ili9322.c:557/srgb_360x240_mode: 60 vs. 16178 (.clock=3D270000=
0 .htotal=3D360 + 35 + 1 + 241 .vtotal=3D262)
panel-ilitek-ili9322.c:601/yuv_720x360_mode: 60 vs. 7071 (.clock=3D2700000 =
.htotal=3D720 + 252 + 1 + 24 .vtotal=3D360 + 4 + 1 + 18)
panel-ilitek-ili9322.c:631/itu_r_bt_656_720_mode: 60 vs. 5422 (.clock=3D270=
0000 .htotal=3D720 + 3 + 1 + 272 .vtotal=3D500)
panel-ilitek-ili9322.c:572/prgb_320x240_mode: 60 vs. 59725 (.clock=3D640000=
0 .htotal=3D320 + 38 + 1 + 50 .vtotal=3D262)
panel-lg-lg4573.c:200/default_mode: 60 vs. 57 (.clock=3D27000 .htotal=3D480=
 + 10 + 59 + 10 .vtotal=3D800 + 15 + 15 + 15)
panel-sitronix-st7789v.c:159/default_mode: 60 vs. 70 (.clock=3D7000 .htotal=
=3D240 + 38 + 10 + 10 .vtotal=3D320 + 8 + 4 + 4)
panel-arm-versatile.c:161/versatile_panels[]: 60 vs. 61 (.clock=3D25000 .ht=
otal=3D640 + 24 + 96 + 24 .vtotal=3D480 + 11 + 2 + 32)
panel-arm-versatile.c:208/versatile_panels[]: 116 vs. 59 (.clock=3D5400 .ht=
otal=3D240 + 10 + 10 + 20 .vtotal=3D320 + 2 + 2 + 2)
panel-arm-versatile.c:184/versatile_panels[]: 390 vs. 1523 (.clock=3D62500 =
.htotal=3D176 + 2 + 3 + 3 .vtotal=3D220 + 0 + 2 + 1)
panel-leadtek-ltk500hd1829.c:380/default_mode: 60 vs. 36 (.clock=3D41600 .h=
total=3D720 + 50 + 50 + 50 .vtotal=3D1280 + 30 + 4 + 12)
panel-feixin-k101-im2ba02.c:394/k101_im2ba02_default_mode: 60 vs. 62 (.cloc=
k=3D70000 .htotal=3D800 + 20 + 20 + 20 .vtotal=3D1280 + 16 + 4 + 4)
panel-simple.c:1305/edt_etm043080dh6gp_mode: 60 vs. 67 (.clock=3D10870 .hto=
tal=3D480 + 8 + 4 + 41 .vtotal=3D288 + 2 + 4 + 10)
panel-simple.c:3881/lg_acx467akm_7_mode: 60 vs. 72 (.clock=3D150000 .htotal=
=3D1080 + 2 + 2 + 2 .vtotal=3D1920 + 2 + 2 + 2)
panel-simple.c:2509/ortustech_com37h3m_mode: 60 vs. 67 (.clock=3D22153 .hto=
tal=3D480 + 8 + 10 + 10 .vtotal=3D640 + 4 + 3 + 4)
panel-simple.c:2480/ontat_yx700wv03_mode: 60 vs. 59 (.clock=3D29500 .htotal=
=3D992 .vtotal=3D500)
panel-simple.c:1451/foxlink_fl500wvr00_a0t_mode: 60 vs. 55 (.clock=3D32260 =
.htotal=3D800 + 168 + 64 + 88 .vtotal=3D480 + 37 + 2 + 8)
panel-simple.c:2589/pda_91_00156_a0_mode: 60 vs. 68 (.clock=3D33300 .htotal=
=3D800 + 1 + 64 + 64 .vtotal=3D480 + 1 + 23 + 22)
panel-simple.c:2969/shelly_sca07010_bfn_lnn_mode: 60 vs. 68 (.clock=3D33300=
 .htotal=3D800 + 1 + 64 + 64 .vtotal=3D480 + 1 + 23 + 22)
panel-simple.c:1682/innolux_at070tn92_mode: 60 vs. 58 (.clock=3D33333 .htot=
al=3D800 + 210 + 20 + 46 .vtotal=3D480 + 22 + 23 + 10)
panel-simple.c:3260/vl050_8048nt_c01_mode: 60 vs. 58 (.clock=3D33333 .htota=
l=3D800 + 210 + 20 + 46 .vtotal=3D480 + 22 + 10 + 23)
panel-simple.c:1098/cdtech_s070wv95_ct16_mode: 60 vs. 72 (.clock=3D35000 .h=
total=3D800 + 40 + 40 + 48 .vtotal=3D480 + 29 + 13 + 3)
panel-simple.c:788/auo_g104sn02_mode: 60 vs. 52 (.clock=3D40000 .htotal=3D8=
00 + 40 + 216 + 128 .vtotal=3D600 + 10 + 35 + 2)
panel-simple.c:3201/tpk_f10a_0102_mode: 60 vs. 54 (.clock=3D45000 .htotal=
=3D1024 + 176 + 5 + 88 .vtotal=3D600 + 20 + 5 + 25)
panel-simple.c:2841/sharp_lq035q7db03_mode: 60 vs. 61 (.clock=3D5500 .htota=
l=3D240 + 16 + 7 + 5 .vtotal=3D320 + 9 + 1 + 7)
panel-simple.c:1279/edt_et035012dm6_mode: 60 vs. 61 (.clock=3D6500 .htotal=
=3D320 + 20 + 68 .vtotal=3D240 + 4 + 4 + 14)
panel-simple.c:2321/netron_dy_e231732_mode: 60 vs. 65 (.clock=3D66000 .htot=
al=3D1024 + 160 + 70 + 90 .vtotal=3D600 + 127 + 20 + 3)
panel-simple.c:1122/chunghwa_claa070wp03xg_mode: 60 vs. 57 (.clock=3D66770 =
.htotal=3D800 + 49 + 33 + 17 .vtotal=3D1280 + 1 + 7 + 15)
panel-simple.c:3824/lg_lh500wx1_sd03_mode: 60 vs. 61 (.clock=3D67000 .htota=
l=3D720 + 12 + 4 + 112 .vtotal=3D1280 + 8 + 4 + 12)
panel-simple.c:764/auo_g101evn010_mode: 60 vs. 58 (.clock=3D68930 .htotal=
=3D1280 + 82 + 2 + 84 .vtotal=3D800 + 8 + 2 + 6)
panel-simple.c:1169/chunghwa_claa101wb01_mode: 60 vs. 59 (.clock=3D69300 .h=
total=3D1366 + 48 + 32 + 20 .vtotal=3D768 + 16 + 8 + 16)
panel-simple.c:2002/lemaker_bl035_rgb_002_mode: 60 vs. 65 (.clock=3D7000 .h=
total=3D320 + 20 + 30 + 38 .vtotal=3D240 + 4 + 3 + 15)
panel-simple.c:2918/sharp_lq150x1lg11_mode: 60 vs. 65 (.clock=3D71100 .htot=
al=3D1024 + 168 + 64 + 88 .vtotal=3D768 + 37 + 2 + 8)
panel-simple.c:2214/logicpd_type_28_mode: 60 vs. 59 (.clock=3D9000 .htotal=
=3D480 + 3 + 42 + 2 .vtotal=3D272 + 2 + 11 + 3)
panel-simple.c:1525/giantplus_gpg482739qs5_mode: 60 vs. 59 (.clock=3D9000 .=
htotal=3D480 + 5 + 1 + 40 .vtotal=3D272 + 8 + 1 + 8)
panel-simple.c:1073/cdtech_s043wq26h_ct7_mode: 60 vs. 57 (.clock=3D9000 .ht=
otal=3D480 + 5 + 5 + 40 .vtotal=3D272 + 8 + 8 + 8)
panel-simple.c:2613/qd43003c0_40_mode: 60 vs. 59 (.clock=3D9000 .htotal=3D4=
80 + 8 + 4 + 39 .vtotal=3D272 + 4 + 10 + 2)
panel-simple.c:3124/ti_nspire_classic_lcd_mode[]: 60 vs. 123 (.clock=3D1000=
0 .htotal=3D320 + 6 + 6 + 6 .vtotal=3D240 + 0 + 1 + 0)
panel-simple.c:3096/ti_nspire_cx_lcd_mode[]: 60 vs. 93 (.clock=3D10000 .hto=
tal=3D320 + 50 + 6 + 38 .vtotal=3D240 + 3 + 1 + 17)

I presume a bunch of those are just lazyness, but there some
real oddballs in the mix for sure. CCing everyone...

[1]
@find_substruct@
identifier P, C;
@@
struct P {
...
	struct drm_display_mode C;
...
};

@submode@
identifier find_substruct.P, find_substruct.C, M;
expression CLK, HT, VT, VREF;
position POS;
@@
struct P M =3D {
...,
.C =3D {
	.clock =3D CLK@POS
	,...,
	.htotal =3D HT
	,...,
	.vtotal =3D VT
	,...,
	.vrefresh =3D VREF
}
,...
};

@submodes@
identifier find_substruct.P, find_substruct.C, A;
expression CLK, HT, VT, VREF;
position POS;
@@
struct P A[...] =3D {
...,
{
	.C =3D {
		.clock =3D CLK@POS
		,...,
		.htotal =3D HT
		,...,
		.vtotal =3D VT
		,...,
		.vrefresh =3D VREF
	}
}
,...
};

@mode@
identifier M;
expression CLK, HT, VT, VREF;
position POS;
@@
struct drm_display_mode M =3D {
	.clock =3D CLK@POS
	,...,
	.htotal =3D HT
	,...,
	.vtotal =3D VT
	,...,
	.vrefresh =3D VREF
};

@modes@
identifier A;
expression CLK, HT, VT, VREF;
position POS;
@@
struct drm_display_mode A[...] =3D {
	...,
	{
	...,
	.clock =3D CLK@POS
	,...,
	.htotal =3D HT
	,...,
	.vtotal =3D VT
	,...,
	.vrefresh =3D VREF
	,...
	}
	,...
};

@script:python@
ht << mode.HT;
vt << mode.VT;
clk << mode.CLK;
vref << mode.VREF;
m << mode.M;
pos << mode.POS;
@@
def mode_vrefresh(clk, ht, vt):
    return int(eval(clk)*1000.0/(eval(ht)*eval(vt))+0.5)
if mode_vrefresh(clk, ht, vt) !=3D eval(vref):
   print "{}:{}/{}: {} vs. {} (.clock=3D{} .htotal=3D{} .vtotal=3D{})".form=
at(pos[0].file, pos[0].line, m, vref, mode_vrefresh(clk, ht, vt), clk, ht, =
vt)

@script:python@
ht << submode.HT;
vt << submode.VT;
clk << submode.CLK;
vref << submode.VREF;
m << submode.M;
pos << submode.POS;
@@
def mode_vrefresh(clk, ht, vt):
    return int(eval(clk)*1000.0/(eval(ht)*eval(vt))+0.5)
if mode_vrefresh(clk, ht, vt) !=3D eval(vref):
   print "{}:{}/{}: {} vs. {} (.clock=3D{} .htotal=3D{} .vtotal=3D{})".form=
at(pos[0].file, pos[0].line, m, vref, mode_vrefresh(clk, ht, vt), clk, ht, =
vt)

@script:python@
ht << modes.HT;
vt << modes.VT;
clk << modes.CLK;
vref << modes.VREF;
m << modes.A;
pos << modes.POS;
@@
def mode_vrefresh(clk, ht, vt):
    return int(eval(clk)*1000.0/(eval(ht)*eval(vt))+0.5)
if mode_vrefresh(clk, ht, vt) !=3D eval(vref):
   print "{}:{}/{}[]: {} vs. {} (.clock=3D{} .htotal=3D{} .vtotal=3D{})".fo=
rmat(pos[0].file, pos[0].line, m, vref, mode_vrefresh(clk, ht, vt), clk, ht=
, vt)

@script:python@
ht << submodes.HT;
vt << submodes.VT;
clk << submodes.CLK;
vref << submodes.VREF;
m << submodes.A;
pos << submodes.POS;
@@
def mode_vrefresh(clk, ht, vt):
    return int(eval(clk)*1000.0/(eval(ht)*eval(vt))+0.5)
if mode_vrefresh(clk, ht, vt) !=3D eval(vref):
   print "{}:{}/{}[]: {} vs. {} (.clock=3D{} .htotal=3D{} .vtotal=3D{})".fo=
rmat(pos[0].file, pos[0].line, m, vref, mode_vrefresh(clk, ht, vt), clk, ht=
, vt)

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
