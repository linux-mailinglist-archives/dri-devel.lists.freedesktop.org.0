Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362154142D9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 09:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0A6EABE;
	Wed, 22 Sep 2021 07:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5316EABD;
 Wed, 22 Sep 2021 07:44:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0F14C5805B0;
 Wed, 22 Sep 2021 03:44:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Sep 2021 03:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=XCUTfqAMeLZSZkHYsRbu8qI9KVI
 AV3RbBYRdKeyWt44=; b=HDUAWbjcPHA5Xpw3ttCi+Ehl9CjHCJTfF1rZu8xVtoh
 86asgW29auqkaqqc1k0WqTDeYBMhFJKzD6clcbMrrD7cNBegBCirrkk+c3aRbdr0
 LIMYeDNPLNoFByzEUSKPk6EwLzNh7EHvERgfzCvBqifupVvDsL5CoT6Jh/RdvoBm
 jCiauHRrFa1TUajxWDRBHNPOHwmbSbKmgUwq9XXw277d+qt0H0S1FbtmhmUptbr9
 eb2G9AlJfqkxp7natS/pIucgUt4l7vZh+QNtai0Dd7mV8DvF9juhNotLwYPLuDR+
 P/lctkRoRREdUVnDauLWFHjiHP2OymZYKllQd2FtWVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XCUTfq
 AMeLZSZkHYsRbu8qI9KVIAV3RbBYRdKeyWt44=; b=sicZbTtymoGgyisuPQsLKt
 VZY0NXpEKEPzWQXscU3U/Nfi+lO8oZ0KmEVYxF19I3jDeT6pfY/HgGfGwHWA1QVJ
 a0VyzgyDvaDK0oBsPATjXu474GJCGuqF5xQokSXNX4CM767glEJGltaTGShkRs0B
 Xa2+1d8evfwMEejPhuAhyTotgGhY5pZyNZhWhFhgsuObs3m5FrCi7OBE9Kq1gVil
 fCc5FYW0CdSET8pSTh49ozHtp3FFmdrgLY9d03mFqplrryLa+TAhoe7r7GDFIC0Q
 vLttdoXto5UBxlKZXYr/Vp2PLwdAVEJocAT2AYfW9ImrcwHQsTHNw8/5y5oX3A0Q
 ==
X-ME-Sender: <xms:1t5KYYzq2y-hRDs4-LeRVJqfpVKAe8wZma91nAiPrPk-hwGaqfTJ_g>
 <xme:1t5KYcTBYt6mC6TA4e8swKKUstiAeOAVXCHp8d0jcGDzHpvxON69TG6PsBLZzJIoz
 WAUagr99a3qmqKhtpg>
X-ME-Received: <xmr:1t5KYaXwMvr2YXN9STDQjPObD6YUh7cZ1SkXC4rDs6qyNkrFHdKWPQheg5lx9eAxRSZ8GpE0oErokWySGm-RsVksltSV7F5UjY8y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiiedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhkeeiffdvkeetfefghfehffelhfekhfejtefhteekleejgeeijeeihfej
 vdetffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:1t5KYWgg5H5mf6Pi-R2rzIWidKE90WMJ4-IQBfqOVOaNeF35TCLF2g>
 <xmx:1t5KYaAAY0iOmyg8Sctza0cxsmleN4YHNR8FMlAdaWWPyL_pm6BPlA>
 <xmx:1t5KYXKgHZkcaozUonPXL0g9Il824gRAgkmh3NM8r985L7CD0oCe-g>
 <xmx:2N5KYe76CgCxX14u_WKKVRbmxxchVfBYorgA-ygqcE64w3qSp4wJUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 03:44:22 -0400 (EDT)
Date: Wed, 22 Sep 2021 09:44:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-misc-next
Message-ID: <20210922074420.gbfizssguzjubmw5@gilmour>
References: <20210916073132.ptbbmjetm7v3ufq3@gilmour>
 <CAL_JsqKcTfgnXNYzGDSFhKS2udhw2Dvk04ODwTxUdDRQjKdT0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dqpc4ubsftiqfdfd"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKcTfgnXNYzGDSFhKS2udhw2Dvk04ODwTxUdDRQjKdT0Q@mail.gmail.com>
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


--dqpc4ubsftiqfdfd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 20, 2021 at 05:29:41PM -0500, Rob Herring wrote:
> On Thu, Sep 16, 2021 at 2:31 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Dave, Daniel,
> >
> > Here's the first drm-misc-next PR for 5.16
> >
> > Thanks!
> > Maxime
> >
> > drm-misc-next-2021-09-16:
> > drm-misc-next for $kernel-version:
> >
> > UAPI Changes:
> >
> > Cross-subsystem Changes:
> >   - dma-buf: Avoid a warning with some allocations, Remove
> >     DMA_FENCE_TRACE macros
> >
> > Core Changes:
> >   - bridge: New helper to git rid of panels in drivers
> >   - fence: Improve dma_fence_add_callback documentation, Improve
> >     dma_fence_ops->wait documentation
> >   - ioctl: Unexport drm_ioctl_permit
> >   - lease: Documentation improvements
> >   - fourcc: Add new macro to determine the modifier vendor
> >   - quirks: Add the Steam Deck, Chuwi HiBook, Chuwi Hi10 Pro, Samsung
> >     Galaxy Book 10.6, KD Kurio Smart C15200 2-in-1, Lenovo Ideapad D330
> >   - resv: Improve the documentation
> >   - shmem-helpers: Allocate WC pages on x86, Switch to vmf_insert_pfn
> >   - sched: Fix for a timer being canceled too soon, Avoid null pointer
> >     derefence if the fence is null in drm_sched_fence_free, Convert
> >     drivers to rely on its dependency tracking
> >   - ttm: Switch to kerneldoc, new helper to clear all DMA mappings, pool
> >     shrinker optitimization, Remove ttm_tt_destroy_common, Fix for
> >     unbinding on multiple drivers
> >
> > Driver Changes:
> >   - bochs: New PCI IDs
> >   - msm: Fence ordering impromevemnts
> >   - stm: Add layer alpha support, zpos
> >   - v3d: Fix for a Vulkan CTS failure
> >   - vc4: Conversion to the new bridge helpers
> >   - vgem: Use shmem helpers
> >   - virtio: Support mapping exported vram
> >   - zte: Remove obsolete driver
> >
> >   - bridge: Probe improvements for it66121, enable DSI EOTP for anx7625,
> >     errors propagation improvements for anx7625
> >
> >   - panels: 60fps mode for otm8009a, New driver for Samsung S6D27A1
> > The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6=
dd8f:
> >
> >   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-09=
-16
> >
> > for you to fetch changes up to e4f868191138975f2fdf2f37c11318b47db4acc9:
> >
> >   drm/v3d: fix wait for TMU write combiner flush (2021-09-15 18:43:37 +=
0100)
> >
> > ----------------------------------------------------------------
> > drm-misc-next for $kernel-version:
> >
> > UAPI Changes:
> >
> > Cross-subsystem Changes:
> >   - dma-buf: Avoid a warning with some allocations, Remove
> >     DMA_FENCE_TRACE macros
> >
> > Core Changes:
> >   - bridge: New helper to git rid of panels in drivers
> >   - fence: Improve dma_fence_add_callback documentation, Improve
> >     dma_fence_ops->wait documentation
> >   - ioctl: Unexport drm_ioctl_permit
> >   - lease: Documentation improvements
> >   - fourcc: Add new macro to determine the modifier vendor
> >   - quirks: Add the Steam Deck, Chuwi HiBook, Chuwi Hi10 Pro, Samsung
> >     Galaxy Book 10.6, KD Kurio Smart C15200 2-in-1, Lenovo Ideapad D330
> >   - resv: Improve the documentation
> >   - shmem-helpers: Allocate WC pages on x86, Switch to vmf_insert_pfn
> >   - sched: Fix for a timer being canceled too soon, Avoid null pointer
> >     derefence if the fence is null in drm_sched_fence_free, Convert
> >     drivers to rely on its dependency tracking
> >   - ttm: Switch to kerneldoc, new helper to clear all DMA mappings, pool
> >     shrinker optitimization, Remove ttm_tt_destroy_common, Fix for
> >     unbinding on multiple drivers
> >
> > Driver Changes:
> >   - bochs: New PCI IDs
> >   - msm: Fence ordering impromevemnts
> >   - stm: Add layer alpha support, zpos
> >   - v3d: Fix for a Vulkan CTS failure
> >   - vc4: Conversion to the new bridge helpers
> >   - vgem: Use shmem helpers
> >   - virtio: Support mapping exported vram
> >   - zte: Remove obsolete driver
> >
> >   - bridge: Probe improvements for it66121, enable DSI EOTP for anx7625,
> >     errors propagation improvements for anx7625
> >
> >   - panels: 60fps mode for otm8009a, New driver for Samsung S6D27A1
> >
> > ----------------------------------------------------------------
> > Alyssa Rosenzweig (2):
> >       drm/panfrost: Use upper/lower_32_bits helpers
> >       drm/plane: Fix comment typo
> >
> > Andrey Grodzovsky (2):
> >       drm/ttm: Create pinned list
> >       drm/ttm: Clear all DMA mappings on demand
> >
> > Boris Brezillon (2):
> >       panfrost: Don't cleanup the job if it was successfully queued
> >       drm/sched: Fix drm_sched_fence_free() so it can be passed an unin=
itialized fence
> >
> > Cai Huoqing (7):
> >       drm/bridge: cdns: Make use of the helper function devm_platform_i=
oremap_resource()
> >       drm: adv7511: Convert to SPDX identifier
> >       drm/vc4: Make use of the helper function devm_platform_ioremap_re=
source()
> >       drm/sun4i: Make use of the helper function devm_platform_ioremap_=
resource()
> >       drm/panfrost: Make use of the helper function devm_platform_iorem=
ap_resource()
> >       drm/mcde: Make use of the helper function devm_platform_ioremap_r=
esource()
> >       drm/meson: Make use of the helper function devm_platform_ioremap_=
resourcexxx()
> >
> > Charan Teja Reddy (1):
> >       dma-buf: WARN on dmabuf release with pending attachments
> >
> > Christian K=F6nig (21):
> >       dma-buf: nuke seqno-fence
> >       drm/vmwgfx: unbind in vmw_ttm_unpopulate
> >       drm/amdgpu: unbind in amdgpu_ttm_tt_unpopulate
> >       drm/nouveau: unbind in nouveau_ttm_tt_unpopulate
> >       drm/radeon: unbind in radeon_ttm_tt_unpopulate()
> >       drm/ttm: remove ttm_tt_destroy_common v2
> >       mm/vmscan: add sync_shrinkers function v3
> >       drm/ttm: optimize the pool shrinker a bit v2
> >       dma-buf: nuke DMA_FENCE_TRACE macros v2
> >       dma-buf: cleanup kerneldoc of removed component
> >       dma-buf: clarify dma_fence_ops->wait documentation
> >       dma-buf: clarify dma_fence_add_callback documentation
> >       drm/ttm: cleanup ttm_resource_compat
> >       drm/ttm: remove the outdated kerneldoc section
> >       drm/ttm: add some general module kerneldoc
> >       drm/ttm: add kerneldoc for enum ttm_caching
> >       drm/ttm: enable TTM device object kerneldoc v2
> >       drm/ttm: enable TTM resource object kerneldoc v2
> >       drm/ttm: enable TTM placement kerneldoc
> >       drm/ttm: enable TTM TT object kerneldoc v2
> >       drm/ttm: enable TTM page pool kerneldoc
> >
> > Christophe JAILLET (1):
> >       drm/r128: switch from 'pci_' to 'dma_' API
> >
> > Daniel Vetter (16):
> >       drm/shmem-helper: Switch to vmf_insert_pfn
> >       drm/shmem-helpers: Allocate wc pages on x86
> >       drm/vgem: use shmem helpers
> >       drm/sched: Split drm_sched_job_init
> >       drm/msm: Improve drm/sched point of no return rules
> >       drm/sched: Barriers are needed for entity->last_scheduled
> >       drm/sched: Add dependency tracking
> >       drm/sched: drop entity parameter from drm_sched_push_job
> >       drm/sched: improve docs around drm_sched_entity
> >       drm/panfrost: use scheduler dependency tracking
> >       drm/lima: use scheduler dependency tracking
> >       drm/v3d: Move drm_sched_job_init to v3d_job_init
> >       drm/v3d: Use scheduler dependency handling
> >       drm/msm: Use scheduler dependency handling
> >       drm/msm: Don't break exclusive fence ordering
> >       dma-resv: Give the docs a do-over
> >
> > David Stevens (1):
> >       drm/virtio: support mapping exported vram
> >
> > Desmond Cheong Zhi Xi (1):
> >       drm: unexport drm_ioctl_permit
> >
> > Douglas Anderson (1):
> >       drm/panel-simple: Reorder logicpd_type_28 / mitsubishi_aa070mc01
> >
> > F.A.Sulaiman (1):
> >       GPU: drm: fix style errors
> >
> > H. Peter Anvin (Intel) (1):
> >       drm/bochs: add Bochs PCI ID for Simics model
> >
> > Hans de Goede (11):
> >       drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 qui=
rk (v2)
> >       drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C1520=
0 2-in-1
> >       drm: panel-orientation-quirks: Add quirk for the Samsung Galaxy B=
ook 10.6
> >       drm: panel-orientation-quirks: Add quirk for the Chuwi Hi10 Pro
> >       drm/connector: Give connector sysfs devices there own device_type
> >       drm/connector: Add a fwnode pointer to drm_connector and register=
 with ACPI (v2)
> >       drm/connector: Add drm_connector_find_by_fwnode() function (v3)
> >       drm/connector: Add support for out-of-band hotplug notification (=
v3)
> >       usb: typec: altmodes/displayport: Make dp_altmode_notify() more g=
eneric
> >       usb: typec: altmodes/displayport: Notify drm subsys of hotplug ev=
ents
> >       drm: panel-orientation-quirks: Add quirk for the Chuwi HiBook
> >
> > Huang Rui (1):
> >       drm/ttm: fix the type mismatch error on sparc64
> >
> > Iago Toral Quiroga (1):
> >       drm/v3d: fix wait for TMU write combiner flush
> >
> > Javier Martinez Canillas (1):
> >       drm: Remove unused code to load the non-existing fbcon.ko
> >
> > Jernej Skrabec (1):
> >       drm/sun4i: Fix macros in sun8i_csc.h
> >
> > John Stultz (1):
> >       dma-buf: system_heap: Avoid warning on mid-order allocations
> >
> > Krzysztof Kozlowski (1):
> >       dt-bindings: panel: ili9341: correct indentation
>=20
> I already mentioned this on the patch, but this is 5.15 material and
> needs to go in drm-misc-next-fixes. Otherwise, we'll just keep getting
> patches for this. 2 duplicates so far.

I've cherry-picked it into drm-misc-fixes, it should be in the next rc.

Thanks!
Maxime

--dqpc4ubsftiqfdfd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUre1AAKCRDj7w1vZxhR
xcAHAP4/uX0UZjLXO2dJisM5+EtIIXDnByR/DBfHo1dAPP3aqAEAmBlzjGtkV0C0
8zmACWdhFzENzn9J267dNKS1dKaTdgk=
=nitW
-----END PGP SIGNATURE-----

--dqpc4ubsftiqfdfd--
