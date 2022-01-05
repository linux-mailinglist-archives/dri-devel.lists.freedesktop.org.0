Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CB54851D2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 12:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4FB10E560;
	Wed,  5 Jan 2022 11:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2090.outbound.protection.outlook.com [40.107.94.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D4410E55F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 11:31:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7bjCtPI1/zNu08qT1WNZjGyuXsHKeAu3ACsisuB83cX630uWC9zRVUDWDTWmsQEO9uQt4YMhrm65ZU16OV3oGOdfoqTbQrhtZ3LNiNSJ5q+GSvR1hzyFU2/W7O35mX12dFfB6dm7b5fMVfpT15ZnrM1wvdAZRa7z93hiIvsjM5WEfo8D1mmF11WL5z3cMSFgYghkCq2YANXHP8SW0BNajIngf3TF53VSOMezUVKOArbT1wRQKFW/An/vxPWFVO1UL0qgP094GaW+Utvsyq5rd+fRaBXTtkSjd5UyJ/qcRV2+cME84+g2iSUt6VLmIOy9QGyefD8Zkk7VXn8LuIaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQL0Vir54jpK8eeFAO5U4c7/w4iFCF3+um9k+KRp3ng=;
 b=PS31w1dlJTfS/321SlMUdR94ruckvEzOTb1D9DiEStChLsKVnpz62Yd2cqiOIz1xNLYXu/uwIDvZ64xhxJ8+4fNcDzUut0E0rFbd4FhqjAiNNsw9BTQ22RFjLQqspEg5jleTBX7AKAKEowqpQweM1X9FSZtiHhIINy2NT8L3UkAxWanVFT4GadAohJ7mpvgzO4y7OvJdXqkgW4X2eIfy2Wt9XJ6jYIY2huz3OXVX53z+Aw0wJCLVdDzDhizVojHwdSEI0Eqp28Ngv85dff3pJ3WmwEX8iO8UUenjQtfeZEkYmCxbOQvMy4nwunnC402X4uVfSjAiUYdB7hyUYnQeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQL0Vir54jpK8eeFAO5U4c7/w4iFCF3+um9k+KRp3ng=;
 b=GDOtVH4d+nbXpCyFI31ou0LvzlhHRS3rtuYMERcFiLp1PXvzlcaGrwX32oT7TK+1Ia+DAwbfjesrTxDByWY1rVJQjdc+RH+bI9yHd0s6hkfLdecu/DMAFIKlcMJPRAh0p9dQpD05Dac+d0sLNEhvJoGkwa1GIM9/sYhQwuJrM6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5191.namprd04.prod.outlook.com (2603:10b6:a03:c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 11:31:49 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108%3]) with mapi id 15.20.4867.009; Wed, 5 Jan 2022
 11:31:49 +0000
Date: Wed, 5 Jan 2022 19:31:44 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH 1/2] drm/bridge: anx7625: add HDCP support
Message-ID: <20220105113144.GA1319393@anxtwsw-Precision-3640-Tower>
References: <20211109024237.3354741-1-xji@analogixsemi.com>
 <CAG3jFytGbNadbCMOY_GiEsB565PtTah_A1sNik7NK5FYrhScEw@mail.gmail.com>
 <20220105071709.GA1312820@anxtwsw-Precision-3640-Tower>
 <CAG3jFysy1BcykodMWRnvB-BJj9Jx7yHLbsJu2Kp52n_7kVS4gw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFysy1BcykodMWRnvB-BJj9Jx7yHLbsJu2Kp52n_7kVS4gw@mail.gmail.com>
X-ClientProxiedBy: HK2PR04CA0075.apcprd04.prod.outlook.com
 (2603:1096:202:15::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2b2ee04-846c-42bf-3af1-08d9d03ef679
X-MS-TrafficTypeDiagnostic: BYAPR04MB5191:EE_
X-Microsoft-Antispam-PRVS: <BYAPR04MB51917DE656ACD77805885FDCC74B9@BYAPR04MB5191.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8tKJxWDo1h6cTLsMWBWbVHYyuYYhHQ95OYJyoHu7h9LxwI5Aq873zN56cal+OfU47Xw4V2LfhD1El3LRIQ2EO9zVyRqiey+ci2FRmis8UwzEcMWtqlgWdWAF61n1FbeBHZWG9nUY7R3QNzsaKi62WRUXcv+uebKF8AkxKw6Gigi3VwYrQe9N4C+94nbhJvsrB7PU59QYA7rkG5kbPex6ubmHfgE0k/jwuTPMEKLVNchfjTzqPV0jgYku3cYOCKg4HKe/VvOJEcv2RsSKnve1o3cHUVcx/b4gkm1nhM6QteMMugioc6861Qn5HBview4nnfyP+TYTUo7FPxZKWAYTTOAP+6bW8L/3wB9Dpc1/sIGkXBx11m1Xos0tEjlsnm7pb1bop++Eq+6eqUy81UttM/0dhfMNFhGtU6tzyRTcwxOhGfSzme7ZixM+AgyfaSkV4KCtCwBEixCXtjf6dOnsX53Nb/GlCJIpJvPkAXbwV0dGZdHH9Yr8H1qg+F0V54WyXHp8pnF5rqBKxdzNx6uQ4S9rL+NgKwphNqiLLVI05Tufe3hrDz0XLdnavY3RAvC91z8RscLopoOg46ZAnUi056t6okskTdrhDcGQkp/sdJvoyvNesswgnojIXTj0yptf+5G4pfZFCAEWvjxfF4F5qoVppSwAhSMrc0DmTgPfCtDMbJKNPXCnsdF4++huQl1vhJc8J2mPvCxLuL5bsPSpNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(26005)(9686003)(38100700002)(186003)(33716001)(83380400001)(38350700002)(52116002)(66476007)(6506007)(55236004)(6666004)(1076003)(316002)(33656002)(107886003)(66556008)(30864003)(6512007)(86362001)(4326008)(8936002)(6486002)(7416002)(66946007)(8676002)(6916009)(5660300002)(2906002)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EhbLwj9S3at9gQKJ9zd7f3VP2n0jCHIrVAPH/9rEWv8cCJZCfHlUrFIoKiOS?=
 =?us-ascii?Q?rJ2vIyyqIXoLSZeKuvmGGM6R3vsKEm+gRJdO1nPttcljzQBeQATkFkLW7yEm?=
 =?us-ascii?Q?bDY6ytptqYPgyT6tOuow9qcmy/L2n2HC5SEVEGfW9NquYGR6B8jf+0HpM+/P?=
 =?us-ascii?Q?Bo0MO00fvU+AYcEqv+/XcXms8+go/H5bGUIOgvXRLqzoPYGNPDcMqiiIKZHQ?=
 =?us-ascii?Q?07UJA63tV4ZApS9Zk/4zsCR9sNmz37fQf6bZUQR3lxUqe51HpjnSX83yKyQm?=
 =?us-ascii?Q?pyZja5se87MbxXSUfZWcLNFWwNt9WAp545NH3kQDJWHGE1fo9XWmsy6CGo0u?=
 =?us-ascii?Q?hJn9bDU2QG+3YenlBKhEcKKLgHgjochRS+q/ed27xOuDXreqds/7wx4qlKUs?=
 =?us-ascii?Q?G1y2yq2Gl41qtK/XVgeYEzG4oPdeLiDSEfFJ9zrHicVZsG0gNB/Fldcji1wY?=
 =?us-ascii?Q?R5mBzK9xZoYLTS7Ms9duK4pMYVW3EzRLDGESPubS+++EXUkqFxH0eWV7vTg4?=
 =?us-ascii?Q?rcnRt1vqM19VKlHzcSHnqq3LY7EdGuAgBLnXwpg8nhXb49VqQIDsuehM1caZ?=
 =?us-ascii?Q?F5+AFOqYU1KWFw+xbEPPe2AejWg71I9bkgh/ASSKmwTbPvUYFJL180cGqO7t?=
 =?us-ascii?Q?or1/rPUwRNaSoOpAG91XlY6pb7IwQvC5uAaSsXpqOtl3YrdzxNTgei1lfHSj?=
 =?us-ascii?Q?egKkL3LTAArRIuQnJATf+fvkZa0rh0E8zx1yyQn5D9f4utXdfSi2pnhszh0Q?=
 =?us-ascii?Q?P25pt5PIZhmJWJu8MI9vAirzACLEIPHgUUPjdN/+J5q7BMr6OexMO2ObuFlC?=
 =?us-ascii?Q?pqXbXUXA5gz7Iij3b3y0S+rjWhzUqW/H0qOp9d14w8WlSUYKnqsknfForVVI?=
 =?us-ascii?Q?BkY0QCiBfYL1TDrkXp4yJ9BExfFAVKyg/eE2jFwuF8SMgo6LwmP9VbnwKTV4?=
 =?us-ascii?Q?zsKXT2+YSnGtI6gEImpOMsED2Ch4Dkq4u69imP2QictoTTcshM1IKJlc17kW?=
 =?us-ascii?Q?8Oi29c4BvvUbPcf9Hrz3uycQUYfdkjDdCDJWGj2AoOaToLpXabMsA3mAuvb+?=
 =?us-ascii?Q?VDJ9Y3tc8I3D9MhC/oUm+bFE4xJLOSoqQOxMPFysPzb9KBMxotY62LftKv7h?=
 =?us-ascii?Q?L+TLlracBSG2DDLuEEzRtx2oH3v5F3Ros3iTlL2h+SKOZw6xDIxSs+ynwe99?=
 =?us-ascii?Q?88iYxgF0njfK/TccUNW0cC3FD32jX+V+VtvrBGZRGSdnIGJ4a1hIjj8r9LYl?=
 =?us-ascii?Q?Hn7THZgZzBevt1LHFT0Y2bkEwwrlrexcMc+ZeKBR5GoIjkI6OpJnZ6svLaVX?=
 =?us-ascii?Q?9+qo794jBCDt58v+A8ygaUF7E6rEnKG53KUj0kuVqz9eEAFdIlgsTKXZLQuu?=
 =?us-ascii?Q?haRonhQD3z2Y6ouzZrU4a1QMvgEUPd2ZfD1g+aDIMfniYWSE3Gm32e1w2+Ne?=
 =?us-ascii?Q?o6S+l7eRz++KhtF6DMXasuPf3T8eqpiD9esmr9/BKwYTzgWZr+Ipt4ntSSaG?=
 =?us-ascii?Q?aHC5MqDHEEclEGptAC9D5ZJi06QRJ0xrupSDdY7wDEt4VXbBbMKa2+SSx/8K?=
 =?us-ascii?Q?NR4fUs8qq4WB7HtdlvVJl8OkOxvG9hQc9ELNIFidg0/MZfKNgR3Q4E6FEtYr?=
 =?us-ascii?Q?Acd6pLGqhZ/IyKklkEl33Ag=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b2ee04-846c-42bf-3af1-08d9d03ef679
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 11:31:49.5387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8t0xjrBW0YLwqVyZf8Lvdb6U2PayVJxWjcSxCARyX21l0OU+pIZ2NChY7caegjB9Kqz+JCVOYYAMAR7GDMFhyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5191
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
Cc: drinkcat@google.com, pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 bliang@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, tzungbi@google.com,
 Laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, sam@ravnborg.org,
 qwen@analogixsemi.com, dan.carpenter@oracle.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 05, 2022 at 11:32:01AM +0100, Robert Foss wrote:
> On Wed, 5 Jan 2022 at 08:17, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > On Tue, Jan 04, 2022 at 03:50:34PM +0100, Robert Foss wrote:
> > > Hey Xin,
> > Hi Robert Foss, thanks for the reply.
> > As HDCP config interface "anx7625_hdcp_config(..)" need be called in
> > anx7625_connector_atomic_check(...) interface, so I cannot split out
> > atomic conversion patch.
> 
> I don't think that's correct, but maybe I'm missing something. The
> atomic conversion patch should be self-contained if done before the
> addition of HDCP support.
Hi Robert Foss, OK, you are right, I'll split out the atomic conversion patch.

Thanks,
Xin
> 
> >
> > Thanks,
> > Xin
> > >
> > > On Tue, 9 Nov 2021 at 03:42, Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > This patch provides HDCP setting interface for userspace to dynamic
> > > > enable/disable HDCP function.
> > > >
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 368 +++++++++++++++++++++-
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.h |  69 +++-
> > > >  2 files changed, 425 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > index 001fb39d9919..6d93026c2999 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > @@ -26,6 +26,7 @@
> > > >  #include <drm/drm_crtc_helper.h>
> > > >  #include <drm/drm_dp_helper.h>
> > > >  #include <drm/drm_edid.h>
> > > > +#include <drm/drm_hdcp.h>
> > > >  #include <drm/drm_mipi_dsi.h>
> > > >  #include <drm/drm_of.h>
> > > >  #include <drm/drm_panel.h>
> > > > @@ -213,6 +214,60 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
> > > >         return 0;
> > > >  }
> > > >
> > > > +static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
> > > > +                                u8 addrh, u8 addrm, u8 addrl,
> > > > +                                u8 len, u8 *buf)
> > > > +{
> > > > +       struct device *dev = &ctx->client->dev;
> > > > +       int ret;
> > > > +       u8 cmd;
> > > > +
> > > > +       if (len > MAX_DPCD_BUFFER_SIZE) {
> > > > +               DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       cmd = ((len - 1) << 4) | 0x09;
> > > > +
> > > > +       /* Set command and length */
> > > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                               AP_AUX_COMMAND, cmd);
> > > > +
> > > > +       /* Set aux access address */
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                AP_AUX_ADDR_7_0, addrl);
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                AP_AUX_ADDR_15_8, addrm);
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                AP_AUX_ADDR_19_16, addrh);
> > > > +
> > > > +       /* Enable aux access */
> > > > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > > +                               AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> > > > +
> > > > +       if (ret < 0) {
> > > > +               DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
> > > > +               return -EIO;
> > > > +       }
> > > > +
> > > > +       usleep_range(2000, 2100);
> > > > +
> > > > +       ret = wait_aux_op_finish(ctx);
> > > > +       if (ret) {
> > > > +               DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > > > +                                    AP_AUX_BUFF_START, len, buf);
> > > > +       if (ret < 0) {
> > > > +               DRM_DEV_ERROR(dev, "read dpcd register failed\n");
> > > > +               return -EIO;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  static int anx7625_video_mute_control(struct anx7625_data *ctx,
> > > >                                       u8 status)
> > > >  {
> > > > @@ -669,6 +724,160 @@ static int anx7625_dpi_config(struct anx7625_data *ctx)
> > > >         return ret;
> > > >  }
> > > >
> > > > +static int anx7625_read_flash_status(struct anx7625_data *ctx)
> > > > +{
> > > > +       return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, R_RAM_CTRL);
> > > > +}
> > > > +
> > > > +static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
> > > > +{
> > > > +       int ret, val;
> > > > +       struct device *dev = &ctx->client->dev;
> > > > +       u8 ident[32];
> > >
> > > Could this hardcoded array length be replaced with FLASH_BUF_LEN?
> > >
> > > > +
> > > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                               FLASH_ADDR_HIGH, 0x91);
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                FLASH_ADDR_LOW, 0xA0);
> > > > +       if (ret < 0) {
> > > > +               DRM_DEV_ERROR(dev, "IO error : set key flash address.\n");
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                               FLASH_LEN_HIGH, (FLASH_BUF_LEN - 1) >> 8);
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                FLASH_LEN_LOW, (FLASH_BUF_LEN - 1) & 0xFF);
> > > > +       if (ret < 0) {
> > > > +               DRM_DEV_ERROR(dev, "IO error : set key flash len.\n");
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                               R_FLASH_RW_CTRL, FLASH_READ);
> > > > +       ret |= readx_poll_timeout(anx7625_read_flash_status,
> > > > +                                 ctx, val,
> > > > +                                 ((val & FLASH_DONE) || (val < 0)),
> > > > +                                 2000,
> > > > +                                 2000 * 150);
> > > > +       if (ret) {
> > > > +               DRM_DEV_ERROR(dev, "flash read access fail!\n");
> > > > +               return -EIO;
> > > > +       }
> > > > +
> > > > +       ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > > > +                                    FLASH_BUF_BASE_ADDR,
> > > > +                                    FLASH_BUF_LEN, ident);
> > > > +       if (ret < 0) {
> > > > +               DRM_DEV_ERROR(dev, "read flash data fail!\n");
> > > > +               return -EIO;
> > > > +       }
> > > > +
> > > > +       if (ident[29] == 0xFF && ident[30] == 0xFF && ident[31] == 0xFF)
> > > > +               return -EINVAL;
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int anx7625_hdcp_key_load(struct anx7625_data *ctx)
> > > > +{
> > > > +       int ret;
> > > > +       struct device *dev = &ctx->client->dev;
> > > > +
> > > > +       /* Select HDCP 1.4 KEY */
> > > > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                               R_BOOT_RETRY, 0x12);
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                FLASH_ADDR_HIGH, HDCP14KEY_START_ADDR >> 8);
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                FLASH_ADDR_LOW, HDCP14KEY_START_ADDR & 0xFF);
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                R_RAM_LEN_H, HDCP14KEY_SIZE >> 12);
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                R_RAM_LEN_L, HDCP14KEY_SIZE >> 4);
> > > > +
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                R_RAM_ADDR_H, 0);
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                R_RAM_ADDR_L, 0);
> > > > +       /* Enable HDCP 1.4 KEY load */
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                                R_RAM_CTRL, DECRYPT_EN | LOAD_START);
> > > > +       DRM_DEV_DEBUG_DRIVER(dev, "load HDCP 1.4 key done\n");
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static int anx7625_hdcp_config(struct anx7625_data *ctx, bool on)
> > > > +{
> > > > +       u8 bcap;
> > > > +       int ret;
> > > > +       struct device *dev = &ctx->client->dev;
> > > > +
> > > > +       if (!on) {
> > > > +               DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP 1.4\n");
> > > > +
> > > > +               /* Disable HDCP */
> > > > +               ret = anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> > > > +               /* Try auth flag */
> > > > +               ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> > > > +               /* Interrupt for DRM */
> > > > +               ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > > > +               if (ret < 0)
> > > > +                       DRM_DEV_ERROR(dev, "fail to disable HDCP\n");
> > > > +
> > > > +               return anx7625_write_and(ctx, ctx->i2c.tx_p0_client,
> > > > +                                        TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
> > > > +       }
> > > > +
> > > > +       ret = anx7625_hdcp_key_probe(ctx);
> > > > +       if (ret) {
> > > > +               DRM_DEV_DEBUG_DRIVER(dev, "no key found, not to do hdcp\n");
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
> > > > +       if (!(bcap & 0x01)) {
> > > > +               DRM_WARN("downstream not support HDCP 1.4, cap(%x).\n", bcap);
> > > > +               return 0;
> > > > +       }
> > > > +
> > > > +       DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
> > > > +
> > > > +       /* First clear HDCP state */
> > > > +       ret = anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> > > > +                               TX_HDCP_CTRL0,
> > > > +                               KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
> > > > +       usleep_range(1000, 1100);
> > > > +       /* Second clear HDCP state */
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> > > > +                                TX_HDCP_CTRL0,
> > > > +                                KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
> > > > +
> > > > +       /* Set time for waiting KSVR */
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> > > > +                                SP_TX_WAIT_KSVR_TIME, 0xc8);
> > > > +       /* Set time for waiting R0 */
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> > > > +                                SP_TX_WAIT_R0_TIME, 0xb0);
> > > > +       ret |= anx7625_hdcp_key_load(ctx);
> > > > +       if (ret) {
> > > > +               DRM_WARN("prepare HDCP key failed.\n");
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       ret = anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
> > > > +
> > > > +       /* Try auth flag */
> > > > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> > > > +       /* Interrupt for DRM */
> > > > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > > > +       if (ret < 0)
> > > > +               DRM_DEV_ERROR(dev, "fail to enable HDCP\n");
> > > > +
> > > > +       return anx7625_write_or(ctx, ctx->i2c.tx_p0_client,
> > > > +                               TX_HDCP_CTRL0, HARD_AUTH_EN);
> > > > +}
> > > > +
> > > >  static void anx7625_dp_start(struct anx7625_data *ctx)
> > > >  {
> > > >         int ret;
> > > > @@ -679,6 +888,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > > >                 return;
> > > >         }
> > > >
> > > > +       /* Disable HDCP */
> > > > +       anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> > > > +
> > > >         if (ctx->pdata.is_dpi)
> > > >                 ret = anx7625_dpi_config(ctx);
> > > >         else
> > > > @@ -686,6 +898,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > > >
> > > >         if (ret < 0)
> > > >                 DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> > > > +
> > > > +       ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > > +
> > > > +       ctx->dp_en = 1;
> > > >  }
> > > >
> > > >  static void anx7625_dp_stop(struct anx7625_data *ctx)
> > > > @@ -705,6 +921,10 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
> > > >         ret |= anx7625_video_mute_control(ctx, 1);
> > > >         if (ret < 0)
> > > >                 DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
> > > > +
> > > > +       ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > > +
> > > > +       ctx->dp_en = 0;
> > > >  }
> > > >
> > > >  static int sp_tx_rst_aux(struct anx7625_data *ctx)
> > > > @@ -859,7 +1079,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
> > > >                                 AP_AUX_ADDR_7_0, 0x50);
> > > >         ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > >                                  AP_AUX_ADDR_15_8, 0);
> > > > -       ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > >                                  AP_AUX_ADDR_19_16, 0xf0);
> > > >         if (ret < 0) {
> > > >                 DRM_DEV_ERROR(dev, "access aux channel IO error.\n");
> > > > @@ -1688,6 +1908,83 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > > >         return 0;
> > > >  }
> > > >
> > > > +void hdcp_check_work_func(struct work_struct *work)
> > > > +{
> > > > +       u8 status;
> > > > +       struct delayed_work *dwork;
> > > > +       struct anx7625_data *ctx;
> > > > +       struct device *dev;
> > > > +       struct drm_device *drm_dev;
> > > > +
> > > > +       dwork = to_delayed_work(work);
> > > > +       ctx = container_of(dwork, struct anx7625_data, hdcp_work);
> > > > +       dev = &ctx->client->dev;
> > > > +
> > > > +       if (!ctx->connector) {
> > > > +               DRM_ERROR("HDCP connector is null!");
> > > > +               return;
> > > > +       }
> > > > +
> > > > +       drm_dev = ctx->connector->dev;
> > > > +       drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
> > > > +       mutex_lock(&ctx->hdcp_wq_lock);
> > > > +
> > > > +       status = anx7625_reg_read(ctx, ctx->i2c.tx_p0_client, 0);
> > > > +       DRM_DEV_DEBUG_DRIVER(dev, "sink HDCP status check: %.02x\n", status);
> > > > +       if (status & BIT(1)) {
> > > > +               ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_ENABLED;
> > > > +               drm_hdcp_update_content_protection(ctx->connector,
> > > > +                                                  ctx->hdcp_cp);
> > > > +               DRM_DEV_DEBUG_DRIVER(dev, "update CP to ENABLE\n");
> > > > +       }
> > > > +
> > > > +       mutex_unlock(&ctx->hdcp_wq_lock);
> > > > +       drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
> > > > +}
> > > > +
> > > > +static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
> > > > +                                         struct drm_connector_state *state)
> > > > +{
> > > > +       struct device *dev = &ctx->client->dev;
> > > > +       int cp;
> > > > +
> > > > +       DRM_DEV_DEBUG_DRIVER(dev, "hdcp state check\n");
> > > > +       cp = state->content_protection;
> > > > +
> > > > +       if (cp == ctx->hdcp_cp)
> > > > +               return 0;
> > > > +
> > > > +       if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > > > +               if (ctx->dp_en) {
> > > > +                       DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP\n");
> > > > +                       anx7625_hdcp_config(ctx, true);
> > > > +
> > > > +                       queue_delayed_work(ctx->hdcp_workqueue,
> > > > +                                          &ctx->hdcp_work,
> > > > +                                          msecs_to_jiffies(2000));
> > > > +               }
> > > > +       }
> > > > +
> > > > +       if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> > > > +               if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > > +                       DRM_ERROR("current CP is not ENABLED\n");
> > > > +                       return -EINVAL;
> > > > +               }
> > > > +               anx7625_hdcp_config(ctx, false);
> > > > +               ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > > +               drm_hdcp_update_content_protection(ctx->connector,
> > > > +                                                  ctx->hdcp_cp);
> > > > +               DRM_DEV_DEBUG_DRIVER(dev, "update CP to UNDESIRE\n");
> > > > +       }
> > > > +
> > > > +       if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > > +               DRM_ERROR("Userspace illegal set to PROTECTION ENABLE\n");
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  static int anx7625_bridge_attach(struct drm_bridge *bridge,
> > > >                                  enum drm_bridge_attach_flags flags)
> > > >  {
> > > > @@ -1902,25 +2199,58 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> > > >         return true;
> > > >  }
> > > >
> > > > -static void anx7625_bridge_enable(struct drm_bridge *bridge)
> > > > +static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
> > > > +                                      struct drm_bridge_state *bridge_state,
> > > > +                                      struct drm_crtc_state *crtc_state,
> > > > +                                      struct drm_connector_state *conn_state)
> > > >  {
> > > >         struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > > >         struct device *dev = &ctx->client->dev;
> > > >
> > > > -       DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
> > > > +       DRM_DEV_DEBUG_DRIVER(dev, "drm bridge atomic check\n");
> > > > +       anx7625_bridge_mode_fixup(bridge, &crtc_state->mode,
> > > > +                                 &crtc_state->adjusted_mode);
> > > > +
> > > > +       return anx7625_connector_atomic_check(ctx, conn_state);
> 
> If doing an atomic only conversion patch, the above function call
> could simply be removed.
> 
> > > > +}
> > > > +
> > > > +static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
> > > > +                                        struct drm_bridge_state *state)
> > > > +{
> > > > +       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > > > +       struct device *dev = &ctx->client->dev;
> > > > +       struct drm_connector *connector;
> > > > +
> > > > +       DRM_DEV_DEBUG_DRIVER(dev, "drm atomic enable\n");
> > > > +
> > > > +       if (!bridge->encoder) {
> > > > +               DRM_DEV_ERROR(dev, "Parent encoder object not found");
> > > > +               return;
> > > > +       }
> > > > +
> > > > +       connector = drm_atomic_get_new_connector_for_encoder(state->base.state,
> > > > +                                                            bridge->encoder);
> > > > +       if (!connector)
> > > > +               return;
> > > > +
> > > > +       ctx->connector = connector;
> > > > +
> > > > +       DRM_DEV_DEBUG_DRIVER(dev, "attached content protection.\n");
> > > >
> > > >         pm_runtime_get_sync(dev);
> > > >
> > > >         anx7625_dp_start(ctx);
> > > >  }
> > > >
> > > > -static void anx7625_bridge_disable(struct drm_bridge *bridge)
> > > > +static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
> > > > +                                         struct drm_bridge_state *old)
> > > >  {
> > > >         struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > > >         struct device *dev = &ctx->client->dev;
> > > >
> > > >         DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
> > > >
> > > > +       ctx->connector = NULL;
> > > >         anx7625_dp_stop(ctx);
> > > >
> > > >         pm_runtime_put_sync(dev);
> > > > @@ -1950,11 +2280,14 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
> > > >
> > > >  static const struct drm_bridge_funcs anx7625_bridge_funcs = {
> > > >         .attach = anx7625_bridge_attach,
> > > > -       .disable = anx7625_bridge_disable,
> > > >         .mode_valid = anx7625_bridge_mode_valid,
> > > >         .mode_set = anx7625_bridge_mode_set,
> > > > -       .mode_fixup = anx7625_bridge_mode_fixup,
> > > > -       .enable = anx7625_bridge_enable,
> > > > +       .atomic_check = anx7625_bridge_atomic_check,
> > > > +       .atomic_enable = anx7625_bridge_atomic_enable,
> > > > +       .atomic_disable = anx7625_bridge_atomic_disable,
> > > > +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > > > +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > > > +       .atomic_reset = drm_atomic_helper_bridge_reset,
> > >
> > > Could this atomic conversion be split out into its own logical patch?
> > >
> > > >         .detect = anx7625_bridge_detect,
> > > >         .get_edid = anx7625_bridge_get_edid,
> > > >  };
> > > > @@ -2134,6 +2467,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > > >         anx7625_init_gpio(platform);
> > > >
> > > >         mutex_init(&platform->lock);
> > > > +       mutex_init(&platform->hdcp_wq_lock);
> > > > +
> > > > +       INIT_DELAYED_WORK(&platform->hdcp_work, hdcp_check_work_func);
> > > > +       platform->hdcp_workqueue = create_workqueue("hdcp workqueue");
> > > > +       if (!platform->hdcp_workqueue) {
> > > > +               DRM_DEV_ERROR(dev, "fail to create work queue\n");
> > > > +               ret = -ENOMEM;
> > > > +               goto free_platform;
> > > > +       }
> > > >
> > > >         platform->pdata.intp_irq = client->irq;
> > > >         if (platform->pdata.intp_irq) {
> > > > @@ -2143,7 +2485,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > > >                 if (!platform->workqueue) {
> > > >                         DRM_DEV_ERROR(dev, "fail to create work queue\n");
> > > >                         ret = -ENOMEM;
> > > > -                       goto free_platform;
> > > > +                       goto free_hdcp_wq;
> > > >                 }
> > > >
> > > >                 ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
> > > > @@ -2213,6 +2555,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > > >         if (platform->workqueue)
> > > >                 destroy_workqueue(platform->workqueue);
> > > >
> > > > +free_hdcp_wq:
> > > > +       if (platform->hdcp_workqueue)
> > > > +               destroy_workqueue(platform->hdcp_workqueue);
> > > > +
> > > >  free_platform:
> > > >         kfree(platform);
> > > >
> > > > @@ -2228,6 +2574,12 @@ static int anx7625_i2c_remove(struct i2c_client *client)
> > > >         if (platform->pdata.intp_irq)
> > > >                 destroy_workqueue(platform->workqueue);
> > > >
> > > > +       if (platform->hdcp_workqueue) {
> > > > +               cancel_delayed_work(&platform->hdcp_work);
> > > > +               flush_workqueue(platform->workqueue);
> > > > +               destroy_workqueue(platform->workqueue);
> > > > +       }
> > > > +
> > > >         if (!platform->pdata.low_power_mode)
> > > >                 pm_runtime_put_sync_suspend(&client->dev);
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > index 3d79b6fb13c8..89b1b347a463 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > @@ -59,10 +59,23 @@
> > > >
> > > >  /***************************************************************/
> > > >  /* Register definition of device address 0x70 */
> > > > -#define  I2C_ADDR_70_DPTX              0x70
> > > > -
> > > > -#define SP_TX_LINK_BW_SET_REG 0xA0
> > > > -#define SP_TX_LANE_COUNT_SET_REG 0xA1
> > > > +#define TX_HDCP_CTRL0                  0x01
> > > > +#define STORE_AN                       BIT(7)
> > > > +#define RX_REPEATER                    BIT(6)
> > > > +#define RE_AUTHEN                      BIT(5)
> > > > +#define SW_AUTH_OK                     BIT(4)
> > > > +#define HARD_AUTH_EN                   BIT(3)
> > > > +#define ENC_EN                         BIT(2)
> > > > +#define BKSV_SRM_PASS                  BIT(1)
> > > > +#define KSVLIST_VLD                    BIT(0)
> > > > +
> > > > +#define SP_TX_WAIT_R0_TIME             0x40
> > > > +#define SP_TX_WAIT_KSVR_TIME           0x42
> > > > +#define SP_TX_SYS_CTRL1_REG            0x80
> > > > +#define HDCP2TX_FW_EN                  BIT(4)
> > > > +
> > > > +#define SP_TX_LINK_BW_SET_REG          0xA0
> > > > +#define SP_TX_LANE_COUNT_SET_REG       0xA1
> > > >
> > > >  #define M_VID_0 0xC0
> > > >  #define M_VID_1 0xC1
> > > > @@ -71,6 +84,12 @@
> > > >  #define N_VID_1 0xC4
> > > >  #define N_VID_2 0xC5
> > > >
> > > > +#define KEY_START_ADDR                 0x9000
> > > > +#define KEY_RESERVED                   416
> > > > +
> > > > +#define HDCP14KEY_START_ADDR           (KEY_START_ADDR + KEY_RESERVED)
> > > > +#define HDCP14KEY_SIZE                 624
> > > > +
> > > >  /***************************************************************/
> > > >  /* Register definition of device address 0x72 */
> > > >  #define AUX_RST        0x04
> > > > @@ -155,9 +174,43 @@
> > > >
> > > >  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
> > > >
> > > > +#define R_BOOT_RETRY           0x00
> > > > +#define R_RAM_ADDR_H           0x01
> > > > +#define R_RAM_ADDR_L           0x02
> > > > +#define R_RAM_LEN_H            0x03
> > > > +#define R_RAM_LEN_L            0x04
> > > >  #define FLASH_LOAD_STA          0x05
> > > >  #define FLASH_LOAD_STA_CHK     BIT(7)
> > > >
> > > > +#define R_RAM_CTRL              0x05
> > > > +/* bit positions */
> > > > +#define FLASH_DONE              BIT(7)
> > > > +#define BOOT_LOAD_DONE          BIT(6)
> > > > +#define CRC_OK                  BIT(5)
> > > > +#define LOAD_DONE               BIT(4)
> > > > +#define O_RW_DONE               BIT(3)
> > > > +#define FUSE_BUSY               BIT(2)
> > > > +#define DECRYPT_EN              BIT(1)
> > > > +#define LOAD_START              BIT(0)
> > > > +
> > > > +#define FLASH_ADDR_HIGH         0x0F
> > > > +#define FLASH_ADDR_LOW          0x10
> > > > +#define FLASH_LEN_HIGH          0x31
> > > > +#define FLASH_LEN_LOW           0x32
> > > > +#define R_FLASH_RW_CTRL         0x33
> > > > +/* bit positions */
> > > > +#define READ_DELAY_SELECT       BIT(7)
> > > > +#define GENERAL_INSTRUCTION_EN  BIT(6)
> > > > +#define FLASH_ERASE_EN          BIT(5)
> > > > +#define RDID_READ_EN            BIT(4)
> > > > +#define REMS_READ_EN            BIT(3)
> > > > +#define WRITE_STATUS_EN         BIT(2)
> > > > +#define FLASH_READ              BIT(1)
> > > > +#define FLASH_WRITE             BIT(0)
> > > > +
> > > > +#define FLASH_BUF_BASE_ADDR     0x60
> > > > +#define FLASH_BUF_LEN           0x20
> > > > +
> > > >  #define  XTAL_FRQ_SEL    0x3F
> > > >  /* bit field positions */
> > > >  #define  XTAL_FRQ_SEL_POS    5
> > > > @@ -392,21 +445,29 @@ struct anx7625_data {
> > > >         struct platform_device *audio_pdev;
> > > >         int hpd_status;
> > > >         int hpd_high_cnt;
> > > > +       int dp_en;
> > > > +       int hdcp_cp;
> > > >         /* Lock for work queue */
> > > >         struct mutex lock;
> > > >         struct i2c_client *client;
> > > >         struct anx7625_i2c_client i2c;
> > > >         struct i2c_client *last_client;
> > > > +       struct timer_list hdcp_timer;
> > > >         struct s_edid_data slimport_edid_p;
> > > >         struct device *codec_dev;
> > > >         hdmi_codec_plugged_cb plugged_cb;
> > > >         struct work_struct work;
> > > >         struct workqueue_struct *workqueue;
> > > > +       struct delayed_work hdcp_work;
> > > > +       struct workqueue_struct *hdcp_workqueue;
> > > > +       /* Lock for hdcp work queue */
> > > > +       struct mutex hdcp_wq_lock;
> > > >         char edid_block;
> > > >         struct display_timing dt;
> > > >         u8 display_timing_valid;
> > > >         struct drm_bridge bridge;
> > > >         u8 bridge_attached;
> > > > +       struct drm_connector *connector;
> > > >         struct mipi_dsi_device *dsi;
> > > >  };
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > With the above issues fixed, feel free to add my R-b to this patch and
> > > the split out atomic conversion patch.
> > >
> > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
