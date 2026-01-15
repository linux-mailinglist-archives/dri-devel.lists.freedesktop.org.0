Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA47D287FB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E174410E1C1;
	Thu, 15 Jan 2026 20:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNCiitYi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTyG2xi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6ED10E1C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:45:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY5Xn3202060
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=R6E8aIEcdWErvvrSA26t86V0
 yVBOK98/2uVOh2VXObM=; b=BNCiitYi/skNfGYATVL+B50wLK1SZA271JOsyozT
 zZ/nU2km+SVYUykof45CspZw2zcuAe++lBNYaYAlZgKDt6WdYAHFgJjO2ZEpMcAv
 iJOv6TJjHU+Nt2NJKfoqB1Dcbg1z+92v58Rk/XZ0WZ48os2pesy5SstxW2SBkFh5
 Fr/r7MRP9W+cPR5LWwBLJIGXwUhJtaNbt5lgJCTVdgJrhvsC+VYJ8ghflQBKGqJf
 rY8yArRDgZXHG8di/FSy+XB9phpIB5TNXbaM81zcd6w4SwxeyL2p26AEr/yGIS1P
 PZIf5LmwLApAomniMp2Ez6XMcYKQ9pM0lUPLBNoiy5yTSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxhs9u06-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:45:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8bb0ae16a63so175011585a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768509946; x=1769114746;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R6E8aIEcdWErvvrSA26t86V0yVBOK98/2uVOh2VXObM=;
 b=YTyG2xi5zud4VyEB8nfzmuWuIK7vpqdSUEA6pVXr5UM+cys0Kfd7LO1kS6e9JQl57V
 8iV2XVgJ1xrwngEarb/EN7RGjmluHvb1DWDmw+zj+XvsMv3r6nl0LWnZI2JJRJ246PJQ
 YLT7IrBl0aL7RmEwgMlI4i2eR+h31GJZLwTKSHda6SjgNwEO+04/fQbJnLq5vV6mnn2i
 5Fy/3G1v2OXhlIP3qZIFqTJXfPT+jPIs1yS72dvEdnb69UXEK8M2yumVcchtVQcxtAJX
 kTCtdcJfOmrrpv6t+V1eeDkWU/EcYAx+mmHkDJS8mYc7jGmpZ5X1wL2ZxvyyP2ezQIed
 iSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768509946; x=1769114746;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6E8aIEcdWErvvrSA26t86V0yVBOK98/2uVOh2VXObM=;
 b=uI4hjljoD42jgQjZEFlOr3UHFOWZyZ16YXXx4NZQhYP+I4A1+mdElMidOufoleTnqT
 P7wTTci5x8ccj6tohzL620CtoKDf+FthJ3o47rZsVWmeAfhAF5Rzm4qooFvKTJi9ZIeL
 wJoS9X45tXcPtIsW87z4QYtTDkHA7mfO/3SEW7whXLx4xTWyI9tIrfr3Rnx7W0qvIazL
 Z55ZmOzftZrkqtAq8XZH18dpI2sAzVlopI2pxUcna/zSxVRkKKcUPm8GxTpraSCcXVg7
 2d74h9/s6KVnKGrPk6ucq7MQgXuZ34ofbyz+tbtV0USMO1Y3+LpQEKHi6nQMSZSL6HCK
 UVqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjoSSxH0CPr20KkHdRb4UhwvBE8/dGNRdDoLljraN1Al5akKpJ7L2f+dFMuXUIWFkoa6CMqHlpbVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEgbNHOgYlswrYhvlaPWCW1UmsA+iC0wggg9vkYjUVdB+YU33I
 lgw3PhlhQ/f0o30nSuKfT8X4h2GW23MS1/M5uYuPhrLoa98dhMgu49Eyatz6qQBsgsS9dH10tgC
 0tjsmOHeq4nznj8pqMSGCZJtDefAPyhevG4C5I/Y33bBNWGgpFeup78ZucaOZk0WtbbCZoRA=
X-Gm-Gg: AY/fxX4Snri6zy6CPTo0ItyK3wJ6tcB5gs/9HfAWXLJ0AjHD42tQT5/g3uKMksvXoZi
 1rSZYDQ5quUoertE1H63gp68ouenk/o9oGzRM1d2JDQwWR7A7wfKh2KlpJGCkk3EWsB22nq8MFR
 v45dj6JpCmCS3o2b6JP9VnPzhOE/rwHkqRcvKZAVYxpJ0dJcjA5VSuz7/n5pSMvhTLoM0tgG9bX
 REqt70CchDcDp5fbDNDXEAQZJJHtfmpkXu1VEas6J93x8LeXzM9FkN+vUoyBPrvbkqy4mMTr2qb
 9ORnwsWyMa4ct1eTmN/ab+etygN86Q/DpzpqeYu0AHnvSH4NgjRLzgfVBkI42z/B7+QWt/34nu4
 NYyKivUvFtzM20l6t407KczRozuQieh5+PYPznMxbWPI12KCFMlUiSSy05TGRH634TXogeqvgT4
 R47EWY9SEjkzkpw8bX8lgwt54=
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id
 af79cd13be357-8c6a67b093emr110523585a.62.1768509945801; 
 Thu, 15 Jan 2026 12:45:45 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id
 af79cd13be357-8c6a67b093emr110520385a.62.1768509945307; 
 Thu, 15 Jan 2026 12:45:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf39c03bsm140307e87.77.2026.01.15.12.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 12:45:44 -0800 (PST)
Date: Thu, 15 Jan 2026 22:45:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 2/4] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
Message-ID: <gfi4s3wn6ssmq2242ws5fduz7s46lrb3wgzvyn3y5djpdqtkqj@v4c5knprxotm>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-3-jianping.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-3-jianping.li@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FI4WBuos c=1 sm=1 tr=0 ts=696951fa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=40V_IHiNs5IrJg1Q9KMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9d_2vOQRbvkHlUNAGIdtGBfuoqWusjBJ
X-Proofpoint-ORIG-GUID: 9d_2vOQRbvkHlUNAGIdtGBfuoqWusjBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MyBTYWx0ZWRfX2bvy9huh3L5n
 K6YWwiWi8aD6JARScOkWJDJ8tMQSL8LKNT731ugkqI+x5YnSPNdWfHH46E0mCROyPiVhgO1c0iN
 0TrLMHffpy+aPxaAL1HGWTIGHgkYd7OUc7m1VF0TK8O/osvxviy2gBrHxuNRwngZw+6HSVIXQqD
 N18NcnG6+C6gOTV+AeZMTzV53yr66t2ph5AnoG5xspcnvAkC42DqqGvmparg8ph2GSpWlm+P3RP
 imDEqVR0Kzg4Pwpb5Kxq92lnKbDsPDdo0rV/977QJVd+ilrH7Sz8EJxm/dqvf5DB6V+0HShcFSy
 nX3LgYuwQjzo6eZUWKPpTl8BCQe96MSq3ujZqPPNgPqyCT/5Z6CLs10HsAU92LymHRonzRzHuIO
 GriGAE8tqG9cJz0Oj95S32uPT2amn3U33/Kvgi6/f8TBwlkHN3nSAprZWGu9+zpjjZMsPMHrURL
 0PnOWQUt7221P3rmNDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150163
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

On Thu, Jan 15, 2026 at 04:28:49PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> The initially allocated memory is not properly included in the pool,
> leading to potential issues with memory management. The issue is

Define "properly" and be more explicit about "potential issues". Please
be more precise in commit messages.

> actually a memory leak because the initial memory is never used by

Why is it not used?

> Audio PD. It will immediately make a remote heap request as no memory is

Ok, you've described one issue. Beforehand it was "issues". Are there
any others? if not, please drop the "potential issues" part.

> added to the pool initially. Set the number of pages to one to ensure
> that the initially allocated memory is correctly added to the Audio PD
> memory pool.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

The patch  LGTM.

-- 
With best wishes
Dmitry
