Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8DCC5A99F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415BC10E97B;
	Thu, 13 Nov 2025 23:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4d0xxhx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YMctusxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EC510E97B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:09 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMavNK1745467
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=a4d0xxhxjAelyvzC
 14qB1RZU5SzKhTR/+8uaIytjkRy615Ki7P82uR95s3soKwi8eYt4+fVbmC68iRZ1
 cbe/m4YgKDZ5Qr+q0IEYv0hqlcQu9CxDIb9C43JVtTCoaRId43Hisw5E0Q/n4KoN
 /EVgjaHKveYm7TrD2OA4QrJ61Gc2nG3OYuth7Zq6XZWaeHFImep4FTP3BYgGQL5k
 ALEDs0hgul8ieiSqAoIJFPE0N3Bm823Na8XfbUWBaZW9MNXm1/6gZLJhjaXo7NCK
 0+72Fh1qLvBCq/a70+gXsIdjmjsYEHHTPQfcd6B0klU/bo/daVsp9Rira1EA52W4
 9VeP+A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9eg477-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b62da7602a0so1117026a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076728; x=1763681528;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
 b=YMctusxiOxQeqfScGHCt/e7hSFxOwaEh45W3PF9RH1IEC44MgI08AXvRZauREARvQF
 mU3H71s0pXCdO7fCSsTTwKN4wKjf0Rw06Sr6eabXTvWMhL7mEkHx0mvetOeGwXhZd9fG
 QTp3enZcgywNngwmhzBuZ2T8jBZP8ycP5PXwNSAYSx6v7Zmp7h9ud16HkAv7CTiSrVkj
 ciNrT+vnbXzihcLgKEvKuRLoT7C4z1/AWwD0VEJtbQ+uNp0TFW0B+87J9mDAS3TZaYEY
 IEAfGLK2uJGXattFkn6+4itduX/5AvVjzMvqA8nSle5gJBwKB1DAkGFQvsgGk4vTjzNr
 aSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076728; x=1763681528;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
 b=FJYaBPENN8GiCph1IQuoECRYa9vgdjfreEyixMZQsR6n2LpHo7z4vQcFAtgno2dsRU
 9ahTgFj89icF2NncvxZ8+7ZyrXZuU206e6nDEiqzXZxrsZpZL1YqbW/B4GBHsPhly31B
 43o7lEQHYVE3cyGLJx7QpPSwSGLa+QevmIhDl9GU1WIlq0VTahlemWc+uquyHL4L9mB+
 FVMDab9jjEXb8+rNbwzxQrAfCAX7ZwZqI40K1UGIc95obAIgWUoDrgNOPl9314DmNGlp
 AZ5cO1dEQ1h/OURmtqibe3AdHdqCsr4H/29ZQd9bT40tev2Km6tAHeTw0iuBiV261e7g
 wJnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFK/sFb0jmv3LqFLpfg8xr7BeHEeD0+zI2mPvsZYfuqeC+pO/cYzQd21HzSTk9D70Mj9RZkurR0xE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYdMdfN4ki+w2cJTGyatv5JOQ3f8FGpgC94aS9NJ4U/9GUlHPu
 NMbyUkC8kW3FibjZdK9sVBYnL3Q0XvcSSFIAuRs1Ljo8U2jjquZtKcV0hy9jJm8uBw22QS3fgSI
 A8bHdGRVneLmx3oTfk7KpI/l29DBaqXls/BRFKTkn7FOGBzOQ6A5fUQC9oAzrb0+C8fxLBpQ=
X-Gm-Gg: ASbGncvXc87L7WC/WTM381Dtx7SUnHP0K+As9eDHCVKJVLqpjRq8cIHzDtXpd/apbXN
 Gfvp6sh7XJqMs89PD5aE15qbyKU25upzFHcv0TmeM6+TtmR50NlG8kS0NHvzJLx/L7IBS1SRIr9
 4/sXTQY3ZgZXykv8csHMumj83OtDsPG2WNq9qYhj9fUo2N6y4wc1KHMv9i/if1//RrjsjdCETrl
 Xl/lFP0ZROglOITHa6NHxtVHeUHCWa0ne2BO1vw9U4VAk0ryL/COyl1kvXewpEHY/byDDGKyI2e
 1C+w6x6/RSdu3RkyUkXUEpN+sDueTDsXDiQqEQSxQ/gbRAf1pe+SEdyCFZoxxiGH+GQr1DiyI6l
 GUaMuWK6X8ldRFdfAtvtWuhI=
X-Received: by 2002:a05:6a20:6a05:b0:344:bf35:2bfa with SMTP id
 adf61e73a8af0-35ba22a50b8mr1324556637.33.1763076728258; 
 Thu, 13 Nov 2025 15:32:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6uREXH/Pc10p/MC0DwkzSPYkXnu24e85a2vO48Pf1B0J1ZDbHns3wpDriZyiRRICYi3KciA==
X-Received: by 2002:a05:6a20:6a05:b0:344:bf35:2bfa with SMTP id
 adf61e73a8af0-35ba22a50b8mr1324510637.33.1763076727731; 
 Thu, 13 Nov 2025 15:32:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:32:07 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:16 +0530
Subject: [PATCH v3 19/20] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-19-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=1792;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
 b=1I/n72yonmFfJu99nuC9pKcCGZtwySI6gaBDPVUw9OgLX+cy2aGKw/hC07Gf38Zy4Sr4ku1tk
 cZ+/e9WMsW/Bium1P82WjaCDgxrkdRPqz4svvg+Jow+9tYBM2ylPeAi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfXzMC3yRKwFlhe
 2F43xG1T/FdhGNbxWskk7qOU07fkeSQUqiSV/2m6NLIqPE0D8Cm3TpJmAv54fFJFW9UyMEOgfDN
 3fbGO+8BF7b4aPc0z/VGcQfJJzhagJV/JJn2s/ku+87HazKouOWBI+EQejtIRU7vCUBPIFXjrVh
 veChsuWy9Ey+0RLZBOQ7wPhXZiKp4c7LnM8yBQ1w7S1ejB8C4eu9fXYIoSk6/KZBA9s0ovy+9M7
 +YEdE7+mjrhpikCxdoyeif1ytbfMVXWyzOHG/iBfVVNlTAUfR8/E6d67Y/HERPMiy2xlR5Wt6ks
 c9NoUH8ysO4igO3PYcarzGo7JYCUHOlp4T9codnA38wLnC6pYRZpY9cax1+EIVFrFidi5IRHcR1
 DVyz5qVQwC/I7T/eISTn5szqo6/3Ag==
X-Proofpoint-ORIG-GUID: deRlYiNtrAXPVN0jY1-l9X2MGISGYQ19
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69166a78 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e8idWDajkKX97RI96f4A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: deRlYiNtrAXPVN0jY1-l9X2MGISGYQ19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185
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

Document Adreno 840 GMU in the dt-binding specification.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index afc187935744..2ef8fd7e9f52 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[6-8][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - items:
           - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
@@ -299,6 +299,34 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-840.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+
   - if:
       properties:
         compatible:

-- 
2.51.0

