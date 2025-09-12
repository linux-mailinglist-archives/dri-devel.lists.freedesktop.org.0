Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69207B54CAB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C823C10EC34;
	Fri, 12 Sep 2025 12:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6BIixRY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDCA10EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fEFN001280
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NnyrkzB4u18LRqNkoWf0ndPR
 ZH6XykQ2rOusGiQJecA=; b=U6BIixRYSgDlGbrcDBKVqlzqS0Af7/HksXpssARb
 muet9XY088mhCTEqPh29mMbqImu6KpSkYJyT1M5W1PnfW5x0pyJ1xvO/ij2kaSij
 k7xs0/2yWBcoGM5nT+T0uV5hgcZP6sMqHhS1BS2b+6r7c9E3bUA/fYtOem2Cp5+W
 qv4IJzRS2bBURYLzjn0TdzSiy8E/VfkXj4l+gjCeugU8PJICmsV8ybck56LqVTes
 a2U74zfl5vjhG564d2Q0mF1nHmbB/OyAxLzeewXIVYtYN88dHS3RcNZpWhsLUUzQ
 YQjn7FJJzjznjTLVls6ig44K5RUMIuX/tMX96W3dDe/onw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h6jts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5d58d226cso49049491cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757679044; x=1758283844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NnyrkzB4u18LRqNkoWf0ndPRZH6XykQ2rOusGiQJecA=;
 b=TuTn3H8Hhd/8Hl4MVtGqgSSct+UJgZW5xhqksbUgjprJHlW7cELUQ+VdUPa8qGEW5O
 vFpx4PUNqudkC8gTqTUUoC0FCbU+Cf5npBMrpEb7Q7JFT2vOcWooFGWWU+pT3/eOadqY
 2cpCMdXeeybv936+4E3IXWVet+nMuXUKpmlFcyTreWyb4FYNy2MynxHoU7+gGeMe7/ms
 aOwrzEqzNw1oNKPeIkFAPBoaMz1UgUCZ13MwSc1V3pfenuV+Cr9VEm4WRwayOS3+xoeh
 Gyn2Vtuwq2AakT0fgXNo1+94B/0F3qht302uOi3vvhulrV9y16ucISeM7FwE6J+hwH4H
 Gbgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoEX8E8lMyedP6JYzzHMFS78ohtsrOyE1mBRiNKCH1MO0vUCr+z+X5OHozIV4ByfJega9RR1K+z+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr7AtEsL+3iqxVQdICvl5SfOdv8urA1OUtER8/IzT9A/9PE8Lk
 4dO/PP0k1VEETbTyfgS9sQKgn3cpnd5hvd8xzDLanezwl5zkmNC8MPD6d9bcpKmc3skKerWZgI7
 ppVljmyFUxeyG5WsqMLyXbSfdZQ88jGANqgKH2GEeTk4uHP2QqXsDIkOAiu4S0B02RwbwKR0=
X-Gm-Gg: ASbGncujOYqGHdzCraCPxSZSooAg4gVmf4MudwoVHgm2Gw9G2ppgKb140ywvMBuEVgl
 tPYit+7Q6M9JNOJcQa4ibKKFLJC3nAXKzwzKppSVMWhPgJZrn3G1w6ku/gH4jXkvAm77Cv2nduX
 deZdOuDYJ5iAoqed9ysyLUWmx3OLs47YJBmdeYoEGRqMU2Q7SEL6r9n3G0Z3tw7C3HWnZxmceRY
 jGNJQHhv+A1Xh/pGcMByR08K8oJI6QumTCqg0jwA8A+cxAH/w73duAn5SaaAHlW4pMxGGNADesZ
 NBGd69WIO7cwqgF4re2G0PHVI8ciAsA+mjSssfwx2oZJejlrZ/Hy0uTf30Vhtz4dLF8dsfxOl8c
 bAIywV7C/NQzVsB8dIT0q6tlVepC/RSnKviaAyVqZfAJnKj1wGT03
X-Received: by 2002:a05:622a:a17:b0:4b3:4640:13f3 with SMTP id
 d75a77b69052e-4b77cf98445mr37107061cf.7.1757679043718; 
 Fri, 12 Sep 2025 05:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2hXwtWFU78DBNvsjwVtqD2w0onEhQqn5H+I5mFQLCVEOiGDGwbwcAr1yHapP4m9rqMpxtw==
X-Received: by 2002:a05:622a:a17:b0:4b3:4640:13f3 with SMTP id
 d75a77b69052e-4b77cf98445mr37106281cf.7.1757679043091; 
 Fri, 12 Sep 2025 05:10:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a32f66sm1080568e87.138.2025.09.12.05.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:10:42 -0700 (PDT)
Date: Fri, 12 Sep 2025 15:10:40 +0300
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
Message-ID: <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OheUVflSPL0XS_qaLszEGpoiZqQU2EKB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfXwtDeBQtTVbdY
 S29BZD1ERTJbBEBv5yRHxsvPJcp6uE/05JqWhSi3M5jACFcTXYNf2XXyrpBojqwykzmtsD36d1W
 kQ9AvJH6lMsZoTqvnfMvH4mzbXu6fA34+IOY7l1k9h5HPBg3bKOL6xDwcUW+C22z2oMqF8aZagK
 qNsT0QCuWgBJYHCTJkJdRjjCkpw6imOQIZTh6JtpF3uVnDchO/XgJFpNu7obdS6q5ajLfI7lslO
 Qy8wncA0Kh9Of30KKKYtC2f3tTvcAWKorUNb9epNC0DZDLsqTSF1aaS1O8/eUVGalRnNl9nhaST
 nP0GXQElTYU/RjUx45yXX7qIX4/hn45GjC2Ed5TL81IuunfLy2918EezO/HHxhFc2qYCaPZ8IW0
 bOgc36W3
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c40dc5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AUIyt3r8poIyOMLCWoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: OheUVflSPL0XS_qaLszEGpoiZqQU2EKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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

On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
> >> Add DisplayPort controller for Qualcomm SM6150 SoC.
> >> SM6150 shares the same configuration as SM8350, its hardware capabilities
> >> differ about HBR3. Explicitly listing it ensures clarity and avoids
> >> potential issues if SM8350 support evolves in the future.
> > The controller is exactly the same as the one present on SM8150. HBR3 is
> > a property of the PHY.
> 
> 
> Ok, will update commit msg.

Please red my response again. What does it says to you wrt bindings?


-- 
With best wishes
Dmitry
