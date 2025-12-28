Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56823CE48D8
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 04:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B24113A01;
	Sun, 28 Dec 2025 03:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuAd5r28";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dl+leSA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938CC10F2CE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS3YmKm3315991
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=; b=GuAd5r28QY77yb3s
 8V/AZqxx4rWD482/eY3fosQ6GdAWaoqA0y/3gI2uJN7Xqyq61EzY7h0GQt6Vrkh+
 RAqC4ehcg0ZrdMuUGq8Q/CE4IsGbLDvM1qLbkzlLV9ifYCrSBVKiDLH01MTv3lcA
 1u9KjyARtHWmAK9l7GdTY4OVhHhjDfawBfV0i72btbgZemvHFKgutjMwKJNCHudz
 TQ3KjFZIAbipTja+yLCJDokPl/SZo14laKew77HNtAGktjvaCeeRs++hmXLPHJ6K
 BrHl/E3jKGOPqhRDuF0Tz34S6dGtjWYWUjxsVfJmzY4kknmC1l3X7525fVCIeME9
 bxzJqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj00ua-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee1b7293e7so297898581cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766894241; x=1767499041;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=;
 b=Dl+leSA2PWG5YgyDDnkEtNtZqEOuG1iiM2UW2sFwKsQPzB+tjlDWYYOtMsSC0vJUAz
 q39LtF6eMb96osjd4xyl/bLrs1S28IF6nKRB+1O4N2ik8znUkHLxtWyo2iZJ5wjqLuaA
 cH/NcVQ9BlMIcYkpX7kcfrC6QwN95Ulg1D9NYFHrtZapgeuJ9J4iJekiKdrFakvb1MO1
 kGoKYITC+fb2Wu9YVLgLBKL+GIuvDDv0ScpO7Q6PmzjhsAgE59LofgWgS15jvbWvYrIY
 7Rrcv74gn51D0X6QHtmsvSuXpRNBwAcEiWLwkx1lEjmvYBCxnWDYkQdEltsUD/l5RXzb
 2Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766894241; x=1767499041;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=;
 b=nqXG/GJR1+CyqK/zDoi8fz5qafHxkXZGzwUgI6PvOWHd7tLda0WOQcoU4bIlRj7jkv
 Qm4dM9VE4TKLRDNSuOJjBtTDULB4xtZDjivj2P2rtHzSpfjVdpftYtaLQ+oUP6vm6LKn
 bRRIWgsk9LMozgldTHy28UH8EhG/wFqbu1pqWLZQe9xabt7ODuJsIqVlJYINuZXK7e25
 fOltEw2U30lR1VA+TdzTqEnOCIVVDTrx18GBf46R5PEtIquQ9sb7fvMt3WYWlt6JvEbo
 CxV7jY9Z7G2xv70PdK8IUVQV1CJ/SzQFHvDuTM9LhpKhf/EWficeu1zJ+iDPU8zt7UV8
 dFpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi0HNoP3CPLX8FCq7nDrLrsOiUauMwNAemKo8x/+r54TDeNroHnJmKaUrJHjdFgL2qeGg2WtRls9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3PI93oanWjVZxDRuXKNHUX+qnIHzuZsbbrL1l9Eiyl6P7+uq1
 IukFaXoHwucjMXizPV6NSLsNkDDl8xuqrePU3J+VpUQE/4+YC7mRCgoCt/8Ewlii/XRTMAh1FRP
 GenJ0GIYi5LhOxyK1U5cNZ6lRczJqpjMq+WwQiZ2SuFh82oZB49ZFwdKkvDBINtojhQJLepaVXX
 6BXvY=
X-Gm-Gg: AY/fxX7rgVso87QLR3NlKTR8O6RJQiWlsDUWl28qP6kVigjK30pn3sa57WP0/JItOeA
 xNCDKhXXkAESOUu5aEuTGd+mmDhQ5FVi7PTuHVuBfJqMoJXwW0ewkv15nf7wGLbF2A1ohKmkYwo
 Mjtul7xh1J1U9f4aIce1etFj+Htg+v8Iha75AcN0bSgftrV+/e//qod1g/J5BxhO6KIs/6w2ery
 D++Y/VYXEJfJz3PFOhEI8c/iFuymBRBjc5HQO6yWD/VBvs4VLu/T2tg6s6fJzpGl9Xzk50bsXho
 LLlTCUyWK5kCTTMme8xJgscL9YLiEd9B0a3ea6lBu3qe2ESqfhnK9TwsmxKtj1A1C1QEhYfvOPx
 86/DdWNgB7++hT7xK/kqWtmaiGslJNvj/uXt2WF/f/SoRyB93mZKZfmsAh6nzL8BzN0wpnysTbe
 vLzT8fGvjW+O35qQlTeQ6oi2Y=
X-Received: by 2002:ac8:5c81:0:b0:4ed:44a7:cf78 with SMTP id
 d75a77b69052e-4f4abcfc08cmr396663871cf.34.1766894240823; 
 Sat, 27 Dec 2025 19:57:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRihI+vGoLHGy0rBYtNyQv+twoT5KQuP6H/KycbAeGtt5Su5YGLmHR7bgCPc9BpExprx3wEg==
X-Received: by 2002:ac8:5c81:0:b0:4ed:44a7:cf78 with SMTP id
 d75a77b69052e-4f4abcfc08cmr396663731cf.34.1766894240432; 
 Sat, 27 Dec 2025 19:57:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5d37sm7883586e87.7.2025.12.27.19.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 19:57:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 05:57:11 +0200
Subject: [PATCH v5 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-intf-fix-wd-v5-1-f6fce628e6f2@oss.qualcomm.com>
References: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
In-Reply-To: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=s/p//pRO52a+gehzMR/sFVop1oTXxVfxhzjK9LP7fJQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKqaQcCnxzpAERYuI1BkP4lP7s4Y8SjZQWi9c
 iJnaxelohCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCqmgAKCRCLPIo+Aiko
 1TXZB/0eNQwsLafwu3hdu9ZMr78lj7pdHE9t8stem2p/yTVUxVfIVEuM52t9jHqqgVRViVJ5MwU
 gqO/ovI+BWvkHZH6NUPsGLz0cNqRTMEZKwh0qy7umCa1NAkWUGq+k8tHHxOtyXWF1CP/2C5vGT7
 NFlTKK3Ffv7KRBLSFkto20diOUTY2IGLaR5iATRcmkreFGfUui/QON1Ua5bwqnXMT4A7mlVq/Gn
 q/zysNMTd+1qlK7bbl9kJtMXVyZ73cxVppHi/jvfosWIyDlUD4VUMnahBxJOjWW3wK93044vhSB
 j+a4lwzvp+m26J3mNsx1vSeArw/QjlXcaEDN5bWeuyMT9Die
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: z7PwTk1BtC-iIo8TBnHV6tu19-zUkY61
X-Proofpoint-GUID: z7PwTk1BtC-iIo8TBnHV6tu19-zUkY61
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=6950aaa1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=JyrEbUn3yN3s6GbRLFEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMyBTYWx0ZWRfXw1y0wfrk8/nz
 pdC2zi9lSV+Fkk/E5uUy8kyCBWIqKWpwFWjwcf1jJ3TywAql6BReCJnV8BP/jPYepjq4zdvayyB
 4pCDNOBqq6tdDycIKK8FI2GaQQV1XLcow1BVJgBHANHIEUVjlH5nA0vDnYEgO2RagGMzAdDlaM/
 TtPMXj1dCGYlFSI6Q5FAp4cFUP8UuCi7G06VnMQRd9bSdfr9M4QPE0GmtXRIqK5HutgbNqY9ofa
 g3xS5Ql1z+0VRSzW763yFC2fR4nxVuyRa8ofs909q7eqPrcjPunbHeK+zLaH25nKq0UIqDQ0FH7
 ZRIVySCvoPJdfKWcL0072JoT/c1GQUqjtY10iW9UuWbVuBwmGYhwPi7GOYElaKlWb10xEldAcYA
 0BK2fR94t8UR5+1t2BdUCPtQ0eD8cL4BTrwyunbu+6LyBYH6o21LLMOJcKYa/lDQ3YCS9eRFp+y
 +lgfj14R0fXbZPhFG0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280033
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

From: Teguh Sobirin <teguh@sobir.in>

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks. Currently all code to setup vsync_source is only executed
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
[DB: restored top->ops.setup_vsync_source call]
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..3921c15aee98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -774,6 +774,8 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
+	vsync_cfg.vsync_source = disp_info->vsync_source;
+
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
@@ -781,17 +783,15 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
 		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
-		vsync_cfg.vsync_source = disp_info->vsync_source;
-
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
+	}
 
-		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-			phys_enc = dpu_enc->phys_encs[i];
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		phys_enc = dpu_enc->phys_encs[i];
 
-			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
-				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-						vsync_cfg.vsync_source);
-		}
+		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
+			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
+							 vsync_cfg.vsync_source);
 	}
 }
 

-- 
2.47.3

