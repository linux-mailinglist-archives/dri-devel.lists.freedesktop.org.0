Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66757D1017E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 23:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9839110E16F;
	Sun, 11 Jan 2026 22:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfhwuijR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8NRXyl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F2910E16F
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 22:43:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BKt2Xa3368611
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 22:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Faru6CUzvpC9D3oH/nq2pvSx
 ZQHDpHYFbWCOcDMAIcw=; b=NfhwuijRI/XJ10J2lfnowsT0HnkzmKrQr4/eLW3K
 UEGbDBUdOrbBaIke78lJcRxR8Vab02tAYfESSoyuynOQfcq3f51SEu7VoVh9lADD
 BLkv+zAfGWrkWW1WDjsAIhVQKe3mLBIbnk9nzMRExQwsltfQB+bHYROLb1QW081b
 751Datk9nEAPJyaDnO9/iZJxsjdzRp4cum5E4CfY1vtNAWMnXK5f0nWFGhMZdCIs
 zlPuLkfRMNrdksvZntSj4Vky3TrwNr0IINQUjqD13elBSZJzI0OwG4W2fqElyuKj
 /tjuG/bSZ2LO4ugmGTKGE9I1sny4KIpHRMclT9B290YgGg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxthp1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 22:43:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-890805821c0so187345406d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 14:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768171402; x=1768776202;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Faru6CUzvpC9D3oH/nq2pvSxZQHDpHYFbWCOcDMAIcw=;
 b=b8NRXyl+5Jpsf4H7bNkxSXpRV0atFljPoGiK5Rnt+p3QPg6qNlH6W5WoHlKsYUp6Cd
 imPAC1ptb8yESBENQcB8t8qNLpD4AnY5o07d/kYSQcLNk7W0oTFmcB6K1DUz4LQR22Fd
 lhme4sxNBeniSlL+bzYaNeQuSKtyk6ek5UTjiyZFrwd8MbNwH3qPPUwg0gK7i2tL/FPc
 cxo8upCfGomt9V3HgMoIz/upntZyiNtY4WvC9egpJ5rDwB/+5RVWFKY7c394QL6hWgKR
 dGeAbNZVkX2yjjkYLL8f02U0Uuo8loysAatjs1QVFZI5cGR9e2V8d+BTaftvpAl9/Guc
 dFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768171402; x=1768776202;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Faru6CUzvpC9D3oH/nq2pvSxZQHDpHYFbWCOcDMAIcw=;
 b=Y6lslxh8QPrYLxVLOp7AreOiFkW+1NJuBVNyJSjRsy2PfphsDRgrt06s8M/0HqPoPq
 s+KwnrL8JQB2QGI8nD9x6FZA+6+4CDydkRgG6GYGNcxQiUR+KaOhMRy6SIwPC7hVerht
 06JXV8491uRRUckXRzkyh2sF2U5X0W7bIVFb46EbLdH6I2H7OFkJ7SPnfOL2sPlTtpUA
 Is2v8JcEpKgt4J6Tmuqnn0ZRHA9Yb9xNWwNnHfO9zkJ59XSQqhfaMsi2Q32PULghUdVP
 j5IDUzEkMGl53byPU94KoXTOiqdaIkQzSDmVHH1m27YJcK5w2xnFoaVneODsixAdS5rr
 v9Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfU07ZqKouz7+jlfyg7xif9LqtCYMCjOFYu6jKXFnef0NJ/+N0DawnGAiUM04Ph1WaF60BVc7EBXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9Xs7EjTRvcff9mTKzloCeBWChWZ5FEGpW8/oarQA1p8NAu3LW
 SbTrd8cudvmdf2jzHkIG3qyFDm1t+M/2iFIc398pN0W11heXzsVFqckyTojKH0UH+OENdiG8+qf
 gJDUo+VP0qrBLRCQtlxk+OiDH+qtdDErkL9yiJG41XmJ/mATbF6wvhEbXgcyFQXlrr0YvXUs=
X-Gm-Gg: AY/fxX6pIS7yDC1lO8YoOEXFD261Owkv1K7MXCNBnPaGGzKAhzSkjz3IRjNL6WrkkR/
 Z+oTU2LpC1m1n84jtVBGIkYTyAqz8dWRQB2i1AlExjOwteqzuDea/9q5I03WbH7/v3pLE1QuL8w
 nCv+0Bdl/ocz0J5ngfNXzcUYcyB6wrswYkbcpu8nLfTGt/tciWecpA0m7cGiQE/M9y8gsMzmxpo
 b/TvLfI0biEtUwfeLV6ZPoxnBpFCfVBJswsfKpJYQXXXGy0oAsrK6wNyGxIi2pwBsZXONd9LFsM
 koHru0Gtjgsc9SQJ7oukDU46XFToja2wH1VE6ARwZ567HbbHWqbn9h5bTy6CA9JYPVzEkMpfiq+
 9t6NNYTvCgh8/eszwJ8KEnfQuoaVkuhf63l93hZxUFvQOl7TXnnTjmxfDaLBh4mWj2MwRtEK8PG
 Yyjec6lk366O+Cs6eY0XUUEYY=
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id
 6a1803df08f44-890842aafeemr249835776d6.56.1768171401762; 
 Sun, 11 Jan 2026 14:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEthh+n2T4dXkL7d0hv0bhD94TCKrGq5BGhzi1YhOggBEE5NkjcgeCy5QYeiQcAKszgoKM5pA==
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id
 6a1803df08f44-890842aafeemr249835456d6.56.1768171401291; 
 Sun, 11 Jan 2026 14:43:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b79e11154sm2643050e87.94.2026.01.11.14.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 14:43:19 -0800 (PST)
Date: Mon, 12 Jan 2026 00:43:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 04/11] media: iris: don't specify min_acc_length in the
 source code
Message-ID: <4cvcpvobzlcyaqzy7ewhgc3u5gqawt7pa25dz6jkhuwintbkxp@ffun7t4bot6a>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <i1eMEm9fSpXb30tw6zP_FKeXfJr4sD7bS88njLCMUniDy_QNsOiVn5w41aA0zXnLaVRNFLaLrHgr73Yo2XV5lQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
 <d8f6969f-a58c-4a02-a59d-f608e1a95ba7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8f6969f-a58c-4a02-a59d-f608e1a95ba7@kernel.org>
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6964278a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kMIBw9bMVBG50rZdcTUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: po_3fm6nNJlLSZ7ciEjCg7UalQAGMicE
X-Proofpoint-ORIG-GUID: po_3fm6nNJlLSZ7ciEjCg7UalQAGMicE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDIwOCBTYWx0ZWRfX31lp5y+31aCh
 8ibpo7VXDQp7Oi423Lf8m54i4x0jLEAqY+56fLogVC56lc6+BYpqRa2droTYySUnAJJmPYth57A
 5d3PGNpygXgP7tpT6cgk+9I15oTvmAIVqfsoimiXtByC0pNJ0+oMDjTUl4Umow+D52uL9jQqj5q
 9vyUQVY5aP3v5K7k3chSzxMg32oPtnOJLfdyJ24yoZpL2nh/IrTpO4eFuIIZS512EmRP3P4YKty
 GhW3EpUYqNTaF29aa+jYiV5UrC4oNJQ+v/PDxiRuso7ervgBBOw3bHKk31m+/WEd73pUYIoOUsT
 I7zK+7JflSkFtQzZdwJmww4UWJvWkWqrG94p8iL2UlQ6AJdth51BzgPEUiM/2k/hfGnadNUty/U
 6K6wxvKXphIgRwAFjXaGCPj94PN5UZN1cfU/MueGCo1239vjp13ELrmoRi9FnoqJ53xdSpYwWRr
 ZjvK2L5BzALf1mi0Iaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_08,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110208
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

On Sun, Jan 11, 2026 at 09:06:52PM +0000, Bryan O'Donoghue wrote:
> On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> > The min_acc length can be calculated from the platform UBWC
> > configuration. Use the freshly introduced helper and calculate min_acc
> > length based on the platform UBWC configuration instead of specifying it
> > directly in the source.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
> >   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
> >   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
> >   3 files changed, 4 insertions(+), 3 deletions(-)
> > 

> > @@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
> >   				    &payload,
> >   				    sizeof(u32));
> > 
> > -	payload = core->iris_platform_data->ubwc_config->mal_length;
> > +	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
> >   	iris_hfi_gen2_create_packet(hdr,
> >   				    HFI_PROP_UBWC_MAL_LENGTH,
> >   				    HFI_HOST_FLAGS_NONE,
> 
> This code is fine but, I still suggest changing the 64b postfix in
> qcom_ubwc_min_acc_length_64b and just having the function return the size
> for the platform as _that_ is the more sustainable way.

See how MAL is handled in the DRM patches. If the UBWC spec is extended
to allow 16 or 128 bytes, the drm/msm driver will need to be changed
anyway to cope with that: driver uses flags to pass the value instead of
passing the value as is.

> 
> Up to you.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

-- 
With best wishes
Dmitry
