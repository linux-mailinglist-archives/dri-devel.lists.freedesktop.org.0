Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4455CAE8D4A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6280110E7C5;
	Wed, 25 Jun 2025 18:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFPAYJxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E192610E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PConR6017607
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aJRux9Mmt7D
 uLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=; b=pFPAYJxODp7VLqvoCbvH+1VyFoR
 TVVh8aSjTtlmlxdCSvt3gkbQFZA5EiJz+tz0zl2LIqflivHZYPF+St2WOkPcCHdT
 5G7cWuDWjzBDv4gGMEAtA65z0/XlHKoGGajfs0u/EjgkGiKYnISbAJUh+GsYoBj+
 wfz5JwZrZAd94KBVHajZQ3FQHvHiL1KPe+JAR7JJbwP9PzdhOWqEasP2ezVf9L4d
 dYC5FmQM04XuMxffPpu0rh79jaKEjWeVsw5XNkJKAHJtcqN2YWh5vRDkoGac5VoL
 /y5jyaLj02fxQsDabfjeGOC9A2NO2jjyY4tWqAqeFI5xfB2R+t9Kep2ttAg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5t1mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2c36951518so160755a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877909; x=1751482709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJRux9Mmt7DuLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=;
 b=m8CvOF/9HjMI2R/LXrjNn/3Svo5l1g4dyMrx+1ZklXBJyfaSsdnv8WJ3moFFDx9d9n
 SocDcjQs+p0vOELpB6GIbiaPdKUtFo3OnWosNW0C1WF5JkXkOtV4e/YAimNRrUQOvtx1
 Ln8yyA2kmnTBAXWmrm2W60eVaiQI60TMbFGXsUP5Mokw7FrKjRDnPdh3FEGjtzQdQLcB
 oPGFWo0kG++oEyl8Md/M9+ZCE6ZI+K/boSIHE/KXD42LKGUyg8mGwFvosRa4vEF8d3ZY
 2S1QUt3j1b3XFievqYBE8BDUdPN7u4MWxRTk2QlEhjQJ4s+uZCawCGnYURSgwpARc5YE
 jN3w==
X-Gm-Message-State: AOJu0YwiJmzc3uyIzrv3lpVW+ayONrep/A6Le0vDCx8VtlhIL2j4i7bL
 QjD+jmg9qaUWy693ntfs9I+4vE+nx+F93Fz922/8jOWCGKrPfl3NWWKAYU3ajcIkPEqh7LSw9OM
 hPJG6k2paHpJRFYcDKe1B59uOZRnHVMacCTcKLNMCbLoZeDRD4AWlENzbxPdJ4QoyPO6Gxm59Pd
 5emIg=
X-Gm-Gg: ASbGnctscLLYcM7UN28RN+5ba3M7amenmwr7zKavwDfJ6fR2LBC9Nz6x/ffHVszXHsq
 obrh9rPxby6vfdduNiKXYV6TvNO1AQ+4HLkhIdQ0iWrcVijBs/NzKwi+3LCs3F7ZMPfZ9bmVq2y
 B+m7LJBha7TmtYTd7Q/4UT8VYGRQepnLbPV5T0rBPBaWZpw9EEGkPHfEBixRiT7cXNi42Db0EKI
 tVKhd8eCnjrPkEDOPScNshKei7ulmBCabB0ZsaZLCBwdbtCqT7CM3JaVdJtOWGQRsTNXcFy3ciC
 HR6rpnDrL7K4n5VffdKTvUGiaLUiIg2h
X-Received: by 2002:a05:6a20:2588:b0:1f5:717b:46dc with SMTP id
 adf61e73a8af0-2207f25dd7amr6659465637.27.1750877909323; 
 Wed, 25 Jun 2025 11:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC270RcmL94Y5v5YXXUNIT0L43Aj7rmknkarCokDfRAAcbW7dfFvu+z2RftyoP2ixS2WyXNQ==
X-Received: by 2002:a05:6a20:2588:b0:1f5:717b:46dc with SMTP id
 adf61e73a8af0-2207f25dd7amr6659442637.27.1750877908935; 
 Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c882cc78sm4909730b3a.87.2025.06.25.11.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 10/42] drm/msm: Don't close VMAs on purge
Date: Wed, 25 Jun 2025 11:47:03 -0700
Message-ID: <20250625184918.124608-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: u3nfzegXVjlnE34Tpu0UZnoLkWFGk6Ek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX0aN66+Ja1FCt
 fnP4m9brzjiPdXAZuejCWt2PWDsaYd8YpKF7iTtKmK/yt3my5PgQabPrzutHiKej7Pu0zTKkTRT
 T49YMVj+IXz2rdBzXw0d4/F4w8SeYt51sfj3H85XiitugmVEODChk7zrbuT0B+UioiJ379F+1oV
 UQEHmJyHHoS9Hs1n83mrv0Tfv8FYkxrYzRwIYSmCQDd581Kd/P4cHNWXowPKQc+IVt8vris4tVF
 Ire1e1wx/jtIAPGC3Kv1QoedoaX840YiMPVpjcKyWb/ZIvv/CtqDCbhyp2yEMMe2sUTkCB+5DVy
 qxWWGuY3hBbhbYaxXKGEF2dXkOC5uPZl0dQVj/CoMwD9dP0fUeGwqHnKes74r0S8WgN36cTGiRC
 wnYooJuE1Oy34/+l1OM1CW4Wgjwf/Eao2MpsO+NBDBKZd6xJjIjMN1Pp4SkFJzVv8U6Bco/w
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c46d6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pCKbN_IlIROpsMws84IA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: u3nfzegXVjlnE34Tpu0UZnoLkWFGk6Ek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0

