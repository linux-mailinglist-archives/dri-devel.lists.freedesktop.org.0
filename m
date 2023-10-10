Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B0B7C43D8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 00:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3804C10E3F2;
	Tue, 10 Oct 2023 22:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CF610E3F1;
 Tue, 10 Oct 2023 22:26:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39AMCnPV011275; Tue, 10 Oct 2023 22:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=xv0Gjg+joVOlaZpEpFY21QO8L0hxlQevTwtkdR1Pwco=;
 b=OMcigWsvaw+AzhRX0RypxnahAc1e3hCknz0jAUW8khs7+Y3/X38sF/TdbWeUOmvwMpUi
 v2E/8GuKw6Bthapj8qqQve2Q7KrRd5071KKTkeTKVVlcVdg2CUChRZCmanjFdOsxVUai
 rMcmAz+XHiVGdYfq1lr0YmBoAFr5NR+0oPHw7HSRitba4aHvpqSQcTBcfpgF+/NFojzB
 X3/0sfRN2jKPJ/X5ztXciDNEkprZ3mffCFRAi3deJe14bBBQ2T4v5VoW19ov97IxAW5E
 5YZCIVI1TuqTSY9QtRNnPxbh8OJI892DcTlnpaFaOljE4Ci6iM9xLrnAhlkrgqhCRHdA lw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tmt70agw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Oct 2023 22:26:02 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39AMQ1Jl030056
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Oct 2023 22:26:01 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 15:26:01 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 10 Oct 2023 15:25:37 -0700
Subject: [PATCH 3/3] drm/ci: Add skips, fails and flakes for SM8250
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231010-rb5-runner-v1-3-aba1fcc6e3aa@quicinc.com>
References: <20231010-rb5-runner-v1-0-aba1fcc6e3aa@quicinc.com>
In-Reply-To: <20231010-rb5-runner-v1-0-aba1fcc6e3aa@quicinc.com>
To: Helen Koike <helen.koike@collabora.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696976760; l=2877;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=FBKsDn3h4hy1sQmWkqPuWq5xEyp4ehteY0RlOawyx8w=;
 b=i+jdIjA3i43Qp15/7D+nsNQlJpghTFT7i3e2gUMV4qEjeBwADEU7RqKOrA+7HE7J7NbPoG6E4
 Dba2CZ1vw9qCoXUpj0Xje9dUUF6GzU6bm3T7csWxql8FtAKyjmy64bh
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Itv36f4ZWNG4PxYvJV_yjal5s3RRtIgi
X-Proofpoint-ORIG-GUID: Itv36f4ZWNG4PxYvJV_yjal5s3RRtIgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_18,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=286 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310100171
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
Cc: robdclark@chromium.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add skips, fails and flakes for the SM8250 test.

Generated using update-xfails.py [1]

[1] https://patchwork.freedesktop.org/patch/561453/?series=124793&rev=1

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt  | 29 +++++++++++++++++++++++++
 drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt |  3 +++
 drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt  |  8 +++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt
new file mode 100644
index 000000000000..cc8ae32e90e7
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt
@@ -0,0 +1,29 @@
+kms_3d,Fail
+kms_atomic_transition@plane-all-modeset-transition,Timeout
+kms_color@ctm-0-25,Fail
+kms_color@ctm-0-50,Fail
+kms_color@ctm-0-75,Fail
+kms_color@ctm-blue-to-red,Fail
+kms_color@ctm-negative,Fail
+kms_color@ctm-red-to-blue,Fail
+kms_color@ctm-signed,Fail
+kms_cursor_legacy@basic-flip-after-cursor-varying-size,Fail
+kms_cursor_legacy@basic-flip-before-cursor-varying-size,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
+kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size,Fail
+kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size,Fail
+kms_cursor_legacy@short-flip-before-cursor-toggle,Fail
+kms_hdmi_inject@inject-4k,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
+kms_plane@plane-position-covered,Fail
+kms_plane@plane-position-hole,Fail
+kms_plane@plane-position-hole-dpms,Fail
+kms_plane_alpha_blend@alpha-7efc,Fail
+kms_plane_alpha_blend@coverage-7efc,Fail
+kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
+kms_plane_cursor@overlay,Fail
+kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt
new file mode 100644
index 000000000000..0b55665184c1
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt
@@ -0,0 +1,3 @@
+kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
+kms_cursor_legacy@flip-vs-cursor-varying-size
+kms_plane_cursor@viewport
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt
new file mode 100644
index 000000000000..c20422c58e4d
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt
@@ -0,0 +1,8 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# reboots device
+kms_plane_scaling.*
+
+# long execution time
+kms_flip.*

-- 
2.42.0

