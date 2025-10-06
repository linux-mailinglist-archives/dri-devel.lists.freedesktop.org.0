Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD11EBBD90C
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE58610E30B;
	Mon,  6 Oct 2025 10:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQ588+Dh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFC310E30B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:02:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NwW1t017153
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 10:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=emQk5agLRXov7YwB97bnLlbt
 YdyYufIKmyT5dEhdxvU=; b=NQ588+DhRqmfTiF2po3K/IQCh5QcODgFSvxnOvBp
 4IISFD1OSztW8A4BXSxomjt6lKNuAuIrgETuEccYBJiGkLbBD/+vpXn3HnJBouq/
 11uOdZBU54oF+T2EkFKyXVB9KTyss/9HzypZL4NBO2yAC6KW1nHXuPVn2LXLfrRu
 QvZOqBF+jHfqS8kef/+h/M/4Bcpc+sk7YVPid2VHlvJ/lKd20BZPrlDFesXksqkg
 maU7rkwjWUEdd2bFJt7Qu06mOsw0TFZSUmT5AMwGtqq9Gwt6LBlpO9ef24MRkw0K
 ayPvSENTdF5Nv/QprYP4tUt+oRnrzvIztSA+5Ln2g/bgEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6ukv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:02:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e002f413e4so45190781cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 03:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759744950; x=1760349750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emQk5agLRXov7YwB97bnLlbtYdyYufIKmyT5dEhdxvU=;
 b=ALl6yf/BxEXTgXJ8weUqiUTHyDHVPJbdcvfs5JnBJfD5l84CXoOZQhWoHY7s7lyqp3
 qFNOlUOzF1VbDrJdWEzxeBggkLhzF2hO/oUx00va0w4zHA3rGPJ/SXtRxacqcWDQpLEs
 TVvm7eMuCfOHGCBUMtdwXXVONghrKp67+Yaj3ZvQcyaujcbLepptc6RJbHbI/fnE5ATt
 A8KQmkNMSliy9XgpMsrF/y0+XdsvkZzSwlyfYb45LDBzTzYVxPaMU0rDqDOQMwCujKzH
 Mc2lAUf3umuQOiR4d9QPkR3D/6qC1Ao7LUCE0FQrE0j/d131UyQ+cq6Wim/FAOrM6L3f
 NaKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQbWFR1wPkZeWdX2gxhH9R5cm7uNeaPM/tgUZFxDKHWD0l6KZpIrXJBY4BCCjHIRMglUg4WxcxpMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt6qZRYsxMX7ltma/fyHvCR4PXJqsu2fFoOfAqsXOijxbaRzqK
 enFGgw/ZQlsy1KNUH+rhfJbX591fqX6iRHC/PGBZ0815WrE3l3lFg/YOcbI1MS9S09DWeMJoc4o
 TJx9bgJjSv6tYgIG7i8iOtmGSfvDJdK4eXk/tnVVhKyiaynpnUQO6M806Dj9ieY9QWvZtawc=
X-Gm-Gg: ASbGnctH/2Dq1+UsMAFo1e/aqCKYHGnTeUDi5ZDJlo4EMKhwHZ5Ki1gM+F8VxFe7+X6
 G6SlkjNtA5PW1tmTn45WeyvuOnndq17HOnEyihcGGsNc3byA8aMz+bXXipV36Cv5cR7929qN3ai
 a38iv/9nYr1MEQQsU9RqQT4YIYKTsgqepTZPIUL3VJByb7xM805BJ9cI9B+wwqLNKDjcljDq0hD
 xdD2SxpIibTCnpyLMrCgbN4P4naJo+YoO950IEapWKCFHuAVjJ29RBSWwMympt+7VQgPEM2L1Go
 PfVnfZkomB+H+xEzSNjP3kRPuN2yLl+ReJTD/wM1cP3WKz653nAMS5zPhzVmFE9mKD6YR9GZNc1
 ruPr5Z392QI5/A371bWKnSYmKD8qqX60ACslZgIza1xsGr6AHizcCtsqWFw==
X-Received: by 2002:a05:622a:909:b0:4d2:a1a7:214a with SMTP id
 d75a77b69052e-4e576adad30mr157836431cf.45.1759744949608; 
 Mon, 06 Oct 2025 03:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy/JDsMXdS7AYgrpeJ5Yyjg3ZDELYIlzxigHOiHIhaIjrnMXpioVVArym3UE6bvb/Dvdh7bQ==
X-Received: by 2002:a05:622a:909:b0:4d2:a1a7:214a with SMTP id
 d75a77b69052e-4e576adad30mr157835651cf.45.1759744949077; 
 Mon, 06 Oct 2025 03:02:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0113490dsm4901255e87.32.2025.10.06.03.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:02:26 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:02:23 +0300
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
Message-ID: <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
 <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX/ZdEnc93/3O5
 +6sIRh3U8lOFazdqltuHayILz8pRMovsZpMEX2wZhg/rC36dOqIJ8rdZlBFFynkACMsk6C9TYSZ
 jkFZamGsPbFmRjf4W4lAzrABm82JX0se+zy9DgEfk9bmdrR2UKFZ9/pcShUSFGn7L0OgvrOb/j5
 +zfOHhwSHUVVss+ad2ilpji5R+ylTHSniXLyl/s6hJqPYeNW1xMuYSywgBBDz8KqcriipUrhhpJ
 hbZiJ+7ujMtxsdsREl2A8ANA7/uKuicLTyzUncGygcEbTWY5f8F0G4krVBNQudRRRHt1Ge5E6bP
 fKVOXxIsngDcmUcx2eQVoDiDYbtxf7XQNefOdZyzOUlNoUt6qAg4t+c3TIZA3rifb4UhN8iakCW
 jrUOdq17oKi0EiX1X8oFo3RWiKil0w==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e393b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=8BRzra-YsWo1JaVNFEUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LzNqKp8SIjgViUSTogOMETjLVd7PlFrv
X-Proofpoint-ORIG-GUID: LzNqKp8SIjgViUSTogOMETjLVd7PlFrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017
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

On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
> > On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
> >> Add a driver for panels using the Novatek NT36532 Display Driver IC,
> >> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> >> tablets.
> >>
> >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> >> ---
> >>  MAINTAINERS                                   |   7 +
> >>  drivers/gpu/drm/panel/Kconfig                 |  10 +
> >>  drivers/gpu/drm/panel/Makefile                |   1 +
> >>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
> >>  4 files changed, 455 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
> >>
> >> +
> >> +static const struct panel_info csot_panel_info = {
> >> +	.width_mm = 250,
> >> +	.height_mm = 177,
> >> +	.lanes = 4,
> >> +	.format = MIPI_DSI_FMT_RGB888,
> >> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> >> +		      MIPI_DSI_MODE_LPM,
> >> +	.display_mode = csot_display_mode,
> >> +	.dsc_slice_per_pkt = 2,
> > 
> > As this is not a part of the standard, what if the DSI host doesn't
> > support this feature?
> 
> Shouldn't the core gracefully throw something like an -EINVAL?

There is no 'core' here. Each DSI DRM host manages DSC on their own.

-- 
With best wishes
Dmitry
