Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240DBC6D38B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6730B10E22D;
	Wed, 19 Nov 2025 07:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QF6UHhWC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLO5ND5x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40FF10E22B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:46:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ5PlJB2926832
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IBAqYgoC3NcK12CXgRQqeftd
 fh5IwqH1tQpsD0TalPs=; b=QF6UHhWCcN+aqCmp+7GGR4RkddWfnoaHU/QiqDXr
 t/7ypYsPxmOcS/0jY3++STggvrQ0E3nyukWbl1H82WVaTVcEJ1GdIJQ+wCiWHCbI
 gHL6uGKurZmweMeXPhNMxhX6wu8DgPf4bfElMvqibt1nCtPGXNcjyYvzY74zlSrX
 lBZ2+jSajX/lGCXs5ch65TuP2r5Xq9oUIA0Pbq0g9YdEaGzOqPYP5gfJMUK/0Rj+
 7FQE/By52rH82zCHURcafIJfWoEXBwMNfgB1tzHjQJEGMO2kqkkGme2n4wbn3luM
 FYKEwWeUEA7lazWEQInRGDJdARS4mI5RHlX4qBMxuplzow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq293bbn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:46:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2ea3d12fcso886385885a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763538391; x=1764143191;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IBAqYgoC3NcK12CXgRQqeftdfh5IwqH1tQpsD0TalPs=;
 b=bLO5ND5xuCo8ZIuFQi8ou8RJiQaY6DYSNh3R/ZLLSXXEHfPp9xrKVOIb9VbB1apTiU
 SvoCxqBy0nG8+gnVTDo0gvLpKR2r/hiKWVdhy471WJ5H3RuvRetGMiXjxTj4mnKDjBf9
 nkinPTJD95h+dNtFz/2sEK/fBtYiz10nrbqDXksT5t4v62TmcoQgaBJRtW+xBfpjqa02
 aqMW3oh0JtcZ15gVQu0Fs7bApQTIbawA/Zl1kvGS9RsW6nhmkdPpi7Ib3SGtgDgZDTrE
 +DWYxyD3C7r/uxCywxsnyh073x7bjWaAi6iqEbQAeReUWj5wTlfW52mFf7okMguquWwj
 9g2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763538391; x=1764143191;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBAqYgoC3NcK12CXgRQqeftdfh5IwqH1tQpsD0TalPs=;
 b=bKvmjJydKrckxa23MRzfNYLTZkytw9eY9gcI4ObyBPusIA+Bj4BdzQLcgBoaWQJJsa
 024Gwx8voRzCM0o/P7mmjbJeSe+PXtfrU/tT4QHzyWwjBRRrrarFxVvVSYcHLiBY36YO
 60qapFMJr6wWWzEWKH+glnQwoh64LNBT6Cs5u+UbGS+OkQ3BTzz5CoyFh4G9/sj/D9A6
 xX1VHCreOdIZiq838thqsVPVZb+KRGkIhpoxhBaxsj/Gkr0533lW00wCEkUg30kBWpZo
 HemhbeDpPJkbQSwrMmJcvb3l+KhGTS+NBBZrv5iT4FttqchGpUpbwmwnrfcImgyK5BNW
 GfBg==
X-Gm-Message-State: AOJu0YyVXW+xYgx1I1pCOTHhbtlc0qYTabPcgjH2HPMc6uzdLaJvjm9Y
 K6sNuwTXQAaciGwfBxVpRUBkVgWMdpFt/xsjffoj6RdMWGPrF+pEczqTXPxEI54cDQLrlKN3NuE
 iJi2/R8xOSUcYoe/TkgykZFk39JAFS/zaBwsMdOsBgfoAQN5xOjeoTjpXsh7vl5ppxmu2j6E=
X-Gm-Gg: ASbGncvELMtFekfOgZ/UIgPxo9rxa3xpFdrW6R3NjALTYhN/oWM2j9/MQQ0a6MV4voZ
 SIbXn4KdcC6nxM821PWDHmCB/k6IJ+ypqP+FlNl462zjJk1uIP/5R93o429JO+jfHzlYgCMSlXI
 I5oyxER8kP+6Rssgt19OhRgwI5TPbl/xkml2UpnB40UfuMPJHJBb7XYrTqYGEI5W3H2pNwkrHVT
 OJh/+xgUAeKQgqWs+TJxwwoGRS8qePXEVLmqgKMtdTyl09Kdw6cf1ridD0PxuMc4y0eykYunWrh
 8ieH3z80UzGKQ5LnjMgIFfgQQvaoC5+6EJIiw6M8Q3p5fOZEGNYMMJGU5ofKtkfKRP2GScqmtZh
 AJ3ty9mnvhczDe6F7RuWlnSUKVoc9tGmWLr/PepRorZ8LaPDsEeI2/aw/dLpEeqxVqacxG/tff3
 t/GDdeEO1cDmXRk0435FGYkbw=
X-Received: by 2002:a05:620a:710a:b0:8b2:6ac5:bcb1 with SMTP id
 af79cd13be357-8b2c315e7a5mr2293268685a.31.1763538391306; 
 Tue, 18 Nov 2025 23:46:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA4wmrNSuhZVNftMGwtfc7b79ei9agDO14Bwd4qs6lnZ5oWOxk0tzIjAsylJOdfgDSOk3CUw==
X-Received: by 2002:a05:620a:710a:b0:8b2:6ac5:bcb1 with SMTP id
 af79cd13be357-8b2c315e7a5mr2293266085a.31.1763538390794; 
 Tue, 18 Nov 2025 23:46:30 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803aca3csm4498327e87.5.2025.11.18.23.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 23:46:30 -0800 (PST)
Date: Wed, 19 Nov 2025 09:46:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/registers: Fix encoding fields in 64b registers
Message-ID: <jzbpw7arty5zlisrd2m2na3x6birmyrjxc6l2agimagdgq5m2a@2rltprm5bbcb>
References: <20251118150715.201623-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118150715.201623-1-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691d75d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Y2wA3AESBAQWwZuG1xEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Do47oaP2UGnpka-V1K_LBlt468DCWqIR
X-Proofpoint-GUID: Do47oaP2UGnpka-V1K_LBlt468DCWqIR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MCBTYWx0ZWRfX1Tu4K0naE+Gy
 PjpSFfphEWVPsGFLsG1fP0FDhdc1RDeHEh1xBQyZaGK3I6yqvfrrS8t6Saak/NnpsH6IEqVy/+e
 TOqQXhtTGUXljmtTmsOmySjB81LBryOQpSYqpxfuEY+tl72xfRvsUlskvtc2vI4Mph25hFB5yN/
 Do2WCqTHlvwPTqOLXjvG4C6Rzhss2cuT8jvyWuWcZotbstyJaRrn/ZMLR1Oi0isy5W2HvIU+31E
 UNfYIJYC1WEKveWwX+OAuBkgYypNtE8/9a1u7X4QpFmBE2HeRB1PRJaUqT+Laqn/SpzT1JEJQWF
 MGdczjvLKP1U9zrzJzGIdh+dpMFsObOIOoU4b7R1S5nxwOPXNqesyQkiSlZB4hYB6Zk14Q75Rag
 8bIT7mK4gcJvjSJf70THRNTZphFsnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190060
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

On Tue, Nov 18, 2025 at 07:07:12AM -0800, Rob Clark wrote:
> Based on mesa commit 3f70b0578402 ("freedreno/registers: Fix encoding
> fields in 64b registers"), but with some fixes to not skip emitting
> interrupt enum values.
> 
> Co-developed-by: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
