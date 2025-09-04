Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464FAB447A1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4A610EADB;
	Thu,  4 Sep 2025 20:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASsq+nhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE0E10EADB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:45:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584ICFi1007684
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 20:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ah8XoJw+rgAX/8W20N8ua7Zu
 YMCg6XGeT4CJSEmlEg0=; b=ASsq+nhjXy0T/utxPI0L81ICdz13PV+WiSq4OoGB
 9pa7gEUH/ByTZFniwt19U98nOgxrN/BWLh6G3dVN5LEtJTVf3IRoOg4eBA02kWb1
 GT7mIt013gPkB2Ph9I9NgdfBsisfb+8erqoPgv9NFGkX6YAGuUuMahEweMBKBfwP
 CyTRn1yV+HjzvhI+grE4Unkjko8LUQMeV9dheKVNofoea+CxxAl/HWvc63yz7pA1
 X3x5ggfNdmdTdUcB5tyy7UuG/hco53ZIDoBTA6GHXDMYhOcLsQi90jYixQ+cdTJm
 sO9ENsmffFJWkPSVC8gUwQsfEzisALm9VcJgVfAW698Iqw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura90rn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 20:45:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b32fe42b83so24169641cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 13:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757018723; x=1757623523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ah8XoJw+rgAX/8W20N8ua7ZuYMCg6XGeT4CJSEmlEg0=;
 b=wHgzF8SHA2AGHb0Y06Un+9SYBvY5TZO0r0eS0ix/8LDkZK4gEfxgZJxPUHoDIWpbDH
 6syYT/Ag+0MJ+EU3Ymzq2SXso2gaRcw/KA6Z0WcTuGIkvfRc4V9ZiqoL5Eu9xOnt20R4
 780reWj92POGFm/2qj4yy9xfvnSqPFHIJlQ1TnTTGHy7NrOolTEETO5HWyO3HV+o04dx
 oqieKIlJiUj9CQTIiv67q3w7GbESbSl6tOP8lktZVHzL6z1/DLCqBb4a02hdffrwu2MF
 3uv/oDw+Q6eFEjj4r4/i1e4Kv1SyaMnNcfPAHZRfgV3dBvjP0JwNTJIqKi9deEeMWOFk
 4VAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpSa/9I+IwwCJQsBGoo4LmllkWLaguw3iFqxpcw3doqWO2EXHOiLVA85m56u4NkSbPs4P9obumebo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+LpI0gPvdX3S4KbJioMXv0kLEGVQvLyoeFXqWXUDXTqO4opEg
 80jORHW6ivfSMbC4k4FncE5Sb6YOp0Zz8wGbAR8SvbEgLNT/k1NK+diRfjhz5TWyiTfXOb8ljEk
 73D/bLSYTENzvwpEzlE7fQ8alz4ffuSmKOv1Qkt6IlhpN9dht0bfGyydeh9Hkikv1wlzUvgo=
X-Gm-Gg: ASbGnct7oblzP56iZ+IVQZHkJVrBsWazzvhF6rzco2gN07+URRjjHUkIKBM9y7N598v
 EDIDJQE3SzFggCvO1iT3g8Np79+N5h2de0YyLKBFe7cKoRyoprnhCHeep627aooByRJXOi6d/7s
 H0hgI5UjB+0QKFQwnMdqvujdJ64jq5kFRSnHxBMaahPF+P69lX9aDPGzeJrdNSE1QeVYdZg/y0f
 nzZY/wSTFnzwPqSbLsJhP8eU74nBO8LpW+Z+9KWg/qZeo36GLRfCssk4FpwD7IEN8fsciO2N3NT
 qX7OKGPLZo78haehleeJtyy+LQsnFsnSh20fm0NY32dLiU4/pPI7vdd8Cr2tc6/1vzvlXVpLgn8
 OzU4rzkkz78Bw7gF8uT8qmtkUdg6slior7mZ2F/ePaisEVHpKYY4L
X-Received: by 2002:ac8:5d0f:0:b0:4a4:41d5:2a03 with SMTP id
 d75a77b69052e-4b31d7f0a03mr103406391cf.4.1757018722483; 
 Thu, 04 Sep 2025 13:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+J8L1I5811Gh82XYHGA2tv3WmCtFswhuFoDmxujp1dacvtjBsEDeCAlLFIU0h8/1YiIUj8Q==
X-Received: by 2002:ac8:5d0f:0:b0:4a4:41d5:2a03 with SMTP id
 d75a77b69052e-4b31d7f0a03mr103405881cf.4.1757018721940; 
 Thu, 04 Sep 2025 13:45:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50b0898sm16424661fa.58.2025.09.04.13.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 13:45:21 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:45:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Yakovlev <vovchkir@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: himax-hx83102: add panel starry xr109ia2t
Message-ID: <to4alnxchf56lkvguacmh35bquzbczlonhqi5xoi33alufu36j@4cgkzx3sgzod>
References: <20250904002232.322218-1-vovchkir@gmail.com>
 <20250904002232.322218-3-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904002232.322218-3-vovchkir@gmail.com>
X-Proofpoint-ORIG-GUID: 36jM5FZMk7OU3A57iLW0uMjSgwj04sD3
X-Proofpoint-GUID: 36jM5FZMk7OU3A57iLW0uMjSgwj04sD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX7XYSkFc0BbXI
 pPMP5E7NYB44TORoFdVQ8I+Ldt2eZa+92F44oe//hQdOrUxJi/iKrcR4tvrDwTiBCXOoWZh9o5W
 e3HHvXhGhegyvxeKZW9Chao7olDT55a9nSwLm5mL3e6H3U36Nbi2kd8Ebq2HLz7pReuQV1FsytG
 uFFFjpGsiWWrqixtASz/Vqhl/bghZNbPzCVfNvU4tzboS9V+o/ecpAzsDN3x4JpF8taglcDg1yb
 Udj8yb6yIOY6rM1a7Gf/zwovrjpzeIYt4t8O0wB6YjFaNE+aBMuhXes3U0G+q04SzA+EtCw/7yZ
 4M0dTJkEfJKKUrfilMskPoma+yBCJe94EaoOXDmiKfcj+rTfX8O35afBUV9juSvsqSgr2WVgFdc
 kOOcwA7w
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b9fa63 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=ACYfBu3xzRVhRnfl0NsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

On Thu, Sep 04, 2025 at 03:22:32AM +0300, Vladimir Yakovlev wrote:
> The STARRY XR109AI2T is a 10.95" 1200x2000 (WUXGA+) TFT LCD panel with
> himax-hx83102 controller. Hence, we add a new compatible with panel
> specific config.
> 
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 193 ++++++++++++++++++++
>  1 file changed, 193 insertions(+)
> 

> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2C, 0xB1,
> +				     0xB1, 0x2D, 0xED, 0x32, 0xD7, 0x43, 0x36,
> +				     0x36, 0x36, 0x36);

The rest of the file uses lower case hex. Could you please follow the
pattern? The rest LGTM.


> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xD9);

-- 
With best wishes
Dmitry
