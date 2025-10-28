Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4699DC16F67
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1370210E670;
	Tue, 28 Oct 2025 21:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBP3t+ws";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnauBD21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7520D10E66B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlNLQ2575188
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8ES5R4cKZbm2579FN/u91MD4
 liydQdt6c70evP352k8=; b=lBP3t+ws3HVpujM9Jh9orpxkun/mQgDlaSEi6xnH
 Ptw3GP8dO5uIgRkyg2ghxRhYkHlxS2Sv51+0/xBRPZsXmirXw///p4aFP5RVOXrh
 Jh2awRbjsnZQxgLeptxBVDEqhnJAGd3czALa137sA1zSAeFyDNKHkV9stX7lxyZe
 mD57fYcAlvQoP8eKW40mE1DoFk2ypVnn4ZPz3Mq5YEizu1fu9Qs2JM+GKC80Ye2V
 DvZ/DXRIrXk4R0zu/ExqS66kHa003dfXw8VIDL7rV/2TbRp3peyQg65C9i4d9OqG
 dXKX2GVpDILSZLlghT8E1lPmUIvfmLPBPXn6b9la9wd0hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a207mx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eb9bcc1105so10742371cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686768; x=1762291568;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8ES5R4cKZbm2579FN/u91MD4liydQdt6c70evP352k8=;
 b=JnauBD21PNYT/KkD/si6ku/8tALHbgjPVaVYXe4wpj/zM4cu0ePMcolpfZn+lGWG4A
 35MoPLoX0XNy3L9B3ecHAMXPX/wZbgZ2qVOLQ7aslOk2Q0XnRVXBuSq4vO293U73gSOT
 aYbzrNqj8I1zqRksDc0lKLnbo7HWdHrCB6L5QD0H7xf/62myCGi2iqVxhhjcgUe1CObO
 L5n6wSmh7V9WqzMnXLekckRuuklFwkSAjmRv3YRX+Q6GnS2Y7xStywsiAmPZMtT0iD5f
 AOvZVM2zhspxpUGmwze4JGuJvJJ8o58xkE2bKN2dtYCPb7bbXx4Pi9D70viezpRapU8C
 pUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686768; x=1762291568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ES5R4cKZbm2579FN/u91MD4liydQdt6c70evP352k8=;
 b=D8EkOgQXBF2EsYZ6MLvJSGFfUfci1Hv48tpmBSHShfZT71tc0tsKg+sVn/rfFDc80O
 B4K/MYptv7ie0XV1rK9er6yc6pLMpfT/K4GwqUN9Djhz6Id3T0QQlJIJ/2AVeGfQQIPl
 5fJWGD01s4E4ai6IRERpW9fl7/4F6azX4nV+Hh0QdRn0H38u4RNFQdYKsVYNfupKxWOw
 NtJ+RXpmX3CtT4TrtHKemN2GDBzcDUCSPSUUUDX3c1gRkpzyd+Gno+Y0NaNM2H+0dDcd
 JrruVcVu6jBAaWvK6vsALeAw41jgMc4v7JcDCu5cgs5xRy//pDEF033kYMpeWn8eyAzA
 Fo2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFMXqpNbFGUXD6IW+xTGL4ru8yfOt5nam7G1pys+i+yN4td8aNCJyMX8bGQTEp5oWcUfkiXHAsjTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRtYaXbKHx+0dmDlRyIPepsf3JZIEyvBwFTCJADJWyrw6Hb+Ez
 WHGzq3Zg98G+mCGLfIIQ8/KKhmax3qEPVEf7EOulSqZS3y5KI/9+IKhDFQv1q40G7GtJuq2lg/3
 ToNZhzdIPMFqtQbDQjBHBo2JIwesNzBU5Y6SRl/4a4rysES/SRu5M9vX6EY+LhBmATL6fbww=
X-Gm-Gg: ASbGncta+60r44TyDHxNeaDhmGNumEVwfphOfJY6Uy4wbAAqcPpTyr7XYMdjEvbezvN
 CXu1FLSrjEbM963XiHQ8bEQ4wmwnvPRL/lf4hHlNb3b1GLo2pQoqtUXS5l6MmqonB44mgsUFjUc
 CgShhVwnQJDEm2PwJmU7S4aVnvk0tvjLmeCcex/56e+nMVll9xfWLUXN8SUugMNeyQkKU9eVGEQ
 ae1mb3uxWDjX1aP970JbTbNyxzDZttIWpswa4ebCUIePeT6W7MRwVqlkr2E0fjVjz7IYjjdYTHk
 MkP/5qaW7eM+NtrInK0/5QNI2MvkfttI2TTJuYT9SV4S6dCsPEIzZoDbxmRslEerknhUHceSpoA
 hghQ3NH/a+rn3CiNL/PodxRroVRV6nJKKschulR7o1j53HmIZ7fOWgrQ1YRSBP+cXaxCfVt0iNZ
 UkyNNCVVWgjcfF
X-Received: by 2002:ac8:5d08:0:b0:4eb:a2ec:6e3e with SMTP id
 d75a77b69052e-4ed08a38b90mr56468141cf.28.1761686768000; 
 Tue, 28 Oct 2025 14:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWUsXJar9zGCJLVEydJueQvaPH5F/340n2td2aCFEB4n8xD3QLcbXS00cSHPhDL3ce1u5lAg==
X-Received: by 2002:ac8:5d08:0:b0:4eb:a2ec:6e3e with SMTP id
 d75a77b69052e-4ed08a38b90mr56467891cf.28.1761686767566; 
 Tue, 28 Oct 2025 14:26:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59309eedf50sm1607060e87.69.2025.10.28.14.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:26:05 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:26:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/msm/dpu: Fix pixel extension sub-sampling
Message-ID: <3eqazsv2f2or4l2xkyqetddxmfqmrejlskafgtvbnkfqoutv7y@cjnvezhfwloj>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-4-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-4-40ce5993eeb6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfXxtYmDL8DTZ1H
 1GtDPfIKGHzXAAx3hY3nIriunyi0MqshD/q03SEhlhypCbYWvjpsD0iHQNJZYHWocgWKdKLImnV
 dAqQnmDDNwf2u1sENKIRMSj9nTXXu7iDj8ce96FduDg768Y4oDHjVtAwr+otudtpyIQHfgYGepe
 RWtR/dHiS5h0gL32tzasRx4x763SdKom2q4GQGgY1/WD2CeaV5hLlMBanU59rm3U1VvIFVwmtIu
 fJvdkuWknghA8EUZp3uy7gSfLcwNrBFjxk2zyhOMr4u+jgAvD4lfRJ7PL5bsjilr3kPp7K8MTD8
 UKwRn6/tkn6WUaczBLvgJijRSpW1ARqlzMs7T4ibPPLQbt+Cxp/oZpY36t2YXkHbWg32spRQ3LW
 f0+xqAFyGpWgQsRCzK0lp6wT+AoXvw==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=690134f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Y3eLQpR3wbTgfGwADiYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: k0amQAZAw-173xfbQo_P6u8ejKUch6TZ
X-Proofpoint-ORIG-GUID: k0amQAZAw-173xfbQo_P6u8ejKUch6TZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280180
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

On Fri, Oct 17, 2025 at 07:58:38PM +0000, Vladimir Lypak wrote:
> In _dpu_plane_setup_pixel_ext function instead of dividing just chroma
> source resolution once (component 1 and 2), second component is divided
> once more because src_w and src_h variable is reused between iterations.
> Third component receives wrong source resolution too (from component 2).
> To fix this introduce temporary variables for each iteration.
> 
> Fixes: dabfdd89eaa9 ("drm/msm/disp/dpu1: add inline rotation support for sc7280")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
