Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3084B54E38
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9D210E1BD;
	Fri, 12 Sep 2025 12:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdLbu8ZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5888010E1B9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:40:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBRvd017563
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lck0ubW29GTUmJ4yHo3n97jc1CGQR/8xVg8aTbAeFj8=; b=UdLbu8ZQ6J4UEA0L
 y2kLUExUGGRGmeuwnYa2xXBQ6fqhD/Vkzd9GY8vl/d/u1RzJ/Md+n0NskL8eP5T0
 03bOX39b/gRl0pt0WyC3ScvW093pGL1zmgaRYPYKhRGjpbmTPqTTVVSjPuu+D/t7
 KxJa3uRkANs8uS7g1Q+6FRNmVDh80kVwaC07GrklWtV28nY/Ps4+hZXcegP0Aabr
 4ssNQn8T8Uaq3RZX01rjRfO7Kaxr36qyShPsU8YhnD364xojCLEJ496S6rFhu1Mr
 UQ1WPPJ0RzkKAnvRF+vPMdlqNp8NLuITOW4XnlSaIjfcbp/oIZbDtH9G6nbliWJ3
 LvI+ZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx07df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:40:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-71f2e7244c7so3673476d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757680847; x=1758285647;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lck0ubW29GTUmJ4yHo3n97jc1CGQR/8xVg8aTbAeFj8=;
 b=eMRIEi3+JxEzr9gNT9BcKXoBAClulD5ojJyqcHQ1EAbHyDtLzLGiszHMkB0Q7v8lBx
 gSUK+gEOTkKbAGjRtzGu8ufasrzM8XZl///RbdlDsHZqK07INwBXTFgYPmWqJJht2N0G
 NJezmg4Q/j9f4nGmao5ijtzVT1tRrpGiYVrTLvHYMHrMThYK4tGgwTVAzDyX6SMb0LwJ
 ljBNzvhLoNz60x8ZUmbsSxh4hsik8aagUb3RQzt/A8EGPL/of3FZpHvzhKLnVIZzDWQK
 r9RUU4bLjC6Vm0YWaeY0Ip2+EBx3U04Udi2m2U9zqxrWZMDuApQzYoCyG0Kwt8m9seA5
 ET2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp2ZNZfCyYeEoSOekwPXj2eyswc88TSJH5n7VyaJ/QDX5bedzfHkjnIgrZ5ienHAnSPnSYV4+aYc0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfDjqcWeM+cfh+d99lYeXS3rFMhPQhd99Fl/yfDywGE0qTb97i
 EXwAwAlP+BDUtV5VyTcI1S+hw935vFweCaJD4vjh69Y52P8yYLJhGSnqSjTuJEh68cQZInsjbJ6
 PHUHFavriTkyxeuHl3Ll6ykN1Ebn18Twa4nuRpW5Ht/NYiP+pnio//xt66d6HPMgZ8JMwksI=
X-Gm-Gg: ASbGncsjpOlUfFvl9+59tnSgx6cesntCkHim7MyGOweF/8Y5796lCufZ9A3DLk0fna+
 6FmsqOLAbM2nAc7erhv7bLiA2lJs9ngmqpToswd5oYstGgkrNCGr9olZ+Nqn4G0ko6bqIiSelfI
 9sbfk7gh+xgv20ZIMzsSHX3UL6LUbQemzCqotyctTq/Sc40Jyml1yH8y6MGXt3iRhUkkyLMPTnq
 aco9k3xO7lXYeBF9W7OtAbo82X5lL46p5tSfmhBSqozZO36AjJYz+DjazYH6a3UwA4utvjUPHZi
 Y5o6PtFKCUDoBp2S6NxVDzlUe0fFIS4leM8vHAdPPLe1hnT+Ua1M50QV7G8ZOKeyolYkMFWgl2a
 hGxwD9kJvY1g8zwjdbd3mFg==
X-Received: by 2002:a05:6214:27e7:b0:70d:e276:efd3 with SMTP id
 6a1803df08f44-767bc025260mr23383986d6.1.1757680847499; 
 Fri, 12 Sep 2025 05:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBBLxtMxPZfLylJXd171i5aVZ91RwAFkVf95DRlbwCzPJuiY8Ut+YWJNPZGJ8wj/hfASSNlg==
X-Received: by 2002:a05:6214:27e7:b0:70d:e276:efd3 with SMTP id
 6a1803df08f44-767bc025260mr23383616d6.1.1757680846902; 
 Fri, 12 Sep 2025 05:40:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec6b6cec5sm3015885a12.1.2025.09.12.05.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:40:46 -0700 (PDT)
Message-ID: <f610e2d3-cc8b-4a79-8c28-4be11dbbe38b@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 14:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/msm/a6xx: Fix GMU firmware parser
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
 <20250911-assorted-sept-1-v2-2-a8bf1ee20792@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911-assorted-sept-1-v2-2-a8bf1ee20792@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfX009/Op4yUxl7
 JGEbgVLpvF0vDHlVd+0pUSTuC7xBXs28gk+Mmug3QM7e2Jzhfz1ycF8nMjqqMPWtui4rf9RNS39
 DaBgDHQutXXevMWy0fdQWkVYvpLM8PBer9LutuECuwCC9gK2YwAjrCTHNysCd4bK6PWXyoCNXtI
 yMBqy6nIU4cgE+dT8baauHOxwj4jgnyoOHoIh+S6vpbyoBansDKiiNVkX/npzcrMZVSHnB3BMEa
 hDz4dOBFMcXDXWbmxunNoABzJpBul1NU2bXB9rSrAzmhzgRWCKbOGqms6G/fb2zOp2qJViOcl1J
 i/oSGLyb0FFmZnTsLU5BS3NViWn4vZY4PNfLYSGYq0JmDS9W0mhcSzs7jrNIRh9dSxzWAirpHyr
 xfdUMUob
X-Proofpoint-GUID: pBBW0kDVOs1VofidxXEfMjp_KKPMII5W
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c414d0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1NxERlzXQmXK-yb5iVsA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: pBBW0kDVOs1VofidxXEfMjp_KKPMII5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106
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

On 9/10/25 10:44 PM, Akhil P Oommen wrote:
> Current parser logic for GMU firmware assumes a dword aligned payload
> size for every block. This is not true for all GMU firmwares. So, fix
> this by using correct 'size' value in the calculation for the offset
> for the next block's header.
> 
> Fixes: c6ed04f856a4 ("drm/msm/a6xx: A640/A650 GMU firmware path")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

I'm not sure what memcpy translates into for unaligned addresses,
but I'm going to assume it's handled properly..

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

