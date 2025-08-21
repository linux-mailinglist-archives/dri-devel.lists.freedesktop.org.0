Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F19FB2F6B8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184F310E93B;
	Thu, 21 Aug 2025 11:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcnEEl6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C83C10E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:31:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bH8v027145
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wCJF5c3+QMhdemtPbsFinQUg
 kFKPi2bpCjGACADj15g=; b=OcnEEl6Iixdz9PVUZ2Zfk4Cr60+6BNxiSiK9QQxX
 YlDAdZyteOIbIJ3p9wrlwEISmUEZdwXf7Y9lInD0mTaJGFVOTzVwJZZmdnME8Zjd
 X3rS8TEdN+ybrLWl8Z08tZ9a/YmPUhsCA8crQWpPprLRVzV2xyF0l5dtLqKhCtdr
 sB7hAj1Imigm4OfEwT0TcC57N6LkCkr3TPObt/tpTWrei3wnmeCVYkm//+ZalfS3
 jOO1JxFiy3RefpH9UzIYtLCz2OisAa1isyao1XOzTI2kx4UfKoeBH3lhatOmu7R4
 bjw9UQ78KKXtWahUl27JLkP378jZAerl+40S0bwEPPDBIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w6ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:31:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88d99c1cso19807026d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 04:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755775910; x=1756380710;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCJF5c3+QMhdemtPbsFinQUgkFKPi2bpCjGACADj15g=;
 b=KPJ0ADf+wj3yMtKCigqFKTaNV/znMPw+BrLy4e2EloNhQA6LB82Eip0aC8C0dg3yii
 iOkcBkHET6eWxOW2Q+87qQ1A9R5vfEVcOs1tKfL6kUi40g++SwbSJ2557wI32HBufFQL
 NCDyCT13jVC4MYa1H+zz2Rz35qvR2FbW8YDq21Fb22X4EijuyWAzOPygcpExgQYX0z5p
 rnYKSc7NW2uNHKcVTRgWavyHSfXnyH1xvxN6hFwckWB+5CGYw8tpLaGcRiVsm27vsrhs
 mU6A+DH3ulOvqU0QK8vwsiK7YknYdIIIS8dA7orOWWep6UOK2EcQNeyxztmrL8VjuOAj
 JIkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuCX68Q1jcNFSxL9xy7FjnxgBZK/rZ61hHypuH2OGFDU4btFTbzaYQz9Y5XRZfND7IuG2w69yPB6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxs/sTSn6erjsvR0WJf/SNU8ZDOp3M3na33n7+JpMDRZetUyAe
 xqWgUsJM75JQ6tqen5st/KBjQlz78oDuK5fxhvWmOcWCvYkhGwbbFCFJYNVVYgERybHQRH3edeE
 8Arh876s4FRTbPI0/46UhTl8u7hcbANpzabLmYrdOEwg+EZR+9k4bh4xXTT3RZOxysJEWkoY=
X-Gm-Gg: ASbGncvc9FOlo07nqIfRLUzorTm/SaFS9oqBzEPHSDY4CVUIoDLLMCpov1gUHxsBJr2
 b/mPk92l9hB7xQ+MG1UqaLPZ6slrOCvtEIFbRWB1S2+loW0k3O7WA1WzhgOhUrIAR3t00G2NmOG
 iLMz5V34zFxFpQ/W9JYRJAKXyIcq+qLWOr6/KHrk7XVuGpYvJ9LtJdtBVzQrfqq6+2Drc27s5wf
 HPNr3slipVRo/dPZujyvGW6deqAYXBqnzRJoCiVe/pZ3MmCRH9nfLCjhhI3qn5dmkFQ2ti2cgjM
 QbzMnCzjZ4iTzT1L1LCWrcKU60AzPH390H0XJbGuV5LUOFPXCsZ1PtJIPsTD+tRlmmOXoDTXMg7
 eAJKPQvG07d/fcGlDvnA9YqoG3tcrhPTo8gvsB4rjkfK3M8bZ7fD7
X-Received: by 2002:ad4:58f1:0:b0:70d:943e:1623 with SMTP id
 6a1803df08f44-70d943e18c4mr1654196d6.55.1755775910006; 
 Thu, 21 Aug 2025 04:31:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFSs4VKIibVozJgAfWYCmiz65wGeoOsB2ADhDuNHcn0UHHXs9rSr5gNX58F9niS9BZiB15Dw==
X-Received: by 2002:ad4:58f1:0:b0:70d:943e:1623 with SMTP id
 6a1803df08f44-70d943e18c4mr1653726d6.55.1755775909466; 
 Thu, 21 Aug 2025 04:31:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3353a08ae5fsm8719801fa.56.2025.08.21.04.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 04:31:48 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:31:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, 
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v6 04/10] MAINTAINERS: Add entry for DW DPTX Controller
 bridge
Message-ID: <qf7rp5fca6b4orisls2m7jmmtpqriiwiqp7q47vvzwq7zva3b2@6qcsswlzke7b>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-5-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728082846.3811429-5-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a703a6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=3WFxphGLh404ikClcyYA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 8pimnGmTBkzRhQwKr13993wq4FReFf5U
X-Proofpoint-ORIG-GUID: 8pimnGmTBkzRhQwKr13993wq4FReFf5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy17KSOnXW/IS
 00H9oCGKwSvxeDTva+H6XtJTYTnpusx01gd6/Ki2do3MyyiMUgI8A1nl/fJJcJtKVsw+JxpBKiM
 VZQA8nbAkaew5ONhRrz+zV/n6g7+9RG+bedK4nNdLDoxXtol4We8Z40+ZT2SibDyEeK9Lzp1gRV
 vuTLlpoJXoMld07RmnQL5VW4V3oHw/vGeVKHvbbArvYZTvR5RdTL7nFRo7GnZ3YPJdFoQSWSRhu
 ++OTmlBUa1i7OMIClx7PrvnEOF1Uge4RqOZsyPa3m7Cd32bmMaFWkdaUcsYGSfAM/vsMPwqGnyS
 UpMJHkaL0utzjg7HS6mwrWqyTRL072gZTWBgztd1Ji7zELSjOoS4+J0oz7CFilP1AOQWQJu8/4a
 OW9tLbGguuqToJc0V1s+bMiU4tSM3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Mon, Jul 28, 2025 at 04:28:29PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add an entry for the DW DPTX Controller bridge driver.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v5)
> 
> Changes in v5:
> - First included in this version.
> 
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
