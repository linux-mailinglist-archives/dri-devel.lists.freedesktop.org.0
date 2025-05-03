Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0033AA7F1A
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDCA10E37C;
	Sat,  3 May 2025 07:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PII76OMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5759110E37C
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 07:17:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436xLUl010953
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 07:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=; b=PII76OMpfzqp+kNR
 H1KCeXBRHPA+5TinzPfiVnrhHhVIaOZxxdGpww+VpB+smBUJAOAJzR0aDepNjm9D
 mceJ78WSGCONbVNybI0A+tpIkIKWJiNCfhA8Eyxl+lYLl1Hj0w898qgXjJWna90O
 Ei7E6If7gtlrLPgQ6P3NAIFrKH9PBLtp+mJMnNBK8KCDGGWAWr4kyHe1Uq+cogdC
 aVBOEPgXIvvezKFADjdwUmzdufd56K0MvrgshBBqEEqH+KQC/ogXdRympKuOBnyS
 l5yCVm1VkqBElnQV9E61Iw2yZ9YkKJ6Jzf9VORkMtPDgG8ND1fE/6DH97YTGel25
 YmIDag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfg6cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 07:17:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so258314885a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 00:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746256644; x=1746861444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=;
 b=fa9kerevo4cbYOsCEQzXqTbIpqJIhA/WduxJBj0tBqzyj4yhQYSxzvucbU0dkIhMwz
 +1zo9buADch6/xpc9joG0vEG+Op7F+zvA/OQ7Gbu/8wKEnvq0ZCeOHvhXgJ2qg+eIOGS
 oGD/5INGNtAa0KL+CF27WBdToyQ4NOC0xT0cnVAkPKpZnbfOV1j0WiqexG1XI+0qk2ac
 aXyjLICQB+INcwxtXgm5z9dHSgF5DtXeJRn0/gqA/M7UoPWxZ6SVPb5MkPfk0faS2rj3
 JrmZrsP+5KCgbWU4H8Ba6uG6RufRXc++GUsaD6uRKbdgjMOZyeaAz9hyxSnW1clHEA4C
 5BOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP42ArA5C/Ur33pKvdOUxQghNdGUYD/xTfTKq+3eZNU6XhEy2MdyQTlwuLQgojdUD42hOqwBR+Oxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRbEcxhH0DJ8v+I9cyTr5cVNOnMqpIxymdQrC+giQCZg+ceMI5
 enIB8VB/qrbpS19R7iewlcHRoLg022Z3bylsVHpv3UknQ86tIbB45Qa7CouX9C41TDmWKWVFPec
 itmITi0huLq0dGlDADpOP9E4eYe0+5whHxPpcVP0OSjlx7XcxhUa4D9gO7Nk+sAJbRME1h3X5Uy
 mz6Q==
X-Gm-Gg: ASbGnctYIreZGfFAIgQuLf9Ak+qdJIz910p85gc2iIdZIEIbSaOY5wkd9qetNN+XBK4
 hWcmPSU34Xib/PGJbhAbwi2x0CoOIieYrMnk2UCITyETo9LDUJWfZp3DRev22oPV0ZZw5ISw2M7
 m/eszNu9FkAp6BhWbgKRdg+EDWqm4yjMXTat6vfkiD6FUjv2/3+XG6lTlScItCyseFSHMZxgKTG
 8l3N/vEf97T5qGfBYs6urXvZ21I5Z5vg5dsY/SIFh202HLqKf31h9joeQRSEl2TryMatozxS9JQ
 eVW3n581jq34afTRnhnhDaKrDgC3VsWp+nqJMwgLfGz2EVZ4Zl5Mcc/RhQGksQ3N3n9xTaqfn3f
 /E/ocTx9oxEGqY5hCf92keQND
X-Received: by 2002:a05:620a:2719:b0:7c5:602f:51fc with SMTP id
 af79cd13be357-7cae3aeaa91mr21907485a.44.1746256644107; 
 Sat, 03 May 2025 00:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEluwg04CbYU6xEoatU5Dt5hvy8rinaHZ4poa8Dn2JpfGWo75ed5T3J4f8eCxRx49nLXCiU0A==
X-Received: by 2002:a05:620a:2719:b0:7c5:602f:51fc with SMTP id
 af79cd13be357-7cae3aeaa91mr21905085a.44.1746256643689; 
 Sat, 03 May 2025 00:17:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 00:17:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:06 +0300
Subject: [PATCH v2 07/11] drm/msm: bail out late_init_minor() if it is not
 a GPU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-7-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLu+17Rco3a06pKI7BQn1ru6TMWWZFqYNazM
 T8uCPw9PJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7gAKCRCLPIo+Aiko
 1Xr5B/kBNDSPeA14VAunste4r6LXFySKrVVlICap/DDhs5VZiXls4VX/FDXWmtBca/BKnyBJRUz
 1w6s7lDSrMLpCY0xMDqEYvtjK/qPBbVqnyKeeKg6KvhKkSxgQ54woLxjwT6KSL06ljTeg4Y5+Nl
 Woj3Gag4JoT9tgaF191rS0idfRiYZ11FwKkZRp9VBKcQr/XEjn+WzSj/DR7+qYlawYV05qUlarX
 /y01lNGpXGDBeOHF+V/dOr1A85LfyVUjpMue+/y8aocy1qpgy4bOAJtsOn0tZth3Kwc2w2KG/yS
 j0GcRhUnIyptOLxXRDH1FHNEu1/WJtLy8b20IEJI36dBRRvb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UANa6fLc96xmTkKUwKsLwOOKW1gxD9_A
X-Proofpoint-GUID: UANa6fLc96xmTkKUwKsLwOOKW1gxD9_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfXyzYpfdWUu4+I
 AZwJzdB4dJJUyIP8Hcz1xTvqS4XTtZTZG5fnDYEO99Wzx/rlLe4c1VDI5NmnB+Id12++6DlYDAi
 WupPckdTYsHVfCJNFWBzXdvjQYir8mAu1Hshh6ZCMClx3YTzocfI0LrIK4fki8whQpTs7rLZtMP
 qdE8aDOZ+VCX1iIU60QuNx2zAhe8uzk1cKu8/k5cw2JJ60eppDVwVax9y0GP10bSs35yTIZqVO0
 NcM4z5XlVAqAi/MRK6R358Cup64FBu1Q7up7raqSWyiH8WCnA8MZz8aL7yzs3wT33ZBx7Io51AB
 s/Ex6Zo2TflxFedKR3rxWqINgmS4GSkP96Vqo8Kiuu3mFIuFbQIRyluIU4a76XCX1qO7Motwy6M
 9+Gm4mXWdiwfgxtLPugxwS7KAkbhd4kHy6PNO3tu7IpEFP536+IiOQQLFZS59ud6ioSpWIIb
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6815c305 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=blY4ScjC_F2vtqdRJt8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061
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

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 2b12f2851fadbc3c924827e11570352736869614..6e60a74b13d72c47e45cb9dc65ed67b977e900fa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -296,11 +296,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
 		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");

-- 
2.39.5

