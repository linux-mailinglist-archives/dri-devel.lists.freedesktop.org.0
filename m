Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC7AC1D21
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 08:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5324010E74D;
	Fri, 23 May 2025 06:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTnRr9dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFEF10E1E9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 06:37:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N2Pb4h000805
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 06:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7zz9ji5cIOjQX4hOArDwk738
 7kW3RHiO0O55xfpG6Is=; b=CTnRr9dwe2M1uplDPARZQcexO+uO9BvrWd79mhEd
 /8SyRruLPI2+aUB1/LEbGGyYbGX9sb/0p5WJuJvcHy0awqqYEUOYHccDZf404un8
 2KDOK3mHDTJyO4Tasn9TgZbqp3ZanwzuZm+eGcaihD6sk9b+XKgz++auX1P2fSMl
 n0FhI6tbKqa4gX4pQ+gaBGyduCv1SPMXzHPoJ7PYknu5fGEXmTtn8frDEynvibxi
 NwxwfITftgnVN3Wcr+13m8bLPggSYb0u5MUBzonZ8tu3YF6LowVxtHlqlBTM+0HQ
 jjLBeLtBJImWo+T0LqA+vKwawUt+l8XY61qBEFrqtV+5sg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tqbjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 06:37:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-231e6e1d988so97325735ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747982251; x=1748587051;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7zz9ji5cIOjQX4hOArDwk7387kW3RHiO0O55xfpG6Is=;
 b=A1h3PtCjF1m6r9lriBeJcRbrrBFpfE86ZUE2f4IXBAr+bt3Luj4A/Og++g0YbTRIcu
 rrCBns20K8Eb+uXYJNG0/Mo644QFy8cakqMi1y4BxPT1mlQkbJOqNmPA94n9uAkSQIeu
 dhHKE2ZnsGedOteaMwXFbYAsE6DQgC1LSLbmmo1X9t9rVPLTinlhV+hbNEXu6Qg4ySed
 Skj3eBh+1YTCnrHhlX3PLn002hfEST5z8CNHRi5GkPDGsYOj0Gj80IaVI5BOtsJXBrTk
 iSc3PLqpTmDmA8lkOET/Cru7i73PX11h344js3WLfuZw5S4qKU/UNqkCW4VydM9fkDqB
 ZjuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHAPotADQ9qQLcYWNjf3IG+23P2abZ1zevDFRtDqaN+MYxXlb0KQ8/KQat3e2qw4NSxrLddnNiNu8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza1FSQB4g1PrWXydgLqT2hOoLkJCerK02iA8CrQ08cuZe52vyc
 W6Qu7LLcFC2NMhkoE0W1VqvdgmteaWnNSf2ViHg/EgG9XsXN9OE1x4jBSi+8dtXC406+fYbsWBy
 Cn1ggeHzCLwlaDrWp84pgZQG2yQT5kbQtmV38L0kbc5rN+A5941AyI7CdgKiCC2hY5kOSVF73nY
 ZEsVQ2UjAup4pXlSMkTFn3mv0CpQbzaQxJYgNRB+FVqICAEA==
X-Gm-Gg: ASbGnctZvkeQbjm4k6CJocWGSYS3zMfGIOsvwITQ9roVxB3zmY2plee4SINvXfr/h27
 /PxgY/E+UIbSMivvWwx/TpeUH45pyKPbncRuMguAMn+6gIXTpekhT1KwWfKlvY5V+9efHjQkPra
 CHebjLNrY=
X-Received: by 2002:a17:902:ecd2:b0:220:c178:b2e with SMTP id
 d9443c01a7336-231de35f33amr364720655ad.17.1747982251286; 
 Thu, 22 May 2025 23:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuaiuV0G9QRGb5Hnq6IbqmN3mBTTf5yONFPPCpe95iMPXazI01z8NelzftlSRDOYxi7XzKHqGchw3ayhEjyjY=
X-Received: by 2002:a17:902:ecd2:b0:220:c178:b2e with SMTP id
 d9443c01a7336-231de35f33amr364720215ad.17.1747982250907; Thu, 22 May 2025
 23:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
 <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 May 2025 09:37:19 +0300
X-Gm-Features: AX0GCFs98FdOCY-yZ7IKpHyVKbDhhDl08gc-loWfxbzIQ7gAa6-h1r4-ygftWGg
Message-ID: <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=683017ac cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=yC-0_ovQAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AFwX74By9Q62wxIGxlYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: Azk4XU0pJU-2BSTTuHeXdC3XK9HmFSwo
X-Proofpoint-GUID: Azk4XU0pJU-2BSTTuHeXdC3XK9HmFSwo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1OSBTYWx0ZWRfX+HNs/8wKyH9x
 n6cCqfxgJ2DJ71UqaRZON+46wNuyF7/ZTnd3WELZWwlYO3CGTm7r5O2EvY7SGtCeZT7kX9L84jf
 6aHlY0TjpQEiFOQP4IA9uMnkMLkz1K0NP5S6Pfyv8IbETZiKZBrUWmPDrtZOMT507mwzaL64YAK
 wf2jeC6uLja8TZ7IWUGpFCk/hfKqC5yTEyPcPikFu8RBs9xr1Nmk5nIqhjeANv9sSbwnGZdgyoO
 8upWKZ6TlYo0dxsyA4BTIFBzVo7/4JW0/j+EuxVQBi9MmKHuHB4mAQE+YANkBG99fPikI2MYsG2
 BbCevPiehYcs4UtvNbbEafjo2sm0q+Oh2anrrOh/s4IVPXXWHSO2LdRDLgBXc6VYcxKanY1s13j
 nEvB1mcCnNhx3B9DMyzU5e8ZkxzeT/iJxY2pIb2WXliVyBl8qx1Y7u5RMTPuYOEaPO2c6LZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230059
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

Hi Biju

On Fri, 23 May 2025 at 09:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Dmitry Baryshkov,
>
> Thanks for the series.
>
> Looks like, After this patch, when I change resolution using modetest it is not working.
> Monitor is showing out of range/No signal on RZ/V2L SMARC EVK connected to ADV7535.
>
> Not sure, I am the only one facing this issue?

I have been testing the series on db410c / adv7533, but something
might have changed between the testing time and the present time. I
will try checking it next week.

In the meantime, you can probably try comparing what gets programmed
in adv7511_mode_set().

>
> Modetest works fine with 6.15.0-rc6-next-20250516, where this patch series is
> not present.
>
> Cheers,
> Biju
>
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dmitry Baryshkov
> > Sent: 20 May 2025 23:40
> > Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
> >
> >
> > On Sat, 17 May 2025 04:59:36 +0300, Dmitry Baryshkov wrote:
> > > Currently it is next to impossible to implement CEC handling for the
> > > setup using drm_bridges and drm_bridge_connector: bridges don't have a
> > > hold of the connector at the proper time to be able to route CEC events.
> > >
> > > At the same time it not very easy and obvious to get the CEC physical
> > > address handling correctly. Drivers handle it at various places,
> > > ending up with the slight differences in behaviour.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [01/10] drm/bridge: move private data to the end of the struct
> >         commit: fa3769e09be76142d51c617d7d0c72d9c725a49d
> > [02/10] drm/bridge: allow limiting I2S formats
> >         commit: d9f9bae6752f5a0280a80d1bc524cabd0d60c886
> > [03/10] drm/connector: add CEC-related fields
> >         commit: e72cd597c35012146bfe77b736a30fee3e77e61e
> > [04/10] drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
> >         commit: bcc8553b6228d0387ff64978a03efa3c8983dd2f
> > [05/10] drm/display: add CEC helpers code
> >         commit: 8b1a8f8b2002d31136d83e4d730b4cb41e9ee868
> > [06/10] drm/display: hdmi-state-helper: handle CEC physical address
> >         commit: 603ce85427043ecb29ef737c1b350901ce3ebf09
> > [08/10] drm/display: bridge-connector: hook in CEC notifier support
> >         commit: 65a2575a68e4ff03ba887b5aef679fc95405fcd2
> > [09/10] drm/display: bridge-connector: handle CEC adapters
> >         commit: a74288c8ded7c34624e50b4aa8ca37ae6cc03df4
> > [10/10] drm/bridge: adv7511: switch to the HDMI connector helpers
> >         commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>


-- 
With best wishes
Dmitry
