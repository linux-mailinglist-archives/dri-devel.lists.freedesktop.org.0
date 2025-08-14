Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF44B25C91
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 09:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2045C10E7F8;
	Thu, 14 Aug 2025 07:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNNdrRpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE1210E7F8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:04:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMDObu027018
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZmTgSJksSvRsRHlh4lCCGxN6
 MG1QDdCZK4fWrb5z4Xo=; b=bNNdrRpQzXYPs/ayMZz46oM2FkiixC5Y6AUFBN6+
 Kdm5eGANHD1XRmxt5Mxt06M6At9w1ezphHaBefnK4/CVWQPlL4VjNtTdDzevnpaW
 BsVtgQ+kpAgX1HpSb51ttdWyDiYIedwu09WV7DEVwWnW6q2wyV43XAGH51nwlkGh
 aAqTzsJi8hJv31PJybLHtZpbkU/S0HD0UDub0I34pGIo08kQ1gjUXV3JcHI/ISNm
 q7WgS77xRtdkfzdGvlkutBiV0B0jjClIgIhL4SJSx9iSxdAJ1U+/wWGcsZ+cD4B1
 7qJQ9PVKO+Qk1uAp+n7boW4xV8uh5WZ8Dtl1gJHHDZ9iPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjtj73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:04:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b1099142e0so18043621cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 00:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755155084; x=1755759884;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmTgSJksSvRsRHlh4lCCGxN6MG1QDdCZK4fWrb5z4Xo=;
 b=D9yZbYNLQrkM4J0doKOKVJqp4FXWCoKL+5PoYKUXSKWDkzOcoNhIMMscgybqdnFwC5
 9W4rHOj0EwwqwrVPYZK99SAIPm6TuQNCRR8usf/zV5mGPgsu2vGnudLAP1JLPe9Mn6G6
 /K7+adaxBKTtZd1IhPD+keqCSo55ahjVai3fj8SgZ3xJ1cSuHPOPEqjjDM9yH6Sq7KHM
 1wxJhIVx++eQLF+IBP9efxuHb1v6dAsB1Zz6cP0QnN87ZIfVcIH5GgGq1EV3yiIhPRVS
 g2pG1MngLt0e16RbW/BMpFhq+pAoEgOYdgfvOyAw4mqE7veXsRGPSr50C/fD7t7eUEOc
 +ADA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfL/Lx/5wUcwGbK3QluX3KnhWTwqMAUW6lVr7HmYSgcu8SHG/n3MYHzZopzMwWkGpFemp5UXIlwBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxrrum4sgdXdPD03LuPIKyKQKJMPtXnvChhaGAL/hharfwXsXqG
 TLRo1SWNbwLYe9YOQ2NyZi/t8tMZYlrvIF2spjHmeNfTstukXIKcxKwOkuUX7WfdWG44fGJ2Uex
 eY9IfaZ81GSMWu9qX2gULUl4FlWNEFOYmVXwvT39AJxGIYoVFXA2dbxq3V4bl5UmxwaMYK4A=
X-Gm-Gg: ASbGncvtguL9dC0bFeEXJld1RFnyj1g/SQSXxNeIrbBqohynHtn/IC2riPTz0m+gUK1
 3/c4ik4rvoc9zJtcyt8SxfepJopKDBaqRNGzzPn9lPglLnRzF5ECcCjlMmihKBpPH+6XAUxQvjL
 KcGQk2PLE6N0yYIRDPchncyrY6HS92qjlLV22RaxtFQ2Jnm9s2g9+5ZYjyP9T2QQLhpNRILp8F0
 594wnj7YPzgVmyTOBICI++cEK1gk357ZH+Cqvmw/7zuT01zu6DdvKuLNhhY22aCRIEf/RskZ+JO
 twOVA87HNlZKCZKAI2UA3H3+4h1JJqfVxEDUC5eJMfGkwWlEM6zyvNoLywgo6GxvjkvXalPT5Md
 5rDr+4IeT0Kv4dnzwmEXHZaJMWg3/xkQdUIM5i41U7A9k26j5OVbX
X-Received: by 2002:a05:622a:50:b0:4b0:863b:f4e6 with SMTP id
 d75a77b69052e-4b10c3d1082mr18771191cf.14.1755155084595; 
 Thu, 14 Aug 2025 00:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf4GMEnU9+DKPNr9nEosmOJfrXRZRGgqiLTRtxITAX9r7U1qxrwlquD8TRJWARcRaI1vnUOw==
X-Received: by 2002:a05:622a:50:b0:4b0:863b:f4e6 with SMTP id
 d75a77b69052e-4b10c3d1082mr18770701cf.14.1755155084097; 
 Thu, 14 Aug 2025 00:04:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cc8592678sm2433329e87.31.2025.08.14.00.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 00:04:43 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:04:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, thierry.escande@linaro.org,
 quic_vgattupa@quicinc.com, quic_kuiw@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Fix fastrpc_map_lookup operation
Message-ID: <nmipsdulp2roagr5g2emrijonc4xkupoqm3vdelaiihy547qlk@yvg4qmg2qgwj>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
 <20250807100420.1163967-3-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807100420.1163967-3-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX4AXv3lDDp6YJ
 cB7SQv6814mny4maaNiBZrEQnp+Ux/RvGTnxVYkK4pdvDEs2vj2w6PptYdTdMJp/4os+tbb6de1
 c33LhTcKj+domt57TaF4bRSZ/2u1RC2iBkt4coQ7yGq9y3naEoaF/33OtaWcNtAvOYk+5HFgZBw
 2MJjsLNfe1hiNyqISddyeZVcble1dgqAy9oUMMnQSrw3ge5mnc0vRG8Dsl+WLaKbuNO+fCE9QQh
 oiKPF6zKwQYHJrlO8xP4lkDVDmgDyOXsAdJTTMSqN00FWqDREYKel/6c3d36iosEYERMtCSeG/y
 7/kD3leV4TAnZ3fsvNL18/61BUzn3KJPBqTg6OJ1+jaEBl1qks9nsEHFigyzJ3UB18+MyNL7932
 +lmBK6Mo
X-Proofpoint-GUID: 0oE4PNDxxw547bXTCJLrMg6JvRHpMNMe
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689d8a8d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4xMk_dLyLN26lIRFNMoA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0oE4PNDxxw547bXTCJLrMg6JvRHpMNMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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

On Thu, Aug 07, 2025 at 03:34:18PM +0530, Ling Xu wrote:
> Fastrpc driver creates maps for user allocated fd buffers. Before
> creating a new map, the map list is checked for any already existing
> maps using map fd. Checking with just map fd is not sufficient as the
> user can pass offsetted buffer with less size when the map is created
> and then a larger size the next time which could result in memory
> issues. Check for dma_buf object also when looking up for the map.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
