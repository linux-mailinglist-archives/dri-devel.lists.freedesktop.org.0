Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE4A9C33FD
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 18:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDFB10E17B;
	Sun, 10 Nov 2024 17:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qan964He";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6603210E107
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2024 17:31:30 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAHTsuu005588
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2024 17:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=BfoGuWGqfZy5a5pujI4mI7
 lTKNP+ioKaRB/qKwK5Zlk=; b=Qan964HegQxHub/ll0dGdUf5CU2GCd4OFenytH
 tvpGFc9mNYsuPSaNXUi73Se1YggzjM1rWPGevsElAm9X41WKl5SiK2NSbl064iK/
 WaWAaXLqXPWvAyycoELwXZZLUuzYIFo/yfdiD4ofb+suMkHM9IW6FQMPXBVtfxf6
 qiv/zJa6N3I7bUbGwvOw6SlwxYtCiM8bfvvaqmwu+e7rlOrJe0TAEN4pG9c3/ppz
 EXfUDqCFILbPUg3Qf20QnTGVf/AgQs/vePGw2PPiuXFgny6yfWyiriZDC9k7P/RH
 neLOwibcRz70kGkWBLMFGtkxYzhhSMBQabE2MoI90XAzv79A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sw3m2jsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2024 17:31:28 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3e600565b31so3372145b6e.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2024 09:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731259888; x=1731864688;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BfoGuWGqfZy5a5pujI4mI7lTKNP+ioKaRB/qKwK5Zlk=;
 b=miVNcn/X37dvGKNg/AOaAHsvf2FsZ2miIIyPqdQ+FczsS9dL9IwKGB/otI/CYqY1mL
 VjTObEUqVcU5O+VKVKXSjXTrP2BTSns2Rv03UZ5DF4tpX1t/Sks1K55y/qWbxHZICh7b
 1YBf9qXpyacrwe0Hz1A6iL4P29dcj4J69cZ0bUYWBzgAenLL1/2e6UFiUCedh8H/C9E/
 zUnadiD3g1ScJiW7c+NW18qkSdNm9MekyHJUiN/b47sfXik8IJ8ZH/p9cZVuhSa7mdED
 NkzWNDzmUSYzfoeJbEOPYLwRGsF7lrQUcJ1RN9KP3VVDhPQ6ZRb6AoTwxLF3/oKXfWUy
 j8zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMxv7Punu8BtXIlJywz8OzfFwNlpiHrpQcyZngDd44Cw0jlhSR+GSPoK7qFozWOL9OlQ/CqWEO2IY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXLJnLMDxXCzx5Z32Mn5L7hWPuS5Fxm8oNylXmiIS3Jpe9SqTU
 mOZnhI6DsCvh2LZr3R1ZpgbsJjOEkjnYTuOzxdS228kprynfb4N7J16eAsFhrMa22KCQRiH6J1z
 GAPn1xYd2yMfer9Lf0sbiQdopMd2twqmhV2V9TuN+9Gk4u7KslMy0imjIO7ADeiLmmFg=
X-Received: by 2002:a05:6808:1591:b0:3e5:cf3b:4fc5 with SMTP id
 5614622812f47-3e794669a12mr8394396b6e.15.1731259888223; 
 Sun, 10 Nov 2024 09:31:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlOzi65P7xi3H7DBVKQLZt4+WlNHkeZhiSyvM/O9y9uS7YPurRkCY66DUaoOZ6gSGpxTWaoA==
X-Received: by 2002:a05:6808:1591:b0:3e5:cf3b:4fc5 with SMTP id
 5614622812f47-3e794669a12mr8394387b6e.15.1731259887914; 
 Sun, 10 Nov 2024 09:31:27 -0800 (PST)
Received: from [192.168.86.60]
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3e78cb53843sm1718506b6e.0.2024.11.10.09.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Nov 2024 09:31:27 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/2] drm/msm/adreno: Setup SMMU aparture
Date: Sun, 10 Nov 2024 09:33:39 -0800
Message-Id: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPuMGcC/32NwQ6CMBBEf4Xs2ZK2gIonjRePHrwZDmtZpIml2
 AWiIfy7DR/gZZI3k5mZgSlYYjgkMwSaLFvfRdCbBEyL3ZOErSODljpXUmqBdaDOC3ZuFNhjGMZ
 AoqFdXaAyj32WQ6z2gRr7WWfvcD3dzheoot1aHnz4rmeTWsP/u5MSUlCJ28yUxlBTHD1z+h7xZ
 bxzaRSolmX5AY2NMPHGAAAA
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vmdmtg+hk9uw5bKOQ3rjPE500KtSKYUR9oTuviBoIzQ=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnMO55x0I+eKkTr1RDsmXHn7vLUtSOtoH/M69Re
 inY60N/+hOJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZzDueRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUWQBAA1HkfERObZWNLHmLRFtC9pnJiooFMnDQHX2hv3s8
 5nLxyDAgHelNapb5y8Gt48GHR3QJYXREROrOAC73BgGnqW+v9Ri/z0Ag4dYM3MjUYSQzOC3m/xT
 iyZgamqJ/Q7kTmrpyX/r/RYLMtXpP5lg0ZEo7kPCS6x8QE2LjCjGIxpXqfOPT8wE5GrrpkpH/po
 C1TbDIxMzxSeFR5SsmVWOBU7MfY+s+T0frf1cao581kXfr5Ey8dJWQw/dL1wrJBObu4/PQx6F7Q
 dMQMGFPiG2swFoj8iDW6t2EQCb+1RazlC+yn18sisAu2/g/D9Xvl3qyZgjIgD7bpwt9iy8JKE7E
 9OEeqQaav2VYSkyu+UGp8tYF7VCCBUOef0O6Gifh9KPIbVU7G59HFA4XpI3uafphU/c6L9yHqmo
 5EWXvPM+/ubjUuYdcAcYECp1a5DmxnSXo/XcJrcEpawllXSqUli4b+ejSjuqMD1ZkQ5M0a8Kfye
 WpIlezPYNLQidIML9u3vJ7QL+9aSqdFOTtKlOsRlATjrdJkSEBmZcizwTtQYGrJqI6cCcc7ZuXW
 22bwW7WAJXdk31UTJqauZgjmnsr46Uh4mguUWvC7dSfyyFQMO3HmuLZE+akqF28rJhZs6EINh9t
 7TgTWcka63ICQjbmGN9MVwJga7w3MnFpHfetXkNBHq3w=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: GIiMFWbaiIew8PSBUJbgcFfEUD16TR_M
X-Proofpoint-ORIG-GUID: GIiMFWbaiIew8PSBUJbgcFfEUD16TR_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411100155
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

Support for per-page tables requires the SMMU aparture to be setup, on
some targets this is done statically in firmware, on others it's
expected to be requested in runtime by the driver, through a SCM call.

Marking the series as RFT, as this has been tested on a few different
modern platforms, but only with Qualcomm presence in EL2.

I did receive Tested-by from Konrad and Jessica, not picking these up,
as I change the firmware call pattern in this version by introducing a
"is_available" check.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Added a check to see if the SCM call is available, to avoid possibly
  error prints.
- Link to v1: https://lore.kernel.org/r/20241002-adreno-smmu-aparture-v1-0-e9a63c9ccef5@oss.qualcomm.com

---
Bjorn Andersson (2):
      firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
      drm/msm/adreno: Setup SMMU aparture for per-process page table

 drivers/firmware/qcom/qcom_scm.c        | 26 ++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h        |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
 include/linux/firmware/qcom/qcom_scm.h  |  2 ++
 4 files changed, 40 insertions(+)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241002-adreno-smmu-aparture-fe7d5a1cb834

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

