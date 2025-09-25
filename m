Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D397B9D423
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 04:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7336710E828;
	Thu, 25 Sep 2025 02:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaHThDmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC62110E828
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:58:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1WOis029619
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qjAC9HnS7arrvmYIoGMsNtnA
 EZsulCcHq35dMFpOR3Q=; b=jaHThDmzhZalaOm2waZn8XQ6kqYA2/a4wonJSNCz
 lQAaMQKEFEjEbtM84KfR6TMNFfQe7mvnql2WmhXXaCsU7cEsUX5zno6PGIDCHTR3
 6xHDedvVV6u6go6fc7HcWACRs8p64j1u1C3qddYPsDaXisPWdhbnXAymSR+xstLb
 ot+Z7FMi/o1MFUHoB6N7pRLVHR+2YtgWLy6VQCdzI5eZDC6NkU0pfY4tHyX/RDHb
 2+z0hOe9QUE54nDqhdITnZW0KcaDYu6qHUKl7612hNUeI5/0/Zlb/mOzt9p75802
 +jS5lcCNAuim/AxNZ3EfBQQ2BZer3TLXTYJWTKNa30KDKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpd7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:58:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-856c1aa079bso120786385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758769085; x=1759373885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qjAC9HnS7arrvmYIoGMsNtnAEZsulCcHq35dMFpOR3Q=;
 b=F6TfmCH8HVqnuxXRHgM+FsFne2jB8T6qO60F+qSoqPrt/emxnA31iTeY3INk5zECMW
 NhHRBV+McEPkqnCblBf2Y9iLgrAEGVf210JFyK1t4DZ128XO6pzHZ0xeiiE3VOBOnfQL
 jF2OTqW2C1lNvZy9iL28ZiydEOCljF/WEvIlQW8GvCpDaDc6mUr2xMOgDU2bLGcSTime
 1HgwladW3J6kS1CYALUvZMrDe6sGsiH/Bxeq6bTlcJTSVA2tW/uCpXGU669Xa0sdxjRX
 Sv7+jUIamWvbwJncx2poDGoT/JIS6uzNS04/P8vC6D9PvFqPX0WFOzIJobpS7+/BF/w3
 jb9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvLegnaxGxZ7cdcEIO2tJ8b0GxZICO5vREGz7HmL2LdhVNS1ORah1QRP6sivm5RJ9vI+YQiNH/QzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHOCHC3pN/rEy9YIDchSJxXC6SZbpqC16kGDk/oWh3ErksFuqS
 DGiqT6BcHxmy7f1GhEkhGyC15/pg3wvKcg1PGcSyZBzrs0qdOn7eH7sxXrpvBLu1nAGd7S7AOKD
 lOQWbkNSAvwo51V72mX1dq/T03CV0suT2BeXgl0lTN4/IJ1tzvXwFadeg3/tkMIlUkZEEDcE=
X-Gm-Gg: ASbGncuoGKN+3CGd0Q7lRFQEbjWlhhwbZii5X8/srUaUhgP+0DbWp2QSSVkWJQNWUqY
 FTNU/ArHoQlBID1BuMWD7SpZKMACFcbiFm0tjDCkqBiWI6IGar7yYy0nlOFKbBCnmey82hqIsXx
 W1XWTclIu/YO8CPjPZU90jJyfRYOVwT0H/yEhs55x0tviJJ+3Qc2TWh8VcIY0voP+XX1EgTn+6Q
 nTdnH2efHf2M24HfbgM0zERGDCJiKLNCpGxNBp9XRZm7cehgsLjT1iRFEV/OEfgrqaNOOZn9FYo
 7FxTR+eK6odSnb7WRNwMDtPoCdC57wyzEXbUM93RsZTinAyYQyIPAlco+eYbRHAhWboq1ba+nQ4
 kU4viPDt5nHbjvWq2JdtDUb5N57AiEYki8VB/NoLTJsVjg7QiYh/w
X-Received: by 2002:a05:620a:4416:b0:829:d0e9:bc1b with SMTP id
 af79cd13be357-85bc193e697mr124454785a.7.1758769085026; 
 Wed, 24 Sep 2025 19:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8/kIGrxuGE1UAhcbH+YWeTWUxLahQYTfRVIJoMIFeM/Sl3/4X1nwoIEfPlHoZiFC4e311CA==
X-Received: by 2002:a05:620a:4416:b0:829:d0e9:bc1b with SMTP id
 af79cd13be357-85bc193e697mr124452385a.7.1758769084385; 
 Wed, 24 Sep 2025 19:58:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb770fdb2sm2174221fa.43.2025.09.24.19.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 19:58:02 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:57:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] misc: fastrpc: Update dma_mask for CDSP support on
 Kaanapali SoC
Message-ID: <pxffubrq3362deajql2ajheoq53wvgrlx7ttxqlwg5n6zsxzib@zk3lwqwiq5zb>
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
 <20250924-knp-fastrpc-v1-2-4b40f8bfce1d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-fastrpc-v1-2-4b40f8bfce1d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4Az8LZqmccPwmycdZkha8XdJUkTGnxE3
X-Proofpoint-GUID: 4Az8LZqmccPwmycdZkha8XdJUkTGnxE3
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4afbe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3nRJTgfC3zKTbEAQhnsA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXxwK3WkyxeU/j
 Z5cQ0B/vNP/Yzeq96nY/ZpqpbuqPo5qn6qxI68ieHJWra0ZMYEuivac218qfgkizSWVXIuhGFDb
 OUAD189y+DuLpukpcVpG5eTPCOO8umjNKP1Rmpvd+c5kDbMX+wF1gWYLLGusg7+soLmI+OqvzTu
 dIKQYWRMn4rwOcKoHjr0jgpGzQhfZvWRcgCM9GO4VL9V9Bc9mF6h9UxKA2mbe/P7thOVVgpY5kd
 8pV5FlfFo0eKWn/rifjHaUWi5/eYHVzB3/i85MrCvU+Nxfrc+NBXQJ3nsYzrh+w5ZMjcXsjdiOs
 a6XfTnexaEMpmxQ2Rxzt2sTS3y1nfUA+fLkeuF05fnjxlm29qViSaFncyU+e3+PWUEN2uCjXgxq
 IZlgPbFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
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

On Wed, Sep 24, 2025 at 04:46:37PM -0700, Jingyi Wang wrote:
> From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> 
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA mask configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_mask` to 32-bit and update
> it to 34-bit based on CDSP and SoC-specific compatible string.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
