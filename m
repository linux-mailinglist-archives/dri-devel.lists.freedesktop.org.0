Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF32AEC453
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 05:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BCD10E11C;
	Sat, 28 Jun 2025 03:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlOI21Vg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CE810E11C
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DOZH011145
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WyIF8ET/8reT+adwEBoFNJ3JczrXUqQ34OWiVHWVjBk=; b=YlOI21VgADrGsTFa
 UQceUSCXb09Z5rHxdw057aZg7rpgbAclrkCBzuv0NMhNpAoXi1Jhfs46USFLgKfa
 YuYoCNxuzD/QsWdjp0Er6euYGErF3aXjImPBX6QErHRpIM4qdAgLylXH8Wv4YO79
 Z4NfJEG9PInTTrNXUIrA32KcK09JwLzMa40Vn8y9jVXB6abl81H11jf8+jfFjVBz
 Zl2oIIZYlUCoBxnZTgW+TSz0q6AYtKNabqGa7+0yXedm4RPc2gTvZ2WTFkz0HFlD
 4vnQMpe6ub/6z3gnHG/G2srTyDQW289zuwsXsTk9rDkjQiMh6Ql3B4Kuu+Yp/nLT
 zZ9Fzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j58tg77g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d3d3f64739so112456985a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 20:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751079763; x=1751684563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WyIF8ET/8reT+adwEBoFNJ3JczrXUqQ34OWiVHWVjBk=;
 b=ixljvWfhChnKXQdYnOhxoJEWxaXFyJvSiP5ituRP5jxKQF7WqE4/j20kwwF7LIzaBh
 TyTkRyL5Xf2p+Y4fEelvz6rj/N9mb2BEcnhXsUCpAcmVaCTDWPqGfIATu+Drw6rrwBHi
 i5xnsQeoZMlnM3HE+cIAJOT968DFkUDskwB/Eh6Tw8JNyQ5ZtkojHFeBSGmalKQoc3jh
 2sQPAHzk8TkwPwt6BPBV3DHVTrTnnCDNi8SB5zVi1V/7BpjBchBokNml7ZSmPa0yQxde
 ZX6VHNm/SY8G08znn6vFmr3x2I3RV/ZKDOCMV9IQieoVGQHOXqoUnWtzsPek0IHPJJGM
 +eMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOyP/nb+ezm0JFcFS1nM5tzf3scftRakYJUiNJ5m6th/jTu6xe21R36zeH83HvTTNjNhqGkA6nxYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJHEInsKtXnFOavByg3nOa+grCY42SNasrz/+C+vWjAQlpd5VP
 RN+69y3sCN0CC+8qKujTgR7dsoTgFOBgTSUYJeSHtqWCDxtoRO/PhXM70GkWpZAkikQ1pFCbzea
 XU5G06tcXrQIKs+JtLprLUXpZGIwoN6eMcsj3CeU3oeCgDd1tW5UQt27cFFz4/igF1kz4tkU=
X-Gm-Gg: ASbGnctZIWEWXOMoZKgI+X3djO5zLlPFDubyhHlSMLeILFNm7oDohwnP7LaWGgLCYhy
 D5r4gXLFIqEMzDWck+kjMaaIuAJPYK0ZHJO0770pBEskh+HZ9JMl1tG5kGef2jyWla9q+cRcPKu
 DFWYqaG4A4IreE2B3lhGAKcwPD7SlwLwEYzy2lBBp887xbk4GiTR53s5lHutMbECjvNedxy27QR
 tZ6cYG/GbO2u5eIulULl0OHbIwRth4sZJFRbRvL/cWjtwYMINXHRtsccNuyIWwyV/PrAPtDZuzp
 YyYWTvNuu+PsE1s21k9/37/SbsefdMIUO5ySk5qhEjlZUUaoiio4YW7qQdPE/KQk8H8Vs/5g54d
 c2nOSzvDZTD+SnDzmXm+pwu1W7eB8E7MGOM4=
X-Received: by 2002:a05:620a:27c6:b0:7d4:3a17:bafd with SMTP id
 af79cd13be357-7d4439016admr843511485a.6.1751079763182; 
 Fri, 27 Jun 2025 20:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1qompkvIDrvMFsstdR6uF3g3AklhHt6dKY3yvNkV1TMIXIkwbGM2mjIkNgstKjIzZU8UGnQ==
X-Received: by 2002:a05:620a:27c6:b0:7d4:3a17:bafd with SMTP id
 af79cd13be357-7d4439016admr843508285a.6.1751079762704; 
 Fri, 27 Jun 2025 20:02:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 20:02:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 06:02:36 +0300
Subject: [PATCH 2/3] dt-bindings: display/msm/gpu: describe alwayson clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rework-msm-gpu-schema-v1-2-89f818c51b6a@oss.qualcomm.com>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=942;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BZ/L0vXDMrjRpmDOemaXJyxUSi1dw0SrlQJrslusto0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoX1tMwu76TUVuS3VM0TJPzwdp55YvaGMGur1Jc
 BNDlSOT86+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaF9bTAAKCRCLPIo+Aiko
 1RXkB/sE4FvobjpToVj9wMIBigfVTv34gUAtGw/ot9XYLMvZp1DZYU0PyP+dOJrfdXA2gvEnwCF
 UsqS3CHNrJ1rY4Ejl0oYihYMHWWU4BmL01lbt0HtM7Jb319esifd2QV0LHKpH4RUcgPnagxdcUJ
 qQb4DoqHxgDj8rQF5BsRKjflH6lwLFrtfeBzZ5rn2YKCjO4qR3oC547sOcDii9623oU/ZLqTUcD
 pjDYFw9jqhUG0CB/f/f5bEmgPc1+wbZMVqQ16yB+9o42OKGYFtFOpj9QzVv/3r0zKK9KiRgALfA
 CZCsttBn4GEOoGKTYOiQI9L5CeTOYcqfMJLQZ7WvggixMg44
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfX6P7sgMhxBpN3
 Xoa2DueTfXesxiQUyaUd6AkCk/ybFA/atg8/m8PCyU42xOGdY7psaUDVd3ptCk1gf4ZQWj9GlvE
 /78Zo+KBopb2amY1HHzALN9i+V8Y2F2w2Vn+82NX/83bxBRdpeywL0i9MPWDiKs/9AnDbNayz/I
 OIrCRzdyGL8RTuJzgfqDROZYiS1nLGNtG+0REpHy52xixKKTbhLcBH+OBXEEZCwhquAbe3/UD7/
 nWmDfliONFhlqkgpiyNBaOhEvPMYs+CqoUajGeZzvJud7G3ORT08K+uCIP0/e5IzuaHQqgrccg9
 SXaYIKthK+uEQib0djn/EzwjrhLGghwJ/Tl8lIwhHH0bLdy5c3NIofYnPZfsXTR9ir6Fk/LYXn2
 5nV1BVjTT/BWykOXRng/SCPMPu0AOQUNevTEY4gKtX1oK2Ns1aTK2YxjB8IUJMIZYUgwLQJX
X-Authority-Analysis: v=2.4 cv=UZFRSLSN c=1 sm=1 tr=0 ts=685f5b54 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LRArfFjgsGaU937PEt0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5Hf-NKOIenmkI_0x-oQb48s_yAbqbaca
X-Proofpoint-ORIG-GUID: 5Hf-NKOIenmkI_0x-oQb48s_yAbqbaca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 mlxlogscore=985 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280023
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

Adreno A506 and A510 have one extra clock, alwayson. Describe it in the
schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 97254f90926030c4a4f72ae5e963af1845f0dbbd..af43527188cefda0c127c4674d4667203972f583 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -173,6 +173,8 @@ allOf:
                 description: GPU RBBM Timer for Adreno 5xx series
               - const: rbcpr
                 description: GPU RB Core Power Reduction clock
+              - const: alwayson
+                description: GPU AON clock
           minItems: 2
           maxItems: 7
 

-- 
2.39.5

