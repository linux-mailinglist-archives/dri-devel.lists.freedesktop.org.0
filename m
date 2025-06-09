Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0BEAD249E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C009F10E410;
	Mon,  9 Jun 2025 17:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQZZDwDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9E110E3EF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 17:04:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55996YSb025339
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 17:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=WuIIsoKWX5Iho8vmFa7pFGwc+MhhmWxMnCk
 yh8rjoSs=; b=OQZZDwDwH2F2uj8Ad6YMymHUDmheYoaaXO/AFlTxYlg/B4Z/kgM
 5FO7BgxoDHXIif3LYm8TfDLoPCYj0N7ZadCh5oVK9vIUFqyQbDriNWaiPlqa5NjW
 IzjMdYxVRxWmz4qfz9qBRWzGHpDhyX+OgCTtYF2vEwG3vt5UiWvGt3Woc9EXG9Hl
 8E2FcXOur6O2kma3J9eckjkv9/vfVJxmhKTMt+4qHXfi0GNEoPz12Xzs227szkfp
 iJeK3dg7u/WAqNcW3ttNryi5RTtLogzlGvYSNu5HEfZfgGdL5zQOrDO+uujZ2FtQ
 1sZ1mK+TVgv+wYBQYZhzq6+sReCnlPe3U9w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxq2gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 17:04:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-231d13ac4d4so69550495ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 10:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749488687; x=1750093487;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WuIIsoKWX5Iho8vmFa7pFGwc+MhhmWxMnCkyh8rjoSs=;
 b=p9ufDwYNkoVWVYlcqhlPVFmt5M+S8gqN4fuAApl6GKfHvmkbg33eenyJIaB+1G/2Vi
 w63D7Et6hqYBE/emg/UMqg4jhJ9JTk/7JwtsWkJ/NMWx+QcV3RhDM/F2TunqRxjDfcxn
 js6uQ4JYJXodeK2iNo+lbdY/1HdWsp5jxN2bulEAUl5R6m9xMKpdExDY26nJZWvXE4kc
 6LF/ihMOldhwUf/VtIRjXC/rIhdNAPdSl3zSIJmCWv9A4NOpkVeBnxaRoymhn9rY0lOI
 4rDWo4NreA5u7N0J1JbmuVzlRXuYERKQOGWG8t5EDaI7ijtXbZOD8Ehe7c6mtmhWsnJj
 ZG5g==
X-Gm-Message-State: AOJu0Yz1EzlVJX8zTBue1RZ+Q/tgv4+isGtV21ie8Vpogh9aG3+9R9IN
 qRjnJFVWrTD+3Eu9yAPmuRvflyLBb4rzCgOC224R7h11YoyocJXpHLY5wydQBbi6fX3FCXTrYuq
 8GNIy7tfP5oQcSoLPrfw1RcmJsXFdPTdNjq6hB5uSUOFKsCgHRY/Zvqc0kSd+HdTXq2aaK0iDmp
 JXm+Y=
X-Gm-Gg: ASbGnctqtDkQFUOlkzSu9YH/h9aXikHc0j60kCYxG5dRw13RVDR2V832ygfZgwBHRNp
 wGESlCY8lpxSrxV+dt/oVG/Z4oPWJNYaAz3yFwZ17IZOltZvPhhn40sb6TEaQ3X/AvnAp78Ixk2
 DCsLFilsdVtybqnuIhzARlWZIudiI1lTfc2hWc8gnVsbH2eXImDq19XKxXuHGPLSOg947rHyBiA
 YXNJZwffM0Csg1yEZy4eOSfHQsexvulwymQxDBzAyafzHnd70P2Ow4eADeB0VhrZNteTGFGLywS
 Aae4idBQp4Q5Bz+YUhuKww==
X-Received: by 2002:a17:902:ec85:b0:234:a44c:ff8c with SMTP id
 d9443c01a7336-23601d080damr167971595ad.18.1749488687105; 
 Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFci88ZKpZFhTl9ad+qroQOgRxzN42L0DO94tMutIphra2Ct5pxyLzpOzusnoBC5stEEgN6GA==
X-Received: by 2002:a17:902:ec85:b0:234:a44c:ff8c with SMTP id
 d9443c01a7336-23601d080damr167971285ad.18.1749488686715; 
 Mon, 09 Jun 2025 10:04:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fccc4sm57380505ad.127.2025.06.09.10.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 10:04:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] drm/msm: Better unknown GPU handling
Date: Mon,  9 Jun 2025 10:04:33 -0700
Message-ID: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1UJxDHHMthdEFbL7W_38o_TTHEDTdaKB
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68471430 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=JEju956KdHHbcqjs2oUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 1UJxDHHMthdEFbL7W_38o_TTHEDTdaKB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX8YsTyKsy8ovs
 ZM17Wbk/9pLniY+4fNYgqq0ApZ7yySZobUxCVPNeDQt+wNFPsTpPHSjkIEie+nNjJ9JM9+7B5o8
 a+fKtEfK663pAbnYbSpCswBPhABdD7YQc5X9s4RqGTTfg8e/cBZo5sDN/hXkqfWLtDghxvptEAd
 +nyCG10py5/H3GLN04aFHEWE9h5YC/uZgoq4LeHscPPCHVaJy6GNIt0TeIdkQXffX03uAu0zwaz
 ga2TNkJnCOY8i/Nm24IrbiyS+haNKlhbyAoK0Kl+3k21nsf3+Iba4tydngx0iFn432nluQCJA7U
 oi708POknW0ogAASkT/zGHfHZtxkKmIjxIqGeEg4k4iZ7VxkpPVJ0Dj97g2wBu/QnoLrPVNefak
 MBNgbrojXMKXkdrnsjX8aqYZ2cRNw+OVwCDptNR+goaFKqLxLCC0irzpgiLL3Au+wdGPzMYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=711 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090128
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

Detect earlier if the GPU is supported, and skip binding the GPU
sub-component if not.  This way the rest of the driver can still
probe and get working display if the only thing unsupported is
the GPU.

Rob Clark (3):
  drm/msm: Rename add_components_mdp()
  drm/msm/adreno: Pass device_node to find_chipid()
  drm/msm/adreno: Check for recognized GPU before bind

 drivers/gpu/drm/msm/adreno/adreno_device.c | 39 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_drv.c              |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.49.0

