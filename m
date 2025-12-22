Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE77CD58C9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8D610E037;
	Mon, 22 Dec 2025 10:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsUW0NRG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8DCfMxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B373710E5B0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM83fAv3823070
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=c8PWEb0m8sW
 dkLPVou1pl3oui9KwXqV++4vSVkw9qLM=; b=jsUW0NRG8L6RSidvL9aT/GcX7FE
 NsATauuEWdt1CMmkxD03VmAR+dI69fU5sCT+O7XzEXjNu9pDVYoQ1rWW2M1Drouo
 tvAU0WUCzgL2MFjU4Py6512Qnc5zkwDP2w1kSH0Xa5WrFXdS8RArb9UmG/RKgcwg
 0dKpuCdLlikRftfQLlQwv2tpoBAv1MT9zjcoVIUgRnN9rQwhgLTmH/Yk5wXT8/9V
 ZnebsPW6MFl9y4V5R0S5P4q/reQ4KaYUbiGA80hf1Kt7wt7hqAKDXND5alikaR93
 E9fDYZI47VAIDvVUxANg5Y1eTh2fAz8dIHRf8k2st44kQTLs8u0J/rzEDSg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtcnv3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f1d7ac8339so126001041cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399073; x=1767003873;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8PWEb0m8sWdkLPVou1pl3oui9KwXqV++4vSVkw9qLM=;
 b=Z8DCfMxo+uzu2tdF7UFyaB3mEK529voSt8+3dBrVoyrmeLpPO6RMHRnVR2wfdxcWuG
 IIPD6TEdLqWRtCAZJXbHMwNTS1jnUmr2YtUIny3VBwopI1DYaU5p0t/2+qkLz5DwlFxL
 sZC2y/PMKy7JIqTYqNt4uMhpfgiPaOvePq446FiED8vz2jIufekBGqzRwdNWW2pgmwV1
 dahc3PqU6Uw26eg/IK+WADKJnnkFgsh4vDAzWwJKKsZuRX0r943K/ZXvYooS0LW6v7kC
 j4NHBvnBgAsOJNj/hq/EX9+0C+/ApxVgpk97qjuljqJGXbrqvWUnWQ9yiWpYsLxlEbC+
 pTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399073; x=1767003873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c8PWEb0m8sWdkLPVou1pl3oui9KwXqV++4vSVkw9qLM=;
 b=FfwTtEx5wuoPsZj6q3fDRWSqKvKAqey/aElBEZRObu5beHPd9QWQshO3zoIKNVSltR
 uURqECG5wKf1Ye9zV0OWXjYnY4OOMU38IVwH/uokxuEMczDo/hXJZbn/RwNnaIRMr3eF
 taNUBLo6VuZtknKNkA+nPtzA26lE3RE3sC/VOK+OVibJoW7fE6/wGK/UEKJv46XmFvye
 jx0qAQOmiae+RKW2U0AA2DWbI9E6CK5mWGtZ3zFZLo7Q3VTV9XSNwGlGt9FvA++kC7II
 594VS8KGLeHo1hPhB+cTIN7eIiYLEG0OLYFUqCt2dHey06TTpK4Ddi8hlvmqXT/LTRIQ
 gSfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1La0oRIY/rdT2H7/z5R0xAfVoX+T9l8vclE6pbb3YeTTTYQrb3q55srbIJ8RRzdBSqrfDkKKlHO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiTiFXLZhhWyoioye3SfiWJwKEs/LBc6Iov19iX/A6D8hHdoV1
 Mdnrw3ZXgN3rMot/N0778DxL5VNaci62SMLyb+wZbxWgZ0lZLpNCQHsKXqapu0gJPdKPhdimETr
 IRFLr7gtruQxIIhyvApLFCKAV3cAn2+z2ogfNQzg+thPC+57BsRF3xFsM3FH/BdFgJ+HsYJs=
X-Gm-Gg: AY/fxX67t5WKq1PIPFoxL76tCQ12my943L/zuN2NNCKSKLOAzFUvKpeFG46gEe9yaB7
 loUoWUcL3rZdmeINFSdd6+qN7hTq/jXAzyeUMasrVjVceVvxNfValEPbjSSL7k8yEOQeKqQcXUk
 J5nwJ5HbPBu8UV7KoEKN1YA5sWz9srHimwZHz5ICS1ga0tFX/axH6vSRUr2dPHpMvqLaCy8/MLg
 sFpBo3UHw7/WRjkh9nhEriirXPKPnYeUxxITizCNKGfYUg/fFLUj8DjytpUhUsSylUzLusxSxS4
 N7AZ7PMhiGjomY0mzDVulVTnPP2DdJToGfupbPvkVATfyyq9wEVOj8XxUt5u1bwlhWwwDeRkDC2
 0BFsXqEQ2n75kooJwghrolbTIDJA0wFR+5UhOuzZSe5kFd+yIWW9437nA3v6wJJGdmdM=
X-Received: by 2002:ac8:5cca:0:b0:4f1:b948:ccd8 with SMTP id
 d75a77b69052e-4f4abcd2a84mr158209501cf.18.1766399073274; 
 Mon, 22 Dec 2025 02:24:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMKhW9p2zaejQR4//btV0xBbTVxZJY8S5L7LeEZtBFmS63nxS/a27xorqAWzcKScdu69tvIQ==
X-Received: by 2002:ac8:5cca:0:b0:4f1:b948:ccd8 with SMTP id
 d75a77b69052e-4f4abcd2a84mr158209301cf.18.1766399072787; 
 Mon, 22 Dec 2025 02:24:32 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:32 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 02/11] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSI PHY
Date: Mon, 22 Dec 2025 18:23:51 +0800
Message-Id: <20251222102400.1109-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rU2M2LpPyjYQvLdd2GtwIeiYL3fQhj0z
X-Proofpoint-GUID: rU2M2LpPyjYQvLdd2GtwIeiYL3fQhj0z
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=69491c62 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNVMJPnUsVqa3Ada0T4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfXxLQXbb8uUHSN
 IEwV43w5oAFwrSicdBZVwzmcK/Vz+R99CLoy25apQR9+IBVtkGHTA9JWDMNg3c1Vw3PAfyeAHx8
 GSlSCDp+C5NAa+keRaO7LacQitqpS8ylwIJfw1ygh4O7dxIoSZJt0PJFVcNkxD1mwErvzn+244D
 QDmqfahkeXJPAntzXBy+6QV+quxolncLtCChAu+I3atKL7E15QPhBmi4XMLiF+X8tcliuqbghIx
 dA6YQkWiaK2CuJn9j9rSsBGYfwA7/aY5V3XakJuR8Tq+k5AR30Axv8d2GHP+PEbIK6rErSgfual
 WFISM1Huj3Ox7U3Gwal3tJK9v7ogiDxrfv1G5OGGMV+2ych9SD0R7/vNRVhKjTp9t8u8rPZ6BcR
 /0N2koupTHEExOZJ8rJDIPiGdPYjMHD9GeAND4ETYv3h+zjXYZV3SaYTQbLrz1vB6i1U728i5zk
 weOuZQIUryzJnNlJoJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI PHY registers on the Kaanapali platform differ from those
on SM8750. So add DSI PHY for Kaanapali to compatible these changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..a6e044eed3df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,kaanapali-dsi-phy-3nm
       - qcom,sa8775p-dsi-phy-5nm
       - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1

