Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFEBBA1BBE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0331410E9C0;
	Thu, 25 Sep 2025 22:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ru+UCULM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A42D10E9BF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPcXn021541
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j9jhbfMWZLDlbLvHbgzYA6UULoA9b5J9ED0wfYv3EO0=; b=Ru+UCULM1uxxF5QY
 PDVRfUOSeKE72n7qUtoocVn/0tyOHj9fRxaGgSbk4rZ86lGWt9+5WJV3rXB/XAbk
 Nk6bozdWhGvHx0Alt95icca7C4ODdW6591lIlQwg4zah3Y8PkwsS+REDlYL1zBAe
 2gOrehMmLyv7U38Wfbm9R8LCx5/ND/Y6XkT4RJeQqwV7AbA722xoHEOmcLu2753F
 Nol86Xr6VgkCSY8g6wRCC4YiL5ew8OzzVnoTl3tmbcS5yNVcDpndvJyF8cgGJ3cU
 xwkQtuv0JPsB82pmqxoLoU1xI3mT081BHe1N+3n3T3xolTJ+cVNW7OaU1LKMbL37
 xxt8PA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrh9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-81ea2bb8602so460293285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837859; x=1759442659;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j9jhbfMWZLDlbLvHbgzYA6UULoA9b5J9ED0wfYv3EO0=;
 b=vNLvS19sSwPeDfm2m/5zv2VShGpqzrn0A1L3/q5FDyI5evEaRa9XejWFUCLGkHGh7q
 L8+Z9yycOkAgitDtnv1zhTTyKafdT0YM69SLa2qSnoIzBbtUTAt/VmQeAZyDn2g9YBmE
 bdSZ7C2ukDRUuRTqRWVajVpeTNbY2gU/Mi33Zj0nw8sr+iMl2kP8+Hoo+VKr1YhVL70+
 npp7imSLB9rVTuIn7woMirgG2Q31dqAmN0jNIUD6pmCWhPvkoSMHAfoqGD/Z6FflI7U8
 hELME1mNM+WjHCnaS5rtWTQqBd2eSa1TaZ6V0nmFrDlRW7/MGbSL2TVvYAvsjOaN7Uk8
 gA5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJB8vtrjCr9tIp7BEm8e8v+wY3tW8T/bMGCakhCeOmfheeFN/4yQ8Z2l3oF6RkpGGpg6f3evKH3d0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF3k/xWMsILBlFSy5a+tkLXMKiqdx64jPFTnN70khIxTRAWWki
 axNtCl7xGoEw9EIYU5n7sQDz582mR36v1wS15HUMsgtbGIC5uSrrxLzUODEebC5gJD877WFE8/K
 L5g5naCnnQxjM7ntJH3KDtETR3rihN0AxY7Rru1XrmtSmxsDywRfM0jCfFgXn3W/NI3gmId4=
X-Gm-Gg: ASbGnctcbUBHVXag1JRLFVfXhvv5P8Xum4/136m75MF0ESegJNbPRUnAwIuOqnE7I5X
 omPgDGGbd+kcnkS9s/C3p8ffIl6hgDhfh0aFxVYRvsL+zHu5FrwhgT0BNKUjiGw4DFDiM+Kwidj
 GBzo8NJZqgugvKs5Zln74qYw3CMI8EqcbnCvxB91PNq4wqEtlXG1u0OwQW1QraTPggmuD2JVVJy
 Fr13yiObtDU2GMP3QQa+0WrMrR5KA/ka97nbreWFB+8gwbigtSm0AiKQZ/QQOx92/GLr/xuN7MH
 Nsnp4oPad24cfkd716uB2m9uY6wfUEHEM0ZVFa+uEbxj0BNkkSe0Q4NVUBKRaqpjDdid3FH7bR2
 Na50mud5HdKoOfLac8lCGduh0Y3LlQIex7OpmD8AvCwwtmLwBV0uD
X-Received: by 2002:a05:620a:4890:b0:84a:d990:a6d8 with SMTP id
 af79cd13be357-85aea5ff6a0mr735532685a.49.1758837859160; 
 Thu, 25 Sep 2025 15:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxdA6dS4wu8OVd+3ocLVo0gkXNYMpAtVMslmaMzvNNUlBIIxaIcvu9v3eIlSDmgpeHrfAggw==
X-Received: by 2002:a05:620a:4890:b0:84a:d990:a6d8 with SMTP id
 af79cd13be357-85aea5ff6a0mr735525385a.49.1758837858668; 
 Thu, 25 Sep 2025 15:04:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb528984csm8078481fa.30.2025.09.25.15.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:04:16 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:04:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Message-ID: <vqiizai33y53o3h6ovhilcco5yyssfqwqrqnccskqoye23bf2o@rtob2tooaqr3>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
 <CAO9ioeW2AHDM3KSRu-WOvy+1De9tqfhrCNozw5Wkh=CJDHxFYg@mail.gmail.com>
 <CABymUCP2m-Z1spkAydryNWfysXTVma_H=7w=0GYL6+aH5KW9QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCP2m-Z1spkAydryNWfysXTVma_H=7w=0GYL6+aH5KW9QA@mail.gmail.com>
X-Proofpoint-GUID: cOQ9buLFRwT0ZiC7Ej_TayxeBjVQcSkE
X-Proofpoint-ORIG-GUID: cOQ9buLFRwT0ZiC7Ej_TayxeBjVQcSkE
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d5bc64 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=TPbfgU9MJehzMSnRnG4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX0P2NzwPHaaF2
 EV7l+Q3NlimKCWESxhnV4dv8VstxfM+srf8gseMmzC4HAvOp+bbULqDJ4AdzA93Clq56f4ej9Wj
 BgtbrZ/SLxsArARUEwPY9sJed3iKwrzixCXwWuTvkznkVor817jGZbaROhrL30F4nKRxSuNixs2
 ILKuJAhlvV+ZiVNd8taJjmiec2UbEVLtANk/RLFI6WQQbZZR1zk6A/e/sLjaGMF28zcGDE7ry8i
 ASYdTimD5WXq7raiZnXssR05/XGcMajeh15J0dgpy/ceA8n3z0Z7MU0Wg7aIusJjjPlpK3bF5ao
 OKCQkB8sfBuZBlXrIqHIwQ8VC8U3neCJsN5fl9WGcZMRg5dsRJ710l6ahYvuU8MK8qb/ohGlLlu
 PVAsY5LZDBLd+EwKP5hBFJtpK3VA1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 03:10:35PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月25日周四 02:02写道：
> >
> > On Wed, 24 Sept 2025 at 18:08, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Some devices treat two independent physical DSI panels as a single
> > > logical panel from the CRTC's perspective. However, two separate DSI
> > > hosts are still required to drive the panels individually.
> > >
> > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > allows a panel driver to inform the DSI host that it is part of a
> > > dual-panel setup, enabling the host to coordinate both physical
> > > displays as one.
> >
> > How is it being set?
> 
> This is set by panel driver in probe(). You mean this should be documented
> here, right?

Yes.

> 
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  include/drm/drm_mipi_dsi.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > > index 5a85ba01f402a3866b70828391bb417bb8dd5956..0faff285d9ffeb19e4523cdc7bf21c1ec20e6eff 100644
> > > --- a/include/drm/drm_mipi_dsi.h
> > > +++ b/include/drm/drm_mipi_dsi.h
> > > @@ -170,6 +170,7 @@ struct mipi_dsi_device_info {
> > >   * @host: DSI host for this peripheral
> > >   * @dev: driver model device node for this peripheral
> > >   * @attached: the DSI device has been successfully attached
> > > + * @dual_panel: the DSI device is one instance of dual panel
> > >   * @name: DSI peripheral chip type
> > >   * @channel: virtual channel assigned to the peripheral
> > >   * @format: pixel format for video mode
> > > @@ -188,6 +189,7 @@ struct mipi_dsi_device {
> > >         struct mipi_dsi_host *host;
> > >         struct device dev;
> > >         bool attached;
> > > +       bool dual_panel;
> > >
> > >         char name[DSI_DEV_NAME_SIZE];
> > >         unsigned int channel;
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
