Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAFBAED9E8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66A110E3F7;
	Mon, 30 Jun 2025 10:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBMmDasa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC03510E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:34:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DHYa028627
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g/DSsMm2kVm97th9bVbLAFQC3F5AhKTQNEcJC1748oA=; b=BBMmDasa3kkvlduS
 e7tyBDj6a271BzJUI+pMBE2cH3olV3LZbKolDv2l17VWcRmzXTgvxrW+g81jE7x5
 rTiVnRCzQFLYN3hY6stwMh2dzbdjvXzu5Rr4XFrIUPh4DaxQtvpwnCGL7DayGvHa
 nC2ZlU6yE2u6XyxFxvWEtEUE6FjVEQDGaCOQaLorxT556tahwkfdsJqVSP6QKOCT
 hHUflSnBkAnRukLnnABsMSxTyLsLB0O6nRQp+zWU/fOoFSTWHtEmAmstLudl+r+u
 hba8y1lvE56l3Hbf7xLXdQ1pc+EJKCm3T3wDmShPGNKI0utPop46kSfNYmgedKZx
 Bv0gEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvmcnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:34:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d0979e6263so14067485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 03:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751279644; x=1751884444;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g/DSsMm2kVm97th9bVbLAFQC3F5AhKTQNEcJC1748oA=;
 b=BjI4XJ8rzaNhDo5wFYO0/8x1Bafhttk8ZCjy+aklMsszVKpkgnsjrRtwVNrUzHgzqB
 +3p5M0XRBJXxeM6NS9offYkUmoLRDmcgRwxuCaCu6KmLelggxkQ82SIRat1U4Ngx9GOm
 EshO1wOsfhMJiRM7rGG8KAGDBXMsrqbnZ/OLRqiCezv6V9tlh5fjtpY6KV6UCs6BtqpN
 0OGB43QULtnKhwd58keFNHUA6YfU7M5vstBF1cc8YxgiqcMYIt2zJTMdd0qpz9zXCVJx
 CJ6+1xbhfGT9aSeUeAGy9ZHuLLnw/UFGf+TYYMEehgQDCSt3Uu/BYJhNoOtzqiTx4mFk
 c6lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmuzH1xGCGP7SShFzBo9v1WxQQA+aOG/UwfYL1sglGb0ewmM3CWiVVvIA7mBUc0SO7JqlA0KwNGsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywjvcsh6qs1vSPx1hJ18s3NbB8aDMklJIReITafYLAl3Srw4mj2
 zeNQ/Y9HuzEAGvIByBzGRY86TkZSrQhmrEyitPZYl3SrmR7MG2sBuWbqKpuBvCF30q3Ed/cI04L
 DZVBSE49XnOA2+eu+MOlPBoBlNJ6UoFoI+ZFiKpcfz8Ex5ewd1CyvuqnJiPAAk+dtFfb442s=
X-Gm-Gg: ASbGncs1JwPntETRwm4BFxkPowpCtTbtzy+3lwiFrc9JC5LYwkcGx8CnhF/ruUB/Me5
 FMhrPQrMSQMWVL02nVh0j5O42MYh/ZHM6zDd7zeQLmZlQlZBkk0B9MZ9IhhyEsSWzGUVOh8N/qj
 xy/pF6P68jpj4zD6u6SWqkYtDpwxAdxZ6+o2PEERi3MjAlM9axIiqSr8rQyO32EC6mCOOs6lWX2
 y4QD1bLIWHTa54V3keeUxH/HmhauCXfoYcFcXgCfDqvMkYDIsjQdfqCaDmwMRytGiFo2HVVUsOY
 RgSUkE4PYXw2hrVjGJmZStnLsD1jYOGiAVtFW3gk3Eqt4AI4ysfxWRefHcNJlURDA5iRtAnwqoZ
 SQkHKfss5
X-Received: by 2002:a05:620a:a218:b0:7d4:60e5:24f3 with SMTP id
 af79cd13be357-7d460e530abmr63822485a.6.1751279643636; 
 Mon, 30 Jun 2025 03:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF14u67wYVOXU0dwFwQQCwd2FEAqwgbTauB1E2BpJpoGlhPPQaUrdj7uROZsLTFGEwJNwiJMA==
X-Received: by 2002:a05:620a:a218:b0:7d4:60e5:24f3 with SMTP id
 af79cd13be357-7d460e530abmr63820885a.6.1751279643192; 
 Mon, 30 Jun 2025 03:34:03 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl.
 [83.9.29.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c828bb7b9sm5684192a12.15.2025.06.30.03.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 03:34:02 -0700 (PDT)
Message-ID: <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FH4KZhjprw9aEdqS6av-UJXtpAb7jSU6
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6862681d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_tQuiCBsMoVRMLc1B3gA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: FH4KZhjprw9aEdqS6av-UJXtpAb7jSU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4NyBTYWx0ZWRfXw3yln9Rum5S6
 5Q1jTDMk48ed8wx4dySrTRH3kyf39pLQDuiuBHIHXS8wxT5bG4oM/S3hGgEZdBCJuS8NsIBuJHD
 3pfTU3kPHdT7o80ci7VtIc4glNWeqcRebYBsKqPmP3Svy2+fKV9h9SQvUtjcNpZBsit/lZb0FpF
 Lvp3MxqSTmdfZFQNWJLK4lmb4l8cQXqZq4XyRVgGa/HEDgY9h1W7cQKv7QZXgNhSvUi1pfTqDuF
 Dt6nTGf1YZNnEF0bpLEsEaC65wdBr1q4NJP4PcWc8G9ZsNBnSicMJiGI/Dldmu2udqpY57rfZAe
 L9gFilKr7Og2hfHRXHNhd9LvX2IRZScyoNlh61jmmC3uE5yGxvThQRE5xrnL924p0p4aLORGlVL
 /CTygfFIaJuv9VXTOuNj3IxXaXZN9tPWh2rfXUGaGbB3v9dj/ocydFwGrKyLcNvNoCm1J+El
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=828 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300087
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



On 29-Jun-25 15:58, Rob Clark wrote:
> These runners are no more.  So remove the jobs.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Do we have anyone using cheza at all anymore then?

Konrad
