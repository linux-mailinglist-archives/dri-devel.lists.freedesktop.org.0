Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F8B509A6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 02:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D78110E81E;
	Wed, 10 Sep 2025 00:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVwYk8PV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01CB10E35B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:11:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HQYPx020625
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 83fAnkrveK9gQC9R/+BmmA0iOQTFfDns/UdMTMdybB0=; b=MVwYk8PVhFe5OTTR
 osJ8zYtkGNaKwQapy00sM8Me340JBh+tbaODTgTWBD3k0+g2v6M8QxKUtoiE2f2G
 LqaDTNrjPeN54eJcCPBBLNNqXIt+01tV6r5Z+1VwB71CTFLHCB+KzzV0N1IXrm/H
 EYI4T9qb3uK/XGZh5zGsqAF7HJ4yJc1n0Dy8Fs0Z8gKYGiyK8tZXvMoeMzg0eKsa
 Vv7AJ/1a+jc7FTS9/YlQ9L9DgGHwg6i3SlfEaX2ugoCy5zJBkIoTJpBsah2OpOam
 6PSDLOJV8BBxfSAH8qxPU+43+dFBPBxUaDwbw/CSuL5SpYXnUROzpcPOuXy49NCl
 E6A31A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a9x5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:11:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24ca417fb41so72471855ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 17:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757463089; x=1758067889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=83fAnkrveK9gQC9R/+BmmA0iOQTFfDns/UdMTMdybB0=;
 b=rhFcfTbIy3q21tGDd7ElzEj3bEOa9UVPW2fqef20QJkyGO33Fg9q1/o42tiLylLSC9
 AvHqOw1395Zin5k8KHX74HQolwm0M2PbDQVHhttkvMagG+hLTwus6QcWEqu0YG3r114G
 RM7PVSuGZZukOBqjUoeeU3bW7eMR1Daa8ZfricKZEevLOZjuWQrq+Xx5oQQx+C016CTV
 vuK3Eg5o+JpcgP5RBHGeJbqKoZ/RU8W2fOSB5nENX2G+F4ZXQZQyIb8Ubi3SwrSXvHlN
 B2tPOXdrP+f8Yqrnf1Wn3JjEA25NtG4XJ4m05pniBupiLFbnwTLxivJY36xgvSIg/QmP
 z3sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWaNeA3IGbBTHtm8zRix2voo39RLxL1Pj3GEe4ODUsWaixrHOZ2r5zk8x1p9DEkcmSoSwQ07uGms0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN93dXPB0xarJBGExW0vXKCxVf9OqMlI09tZ2R/ftoDA8Hny4E
 DBCMySykGhBoWeTb8QFNpSE+6aUOdJt60A6lHvBenGRmIviHoBHjsi49SUd1W2nlLKTZ+Zwh4PF
 96od7c52MxG9KfmTNfKa9bW4d2sn+5i8VdfpdKBPHYzVc77pxtKbevfUW5XGfGgq+726hA9H2c0
 3I9WRW
X-Gm-Gg: ASbGncsiYeUz9IJjRRSMgudtFqkcArMhyKshq5sqi+1D8fQNXk+iwiZ4SZzI4MeyvKh
 yAPSxRsHTvyFomhPUwrhB+f/hVP0tgtAtkx9wOMtboh4TkBJVAj3a0obJGCzdj/1AuEOs5z/eNu
 qn9MeZpPpXPkhfsITdFvPVHyCEau5rvpMyx050ze+ZcPVeT/fUY1VXGQGpfJmd4V8pV8iXhiHtJ
 5DoTVuXrmO4gEBQhDC8d9iYzp4pZOrY+a93cNDIHVIX2hmoM3LJZmjxZj58ZrMx/Q5F0DjDRcmr
 9Cbv1ZCD/nsZ7GPB+hgmG5EhRqOnv+bE3rbNbuFkTOlwQBO7V0/F/QoCM0Nblgibw7a+MwmGOjk
 J+FB/hw9Pm258d2/YtxYR+aU=
X-Received: by 2002:a17:902:cf04:b0:250:1ba5:b207 with SMTP id
 d9443c01a7336-25175f6e7c9mr196375745ad.59.1757463088834; 
 Tue, 09 Sep 2025 17:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwv4U/CQ0DLFLSD+hMaG+/IFah4m6GULCeF3UMTUtfOmP+rVq3Sj4WE3bpGNjpxi71sWc8iQ==
X-Received: by 2002:a17:902:cf04:b0:250:1ba5:b207 with SMTP id
 d9443c01a7336-25175f6e7c9mr196375195ad.59.1757463088335; 
 Tue, 09 Sep 2025 17:11:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 17:11:27 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:09 -0700
Subject: [PATCH v10 07/11] tee: increase TEE_MAX_ARG_SIZE to 4096
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-7-20b17855ef31@oss.qualcomm.com>
References: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
In-Reply-To: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c0c232 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: s7rpFhbHbxfkWh7NAeTBI8uWw2Xfd51c
X-Proofpoint-ORIG-GUID: s7rpFhbHbxfkWh7NAeTBI8uWw2Xfd51c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXxGDHsp2MomLe
 D0v7+UsJeJeSY4bbwfZafFChRLD73WOazWEyVYzCAdGxYAGadhbWBClWbxs6f5qjc6YGKbApIJ8
 R+C3PRp1tS7xD3Oo8OW6t64wRMnHcYsnYMFkvGs/gnI+3r1Wt+q3YgePGrdoASusjXTAGdxW6EM
 tI3DXj3kzo52mX0bBVfEO9c3wix8rLIaaf1sP594ZcJxEhj67lAR8NjwsLOiQwYlGZq4qmyHLhv
 NiIA3+MT03F53HPTESIefuHSXOZWFwPXq5NjNCsPTfj8Uvfj8sDbwa1WR32X+kqDIBYDPKNtzma
 ld6X8g1B2wJ5o1X1MAThUAb5whepluP+bYa2JOob3yQloVfYFD2RkpU6Y7oSQDT1QN3ix1U7V8+
 UjJwz5mY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

