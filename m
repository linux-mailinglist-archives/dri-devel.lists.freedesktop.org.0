Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DE1D0DB85
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440C010E1B1;
	Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+6u4JTq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaOKQjAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F3110E186
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60ACnqK83260612
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cE1iNK7oSYb2ENHxgn2Nm8Ct5MGHGyoDIREyhbI0Xwk=; b=m+6u4JTq7WcFnqHU
 AZqj43pxtaOmHj6ro0EZ5VzxUTgxCfiv+Mbf1qD04IyVoEvpmt0VwZ6L8PVkgHk3
 JEXs4ZXWXd0rrGLuYoVqdcVJceSmFAo6BsC9CMov7c4rxR4H/5acquqFn4OEo17s
 Ie/JjQXkRsl84zbezJFvPkelYjD8b7M9JsqkDr+HCcUZJaaowSpXaIdFcbXurWTb
 mglSjN/34ZWtYgTeOQ9ZKUodpdfnSGYYotEnDnP+ouWtz6riw/Ojxh4pesZ7OdA7
 xfroPAWDSAXsQkId8ObGxnLfJvpKX5WyauwyJomVztQAzoMWiJcTUbC5bsZPLNrm
 dWeRug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkmem0pm9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b6963d163eso1327379285a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073881; x=1768678681;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cE1iNK7oSYb2ENHxgn2Nm8Ct5MGHGyoDIREyhbI0Xwk=;
 b=LaOKQjAofPtKfABmHRdtdUrlJdVaOPSBbu0ihIftsZ3/tvviGWmoV5PGLvkSiUHLS9
 UP5njhUxnZ/H5o8dlMvPD5P5Mf/bDNHp0d++K9o0NSYzgbGgcLZPfk0UzsxiCaxYK796
 2xnUFyT+hhHkvisjgKVJopqrDbt3hknyjRsNKoJ6kDO0lzDRzfc1gpd2Gs+nzVMkDfLf
 /klpxynJS40C2x4XZmIrvV22Fj0KqNKCRLvAsZFxCyVZYKXBx0bp7+7ed5XVuT0vAoHP
 0TKmeSO8z1Hdv0Me+9KHcWaWVDUMlxCjwQVqLzvWasL3P7Je9DROJ3vzGNStxIts8TgN
 JTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073881; x=1768678681;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cE1iNK7oSYb2ENHxgn2Nm8Ct5MGHGyoDIREyhbI0Xwk=;
 b=WW2cqUIvsaZ8fqVMkoWbJvkB5X883gI99i9fE2xhnabznoRLuJFCXuXndXGfvPVspj
 C7OVNYnt0caaZM3lUhsFijN38bYHPU4VFlmcSnHfw/Pk7knHqUvCcvgjwTXXB7e9pKtj
 QWLyuY+rzAyHEAWNYNtA0AY+jM/LJlb32bHUqAhDKGGqNQwybkB4C2vx7drrwBtp8+3W
 KQH6YFVdaqVTPwUM82WnIPUTJ0OVNxmNmC0hJtgD4OaQJPdFS0FI5+z4MAqc7rnrMUpk
 gTXZroxVpX2TTTXrBAdn3BEiuw15Mi8STuRdxXO4k+Wp76VmslUdf45RwlD2zZNzgF4M
 eysA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIw6nku+jC/WQpMkAXCjzmgC7uQEQRSSDWb/G9odymC8Dh//dWul8J7qanHRJi/S8Hxkpnk+efRDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEwOXgMKTe7Zq8eBvqjxIB8yMPyYK7vp+BTZOGXTXG78ILz4Iw
 2PzqW7FdaxMzW9MQP18xbSBnwuZKUg0dkKu4ICBB4Orwug0wP1YTylbI/Zt+i0dijKyJoIPwBVU
 nK9lOTvNIAvJn2FmNQbt/rH5UtyC/MJvBimA5qkisLN9QYr+N9YGpEDlsA/ZW7TSe4HdYtWY=
X-Gm-Gg: AY/fxX7TS8BR9sRyLIe08gxIY86aKXJdY+xHGz/l0MQHr+5dXPjhjipPehyONOkwtyy
 ugEzntFZkR4wtzZkk6fC3Lno8fZTAYxxyECUsHvzdL8co4H7Fjz4dGlsbVi3TD7gddZfvwf9Rj0
 WuniV5Wo8xD37/DHBtG7gXLjy8zWHPC5BRQ+0I4sl9RmQxK0HE2DcLwoVP7Lon9BcEPrGMwmF3k
 M0BGFypA4O0lUrI+rbvrU+QYp85nbMZ5QRqHp9HwGbf34BAvqJuYrqzBVFBuiQ9qr5jkJxyFBkq
 pZtP/dcCkGj2UO++T/1Zq7Y5NrA2NvOppCramvyisgIbXKAdbR4Y35z76MwkCOuJgSgBS36VxSb
 4uX7t+VJdmtzQwGC0NW4D729BjkibNs0x5b3RvuhomFwPBs1VeIDafUgW8463x3jNEeOFkqAXgM
 dRVwlRFJ2Tz19tHxsZiCJ8ii4=
X-Received: by 2002:a05:620a:4613:b0:8b2:e8c8:671d with SMTP id
 af79cd13be357-8c3893ffedbmr1740245785a.60.1768073880852; 
 Sat, 10 Jan 2026 11:38:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/f2rvS0VmS+7ayW3OO3OHA0x8A7hZk0tNL9pAd+oYNFUThZJ515f7N2X2V1J2Ht+V25Vy5Q==
X-Received: by 2002:a05:620a:4613:b0:8b2:e8c8:671d with SMTP id
 af79cd13be357-8c3893ffedbmr1740242985a.60.1768073880324; 
 Sat, 10 Jan 2026 11:38:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:37:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:54 +0200
Subject: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zKJ+c8HSILFFBvnz1YjV0aR6Aoj/wvUlPAFO+6q13BQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqS2+miKKkIMNsyVf/kiv0DOSE2UY6Wq5hSj
 kyX2UCIbleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1YDeCACAIpwx2qMLl0UJtMK6ivOoRA+N9ufTPpXO0ue1uvr1rIKYFwDC6s4Up5Lsd9O/6KKrsF+
 +GJ/xpjfpATisd/7FhAIqJGMES+O83Hb1UpFxKzHZBinekFpWpzs1LUFMeRHONj6v/GR6Ex40sM
 GX8hbcj0PhSPvJOEvOvh6QIMjHA6GfCLqsjhXztUij0QnWlX7BSbRw3ChUGBphTLRo4lAlheP32
 qnqALsCxc6lsZnmmqHLDJTWfcigghWgEQp50E/vOneTnGtg2j08PoK50KuAiE2XQ0Vl78HcSp54
 4fvV812T3g8WS15Wd3ulfz7auQSa9IQZvZFa6LjMb0K8PbLh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vOCUXsmK1ixdq7hO62Id08YHil3wt5IV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX8zK5ygZNI9ak
 dmvL1qG+6AXSd0vyyQyAHQz47U6Gdjh1Dcy86INIm+o0ZghsFcz+dbdM1eRgdTnCMvgzA/gvko7
 CfQk4hGDwF5q+7NlrEVSKCeKtqTb+E0BBJF1Yg7DqWLOhrPQ/JF8T26op4WYu3OU/TnwzHDC9Wm
 u5yixu5afd0mojgDgAP92VpeZn6n+bpVkNHrc/nLeOUNdxaxTsi5Am9HNjls2D859GD3o4ZReMF
 O2k5JZ7aheQRHMXbEkAtQm89ra7Xk1vK1DSAxWGx4w9cxSx84yJeOguitm2DIEo0jalf65gasvr
 dEcemXx40M4fMDwiNPctngQPqJOWldUTkScTW7AsTb8hBlQ0sHRYTD8otzMacK4Mss0qFq8WElO
 bqnq6j7ICt4BBC+f+gWHXlzFrz2mWN73QYm1jzc76i3E+fY2g225MP1tfXPzIcCy3K0EO/9kvp8
 uuTYiLO1OgwTOGhbk3w==
X-Authority-Analysis: v=2.4 cv=Z7zh3XRA c=1 sm=1 tr=0 ts=6962aa99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IHcyGVePH8s1r17UYT8A:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: vOCUXsmK1ixdq7hO62Id08YHil3wt5IV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
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

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f052e241736c..50d891493ac8 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3

