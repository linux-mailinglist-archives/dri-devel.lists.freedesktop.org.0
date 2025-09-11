Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E2B53305
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0946710E318;
	Thu, 11 Sep 2025 13:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="biaE/Mqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDF010E318
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BD0u3O021313
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OTyomZaXMdmAPphIgRSMvoxt
 +heXM0Jm3kdfZ5nhAw0=; b=biaE/Mqw6t8Yhq+11rK5s6HymjveFoH84bZdi+A4
 QXLKg6aHYBSNuhLIU+EBiH3ipTpy09GohI3kFprt7m9oe6W2kuQoEII/jVpov/qp
 0FnoYlAUhh2ow7Yj6U/98nsEQwDWInI7Uo6lENaZ1z56UtRAXRx/iB9aiOaFNdEB
 QfNGV5O2DZpTJ1jFlI3SWZV03zRIfjZxokCI9Dk5HsQY4SJGQjLxr9EeS/p2/AvY
 CX9Q50nA9LDqoThi5P1vD2szYpw+JP+0fDGXT0Kix0ib9VJR+YXGgpBZGY2Svv9h
 6ffb9OUJNbXGnxAsW229ttwxlMd/5V8Ng8iVTgW/BQdvPQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphseuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:08 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-54494477f93so2503436e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595728; x=1758200528;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OTyomZaXMdmAPphIgRSMvoxt+heXM0Jm3kdfZ5nhAw0=;
 b=PcvbGFwZCyi4/hndNYPaj40QjucxMtyfbGb14LnGFC7FJWP+A50+97QvsFfHbrG6M8
 1RM2gM8azJPMIeYE/uWIUrch5IRsIFpITdnuoF/EoCjCkKgq17VA5v82mcZUSmGQplx6
 bNpsJGggXrNezU/FDnbIDVxZkz6LfWLMfX5UFdNOeasGwOal+p0e02X4f13mIvO9vgWy
 XbZ9PXpiSB9vtgbCYUoDd5z/kbKV+qld9JlGpGNTAcaKz9Ptr0ASMMGVMZBUsKkPoMq2
 IqyUxCV1pghx8X9eprmlP4G5G6VpQepnmhqTwj2mJrEm0GeC5ege/hVzumxS34Hxsbrk
 Ohrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoaMiE4fi2UMH77jTj0izo/RCWzvN0boWEjrQ1lhuoww7FjfF69/Gk7hXoln2u8vuBHCr2jO8X9zI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjLcZYlzRWglov+n5HrC3A4uQZEKE1dKFzZEkm6A4BkFwdWbzX
 c+rppvtMLxcFqin1RGbY4AezEZrspfI4A3/TzTjb/T0IB/6EpMPJ906we5ytTBWwdFAgEC+6LfA
 23Fw282Kg0OeRXTNAMxSI6nqcbOr3fuiH9bxrK1bgZtAsHix+bUuITwBtvrTQX6I4x+PQx/w=
X-Gm-Gg: ASbGncs0VE4QIrlmggm5EdxmerCYXyCn5pYXwPUusiu1hYLZwcF43G6ZJK9R/VBAWAt
 phh8AbU9v/jyUdzcNbOesZmRK9e8wR4OLChyn33d63YZDD5nI0pqpJL/M80Cc7ky0sEbjijqNfG
 QXldpaovJOx831ykqEoiqe+tk3Hl8ZdzGW9fH9LMF0vRNoLeApUH+PG6yt5q/2pAV99v2CsLYkt
 8lNYMyA8vBritx67oaXYqivaiox7JMcM0oWpQRs3HUiTQKxuvG+kB3r4k2gq3H06c5PmAFjTInW
 KkYk6VlRpcSq/Ivsde7+E20Q3oa+oidP0WYwMg6fJZy4pmfNHJGtvsgrvJ4+ma7dkGSJPnWXnG8
 LvHLUaxLUQ2AMHLKND0hOPd6dloQ+EGRtKwQSs/JyorTfNCCw5SC4
X-Received: by 2002:a05:6122:6315:b0:53a:d808:1ff2 with SMTP id
 71dfb90a1353d-54a0972db37mr1035134e0c.1.1757595726877; 
 Thu, 11 Sep 2025 06:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhv0v3J8Y27t/nw4xhWgdgl8LDzWqA4+LUKRc00IUTMLdn35XdPB2ACx0uT5AlsOiegud0kQ==
X-Received: by 2002:a05:6122:6315:b0:53a:d808:1ff2 with SMTP id
 71dfb90a1353d-54a0972db37mr1035032e0c.1.1757595725938; 
 Thu, 11 Sep 2025 06:02:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e63c63d50sm414692e87.65.2025.09.11.06.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:02:05 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:02:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/msm/mdss: Add Glymur device configuration
Message-ID: <hxyh75aajlaymbvaghftcz56ttbpnmxfnc7amr66hhpbt6n5sg@msh4ljalgmvv>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-4-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-4-d391a343292e@linaro.org>
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c2c850 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vuHc2ZSrshEqWGcFJyYA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GK6FfRjTaMX7mAZgWYzPizjGwHW5mIG2
X-Proofpoint-ORIG-GUID: GK6FfRjTaMX7mAZgWYzPizjGwHW5mIG2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfXy+fWphivmoXa
 MjSdtpNsAVfxvcikWHwEmZqnnErvRBLyWNuTuQbYr4N1ofHChnDxs0wnCQARt39CK1A5fjnRmWe
 XLD4uXY2a/RlI79rADEdtUhsb/LwVKgNND9PLHA9AHfD5cIJ3h/dJV1Oak1i4tBDDQtLQzl9J7Z
 DCsviyqp8XqsOS5Gbh0HsSsSKLZ3Bzcw8np536vS3GCsm2sT4LvArMnhZ9DwGbmCEy7Ui0fchWk
 DhkT4ea9/G0ZnNMfDqJC0p36z5otyUXd2kZuvwovhT0sxyvjsINV++RZ+BqpRhgPQdRrsbrqJqD
 YvzHzWHCeE9EyabupN7VpD6H9GDf0uzTSDjnDz6/a4fWfMlg2/b3yecrfaLqFvuhia4vpOn2Oz8
 r2Xqj+Ry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
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

On Thu, Sep 11, 2025 at 03:28:51PM +0300, Abel Vesa wrote:
> Add Mobile Display Subsystem (MDSS) support for the Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
