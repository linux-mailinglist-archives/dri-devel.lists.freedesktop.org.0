Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE07BB6FCE
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 15:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B1E10E12A;
	Fri,  3 Oct 2025 13:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m1VoQoyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A0D10E10C;
 Fri,  3 Oct 2025 13:22:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 496B162157;
 Fri,  3 Oct 2025 13:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FC1C4CEF5;
 Fri,  3 Oct 2025 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759497746;
 bh=A2hluD0l8IO1DxEiF9nEW3SijizW71b1ccI60ZVifUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m1VoQoyZK+0q8O3HvyAtIGUuFnCbPyZhX1ioKmnkL3JAloHKE/f9yDYHV6zLFevmp
 xc05F6I9ufNwo20ENoPxDODObtxc3ePYLGeU8vWXoR/sq2wxJ36pc/j2q8tqW0L1nE
 C5kyoEcs5+6jD5rehK4U8rW2PXT4gNsLFbKHKPAOrp+Tgxzn0XL8VcDa10gYaWwuzL
 SmP+VPZBOK/p9PIZdQebasidslquTK2Zj7vHryqCeUV+xDH4c6l1351xGFwdkZKGpd
 beDZpivcGmRZr0qas8V9KKGrVKRX4iT2mV8JwdCoVric1qQfSB8GuVqlwBPJlJ4Pjv
 5v/wEfmefXb1w==
Date: Fri, 3 Oct 2025 15:22:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <20251003-uptight-echidna-of-stamina-815305@houat>
References: <20250901-voracious-classy-hedgehog-ee28ef@houat>
 <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
 <st6wob5hden6ypxt2emzokfhl3ezpbuypv2kdtf5zdrdhlyjfw@l2neflb4uupo>
 <pe6g2fanw65p67kfy5blbtiytngxmr6nkbazymojs4a66yvpl3@7j4ccnsvc6az>
 <20250910-didactic-honored-chachalaca-f233b2@houat>
 <x562ueky2z5deqqmhl222moyrbylfwi35u4hb34dpl3z52ra4c@dyw4iayrewnz>
 <20250925-fervent-merry-beagle-2baba3@penduick>
 <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xp6eesrwl3hc4z5s"
Content-Disposition: inline
In-Reply-To: <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
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


--xp6eesrwl3hc4z5s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Tue, Sep 30, 2025 at 10:02:28AM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 29, 2025 at 03:00:04PM +0200, Maxime Ripard wrote:
> > On Thu, Sep 25, 2025 at 05:16:07PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Sep 25, 2025 at 03:13:47PM +0200, Maxime Ripard wrote:
> > > > On Wed, Sep 10, 2025 at 06:26:56PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, Sep 10, 2025 at 09:30:19AM +0200, Maxime Ripard wrote:
> > > > > > On Wed, Sep 03, 2025 at 03:03:43AM +0300, Dmitry Baryshkov wrot=
e:
> > > > > > > On Tue, Sep 02, 2025 at 08:06:54PM +0200, Maxime Ripard wrote:
> > > > > > > > On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Baryshkov =
wrote:
> > > > > > > > > On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard w=
rote:
> > > > > > > > > > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Barysh=
kov wrote:
> > > > > > > > > > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Ston=
e wrote:
> > > > > > > > > > > > Hi Dmitry,
> > > > > > > > > > > >=20
> > > > > > > > > > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > > > > > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > > > > > > It's not uncommon for the particular device to su=
pport only a subset of
> > > > > > > > > > > > > HDMI InfoFrames. It's not a big problem for the k=
ernel, since we adopted
> > > > > > > > > > > > > a model of ignoring the unsupported Infoframes, b=
ut it's a bigger
> > > > > > > > > > > > > problem for the userspace: we end up having files=
 in debugfs which do
> > > > > > > > > > > > > mot match what is being sent on the wire.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Sort that out, making sure that all interfaces ar=
e consistent.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Thanks for the series, it's a really good cleanup.
> > > > > > > > > > > >=20
> > > > > > > > > > > > I know that dw-hdmi-qp can support _any_ infoframe,=
 by manually
> > > > > > > > > > > > packing it into the two GHDMI banks. So the support=
ed set there is
> > > > > > > > > > > > 'all of the currently well-known ones, plus any two=
 others, but only
> > > > > > > > > > > > two and not more'. I wonder if that has any effect =
on the interface
> > > > > > > > > > > > you were thinking about for userspace?
> > > > > > > > > > >=20
> > > > > > > > > > > I was mostly concerned with the existing debugfs inte=
rface (as it is
> > > > > > > > > > > also used e.g. for edid-decode, etc).
> > > > > > > > > > >=20
> > > > > > > > > > > It seems "everything + 2 spare" is more or less commo=
n (ADV7511, MSM
> > > > > > > > > > > HDMI also have those. I don't have at hand the proper=
 datasheet for
> > > > > > > > > > > LT9611 (non-UXC one), but I think its InfoFrames are =
also more or less
> > > > > > > > > > > generic).  Maybe we should change debugfs integration=
 to register the
> > > > > > > > > > > file when the frame is being enabled and removing it =
when it gets unset.
> > > > > > > > > >=20
> > > > > > > > > > But, like, for what benefit?
> > > > > > > > > >=20
> > > > > > > > > > It's a debugfs interface for userspace to consume. The =
current setup
> > > > > > > > > > works fine with edid-decode already. Why should we comp=
licate the design
> > > > > > > > > > that much and create fun races like "I'm running edid-d=
ecode in parallel
> > > > > > > > > > to a modeset that would remove the file I just opened, =
what is the file
> > > > > > > > > > now?".
> > > > > > > > >=20
> > > > > > > > > Aren't we trading that with the 'I'm running edid-decode =
in paralle with
> > > > > > > > > to a modeset and the file suddenly becomes empty'?
> > > > > > > >=20
> > > > > > > > In that case, you know what the file is going to be: empty.=
 And you went
> > > > > > > > from a racy, straightforward, design to a racy, complicated=
, design.
> > > > > > > >=20
> > > > > > > > It was my question before, but I still don't really see wha=
t benefits it
> > > > > > > > would have, and why we need to care about it in the core, w=
hen it could
> > > > > > > > be dealt with in the drivers just fine on a case by case ba=
sis.
> > > > > > >=20
> > > > > > > Actually it can not: debugfs files are registered from the co=
re, not
> > > > > > > from the drivers. That's why I needed all the supported_infof=
rames
> > > > > > > (which later became software_infoframes).
> > > > > >=20
> > > > > > That's one thing we can change then.
> > > > > >=20
> > > > > > > Anyway, I'm fine with having empty files there.
> > > > > > >=20
> > > > > > > > > > > Then in the long run we can add 'slots' and allocate =
some of the frames
> > > > > > > > > > > to the slots. E.g. ADV7511 would get 'software AVI', =
'software SPD',
> > > > > > > > > > > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame wh=
ich can probably be
> > > > > > > > > > > salvaged as another generic one)). MSM HDMI would get=
 'software AVI',
> > > > > > > > > > > 'software AUDIO' + 2 generic slots (+MPEG + obsucre H=
DMI which I don't
> > > > > > > > > > > want to use). Then the framework might be able to pri=
oritize whether to
> > > > > > > > > > > use generic slots for important data (as DRM HDR, HDM=
I) or less important
> > > > > > > > > > > (SPD).
> > > > > > > > > >=20
> > > > > > > > > > Why is it something for the framework to deal with? If =
you want to have
> > > > > > > > > > extra infoframes in there, just go ahead and create add=
itional debugfs
> > > > > > > > > > files in your driver.
> > > > > > > > > >=20
> > > > > > > > > > If you want to have the slot mechanism, check in your a=
tomic_check that
> > > > > > > > > > only $NUM_SLOT at most infoframes are set.
> > > > > > > > >=20
> > > > > > > > > The driver can only decide that 'we have VSI, SPD and DRM=
 InfoFrames
> > > > > > > > > which is -ETOOMUCH for 2 generic slots'. The framework sh=
ould be able to
> > > > > > > > > decide 'the device has 2 generic slots, we have HDR data,=
 use VSI and
> > > > > > > > > DRM InfoFrames and disable SPD for now'.
> > > > > > > >=20
> > > > > > > > I mean... the spec does? The spec says when a particular fe=
ature
> > > > > > > > requires to send a particular infoframe. If your device can=
not support
> > > > > > > > to have more than two "features" enabled at the same time, =
so be it. It
> > > > > > > > something that should be checked in that driver atomic_chec=
k.
> > > > > > >=20
> > > > > > > Sounds good to me. Let's have those checks in the drivers unt=
il we
> > > > > > > actually have seveal drivers performing generic frame allocat=
ion.
> > > > > > >=20
> > > > > > > > Or just don't register the SPD debugfs file, ignore it, put=
 a comment
> > > > > > > > there, and we're done too.
> > > > > > >=20
> > > > > > > It's generic code.
> > > > > > >=20
> > > > > > > > > But... We are not there yet and I don't have clear usecas=
e (we support
> > > > > > > > > HDR neither on ADV7511 nor on MSM HDMI, after carefully r=
eading the
> > > > > > > > > guide I realised that ADV7511 has normal audio infoframes=
). Maybe I
> > > > > > > > > should drop all the 'auto' features, simplifying this ser=
ies and land
> > > > > > > > > [1] for LT9611UXC as I wanted origianlly.
> > > > > > > > >=20
> > > > > > > > > [1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-=
hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
> > > > > > > >=20
> > > > > > > > Looking back at that series, I think it still has value to =
rely on the
> > > > > > > > HDMI infrastructure at the very least for the atomic_check =
sanitization.
> > > > > > > >=20
> > > > > > > > But since you wouldn't use the generated infoframes, just s=
kip the
> > > > > > > > debugfs files registration. You're not lying to userspace a=
nymore, and
> > > > > > > > you get the benefits of the HDMI framework.
> > > > > > >=20
> > > > > > > We create all infoframe files for all HDMI connectors.
> > > > > >=20
> > > > > > Then we can provide a debugfs_init helper to register all of th=
em, or
> > > > > > only some of them, and let the drivers figure it out.
> > > > > >=20
> > > > > > Worst case scenario, debugfs files will not get created, which =
is a much
> > > > > > better outcome than having to put boilerplate in every driver t=
hat will
> > > > > > get inconsistent over time.
> > > > >=20
> > > > > debugfs_init() for each infoframe or taking some kind of bitmask?
> > > >=20
> > > > I meant turning hdmi_debugfs_add and create_hdmi_*_infoframe_file i=
nto
> > > > public helpers. That way, drivers that don't care can use the (rena=
med)
> > > > hdmi_debugfs_add, and drivers with different constraints can regist=
er
> > > > the relevant infoframes directly.
> > >=20
> > > Doesn't that mean more boilerplate?
> >=20
> > I don't think it would? In the general case, it wouldn't change
> > anything, and in special cases, then it's probably going to be different
> > from one driver to the next so there's not much we can do.
> >=20
> > > In the end, LT9611UXC is a special case, for which I'm totally fine
> > > not to use HDMI helpers at this point: we don't control infoframes
> > > (hopefully that can change), we don't care about the TMDS clock, no
> > > CEC, etc.
> >=20
> > Not using the helpers sound pretty reasonable here too.
> >=20
> > > For all other usecases I'm fine with having atomic_check() unset all
> > > unsupported infoframes and having empty files in debugfs. Then we can
> > > evolve over the time, once we see a pattern. We had several drivers
> > > which had very limited infoframes support, but I think this now gets
> > > sorted over the time.
> >=20
> > I never talked about atomic_check()? You were initially concerned that
> > the framework would expose data in debugfs that it's not using. Not
> > registering anything in debugfs solves that, but I'm not sure we need to
> > special case atomic_check.
>=20
> Well... I ended up with [1], handling infoframes in the atomic_check()
> rather than registering fewer infoframe debugfs files. This way device
> state is consistent, we don't have enabled instances, etc. However it
> results in repetetive code in atomic_check().
>=20
> [1] https://lore.kernel.org/dri-devel/20250928-limit-infoframes-2-v2-0-6f=
8f5fd04214@oss.qualcomm.com/

I guess we can continue the discussion there, but I'm not sure we want
to have more boilerplate in drivers, and especially in the atomic_check
part. If drivers are inconsistent or wrong in the debugfs path, there's
no major issue. If they are wrong in the atomic_check path, it will lead
to regressions, possibly in paths that are pretty hard to test.

Maxime

--xp6eesrwl3hc4z5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/ODwAKCRAnX84Zoj2+
diGqAYCVf6AMoXhcU3VIb8z9xIngvdSuylZqphD9JtE/rS3QR8jtXs1A5G3e9kDf
b9g7FbABf0JcEMqoNM9n9pzN92QZ1DiCn8U+tdtLbXL6iPX0Iagrzdcxx1bfDwJN
nZSidYIWcw==
=Qw5/
-----END PGP SIGNATURE-----

--xp6eesrwl3hc4z5s--
