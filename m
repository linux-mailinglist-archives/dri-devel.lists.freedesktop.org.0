Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848BAAA7BA8
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 23:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDB210E949;
	Fri,  2 May 2025 21:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eg4EGt4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B274610E969
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 21:54:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAwHX014267
 for <dri-devel@lists.freedesktop.org>; Fri, 2 May 2025 21:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZvmUzQIOGUeAfMrPOeRpQnnw
 QcRiuGrm59juc7Vfi40=; b=Eg4EGt4kWmq/sSzh+ivYS2g7zy0H+y6Eu7n+/YwW
 gjOpWPeoF5bsEi1BVvb8/R41phFmNbOEvPO9l2GwXtfJzCYqwDx9RMJisk/+QYPX
 j0f49tBT/JNTYPBOJ8BT+E1F/nryzMMmCxEu/QGyrOzlmqdYrgpk+Mhz4VGK+f3u
 Trp8+kxg+tpGKayKtk9uIkuzqKRS4JiH6Fon0Lhjj+GikjNYy5QlgAx4AS9jZoqT
 ZIzktF1PyUXW8zqN9NEgCACo+bRKo9o4xLU78T3j/wkGwkgoeZDUgtOXoGyGSKgw
 2NEJqxHeDVMW1IVpKfMlKLbpY6H7tk1dLWQf6lP91mM9ZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u41dm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 21:54:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-47693206d3bso63765171cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 14:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746222874; x=1746827674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZvmUzQIOGUeAfMrPOeRpQnnwQcRiuGrm59juc7Vfi40=;
 b=jZ3usvgXkWdv9MJ2cad07fm3CyWvgryRfbi9jIUUXO5xo4kJQxIKI4wIrLijzaF2fB
 pJzKzTN7yttVZkCoYNLGhbOFyV/X8OZTPkxoFT//s+ry4Tfvm5JlYi8aBqDn3eE5sxEZ
 PcHKgCN4W7PdZ6+2CQ02QzgrWgucCb4Oj6N+zTYMEGqOKM+aZqZEKfTCcIqblvKkag4L
 5ZeFMoeXrogZ7PxdYbG6zhb/+EymzHKE+cRhM+HQuVkG//fZj3eyRwZeBCqmW+19cTYw
 m4XTY1VGyMMh9JeWdq3YDOrv74mtDh5+aUR7lUzwtZJ+lJRda93uR/EH5JEJVf+cWDoe
 E1ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBqeZeaIKcQQEBJcV8NEndBFEJp9CEx8oGW/iJvnWpMr1FafqOuQlKPvwJsrV4xYc0DbwT/k7silU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxE+6eKLMRgI00be0hsrLMWuzOWXzoKBwxXFLRiRu7nLlA2HYJS
 8A0HIy53wEvAIc/UUylDT1wjsZhEbL5cFpuGk6VHhRMXGJe4XL+PlLeB8b2ZmHnBt2WWDVoi0Pa
 Fb/6SVvZ9AzF3zI6TczFzNqOaBoeP3ZZXO2z8leGlslgx84aO7+IZBqro7hCz2s2ptSc=
X-Gm-Gg: ASbGncs7nZupWk9eUFIgQaZVyzBaBrXX9fMpWnCSbfIHyHsavLCBfkEUPB8Ln5ehNSC
 JKxeDkRLCJEdo6vl5lcwxrx75ZKBdDlNu1pFCcAO4rZ+CbwyEFSLWaNdx6QGVTvMXFkcK9Kf0Nl
 bY49Vr7hqRa9Vu/z/OPfwzbtdobvIj+7w5+WIlB76f16J8rAf3udzURY01AATpBHR13xWIXqoik
 UeTaF7I+OtdbnOKmPClrqp8bXer2+JdkOreCLvZ4gG1qiM0zdiWrBtFuNNN4x8kAx59pyXFE39r
 PQPuPFajamF7nBs3YBI8bIAqCNWFhvoB4XgMWonux2Zgbq31k/Jw+Ig2cOrDNe7PGzdioaXnvSE
 =
X-Received: by 2002:a05:622a:420e:b0:476:95dd:521c with SMTP id
 d75a77b69052e-48c32ec38d4mr68552041cf.45.1746222873828; 
 Fri, 02 May 2025 14:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED/TtnQQiE5a9O3NSnNygm7M9WTJF7VaWZyyflCze2xLDga0nyVzzBO+XVlYwZOulERcJxtQ==
X-Received: by 2002:a05:622a:420e:b0:476:95dd:521c with SMTP id
 d75a77b69052e-48c32ec38d4mr68551741cf.45.1746222873418; 
 Fri, 02 May 2025 14:54:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94bf00dsm503653e87.65.2025.05.02.14.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 14:54:32 -0700 (PDT)
Date: Sat, 3 May 2025 00:54:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <bax6ropbymr2jqwlqvvmetgvsh35s7veevtj4sdwoh5jqghdwb@yrikyb5z3dkn>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-2-alex.vinarskis@gmail.com>
 <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=68153f1a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KlA0SorxOHKmT8hRjgwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jGtJO02MEJDyLyMhhqXRcTx7Ito9-Lej
X-Proofpoint-ORIG-GUID: jGtJO02MEJDyLyMhhqXRcTx7Ito9-Lej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE3OCBTYWx0ZWRfX4+bqSDQwixTH
 hT7QGD9ViN6dnBcNyo9SsK6JjZjxmgzVNzNM5zoGezWdMLr77bA4e1rwysRh5PDljB4dqP/KIzP
 8Je0P3Lda/oMsJKs2on1OXjMt0hNv9vxG6GL8H8ihGbm5bFxL9KYx6FUZ5HoikqWuDhBk1cbTm9
 +wvEXKcmyqkwPE7M3C8frty6F+wQipW9VeBzF+Meq991Kc/bXAYVK3qFU4MtECspwIUAMjAgvYk
 A2S+IOYyO/FSTbGusATHZ4eW6r+yAyyKsJ/xEmAI3XvNoRGmqmYOZzgjgQv0zBBVecrRCix/mq3
 qeLs1uGif/EcClvQGCAdscEDHdAEbEtiJeUw8j4vlwU9Pvo5IEWmyzANeeQ+u6H6MGC28yPyBug
 M5YzDOaQE/OlOM6Hm30KGiWjBN7iTWFgvhry08BFk4qvXsOfYzAL8hT68r6W1xSLX3Rzcimb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020178
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

On Fri, May 02, 2025 at 10:41:41AM -0700, Jessica Zhang wrote:
> 
> 
> On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> > Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> > (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> > Section 3.6.7.6.1.
> > 
> > Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Tested-by: Rob Clark <robdclark@gmail.com>
> 
> Hi Aleksandrs,
> 
> For this patch and the rest of the series:
> 
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P

Were you testing in a setup with LTTPRs?

-- 
With best wishes
Dmitry
