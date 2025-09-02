Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA7B40089
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D7210E6AB;
	Tue,  2 Sep 2025 12:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKf5YVfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9F310E6AB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 12:29:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AoSWJ013626
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 12:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o8P2Gir3O8jPJB6+GGpkTLBfJkGgJFjfvAetbhb186M=; b=ZKf5YVfkfYkeFnga
 BgoXxP+n0VH/aFnIhKWmQnNxY7elH/2xUjNU4YLC8rxpyQxEnZxBvxXbFLi0rWOu
 f3Jkk4jUtFYN+ZIR5dKtAliVyU8CEILJJukAq/hURosDjzlO1adjYKlrZO+MyR83
 oRvR+XRvYshx1AbrnVeBw4o3ux7xxNzr8t3pm+PuzdEtNyHUW4CbffZvDy0XEX0M
 a96OkNufbp/gGHaap9eJNVEWdoQbTSsboWgUqdIe0GMa29delGaXcDSnoxbO2ECV
 x2CbWtokibQKqaXuc6f4xve3+ieUOCtwAhxQXKJJVOs0Ym0H/3C69BhvQ+hJbAdd
 9n/THg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0efw4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 12:29:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b3387c826eso7422401cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 05:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756816188; x=1757420988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o8P2Gir3O8jPJB6+GGpkTLBfJkGgJFjfvAetbhb186M=;
 b=XY5kgJYYI7SWOWTafmTtqmGhuQJQiwYfKxNe2iP6HLNL98RZjI8NBf3+iaILJ5V2Wd
 8/3YlLKpDBO7o+YImp8ZHn28J5vV8oOBaIzpeH9SHe4C8VJ+XPiT9TDnTJEDmkPzhlFJ
 q9eDpFixhzCzoeBj9imO2Dj4GiS+GP4pdHi+ZhMT6oNqnlUgKaO1C3Z63aMYeMnXtMEu
 zK8kiROGNKkSIAsJmzd9+rLuDeO31wGm1vSZ8jHp3CxleVLS3STEXuTPaoWqK/WG+4AH
 7XGtU7GaFB35QJmsCrdKMveclzW6XPjUn9f+M+EOcYgng0CSj1bpWSUUueuEKytrg7H9
 7OIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxKkQqEXWeut4xqO4EIBabOF1iRatoBMqoMECA2Hml6igHyu1WmfI9hHsr+e2jj82rIuk6DV/nGrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN1L7TpYIZ8JKnmBCdxGp4faN452PiF5+f6ViExEEuY1Xt6M/O
 2MRxkn5rlLg+kQhuCavLq/dHOW4WHBLY7KtV3dNwEgMHpBtRLrIid9GDD1UXaRj4Q5I6lCINW4x
 0wX6yaa5DgwNCRLpiQMseO7vytQgkQpVxDdJK3+Cs1+6KvJlLCF2lDbCDZOgStaP7WVSOHGU=
X-Gm-Gg: ASbGncsbmzywTDF4AAhSU/qn0fo23uyDNM6kE6DKH3RY8wEFNctQQgMhQ5qTaDRVyb3
 ehcdD1Q88MRXaRmXQq0PILUwuqEhyCcmWV/DCesNnq6WuMsMCUgcxa3We7Ht9awRkmcLfUTg/P2
 3DH4DO5jiTElfMBHHZQ8nw/XddOyo8VhYODxVF5wUWLV7LNwd6u2QX2VbUg5XS+F0hR0/iV+7Rg
 /UdGlvA93JoYfCSzR8uoTySQ/ctTFKtPXebz1Ba0UkF3dHXHSndRAFvXLK/jPpb6n71zWTATJoH
 lmVJrulnqwvc+8yeLOIZ+nzdn4o0SRr/CFCtkzhJBwmkoDhrXeMLFVEep9d6xgOqh5PaVKd6R6P
 +IrUQDZOdzhKdpRZ8Dbe8kA==
X-Received: by 2002:a05:622a:144b:b0:4b0:8cfa:a507 with SMTP id
 d75a77b69052e-4b313f44a5cmr108395621cf.10.1756816187728; 
 Tue, 02 Sep 2025 05:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsvBp4S9s9oRswfDvkLrbWzaHDxtJFSJQVPWxI8jySZ8itlnPJLwhXxGi8T2KTMsnZUjXbSA==
X-Received: by 2002:a05:622a:144b:b0:4b0:8cfa:a507 with SMTP id
 d75a77b69052e-4b313f44a5cmr108395361cf.10.1756816187173; 
 Tue, 02 Sep 2025 05:29:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7edcsm9627002a12.6.2025.09.02.05.29.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:29:46 -0700 (PDT)
Message-ID: <9df42327-b417-454d-9f4a-608979498f79@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/a6xx: Fix GMU firmware parser
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-2-f3ec9baed513@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-2-f3ec9baed513@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HRz-ryK-HQGh-pV6gCIfgwkledGDd7k2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX4LmDzW3qn9lU
 VtcwfD25804y54D3ZEvSf+x5/MkWrWXVNuUkGq7DIyRt4oApvYIyNrgUDxhUAUj/eeXonoZ9yOa
 dDNLXqg5ZPLyLrhhph2RbNZm13zAIkZvzI1wmV/Tp9W/o/oIruRbFbAawmboAXV1vDS6tM7nCrh
 DIzb2+qNHPbnnBCHxHdJoVjwls21Dyn//+E3Lj2pbNVfl3DtSRrs9JvGW4mFQGWrUNqz+QFVXg1
 pOIJAXVyv6NljDIOCFVdJtTu16KKYJRUUULnV1kQh04BroBgotVcJt1cxupCN7Ckl1AnhbjqwFs
 90S6linbZmXTjRcj2VrS0Y+9JtWDVlWrmXVpypZz47YnPs4fseFk8lLIweWZto75U/6hCeW3AjD
 KOrJjNiL
X-Proofpoint-ORIG-GUID: HRz-ryK-HQGh-pV6gCIfgwkledGDd7k2
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6e33d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B4Uh0k_u2pjkwks94HoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> Current parser logic for GMU firmware assumes a dword aligned payload
> size for every block. This is not true for all GMU firmwares. So, fix
> this by using correct 'size' value in the calculation for the offset
> for the next block's header.

Hm, I haven't seen this in the wild - do you have any specific examples?

> 
> Fixes: c6ed04f856a4 ("drm/msm/a6xx: A640/A650 GMU firmware path")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 28e6705c6da682c7b41c748e375dda59a6551898..ea52374c9fcd481d816ed9608e9f6eb1c2e3005a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -758,6 +758,8 @@ static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
>  	return true;
>  }
>  
> +#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))

CHECK: Macro argument 'blk' may be better as '(blk)' to avoid precedence issues
#146: FILE: drivers/gpu/drm/msm/adreno/a6xx_gmu.c:761:
+#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))

Konrad
