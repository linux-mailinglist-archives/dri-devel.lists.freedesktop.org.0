Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1738AC2E10
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 09:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52C10E13E;
	Sat, 24 May 2025 07:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fe5QxhpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAFE10E13E
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 07:19:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O2rBMI020968
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 07:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uZJMAdjzE58M94TUbCIwk+R6aGX0UfRYgArPmJUsuN8=; b=Fe5QxhpOJosUM/FH
 K5J2CRxUFHc90Ea7L6OA0syyvnLvQoxGSRpxpovXSoJ4fZS7BU+1CCkFCegf2sab
 /8fWJusJtJPcUfG40gOdUqmr7RW+W9kAAsS+/l6JbMmW1QS9VswN8QyFL6u4QoT/
 BgKMoIlxTWwltaWHQxF05pr3C+vMfmZPgrHloVf9RAG0mhc/PrrQnFGW+szu12GN
 K1y6fckVBZYMRCfTIf3E+7g87RqOsM0md22f7uc9gpASYm8+suwxDoRftLEEyKEh
 DTRE3x/Qihk3K6Mms/e0hJv/GA55Lm0Q4/sJ1FrWv8guN00CrVCSGoRSnLg0/W6z
 J5ON6w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5q1rapg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 07:19:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f53913e2b6so8087786d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748071171; x=1748675971;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZJMAdjzE58M94TUbCIwk+R6aGX0UfRYgArPmJUsuN8=;
 b=Yq7k6Sps3LdeexXm3+MI27dk1asKuz8Ziift9URhBlVZqR1xi9NJDNWXWCl3zLfu4I
 6ce0uuuy4maa0OTHjG6+pixvyHqmgGYzuwScGB1WEhGOnN/zxU6kMWyElchTffC7Cl4+
 UVVuRhoC68sGK8KggVKxGcSUD+GLg31wQDALEdmP4Q2+H9E/MVQEnt/u9H9QXFOPmifQ
 TBDIt8GcRf08sKP6n6E2O/G9cXQeke0yeh8k768ylsezWFWhdnbOmQnAj8eZjKLobOfK
 qDY2IUGvToF9FzadNTb/JkcWSHkEyQdfHj/nqnx8OzDeChNval51w02KtDkbcdTFgURP
 Uxrg==
X-Gm-Message-State: AOJu0Yw9+x2Chzny60h8Fj1r76nxqbqfSdIH2kZ9shXW0zJAJw4T5EcL
 WgcCL57w7CW7aFIXfr9SO69tMBOmYcaesaogAXaqXGgQAAUszoaCmdcMiWMrmkOLe62NkI9BWU0
 6erCfObK62IdIVHssgcOrl5fYo18uw/IeJnuZOHjQQN0Miz4jQpcz92oNWTLnWyiPs8yB6H0=
X-Gm-Gg: ASbGncvUNgDOXICw0hp52b9C4yWhDTd1gLkJqqRx4gX1zHtHeftgGq+nNPdYQPX5jWp
 7IlpWEJXCCZiaDyY6KjvkwbsOvOVV3UqCbYsz3VKFJomH+eig3h1WulFw2RAD0VuoxL9rxgMOFZ
 qlB1rGhvDG9KpPANbIw/+9yEmjqdS6wqdM1SyesmGlukEsoougZlA/0FMptUWvngJSEBrDyfSvW
 LM7vndjfimWMtNI6l7FYv/1mVlbYuXvo64G9PZHLmXn3vI63/+3ZwDBAsajj3BFdVOhz9sPgH2j
 yotyevZoVkgPZ94o5yxmQ3z484tEboVj599lMZYZ8xRTWPe3+Whha5HjE4mTqH7fRI/YBxvadYq
 WnL99rvmxF0u/7XGIJImi5OJG
X-Received: by 2002:a05:6214:29ca:b0:6e8:f166:b1a0 with SMTP id
 6a1803df08f44-6fa9d2c24c7mr34749556d6.36.1748071171274; 
 Sat, 24 May 2025 00:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl8WgQXUDHGPdC+9uqmIOPxrQWcqmJLukZLEjzOr63kyry1yRJpi5fhEsUTvzTCRFye2nU6g==
X-Received: by 2002:a05:6214:29ca:b0:6e8:f166:b1a0 with SMTP id
 6a1803df08f44-6fa9d2c24c7mr34749286d6.36.1748071170933; 
 Sat, 24 May 2025 00:19:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084c8c31sm39185631fa.28.2025.05.24.00.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 00:19:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250506092718.106088-1-clamor95@gmail.com>
References: <20250506092718.106088-1-clamor95@gmail.com>
Subject: Re: [PATCH v3 0/4] drm: panel: add support for panels used in LG
 P880/P895
Message-Id: <174807116958.3738483.11651543440541735749.b4-ty@oss.qualcomm.com>
Date: Sat, 24 May 2025 10:19:29 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: IfAjGqsVLiaO4wNXoROSrnWC430WN-jI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA2NiBTYWx0ZWRfX7KWZzx99XDC2
 I/9v7ykhd4Y4j92HQrnX4ZAaFAIboCJIElJYuIRTiFFVT5hymkx75ft/Mm12y3+s8Ew7QcNEEM8
 L5Ds1WW3xm/lh7MIQsy9zWj6pErWlN2AhL2efGpCvL5U+HryELu7uVdB/zGwjktZry/VTfqHkF/
 AKUC0wO8n4q+pPp8Tx2rDR9V1AN4eihKs5qXk7QClZxTjolYRG69bFX+4Ap/0hYBmlfjmGhC1u5
 GkE/U8KLKpLPZbIISw0Uv2HBipO3vxAzOFrGNBRTCOP2JnX4nLHYo0QkL6GfhxQC4J9UUdnnKPX
 0GY1tAIJnl5irqoKUO20rPXDoZSz9eCmpJUfOzgOU9UXbv8VlrF2yu8orBVpRyVyY3uGCOyK0/N
 LPSssDXTei0UUabRbkoW5yYR03kEJ+v0wtuWYyG77GeDRcFOHm37zkeBF2ZjjWlDVQnXK0Py
X-Proofpoint-ORIG-GUID: IfAjGqsVLiaO4wNXoROSrnWC430WN-jI
X-Authority-Analysis: v=2.4 cv=FLcbx/os c=1 sm=1 tr=0 ts=68317304 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=rcFpJ7UuLk0rIOd95rsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240066
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

On Tue, 06 May 2025 12:27:14 +0300, Svyatoslav Ryhel wrote:
> Add support for panels used in LG P880/P895 which are based on Renesas IC
> (not related to Renesas RISC-V architecture just the same manufacturer).
> 

Applied to drm-misc-next, thanks!

[1/4] dt-bindings: display: panel: Document Renesas R61307 based DSI panel
      commit: 43adabbe3a7912b2db199a17d446a5d9fcde6fc7
[2/4] drm: panel: Add support for Renesas R61307 based MIPI DSI panel
      commit: cb6c01ead1eb78f7676ea09fe407c4aa1c5855b3
[3/4] dt-bindings: display: panel: Document Renesas R69328 based DSI panel
      commit: 215c73d48330230dc0ab0bbdd2798dd2ce66acfd
[4/4] drm: panel: Add support for Renesas R69328 based MIPI DSI panel
      commit: 9e0f93f7af569c6aee53eedac2c4161ea9d50169

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

