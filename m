Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA73C465FCC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 09:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C856E9F4;
	Thu,  2 Dec 2021 08:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AF16E314;
 Thu,  2 Dec 2021 08:44:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 73FE32B00359;
 Thu,  2 Dec 2021 03:44:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 02 Dec 2021 03:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=+1imycJviwAhOimDYN66UcNf5O5JiPbYSIDqwnLGwnM=; b=VGx4diLt
 F7XFEs7UjOEHWrBI+yiJVTHLtILosO6+VkKAglQc+Hd3xza2UrsPrOXNPSY6C5Sf
 ebngo3k1TzzH77J8Yin7D15cb1KEunl76yrxkaSLdANReFCjeY3xVbJRbzHiFDXP
 MgTHlwFhHg9oz7z5hinbN69mT3BkvzTRvYfAJrjOIR/MXdLQe1YXY9BCKVa6hcHK
 VPpz94ffG9f5FHVRGOIHbQHp+I+0RpAJzJTFKlu7sInt4eMM53gYRj0KP4YN8Ls6
 zNw+oAagklHPkxgXjVsZ02rZea0QVadRbw4uCfR1WcXmq4BgTUHd1u/uNDjt4K7q
 LZ+0xY5tmHkLVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=+1imycJviwAhOimDYN66UcNf5O5Ji
 PbYSIDqwnLGwnM=; b=cZDNXReap35XoVZhuXkFrxCfXriOgulDgyKU6CuCpNeBj
 BPwSnuLg0szVbWkXCKSA8/x1eWLEYJwuvGW2bmk21wMgcx9i8q0LrHesIV/zX9RC
 /pR26d1e+wGy5b54+5t/e80xLRDFU01F5gj8018xo/nkUNkkvbgLCfyH7YMBn2Me
 nP13XVLtCbtD/5lViLhY0YZ4S/+X6jy17KJb6KNOFR8Mv5XlgB5bNosgJOPxJdA5
 V9gVdK7nkAJWktmozH17f8oFP3Q2rWKNLVOTkdna3FvAQCNb9gX1mDLXk41lK7/z
 S4Ub9VRFsDvOAjAffhjmaXuQYpPjmHRKaHxa/afMA==
X-ME-Sender: <xms:eoeoYYDOb7-5DDHOxde5LKopz4VtPmoxXqc9m-q5r3TsSgnZKCI9Qw>
 <xme:eoeoYagIGJzOThg8Ta_gBTuRpWhFfdzy2bLgz6362hVAMf3yAGoeqogsBV7n0hHx5
 zTN2fnCjxm4oXy89TM>
X-ME-Received: <xmr:eoeoYbn3QrBfR2Utf5Um4C9v8OlTC1HMOjY3RO-E8aS0sDBHc67zlaSoJvDvdJYf7E6VBhlRwPgWx1A1T0E2fo2YT31Rwk7SloyiVbppOZkCrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieeggdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:eoeoYewbg0i3xTRl4KzQa6HJNKJ_UFq7u0CtkRu4s7GIJOIX4qkF_g>
 <xmx:eoeoYdSvvEy9X-LzsOCHwGFDYm0m81MXnBxLU7r-3XqYAep4S2GBBw>
 <xmx:eoeoYZbxpaKJ_fOX6-Qt11NWTsaUPTR_jDQQg3UXWVi2goTDVSvmsQ>
 <xmx:eoeoYSLfvrGYeiMHlKOzvxphBSI4VfmbkapQ0RPc4uTACfzlQmKw_9invw8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Dec 2021 03:44:41 -0500 (EST)
Date: Thu, 2 Dec 2021 09:44:40 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20211202084440.u3b7lbeulj7k3ltg@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5ybb4bf6tko3g7fo"
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5ybb4bf6tko3g7fo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2021-12-02:
Switch back to drm_poll for virtio, multiple fixes (memory leak,
improper error check, some functional fixes too) for vc4, memory leak
fix in dma-buf,
The following changes since commit e048834c209a02e3776bcc47d43c6d863e3a67ca:

  drm/hyperv: Fix device removal on Gen1 VMs (2021-11-23 10:56:12 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-12-02

for you to fetch changes up to 679d94cd7d900871e5bc9cf780bd5b73af35ab42:

  dma-buf: system_heap: Use 'for_each_sgtable_sg' in pages free flow (2021-12-01 15:30:10 +0530)

----------------------------------------------------------------
Switch back to drm_poll for virtio, multiple fixes (memory leak,
improper error check, some functional fixes too) for vc4, memory leak
fix in dma-buf,

----------------------------------------------------------------
Guangming (1):
      dma-buf: system_heap: Use 'for_each_sgtable_sg' in pages free flow

Gurchetan Singh (2):
      drm/virtgpu api: define a dummy fence signaled event
      drm/virtio: use drm_poll(..) instead of virtio_gpu_poll(..)

Maxime Ripard (6):
      drm/vc4: kms: Wait for the commit before increasing our clock rate
      drm/vc4: kms: Fix return code check
      drm/vc4: kms: Add missing drm_crtc_commit_put
      drm/vc4: kms: Clear the HVS FIFO commit pointer once done
      drm/vc4: kms: Don't duplicate pending commit
      drm/vc4: kms: Fix previous HVS commit wait

 drivers/dma-buf/heaps/system_heap.c    |  2 +-
 drivers/gpu/drm/vc4/vc4_kms.c          | 42 +++++++++++++++-------------------
 drivers/gpu/drm/virtio/virtgpu_drv.c   | 42 +---------------------------------
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 -
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  2 +-
 include/uapi/drm/virtgpu_drm.h         |  7 ++++++
 6 files changed, 29 insertions(+), 67 deletions(-)

--5ybb4bf6tko3g7fo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaiHeAAKCRDj7w1vZxhR
xTVYAQDIwGAVrxxz3PG7/4icelQ0bAG17jTiNFIdMRh1cw+N1wEA38kIWQZzOXLy
OhswDKOwh0Kwg+hVfD6r62sBOtZMmQ8=
=vwrB
-----END PGP SIGNATURE-----

--5ybb4bf6tko3g7fo--
