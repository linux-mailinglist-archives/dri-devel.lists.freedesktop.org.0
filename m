Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC793BA55CF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 00:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9D110EAF1;
	Fri, 26 Sep 2025 22:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9kdadyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE5B10EAF1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:45:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX73i032149
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sW/+vR8VmYRg0AyYThaCLKBv
 e8fCpAHlijREnAutP8U=; b=g9kdadyk3brJcAfoaIMpWd0XsAWx20JKzU8mdbfw
 1TVSnIQHptLVeLOJAZIdfhx4L4HuS3Na/OohxN8h5fDxbbXzUROWRkbhTZ224qiQ
 pfzKoaJTnw9KDV4qhWMEPB0CFrNRcmW8vr9zWbHf6H3IQE3HhG91aanoZW/MeGjP
 1nVWZx7NT7FvyCDQIXIa+k2SP/q/joUryI8GxKxAbnlxeCPZ1/NdioCDynYHHUoQ
 cZJjO/YbcxMrpZ5oJV2BKzUtHwu93THFj4GsnBKvoqrx32CdteNKnLZbiuySihMt
 Tpz9Ad5Da2k59I6kiXE+WbkV3yS6zarY9Fe9gjLoqCU1GA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rmawn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:45:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de36c623f6so24231641cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758926743; x=1759531543;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sW/+vR8VmYRg0AyYThaCLKBve8fCpAHlijREnAutP8U=;
 b=iAOXWZfHYHyGIPGUQpOBU4stLNihjpebjel42WC7qjWid/geUqylgpNJDRe0HonBmU
 kzr+HOek6OGoKuzTLQa/OZD8+IXE/H4jpzehB1EWApLwsSJXOAXAhTS38Ya29mvTBBQ7
 1aKQr5XJwbkKfMbnvhO4BupSNI/O8ubmJlY8xfpQOqFSU3FAQrOZQmmcU4by3H/7bkME
 6NS0SlbyjHhZjuIeRELsICB5yuq08ezpybJ1gH8iI6fTEOy3tlHzx8XjPaUXxdAatefj
 vOlBwXT6FjWa3Tkl5uIAWzlZRX9LAf1NSro90Yt6ZxhhTTS/16KWfTQRkPf6GL/hqUFN
 G2jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1RWtjzxHGFJM9BvLnO4PjzhhHNl0ao6DbRlN5QPbMXB33kocam0ewc6XbpqrmNlXwis5eM/fbJLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy//LlHU/LyHnxh8tnl8T+JGYxOJYpymg6cm5fwz/S3nM1BCJ7H
 7fvTgOT8cDQ8AYSbQqLi4swRUW866OM41RoZBQn8HCE0z7kdRcIeppKkDq6PUtPeUU5eRXGTrQF
 KBKol/IAmAODzZhVNbquv+UcvM9mwHQrvGVjcUxCADJpuhLqQWpjPUbMzbDFmnLkYPWXpKak=
X-Gm-Gg: ASbGncuZ2A+h40X21qfcF3aNzlnLvcY+zzGWTX41XUIqH2FZJKXW/MddPMj+g3hq6Hw
 FrxYMoKoerBKvPruAf05WducXjJpXqdS/J0V97Jz12S8JVoHgDjPRHZ8uxrCTzzn03ViAohc35P
 G/BNvlYssk8tCEzmLDfZLAwN9ukUf+HUBXm9jrszj5C6bcb9TDgsaiLAo+Tu/YYdf9/GM90gy2d
 fmLEu0gaAWLh5hDA++/RacdxSyyq7wtL1YZLHuJaA4NaX0IaYO2wov39UXkKrj9a8jP45z+rR74
 AcjSk2hxtbwbcbzXtmktAv+4CO7lOs/KNmAXnpeUXY6Ih9Krf7BpSt0MpPpRDHJnahH1oTFiEnk
 XgAXkHibJputwpm1ZL1XZDc/X42UKdyX69QkRqxhhTWAsxLVglv6q
X-Received: by 2002:ac8:7dcd:0:b0:4b6:39a2:1de1 with SMTP id
 d75a77b69052e-4da4b42c2d5mr130498991cf.52.1758926743138; 
 Fri, 26 Sep 2025 15:45:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRfXtG/PeJOoa7YFdPRlCu9ZjyORleotSKki25Y6iLSpr2s7WbBrqGeVtAyk0UN9k7S1S1Zg==
X-Received: by 2002:ac8:7dcd:0:b0:4b6:39a2:1de1 with SMTP id
 d75a77b69052e-4da4b42c2d5mr130498621cf.52.1758926742648; 
 Fri, 26 Sep 2025 15:45:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5847fd56eaasm945718e87.137.2025.09.26.15.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 15:45:40 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:45:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, andrzej.hajda@intel.com,
 treding@nvidia.com, kyungmin.park@samsung.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm: mipi-dsi: Fix an API misuse in
 mipi_dsi_device_register_full()
Message-ID: <m6fvifsbb2yjbx6txqc7luii5mwukrpiw2n6bcnrmgidm5cxjv@ksmcnqg6sv23>
References: <20250926091758.10069-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926091758.10069-1-haoxiang_li2024@163.com>
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d71798 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=tUFaMFilNNX-uVKmuBsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Z6dkOgkvuuk7hCnETSnLot7bzZa8IjA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4mIpb7dZ2Qsp
 P3/haqMHF5nWGLd2814JGnEAWXOa+2uP1+opv16qp1JYuP2ta39INtmT97dYaae80ndNvsgdoUb
 m6ere/CJMLCFDqrOT5G9qo7hRJY+qR8m2TAn/sDJWTtT/OLTNwPFUGS05N2GmiMybGH1VbGaSgk
 TShIee6B6NiKKrXfFEvB7iBamTphLYZSxU3CJ142VVzf4sk1/ngVMUXMBu3MrXymHbffF85Qxbq
 g2w5JBdZBD+MRuWxB2Wfdp6LfWO3I4Q4z51k8+p8L4IRImMnn/E/3jFS55aw6uzeqv2tFlV/HEq
 MOr39usAb9/YZDRspyxIDL/voD4OoaYxweMmMUFHLHcxbHe0ACPbp1NDdQ/86X4MaLCLd5OGWxI
 jUj4d6eRvPg8WXKRRXs/X2EY8h3bag==
X-Proofpoint-GUID: Z6dkOgkvuuk7hCnETSnLot7bzZa8IjA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Fri, Sep 26, 2025 at 05:17:58PM +0800, Haoxiang Li wrote:
> mipi_dsi_device_alloc() calls device_initialize() to initialize value
> "&dsi->dev". Thus "dsi" should be freed using put_device() in error
> handling path.
> 
> Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
