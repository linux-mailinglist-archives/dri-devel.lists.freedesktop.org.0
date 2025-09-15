Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5DB57578
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7214110E35A;
	Mon, 15 Sep 2025 10:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJGWvMVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAB010E35A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:03:15 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FlsK020612
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iNJb9aBoW8s0FMiS/YZ9p7xI2r8sb0NzpQjCEzw6dyk=; b=MJGWvMVHbgq0zK09
 OJ59VyRCwAkg6z9Y2Z98viKfYf3Aqds+STSfibyZnNaYQWThswgGz+TFMVzyxJHM
 dBvM3QQ50SITB6Vh2CzOsORsyOObN4kDWJYhKtzUPxI8xlXhmcxtIOOa59jKdHuL
 CMi3gNAZLkH72urj5E9BT2aFRZz4CRS7eORsfMCH891HQVQtB8S2kRFbi4lN1vMB
 tOApXXnhh+oDfW5gZNcrHkA05txE8Paqk0dZTkLgKcvNd/bFByZvu/H1TTsXWevI
 D00jWAbr4FAtWPvXUwnKIpAG5ezmvpMB000Q299aevibP7qbxjsxniRhLot0MOhx
 zojXwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv4gj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:03:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b7ad72bc9fso3770561cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 03:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757930590; x=1758535390;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iNJb9aBoW8s0FMiS/YZ9p7xI2r8sb0NzpQjCEzw6dyk=;
 b=owaEWt6Zsls2+ASZZvmD06g3I9TGAZBNsvxRscvj3vMAYURQUt4jQcJEFUkFiQ6fy1
 he8vUEJl6ESp4yPIqYz7cOES1POc/6nmcYnYguHjOY3kyz7JUsEB+82ejYxTmifCownV
 1crkbqFb47w8SoT+nhhRzy15reQaiowtd9bgSiUIW1+kctWJXdUzZxkooeQWANTyxpvM
 DYB4h9g6X3NlUgqNwOmOgf4nWOhmDTxgobtD4emigdKEWLwh94hRgWdbUCoUZmXLNm0Q
 RNznjnEG8DW3bW7H877zqXxzNRE/YCQ4QTj0ewvw4tz7uiaTGw5ZsOL41rIhr+UQ0KNM
 O2iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX488XHJ6DIPvj/Alvxr1dpSYtwJrwmNpxJH16Jz7IlnaSDOGyV1KSgY7Uam7A2IPA35L1ofGXn54c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxtl0D2bhDudxqjUYPrb106Cw1wVKBryT97CA3fSAlvs0TWQUIZ
 H3a65NhJfHHT9ijcUfU8AlaDTi83LKcX9p3cA5gluhILvkXWCt+BOVl+z1hNpfKYFpUQmZgDf9r
 Jeni+bN132njg13O2Du5aEiwAUiMzpBqr0o1UaYUwVucAgtnKVo2h64Ze0flILodlZhx3/BM=
X-Gm-Gg: ASbGncsxeHTD7VTDMWloirVjO5XLP0A4KTlS9AKAsKHvOYcNJGpIXodLWQpwMdlP8BQ
 mqnrDVDaDP4uRWMaKWwBneeWKWGQzbA1aZW9QT4kJSOCL6Ia6ghlxsIyOKZlxMb/e/hCvHN2SJd
 CS+KPcd/Pg7sJTpG5zlE7MkZtUoEtOlRM92aw7Af1osGw9qK9JDd/58x4WhdedjeXC1SMJDBn9D
 TwdoRZ/IGGtWz4Z1KKpxTzB2cTQx+D0O32j7cog76Sp13XpIGSVf8QLUhiWZugtZIqN1yMZZR5u
 aem4sNtZJVNR03ug4xCQDYh/+OIUxIEbALTD0PcnXHZl2bT6207oXC2jmSRcvgsZ+wUIkb7j6Lq
 aA8CNZ8YIfHLL/avOJCCdqw96XkpvOBnmRr2FY4ZX/WjpJTeGsUOR
X-Received: by 2002:a05:622a:120a:b0:4b7:9ae8:6ea6 with SMTP id
 d75a77b69052e-4b79ae87162mr50917401cf.37.1757930589657; 
 Mon, 15 Sep 2025 03:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfpvRgAhMNhUxIeD9tNbprQD/TrxHXCB7JaEsEcvWEvuJOODOSQVkWTR5TtGrU2694pjoctw==
X-Received: by 2002:a05:622a:120a:b0:4b7:9ae8:6ea6 with SMTP id
 d75a77b69052e-4b79ae87162mr50916841cf.37.1757930589119; 
 Mon, 15 Sep 2025 03:03:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-571459c1482sm2723638e87.0.2025.09.15.03.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 03:03:08 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:03:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <v3vuphn3n4w6ynpaqeosechjdcelomn53atwfotka7izqvjuid@nnvdwxqlelrp>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
 <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
 <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2WgFBvvJ8T2Q1ZEXPvObI7Ljz_nmLdZO
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c7e462 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=RKHcw_4USbZLBnuPHksA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2WgFBvvJ8T2Q1ZEXPvObI7Ljz_nmLdZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfXzaMLrR1Cqmif
 V/uaauWbxyQlZzwYWNQoggAKo53PG8duk+umGJOEI8qL75ap+t5O6jLyuvSJg9NzyuRaBla+Zx3
 OMdS4+MogfiTeplJy85XyJCq309tkcSUoB02PVCs9BCvDgfc85ETDhXlWQtdUDuZRtUd+pzo5kx
 2YhOR8x1Uqef7lHDG3m3/yzpmQdCbkX/SlyHdoG+nMFiF4XWJlLX4/schLd4oJ1JzdNqfqjUFBy
 7aVHbQedUWMs5I/U+4sZAY10x5Eb8qyVClE/ggeX5LCdmmYXtXf09ZdrrB70i1q3yy79ZtLCkCG
 mPLQn3s6msuRxe2Dhxr3FfSXAL0Jq9Oq/hUGHJ6jQZqiiUMa8V0PU5B4YAy7hnzOBgAqQBhva1J
 KkAUi3YW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029
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

On Mon, Sep 15, 2025 at 02:26:12PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 8:10 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
> >> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
> >>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
> >>>> SM6150 shares the same configuration as SM8350, its hardware capabilities
> >>>> differ about HBR3. Explicitly listing it ensures clarity and avoids
> >>>> potential issues if SM8350 support evolves in the future.
> >>> The controller is exactly the same as the one present on SM8150. HBR3 is
> >>> a property of the PHY.
> >>
> >> Ok, will update commit msg.
> > Please red my response again. What does it says to you wrt bindings?
> >
> 
> Yes, SM6150 uses the same DisplayPort controller IP as SM8150. I wasn’t
> previously familiar with how fallback compatibility is defined in the
> bindings. Since SM6150 will be declared as a fallback to sm8350-dp, is it
> fine to drop the driver patch ([2/2])?

Yes

> 
> Here’s the updated commit message for [1/2], does it match your expectation?
> 'SM6150 uses the same controller IP as SM8150. Declare SM6150 as a fallback
> compatible to sm8350-dp for consistency with existing bindings and to ensure
> correct matching and future clarity.'

I'd prefer if we have "qcom,sm6150-dp", "qcom-sm8150-dp",
"qcom-sm8350-dp".

-- 
With best wishes
Dmitry
