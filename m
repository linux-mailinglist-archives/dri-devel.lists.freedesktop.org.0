Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F55CAEC44F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 05:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3FA10E11B;
	Sat, 28 Jun 2025 03:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPMNTleF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA9B10E0C8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DH0X028018
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Ca0LgcLkNFqV2mw7hYegHH
 5vRj8FHsSnureGggYKmUc=; b=BPMNTleFOulZunmD1KM7BipbyeiJ8tavf5pOF3
 6uo4NZyVT1sJvI+3zPAIX6Aouq0sXvc5ssVoXLh55jtjzw0Ye9GBNJAOCnnT8sjI
 y4gK+6w4i1mfFGsfBnjpy5kFfow+UkTRb86rnDJfLGbrLG/vR5j7n170Ikf22sDH
 IUspdgDVpI04tbmCpmlvUpfFqQtXRSaMn1DgvqK22x7QYurxoStRr6cvSwYSXDth
 ENBAR2K7J9zfYoJc4rQj/cEmOyZX4VtrBZi92EGLH39uSQiPBO3e3fGGNKwfQDhT
 l2VeRa72kfW1tgJkhPemrP70msCUQhDstFMM3H46mGoQHKRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26jvmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d09bc05b77so62613085a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 20:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751079759; x=1751684559;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ca0LgcLkNFqV2mw7hYegHH5vRj8FHsSnureGggYKmUc=;
 b=d91koJ9ryjf1kb2LXKpWPrfNRzSs2F85X7geq5MpCvZJ8j0IDy1VxG9cTkZGwEuQ/o
 xusIzyvsNXwUYc0EAgkgLlln5M66W2tbXOkurf4RmbwObPihidZmwpDYZc44PTZ3KE3f
 DV4b9AahOUtTGgSmHSbLlWNNtjettKKSaYYE0LP42UzofAtAjvpc050itdDTxzQdz5t1
 PXNlY8968cUYDvp79ISrXx6TLjRZ4ZKB99s1knOVTWWg++7XveBNaij+v+gUkMAtamev
 1GW3rTzbdaDfBaA9eZJKCAqyybNW25/R3HG8rJts1+S90Sf/Cj7eW0na3CWSc7rS5nv7
 qTpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDBy1s+Z4VMa+haBbk7zIXcSwCwR0tPZtmCi2a/r9LTlbKeAGLvwn72ZINZqdarPgO0jgZKOA5FmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwyFs3MLLWgEkw9T7mbJIobXc1w5nAIpkO+04IHDH+bfkOEF+w
 Fpxf1qmYvVhIHyYQkIeVNOvDW9Be80mYBGyfcKJvv4ws2BSZBOXQxP4l2WG7G5pEKcWNHdQKjHL
 OhQacHCwB9oCX54u2yyol3TKNqNqwx77d3u48fEL/3X+m2FUoO5KRQEbBWIzHKJ8QsuqBBK4=
X-Gm-Gg: ASbGnctaKdcDhF4fmjpjx+8Xa+C1O5zkJwxbkOl7jvcPVG/BF7KiXbPlKAxG8wXLwub
 Ke7lWbFyfCndoxNVhMFp472TRlXuby+eeMIh96/WHMBijJvR8RIZz23Md4KS4hNzGunNvAvRBbM
 8PLIexy95Zmehv5CXNHz4OZcjHCXrjH6JwxvroJvg9hNdftiJmsAforwbYqVCaQ1vDa4EFy0LhQ
 BxtKN28eBNPgATdZvFy4QfPE35f5J4CpyVXBNvjF0rtUrJJ+KHBThHUGHrK9K5NICND+09ErfN0
 eQ9Fma6aFJB134ag6KVQEzGbwsbOQDbxACgRE8B+XbmpcSPylGd2H989jft0mNrO7IakIZ9kpTW
 Jkj2fgT4xoGbJU5YXOBnSqhr56gcmayVoXq8=
X-Received: by 2002:a05:620a:6188:b0:7d4:3af3:8ef9 with SMTP id
 af79cd13be357-7d44394f4b7mr697102285a.19.1751079758770; 
 Fri, 27 Jun 2025 20:02:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDYWANWNuy16+nJ5OMuX7E6djSxIFc/7BaQQh+t5tnbRh+Z++1SUzPh2ZlXOCteDcaEDP4PA==
X-Received: by 2002:a05:620a:6188:b0:7d4:3af3:8ef9 with SMTP id
 af79cd13be357-7d44394f4b7mr697099485a.19.1751079758366; 
 Fri, 27 Jun 2025 20:02:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 20:02:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: display/msm/gpu: rework clocks
 definitions
Date: Sat, 28 Jun 2025 06:02:34 +0300
Message-Id: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpbX2gC/x3MQQqEMAxA0atI1gZqpGXwKuKio7GGoSoJzgyId
 7e4fIv/TzBWYYOuOkH5KybbWtDUFYxLXBOjTMVAjrwL9ELl36YfzJYx7QfauHCO6CK3zk/k6R2
 gtLvyLP/n2w/XdQPrpqSiZwAAAA==
X-Change-ID: 20250628-rework-msm-gpu-schema-0ae305d252b6
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HPCRtSTGwz5zkPqvv1wbF7TQq1M+P6roUP+I7n1ctIo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0Z8tI/AxPjWoLQivp0SXotle4rlTAWfH09VX5jHkLlKh
 nuBDl8nozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACZiwc3+P63z0bcTDGW9UV+m
 ajLa/z8o08CuXPaucf1774fKHzVuNa/PensxbzK7lLBM17rURaeWfOc6zOvx4/OHbq7HhiLTFlk
 u3ebXu/DC26R415k906TDz6/40Jz6JMLLZxkno9m5h7vXa7lrMFzsyGlKSpJ/bFRR0JJ8We5n7c
 7wJJbwsxe61t4yvPSpcga7X27/gn9ZR24mRO7f9U+s45eeg+rmyRNPT98rnhL3wkPu4MHpHMlnU
 qZd1koJrzwUZ6pXH5t5M2ZhEBNjTLxBlcq+DCX2R5Obc80ubvVz9nGM6BDneNG2ga8mvGHq/IZ3
 b35IpyWWm599Y7U85dOsC97rAtSSlHeHJ1+y3bbhjf9GAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfX7AkN8EcocJKA
 O49j+wCwb/Pg9sNuQ9t3ClgpRDV5ag5Cn/5m8vOIdsD0d4CDYjuezK6j23IPGZgG+NuZ3ibzj0x
 cpqRANRcn/iSxdpNGTDeoEZegVSaRjQJO/hHghCLxWpgHgCydAThQC135IZszGTUO3/z8AiHOL+
 haQBQdOwhtZSOjnzgnfCsYIIy2Nelv9cRwm5hxHPaHVd3HA3ZxeUXxahKHEyhKA4YfuZp2Z3Atf
 0/O6Rry1vdR7m8mBI93yY8ePgao0M907+aDrTfrg8mgA2SJY0uC1UwGYtBgikVVhuP2IsXl5prz
 xVi9oSLs2upC+1R09Lhzv9TGJHw4/KgcideKn/ANa0ttmpxeF5sSfVkfF7/TtJuecbBTOtqWonV
 RH+wqRIve7nWAF1VUbq/KBIibsfFLc1UNs92dhvCJKHI2FBUTYX4cEK3be4KWPFHBtGb2/g6
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685f5b50 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=h7DytwQeoaBOExqUImAA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7CD0iq2BTosD_qASPZgu9BKxpuaXwTSD
X-Proofpoint-ORIG-GUID: 7CD0iq2BTosD_qASPZgu9BKxpuaXwTSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280023
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

Currently MSM GPU schema defines a single statement for all A3xx - A5xx
GPUs, listing all possible clocks for all generations. Split the list
per GPU type, listing exact clock names for each type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      dt-bindings: display/msm/gpu: account for 7xx GPUs in clocks conditions
      dt-bindings: display/msm/gpu: describe alwayson clock
      dt-bindings: display/msm/gpu: describe clocks for each Adreno GPU type

 .../devicetree/bindings/display/msm/gpu.yaml       | 223 ++++++++++++++++++---
 1 file changed, 198 insertions(+), 25 deletions(-)
---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250628-rework-msm-gpu-schema-0ae305d252b6

Best regards,
-- 
With best wishes
Dmitry

