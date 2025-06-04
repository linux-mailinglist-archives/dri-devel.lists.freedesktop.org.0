Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91387ACE577
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 22:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD7010E822;
	Wed,  4 Jun 2025 20:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6gwSwtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DED310E809
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 20:04:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554JAlS7007397
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Jun 2025 20:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GETqFDBLOjNwkCUqjvq55LYL
 ugibUI1jy212SxBhuEo=; b=G6gwSwtxq2b8UV8M6h8UBQw8Q9GJs8UGaXL0zRNY
 h0/rNxpbY/Zn3+9uxXeuuhlFg7NfzkTsZFo1ZrtoQ42Cscff6vqVMhTJmyBL7WAJ
 L+Y5oIlY0giBGH47z1CWbjqEiucXZGQehxKnqQiNwMiUrLfSf3VZ61FurFlNETPD
 l2S6oy5H6l9XKkifvltS8/4KnetC9PLzy/Og0zOwY5kZW0MXuRgjOm4MWctM449t
 11vxFanZh3YztqgGsNPcF1FfgE6xTirR0lQ5YzUxEdZsRcUq1p4mCWBgzkDuw/AO
 XK0Vlv+BCEtuf4ZHHpTIz27shkTph7V/exNHLhvxAEFTMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8sy5mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 20:04:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d0aa9cdecdso24335485a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 13:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749067496; x=1749672296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GETqFDBLOjNwkCUqjvq55LYLugibUI1jy212SxBhuEo=;
 b=R/lhvE3lniFYngC88dhF+uKaoGFn53Og+kyV+CqKgaB3c5MDX4TGxvqzpKs/k0+lEk
 BJje5QrL8W1rVaRSG1dwnXunrXlHeyo6z1udisDk6uIY7dSJ8X/2hInPBTeMu+fR+MPS
 uUUBfeOmpSeNRnfmfDDBy4cJmpw+I4ACPNumg7ITe1+wkXsHMih+5boboFVZot9l2pRt
 m//pdYaXFy+vqdeimbZV1JKvnDhxwmrJp4vEGSDOTxw3+wYfKdbjS1GLApYqH6Z5Kwar
 Q7jd/ITPnnk0KhwnyVOwaBpS+0tK9Nse8j31tau/j/1yQ2gIfzRd2iTPQbDsmR9jjbHf
 3pcw==
X-Gm-Message-State: AOJu0YxpsofeJrZnn0YZ52/pYmCV/0NYzZy3YzkXgarIPcjDjMrYMqST
 yXnA0bc0D586oPwIcjBO5JpvOoDkLMdwOcCNIUhQ5n2AJzjD3AIkJ2YPR49CwmFiYov5w0XSkon
 p2WrQ845JHZXIlLzSlXAaqmg281KOoliOEp1NdSuLnE5gO1lx3MvVMVGVTtj9SWK26ZvAykQ=
X-Gm-Gg: ASbGnct9BvOl4xNfWwlPc1+hpjDz7FmFT6QDIe4YY36FXEZeCFZZ7OGfYD30CNPyqN6
 a/0C9lqIotzf6+pncZT77QZX6vCr4Q99yRLk3ykU3kgdqU841mTUvba41nf7Ipu7Yw5ESkrR/Yo
 bkYSsZ8Z5WGzRWi4aUxyR/kb24Qi6kgYZe/AvoC/G7DxIA80swh45ECyZ3G3tL1sXVuA3uzx74e
 bPKgDR3BPYMuW1nmQ39d73YlwAf4wASwUOHwOs0bbRCtjAnUucJ9k81Uas442E/T4LEWGPe0EY2
 5eP81BERx+DGLIROkwdKkK3UekrOqNiAeE5SRIU3rRPEvRLwmoiTyZNZBhzG7guLcd/WSs0lw/A
 =
X-Received: by 2002:a05:620a:c46:b0:7d0:9ffd:423e with SMTP id
 af79cd13be357-7d21983eeafmr621583585a.13.1749067495800; 
 Wed, 04 Jun 2025 13:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjedRKZXk+O2uUWdObWriSOKjKQoYLKQ0YoQHobw0lYOQSTV8DP665A92Oru+2a6e7Y36Hw==
X-Received: by 2002:a05:620a:c46:b0:7d0:9ffd:423e with SMTP id
 af79cd13be357-7d21983eeafmr621580885a.13.1749067495467; 
 Wed, 04 Jun 2025 13:04:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85b1a898sm22612531fa.18.2025.06.04.13.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 13:04:54 -0700 (PDT)
Date: Wed, 4 Jun 2025 23:04:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: .mailmap: update Rob Clark's email address
Message-ID: <u7oip7hbhwc5ni3nd3aa3zemzz5sgdvfjeyn4ca3gttuee2335@dmqcz2m5iyxx>
References: <20250604175600.89902-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604175600.89902-1-robdclark@gmail.com>
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6840a6e9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8
 a=hXrwuCzdAAAA:8 a=vIxmpEBTAAAA:8 a=cm27Pg_UAAAA:8 a=PqW8XdIGK9T-exQPSg8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=AbCNNcS-KtgVtUcPdxgw:22 a=h_NzWJYh3K8fKrkdZWyT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE1OSBTYWx0ZWRfXxK4U4xJvg/cp
 YQqnazTC2M3VA2u3EkQRwROy1DYIGiweiBuhgUzmHCw00Rgv6p2caXSzD8sOSaaMQ6Wc9AUxVsZ
 ftSMJdrodA9R9c5arPk/b+5QQI0CmGhEtYr5QQRMkbf8sP7/CRkEgu6y9HWNKSfRJo20+0CzYMF
 nhAb58/DXilTxReaYzG9IymhxVrpdjbBzVYgfQb1zgBlxRAWJQJ+5d6JyhRh/2yltIu5kBcfXHm
 f5uvxBEn0GcAt74ThcHBMrvNS/wavs9qr7eaxBgk2KgoryHfYlQDsMJ5zt2bBInTVx6L2FZKuMj
 oSVhLesdr1X4PJbq7MHhTPBLtT4WvqMFIpBzlCz8sqUny1E24pLyGRcOSvFAIER/deXyDMpYGaU
 p85yjw1vNRXskMi4rF1v9k+v+44C4EfiH48CMVQJ0I/c3BLPLGJte/GbvGK7bbMvFO06TPxs
X-Proofpoint-GUID: rvRr1W0bsxgtgUU8Dbt8eT0rIKgzCunG
X-Proofpoint-ORIG-GUID: rvRr1W0bsxgtgUU8Dbt8eT0rIKgzCunG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=944 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040159
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

On Wed, Jun 04, 2025 at 10:55:58AM -0700, Rob Clark wrote:
> From: Rob Clark <robin.clark@oss.qualcomm.com>
> 
> Remap historical email addresses to @oss.qualcomm.com.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 6a6aa09e244b..b72a164280ea 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -633,6 +633,8 @@ Richard Genoud <richard.genoud@bootlin.com> <richard.genoud@gmail.com>
>  Richard Leitner <richard.leitner@linux.dev> <dev@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <me@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <richard.leitner@skidata.com>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@chromium.org>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@gmail.com>


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Welcome!


-- 
With best wishes
Dmitry
