Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E8ABBAAA
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201F210E1F1;
	Mon, 19 May 2025 10:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCUAB4sl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C4E10E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:09:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6OQos006080
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gExLf4nwbbzsn1CvTmMpFR5H
 ZTE/Vz8CwqmXdpCSURw=; b=KCUAB4sl60Ppt3YijVlmoVsb8Unpd8+mrp6udLpJ
 qZKpXt6MXcXL3kQ6ucflGNWwi85JWfEAwJYzEDhrntAgbGzeJF25h0mXln4oCekw
 Lm1cZt83ndl9Q9KQvMlxqK1tICEZEe1GgL/fUtb8f/PwHrVGQfw1Wr+Z8/+5Cj7W
 TQv/PFR/kf5Qk85UzOjqh7CiPhGLX2eXGIOoWZ3HnKv1aq5aRW+x3MzJ/vpjCY00
 b2PjK/qN2BJEw4HWdVFx97YEgwgedsm7lw5Xd5rQe18dVhXW860AxNFPsQFOsQmY
 A4SozEEBn2pIiSSj4418jCKGa36pMqaUILVjuA16AOfDBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgq73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:09:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f2b50a75d8so65319376d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747649344; x=1748254144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gExLf4nwbbzsn1CvTmMpFR5HZTE/Vz8CwqmXdpCSURw=;
 b=kTr/5HT0HX0u9qfp+m03I5kd9fooc1m4+WTkybbHqtQHZg/cPHedYmUEQ4/4VGxW/5
 xYrywrVIaORmCMPCrx5z45FoIdou+WVxM5QYjC3z5v6WmDntYcmYm5CRacRydSTRV5LF
 V3OKIyUQ7X4KsTQJS0fvoizCRqBIXOt/YdTwipbSnlNEU9i9e4t+tRkzjShQItPumHj8
 QqcUxAv5PS8mjxDZiSkuH60poAq8KthHiJnZq5Tsp2a54wyXkt7A2PlYZl8L42oooljK
 52ANR6cTWSLYTQb5NYN4kWJoYe55jKMkKH3xeRmcQW6BsttD8D6RGEXEnKInonnf7iYJ
 z1tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7TPAR2tkBtEpSFvDcGBqa0UTytlF4EXoGNYqCIa7ITXQmH9/VctSERrOuZvOc4Cd0q1eje4Le4cI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx28cNEKh9kntyCoRZZgHstKigXJUGb7qqVuRNulp9sD9XeVvYc
 wU0aToBiThc3YhSRyI7QSknPMRXWEXNBwlzTxCAVtM7oWnasrsp2uJcNXiPHFGCUblmDvH17pWQ
 p4MXPm5ZGcVigtFK1KSOnpHAJcGmypPuGmPwLrDgZD/wmamSX05fv4GbilwIr4Mxyu0HE3C8=
X-Gm-Gg: ASbGncuK4+52aPvMj/vnmEIhF76//hdGDrp+Jk04Zi0JzcZueDhl9/nlMOIKCfb3+x9
 hoQfcSjME5fiRqSQ80bRI9bPOD4TCC0aEppRdINBk4bBKNFv7B35yIRC2XxFMKAC2OpBgjOPQ5D
 Jub/1f/Wq1AhZ+S8P4wGLSvExPYYLqp1w8+34ro2b9sAaUBTR2WUNJBb9SxJzSBh/5ycwDNwQyJ
 wJXpNussCp0xw01MAU/snPA2ETR171TT9j53DkridXi2JiX++gCwLN7WO1Sg3/LwbqrOalHZtmQ
 3XjgX33lHLfiKnPQ7wxsA5BPKPBY/2walPFoMx3vdBwhGHRPzn4qD2Ti/P7k7RSS4gfjZKVJj+8
 =
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id
 6a1803df08f44-6f8b2d27bf1mr198284896d6.20.1747649344540; 
 Mon, 19 May 2025 03:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9ZPmRny6EDXEzeqxSWhOYSC9IVMwUrrHfsOKmrKjR0CQOZFAukV48bhjo8vjKXeN14CN4ew==
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id
 6a1803df08f44-6f8b2d27bf1mr198284446d6.20.1747649344157; 
 Mon, 19 May 2025 03:09:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084b4becsm18483831fa.12.2025.05.19.03.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:09:03 -0700 (PDT)
Date: Mon, 19 May 2025 13:09:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <7svn6kgajzw6p7hxw3zzjbxz7ipakgv3gacbj4v3gxdw5ssdsj@lvj3hxn7qxu6>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
 <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
X-Proofpoint-GUID: t-akosIpXLWsllahiUCn-DTY5NK9Sv5R
X-Proofpoint-ORIG-GUID: t-akosIpXLWsllahiUCn-DTY5NK9Sv5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NiBTYWx0ZWRfX4kpMfija2elw
 LrOWmNOfr/9NBb0zpWLTEXw8bt1C1C8k4tBc58eek9cCdvFc3+qvp0ntpc4nyhf99KLD0ahUwWX
 krjYLEQzcyGWCSAandSW0O7P4yM8rOHAMt8z6N5UJxOmwtKkQ85ipr9QmKorlP0uqk4fqWZZZiO
 nOUb9bNkEcigHajYvy2GYWkA+im0s0l6O9g8B/cjTtqVkiNnTYptyWC1X1+zupkZrgc6jEwHLBP
 ynPl+PSfpLQSQ5i+HF2NBmJguX0Js25+tl51pwoQ2zLeVWQ8ScOz+pClDunwyHMt+dowB24WyYe
 ngNScO3J3Nl5vlX2arLggAn1UkO8hrPs91iqRWfxJRlUWisXDqelUikXIVkvQeoRQrfb+gWCGU2
 bq2LeFnMfVGiZE5fXsN3gQgLeukot1oLdnLQ5eqjFluJqFUCGq19F5fmsiaiWdlW7chbaetx
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b0342 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bUqMqVa3r73BJlF5iGkA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190096
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

On Mon, May 19, 2025 at 10:25:46AM +0100, Srinivas Kandagatla wrote:
> On 5/13/25 05:28, Ekansh Gupta wrote:
> > The fastrpc_buf_free function currently does not handle the case where
> > the input buffer pointer (buf) is NULL. This can lead to a null pointer
> > dereference, causing a crash or undefined behavior when the function
> > attempts to access members of the buf structure. Add a NULL check to
> > ensure safe handling of NULL pointers and prevent potential crashes.
> > 
> You are mostly defining the code here, but not the root cause of it,
> What exactly is the call trace for this crash?
> 
> > Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
> > Cc: stable@kernel.org
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> >  drivers/misc/fastrpc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 7b7a22c91fe4..ca3721365ddc 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
> >  
> >  static void fastrpc_buf_free(struct fastrpc_buf *buf)
> >  {
> > +	if (!buf)
> > +		return;
> > +
> Most of the users of the fastrpc_buf_free() already have the null
> checks, It will be Interesting to know.
> 
> If we decide to make this function to do null null check, then the
> existing checks in the caller are redundant.

I think it was a primary reason for a change: to eliminate NULL checks
on the caller side, as we do in a lot of other kernel API.

> 
> --srini
> >  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> >  			  FASTRPC_PHYS(buf->phys));
> >  	kfree(buf);
> 

-- 
With best wishes
Dmitry
