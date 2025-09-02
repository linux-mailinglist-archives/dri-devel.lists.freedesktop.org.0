Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF7B401C5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181F510E6D7;
	Tue,  2 Sep 2025 13:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVk0WkuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4FB10E6D7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:02:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BC8qR012365
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 13:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DI3pErojxmIjWUczxGnCciKc
 RSBlU9zv3W60qXm0b74=; b=oVk0WkuS9zYpad0XHNNdHabJFeXiPvZUPFdKCJO6
 HMdDXTUACzAEeFOb8gY0swD57tVFGIuhD6oKhMewG4dZB3ImivQ4Ha26EEwrl6AC
 590Zo/KrpPYQBQUc/3Q2ZYrVXCxpHawyi8QepRySbRTKeyp4AHX2bxGHnYAHA+jn
 4kru5a3dBtY97MJ967fzFVD+uWkS4kCjgFIc9IP4/wGMjGypufD4sRaXohBd9wa2
 to2ujfqfFyZb9cwEqcHJApvcd9YrFnBb3Bp41Rs5kqxWi14XHCxB4C+gPlHrHmfp
 EiWbz/xvTDhZkn6oyKOROSjFfXzDTCM08i7Rw8O8UigtjA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ffr55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:02:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-77267239591so1860788b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 06:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756818125; x=1757422925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DI3pErojxmIjWUczxGnCciKcRSBlU9zv3W60qXm0b74=;
 b=FqCTlT/Hj2+GiEXsQritBAGWcDudZOLOmjI2+/lTPbXNs3GvbtbpU3EzcF76KR9n6M
 kkuiFJjtqNVPFxlxg6N9mh1fYgcmMUruyaGzpSmLPR8pRQ+eDT/LEtSwvBo5ErV5d7iq
 nXQv302WMtNqq4X7YSEWy5lVH93KQrfqP7FJkDhd2tpW1p9AX2TtWjIKDxTh54z5MyWH
 O4yPKYT8ys931Dvjd7bzgcePTyrs92t92F4XZbjlVMF4AKISHCDHl7CBWTRViFnvNuAe
 4hZTFjLnawbmsfoMARzX2n9rtVe1+YiRIQBtzjWnlJiAcAkqgK9h/ziD6TyW0OObIs1d
 NIew==
X-Forwarded-Encrypted: i=1;
 AJvYcCViCvgdAuLyj5UXUCVZiIhtUa12OrmT1JgRu09QY7AqlkoSNSPogUd/qDRBw014tGvMgsXIjmGeoPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUNCyyUVVjBLT5F0jdnduD1fFHaexklEygGqRO3wsTiFrelvsi
 w6ChdmLQX3sLd4fKhLmBotnniqbRrzf/kQ7CK8WkcFE1LALuutSjgss2xtVY/0oieJFLYtiTUHF
 uL5/gcmw5bSDmfEGFQVFBSvYZhE9zykyUq780sy1h7bNGupM+WYAqlCZhTN7BKRMwy802Vrs=
X-Gm-Gg: ASbGncslBS3HdE6EnHt5gJo3uN6UxYQLx/C+NjsXriYNxh8TFiFkdSzL7zn4YIrj5t+
 RfbOADNZ04irIaLIPZKPnRFffZ99E1xAL6Z359JxgulfbqWMd7bnRU77Aolxm4iO4NzEPcFUrIu
 ICTdEkVYcgBH7F8gW6RZJZ6R+fItDfSe3u1GFHWE6hAxdR9O18JyidT7MVSdsek1zSOj79J2G9D
 gXw2yKeu7cHESV5gBJ83l0QAVz2s9UM4hJKRSMj0nC1snWEnppCdUUBrwLFgJmKG9dAiJYbVofy
 57P1+9EsLCPolcqWQj2jp1jm7P7K/ZSArQ5pbIyF8lBV8loJVUklGB38wSmxP5AxRtKaphG5+AA
 vH5WMjYP/a1Bg5Ap9udcvfoIrmc0++WvLIsjejjnkgufWrvi93AkZ
X-Received: by 2002:a05:6a20:2446:b0:23d:d9dd:8e4f with SMTP id
 adf61e73a8af0-243d6f02e27mr13224710637.28.1756818125026; 
 Tue, 02 Sep 2025 06:02:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr2WgYJlX68yywgyWjPUXsRjYvXEYtyzFO9iJAKUUUIjy9ijeStIweH2qG+cpUesIk7rFkhA==
X-Received: by 2002:a05:6a20:2446:b0:23d:d9dd:8e4f with SMTP id
 adf61e73a8af0-243d6f02e27mr13224650637.28.1756818124529; 
 Tue, 02 Sep 2025 06:02:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827901eesm672660e87.78.2025.09.02.06.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 06:02:03 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:02:01 +0300
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
Message-ID: <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
 <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX43IrBWJIn22V
 c05ctwZ+SXYfRRS9pu2AvF6ihb3Sw1VmLXH1V9O7tiqekuPhW+hX8bI+piLNipto1hj0qswgVl8
 AkxLuqKVCVETloNI3xTXLoGBR71+Dt072rcutUKrWJoDAD8rN1nac4830ToPZ6CsWPMSbtKwYck
 OzQ0RarWcI0ajK5IbbDLwV4Wq0dxZozInENOQtKnyFoPN8CKK9Qm7m8FEamKnsDsBmHZzAJKvZ2
 trPquvxeNZiNi2Rv8eDfJEyeM0QEIoAIK0wB2OHJsNrs7ZqDRylPWzTNR3e9zBcteeLhjLi/Jl/
 fKoZcPKlQGCX58wQYhYM8K5qgs/UMeTQY6zLsRGDtkvhWuZniX2WaC0KnOL1xGXBa9qZ4zgaLLt
 0TFctRBV
X-Proofpoint-ORIG-GUID: sztzWUEtmPMPdDxdBb_BtFSd9cxCGtBt
X-Proofpoint-GUID: sztzWUEtmPMPdDxdBb_BtFSd9cxCGtBt
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b6eace cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=PxnZWOFFpC0IAZjruz4A:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

On Tue, Sep 02, 2025 at 02:30:48PM +0200, Konrad Dybcio wrote:
> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> > During bringup of a new GPU support, it is convenient to have knob to
> > quickly disable GPU, but keep the display support. This helps to
> > fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
> > modparam to support this.
> 
> I'm not entirely opposed, but slapping a // in front of the compatible
> in the dt works just as well

Which requires rebuilding and reprovisioning

> 
> Konrad

-- 
With best wishes
Dmitry
