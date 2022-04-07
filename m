Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710524F7917
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBB010E9DC;
	Thu,  7 Apr 2022 08:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8175210E9DC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:08:40 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4F8CD3200F76;
 Thu,  7 Apr 2022 04:08:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 07 Apr 2022 04:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=Chl4cDWyY0KsicbwApDGZdpJ6M+ZcBREsNUUve
 fcbm0=; b=WA5RoPAN5Nrv1KgLZ7NVeIrb9EYztKHEEYBN+NtMlOlagKPCmRE7YU
 z5ElRR/uTGBE4KzjM7+4v5U5fVSJ0qAci+Tpnkri7Sm+x5sRT/KPuRnNZGoj3n5K
 mCAFooOfcMa5gVLH1AphRon6p3JESScnH+7eJKRZIAWdJtU81d8lOwSEJqqYL4Ws
 FBPcNJDhAG6FQXUXEMkq4RTwZdTlGqTdSs6eT2YnbPcV7QQZ/juSrLDvXpmwpyLa
 La72/i+tyuKCgX564Tq+ok4QuT3Le7HlJpZMPpJ1jWyshA3Q9a80QzcRtH/LlRtV
 /xMauBHE1qPPcQCNhlkRDtLE6FDBFWHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Chl4cDWyY0KsicbwA
 pDGZdpJ6M+ZcBREsNUUvefcbm0=; b=eHBSZ04P+oOavaPDxazxKr9GD3v6OKdj3
 IEJz9WbWREGgGs9O0RvsjGLBm2Jfwc4TqMxgrwrhnSVR1+ZiE98vlNg3GmPmTWz0
 CmFw1qc+UoH23eHv+4qEwcZinJiiX1Se8DBGc6lQYr531fQHiSEJIPsYcR5eLq6o
 xIO84KSR6F2+P+xZf1W7/XtYbCFaklQEL7XDEue0KcLeunMQVZwZRPzIthCP71pp
 LSeI4CS3vpHn4B3C0FpU767zHlGWb/cQbKGOKeng+AJhv9J3g8lo5k1EFj/3YiZj
 gGA7Vi2zqZf6UiLQh+U4hIgNeavTp2LvMSiVGXrYZE+8Ry7lBjM6A==
X-ME-Sender: <xms:A5xOYrohDYZHFtscCrP6U9rQYNMjp3wf9yskMD7Ivk7fjWPxutPAwg>
 <xme:A5xOYlqUUot7adxJH9AGF524M9BJQPdM3iJTXFlNhEMgUT9kTpj_BE46rq2hZlmLf
 EVfGxD1Dlefjfn-mmA>
X-ME-Received: <xmr:A5xOYoNeykmlveyymZcv5z4cUojhiMDhCs7SXHPEpILkBhLiDQ5DNA9yBsSDgn0vO-i1ZqyJDXvsqVNfjBw4t0kuf7NFG1A4Ibxadl8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:A5xOYu5buzvS_ehuwm99sTLk78Vbfgyf5JfjyukUvIXdZUDbCYvKJw>
 <xmx:A5xOYq68CSNeCqBm9GwApeZ-pTqpQFGwEWC17aBHTitU94__CphuYA>
 <xmx:A5xOYmhG-P8CH5y4hQgmbtItsgTck8sd6VoeIELBH1xJJUMV6ZgCOg>
 <xmx:A5xOYsvtKXzUtblVAw4XMOheIeUXxGiSQCqJUgUt1dAZc-kf2zF9xA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 04:08:34 -0400 (EDT)
Date: Thu, 7 Apr 2022 10:08:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v7 04/12] clk: Always clamp the rounded rate
Message-ID: <20220407080833.fkieuqx3hgdnwqy2@houat>
References: <20220406183714.830218-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cbau266t7cdq6e2p"
Content-Disposition: inline
In-Reply-To: <20220406183714.830218-1-y.oudjana@protonmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cbau266t7cdq6e2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yassine,

On Thu, Apr 07, 2022 at 07:56:42AM +0000, Yassine Oudjana wrote:
> On Fri, 25 Feb 2022 15:35:26 +0100, Maxime Ripard <maxime@cerno.tech> wro=
te:
> > The current core while setting the min and max rate properly in the
> > clk_request structure will not make sure that the requested rate is
> > within these boundaries, leaving it to each and every driver to make
> > sure it is.
> >
> > It's not clear if this was on purpose or not, but this introduces some
> > inconsistencies within the API.
> >
> > For example, a user setting a range and then calling clk_round_rate()
> > with a value outside of that range will get the same value back
> > (ignoring any driver adjustements), effectively ignoring the range that
> > was just set.
> >
> > Another one, arguably worse, is that it also makes clk_round_rate() and
> > clk_set_rate() behave differently if there's a range and the rate being
> > used for both is outside that range. As we have seen, the rate will be
> > returned unchanged by clk_round_rate(), but clk_set_rate() will error
> > out returning -EINVAL.
> >
> > Let's make sure the framework will always clamp the rate to the current
> > range found on the clock, which will fix both these inconsistencies.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk.c      |  2 ++
> >  drivers/clk/clk_test.c | 50 +++++++++++++++++++++++++++---------------
> >  2 files changed, 34 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 112911138a7b..6c4e10209568 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1348,6 +1348,8 @@ static int clk_core_determine_round_nolock(struct=
 clk_core *core,
> >  	if (!core)
> >  		return 0;
> >
> > +	req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
> > +
>=20
> This breaks mmpll8_early on mmcc-msm8996, making GPU power up fail:
>=20
> ------------[ cut here ]------------
> mmpll8_early failed to enable!
> WARNING: CPU: 3 PID: 354 at drivers/clk/qcom/clk-alpha-pll.c:238 wait_for=
_pll+0xe8/0xfc
> Modules linked in: q6asm_dai(+) ath10k_pci(+) q6afe_dai q6routing venus_e=
nc panel_lgphilips_sw43101(+) venus_dec ath10k_core q6asm q6adm videobuf2_d=
ma_contig qcom_camss snd_q6dsp_common snd_soc_wcd9335 q6afe snd_soc_apq8096=
 msm q6core ath regmap_slimbus v4l2_fwnode snd_soc_qcom_common apr snd_soc_=
core v4l2_async mac80211 venus_core videobuf2_dma_sg snd_compress v4l2_mem2=
mem videobuf2_memops videobuf2_v4l2 snd_pcm nxp_nci_i2c videobuf2_common li=
barc4 nxp_nci snd_timer gpu_sched videodev hci_uart drm_dp_helper snd i2c_q=
com_cci nci btqca drm_kms_helper mc soundcore nfc syscopyarea sysfillrect b=
luetooth slim_qcom_ngd_ctrl sysimgblt pdr_interface fb_sys_fops slimbus lzo=
_rle qcom_spmi_haptics qcom_q6v5_mss qcom_spmi_temp_alarm qcom_q6v5_pas ind=
ustrialio qcom_pil_info qcom_common qcom_q6v5 qcom_sysmon qmi_helpers mdt_l=
oader socinfo pwm_ir_tx rmtfs_mem cfg80211 rfkill zram atmel_mxt_ts drm drm=
_panel_orientation_quirks ip_tables
> CPU: 3 PID: 354 Comm: systemd-udevd Not tainted 5.18.0-rc1+ #361
> Hardware name: Xiaomi Mi Note 2 (DT)
> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : wait_for_pll+0xe8/0xfc
> lr : wait_for_pll+0xe8/0xfc
> sp : ffff80000b01b250
> x29: ffff80000b01b250 x28: ffff0000ae071960 x27: ffff000096a9ec00
> x26: ffff0000801d7cf4 x25: 00000001cd074651 x24: 0000000000000000
> x23: ffff800009129090 x22: ffff8000090d7c30 x21: 0000000000000000
> x20: 0000000080000000 x19: ffff8000097b4598 x18: 0000000000000ca8
> x17: 00000000000032a0 x16: 0000000000000007 x15: 00000000ffffffff
> x14: 0000000000000001 x13: 0000000000000020 x12: fffffffffffcaebf
> x11: ffff80000968afb0 x10: 000000000000000a x9 : ffff80000815bcc8
> x8 : 000000000000000a x7 : 0000000000000006 x6 : 000000000000000c
> x5 : ffff0000fdd16990 x4 : 0000000000000000 x3 : 0000000000000027
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000857e3b00
> Call trace:
>  wait_for_pll+0xe8/0xfc
>  clk_alpha_pll_enable+0x118/0x150
>  clk_core_enable+0x78/0x290
>  clk_core_enable+0x58/0x290
>  clk_core_enable+0x58/0x290
>  clk_core_enable+0x58/0x290
>  clk_enable+0x38/0x60
>  clk_bulk_enable+0x48/0xb0
>  msm_gpu_pm_resume+0xb4/0x20c [msm]
>  a5xx_pm_resume+0x28/0x200 [msm]
>  adreno_resume+0x2c/0x40 [msm]
>  pm_generic_runtime_resume+0x38/0x50
>  __genpd_runtime_resume+0x38/0x90
>  genpd_runtime_resume+0xa4/0x2cc
>  __rpm_callback+0x50/0x180
>  rpm_callback+0x74/0x80
>  rpm_resume+0x434/0x6b0
>  __pm_runtime_resume+0x64/0xb0
>  adreno_load_gpu+0x68/0x1b0 [msm]
>  msm_open+0xf0/0x100 [msm]
>  drm_file_alloc+0x150/0x234 [drm]
>  drm_client_init+0xdc/0x180 [drm]
>  drm_fb_helper_init+0x60/0x70 [drm_kms_helper]
>  msm_fbdev_init+0x6c/0x100 [msm]
>  msm_drm_bind+0x56c/0x640 [msm]
>  try_to_bring_up_aggregate_device+0x230/0x320
>  __component_add+0xac/0x194
>  component_add+0x20/0x30
>  dsi_dev_attach+0x2c/0x3c [msm]
>  dsi_host_attach+0xa0/0x154 [msm]
>  mipi_dsi_attach+0x34/0x50
>  sw43101_probe+0x144/0x200 [panel_lgphilips_sw43101]
>  mipi_dsi_drv_probe+0x2c/0x40
>  really_probe+0x184/0x3d0
>  __driver_probe_device+0x11c/0x190
>  driver_probe_device+0x44/0xf4
>  __driver_attach+0xd8/0x1f0
>  bus_for_each_dev+0x7c/0xe0
>  driver_attach+0x30/0x40
>  bus_add_driver+0x150/0x230
>  driver_register+0x84/0x140
>  mipi_dsi_driver_register_full+0x64/0x70
>  sw43101_driver_init+0x2c/0x1000 [panel_lgphilips_sw43101]
>  do_one_initcall+0x50/0x2b0
>  do_init_module+0x50/0x260
>  load_module+0x229c/0x2ae0
>  __do_sys_finit_module+0xac/0x12c
>  __arm64_sys_finit_module+0x2c/0x3c
>  invoke_syscall+0x50/0x120
>  el0_svc_common.constprop.0+0xdc/0x100
>  do_el0_svc+0x34/0xa0
>  el0_svc+0x34/0xb0
>  el0t_64_sync_handler+0xa4/0x130
>  el0t_64_sync+0x18c/0x190
> ---[ end trace 0000000000000000 ]---
> Failed to enable clk 'core': -110
> msm 900000.mdss: [drm:adreno_load_gpu [msm]] *ERROR* Couldn't power up th=
e GPU: -110

Thanks for the report.

Are you sure it's that exact patch though? It looks like we're in a
separate path entirely, as clk_enable doesn't call
clk_round_rate/determine_rate.

I've been piling up few fixes already for other platforms, could you
also test ?

https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes

Thanks!
Maxime

--cbau266t7cdq6e2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYk6cAQAKCRDj7w1vZxhR
xYvoAP9V/wEFG74zsVyeefAvu6zQeUoA6LcuQ0jvaiyakLTqxwEAjKj7yiBrkoQQ
BrTz+tJ8DzMIC858nZP26oOztCTI3wI=
=s5DB
-----END PGP SIGNATURE-----

--cbau266t7cdq6e2p--
