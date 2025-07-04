Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF446AF9844
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 18:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C665210E33E;
	Fri,  4 Jul 2025 16:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M769Qswx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C1110E33E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 16:31:58 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564AQN6R009941
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Jul 2025 16:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=pomuj/cQkgzD0OUOqyvuhg
 sunp4U7azsh3q60HaOzhQ=; b=M769QswxAiVvqsD67zoEryy3gtauzpiYXdg/D6
 GFVNMgIOBWklhT+7Tsc4W0lT79Vf6+wjlpus5Ma2GIIXeVbcYK7PAkoER/PM8cKF
 iet+cxu8NC7/ZffkL5RktlueG50XgCyTBkoEdw1Dh/n8J/kQwzfVHth6mx3ctHL9
 v5+kFd7EpueQo8rIS6PKBCVhx6/JQcUnWBWqRHfA4liGedJgm3u0U0z0H7UsQpzp
 bVlyPO2sFEv71q/V3O0yFhnvMP069vZRf7ZF6bVdBPIxJ9AgsvJYd19iO0zdhRWU
 hSk4FO71voCs4rjLfUAFloMGGDEDgy0z4dwhmOztr/2XIK6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pd6w0xb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 16:31:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d44ff55c98so198638385a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751646717; x=1752251517;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pomuj/cQkgzD0OUOqyvuhgsunp4U7azsh3q60HaOzhQ=;
 b=AzRrv0aE5UpqSM+AUChhOIvF8vIvlpuR6g3bbz5V6eQKCHaRypDaXrOPlikIm6Bb45
 2vBVNjYrw1FwXAri6k0d8mngptcogQxpEAg1AfNoufZ95sAH/IwD020MdnwRFqeUSA5m
 6WUMpKiRibGkVoF6j1tIqdJbA2TjnrurqbE9WqaSNylheboX3yxEE6VIOFzK1x2qSy6q
 k8en6tBP2tmVdn+sPDhS0UdJKoFz3Xlp8H4taWEm0LaQoSpRALf9vyEgBT8JqYGyE1U6
 +6orS/HfPOFZ1tfQgzKnAbC61p3udctneHYHrUlyUiH9k2ihH0OtYtsh85gD9pCZm9Wp
 aWZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRu/2o0QMb+T4b2FDcxJ4Di0wZzT9jkaLOk6kNssrjG5xJ4raLWoKseMZjYWN2UQwa4yqh1FHzBNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1R9fDr11J5Bc3TQXpEHPYKK7u09zTsiAv5NOK+/1ZqVqUfiTf
 YKJCn5ynoQoUEghif4ll4d7SGIGShDPvOZPKdQJ0qb3qH6CEF245wJ91EeT2DyzR9I5qR7fRXyd
 +vvJcNlxSsqs4tpuxi70A4ZBX+YL8VomLsB1s3LMipnQryRgKYRM6lv/z1GLB9isLxgcrVIY=
X-Gm-Gg: ASbGnctj2YrJE+ijZUBxAPgRCWS2h1pzyVgfLRnDIjF8iBV1gPY5JeD60ZGV32iKvIV
 VIZWXrLIKvYGwYEae863PmhZLEjWMpKfIgnC5jAfC4GWAekEkmOXATFCazyK6aAMGB8ZvPFcqO1
 gFlKuEAu371h2KUG5xOFFKj52eKRDHk8ouNODWRYT52S1iA+N6JXULkeezMIt8mFj7TNu1KtJUh
 0sR0hH3vAAY/2hZBqm5vWs2v0+8JZz0fHvTnNY6Dd0bu5CUe6Nmhv0h7jRxUYWVVSKWDJgxb+7u
 mhHPO9dYYQWJOFs7FB1dRvmb5wTvM3rnoY2s5JlhBl+eWvUnzJ+I8WDEo1t8bZgc1BTpGyed1gB
 QRhmpMGSV6vCkYBRExUi4M0jhVeh1ZR3uQUU=
X-Received: by 2002:a05:620a:450a:b0:7d5:c45f:c3c8 with SMTP id
 af79cd13be357-7d5df0ccffcmr336000485a.12.1751646716984; 
 Fri, 04 Jul 2025 09:31:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU1hI88kRN5deziiAv/Vi3VKoh+SdcIIBtiyE5bqnofAdqmJ/2dvCk8nIcVO9jscTO9QwtdQ==
X-Received: by 2002:a05:620a:450a:b0:7d5:c45f:c3c8 with SMTP id
 af79cd13be357-7d5df0ccffcmr335996185a.12.1751646716499; 
 Fri, 04 Jul 2025 09:31:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:31:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] dt-bindings: display/msm: describe MDSS unit on
 SC8180X platform
Date: Fri, 04 Jul 2025 19:31:52 +0300
Message-Id: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgBaGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMT3dyU4mLd4uSM1NxE3SRTs0SzNGNzs6Q0SyWgjoKi1LTMCrBp0bG
 1tQDrvXPlXQAAAA==
X-Change-ID: 20250704-mdss-schema-b56a6f376bf9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=P/5XWsuuqMDqR+GLmerL71P40xuUdfPA8CFQpOrn3/A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0YG468fhkcSp03tV5iquzegXb7G/dPKhp+x9lUOsxWVZ
 zoxeoh1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiTpwcDCtqF3t9UcuNlPtZ
 3n9IbsmC/UcunFH58WVvukDWLTN/068LsxQta556ZTU7/P7w6+Vm5R+iNzxTXcrWT7Tp3RPReZk
 jkaW4ht+rNZBjbsCC9RpMO5IXlsbsW+91fpJHZcOv5MqU7tpUk0XOwWtb1ud7f95tqrnbsGlS3l
 zuv+sjpYVZCzT3HjBRPtv/uGBWd2JIoMS6Qn/bF91aSn3PmN6zPWNlb82VPz7BPoUz1erAgxUG9
 2LUM28IyvruYveRvG7fcqyp6v0s5irTpbMdbXLt2RccSkleKfEg6WZXvo+8++9ATYe1b7ibd0Yn
 L1AP/6Y++d3kOctWLG+PWcjRzD+1NrKi5Gvpk217Df8DAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX/pV+IhgRm2Rl
 bHeaGlDLIp+rcRispcDCi3C+re/2LrDUVLHWfAiKqhmOjfZwauK5ucOqPiGXLE8qZzSGLSnZNxQ
 CgzsSV7Zc/RNdA3vqXTbsAsLln9EIaGpa+1GHYpDjujO6jPLksZ8726/u2ERQhrKt0RazC+ZM4f
 E35Mv5y2GNQESp47R9uXVVzCQbt33I1k79jAP2UxEL2rFwmOZXMzEsPUtw8ll31UZSnQZScEl+i
 ttuzz+mGwzQ8MONzRWBKpmqM5zEQv2bW85HKdP9RKIgL3FkQgc4FzXAkvBhDbw1mT/gjIPdeWL3
 0nfxULkqzCMWOVwaigeXjoJ0xaeH9GZavvqtczXZuaw8ZEXo5AopdypRvjQUDuAGAfuDQCHkoUc
 Iht8Pvz8SgTaFelorULdDZgtMhOh6eG3Vb3xaXylN4JYaYYLAVcSDUC5MmAFZpLsoSYn62ZM
X-Proofpoint-GUID: X2vZC5aV01kZgEJCtumKfpJRGIwsVc1e
X-Authority-Analysis: v=2.4 cv=UPrdHDfy c=1 sm=1 tr=0 ts=686801fe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=MtNW3POlok7mfpsrGdgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: X2vZC5aV01kZgEJCtumKfpJRGIwsVc1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=948 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040125
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

SC8180X is one of the last platforms which do not have DT schema for the
display devices. Add DT schema for Mobile Display SubSystem (MDSS) and
Display Processing Unit (DPU) and add SC8180X-compatible to the DSI
controller schema.

While we are at it, also update DT file for SC8180X to follow best
current practices for MDSS devicex description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      dt-bindings: display/msm: dsi-controller-main: add SC8180X
      dt-bindings: display/msm: describe DPU on SC8180X
      dt-bindings: display/msm: describe MDSS on SC8180X
      arm64: dts: qcom: sc8180x: modernize MDSS device definition

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     | 103 ++++++
 .../bindings/display/msm/qcom,sc8180x-mdss.yaml    | 359 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  14 +-
 4 files changed, 472 insertions(+), 6 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250704-mdss-schema-b56a6f376bf9

Best regards,
-- 
With best wishes
Dmitry

