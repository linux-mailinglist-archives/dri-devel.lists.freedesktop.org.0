Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77781B20583
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D5510E434;
	Mon, 11 Aug 2025 10:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="muJKlt2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A3410E2E4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:34:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dKpo018337
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=muJKlt2QHD30b0PW
 KCf4MMfDmKz/Chb2p8V2b1lzpymdYwgT5IafpJ8GsAtII2dqKbGBQ2V75pI5FEuA
 6gTh7QPlryeJRU5t1F0EDOoeZnG0+tsbNzZlrfbzoioXA3mBaHW49S/lSgCfqRFo
 9d3ac/8ptkZ4+Bfdr4OMEb81n3U+eyKPRYj2BvyF77YDfIJ9DowsHzMu8ZEYbHeJ
 HPWS+xpa7XOsdYt6MAcAEtut6r/+tvsHpe2KNqpvB8OVFhxwnxWKAjXrFrq8qo5a
 ZOrHnnQTio8fCBfr2yj5ItOMkO3olR0aNOXQ9e/XFBOXwWtyTInSVOOecJQ8AN5C
 /wkNxA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g406p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:34:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70989fdb7f6so12665656d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908443; x=1755513243;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=L/sCCgjl7CA3AytlgdmHBMUkNBE27zRJ7ONoEu+n50I4h4BHhlV06XrYPHsrLBWZI0
 VSelHc+fixbcQUutGq7iu++8Ym7NuUxlvvT9lh8gMlh0X+079LUmtur+q30cOX7dX6ur
 fi6Bvj8AHx7ZR1zUBs9Ru+EraYYT230IeUmoveZmvqagNmQq9UHXPdvGwjF2yg87qWIN
 gLSPjaun+v5hCskfGqdx31yskYaBtmOgEnPB4/0N27p6N/CsrWOpr/dGS+/veB5+yR8T
 cwi9NvnTxbkpitU0GDgod3uTKERjAWKS7Z1m1SO88XIFY+NbCKZEkdmwkS7oQPIbriWh
 A5nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVzZ0kJnoFVaHtqhAeTtRwwksnhaU/Nk54h4NiW9I3b0LcXn2B08a9h3a+EPuGrpnF9mO06tDbHc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoPpt/3DeEarYjd/31XJmMxbOxVappHlVm91nbWZCKVDb+XIVb
 GUDQBOGFLz/ks8T+fhe/jsiUzsObn5SsY1DCtkXIcRJOQIS0jLZnJXwp7veUfZe8MupQU4c4d6d
 U9Mo4gwA+WINlaXbkSR1x0FjLVpb9joqkj1ersjM6xcSF+YmIHAXjie+JENiVWwqttp/2mY4=
X-Gm-Gg: ASbGncud8whTS0PCNq1260wIn0y8QkRGAOfI2xiyDS87i1woMXwsen90QX8anpf0Wta
 eDWiUgUYjBOiFxVCpPa2fOsLfFbRdTpAbm40G2WRAUeWekeA15HygUgRxE8NSNGlXi4VT1V2dlW
 JGLOeV+8lDR1vymjLs02TL2Vd3+eG1JrFj2bc/XFMm47TtVLSeK0Wjqz52s8dG3kudXjKqzJY67
 ylHc7Ce/ZmsP6imUhLlJrZNuukpZGb0RtblCDxKKYMqr3mTcrM3wDdacVtNSdWUXzBIdgkItD6J
 XVsQw4j9sIz5zgSZo33OsvbYmaZqEef+PLOWMdLjDnBl17DnvHGGdmX6fytn8Mv5VagsvxEwoTY
 S0P+rvmfj4aNO49vGAA==
X-Received: by 2002:a05:6214:2608:b0:709:23f0:f50 with SMTP id
 6a1803df08f44-709b094cbe7mr53402296d6.8.1754908443223; 
 Mon, 11 Aug 2025 03:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpXju1O/sKkYY/b3BkoXU3yRD84XzBcfZoJ/QUx+rjP0trH4Je3JcbjdMDL95C2fO2CoviQQ==
X-Received: by 2002:a05:6214:2608:b0:709:23f0:f50 with SMTP id
 6a1803df08f44-709b094cbe7mr53401926d6.8.1754908442594; 
 Mon, 11 Aug 2025 03:34:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:34:02 -0700 (PDT)
Message-ID: <0a3698bd-01bf-4882-b41c-426bca328e40@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899c71c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXwAk5xzqjrrjv
 p2UUtj5HWmtcHsmXNFaPFVjUG7PdUTkXG77TgqYW80kC1r/gD1+vbGC7WQquh/zbAhbe3Q8jTw/
 x1w3iCdMzpPCEHqrR6F6DDqWcOlFQil9qPCEZl58HAnSE33NfjfiF5sDpJrZ0aVNvTqx4rxg7Ox
 jcVARYVtshs57HlIYpc/mlFYf4jhIr3SQRZFyL+s1ptiV+PBeFvbeLx2IvBcDasBsZB1MYTPTnl
 ZS4eJK85dY+hZzQkXKeW5q4rnrzrxpktxrp52nP5WTJUe9NrhelporlRT505ZFSUykG5qxGa/0J
 xgv+5hmwmVTwlaNigTf5rlyClwPfoKVW+FjFqXEwYaToFYwWXYiHXbm7emoF/CXYsLQ0gqgohrk
 EkmY9gzm
X-Proofpoint-GUID: vpMwYxw18BTzIb8n7yc_b6y28pCD1qle
X-Proofpoint-ORIG-GUID: vpMwYxw18BTzIb8n7yc_b6y28pCD1qle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
