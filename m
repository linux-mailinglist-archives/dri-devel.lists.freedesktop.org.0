Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76AB028A1
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AC110EB15;
	Sat, 12 Jul 2025 00:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="boHp7gWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7768810EB13
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:51 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BMojIS018184
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7sLJEL4Y5lJZguz3eyBuo3UOb2LWXxlleh1DhGvnHak=; b=boHp7gWTt5GjwyVG
 d6rxAUCcj9DL6VBNPZR+42TaXUrC/Fm+CGZQA/7I+YeuA58sxmCBwy6Ukg60fHMO
 UZ0AQVt1Ixdwh4+Y9ZA1D2l64D2XDnn0MnZIaMGzVPlPKDiLVJAd3AiuOApmILVn
 l1hiQwLcNe4NXApwSl+OZz1Dyb4oF/97+TNVyot7yp2kJeIZ8PSmD8BLnfvLae4N
 l351z2l+Z7N+6Gqiw2Mv2ibYKGbR5kadlmLP0MLRLpShOw5ojIcBpKDOKRnuE143
 ISilALVm7hJEWuhJQ+fahJwgvNoGjGG2UrbVDm79OEw1PTLKk4Z3D6iSx4cFYjXq
 qUF0gA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf345ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3141a9a6888so2519077a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281930; x=1752886730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sLJEL4Y5lJZguz3eyBuo3UOb2LWXxlleh1DhGvnHak=;
 b=WISbh51s6rbjeNkDU/bbT7/Phydm8maYS1v53F1aiYKKlMoPFXZWtmgatGY/FkjlmL
 N6dCfBUbs6EpQNzrMaRhqeUCala4gBF1V+9gMhwfAcilbH9BHmEMU1+cCXKY/LPwnQRa
 qeN/V1Tfloit01zcwUs3YrOGMYvxxP1uGiH8HT8R/pL/zVrUD9py058cPM1Eu+LH3hYj
 rwJRLsCVYCOZ7O2weY+NDgqjY+q//VUBKybEQWmbe4t3ypWlGpahrE6xIBaLmOrG4tSO
 40tYq1CAHEsBoUoo+fTARe25q+9dBjIWp2Qp6tKYKlUPE6+UhLKVKizSNbfCXDfWycFY
 LRdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW497cUwmnaJbmU5Dhe9sA1JsZ/+VTutCDwFjzWw56t1w53fG87F9Vb62MVyYbtFW5hplAszlO+OC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSBxSJFkbe5ZgWVMHKGhoRy+l7KTt71a93sZnHMSZ721SBIT3S
 6JqDUSmRQUBZVdRfoUGeGxW6SwEIxVo0tjc8PjsaiFdGuXT3km18SHGFnbnWIPf/E2sox6IXI+E
 bxqxzHNKUiViMCOXZXQlSPhZfxcBCVG5np8kOdrEN05GkUN5vzFoDkKlu4BBXDOjawMOKOAk=
X-Gm-Gg: ASbGnctVO3x5URo3NOeBzgLzqBWuS4e1JfFCEHVLhdtpW5w4N3NqAWGsMjybBvvqW0y
 aH0PZGtt2Myo8WP8pXf+EvIELW8NZCtFGEfTbfQUtdS3RY47Eak7HQ0Jll+5JyHowV+QzDGZSoA
 7JN3okMHy34YAiSk5S63ppyjmKQ+Hk2hX9TtYLuR3iMZXWcj8PDxK42KXXGE0SuebPZvpqeOwk8
 6X3XgIEj5Fmr7Dq8/lwEMKo1MALBEF7nVChE4SAn+bzoZaDXsjIb932XKvzyThyGCPp6WrJ79aH
 JTOJi7HWcmOYvt3Pcx7TptDYzKvG7R0UHwN+AUnqQ7CP04ODUUd1P5f8YucjynrfXloF899KuGs
 hj9pc3utCC3UOU412pcJb/Aw7
X-Received: by 2002:a17:90a:d88f:b0:2fe:e9c6:689e with SMTP id
 98e67ed59e1d1-31c50d7b0e2mr5926412a91.8.1752281930192; 
 Fri, 11 Jul 2025 17:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwePogEFfPtz3jAzJvuYrrBkkmysTcdFzL7yxrfrSVdKodFresGxmdbEN7GKCEIj11A4IDg==
X-Received: by 2002:a17:90a:d88f:b0:2fe:e9c6:689e with SMTP id
 98e67ed59e1d1-31c50d7b0e2mr5926385a91.8.1752281929755; 
 Fri, 11 Jul 2025 17:58:49 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:49 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:20 -0700
Subject: [PATCH 15/19] drm/msm/dp: Drop ST_DISCONNECT_PENDING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-15-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1224;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=9kVJAzY2UVngycfebqlTXxBWX8Abe2dBrz4IzUnf9Vc=;
 b=CYGPKGabSZ/+TIsiQAZHb2A3eC/F6u/eET7zLcbCthqfB2ue7vTy3EREyb3X+n5CiyHbVY84j
 Y/BXfFJMiXUA/hiWbzM8LmB5YRERO18jZHLTmDJU4AEqP3Ua3kRWLdX
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX16Ryl+Yae30l
 xMlsfSFJgQyQNn/+59dkEHLfjVSO/al9Wr7Z6Ceh6i3rSIWvYEbOzexq+G658DcNjolTGI5vjR3
 y05I5V93KD3IwEsf71MYNoBoboZBc+xQGOC6PwQZGs8MKRjgJ7zHgVbc3HcpueyEuif9raIf4Wq
 EIQHVbp+CqJYyZw19bpoossgyW+cMMtSzxk/9fBzJKJGuKygOVva0wiOrzbiVE5vt1fLcB5B5DM
 Q0fIUfLQic8N/+a48JWUYvw3l8GLGm4x9eGJrJj6yyWbeVH+JS/iqqvT8UokZBjpJMea1WJZEY0
 iDwNq2vDFP2qD7cm/CC+Zu9NwtMvbHAGujepE35mBfmbNTmlhWU4uvhW3wPlm3dhxoMOeStZvrb
 NtLyI6jSmBu9Czhrd2wAliMVOD+S7pyjnYrS+m5iyVOyF1GdHuuTffPePwwJw+ARhRdmFWLj
X-Proofpoint-GUID: ZRCbpcxieXOT3qZjVXMaIP_TTRSNvZZN
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6871b34b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=P6Iu8OupbF04u0vqO0EA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ZRCbpcxieXOT3qZjVXMaIP_TTRSNvZZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

Drop the now-unused ST_DISCONNECT_PENDING state. This will completely
remove the hpd state enum.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c7ad61e96b37..529e30193168 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -43,11 +43,6 @@ enum {
 	ISR_HPD_LO_GLITH_COUNT,
 };
 
-/* event thread connection state */
-enum {
-	ST_DISCONNECT_PENDING,
-};
-
 enum {
 	EV_NO_EVENT,
 	/* hpd events */
@@ -517,10 +512,8 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 
 	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
-		if (dp->msm_dp_display.connected) {
-			dp->hpd_state = ST_DISCONNECT_PENDING;
+		if (dp->msm_dp_display.connected)
 			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
-		}
 	} else {
 		if (!dp->msm_dp_display.connected) {
 			rc = msm_dp_display_process_hpd_high(dp);

-- 
2.50.1

