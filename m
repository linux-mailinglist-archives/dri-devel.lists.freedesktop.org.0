Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52208C858E5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800D710E270;
	Tue, 25 Nov 2025 14:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FII+UDTF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGxvpCLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF19B10E270
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:50:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APD82Ft3317683
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NBjlQMU//RTWAkorh4/ODMcv
 htK3cHYCP7D184dJl64=; b=FII+UDTFnOL+XzmBc2WkRkBqT4Ckn0ahpJef2xGO
 RTXZXUZ3Bbxji8PSpJHya4wLhdryyJq1TPxxm+i0kgpRf9GKkMW94sbFH/UGYwaq
 5TGChqDK4RSAS1k04F0wgqBGnrN0pIAObpNaQtFMXW23kexu0v6rzurXbIJocMxY
 lH76GuL6SBbLvSW1be+3eNu+2GM7s11u8hXRlxNLuj3lEvMwhQjRq5RtvDfXjwDE
 +Y3gu8vD7rLP7cdVuwduscn18GlmtK/z4Zr9mWvT5vacerwvk6i1ojCOIkidKvV/
 UZs/rGCz6JqO0w31oN1MwHL17gBYCwyQYM7og/Ir42ggbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qg909-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:50:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8a1c15daa69so432173185a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764082216; x=1764687016;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NBjlQMU//RTWAkorh4/ODMcvhtK3cHYCP7D184dJl64=;
 b=JGxvpCLibC88D3pq8TB0Oq51xVYcUDZrHHs0KCzsH4vOia2ddvt5l18DRYoRjmNhQd
 Ze0ojSZB2G3htNGm0tfqcdyi5HKqM/4fMh+xBGcrZ6elw1rGYzMIpai2YYfzZ1FyEziW
 DP0M96l7rx6uSSfeB4qquS8udmyHYz02f4+FBojob/PkPxv8cAH/XwOcsSFzBJ/XUZFK
 0p5BjyrwmRjg8mX+is3lP5VG8EouZBLP8TghrhzKervHRPCZhufGCSUNLXoIKVI6xI+C
 9tlOu4O4izrjglo7+YfX2RC2e5BIaNNMUodOk6/Wax9fEbBmm5dVl3RGJHFaXIWxPYfa
 1XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764082216; x=1764687016;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBjlQMU//RTWAkorh4/ODMcvhtK3cHYCP7D184dJl64=;
 b=ffyHfzGTeU6gmNBj/yh3AXhERZWwxuxbNMwQPYBTBIaG4lcEpLQBvESd7YzUk4FVEo
 iUMYdVBKOoL5s0hoWe5S9ZuhMd4T4FrqYNZNfFDd1BnVi1DbQvB4R1QrzKUzmpCLlvrm
 ABHVF2HvIfPwXHLowdFmylJwXbJ7q5DLrkVI3N06xRXavGY5b8Lblkj8yTpnGaNli6Rn
 rT108J5Mhnokojz4NpvbIk+nqdpcQP5DkCO+Ckid2G0UnXP+/UFix1pCgtoTSY97FAK2
 xMkOOrPSp+dqlSCkCVp/ukvoWD8UtaTT1YfMKyFVdELScQugY5V7SSa2swL3tOryuWea
 fe5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTLfcNaKbLFGefzn4GV5D6XHdwct8veDhfdDbTGJkE0veYX42wds0gO4xo73HpmbgHwofMYbPlR5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHQx4iVTmhgwkqX7a6dGAvZk5KIu1uC3ZovtueLgafYiv5o7Hb
 heGJAPnRSE532XhuckAKQKOST0gIBjL683oL0w2XFxBRb5Givntkn9j63SESldUxrStmmO6nFvg
 R9IvBGFEA8MZeM2d0ndTYVyI3S1+8AH/TH9xWbkhnXU2Y9aP9+O35BysAMp5fp0f8J7usa40=
X-Gm-Gg: ASbGncv7LsMkDEsQFdwOJtlc8rk6aQVlrW0a/WT0WOIix6lkn75K9iMxsaPYNVK9jSV
 yht2ARUep5JAS+JntbWGuwV3R4aKVHO4kbwQJacRIyXfMvaUapRT85PfCMV9Q01qvj+XunojAF4
 uA4Y1tHxjIOFVtFQ7IqhnkmD6kT+iep8dv5a9FZrwpmgcpHP33rDKX1Z3h8lNA7ZT+N0cBV9x9p
 LJwlQiCkhXWQwC3QFaIMoqkX+mCSrHdjoS60NEWBE149YvDwfZYItOihIanxxstiranQt54Mwsz
 7fmFf5uM7XNN67rKuhFRLE8/N7SUzGdZOHyJuxpZxWv4+znkUdNTALPXUTUb4t6iErFcvLi9zVA
 4etT9cuCsvpX7y0cujZOT9Z3YXE70W5RYcdcUGC4Vq1p6CghfAlVPTQ1uHSSOmJQPzfIjdk3dLt
 p4VgkDpaLb
X-Received: by 2002:a05:620a:179e:b0:8b2:db27:4270 with SMTP id
 af79cd13be357-8b4ebdaebedmr371474085a.48.1764082216455; 
 Tue, 25 Nov 2025 06:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF29JMf6iwu0/+APrErjc9cNvPpPDSPcFhWuKVWwCI7iWvjXvB2+ZefZmNClkzhF3y4wOuO+A==
X-Received: by 2002:a05:620a:179e:b0:8b2:db27:4270 with SMTP id
 af79cd13be357-8b4ebdaebedmr371466185a.48.1764082215881; 
 Tue, 25 Nov 2025 06:50:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db81b1dsm5069126e87.23.2025.11.25.06.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 06:50:15 -0800 (PST)
Date: Tue, 25 Nov 2025 16:50:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 08/10] Add interrupt registers for DPU 13.0.0
Message-ID: <5ncorvgosgt3w7flwtwpnsw7hg2js6inlyfmidds3ozt5uk3gd@7t47ilh2jtwq>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMyBTYWx0ZWRfX5Hkb+S98YUuH
 BFqAhfvlMGxMB1wsP203Y58vy5Bm69JuaPng+fOGwY3K4TlVX+pZKEQGY14aJ1/4EhOUF/lSkjH
 87mJ6TrjCPRDlRboEH8EO6PhHFBz1YUxt8uz0KCj/9SnhikSvW8m/XW/d26Zid5fgjLvISlGc/n
 oKBDfZFekVSzDAGf/C15KwvOZng4K581N3/ylBndA6vjYSjzWUDiWSPMELECjZcy7AkdLhKlltJ
 m8LUxkEtzetSORd0v2hxHRXVplnKWpWfp5VbgepHyaEY6NTzPdk62DCVAnmlyomA+h5pPlk3mRu
 /Zo9bYqrRXSkgzUOTO4jJz5zMQJufwBBIcbewMIUU54BrvjYe7QUnCbN6xQxo7ol1l72YAYkD2t
 0zBP40IPNLg/5lKAHIXti+mVhMtWNg==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6925c229 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sllrQoStS4Dg3uhmqGIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0vdSbOzEm4dLsZq5KjPMSqhqZ9C4Ib5J
X-Proofpoint-GUID: 0vdSbOzEm4dLsZq5KjPMSqhqZ9C4Ib5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250123
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

On Tue, Nov 25, 2025 at 02:47:56PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Please prefix the subject according to the driver customs.

> 
> DPU version 13.0.0 introduces changes to the interrupt register
> layout. Update the driver to support these modifications for
> proper interrupt handling.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)

The patch LGTM.

-- 
With best wishes
Dmitry
