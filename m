Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C5AF9F91
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 12:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1789F10E36F;
	Sat,  5 Jul 2025 10:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAB/CoFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077CD10E382
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5656EVxV028380
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 37OUWSNqZZ2CvfYEQI9Vqh76rgWD4hpD+HsIhfaGlGE=; b=YAB/CoFLitVr91q9
 t8gW4MzUUZT3k2pRij3Lq9qx5UiYnbIj4UJaw6WIYyHXEDKzx6O3JLqaHMVkWRBU
 +HLzfsfy6dDeZ0nt06PdXXe/imvprwPusD+bFbmxog1fvjn+uizpU8lCOGalNxGV
 FsA0OA2hFZ/OSWSmliq4pYPc/hbx9trlGfcBTeBNySNI6jFmjLqLexVaIUHu8THm
 HyaDcpR11Y93Fm5TlXMW3CZOq+fqf83WvOC9i4DEH5MXfXBn70A7enUGWgt+1cRF
 ISZm5Ye3ICd0KTByhG1zr+OZ05x0w7d6/Id3BSvYNaR3OU1B5c0Im2jiBOUUfFr4
 h76Rrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq8s21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d3d3f6471cso254109285a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709764; x=1752314564;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37OUWSNqZZ2CvfYEQI9Vqh76rgWD4hpD+HsIhfaGlGE=;
 b=twOt3dZ1+ThYpqZUqbq4iVDfx9Fsjj9HBMgfjsrwmtf2IGk5XMqoD419ihDFqckUZj
 MSY9LGV9CJA8m+Gk7Zo/YYhRpk+RRcEw+yKwpp42A+sDttpDvElVsbF/HJANCHWaZ0Jz
 DvfFlxVggU+JgZvqmRtNGTEa/UBTRvQ8MO3ERTLke4cZ/+pT0Oghs38dWn9p4+3U7epX
 CnQbZ94G580JI7l3bcZUcXbvrkjT4OlkFZvm2MVs/vkUaLEBpG6nS5VXvammBkVl1NbD
 VyGaL+y4fSt2hG+/eBOB/ebzbNvOmcpMDdx7gqvU+CDg3JJ3dU6drO8cNiayyPu/3xWW
 70yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIV+RUc7Fqvxd/yBQrsJrZF9nOjtQfjtudXqPH3tiRaQWpMucQjb/SXnnAtiI58njlCv6h2GOz2V8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQk7q5lxQOjhEwIrUxvOTWMtqdi4/SH1tQWMoPviPuvxRkggK8
 vtszohg3zF/3hXcJpZoqpEfFGthK5HA4UgTfv7UzB69R5s6YqC2iCzKB3NoC50GUF1T1L+JobIX
 C6+fwSoMPS2xbNBpbvJ+nxOg8hO81JXDhebHBWRP+fMFhaD8mYwvZA01BYnWVnBG3fyNCJYQ=
X-Gm-Gg: ASbGncu+efevfezNXcWtrej7qJ0V09pu0nbgMofHFM7zcWUow6fCYXTmLHtFw5lNxgn
 6lspcqUv+cYbit5QoGy80MVUDq6bkg178RxMinsqlGPtfzU//bosesUdjn3Q4qNrOnoyOiYK4/D
 bRsAAAZPgs9HdRr7KRVrqgkOG3XceC0BRa99g/Ytz/1ORbkw6eIEMR97aakFGQvV8f2ceC6K+5R
 rZmL5rQ7TlP2iqQk3Gd8w5HVdVOuaCygJVfJyx0hJl89/77gNnXEmEm/paqlJDAqx2S9qpen/j1
 1JRNHtkDL3oTmj+j9QkcN+w+Ndn7NvgGGab2Btd5AxGgbOJXZpUmYW3MqeyEuTyiRK5ymqQhG8y
 KPKkLeTcF6olsbdb/Qexi7y70SI+e5vECm3w=
X-Received: by 2002:a05:620a:4102:b0:7d0:a309:b1a0 with SMTP id
 af79cd13be357-7d5dcc72969mr801362185a.1.1751709764301; 
 Sat, 05 Jul 2025 03:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv0Eym8D05HjojYNYR4SygLziFGdpiDeTDYA8jw7CJMhriZM1hrprzTkNV+yf0mwfM/I4UwQ==
X-Received: by 2002:a05:620a:4102:b0:7d0:a309:b1a0 with SMTP id
 af79cd13be357-7d5dcc72969mr801356585a.1.1751709763744; 
 Sat, 05 Jul 2025 03:02:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:32 +0300
Subject: [PATCH v4 07/10] drm/msm: bail out late_init_minor() if it is not
 a GPU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-7-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XIiXgEDZnL8PJ3eQttWZTHEBnVzzyPThCHHyJljuuT4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0Q9gDCPMLzb/Xt1wh4VNbgJjfW1DZ11X0y
 N1t0bQ6E1KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1fiyB/9iqfn2GwxswL1i2AFbwA1sytASAH/5JI9r6acY5FRRYHkGqbSjr2YzJKV/mPLm29gv/bl
 uTx93/t33uoXkKnJ52ekpBCJPFrtT/3I64V2ap2TxBjOil9Nz2yqdeBabjfUB0eYnr7dQNBe6Ob
 39/kUJGf/e8FSOMrJkvOZoO6AePWAO/WCvrz7cr4SdD8mik+rUhlIgLS490RWoJ9wgC2E/p0NI+
 aij9FSpws+I1VLJ6LKEF0V86w2oe6fOW35MoV8j1wgt+D+S+zAbLAvntJsG1vnPdD34F70wb2pf
 z3gC34rrLdTTe4cJPsTBC2ex5t6Z80ecF8l1TV+dWrAanc7H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6868f845 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DPw_qTI9PinaUm3vTuIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BWCkMDj_aylWlkfcS5h2mkb3e8lvFP9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXy78GxopSrVnj
 YIb5Smebqnd9VKJ6RT2XewPBeKujYAuytd0zZ9yBrsMyz5H9ktl7YMNjo3Zu/jvbEpHa0dKUGMC
 4Zya3iHpWajkISJ8q6EhcreVj5d+UDS+UMNMBrIDpLxyTdAA0LEVWPfgPP2aGG1rkozFi50lCKD
 L0WGamNF75HtAH2dy008dqBU/Uj2QOETKJNQJrxPY9NwIl8tdqkZ94XGT2H05tkc3NsPW2yelAX
 cteMz91DfDvsQFcfE/R5UEwDnh4lnJCs7SrwV9AZLKZe27LWo1gAqUl+GHEAQVm5P8SUJ8lzMpI
 pbEtHgi23tYBGvJfs12rzeclfFOaKTMcaJjwdRj3GlibnqTbJwdrHOvbhNsUE23DDDISNarOOG4
 SoUbq6GKOyTtcPcofE9wcOZVe65C5NPyyFdqS1ahCmhXyWAKeSYddhNeqT1+IkYsRtSzY3jd
X-Proofpoint-GUID: BWCkMDj_aylWlkfcS5h2mkb3e8lvFP9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064
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
index 4680ccf3e72fa5c31afda5665defe71d1f238dac..bbda865addae2e0ef5bb175bec0ed219cd0d9988 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -325,11 +325,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
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

