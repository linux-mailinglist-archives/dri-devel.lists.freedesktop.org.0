Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0702AAF8185
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 21:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EDA10E013;
	Thu,  3 Jul 2025 19:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUQiy/Az";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFD810E013
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 19:45:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563EwcIv024702
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Jul 2025 19:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Vpm/8/blPnVQJ2JqTB/4vup7
 1un8wdZkh1pHtFspQj0=; b=bUQiy/AziUvgWs8sAbndrYWYtYVCEgWeL+0ZUkr7
 dLIGP5bap2LG4Cqt8xdCLSq0Fbhsw9bYTklm0GbYRIEPD1IJ7hnREy891O7XxP1+
 4ksnuQ53VpixxZVF3e4jqOO0IxL5X92SGdGcW6iio3cZDqq7HNNBzsg6njj5EPOq
 AlY8SUvDv+OLNJMxH5KYVd4qSyqrDHDv7ZlKLI52g4krg5pYPzUZCypsuan9/1dC
 oBMWWkwHq1e6oh5OSTxy4gMYcUTj7XyeIqYluQftnhsChMGZUfQAcbcKyIVVyWxb
 e0hXXYrs0YYRDp+1Bw9e+MOBueohhjFU4sW1mANnUhKXlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9sjyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 19:45:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d44a260e45so42119485a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 12:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751571934; x=1752176734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vpm/8/blPnVQJ2JqTB/4vup71un8wdZkh1pHtFspQj0=;
 b=vfpWX76mnPV+S9spQ9bx0JDEuPPgNH9iT6FDtv6IfEx+tCQKey8O7e81nMUMSx4dM/
 dWJ4Ahq0L+AbINU7ubsGK+Qbu5yV3+G/WT9OO/h4klXaYXWajh9WVnLXKG44fLHHJ9mY
 fEfZb+eaI7CL+o462Jh/mgMWfKRDncgsBt7oQIOJveTInSPFUzxQzoXvQSEaVL+9J93f
 KFGo5H9intn4QR5Y8LhlPJYzUHwXy8gtv1C9a+wpc5lByHMb41d4xO7heEejIun6GFki
 sNt/9Xop0U9b0ZG7pofy5iZ3rqzvWQDjwB5MfSk1p7i8BEdHLKUDkVbE6+CGQ1XyUr63
 dUIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgFPF5Yhy9FD0dzsbgxlC3JSNpVamkN0vQp7AX9AH1a/wotemBrRZbNFyY2wsnA1WXvF61yI1uJ7A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn8aMgqaEwTU6VdFq/ZM0HWqYsLnM7vLVrb67/XHU78Z4kf6HI
 TFBr6ZqwrdJkt0yhU+aoF94+GHhzTXRgaN093/q/P9PJpOuH56aAGRwJQEbk4ai5GSllx1kDO7E
 TJEvwMPBfbsMKl/bhbn589ItYU6NU3p/5v6EsC9NPKK47gUBdyanKcNb5/TdwPxgm5g6u0dk=
X-Gm-Gg: ASbGncusATP+Lx1JlsgrsdDeBemT2QxDoBOT7O8lhH/EmPX/lLQxPdGqiYtKxzba/BQ
 ODN9hFlaYAdspzzMFSip5i+K3WrOdZxFbx1UgPGj5NjEyjBdVcjwJXn2HTznm+WxJB6egltKZEv
 +bXY4cUbRg53BCJ4TMDzj1LLFNzwCj4HQfYO4K6733KIQQMosSHeWBjU75vqRjPJNcWlh4wlPM7
 8Dp/joS7LcOAagtOY3+CMXMZcUukHuNdvLYpiXxL104YHx8GDMeWEKTJFsOzAKzlJDv5u/GEYB0
 l/bTXUICi6R1/ieUZpN0YcO6jZVIrv0+U0fI3pTOwwD0t4Jrd5+tL5z8tMha3uRYlLT/SRmu1Rj
 w03UPxvV42oEXW/CEgh8Eu7sCg1sNHgf1Z/E=
X-Received: by 2002:a05:620a:40d3:b0:7d3:acfa:de46 with SMTP id
 af79cd13be357-7d5dc6d1439mr68784385a.21.1751571933521; 
 Thu, 03 Jul 2025 12:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE2Tkd8SIj2e0FW5ub/c/5lxoYYP+U2g7RlQkzD/Ph62/PI8j/lbSO1AAEZvodVq3joV8+IQ==
X-Received: by 2002:a05:620a:40d3:b0:7d3:acfa:de46 with SMTP id
 af79cd13be357-7d5dc6d1439mr68778785a.21.1751571932911; 
 Thu, 03 Jul 2025 12:45:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384d57a9sm52843e87.257.2025.07.03.12.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 12:45:32 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:45:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Message-ID: <nl6qf6btlkr73ozw6psh4hyt5ke4o6hlctbgzcjukmr4dojbes@rj3zqv32nn2e>
References: <20250703183455.2074215-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183455.2074215-1-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6866ddde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9sTWCGXqcYbA0vK5jiAA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vb3WGokSi_ziO33O5LE7UU6oPkxC6_Tz
X-Proofpoint-GUID: vb3WGokSi_ziO33O5LE7UU6oPkxC6_Tz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfXy7NXBPTFz8xW
 M3QfOGnY8GlxpEHEd00CMZ818OCKOL+2PrtWdBlXNMfom63gVW3h+gC1Ks9UzS7C5VgyE3r9CHa
 ECedJd9EIC6RffXugrA8SdzE0pHwxXyGg77hb0B23GCqq+lEDdJudLz/MFeTkw6p4Ndf9KDE9iR
 jDJqtOKrBR6V0zyo0NdpWR4x8W2hZN0tLVBk+RTwkvxhBoi1j2vQ5zAcN9XDiMnilDCwf+FtdST
 gVYikDsPYl3mP0FRsQiZ70H1+69Yg1OnsXiWTYGDxI8aPi3HOap10aHgEuEwq16DoNhzD/wcfmw
 w++jjCnwTqCwEgFEZiCsoH08rrsUVgCynvW0ghVuE11SyJ66A/iyxg+ld/MYQPblXgGKLZ8HPzu
 Y2Nv0GP6ch6IGYePYfMqqnFUuekvdM0+eNTR7Qu+KTRW4bhIMwbIFiTnBGRv1cZD+1U2QdTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=652
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030163
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

On Thu, Jul 03, 2025 at 01:34:54PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different. "memory-region" is optional, so
> failed lookup is not an error. But then an error in
> of_reserved_mem_lookup() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/misc/fastrpc.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
