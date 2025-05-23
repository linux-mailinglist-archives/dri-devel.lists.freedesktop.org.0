Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9B8AC2B25
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 22:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03FE10E190;
	Fri, 23 May 2025 20:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzaHnvd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2E910E190
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 20:54:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NE5Zbb011652
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 20:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xGsTmYa/MTrDvtxH7cGdAy2E
 ZY9Znbq6eFuOlZmfNV4=; b=HzaHnvd8WifaHr4q4pYESqG8VAsbPZmNHGlCS9K4
 HEiVOY06K6obNCQ0yNNfcT62vS4K+OoJJYMf/okPOdehINvpK9PeofMTfouULT3i
 0PYiRqMr/j8yVtCrgh6VeBdjueMpLWVg4k9T/EkHIHO4NnQ0Z/f40ADo1UAjbiwO
 53gdfeciJ3nyTfKfICGMpWf3Tc5/PZhvcoR7nUlG6BQWqgH6TQr3a7a14I7DsZQd
 oOGtN83AUpvgRDfir5BtY7yAlxHtFaSzrlmOez2aKw3r2YAnnybe3e51nsz8wVqf
 ZP4C8461iTRJZA9zNVA6pDpv/76dXBgQM+Ej7KwNbUIUAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfbb1p6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 20:54:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23209d8ba1bso2077445ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 13:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748033690; x=1748638490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGsTmYa/MTrDvtxH7cGdAy2EZY9Znbq6eFuOlZmfNV4=;
 b=AsWiCmdRYRmNFBLCYwolmIM/hsnokz81Qe2hDVo+DR+VjlCDoH0cs4EkqPfVIrAZbX
 x9vh9hmc1RlmgECMQjrPwx1G5AgYP0D8jA+OzqQctYt8UCjVI4lWy4DDvWdvQYO0MNwI
 WVFSIBuNxKt+n8bss+agjMOd45+XnQ4rkCNQH3KpJ5KeKSqnGlC1o+Z1Wr12c09Gvnxw
 04sllpb7j+sIb7nR5ICSSd3McqwooYG0Lh0ltiK1RCYJaj6ezE/7YTiPgvvoFwELn2hB
 qqk9R85zi42LQDbCk0gExVpBNDjorPoW66Xt4IToHK2DsThcxgOW8vv8sMQ/Jl8gcEWh
 fLfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgKAdM2lrkyz/fxgjQTeFgcQU2AUP1SRsA+KLVOM/aMBq1tahFWQlbwBQ3jQO0ijJRdpti2KPdxC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlFOs9kf1lpxMoBkUYAka0JfdYgbqRt+WItuinAtXOnHZ8dk9x
 TB9poKSgpjPQiIiI95Y4sYROCC79eV8dkF4EZSdVsLmF7SCvJAczPXIgaAd1c7T0RAxxvAzIM1l
 cVCE4PH14jNFa2yzLVTMNzGSkjLKiAFSfL0JzzoIdLbQfAW/AU4xH7HhYFshozdYFvvhCneHFpO
 MacnKjhfXDmb9CrQ1nlhC/vCnU6ayMr5RcWZV4lLPzAJB/6A==
X-Gm-Gg: ASbGncu2rWgKb01f1XPRZK+Vsmz+aXPO5Y01e06q6QpQvmr/HTj+kQwJ4eFBcq4soUg
 fh8VwwPcNAGiArEyXsBuYm7HtWeU2PFWuWD7PsYgnlsz+vKt2Y5Is0FMMop/HUJXU1zns
X-Received: by 2002:a17:903:1a45:b0:21f:4649:fd49 with SMTP id
 d9443c01a7336-23414fd2b6emr12006085ad.49.1748033689764; 
 Fri, 23 May 2025 13:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2+djcdWZZOUY45CK8hFq1ljQL9Ck+pLYoQLwnHIMvO9Lzc/dxUORmL7LuCsi7OvchWKdssRk2mjPcYXHyEa0=
X-Received: by 2002:a17:903:1a45:b0:21f:4649:fd49 with SMTP id
 d9443c01a7336-23414fd2b6emr12005815ad.49.1748033689354; Fri, 23 May 2025
 13:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
 <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
 <aDB8bD6cF7qiSpKd@tom-desktop> <aDCDMdhJIFa-4qVX@tom-desktop>
In-Reply-To: <aDCDMdhJIFa-4qVX@tom-desktop>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 May 2025 23:54:37 +0300
X-Gm-Features: AX0GCFteBc_L8q3e6jIHeV4yeCgO1fBrrsmwNcqRDkuC4xmE9RCdGZrb-qQ5ZHg
Message-ID: <CAO9ioeUBv-xBQFqqYrBLG3h1SGByMvN7mnfoiqvFXYTFrvuTYA@mail.gmail.com>
Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
X-Proofpoint-ORIG-GUID: KSGrcexbW9_QIwtssb0SlTCSDkFjimNQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5MSBTYWx0ZWRfXzZGZVjTiytN8
 IVSUkAzz8PmmBW8T5O6ry9X2As0Q4+YgjzF/6CroFg3W05XgOGfvSXaSQN9G79IrmCgoZyStOtX
 kkn4FdEJC/3swlNhYHHms/yvRV0UNiJY4Uk/e9OKNtQEWceWm2L1nw3rjqcd3Tkcwgu/LXEJCCV
 /tZseIPgrgOvTYkii+TlO95JAsJ/PEf43W7LqmIASmIVMGHv8YiifpivrnC2TXGNMDBOsjIfCYi
 1eYns2dbnDwrx2IxeIMfcyLmPamiOu2NFMKzciXVOckP55i0sRSlc1OdrrdQ1BaQSx1hBthAB9i
 PtaNES1vM1EwrkKqY+mQ94a+6ebltca+K5PTUQkR5YtEf+Hst5b4XthzqjqQCuPoApQNhl6Cr1U
 6vocGcY0pO4p19tULMBOxRTCHfFy7Ru1VfrwIiG2UfV9T77lpCKCwQse4yvHz7NjpifNDTjV
X-Proofpoint-GUID: KSGrcexbW9_QIwtssb0SlTCSDkFjimNQ
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=6830e09b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=yC-0_ovQAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t8ECiZ1qh8-ZNPQwj0wA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230191
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

On Fri, 23 May 2025 at 17:16, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Hi Biju, Dmitry,
>
> On Fri, May 23, 2025 at 03:47:24PM +0200, Tommaso Merciai wrote:
> > Hi Biju, Dmitry,
> > Thanks for your comments.
> >
> > On Fri, May 23, 2025 at 09:37:19AM +0300, Dmitry Baryshkov wrote:
> > > Hi Biju
> > >
> > > On Fri, 23 May 2025 at 09:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > >
> > > > Hi Dmitry Baryshkov,
> > > >
> > > > Thanks for the series.
> > > >
> > > > Looks like, After this patch, when I change resolution using modetest it is not working.
> > > > Monitor is showing out of range/No signal on RZ/V2L SMARC EVK connected to ADV7535.
> > > >
> > > > Not sure, I am the only one facing this issue?
> >
> > I have the same issue using RZ/G3E Smark EVK connected to ADV7535.
> > I found that switching back to the old:
> >
> >  - adv7511_mode_set()
> >  - Using also old .mode_set = adv7511_bridge_mode_set,
> >
> > Implementation fix the issue on my side.
>
> Diving a bit on this issue I'm seeing the following:
>
> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>
> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
>
> Same result but I think bad timing:
>
>  - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_enable()
>  - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enable()
>
> What do you think? Thanks in advance.

It might be, we have had cases of such troubles with other bridges.
Please send a patch, I'll ack / merge it.
Please add a comment before adv7511_mode_set() that it should not be
merged to atomic_enable().

>
> Thanks & Regards,
> Tommaso
>
> >
> > Thanks & Regards,
> > Tommaso
> >
> > >
> > > I have been testing the series on db410c / adv7533, but something
> > > might have changed between the testing time and the present time. I
> > > will try checking it next week.
> > >
> > > In the meantime, you can probably try comparing what gets programmed
> > > in adv7511_mode_set().
> > >
> > > >
> > > > Modetest works fine with 6.15.0-rc6-next-20250516, where this patch series is
> > > > not present.
> > > >
> > > > Cheers,
> > > > Biju
> > > >
> > > > > -----Original Message-----
> > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dmitry Baryshkov
> > > > > Sent: 20 May 2025 23:40
> > > > > Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
> > > > >
> > > > >
> > > > > On Sat, 17 May 2025 04:59:36 +0300, Dmitry Baryshkov wrote:
> > > > > > Currently it is next to impossible to implement CEC handling for the
> > > > > > setup using drm_bridges and drm_bridge_connector: bridges don't have a
> > > > > > hold of the connector at the proper time to be able to route CEC events.
> > > > > >
> > > > > > At the same time it not very easy and obvious to get the CEC physical
> > > > > > address handling correctly. Drivers handle it at various places,
> > > > > > ending up with the slight differences in behaviour.
> > > > > >
> > > > > > [...]
> > > > >
> > > > > Applied, thanks!
> > > > >
> > > > > [01/10] drm/bridge: move private data to the end of the struct
> > > > >         commit: fa3769e09be76142d51c617d7d0c72d9c725a49d
> > > > > [02/10] drm/bridge: allow limiting I2S formats
> > > > >         commit: d9f9bae6752f5a0280a80d1bc524cabd0d60c886
> > > > > [03/10] drm/connector: add CEC-related fields
> > > > >         commit: e72cd597c35012146bfe77b736a30fee3e77e61e
> > > > > [04/10] drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
> > > > >         commit: bcc8553b6228d0387ff64978a03efa3c8983dd2f
> > > > > [05/10] drm/display: add CEC helpers code
> > > > >         commit: 8b1a8f8b2002d31136d83e4d730b4cb41e9ee868
> > > > > [06/10] drm/display: hdmi-state-helper: handle CEC physical address
> > > > >         commit: 603ce85427043ecb29ef737c1b350901ce3ebf09
> > > > > [08/10] drm/display: bridge-connector: hook in CEC notifier support
> > > > >         commit: 65a2575a68e4ff03ba887b5aef679fc95405fcd2
> > > > > [09/10] drm/display: bridge-connector: handle CEC adapters
> > > > >         commit: a74288c8ded7c34624e50b4aa8ca37ae6cc03df4
> > > > > [10/10] drm/bridge: adv7511: switch to the HDMI connector helpers
> > > > >         commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> >



-- 
With best wishes
Dmitry
