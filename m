Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFD1C7AC51
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA3210E8D9;
	Fri, 21 Nov 2025 16:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRuZPeDW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH0VZ2LF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D4410E8D9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:00 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AL8rVpq3675800
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=afYW2INdmx0JO0YDXbe8P+
 qVkx8T/BiOKX7PKMV+FlU=; b=lRuZPeDWUJ9a2vTkf/f5nypgjyEQdVYyNBWC17
 4JHmrePO/cwm8OeL1/JEKUPEpC2xZhlGxQInj7NF9MxYIsomR5r46wDJqrgqZbC1
 ZiM6wQLik/7KBJW/RKkj50eOqDuKQEAlfJBHAZly5Qxjw/tqoifLK8GnG1QwJ7w3
 LJSuuffYC2zCagdZktIlNhqSYk/fwiuhZj3w4G2urElK8fcx+jo85u/i8uu1komo
 yr1d60ToyaM5q+q0QIKVBPSkehWYq1C+hN3not/br2a3cZrVgW5dLl/IYXZVE+kS
 /uSedRuXXtMw3hMQ08iy+Fbs+B0VqHmEqfCFpxA0+eNVOM3A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyj9e73-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:00 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-55b0cfe81afso4801662e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 08:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763741639; x=1764346439;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=afYW2INdmx0JO0YDXbe8P+qVkx8T/BiOKX7PKMV+FlU=;
 b=TH0VZ2LFxAYfKJ9xQN1iEsVlhy1tW+uBb7Zy9t52/Gq5vxDPmOEimW2mwUcdaQF6dY
 sJSVtIZamwCvRVzNXICdsCSx0dViqGaFx5gFnRyHr2Nttj4JWJNO8H/9ndta7RtV8yRI
 9WQocZuhY4UkVF1jfseIKufuUM+Uv4qdPpq668FSfEvOhp+HOhl+RAUlbFi5hQMsaIn0
 V2qidZ8skGJVQVLR0JIC96sz3pslA6pIdWUfZaj16pISq/1oqo7yw2QziXdrnxBiq7uA
 QDToj0jra4NLHinYWb7feKMLu3gYZaUJu2Ln9NfVp0s3uVOtCJ4AZqQjySPGKQzBhNmZ
 Y+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763741639; x=1764346439;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afYW2INdmx0JO0YDXbe8P+qVkx8T/BiOKX7PKMV+FlU=;
 b=XmaDAQGNvSp8ydJtC5OoXMtYnEjgd+GQkBLRutWBBc1Wzzt/Rd0gL8NBanLQksntVW
 Te4wVGHyCqmRTlmm0hHhm2ITXzP7bb93WRwsFWaxrEKU2FnA21W9HlAjnbRWYQG4GSwx
 ClZlVHpThV43xw1FvDOVZ+T4zfswJKqWfEz0lqPEt62L4dnPjh1/9O1dH+oeEsIJwTBy
 GlBMeoU1tErAOLePNuHs5RwcJlfrfYeYdfcw9YceM2wEC19CYmw8QnxuNAAH/XKKrOew
 67wMAv2rHlGb0RGUAmdB31wv4Q+lxsv1fhAoCGnH8UL3ypi2hVmSXBNdJggqBVOawBue
 KEAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3lCGTRhOMMVRjNm93eqM5Nt3Ad1VSkIBc5cEDVJtxQPhRNQ25fgQOu4vmpRKgkjz4/pOqFeb9I3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1idqWiB+0Rn+R4Pr425UqhOm6rHloOpnHA9TSiybGStYYbQKH
 sftXmpN+Av/Nq6k5YOrdVV1Syk7SHCXa76ynVQRqRs42NCx2p3BVV1Y6WkJVn1LAAq66dcsMmd9
 1+r81s2T4PGqAF4I49nE1jd6xpNB0i5bjxpxNnXxO18BfMeotoJJ1lX+OgyA1c1GVZwkUgiU=
X-Gm-Gg: ASbGncujEQogyw5SuNH5Jo0R6Rni6jkFl3y7HMfB8wrfno6SCXQE6yNhlyySl5K1hJ6
 fJOmNJfrDKhVq/lW/sh/hlpnd/9UtTPI1H4HI9WPzNdDPRIZ5f9BeWfAD81y11R+c6cyRC7bk//
 vJv7TsJepfYPK6Wd1Y0pjV8yUkXruHxrcHoSRCopOXlo9VC/4Bsb2S6/vKoPAsd+CWWR8J0jhr9
 1QL9WRGGq/HMgtzasRzr3fGvDHBo0iuxw757rDDG3esyzFZ3YUcis4nwyZYjzEm/aJ6xWNEeclh
 sv1cKH6ANoiDKyG/18N/Duy/XazYTcmsfMbPu9Oto8mnxTLsmsg0JZaYdFFtWCjDsgIPXKlSLEa
 HL0dM1P2Sj4+tPwV6F/3ChakItBEVNCV4REIBDv8vEYT6Jq63krNqOWHOf3ROOXda4bjrj02wW8
 7nqY8ZJDl0aniy+2l9vEAaS7Q=
X-Received: by 2002:a05:6122:1685:b0:55b:f45:1874 with SMTP id
 71dfb90a1353d-55b8d778213mr1011002e0c.11.1763741639400; 
 Fri, 21 Nov 2025 08:13:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOgQYgFCe0VTPrWrOvY7YoNuHe7aWXw+hMMWvQWaJGu2ivgw5iptTZurs7oQHBUhuuPUJHCg==
X-Received: by 2002:a05:6122:1685:b0:55b:f45:1874 with SMTP id
 71dfb90a1353d-55b8d778213mr1010992e0c.11.1763741638981; 
 Fri, 21 Nov 2025 08:13:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db756d3sm1752185e87.14.2025.11.21.08.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:13:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
Date: Fri, 21 Nov 2025 18:13:02 +0200
Message-Id: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6PIGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyND3UQjI1NdQ0szAyODVFMzo2QjJaDSgqLUtMwKsDHRsbW1ALCrRy9
 WAAAA
X-Change-ID: 20251121-a225-196020e562c2
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/xT8Ov+PsfKN/aMoRfE7m/iFLH+BeOD3az/2eEWxojg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpII/DBDeEhn/1rqubM/o28dUkUWKP++pZgF6en
 M110JsyFpSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSCPwwAKCRCLPIo+Aiko
 1YZWB/9GxSpE+Ah2/9n4UCa0U6MA4eakXfIrjPqMUe4/V/y1dJLbmcc3KPe6vwbVBq1gmY1dhmX
 GLW5Qsh1sJbJI7wrKzLJoOlVGRKLjzEfCuYoKBQtVyqrUMqcgJkpBnUxTonUr9MjvDaTkHbMBjb
 ktg3AJ2cZ0+QorM/XIhtDrvdG8Wtr7+AN93123LAm1RPT5mJsxKYOvgbJyA6ksmIgBP7Wdv8C54
 cmWFLsKTOJYahp5jLc3N7cqojW8MgX604bdwzSV3+DtWTqh6GK/T/EOZEQwUa5tBunesVqyxe+O
 5l90x5HzWPztgaILGrs9wTqVKEV+JMQSxf9MVYCaY0wIpQFX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=69208fc8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AiwHhODu2twfVB833LQA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfX7sTK7j3vb0ai
 Dkx2i5o2ejTk4DS/F6mXu3Rk0tq0v4M6F13fDS5XHji4CUSbEEd2oM5+WG1mFCKrC/iW4KhNkvp
 ev+5qZmkehP5hiuQOOOPfgnx0wceXn7VRAvne2w/kyX1ogQTky3SjDeAcABcQSepcV6G/dtJ5lc
 akjzDwwX5SThmtEu/TxAww0EAqB7nYPVsO8hs/2MysZddb9SPdbALN6rCeuTqXcKqHDlOAk82Ha
 zw784VBPOH+m+XMbGIz4KO5x4UDIS2maZgEDcipB78pJWifYJcUDVQYGpa+ua2FWnmfGFtz8g+r
 dob+O2pIaL4K36zkuvcy0N9URJ9mT4GKG0oioSPsT2gqZe+chcC5Fk3O8Ue4/tN+gnMG0mXS62i
 ckyEcBRmk8cFWwP83hc/PH5F1AMOUA==
X-Proofpoint-GUID: jqOytSsyftytaVP5ehMDxI9e9Uo_zZAs
X-Proofpoint-ORIG-GUID: jqOytSsyftytaVP5ehMDxI9e9Uo_zZAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119
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

Add two remaining bits necessary to enable Adreno A225 support.
Note, this wasn't tested on the actual hardware and is purely based on
the old KGSL driver from msm-3.0. For example, running on MSM8960 might
require adjusting PM_OVERRIDE[12] registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/a2xx: fix pixel shader start on A225
      drm/msm/a2xx: add A225 entry to catalog

 drivers/gpu/drm/msm/adreno/a2xx_catalog.c | 12 ++++++++++++
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c     |  5 ++++-
 2 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251121-a225-196020e562c2

Best regards,
-- 
With best wishes
Dmitry

