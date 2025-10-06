Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE0BBDB6F
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63F510E3EF;
	Mon,  6 Oct 2025 10:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5EX7/DR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6930910E3F0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:39:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960j4S9001080
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tL32lBVtdQG6FBp70cR/0+e7
 GT0m4lIzY/Mtg+rXvr0=; b=D5EX7/DRqdw74gyFVv30BXiPneQ15mlAaTP2HjDm
 feAYYiqjOPAYmPpAFYI5+3TWaOlTeMPhwYA0dj6EdoZV9f2GSyaxbzWK4EmYA3g2
 iOhN77zsnxwkAFw4T7zhfurMFEjQxipDWD3kDm84j430i8cqscibhxKsjwYdF53a
 BSvTXYSzYCJpKyXqjgTJLA+XLoQdqNMqLFXndcNI+PPNmBKiCU6J96pljJXCn4G+
 HmL09PXq9CEso3ZCoEmguWSMBFrljKWQ9nx/5CdtGN4EUpDTXD8xVdaxkwJx6LDe
 cQUdNEsES8NdcM7pwhF6YXJNAmEGlWNFh76gTPLND9kLlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhkeff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:39:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-854bec86266so1575813185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 03:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759747165; x=1760351965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tL32lBVtdQG6FBp70cR/0+e7GT0m4lIzY/Mtg+rXvr0=;
 b=VrHw/AkuAypdsYImQjgtJPPLiua3hLtEX/97c2/1dAZ/yRgSRNJWBol/KGDibPHpwH
 QrJRvLIKm2ekw6QGUaROguNJzFn6m47ljQX/lgBSgWjAeXqRxQicYILQGi3kdH0b+c8v
 GTb7y0/E0mUaPPgNaEBWbPg4j786Xgio31EVtopVD7SpILN/zqPmoPEAAy8LhpI3Yy15
 r6ykF/eH0QoqhXRl4YAfigbG6bm8gieisezSH/OoaReb341oZXOeJtecbQW3A+PkbOXb
 JlVv/MghDmV1g8lhJnOoRsSgeAB2+uVIdXvDAW+SlM3PdojyizMtKz3Flqk4PMzIe+vs
 uqgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBFxZWsx5xxh3EdUcTBzhOYvVqRJOwfGYCYbXhoxuc/RTju+TnvwD/C5FX4TaHKt7jJn0oYdNDU9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIlSiDAVdV1RoaD0U+zJNvKxYKSRN9gTvknJoUwYdL+M0JfDR5
 2W+ombBb6Y28jZy7qGaW96fDAhYKIi3bIp6Aj1Ozv3S5w4gTNJuMPDkhMu2HxjFuuUikJkAWcjI
 zHc+CAF3lFsj44UaBkbUtsMU9l3EG1sq77BwW7RBz8icn5x8q3ULbNQ+8LmWRsJjfJ0wMMxs=
X-Gm-Gg: ASbGncvtm8L/ajbTPw9aAr5V0TmQf4vP+sPpOcBV6sqBAuLHG2g5EVNHA0ZwZRMM1eL
 6rttMn65UDdJTnoS75Qk+iujmDwUFjxJgs41tCJZ8BSoosVO1kqzpj5S2qUiNa/67CSQHYD4Oh5
 7A7F1BCY0xPYbvadPdJr8EGr1XButWmcCG/6GGvamzKlRZ4AOCsQLan4H/BURiYkYqqsaYhhbnj
 8bF71Jrwc4yim/TkaNz8+7R9DjFXBBFfXfpnsOqJxFjqO/PbaPRxKykV98bz9rA+ac2O6POfx2p
 z68EQ5ZRFM7dc7hBDiXruosMyZSw7hlRQ4iPrZwfG1KOoxGm3x0NppIG/QaGIXlyEGvYQ7EDGSq
 Ixzzs7A/0fwoAvPjccSkzliwdcYPkHhwUCZbuIbE0ZpKlr3txCIh3Edt6zQ==
X-Received: by 2002:a05:620a:f05:b0:847:cb75:95e4 with SMTP id
 af79cd13be357-87a38a3a9a9mr1257909485a.78.1759747164947; 
 Mon, 06 Oct 2025 03:39:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzjLLv0vLtf2KwPjN7Isng+2S6+xF8KquObPMQpThzVTOWmfSKiJh31vn8lJ3hYibY9HOs5w==
X-Received: by 2002:a05:620a:f05:b0:847:cb75:95e4 with SMTP id
 af79cd13be357-87a38a3a9a9mr1257906985a.78.1759747164471; 
 Mon, 06 Oct 2025 03:39:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba444ae4sm43603661fa.36.2025.10.06.03.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:39:23 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:39:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Junjie Cao <caojunjie650@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
Message-ID: <2do3dk7gqvbloocsv46t3zrc4ghvhrpiqre6djk6heese3wz75@dlqwkdsnrkbr>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
 <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
 <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
 <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfXx4gICSKUlE5x
 UwAnlda9oa6Iw6yxkYsGGgFumqw1PVF+zwJpsu6u7TdKv2iZWvA8Vew4bLpzfSkKQdsxE+WuzzI
 /ecMf7la3EP9r+/PcPggEuZYNOm1Ga2rqJDvkmCQWW3MxA6i5l+UUhGu1Psh8koJFHXonZqT8Yd
 CLDn5bVthfcMYABF+R/ej6kT8BJFxCbZpuuBOSEsY3ZXj6lDuOxvWn1DhMOjyaacMz6iX6Zxqhl
 auEaKO1tco4AebrxVeXhBchTKEySJbPimWWduFKnV1Tg0kEq6+FtPNS1zmrLGcsccsHU8F6e/z8
 0eoMuCT2wUVKeI0nqbO8XkJi4veJ50jAxziVTAtjYqZGdmG7GCKhEn8JJrdTLq3GAqKPJIO53pk
 H7z4f03xUdPmMH5GuSlCSmn0/P+NtQ==
X-Proofpoint-GUID: NvfA7BdZ9gud0ux5Cq9FvSOrxYL58ou5
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e39c5e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EU-ENxuI5XK3D0y7c1kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NvfA7BdZ9gud0ux5Cq9FvSOrxYL58ou5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036
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

On Mon, Oct 06, 2025 at 12:10:05PM +0200, Konrad Dybcio wrote:
> On 10/6/25 12:02 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
> >> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
> >>>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
> >>>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> >>>> tablets.
> >>>>
> >>>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> >>>> ---
> >>>>  MAINTAINERS                                   |   7 +
> >>>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
> >>>>  drivers/gpu/drm/panel/Makefile                |   1 +
> >>>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
> >>>>  4 files changed, 455 insertions(+)
> >>>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
> >>>>
> >>>> +
> >>>> +static const struct panel_info csot_panel_info = {
> >>>> +	.width_mm = 250,
> >>>> +	.height_mm = 177,
> >>>> +	.lanes = 4,
> >>>> +	.format = MIPI_DSI_FMT_RGB888,
> >>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> >>>> +		      MIPI_DSI_MODE_LPM,
> >>>> +	.display_mode = csot_display_mode,
> >>>> +	.dsc_slice_per_pkt = 2,
> >>>
> >>> As this is not a part of the standard, what if the DSI host doesn't
> >>> support this feature?
> >>
> >> Shouldn't the core gracefully throw something like an -EINVAL?
> > 
> > There is no 'core' here. Each DSI DRM host manages DSC on their own.
> 
> drm_dsc_helper?

No, that's just for calculating PPS and some other values. It's one of
the problems of the DSI model, which I tried to solve a year ago, but
failed up to now to do it completely and clearly. The DSI device can't
check host's capabilities. It declares what it needs inside struct
mipi_dsi_device and hopes for the best.

-- 
With best wishes
Dmitry
