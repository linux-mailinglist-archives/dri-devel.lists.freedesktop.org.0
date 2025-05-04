Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAA6AA87B0
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DE410E0C2;
	Sun,  4 May 2025 16:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UN5hFAEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1DB10E0A7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FI6nw022383
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=; b=UN5hFAEek1zei9jk
 i+ey+b23GE5m8v0soCodqbAk7BIMQ9UxSa2etCQLexjOb50jI3RqkrXM3ZSptuEw
 YnDbu1OwqigsjQmynUJmgkQk9wgsrZ9M0zP0s8mwwC0ORKaNj6128QQYzdH26Qdn
 m+ajBudEMr+SBCAbQX9qF3lu1kEpUpUdq98X083XqBVRB4wORvvCqPnYumNug7BI
 WfBUA/owmqHe5f2qI5S3q4qkf5SmdcOI5H9yBlujFjx2o29O58rYe/0Pk616/RoB
 m3oK1rl/vFJOOcIVTV6ZUwsUV9OTsZ1prG5jlHTQjpG+4Fj/zW+lfy0f0S2wIDkD
 2jM7AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9a2tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c760637fe5so65022685a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375215; x=1746980015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=;
 b=nisxZDio2yzAm/JMnnsFbtEUdyWp3NPsBTWaInC6I0O+ZGvSgX23iOeMOn8xPYQ1Eo
 gqWd/TiQ7ghKVKSjNL7AR5iiIoJ1E1hEtIMWnKuq5DVGUSalRZouodeXhqqL4LpL6QRJ
 IHoXe/9LClwLkOyhbHZx5XGHnnKp7URBNov2OxkYBaqMudH9msORPfvs8JIhsx7GGPtP
 hCF2ULd+TNAq4b/aP5PxaUCY0ry+UZFssCjAIFWwlELbMwm6yHY6tpbbINXiwnTpyryW
 INMWUceJLMK7GBsqsXb+zgOdHSB0a02l/n1ePlKm6hKYzICPZ5CuK4JSPd2XXc5Yd328
 n14A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlu30ev1aqbThOKrSMuOWprk5sbiPRFrR/u1aSEPfPwav5oS4cBa95/9ocVnX3UNdz/cIgVh4M87g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPvgoemivbFFbv8EnLCZvd7bUNgMI1zAUNdD5CSWGre0RSW9+z
 Yp2uEoDT2DyafNi96md9QoJ8nY8HUoe+eoOLiCjt/iMdkYToVhexkezF6eQgTjA8eYaMIQYlEPa
 zngI1O/WiZz+resnnhkNrf5zHzzSE5zXbu/4AsoGj6okxDUX8+UPhtxvoGVH6wmH9sBw=
X-Gm-Gg: ASbGncudCepx8jc1Xtxw9GkH+tcM5jftJL8Daat05Xk84ep7Tz3o9lcjFHVRIK4iv5H
 LhcXS0a6nLzHZ0HwnhQ+U2mKFqgCReK3B4T8rEoI7DzejpBiAVgus2gDIkt+u2FkqIfV9IZFHW2
 ihflGSG9f0SpbpJ9MD3Zi4+TwnHaL8kIF9BoaVmwTw9OFHkX5RzWl7R8psnqrQjBz0nvypNY9wW
 /zagvj+vtmTOVCRE9RTvhtutIJQAYMaZJNNUOdECfOIl/5uf2bcbNGtFizHychG4tUmYRhPvbPq
 Et4srjMPvbvWvcQaXZ65YUJQuqup2Zw0PE2PmUrGQQwywfzBbfVQvwL4iZDnEAcYWpN60eC4T7m
 L6lvGXIuHQ8VezLOmOk9dFpuY
X-Received: by 2002:a05:620a:1723:b0:7ca:dac1:a2b9 with SMTP id
 af79cd13be357-7cadfed926emr912056685a.50.1746375215008; 
 Sun, 04 May 2025 09:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGco5fgaYnNMpsBBxEXRo5nZ43X/rGRriKVtlsYHoJbTZ+8uY8xGUEUU9xBouzMhrR9HrsDow==
X-Received: by 2002:a05:620a:1723:b0:7ca:dac1:a2b9 with SMTP id
 af79cd13be357-7cadfed926emr912052685a.50.1746375214680; 
 Sun, 04 May 2025 09:13:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Sun,  4 May 2025 19:13:20 +0300
Message-Id: <174637445760.1385605.8148657144550211301.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX2wv0CLYoGMw0
 YRm3sUpFl48NOggs3sjTfTGRCj4WMmUlU5lsy1hvuyRi1RT7rraLhEW3Lrms0OSg443ACAEKCfb
 kyuJ2XuQ7s+KCNuCYH6os2TdrnjJiBtsf5irilpMb1ucz5W9MmzbvNLZy/MSzBbmWEbrQ9M5g1D
 o48PAMzZ4BpJ/JozWqcmk6gAwpqmF5i9sGrBLcy45FUIFcwrdpc3qscPBF54qh+SYnoOh9zeS1P
 Ky02QNoxFlgU9hAd4G/F5sf28jqPlQwzdmsYm3vPQVznKjLFN0qghnOTeb8goolE8HN6TH06+Qd
 GlmEIHFulG4vQx+Pdg2aZnjSgtJlED0505JOtiK4vEKFz3VzJNG3Vr2Z29bbmX1xcGeapHX45dT
 3RqTaA1atAhEYLKzqRVsP+1AC3j8kTWZ2sKfV852KAB0Dkt4B+It9rlfmWeorXlvIhNkkZ0H
X-Proofpoint-ORIG-GUID: ldILs_TKBE7nrCdVOU9c9Xokp0PsF0Cn
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68179230 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FEuYHSLItigONA-XwN0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ldILs_TKBE7nrCdVOU9c9Xokp0PsF0Cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=634 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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


On Sat, 01 Mar 2025 11:24:53 +0200, Dmitry Baryshkov wrote:
> During one of the chats Abhinav pointed out that in the 1.x generation
> most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
> didn't provide DSC support. Disable DSC on those platforms.
> 
> 

Applied, thanks!

[1/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b43c524134e0
[2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5be98120115c
[3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5232a29ebc74
[4/5] drm/msm/dpu: drop TE2 definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e1fbb0d78e86
[5/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
      https://gitlab.freedesktop.org/lumag/msm/-/commit/075667e986f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
