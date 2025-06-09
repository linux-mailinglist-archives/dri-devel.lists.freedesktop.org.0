Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4BCAD2629
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 20:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416D310E430;
	Mon,  9 Jun 2025 18:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeQjhE0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7441C10E433
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 18:54:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55996cT3014709
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 18:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0Q7j6JWLfPAIL0zTecYfobk0
 dPt4Avr6FVotIxI6daM=; b=BeQjhE0bIDAzAZ9450ceDp5t5AFtsbnnpPL7K7lD
 lY7CXnC9+u/2cJLe2hAP05S9UhNYODDnkThUmBkNaoIZ3sBlwRVQi38IRBp2NUkE
 O+7hmUk5zqhQKIse4m9cOW3SBO7NBC5UjKavLOVSPgWR7gAn+j5r8vPwPO++mE52
 qYCHiJhLo0XwKfxag3OJoBbvqSKDu+6VPk7fhpAAKZJPGlFcSMidTsCuVEl5m3J0
 0I5E413QGPINSfDzmJS2Ul2N6NKVimM+to4dwxiA9GxtZ4qhg1sidqquRit7eOW9
 94CIR7AyRK1ng/FgbdeaFZbI/d8GwueuUxKIMOYAALhr/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn66w23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 18:54:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d0981315c8so472542385a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 11:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749495283; x=1750100083;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Q7j6JWLfPAIL0zTecYfobk0dPt4Avr6FVotIxI6daM=;
 b=Z8NEgXebu6RVsViHvyeAsI3lkVmUuK/SRhQ5y2gh3lZU3qmqXKfJqAG4NnaTDEFBmC
 yhOPjg6IDxbSrMUpE9edL9XbuurGo0Y4POo/NZbxBiqiNMe4Hybx11QpMnli+gretJK9
 1W5uWsKLRWdTK/akJzGkFvvlIJHJ9Cxxx0TBOwvpt+8XXGFaJN9lcyaJd/xhMO0K0lW3
 Ja0s5I2u8zcp4am6z51yPnIpQKurW7QbE/IHbaVl3cK9PIy7GAoBMtNunSTBpeH61tNm
 3zTaYzE66R/Z5aEK0YwHCIv1/95FRPp/YLw04fIgnaaoi6VrhzF7KR9rH4ndm6YI3m1i
 dxoA==
X-Gm-Message-State: AOJu0Yy9s6AMfJln6+NkOYzguTMmNDMP94Uxfkt2JZJHWAYNA94EeRjm
 Kuph7MtZ7fH64qMvheRFhieBM4aTd+pPEEubFPnPjwh/LX61pJgRhpja1MPBWo9oimxbPMZAL4N
 X6l6SJEOcJbGT4rYIYOvbPWNB5Z9gJGa0kvUVwOTYSwOt+yC7ZXJH6KtCInoOhUnKoaZY3rQ=
X-Gm-Gg: ASbGnctMwOO73bbh4NjrM42+T1M7BRPdWVCi+aRmk/+zMsRanD5gGFQ5xAOGsz5ni+b
 NrcLm70z+oFRn3SFCyMupKKO1Zg7U+AGqwZEA5mL0vSXpihRIxl9QEYELVrQEHEg3ocLjGHrnCs
 EM8yuUfbPrr62YNbTBdYK5Vk3B+EPxdUarr1Yvac4cUF0RY0vCjY7DeujeckRJOjx6/n+Hde4zX
 +j/l7mWdGD5ipoUZfFx3GDOpUfVWEaKJkbD/TVxsB1xMGrG7DGNaf/z+JhL9JjgEuq8wStqG56V
 oqIw6lWxw9QQj/zCHnhFUnxmcPDG47uUCv9//fOZlxjFg0OsueG1rQTuAKmUf0Yy0zMpEfY9iBE
 PGzMZRpZjyg==
X-Received: by 2002:a05:620a:2a10:b0:7d0:a0af:1ec0 with SMTP id
 af79cd13be357-7d22995c589mr1782744185a.14.1749495282640; 
 Mon, 09 Jun 2025 11:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyj0Zi9Wm7AlJmus5lOeyDznWCCczyVFTC/lx3IzF8V10z6/pDpyYpLgHsXKeVB0xoCMPtOw==
X-Received: by 2002:a05:620a:2a10:b0:7d0:a0af:1ec0 with SMTP id
 af79cd13be357-7d22995c589mr1782742085a.14.1749495282327; 
 Mon, 09 Jun 2025 11:54:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772ab63sm1293535e87.178.2025.06.09.11.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:54:41 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Message-ID: <hv5zpb66oynxm4ge5ugvtgfqkwukxjazcsutn6phi4ll4lpuvu@r3t4dti5pfri>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfXwkqAPh1XmaTq
 4ZjH61F6Wk7BFTPq53dYMMtKKRFiu0T4/fl0+fa3k48Ez3K3mCtY2Fu3gTQj7lLifEX5OUphVUs
 dJlqmNY9f6HoaxkOPjg4dsRNIfdov0O16sg//VY701qh6keaDGUWeig+GVV0aOHlAqiIskJfQDJ
 ogdr//ae37UrJFJX+q3cRnM7uVvtLDOAw7E9MkIJtPkyQEFNb3JQaL1UO8nb4sMIWljT8HylC38
 BzQo+3mKXshRMNJDKVA/InPakJAcE/Prmcel7vFvIbJuwjo+M06yt11CdE0WdjgLwUJ8Pz7atNM
 u7rQkSWNsrDjVxidobswGXIATLuwa5H0AWguKHQt11Ij2aMf57I6ABb3OffF2KJUyUEQkl1MkMv
 eJVOd4BAyUtWnMaYRe1en0wg6P4OTo8mE/popsbfjf986eYePVB4SoYrEEodC0unQyNrCxer
X-Proofpoint-GUID: kWtGhq0y2vYOvzP9k7OR0aT4lXLBS7_N
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68472df4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kWtGhq0y2vYOvzP9k7OR0aT4lXLBS7_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=815 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090144
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

On Mon, Jun 09, 2025 at 11:24:36AM -0700, Rob Clark wrote:
> We are going to want to re-use this before the component is bound, when
> we don't yet have the device pointer (but we do have the of node).
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
