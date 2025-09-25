Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F6BA1ADA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 23:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08D310E9B7;
	Thu, 25 Sep 2025 21:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJN3rzCS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2553610E9B7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:50:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUmXk024922
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EsE8hUNPrzXdS3krzD+9JlR/Fl7R5Lniz8rFMY5V+pU=; b=AJN3rzCS3cwFnGSP
 nML/5pd++eAelWEQEPJIKHdHdwPsI+g58MPBYbHggsVcdb/MO9sPwWYDNmmW2EIa
 X+fmI+N1/gDPCCal3HZjc5LRJJmhupfLL/bbtSWtkWck8JUpibn0Ugftwk9xsDti
 vmihmNbNaidxcxU28ZGW9O9O3fytzq/jbuNlfrCfp8F3p9I+63XdHGJGijU6MuZy
 r6oFvpw7RiPn334EFQtIEv7TDdb9V97aFJ7BI8ilolbsDXpWMXEP3DEWNqJNeSPk
 07ISru1IvH3lpsn+O9gAvFpkU6xNT/1pN65B8lRwpd/fOovaK9Bu6XwCcSu8Zz9m
 jvb8aA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34ggbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:49:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4d8b8c3591fso41180231cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758836998; x=1759441798;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EsE8hUNPrzXdS3krzD+9JlR/Fl7R5Lniz8rFMY5V+pU=;
 b=KzlCVbl/Uk+ERaqs65FvnJDvAEYkQ6BFCtHmen6h+4mwDif+iyjUwbmgzE/GWq+8kt
 Ec7D/ciWzp25eP+z1L2u6zsNHyGEsPp9+kjr3PP15in0/ShMBpQzB9eLDk4n5SOKndfz
 Y0cZwyE2ocB8qdUVuHHQPUmam+w3eOYD2s6WJuScoGQZRfCKo0/Defhc0NTzLMoMmb4h
 wpcWOPGJH461wLWA7khCsH6UeWpZxNrFeGMgWEoHMYXvJBHmAIstzCJ2H/GtjdZzbPyO
 4gJS3BkeRR6x7rodjinnLKKeWeazdhH2ojKvC1YYYzdRTaF7w8i2OhFF0hrqc3Jv7qDD
 Ylqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7cdMZtrSyJAXF23mGi7nXUcmycMmrdikKc34zr+CaiBAqkV9JcsymvwNReAsCPvRKHQlXFAK2Naw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfZrZ6pZOFSQe/9Ply0RwDJ9I8yoJl0ZE6kdQ7xBHEzqoM4JOK
 jaNrqItbEFH94kwIKFTSxry5gtsDN89QMqGrcerGGvZI2yjZ+p2DVL2NzGpjJOljAD6mFIH24uc
 0uEdZuYO/OIqmWo2oE2ONYwFE1KQr1ir8gH5K9ilcZunj9YWrB8SD3oKGe2ibQMUgwYkARTc=
X-Gm-Gg: ASbGncubRb8AD20aaiQQLjDoUO3DKWaDTku/b3C8sWjoE61wZizIjQH0pX81nIaF7MA
 YyGq283cRrUwVYBssGGiJK+d2HzKSdATCq3Kl3vUi0zlCMpxVYYXhi8Q6lLReJoT6VOuKl4QdOh
 e08m6LiKWU7cFZIMIYLj11UdbnDv6rgEaNPhrjkn31XXnk36M7GTlClNaSXzvTrDGKn5frlSONM
 D9C5xu3lrh91mM/dizdWHtQtymk+grBS+f3CVE9w6KYFc8ya5K/+rHV8McRcDmRg4KmWhnHsCcc
 NsFprGtuifcB/I6PQoR1ijkg9PFsVSdUsy96VKM9Zl6wZw/n8zqhzv346JSSZd0luL1UeImV4/i
 YAl1K9bGQqpuU2EpYm6NHb1cZ5nFX9mIgGaTzWAzA3lsA628Le+/V
X-Received: by 2002:ac8:570b:0:b0:4d1:f8e7:e468 with SMTP id
 d75a77b69052e-4da4d3161e4mr68602821cf.69.1758836997975; 
 Thu, 25 Sep 2025 14:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV0QG5LOeu0iFHR+g6EDyvJ7468+R0ZRvi5JA5JE2Ojk3+XlsYVWWCMEwvumnpcEUb/6SRhQ==
X-Received: by 2002:ac8:570b:0:b0:4d1:f8e7:e468 with SMTP id
 d75a77b69052e-4da4d3161e4mr68602381cf.69.1758836997348; 
 Thu, 25 Sep 2025 14:49:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5831665782csm1153941e87.86.2025.09.25.14.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:49:56 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:49:54 +0300
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
Subject: Re: [PATCH v3 3/3] drm/msm/dsi: Support dual panel use case with
 single CRTC
Message-ID: <gmtcfmanngfrap5fl5622a46nstx662e7kfgvcf3jx7eqrm6qs@tpxarssvehkd>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-3-6927284f1098@linaro.org>
 <v3tfzspjck2oqppelx7bmi5uflhs47ixw6tjmq2d7inauzfo7k@gxebj3buyuni>
 <CABymUCMvczXHM-cOXNko77xDVxX8Q6MA2AEZcGx_Yg6TWosMAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMvczXHM-cOXNko77xDVxX8Q6MA2AEZcGx_Yg6TWosMAg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX9WF9Dx7MEofr
 wjfJ+kkZblu9AeZJDO0bAMQbxPFHKtmEpRNa4AxAVW4l7QQSNuM1JQG1c3tK1jn5vq8SHGHt1kG
 85xgRZauNPm4DnZy87EmRFKoEmdt7Ce27Pnm9foPHNoARKJ5W5uPzKW8pMiPLCU7h5J+rkAfatH
 aJ11xeYj6YOHrf8D8b6/r8zsb0ZCcn9evwN9gtO2S8h2bVDYFIPkD5CQmTyOKXw3T9xpnyBZvd4
 YQIeCux0EnCB75RsAFk/rYUY8tEe+rjl+6XHRgvzddEYMhFAbrVgp3JLf8N2nGfA6ESdlfO7OPA
 zBIAOEsAynYptwtT4ggQ128nyvW5NKiJhdn7Jh1vxUrMxLpFfXSMh4RvsHLft2u+t3cpCWAaKlQ
 XVsyC1Wvz8YJbjIkOcVCPBX/meJnsg==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d5b906 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qXU7j4J-Xa07SXBApZgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9ph127D4BTVO_A08OH1QHhkoOWujPaPb
X-Proofpoint-GUID: 9ph127D4BTVO_A08OH1QHhkoOWujPaPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
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

On Thu, Sep 25, 2025 at 12:43:43PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月25日周四 03:21写道：
> >
> > On Wed, Sep 24, 2025 at 11:08:12PM +0800, Jun Nie wrote:
> > > Support a hardware configuration where two independent DSI panels are
> > > driven by a single, synchronous CRTC. This configuration uses a bonded
> > > DSI link to provide a unified vblank for both displays.
> > >
> > > This allows application software to treat the two displays as a single,
> > > wide framebuffer with a synchronized refresh cycle, simplifying rendering
> > > logic for side-by-side panel arrangements.
> >
> > I'd like to understand how is it framed on the overall system design
> > level. If it's a panel controlled over the DSI interface, it's fine
> > since we can broadcast commands over two DSI links. What if the panel
> > (or bridge) is controlled via I2C / SPI?
> 
> You mean there is only DSI data and all configuration is done via I2C/SPI,
> right? I do not have a real use case so far, but it can be supported in the
> same way. Panel driver finds the sibling panel via device tree to get the
> peer I2C/SPI first. All commands are send to every bus in panel driver.

Not quite, because why and how should a normal DSI bridge driver know
and care about the 'peer' device? How would you describe that in DT and
in the DRM bridge chains framework?

> 
> >
> > >
> > > At the DSI host level, the frame width for each link must be that of an
> > > individual panel. The driver therefore halves the CRTC's horizontal
> > > resolution before configuring the DSI host and any DSC encoders, ensuring
> > > each panel receives the correct half of the framebuffer.
> >
> > >
> > > While the DSI panel driver should manage two panels togehter.
> > > 1. During probe, the driver finds the sibling dsi host via device tree
> > > phandle and register the 2nd panel to get another mipi_dsi_device.
> > > 2. Set dual_panel flag on both mipi_dsi_device.
> > > 3. Prepare DSC data per requirement from single panel.
> > > 4. All DSI commands should be send on every DSI link.
> > > 5. Handle power supply for 2 panels in one shot, the same is true to
> > >    brightness.
> > > 6. From the CRTC's perspective, the two panels appear as one wide display.
> > >    The driver exposes a DRM mode where the horizontal timings (hdisplay,
> > >    hsync_start, etc.) are doubled, while the vertical timings remain those
> > >    of a single panel. Because 2 panels are expected to be mounted in
> > >    left/right position.
> > >
> > > To maintain synchronization, both DSI links are configured to share a
> > > single clock source, with the DSI1 controller using the clock provided
> > > to DSI0 as below.
> > >
> > > &mdss_dsi1 {
> > >    assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> > >                    <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> > >    assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> > > }
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index de51cb02f267205320c5a94fc4188413e05907e6..1fddcea7f86547258be18a51a0a3e3f96f6c3838 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -177,6 +177,7 @@ struct msm_dsi_host {
> > >       bool registered;
> > >       bool power_on;
> > >       bool enabled;
> > > +     bool is_dual_panel;
> > >       int irq;
> > >  };
> > >
> > > @@ -935,7 +936,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > >                       return;
> > >               }
> > >
> > > -             dsc->pic_width = mode->hdisplay;
> > > +             if (msm_host->is_dual_panel)
> > > +                     dsc->pic_width = hdisplay;
> > > +             else
> > > +                     dsc->pic_width = mode->hdisplay;
> > >               dsc->pic_height = mode->vdisplay;
> > >               DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> > >
> > > @@ -1609,6 +1613,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
> > >       if (dsi->lanes > msm_host->num_data_lanes)
> > >               return -EINVAL;
> > >
> > > +     msm_host->is_dual_panel = dsi->dual_panel;
> > >       msm_host->channel = dsi->channel;
> > >       msm_host->lanes = dsi->lanes;
> > >       msm_host->format = dsi->format;
> > > @@ -2492,6 +2497,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> > >       if (!msm_host->dsc)
> > >               return MODE_OK;
> > >
> > > +     if (msm_host->is_dual_panel)
> > > +             pic_width = mode->hdisplay / 2;
> > > +
> > >       if (pic_width % dsc->slice_width) {
> > >               pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
> > >                      pic_width, dsc->slice_width);
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
