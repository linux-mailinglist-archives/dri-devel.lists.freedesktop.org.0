Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D95CCF759
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7259710E46E;
	Fri, 19 Dec 2025 10:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2407E10E46E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:49:51 +0000 (UTC)
Received: from ehlo.thunderbird.net (161-51-78-170.static.ef-service.nl
 [161.51.78.170])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D3E9020386;
 Fri, 19 Dec 2025 11:49:49 +0100 (CET)
Date: Fri, 19 Dec 2025 11:49:51 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_Revert_=22drm/msm/dpu=3A_Ena?=
 =?US-ASCII?Q?ble_quad-pipe_for_DSC_and_dual-DSI_case=22?=
User-Agent: Thunderbird for Android
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
Message-ID: <A6CA2415-5FCE-4DE3-9E3B-2F68913F898B@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19 December 2025 11:39:02 CET, Abel Vesa <abel=2Evesa@oss=2Equalcomm=2Ec=
om> wrote:
>This reverts commit d7ec9366b15cd04508fa015cb94d546b1c01edfb=2E
>
>The dual-DSI dual-DSC scenario seems to be broken by this commit=2E
>
>Reported-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>Closes: https://lore=2Ekernel=2Eorg/r/aUR2b3FOSisTfDFj@SoMainline=2Eorg
>Signed-off-by: Abel Vesa <abel=2Evesa@oss=2Equalcomm=2Ecom>

Thanks! That kicks off one dependency for actually sending this 2:2:2 pane=
l and DTS for the Sony Xperia 1 III and onwards=2E

Reviewed-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>

>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec         | 27 ++++++----------=
------
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Eh         |  6 ++---
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder=2Ec      | 29 ++++++++++++++++=
--------
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh |  2 +-
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh   |  2 +-
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss=2Eh      |  2 +-
> 6 files changed, 33 insertions(+), 35 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc=2Ec
>index 011946bbf5a2=2E=2E2d06c950e814 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec
>@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
> 		struct dpu_crtc_state *crtc_state)
> {
> 	struct dpu_crtc_mixer *m;
>-	u32 crcs[CRTC_QUAD_MIXERS];
>+	u32 crcs[CRTC_DUAL_MIXERS];
>=20
> 	int rc =3D 0;
> 	int i;
>@@ -1328,7 +1328,6 @@ static struct msm_display_topology dpu_crtc_get_top=
ology(
> 	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> 	struct msm_display_topology topology =3D {0};
> 	struct drm_encoder *drm_enc;
>-	u32 num_rt_intf;
>=20
> 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
> 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>@@ -1342,14 +1341,11 @@ static struct msm_display_topology dpu_crtc_get_t=
opology(
> 	 * Dual display
> 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> 	 *
>-	 * If DSC is enabled, try to use 4:4:2 topology if there is enough
>-	 * resource=2E Otherwise, use 2:2:2 topology=2E
>-	 *
> 	 * Single display
> 	 * 1 LM, 1 INTF
> 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> 	 *
>-	 * If DSC is enabled, use 2:2:1 topology
>+	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
> 	 *
> 	 * Add dspps to the reservation requirements if ctm is requested
> 	 *
>@@ -1361,23 +1357,14 @@ static struct msm_display_topology dpu_crtc_get_t=
opology(
> 	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check=2E
> 	 */
>=20
>-	num_rt_intf =3D topology=2Enum_intf;
>-	if (topology=2Ecwb_enabled)
>-		num_rt_intf--;
>-
>-	if (topology=2Enum_dsc) {
>-		if (dpu_kms->catalog->dsc_count >=3D num_rt_intf * 2)
>-			topology=2Enum_dsc =3D num_rt_intf * 2;
>-		else
>-			topology=2Enum_dsc =3D num_rt_intf;
>-		topology=2Enum_lm =3D topology=2Enum_dsc;
>-	} else if (num_rt_intf =3D=3D 2) {
>+	if (topology=2Enum_intf =3D=3D 2 && !topology=2Ecwb_enabled)
>+		topology=2Enum_lm =3D 2;
>+	else if (topology=2Enum_dsc =3D=3D 2)
> 		topology=2Enum_lm =3D 2;
>-	} else if (dpu_kms->catalog->caps->has_3d_merge) {
>+	else if (dpu_kms->catalog->caps->has_3d_merge)
> 		topology=2Enum_lm =3D (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>-	} else {
>+	else
> 		topology=2Enum_lm =3D 1;
>-	}
>=20
> 	if (crtc_state->ctm)
> 		topology=2Enum_dspp =3D topology=2Enum_lm;
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Eh b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc=2Eh
>index 2c83f1578fc3=2E=2E94392b9b9245 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Eh
>@@ -210,7 +210,7 @@ struct dpu_crtc_state {
>=20
> 	bool bw_control;
> 	bool bw_split_vote;
>-	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
>+	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
>=20
> 	uint64_t input_fence_timeout_ns;
>=20
>@@ -218,10 +218,10 @@ struct dpu_crtc_state {
>=20
> 	/* HW Resources reserved for the crtc */
> 	u32 num_mixers;
>-	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
>+	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
>=20
> 	u32 num_ctls;
>-	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
>+	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
>=20
> 	enum dpu_crtc_crc_source crc_source;
> 	int crc_frame_skip_count;
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder=2Ec b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder=2Ec
>index d1cfe81a3373=2E=2E9f3957f24c6a 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder=2Ec
>@@ -55,7 +55,7 @@
> #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
>=20
>-#define MAX_CHANNELS_PER_ENC 4
>+#define MAX_CHANNELS_PER_ENC 2
> #define MAX_CWB_PER_ENC 2
>=20
> #define IDLE_SHORT_TIMEOUT	1
>@@ -661,6 +661,7 @@ void dpu_encoder_update_topology(struct drm_encoder *=
drm_enc,
> 	struct dpu_encoder_virt *dpu_enc =3D to_dpu_encoder_virt(drm_enc);
> 	struct msm_drm_private *priv =3D dpu_enc->base=2Edev->dev_private;
> 	struct msm_display_info *disp_info =3D &dpu_enc->disp_info;
>+	struct dpu_kms *dpu_kms =3D to_dpu_kms(priv->kms);
> 	struct drm_connector *connector;
> 	struct drm_connector_state *conn_state;
> 	struct drm_framebuffer *fb;
>@@ -674,12 +675,22 @@ void dpu_encoder_update_topology(struct drm_encoder=
 *drm_enc,
>=20
> 	dsc =3D dpu_encoder_get_dsc_config(drm_enc);
>=20
>-	/*
>-	 * Set DSC number as 1 to mark the enabled status, will be adjusted
>-	 * in dpu_crtc_get_topology()
>-	 */
>-	if (dsc)
>-		topology->num_dsc =3D 1;
>+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
>+	if (dsc) {
>+		/*
>+		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
>+		 * when Display Stream Compression (DSC) is enabled,
>+		 * and when enough DSC blocks are available=2E
>+		 * This is power-optimal and can drive up to (including) 4k
>+		 * screens=2E
>+		 */
>+		WARN(topology->num_intf > 2,
>+		     "DSC topology cannot support more than 2 interfaces\n");
>+		if (topology->num_intf >=3D 2 || dpu_kms->catalog->dsc_count >=3D 2)
>+			topology->num_dsc =3D 2;
>+		else
>+			topology->num_dsc =3D 1;
>+	}
>=20
> 	connector =3D drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> 	if (!connector)
>@@ -2169,8 +2180,8 @@ static void dpu_encoder_helper_reset_mixers(struct =
dpu_encoder_phys *phys_enc)
> {
> 	int i, num_lm;
> 	struct dpu_global_state *global_state;
>-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>-	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
>+	struct dpu_hw_blk *hw_lm[2];
>+	struct dpu_hw_mixer *hw_mixer[2];
> 	struct dpu_hw_ctl *ctl =3D phys_enc->hw_ctl;
>=20
> 	/* reset all mixers for this encoder */
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh
>index 09395d7910ac=2E=2E61b22d949454 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys=2Eh
>@@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_help=
er_get_3d_blend_mode(
>=20
> 	/* Use merge_3d unless DSC MERGE topology is used */
> 	if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
>-	    (dpu_cstate->num_mixers !=3D 1) &&
>+	    dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS &&
> 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
> 		return BLEND_3D_H_ROW_INT;
>=20
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh
>index 336757103b5a=2E=2E4964e70610d1 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh
>@@ -24,7 +24,7 @@
> #define DPU_MAX_IMG_WIDTH 0x3fff
> #define DPU_MAX_IMG_HEIGHT 0x3fff
>=20
>-#define CRTC_QUAD_MIXERS	4
>+#define CRTC_DUAL_MIXERS	2
>=20
> #define MAX_XIN_COUNT 16
>=20
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss=2Eh b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss=2Eh
>index 31451241f083=2E=2E046b683d4c66 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss=2Eh
>@@ -34,7 +34,7 @@
> #define DPU_MAX_PLANES			4
> #endif
>=20
>-#define STAGES_PER_PLANE		2
>+#define STAGES_PER_PLANE		1
> #define PIPES_PER_STAGE			2
> #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
> #ifndef DPU_MAX_DE_CURVES
>

