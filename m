Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCoxMe4jo2n79wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 18:20:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E161D1C4DD9
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 18:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFD710E2D2;
	Sat, 28 Feb 2026 17:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfSViHF0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ibn5PDks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3422710E2D3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 17:20:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61SH03363095156
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 17:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=di4GhbXiSEzSalaVRYrgLR
 hgIMUKIizf+qoJiGZBlj8=; b=VfSViHF0DfKyr6sJozKZ36z+7w3FZEciMtydhZ
 Mkg63bKG1TkYBBAy+jwJFJWkw19aaMPgW1Q9uwvGsetSSyt9rRoyVorn2S30l4CC
 44n7W7CBJFQs/uDl6WeJqw6v5UhcDAWNUjoVUq8A0JUP3AW33aTiwrVSujrZgfsy
 NmtQO+aVLQu716djita02ykyp0mCdnXHU+Oj6PvVT1gg+WarLqexUzStKGqteZUv
 G6XMZV3wRf6ly0LISEzOrCTMImDGmtmwewPq+wqpRksj/w9GlliW8fhmSrszvKRl
 S6Sdgq+64qOCDDFSP1oCKQYtA44ccQTeAY6fFtyBFGAq0E0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq1bnp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 17:20:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c71655aa11so3809637985a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 09:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772299239; x=1772904039;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=di4GhbXiSEzSalaVRYrgLRhgIMUKIizf+qoJiGZBlj8=;
 b=Ibn5PDkswg/lPUUfmlj7y8U29wvdv9kABCaoEtUNrkGwLTdlXPchn2OoSl7n6eOH+a
 RzVEikK1tKbua5U6eD+kEGUJZkTzb4+pRzwg6piVIafWhUFghuWd5AuLwHv3KOmSyI6Q
 0lrFYiR7rC6fk4FnoYa0E/od2+517OBSn1AzhHXBNVi7fbbZtLC6hA/XzIZproQe3pDW
 7im68CQrhuXE3fVwN/bHi6ZkKwTEIczbIvAzAB1e8WXSjK/9ueGGK6fJwJSWmsiH5Rcu
 7F0RE9HtJhYrAIQEUAjyW5zqFWptQFOBgOXz1n7Y9uDX+RRhHwTbOCpspRsjt0PhY/FO
 U2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772299239; x=1772904039;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=di4GhbXiSEzSalaVRYrgLRhgIMUKIizf+qoJiGZBlj8=;
 b=hm/GDZnnl6+SBKzeiomK/uFXuPqf5GpfbnyTsIMti4LPQnc1PDws6+kQBZ0ioiJJ0J
 d7/PWupUUO+FeR346bgSVHD97TRdEANPCqd84vVLJw8Ke5HS8v9V7fg4G7YAxcZFn5ny
 dqwM3e49huXy0VuFFIezIXiJOtKLvCG0W2sm0pqBw1qMnPpPhNHel0+ymHYeX+fOnuk+
 Oid1FMl8Epn7TzeOD2+UvEXdK3DnKposAhBRZWPFDU4+tnJRtLk3hp/1tNcDPlWNLWwr
 a5sKwtLxZG7Ck+ku6SO8VbNAU1HWDaglkWHi9LvYIaoUJ/0mMuuFSSfu7sf9Vrkbys03
 j+VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjgh8DjQVb+XLpNXQx/aSd68BhsIjMAFo2BMJcL0ZNC+xd8LS2nLwtKdirE6uZE9wtowTtN+VFuIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIGa4W21eAeG2s8ZikX8e3znbytVbeS4i+Q1u6FPEIjKnNaCSU
 aSiki+n/ghevloH07i+PTZwFzjc/DQyZFw3MVVoPVpZ1ySXleg2JW6HSq1zr2cpP0DbDPMudFD4
 621rj1QMYvoeVsfb7nIpCTJ3fYDowOmgNXB5MjY7sHujDuRE2C60jdnTP6GS7tenOaVBeTHM=
X-Gm-Gg: ATEYQzyJpn911ZeVukL2sU1D/wjsKu3juZWcXdZXLwFfHAM4RhoB2f/+lybuXaY83PE
 4fVJwBLVWEKe8zAYcrtENa59Yp60bn17bjb2TjsCoirJ0W4LHh71I/Vo6czT7QtdIMyRmv5FrdV
 gDgCOJJIsBouDe56LUN3cz35EbFGGB33anik0au9e+9T1BVO8JYrIpHjXutQBSr64JDEp03WoM8
 vPvnmnBMneBDUEfNPsEURKy5IWvOU0V0EQNgTWHSycEmecQAErjyoLDDZFIoRniYw15dTHQXjOg
 xqwr4Xaz+MYGd9YnvCtrI9NTx35TNF86roBq61e9NwOczQF+Aj8fpJbP1vxaAU652AwrI3kuYYx
 vV1ub/9itY7Ag7ACt9WJiLlFfAnKbyvddpIVkQvEDcMimPVK2xndeHzltDjSRUhleEz48QisWwr
 xWE5rtqGJj1cXQ4N64pfinQdeLQj8RosYotto=
X-Received: by 2002:a05:620a:254d:b0:8ca:3175:cc67 with SMTP id
 af79cd13be357-8cbc8ddfd17mr899252585a.21.1772299239500; 
 Sat, 28 Feb 2026 09:20:39 -0800 (PST)
X-Received: by 2002:a05:620a:254d:b0:8ca:3175:cc67 with SMTP id
 af79cd13be357-8cbc8ddfd17mr899249085a.21.1772299238989; 
 Sat, 28 Feb 2026 09:20:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a118c9747dsm305728e87.89.2026.02.28.09.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 09:20:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 19:20:37 +0200
Subject: [PATCH v2] drm/msm: add missing MODULE_DEVICE_ID definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260228-msm-device-id-v2-1-24b085919444@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOQjo2kC/3WMQQ7CIBBFr9LMWhoYbbWuvIfpgsLUkkhRRomm4
 e7S7t1M8ub//xZgio4YztUCkZJjF+YCuKvATHq+kXC2MKDEVqLqhGcvbCmaNRGnw9A1FtHIQUL
 ZPCKN7rP5rn3hyfErxO+mT2r9/jMlJZTo6LhXjW5Hi/ISmOvnW99N8L4uB/qc8w+03658sQAAA
 A==
X-Change-ID: 20260219-msm-device-id-84b95d22c0b0
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?q?Lo=C3=AFc_Minier?= <loic.minier@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3856;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3bpCONcG+yNO0Z0QsmeAzjerkfH/4aOZ+/Bn/54OTIg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoyPlLJWJcJT09ZXVsgRibsEDyobt3MXsDbw5A
 TUR7z6jynSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMj5QAKCRCLPIo+Aiko
 1YRmB/9MmiEXDyHjY0ehqfV3u9XXHjs6QMD1LkVZY4Cg5dv/0GC10Lip74UwtbeXQS16uLVidnl
 caCbkZEHPwlkd/Q1jIpIEy9dEXfvxxkIwpPHCavwpxdCPPGQIaOjTycfBrqEbXkLFV+SITU4Ak1
 F3Srm7U0CThcbQW7GEMkLFARbPKS2GLrV//uBPtj9EuKU3/q8EE3FmJY5HrVtBlP6dpn2zJZpDr
 2vdPiMq4+zlcBYrRyHzt4Qdfmo4cNKbzKf6LGlDBRMTE+yteXWnPg/AE38ZGfu1mjuBFz8AUesg
 z3m65pD3qqaMQHyWXtWA+1MI4rCtNTTx+XuAsu+fAd7Nh2cD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NNARivInz1ZBqfcVx6Qk8Y3s06RYYJA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE2MCBTYWx0ZWRfX8zhdO4yjrGoU
 Thl8PIvruMg7/NeY+aPVvqLaSr69QepJSAfyiNUQZpbzaaYvk0Npbv/Kb3VU8FvOLp75Zh8A19c
 1S9oW2sjhtoLClkpVDN/tJL+1Q0XJYBfDqOsBlwAILRSbGGj1OxjwiLOZJX3QxqodFuAUpmQrqL
 Hnm479esWCHzeXfjcl7FwL2mnGUe36SSqbEiz121uMlYEKMpSqsWtVs680KhDfCAujgzjEqIp4U
 4MkILFj5PHMMr34b71X89K5HrfADTA6tNQQPdScbOmDdSokOyBAg4kChPez7Eunq7Xnp5TPaFQj
 apxBxRBU5hj4GgzsvJfgQo9PpD6kdIdZ4ocGBLF9WGEqFn+FMFGuN4wjFfADEPj5bTf+xk0wfWY
 Ulzd0jbNcc8Z8J6XMROPGIAIAtGoTLx2VGNO8LQFip1giTnUrtJzRnMMrf+TkFfa6CXi0moamvx
 SBNtQWxIWZXk6UlfekQ==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a323e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=F0DFQ9BaAZryzVM4XpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NNARivInz1ZBqfcVx6Qk8Y3s06RYYJA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280160
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:loic.minier@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E161D1C4DD9
X-Rspamd-Action: no action

The drm/msm module bundles several drivers, each of them having a
separate OF match table, however only MDSS (subsystem), KMS devices and
GPU have corresponding MODULE_DEVICE_ID tables.

Add MODULE_DEVICE_ID to the display-related driver and to all other
drivers in this module, simplifying userspace job.

Fixes: 060530f1ea67 ("drm/msm: use componentised device support")
Reported-by: Loïc Minier <loic.minier@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
The Fixes tag points to the first commit introducing OF-based GPU
matching (and thus possibility for the headless GPU binding). Other
are not usable without the main MDP4 / MDP5 / DPU drivers, so they
didn't get the Fixes tags of their own.
---
Changes in v2:
- Rebased on msm/msm-fixes, dropping GPU chunk and updating the Fixes
  tag and the commit message.
- Link to v1: https://lore.kernel.org/r/20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com
---
 drivers/gpu/drm/msm/dp/dp_display.c   | 1 +
 drivers/gpu/drm/msm/dsi/dsi.c         | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.c       | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c   | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a082f4d3ebe2..0d8cb362fb0e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -210,6 +210,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
 	{}
 };
+MODULE_DEVICE_TABLE(of, msm_dp_dt_match);
 
 static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
 {
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index d8bb40ef820e..3c9f01ed6271 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -198,6 +198,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, dt_match);
 
 static const struct dev_pm_ops dsi_pm_ops = {
 	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7937266de1d2..c59375aaae19 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -582,6 +582,7 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #endif
 	{}
 };
+MODULE_DEVICE_TABLE(of, dsi_phy_dt_match);
 
 /*
  * Currently, we only support one SoC for each PHY type. When we have multiple
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 5afac09c0d33..d5ef5089c9e9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -441,6 +441,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
 	{}
 };
+MODULE_DEVICE_TABLE(of, msm_hdmi_dt_match);
 
 static struct platform_driver msm_hdmi_driver = {
 	.probe = msm_hdmi_dev_probe,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 667573f1db7c..f726555bb681 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -204,6 +204,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
 	  .data = &msm_hdmi_phy_8998_cfg },
 	{}
 };
+MODULE_DEVICE_TABLE(of, msm_hdmi_phy_dt_match);
 
 static struct platform_driver msm_hdmi_phy_platform_driver = {
 	.probe      = msm_hdmi_phy_probe,

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260219-msm-device-id-84b95d22c0b0

Best regards,
-- 
With best wishes
Dmitry

