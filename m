Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44596B4FF5B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACEC10E72A;
	Tue,  9 Sep 2025 14:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="prmUN5Zf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D6D10E72A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:27:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRKQ023868
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yw7Fk6HJCJShlv2t9i0lzWI2
 sWKEgdH07td1ipZYTIs=; b=prmUN5ZfV2hLIGaofH/Lo4W1DdveSATzHd0W0IGY
 +iGzvRjaBZOviw0JVBOne0VMAa+xYjaJQiz9CduoXpnnMFj8myq2+RoJJwkIZAhV
 h8O5fVMVFTMO9/Z4xQZYjxyatQhApvQuM9mcX6EnlzOCQE2RjLGjogxOdG6jS3NP
 l05BHSwOiOV+FnYoz8oU0Ae9nK0DM80ZrlCHd2ufB6rkDVUabBYAJ/wSquyw6+jL
 5sQFL8g1g4VpunkQnD5YzaXkVu+xK5+CIKr3OeCm916HqufXxQTKUYcIUSiZIZvp
 JAzoncmj6INosJaksQzgooREOCMWW2wTD+y7Q4VS2pmuIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by90hx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:27:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b47b4d296eso141248641cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757428021; x=1758032821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yw7Fk6HJCJShlv2t9i0lzWI2sWKEgdH07td1ipZYTIs=;
 b=IiqrEq62J9L5tDailrOhq4hHzWMnMklYkMN9qxulWERNLlOTwcGrKdoLd3m9OgPLeB
 GUknMChV+sPULsZM5XBhtfT0n0tzGtciXkAAfRMkfvf1mFmXZAsw8YMPO79KmoZCXOE7
 LnAIrsGGHxQsxHJzxdbiiGE0Cs/vBoHlQKtByCbgwvfHI4iciPHPdPKUsOIyQ1XHcHqf
 TXus8V8uBad13VfFZZeK/9VVr7nJs/Pf5LaVTtWb9eyOCteZ9rARlArGeigjGycLPe51
 OlH0pLQYExY01vZFp1Fy1jv1SPwpiqMRKabNNdz/p4TXuXWPeBoconOYtCzdNpVyBviD
 8AoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAShg9NNCNbHPtzyDLfkIhpAfbu/RS9UatXgqcUcpj+/lVG+01tz5Rwu3kQhYW3EeqmL9JOFTas3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSXkKg/Bev5vcKHyhWD/ZW3eeBF1VsyV2eUvrJ9sfSGlsnPgzJ
 2HtIIV+2BBdBRFxaxCiasw/l3OiL9mX5ZlBmEO9vvB5e1sw0jdVPT9pV7yZWS+ANDMYwUi7blVd
 MAfjv8XL/0WQuxpXR4fTzrw52Dfc0Jx/qo95B3XYKTwxt0xND0C5FcnfJk6Tz5hN0N+aeVHY=
X-Gm-Gg: ASbGncv7/uUPgsSXYsr1lFnWrO5ggHXU/Jsjg86FYRkZsceM6fmK2x3zHXaPHuc6D1+
 YHTxwcBCV2SpLGh2PUK7SUOU+9rFQGaqQKlbfKeRGdE5Iv8GVBLHlrXaoTaQVQmAcYhf9F3ctPn
 77Q/WXpdM4KcH4QIii5usfq/kEEfQeODNl6X/ebxQU+F7AnRAEruHhZu++UuC+wYY/oGvsDH0ww
 0CXoPCjCSO4yUvFt8r3RScrTbpK5rbeaceugcXQknSLTLdF7qxBv+atT5V9t/ShfXTEWzstp2ep
 fPTsk1BJwG+AJ77j0aXMrw8WCV0kgKjMFs/4gAWKIwtJ8/5f+yBGp4Yq5srAdqp8Wb01Rkd2u3M
 Ti5bp4BiQxHf1JjvCMbbH1eX6tV8UV4bzJ1WeeL6jy5rZcIt61K9k
X-Received: by 2002:a05:6214:1c82:b0:725:1035:1dc6 with SMTP id
 6a1803df08f44-73941de2c95mr112157366d6.64.1757428021170; 
 Tue, 09 Sep 2025 07:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj+Rvfz7tyFBU8l4QDVUaGg1lYtPx2BNUi8Rc06dcrMp5ZpK2kuCy0o8urhbMPnh2qES05Fw==
X-Received: by 2002:a05:6214:1c82:b0:725:1035:1dc6 with SMTP id
 6a1803df08f44-73941de2c95mr112156786d6.64.1757428020517; 
 Tue, 09 Sep 2025 07:27:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680d0d8435sm560419e87.63.2025.09.09.07.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:26:59 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:26:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix incorrect type for ret
Message-ID: <6g7kftcagecmbal2oclxtmjjbi7wc365nb5wv7jhvyzbttcjz6@kxr6oojsvg6k>
References: <20250826092047.224341-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826092047.224341-1-rongqianfeng@vivo.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c03936 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=b381tfKDLOYfEgrzl5gA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: w8uR6aJNOS-TX_4zh2a3oCqen4w7Jo_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX7ZzC1rxOmTtG
 A3bt+MBwKdXPpgytBcuMHNtRFtdcJfJwwN5YyX7c/JbBM3fAihM6Aa0fbamxbtX/T0RR9RJA2ZG
 taRZmL/G5xs7SJ1u/PPc9cBizS49kMiozzBtoyLdXR0xbkEskev2dZ5CCyx54gGsSn6NcZ1K6XJ
 /OF70//+I42MWzRZSRgSsrsjOfHTXxE0knXm1NyZaCIKxYdVEC1bFwm50SfL+XZhTm2A+tQ1+ny
 NeCU2eQs9zaC2VzlFWT9CCkz1zi9buOuKiaCdkMQIJUcyJ82M0CIiIcIgRmoRxGTTBn92mwcKSL
 NDYijX9tnC3v0hfIaiSZi+8MCNaglZnDo7th5atFarRGYqAtqYR5mpMzDXXHCIakbbMsYYJy38x
 TdKa1/JC
X-Proofpoint-ORIG-GUID: w8uR6aJNOS-TX_4zh2a3oCqen4w7Jo_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Tue, Aug 26, 2025 at 05:20:45PM +0800, Qianfeng Rong wrote:
> Change 'ret' from unsigned long to int, as storing negative error codes
> in an unsigned long makes it never equal to -ETIMEDOUT, causing logical
> errors.
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
