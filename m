Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC5A76012
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 09:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F2010E04A;
	Mon, 31 Mar 2025 07:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPrkfw3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174A310E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:29:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6keBW025020
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=phUwZFZ5mhfELLjTOW8rGZbl
 Cvy+Vlpi9I3rSLjA6Ps=; b=KPrkfw3aAcmE5q594UXNoHalPIkkL7mCQwI/oaYo
 ayb2hk9IqzXV6x6+doL4R/7GdHVHeMlx4LZISdZKtKisT1q6085xbzuK3mTGN9cD
 Qe8WnSjpdsyaAdTFKvm0B00vr+54RMygVuKVqh3A9KXqYJqfq+PgQJh72VlktRIf
 viSFSbOvnaXocoNoWDw/hgu4WFnCUHuyRrsy6HQpQNrD5/gQf3p/eFq+rrU+7bnH
 Nxz5I27d59Kr8r62e6gO47AUpBGggyECBSLOUKlGmMCjZIX0nzcmkpu0rw5rc6og
 LF7u+Z7Bsvw4UuPrUeyJrC0dbEYx2vaSG/5OSKGFThz2bw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1btr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:29:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so404344885a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 00:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743406177; x=1744010977;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phUwZFZ5mhfELLjTOW8rGZblCvy+Vlpi9I3rSLjA6Ps=;
 b=tX+FOV6jkFczwM2TaIEyPtVKRBKD95tcJuh0yio78MKKfZSV3muztw405VP3XXn+hg
 V8zz7a5/3tth5V3UuebQDw6HjG3G0PmuzIJt+4rcuzZqMNrf+yJ8Kp2hVHf5pY01RyLs
 Ny3jZaCTuUo4DxBV9sB2TYDx8QqVOoQVnpMuy5V+5bsHx/nRGDSDFsBuisx7crXdzkSN
 OC2k5+FrU/DKr53EyVSw8mb7QGvJI8KYbM8H0KCkrpWSD3hDU1Q9ngfxuYce//5xbDqo
 NTOCG70fxzDVq9sakoF4Wcnzba8Ie9LSR3+6raD3/7gL0ixaJZPQ7psl4bWWVY09dObE
 7HDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0daWJnpsEVE/cDV7Ck4L4tIbIyH6hf0Y0YacJL7q+kM2YL5FepqWaN+4RWTD0CLP8DdxHwQRK5Xc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt7Xr+mgWXAvr8cMDS+tvkjAV7mQM2xnWgzMok4m6EhCvjW2hR
 tz1q1geCOmEYC8gElTQhpnel7Qq/w9qJqQnU+navPSFnPgCrTRtBZWuPH6Gmu9lZRGHELKXK5IM
 2oe4uK7a1mYMcfITzqSzwDcjrKh/6cm0A8wCm/7zhTt44fq4LaX1BeTXDOP8f2ZnzML8=
X-Gm-Gg: ASbGncsDnY9NIydzGMvwBMaX0ex/Irfhnrhudh51NJ4NGPlSEYvQ33RDym6bW4BVzH+
 AwqtcBn/FZygYGKLSecJNIRSYIQm7La0GfP8kdIU4HYAuw/uhhnpWNVIlo5/3sKZbEOiNVS3NM2
 g8d3F3BXYLK+TWveoRp8UR4PyRcy4ghDBKfAVmxb3cv5XRhaSMRxTOYJ7gYh27cJ1D722I3Wgba
 +9ys81tythumnOg68FjD9GqzvlQRdUBjTrjhPn+GyYwnFRycFowjQcW0uS3oPi+Zyj+dm1vruh4
 BpLpJjH4hv6kvW6K3WZvOmNucZ02nTF3cy0MKrj423lmlZon/ve9JQ1UWnAKKFoxThnn4Nqgy65
 6PoU=
X-Received: by 2002:ae9:e71a:0:b0:7c5:9c38:ef6b with SMTP id
 af79cd13be357-7c69087de5dmr989169285a.45.1743406176640; 
 Mon, 31 Mar 2025 00:29:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpdVjAwWvGpq2NXiUE1uvv8u1k2nwWcCCAslrLnss1dIRF6sE69xV+n05GEjz5SNu5LlJiuA==
X-Received: by 2002:ae9:e71a:0:b0:7c5:9c38:ef6b with SMTP id
 af79cd13be357-7c69087de5dmr989167685a.45.1743406176121; 
 Mon, 31 Mar 2025 00:29:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0957fbc8sm1068700e87.123.2025.03.31.00.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 00:29:33 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:29:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>,
 "treapking@google.com" <treapking@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge:anx7625: Enable DSC feature
Message-ID: <q7tlmnj4g6rlamri2d2nbk7uvoiljcs3cwnqoquxik6vhs7p4p@owxr3kh6rqh6>
References: <BY5PR04MB673962A7C78CDE3AE605C4D2C7FB2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <BY5PR04MB673994A9BBEB1E619C7BC2BFC7C22@BY5PR04MB6739.namprd04.prod.outlook.com>
 <7now47ze2aikepvrf66bxogsw65aid4cta7ociqgnptt5nnalk@2dhmbhf5er6a>
 <BY5PR04MB6739C88817766BE8F79DFDB4C7CD2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <27ymk72vgx5nsnkkhj5knzwpcupspkpc67bzoxx7gw35l7rnhg@sfbygptq5bqs>
 <BY5PR04MB67392650EDC863C839779B45C7CC2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <CAA8EJprPfPkZS5Phfz==z3mNuAvZ5p1_4weg1s3k9DT-LkGeQw@mail.gmail.com>
 <BY5PR04MB673967BE07677050E5423502C7A12@BY5PR04MB6739.namprd04.prod.outlook.com>
 <zadaot6b4vmidofrjiboozhqykgqld4opyyaou55fn3d7ty4pc@eo4ewkmaeq5d>
 <BY5PR04MB673907E1BDED253B27C0C71FC7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR04MB673907E1BDED253B27C0C71FC7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67ea4461 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=bbNUuHX0AAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=pGLkceISAAAA:8 a=1XWaLZrsAAAA:8 a=e5mUnYsNAAAA:8 a=mUxmMiFOh5sTe-2DnZkA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=3b-t3vAtY4IUXy2q2Ylb:22 a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: RD-uWaKNukYFdHswqz7THz3hMAdWCxQQ
X-Proofpoint-ORIG-GUID: RD-uWaKNukYFdHswqz7THz3hMAdWCxQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310052
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

On Mon, Mar 31, 2025 at 03:04:07AM +0000, Xin Ji wrote:
> > > > > > > > > > > > > > > > > From: Dmitry Baryshkov
> > > > > > > > > > > > > > > > > <dmitry.baryshkov@linaro.org>
> > > > > > > > > > > > > > > > > Sent: Thursday, February 13, 2025 9:04 PM
> > > > > > > > > > > > > > > > > To: Xin Ji <xji@analogixsemi.com>
> > > > > > > > > > > > > > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil
> > > > > > > > > > > > > > > > > Armstrong <neil.armstrong@linaro.org>; Robert Foss
> > > > > > > > > > > > > > > > > <rfoss@kernel.org>; Laurent Pinchart
> > > > > > > > > > > > > > > > > <Laurent.pinchart@ideasonboard.com>; Jonas
> > Karlman
> > > > > > > > > > > > > > > > > <jonas@kwiboo.se>; Jernej Skrabec
> > > > > > > > > > > > > > > > > <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > > > > > > > > > > > > > > > > <maarten.lankhorst@linux.intel.com>; Maxime
> > Ripard
> > > > > > > > > > > > > > > > > <mripard@kernel.org>; Thomas Zimmermann
> > > > > > > > > > > > > > > > > <tzimmermann@suse.de>;
> > > > > > > > > > > > > > > David
> > > > > > > > > > > > > > > > > Airlie <airlied@gmail.com>; Simona Vetter
> > > > > > > > > > > > > > > > > <simona@ffwll.ch>; Bernie Liang
> > > > > > > > > > > > > > > > > <bliang@analogixsemi.com>; Qilin Wen
> > > > > > > > > > > > > > > > > <qwen@analogixsemi.com>; treapking@google.com;
> > > > > > > > > > > > > > > > > dri-devel@lists.freedesktop.org; linux-
> > > > > > > > > > > > > > > > > kernel@vger.kernel.org
> > > > > > > > > > > > > > > > > Subject: Re: [PATCH] drm/bridge:anx7625: Enable
> > > > > > > > > > > > > > > > > DSC feature
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > PLease remove such splats, use something more sensible.
> > > > > > > > > > > > > > OK, I'll change the subject
> > > > > > > > > > > > >
> > > > > > > > > > > > > It's not about the subject. Compare just "ABC DEF wrote:"
> > > > > > > > > > > > > and your quatation header.
> > > > > > > > > > > > Sorry, these message is automatically added by Outlook, I'll
> > > > remove it.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > On Thu, Feb 13, 2025 at 08:33:30PM +0800, Xin Ji
> > wrote:
> > > > > > > > > > > > > > > > > > As anx7625 MIPI RX bandwidth(maximum 1.5Gbps
> > per
> > > > > > > > > > > > > > > > > > lane) and internal pixel clock(maximum 300M)
> > > > limitation.
> > > > > > > > > > > > > > > > > > Anx7625 must enable DSC feature while MIPI
> > > > > > > > > > > > > > > > > > source want to output 4K30
> > > > > > > > > > > resolution.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > This commit message is pretty hard to read and
> > > > > > > > > > > > > > > > > understand for a non-native speaker. Please
> > > > > > > > > > > > > > > > > consider rewriting it so that it is easier to
> > > > > > > > > > > > > > > understand it.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Thanks for the review, sorry about that, I'll
> > > > > > > > > > > > > > > > rewriting the commit message
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 300
> > > > > > > > > > > > > > > > > > ++++++++++++++++++----
> > > > > > > > > > > > > > > > > >
> > > > > > > > ++++++++++++++++++drivers/gpu/drm/bridge/analogix/anx7625.
> > > > > > > > > > > > > > > > > > ++++++++++++++++++h
> > > > > > > > > > > > > > > > > > ++++++++++++++++++|
> > > > > > > > > > > > > > > > > > 32 +++
> > > > > > > > > > > > > > > > > >  2 files changed, 284 insertions(+), 48
> > > > > > > > > > > > > > > > > > deletions(-)
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > > a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > > > > > > > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > > > > > > > > index 4be34d5c7a3b..7d86ab02f71c 100644
> > > > > > > > > > > > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > > > > > > > > @@ -22,6 +22,7 @@
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >  #include <drm/display/drm_dp_aux_bus.h>
> > > > > > > > > > > > > > > > > > #include <drm/display/drm_dp_helper.h>
> > > > > > > > > > > > > > > > > > +#include <drm/display/drm_dsc_helper.h>
> > > > > > > > > > > > > > > > > >  #include <drm/display/drm_hdcp_helper.h>
> > > > > > > > > > > > > > > > > > #include <drm/drm_atomic_helper.h>  #include
> > > > > > > > > > > > > > > > > > <drm/drm_bridge.h> @@
> > > > > > > > > > > > > > > > > > -476,6
> > > > > > > > > > > > > > > > > > +477,138 @@ static int
> > > > > > > > > > > > > > > > > > +anx7625_set_k_value(struct anx7625_data
> > > > > > > > > > > > > > > > > > +*ctx)
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > MIPI_DIGITAL_ADJ_1, 0x3D); }
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +static int anx7625_set_dsc_params(struct
> > > > > > > > > > > > > > > > > > +anx7625_data *ctx)
> > > > > > > > {
> > > > > > > > > > > > > > > > > > +     int ret, i;
> > > > > > > > > > > > > > > > > > +     u16 htotal, vtotal;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     if (!ctx->dsc_en)
> > > > > > > > > > > > > > > > > > +             return 0;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     /* Htotal */
> > > > > > > > > > > > > > > > > > +     htotal = ctx->dt.hactive.min + ctx-
> > > > > > >dt.hfront_porch.min +
> > > > > > > > > > > > > > > > > > +             ctx->dt.hback_porch.min + ctx-
> > > > >dt.hsync_len.min;
> > > > > > > > > > > > > > > > > > +     ret = anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                             HORIZONTAL_TOTAL_PIXELS_L,
> > > > htotal);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                              HORIZONTAL_TOTAL_PIXELS_H,
> > > > htotal >>
> > > > > > 8);
> > > > > > > > > > > > > > > > > > +     /* Hactive */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                              HORIZONTAL_ACTIVE_PIXELS_L,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hactive.min);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                              HORIZONTAL_ACTIVE_PIXELS_H,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hactive.min >> 8);
> > > > > > > > > > > > > > > > > > +     /* HFP */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                              HORIZONTAL_FRONT_PORCH_L,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hfront_porch.min);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                              HORIZONTAL_FRONT_PORCH_H,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hfront_porch.min >> 8);
> > > > > > > > > > > > > > > > > > +     /* HWS */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                              HORIZONTAL_SYNC_WIDTH_L,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hsync_len.min);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                              HORIZONTAL_SYNC_WIDTH_H,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hsync_len.min >> 8);
> > > > > > > > > > > > > > > > > > +     /* HBP */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                              HORIZONTAL_BACK_PORCH_L,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hback_porch.min);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +                              HORIZONTAL_BACK_PORCH_H,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hback_porch.min >> 8);
> > > > > > > > > > > > > > > > > > +     /* Vtotal */
> > > > > > > > > > > > > > > > > > +     vtotal = ctx->dt.vactive.min + ctx-
> > > > >dt.vfront_porch.min
> > > > > > +
> > > > > > > > > > > > > > > > > > +              ctx->dt.vback_porch.min + ctx-
> > > > >dt.vsync_len.min;
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > > + ctx->i2c.tx_p2_client,
> > > > > > > > > > > > > TOTAL_LINES_L,
> > > > > > > > > > > > > > > > > > +                              vtotal);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > > + ctx->i2c.tx_p2_client,
> > > > > > > > > > > > > TOTAL_LINES_H,
> > > > > > > > > > > > > > > > > > +                              vtotal >> 8);
> > > > > > > > > > > > > > > > > > +     /* Vactive */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > > + ctx->i2c.tx_p2_client,
> > > > > > > > > > > > > ACTIVE_LINES_L,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.vactive.min);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > > + ctx->i2c.tx_p2_client,
> > > > > > > > > > > > > ACTIVE_LINES_H,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.vactive.min >> 8);
> > > > > > > > > > > > > > > > > > +     /* VFP */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + VERTICAL_FRONT_PORCH,
> > > > > > > > > > > > > > > > > > + ctx-
> > > > > > > > > > > >dt.vfront_porch.min);
> > > > > > > > > > > > > > > > > > +     /* VWS */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + VERTICAL_SYNC_WIDTH, ctx-
> > > > > > > > >dt.vsync_len.min);
> > > > > > > > > > > > > > > > > > +     /* VBP */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.tx_p2_client,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + VERTICAL_BACK_PORCH,
> > > > > > > > > > > > > > > > > > + ctx->dt.vback_porch.min);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > This code mostly duplicates
> > > > > > > > > > > > > > > > > anx7625_dsi_video_timing_config() with the I2C
> > > > > > > > > > > > > > > > > client being the only difference. Please consider
> > > > > > > > > > > > > > > > > extracting a common helper to
> > > > > > > > > > > write the timings.
> > > > > > > > > > > > > > > > It is hard to extracting a common helper, they are
> > > > > > > > > > > > > > > > used different I2C slave address and timing register
> > > > > > > > > > > > > > > > need divided by 3 if DSC
> > > > > > > > > > > enabled.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I2C client can be a parameter. Also please comment
> > > > > > > > > > > > > > > whether
> > > > > > > > > > > > > > > /3 is because of bpp/bpc ratio or due to some other
> > reason?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Does anx7625 support any mode other than 8bpp / 8bpc?
> > > > > > > > > > > > > > I'll try to make a common function, anx7625 mipi only
> > > > > > > > > > > > > > support RGB888. DSC
> > > > > > > > > > > > > 8bpp.
> > > > > > > > > > > > > > /3 is because of DSC ration 1:3.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Please add this to the commit message, add a comment next
> > > > > > > > > > > > > to the corresponding #define and use it instead of /3 all over
> > the
> > > > > > place.
> > > > > > > > > > > > OK
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     /* Htotal */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > > + ctx->i2c.rx_p0_client,
> > > > > > > > > > > > > > > TOTAL_PIXEL_L_7E,
> > > > > > > > > > > > > > > > > > +                              htotal);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > > + ctx->i2c.rx_p0_client,
> > > > > > > > > > > > > > > TOTAL_PIXEL_H_7E,
> > > > > > > > > > > > > > > > > > +                              htotal >> 8);
> > > > > > > > > > > > > > > > > > +     /* Hactive */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +                              ACTIVE_PIXEL_L_7E, ctx-
> > > > >dt.hactive.min);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min >>
> > > > > > > > 8);
> > > > > > > > > > > > > > > > > > +     /* HFP */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +                              HORIZON_FRONT_PORCH_L_7E,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hfront_porch.min);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +                              HORIZON_FRONT_PORCH_H_7E,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hfront_porch.min >> 8);
> > > > > > > > > > > > > > > > > > +     /* HWS */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +                              HORIZON_SYNC_WIDTH_L_7E,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hsync_len.min);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +                              HORIZON_SYNC_WIDTH_H_7E,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hsync_len.min >> 8);
> > > > > > > > > > > > > > > > > > +     /* HBP */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +                              HORIZON_BACK_PORCH_L_7E,
> > > > > > > > > > > > > > > > > > +                              ctx->dt.hback_porch.min);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + HORIZON_BACK_PORCH_H_7E,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + ctx->dt.hback_porch.min
> > > > > > > > > > > > > > > > > > + >> 8);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     /* Config DSC decoder internal blank
> > > > > > > > > > > > > > > > > > + timing for decoder to start
> > > > > > > > > > > */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p1_client,
> > > > > > > > > > > > > > > > > > +                              H_BLANK_L,
> > > > > > > > > > > > > > > > > > +                              dsc_div(htotal - ctx-
> > >dt.hactive.min));
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p1_client,
> > > > > > > > > > > > > > > > > > +                              H_BLANK_H,
> > > > > > > > > > > > > > > > > > +                              dsc_div(htotal -
> > > > > > > > > > > > > > > > > > + ctx->dt.hactive.min)
> > > > > > > > > > > > > > > > > > + >> 8);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     /* Compress ratio  RATIO bit[7:6] */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_write_and(ctx,
> > > > > > > > > > > > > > > > > > + ctx->i2c.rx_p0_client, R_I2C_1,
> > > > > > > > > > > > > 0x3F);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_write_or(ctx,
> > > > > > > > > > > > > > > > > > + ctx->i2c.rx_p0_client,
> > > > > > > > R_I2C_1,
> > > > > > > > > > > > > > > > > > +                             (5 - DSC_COMPRESS_RATIO) << 6);
> > > > > > > > > > > > > > > > > > +     /*PPS table*/
> > > > > > > > > > > > > > > > > > +     for (i = 0; i < PPS_SIZE; i += PPS_BLOCK_SIZE)
> > > > > > > > > > > > > > > > > > +             ret |=
> > > > > > > > > > > > > > > > > > + anx7625_reg_block_write(ctx,
> > > > > > > > > > > > > > > > > > + ctx-
> > > > > > > > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + R_PPS_REG_0
> > > > > > > > > > > > > > > > > > + + i, PPS_BLOCK_SIZE,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + &ctx->pps_table[i]);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     return ret; }
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +static int anx7625_timing_write(struct
> > anx7625_data
> > > > *ctx,
> > > > > > > > > > > > > > > > > > +                             struct i2c_client *client,
> > > > > > > > > > > > > > > > > > +                             u8 reg_addr, u16
> > > > > > > > > > > > > > > > > > +reg_val, bool
> > > > > > > > > > > > > > > > > > +high_byte) {
> > > > > > > > > > > > > > > > > > +     u8 reg_data;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     if (ctx->dsc_en)
> > > > > > > > > > > > > > > > > > +             reg_val = dsc_div(reg_val);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     reg_data = (high_byte ? (reg_val >> 8) :
> > > > > > > > > > > > > > > > > > + reg_val) & 0xFF;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     return anx7625_reg_write(ctx, client,
> > > > > > > > > > > > > > > > > > + reg_addr, reg_data); }
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Ugh, no. Calculate htotal in the calling function
> > > > > > > > > > > > > > > > > and call
> > > > > > > > > > > > > > > > > anx7625_reg_write() as you were doing that before.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > anx7625_timing_write() is a common function, it was
> > > > > > > > > > > > > > > > called many times, so we cannot calculate htotal in it.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On the caller side. I'd suggest to inline
> > > > > > > > > > > > > > > anx7625_timing_write() to make the code more explicit.
> > > > > > > > > > > > > > OK.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > >  static int
> > > > > > > > > > > > > > > > > > anx7625_dsi_video_timing_config(struct
> > > > > > > > > > > > > > > > > > anx7625_data
> > > > > > > > > > > > > > > > > > *ctx) {
> > > > > > > > > > > > > > > > > >       struct device *dev = ctx->dev; @@ -506,34
> > > > > > > > > > > > > > > > > > +639,33 @@ static int
> > > > > > > > > > > > > > > > > > anx7625_dsi_video_timing_config(struct
> > > > > > > > > > > > > > > > > anx7625_data *ctx)
> > > > > > > > > > > > > > > > > >       ret |= anx7625_write_or(ctx, ctx-
> > >i2c.rx_p1_client,
> > > > > > > > > > > > > > > > > >                               MIPI_LANE_CTRL_0,
> > > > > > > > > > > > > > > > > > ctx->pdata.mipi_lanes
> > > > > > > > > > > > > > > > > > - 1);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -     /* Htotal */
> > > > > > > > > > > > > > > > > >       htotal = ctx->dt.hactive.min + ctx-
> > > > >dt.hfront_porch.min
> > > > > > +
> > > > > > > > > > > > > > > > > > -             ctx->dt.hback_porch.min + ctx-
> > > > >dt.hsync_len.min;
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_TOTAL_PIXELS_L, htotal
> > &
> > > > 0xFF);
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_TOTAL_PIXELS_H,
> > htotal >>
> > > > 8);
> > > > > > > > > > > > > > > > > > +                      ctx->dt.hback_porch.min + ctx-
> > > > > > >dt.hsync_len.min;
> > > > > > > > > > > > > > > > > > +     /* Htotal */
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +                     HORIZONTAL_TOTAL_PIXELS_L, htotal,
> > > > false);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +                     HORIZONTAL_TOTAL_PIXELS_H,
> > > > > > > > > > > > > > > > > > + htotal, true);
> > > > > > > > > > > > > > > > > >       /* Hactive */
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_ACTIVE_PIXELS_L, ctx-
> > > > > > > > >dt.hactive.min
> > > > > > > > > > &
> > > > > > > > > > > > > 0xFF);
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_ACTIVE_PIXELS_H, ctx-
> > > > > > > > > > >dt.hactive.min >>
> > > > > > > > > > > 8);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + HORIZONTAL_ACTIVE_PIXELS_L,
> > > > > > > > > > > > > > > > > > + ctx->dt.hactive.min,
> > > > > > > > > > > > > false);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + HORIZONTAL_ACTIVE_PIXELS_H,
> > > > > > > > > > > > > > > > > > + ctx->dt.hactive.min, true);
> > > > > > > > > > > > > > > > > >       /* HFP */
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_FRONT_PORCH_L, ctx-
> > > > > > > > > > > > > >dt.hfront_porch.min);
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_FRONT_PORCH_H,
> > > > > > > > > > > > > > > > > > -                     ctx->dt.hfront_porch.min >> 8);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +                     HORIZONTAL_FRONT_PORCH_L,
> > > > > > > > > > > > > > > > > > + ctx->dt.hfront_porch.min,
> > > > > > > > > > > > > > > false);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +                     HORIZONTAL_FRONT_PORCH_H,
> > > > > > > > > > > > > > > > > > + ctx->dt.hfront_porch.min, true);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Are porches also compressed? I think blanking
> > > > > > > > > > > > > > > > > signal timings are transferred as is, without
> > compression.
> > > > > > > > > > > > > > > > Porches not be compressed, anx7625 internal digital
> > > > > > > > > > > > > > > > block will multiply by 3 while enable DSC feature,
> > > > > > > > > > > > > > > > so the register must
> > > > > > > > > > divided by 3.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Ack
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >       /* HWS */
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_SYNC_WIDTH_L, ctx-
> > > > > > > > > > >dt.hsync_len.min);
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_SYNC_WIDTH_H, ctx-
> > > > > > > > > > > >dt.hsync_len.min >>
> > > > > > > > > > > > > 8);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +                     HORIZONTAL_SYNC_WIDTH_L,
> > > > > > > > > > > > > > > > > > + ctx->dt.hsync_len.min,
> > > > > > > > > > > > > false);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +                     HORIZONTAL_SYNC_WIDTH_H,
> > > > > > > > > > > > > > > > > > + ctx->dt.hsync_len.min, true);
> > > > > > > > > > > > > > > > > >       /* HBP */
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_BACK_PORCH_L, ctx-
> > > > > > > > > > > >dt.hback_porch.min);
> > > > > > > > > > > > > > > > > > -     ret |= anx7625_reg_write(ctx, ctx-
> > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > -                     HORIZONTAL_BACK_PORCH_H, ctx-
> > > > > > > > > > > >dt.hback_porch.min >>
> > > > > > > > > > > > > 8);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +                     HORIZONTAL_BACK_PORCH_L,
> > > > > > > > > > > > > > > > > > + ctx->dt.hback_porch.min,
> > > > > > > > > > > > > > > false);
> > > > > > > > > > > > > > > > > > +     ret |= anx7625_timing_write(ctx, ctx-
> > > > >i2c.rx_p2_client,
> > > > > > > > > > > > > > > > > > +                     HORIZONTAL_BACK_PORCH_H,
> > > > > > > > > > > > > > > > > > + ctx->dt.hback_porch.min, true);
> > > > > > > > > > > > > > > > > >       /* Vactive */
> > > > > > > > > > > > > > > > > >       ret |= anx7625_reg_write(ctx,
> > > > > > > > > > > > > > > > > > ctx->i2c.rx_p2_client,
> > > > > > > > > > > > > ACTIVE_LINES_L,
> > > > > > > > > > > > > > > > > >                       ctx->dt.vactive.min); @@
> > > > > > > > > > > > > > > > > > -663,9
> > > > > > > > > > > > > > > > > > +795,15 @@ static int anx7625_dsi_config(struct
> > > > > > > > > > > > > > > > > > anx7625_data *ctx)
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >       DRM_DEV_DEBUG_DRIVER(dev, "config
> > > > > > > > > > > > > > > > > > dsi.\n");
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -     /* DSC disable */
> > > > > > > > > > > > > > > > > > -     ret = anx7625_write_and(ctx, ctx-
> > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > -                             R_DSC_CTRL_0, ~DSC_EN);
> > > > > > > > > > > > > > > > > > +     ret = anx7625_set_dsc_params(ctx);
> > > > > > > > > > > > > > > > > > +     if (ctx->dsc_en)
> > > > > > > > > > > > > > > > > > +             /* DSC enable */
> > > > > > > > > > > > > > > > > > +             ret |= anx7625_write_or(ctx, ctx-
> > > > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +                                     R_DSC_CTRL_0, DSC_EN);
> > > > > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > > > > +             /* DSC disable */
> > > > > > > > > > > > > > > > > > +             ret |= anx7625_write_and(ctx, ctx-
> > > > > > >i2c.rx_p0_client,
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + R_DSC_CTRL_0, ~DSC_EN);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >       ret |= anx7625_api_dsi_config(ctx);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > @@ -2083,6 +2221,7 @@ static int
> > > > > > > > > > > > > > > > > > anx7625_setup_dsi_device(struct
> > > > > > > > > > > > > > > > > anx7625_data *ctx)
> > > > > > > > > > > > > > > > > >               MIPI_DSI_MODE_VIDEO_HSE |
> > > > > > > > > > > > > > > > > >               MIPI_DSI_HS_PKT_END_ALIGNED;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +     dsi->dsc = &ctx->dsc;
> > > > > > > > > > > > > > > > > >       ctx->dsi = dsi;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >       return 0;
> > > > > > > > > > > > > > > > > > @@ -2186,20 +2325,68 @@
> > > > > > > > > > > > > > > > > > anx7625_bridge_mode_valid(struct drm_bridge
> > > > > > > > > > > > > > > > > *bridge,
> > > > > > > > > > > > > > > > > >       struct anx7625_data *ctx =
> > > > bridge_to_anx7625(bridge);
> > > > > > > > > > > > > > > > > >       struct device *dev = ctx->dev;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "drm mode
> > > > > > checking\n");
> > > > > > > > > > > > > > > > > > +     dev_dbg(dev, "drm mode checking\n");
> > > > > > > > > > > > > > > > > > +     if (mode->clock > SUPPORT_PIXEL_CLOCK)
> > > > > > > > > > > > > > > > > > +             return MODE_CLOCK_HIGH;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
> > > > > > > > > > > > > > > > > > +             return MODE_CLOCK_LOW;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -     /* Max 1200p at 5.4 Ghz, one lane, pixel clock
> > > > 300M */
> > > > > > > > > > > > > > > > > > -     if (mode->clock > SUPPORT_PIXEL_CLOCK) {
> > > > > > > > > > > > > > > > > > -             DRM_DEV_DEBUG_DRIVER(dev,
> > > > > > > > > > > > > > > > > > -                                  "drm mode invalid, pixelclock
> > too
> > > > > > high.\n");
> > > > > > > > > > > > > > > > > > +     if (mode->clock > DSC_PIXEL_CLOCK &&
> > > > > > > > > > > > > > > > > > + (mode->hdisplay % 3 !=
> > > > > > > > > > > > > > > > > > + 0))
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Magic number 3. Also is it actually required? I
> > > > > > > > > > > > > > > > > think DSC standard has no such requirement.
> > > > > > > > > > > > > > > > This is anx7625 limitation, if mode->hdisplay cannot
> > > > > > > > > > > > > > > > be divided by 3, then display will have overlap/shift
> > issue.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Ack, add a comment or extend a commit message please.
> > > > > > > > > > > > > > OK, I'll add a comment
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >               return MODE_CLOCK_HIGH;
> > > > > > > > > > > > > > > > > > -     }
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "drm mode
> > > > valid.\n");
> > > > > > > > > > > > > > > > > > +     dev_dbg(dev, "drm mode valid.\n");
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >       return MODE_OK;  }
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +static void anx7625_dsc_enable(struct
> > > > > > > > > > > > > > > > > > +anx7625_data *ctx, bool en)
> > > > > > > > > > > {
> > > > > > > > > > > > > > > > > > +     int ret;
> > > > > > > > > > > > > > > > > > +     struct device *dev = ctx->dev;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     ctx->dsc_en = en;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     if (en) {
> > > > > > > > > > > > > > > > > > +             ctx->dsc.dsc_version_major = 1;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.dsc_version_minor = 1;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.slice_height = 8;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.slice_width =
> > > > > > > > > > > > > > > > > > + ctx->dt.hactive.min /
> > > > > > > > > > > DSC_SLICE_NUM;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.slice_count = DSC_SLICE_NUM;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.bits_per_component = 8;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.bits_per_pixel = 8 << 4; /* 4
> > fractional
> > > > > > bits */
> > > > > > > > > > > > > > > > > > +             ctx->dsc.block_pred_enable = true;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.native_420 = false;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.native_422 = false;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.simple_422 = false;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.vbr_enable = false;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.rc_model_size =
> > > > > > > > > > > > > > > > > > + DSC_RC_MODEL_SIZE_CONST;
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > This one is default, please drop.
> > > > > > > > > > > > > > OK
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +             ctx->dsc.pic_width = ctx->dt.hactive.min;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.pic_height =
> > > > > > > > > > > > > > > > > > + ctx->dt.vactive.min;
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > These two are set on the DSC encoder side.
> > > > > > > > > > > > > > OK, I'll remove it
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +             ctx->dsc.convert_rgb = 1;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.vbr_enable = 0;
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > A lot of this params should be coming from the sink
> > > > device.
> > > > > > > > > > > > > > > > > You have to get them from the DPCD.
> > > > > > > > > > > > > > > > These parameter is just MIPI source and anx7625 and
> > > > > > > > > > > > > > > > used only for DSC feature,
> > > > > > > > > > > > > > > > Anx7625 is bridge IC, sink monitor only receive
> > > > > > > > > > > > > > > > normal DP signal from anx7625, sink device didn't
> > > > > > > > > > > > > > > > know DSC information, no need read
> > > > > > > > > > > > > DPCD.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Thanks. From you commit message it is impossible to
> > > > > > > > > > > > > > > understand whether DSC happens between the host and
> > > > > > > > > > > > > > > your bridge or between the bridge and the monitor.
> > > > > > > > > > > > > > I'll add more detail in commit message
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +             drm_dsc_set_rc_buf_thresh(&ctx->dsc);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + drm_dsc_set_const_params(&ctx->dsc);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +             ctx->dsc.initial_scale_value =
> > > > > > > > > > > > > > > > > > + drm_dsc_initial_scale_value(&ctx-
> > > > > > > > > > > > > > > >dsc);
> > > > > > > > > > > > > > > > > > +             ctx->dsc.line_buf_depth =
> > > > > > > > > > > > > > > > > > + ctx->dsc.bits_per_component +
> > > > > > > > > > > 1;
> > > > > > > > > > > > > > > > > > +             ret =
> > > > > > > > > > > > > > > > > > + drm_dsc_setup_rc_params(&ctx->dsc,
> > > > > > > > > > > > > DRM_DSC_1_2_444);
> > > > > > > > > > > > > > > > > > +             if (ret < 0)
> > > > > > > > > > > > > > > > > > +                     dev_warn(dev,
> > > > > > > > > > > > > > > > > > + "drm_dsc_setup_rc_params ret %d\n", ret);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > + drm_dsc_compute_rc_parameters(&ctx->dsc);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > You have ignored return value. Please handle the
> > > > > > > > > > > > > > > > > function returning an
> > > > > > > > > > > > > error.
> > > > > > > > > > > > > > > > OK
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > All these functions are to be called on the DSC
> > > > > > > > > > > > > > > encoder side as it has to be able to infer DSC params.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I don't know, we co-work with MTK encoder, they need us
> > > > > > > > > > > > > > to initial dsc data structure
> > > > > > > > > > > > >
> > > > > > > > > > > > > As I wrote, encoder should be able to influence some of
> > > > > > > > > > > > > those params. As such, DSC decoder should provide some
> > > > > > > > > > > > > values, then DSC encoder's .pre_enable should be able to
> > update
> > > > > > those values (e.g.
> > > > > > > > > > > > > by setting .pic_width and .pic_height and/or disabling some
> > of
> > > > flags).
> > > > > > > > > > > > > Then the DSC encoder should fill the rest of the params by
> > > > > > > > > > > > > calling all these
> > > > > > > > > > > functions. Consider how drm/msm/dsi handles it.
> > > > > > > > > > > > OK, I'll check it.
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +             drm_dsc_pps_payload_pack((struct
> > > > > > > > > > > > > > > > > > + drm_dsc_picture_parameter_set
> > > > > > > > > > > > > > > > > *)&ctx->pps_table,
> > > > > > > > > > > > > > > > > > +                                      &ctx->dsc);
> > > > > > > > > > > > > > > > > > +             dev_dbg(dev, "anx7625 enable dsc\n");
> > > > > > > > > > > > > > > > > > +     } else {
> > > > > > > > > > > > > > > > > > +             ctx->dsc.dsc_version_major = 0;
> > > > > > > > > > > > > > > > > > +             ctx->dsc.dsc_version_minor = 0;
> > > > > > > > > > > > > > > > > > +             dev_dbg(dev, "anx7625 disable dsc\n");
> > > > > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > >  static void anx7625_bridge_mode_set(struct
> > > > > > > > > > > > > > > > > > drm_bridge
> > > > > > > > *bridge,
> > > > > > > > > > > > > > > > > >                                   const struct drm_display_mode
> > > > > > *old_mode,
> > > > > > > > > > > > > > > > > >                                   const struct
> > > > > > > > > > > > > > > > > > drm_display_mode
> > > > > > > > > > > > > > > > > > *mode) @@ -2244,6 +2431,11 @@ static void
> > > > > > > > > > > > > > > > > > anx7625_bridge_mode_set(struct
> > > > > > > > > > > > > > > > > drm_bridge *bridge,
> > > > > > > > > > > > > > > > > >       DRM_DEV_DEBUG_DRIVER(dev,
> > > > > > > > > > "vsync_end(%d),vtotal(%d).\n",
> > > > > > > > > > > > > > > > > >                            mode->vsync_end,
> > > > > > > > > > > > > > > > > >                            mode->vtotal);
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     if (mode->clock > DSC_PIXEL_CLOCK)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > What if the sink doesn't support DSC? The decision
> > > > > > > > > > > > > > > > > whether to enable DSC or not should be happening
> > > > > > > > > > > > > > > > > in the
> > > > > > > > atomic_check().
> > > > > > > > > > > > > > > > > Likewise mode_valid should be able to check if
> > > > > > > > > > > > > > > > > your bridge and the sink can agree on DSC params
> > > > > > > > > > > > > > > > > and reject modes if they can
> > > > > > > > > > > not.
> > > > > > > > > > > > > > > > Anx7625 is bridge IC, it receive MIPI data and DP
> > > > > > > > > > > > > > > > output, DSC only exist between SOC and Anx7625, sink
> > > > > > > > > > > > > > > > monitor only receive normal DP signal from anx7625,
> > > > > > > > > > > > > > > > there is no compression at DP output, so no need to
> > > > > > > > > > > > > > > check sink device.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Well. Then the same question applies in the other
> > direction:
> > > > > > > > > > > > > > > what if the host doesnt' support DSC?
> > > > > > > > > > > > > > If SOC host doesn't support DSC, then cannot display
> > > > > > > > > > > > > > 4K30, currently, only debug with MTK DSI encoder.
> > > > > > > > > > > > >
> > > > > > > > > > > > > The bridge is a generic driver. So while you test with
> > > > > > > > > > > > > Mediatek platforms, you still have to think about a
> > > > > > > > > > > > > generic case and add necessary
> > > > > > > > > > > checks.
> > > > > > > > > > > > OK, I'll check it.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +             anx7625_dsc_enable(ctx, true);
> > > > > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > > > > +             anx7625_dsc_enable(ctx, false);
> > > > > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >  static bool anx7625_bridge_mode_fixup(struct
> > > > > > > > > > > > > > > > > > drm_bridge *bridge, @@
> > > > > > > > > > > > > > > > > > -2258,26 +2450,33 @@ static bool
> > > > > > > > > > > > > > > > > > anx7625_bridge_mode_fixup(struct drm_bridge
> > > > > > > > > > > > > > > > > > *bridge,
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode
> > fixup
> > > > > > > > > > > > > > > > > > set\n");
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -     /* No need fixup for external monitor */
> > > > > > > > > > > > > > > > > > -     if (!ctx->pdata.panel_bridge)
> > > > > > > > > > > > > > > > > > -             return true;
> > > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > >       hsync = mode->hsync_end - mode->hsync_start;
> > > > > > > > > > > > > > > > > >       hfp = mode->hsync_start - mode->hdisplay;
> > > > > > > > > > > > > > > > > >       hbp = mode->htotal - mode->hsync_end;
> > > > > > > > > > > > > > > > > >       hblanking = mode->htotal - mode->hdisplay;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "before mode
> > > > > > fixup\n");
> > > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d),
> > > > hfp(%d),
> > > > > > > > hbp(%d),
> > > > > > > > > > > > > > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > > -                          hsync, hfp, hbp, adj->clock);
> > > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev,
> > "hsync_start(%d),
> > > > > > > > > > > hsync_end(%d),
> > > > > > > > > > > > > > > > > htot(%d)\n",
> > > > > > > > > > > > > > > > > > -                          adj->hsync_start, adj->hsync_end,
> > adj-
> > > > > > >htotal);
> > > > > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > > > > +     dev_dbg(dev, "before mode fixup\n");
> > > > > > > > > > > > > > > > > > +     dev_dbg(dev, "hsync(%d), hfp(%d), hbp(%d),
> > > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > > +             hsync, hfp, hbp, adj->clock);
> > > > > > > > > > > > > > > > > > +     dev_dbg(dev, "hsync_start(%d),
> > > > > > > > > > > > > > > > > > + hsync_end(%d),
> > > > > > > > htot(%d)\n",
> > > > > > > > > > > > > > > > > > +             adj->hsync_start, adj->hsync_end,
> > > > > > > > > > > > > > > > > > + adj->htotal);
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > No. Please use drm_dbg_driver(), but not dev_dbg().
> > > > > > > > > > > > > > > > > And anyway, this should go to a separate commit.
> > > > > > > > > > > > > > > > OK, I'll not change it in this patch.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >       adj_hfp = hfp;
> > > > > > > > > > > > > > > > > >       adj_hsync = hsync;
> > > > > > > > > > > > > > > > > >       adj_hbp = hbp;
> > > > > > > > > > > > > > > > > >       adj_hblanking = hblanking;
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +     if (mode->clock > DSC_PIXEL_CLOCK) {
> > > > > > > > > > > > > > > > > > +             adj_hsync = DSC_HSYNC_LEN;
> > > > > > > > > > > > > > > > > > +             adj_hfp = DSC_HFP_LEN;
> > > > > > > > > > > > > > > > > > +             adj_hbp = DSC_HBP_LEN;
> > > > > > > > > > > > > > > > > > +             vref = (u64)adj->clock * 1000 *
> > > > > > > > > > > > > > > > > > + 1000 / (adj->htotal * adj-
> > > > > > > > > > > > > >vtotal);
> > > > > > > > > > > > > > > > > > +             goto calculate_timing;
> > > > > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     /* No need fixup for external monitor */
> > > > > > > > > > > > > > > > > > +     if (!ctx->pdata.panel_bridge)
> > > > > > > > > > > > > > > > > > +             return true;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > >       /* HFP needs to be even */
> > > > > > > > > > > > > > > > > >       if (hfp & 0x1) {
> > > > > > > > > > > > > > > > > >               adj_hfp += 1; @@ -2349,16 +2548,21
> > > > > > > > > > > > > > > > > > @@ static bool anx7625_bridge_mode_fixup(struct
> > > > > > > > > > > > > > > > > drm_bridge *bridge,
> > > > > > > > > > > > > > > > > >                       adj_hfp -= delta_adj;
> > > > > > > > > > > > > > > > > >       }
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "after mode
> > > > fixup\n");
> > > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d),
> > > > hfp(%d),
> > > > > > > > hbp(%d),
> > > > > > > > > > > > > > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > > -                          adj_hsync, adj_hfp, adj_hbp, adj-
> > >clock);
> > > > > > > > > > > > > > > > > > +calculate_timing:
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     dev_dbg(dev, "after mode fixup\n");
> > > > > > > > > > > > > > > > > > +     dev_dbg(dev, "hsync(%d), hfp(%d), hbp(%d),
> > > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > > +             adj_hsync, adj_hfp, adj_hbp,
> > > > > > > > > > > > > > > > > > + adj->clock);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >       /* Reconstruct timing */
> > > > > > > > > > > > > > > > > >       adj->hsync_start = adj->hdisplay + adj_hfp;
> > > > > > > > > > > > > > > > > >       adj->hsync_end = adj->hsync_start + adj_hsync;
> > > > > > > > > > > > > > > > > >       adj->htotal = adj->hsync_end + adj_hbp;
> > > > > > > > > > > > > > > > > > -     DRM_DEV_DEBUG_DRIVER(dev,
> > "hsync_start(%d),
> > > > > > > > > > > hsync_end(%d),
> > > > > > > > > > > > > > > > > htot(%d)\n",
> > > > > > > > > > > > > > > > > > -                          adj->hsync_start, adj->hsync_end,
> > adj-
> > > > > > >htotal);
> > > > > > > > > > > > > > > > > > +     if (mode->clock > DSC_PIXEL_CLOCK)
> > > > > > > > > > > > > > > > > > +             adj->clock = (u64)vref *
> > > > > > > > > > > > > > > > > > + adj->htotal *
> > > > > > > > > > > > > > > > > > + adj->vtotal /
> > > > > > > > > > > > > > > > > > + 1000 / 1000;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +     dev_dbg(dev, "hsync_start(%d),
> > > > > > > > > > > > > > > > > > + hsync_end(%d), htot(%d),
> > > > > > > > > > > > > clock(%d)\n",
> > > > > > > > > > > > > > > > > > +             adj->hsync_start, adj->hsync_end,
> > > > > > > > > > > > > > > > > > + adj->htotal,
> > > > > > > > > > > > > > > > > > + adj->clock);
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >       return true;  } diff --git
> > > > > > > > > > > > > > > > > > a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > > > > > > > > > > > > > b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > > > > > > > > > > > > > index eb5580f1ab2f..db931f5800b1 100644
> > > > > > > > > > > > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > > > > > > > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > > > > > > > > > > > > > @@ -149,6 +149,8 @@
> > > > > > > > > > > > > > > > > >  #define HFP_HBP_DEF          ((HBLANKING_MIN -
> > > > > > > > SYNC_LEN_DEF)
> > > > > > > > > > /
> > > > > > > > > > > 2)
> > > > > > > > > > > > > > > > > >  #define VIDEO_CONTROL_0      0x08
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +#define  TOTAL_LINES_L          0x12
> > > > > > > > > > > > > > > > > > +#define  TOTAL_LINES_H          0x13
> > > > > > > > > > > > > > > > > >  #define  ACTIVE_LINES_L         0x14
> > > > > > > > > > > > > > > > > >  #define  ACTIVE_LINES_H         0x15  /* Bit[7:6] are
> > > > > > reserved
> > > > > > > > */
> > > > > > > > > > > > > > > > > >  #define  VERTICAL_FRONT_PORCH   0x16
> > > > > > > > > > > > > > > > > > @@ -166,6 +168,32 @@
> > > > > > > > > > > > > > > > > >  #define  HORIZONTAL_BACK_PORCH_L      0x21
> > > > > > > > > > > > > > > > > >  #define  HORIZONTAL_BACK_PORCH_H      0x22  /*
> > > > Bit[7:4]
> > > > > > > > are
> > > > > > > > > > > > > reserved
> > > > > > > > > > > > > > > */
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +#define  H_BLANK_L                    0x3E
> > > > > > > > > > > > > > > > > > +#define  H_BLANK_H                    0x3F
> > > > > > > > > > > > > > > > > > +#define  DSC_COMPRESS_RATIO           3
> > > > > > > > > > > > > > > > > > +#define  dsc_div(X)                   ((X) /
> > > > > > DSC_COMPRESS_RATIO)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > This assumes 1:3 ratio. Does anx7625 support only
> > > > > > > > > > > > > > > > > 8bpp / 8bpc
> > > > > > > > > > mode?
> > > > > > > > > > > > > > > > > Or does
> > > > > > > > > > > > > > > > > 1:3 come from some other ratio?
> > > > > > > > > > > > > > > > We only tested 1:3 compression ratio, 24bpp compress
> > to
> > > > > > 8bpp.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > What are hardware limitations?
> > > > > > > > > > > > > > Anx7625 MIPI only support RGB888 24bpp. With DSC 3:1
> > > > > > > > > > > > > > compression, MIPI TX output 8bpp.
> > > > > > > > > > > > >
> > > > > > > > > > > > > As I wrote, a comment please.
> > > > > > > > > > > > OK
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > +#define  DSC_SLICE_NUM                2
> > > > > > > > > > > > > > > > > > +#define  DSC_PIXEL_CLOCK              250000
> > > > > > > > > > > > > > > > > > +#define  DSC_HSYNC_LEN                90
> > > > > > > > > > > > > > > > > > +#define  DSC_HFP_LEN                  177
> > > > > > > > > > > > > > > > > > +#define  DSC_HBP_LEN                  297
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +#define  TOTAL_PIXEL_L_7E             0x50
> > > > > > > > > > > > > > > > > > +#define  TOTAL_PIXEL_H_7E             0x51  /* bit[7:6]
> > > > are
> > > > > > > > reserved
> > > > > > > > > > > */
> > > > > > > > > > > > > > > > > > +#define  ACTIVE_PIXEL_L_7E            0x52
> > > > > > > > > > > > > > > > > > +#define  ACTIVE_PIXEL_H_7E            0x53  /* bit[7:6]
> > > > are
> > > > > > > > reserved
> > > > > > > > > > > */
> > > > > > > > > > > > > > > > > > +#define  HORIZON_FRONT_PORCH_L_7E     0x54
> > > > > > > > > > > > > > > > > > +#define  HORIZON_FRONT_PORCH_H_7E     0x55
> > > > > > > > > > > > > > > > > > +#define  HORIZON_SYNC_WIDTH_L_7E      0x56
> > > > > > > > > > > > > > > > > > +#define  HORIZON_SYNC_WIDTH_H_7E      0x57
> > > > > > > > > > > > > > > > > > +#define  HORIZON_BACK_PORCH_L_7E      0x58
> > > > > > > > > > > > > > > > > > +#define  HORIZON_BACK_PORCH_H_7E      0x59
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +#define  PPS_SIZE                     128
> > > > > > > > > > > > > > > > > > +#define  PPS_BLOCK_SIZE               32
> > > > > > > > > > > > > > > > > > +#define  R_PPS_REG_0                  0x80
> > > > > > > > > > > > > > > > > > +#define  R_I2C_1                      0x81
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > >  /******** END of I2C Address 0x72 *********/
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > >
> > > > > >
> > > >
> > /***************************************************************/
> > > > > > > > > > > > > > > > > > @@ -415,6 +443,7 @@ enum audio_wd_len {
> > > > > > > > > > > > > > > > > >  #define MAX_EDID_BLOCK       3
> > > > > > > > > > > > > > > > > >  #define EDID_TRY_CNT 3  #define
> > > > > > > > > > > > > > > > > > SUPPORT_PIXEL_CLOCK
> > > > > > > > > > > > > > > > > > 300000
> > > > > > > > > > > > > > > > > > +#define SUPPORT_MIN_PIXEL_CLOCK      50000
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >  /***************** Display End
> > > > > > > > > > > > > > > > > > *****************/
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > @@ -454,6 +483,7 @@ struct anx7625_data {
> > > > > > > > > > > > > > > > > >       int hpd_high_cnt;
> > > > > > > > > > > > > > > > > >       int dp_en;
> > > > > > > > > > > > > > > > > >       int hdcp_cp;
> > > > > > > > > > > > > > > > > > +     bool dsc_en;
> > > > > > > > > > > > > > > > > >       /* Lock for work queue */
> > > > > > > > > > > > > > > > > >       struct mutex lock;
> > > > > > > > > > > > > > > > > >       struct device *dev; @@ -479,6 +509,8 @@
> > > > > > > > > > > > > > > > > > struct anx7625_data {
> > > > > > > > > > > > > > > > > >       struct drm_connector *connector;
> > > > > > > > > > > > > > > > > >       struct mipi_dsi_device *dsi;
> > > > > > > > > > > > > > > > > >       struct drm_dp_aux aux;
> > > > > > > > > > > > > > > > > > +     struct drm_dsc_config dsc;
> > > > > > > > > > > > > > > > > > +     char pps_table[PPS_SIZE];
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > pps_table and drm_dsc_config can vary depending on
> > > > > > > > > > > > > > > > > the mode and connected sink. THey should be a part
> > > > > > > > > > > > > > > > > of the atomic state rather than a long-living
> > > > anx7625_data.
> > > > > > > > > > > > > > > > > So does
> > > > > > > > > > dsc_en.
> > > > > > > > > > > > > > > > No need to check sink monitor, because DSC only
> > > > > > > > > > > > > > > > exist between SOC and Anx7625, sink monitor only
> > > > > > > > > > > > > > > > receive normal DP signal from
> > > > > > > > > > > anx7625.
> > > > > > > > > > > > > > > > Anx7625 is responsible for decompression.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > The same way, they depend on the selected video mode,
> > > > don't
> > > > > > they?
> > > > > > > > > > > > > > Actually it depends on pixel clock, if it is more than
> > > > > > > > > > > > > > 250M, then need to do
> > > > > > > > > > > DSC.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Yes. So you should check if you can enable DSC in
> > > > > > > > > > > > > .atomic_check() and set dsc_en correspondingly. At the
> > > > > > > > > > > > > same time in
> > > > > > > > > > > > > .atomic_check() you can not modify anx7625_data as it is a
> > > > > > > > > > > > > check time, commit can be rejected or it can be a test-
> > > > > > > > > > > > > only check. So dsc_en should go to
> > > > > > > > > > > drm_bridge_state-wrapping structure.
> > > > > > > > > > > > >
> > > > > > > > > > > > > At the same time I don't see a value in storing the packed
> > > > > > > > > > > > > PPS table, it is a short- lived data.
> > > > > > > > > > > > Do you mean we can maintain dsc_en flag for each
> > > > > > > > > > > > timing/resolution in drm_bridge_state structure, and set it
> > > > > > > > > > > > in .atomic_check(), and check the drm_bridge_state's  dsc_en
> > > > > > > > > > > > in .atomic_enable()? I don't know how to
> > > > > > > > > > > make a drm_bridge_state-wrapping structure.
> > > > > > > > > > >
> > > > > > > > > > > Ideally yes. You should define
> > > > > > > > > > >   struct anx7625_bridge_state {
> > > > > > > > > > >     struct drm_bridge_state base;
> > > > > > > > > > >     bool dsc_en;
> > > > > > > > > > >   };
> > > > > > > > > > >
> > > > > > > > > > > Then define your own versions of atomic_reset and
> > > > > > > > > > > .atomic_duplicate_state callbacks.
> > > > > > > > > > >
> > > > > > > > > > > Note, we currently don't have a way to check that the DSI host
> > > > > > > > > > > actually supports DSC, you have to invent it.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > OK, got it, I'll try it and discuss with related people, thanks!
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Hi Dmitry,
> > > > > > > > > 1. I double confirmed with Mediatek encoder, they didn't have such
> > > > > > > > > a capability which can tell us whether it can support DSC or not.
> > > > > > > >
> > > > > > > > I'm not sure, what do you mean here. I'm talking a driver interface,
> > > > > > > > not about the Mediatek encoder on its own. The ANX7625 can be
> > used
> > > > > > > > with any DSI host, including one of the hosts which do not support
> > > > > > > > DSC. The
> > > > > > > > ANX7625 driver needs to negotate usage of the DSC with the
> > underlying
> > > > > > bridge.
> > > > > > > >
> > > > > > > > > 2. I tried to redefine .atomic_duplicate_state, and driver will
> > > > > > > > > save dsc_en in new bridge state in .atomic_check(), but I found 2
> > issue
> > > > > > > > >   a). As MTK driver need get DSC information before
> > > > > > > > > .atomic_pre_enable(), driver must check dsc_en and set DSC
> > > > > > > > > parameters in .mode_set(). But I cannot get
> > > > > > > >
> > > > > > > > By the 'set' do you mean 'calculate' or 'program to the hardware'?
> > > > > > > >
> > > > > > > > > drm_bridge_state data structure int .mode_set() interface.
> > > > > > > >
> > > > > > > > Don't use .mode_set() at all. Calculate parameters in
> > > > > > > > .atomic_check() and then write them in .atomic_enable(). You should
> > > > > > > > be able to fold
> > > > > > > > .mode_set() into .atomic_enable() anyway.
> > > > > > > Hi, MTK DSI encoder check DSC enable flag in DSI's .atomic_enable()
> > > > > > > interface, but
> > > > > >
> > > > > > Could you please provide me with a pointer to the source code?
> > > > > >
> > > > > > > upper layer call MTK dsi encoder .atomic_enable() is early than
> > > > > > > calling bridge's
> > > > > > > .atomic_pre_enable() interface. So, anx7625 bridge driver must set DSC
> > > > > > > en flag in .mode_set().
> > > > > > > >
> > > > > > > > >
> > > > > > > > >   b). Driver cannot get correctly dsc_en value from new bridge
> > > > > > > > > state in
> > > > > > > > > .atomic_pre_enable() or .atomic_enable().
> > > > > > > >
> > > > > > > > I don't get this. Why can it not?
> > > > > > > I dumped the bridge state's point
> > in .atomic_check(), .atomic_pre_enable()
> > > > > > and .atomic_enable() as following:
> > > > > > >     at atomic_duplicate_state() allocated drm_bridge_state
> > > > > > (0x0000000064d3ea49)
> > > > > > >     at atomic_check() drm_bridge_state (0x0000000064d3ea49)
> > > > > > >     at atomic_duplicate_state() allocated
> > > > > > drm_bridge_state(0x00000000e0d6843d)
> > > > > > >     at atomic_check() drm_bridge_state (0x00000000e0d6843d)
> > > > > > >
> > > > > > >     at atomic_pre_enable() drm_bridge_state (0x0000000081a4233a)
> > > > > > >     at atomic_enable() drm_bridge_state (0x0000000081a4233a) It
> > seems
> > > > > > > atomic_pre_enable() and atomic_enable() used different
> > drm_bridge_state
> > > > > > data structure.
> > > > > >
> > > > > > This should not be happening. Please check the dmesg with
> > drm.debug=0x16.
> > > > It
> > > > > > might give you a clue.
> > > > >
> > > > > Hi Dmitry,  the below is summarized kernel log, it is based on kernel v6.6.
> > > >
> > > > This is a very old kernel. Please don't use it for development. We are
> > > > on the way to 6.14, development targets 6.15. Always use linux-next,
> > > > drm-next, drm-misc-next or a similar branch. Using 6.6 means that the
> > > > patch is completely untested on the contemporary kernels.
> > > >
> > >
> > > Hi Dmitry, I failed to upgrade kernel to the latest 6.15 on our Chromium board.
> > 
> > Maybe it's because there is no 6.15?
> 
> Sorry, I mean 6.14, I tried to porting code to 6.14, but failed.
> 
> > 
> > > So I cannot verify this patch on 6.15.
> > > As I cannot verify on 6.15, and duplicate bridge state feature not working on
> > v6.6,
> > > and dsc_en flag is not necessary, I removed it in next version.
> > 
> > I can't understand this comment. Please don't submit code that wasn't
> > validated against recent enough kernels. v6.6 was published more than
> > two years ago.
> 
> OK, so I remove dsc_en flags in next patch, this flag is no need anymore,
> Driver always check currently pixel clock to decide whether enable DSC or not.
> 
> > 
> > >
> > > >
> > > > >
> > > > > 1. MTK's DSC patch not upstream yet, so I cannot give a link, as log show,
> > MTK
> > > > call crtc atomic_enable
> > > > > and will print out message "[drm:mtk_crtc_atomic_enable]
> > > > mtk_crtc_atomic_enable 119", in this function,
> > > > > MTK probe DSC flag and enable/disable encoder's DSC feature. And it
> > called
> > > > before
> > > > > calling anx7625 bridge .atomic_pre_enable(). So it is too late if we set DSC
> > > > parameters in .atomic_enable().
> > > >
> > > > What is 'probe DSC flag'? You should calculate your params
> > in .atomic_check().
> > >
> > > I don't need to calculate it in .atomic_check(), check it in .mode_set()
> > 
> > No. You must reject the mode if it can not be handled. Not being able to
> > use DSC because the DSI host can't provide you with the DSC data is one
> > of the examples.
> 
> I don't know whether the DSI host support DSC feature, and
> I confirmed with MTK SOC MIPI develop engineer, there is no flag to tell bridge
> driver that host support DSC or not.

Responded in the thread for the next iteration. Please extend the API as
required.

> So, I'll force set DSC parameters if pixel clock over 250M.

NAK

> 
> > 
> > >
> > > >
> > > > >
> > > > > 2. With drm.debug=0x16, based on the below message, the
> > drm_bridge_state
> > > > in .atomic_enable() is
> > > > > "0x00000000f555285e", I cannot find out where allocated it from kernel
> > > > message,
> > > >
> > > > Which state is returned by drm_atomic_helper_bridge_reset()?
> > > Removed dsc_en flag, no need to keep this flag any more.
> > >
> > > >
> > > > > seems it is not allocated by .atomic_duplicate_state(), but driver will
> > > > call .atomic_destroy_state() to destroy it.
> > > > > Currently, we verified this patch on kernel v6.6, I'm not sure whether it is a
> > bug
> > > > on this kernel version.
> > > > >
> > > > > [ 1441.867169] anx7625: at atomic_duplicate_state() allocated
> > > > drm_bridge_state (000000009c41f83d)
> > > > > [ 1441.867173] mediatek-drm mediatek-drm.19.auto:
> > > > [drm:drm_atomic_get_private_obj_state] Added new private object
> > > > 00000000b3365a4b state 000000009c41f83d to 000000008a2c4e47
> > > > > [ 1441.867194] anx7625: at atomic_check() drm_bridge_state
> > > > (000000009c41f83d), drm_crtc_state(00000000d7a34c7e)
> > > > > [ 1441.867204] anx7625: at atomic_destory_state() destroy
> > > > state(0x000000009c41f83d)
> > > > > [ 1441.875754] anx7625: at atomic_duplicate_state() allocated
> > > > drm_bridge_state (000000004d0ab8c9)
> > > > > [ 1441.875758] mediatek-drm mediatek-drm.19.auto:
> > > > [drm:drm_atomic_get_private_obj_state] Added new private object
> > > > 00000000b3365a4b state 000000004d0ab8c9 to 000000005bab791c
> > > > > [ 1441.875783] anx7625: at atomic_check() drm_bridge_state
> > > > (000000004d0ab8c9), drm_crtc_state(00000000fefeb2dd)
> > > > > [ 1441.875805] anx7625 4-0058: [drm:anx7625_bridge_mode_set] drm
> > mode
> > > > set
> > > > > [ 1441.875839] [drm:mtk_crtc_atomic_enable] mtk_crtc_atomic_enable
> > 119
> > > > > [ 1441.876649] mediatek-drm mediatek-drm.19.auto:
> > > > [drm:drm_atomic_helper_commit_modeset_enables] enabling
> > > > [ENCODER:41:DSI-41]
> > > > > [ 1441.876655] anx7625: at atomic_pre_enable() drm_bridge_state
> > > > (00000000f555285e)
> > > > > [ 1441.879778] anx7625: at atomic_enable() drm_bridge_state
> > > > (00000000f555285e)
> > > > > [ 1441.886301] anx7625 4-0058: [drm:anx7625_dp_start] config dsi.
> > > > > [ 1441.894841] anx7625 4-0058: [drm:anx7625_dp_start] compute
> > > > M(14820608), N(691200), divider(2).
> > > > > [ 1441.901921] anx7625 4-0058: [drm:anx7625_dp_start] success to config
> > > > DSI
> > > > > [ 1441.913360] mediatek-drm mediatek-drm.19.auto:
> > > > [drm:drm_atomic_state_default_clear] Clearing atomic state
> > > > 000000005bab791c
> > > > > [ 1441.913383] anx7625: at atomic_destory_state() destroy
> > > > state(0x00000000f555285e)
> > > >
> > > > This looks strange a bit. The driver has programmed the state in
> > > > atomic_enable() and then it gets destroyed without .atomic_disable().
> > 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
