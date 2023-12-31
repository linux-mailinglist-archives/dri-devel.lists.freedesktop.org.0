Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637658209E1
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 07:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98F510E07B;
	Sun, 31 Dec 2023 06:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118D810E046;
 Sun, 31 Dec 2023 06:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Pdi5ZtHpaZp9Kggr/yaJ0U8/BDWSSZaYMUzC+gCeArI=; b=NrvB6Tb8ns3knSE1FFQWcCpQmA
 TBARokTfNINIlgExGe1w8/dUTRRFP/ErXNL/TONz8XXT9zP/1KGvyCo7F+XVkPt4nXGIabttUdnze
 ln3vUlceKcMCd2Mjrt07AOtKr7WW/E3Yf47VxVOBdg1+HdqZp827wzcU7mnbrDERuCV610OENFD2P
 OC7Hn/dHpFHRIN2/fA1ktDGxEmzAHpXGRFV/PeazBJ1Ldu9LQqKWTvOMPhuxwDWbmZNk9V16Gy+9r
 ZMepz4aSi5NTk7AcQbiCPBpFdzhi/D5AmJfyeV1jxeEDw76guY3fGxrs3W4dzw5d0yODviTdiXTa6
 cc6hxB1w==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rJozo-0042hK-2l; Sun, 31 Dec 2023 06:08:24 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: fix kernel-doc warnings
Date: Sat, 30 Dec 2023 22:08:23 -0800
Message-ID: <20231231060823.1934-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, Vegard Nossum <vegard.nossum@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct all kernel-doc warnings in dpu_encoder.c and dpu_rm.c:

dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb' description in 'dpu_encoder_virt'
dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb_data' description in 'dpu_encoder_virt'
dpu_encoder.c:212: warning: Excess struct member 'debugfs_root' description in 'dpu_encoder_virt'

dpu_rm.c:35: warning: Excess struct member 'hw_res' description in 'dpu_rm_requirements'
dpu_rm.c:208: warning: No description found for return value of '_dpu_rm_get_lm_peer'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vegard Nossum <vegard.nossum@oracle.com>
-- 
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |    4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |    3 ++-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff -- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -144,10 +144,6 @@ enum dpu_enc_rc_states {
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
  * @connector:		If a mode is set, cached pointer to the active connector
- * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
- *				all CTL paths
- * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
- * @debugfs_root:		Debug file system root file node
  * @enc_lock:			Lock around physical encoder
  *				create/destroy/enable/disable
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
diff -- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -29,7 +29,6 @@ static inline bool reserved_by_other(uin
 /**
  * struct dpu_rm_requirements - Reservation requirements parameter bundle
  * @topology:  selected topology for the display
- * @hw_res:	   Hardware resources required as reported by the encoders
  */
 struct dpu_rm_requirements {
 	struct msm_display_topology topology;
@@ -204,6 +203,8 @@ static bool _dpu_rm_needs_split_display(
  * _dpu_rm_get_lm_peer - get the id of a mixer which is a peer of the primary
  * @rm: dpu resource manager handle
  * @primary_idx: index of primary mixer in rm->mixer_blks[]
+ *
+ * Returns: lm peer mixed id on success or %-EINVAL on error
  */
 static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
 {
