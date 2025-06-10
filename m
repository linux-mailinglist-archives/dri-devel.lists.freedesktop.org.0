Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3DAD3889
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB2710E54F;
	Tue, 10 Jun 2025 13:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qx0NUSpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAF610E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:14:40 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8Yplh007717
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=g6IwQRxCUScwxoqS0e4XHRFL
 lV7pUybK/kFVnN3gEOo=; b=Qx0NUSpLbFRnnJwDivnuJ8s4sTgo/boEDUuXyXQO
 Hi3V1oGCKilWewi9Kvax9DwsZZrjE/iDYqJokwD8VleptqpE8QTEeJAMJa7qiwNO
 TAoL83Y08TAcNzd7J8zkiSHVT5PD2oWVUpFK0uF09lldeLvhVdab1RqQn5M87ASE
 T4gxcUO4jZ1lORlFqVaJDBPpkiGYFLSIvKwQjte9AZ4/rctHDy/JwvBuCNBfoic4
 IoBMBOeFPainOeALttPyrefHeGXPcwAe/N7ekcfS7VxFb1WAyGc69bG1KLlVmZaJ
 kRGzGhbIme2+B1E6KVlmNYC0trNKTGBx7ZuW0iSenhvonA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekps894-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:14:39 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-739f707258dso361080a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561278; x=1750166078;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g6IwQRxCUScwxoqS0e4XHRFLlV7pUybK/kFVnN3gEOo=;
 b=MCk8cc14AbpsxjpQ3Fv27SHpiBenghuhCMKlfRgSD/Z/mZAmx5MYXlHMOCUWonfF4A
 hRJbT7PV0G3JyEcZh9K1+R05VDV0Ybdup+XafakXJiqnRkRySfsvnWW3dsLJlrqeUU+8
 nqQmL+yogxMXyxzQcF0N72p4jyldfLCwcl4Lwjzir31PjxbrTTeLj47OBXMHRRQdzfL5
 H0KXHmpiKEEA8KFkeP4mBNZW7mFkrr9UBjYyXZeFurQbzsDzQsGeRcXI4bFDpN8OV4Mi
 f0QssI00/xatq5puFvuR1pgz7/XnQK60fvbGFDGv1wOEURr82eqRRNBX24T7WQ3+/EkC
 ZM+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa+vAPBCYOqCMb9nwIX2ykzKu+W6HW+NU7lyIojYnnLMfxcELyS1fEKtLwLzp49NyvNsinFbWI79U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKakQQqyzeHHJEgRvs4TIQblvMtkfJ/Hi7sQRiY+3uT7tokndh
 jZLrEV/wi6URXuJsNNCXcKWqHvw3N55mzNNmo/ccMfP7FXOPiDO21Az7WPe4iLYZaQtuBbP3Y8r
 L0aMG/pJUZpPrqhLrstbJzAELx3KVp2RlJG067FMObPUG+DBdYlKHK0niDBsFQn+ucFQY4NtDoN
 llYHg=
X-Gm-Gg: ASbGncunk3EVzQXlu7gFsLEvgQtzTVHMzq2TKwLu1xM65oG0YP/FmgAvY6RENfUv0kn
 JUwuGv4yYN49glX56Yi9BtB7YMhM+fOvhYn17lY4ttCCl/gJpafdRF6BeRg8+eVOJtoeuyjLlq4
 lJD8SOTXhw0o4xAVLca2iTJJJ2kEfRhwyBKaxe2IpRAEYj2KzCRN6oZUn/1w90nlUlGz/2VI43H
 Jca+vS7eeyrNJuv77RW54oVwFzSTox0eSpBxdBDSxEWS05Pz4XRr2ywcc87m/SiW4uiEVHhLq+y
 gexE8d7ISXPmdTV3jJeYvLDZaS6eMJD3gv4uyUJf+4gIY+fvaVpzhIYTJ+28wFJiz1Vt3igSkjt
 06CQ1ZQ59Nw0Ju6Xz6tb6toer24c+dgaER3Y=
X-Received: by 2002:a05:6830:6c10:b0:72b:a3f3:deb6 with SMTP id
 46e09a7af769-73888da0fa6mr9517710a34.4.1749561277571; 
 Tue, 10 Jun 2025 06:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYQC8rt3kTrusAsNuIp+4RWIrv68jhYVstYuYleyxm6ZO9onHgFJwUJlqd4EmrytlbgstvxQ==
X-Received: by 2002:a05:620a:28d4:b0:7ca:f37a:2b4e with SMTP id
 af79cd13be357-7d22987fcffmr2356233685a.23.1749561265466; 
 Tue, 10 Jun 2025 06:14:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a3basm1520440e87.155.2025.06.10.06.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:14:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:14:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
Message-ID: <skvwhicmdzewywoxm2bims4e6geandodztd6apmrolzqpzcibo@fqnjrs5shp3r>
References: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68482fbf cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HWQ8LJbAKwhtnRb1DegA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNCBTYWx0ZWRfX0eaL8wxMnuiv
 /pOT93c33FHfPH+sC4a+UErEjEKSB4+aEi9PRmzKRAjfkclqdOIvtzE1WYIxQiNElS6OTtelko+
 A00kL6xlGrKjpY8M74JB9Q3pYm8i79VbJycmZ7Kno3cbcOIGWh819sfg8VvCN5XiyilvHCOS0s1
 3twiw8YPhj3sqs2CbxfkxB+9Kd+fmM52f6GWJzs5w0EM4f++w/7uptyNlEEvV03y8N+qOWjJhBX
 HEAlBihVdFkFpx773KfKhecUA3HYKW8a7DZU6TqEdQtuos7TdHxYe38uCaXqN1itHMTL+hLRylO
 JI+KkB2V+yqJIWp/kO6pSNRc6kVOwJIRagIHDBvEcjeZyNmPtTOn7KxPRKPyaWBMK8I3Ho29DpQ
 jGr2V4pfBOXkVvvLRYrkBep7S3YJOh295m131f5eEeg6D11ILEQSsyn3T5aGUHSXDwg/o6nF
X-Proofpoint-GUID: EVuOshI3Qpc_Eu8158NoDeRdrFsb4yTk
X-Proofpoint-ORIG-GUID: EVuOshI3Qpc_Eu8158NoDeRdrFsb4yTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=854 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100104
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

On Tue, Jun 10, 2025 at 02:50:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Based on the downstream release, predictably same value as for SM8150.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +

Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  1 file changed, 1 insertion(+)

-- 
With best wishes
Dmitry
