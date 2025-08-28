Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6587B3ADB9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 00:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B413310E1D9;
	Thu, 28 Aug 2025 22:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="le3Qqzw6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DCD10EAFA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWsXg025262
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=; b=le3Qqzw6Iyxa5OJ7
 5zzXr+FUuD+2gpmpPmYeU57Jyx/emIulnMXElkDcFILTX48wtzjEEAVggMoacYui
 4ZczuQ1A7uNRL/V3ztS5p4Z83BsIXznjHB3PXBqyDuyeR0VW468bvJffl7Bkqy1a
 sYJiG3HvdV/RjoxAHUKcSvXuIMLWje8cQFTtDZlWAS9t8X2rhKTj2k7HgTbMKUDX
 QFuGGdG9JSkNE+Mu8Of+tbkydk+L/lSQj3MJz4+4rrBrovw9kki14zdKKQZdpuxz
 eapPCCua+GAuUhX2bZ5fhLfmnmQ7DS0ISZb2zyQJhg2n4Mu463j4ZaQRzShN0Qim
 wHhSUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615sy9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109bc5ecaso34671431cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421309; x=1757026109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=;
 b=pId4YIXZdAXawmI5fVGUi6Xgd+WlifTqYP2ae3UV+a4fA5evVb4SQTkpAk9E9c3YLA
 IAdYoxy7WEQVGPJh5d3T9H0sAV96Lpo+ZNVB8p7p65vq2+cnPGkqMCmS8BVofGJ4EzPd
 L1BMqDEG5Fmko068YEUvZWEFOg3MGkI/Tu9ZOx0vBEXAYobacdCLMKkXYc/mTKDVU3aY
 jznSXabLQ8ld7IiITLt8+ov2hHuDgVnEZYg0c+ldDnaBKuKGr8tSv/TpqOquA6HgQINb
 awqI6Ts2HUgi87IiP/PhtMQN7YuKU8QLM2MEvYGCYIEUIQ1aTEZj79TDt2bjXicFAP0i
 B0Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn+yGlQEl7zduM8Q5TbxyOjYFd37anEj3IUfJKmeQ51L5pXP3zkRIfvNkeHPFY0WpmXLzPiNK52jA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7d6peXkXR1E0GiaJj+x5e9zLW/iCEYtiqBWo/PdwIGwYDLXtJ
 O5Nllhb2+NyKMiDnGHUMxQWgR0/I8eLMmq1Sm5lF2HHUEGslUTnkYUjsS8glTHHdzmiVVXpfVWP
 jhZ6rpR7D8QAibuUNLnJiC7BfZiB4u/djXl0izkh/WH+tXALI7qj2EjvzNS05OgedQm1zeXA=
X-Gm-Gg: ASbGnctvnUsjkBmYfgyNM2D2PjGvuDQpFRrI52ELpbdGHJzRy/sDcu7ua598Tv6mJkl
 IkExE7tJ+QUllBnYuZiPY46YJ3nSrlU0jf+kNdnNh9D0ud8OOnQMPeHZswM+sBHY7H/fqDU1cEN
 EPEHFPTOSkJOFlfC1FxiXX5E/RRhGM9x80EInrfa488kv8oMufUxmOUhxrxHAgI8s6I3i0GEOJi
 LICy7gdlcFbXJEY0Syp221pqq1LPMlb2A0BCchyhV8WObSIq2VoVgH8/YJ/v/J4h//x+X2t7SKF
 XxMLKxP6JCZCGLzlZB/HoxPMlqeGJsjGmwg61q0RR3UsrurHUXR2N3k86goSexp7XMkrLCyQFlE
 ZLWyHF5EzE0Heprfw/Im9gnyTAm32Rfzl6a15tRXW9JueP7hJlxEv
X-Received: by 2002:ac8:5d0b:0:b0:4b3:c70:6b91 with SMTP id
 d75a77b69052e-4b30c707d9emr9878671cf.1.1756421309425; 
 Thu, 28 Aug 2025 15:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVn7LUU1wLuo48uIzVLIpSmBydS8V9QqNajZ72cj6g6Z/G/PcNUWq2BIQBuVAWtOfCSAhapQ==
X-Received: by 2002:ac8:5d0b:0:b0:4b3:c70:6b91 with SMTP id
 d75a77b69052e-4b30c707d9emr9878291cf.1.1756421308958; 
 Thu, 28 Aug 2025 15:48:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:18 +0300
Subject: [PATCH v7 5/9] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-5-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UnKbj8oV/I2z2dmxNHPVYZHaNtQSEhlpqnpLKeNGplU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8aGOxsmRflPs+cW9GrS5XbfvoS5da7xw0KR6e0h/jsST
 njGJ8ztZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBFotj/V7yVaur4HN4oPv34
 9P1rrt9L/15X6CkQc35Oetpqvmeln7kYAsz4D187wRr+17/Z+93eLy4np+y4/v3wfPMDZTdivaa
 wHrT2VjJ63Lp5guKUI1UPiq9n96eHfH8snVm065n+Xp5NC5oyzs88qpPLx1EVVxHNX63Dsfjbau
 Gl6rMv5Ya17zhSqSp7/LF1hxwzC+ORoHa5u1vOnY91dnfQfCCyyiPv4P6oJS3Pkxy5X6z+Lv3XL
 /FMea9mXX6N/ZnQ9TqqU/a96JE6pPH617s/1dEGk1f/XHlwgQtzerdRooKGjYzyrKrHp/tP+CTG
 3V7dbHDa0VXmsPrSFu+fz2L2uZ3Yv3hWUQv/stZmN85vAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX6TwExniIFqFJ
 GQOp+wgqvdnk13Sr0WXGZfmJHmPRVUamBCtcc2UyI2SaGIZBYBlqqo70WPYpQWBebfcTNK3DYZn
 F7oD5X2a7T5RvbC7oylBoPOYI/FhnTy11vBKaKWdvy6nyeABiu2olQHGn5SFVSnrY/iGlV/A2tH
 mmkswLfUqvGhoFUN31L9N8+ekZSbtXzgLQx8bN26SZ1KtulJ1fmZlRZFGfFyvyWfB3qpkYnvG6m
 jKKftPfJBASvWqbY5d7l/1rJ11ws7BmqbE1ZTWzXfkL0uCxbngigrsUXhugk4FOU9Bhu/snYKmr
 +Fd0W6uFt823kWodG7v4/+V0HXMg2Eyt5f1+FAavlKuEN9s2ga9MYgQ+xgq8qxlrwE5vVf7CxsC
 IuMXor5L
X-Proofpoint-GUID: L2sKLUfZ9k22eaFC6H7ygH-iFCf5CvQf
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b0dcbe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LXTjkAqqvG_e-hvHT3MA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: L2sKLUfZ9k22eaFC6H7ygH-iFCf5CvQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a18183f7ec21ac0d09fecb86e8e77e3e4fffec12..6316c929fd66588b83d3abaf01d83a6b49b35e80 100644
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
               - qcom,sm6350-dp
@@ -193,6 +195,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.47.2

