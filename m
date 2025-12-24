Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63ACDC2E9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 13:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFF510F011;
	Wed, 24 Dec 2025 12:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kB9M1Jno";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brjJOTJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9008210F011
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 12:18:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO7s2cF1056227
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 12:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bKI8QVztLgm/VTUggHqWkOdu
 mvv03Az0PJtQAcYfPWc=; b=kB9M1Jno4ggr+1Mt8zQ6HBEzDZHsASRLi7te1e76
 AZjT0U9s0PyTQffp7b42YQLC2sW6mw3XirwSBcwaTSvis736uq5raYVEs4lziN1A
 T+HnzqBRfh3B/vns/eVqvINhDrD1e5d/p7Mmf5Qz4HfuqcyUwn8pgvSwug3mLsKh
 c2IHbDt+MIGl/qvuOuNbzdOZQiZGXQQaPXuZncbVnJvdocKy/go5KVKKrRZOwUW8
 eeC+mD2vduk1AYHO+zkn4PP1zDrsxoVQuI5H8cuCKbsi59+eccovt1lTzDI5MM+7
 WpW6IjxhZ+ceXTfjK6uFNpEXWge6++UteYcoFxCSHgtJDg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2d84-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 12:18:31 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5dfc092492eso3403929137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 04:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766578710; x=1767183510;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bKI8QVztLgm/VTUggHqWkOdumvv03Az0PJtQAcYfPWc=;
 b=brjJOTJiUrdhCznoFFvzY80pJfG2ZVIBjZEgD+E+GHXzorF6pxlT+bWrWEK34ITX+C
 RJ16AlZObWTV1oB4VuB6tq6KhPrazyZw2+MReu9RM//jSVzXpz0rLdhsIjQYDA46ahN7
 OV65npWQ66EeRLQlpqoQESiG7WJW8cPky03AqVfnSkjIBawsd3csCBV9pZmZz36kQHmL
 SLszldvY84LfzVqkaSB1syeyxDHhvpAXeNW1T2kWNNuaEtEPzb8+FuOzJNSb4m1/EJEj
 Ori0zn0otMzZpnGGcOLU27MZmJHhHvMz/3SJFmW03JcE4QdBhdP6Kb2TMGlgaatW9rlo
 uS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766578710; x=1767183510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bKI8QVztLgm/VTUggHqWkOdumvv03Az0PJtQAcYfPWc=;
 b=OlABpqlmrbFMTxn7cHU12/BmRy6yGJ5NB3NIWmIoCklHeAi7MXO3a0lf1S/g7gMxBF
 bQDFDFuLkGG61T9WaYQ4gzl5EfNQvyjai47uVyvvgPf5cInuElQlPQXnviCDPW4veW8j
 cfKMiQzTxVTTMFMl/81p3GGzmjOEnlTX2Qe1RK1BqfPZgHTjO+9akn8RMWkaBFWJQwD0
 t0g9VY89Dx5QXo1pzYdJI8/BMeUPjtANF31FEId+1m2nFfKtNPzN7Z7TaiWBNvSicHQp
 7RnmvqjR+WbmmokaUdFKdt20DnL7tHKVXEOmDpr5MzPSdLKrGcV2ax/8E51AMyyPUw7o
 gGRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzBtx80lsH77TUuNPtbX3pIaaCCv3yYla19CRnXG+ldAw45eDz3RkHyv3R6uVeKpLkOuCqRnn1FHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6qJDEkdCH5VCooBD65hr/SRb/JeRdFSzACki1NpnTKVesgvSy
 rqTi9sRbkrWszfF6CiF2U9Z8aR7dM4xIZBsTQf+kVktm2EnviQVcR/Ky4TX43LxH/HMwe0eWkZs
 t2vVGVLOKGzXyHLksiwrhMwFUmfYZg7GjKCnJaaaeMvce1GHDSUwffzwTEoHzS8gG51ViMbA=
X-Gm-Gg: AY/fxX7li7EsKWGv4+He+GChMJzvZCcilLNF/gvRRXdvWV9LfXDwsQVcWkhWdaJ6pdu
 V9FO84j4ad2jENoVakLhHTMF0jOzrfZSptly5E2C1SZxVNtplWVbxZ8K8AnRZnLN6OEzJeg2UjI
 TY4jN8n/sSE+aXTXSwEZ+MkH3sCe91io/JLtLXxWCglzCV4WJH/2iAozlLvTdOInX7XsyoaawvH
 T5IQYlXQ5IegK3LvvxZ1GVFLGb2+DC7Yl0xnUrCC3Gbn9ZlAF8FwCiIuSuI+HkUESGB6E4qdWM1
 bBNFo49TobPML657M6RiEQIbclhg2XKMg5MJXPwafY061uSxRDCJ2kh7j8chOpAfafXlQHvLWST
 Z3HfmtDUvpPorkZvA4N6ghlkwuactQ+L4lpQbRB0Vig1zM9QnuCbvEpBKwnTvUXu4RoLJ3tQPVN
 4EF2kO5bQIIEZm/UfavVf5Oe4=
X-Received: by 2002:a05:6102:9d6:b0:5dd:85b8:d82b with SMTP id
 ada2fe7eead31-5eb1a67d474mr5554708137.14.1766578710024; 
 Wed, 24 Dec 2025 04:18:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHiwFoU6VDGIWYRpV1cCuR3GUum+5cqV36N0kvTseaZzfOA1lWmDijjG9KtgAAiCj+X0GS5w==
X-Received: by 2002:a05:6102:9d6:b0:5dd:85b8:d82b with SMTP id
 ada2fe7eead31-5eb1a67d474mr5554692137.14.1766578709538; 
 Wed, 24 Dec 2025 04:18:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de6eesm44436181fa.6.2025.12.24.04.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 04:18:28 -0800 (PST)
Date: Wed, 24 Dec 2025 14:18:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: veygax <veyga@veygax.dev>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <oizhtyik43eyaixepugzndv53kn23tqsvxxwhjtiewbignqd4t@kyhnf2ttyomk>
References: <20251130012834.142585-2-veyga@veygax.dev>
 <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
 <a5b8cf57-8697-49ba-b225-ec735bb4e337@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b8cf57-8697-49ba-b225-ec735bb4e337@veygax.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfXyDCFpNtmmhIi
 k3DmsKp+VrjrVhrgq0Idwa3qTpvE7zHT6oDnOFL2J4uYKhncdAQyUHbMHutCUQJENp77EY8Pubw
 t+NTRPj6EMfc37sLUcbXXmMX54Gx8fUPZYJ1J7ttBtDyRn5H4BmbUCeFT/cOxQChZk96j1oPFnf
 ode4/mm8+v8YN2j+AnXy536OMjM94uxQzteQhQHQ7jUcjNwAYrGBrA2/xMa9lWp258QFnB0nX3j
 PzqtP1x2e9CbIAYs52l2Sok6EHGhsDDv+ifmi2HAVQYG6fNF1vmqC8sFmKbOynGeEPrI9rbHSD8
 G/WTlS6UIylO2KyKbiebrHRrxUj8GJ2Wdm/h5f2gDrcChHwszv2hk9LpsunFqoD1eRJh9WNiRtp
 LczUEwlMZtnM5gzUvXlKAWKwan1W/GLcDAnQMS4CL+e6AN7fs1yMvuPrURdcpmm2k8B7chFzXV+
 4CrDHXkTHXYKpWKLDLg==
X-Proofpoint-ORIG-GUID: axNkW2Hzx9LHSBr6ncPEtqIKJRm3CHuz
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bda17 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=pwWpIS086ldQWxGsuL0A:9 a=CjuIK1q_8ugA:10 a=Qzt0FRFQUfIA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: axNkW2Hzx9LHSBr6ncPEtqIKJRm3CHuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240107
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

On Wed, Dec 24, 2025 at 12:07:29PM +0000, veygax wrote:
> On 24/12/2025 09:27, Dmitry Baryshkov wrote:
> > [1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
> >       https://gitlab.freedesktop.org/lumag/msm/-/commit/093cbd754382
> 
> Hi Dmitry,
> 
> Apologies but I've just noticed that I signed-off with my screen name
> instead of my real name. Would you like me to submit a patch V2 fixing this?

And I didn't notice it... Yes, please, send v2.

-- 
With best wishes
Dmitry
