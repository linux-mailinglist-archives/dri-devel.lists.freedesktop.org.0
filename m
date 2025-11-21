Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E0C7BCAE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 22:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DFB10E90C;
	Fri, 21 Nov 2025 21:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtEXn48e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exRT8HxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4B710E906
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALLaldG3007621
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eHm3kk07mQliVfpIm3cqixLyvcUkH/jOdCUCt4y8WY4=; b=CtEXn48ePCf5yDy/
 P3o/ndwrhtcxNieTYJX/jTj7PIwyBznfTAnLl/s5h5/pX/G6Z4TQR4LYh7cVclVA
 //LIfs8APW0+9FlfjF/Vxu7jGQ0lX3C8DQBEZ9E/9h0nRf+oQgJZZ8mnk8fK11z6
 IZV94zMqEol9Z7RUzdtaHuxjhYtuhM10T280KFHBPPUM/loBtqyI3H/+w+niTwFk
 mNXfcvpcj6/JiT0vlhpg3t6QlmjgRvJdkPhRWd7eV+OYivGJ4BdCTzJQqx1Eovn3
 YxCBlpT47auXAvk5zxICEmCspDaJPMnhLuba3zoOmD4eIY7sr8TpWB0DDARZ9KTd
 cY7miA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkf305b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7b8973c4608so7636839b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763761979; x=1764366779;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eHm3kk07mQliVfpIm3cqixLyvcUkH/jOdCUCt4y8WY4=;
 b=exRT8HxOlR3ysOGbveaXdxds6YFcubUgtm1z5f6+RHfzhWo7xvXPjrw2dUcue6FmV7
 nFRF7t/lXAyLzpbBmeG1bn37vggtMvxnKHhuYZlQCEdYQfCFEnkvPzGYAu8rOl42DXz7
 rXshs6jnr+MFpC240iDec+noSZ4jUV1yBtLlKeOwvIOIkEgmbwF2Zq588yEtTYavBz6x
 zo2izjCUoVbGxz4iJSzUqq5cq8JndHPw0ylI/RsxhzwwoJA52g9mSLdEf7sVt/zynbMN
 i2OJTbknlsVC8Ki9zxo7/N6MWH4hZM6YTIPQ9wKRf6i0PBOrge7kZIHvq/jphAutGXaZ
 oXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763761979; x=1764366779;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eHm3kk07mQliVfpIm3cqixLyvcUkH/jOdCUCt4y8WY4=;
 b=iXkZhvTaaZc4HWLx0xXdaeB+rbd8rM/FdRhogSdsG39TYLJ67qd1TOGDjbKEJb9LXs
 yb8SClvuZN5RRpp+YE7ggFAvhZJG5JM23qFx4fmFhEoR8A1xoTZBAuUIkMsTDmh/fX4b
 deQPgM2APMRUkBKPpjn8ZWh7SZCbeKJQVHIo/k7KIlSfmg63K2qzpwRWQSgG7s3/TEAb
 WBMB8HAWJYFI3VXa0DN74jLNPR9Oq2cT2fiRBAYVHSYB5v6OQCM8kAdefGH7Y+cCIC1a
 4Rs3KJnQB7b2rRnouPyIbTSJATJZSZKQJFDe8HFK6hNSPRtLke193ifMfdggFxQpTWA8
 tkeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfuCZIuwJ8RxiPLLzhNEic+DW82pSJoINodL85YH55soIrVYi502tKPv6Lh140kCt4XO28j52Q9To=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0jcfNg0xVmvyL1gUleR+FslXxyLsVxUB+DW1WaPUBItvSDzTG
 ifwG8k32hgNUJqRRPrBk5kwrETM+1qYPk16viXChFn2dnjTUaIUTtR1EeA1WzOs1ARQc71XgalG
 ggDm6KiHID4TTj9gk/eRpwuc4+s4Rm6QkYkBB1iBSD88JZ3tlxbAGZToD9UK1szaSS07uVPQ=
X-Gm-Gg: ASbGncun3QWZds9LC7xACqKJDBWLnjIAUyPo1idhDp458Dkczb7T56QCiKMLvLNj+T6
 x45R6Fl7JACAsAKCmHgwawKKGAZdwku2kvAqbr+RVUVRenvXxVa8RCjEveEtxk5CWOUWWMPIzza
 mVHL6Q7I6gKagk5T2luNkaj9n5F4A4s266owwR26aLo7RidmAf9/7MIja8HsfCsUrB+GzoC9Ji1
 9kwF6RhXXQAJWemiD8C9hlo9P4gCR6X/E6RMplJGuTX+1BrgSsz+/9ZYaavpE3u2PikFsENTSL1
 9KcKNakNRM/eFOslk61w/G8pvPpjRmlzI8Qfq98jfy6ydKRReXA0SjLwSb8YWlLm1yZ3um4ZFhm
 IdefCkW/s5+e67vNxeDiMGnYzWwLL2uzQhg==
X-Received: by 2002:a05:6a20:7d8b:b0:350:8f99:367c with SMTP id
 adf61e73a8af0-3614eebf876mr4722261637.58.1763761979516; 
 Fri, 21 Nov 2025 13:52:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8jeDuhQFyiMqvC0H8Q08Za+IBBC9Dhc90IchE6uKCrIM3WpHjYr+u8Wjxw+d/uJRqVX64sw==
X-Received: by 2002:a05:6a20:7d8b:b0:350:8f99:367c with SMTP id
 adf61e73a8af0-3614eebf876mr4722231637.58.1763761979066; 
 Fri, 21 Nov 2025 13:52:59 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 13:52:58 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:16 +0530
Subject: [PATCH v3 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=1534;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=HWUSFPLd+PGGjr3A9g6HLs2YozW158g10FiAjpYnGlw=;
 b=VYFhYFX+1vcXr2I+8pLlc9KYkUI9kmTS43CoYAD2uEHzweChP3sk4OsIeeCNc47IwSAZeO4gj
 sxesiewzCW2C7D7FDbSa7+XR3jXWXhwZCKSjCwHs4Iuca2yB2qYs1v3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: SosNzX-4PuOaTKx2VNg5sxvaWSC9sIYo
X-Authority-Analysis: v=2.4 cv=ApPjHe9P c=1 sm=1 tr=0 ts=6920df3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: SosNzX-4PuOaTKx2VNg5sxvaWSC9sIYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfX/06Dl9sc+fze
 p0lwt0PwiEW82//iUp9J9fQ1S6KbwW3q8XdA2pOUnGkkePTeTY29MxgROJ01STBgi0D4/bY4uHq
 ixC1LU2puraLhi7gLTUCxBFGEKdImPqUoXFBCiqYrmqudts+Nz5KiT8/52sI9H7KZ5lYj6MIjLc
 f78pOiM+s7tP1qBC21ZMzI9WbUdyApb21SkspEoD36z2LqfF5a7M7WamZN6uhheQ8OvIXjjimwc
 9of6VhJn5fKDeOTmigW6OzoY4IP6G326K2mYqClMwZnLTIHmKEEXAa84AOMew4fVkTxD+eYTza7
 RbNWssFSl3eW7vdjLrWVnp0KtOzuMpvgOGndMsIcvbckspXGYVoCoLM9iN5B0g3Qo5XZ/4uKXXc
 IdK3S0n3RhiV4hClHjguwGy7vZtKfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210167
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

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 24 ++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..19507bfb6004 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -45,11 +45,11 @@ properties:
           - const: amd,imageon
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   reg:
@@ -387,6 +387,26 @@ allOf:
       required:
         - clocks
         - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+      required:
+        - clocks
+        - clock-names
+
     else:
       if:
         properties:

-- 
2.51.0

