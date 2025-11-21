Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D169FC7A945
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC7B10E8B4;
	Fri, 21 Nov 2025 15:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ceu8+g13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4BF10E8B4;
 Fri, 21 Nov 2025 15:36:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 042D3440BE;
 Fri, 21 Nov 2025 15:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8AEC4CEFB;
 Fri, 21 Nov 2025 15:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763739390;
 bh=lWuLVenJKkLEgjRtw8bvYDlbrmQjet1dy6d8UIrQrIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ceu8+g13S+LHvG87Ljb6TZY0GotCkwGAVlGj3qS9kq/73QNpRVFulmqPo8f+okvVl
 9ySOQA3l8fvGd6ZG/HcVJKOPGTorcifBAJ4KBYPUMj2DmdkV36lXbhSoizjE8B40lS
 +DUrbuXmNm0weHELJgUWFxFiI2ip8j90uldIBs3OpfYD0ZyL42KDcDB2lbNEZMFpzb
 yV9c9yb3XkfnXjOZVGb/F/TxgpojdVAYf0v/bt0PssAco7GgfmE8q5UxsFpb7+QCeK
 AkdHbCDLi5+pkvykkhakk6Sak9NVsnMZhc7uGo25BgTvbdWvamWx5E4hbrQAPX3sJ2
 kt59m+8aiG7uw==
Date: Fri, 21 Nov 2025 16:36:28 +0100
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
Message-ID: <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
References: <20250910-didactic-honored-chachalaca-f233b2@houat>
 <x562ueky2z5deqqmhl222moyrbylfwi35u4hb34dpl3z52ra4c@dyw4iayrewnz>
 <20250925-fervent-merry-beagle-2baba3@penduick>
 <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tq4owaozhbtfwo2u"
Content-Disposition: inline
In-Reply-To: <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
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


--tq4owaozhbtfwo2u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Tue, Oct 14, 2025 at 06:48:19PM +0300, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 02:59:43PM +0200, Maxime Ripard wrote:
> > On Fri, Oct 03, 2025 at 06:54:47PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, Oct 03, 2025 at 03:22:23PM +0200, Maxime Ripard wrote:
> > > > On Tue, Sep 30, 2025 at 10:02:28AM +0300, Dmitry Baryshkov wrote:
> > > > > On Mon, Sep 29, 2025 at 03:00:04PM +0200, Maxime Ripard wrote:
> > > > > > On Thu, Sep 25, 2025 at 05:16:07PM +0300, Dmitry Baryshkov wrot=
e:
> > > > > > > On Thu, Sep 25, 2025 at 03:13:47PM +0200, Maxime Ripard wrote:
> > > > > > > > On Wed, Sep 10, 2025 at 06:26:56PM +0300, Dmitry Baryshkov =
wrote:
> > > > > > > > > On Wed, Sep 10, 2025 at 09:30:19AM +0200, Maxime Ripard w=
rote:
> > > > > > > > > > On Wed, Sep 03, 2025 at 03:03:43AM +0300, Dmitry Barysh=
kov wrote:
> > > > > > > > > > > On Tue, Sep 02, 2025 at 08:06:54PM +0200, Maxime Ripa=
rd wrote:
> > > > > > > > > > > > On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Ba=
ryshkov wrote:
> > > > > > > > > > > > > On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime =
Ripard wrote:
> > > > > > > > > > > > > > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitr=
y Baryshkov wrote:
> > > > > > > > > > > > > > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Dan=
iel Stone wrote:
> > > > > > > > > > > > > > > > Hi Dmitry,
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Barysh=
kov
> > > > > > > > > > > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > > > > > > > > > > It's not uncommon for the particular devi=
ce to support only a subset of
> > > > > > > > > > > > > > > > > HDMI InfoFrames. It's not a big problem f=
or the kernel, since we adopted
> > > > > > > > > > > > > > > > > a model of ignoring the unsupported Infof=
rames, but it's a bigger
> > > > > > > > > > > > > > > > > problem for the userspace: we end up havi=
ng files in debugfs which do
> > > > > > > > > > > > > > > > > mot match what is being sent on the wire.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Sort that out, making sure that all inter=
faces are consistent.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > Thanks for the series, it's a really good c=
leanup.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > I know that dw-hdmi-qp can support _any_ in=
foframe, by manually
> > > > > > > > > > > > > > > > packing it into the two GHDMI banks. So the=
 supported set there is
> > > > > > > > > > > > > > > > 'all of the currently well-known ones, plus=
 any two others, but only
> > > > > > > > > > > > > > > > two and not more'. I wonder if that has any=
 effect on the interface
> > > > > > > > > > > > > > > > you were thinking about for userspace?
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > I was mostly concerned with the existing debu=
gfs interface (as it is
> > > > > > > > > > > > > > > also used e.g. for edid-decode, etc).
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > It seems "everything + 2 spare" is more or le=
ss common (ADV7511, MSM
> > > > > > > > > > > > > > > HDMI also have those. I don't have at hand th=
e proper datasheet for
> > > > > > > > > > > > > > > LT9611 (non-UXC one), but I think its InfoFra=
mes are also more or less
> > > > > > > > > > > > > > > generic).  Maybe we should change debugfs int=
egration to register the
> > > > > > > > > > > > > > > file when the frame is being enabled and remo=
ving it when it gets unset.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > But, like, for what benefit?
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > It's a debugfs interface for userspace to consu=
me. The current setup
> > > > > > > > > > > > > > works fine with edid-decode already. Why should=
 we complicate the design
> > > > > > > > > > > > > > that much and create fun races like "I'm runnin=
g edid-decode in parallel
> > > > > > > > > > > > > > to a modeset that would remove the file I just =
opened, what is the file
> > > > > > > > > > > > > > now?".
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Aren't we trading that with the 'I'm running edid=
-decode in paralle with
> > > > > > > > > > > > > to a modeset and the file suddenly becomes empty'?
> > > > > > > > > > > >=20
> > > > > > > > > > > > In that case, you know what the file is going to be=
: empty. And you went
> > > > > > > > > > > > from a racy, straightforward, design to a racy, com=
plicated, design.
> > > > > > > > > > > >=20
> > > > > > > > > > > > It was my question before, but I still don't really=
 see what benefits it
> > > > > > > > > > > > would have, and why we need to care about it in the=
 core, when it could
> > > > > > > > > > > > be dealt with in the drivers just fine on a case by=
 case basis.
> > > > > > > > > > >=20
> > > > > > > > > > > Actually it can not: debugfs files are registered fro=
m the core, not
> > > > > > > > > > > from the drivers. That's why I needed all the support=
ed_infoframes
> > > > > > > > > > > (which later became software_infoframes).
> > > > > > > > > >=20
> > > > > > > > > > That's one thing we can change then.
> > > > > > > > > >=20
> > > > > > > > > > > Anyway, I'm fine with having empty files there.
> > > > > > > > > > >=20
> > > > > > > > > > > > > > > Then in the long run we can add 'slots' and a=
llocate some of the frames
> > > > > > > > > > > > > > > to the slots. E.g. ADV7511 would get 'softwar=
e AVI', 'software SPD',
> > > > > > > > > > > > > > > 'auto AUDIO' + 2 generic slots (and MPEG Info=
Frame which can probably be
> > > > > > > > > > > > > > > salvaged as another generic one)). MSM HDMI w=
ould get 'software AVI',
> > > > > > > > > > > > > > > 'software AUDIO' + 2 generic slots (+MPEG + o=
bsucre HDMI which I don't
> > > > > > > > > > > > > > > want to use). Then the framework might be abl=
e to prioritize whether to
> > > > > > > > > > > > > > > use generic slots for important data (as DRM =
HDR, HDMI) or less important
> > > > > > > > > > > > > > > (SPD).
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Why is it something for the framework to deal w=
ith? If you want to have
> > > > > > > > > > > > > > extra infoframes in there, just go ahead and cr=
eate additional debugfs
> > > > > > > > > > > > > > files in your driver.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > If you want to have the slot mechanism, check i=
n your atomic_check that
> > > > > > > > > > > > > > only $NUM_SLOT at most infoframes are set.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > The driver can only decide that 'we have VSI, SPD=
 and DRM InfoFrames
> > > > > > > > > > > > > which is -ETOOMUCH for 2 generic slots'. The fram=
ework should be able to
> > > > > > > > > > > > > decide 'the device has 2 generic slots, we have H=
DR data, use VSI and
> > > > > > > > > > > > > DRM InfoFrames and disable SPD for now'.
> > > > > > > > > > > >=20
> > > > > > > > > > > > I mean... the spec does? The spec says when a parti=
cular feature
> > > > > > > > > > > > requires to send a particular infoframe. If your de=
vice cannot support
> > > > > > > > > > > > to have more than two "features" enabled at the sam=
e time, so be it. It
> > > > > > > > > > > > something that should be checked in that driver ato=
mic_check.
> > > > > > > > > > >=20
> > > > > > > > > > > Sounds good to me. Let's have those checks in the dri=
vers until we
> > > > > > > > > > > actually have seveal drivers performing generic frame=
 allocation.
> > > > > > > > > > >=20
> > > > > > > > > > > > Or just don't register the SPD debugfs file, ignore=
 it, put a comment
> > > > > > > > > > > > there, and we're done too.
> > > > > > > > > > >=20
> > > > > > > > > > > It's generic code.
> > > > > > > > > > >=20
> > > > > > > > > > > > > But... We are not there yet and I don't have clea=
r usecase (we support
> > > > > > > > > > > > > HDR neither on ADV7511 nor on MSM HDMI, after car=
efully reading the
> > > > > > > > > > > > > guide I realised that ADV7511 has normal audio in=
foframes). Maybe I
> > > > > > > > > > > > > should drop all the 'auto' features, simplifying =
this series and land
> > > > > > > > > > > > > [1] for LT9611UXC as I wanted origianlly.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > [1] https://lore.kernel.org/dri-devel/20250803-lt=
9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
> > > > > > > > > > > >=20
> > > > > > > > > > > > Looking back at that series, I think it still has v=
alue to rely on the
> > > > > > > > > > > > HDMI infrastructure at the very least for the atomi=
c_check sanitization.
> > > > > > > > > > > >=20
> > > > > > > > > > > > But since you wouldn't use the generated infoframes=
, just skip the
> > > > > > > > > > > > debugfs files registration. You're not lying to use=
rspace anymore, and
> > > > > > > > > > > > you get the benefits of the HDMI framework.
> > > > > > > > > > >=20
> > > > > > > > > > > We create all infoframe files for all HDMI connectors.
> > > > > > > > > >=20
> > > > > > > > > > Then we can provide a debugfs_init helper to register a=
ll of them, or
> > > > > > > > > > only some of them, and let the drivers figure it out.
> > > > > > > > > >=20
> > > > > > > > > > Worst case scenario, debugfs files will not get created=
, which is a much
> > > > > > > > > > better outcome than having to put boilerplate in every =
driver that will
> > > > > > > > > > get inconsistent over time.
> > > > > > > > >=20
> > > > > > > > > debugfs_init() for each infoframe or taking some kind of =
bitmask?
> > > > > > > >=20
> > > > > > > > I meant turning hdmi_debugfs_add and create_hdmi_*_infofram=
e_file into
> > > > > > > > public helpers. That way, drivers that don't care can use t=
he (renamed)
> > > > > > > > hdmi_debugfs_add, and drivers with different constraints ca=
n register
> > > > > > > > the relevant infoframes directly.
> > > > > > >=20
> > > > > > > Doesn't that mean more boilerplate?
> > > > > >=20
> > > > > > I don't think it would? In the general case, it wouldn't change
> > > > > > anything, and in special cases, then it's probably going to be =
different
> > > > > > from one driver to the next so there's not much we can do.
> > > > > >=20
> > > > > > > In the end, LT9611UXC is a special case, for which I'm totall=
y fine
> > > > > > > not to use HDMI helpers at this point: we don't control infof=
rames
> > > > > > > (hopefully that can change), we don't care about the TMDS clo=
ck, no
> > > > > > > CEC, etc.
> > > > > >=20
> > > > > > Not using the helpers sound pretty reasonable here too.
> > > > > >=20
> > > > > > > For all other usecases I'm fine with having atomic_check() un=
set all
> > > > > > > unsupported infoframes and having empty files in debugfs. The=
n we can
> > > > > > > evolve over the time, once we see a pattern. We had several d=
rivers
> > > > > > > which had very limited infoframes support, but I think this n=
ow gets
> > > > > > > sorted over the time.
> > > > > >=20
> > > > > > I never talked about atomic_check()? You were initially concern=
ed that
> > > > > > the framework would expose data in debugfs that it's not using.=
 Not
> > > > > > registering anything in debugfs solves that, but I'm not sure w=
e need to
> > > > > > special case atomic_check.
> > > > >=20
> > > > > Well... I ended up with [1], handling infoframes in the atomic_ch=
eck()
> > > > > rather than registering fewer infoframe debugfs files. This way d=
evice
> > > > > state is consistent, we don't have enabled instances, etc. Howeve=
r it
> > > > > results in repetetive code in atomic_check().
> > > > >=20
> > > > > [1] https://lore.kernel.org/dri-devel/20250928-limit-infoframes-2=
-v2-0-6f8f5fd04214@oss.qualcomm.com/
> > > >=20
> > > > I guess we can continue the discussion there, but I'm not sure we w=
ant
> > > > to have more boilerplate in drivers, and especially in the atomic_c=
heck
> > > > part. If drivers are inconsistent or wrong in the debugfs path, the=
re's
> > > > no major issue. If they are wrong in the atomic_check path, it will=
 lead
> > > > to regressions, possibly in paths that are pretty hard to test.
> > >=20
> > > You've responded there and I can drop the extra handling for HDR DRM =
and
> > > audio infoframes in the atomic_check(). What is your opinion about the
> > > atomic_check() unsetting the infoframe->set for SPD and HDMI infofram=
es?
> >=20
> > HDMI infoframes are mandatory, so that's a big no-no.
>=20
> Nevertheless... There are drivers (sun4i, inno_hdmi, rk3066, dw_hdmi_qp)
> which don't (yet) implement VSI support.

We should really differentiate drivers that didn't because they were
allowed to, and drivers that can't.

For the bridge you mentioned earlier in the discussion, it makes sense
not to expose the debugfs file because we simply don't have access to
the actual content. That's fine.

For the drivers you listed there, I'm pretty confident that it's because
nobody really tried. That's definitely not fine, and we should complain
as loudly as possible for that particular case, and not give them a free
pass. Checking sun4i, I'm pretty sure it can be implemented. Looking at
the incomplete RK3066 TRM, it can be implemented too. And inno_hdmi
looks really similar.

So it's not really impossible, you just need some hardware and a day's
worth of work.

There's no reason these should get a pass, it's breaking the spec for no
reason.

> > For SPD, It's really not clear to me why atomic_check should do that in
> > the first place. Your initial concern was about exposing infoframes in
> > debugfs that wouldn't be used by the driver.
> >=20
> > If the driver doesn't register a debugfs file for SPD, and ignores
> > whatever is in the atomic state, what's should we force drivers to do
> > that?
>=20
> I really don't think that drivers should mess up with debugfs on their
> own. Making atomic_check() disable the unsupported InfoFrames makes the
> picture perfect: the DRM no longer tries to program them to the
> hardware, DebugFS files stay empty, so the whole state becomes
> consistent.

In the "bridge has no access to infoframes" case, there's really no
infoframe. An empty file is "the infoframe can be there but isn't used",
not "we don't have access to it and can't report them". Only drivers
have those infos.

If we do split up write_infoframe into multiple functions though, I
guess we could create the debugfs file only if the function pointer is
set, which removes drivers' involvement if you don't like that.

Maxime

--tq4owaozhbtfwo2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSCG9wAKCRAnX84Zoj2+
dgHcAYChZXS8/sDSP13xaJgToPlixnWoWmtI+kH7yj0hnpv8gaGh3Jap1t5HqNj7
m9QaWOIBgPyup7rEf7cYmTsuDrTw1nKUntqcM7099UDx1Ch0HyrILuGmU7aPJkMZ
4wEgN/dJzA==
=QtU3
-----END PGP SIGNATURE-----

--tq4owaozhbtfwo2u--
