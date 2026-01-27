Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGNtJg8XeWmyvAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:50:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD309A207
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD4110E104;
	Tue, 27 Jan 2026 19:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kLQTvED4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887BF10E104;
 Tue, 27 Jan 2026 19:50:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C45E43D75;
 Tue, 27 Jan 2026 19:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF5AC116C6;
 Tue, 27 Jan 2026 19:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769543435;
 bh=UaKGXBQECE0SDe7XXMs88ifMfoexM+bNNiVKCwxPry8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kLQTvED4LlSKzw2nWBpeK5viX8ZbqC10mYv1QroLhWLVlCqz2iR1bg4yYnRhz/FNn
 UlXU0v6oTqeW3oYFDM8UA/Ntm5uOmB151/wgibG3XMZwTlzSCm3HoDhdp+9cTSuDAX
 jt9crfIprdiN//Qns45XzTb++v6Rc/OEHjxt157GG8V04Ct4M9GDnXgfXKn8fYBAIx
 Te3wrBDNMsAun6AI7V81/8dvy5LJ607YML0E+bJU//aMBkUrSL0mhN3XOOekOqHe9w
 y4AS+6Vynd0jQIuR1Mrpa4jR/rMBq0d/IxubsJkTUwkKRKqJGOqh+IXHAZ/qpZsJh/
 7WDwMYHNnLQxQ==
Date: Tue, 27 Jan 2026 19:50:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
Message-ID: <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-5-213d0d3bd490@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sKQ7u6u6my6XlJTm"
Content-Disposition: inline
In-Reply-To: <20260107-limit-infoframes-2-v4-5-213d0d3bd490@oss.qualcomm.com>
X-Cookie: Send some filthy mail.
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4CD309A207
X-Rspamd-Action: no action


--sKQ7u6u6my6XlJTm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 07, 2026 at 08:15:02PM +0200, Dmitry Baryshkov wrote:
> Having only a single set of callbacks, hdmi_clear_infoframe and
> hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
> the DRM framework, which InfoFrames are actually supported by the
> hardware and by the driver and which are not. Also, it makes it

We're seeing oopses on Qualcomm RB5 platforms in -next which bisect to
this patch.  Looking at the patch I'm not immediately seeing what it
might be getting wrong, though I do note that the board uses a LT9611
which is updated by the patch.

Failure log:

3853 01:47:31.278489  <3>[   21.045573] msm_dpu ae01000.display-controller: [drm:msm_dsi_modeset_init [msm]] *ERROR* failed to create dsi connector: -22
3854 01:47:31.280977  <3>[   21.057526] [drm:_dpu_kms_initialize_dsi:630] [dpu error]modeset_init failed for dsi[0], rc = -22
3855 01:47:31.322994  <3>[   21.066927] [drm:_dpu_kms_setup_displays:766] [dpu error]initialize_dsi failed, rc = -22
3856 01:47:31.323293  <3>[   21.075563] [drm:dpu_kms_hw_init:1283] [dpu error]modeset init failed: -22
3857 01:47:31.323577  <3>[   21.083223] msm_dpu ae01000.display-controller: [drm:msm_drm_kms_init [msm]] *ERROR* kms hw init failed: -22
3858 01:47:31.323809  <1>[   21.094033] Unable to handle kernel paging request at virtual address dead000000000108

...

3882 01:47:31.547579  <4>[   21.252828] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)

...

3901 01:47:31.678351  <4>[   21.462030] Call trace:
3902 01:47:31.721776  <4>[   21.464819]  drm_atomic_private_obj_fini+0x24/0x70 [drm] (P)
3903 01:47:31.722072  <4>[   21.470924]  _dpu_kms_hw_destroy+0x4c/0x64 [msm]
3904 01:47:31.722309  <4>[   21.475969]  dpu_kms_destroy+0x28/0xb0 [msm]
3905 01:47:31.722528  <4>[   21.480650]  msm_drm_kms_uninit+0xac/0xd8 [msm]
3906 01:47:31.722743  <4>[   21.485596]  msm_drm_uninit.isra.0+0x54/0xd4 [msm]
3907 01:47:31.722968  <4>[   21.490816]  msm_drm_init+0x18c/0x1f0 [msm]
3908 01:47:31.723228  <4>[   21.495409]  msm_drm_bind+0x30/0x3c [msm]
3909 01:47:31.723442  <4>[   21.499824]  try_to_bring_up_aggregate_device+0x164/0x1d0
3910 01:47:31.723646  <4>[   21.505635]  __component_add+0xa4/0x170
3911 01:47:31.725046  <4>[   21.509851]  component_add+0x14/0x20
3912 01:47:31.766295  <4>[   21.513793]  dsi_dev_attach+0x20/0x2c [msm]
3913 01:47:31.766592  <4>[   21.518387]  dsi_host_attach+0x58/0x98 [msm]
3914 01:47:31.766829  <4>[   21.523068]  devm_mipi_dsi_attach+0x34/0x90
3915 01:47:31.767113  <4>[   21.527638]  lt9611uxc_attach_dsi.isra.0+0x84/0x100 [lontium_lt9611uxc]
3916 01:47:31.767339  <4>[   21.534701]  lt9611uxc_probe+0x59c/0x62c [lontium_lt9611uxc]

bisect log:

git bisect start
# status: waiting for both good and bad commits
# good: [50814c5ce8d8f6751fd49c818abeb8853f8be2df] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect good 50814c5ce8d8f6751fd49c818abeb8853f8be2df
# status: waiting for bad commit, 1 good commit known
# bad: [615aad0f61e0c7a898184a394dc895c610100d4f] Add linux-next specific files for 20260126
git bisect bad 615aad0f61e0c7a898184a394dc895c610100d4f
# good: [b047f48069330e050431e9ad762bd838af43337f] Merge branch 'mtd/next' of https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
git bisect good b047f48069330e050431e9ad762bd838af43337f
# bad: [fe1e00e6f9fe8a160921f6a87f999075a1dfef0a] Merge branch 'for-mfd-next' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
git bisect bad fe1e00e6f9fe8a160921f6a87f999075a1dfef0a
# good: [9d10cd526111a989eb353c3a4df9d4c79695ea8d] Merge tag 'drm-intel-next-2026-01-15' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
git bisect good 9d10cd526111a989eb353c3a4df9d4c79695ea8d
# bad: [7260b161359d310b9a92513dbd73cd9a3a226c6f] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git
git bisect bad 7260b161359d310b9a92513dbd73cd9a3a226c6f
# bad: [d1968cd2a0ecab805106e5e60613dd45b63d52d9] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
git bisect bad d1968cd2a0ecab805106e5e60613dd45b63d52d9
# good: [d2f618b8fe76b565f6bc0071b5eeee07a9012c6d] Merge tag 'drm-intel-next-fixes-2026-01-22' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
git bisect good d2f618b8fe76b565f6bc0071b5eeee07a9012c6d
# good: [fc23163a7ca6cc0e6c3297aed3bdc9428aa8b1a9] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect good fc23163a7ca6cc0e6c3297aed3bdc9428aa8b1a9
# skip: [00e6f8f60601b412e400873c8972f3e3802557f3] dt-bindings: vendor-prefixes: Add AlgolTek
git bisect skip 00e6f8f60601b412e400873c8972f3e3802557f3
# bad: [e5e1a0000746ded4d9fa16fceda0748aec2b6e6a] drm/bridge: samsung-dsim: samsung_dsim_host_attach: use a temporary variable for the next bridge
git bisect bad e5e1a0000746ded4d9fa16fceda0748aec2b6e6a
# bad: [0607052a6aee1e3d218a99fae70ba9f14b3b47ed] drm/hisilicon/hibmc: fix no showing problem with loading hibmc manually
git bisect bad 0607052a6aee1e3d218a99fae70ba9f14b3b47ed
# bad: [5a4e4e30f6dc4d2a68eec08257128906572f3346] drm/debug: don't register files for unsupported HDMI InfoFrames
git bisect bad 5a4e4e30f6dc4d2a68eec08257128906572f3346
# good: [638409979c5f7d3155afcded67532003e07a7d0e] drm/sun4i: hdmi_enc: implement clear_infoframe stub
git bisect good 638409979c5f7d3155afcded67532003e07a7d0e
# skip: [1d8847f457648ed4932019dcd3081bc27bcea936] drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
git bisect skip 1d8847f457648ed4932019dcd3081bc27bcea936
# bad: [e802c783be94bf71541a7e2ac8b1b5486aad10db] drm/display: hdmi_state_helper: split InfoFrame functions per type
git bisect bad e802c783be94bf71541a7e2ac8b1b5486aad10db
# good: [afc399f7a5ea7bf405b2ef85c7470529b1a9e47c] drm/connector: make clear_infoframe callback mandatory for HDMI connectors
git bisect good afc399f7a5ea7bf405b2ef85c7470529b1a9e47c
# bad: [b626b1a1c9ccadd8861870a2a450f02e0c61ab88] drm/bridge: refactor HDMI InfoFrame callbacks
git bisect bad b626b1a1c9ccadd8861870a2a450f02e0c61ab88
# first bad commit: [b626b1a1c9ccadd8861870a2a450f02e0c61ab88] drm/bridge: refactor HDMI InfoFrame callbacks

--sKQ7u6u6my6XlJTm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml5FwAACgkQJNaLcl1U
h9B9Tgf/X2VdX2dj9e0HmnAWF7Z6YHcQwTv5vOPRR3TtPQ1f0IJF84ETF90P7M+z
0r53d6IbwJsKLOX4qsB/rNQEI5N+CJmuM3AAwc2f6ATSDYXwfp7G82qqjy1yhIf5
WTaqKV6iegc3pW6A+6AaU7mOqNBCm74S+28Yb07/FYYYI4CLJ1MZODAbjAHdKJMh
3KgxmTu9nFANpwxnxf7J6KAVvq+V3AWackd3YyPPRJymtC/VP3hDf+YJdFA8hBV0
aHaxFLCwzVkFfUutqrJ45IQS3wyDewkuIHBBWMfls4ORz6J+JAHSgoxHFLC+Xvwv
0T8FfKnKWZSsk5IGJrkrvzX7z2NSgg==
=rTj8
-----END PGP SIGNATURE-----

--sKQ7u6u6my6XlJTm--
