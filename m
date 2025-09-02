Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CACB402BC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E6510E6E4;
	Tue,  2 Sep 2025 13:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyWs4xTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA57410E6E4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:22:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AVe8c032487
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 13:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bnOMNcgQTARJqOqxiCbPbIZk
 hjKqpauvdBCD8pLsQcA=; b=GyWs4xTcOJESFlgSeT0axog15tx8gjBcDzntMD7q
 Utiw8kq7EPO+GZhnW0untLLNISWeir0cCSSOwmGTiB6IzFat6GJTvVWe2QhiCppT
 cq/fEaxWG6VHkZbfFopHvmLvqrqlrW7Z8cFQA7gVc+XK296UXB/eZUCJ6V+HzXGk
 EoKpJ0tuucS+T+J3fDqCvyDtUv4LBHsJne8Su5EaZwq5X6Onnx3rvrdIAqj2YcYc
 f1F4kWYgk2zEpa/lJgwrgrUP54bb2SJs4KIxQCzQ5ToiVMicHw6MPE5YcT0HVDhI
 JzWxXf7yXnm/OTeyZvzOEEs+YAvSrS/5oGHV8o8p4AFAIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw9mtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:22:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b319ed6427so99461661cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 06:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756819369; x=1757424169;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bnOMNcgQTARJqOqxiCbPbIZkhjKqpauvdBCD8pLsQcA=;
 b=sMqrRs/PMe4AgBozxyXkz/y2gBG4Di9ERf4fvmpLMt41JRGhHeYH2n1iWR0goiTf8s
 gqym2ve04foNf00uhzMmCHL4W9sByNuqobXflncIBQMgm1LTrACnlotGf1aCJaMUGm33
 EF06YBcbJCYEMfNAetyHquIebjYP+kaoAAowZPJoV2Q7J1SzJEGFNwOaDUd7NEXyNL/r
 DsXDRhfkqqNbcZ09wDAa5nNfok/1LMq+qJCeArFPgz7KXSZwRnxE4osHplcWG72HXABP
 +aYkTeYsinljLcqly+nWSrRJKoZ48gRaZfeu/b5zOhA3wPNykHTZY6DbdhZExr3BMAGM
 YHPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXFl/0fUA1ZJeL+f+ZbprmqrXhb+/H82baTNGVkhIe7OUUNIpFR212rm49m6rNDemrIAxJpVde5io=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztUbPen011ZmPA4BxBXAq7Pz10X65BOSbUech9bloPvCZzILxY
 NLWAv/2mm4LIVM+sTpWgi/Xx9nLl6qWmICgQ5k2w1PgnRhqXxDDUHAaNYuloElZY/XfxHY6mX7w
 wC8iZ/m+4i8IOORW0ohFXTT4uOzdtRA1C2X0ZtADxY33TRfX53ZvDp38CvkyfHtNNoHdzD6Q=
X-Gm-Gg: ASbGncsmNLtmp2QWVRA5Q4chiDgQj52pF80shqu15/QlVCcmxWAQIIGdwFUY0aW0oOA
 NcILA8QuD4XHvjHNKixViwCLtqnbtyDtXgoNVAWKkBhey4EEv+qZ69avzjemBalInPhiarUQHRw
 2v+YLiCqfyULLqPzc/9MQ72CQtrRvHc89WIwN9zq9u/C/VDkVYTQ4pXkITjTM+g1kQfVNoPDC09
 3lVYzJm1RoWnNZgpth+98UcL2beogZvdH4yZ+tKx+ZsoQOvGEipXQ3amjuIAc8420WRp191En2n
 bVq3MGw6660lDZokQpSkZmElDSN3NV8Wx7jzSg1aut8QSkinsHzC1hAY+wEVUDhuKX5SuWr852k
 XpDfaerMeMbF69qxLbU7JHRK5i3vyN/dABou0XqFpxR5L3dWoiuq5
X-Received: by 2002:a05:622a:4008:b0:4b3:444d:d831 with SMTP id
 d75a77b69052e-4b3444ddad2mr43181211cf.77.1756819368642; 
 Tue, 02 Sep 2025 06:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Yfd06dDxWc4ORQu80mKYAy1Xmpyw2gmC89vwxroKbFRt8K7S04LGANB6G5EwZakLVep4FQ==
X-Received: by 2002:a05:622a:4008:b0:4b3:444d:d831 with SMTP id
 d75a77b69052e-4b3444ddad2mr43180581cf.77.1756819367875; 
 Tue, 02 Sep 2025 06:22:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827b5727sm679643e87.150.2025.09.02.06.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 06:22:47 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:22:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 34/37] drm/atomic: Remove unused
 drm_atomic_get_existing_crtc_state()
Message-ID: <uvna7myr5hrsfbnki64i7oeg7elvdyyc7z4p4sq3qj4ubzi5e3@rx5mkmyzseny>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-34-de98fc5f6d66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-drm-no-more-existing-state-v2-34-de98fc5f6d66@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX8pmLnoe5QOQ3
 P8wUIbkcJHIdB6MmLzCOCQnJZ34cc0xFRofx0rUSADeZULYqQ3bhbqtUwQWMorPB35CswFP6cc0
 sMLVb2SMPZ3ys699qDdW9BJKnf+SSjnT7JHTFa/Es3vTubXLgJ1WTQk7l/Xu1hxqQWoLSVhI7En
 6Fy3Xmrrqd8xZ5qj9wQXsTLgMfZ/RRto/SCoFCvGdPnEazIVuVyuAkOgSf+O0/ZMLGaaH8JatUr
 0i9v0szpMBYmkaxhkFNIgpkhxPdzcOoro4elq+ue6YYvS+lkEGvIrbuIaJPO7BtONqGDfnol2Mq
 X+qnZmG8Wp5fMa/unP9fhoWBz9ecN5wPGCGGhtoz+ZfTyqvGmyELAUP0K+HZRO0QRhSZSZsNF+I
 7I8ggyWa
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b6efaa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v-H7qGZ_gL21L2yEE4EA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: TQ3EyYMWFCz-iTqMtOuZj8b-oCBYOVVR
X-Proofpoint-ORIG-GUID: TQ3EyYMWFCz-iTqMtOuZj8b-oCBYOVVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
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

On Tue, Sep 02, 2025 at 11:35:33AM +0200, Maxime Ripard wrote:
> The drm_atomic_get_existing_crtc_state() function is deprecated and
> isn't used anymore, so let's remove it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
