Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13220AF6591
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 00:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4010A10E03D;
	Wed,  2 Jul 2025 22:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mm6wrDXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDD310E03D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 22:46:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EATLB016164
 for <dri-devel@lists.freedesktop.org>; Wed, 2 Jul 2025 22:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nGM9DZwF/Fd/OQyKb81XdMAc
 CKZwqXE+v9fpqIkuHk8=; b=mm6wrDXhutFr3uHC6qXUeeftTGzqIOoRT77c+zOW
 KhrL5iogdPPtxctY+wOJyx/UCrc2keVFfwbWeRsMeMlVGpgsHLtg+cway7Y+7/mX
 1Fn33tizx/wqTgjlkVDDnwTdmVEJFgI9auaXt7NBQvF0YSHAq7Qp+yqrtparSEJW
 fpkAuV87++k+c8bWywdmd0yy/lkbLtvw6obky8xTn/GsvjIkMzs0CdI2BnEKfnZ9
 kypp792UseyoI7eeNSxLzZOBd2W1Kz1p/GkaKTMys6rWd38STbIMs+xarMeXk93J
 1iYsOlH4donFFrvzpib73KIdBqDScU5nBpzLrcBtTrrIHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn4wch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 22:46:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d22790afd2so671806385a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 15:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751496362; x=1752101162;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGM9DZwF/Fd/OQyKb81XdMAcCKZwqXE+v9fpqIkuHk8=;
 b=f7cRs/g3/fq6fbrlH5kD1JacV6VdRWGAnrcuEYhsrVZQSx9iy9y/vCZvRmBa/RUXxP
 4QyZx9BGCk3kPS6isQA2tUqVUGVqaYqmPNYqPHHyDh+UdNGGBeI9Gm6Pfzi8PPMoYj89
 mExNGR32SKUvl9iQORtn8gpGTNBvK43SA1NwQXuQOado3wKCn/lJ5j2sdJ4scMFCpc/2
 lFvpSGhgyl143s+7StmFj1FPhcCbZd1MUrYUuJI6teBAIwrTi6DXRJwLMp8j92prUzYK
 4AFpwwhiHiLXola+bLlUHyEZNE3crltEW51EMtPncMxNvvrRBQ7cTiQGDbOnsXiy6aZ5
 b54A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt4EeB4GXtpv4/ust7+GciLzpl4McNnC0hweMvjb9I9Yv1eXKYsYQcYl/YWbeciUeQoMkToM0Zhx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8tveMQyk5jFu7ozR+hh3NE/aC/fazIVSHx5UDwSGmkr2oesz2
 jK/7SsGaN7Slw1vgCHXJCP3dEYyrJ1L+PMhUniJ3RVdmtapWy+FezYnXamc7Adk7ihIaT0hXOyQ
 w725ZHn0MOY3/QvJQyJA3Mz8UEx+y+HD8Z6gfLcOrEUkmYMroeu+jaeJi//Vh+nALvqdFA7k=
X-Gm-Gg: ASbGncuk4HIfOta9BDkY2vp7U8jDwkoFlTQGdSl9wqnG/RKXWewD/G7EZmX0A1FY/HD
 zpHznBdJPyrr60YVUdb608xenUuLIO/RUrHfLxG5Mw8+fmFiTfTvxDbwkM6BqvYypW99XMuijaX
 y2OG8n+eiyj1vgzViur8syRUJWuOoEpsUaygT9pnsuwv5jexJN+nkTJUP4oBz3Ujag+fP+dMnhX
 AHWG1SVJSXNHtZXZRXBAq8ARdyBa09XzizecBxHF1YolMyelAPXfln5bNgRCsGlHQK+FxhOhlV6
 3+6qXZvZdEIk8KKJ7SR5Ju5fP5NjeZ1a1cOollN0KZ2rXQw6tvtvceDMXrkMvkDTs6NwSQDKpeh
 SYf4QjKbZVJ4yPPWTxFyLuUtR7F7iu29mhfU=
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id
 af79cd13be357-7d5d1478c26mr195296185a.41.1751496361804; 
 Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnZ1KfGDoGnAnKKb48QCXInkKCn1fPiOPT/0wf5tLma0vYWc3UfPox1mlLLdjDhi6HGr8ihw==
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id
 af79cd13be357-7d5d1478c26mr195292485a.41.1751496361431; 
 Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2eed872sm20589301fa.86.2025.07.02.15.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 15:46:00 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Make dp/hdmi_audio_* callback keep
 the same paramter order with get_modes
Message-ID: <roqsr25rk6psidxikgj6gejil2n6yne5gsbuvbnanhtpuqivj6@fqxazmw26hru>
References: <20250702111453.102539-1-andyshrk@163.com>
 <20250702111453.102539-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702111453.102539-2-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4OSBTYWx0ZWRfX37xtIGHMTFRL
 iog6ww1Li34lqXzqF9P9nKoHmFMY4v+PcJWtszlmRzG2IQZT0CEsp4XRDV+FycYMhMd2AhbNzhx
 F6aS+B79FvBO1kQ1ipjR8GVmP51GOcu32dzZ/WJAiFFagchMzPYvgbt6JgINGPSJfPLwAjtJI3J
 VNZwFNUkXOWKEjABA5u1mxHbOACCF5rm0eo3qQ1TLSxO5OPoZHjNga7uILjv9nw6g1f2XU+/2Ya
 Vlhqhs6wzf9api9IUOnHK8rE9xezMEY+CSGTbqtnhrAm8k+K4DxUCy5Gjgg2+qCYqssdMd3uXhu
 txHwtS3NRDgW6Ukei1FB9bucQ+dMTa+QdLHTJciuLcDGJbcur/LyXLcBHisR0JWdRoayU+4fbAw
 /YS/QopdqekFPhbJGyBygMla6qW9hAoDep9tS1VRkP50/ZLhUM/2WGwwoJiizTkiI38YZkPp
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6865b6aa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=ywvnwGVb1iWAczny1xEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: cJipf3b51MvxBpmD5oNn30OSFeiv2Gi0
X-Proofpoint-GUID: cJipf3b51MvxBpmD5oNn30OSFeiv2Gi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=840 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020189
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

On Wed, Jul 02, 2025 at 07:14:43PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Make the dp/hdmi_audio_* callback maintain the same parameter order as
> get_modes and edid_read: first the bridge, then the connector.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> Signed-off-by: Andy Yan <andyshrk@163.com>

No extra empty line between tags.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry
