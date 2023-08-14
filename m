Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8975F77C40B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 01:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AA710E124;
	Mon, 14 Aug 2023 23:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BA210E125
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 23:49:54 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 28BD26607090;
 Tue, 15 Aug 2023 00:49:52 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <ZNqn3I4fE6dCwslc@ginger>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Tue, 15 Aug 2023 00:49:51 +0100
To: "Helen Koike" <helen.koike@collabora.com>
MIME-Version: 1.0
Message-ID: <7988-64dabd80-3-79f10400@207763561>
Subject: =?utf-8?q?Re=3A?= [PULL] drm-misc-next
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable
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
Cc: robdclark@google.com, daniels@collabora.com, emma@anholt.net,
 gustavo.padovan@collabora.com, anholt@google.comairlied,
 daniel.vetter@ffwll.ch, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david.heidelberg@collabora.com,
 robclark@freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, August 14, 2023 19:17 -03, Helen Koike <helen.koike@collabor=
a.com> wrote:

> The following changes since commit f5d8f9c0d8b4bc8ad7e7b23a9f4d116e99=
202dd3:
>=20
>   drm/panel: JDI LT070ME05000 simplify with dev=5Ferr=5Fprobe() (2023=
-08-14 14:44:30 +0200)
>=20
> are available in the Git repository at:
>=20
>   git@gitlab.freedesktop.org:helen.fornazier/linux.git tags/drm-ci-v1=
2-drm-misc
>=20
> for you to fetch changes up to cf50bc174149379c712a396ae556e2e908ee88=
e0:
>=20
>   drm: Add initial ci/ subdirectory (2023-08-14 18:36:14 -0300)
>=20
> ----------------------------------------------------------------
> drm-ci for drm-misc-next
>=20
> Here is the patch that adds a ci/ subdirectory to drm and allows
> developers to easily execute tests.
>=20
> Developers can easily execute several tests on different devices
> by just pushing their branch to their fork in a repository hosted
> on gitlab.freedesktop.org which has an infrastructure to run jobs
> in several runners and farms with different devices.
>=20
> The patch was acked and tested by others.
>=20
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>=20
> ----------------------------------------------------------------
> Tomeu Vizoso (1):
>       drm: Add initial ci/ subdirectory
>=20
>  Documentation/gpu/automated=5Ftesting.rst            |  144 +
>  Documentation/gpu/index.rst                        |    1 +
>  MAINTAINERS                                        |    8 +
>  drivers/gpu/drm/ci/arm.config                      |   69 +
>  drivers/gpu/drm/ci/arm64.config                    |  199 ++
>  drivers/gpu/drm/ci/build-igt.sh                    |   35 +
>  drivers/gpu/drm/ci/build.sh                        |  157 ++
>  drivers/gpu/drm/ci/build.yml                       |  110 +
>  drivers/gpu/drm/ci/check-patch.py                  |   57 +
>  drivers/gpu/drm/ci/container.yml                   |   65 +
>  drivers/gpu/drm/ci/gitlab-ci.yml                   |  251 ++
>  drivers/gpu/drm/ci/igt=5Frunner.sh                   |   77 +
>  drivers/gpu/drm/ci/image-tags.yml                  |   15 +
>  drivers/gpu/drm/ci/lava-submit.sh                  |   57 +
>  drivers/gpu/drm/ci/static-checks.yml               |   12 +
>  drivers/gpu/drm/ci/test.yml                        |  335 +++
>  drivers/gpu/drm/ci/testlist.txt                    | 2912 ++++++++++=
++++++++++
>  drivers/gpu/drm/ci/x86=5F64.config                   |  111 +
>  drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |   19 +
>  drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |   21 +
>  drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |    2 +
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   17 +
>  drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |   32 +
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |    4 +
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |   58 +
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |    1 +
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |    6 +
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |   18 +
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |   38 +
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |    2 +
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |   19 +
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |   41 +
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |    5 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |   25 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |   26 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |    5 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |   37 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt      |    5 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |   11 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |   48 +
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |    1 +
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |    2 +
>  .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   29 +
>  .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |    0
>  .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   10 +
>  .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |   14 +
>  drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |   12 +
>  drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt    |    4 +
>  drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   15 +
>  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt   |    4 +
>  drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |    2 +
>  drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |    4 +
>  drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |    2 +
>  drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt     |   25 +
>  drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt    |    7 +
>  drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt     |   23 +
>  drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   68 +
>  drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |   11 +
>  drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |    2 +
>  .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |   48 +
>  .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |    9 +
>  .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |   52 +
>  .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |   36 +
>  .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   24 +
>  .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |    5 +
>  .../gpu/drm/ci/xfails/virtio=5Fgpu-none-fails.txt    |   38 +
>  .../gpu/drm/ci/xfails/virtio=5Fgpu-none-flakes.txt   |    0
>  .../gpu/drm/ci/xfails/virtio=5Fgpu-none-skips.txt    |    6 +
>  test                                               |    0
>  69 files changed, 5508 insertions(+)
>  create mode 100644 Documentation/gpu/automated=5Ftesting.rst
>  create mode 100644 drivers/gpu/drm/ci/arm.config
>  create mode 100644 drivers/gpu/drm/ci/arm64.config
>  create mode 100644 drivers/gpu/drm/ci/build-igt.sh
>  create mode 100644 drivers/gpu/drm/ci/build.sh
>  create mode 100644 drivers/gpu/drm/ci/build.yml
>  create mode 100755 drivers/gpu/drm/ci/check-patch.py
>  create mode 100644 drivers/gpu/drm/ci/container.yml
>  create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
>  create mode 100755 drivers/gpu/drm/ci/igt=5Frunner.sh
>  create mode 100644 drivers/gpu/drm/ci/image-tags.yml
>  create mode 100755 drivers/gpu/drm/ci/lava-submit.sh
>  create mode 100644 drivers/gpu/drm/ci/static-checks.yml
>  create mode 100644 drivers/gpu/drm/ci/test.yml
>  create mode 100644 drivers/gpu/drm/ci/testlist.txt
>  create mode 100644 drivers/gpu/drm/ci/x86=5F64.config
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.tx=
t
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.t=
xt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.=
txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.t=
xt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.=
txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.t=
xt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.=
txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.t=
xt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.t=
xt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.=
txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.t=
xt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio=5Fgpu-none-fails=
.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio=5Fgpu-none-flake=
s.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio=5Fgpu-none-skips=
.txt
>  create mode 100644 test
>=20


Please, disconsider this PR, I accidentally added this 'test' file to t=
he commit, I'll send another PR.
Sorry for the noise.

Regards,
Helen

