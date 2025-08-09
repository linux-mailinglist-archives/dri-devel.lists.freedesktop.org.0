Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A82B1F350
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 10:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E87B10E2A3;
	Sat,  9 Aug 2025 08:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9GwGara";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070F110E29D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 08:34:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794mTZW025013
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 08:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=; b=G9GwGaraZ/Op0nXw
 0zh7xI5yozxuNGwywTecJ/riIn228egTIbjUCc/RD/zp8tZSD04p9PsEXzzOCmjT
 +RY3OYjDYELTx8GIdvM8OKLgB4Wsul5l4XxLUuvSZurneQjXG8jqFiKQv7aPO3Fy
 fT8VatYlMmom6IVuJf2wKyWKaHsMqUuO6R1sZLd+ZJaD7ByNEd9nnAdmTkdHYOYM
 wABPMoTGl1DCcTsGbK9cVoJ5pA6biRKdMmkmFNkQAyAY+OIwoWDyF+ok4Mqy5631
 b4kH5rPzmq+jshKeSsCGbb/Z7xDJ1PhqarMSzeylQICQYxdzWGqjXqQ30HLPGmI/
 c2jxDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9g8jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 08:34:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b08d73cc8cso71962511cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 01:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728445; x=1755333245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=;
 b=eM3Q1O6c7WpRHERd1R+G79mI1xYcWiPkJHjF5IDw4HdcTEe+ogxEfIbk+CFSNjpVKs
 i4mZmwPD49mL4ZAUMVuWOUz1/O08YEcd7roSKKAuqFsCH9apKqd/XnXoLnR+8JOzsHeH
 UnoYui3HBWk5iZrTjTtH8brsL4i9ziqEwdNFpRjQ9+Mk9tOERFx3ZqJOtjWEipaPGQid
 2QFsA8dTexb7I806e26RQDdQVWwf+Sb5CIWZHDOFvuXhkfJs46KogwFYMvBoRB3w5JdD
 g5iXGP5bbLOUb5GOmC4XMi47axCwl0qUJhHJjzHHtAM2OUhtvKtMJHMyIRVSyhs/Wi3Z
 5a4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5uQub3M7veBO9I1Efw5z+pVPZMG4GdORSHYjMN0bqali/ona4Dd6B3G+LnpIfD0DZiiSRi/rKIe8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywhe3d3WE2XXjjITMp2IJ7XldAB8cVlShVoc3vy1Bab21uqN3F2
 eAJk3kK7qE9IIus7cjf2veAkq4d+7hoZZOigWSRhGsd0HEEsM88jsIOMq5cZSvan3SsQ7WnwCyU
 1iMGvZ8sPyA4fpIHRVgQno9UhLT6Xj0BLzZOngzt3sxn+ae3R3v0elWtLiCq/DuTV4Qzls0c=
X-Gm-Gg: ASbGncte+xOKmiHBWwaIfghk3xlLWJKnSK1l3KtUwjLdOp38+mKhMRBJG97O0HZzJxU
 3QzypbknvJyZs9V79VJBNWJeVfT0TM1sJQKRh151WpKdhDAEG6GHQMyGL/IvTwGHSF7D9Otg9fh
 yR2P9P1ptrQCvCFSSTB8L8tQfejvU7KBeMAS3uil46QUml2whJO0QyQibLun6uLWwR1XqjnVbhj
 3WcCMe/DzVulOwsI968peBS9MLkabQBpRfXPrmO5iJIT/TRGB9teupvfImN4YcNSlIa3d8OVRuq
 iffBKgzw4HhUrtxd4OwF+OPbjO8jkFuzxfqZmI9HYbQEQDZY8wnl81dLaXchnWborNgtZP3BEEX
 Mvb9NXUW8r1RoIJ5xHolBX+kaog1HvLsRRzRGelx7IgW8dL9bHVKq
X-Received: by 2002:a05:622a:1a26:b0:4b0:871a:1d29 with SMTP id
 d75a77b69052e-4b0aed40874mr94915611cf.23.1754728444747; 
 Sat, 09 Aug 2025 01:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFig4RLdVa+ZKtVVWlKq4qwy4Mdk+4soSl8FgCqEL8l9Uc8hKFCmYGvSZPG/3ishEDqASv9uw==
X-Received: by 2002:a05:622a:1a26:b0:4b0:871a:1d29 with SMTP id
 d75a77b69052e-4b0aed40874mr94915251cf.23.1754728444291; 
 Sat, 09 Aug 2025 01:34:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:34:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:54 +0300
Subject: [PATCH v4 3/6] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-3-bb316e638284@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1DHFOJ/5Vedl1A10IE8+ZyGBBk+aXq5TcrqsRnBV7aw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0KySR7b5nEafzqIH/w6XFWN5nSrXlVFTPu
 zpV2R/SmsmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1d74B/wLBzPtd5TN16CKun8cN+yKqM7XKe3lvESHvQ8ynyfNoHn2CFWTXxVgsxf6kOzCuuYZEwk
 U4siRD+S3q1ax07b8niuiEcC1bFAuvZ+x2e2UGJnkcip/ABE+g346Cq4711K8seCP4WT/47F0Ih
 eo/YMwLkL5YN7FTwCpai0BCighJaX7h1r1Krn6ZoBIUL0MlgPOqeMvbZ2q9WdTUpHnH0YKAosQh
 O7NB/nEzNgTA8sWUC24e6EMISlwAtmCCPWiHzhItkxdnAmi/lK+34OQSOhdIciDWozHs4I5ieHY
 A6hnaS2SU7P3o3tzqurhlD5EuBeq6qP/P7sFd+2QE4otzehv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sYOJmX7S1UujrlDsXa6cfz7gs2wx_7EO
X-Proofpoint-ORIG-GUID: sYOJmX7S1UujrlDsXa6cfz7gs2wx_7EO
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=68970801 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LXTjkAqqvG_e-hvHT3MA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfXytN34RGmj7KU
 3uc6SxoZ47NZ4cVFC+1NMiL4MV0pw2rgtwxPBagcdDp/EB93EHKTmIXkzW9vsnyqfbCQS/l9u1O
 4FpppfmBuIAKqnU19u3qmFlaGAA0AjyS9qXtatNX72y7aX/3jpqPJNC8inK9Uta7gxMd7DmRRlB
 Lr7kfqUbw1hfEcQISEGoI7APBQWUBJV3dbTe4YHjbqRwDpAduv6zdSdabPeSyGGQ/m9C31fsqxD
 HR2eLbDMiCHgHlVMkmsJd6zPFIFLK8QhaRBkj6+haXIufM3SnMNPf9YMMYW8ASAmxJVGiJtjeWH
 84JOc/1/SNhiIOrBAW0zdjbdqaqxl0r6z4gBxLm6vQC8a3nUnlJRn8J6sr6hv4pZlzCld0cRatR
 akg6RB4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..55e37ec74591af0a1329598f6059475926fdd64e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
@@ -180,6 +182,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.39.5

