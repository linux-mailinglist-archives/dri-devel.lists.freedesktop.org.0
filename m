Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 011515ADDA9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 04:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE3310E029;
	Tue,  6 Sep 2022 02:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2093.outbound.protection.outlook.com [40.107.101.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5DC10E029
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 02:58:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WP1xtwEd1RXSToWNvrNhzZeNTdJhuQwHzly5rGKkqqJyCqP0TolJZvl51rGTjypQ/S/L6K+AarY7F6DAriemqvBRMFL1fmNMY7JeQKiPTtH9WdeYoN1Ldy5jftO5xlIIwJvQ8LtTswwqLuGlKhbGbPsexsyPeXvzyOTVPKmJzZIcPrdh9vlPThKYCvF6X8Bmiw6ZLW64WvdXfoNXBj/XtgWeR5HICoW1zzMeCJp9LyO9nVm1hUzsxYNdqQfgBoHkiIXkKtJeHiVeaMS+10FL12DuLESPS8MprmCvYqCY3De3EXVDqbEuHKi1TqIERG7hcs914CYfEI73utcfQ40mpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSjVfscx5eAwvDv0ILiVYKmxqhjb1+FZ5X1sB2WTaDk=;
 b=Pd4kJQ0pN4QjLja0v2t4v1KKLB39D1FupItsSme3yJmU6yqGIdBpn5plJ3/mJar0Q8ITV7budDm0qzsvS0XZbHErpDVYWSHtESCzspp2ndbBRegTHbapIdunz3nq+rIhSWT2a7bha5PkWxJuABD4Wt1Nz3JA9yMeBS4Ev/7f9drpGvRWGC3/xoeyJAVstBTO1Babmwb02w3g1pN5C6BeobuLwWiTY+v4fSDaxH8pKrGXrTDuQaXOrNjNLtIuViqqevtkUT0tHSWI+NehpJjfjQFUnSClT3K7XcfYA8bXI/7gzFob35zJML6d7snBOGNMwmsdrCVoGp9sXGnDQCmz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSjVfscx5eAwvDv0ILiVYKmxqhjb1+FZ5X1sB2WTaDk=;
 b=CTS7l1dv9OdpKz/lTXr2dHAEM3/esN0cOLDGPD97fH9vld0dcnjz51FCRSO6D59TmMM/Up5D13b6n7MaoLulYVaQy0itql7FIqfNq22su1QepBq8FaAQMmwCeYoGethTpDc8md+QXKGOsnFu11gU0U58DibtUW3qoGPvER4s1OQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CO2PR04MB2197.namprd04.prod.outlook.com (2603:10b6:102:c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 02:58:06 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1ad:536d:f2aa:8d13]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1ad:536d:f2aa:8d13%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 02:58:06 +0000
Date: Tue, 6 Sep 2022 10:57:53 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Set HPD irq detect window to 2ms
Message-ID: <20220906025753.GA642918@anxtwsw-Precision-3640-Tower>
References: <20220903130833.541463-1-xji@analogixsemi.com>
 <CAG3jFyum5M8iGdW++c7rayUn4ogJ6izWaX7VaqMfV7ShAe_kRQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyum5M8iGdW++c7rayUn4ogJ6izWaX7VaqMfV7ShAe_kRQ@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d913f8ae-0360-4ce9-b9ca-08da8fb39f29
X-MS-TrafficTypeDiagnostic: CO2PR04MB2197:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0LsfaDA60wEbTCDTqwlrjd430Ncwbwi3VeYlTpd7VyKhIapurYCsYMXiY5/CiHqFiIngpn21BUxk5w8NViI0lLDvVNGbpa/87g870sp2T+QbnzaAF6tvMKTIkNHwV0TY4SrHjXowmluztRE/LJNX/TrZsm3CGmD3/CFySrt/tKGIy+xP8RquwKDbTS7n/a4gxjHhUmdULZWLAnh4u09BK+PhY+vL4to0fnTkaH14Qcxuu7eggx/zGQY3Kw9KyxXC4z4nqOETz+OCdysXdMoUAr0wAjkht5F59rEYWNaWvtdjf6B1GMlIs7q+zjCoN1M0oL88J1lkBjhHPqvuyYyogaPW17gUVoHKDvqBiwg6m7sViPy3aIChQcVTMv8t0RWUocZ1Dwi6ops9N6WOk6ohGU+rBJHuFD2tOKri1PBC+sMT7dm18EcYhnUgp3U7mysgib19BFOPrMW+UqfVrTmNTK3YViSsokCpx7KTv34kEYBOGU027nHJxzCHRT0XA2h3fg0i6Lqau2NEUVALyUwUeUSMQkXZyXrRV1CupH5hNFv+NG915ffG+0CmrH8WvDaiouuWBSB41l9IyOqbG8nWDEm6vdHVxUv+bjdm4rAbekl0iOPyWwBRr47cOZGv9SKVi14+5BV1vgrpWT4NusbSXYixh8WhFpMHI8ZOdv66q6xjR4UUxCM4CBTgTBzR3dHRkhc5spFsU2SuqScrMPMORlxAQgeFZRhM0UVYmr4G1xPE1sX7ouOg6tzvleBOYlShRBmVCzr6EyEY31CtgG27w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(376002)(346002)(136003)(39840400004)(396003)(83380400001)(186003)(1076003)(6486002)(316002)(6916009)(54906003)(66946007)(4326008)(66556008)(66476007)(8676002)(52116002)(6666004)(86362001)(26005)(6506007)(6512007)(2906002)(9686003)(5660300002)(33656002)(41300700001)(478600001)(33716001)(8936002)(7416002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6jqr6qqeilE/htiXUXBzL0q0vPWqApvVNKSfKAb27yB0khDYXI/GG9rkenM8?=
 =?us-ascii?Q?dddFMFBRhS0ER9EY5tuGvSxC3k80VjgmycDS4AtjkqvWEgU5dUwwagRnwFYM?=
 =?us-ascii?Q?OkqVBHTK7yGDNol6kx1bvgTjw6u+mFJvrmWUkbOKEkD3DdaHv9pXyZM4EhTr?=
 =?us-ascii?Q?4RZN0zUuSmBAtaIk6Qo54vuY+Mu9D2pqHFYUdnEyEIabSMtNHof9Sx9e0hzp?=
 =?us-ascii?Q?5a8VKdfFCxWs4baA1f3EYgqRCXLVU7/FfrZGz7W6LfOfmkzQv1a9Q4i0DBKA?=
 =?us-ascii?Q?I0vqdSbdLQEylvIiyQPhOXqttrk+Ky/krw4AW9wER6I5R3D76k99v2JogVmS?=
 =?us-ascii?Q?OIEt5y+uViI49xnrOm5EY4Zn5g9vujNbqlvlHGL1BgH/bnydVz16y4v5vFOx?=
 =?us-ascii?Q?ja8c0+9bIAx9v7ethGTR/4ZpkwJfugyhR7bJ+IiLtsUXYNMgy+Mfe5zZrlVJ?=
 =?us-ascii?Q?0U56UfJCD4I8vdJJD8lmGCsXOax71Yxvxat7ZnPihhmyYEmXe3Q3LP4MdzP0?=
 =?us-ascii?Q?ADe9igNlTvDjzF2Ldl1NB80NFARYBS6Fnnn06gF7Z0xsRoOVo4mj72/M++KH?=
 =?us-ascii?Q?E6VDeXWHoEOg2Du7Wku29nTuaexbGANvboZJkNR82+nEXv/JCwMCsw/vJ7IL?=
 =?us-ascii?Q?b+BDjY2ELSUUpnsHrdzdkwbzIm9PfwNkTFVkok2VRtiIDyQLevQrJPKWtker?=
 =?us-ascii?Q?L8+IlLfwbkbLGwgho08XZ5PTSELU/yBEnYuF6LiI7JTpFe+b81GOskMUgM6l?=
 =?us-ascii?Q?NV3JXvBeO6DaM7hdwUAMKbCVhygvdq84jeo4L6NvlzrAYEsHquU2Qk+NVkg6?=
 =?us-ascii?Q?M3XbT6dJFKxy2w52TOr1rBWK98ucYipZGWTeHJsEZZWSJGugZcfm5dW5Mr5c?=
 =?us-ascii?Q?vZ21Kk8EdP9t4sjMEfCwMvNxKsrD4dqOe9Q1+fsM850YQiAB5dril7p+9w4V?=
 =?us-ascii?Q?gWaHiTovg58St4JWqY/pbp3VnO4d231dWZ0f1aqr0/ob4NpmrdiZNdzcdsS+?=
 =?us-ascii?Q?MAyt3kKsvC/h+7zh7MteeP3JPKMVrmBaQ8h0+9MaIQKV1jWvgNb+422gx9kL?=
 =?us-ascii?Q?FHBkb+/1nezNNzeXI0g+LOZMQ/yXfGmvX/2X9/KGV8jtjW4DqLRh/bKnB/GJ?=
 =?us-ascii?Q?Iet8zu6ae17FPCl3R5ES5de0cV/ZwkpZ5elKhTR2DdPbFS11vYQMDmp73jCJ?=
 =?us-ascii?Q?9nNtUYeHueUb9xCBsYCIjR/FdJXAyUPLCh2wi5NFYGgPT36s8XfnpSZV+hq4?=
 =?us-ascii?Q?S2/h0XChpFZ0Nsua29pv8kt5x+AmCiCdpCyYF2DsapiL2Bt4vbMyaX59hw2I?=
 =?us-ascii?Q?Zu62clm58/N1bZL77s4y/D07o0Wa8CYh3EivDYO/Wmi6nypn1BpqUVI3iCtO?=
 =?us-ascii?Q?LOzeuuVGC2H08n9tp+Rf3J0OTgLZUynP04Xa+c+dzmUKPhqArfxpMyIV5k45?=
 =?us-ascii?Q?hR2Yx8VvAnYu/2ZXj/sID3acki31s7ntxv+2vZWTUXGHlYSg7cmyey9LFbVJ?=
 =?us-ascii?Q?u24Z2Jq9CIklCeXrKzEzrGmOyfJ/ZT/vc3isWi3G11+xAN2Z1Xw1xRBau0ax?=
 =?us-ascii?Q?9zohOyH/25wF11fgCV/gBRyb64u/Y3ezBCKg4ZSS?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d913f8ae-0360-4ce9-b9ca-08da8fb39f29
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 02:58:06.1388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVkbikW80LW4mu9+J/Nj4NXrFd7H3OmZz/PVWUSPzmYtcVM2qbErMxCcErroXjqq9KSEez7jElcNMfiA6t+blg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2197
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, mliu@analogixsemi.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 06:48:06PM +0200, Robert Foss wrote:
> Hi Xin,
> 
> On Sat, 3 Sept 2022 at 15:09, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > Some panels trigger HPD irq due to noise, the HPD debounce
> > may be 1.8ms, exceeding the default irq detect window, ~1.4ms.
> > This patch set HPD irq detection window to 2ms to
> > tolerate the HPD noise.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 14 ++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++++++
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index c74b5df4cade..0c323b5a1c99 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1440,6 +1440,20 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> >
> >  static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
> >  {
> > +       int ret;
> > +
> > +       /* Set irq detect window to 2ms */
> > +       ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +                               HPD_DET_TIMER_BIT0_7, HPD_TIME & 0xFF);
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +                                HPD_DET_TIMER_BIT8_15,
> > +                                (HPD_TIME >> 8) & 0xFF);
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +                                HPD_DET_TIMER_BIT16_23,
> > +                                (HPD_TIME >> 16) & 0xFF);
> 
> Does the HPD debounce timer register need to be written for every HPD
> status read?
Hi Robert Foss, yes, it is better to set it in every HPD status check, because the
HPD may be affected by noise, once the chip detect HPD is low, the timer
register will be automatically set to 1.4ms, so the driver better set it
in each check loop.

Thanks,
Xin
> 
> > +       if (ret < 0)
> > +               return ret;
> > +
> >         return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
> >  }
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index e257a84db962..14f33d6be289 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -132,6 +132,12 @@
> >  #define I2S_SLAVE_MODE 0x08
> >  #define AUDIO_LAYOUT   0x01
> >
> > +#define HPD_DET_TIMER_BIT0_7   0xea
> > +#define HPD_DET_TIMER_BIT8_15  0xeb
> > +#define HPD_DET_TIMER_BIT16_23 0xec
> > +/* HPD debounce time 2ms for 27M clock */
> > +#define HPD_TIME               54000
> > +
> >  #define AUDIO_CONTROL_REGISTER 0xe6
> >  #define TDM_TIMING_MODE 0x08
> >
> > --
> > 2.25.1
> >
