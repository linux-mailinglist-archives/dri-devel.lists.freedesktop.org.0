Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A73ECBCFAA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DA910E3A1;
	Mon, 15 Dec 2025 08:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e39neXgb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/7a0BPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D1210E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BF0P8Ds3003528
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=OqlJLDbVw4T
 n78JJhjxStsJzAZqGZdEBuegjg/h0GSI=; b=e39neXgbZS2rDcxHUr4/HLOsedp
 sIzFQ/+TleNw6ZWsGQjK0ZVvJhE+3G3cDIUQx2U+5Onx1lWTp7eSpzjLHa+pRyW6
 Qv7jlWcmV3unqe5f7NS/+GJG4tsTHLfBmm6cOAMnNLRtdBoGlhiKhe3pi2uiL+f6
 sB7G6q50FVntmVe0x7K1fZbHH+hA07q2eNtPEhthhkoC3dZUc3Ervh0NXMVoCmi6
 TEBgpuHhzjU0C00i7wI1PgfRGzGm8+K5FcsMdoZJ1/iNRujpRJb1mMXD5UhITFNR
 9VoAvune1NlQKT9UZ/xXt1fMJRNYAO3IE+99Pii274o9q8m6xmy2W8CZDDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119t3sum-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b286006ffaso861896885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788012; x=1766392812;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
 b=e/7a0BPbr44xUKVYXndgxAokdl6KC9Nn9uJ4apYon8b4NHDEoOzyuovGFq9N+N70t5
 BoQIX+9PofvATsQHaS5fanUaS/37QGW6cDVOAzdd81emc8BDKRstGQ7A04rptTDFkLPc
 ElE5/Bf8uMSGHYJJTiG+KCzBeuzPq3rx6PlP8mMBLV37OYyoEPozX389Zm41lKK4AUDA
 SzFWCkqOclPo7c2kPBywZtkMV072MOddKOaomwWVkO1Vt3F4UGppTUcD0br4p9aAXmX0
 Z4AyXozpErC48ZxD0ThxHy+bpWyPMcZiV10VkcrrGNTEZAW7xeRWeQCbzZ2bw0aAB7wj
 X9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788012; x=1766392812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
 b=PEe9gQ7pxIV50FGakRltKuqn7BETsoNX7d7AdunVTgyciHJJ0Brh2lL3XsxoUGBinx
 cAPPpPAWpaFPcDMXa1T1evqlgHG9BRuSw+8Cjy9O+GOQ8p76pqqUn2NGfJBa5j2NgwiW
 vPlrK0hmjVgg/nutqsbj1HQkdO1EIEpW18QtUqLUmad97I+a0g8TqpKjxmOCTTUfBY52
 Y/vfXUzH97ofV+e48AVRj/5K3mwdrbz49rNA0sjNFh6QmL+vR2XlazZyp4t45njjBBmg
 r8mPXD6sAWk7EKg3TNPUQYDJ/ddOr1XRUE1B1JrCAdllBYgvU2AqIdk2n/0liBNq1oxZ
 ORCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3woBQicdIVFeHiYirKqYHDeUypvjH1T04vN2ZvQtSfJY6pXX2TVD8mFi00s00JIY/2bDTrDimsrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi4qjljuWhIzpvZDLf4FA24etZQwiJQFPXPFuW0ZYm/0CbGG9F
 E7P3LOHV2P5jFc9gW/CGQHNGH2oYo1SqUQxY1ZAJ7XzuiyxHUPF53b4IXrpUTo8CXxNDnYhIh7Q
 wJJ422EBunAVBp3B/Xrhk6lARg3+PDyWK+Kng/8on6+8las2fD00vOwBxjKaqjdrGEPkvixg=
X-Gm-Gg: AY/fxX412DZa5kKfWz8vJ/SYPxwEaDgOC2YqLL5fU2bAX+No/dBMBH/3xt+E5Fxzyou
 CLHhSeysd0fYjpm9mKaHWoC5xxG8t5yE3Wzf0jvJhzRUyQJlW56LcSYNJn6/8K2GL09vkTL0X/3
 nE9dfWWR3SYZMNq6YJsRtwWrrB6/Hfr6uhFrCM6cL3Bfs3W9zIqtmycvlRmPHx+LkPFxxV0FmTh
 I2NQ7qUHEpmp3xk9mGzUqNX/lKEBqdNJ6FM/T9kXe6k6xdL1jpCCkNztmI22xf8G0NeK0DEfdBg
 wjBpoGaObrH6cCT+hu6afo/rovKSo+jAx5+1qJBXMS8nwzIBF+zSpvNj1XiTz96eYdN0SY3z6tr
 V0+fRPw3Z7DEVJSLcAccVi4Lr1QRw3Mysn+KajYfjz++4mEjOv2EGF4hlSw4P+gw/7to=
X-Received: by 2002:ac8:6a0c:0:b0:4f1:df6f:6399 with SMTP id
 d75a77b69052e-4f1df6f6fa6mr64921281cf.14.1765788011997; 
 Mon, 15 Dec 2025 00:40:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjq6cUNKx8n0oIPZ+dTibjwjdoBvKbVns0jWdiwucSy+EN2FmAkVrey2CIl/19EhkHEWqZXA==
X-Received: by 2002:ac8:6a0c:0:b0:4f1:df6f:6399 with SMTP id
 d75a77b69052e-4f1df6f6fa6mr64921031cf.14.1765788011576; 
 Mon, 15 Dec 2025 00:40:11 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:11 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 03/11] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Mon, 15 Dec 2025 16:38:46 +0800
Message-Id: <20251215083854.577-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX/e31OEIC4W/F
 w4ywYsAXNriK9YavMZYVRO2913D6luDMOUCNG8rSQifoOx0KPjGjDcHA2rt+PvFdEBFwKfugraN
 CyVuwRUlqyOskGaPy9zvVhXo0nHdO4hkB3pqwgyJbEXqnel+2QjVevIe0GMdzIFygnNpD6KGwW2
 d/+kEjEQ1wlRjywJM3k8HIhBu7y52hGB9G48I3DuVIkLanXGyYGefyTHkCBNH+Hne1YRirx+pJl
 Fn2OpTCff1DkTlDuc7xE+Pgo4QwlSU0LGi0rLhw0dctbmyb2IAGaYiYStebfPo0EN9N9un1hIZ3
 A4I9eWudq21zOB1OxX9y8QbcBS9Oj4/zTdK+WmH19sm6qF1b4bxr+IaayWfVc4gwVpw5+7q2Um0
 IdvVTn22AcUStnJ1fiB/vDrN4Jm6WA==
X-Proofpoint-GUID: NV-reJbgTazAYZVeRAasXdys3rFuZWSZ
X-Authority-Analysis: v=2.4 cv=E6nAZKdl c=1 sm=1 tr=0 ts=693fc96d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NV-reJbgTazAYZVeRAasXdys3rFuZWSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150071
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

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1

