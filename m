Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8423CB0F407
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 15:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F6810E557;
	Wed, 23 Jul 2025 13:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="be3mm9vp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971AA10E7CC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:32:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N984W2013723
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2bXOg94c4P77UMYH5aBqkxUK
 tX2QBEA8geY9+BQ+StE=; b=be3mm9vpNkezVmc8tMKVcODyOi3UfenRTm5h4kQg
 ygWE3bABfpQXTgd9j0w6gtG1LyArH8eD8pd4aAvnHySUx9oLo4Q0ZYKL0Urxcsvq
 AUxljNzdFSHR+yIzXGDuLGXnCy0HNdBbS+W9UB05UmNJtLuaY9cQPDwWsWacuHEg
 XndOkKjsh1dPYaueT+0Cf2o7fifnc7P9SgaO2Q37sbvljVqeBfTAK3OwJW1voSCL
 cqeDHTsiX7pQfKqdMkNzkdW5c2QLU1TSrSwEa9VbI3YdLp2j/0gPK7FAtzZ4KWYu
 w+iqw+G2XQ/B7GBuB6+kwAhCxGG6klrbh/OZNw3pbgNlGA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vbmqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:32:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e36a64211eso661461785a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 06:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753277545; x=1753882345;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bXOg94c4P77UMYH5aBqkxUKtX2QBEA8geY9+BQ+StE=;
 b=v0E9iGcDENz4tWEshfq+/78b7EmG4I6lhnXmt5SgoCzUwjvGZtbo4Se1GZqSy5btS5
 MMdOcZj86K0VvNSJNymeKrsl5swAZeau6UsqNZIpWl4V7Uf3ymTWYntKgYsGEDWi5EV9
 4tWeNZizqHiFx9UflA8/cv0LCt3urcutvdJecSTzk6cS/BjsiM1EKEuzwbdZHHy0VCT8
 yMWu3u6XfmRoJtDaaFHGvgyd9fZF/ltp3WJbqZ/pj9bX3xp2XZ6h2FPv0ch7clctHUeT
 pve6QMG7wgVunhnT8VkatQOKVM3HfTXL1h3GFkXT+LceXYwjTe4WoTGftljq2TpLKvwP
 GZ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdQVwg08bwZFbjX9T0/W2WjmM3/B+dkwXQVnJe1fNdMRwt3J1EWJEf/vOgCml5Fozq9GzKw7zht/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5LTDqjJXlBiuuLCgrdNyrlQ4W8kBf7oDEhn1Po9YWIJThcgej
 1FrR0ipIUiae6bCgwZ4IO+PVGykJRmkZ5IvlrNS0Ocr7BHrjQAjcPx7uNwYRmtJveth4Ny2iSMN
 42roLebcFZQeMIBi5AGo4umURlYBqseXHCn8uLfuulVN56MpIAE4yh1rcCpVc566N/kWKC3M=
X-Gm-Gg: ASbGncv8Upn+zYi8WuKs3gKK9lp8bPGs1kOMxK1ChulLnhqxgw7t3VX/N8roD+tiQ9q
 5FtkZYaICUtP+/5cnA9vnGCik3qC2G6dFAqisi6nYxN6VMiUZgEv3Bzop1PS1845zWDugoty88W
 8ZVdqcCA532wT/GrvXxeud8VcSXQCAQWXqhmby0nMw0s0v19Jg46kv7ezYFhmQOHYD1lc7SjL+V
 iuJQOYXAiah1IbceQMst92NEjdeKs0AdjlfAGiXWFR925yHl3L1Ls5BKsocx9pNktJB4ApXT9Ax
 5kby/Jot0bXNq3TjBhg1/a76Vq83yPG701VtCJbYtPaStVUnh9RafnBdEuIJSf/58vkHun9br5h
 1lSrzJ7GnDQ4SczyPWkIN7bExl5wqiBjNeFb8WNtrkUC66GloGhnX
X-Received: by 2002:a05:620a:8326:b0:7e3:2cad:a101 with SMTP id
 af79cd13be357-7e62a0e49e2mr333553685a.16.1753277544215; 
 Wed, 23 Jul 2025 06:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEydExjA33+4H64rlfK+rJ8J7FY2kUP7yS6AWx/bNwbVHySO1mJ19QUA1ra95IE7X5gFHrmMg==
X-Received: by 2002:a05:620a:8326:b0:7e3:2cad:a101 with SMTP id
 af79cd13be357-7e62a0e49e2mr333549885a.16.1753277543623; 
 Wed, 23 Jul 2025 06:32:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91eb927sm19151641fa.90.2025.07.23.06.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 06:32:22 -0700 (PDT)
Date: Wed, 23 Jul 2025 16:32:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: provide no-UBWC configuration
Message-ID: <bex5yk2trx4ko2ibg6oa4dm7rcud4wypznjsielf2rc6vogss3@m3rle4rp4c4v>
References: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
 <242d4174-d01d-4a65-a4a6-1f4d4e2d4fa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <242d4174-d01d-4a65-a4a6-1f4d4e2d4fa7@oss.qualcomm.com>
X-Proofpoint-GUID: 7lNGvoZJWh9DHxDhWPQ4O7sTjJDgcThJ
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880e46a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xD5xa0Ad2uggg-ClYCsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfXzURPJsla9PUc
 r6IVJGQI825rptvF5ZM/ATMJmzuMVqPK8qhnsuz8py5VcF4aLMhLm3/YStKdlCSsV1nikU6v2dV
 ojm4SqKm7r/6L0oCRUSboGGcmAcJPMJlr5DaWyhYTqDWRVCfICIgKpAM6KofqQfTgUgO0ro0kbc
 3oTIZI58x0LOSSXS2EmX39jxqCqA1S/s9G6sc+a7UQHrVPrloZYeCdomiTdB8ViLz4ErrlKbVJE
 sK7p65MW/9+z0QxVMHYkYvY+55aHAmD9APfQ0mzs1TK3beUSTcu+glnOneAyV7Hv4rypQdsaHbt
 B/UHHxy5iHr0bwEmCWdmBvMGJzYMq4516hjAvC2TPyNxmQ8cBP3f8DLmders3zE+gS+AlobIPlS
 3PF+3QCrmIwOqWrk/ugptujj1+PKV7w0FqDz3E1oonQw8UgLmcCt8AbXOwwB382PWA6twRN2
X-Proofpoint-ORIG-GUID: 7lNGvoZJWh9DHxDhWPQ4O7sTjJDgcThJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=845
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230116
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

On Wed, Jul 23, 2025 at 03:26:51PM +0200, Konrad Dybcio wrote:
> On 7/23/25 3:23 PM, Dmitry Baryshkov wrote:
> > After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> > database") the MDSS driver errors out if UBWC database didn't provide it
> > with the UBWC configuration. Make UBWC database return zero data for
> > MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> > 
> > Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

And I forgot to pick reviews for v1... I'll repost it with all R-B
tags...

> 
> Konrad

-- 
With best wishes
Dmitry
