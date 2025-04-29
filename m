Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA73AA0F13
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 16:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227A489864;
	Tue, 29 Apr 2025 14:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtRl8Ac+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B5E89864
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:36:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T8G4fb007452
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J4vapM77cSti5bfb1sVRmOKt
 P/l43U94DBDBHARRk/k=; b=VtRl8Ac+hVPXwWy3/5FThBwnFkxYES1cyFx9j5c5
 hrB2Emh+tAttSdQ+cSoIFI6chbPBLR648bmTBP47f63eENqDm0QBDU4i/XYPRSiT
 v06MrvR57ohjYvmvcb0vwmwCVGIzSPcP6qQhxm3nchPEZVN/5lRUM5VnfNVcQnZQ
 k4ueE1E5Nri70Q8k5o3pDlSVz20AqlCjQPk2qSEp5tvq6qsQ2TCb54u7h5uKIXmg
 a5oObn7EiZ95kkrm/mbYcM3oG2aLymTgEXXX28wPQQQxLl0puKP4CEvEy690RDlt
 ZbYRERWS5C6ftUhef9uRSaBS96mGNu8f2od/7M3eWJETNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9cw8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:36:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c791987cf6so1247932085a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745937402; x=1746542202;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4vapM77cSti5bfb1sVRmOKtP/l43U94DBDBHARRk/k=;
 b=lvjtNfrrIrk64qE3WV8rYJ5DqeN79UVrvwjZEk85jSKQbfImEyND6/KcyUpNWFWGjb
 MHyOJ6V1DPvmNsrI6UxT9vNNzpEgoeqVr7kBHNggMVJMj8oKLU6eqeJ+sYfiAMzQYnqf
 j9Nk++DHQNBJOoOSGa/IkwSsVxbgoNtu80EP6yByUwuudmUVZ8sHmngDI0GqROw+vzAg
 B5pOOXTTqSoDhZQ0U28S7qb7x6D6JIWypTmIwafczWKlN70/K/CNXwiek7vbcSDd6q+M
 p7o9837WGbpMcZ8x99cE+i2/Y+/Zw2bBeGDzv+Ji443ck9cm8ljdsLwfliHrDkEISOZe
 RMrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIR1WfzAbDtNvAWCVmC8UUUc754pXO48kavSIv8jD99rCFDLFSGCGkJKhIRSAK92ZgU6HMCTD6GHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlkpbAMSsYf/mdRFKZxl+38XDFxm40KnceEonJUJHyHd01gDyV
 4/vIJxQPRbyJi5gBa+Nqbbnr02328a0fCgt9bUiO30tQ2AI3Lojy9CA84hT6m+jGwUOYFTbSdgm
 VcZMqN1NE4pUuhzC0wM2IFWLsa1cfrH7S0YK6QOm9chsrd/PuFmALWKBNlGUjIbHaSAg=
X-Gm-Gg: ASbGncv+w8poP2a9qDb2/vC758nm1R5L7ayEiKUgtKYI+dnzPL24zInjiA6EPj0hGXL
 QMykm6WBJcgJ73ZSAA60GE/xy8gNuZQQYyIq0wXhYpJnPDcgwCxXe69gQgfzf6g40oEv4TjyzCN
 xZmGsLxPw4JrTd+IzxQ2Fbmn7nNTj3l5nWuy+puFfOtgu2UsOtNgSj3OsE+61w/F9mxAms+/J8H
 o3VDnx2p+XsL9XMYT7WURzm0SkPrOye1aMoIQQYS6+5Pl97gxmn11dO4zCD4dY44L4TfzjJ9voN
 Jjfb9gG0mtkG2VGZT2Sic2WpKvJbeGa93J4t6IBwa/az9FDWoCnOciFhpSFnPwCbIfuQTlIzrTY
 =
X-Received: by 2002:a05:620a:4309:b0:7c7:b600:8368 with SMTP id
 af79cd13be357-7cabddb646cmr566808485a.38.1745937401983; 
 Tue, 29 Apr 2025 07:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvlRPDp4nVxPl5jkoeJcUjoMVkueqG9MbxVn9JenlF+X3kyGNQRHfqzf9TZwOykEYT4V2bWQ==
X-Received: by 2002:a05:620a:4309:b0:7c7:b600:8368 with SMTP id
 af79cd13be357-7cabddb646cmr566804385a.38.1745937401635; 
 Tue, 29 Apr 2025 07:36:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d16a833esm24539771fa.85.2025.04.29.07.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 07:36:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:36:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, lumag@kernel.org,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Message-ID: <67u334iujxbhkklsy2awxhmionha6b2qxshv4gjvjesudas2ie@6hhn6gxgjyqb>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=6810e3fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: idEMKJ-patlMV2KdhS0oUHRWAs7bJ14S
X-Proofpoint-GUID: idEMKJ-patlMV2KdhS0oUHRWAs7bJ14S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwOSBTYWx0ZWRfX9apGbzUeIJ7G
 lKirMkLCdZcGK8e7zyc41ABkVtwUtSmFZno4XOdQL+LJA7x3w7YuhFFCxjBQrXRzP/uH112bA/h
 Q1YJwWB4VxPTqjyikmO/epkGonnthb2GOBMb9y278WtAh7z3NTE1TIqKfW4TAecluxUwG36xJad
 w/g70kJDHea+gWdx9r3Y17B/PTVCCeH4kDyyFGrt8yc/xdnRf8fBsGTBbAZPedtCmVzPDorlFyS
 aUKHz9jNCbgavUMCq5psMxK4l7pGisO7a0oxbQoYU1gsS0kz9+FguetFilHqxx5bg3+tz/5+qaL
 aZZHO/cugQF0fXkE1ywYLES1k4s1YBoEAs97V8mxYJv7I2qvqQo6QMbJVI8q+YwJ1/4Le3F6z4I
 CgTvLpLMvYZvIELnBX4e1Qt5x6p2SL7TJ/njZCVOmE1hvaGRDnHrnzDtkGGmqjpFqrx42eYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=867 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290109
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

On Thu, Apr 10, 2025 at 10:52:21AM +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
