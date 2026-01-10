Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC0D0DBB0
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C761010E204;
	Sat, 10 Jan 2026 19:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXjkNgiv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkSB+1s4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333F210E204
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:09 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AF2mU24190680
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 44E0YMx+5tHokjY5JA6iZJ4USE2acpUV/cer9MR6AVQ=; b=HXjkNgivG9EiPBSr
 H3tpl86Pn3z3IzXef7b/+XD4f8reqLrZyXmaif5m6sp72PjfmXx4iZ8QOkpcn0+C
 qNRKZxJRqF4CKds5O/MkYH49/tgeQ9FB2RlpD865G/8ipc9FXyl0yRs+fFdequKA
 xJZ4noZrWrlHj0UjD6stmcdACd883ZcrjYjeC6l4vCJenq71s9e7o7YpKja2aYNG
 XjZcG5WWw4W1oeIND3d1Pyp+688rwEwZjGlUkKy5tljuPtYwkYaTLf9iF+vDNyix
 i0Sj+eyT9THGAkh8GdPC0EmD1K1IPRjJFOWieKGcS+NbSXO+4SJC5xFK5nSAsPID
 P28P1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks258bj9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b8738fb141so1120327785a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073888; x=1768678688;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=44E0YMx+5tHokjY5JA6iZJ4USE2acpUV/cer9MR6AVQ=;
 b=WkSB+1s4EQhI/3NbVhWsd42tWu/E7OpIXLBgYAQnn1i7ce31HEpNZs01iYcTioKNZt
 Sv4IrJj7CYcfhoNJM0MiyA5IHgX/K/hY/Kquq2QKwPcv/cl6zYNhaByJinm1Y0vxfIk7
 IirHtYseTv5fQ2sHKSM+cFJa1fMvTNUhDvjtTWCKmnr9le8Ilh421dgPJTn8RjAucLVA
 B58hSUXX9BBdOTX4dS7W0hbNxk3sgR6aYQDVpngzuojqBuxZA5iM0AGffG5/oBU4VxZN
 F3kOeexI94dvTKld9Fz3O78Q/EBG9xA3RcfgrjeHjD3Ne1kpJLbhpbrq7jJfC80HTtXw
 Hb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073888; x=1768678688;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=44E0YMx+5tHokjY5JA6iZJ4USE2acpUV/cer9MR6AVQ=;
 b=T6CB+nfhKd4ocyOrBm5jYhGWXWGs6hsC79wa9kw4FqGqtOdjcBT536d4kz1M05Ucn7
 yvxX1S1nFdClYA8F1FiwdbZCHdNVT1YrmwXg20NDEBI6b3MQuY3aEJNXgkP/qQYHw3lw
 LtZYf8GHwL+RaMIoBZrIstJS5Cdqnl3QsGRpvHiVzNNXXL+YjxIoAurU1y7TlnCyBHhS
 HeDJkPVeXva5+22rZRLPf05z7Wu3ViGnzwoLbKogJwNl0BajRuQhWBrhGbJn3oEZK7R2
 4OMp1AXDzuGcKzSr7glO/co5xSPuRM4P39UU7MAHc5EVLBG4Sdbc8Bn8Tt/PNOE2JWCT
 2ThQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWltdqtBHNo3N+xLwxBeJBBNzUqC0mHQMEa+/u4/efeM0oIBkIcCgTZ7IYnWx9+eEoq6bvE2qLSXHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzS5VY1+DUxAR4sJ1jRaT5Se1fs3vaV8e8u65j7/T0ucwEry3X
 J/uqpmyo9mNS6YGbhaiJFxrSmeN1tlFreDSnjNHgML2/m5rC+YG9d9mwBZdaDiajw1dhWDieY9M
 wb9E4dAhasZyro7LrXQLn+nssSaaMfFGZmhZj9y1AwafFgbn6YgSILYkgllqvVg7XBUZuK3Y=
X-Gm-Gg: AY/fxX5jn/bg2vgn0Q69ufgWv97M8WK+BJyba9KYI4+d2iV8GJILk8ONt5u/SQGXz4O
 Bz+Fd+lrSxIFDco8K5dLffcvKQPNliUSWH65vG4fj56AgJ60V4+jCW8dowkKtwVyLwNG3NIgo74
 pI9o/d9inZg4q6IPUltf8Zlbr52WqovwOnE6/5z6b90s2voxOfUY9uKHoihy5iQmFRDqL9WYgEK
 DuYtep2D2I6QzUm7dQ3YYKVNUxlhyG2W7izTRzivYhhHSaoSAo6l5OPWc9L3f511pb73ve5kK+t
 qqeJBwmG63g17ug0eT6lhAVk77FJ8BwYT7+hzRj7jZEXQ6I6YTlwPTOi8sVb8uo1iT+kpf/PDWq
 QuK1XEiCvMMPuu12jWjBER8EkauuoLN/CAC98nX9GzOGmw3a138GSWPWaGhv/wWxdZjxwpGvMTw
 KUYdRnxLsmRkaQd0KnDf6dflE=
X-Received: by 2002:a05:620a:3911:b0:88e:1be9:cf65 with SMTP id
 af79cd13be357-8c37f54ead9mr2456980185a.39.1768073887808; 
 Sat, 10 Jan 2026 11:38:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYrHPeQVAQ5a3qfu224MPq06XLRTO8fJCMxGIN7Nr+mANrQ7JIvuzpudnNJOXpcuYnKvhw7w==
X-Received: by 2002:a05:620a:3911:b0:88e:1be9:cf65 with SMTP id
 af79cd13be357-8c37f54ead9mr2456977785a.39.1768073887328; 
 Sat, 10 Jan 2026 11:38:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:59 +0200
Subject: [PATCH 07/11] media: iris: don't specify bank_spreading in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-7-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fg14kcuG7sEkK6DBaOxh0G3+G0MJLBZT2Hb1acuuvlo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqThF450ml1fy+pA+0PHm2B6NXSqtzr36AD+
 ljU4FlHNo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1ZzXB/4zieglXpBPj75KASN5PU2K9vLJef2+t+9cCIa679c9+TOd/xJhapOjVu9OZ0Z9hjIsds9
 iHGS7VfkyO/il1Q58SY1h0vN05uDi4RkmNwoOoNZAMNuuP3xpiScLVjtZv9QzLo9T1rg+D8unpS
 +fOrZ9Xp4JFOKq2ByDcA4s2SGfbdlYCCTwaDb40246PH0YB49alyQkXQoHQVSL4EUXSlx+1t6S0
 oAH12jWo3WuaCHXZ1RrCZ8SZ5lBLv4WXJ4eZT2mF/92QyIyff7wkGDVf0U/xT2CkvJIlx9dhe9R
 wbPwnqg5dY7HnNnMa6sDtU5RNGtHeaKqoEp2nt7LrI4TSBzc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX4XLgJlxoMuHk
 hxQ6uQ3kJa8sdMhnrXCVob3C03O26OiPuRdJKHPTDpMgN2LLOyV5pMEF4ZguYJmIv8mSNY9khoQ
 4Ii6XXeurCTMqWVpaSimmEHm556pCuBpBAgYklOjWfRAQLJqOhFpDmjN6l8equFPSTGaQ+XU1So
 o+QfZRzLCx8UV5raeGFcuhCxF+pau0AWqUpOllJI0tZorX2Piv6ESTwVzKkgCcUY05uumAHLFV0
 GRCZOtN+W9NHR6cBCpWT0NTPz+Z+iUr68PqV5WSu+bRbfOVlNGOLDOJ24HoYpZd6iVdWePGLJ5z
 muz8I+3+kxYQ9gSZ9e4gyLatsmQH5hyF1+lEP06t3xxvMcwF4a8gDAbUouNqko0FmF8gX4mgpIj
 +3o+CBnJLEP4KiglvwRxxaILigqWtRNqwQdN5cxZHHGoca+eJEyAQtxVgr1UP8KltYLCA/jvLr1
 Da6mWi9XOksahQ8GoJQ==
X-Proofpoint-GUID: SKSs7rgE4UppXEZFMBugrkz2PVreGtAr
X-Proofpoint-ORIG-GUID: SKSs7rgE4UppXEZFMBugrkz2PVreGtAr
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=6962aaa0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173
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

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a880751107c7..9945c939cd29 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = ubwc->ubwc_bank_spread;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9f9ee67e4732..f99fcbb8fced 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0f06066d814a..c967db452dec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3

