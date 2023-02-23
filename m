Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C956A03F5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 09:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5837C10EAEC;
	Thu, 23 Feb 2023 08:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849A010EAE3;
 Thu, 23 Feb 2023 08:38:46 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 263345820BA;
 Thu, 23 Feb 2023 03:38:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 Feb 2023 03:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1677141523; x=1677148723; bh=NrbQMdbrzPLpCQTAzeBzu9va/LSZF+lD0oR
 YJU2kcLQ=; b=PRNZ2PVBQOz0vzEdT7eSfZ/e3buAXHbqHu6YDSjqrP8fWZQxVeq
 jB3/13y90WyBMWR4gIA2jY6RCUvG9bZg6rQp96/QJlgqfypBgWgl9gONEuGUVOLb
 2hWGji+pa7O2w7qi6pgDWLQr9LuHsaMho3bSnT8CnUH7RiLZUOyIPfc8uqcmTCLr
 OWfImBCP3GFx8he3rEeRJrIYpDmtqCydtdfd9RssXOP1cMR5eAQ0e3SLuEDBcxb9
 uZYy3pvBR+IKgLJ/QRo+Qhb7QJXceTLU8BijLjw8rIO0vlmMPL1poG3pQTwkAT/+
 WVicn3dJpxfDVjGoN3djIHt9AXcYPuSfApA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677141523; x=
 1677148723; bh=NrbQMdbrzPLpCQTAzeBzu9va/LSZF+lD0oRYJU2kcLQ=; b=S
 8cLcNDF3hhUjOAtZrDinQRxYBRqlIiBYKKy62b1SufONph95KFinT8wxMyLyCd9Z
 psyt2/dgvcmq6IGmsJWAEb+jBNVC1lPPBjpx3oc9DxeTStet+BWxOJsD2M7wFadq
 LNoDgqaqHrDv0N1GkBawN6V8FF0B4HyofaI6CN619lmcexLSj0Ryj9k8Ee7gJVEK
 ch+3v9tY3RjS14ao+P1oCmtOr9f9cXaJquOHf6AuXPMAWsno2cOlll4PDg3t57FS
 irKxLvWA5dnftVRKYdvNud/E9IEsfM0nmgxFlb5/vZaJ3VGb7wRqm1c9WQusBkv8
 BnDd6EonMHQrgD50Lyx2g==
X-ME-Sender: <xms:Eib3Y_CFHL8Y6KQX3vX5h4qHpOjwpr8aAzBVEJhvYa4Z9fZYUP7ERA>
 <xme:Eib3Y1jDsOAATrUYWxj4bO0WWOV0xiTZjS2Aege3HTAwMfSB5xP4VoG_esqDABnfQ
 vU4JYp64923Pvd1WwA>
X-ME-Received: <xmr:Eib3Y6mURNcepJaiAh6pvzkv6FG6lnrgNKSW1mcoK8Sf4Dn-MhM17lSoGKuH7Vwr7fGm99i1-E_3hZTPHTk5p6WIoJZFw0U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudektddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepueeiheejhfeivedtheduffdttefgtdeuvddvueegtefgveegvedugeffudev
 jeeinecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:Eib3YxyOciQWfiyeL5HxKafItImTinY4yRbI0qij6QEB5hiMNdx14w>
 <xmx:Eib3Y0Ruh_aHdQVDViiBchkpb4L59U1o6iSPyZjkWFwS3jNWtuf7tg>
 <xmx:Eib3Y0anUcQD25PJZLdusz_SIuOYTKWl1rY0d7-DhCvmIqrUJ0doFw>
 <xmx:Eyb3YzBY-3IJB0yOJrvyRGUKLDBFWWhCvD5Wol6O22sfdBFAkDMzNg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 03:38:41 -0500 (EST)
Date: Thu, 23 Feb 2023 09:38:39 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230223083839.5gtmu6i42bnj7pfh@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aqzygcczyv74nmlw"
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--aqzygcczyv74nmlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-02-23:
A fix for nouveau preventing the system shutdown and one for a build
warning, and NULL pointer dereference fix for cirrus.
The following changes since commit a950b989ea29ab3b38ea7f6e3d2540700a3c54e8:

  drm/vmwgfx: Do not drop the reference to the handle too soon (2023-02-14 23:00:09 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-02-23

for you to fetch changes up to 1b9b4f922f96108da3bb5d87b2d603f5dfbc5650:

  drm/nouveau/fb/gp102-: cache scrubber binary on first load (2023-02-21 02:07:24 +0100)

----------------------------------------------------------------
A fix for nouveau preventing the system shutdown and one for a build
warning, and NULL pointer dereference fix for cirrus.

----------------------------------------------------------------
Alexandr Sapozhnikov (1):
      drm/cirrus: NULL-check pipe->plane.state->fb in cirrus_pipe_update()

Ben Skeggs (1):
      drm/nouveau/fb/gp102-: cache scrubber binary on first load

Jiri Slaby (SUSE) (1):
      drm/nouveau/kms/nv50: fix nv50_wndw_new_ prototype

 drivers/gpu/drm/nouveau/dispnv50/wndw.h          |  5 +--
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h |  3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c    |  8 +++--
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c   | 21 +++++-------
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c   | 41 ++++++++----------------
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c   |  4 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h    |  3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c   |  4 +--
 drivers/gpu/drm/tiny/cirrus.c                    |  2 +-
 10 files changed, 40 insertions(+), 53 deletions(-)

--aqzygcczyv74nmlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/cmDwAKCRDj7w1vZxhR
xSlzAQCtWsOtZEF7JT6Q8XtYSOMFvfbQbEgSWchRtthUOAdXFQEA37fbziU/ZwK0
fDRwC+wwzviOOjDwB74kT902zMU6lwI=
=jfI1
-----END PGP SIGNATURE-----

--aqzygcczyv74nmlw--
