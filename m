Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE8AC84E0
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 01:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAC310E2A4;
	Thu, 29 May 2025 23:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcHQc3rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1737310E283
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1Qbe013825
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w9T6LjH71u9zQzlGudP+qBcjCF5Cn/3FIBo8ObljvB4=; b=ZcHQc3rvA7phTslz
 WQBad+h15HW1V9ljZeSKT6KzIE0xo4633oqLhZPzdLJbRnPtnfw5qc5BLc6cawzt
 5CxoqKAvxiSZU7dEoULAmD0ohmR31RfZwo3Y1dNauszmHoGIsOFylGhJxGovR0pE
 41Ryfa4f1DtYM7TDDkSWCppkuPUenm3nQWr+tc5FlwGp1lrVv0SkfyDs8RGI96ik
 avhGIhnNCOwFxV1fGXy1M4pL6ddHcKKHhed9QCvhQ1ha6UB1Oeq0c5Ly7H27Dmc/
 AKxCcjk3HdYUjZ7jcPMSuCARjusr0B7oMCdgi+vkR/8antwimGlXAKx807SHbSyI
 L5Glcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm11td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b26e4fe0c08so1027798a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 16:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748560523; x=1749165323;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w9T6LjH71u9zQzlGudP+qBcjCF5Cn/3FIBo8ObljvB4=;
 b=FLViD+EhJBeHFgjq3WaK7y5I/wKlnyCcdv8pV+qEke7XIbO5bjvs1bPL1MwAzuroNI
 8+FG2hDdk89zGWHomQQF0ezv77JiQ1TVjrMEAx31/6SxZmsADASwqX8zuK7knsGLDnlv
 T09CqTwMNPeVrodQVoPOrinboN1310K5N3M8LfYsKnGDbJRbl1lKs+eoaLJI7n03oIsx
 221Yxbk5g05EsFrsaA8JpLIyDl3DkhcvtTD255DxuVxaWQXwamQLeDdY9avXqbYJzSIx
 KcjdyLGGlx7mS0tF0AI4YxOdwnPVMsPE51Ev25JufykiALQdb4YuMYRHNaE+Py2+R87h
 c+Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtJmRTq/erhrtICzLlQjfIEuDOZVAbLXilwsBI1Z+U+Jd7JerNErCf/T5Ws97AXPf9VV11AkCPBbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfvqBOm6evUKl/ZYFVAC/BdxdtfY/FaGamtPlW6Ij3iWMRwB7Q
 H4RHMxt9rbjayV7l7Z86x6o3PkGnONNQ3/LwksfG1BQsJ/7TqsRN3pp802pCouqjemK/XsSukms
 qYhQVvJaLYokQuzDpprJQDS3tSbu94yUK7H1MLIw7ZC1fcODk+EQFUsw9mclbTuIeWGoGUBs=
X-Gm-Gg: ASbGncvnmofQa6S+GLx+mU9tNkRfdjY7PYI28FG6em+ylfDMTXpXqjvgdE0A0COEZJh
 sqRau1XfJz5wQMoWFRFp7tTKAPc+IE+WVyUYGKyiAcHWOzWlluAF9YM6VRy9t1MRBIHFIUN/PF+
 MLVpPOLucFumPzID0/NNYzfLfluH4+Jy4rar6o9I2xwjBhzp2SqjRih649WLH3uMmhbbBsg1IU7
 or5LNeg5J7cKhxTAlm3oOrYWSyhvjrE+77YaE7VpWm6MIwn33QpPl8A2MYER51/lnD2vEb4YF97
 VLptqvzjuN2fAiW2cRmfzbmnGdRmY9wgT3+PRN5lYH+AYbVImXNi5b89dSXvSpnIqHkrBooy
X-Received: by 2002:a17:90b:180b:b0:2f6:dcc9:38e0 with SMTP id
 98e67ed59e1d1-3123efab981mr2365854a91.0.1748560523499; 
 Thu, 29 May 2025 16:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO6kVlTul5XfVExNVHlCfMfXtoSx3A+pScknURIeoMKwp8UajMgtsqcqSsCFhBesXHbzaNgA==
X-Received: by 2002:a17:90b:180b:b0:2f6:dcc9:38e0 with SMTP id
 98e67ed59e1d1-3123efab981mr2365796a91.0.1748560523026; 
 Thu, 29 May 2025 16:15:23 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 16:15:22 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:43 -0700
Subject: [PATCH 1/4] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-1-ce33bac2987c@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=2307;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=iZ6m38kGUh6Wu9/l4YZxdyErgIvmhQUC45GosLwQHF4=;
 b=JzwNwtaiIIBM44Wr7k3CgOFsd6RO8xdIk4KnRV24BqdwI98BPsxzhcx12py1hq5JImcnhpaHq
 ewjnk+F5+XNDjmSGQssJk40wWDDN1VwB18kGz3ZAu0MJUSg9qNEa3Z9
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: rIvD_n2OzFBocleTx4kGvFWuQN6Bxhip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfXz6R72zGUoAUk
 7/6RaUCbf2BUDGwSefxkNiO5VwdFyvN/ePpSQ+wxXqMY4RQ4Dset3waRHf8zhxBgjBsiBkvqFHi
 CD+cNF3kDxLdAcRjkmZCSYcCSo9CjnahI+QEHfNs9S/74c4Z2OYNLhYX6NGdjuhB5M5dOky6ruW
 v6FOJtOJ5KNbt6oqdyE3fs1Z/gxwF0ImXw3EwfecJPLiwVIv4Kw5yMVEx7T3RdUWVxkWATz+V/z
 tKbACi2Axfh207HAamv0Xrf2g5U/f5fJcr7m5yRGab0Cba1KYPOGTwLkGIbd8/w7Kl6f4DUgWg2
 ui2+gDLRWZKTempTmkpMOk3wG9Z1BkGxlbu0R9FdjsI4noWqTKFhG1OJ3tmzwnOM2uBVJhIaX4Y
 qcJW295BaSYBhMTsBxHF4bjCjyyXpp2/mx+0fbOLnVe70ZgNrzSB5XLm4javVV9x+dvE/Brm
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6838ea8c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=PbHRmTaTmGSOozFvvjEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rIvD_n2OzFBocleTx4kGvFWuQN6Bxhip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon
Chipsets"), checks were introduced to avoid handling any plug or irq hpd
events in ST_DISPLAY_OFF state.

Even if we do get hpd events, after the bridge was disabled,
it should get handled. Moreover, its unclear under what circumstances
these events will fire because ST_DISPLAY_OFF means that the link was
still connected but only the bridge was disabled. If the link was
untouched, then interrupts shouldn't fire.

Even in the case of the DP compliance equipment, it should be raising these
interrupts during the start of the test which is usually accompanied with
either a HPD pulse or a IRQ HPD but after the bridge is disabled it should
be fine to handle these anyway. In the absence of a better reason to keep
these checks, drop these and if any other issues do arise, it should be
handled in a different way.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 386c4669c831..1d7cda62d5fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -579,11 +579,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -706,11 +701,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
 		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */

-- 
2.49.0

