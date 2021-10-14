Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833B642D8CA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 14:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC306E0F5;
	Thu, 14 Oct 2021 12:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C011B6E0D4;
 Thu, 14 Oct 2021 12:04:57 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3F73958120C;
 Thu, 14 Oct 2021 08:04:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 14 Oct 2021 08:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=Uh24z7bVsAqGdsdIS/zzNltMJCYGqOV6lvilCrBse8c=; b=iBQZLJ0Q
 Ti1NLMl72q1WAjwAtHg6fypTb3cm/OVMKaUhlpXl6XVZtk6BGG69gXjNSOO/41iq
 AG/AzRxmUCBhW9Oz1fG/zSgdXsIdsGUN6by4ui5ldSbaAxTpxm+4gDi0aYXAuT2M
 LvvkOoduSYt5aXSmwRKnrA1Ls0sOvkV6IwkkR+qNuB4H/wPEzfEhXL4a4reScdym
 C2QOXNBpee0b8h0QeTpTcd9wpqttFfSkSJ5k0u56QTZdd6zvJxMyeTy1hbAi576g
 MIL3ZwmWBUQ3n6l6m4h0RAxIFmmBnaxYxmLorVNqCAZ7kqDd08CjiIe/ePCP9gn1
 Ulrqy0cZwqXwlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=Uh24z7bVsAqGdsdIS/zzNltMJCYGq
 OV6lvilCrBse8c=; b=GWcwD/dqZQMvluqHThIaTpuwP4I5KLVXzjqpb6bgScUlW
 mc9ldRM1V5mtJqnEoPqpb8lDhRKmkd2FSXLqo4Rmwgay7KQ/r03xilkQIe0Tkz9G
 ee5uME5UJoMBhHgxLt4w4jIqfqpdi+g7TlhGudejX5pG4/UU/bYwG/a+pOtOw+91
 3Rkhn9HF8IER7G6ZwFV23ifXUrCGFUClZ8dz+iyvAIrATLxdKZ0X0obQ9aBwnHjx
 n3RLVpASHEaqbwq+epP9WwAgraUP1s8FRtp3SbB7qVWdtSKOmeRqsa+Q1CGn7aDI
 +N+LWUQRl1C34XqR/6kVh5g0ZHKGGkMDs5Lg8OTDg==
X-ME-Sender: <xms:5hxoYfENBxZk5WTWLrjBOmHqFWy4nsFPRq_rQ8wRU3SRA3szHSG17w>
 <xme:5hxoYcWRqdf-kYMe7gesUpoAjpSwS26ovnGH7XSvmuDM7zU5ZUwMIhjvYHRGa8Tyd
 tS7emKq9O19rn2cU7c>
X-ME-Received: <xmr:5hxoYRJnJlvEh5AKiuviNIrmB4gT2PXo-PTzDjY-EcLa_USHbuvmhNL_vXGtISblQ9qs5vvKIlqo0oZsENuWDyR5MUZzKVVzg4xOMMzG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduvddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:5hxoYdF6bzUgJnWqgIswntz5_i3_VN2pRTSER0Ul0lPiDtujzI-Cnw>
 <xmx:5hxoYVXVvpuRIn8VJSuminl0cf7llB9nPRLrt0pTN8pxRFIffWo-uA>
 <xmx:5hxoYYPPLaV4V18im-Yh4YGgAOOEp174lqdGeaU5L7UgdMGxrekx-w>
 <xmx:5xxoYdTxDJR6jOD_6LlGWBSPOK8DIMLdUeZbYbSr0MDzrNKdmQytFA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Oct 2021 08:04:54 -0400 (EDT)
Date: Thu, 14 Oct 2021 14:04:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20211014120452.2wicnt6hobu3kbwb@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jtnximq3qa7yoe3l"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jtnximq3qa7yoe3l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2021-10-14:
drm-misc-next for 5.16:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - fbdev: Fix double-free, Remove unused scrolling acceleration
  - locking: improve logging for contented locks without backoff
  - dma-buf: Add dma_resv_for_each_fence iterator, and conversion of
    users

Driver Changes:
  - nouveau: Various code style improvements
  - bridge: HPD improvements for lt9611uxc, eDP aux-bus support for
    ps8640, lvds-codec data-mapping selection support
  - panels: Vivax TPC-9150, Innolux G070Y2-T02, LOGIC Technologies
    LTTD800480070-L2RT, Sharp LS060T1SX01,
The following changes since commit 9962601ca5719050906915c3c33a63744ac7b15c:

  drm/bridge: dw-hdmi-cec: Make use of the helper function devm_add_action_=
or_reset() (2021-10-06 11:21:46 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-10-14

for you to fetch changes up to b3ec8cdf457e5e63d396fe1346cc788cf7c1b578:

  fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO li=
st) (2021-10-13 15:29:23 +0200)

----------------------------------------------------------------
drm-misc-next for 5.16:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - fbdev: Fix double-free, Remove unused scrolling acceleration
  - locking: improve logging for contented locks without backoff
  - dma-buf: Add dma_resv_for_each_fence iterator, and conversion of
    users

Driver Changes:
  - nouveau: Various code style improvements
  - bridge: HPD improvements for lt9611uxc, eDP aux-bus support for
    ps8640, lvds-codec data-mapping selection support
  - panels: Vivax TPC-9150, Innolux G070Y2-T02, LOGIC Technologies
    LTTD800480070-L2RT, Sharp LS060T1SX01,

----------------------------------------------------------------
Alex Xu (Hello71) (1):
      drm/plane-helper: fix uninitialized variable reference

Amos Kong (1):
      drm/ttm_bo_api: update the description for @placement and @sg

Christian K=F6nig (7):
      dma-buf: add dma_resv_for_each_fence v3
      dma-buf: use the new iterator in dma_buf_debug_show
      dma-buf: use the new iterator in dma_resv_poll
      drm/ttm: use the new iterator in ttm_bo_flush_all_fences
      drm/scheduler: use new iterator in drm_sched_job_add_implicit_depende=
ncies v2
      drm/i915: use the new iterator in i915_request_await_object v2
      drm: use new iterator in drm_gem_fence_array_add_implicit v3

Claudio Suarez (1):
      fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TOD=
O list)

Dan Carpenter (1):
      drm/v3d: fix copy_from_user() error codes

David Heidelberg (1):
      dt-bindings: display: simple: hardware can use ddc-i2c-bus

Dmitry Baryshkov (5):
      drm/bridge/lontium-lt9611uxc: fix provided connector suport
      dt-bindings: add bindings for the Sharp LS060T1SX01 panel
      drm/panel: Add support for Sharp LS060T1SX01 panel
      dt-bindings: add bindings for the Sharp LS060T1SX01 panel
      drm/panel: Add support for Sharp LS060T1SX01 panel

Guido G=FCnther (5):
      drm/bridge: nwl-dsi: Add atomic_get_input_bus_fmts
      drm/panel: mantix: Add media bus format
      drm/panel: st7703: Add media bus format
      drm: mxsfb: Print failed bus format in hex
      drm: mxsfb: Set fallback bus format when the bridge doesn't provide o=
ne

Jani Nikula (1):
      drm/locking: add backtrace for locking contended locks without backoff

Jing Xiangfeng (1):
      drm/virtio: fix the missed drm_gem_object_put() in virtio_gpu_user_fr=
amebuffer_create()

Karol Herbst (1):
      drm/nouveau/mmu/gp100: remove unused variable

Lee Jones (1):
      drm/nouveau/nouveau_bo: Remove unused variables 'dev'

Luo penghao (2):
      drm/nouveau/mmu: drop unneeded assignment in the nvkm_uvmm_mthd_page()
      drm/nouveau/mmu/gp100-: drop unneeded assignment in the if condition.

Marek Vasut (3):
      drm/bridge: ti-sn65dsi83: Implement .detach callback
      dt-bindings: display: bridge: lvds-codec: Document LVDS data mapping =
select
      drm/bridge: lvds-codec: Add support for LVDS data mapping select

Nikola Pavlica (2):
      dt-bindings: add vendor prefix for Vivax
      dt-bindings: display: simple: Add Vivax TPC-9150 panel

Oleksij Rempel (1):
      dt-bindings: display: simple: add Innolux G070Y2-T02 panel

Philip Chen (1):
      dt-bindings: drm/bridge: ps8640: Add aux-bus child

Randy Dunlap (1):
      drm/connector: fix all kernel-doc warnings

Sam Ravnborg (2):
      Revert "drm/panel: Add support for Sharp LS060T1SX01 panel"
      Revert "dt-bindings: add bindings for the Sharp LS060T1SX01 panel"

Simon Ser (1):
      drm/connector: refer to CTA-861-G in the "content type" prop docs

S=F8ren Andersen (1):
      drm/panel: panel-simple: add LOGIC Technologies LTTD800480070-L2RT pa=
nel

Tvrtko Ursulin (1):
      dma-resv: Fix dma_resv_get_fences and dma_resv_copy_fences after conv=
ersion

Uwe Kleine-K=F6nig (1):
      drm/panel: s6e63m0: Make s6e63m0_remove() return void

Yang Yingliang (1):
      drm/nouveau/gem: remove redundant semi-colon

Zheyu Ma (1):
      fbdev: fbmem: Fix double free of 'fb_info->pixmap.addr'

yong yiran (1):
      drm/nouveau/nvenc: remove duplicate include in base.c

 .../bindings/display/bridge/lvds-codec.yaml        |  33 +-
 .../devicetree/bindings/display/bridge/ps8640.yaml |  19 +-
 .../bindings/display/panel/panel-simple.yaml       |   5 +
 .../bindings/display/panel/sharp,ls060t1sx01.yaml  |  56 +++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/gpu/todo.rst                         |  13 +-
 drivers/dma-buf/dma-buf.c                          |  60 +--
 drivers/dma-buf/dma-resv.c                         |  69 ++-
 drivers/gpu/drm/Kconfig                            |  15 +
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   9 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |  76 ++-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  35 ++
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  17 +-
 drivers/gpu/drm/drm_connector.c                    |  32 +-
 drivers/gpu/drm/drm_gem.c                          |  26 +-
 drivers/gpu/drm/drm_modeset_lock.c                 |  49 +-
 drivers/gpu/drm/drm_plane_helper.c                 |   1 -
 drivers/gpu/drm/i915/i915_request.c                |  34 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   8 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   4 -
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c   |   1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |   4 +-
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   9 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |   3 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c  |   3 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h      |   2 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    | 333 ++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  35 ++
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   8 +
 drivers/gpu/drm/scheduler/sched_main.c             |  26 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  16 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  13 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |   4 +-
 drivers/video/fbdev/core/bitblit.c                 |  16 -
 drivers/video/fbdev/core/fbcon.c                   | 509 +----------------=
----
 drivers/video/fbdev/core/fbcon.h                   |  59 ---
 drivers/video/fbdev/core/fbcon_ccw.c               |  28 +-
 drivers/video/fbdev/core/fbcon_cw.c                |  28 +-
 drivers/video/fbdev/core/fbcon_rotate.h            |   9 -
 drivers/video/fbdev/core/fbcon_ud.c                |  37 +-
 drivers/video/fbdev/core/fbmem.c                   |   5 +-
 drivers/video/fbdev/core/tileblit.c                |  16 -
 drivers/video/fbdev/skeletonfb.c                   |  12 +-
 include/drm/drm_modeset_lock.h                     |   8 +
 include/drm/ttm/ttm_bo_api.h                       |   6 +-
 include/linux/dma-resv.h                           |  25 +-
 include/linux/fb.h                                 |   2 +-
 52 files changed, 939 insertions(+), 860 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
s060t1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c

--jtnximq3qa7yoe3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYWgc5AAKCRDj7w1vZxhR
xZH8AP9kIk2dD1Yy8eyrfq0AS1gkEmfPJ540ZoyaxK9SPJfeNQEAhFpkpihAd21a
QStZq6VWo2hEjvZ+U5g8dbuzJmqU+AM=
=sTZm
-----END PGP SIGNATURE-----

--jtnximq3qa7yoe3l--
