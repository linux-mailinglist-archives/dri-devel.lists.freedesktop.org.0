Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F8C6D1A4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C4A10E229;
	Wed, 19 Nov 2025 07:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QA/DpA+U";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUiCUOik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6140610E229
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:28:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ5FIvo2802575
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8F6tsr+Y0mCAYNRXqHWtql8i
 o0OKhfJCKZv2IA1/dx8=; b=QA/DpA+UCM6D6A5ksdtM2sywgq+h+LzbsP9RDuj5
 m4pK8oM2M0695vJFraUckgv8PmelkZ/N5FvbuW8WnzUUXcuXqPGFNKZgTETy+PvJ
 H2vT/dkeNSwWq0fyQWfPBA7SyqbJVUlkOX3OBCxWdyPPN/GrCTZFILzum1Ai5el3
 KmVg/oITEHLOyZrtzoJNpZsX6/6G0qjkuGQWd/2zd5C6KxBlWJABwhj0BFfbjhZZ
 2IV3vBsgpPy0A2vopTObhXvunK+UE2Q7yvkX6c7NUfgo2hrH4LxKCZvoeHamWkyV
 TpygTfkp7GHuV3qFzokgAsPzF64H2uIkiQd3yeXAq+UbwQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk231jd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:28:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-880501dcc67so240317096d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763537318; x=1764142118;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8F6tsr+Y0mCAYNRXqHWtql8io0OKhfJCKZv2IA1/dx8=;
 b=WUiCUOik/DWF5SUUM1KiU622NQXQz1JPdr+MLUuOGsNW54QgLPu/dFJlxSydIGHWD9
 rFehrdjBhKWKHU2BvJ5FABkz4agxi11SVeh4MtlN6OugYZ6oj5bsgwm5eUqeP+H3zkOm
 caGtcx9OOr3OXksPNBjvriOtDnEi9FlOgkYa3TgR3vc4Ny9omG5hFJHPTD5mFPZMiu7g
 3pl/7w3PcctUFNj6Agidl81BQRyB5DNo2+QXzcX+Uo8z6d2OhUmogiTcKS+MPpcc0Qul
 YmYDMZyd6BRzbQ3luckZZpEZv8tZONZa4Mve60NL20KLmjpVH9BVSVG2Zma5RMUioheb
 5WOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763537318; x=1764142118;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8F6tsr+Y0mCAYNRXqHWtql8io0OKhfJCKZv2IA1/dx8=;
 b=cNL7n9zjnzeAMphipE/v4TplEHmPhefAHFzg/lZh7UVChwkLmdr/NVcr/yTYFpj4V0
 WWsY6pOZ+clbl3Wb20zEbci+/mLYiHhpaIeiqCw0hE97NcCosVRau+DOarvJQp7MxNXk
 Gxv7FX9qD9+3Z74eTPgRkRXTmEbjoyd+idq3VCMwkJc1jj41xqk1TrWMEhN/Q1ak2208
 D438jrnAqeNJ/KqzCynTruRaCkz6hAzKFsSw2k59Ctj5fmDZknjFHx8Xr5bfi70PNOHW
 vDBgM0Fdyl5y7Kp9+bWEaWeW+mzSks9Mc82iACNHr4/2L3VKYEcEKIqccqvyJHiHytJh
 vA1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpUOSQoJ3N9Smtsdes9yWtJhh4gs/FjN/uTf7gg3ZhjrfJSse+EVpYvG3c3L9jog3SckrLAOZoqwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6pVfNmc1MZD2UnKeNp3kGYJmZBgTboC/mnMvrQI6g50xaZzv/
 dRHSvQcrpLTPqVLYKKkKOcNhkALA+mOFGd2SOOclnNC/gTT2Y9ZJ5scXnfo0FRjXiBHWTUcbUWs
 JYVIa+jMI93RK/pBvtRNBPkXdNvGruDMfWdJ3hZf4qvEMVx7aR1w1H5+8cJOyKqnMqXqnsp0=
X-Gm-Gg: ASbGncsbNtZ5IqzgSGNotjqQUCH7nj1jMsoJBqE9VoQmVZboRua1MsoyMHFJ9Ad3a5i
 e5dgQaFUgNmZkQ1LLxq5rzciilxzLH7VtZNKVrIclT8cqfNWwMv+S6kwRcIInonmqMnUa0Hkd+N
 KA6YT1fG24rq6R9VTmjmsOTePq0f8F9sqxWCXvEs562saIN7+yZnGtKYN8/xfPlEecbNY626WnN
 C5dmsPeaNxoMQQg+CfUXnl9Iv4vcJk5ef04xuTElMgLS8QiGZqP6vRHABtr93XNwU98FNmOjynp
 KN3Oysz1/V4fYbBfggZIDBK7SdU9ayiu0JSrNlq4eonobQITiBTle9L9Opv7mOn4AkW/u3iOOEo
 AhZI4OsuTmBV2jhu+cl5M1ZbDDB0zr4se6o8xEfH3HiCMftSLVK+ufQxl8OKJZ+2mWrT/3J9PvL
 LMCP1Iq0bqot5jV+yUm5y9Oqw=
X-Received: by 2002:a05:6214:27ee:b0:87c:2847:f7bf with SMTP id
 6a1803df08f44-882925b1becmr231604926d6.17.1763537317678; 
 Tue, 18 Nov 2025 23:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmqu4l/1lwgBqhj/Al6iB0IsTB91IKNEHwScXTc29DhfUQ0y8XmgfCWtAYGvoeLUhwuKcxaA==
X-Received: by 2002:a05:6214:27ee:b0:87c:2847:f7bf with SMTP id
 6a1803df08f44-882925b1becmr231604376d6.17.1763537316583; 
 Tue, 18 Nov 2025 23:28:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595804004b5sm4540413e87.64.2025.11.18.23.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 23:28:35 -0800 (PST)
Date: Wed, 19 Nov 2025 09:28:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/8] drm/panel: sw43408: Introduce disable/enable
 functions
Message-ID: <sioljpees3e6sfygylxihk4kagh3dcfk7xpaydd4y5tip6apng@5zdkogftr3mr>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-4-317a2b400d8a@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-4-317a2b400d8a@ixit.cz>
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691d71a6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EXGSQNdf1jmvRekyyJ4A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Bzqrnn9VTKZLeKKuexFB0tMkJPyBXxTF
X-Proofpoint-ORIG-GUID: Bzqrnn9VTKZLeKKuexFB0tMkJPyBXxTF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NyBTYWx0ZWRfX9eOB8WxKS4B2
 KqVV+I83zFpOf3UMjhEiVE3XOkD4/W9BbPJBZD/IEkt5nrkm4Ee3bQrXnE13QGxgx2in8kkjctx
 o9J1VgUTUH1yZnFkyzNEI6F7bZROHMnarkRjwF9IGAPRmwjYmsA4KjrxHpWH3OyqOs3g2GoijXP
 7ojTHcdCMjfSBwAX2zt2vdEEWWephgzZ6St2SNsJc7hmaSCzUJs+gXet/4K0DM3XjFE0Kqy/pr0
 W/6Asa2125eqmsoWHVr9fOaMbtJ0+QVlbajz4nCZW5pN+TuDTgdNzv/WotsEJeX6llkBQ8h2LRS
 i+BMs0vxEj612r40REYbuFOcT/vTRS0honNqvro9C/vzaqskbUpvFn7yu9opqexDZifHsUMVAUZ
 CFwQCvlJPmjGNxFEn9zzsOoUqg2jeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190057
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

On Tue, Nov 18, 2025 at 12:30:39PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Mostly cleanup, introduced disable, enable, and reset function, which
> takeover parts of prepare and unprepare suitable for splitting.

Why?

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 83 ++++++++++++++++++++------------
>  1 file changed, 53 insertions(+), 30 deletions(-)
> 

-- 
With best wishes
Dmitry
