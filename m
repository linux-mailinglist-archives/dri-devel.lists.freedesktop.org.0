Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F64B3F3E6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CB110E583;
	Tue,  2 Sep 2025 04:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iU93sRdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C3310E582
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:56:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SAPj022312
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 04:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 83fAnkrveK9gQC9R/+BmmA0iOQTFfDns/UdMTMdybB0=; b=iU93sRdKWl3pXPjk
 CJm3C1+MEZAjvpK2QCNBTrxyaoU8Dhm6LI8yXVNG07wdFhUQ+ksbZt3/Zf7NxRK6
 a5cbhGIxEEh+Tv8SPxrURN+2jGmdO/stF+UUlE4bEdYO47qgwQ3q7ycSXF+Nr9Nn
 v/CMBo4e1KGkQds1Q+1pNR7W6n+hTt7TLGOjv8GMg9eQe6F90QFWkgmx09pd/HyH
 3mteK7EK7DSm2rE69rebLfyl+0iyWeC0GSLldtq0zEmRxug2+HK9dalUeHEomiNf
 /guNOzY6Juhf/kGHVY30dyPqkKaZtx3/0TYu0TIaf4kCg+otGg+FKFq3ju84LdS/
 rC3g0w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp6pbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:56:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24aa3cf81a8so27689445ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 21:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756788979; x=1757393779;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=83fAnkrveK9gQC9R/+BmmA0iOQTFfDns/UdMTMdybB0=;
 b=kgCFT99zMYp5fU+d2ddpnBCdSG1Bb6Xgt3Obu/ArCm5MGpMRVLsUh4lcy5apDsV+ZK
 72AAHoTdazbeWeDUkmqFjAzMq2bl4PFfoG/esUOFsgEgNOH6AN/UihqRC2b1d/2q6WPu
 gD5idV2muuyeVazZKxJdZvwMvUlyCa0uj4pZaIKAule2dmu9uho1eg8ZjvWK+dU3YxqQ
 alD7da4khKp3+s927qrfLQ6c1BuFY8SqCpbIRptb89RZFt+sGoobFE1/fgT43JXNgyBD
 xJvMYBuBuKwOrs7UB1DEBu7n250BrBUmKIXfSm2Dge/SoO/1aZAR9A2rglzToa2dkJ1Q
 NWog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUilx0IHfbR3X8xIamPNaDAg/9fD+wOV8IJDqmgOsG2zmkms4sczLcKZ1rCmwWwPFByD+5tkl2wzHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp/707Q4SD3rdv9BABN1xksf2Y2pxPfd9c2K5OI5Dyh2V337hC
 OF+DZNLsD2uZzydH3n/no6nJQJcbWMFl5iCLHt1l9r672ktoqbKZPnB2NfR9ZTtpFV4gFxthDuo
 +aoRHXOIER6gdjwoxCAbrJxLhrmv4WL0x1JDpA/tLmGuC796wYK1Bjnb2GS5U4DBxmnEnxA==
X-Gm-Gg: ASbGnctJs9jbAlpc+IUTfo2hTe7JqW1VQu9R4UgQcXlgtkbxDocQH8pb6uvCozNpf0U
 XprMVNV8uU57I473K1NYBEmwL4LTWIg7DSk89+vIZjIo6fjEkPJBgRN9w00PvdezMG5uVJqDhND
 vWpibCKSxbeLnddGlGmoXj2PHoSCyPMTvZlZyCG1BeVaWBBeDXGD0ZiaqfEWN7m6UJOlmRYHpU1
 LUaEaC5lm23n5LJBH6eJ4ET0t8ZNz6MLEQhB0Q6jBWv1ZGHU79RBF6FBDm7qsgHeGiUFy8XJEzA
 fiDwdhG5vHMUcVG8IZRoSASSpVu1wH9S62qqWXHZDSxVgKKwuOve3K3Mrhi3GWMd+u2eTZdmwfQ
 mRlVWHNcz2a80qUGlbO/ivj8=
X-Received: by 2002:a17:903:ac8:b0:240:52c8:2552 with SMTP id
 d9443c01a7336-24944ae192cmr136873135ad.43.1756788978822; 
 Mon, 01 Sep 2025 21:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjejh0uViNDEvhTaWcq9bv3V5Y7jPhdE44Q6k9Ox7H8xWnNvjCjQCM5Z2Mqif5+n1s8qZOHw==
X-Received: by 2002:a17:903:ac8:b0:240:52c8:2552 with SMTP id
 d9443c01a7336-24944ae192cmr136872895ad.43.1756788978349; 
 Mon, 01 Sep 2025 21:56:18 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 21:56:17 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:52 -0700
Subject: [PATCH v9 05/11] tee: increase TEE_MAX_ARG_SIZE to 4096
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-5-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: maCDblhIstjFQU1UQhnMNVzANDRY_mfs
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b678f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: maCDblhIstjFQU1UQhnMNVzANDRY_mfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX4UsP/TGFywvI
 mCZ6F4YECm7w7vfzjzAMq10UVRPKfseiqwKfS0XN+Wu//otmiue1jLfFSMHLXN68u7K/547K49z
 5ju2C4rs+LcTDMqY1srm2SdmRpgIESG87rBeVXZVd2+musSudpmBtjJpEjV3McQWVr3d/oWdSDw
 asCW3rsLj4rQ85wOh1sspqjYUShiEzWqbfDBCCJJUnjnDIntmzG+Yr6Op+ea0rOwZ0ud85EbjaF
 YXxUXITG5W0hPL1gpvrdQZgaGAbYV9W+Tgen5G8PmHBALIVatFSFFqlUrXiLm7wVheBDg91S1T3
 yfaarz/0XQg5b7x46ENzlL/yyYHmSvz2QFskYytMyzDYXZo+ZAeDRfVfZK/GITbc/+IQc9V6yfO
 E/UPiQ/R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
additional buffer space is required to pass all arguments to TEE.
This change is necessary for upcoming support for Qualcomm TEE, which
requires a larger buffer for argument marshaling.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 include/uapi/linux/tee.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index ac455683ab5b..5e393080fda1 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -42,7 +42,7 @@
 #define TEE_IOC_MAGIC	0xa4
 #define TEE_IOC_BASE	0
 
-#define TEE_MAX_ARG_SIZE	1024
+#define TEE_MAX_ARG_SIZE	4096
 
 #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */

-- 
2.34.1

