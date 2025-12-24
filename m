Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378F8CDB824
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 07:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A303310E339;
	Wed, 24 Dec 2025 06:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9O2NG6i";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDHvzlFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E41F10E339
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:33:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO03ktq559801
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cLIP10R5qZPENwwgn2IodzKT
 zyc56RdXNuD0KpBt0q8=; b=C9O2NG6i5AlJfVZJu1eHt6iMLr/FoEILDpYn8V22
 p2hbp2WScLNC4kgm46m2r7Ij4VwlFNoEpFED8k/hmML+ybl6HABN5JafRVaczfO/
 rrK3KvIpDf6Y5E2FF33gjpQkf9VQUA/hxskh293bvkfZkR9jAoA8CSQDbEka4IvX
 3ka7Qnz/HWJ+4Pxk9jtphVpdpASiWS1R8+IOtElCFPc2GnY/bFAjbrCFGUo/suNm
 q5JXM6x+ELSt5SUEg3y4hthzDkCXnA6kA+VWVEdVmxt2HIqbknBCkZTTqvaA3hIR
 PI0OJva9KrnUXgsRB/lzRg4HYdToUfD5qRBhiBRGFOl+7w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9ctnst-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:33:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88fcbe2e351so67151556d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 22:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766557999; x=1767162799;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cLIP10R5qZPENwwgn2IodzKTzyc56RdXNuD0KpBt0q8=;
 b=kDHvzlFPMUxYJr+MxmZ3pGtdnwEAE/XrNkhAWriRRxA84nlM1z0Ad6SxWvVyCdmsHi
 Bj/3zjmZHJS6+ffmzV+vcppGHIKyuTKZKdCc2IjkoFF8rDEuCBBCzRn7F7vsCXQrrpGh
 InNbtbzHX1GoWUj8s2oluml2ZcwIVPG0QfahNN5cH4WOlvj4FlQM6ob6R5iMqF+5HK86
 u1hB6nnDOQM8JhZwkfYUJw+hhPO/R7BI5CvjVsqHZd2eZATlshuvDzrCXPvIrCogqtGV
 NP7DHaGZEhjeIajr4NqLcrFtKfpBE3BWWeDHlNxlN2SfmJSpTogPM5FjlM4Qxr9ZeIDA
 0MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766557999; x=1767162799;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cLIP10R5qZPENwwgn2IodzKTzyc56RdXNuD0KpBt0q8=;
 b=lu4J57GT14x7rj+acRdW7Tf7o7qJ6Vl4nqEX3UdgNOMBEy9fzBSdiHmIcvexfDGBfm
 V34Qm37DmBA3pjr/vHin2Dy7gxZCTceLS64xHehQN21eM7c0A8zCAjS/2RkwiL0X16VU
 echSrLeSuZsx9UdBCDLm+nsi2XP6XzwakZIeZnuhfoqtJDB9U8to0WbWuhET4LsZT7j7
 D6+dQeVJ3y3rNM3dgFO8cEFeePXyEm4RDzWlF7BHowDfN7TdoSw3+yazzJbaUOEztrZY
 ANN4dCjUzVQ1s9f9f/dirgItdcqCVP1oWJITyQoBarMEharPauUcjcM4xDr2VTZ3aPP9
 81aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkAL4Qdmq8LVxycWT4tHyG1zk4d8aQhBYnRDlNFfrCPHCmRv1i10Ap40BXIF2Ll5HD4zmfsD5Z5vo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy//B8UxQ+5B39ItNYnOf6fiqcwIZl1SpZnaya7Xx7V1AfyZVs2
 D7elrBt9jyZe7kqh2BHkP6MSIVuX9TrUSTm6iIBABWd2LcJ8Lqat7AmJnJj2eDtH4u39ZYY7WGo
 wSETsAgQXxrWLBaH5D31aK++1Rsd6kuBdSRj80TiMSe5NyiU2Y1C8wArquCt0lYG5RH8itt9sGs
 aXD40=
X-Gm-Gg: AY/fxX7KzKq2QwJLWforDe3vexMj53yv+79xnGHJt1m6B1edMZiAGA/xtFLR7JjpVNL
 VQyGdqGMa3q9DE8nWLWpCIpWXTPCJ7C++houfeO+jtOvo3e7jir9vC/HrKVnHVe6TqXX5hFpM47
 qNmx1+Cqo1qwuBrUzKaEtDVcbt+mQTHVGYG01GuKlwl5m0vyMqcc3+bSZSZ3SYMeyziGzf+Mjcj
 j/iFFXvrfAk+CN38bGZx3ynpm6oQ1x9RJxAiZfPl9iShf2zbpUrmEyCtR3OgCtu0cTRXqGzL/6j
 Ygk+Mi/CGxfrAugphbd5lXFkTVXJDGyrOiH0y8aZq2EzqelTKWuWUIoopQKPQa+aicW3ZLmwQQT
 AqWN1qmWtwOMz43LQHCydL616d+wYJgCEToNhfpSJ0T7Mfb8FDgoCsDmhLSCHknsDSR+X02ZCou
 /LxaYW8jhJU4EKrkf8+P7HPiI=
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id
 d75a77b69052e-4f35f3a0de5mr302365571cf.7.1766557999498; 
 Tue, 23 Dec 2025 22:33:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGatEjpfm8ML332l49xMJ93mADIUv34etNyzL9APFRqVHNOW5FuGYf9TgxW4oQ4hlxq8wZsGQ==
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id
 d75a77b69052e-4f35f3a0de5mr302365381cf.7.1766557999087; 
 Tue, 23 Dec 2025 22:33:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122501558sm40268471fa.13.2025.12.23.22.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 22:33:18 -0800 (PST)
Date: Wed, 24 Dec 2025 08:33:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: veygax <veyga@veygax.dev>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <oyj4z6agsbzytdmfdxfshrakymdekrkvp622cnf43zh6cyebtj@hd2s3yragq6z>
References: <20251130012834.142585-2-veyga@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130012834.142585-2-veyga@veygax.dev>
X-Proofpoint-GUID: BE0Ugeg4Tpwi-NUw_0PqCVSjVjO0T9jZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NCBTYWx0ZWRfX/oBnz45348cz
 Uq1jjaUMMUqJbNdFIrkOos8yQDvo3N8BJsajHQz+8SG2hQzh3KtPYeevRuIGTitxGk6xVMnGq4N
 g0dHmVeBPukujaWiwNY/7ExZg9+nTDLVgR75umnj4hCVGYk+jAw8fxHQy4nqAe/8zLGKDLIeCK1
 sdlLa90GeKcX3qSVxIZ7iRVl0HXntZ/FyTbwz3lhgYGEdmkagzEbHkMIeAXBJvRdTTOSvTwIXNi
 ApAkePs/h1np+WlGPkdL5pjtBILWENIaVp0GX3RZgLBS9CsP9uqxlWKA/RR7+51IqEq5yvniU1p
 UFkrMA5q4TK/ngfBWB49h0c9rTeG2477JCyNNaNFo1qfyIIcpZBWa3rGmiPXqsWQEoRXJJrn/4V
 r3D8+E05Z8n839nWH33YabEshVtAJRZZy2GVpA8SsHF8EdulWd3oPijalrFYgneEcX+BVjLjLoU
 aJbEroEtHiwTx7gIOnw==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694b8930 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DdfhrY3wd40uxI6BB98A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: BE0Ugeg4Tpwi-NUw_0PqCVSjVjO0T9jZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240054
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

On Sun, Nov 30, 2025 at 01:28:54AM +0000, veygax wrote:
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> Signed-off-by: veygax <veyga@veygax.dev>
> ---
>  drivers/gpu/drm/msm/msm_perf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
