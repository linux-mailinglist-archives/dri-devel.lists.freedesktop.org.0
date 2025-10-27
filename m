Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10DC0E12B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B827710E4A9;
	Mon, 27 Oct 2025 13:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="etrFSmYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0234B10E4A4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:35:23 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R7JtXI2059245
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ErdY8kXLBkkRgO7ggfayGK
 UKWYq0R05r3pV8kdnXxTA=; b=etrFSmYzd3qEMObYGP+YmmdVsUR1EngqecB9bd
 BGWEnI3xtBl9ig7BNdgiujGFhcXW35AyVY23Le9QFfIKUb2iACwwcdM+AbQ+5Rfp
 5t2hjB9dYlKKk6djVqWRa2Lc/lvrBY/WKgZqxIMz1lwBHt8Y5pI+7hDk0yRRNlws
 WmGbefkVXtOpiiIAX6D3AVlFxMp5bE4i5EN1udC3CGcmv5W89hnkc9aLy8RoZPOB
 gzBB5wE/HcyHy43z4uzt+6kFOs61nz1eszbhHMGgK2PoMpSfDeREHrrvcUSQz+Lt
 fVvGH1SaYSL/NYJEqc615NDhxUqiZ6IbCSWD0YkKw2LXUArw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p91n8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:35:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8a89c9750so143490691cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761572123; x=1762176923;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErdY8kXLBkkRgO7ggfayGKUKWYq0R05r3pV8kdnXxTA=;
 b=r1divEDOiWbgR+aAhIBfvwaFScK0wX8dfqQ0wDZWt2Zs96l9HuLu/lErWHJcjWt0r1
 8PpLlp399YKsZvRCNiQjAaUYDZzekuCuTgqeFkUWpmEhH09ByHTkQundCHu+CX93Ejf6
 IuULUS7JIGg5KdqqBEqyFvgEnXukZpdYf7SkmL+8uAyjicc02lP4H3WM2epeWuVin3ZN
 jbyIOI/t7s0wFW1nQsiBX86e4oVJHxbxrFJmkMxWXJiFRfL0vHN3BnH6gRtoztgYLXlP
 Eb+GUq/m1rdr/V6EtJOyD//Xm0LKgo/xZvNvKP8oHdlOWgOSAND6oKRkvn3asoI/cD1s
 iVZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcfRfL6ez4jctgF8J1jlsZKGUvcIUVpzqEYz7cnar7cYhbsYjZgSVSk3xD9foxzp4boSVbDBSGw+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0AYrWay/Nd28F0fq508kht7MYyqNaUGYuZOV7YcMKkO3k6EOp
 NrWcw4JBLj1I3t6V0zXDLpf9iIRcySQ/hMOgf/zvjPXNoNLUTh2MB5UiKzIthBLI1OcZI+0Zhcj
 NZc/f3T+YM+3Mkt7lB4uIB1WfQK6OiZb7iqfflKnNPjrvBNM2Wf83wWv1gw7XEBN95dPHYn4=
X-Gm-Gg: ASbGncsApqrIvpZuKi8FFTvGfyDuE8vMUaiayDfEevBfExQcaL1ZdGYdy87bE1rOOc6
 7IdABVxxE5+BfSOHyGYdJSQLG7N4OwDlrU/9gYWjg8gQal1lPhhsbHYrkjSqUTohocFSgOjT59x
 U2Phz5rU+DuL7RZTzR/SqM2vpYCMo4xcoEkm2yNq6VQErlB+/lX/RZgfcOK8tMQ9lCnvyXl7eDi
 4cWAMLNvhCLdLgoSAnuvdfJSA5+wGVSA0bZW5/VhXPoEY4Fy5atxSKRAfc8rILJOvdKEmunc3wt
 rZLbm5l2eUink2IaXX2bFWTdvk5XeDqYDzFlJ0/oT47mmD7Tqub38JeidZxvy+c+qRbYuwStGh6
 Lnu4br3wpibYD1PZ3Wj2LnJqQFcuPJgXh3ScO9nFdeY325tpZjSRwlxi21eYrOkiDvQgXbGGm0O
 0OPDM4ghOlRUr+
X-Received: by 2002:a05:622a:19a3:b0:4e8:b42c:e34e with SMTP id
 d75a77b69052e-4eb94836cfemr124817661cf.34.1761572121072; 
 Mon, 27 Oct 2025 06:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL/k6oJDubDmBz9RbFEPxNjPP3Xc56xvSbGxP94oLkFvGUc3VW74FMXxrNUcFhRspD7ZNgBw==
X-Received: by 2002:a05:622a:19a3:b0:4e8:b42c:e34e with SMTP id
 d75a77b69052e-4eb94836cfemr124816291cf.34.1761572119124; 
 Mon, 27 Oct 2025 06:35:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f864aasm2290602e87.109.2025.10.27.06.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:35:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 15:35:17 +0200
Subject: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABR1/2gC/x3MMQ6DMAxA0asgz1gikSiEqyCGgF3wQiIbqiLE3
 Rt1fMP/NxirsMFQ3aD8EZO0F7i6gmWL+8ooVAy+8a1rfIeUTyRNGckWJLZD04XR+Vcbw9xTCFD
 SrPyW7387Ts/zA96xHQRmAAAA
X-Change-ID: 20251027-dpu-drop-dsc-destroy-a1265a9b8d99
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fbnJXiQX68kkbm/D1iLlZF0GumHyj/1MlksgTx0Y+yQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo/3UVn1nXqSc2ywmsIG7i7wkAE5ERKMYibym4+
 Os87bouN7eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaP91FQAKCRCLPIo+Aiko
 1RpbB/9MsRHR+86Nxly0FzfgipVdlEGVe7l+h/K+TFN2Aumo33Zh4sKMYONm2WeQfWvNw7kF45k
 gGMevuD2li7T4CCn32odF2VxRIZDY+hfj5g8b1ElsR6aLJbodSNKxJ//U+gZncGOGIHX8I+PQKB
 BaaYYJzxFCAM6usI2PM/sOiZ0BT+uZnk1KR15EOe/pbkrj2FMjuMdNF3vqKOQSpZQYE2ExZNVU7
 SggI/ub8qWjmEoRuKbIeG82hUPzEWCoYFS3GWHKjBC7oe9AXenLemI9B15RjQBmpCijRdpAYOxE
 kVPwUY62EFaZEgiE1F7x+LzfgsMK/QpdzoHhffzuahsn5J/2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff751b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=s4j7PIB9qVrboWrP3l8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNiBTYWx0ZWRfXxzOe/T17KckA
 ecqOZtat89LYP/5wK79V1pIBMfvgCYD0D9ggEbd7YLKi8pHfB6z2jH72ltjxxAwfdfP7WXbMGcl
 pbZWGJxhvpQvA5fr1gE2aVNYVTrE5pAiDmqqnTvkd6UBTIqkln6bofmZcKEutyiKdXXA8PWfBTU
 IOpQr4hjFeltYVZqstdMhc1tSD56+j6/3XbB1LrzG0sqSO/XIqWRiaqdQcTXxjCncWpHgaUmMna
 vgrFG5PlNjJvofbKI4QLL5ypIyj25Y0k2gcgLZF+qGAYgKJyec9zHt+T7R4yNm0mtH+6VthPeCm
 oRPoKlKkvoFT6lIOftdK+QERVYfduwy+uYroU+/e7m8JWF5K+AtlbfC7o6SNQ/MuBtjW+wwZ4Ah
 GM028WRcqcdlpCLFvBtQCLiGM4Dixg==
X-Proofpoint-ORIG-GUID: ywFlhwSIDdABJpSf9ipTwLivGOr_WHI2
X-Proofpoint-GUID: ywFlhwSIDdABJpSf9ipTwLivGOr_WHI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270126
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

The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
the header.

Fixes: a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for HW blocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index b7013c9822d23238eb5411a5e284bb072ecc3395..cc7cc6f6f7cda639b30bad7632c6e73aacedfcb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -71,12 +71,6 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
 				       void __iomem *addr);
 
-/**
- * dpu_hw_dsc_destroy - destroys dsc driver context
- * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
- */
-void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc);
-
 static inline struct dpu_hw_dsc *to_dpu_hw_dsc(struct dpu_hw_blk *hw)
 {
 	return container_of(hw, struct dpu_hw_dsc, base);

---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20251027-dpu-drop-dsc-destroy-a1265a9b8d99

Best regards,
-- 
With best wishes
Dmitry

