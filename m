Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D59B263E8E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CF36E21F;
	Thu, 10 Sep 2020 07:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CB16EB9A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 15:04:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6D1C6393;
 Wed,  9 Sep 2020 11:04:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 09 Sep 2020 11:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=qPXNbOVazcgxsg6+JeWX+VnWiiB
 jtTnV3Z2+pmruXeQ=; b=cBsVWZ+i/XcwL1YLjlsv+HoWVmbwvfrNL+XrErVm+hA
 tte3bp1eqpu1Lw2zq3KoZhkcZ7q++GOq5z+2QbQeO7Y9PoDfcT7OJNch6fNDYodT
 fZgvi1LTdqDOvSnDomazLBrsB8RTc/JT959WQ/V7l4gq1EFG1mvtIUsAW0pGhIC0
 yd3YPC3B+6mIzwhfsLipRivky/c+sQ36R1KmU5RerkBWwVKRN9QSTfjVDqbV/2mo
 HgZgJsgVdb6eaujrSJsokFrYf1/Y4jKPcNxIjGwBFd9tWlYsMRdSIsprC+OUnGPG
 kTif2GVxTW/EOEwMC0bkRSigbbpyDtTUJYLE1ceFeMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qPXNbO
 Vazcgxsg6+JeWX+VnWiiBjtTnV3Z2+pmruXeQ=; b=lE/BSsleGIl9tL/3GHb32d
 5p1QmwKKGzArYqqP/PPCtZdBjoIzp4vYvnuIdT8uqF3oyuA4WjjYZEYLzur9XPEW
 r+FTGO+yOWANZr2K64kWCbeh2CWZQM0GvROTY5cPc3dO3CEbgeqEY+pvySKooTfT
 JB9eL7uEGQQcEZ8cEBjdUNUiOtHwVKEyQqzBWtP3b3JfzX6jlN7PqixZM99I8GUO
 0yCiCiwXoUfffeIX4OTLCS8GzJ8oL232448/yM1zPZPZh/BD0tphZRTjEcVY20Ba
 Rj+ENiz07uh39OD6ugvoXeQxjj/UyQTMbQdGUWPmgKXX+Hg0B6DruQdhWsoG9Wng
 ==
X-ME-Sender: <xms:6u5YX65W8QfkPr2-0LOpM4qawwaOuqKm5W8NmKZZnPoSY2JCihJdow>
 <xme:6u5YXz5YAEoaBmhvawuBMW9d27GdAeMtK4igU6yqZ_ZYkK5ze_dWB0oNosikakBev
 hQYllIarwSDXDc45Kc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6u5YX5ee9eXQcwuVDx5QA_dt9eOsMUh16UXGPCbjC7aSa8lG2pkgMg>
 <xmx:6u5YX3KcJwBkQhDphw8EByLAcEIu36zRmXGf0c8yy8QuDBMshCt-fA>
 <xmx:6u5YX-LMx_gheJsvpxZW2ypQ8GMTwxUNiTd6xFkx9SFkbqLuTeGniQ>
 <xmx:7O5YXzF66CWIOYJgH8bplUNYp9BfG6iCqI_h5amkbKRb-wal0ElkaA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D3933280065;
 Wed,  9 Sep 2020 11:04:09 -0400 (EDT)
Date: Wed, 9 Sep 2020 17:04:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] drm/vc4/vc4_hdmi: fill ASoC card owner
Message-ID: <20200909150407.phg65hsz6otq7q6t@gilmour.lan>
References: <CGME20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba@eucas1p1.samsung.com>
 <20200701073949.28941-1-m.szyprowski@samsung.com>
 <89bb3b69-2c81-3f83-da68-0e3b9a068cf5@i2se.com>
 <b31f4a5e-98ec-cf57-5aaa-38df273d56d9@samsung.com>
 <ed8cf631-bdd4-9ad0-4339-a4cf2f42e77d@i2se.com>
 <7567f23e-4b37-f187-b827-36bddfda27d4@i2se.com>
MIME-Version: 1.0
In-Reply-To: <7567f23e-4b37-f187-b827-36bddfda27d4@i2se.com>
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============0704144919=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0704144919==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3vpt4cj5bszoxrvt"
Content-Disposition: inline


--3vpt4cj5bszoxrvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 02:38:19PM +0200, Stefan Wahren wrote:
> Am 10.07.20 um 11:47 schrieb Stefan Wahren:
> > Hi Marek,
> >
> > Am 02.07.20 um 08:58 schrieb Marek Szyprowski:
> >> On 01.07.2020 20:49, Stefan Wahren wrote:
> >>> Am 01.07.20 um 09:39 schrieb Marek Szyprowski:
> >>>> card->owner is a required property and since commit 81033c6b584b ("A=
LSA:
> >>>> core: Warn on empty module") a warning is issued if it is empty. Fix=
 lack
> >>>> of it. This fixes following warning observed on RaspberryPi 3B board
> >>>> with ARM 32bit kernel and multi_v7_defconfig:
> >>>>
> >>>> ------------[ cut here ]------------
> >>>> WARNING: CPU: 1 PID: 210 at sound/core/init.c:207 snd_card_new+0x378=
/0x398 [snd]
> >>>> Modules linked in: vc4(+) snd_soc_core ac97_bus snd_pcm_dmaengine bl=
uetooth snd_pcm snd_timer crc32_arm_ce raspberrypi_hwmon snd soundcore ecdh=
_generic ecc bcm2835_thermal phy_generic
> >>>> CPU: 1 PID: 210 Comm: systemd-udevd Not tainted 5.8.0-rc1-00027-g810=
33c6b584b #1087
> >>>> Hardware name: BCM2835
> >>>> [<c03113c0>] (unwind_backtrace) from [<c030bcb4>] (show_stack+0x10/0=
x14)
> >>>> [<c030bcb4>] (show_stack) from [<c071cef8>] (dump_stack+0xd4/0xe8)
> >>>> [<c071cef8>] (dump_stack) from [<c0345bfc>] (__warn+0xdc/0xf4)
> >>>> [<c0345bfc>] (__warn) from [<c0345cc4>] (warn_slowpath_fmt+0xb0/0xb8)
> >>>> [<c0345cc4>] (warn_slowpath_fmt) from [<bf02ff74>] (snd_card_new+0x3=
78/0x398 [snd])
> >>>> [<bf02ff74>] (snd_card_new [snd]) from [<bf11f0b4>] (snd_soc_bind_ca=
rd+0x280/0x99c [snd_soc_core])
> >>>> [<bf11f0b4>] (snd_soc_bind_card [snd_soc_core]) from [<bf12f000>] (d=
evm_snd_soc_register_card+0x34/0x6c [snd_soc_core])
> >>>> [<bf12f000>] (devm_snd_soc_register_card [snd_soc_core]) from [<bf16=
5654>] (vc4_hdmi_bind+0x43c/0x5f4 [vc4])
> >>>> [<bf165654>] (vc4_hdmi_bind [vc4]) from [<c09d660c>] (component_bind=
_all+0xec/0x24c)
> >>>> [<c09d660c>] (component_bind_all) from [<bf15c44c>] (vc4_drm_bind+0x=
d4/0x174 [vc4])
> >>>> [<bf15c44c>] (vc4_drm_bind [vc4]) from [<c09d6ac0>] (try_to_bring_up=
_master+0x160/0x1b0)
> >>>> [<c09d6ac0>] (try_to_bring_up_master) from [<c09d6f38>] (component_m=
aster_add_with_match+0xd0/0x104)
> >>>> [<c09d6f38>] (component_master_add_with_match) from [<bf15c588>] (vc=
4_platform_drm_probe+0x9c/0xbc [vc4])
> >>>> [<bf15c588>] (vc4_platform_drm_probe [vc4]) from [<c09df740>] (platf=
orm_drv_probe+0x6c/0xa4)
> >>>> [<c09df740>] (platform_drv_probe) from [<c09dd6f0>] (really_probe+0x=
210/0x350)
> >>>> [<c09dd6f0>] (really_probe) from [<c09dd940>] (driver_probe_device+0=
x5c/0xb4)
> >>>> [<c09dd940>] (driver_probe_device) from [<c09ddb38>] (device_driver_=
attach+0x58/0x60)
> >>>> [<c09ddb38>] (device_driver_attach) from [<c09ddbc0>] (__driver_atta=
ch+0x80/0xbc)
> >>>> [<c09ddbc0>] (__driver_attach) from [<c09db820>] (bus_for_each_dev+0=
x68/0xb4)
> >>>> [<c09db820>] (bus_for_each_dev) from [<c09dc9f8>] (bus_add_driver+0x=
130/0x1e8)
> >>>> [<c09dc9f8>] (bus_add_driver) from [<c09de648>] (driver_register+0x7=
8/0x110)
> >>>> [<c09de648>] (driver_register) from [<c0302038>] (do_one_initcall+0x=
50/0x220)
> >>>> [<c0302038>] (do_one_initcall) from [<c03db544>] (do_init_module+0x6=
0/0x210)
> >>>> [<c03db544>] (do_init_module) from [<c03da4f8>] (load_module+0x1e34/=
0x2338)
> >>>> [<c03da4f8>] (load_module) from [<c03dac00>] (sys_finit_module+0xac/=
0xbc)
> >>>> [<c03dac00>] (sys_finit_module) from [<c03000c0>] (ret_fast_syscall+=
0x0/0x54)
> >>>> Exception stack(0xeded9fa8 to 0xeded9ff0)
> >>>> ...
> >>>> ---[ end trace 6414689569c2bc08 ]---
> >>>>
> >>>> Suggested-by: Takashi Iwai <tiwai@suse.de>
> >>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> >>> thanks for this patch. Any chance for a fixes tag here?
> >> Fixes: bb7d78568814 ("drm/vc4: Add HDMI audio support")
> > Thanks
>=20
> gentle ping ...

I just applied it, thanks!
Maxime

--3vpt4cj5bszoxrvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1ju5wAKCRDj7w1vZxhR
xVjGAP0YvfFBEH+M8w4EkTJBbzx730B7pxL7+o9Hk1Rx+i7QmgD+J1rMg1nWwQW6
+AmtlBwjUhf1jU1bVnQDUuPNeMWMEw4=
=cRib
-----END PGP SIGNATURE-----

--3vpt4cj5bszoxrvt--

--===============0704144919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0704144919==--
