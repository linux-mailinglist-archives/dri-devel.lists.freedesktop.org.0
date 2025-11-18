Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8EC68B64
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 11:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E26110E479;
	Tue, 18 Nov 2025 10:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzmP8zWb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gr7/z8E3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E75610E47A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:09:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI3BijD375650
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=; b=GzmP8zWb6LZ+TQYq
 2YlKVJKFLi6qZA9tSJfMbgKW3CE5waFIrbAsCTuu6eIScK00r33Pv233EF/Fk8Ay
 w3qTpZ+PkhXLgVtpU6kaRSZbgRJs/kylg8B5HejSwP6W2hBmhk7Hc1vKrJGZQ0Id
 7yXn2grV5te3qPGf2XFw9jSu4XSAZzgAM83S8WeMQj2U7KeJf7+wgnD3oNKmVfcc
 dlWxyJR64rI+CPrnwT4JtkHTrGClgLj2RxUo8dRBvqeXYHnaXTJDBWAhx8ePvJMd
 nJEwc3QXWs+JFonu7sDhJCo8sQHNr2bDRmiugJV9b8Qziw0tETjFFGNfXcx3lzch
 5d+unw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njrcn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:09:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee23b6b6fdso7308041cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 02:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763460583; x=1764065383;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=;
 b=gr7/z8E3u8t/eTKiAmoxN/Nct6mPemEHdaICUnXQSNhJ78CTahAmEWGv+wuJUUUX9L
 CFui3j6Y1WgiimoxOGkzmrCbOgvzUPasLHDEkwNCQ62GWuNpapd5dHNTqBqRDVx1jhat
 VZW+EjPLuYp5huLgDSkaBfN3wO10AMuAhZenKHzaitGBw/bXrNabyreZuktQuZStYizS
 6buk7aLIDvv+q62y83lxC0IbZi2pAP00qP+Gkc5NlAcxipkYJTsivYa5fXNP81d5kEHm
 auH9TUnYNpQY4H8oveqFf11seGeHV8u65yf/eaWsEYZezcuj2DRTeHURZiFspHwP3Bkx
 O19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763460583; x=1764065383;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=;
 b=Jg7HACaQpNekTAIjRGz6YUM2szG1u8gi3vb8GMWIbbS042EyvB9ADOzVbmNdzFdy3s
 UNzrbYx+TPcdmRT536aXHcpSyXSmVtzck321FBcPynsCt8J5CR4cHZvDPeLmJ2kJl+wU
 PqyTrKP+idvRlRXmLeznEnRR7FwH8mUaLYNnXn5weVmz15UizOWFk3BEc4BdjqNuu5vv
 FVsJyQxLkJxDLEZl9dFHOQ30/K70JJ6bKj5w8PHS6R+kVVwwF1/aDJW79vJ8dfMtkkdP
 tNoh2ImCZsPHl1gDtgnTHncaO5dncZ/ikTcDFji4xGL+DHJ+RJxQUuNJwpXi7WOFDWFm
 NdFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZdIe8lyoj2zOtzFELWDgz9NJTti0Y65vQ94jJvVZ90MvahRhS8fFPg8nx+DZqUXJfff2WjQQBkec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtVIFo8wApTZJaCBD5UaFwPcUiSHYHSLZmOAc0piCKffltS6zS
 qUdzJWF8FX8ZEKlB01GtirUOgGn3m8WCzBaH+ZQixh4Auwaa4FsF3dGLhqaD/TCSXoH0XXuCNHa
 5VGyVqiJr6u+PxaBpGUPHf86qFWPMJW7vSr3ps4bjSqk0vN/vbR1PjTnM4Ee9WHy2wjyfA2A=
X-Gm-Gg: ASbGnct+OUY/J4pQOLkCV/+eRrnFM3FxFpyjjjqyyXcgME1rhtbp0PjYeSx9AVQyCaA
 nJsOuFJsh7jKQUN3aTVcPTcj47AXKMtSQKTHuaLZE4uk08uC5LAcxs5xaM78yFmO0dJ8OUFi1BO
 +L8lxstnlktaEjrXoL9Xy8P7+xjOWjuIVc7xT1EXq+aoylHe2FtjkD4un9ssuB62KBqJMYZpjeg
 P0MKVNjfDn0fiLmVRqOcc+LSFYCjfNom4BCh+LWAPQIbWOcRwIkctdNDYeenEts26JSjCwljkXT
 pwaD+RkEA9gb3CD17lkjhJ7S7EOfGbz0FA/hwKnFvA7kv34KoLKW81ul83QaTGziFIHL+QGYL8J
 Vu6mjCoHds6nWmir7U0u+liEA+iR2qaOWWLPi0mZ5T9GrFVVdTU95LoWRMWmI1DtYzbA=
X-Received: by 2002:a05:622a:10a:b0:4d0:3985:e425 with SMTP id
 d75a77b69052e-4edf2087991mr148537491cf.7.1763460582690; 
 Tue, 18 Nov 2025 02:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN59Q61Eb2CNlYDxQpBWVtF5VFujGxsR5/ckcEtaIq+KMFxkfUpWv8DK6msTFYM50HKOrU6g==
X-Received: by 2002:a05:622a:10a:b0:4d0:3985:e425 with SMTP id
 d75a77b69052e-4edf2087991mr148537121cf.7.1763460582152; 
 Tue, 18 Nov 2025 02:09:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb11d94sm1306025766b.30.2025.11.18.02.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 02:09:41 -0800 (PST)
Message-ID: <0167a373-79e2-49f7-a765-d3a770ff2395@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/22] drm/msm/a6xx: Fix out of bound IO access in
 a6xx_get_gmu_registers
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-1-86eeb8e93fb6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-1-86eeb8e93fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MCBTYWx0ZWRfX756740hjb/85
 TIEmfyiGdHKx9r5oRvLRKSvSPtM3PsvE9h8rBrXHlZmv651oadhTi5XlcfO4SEfzkCDg2y/ZbN9
 GuYNC0ZcrFhuCIbEwtviG7kBdGBhh4qg4mlRdRX7Ipz6uX2+dxsmUd6israxry/jE9VmoTEcL9k
 IG+1pt5/0oOfQOqrVn39Z9xgdiLrPH6JlvL+IeRp7ygPtJm2n5uWGDZM66HMPbqClTkZOAWcTLx
 FZ/CNIb8/vp17+Xnpn5CBVg2ju2p7wWduFQzEcuFY24POGxvFNqJrui9joKZtZM2C7XK4+Ufrpd
 e1HbERZw1d/WaW5650kGZY+yzdyelotoyofjA3DqirLlBkwo8awJ3mRNRzwAW+fgPt6nCrpEfYn
 PueX+LJYIV9ARjhcfmB1fDLo1gO3AA==
X-Proofpoint-GUID: d8cl9C2MIfV_g_yIuAq6Kf0gUbGGZLny
X-Proofpoint-ORIG-GUID: d8cl9C2MIfV_g_yIuAq6Kf0gUbGGZLny
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c45e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MwKg9OkWFYoYUW3DDnkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180080
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

On 11/18/25 9:50 AM, Akhil P Oommen wrote:
> REG_A6XX_GMU_AO_AHB_FENCE_CTRL register falls under GMU's register
> range. So, use gmu_write() routines to write to this register.
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
