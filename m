Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B46B2E8C2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 01:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3078810E81D;
	Wed, 20 Aug 2025 23:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCWZUO4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBD510E813
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:39:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJFGS8026051
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=; b=PCWZUO4aCsixtpoF
 ZFGaRiI/6mzDtjoEH40urxBiBbP6+XNt3WvN4/qYQsr0fqBATlGs6cJR1+romPz0
 ZSHD9uWkf8dQeqx7lef6lfm4tn/VqwZPFqnoHAr2zjvtMmN0srjxjmxQDwW1rK2M
 YfsXkmo2edya5VKqK90hmv3Ews9/uixj7AguCvnrt3k+Y9Zi+MyHZbZo+CiuS6Q2
 NwIfZ80OyNi3rOn3CnM+IOLEGoeXD5fceAWlDqohdSvOTCMo1M2Zdfg5ALM+RwKU
 zfCtSOwoEcVuUQitrXscftqWHOkiBOK6s8PZMHZiq/o3/oSRfXybseTb02YY4wBM
 aATMBg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5293ct6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:39:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b47630f9aa7so243118a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755733151; x=1756337951;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=;
 b=Gk/URVuaDWLl6CJIGazCdA1FxPzsViNIwmxC47XcDDVhFSKxGDRXORXZMO8VAka9so
 napUpE2aA+3rId2ZLMqh5p/LaJVweXVxPNe7/IyXMuaL2tSLIEq/b+VdRtwuJiu4sEAZ
 3dXS9/8jxH+Sw3Uw8UNzUu5T+u0cZdmiuwd/PDdDBT+dxO7AnMuyoQEMpmcfEvd1rS/S
 yk7rOCwj42yJYr2UMBzUmFfd9FmeMIJWmmGYJTjzqIKpTJ85V0jg+dTf2kOX992T4Zf3
 twjMWK/LYn8lqiUHK9UEVT7DnA+VxcZLkUX2YcdGAmCagylwZ+/VsYiSmtJU4JKP6QH5
 rI5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFTQU8UJxGdSwnbtcBAz7/1kVQdVB4/5rtmuMJaqWcZALU7efbbKC74Wm2NTEkoFYtGnToU8heDN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpdHKGdYTMkJehEHW7i6MqjH+6WTWK/y0MSxTzgXMe1KoQ7bed
 p2wcK2Y3LUIISVCc+9s9Itfkbcnxdy78pYrhR7Qo6kdDM5S2qHqYFAWoLHdXH4xsj5k0c8xBw0u
 NepRrps7mjKfMSOFuKtVJVcViLcOWmXBH3IFc/iH9pW1QcTwSmoxgbNeIziX5tJtdkvJypY2E6E
 ETvCvb
X-Gm-Gg: ASbGncu+H00fwy+tfvqKqZokOMyB3Wk5jRR+hf7sEy7xeef803EwEY8z2WYRHuJLR+h
 J2DSN03nUbQs63DPy/Br2cToSQxvTfbFVN4QSQPJg0MCrzC634alEc2nliG03bWdWSI28oiJ76L
 UEoEMnS3eUiMvh0avMZMkGJ4qOiG13exIIKmAvrQWidefv5hPhtPavuO3dHv1AnWL/1m5qeGlSn
 YH7qB+wfeuMibjO5MdiCvwmcFDrei2gCG6IKlOVUYxS2tTgO8tZt+iUfOkiC1h2oUkp9076VD4d
 C5tgR/6HTFihbYovZHs5So35HH/da+UwDEVyqzddD4ZLhQKlGNqO3YLQH07+AS/pF5mONwugyGs
 +WLmAzF7Z2MOlTvbiuoec5uA=
X-Received: by 2002:a17:902:db0a:b0:242:c66f:9f87 with SMTP id
 d9443c01a7336-245ff87a0acmr5982645ad.51.1755733150824; 
 Wed, 20 Aug 2025 16:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJciBVPvgUAISLnaeCIDM3TBinhx3jI5VVAs1yjKKv+IWNyYEVSSEyv5G7WBqrbl04hMo4gQ==
X-Received: by 2002:a17:902:db0a:b0:242:c66f:9f87 with SMTP id
 d9443c01a7336-245ff87a0acmr5982475ad.51.1755733150316; 
 Wed, 20 Aug 2025 16:39:10 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 16:39:09 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:52 -0700
Subject: [PATCH v8 05/11] tee: increase TEE_MAX_ARG_SIZE to 4096
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-5-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a65ca0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: A74P0c2zJ-iEwQ3InLdGp1gY-grN9RZ4
X-Proofpoint-GUID: A74P0c2zJ-iEwQ3InLdGp1gY-grN9RZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6dn3WTPYrsYw
 38RmOgh4+XDeKTviJJgpHLn5E6uoNU4S7HdlzFQRyo988c3vWxqzW+fVglObApW0x9jlwiuwOVE
 r+BWjEFu/1IVmmCGfS/L0CKcuqan1WALVCmnK04B9sNJcUftMAW86J5Nb50g4ZUuBCBf9rP7O64
 SIZQo8kB4ktrlR1+iZyft8KWgaLJVUx7QsmCtqW2rrgthLoAjmoh1UAy7zZ8xOVzFszRvWYHPEG
 qMdbkP/V5QOvk4cc8Y8sruB22Usec7velwcQy1LSSvtYcBgH8z3E6UEr/jpzi44Cud60/wy2XwQ
 6LQ2x/JpoldJJ4F8DJi3LzK9VU2Ymr/I+AXcDW/ysG/VmGcBUja+LaVUiyWZWdw9PrtF6E3nPMG
 6hRuikL0dHsB/4mMV4u/WWf4sb29fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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
index 441d97add53f..71a365afb89b 100644
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

