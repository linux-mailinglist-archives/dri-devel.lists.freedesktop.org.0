Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2F4B41A30
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 11:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647F110E085;
	Wed,  3 Sep 2025 09:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsQoZwdU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E827810E085
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 09:36:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832E1JT001375
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 09:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vSerlDJpxvfSadnBQ8QnDpTg
 YM6Q1KNBUaEKDfGqWbs=; b=UsQoZwdUapKoi6LnOo0SvJ8QMQCSFB4ulL1jZemo
 tP37+zgMx8Qeu8cV8rZvtJHoao4gHv+iZkAkGPF4XoSq+zTsG58FAkH31LnWC/Jx
 cmEtdiaPd78FUUhKDe0zjT9Wu8lE6f+AYIVMvge5i04FSJUqNMu+ptgfaD925loV
 RoWPad3TPZewXw4RHTjDdnAtVlv22ltQIYBYGgfrWhvUVPQy272YqsXIvnNHGrVL
 p3utT1gxYNBL+fEKtH4jJbZtNO9y0zYb0zyCWIe3lzV6MhGtd1+Ilxb/5FW6uQ+c
 FpYQabteem1iWJAxECYcd4IzYNxycDC5UK88myah5tFJ+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy6wrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:36:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70dfd87a763so71253536d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 02:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756892161; x=1757496961;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSerlDJpxvfSadnBQ8QnDpTgYM6Q1KNBUaEKDfGqWbs=;
 b=YdOZbA1CiwEkKP73qOm/1PwwOUXNBttF+O711ahHFNooaKY2ZselIyd8vSMgYTpV/p
 eRHaz7ho9yQsH102pB6mUTkXkY55S3dKl1OjgJ4ybh+y6k/43gf3wqu4yOG8AK6upfkJ
 Tjox7AyJ3RSmU2XDA8ETFGZ1FSbcz4LqfPxuFi+4vppLZgWTvNT7k6xAk6mbKmvqfZh/
 Qfx7DoePr1ToLiy9DKXoP7kDr3gswTpDlAF2hZc6yZ/vV5ZNmdmpurs0UckxWS64TU0y
 lz5riskfFOBrVdl046IMl4D8vV8EHYFoYH70aDSoOZsuDU2iWmOKT5Wgjc8OTQi5Xohc
 qsGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY4rHhhp/InFcRihWLmg3vLQ+ykaPbMKkfplBxtieUYiX024PUxtw85deJa2frqcpispP8zqrOZEM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBQKX7YAiwh8WMVkIWE0DQakCC/88434VWKqq3HVAWgAXSAZIp
 vxD6LaWGYPJjZ7aEThd8bYp5BdgY8IwOHd/J3PTo+L8HiBoIJo4y8JEnSI7wSXR1+lFx9wseMwW
 zrNDpem6In6gMhVxllNXnZJU2X4QsTV3vPVTOei9zgzBok211CDW7UN7ghRP3vZDvD0ANRsE=
X-Gm-Gg: ASbGncv+dks/xunS9byo3l85LBegPwj3kdL6N41cusBxyye4TQEAfBM3QSt4BhJEtVj
 j1epS/qi7plbGT9jsfRKAlJF8H9okzvh/Z2sGShzzfKIhBOS72E1cMktXraRKC5kxnn5Pqjy0ht
 DLCWtx6+wsKPUqvXIwrmSwFU5+Xs9nMza5aDLGAr1flLKKtWH3qRDgT2X4NCT6/RN84lS6W2unZ
 zEnuVVk3HsSGVQVPp93sLsFIkEpXB6Mju+Fv9C9ilTd2So1bQ7GRpKfwJohqoPKSU1aA9woXpzy
 B9TQxH+1GXk0QULH37DvfIVQ4P7fcbzYYucFwBlePKx8DcVjQgK+MwZKvgfHiA5Uj12X7ltuRAK
 W93jtDNLLcl7kCiYenqvS4S/jOAaTh98lDQNJni65AHChyFBJTqLh
X-Received: by 2002:a05:6214:1d29:b0:71a:5b14:3caf with SMTP id
 6a1803df08f44-71a5b143f14mr94106716d6.42.1756892161125; 
 Wed, 03 Sep 2025 02:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqgDTlX6V0CHb7DNRDOoeNqxg6UWnd6OmRx0Se3MK3/xtEY2lCzdiwyL/yLPFBz7pz69sN1g==
X-Received: by 2002:a05:6214:1d29:b0:71a:5b14:3caf with SMTP id
 6a1803df08f44-71a5b143f14mr94106496d6.42.1756892160620; 
 Wed, 03 Sep 2025 02:36:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c503d7sm9027131fa.11.2025.09.03.02.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 02:35:59 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:35:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
Message-ID: <oeecjgt43z3pgt7eaxat32vk4sch2h7hp3ibpvvw2cb2mognyx@ft73uzdyiq56>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
 <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
 <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
 <b7a1b89b-54dd-4d02-afcd-0144df5a6d57@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7a1b89b-54dd-4d02-afcd-0144df5a6d57@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b80c02 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TuRy5nDU7s93I7UbW5wA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: g8VnK2n6uTczDE2p_9TPsHcFCUo8glLW
X-Proofpoint-ORIG-GUID: g8VnK2n6uTczDE2p_9TPsHcFCUo8glLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXxgDgO226rbTx
 TIXod0FHPfVJ7guEznUDMmLH6nGtsdHs9Bt9Umg4MkieTtAWn+pAFVlwPUVpFaYdtdh20p7RIR0
 VwD9ONyFM1bz1322BgKpL28MJUBhcVqk3+pOp/GGXHzdYsIVAxA9vmDqc1iKNhf9oB4OvpFhKZG
 hWjWnYADqvxUoiYCLkH7/MC48+73PH+G/TdN0U+CyhDpVMtdUALMRZ3H1HWCxdf/hbRQAtkb9c8
 gMy5WELJd3U/8Wgx6so/TYm2puyv4UtZIuAm91uUEXhPooK+pPrckptViUHSJyr/XLDHvI81Cr/
 bUa/CqKkiaCBwRjDbLJqFWkkJhZPofFqMWJ6Mr6+agMlYJzJykjkTRHlGDyl3mYM4kAPp3ZKAzn
 GTiJmf57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Wed, Sep 03, 2025 at 11:25:49AM +0200, Konrad Dybcio wrote:
> On 9/2/25 3:02 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 02:30:48PM +0200, Konrad Dybcio wrote:
> >> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> >>> During bringup of a new GPU support, it is convenient to have knob to
> >>> quickly disable GPU, but keep the display support. This helps to
> >>> fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
> >>> modparam to support this.
> >>
> >> I'm not entirely opposed, but slapping a // in front of the compatible
> >> in the dt works just as well
> > 
> > Which requires rebuilding and reprovisioning
> 
> Fair

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
