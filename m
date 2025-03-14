Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6ABA6087A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 06:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B284810E1F8;
	Fri, 14 Mar 2025 05:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOwPYDn6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4249810E1F8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:50:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKDSU9027830
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4TOFDBBaQAKbK4BTla+P3B3q
 tcM22y9Dpjkl1Xx8uyU=; b=FOwPYDn6uqbgE33QKkIebKQwi+aicKXo15prEI8k
 1VNtD1QHoA9u70HAbJDr6hbQh6G0+2nYOP1N1mM9X5/fedlt4OhRpzVFOlM3+xYX
 rfBqZIX1MBhyf/0RkU60OaU9Qk7ID30Q8MJWbH7FrkTd9to8AmAx/APa7VHpFC12
 OUQCgxzWBOg2S/aya/nj0McdSSw0aYTShgXYUphySAa+ulVbxbiJ1uHhKz0zqvhv
 k1SC8LTbioJg+GReKimw8Fy40NxF9Ux7r7yHzzupxNLkCRFYRJ4zlfM+Gtbv6mWO
 HNjm7TnDshB8IfH59YXH9FRpK7obFmZ7N6BNm7pcecr1QA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c673134x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:50:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c3cbb51f03so297184385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 22:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741931400; x=1742536200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4TOFDBBaQAKbK4BTla+P3B3qtcM22y9Dpjkl1Xx8uyU=;
 b=qBfucvFtUYg14UL9lW+9hsgA38aKfj5Op08SthcLOhyvk5pk4uFLZRS7Kty5OpchC/
 untYBIQLj2dJV14wCMmdA4dCcUju+wpBED2w4MUAh7SMe63R//qVOcyZbGlHsDJri4yi
 jo3A68yi3ioOS5jzmqQOmdqHwVICmHtIiARDlNoECvG0UJBANvRnSvSTexKyJZZF+vBJ
 x5/p93xdOUE0LE1a9DLJcNV5rMTzGrOV19+sVsZ/95VSxhzpu+VRRcYhwc2kyLg1+FgU
 SHd1/DdE0RJlOvgYzS2sKfrf8PcZJI6h3ePrJznNmOGbVWtDRTgFmsWyE4opyNc3T2jF
 noXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnWCGaVDCHIxOn6x31DQGhWxZwSQ8rnx0OPNcrNwj/Rvvb9lZm/T9lKBeyn3OW+8m6f9MQw886B5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2Sv+q6hjGlFDXBWN4Wk4bYK7jN7q4ImVSRkKYKlnSWjD0odJ4
 jpc+DI8QPUnC8TOjVUza6IFe6X7IXpGVoI1I+bGl7iOaOTOViHGzMTxncUdd1VJ5b9iHG6bJyB5
 hbE0xmKtemJjWm2zTbpROosxo8uBWqNB5qzxdjId/sNleJx4Dv+CBTz1j33A9bSUjf9o=
X-Gm-Gg: ASbGnctU9Fv/AJqUjrbO5sDPQAgtiu/zc+pw0JI4D5lnmd2oDx4WDTbBZ0kGfa6UBPj
 5ruZwXsA9BPemDvUGj9eFSBv4ToDyBfTXUDOxES3/LOnJmqlJ7nbzs+zIeNmEqz/cRNcrvxVNNH
 u9UzflxgiU13bZV4FDPdhKmkgEGmcY/S59ssPkamqg409OQhDUCF21G+lMPtaihWsa3lhJOzt8d
 A7x30/NIcYpAh858KpiYgvJ9KfQmIBKuoZ2/y2OkuNXFWp6foEhswt3989IiyQpeMkI1Uf0Sa8j
 zhVT+sLjTMK4oq6Dt5IHEEIevwZnViF1SK4bzejWIiADZK2nMzlrEU373A5IegPJiB7lGIbh+Hw
 S+pw=
X-Received: by 2002:a05:6214:1c09:b0:6cb:ee08:c1e8 with SMTP id
 6a1803df08f44-6eaeaa6229bmr16168466d6.23.1741931400268; 
 Thu, 13 Mar 2025 22:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh/1B9u77m7dJMp8y3yNIwcJTMUKXqhqaNy74SsDU7tv+ReqnW3vVDj3NkhjjynMyUAolKfg==
X-Received: by 2002:a05:6214:1c09:b0:6cb:ee08:c1e8 with SMTP id
 6a1803df08f44-6eaeaa6229bmr16168206d6.23.1741931399923; 
 Thu, 13 Mar 2025 22:49:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0ea448sm4359661fa.43.2025.03.13.22.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 22:49:57 -0700 (PDT)
Date: Fri, 14 Mar 2025 07:49:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: lumag@kernel.org, mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 2/5] drm/bridge: cdns-mhdp8546: Switch to common helpers
 to power up/down dp link
Message-ID: <jxpnmrykd5wrrhif4mkhuoonsbfbkl5yrjsxklmrgyr3dfzkx3@wqslu5mmkyfw>
References: <20250314033856.538352-1-andyshrk@163.com>
 <20250314033856.538352-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314033856.538352-2-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3c389 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=er13H2TdnkHqOr0P1-YA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: BqLeF2d7HOYK9gldiTWtpWNTKkP0CTQL
X-Proofpoint-ORIG-GUID: BqLeF2d7HOYK9gldiTWtpWNTKkP0CTQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=870
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140044
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

On Fri, Mar 14, 2025 at 11:38:41AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Use the common dp link power up/down helpers to avoid duplicating code.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 74 +------------------
>  1 file changed, 2 insertions(+), 72 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
