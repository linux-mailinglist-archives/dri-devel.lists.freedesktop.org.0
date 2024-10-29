Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85359B46B2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 11:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7723D10E619;
	Tue, 29 Oct 2024 10:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="dq2BcI8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD26210E615;
 Tue, 29 Oct 2024 10:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730197413; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lbafLUkha1XSBBwaea2ffSUzMSXrTQ1cW3UnaabXWHCAeBlFBMde0/0ebcmINnvMmQkOq3Kwvh2TXZZ+zhnlVOPSNGv2MSYR/4FtNo/yHfoJhI8Nh+DulPkW/qfUOTEQh6aN8Qt4dHd3mLhluoVJ7epRRow9j0f1AY3M7XgqYc4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730197413;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZcvFGmuKIn5F+FD3LHmd9Rw1SkwwzpbbyfbknJvL9ig=; 
 b=Y25OSFJ3ZtGWvF4mfAwizUIMNjLfpyn8YwuaxD0omgCbL9OAnCfzIoKaqrw4g7OQK62clyXtpvFfCE736zlytViu+d/1NFVIXu2EAfoXw/kz32KQoxGJsCUoVm398bPLWwZ69snOuqlAUqTQdSEeQl58m9hzwCCGUsf/urN57C4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730197413; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZcvFGmuKIn5F+FD3LHmd9Rw1SkwwzpbbyfbknJvL9ig=;
 b=dq2BcI8OuwF8JqrGef9Kqr5z8PlTIkQiPXTwMG2HwjIR5NiKKCICbiqE6TgwpzHV
 cmuNM1IrDS2dU9usCEmXoV0W+Rqx1aqm3ZUTVbk4whXjXlzwj7EX3Y9D43w1oLBBk7g
 t7nU91EFKdlYWbYZ/QLERGInV3VXaTjzCubm9lqU=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1730197412031650.5643214422845;
 Tue, 29 Oct 2024 03:23:32 -0700 (PDT)
Date: Tue, 29 Oct 2024 07:23:32 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 "dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
 "quic_abhinavk" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx" <intel-gfx@lists.freedesktop.org>,
 "virtualization" <virtualization@lists.linux.dev>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <192d7cd58a0.10e1410701042640.3125453199453264220@collabora.com>
In-Reply-To: <20241022094509.85510-3-vignesh.raman@collabora.com>
References: <20241022094509.85510-1-vignesh.raman@collabora.com>
 <20241022094509.85510-3-vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 2/2] drm/ci: add sm8350-hdk
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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





---- On Tue, 22 Oct 2024 06:45:05 -0300 Vignesh Raman  wrote ---

 > Add job that executes the IGT test suite for sm8350-hdk.=20
 > =20
 > Reviewed-by: Abhinav Kumar quic_abhinavk@quicinc.com>=20
 > Reviewed-by: Dmitry Baryshkov dmitry.baryshkov@linaro.org>=20
 > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com>=20

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

 > ---=20
 > =20
 > v2:=20
 >  - Add gitlab issue link for flake tests.=20
 > =20
 > ---=20
 >  drivers/gpu/drm/ci/arm64.config               |   7 +-=20
 >  drivers/gpu/drm/ci/build.sh                   |   1 +=20
 >  drivers/gpu/drm/ci/test.yml                   |  16 ++=20
 >  .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |  15 ++=20
 >  .../drm/ci/xfails/msm-sm8350-hdk-flakes.txt   |   6 +=20
 >  .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    | 211 ++++++++++++++++++=
=20
 >  6 files changed, 255 insertions(+), 1 deletion(-)=20
 >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt=
=20
 >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt=
=20
 >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt=
=20
 > =20
 > diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.=
config=20
 > index 66e70ced796f..a8fca079921b 100644=20
 > --- a/drivers/gpu/drm/ci/arm64.config=20
 > +++ b/drivers/gpu/drm/ci/arm64.config=20
 > @@ -90,7 +90,12 @@ CONFIG_QCOM_GPI_DMA=3Dy=20
 >  CONFIG_USB_ONBOARD_DEV=3Dy=20
 >  CONFIG_NVMEM_QCOM_QFPROM=3Dy=20
 >  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=3Dy=20
 > -=20
 > +CONFIG_REGULATOR_QCOM_REFGEN=3Dy=20
 > +CONFIG_TYPEC_MUX_FSA4480=3Dy=20
 > +CONFIG_QCOM_PMIC_GLINK=3Dy=20
 > +CONFIG_UCSI_PMIC_GLINK=3Dy=20
 > +CONFIG_QRTR=3Dy=20
 > +CONFIG_QRTR_SMD=3Dy=20
 > =20
 >  # db410c ethernet=20
 >  CONFIG_USB_RTL8152=3Dy=20
 > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh=
=20
 > index 5a3bdcffae32..139b81db6312 100644=20
 > --- a/drivers/gpu/drm/ci/build.sh=20
 > +++ b/drivers/gpu/drm/ci/build.sh=20
 > @@ -30,6 +30,7 @@ if [[ "$KERNEL_ARCH" =3D "arm64" ]]; then=20
 >  DEVICE_TREES+=3D" arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-=
r0.dtb"=20
 >  DEVICE_TREES+=3D" arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozee=
n-nots-r5.dtb"=20
 >  DEVICE_TREES+=3D" arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dt=
b"=20
 > +    DEVICE_TREES+=3D" arch/arm64/boot/dts/qcom/sm8350-hdk.dtb"=20
 >  elif [[ "$KERNEL_ARCH" =3D "arm" ]]; then=20
 >  GCC_ARCH=3D"arm-linux-gnueabihf"=20
 >  DEBIAN_ARCH=3D"armhf"=20
 > diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml=
=20
 > index d0bfe6aab58a..f0ef60c8f56d 100644=20
 > --- a/drivers/gpu/drm/ci/test.yml=20
 > +++ b/drivers/gpu/drm/ci/test.yml=20
 > @@ -162,6 +162,22 @@ msm:sdm845:=20
 >  script:=20
 >  - ./install/bare-metal/cros-servo.sh=20
 > =20
 > +msm:sm8350-hdk:=20
 > +  extends:=20
 > +    - .lava-igt:arm64=20
 > +  stage: msm=20
 > +  parallel: 4=20
 > +  variables:=20
 > +    BOOT_METHOD: fastboot=20
 > +    DEVICE_TYPE: sm8350-hdk=20
 > +    DRIVER_NAME: msm=20
 > +    DTB: ${DEVICE_TYPE}=20
 > +    FARM: collabora=20
 > +    GPU_VERSION: ${DEVICE_TYPE}=20
 > +    KERNEL_IMAGE_NAME: "Image.gz"=20
 > +    KERNEL_IMAGE_TYPE: ""=20
 > +    RUNNER_TAG: mesa-ci-x86-64-lava-sm8350-hdk=20
 > +=20
 >  .rockchip-device:=20
 >  variables:=20
 >  DTB: ${DEVICE_TYPE}=20
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/driver=
s/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt=20
 > new file mode 100644=20
 > index 000000000000..4892c0c70a6d=20
 > --- /dev/null=20
 > +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt=20
 > @@ -0,0 +1,15 @@=20
 > +kms_3d,Fail=20
 > +kms_cursor_legacy@forked-bo,Fail=20
 > +kms_cursor_legacy@forked-move,Fail=20
 > +kms_cursor_legacy@single-bo,Fail=20
 > +kms_cursor_legacy@single-move,Fail=20
 > +kms_cursor_legacy@torture-bo,Fail=20
 > +kms_cursor_legacy@torture-move,Fail=20
 > +kms_hdmi_inject@inject-4k,Fail=20
 > +kms_lease@lease-uevent,Fail=20
 > +kms_plane_alpha_blend@alpha-7efc,Fail=20
 > +kms_plane_alpha_blend@alpha-basic,Fail=20
 > +kms_plane_alpha_blend@alpha-opaque-fb,Fail=20
 > +kms_plane_alpha_blend@alpha-transparent-fb,Fail=20
 > +kms_plane_alpha_blend@constant-alpha-max,Fail=20
 > +msm/msm_recovery@gpu-fault-parallel,Fail=20
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt b/drive=
rs/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt=20
 > new file mode 100644=20
 > index 000000000000..c1859d9b165f=20
 > --- /dev/null=20
 > +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt=20
 > @@ -0,0 +1,6 @@=20
 > +# Board Name: sm8350-hdk=20
 > +# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/65=20
 > +# Failure Rate: 100=20
 > +# IGT Version: 1.28-ga73311079=20
 > +# Linux Version: 6.12.0-rc1=20
 > +msm/msm_recovery@gpu-fault=20
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/driver=
s/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt=20
 > new file mode 100644=20
 > index 000000000000..329770c520d9=20
 > --- /dev/null=20
 > +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt=20
 > @@ -0,0 +1,211 @@=20
 > +# Skip driver specific tests=20
 > +^amdgpu.*=20
 > +nouveau_.*=20
 > +^panfrost.*=20
 > +^v3d.*=20
 > +^vc4.*=20
 > +^vmwgfx*=20
 > +=20
 > +# Skip intel specific tests=20
 > +gem_.*=20
 > +i915_.*=20
 > +tools_test.*=20
 > +=20
 > +# Currently fails and causes coverage loss for other tests=20
 > +# since core_getversion also fails.=20
 > +core_hotunplug.*=20
 > +=20
 > +# Kernel panic=20
 > +msm/msm_mapping@ring=20
 > +# DEBUG - Begin test msm/msm_mapping@ring=20
 > +# [  200.874157] [IGT] msm_mapping: executing=20
 > +# [  200.880236] [IGT] msm_mapping: starting subtest ring=20
 > +# [  200.895243] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DPERMISSION source=3DCP (0,0,0,1)=20
 > +# [  200.906885] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  200.917625] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  200.928353] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  200.939084] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  200.949815] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  200.950227] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop=
.0] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 25 timed out waiting for=
 response=20
 > +# [  200.960467] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  200.960500] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  200.995966] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  201.006702] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  204.213387] platform 3d6a000.gmu: GMU watchdog expired=20
 > +# [  205.909103] adreno_fault_handler: 224274 callbacks suppressed=20
 > +# [  205.909108] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  205.925794] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  205.936529] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  205.947263] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  205.957997] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  205.968731] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  205.979465] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  205.990199] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  206.000932] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  206.011666] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  210.925090] adreno_fault_handler: 224511 callbacks suppressed=20
 > +# [  210.925096] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  210.941781] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  210.952517] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  210.963250] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  210.973985] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  210.984719] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  210.995452] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  211.006186] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  211.016921] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  211.027655] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  215.937100] adreno_fault_handler: 223760 callbacks suppressed=20
 > +# [  215.937106] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  215.953824] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  215.964573] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  215.975321] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  215.986067] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  215.996815] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  216.007563] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  216.018310] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  216.029057] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  216.039805] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  220.945182] adreno_fault_handler: 222822 callbacks suppressed=20
 > +# [  220.945188] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  220.961897] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  220.972645] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  220.983392] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  220.994140] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  221.004889] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  221.015636] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  221.026383] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  221.037130] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  221.047879] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  225.953179] adreno_fault_handler: 223373 callbacks suppressed=20
 > +# [  225.953184] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  225.969883] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  225.980617] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  225.991350] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  226.002084] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  226.012818] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  226.023551] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  226.034285] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  226.045019] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  226.055753] *** gpu fault: ttbr0=3D00000001160d6000 iova=3D0001000=
000001000 dir=3DWRITE type=3DUNKNOWN source=3DCP (0,0,0,1)=20
 > +# [  228.001087] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:=
=20
 > +# [  228.007412] rcu: =C2=A0=C2=A0=C2=A0=C2=A00-....: (524 ticks this G=
P) idle=3D4ffc/1/0x4000000000000000 softirq=3D9367/9368 fqs=3D29=20
 > +# [  228.017097] rcu: =C2=A0=C2=A0=C2=A0=C2=A0(detected by 1, t=3D6504 =
jiffies, g=3D29837, q=3D6 ncpus=3D8)=20
 > +# [  228.023959] Sending NMI from CPU 1 to CPUs 0:=20
 > +# [  228.161164] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [gpu=
-worker:150]=20
 > +# [  228.173169] Modules linked in:=20
 > +# [  228.176361] irq event stamp: 2809595=20
 > +# [  228.180083] hardirqs last  enabled at (2809594): [] exit_to_kernel=
_mode+0x38/0x130=20
 > +# [  228.189547] hardirqs last disabled at (2809595): [] el1_interrupt+=
0x24/0x64=20
 > +# [  228.198377] softirqs last  enabled at (1669060): [] handle_softirq=
s+0x4a4/0x4bc=20
 > +# [  228.207565] softirqs last disabled at (1669063): [] __do_softirq+0=
x14/0x20=20
 > +# [  228.216316] CPU: 0 UID: 0 PID: 150 Comm: gpu-worker Not tainted 6.=
12.0-rc1-g685d530dc83a #1=20
 > +# [  228.224966] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK =
(DT)=20
 > +# [  228.231730] pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)=20
 > +# [  228.238948] pc : tcp_fastretrans_alert+0x0/0x884=20
 > +# [  228.243751] lr : tcp_ack+0x9d4/0x1238=20
 > +# [  228.247562] sp : ffff8000800036d0=20
 > +# [  228.251011] x29: ffff8000800036d0 x28: 000000000000000c x27: 00000=
00000000001=20
 > +# [  228.258421] x26: ffff704683cd8000 x25: 0000000000000403 x24: ffff7=
0468b7e7c00=20
 > +# [  228.265829] x23: 0000000000000000 x22: 0000000000000004 x21: 00000=
0000000140f=20
 > +# [  228.273237] x20: 00000000f1de79f7 x19: 00000000f1de7a5f x18: 00000=
00000000001=20
 > +# [  228.280644] x17: 00000000302d6762 x16: 632d6b64682d3035 x15: ffff7=
04683c39000=20
 > +# [  228.288051] x14: 00000000000e2000 x13: ffff704683df6000 x12: 00000=
00000000000=20
 > +# [  228.295458] x11: 00000000000000a0 x10: 0000000000000000 x9 : ffffd=
3bc551a9a20=20
 > +# [  228.302865] x8 : ffff800080003640 x7 : 0000000000040faa x6 : 00000=
000ffff9634=20
 > +# [  228.310271] x5 : 00000000000005a8 x4 : ffff800080003788 x3 : ffff8=
0008000377c=20
 > +# [  228.317679] x2 : 0000000000000000 x1 : 00000000f1de79f7 x0 : ffff7=
04683cd8000=20
 > +# [  228.325087] Call trace:=20
 > +# [  228.327640]  tcp_fastretrans_alert+0x0/0x884=20
 > +# [  228.332082]  tcp_rcv_established+0x7c4/0x8bc=20
 > +# [  228.336523]  tcp_v4_do_rcv+0x244/0x31c=20
 > +# [  228.340429]  tcp_v4_rcv+0xcc4/0x1084=20
 > +# [  228.344155]  ip_protocol_deliver_rcu+0x64/0x218=20
 > +# [  228.348862]  ip_local_deliver_finish+0xb8/0x1ac=20
 > +# [  228.353566]  ip_local_deliver+0x84/0x254=20
 > +# [  228.357651]  ip_sublist_rcv_finish+0x84/0xb8=20
 > +# [  228.362092]  ip_sublist_rcv+0x11c/0x2f0=20
 > +# [  228.366081]  ip_list_rcv+0xfc/0x190=20
 > +# [  228.369711]  __netif_receive_skb_list_core+0x174/0x208=20
 > +# [  228.375050]  netif_receive_skb_list_internal+0x204/0x3ac=20
 > +# [  228.380564]  napi_complete_done+0x64/0x1d0=20
 > +# [  228.384826]  lan78xx_poll+0x71c/0x9cc=20
 > +# [  228.388638]  __napi_poll.constprop.0+0x3c/0x254=20
 > +# [  228.393341]  net_rx_action+0x164/0x2d4=20
 > +# [  228.397244]  handle_softirqs+0x128/0x4bc=20
 > +# [  228.401329]  __do_softirq+0x14/0x20=20
 > +# [  228.404958]  ____do_softirq+0x10/0x1c=20
 > +# [  228.408769]  call_on_irq_stack+0x24/0x4c=20
 > +# [  228.412854]  do_softirq_own_stack+0x1c/0x28=20
 > +# [  228.417199]  __irq_exit_rcu+0x124/0x164=20
 > +# [  228.421188]  irq_exit_rcu+0x10/0x38=20
 > +# [  228.424819]  el1_interrupt+0x38/0x64=20
 > +# [  228.428546]  el1h_64_irq_handler+0x18/0x24=20
 > +# [  228.432807]  el1h_64_irq+0x64/0x68=20
 > +# [  228.436354]  lock_acquire+0x214/0x32c=20
 > +# [  228.440166]  __mutex_lock+0x98/0x3d0=20
 > +# [  228.443893]  mutex_lock_nested+0x24/0x30=20
 > +# [  228.447978]  fault_worker+0x58/0x184=20
 > +# [  228.451704]  kthread_worker_fn+0xf4/0x320=20
 > +# [  228.455873]  kthread+0x114/0x118=20
 > +# [  228.459243]  ret_from_fork+0x10/0x20=20
 > +# [  228.462970] Kernel panic - not syncing: softlockup: hung tasks=20
 > +# [  228.469018] CPU: 0 UID: 0 PID: 150 Comm: gpu-worker Tainted: G    =
         L     6.12.0-rc1-g685d530dc83a #1=20
 > +# [  228.479190] Tainted: [L]=3DSOFTLOCKUP=20
 > +# [  228.482815] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK =
(DT)=20
 > +# [  228.489574] Call trace:=20
 > +# [  228.492125]  dump_backtrace+0x98/0xf0=20
 > +# [  228.495931]  show_stack+0x18/0x24=20
 > +# [  228.499380]  dump_stack_lvl+0x38/0xd0=20
 > +# [  228.503189]  dump_stack+0x18/0x24=20
 > +# [  228.506639]  panic+0x3bc/0x41c=20
 > +# [  228.509826]  watchdog_timer_fn+0x254/0x2e4=20
 > +# [  228.514087]  __hrtimer_run_queues+0x3b0/0x40c=20
 > +# [  228.518612]  hrtimer_interrupt+0xe8/0x248=20
 > +# [  228.522777]  arch_timer_handler_virt+0x2c/0x44=20
 > +# [  228.527399]  handle_percpu_devid_irq+0xa8/0x2c4=20
 > +# [  228.532103]  generic_handle_domain_irq+0x2c/0x44=20
 > +# [  228.536902]  gic_handle_irq+0x4c/0x11c=20
 > +# [  228.540802]  do_interrupt_handler+0x50/0x84=20
 > +# [  228.545146]  el1_interrupt+0x34/0x64=20
 > +# [  228.548870]  el1h_64_irq_handler+0x18/0x24=20
 > +# [  228.553128]  el1h_64_irq+0x64/0x68=20
 > +# [  228.556672]  tcp_fastretrans_alert+0x0/0x884=20
 > +# [  228.561110]  tcp_rcv_established+0x7c4/0x8bc=20
 > +# [  228.565548]  tcp_v4_do_rcv+0x244/0x31c=20
 > +# [  228.569449]  tcp_v4_rcv+0xcc4/0x1084=20
 > +# [  228.573171]  ip_protocol_deliver_rcu+0x64/0x218=20
 > +# [  228.577873]  ip_local_deliver_finish+0xb8/0x1ac=20
 > +# [  228.582574]  ip_local_deliver+0x84/0x254=20
 > +# [  228.586655]  ip_sublist_rcv_finish+0x84/0xb8=20
 > +# [  228.591092]  ip_sublist_rcv+0x11c/0x2f0=20
 > +# [  228.595079]  ip_list_rcv+0xfc/0x190=20
 > +# [  228.598706]  __netif_receive_skb_list_core+0x174/0x208=20
 > +# [  228.604039]  netif_receive_skb_list_internal+0x204/0x3ac=20
 > +# [  228.609549]  napi_complete_done+0x64/0x1d0=20
 > +# [  228.613808]  lan78xx_poll+0x71c/0x9cc=20
 > +# [  228.617614]  __napi_poll.constprop.0+0x3c/0x254=20
 > +# [  228.622314]  net_rx_action+0x164/0x2d4=20
 > +# [  228.626214]  handle_softirqs+0x128/0x4bc=20
 > +# [  228.630297]  __do_softirq+0x14/0x20=20
 > +# [  228.633923]  ____do_softirq+0x10/0x1c=20
 > +# [  228.637729]  call_on_irq_stack+0x24/0x4c=20
 > +# [  228.641811]  do_softirq_own_stack+0x1c/0x28=20
 > +# [  228.646152]  __irq_exit_rcu+0x124/0x164=20
 > +# [  228.650139]  irq_exit_rcu+0x10/0x38=20
 > +# [  228.653768]  el1_interrupt+0x38/0x64=20
 > +# [  228.657491]  el1h_64_irq_handler+0x18/0x24=20
 > +# [  228.661750]  el1h_64_irq+0x64/0x68=20
 > +# [  228.665293]  lock_acquire+0x214/0x32c=20
 > +# [  228.669098]  __mutex_lock+0x98/0x3d0=20
 > +# [  228.672821]  mutex_lock_nested+0x24/0x30=20
 > +# [  228.676903]  fault_worker+0x58/0x184=20
 > +# [  228.680626]  kthread_worker_fn+0xf4/0x320=20
 > +# [  228.684790]  kthread+0x114/0x118=20
 > +# [  228.688156]  ret_from_fork+0x10/0x20=20
 > +# [  228.691882] SMP: stopping secondary CPUs=20
 > +# [  229.736843] SMP: failed to stop secondary CPUs 1,4=20
 > +# [  229.741827] Kernel Offset: 0x53bbd1880000 from 0xffff800080000000=
=20
 > +# [  229.748159] PHYS_OFFSET: 0xfff08fba80000000=20
 > +# [  229.752499] CPU features: 0x18,00000017,00200928,4200720b=20
 > +# [  229.758095] Memory Limit: none=20
 > +# [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung =
tasks ]---=20
 > --=20
 > 2.43.0=20
 > =20
 >=20

