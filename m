Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D86AA87C1
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5976B10E297;
	Sun,  4 May 2025 16:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZjDiq17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACCE10E2D3
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FL3Q8014910
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=aZjDiq17KIhl1ALW
 clqtbi+CIZdf2/GxD1LQVuQLnsOWSN3Sc2+Tb9lKmIKCJHaUzRLENzKHOXxRxdbl
 +kxerPxTRIiT3GSURePl27YOfEoeg4pjbKH4UPMLMbg+7lthLZLzPJOZRxyPk1rI
 cAahuifJ25pVkQ1EUSefDjPRMo/VGLRfE2bnUVYJBXHE6c7uw+LVaNwc1KvsRwXZ
 XfjjKcJ19EeqqmGm0FXFb1yiVvMVTLIF0Djo9VxBFjqZnFJjqCUxm8db39U9WkMd
 stwaAP2O6Jww1Sep7/uHuchriqAt+49mTUQRAZ4T4ofFk23M0XCxGNRZC/65P0cW
 G0btTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7a5d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c0b0cf53f3so581136085a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375229; x=1746980029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
 b=RDRqRxF4kcmAKIm/UjxnS4D8lto18LiJ3+7oVLiKcT27gG7LizHJNIAqgN6Apv7UK8
 kCb8NzSvam1ZNHUBFR+OgYZIvN6vZU4zSE3hOUZPbBcy0Rv9fm2BcgYxyFgzZbiNAkir
 Lxex3cksjv/68ACs1LTJIsrDbtKv1KnIOq/h+ng4PaPjlpDf7/BGucxZWof20l66hUTV
 +c0VQH/BlXTLufc+Nx3JETzhbLF0pFc69rWCcJLSMQpMzikgN4HImNlK+2daH46GGvf9
 GeK8vkflPQE3ZV+LKTt4NZjTQW3yWCv1oouM3DLHgz84rlBn9Tk2TornM2F1osbV9w/m
 030Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjHIRiKjFxqQbC0wfyZWWIGjKKj9L2iD19lLK14lp/NCXC7DvkfNIl1x3ZA5onntmAesBZqM2ai48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT/fBuxnWENkqsqecr3WiogE63pVuzsIVx3piyHKEw/Chnjfq/
 ALO5Ef6SyqqGSrL6IpwB5H5ixvCkRucyGo7nFZd06ZGC44HHwEAicMwsysWHCyR7He2f39MHJLx
 bqmQUqYu2VQQDHi3C5tyaXhYDz+vmq7A6LwhDSQjJNyTrMMEker0cYY5Jd5qkLQGAlTg=
X-Gm-Gg: ASbGncukgyKUoywTHqCWSfveWfl0S67lo5NCI9fLzgN0AVBiHAwCNRxUNo/zsFQ4o93
 S03y6xs68cjvPSDxgWIuW8jI4DbNspbDRq5YFwjf4QP2hs1DSk8dwWdfyiEQv0GDJSm9ftka2Dm
 wq6lT/6tBCCxrl1K5zdsW7Nk8KFB4uO/FSylRfRfan6tmvjU0PKfmkDy4L/zputNQqdVfrMp6jK
 xjzW47KKl5ds8ruJsajJLaFbleheRAuiew9IDNOEKujVvpDH7y+7V10Nk4O3KYbwXsz2X7ga2B5
 NB1ThtEcEQhyDv/4dkcestO1NRTM2py6+8Qm8PKw5DuZFbZo9dtlpDjjz6nY1lE5do0oaeJKVCP
 zuI6fEhKFJOzz5hX9Xj/gKu55
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id
 af79cd13be357-7cae3a89beamr601650985a.5.1746375229636; 
 Sun, 04 May 2025 09:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOpfARWuH6M/BB8J4jIJ9/rRDdEqKJLyqrBgH4bY43WfHx9v+3pxeLlRyLuaD9LSQ7iLIxnA==
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id
 af79cd13be357-7cae3a89beamr601648985a.5.1746375229307; 
 Sun, 04 May 2025 09:13:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Sun,  4 May 2025 19:13:28 +0300
Message-Id: <174637445762.1385605.6437405000222393314.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6817923e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 7YUYOoHMtiogzIty5qU7gEHIoCB7Pq7r
X-Proofpoint-ORIG-GUID: 7YUYOoHMtiogzIty5qU7gEHIoCB7Pq7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX9DMGJoR54baX
 S97Ml6HG35gbuHbEJQuDGV6vBfftS4x79m3aPrlWYgOqo3GzljlWxCuN22TE4wUHZozC57qvWOM
 K/4pgpewQRtILF1cG+GTDurArMo+WcX8z0rUYlbc2exP6Ka0bUeiTkQ7GgDiafYSbBQLz8PvGol
 HfTHrKAur5HSVHqz00R1sFPkkixdOXKRHLEgLPGS21mNpzL+lXMtSIvD/tEN/hEnYUAIcRStB4F
 FaaDdoh9NSWuauwxLgms7u9m7xhbKgDuWQx69R3gyzuAVlf+kgdb6TwOrYneMzdbgc8UN/1A8Ae
 IwXrCoCW8aAe9vGM1axUqk3kjOvml7zVCZ2W0UviSetoAqvyETST/7Oys7og3tCgwh7+AzFX9k6
 goYBvyiOddJEisP3THNLFC1ej3fSfGlsJvw54Li8Lb65XoFdlL0wFkMqrZqIa9sQDngVPkHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=899 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[1/2] dt-bindings: msm: qcom,mdss: Document interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6694d17843e8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
