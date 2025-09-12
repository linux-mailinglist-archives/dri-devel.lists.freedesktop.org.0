Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693C8B54168
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 06:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1210E417;
	Fri, 12 Sep 2025 04:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TqMrXJvD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1504A10E413
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:07:53 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJMIOA026747
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=; b=TqMrXJvDnndTHE8V
 cdwpRbB7NMB0Uza1PdVqtA1sHoldiQ07zAcyYHo3s7661dkj8pj1MPfX+eDE79oj
 tsvYh/G0xeJJnhUxmHuCLO4hzWvP8BgITilhMfSL5Q/23TfwqWXKjZngNcSnYsCH
 azw2ZMTjSeDkWvbef0COzDWFwVFYpBTPumj5KpxRetgAGkBGsu+Fsgh1pNp6BwLZ
 yo8jLYDSOMR5VSMPnQnKDWhhd64PgQIdlduHN6P1KyBgdR9jv7XBH012MgKg/X+w
 90f6jtIBkn+JwuF/KEs8/JbZ/NefXQvm1XNbs2I4wCPYfM6akRUAZW1TRIZJ4zZw
 szBOpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h55dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:07:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b47173afd90so1987012a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 21:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757650071; x=1758254871;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=;
 b=D3s+GW37cQSrv+a34A+ZSYiW6hOS1L/8F72V3ulVt+YthNKgPxZVRnsx1ewC0jlxfr
 ArIhaTFFmRxip8mkkuHrHGHcHWXvFrq5GohArhyAT84YvIdAjTB3q7QMJkcH53/gA5nq
 ASIcDWDwTvJnsp+q73vfRr1cn/lLqpc/ahESfhkC6F+eVLd57TUQz7UXCm9nCz4UtoYL
 yyn7Do5QHzmLW/Ili59McM4vhilZbxY+ftDdqSE1Hv8pPDcqYgoxEQrvvbXn3BqyAHWw
 SNA+zUFs0Jq06LO1L4uvGhpTWJeyGFgQD65GWCpatAeYWmnAJNtR7vzv4kV3NEWxmkTR
 +V8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLOrUC5j0vzx3aMLNgUoON6gA4L/VC5eK37koSqJG2UNcPlTdCJuAZxZF9O/KaKCnPlL4pv/d6Wa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3M3omfJxaHUyi7v13093tYbcltK9pSh8RDoIS2/WTJu+4X806
 49l5s9HfEz4OXay4EpDYxbnQU/YnxboeKL/eVpF/iaDs+0ZIGj/MX1Rc7P2tvQkgOHMp5DEMXGv
 ot+OQVZ49bqFUhx84bj8+OswQvP0wYqly5eQylTxYs1JsznbvLexwQpdpuo5L8weGMc3sSw==
X-Gm-Gg: ASbGncs/kJMWQWn5AfNpg1RwpiCUVfSroZGBjaaT39tUeWnqnVOLZz8Q5Yfs2X9G7ld
 jovWMHbV+fFa+9Igw5gHin55WzilI/Z9zTMWlOuF0ysFyr6Lb+0rh2q/Vfn/6IEuYEDbJutpRA0
 KiDVdghvpcY0cU9r3OpXRtl/ebO5/QiIO8jOGQ7e+y/tRodjLv1LDefFBl9OihlJqFIGyuQWeJd
 a3ttUXlh6inKf6Td87/k0nme8NgVLdb5hcZG2VzGRQvMqzBUJnJnWnoNBpfGkFR5cDB3uC6VMc+
 rtYswgSfKTtYipM2w2ui8hlK07jLteuIO67NkVkLEu30+nXkR5zdbErLs8I38mkVl12TCvbNqgc
 xEHr4tIUXazGVlWrcZhRa2k4=
X-Received: by 2002:a17:903:2ecf:b0:24f:5447:2197 with SMTP id
 d9443c01a7336-25d2587d2c9mr17317615ad.14.1757650071302; 
 Thu, 11 Sep 2025 21:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoqJc1O/uAlEAxgaKcABrHUnAHQ+NKSR7AY913bzR8AUunHyu+K06+VfdNdepa7qcmVz579A==
X-Received: by 2002:a17:903:2ecf:b0:24f:5447:2197 with SMTP id
 d9443c01a7336-25d2587d2c9mr17317345ad.14.1757650070858; 
 Thu, 11 Sep 2025 21:07:50 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 21:07:50 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:42 -0700
Subject: [PATCH v12 03/11] tee: allow a driver to allocate a tee_device
 without a pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-3-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: WW-sUiOls1du_7DlDFj1EGtLStVBVyl8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX7TInvDmYofk0
 Kt6mWJjtotfFnqStGkhODrL0XaFzg399Y8JYtuPMhnz6yQZNSIfPzcKmMs5DrAUEOfKP6Y+dXhF
 fnUr6B6p/A7+LflSU8b7eIoHktOdJRyqkDbUTdEOPn1Khx0LJrAEVPFdKiHnvDPLSQlEWOqllJ9
 zo1OQEkotLgL7BiZ0vu8uj00X5TDiKF42nSTK+GrMkBmxM8mawGoX/jLXDi0R5St6bK2uqqbs0P
 GHMYOckKFQBHhTl6JvEPH/g7Sxmh8zPxlkTLwXuNKlCwNGEHRc3HOGNy/u9+0edatRo6Izckidd
 YSu5SMv1C3zh7aLEa3frVEYTTYs5vHOcBQ56mLDAcOOaK92rqwNlEp2yDZ/m7HxRGj54Ubm+hEG
 rI3iWYQ1
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c39c98 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: WW-sUiOls1du_7DlDFj1EGtLStVBVyl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 807317d7b3c5..9fa042d80622 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -926,7 +926,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

