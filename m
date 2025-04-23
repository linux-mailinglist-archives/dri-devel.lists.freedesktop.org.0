Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B121A9965A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 19:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6486510E226;
	Wed, 23 Apr 2025 17:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbsbPK9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98FC10E226
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 17:19:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB2QAR023959
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 17:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v9wH8EHVA6LVjlvvVtjgsb3t
 nmFIETCL1aHoZSy3M2Q=; b=LbsbPK9QvehrWUBZgBjDZUrBzdkFbFpsxxVum3z7
 BKdawnQthAVJcR4qIZJHn/msKhRnEElT+3YCh6JwYLP0nm8qIzOIObQ8Ap8bDq9o
 c+fb6nXxfgxTHdoiIGB9v68nWkC0OvVHQEubi6D3m29lZ/u9JYs4NvYGy3EG8Ntn
 EvHJTS3wrs8+XSnRhSUMwM96Yz/sINB30n5X+WpnBUNd1XcCAXJNRYJHyIjZGzW5
 WvUKRMWk9OM414DcH/q0gXIwBn1YkSPHXO3rrk9Nfmvt9wmQfn6NtLvqDolfJJ/k
 Mq7gd3gdwwLX8OZ9H+ZaOrqMu5g/HdoFhfG8eImpXvIl1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3avcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 17:19:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c544d2c34fso10139985a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 10:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745428755; x=1746033555;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9wH8EHVA6LVjlvvVtjgsb3tnmFIETCL1aHoZSy3M2Q=;
 b=GHKPPqEOpmcL6cnC0YH/zAS2y8p4bHuBHbpCx6TLz4JnvSWlfaTZyNcYILssa/99/r
 n/uzoV1Om1nMV9YQ37gM9sRrtTsNu64p0SndGKLCUR5FyUJ7ah0snsr5Cy0UDejB8Z+s
 /VAweangF7+j5fSIGQ5HPXgsHlkzIOpPvHCgrJ+f2v5wTvetMYp9Xtx4TbCf0a1Hmut0
 V+4MBH1MqJ8KYA8iED9vssmVRNwbdCv2bRBQaPV5LDL9Y1+o2j2s7Tddk6nn/169NKrd
 Te5hvNySFA3kD2EHd3WnHvxzo6BF+curL4Q1otgjONHhaOq6qc9C8unmZvYkCp/74x8i
 5mbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkPtBO7u2PWxyfmj50MmMxFTOHuVHE+l8xgWPG464q0o+Ut1cQfjoJaDKpj7eAkixFU2JChk6OD80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpWUPumEtnUV8wsuXCU+eCM4CBS3u8LDcFkRE/blp+xMC4vZ3+
 l0gSMLyMLwqWTXHLfcokLa2y56VrSoPBRebjs5ADs4S6fs7kLjtXo5ouZw9RgRI4T3PYHjyeg6D
 UMBe8WqvXzGtTq4SyS+EpdfGaNbYJgeXEKUujPr4+Z22+16/BbAHVJ/1bhFamEGTqRlA=
X-Gm-Gg: ASbGncvnOrm6tOdq0quQCazQ848fzibjF4KdScVQmRi8PbWMuNZWr2d8iyWw7fOavKX
 DH7gvM/H30uNpWLHGBHAaj08VDqkUyLVLrhZl29brgXH/13xrrDWNZl3pngXDj1V3xniy+XEl39
 h0gqdGRLduWItDgxxy56jSoDMgMbm59dXXsahjtwsHaNTbDQmO16Ws9/gOVodPPLnVEtuID4B9p
 arbpAW/iYwIUZrW+I6lar19gZmBzurxD4o/bfH17SaGstusXxHFWqWjqEMT31m2u8xeNL2+tLkl
 FnxVAckbgb08Kk3X513vHlrXTGZdGSd6Tav5/w4N+24iuBZrU3QoLl6Y2hhomnEPLjsshxn68IQ
 =
X-Received: by 2002:a05:620a:4626:b0:7c5:b90a:54a6 with SMTP id
 af79cd13be357-7c927f92454mr3558193485a.13.1745428754602; 
 Wed, 23 Apr 2025 10:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVswqy1ybTqryfuU4lsmS6U3oHGTuYaamZGD3V21r6W1eTAM4iafXiw5YygTNGYAOdB9TvOA==
X-Received: by 2002:a05:620a:4626:b0:7c5:b90a:54a6 with SMTP id
 af79cd13be357-7c927f92454mr3558189385a.13.1745428754176; 
 Wed, 23 Apr 2025 10:19:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5e518fsm1569937e87.188.2025.04.23.10.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 10:19:13 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:19:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: panel: himax-hx8279: avoid using an uninitialized
 variable
Message-ID: <lds4bnrjsnqxjjcskq2quzqqlkmwwmxwatbfhyjc622pjrjxw2@eqcw5bdwd5xk>
References: <20250423163214.2276114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423163214.2276114-1-arnd@kernel.org>
X-Proofpoint-ORIG-GUID: x9WAhpQsW-8txt5IXWsGIyhMB2NJDx-U
X-Proofpoint-GUID: x9WAhpQsW-8txt5IXWsGIyhMB2NJDx-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyMSBTYWx0ZWRfX2Tjcodz6+boE
 a6zi+1PL1TCuslcmCvQw/9NFFn1G158PbT1PN6YdwC1arLinGed54o4PBtkDsVQ5t8a6g/0H5s1
 Kt3YaJsTpmXwTCKyPSufd0OjbjHXQKLPDAl3/xjPtWL+8lVXSAIoWMkYRXviQHDoZQb80qCNsvo
 c/4fljoS45GfZ/qYA3C+h0H6PJ2AVvOSheHx/00+xZTtE1lv7XUEhA4zTnrRb6cYrWjUaKF771f
 hdgdt9GDU7OKA4mf5FpdZgVOUDJfRC94gvGCQ3EZTaerRT8T7D6KXaaiidkQOi1DhBRuXD71EB6
 zsra5u8awBbiB4LhD2z2jsqo9sKWukdQYN/l4IePcvv3XruZZp0OHdSXIEDWXN16FK7cdAJVAY/
 NanNWW0ADfM0EJ9wMijOkIAYZz5IIOXDsLnZpj4j1MG4o3b3pDjJMrmsLL/fI/usfxYDwqsF
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=68092114 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QetOEnqPXbbGsKDQW84A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=993 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230121
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

On Wed, Apr 23, 2025 at 06:32:07PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> goa_even_valid is only initialized in one branch but not the other:
> 
> drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>   838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>   842 |         if (goa_odd_valid != goa_even_valid)
>       |                              ^~~~~~~~~~~~~~
> 
> Change the initialization to set it to the value of the condition instead.
> 
> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
