Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF8AFA4EC
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 13:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BE510E287;
	Sun,  6 Jul 2025 11:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Leacun/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBB610E287
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 11:50:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666G2Pp026850
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q9HNInpFc8Sm98uBUx5T9Cx61YxOobfap1a952dfyZc=; b=Leacun/cxyO4anBW
 d24A/fKZnr/yKL5yoR/0upUutLNvKKfe+EETlP7P9kQ7ng3gEy89PMxdI2cZUirm
 ZFIWfbiYxJXGvY22Qh/MhrLuCLodKYktGAb8rwNksiOCVbJGjF66p6otzCIL9Fuv
 kzoj2TKpfpzn4HiCrpv0HvS205AnZ7TR+htfQItZsetjbx7ZmvEZE9Za7j59rrnE
 qAx513Z8fSzzYRSCwCwLNOVfkBD8xYKLoPb+Yvr3JsllAx69AowytAOUB6awal1F
 +pZocxyFwGCqwxqPMvbOI1W1XiRrQzfH2ss1VtURH5CZaxrn+W5Ivzp2BrH2sMHK
 gyoypQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveeuw1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 11:50:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d3f0958112so332239485a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 04:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751802604; x=1752407404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q9HNInpFc8Sm98uBUx5T9Cx61YxOobfap1a952dfyZc=;
 b=DKlfiY1Wn0ssR9vwNYppjctrgPjIO9jKChR27Rg3RSDPLZxgi9AbE/+AhQFNAuucYI
 n093N8hHx+dgSVPxTDvII4XQTO4kjH51M3Bwpcw3/HBi6jS04PBwB4iUP34kcOqVNu+9
 0OphVgNnH8sCUeBEoqMX1pOjgHn3VJiT8pxzdqJYlC2+Or0KA8fGEfXsGF38+AJDyyWK
 Dp+AO1epzEHAt7pRxmeyDAg47WmBvLcc7m0zfICaB6iED+XhvhGIG/72/EXH70bU3qdI
 kvHUkfPkJbEEho8oloasfVq8v3fb7sI8kmTIh60EbeHIz7fQFOpKt0AVcVHaF7rgZp1n
 qvFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwld3Nkn4fBsSqa9SP/TOqAC68lSlTTel9xMN2TzQD458MrL7YDMO7DuuC+msOLvK3flNDCGpUefY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKwwbeXvPR+pHmyxBX3jdwlUodPBushQDFEgWsHbZZ8om4Vpmf
 MolPmNGdquV/L7lymkEfqkAt6f96XDwOI70bQEEPsgCHRFr9HrJ4r5vShhm3SF3rDDXBN5N8Jts
 jn54zSLqi6JK0BEHwKYfYNuX4tqksOwN9NLcLMakNVcoXwUOgEMa9nPyGLv/yGLiWQ0nFJ0E=
X-Gm-Gg: ASbGncvH9FV+NxB9eSWEcE6y12uOv3bpmLM0xT+9dfi7XqIBGQQQSFS3G0BoyxNhUxF
 kpILTcUIK4xYVvcjRpPwcnWC9CVbEiefetuOhdkPDvo9hDEN/1H8imFQWtjR0JIyCaK+ryEwY/e
 DniqVLq7I8qKfiHkFIVV3T+Mc9CcMxM9gvWYCIhyczzlQFsbKCIls36mWArLBrDVsFpjuf9vynQ
 Xg4t0BfHvT+LFaJctPTFrGoKqDOQg8SDUet4jrF8hnEjUHkIEuJyP5FXk8cFR1v53Ez3oh0WWkh
 7lrx+EswHNJ9Gti0QV8lqmWgrAH2EBGH0tAi+uxnIiOK2yoAa0PlHOmEdpE3FbElnMDDY9lJqcg
 dm4I2WfKsyXYls9kNA9PpFwgxeMFFouFXWNc=
X-Received: by 2002:a05:620a:4710:b0:7d4:4d55:98f9 with SMTP id
 af79cd13be357-7d5f2877ceemr597279285a.28.1751802603997; 
 Sun, 06 Jul 2025 04:50:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb6W9CB14eZN8lAc1Ju+O/wZfg00R2RD3YvSB64DN3t3zQ6bM27TvwmM+CwZjrSQ0NktwoPQ==
X-Received: by 2002:a05:620a:4710:b0:7d4:4d55:98f9 with SMTP id
 af79cd13be357-7d5f2877ceemr597275885a.28.1751802603572; 
 Sun, 06 Jul 2025 04:50:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383d8f2fsm940440e87.78.2025.07.06.04.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 04:50:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Andy Yan <andy.yan@rock-chips.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/dp: Clean up white space in
 drm_edp_backlight_probe_state()
Date: Sun,  6 Jul 2025 14:50:01 +0300
Message-Id: <175180259610.2709906.15531384408565663524.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
References: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA3MyBTYWx0ZWRfXzXX4m5oRW9jj
 oKNiJasNkH9hPKNXp7im6Cy7xVLFW4JyT0hL2bvZk+BAPSjZqZZ7v5Z9ozz8u0yCuHW4ywIeX8X
 ERs5+IzVU73dbue8aem807GIWcTzORORi+iHGhAgyAzM5LI5hYT31thFOyEgRLuZpMaMuoLzKv3
 yECLENamn36W1LufZYLSJOkqvWtNJ6+KuFxRt2tNM6OJ15ncPqAsGC4VGIkfZyRXxD/npoHBI7p
 x+3w/uDzekkHkUxNfG23LtsOeBFCmsHFkJDdTrogGeSIs9r8NbGvFPj7O1y1802/HJMXiPgLch/
 EVdhl0U9Y0HXBqeySWrvgZPoSEpyeoYSp6e8+TRda8d9gViu7J+zhonNJ00b0on2TxnOwARz8Sw
 /KKBArn9npOyDjdAvRnoQMADNdALoLCH/yxzMogzxpmlVRmhbROnx1JvTD/g8gX3WrfRSrcb
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686a62ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=bpLDS-e79snoD0d2c9UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 87w8LE6_pNHidF8QOwFBMaEEzNlYArPT
X-Proofpoint-ORIG-GUID: 87w8LE6_pNHidF8QOwFBMaEEzNlYArPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060073
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

On Wed, 02 Jul 2025 07:55:10 -0500, Dan Carpenter wrote:
> This code needs to be indented one more tab.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/dp: Clean up white space in drm_edp_backlight_probe_state()
      commit: e33f256dbc293a1a3a31f18d56f659e7a27a491a

Best regards,
-- 
With best wishes
Dmitry

