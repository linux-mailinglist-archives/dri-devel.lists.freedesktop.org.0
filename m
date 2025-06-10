Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B89AD359A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C8010E057;
	Tue, 10 Jun 2025 12:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="amO1V1gH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF5D10E517
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:07:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8lfXc017676
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fat5e0IB0SoYGIG/MkkVnFLpug9hfHZGf2qLnhATUsk=; b=amO1V1gH7PFHuoCg
 PIy261N1nNVAI06xgD6lL904AfXn2z8t98itSVilp3ZUAcLgd+4U8iBsvUWUWTRw
 vFrrq7Xs8k/p35IInSLr95jGmMqV8tLhlsy1pc9s+QlxlkoEU8R1TJyDyoypjKys
 N4WkjSoRjTEY1x939wiq7MmqoRTL1dd6Oq7vHLHmtt/N/rAy7vz+Tnp9CghF/sdI
 EAnLr+NYis2DZRmUTF8/vIWX70DYgdeO3YCv7R23Xr0ztmpXhXGDCEcrnDieeqlP
 LFzyqaigIeJMVVl/A+LCO/Onz4YieDZQp+fXgWSjnsCz91e0AbGd9JdtVTRwaDPc
 NM5Xxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcj3fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:07:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d21080c26fso103634685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557277; x=1750162077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fat5e0IB0SoYGIG/MkkVnFLpug9hfHZGf2qLnhATUsk=;
 b=Vo1SXENdDbJ/fRNlinGhnIly99Zuv9HyDBiWtSKMN287ftNcQQaKX1Ec5NT2IefLze
 +6WcdVzhjUuLHdTBYtEnGO0O4Zr4noqNsYRMQDwOux922V/HIWdXJlsaA6V6XQlOX2jd
 boJ3ZMjdKxUIgQ1EE5tpmOmXj0naDLDGbv62TAOvOTeC65rfQKkJVRN1aUkZyuZPrwLc
 6+1wY5OFiufJJXqlAIJOH8Y2Lpf9wGz87IMU5YVSHdz3rKQ0JCxhbTFCwH+D12fJKS6W
 3Cv3dgrLh1bQ9pWsJLUH0lHc86zVSxYUyGnJkAA13oaFhyq17yy+FdgkyBnIxGchsOGx
 SiWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQyVbqPOs3BL1pGdvvMCw/JuXXCiVRa7pa1oBvV1pojeuWCdvsf/23sqPpgeUM+6gr5g/vtwYMuQY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbepDLE6D7+8YA5JIH3EK94HMVu9832PbPc20GApswIy8jb2hs
 XPhL3Cpbot447gWtcTBEt/hbQFGGp7LNs8FYgJXsbY7j4AjlH8vp5WmCj7qeahACKgyMm8xyqJJ
 klm8+M+yEgFrV6RTNBTvLbr+hWKku/gJMncBObJskIUZw5hX7oIi0tqvNjRjl66tVtpC9nQI=
X-Gm-Gg: ASbGncvU2NyhHqAJ6Ox8yK94lkxJiLktxZJmZxTWsuSGC/gib3fvwf6nwAV96zqtgjc
 xxVpfqPJCJ75EFrWK98lFVTWsKuclAxh+lNn53GJVSNYxliqS3PPjd694EYDuHuzGKFG9AiLrkH
 uMaepOOzq4Qy1pg8ea9OJfIrpdP1SUoPqXHN8LESANgRFDJ48JHQipV4xSAx0OL97YCsa3PKDtO
 zYISDBaiQNaJa6LI6fMt/DKCYJ5Jp7FS2U7fKZoLGbKv6/aW27JY9YAdOnwCByB6k2dNp7DU6CX
 pjEEBzb+PvBJV4zMSoFRh2gBFoVDHP6oAwi0B+/0vULzYWDYg5ExfY/ZCO0eGofXRRaWd5pUVmm
 T
X-Received: by 2002:a05:620a:27c6:b0:7c7:9d87:9e2 with SMTP id
 af79cd13be357-7d2299a7832mr858807385a.12.1749557276908; 
 Tue, 10 Jun 2025 05:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj+6dwkCJ6DlfdzxdyTh4b2DegATq5bsF0PNFjB/y/RVLucqtJq25z1WxISrL3LqrFBiMsyA==
X-Received: by 2002:a05:620a:27c6:b0:7c7:9d87:9e2 with SMTP id
 af79cd13be357-7d2299a7832mr858805285a.12.1749557276405; 
 Tue, 10 Jun 2025 05:07:56 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1db55ccdsm704778066b.44.2025.06.10.05.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:07:55 -0700 (PDT)
Message-ID: <c404b9e7-c942-4e3f-8dc6-f834f84b3160@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848201d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=X8FaSnKV0AetLU2DVmwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: aAN2g4XGPNe4sDqt9vdNehxnkNnZ0DDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NCBTYWx0ZWRfX/PvYrWbmGeyZ
 fFhOxBd+MBrtBTr+Ri+d/gKdmAk24IL5WT0ZfMVskdCi+sP4B390Fq8GAsKkd5v9Vor5ywqFJxv
 57c0Vm9o8YAoY2ps/I5AFehbuZJZxfs+w9oJRJHde44p373s8rr+LMLEPrih6bgoWFHMrVaDbYr
 yD9qcn8H/YQtH3aBK1DlXxQzVUcUJagvGoiVHBKGq+iwGm4TEmPVJr96AKNpBKZQx+1m3IQDOOL
 hTb7NOinoE4WzZnH3H1xmc8sQtg7lz7BHIGN80vYxzG3ec5IdVKLSjJmR3BjA+59SkydnyJZYZE
 k/DrKzSKaoiTIc0GtA02PUZtFcDA7sWA8TkuxsJXLTh3su8Xqzg/DKKUJhALWgQ2+f5zx+CTp6W
 /nyEcjUvjgbFef6bW9YyToFOojpBatdu8uwsz29clsHvQ3L3dC1YeCiWVSkMtsmP2ES99To+
X-Proofpoint-GUID: aAN2g4XGPNe4sDqt9vdNehxnkNnZ0DDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=849 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100094
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

On 6/9/25 8:24 PM, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
