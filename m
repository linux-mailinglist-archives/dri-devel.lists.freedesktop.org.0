Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF65A89767
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA35D10E696;
	Tue, 15 Apr 2025 09:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGiYYZeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7702B10E696
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:04:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tXEv002470
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6hZpISES0U/oym4A/OtPRu8hY+MQbR3SyvSyRlk7Lsc=; b=mGiYYZeY0ltty7NV
 zksty3KtGbaINtI0a7fCA+Mlxq1G2XrOCV7unWBG9fiXEbDUfW5jWodTsAyBPXC8
 LbDLnrzZ+BvJdqtYcWe4AxLnlrB0WNA+aB6ChinrzkFVWNZfuvlM4PZkjRpNLssZ
 kp/8KNfDshNRePyyPdOL2CZUUU4CwIzmMmybtQ2+KTnMP4TaMsvP1Mb+UAd/mjNi
 7GQ7pAH+gvEk11wJzKZglvCkKBVYSyLOza75TLoHPO9Rd5D1wf1+iEijrbZuatI3
 gHIS38+96VL/SkLWfW01SzUNCg2AwMkEMQ3zH8McmoRHLvNT67XB5/poRjvqE47C
 0u4Srw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vfgum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:04:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so801545085a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744707884; x=1745312684;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6hZpISES0U/oym4A/OtPRu8hY+MQbR3SyvSyRlk7Lsc=;
 b=asj1/TLkXxQqgtu3YnYhAPQ2a/pgWAQcBLYNqOSZQ125A+bOvxdQ/hMtjjIbST2556
 xlojI3Rf+zACsVCu+PoZKk7Sj3aFz3kh9fBP3XRnREEw5FR5R9gOymrN8EQJGrLzvLi7
 ElDQlLL3Ztk5hvJpxE7hqBgoHfSqlzQwwaUZaEt/45qFkrmGan02XoRFT3ONy2i8co0m
 bo4Eo8nT1oriAl5SNHFJxygyh+E6GjusvriVDXs04p0Imleorb8i3pV60xGnguUG/y0n
 LTQd6Pgi/O59R9IPSjpwulSBhYWDoCP5Jiyd3CIN3lIl7zi8kHv/rH4y8nXtNP8vtD5m
 1+ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO384O2FassMdnXK+76oS/Nfhqdw+zaONNBin8y+uPufWLjN4f4QDYvdWutRZIcVBLY89oq3NUqaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaLyrzO8E8QNlpAWd6gEGoGeMX1qN85ERskOmrLrAjWDCYlroP
 32Car4wzNbNsyUNWmWIpeQk6x1/eN1blxdUIZomOMqAsAWC9i8PNtTvc23Wh9qZCpWF8p8TZ3kk
 klEg0HraRIEyeIll6FWn3e0cOTMZPeRJsM44tV8BVnA6r/aHFOD8b8exNodvtb4kvVbo=
X-Gm-Gg: ASbGncsBtLznS3+in4XK9LCxXpfHlFc8tseZ7Wpez2kROFRu9+rEXAj0uX0juNI38Pf
 IUtcxmlN0EugoI9Muy5/oPOgLxc5tS4yObP09011vA3J/MPfRYTtrm7fyD4+vupIwK9hrIPUcE5
 Bp8zE8SZtawcDN5WcU+jwJCPWdggGWoNFwePGwVvFHTwd2k8a8LCPCT7pBRDbq8ZqgHKcBltCm4
 a/WBLlpFG/TDcKvp18dAGLLWLeNnsLfcZX43SxzhcNXvpI4FjxhlnktN6AneOtR8mq6ojw84W9M
 zgDCU+vposCKtp90vAaDunbDgbJd4DDGVHw5mRl0pRqhgLrWHQc4HeHERe1DzlNh1lbG5BY6ikG
 hQnVLAYqOHUgQWVznaKifhyC/wkN1adKXhzeazugcqoJdzJPMqxpttd+nuO+t
X-Received: by 2002:a05:620a:170b:b0:7c7:a5c1:8247 with SMTP id
 af79cd13be357-7c7af0bdce9mr2263371785a.9.1744707884573; 
 Tue, 15 Apr 2025 02:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqunBK84oqVf3RoA3SZGRSHrxH7q/c8tnI3gqgWn61qjL63ad60eci0nqMgqyVJRkBEaAlGA==
X-Received: by 2002:a05:620a:170b:b0:7c7:a5c1:8247 with SMTP id
 af79cd13be357-7c7af0bdce9mr2263369085a.9.1744707884246; 
 Tue, 15 Apr 2025 02:04:44 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd?
 (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi.
 [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f465d509bsm19459131fa.84.2025.04.15.02.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:04:43 -0700 (PDT)
Message-ID: <ca85e5e1-9887-4cea-91f5-3c312680506d@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:04:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] drm/vc4: hdmi: switch to generic CEC helpers
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-8-04809b10d206@oss.qualcomm.com>
 <20250414-thundering-marmoset-of-promotion-c8e0dc@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250414-thundering-marmoset-of-promotion-c8e0dc@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GiM0UcOFYnxiNd1o_ZhbNTl93oJtNzdX
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe212d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=72TttzAs2X4TEUGSDZwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: GiM0UcOFYnxiNd1o_ZhbNTl93oJtNzdX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150062
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

On 14/04/2025 17:41, Maxime Ripard wrote:
> On Mon, Apr 07, 2025 at 06:11:05PM +0300, Dmitry Baryshkov wrote:
>> +static const struct drm_connector_hdmi_cec_adapter_ops vc4_hdmi_cec_adap_ops = {
>> +	.base.unregister = drm_connector_hdmi_cec_unregister,
>> +	.init = vc4_hdmi_cec_init,
>> +	.enable = vc4_hdmi_cec_adap_enable,
>> +	.log_addr = vc4_hdmi_cec_adap_log_addr,
>> +	.transmit = vc4_hdmi_cec_adap_transmit,
>> +};
> 
> Did you compile it? it looks like drm_connector_hdmi_cec_adapter_ops has been renamed, and it
> doesn't have a base.unregister field anymore?

It seems, I've changed my build tree config and this got disabled. I'll 
make sure that it is enabled for the next iteration.

> 
> Maxime


-- 
With best wishes
Dmitry
