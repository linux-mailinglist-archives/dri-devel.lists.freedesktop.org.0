Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681659BB04A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 10:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BBA10E3C0;
	Mon,  4 Nov 2024 09:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCiSwvcl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD24010E3BE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 09:53:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Nj8UF022012
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Nov 2024 09:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 48BbhzMG6nJlrKXOIqS7msafjr/+9ztjQ+P//OS3fys=; b=LCiSwvcltpIsTr4J
 yevfNJVC/ZLqCrYRj0AKP/nrsvkIIrcChljyktNYe+TSomgSkFAXJP6H4PILuhcv
 HFxOtIcXnm08CXdeUD8+vJNNZozBIAY2Y9B+scea5HmYpDfGG9Nk3BkgN6jcghs0
 2wyy/cyl77dYrvYGGrW8ISDs1cXIsBzbv9N0awOBBL2V99Wgm2s7kPPe/fsOPhrC
 nYc0u+cUS8/XwI9LSK1X6E08wyIPjHDdAwwYlWrh/oQXwc+lCzma3cYPNVDBhhIN
 SqlcD9Avl/vqLSdVG0lGvlxpwbXThypxW7Ou2i9U28fGRYXjTKeITvPpoh26Zq65
 pZr4FA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxuqsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 09:53:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6cbf4770c18so15526866d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 01:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730714035; x=1731318835;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=48BbhzMG6nJlrKXOIqS7msafjr/+9ztjQ+P//OS3fys=;
 b=sRAuSS38eOUxp2sRG32UaSyvEydpl13oY52zTyfqwRC5AL2zOAxB1/sYKWiA1/UZWg
 ykgp0h0LU6OhOpHqCRrRCzHKIF0Cqy7VvSvg+y/Lw6/YNl+kqryiE9gJTyRlPKl+GDZh
 VTL1BOzN9g4bIEqjYe+eKmaSweb1Z4CfGj/rQ6PWfLqHbzkrh7xocO+rDv2+CtAenKZK
 KH6E0iGgRjGGRTU/GP8G7HnRLFqO5HQQBljeF3VkaVVR8yAzozUK/bCBQKc4IoIJzill
 lC1Cjqkdn7e/vsKjUeglGIVzM8jfs9BsjEWrWfTUxobw6XUzOUHF9ae67iSPKcjYEOtI
 gN1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAPv/cm12gZKT+/gaWkulhwlEwyAHQoFfEnKhY+EGBwFeIa3Ekb7B/+pjjVPW0FjHbNljDi9HaPkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzILs+9FCkCXKwemDp7IbdTTJnoMRMwUdeSkXK7JRlIPgMI2YG7
 mSWN8hdZm2yX/QR5motWtWGxBbqTvGMz90A+Yhsl/yfcjDjVklhD0Hw4hAgkMxS4CTzAaPv/SpI
 XcBNrQui2qHUMjSYwGjeBlP6odqBabtMNMouR5Gaql+xKHHNEM4k3WbhovehmBwJGEqg=
X-Received: by 2002:a05:620a:4443:b0:7b1:1313:cf42 with SMTP id
 af79cd13be357-7b193f73494mr2113115285a.14.1730714034916; 
 Mon, 04 Nov 2024 01:53:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtxe5uqc7MvnqsqyGo/b1+j/YoMPpCIwglJ2JELVbc+hCFY6xRwAJFk2Rx8PoXnp6hGWQDww==
X-Received: by 2002:a05:620a:4443:b0:7b1:1313:cf42 with SMTP id
 af79cd13be357-7b193f73494mr2113113585a.14.1730714034624; 
 Mon, 04 Nov 2024 01:53:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564940basm538280066b.17.2024.11.04.01.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 01:53:54 -0800 (PST)
Message-ID: <07c5dbf2-8ce7-42fa-a511-3dc22f525325@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 10:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8f0s5jkGa2hltb_eYlUesffQ1Y4fSngH
X-Proofpoint-GUID: 8f0s5jkGa2hltb_eYlUesffQ1Y4fSngH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040087
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

On 4.11.2024 10:07 AM, Sui Jingfeng wrote:
> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
> procedure of the specific platform IOMMU driver is not finished yet. It
> can also return other error code for various reasons.
> 
> Stop pretending that it will always suceess, quit if it fail.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
