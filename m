Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19D1AB136D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 14:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC1E10EA2E;
	Fri,  9 May 2025 12:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD0l2v+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4A810EA2E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 12:31:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549CDnkT002235
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 12:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EbH4xkJ037sHmWJTr5Z6OLwNV9LiRqfb5T0r82ilyRo=; b=TD0l2v+hKdxbfgVb
 /RivV6WcujA3/LpI/T7ypy1YKytqRt6KRVq91exRPZb9sOjot68avQj+C/akVD97
 uenXZvm+8eiehYGhK7YvMmKup1HZokDrZBUNlLIRyXJ/g8IZndTfsKkZfMitrvp6
 5I3luqaXB+BAyWydhTVZhwHlUfNysY281JQHmTP4jWCaWEafW/+tWJPB7l8kF/0f
 WeFE+zM23dpTujtVKqSI8wA0PT8y4+a9mo4YcGfqfLS59ETmiHDFggq7ObqkcMHT
 2vgH1Ke09XA30aMtDDH3o7I+3H1MqjYPNqNrCelpR/Zsw+nFTA7X51y6NF/Tfg9P
 gGMjjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cm18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 12:31:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-48f812db91aso5218951cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 05:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746793898; x=1747398698;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbH4xkJ037sHmWJTr5Z6OLwNV9LiRqfb5T0r82ilyRo=;
 b=XsGALDnZTu02Zw4Gw2o5Lwj9N7nqyPtJQ0YJDao+aA6Yx6PGUo6hwGkL4zYiHScyKE
 Mu+aZp8Epx/mTLyM3XxezaMoFU6ynCjtys74HccqZTL6VauSnjknBiWS1gAkIHPyUdRI
 F/DJfKaqRlhWOaht1odnmXmp6LcR4FNR9J6fAxp2M5E1YdMruErm0BtaGhlZnJTiug6F
 GyxBRQ5hLGn/PWznVf3qv7/ujKA75TZK6TJBjCup+tDwAHgoi7BoKc5sqajdSSziz4Iw
 VOa5trE8y238RNNiy+SzFk+yS2DinfQJAMmgV6zi/YK6lPFWarTq68qHmt8AXfEGwvGR
 QHOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0fNrj6snpRM1dEyC3kjr3cCxtEtpWhqCOySbh/eGIjib/+ypMi/jgZxwSkM8lYuYr6m7sU+r8gfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/2xIfTUV0Q0Yhfz0kXU1fkQZRuiAGaFq6Fgy9oP84NjkFmz3t
 t1l/a95JEzpYEE0gfL8SbUrhDkcBi47qQthMDlA8p/RHCgGxeFqykoSrRLU4aYPTOb6IvPhur9l
 wGia+Ze2X98N2jenQMfUE043EhC9B2fX9zdFsd6Xva9mKu2W6ceO5fKSaFSvuCGoHm9w=
X-Gm-Gg: ASbGncu734CFKeP7QC8uOcpzty+x4siqxzDRE75NcT6hTW4HD2QgC2kH2nkTs5you+1
 xEHTPlsdEAOxGjChmMY3IzM9QQo31Z6ZB8m8bl7PZGFjXyN71Y8/J75d59fRnUDROovppZJ4Bsh
 3KrClIYUWvz6J8rJ1k5wltrz6Pnt+EozLWah8MPxRUvbHLrHMV0PiwLwPCvrRs2J2vP2nbGzx0Z
 hFbZbc6iEO3ARtaf/pRzQOrXAzKDsXfjg84ipsCe7MO6l8nw+AIwkgrUhpFC8rQC1ESMJA1+z5e
 o8M37qbK6DcWgvb7PegP/hJ4stDJ4IlwbE9SKitvYPWD7Fe5qcfwc5pg68iqsJxh5cs=
X-Received: by 2002:a05:622a:15d1:b0:47a:ecc3:296c with SMTP id
 d75a77b69052e-49452621f26mr19121161cf.0.1746793898386; 
 Fri, 09 May 2025 05:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdKIea1lSY3D/Rfo8iAPuqf50b+VB1CNMxYngayS0dUO+pp0Ywod1/ouLGCtIY6ZrJN13yJQ==
X-Received: by 2002:a05:622a:15d1:b0:47a:ecc3:296c with SMTP id
 d75a77b69052e-49452621f26mr19120871cf.0.1746793897859; 
 Fri, 09 May 2025 05:31:37 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21985b026sm142384566b.177.2025.05.09.05.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:31:37 -0700 (PDT)
Message-ID: <2cb9a1f1-7283-419c-937e-5eecbe65f982@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681df5b0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RZUx41kZHZKgpNmG730A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: MEVBNhN0cK2MyB9I3fYnIWY__29FdU8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMiBTYWx0ZWRfX5+o7jkd1gMBG
 WZ6UkVMXIoVknYthAb11+wWvu9u/hmuSnaRYbtecxvaKwUV/nJOP5zBzaha18KWD+gpR+Q0bRim
 j/zI0G15zaVxaMFfIQJjoJlNPNMTjGiHFfeOEEqnbVTg8DgufVYIHD9kUep43pFIUAk+2tMTFsI
 UCWcM2q3L2RvO/lLkdh9anb84czJDvOSpkka2eP+yC3WeZB27daf7lTrteAR1/kZ6vD0euyd3dE
 QPzcFRTZi7a7C7hdswiLeoizSbd1XL2IuxKgLZSR3trItBnqclAHNqQYbHMC79PG6ZKjghzDVr+
 2ImE7rC7XTEqWHhSBrGeKdC0HUPFfxlg7lhA/ttbucKrrnN/sM29q8G0GWUfJZF4mzn4YA8EVWR
 55Q+1dSkiGhQRZV/zws2pr9J1OC0ABKG9ZLPrCptxVJVewXcmxnwKzvDF5n7g8CZeUgz0DYJ
X-Proofpoint-ORIG-GUID: MEVBNhN0cK2MyB9I3fYnIWY__29FdU8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=896 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090122
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

On 5/8/25 9:16 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
>> as a separate field.
> 
> For these sorts of things, it's probably best to add a helper to the
> common ubwc config header. Other blocks also have bits for enabling
> AMSBC and similar things that also need to be set based on the UBWC
> version.

Good idea

Konrad
