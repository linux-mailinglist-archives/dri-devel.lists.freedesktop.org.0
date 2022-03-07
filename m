Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B24CF136
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 06:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B007710F03C;
	Mon,  7 Mar 2022 05:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2127.outbound.protection.outlook.com [40.107.237.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC4910F037
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 05:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G12sNS9SLWoEU9iZQxSBaRpGKgwt5oJfRFaa9YPU5f2gSsHNbx11EH9PitG9YG15Ht3D0zOCOx9hOI+hV18Z2fInkAFG+PlxjXBYGZuAMNFZJiG+dAB1d6jbYz9K6FsdNokVAhiz296nUp8va1rItCYxeOmJ25TugkmaakugzMCzMYpr1QiADLZxU9OY/l6IUmBnB5xH7qCEezgKxuMeYNi+F5+50vyrBiMkcu3jadDzBdc/jx8R5KtkipCDx74bq47bX+XQqJsnQgB8JIwo+our6wAaGkoctrjajU79zZ+QKpNEof5uu6Ujd/AxK/HRTkAElNn6W+0feUMXWNkdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ftFOwrkB44VhmwgOI8FJt9MU7xf5EGyXW2S7bdQHRw=;
 b=VwjWhvY1Sqi0O9J30do6PkrjUKa+TLzcsJWldBPmXx21pC/MARWkCb6dyptHTgkMWt/G0Fq5ZOAKZZNrdcooQ9iF0DDAnmxBTTbkzwLZmyaqXYeCpy30eaGXVss/5EkbCL4o68aHfyMpS108YxOFSEPMll1ckvT9dEisZcHMH26m4l07amTHnudo2niZ/91dtD7ZyvKXEhjJ3TDdZOl3wVQj4K66I/kyi215SWXXtYPaKQTKPjXuLhGEKNMWiIlAyxWutO9QxWTILXAC6AX4nNvuQ/XTYemgO1K2rJJq8HcTzh33/c6673puA5kUjPkbHqWbbh1efmcNwOxn4RCgLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ftFOwrkB44VhmwgOI8FJt9MU7xf5EGyXW2S7bdQHRw=;
 b=oXkfE9lrIadohPRgCxtpry1e6ncrRHtzTqrlVZHZa5tBnBoezb/Lfdhb2yq+q2PCHlc1S+IcDLGAu18+tQLtMxMefvO7LMcpRctAi2HUGDnxyonsw3JKA6BHK8D+brqHJ/DDxiZ3BRReCgesGvoHSa+eCoIQI1GmS55gofEyRTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CH2PR04MB6492.namprd04.prod.outlook.com (2603:10b6:610:6e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 05:35:58 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 05:35:58 +0000
Date: Mon, 7 Mar 2022 13:35:52 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Message-ID: <20220307053552.GA4174271@anxtwsw-Precision-3640-Tower>
References: <20211105031904.2641088-1-xji@analogixsemi.com>
 <20211105031904.2641088-3-xji@analogixsemi.com>
 <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
 <20220307032248.GA4173850@anxtwsw-Precision-3640-Tower>
 <YiV8QX+9jszI1uEO@pendragon.ideasonboard.com>
 <20220307043249.GA4174029@anxtwsw-Precision-3640-Tower>
 <YiWOcOGIUGO0OrlO@pendragon.ideasonboard.com>
 <20220307050945.GA4174176@anxtwsw-Precision-3640-Tower>
 <CAJMQK-j668zWM9S63GuDORuTbDz4Z1wDA6UONork3VAa=P5sFg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJMQK-j668zWM9S63GuDORuTbDz4Z1wDA6UONork3VAa=P5sFg@mail.gmail.com>
X-ClientProxiedBy: HK0PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:203:b0::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4643154-1e96-4c5b-9dc0-08d9fffc5b8c
X-MS-TrafficTypeDiagnostic: CH2PR04MB6492:EE_
X-Microsoft-Antispam-PRVS: <CH2PR04MB649202E2D83092C50E686C3AC7089@CH2PR04MB6492.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jm4ilzo9EQfKHoBDPABcMpHz3yhOAV71EiWacuSN1BJ1G58H26J7cvbzzLJo4kaSWi/l6FuvYXRnBLu6UEISDmZFYfbRBr91VhLlcXrRKIs5xH2aLu17bZGLxleNSigd1XzhuHqCwMiNQ4Iosx+4j4RUwnb8CURPzIDFaLE7Mi4Vzas7N0/k5n9b4mNbnZZhNBs/hnmxjvkL7HzT3UE+M2DzPUngVrChEtgH1x7NEtp/lScKqZeC4AgajYMfbEhxyfLBbADIoVfJsIgtqvcPuMWsl+BacX74KmMmtPV8Evj8pOxbJaO1C4V/riEyKHH8dbgMN28lv+IWnIRkzqyPoARgrcDXccwrBIraYuBc7/3diJgev3+6xFaJCkLcICVUjn3w3fVSf0JaTWQcXtNqqVTe2pphbAKoby7yfzM3iiqaAZd+TKFRrSqrB0Qv65M1yMUFp+VCTDM2yGh6CvO+jZtaOcynU6b9ETBplvwageFvlpgglPWM6iAOgcQfBUZgmPNXFvQOECvnzmtkr3JlPl+gaT/61WEcTlPi2TbmuJ1YPlU0GqDUkyqnj/+VcXZ23No8/yIv7r9gMW3ME0rIqeMkp8gAH1MhaAvghRFeE2uoDcfuhzwUDzqu0t74ddqDULe6e6j/A2fsi+1JvdtgvMfqWqjScPQcPnCrK1AKalcrnptsUce2TmXzigGkfzMjX9bIgFFahfuGZVHssntdJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(30864003)(186003)(6916009)(26005)(9686003)(6506007)(6512007)(55236004)(53546011)(66946007)(52116002)(38100700002)(8936002)(6486002)(33656002)(38350700002)(33716001)(6666004)(83380400001)(86362001)(1076003)(7416002)(498600001)(4326008)(8676002)(5660300002)(66556008)(2906002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zwd+bifPK+sl6tU9g10fG7ZSYfVcI4hGqV6AjSydnbjgsFot2aTntiKGUlBL?=
 =?us-ascii?Q?ZZ5jBrcQ2BjbQZRdobxJUEuucRBdVOvr9XxQrvu3gaBcP7zP36+Gs02Tu59z?=
 =?us-ascii?Q?l0R2Py9jwIK2qVG593nXIWXwuGbTbKEZ3xL5urZIhnNlnfxI2VOQ09KJWnYX?=
 =?us-ascii?Q?yXMTwEs7wZ+arUeyTjV1J6WPRcJcXdV2OqeEtdDlQ9JRCFpgITsY/mBPL25Y?=
 =?us-ascii?Q?095wmrEqCrD6y7NuQk0NhIT5nDjI/9j7WlDeuVVBERYjEoSxZSg4ffdOPH1r?=
 =?us-ascii?Q?X/1Y/CCem+uh44baK8/nOyC67TQUlNXjauc39u0BZvGoEZsNuHV22WuGC4eX?=
 =?us-ascii?Q?4FSO4egMhBlNjR/P8OtaSie/wr5i5IfCuVNMSTrTsD1MdUWqx2apQM0r+irC?=
 =?us-ascii?Q?uYZ+biNb3p4XIE4uJ4EMhCYJa0Wn/xZtJCXJtF3H/jKoP8Zy+cxIUGsVYapt?=
 =?us-ascii?Q?gm1AtNRsJLh5zYe+yxP6cchCcMRwcBaJ7bqjOig++NT1T9GwfdwyGdOLHe8M?=
 =?us-ascii?Q?7zKBKj7vTj+J0/7dvZAhCUgMc3YH5lDRnNGymf6brMsJE0r5jXQbsjGrIFQD?=
 =?us-ascii?Q?cd704oIqRA5ZNbVWh15onxu01xMLBbCSEj2qAHamVQQ0HjZX7nST2SBJkXuH?=
 =?us-ascii?Q?foBVjC+ev0ialE28bdJ+TKnhMkNfvdTpRKvd+yO73Syd7nWRpq/0kYr4/g8G?=
 =?us-ascii?Q?a55WtwYa6z9+rn66iZFh6KVt/BUWu3b/q9DqBKXaWKWZmYunBZ4yKZlt1j0I?=
 =?us-ascii?Q?ks/qEVcOfMGzeON+1cmaZLaDiR1c2eW6PeqfNwpHa3Qh7F22JsLCdcy5Kpyt?=
 =?us-ascii?Q?JHr6kfSgrPC0K0pIrz7sjwRsvGbBRsg6UhhRUz/LmJsKsE6slPaR7JDg+uPd?=
 =?us-ascii?Q?8cux60JtVAl7yFFdbd+oGSRWrqDWUzDkf1WctPgk/6ZhvV6Q4fVjRSwOMG2K?=
 =?us-ascii?Q?f0NcNP1sWdU2pC+ytQTrHhBeD9at4ebH6Ile40pLfFNzKHTRNJdu6kPCGeF7?=
 =?us-ascii?Q?x4FUtO2N9pe9Q1tzDmFtJrremqEAGxfRQ7AGe/dyY9cpBLF0l89H6lg5Shgr?=
 =?us-ascii?Q?/J/GGeUGAVK6aZbvbey+2t/oB+sfLnq9nx6C0UkpemQB54thClt035N46m33?=
 =?us-ascii?Q?VykvmGysp5I/034sFUQ5PUbtYW0Hd4P3qt+qn+lShwxT64cg2Xa0rsuTtx6d?=
 =?us-ascii?Q?m6V2rsJh39YVVLw7R7VRJf3y9P3/KBC9nAfDbsrlM5H73OoGSe+/QvWcdWWO?=
 =?us-ascii?Q?fpd1M8g8d94oaQDAw33H8YS4NX9cCOfwlGMzOxL6YHawWpnsNTxb1IacmKJi?=
 =?us-ascii?Q?GaedoMydVjU9PSiU46gigsbC4DALN0hvpmwzrOVLUCiW8/PmAUx76yWxYAo0?=
 =?us-ascii?Q?A75HLTswqKjc/Vt73PoIzW5SdPuIOCbQR7STRDKX0ODfQUUUl0+w9YbM2QFi?=
 =?us-ascii?Q?I2R8zNUHljNUNOf6gkA5gKP5dIrcl9J6FiuIdEqQd7ballJjUssYXfHXlv3i?=
 =?us-ascii?Q?wxeK7dZawDsj3sToUdrYVwTLswHi4sjx7JwKCoAoY3zALZMvWycjdktG3S9Y?=
 =?us-ascii?Q?pNIOuLb7Xnxf+htzrmvaCgToKsx3+t4cdrPQimi6VhZCRdMZdqx02FE8zKj5?=
 =?us-ascii?Q?ozPCrijia2AQbVdrLtJdbJw=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4643154-1e96-4c5b-9dc0-08d9fffc5b8c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 05:35:58.5387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXr9hCdH4EQ2cRQA/A4Edd1TKbOU9g0wUP3vi8eofuIwru2FMz4v9U49sD0sqBiTEjXLV6VOur2IFbvZfKIiBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6492
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
Cc: drinkcat@google.com, jernej.skrabec@gmail.com, pihsun@chromium.org,
 jonas@kwiboo.se, airlied@linux.ie, bliang@analogixsemi.com,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, a.hajda@samsung.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, tzungbi@google.com,
 sam@ravnborg.org, qwen@analogixsemi.com, dan.carpenter@oracle.com,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 01:17:44PM +0800, Hsin-Yi Wang wrote:
> On Mon, Mar 7, 2022 at 1:09 PM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > On Mon, Mar 07, 2022 at 06:47:44AM +0200, Laurent Pinchart wrote:
> > > Hello Xin,
> > >
> > > On Mon, Mar 07, 2022 at 12:32:49PM +0800, Xin Ji wrote:
> > > > On Mon, Mar 07, 2022 at 05:30:09AM +0200, Laurent Pinchart wrote:
> > > > > On Mon, Mar 07, 2022 at 11:22:48AM +0800, Xin Ji wrote:
> > > > > > On Sun, Mar 06, 2022 at 07:13:30PM +0200, Laurent Pinchart wrote:
> > > > > > > Hello Xin,
> > > > > > >
> > > > > > > (Question for Rob below, and I'm afraid this is urgent as we need to
> > > > > > > merge a fix in v5.17).
> > > > > > >
> > > > > > > On Fri, Nov 05, 2021 at 11:19:03AM +0800, Xin Ji wrote:
> > > > > > > > The basic anx7625 driver only support MIPI DSI rx signal input.
> > > > > > > > This patch add MIPI DPI rx input configuration support, after apply
> > > > > > > > this patch, the driver can support DSI rx or DPI rx by adding
> > > > > > > > 'bus-type' in DT.
> > > > > > > >
> > > > > > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 247 ++++++++++++++++------
> > > > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
> > > > > > > >  2 files changed, 205 insertions(+), 60 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > index f48e91134c20..f7c3386c8929 100644
> > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > @@ -32,6 +32,7 @@
> > > > > > > >  #include <drm/drm_print.h>
> > > > > > > >  #include <drm/drm_probe_helper.h>
> > > > > > > >
> > > > > > > > +#include <media/v4l2-fwnode.h>
> > > > > > > >  #include <video/display_timing.h>
> > > > > > > >
> > > > > > > >  #include "anx7625.h"
> > > > > > > > @@ -152,18 +153,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
> > > > > > > >     return anx7625_reg_write(ctx, client, offset, (val & (mask)));
> > > > > > > >  }
> > > > > > > >
> > > > > > > > -static int anx7625_write_and_or(struct anx7625_data *ctx,
> > > > > > > > -                           struct i2c_client *client,
> > > > > > > > -                           u8 offset, u8 and_mask, u8 or_mask)
> > > > > > > > +static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
> > > > > > > >  {
> > > > > > > > -   int val;
> > > > > > > > +   int i, ret;
> > > > > > > >
> > > > > > > > -   val = anx7625_reg_read(ctx, client, offset);
> > > > > > > > -   if (val < 0)
> > > > > > > > -           return val;
> > > > > > > > +   ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > > > > > > > +                          AUDIO_CONTROL_REGISTER, 0x80);
> > > > > > > > +   for (i = 0; i < 13; i++)
> > > > > > > > +           ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > > > > > > +                                    VIDEO_BIT_MATRIX_12 + i,
> > > > > > > > +                                    0x18 + i);
> > > > > > > >
> > > > > > > > -   return anx7625_reg_write(ctx, client,
> > > > > > > > -                            offset, (val & and_mask) | (or_mask));
> > > > > > > > +   return ret;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
> > > > > > > > @@ -221,38 +222,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
> > > > > > > >     return ret;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > -static int anx7625_config_audio_input(struct anx7625_data *ctx)
> > > > > > > > -{
> > > > > > > > -   struct device *dev = &ctx->client->dev;
> > > > > > > > -   int ret;
> > > > > > > > -
> > > > > > > > -   /* Channel num */
> > > > > > > > -   ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > > > > > > -                           AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
> > > > > > > > -
> > > > > > > > -   /* FS */
> > > > > > > > -   ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > > > > > > > -                               AUDIO_CHANNEL_STATUS_4,
> > > > > > > > -                               0xf0, AUDIO_FS_48K);
> > > > > > > > -   /* Word length */
> > > > > > > > -   ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > > > > > > > -                               AUDIO_CHANNEL_STATUS_5,
> > > > > > > > -                               0xf0, AUDIO_W_LEN_24_24MAX);
> > > > > > > > -   /* I2S */
> > > > > > > > -   ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > > > > > > > -                           AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
> > > > > > > > -   ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
> > > > > > > > -                            AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
> > > > > > > > -   /* Audio change flag */
> > > > > > > > -   ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > > > > > > -                           AP_AV_STATUS, AP_AUDIO_CHG);
> > > > > > > > -
> > > > > > > > -   if (ret < 0)
> > > > > > > > -           DRM_DEV_ERROR(dev, "fail to config audio.\n");
> > > > > > > > -
> > > > > > > > -   return ret;
> > > > > > > > -}
> > > > > > > > -
> > > > > > > >  /* Reduction of fraction a/b */
> > > > > > > >  static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
> > > > > > > >  {
> > > > > > > > @@ -431,7 +400,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> > > > > > > >     ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > > > > > > >                     MIPI_LANE_CTRL_0, 0xfc);
> > > > > > > >     ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > > > > > > > -                           MIPI_LANE_CTRL_0, 3);
> > > > > > > > +                           MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
> > > > > > > >
> > > > > > > >     /* Htotal */
> > > > > > > >     htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > > > > > > @@ -615,6 +584,76 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
> > > > > > > >     return ret;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static int anx7625_api_dpi_config(struct anx7625_data *ctx)
> > > > > > > > +{
> > > > > > > > +   struct device *dev = &ctx->client->dev;
> > > > > > > > +   u16 freq = ctx->dt.pixelclock.min / 1000;
> > > > > > > > +   int ret;
> > > > > > > > +
> > > > > > > > +   /* configure pixel clock */
> > > > > > > > +   ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > > > > +                           PIXEL_CLOCK_L, freq & 0xFF);
> > > > > > > > +   ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > > > > +                            PIXEL_CLOCK_H, (freq >> 8));
> > > > > > > > +
> > > > > > > > +   /* set DPI mode */
> > > > > > > > +   /* set to DPI PLL module sel */
> > > > > > > > +   ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > > > > > +                            MIPI_DIGITAL_PLL_9, 0x20);
> > > > > > > > +   /* power down MIPI */
> > > > > > > > +   ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > > > > > +                            MIPI_LANE_CTRL_10, 0x08);
> > > > > > > > +   /* enable DPI mode */
> > > > > > > > +   ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > > > > > +                            MIPI_DIGITAL_PLL_18, 0x1C);
> > > > > > > > +   /* set first edge */
> > > > > > > > +   ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > > > > > > > +                            VIDEO_CONTROL_0, 0x06);
> > > > > > > > +   if (ret < 0)
> > > > > > > > +           DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
> > > > > > > > +
> > > > > > > > +   return ret;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static int anx7625_dpi_config(struct anx7625_data *ctx)
> > > > > > > > +{
> > > > > > > > +   struct device *dev = &ctx->client->dev;
> > > > > > > > +   int ret;
> > > > > > > > +
> > > > > > > > +   DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
> > > > > > > > +
> > > > > > > > +   /* DSC disable */
> > > > > > > > +   ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > > > > > > +                           R_DSC_CTRL_0, ~DSC_EN);
> > > > > > > > +   if (ret < 0) {
> > > > > > > > +           DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
> > > > > > > > +           return ret;
> > > > > > > > +   }
> > > > > > > > +
> > > > > > > > +   ret = anx7625_config_bit_matrix(ctx);
> > > > > > > > +   if (ret < 0) {
> > > > > > > > +           DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
> > > > > > > > +           return ret;
> > > > > > > > +   }
> > > > > > > > +
> > > > > > > > +   ret = anx7625_api_dpi_config(ctx);
> > > > > > > > +   if (ret < 0) {
> > > > > > > > +           DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
> > > > > > > > +           return ret;
> > > > > > > > +   }
> > > > > > > > +
> > > > > > > > +   /* set MIPI RX EN */
> > > > > > > > +   ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > > > > > > +                          AP_AV_STATUS, AP_MIPI_RX_EN);
> > > > > > > > +   /* clear mute flag */
> > > > > > > > +   ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > > > > > > +                            AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> > > > > > > > +   if (ret < 0)
> > > > > > > > +           DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
> > > > > > > > +
> > > > > > > > +   return ret;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static void anx7625_dp_start(struct anx7625_data *ctx)
> > > > > > > >  {
> > > > > > > >     int ret;
> > > > > > > > @@ -625,9 +664,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > > > > > > >             return;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > -   anx7625_config_audio_input(ctx);
> > > > > > > > -
> > > > > > > > -   ret = anx7625_dsi_config(ctx);
> > > > > > > > +   if (ctx->pdata.is_dpi)
> > > > > > > > +           ret = anx7625_dpi_config(ctx);
> > > > > > > > +   else
> > > > > > > > +           ret = anx7625_dsi_config(ctx);
> > > > > > > >
> > > > > > > >     if (ret < 0)
> > > > > > > >             DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> > > > > > > > @@ -1075,6 +1115,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> > > > > > > >             return;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > +   ctx->hpd_status = 1;
> > > > > > > >     ctx->hpd_high_cnt++;
> > > > > > > >
> > > > > > > >     /* Not support HDCP */
> > > > > > > > @@ -1084,8 +1125,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> > > > > > > >     ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> > > > > > > >     /* Interrupt for DRM */
> > > > > > > >     ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > > > > > > > -   if (ret < 0)
> > > > > > > > +   if (ret < 0) {
> > > > > > > > +           DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
> > > > > > > >             return;
> > > > > > > > +   }
> > > > > > > >
> > > > > > > >     ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
> > > > > > > >     if (ret < 0)
> > > > > > > > @@ -1104,6 +1147,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
> > > > > > > >     int ret, val;
> > > > > > > >     struct device *dev = &ctx->client->dev;
> > > > > > > >
> > > > > > > > +   /* Interrupt mode, no need poll HPD status, just return */
> > > > > > > > +   if (ctx->pdata.intp_irq)
> > > > > > > > +           return;
> > > > > > > > +
> > > > > > > >     ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
> > > > > > > >                              ctx, val,
> > > > > > > >                              ((val & HPD_STATUS) || (val < 0)),
> > > > > > > > @@ -1131,6 +1178,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
> > > > > > > >     ctx->slimport_edid_p.edid_block_num = -1;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> > > > > > > > +{
> > > > > > > > +   int i;
> > > > > > > > +
> > > > > > > > +   for (i = 0; i < ctx->pdata.dp_lane0_swing_reg_cnt; i++)
> > > > > > > > +           anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > > > > > > > +                             DP_TX_LANE0_SWING_REG0 + i,
> > > > > > > > +                             ctx->pdata.lane0_reg_data[i] & 0xFF);
> > > > > > > > +
> > > > > > > > +   for (i = 0; i < ctx->pdata.dp_lane1_swing_reg_cnt; i++)
> > > > > > > > +           anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > > > > > > > +                             DP_TX_LANE1_SWING_REG0 + i,
> > > > > > > > +                             ctx->pdata.lane1_reg_data[i] & 0xFF);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> > > > > > > >  {
> > > > > > > >     struct device *dev = &ctx->client->dev;
> > > > > > > > @@ -1146,9 +1208,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> > > > > > > >     } else {
> > > > > > > >             DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
> > > > > > > >             anx7625_start_dp_work(ctx);
> > > > > > > > +           anx7625_dp_adjust_swing(ctx);
> > > > > > > >     }
> > > > > > > > -
> > > > > > > > -   ctx->hpd_status = 1;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> > > > > > > > @@ -1225,20 +1286,72 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
> > > > > > > >     return IRQ_HANDLED;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static int anx7625_get_swing_setting(struct device *dev,
> > > > > > > > +                                struct anx7625_platform_data *pdata)
> > > > > > > > +{
> > > > > > > > +   int num_regs;
> > > > > > > > +
> > > > > > > > +   if (of_get_property(dev->of_node,
> > > > > > > > +                       "analogix,lane0-swing", &num_regs)) {
> > > > > > > > +           if (num_regs > DP_TX_SWING_REG_CNT)
> > > > > > > > +                   num_regs = DP_TX_SWING_REG_CNT;
> > > > > > > > +
> > > > > > > > +           pdata->dp_lane0_swing_reg_cnt = num_regs;
> > > > > > > > +           of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
> > > > > > > > +                                      pdata->lane0_reg_data, num_regs);
> > > > > > > > +   }
> > > > > > > > +
> > > > > > > > +   if (of_get_property(dev->of_node,
> > > > > > > > +                       "analogix,lane1-swing", &num_regs)) {
> > > > > > > > +           if (num_regs > DP_TX_SWING_REG_CNT)
> > > > > > > > +                   num_regs = DP_TX_SWING_REG_CNT;
> > > > > > > > +
> > > > > > > > +           pdata->dp_lane1_swing_reg_cnt = num_regs;
> > > > > > > > +           of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
> > > > > > > > +                                      pdata->lane1_reg_data, num_regs);
> > > > > > > > +   }
> > > > > > > > +
> > > > > > > > +   return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static int anx7625_parse_dt(struct device *dev,
> > > > > > > >                         struct anx7625_platform_data *pdata)
> > > > > > > >  {
> > > > > > > > -   struct device_node *np = dev->of_node;
> > > > > > > > +   struct device_node *np = dev->of_node, *ep0;
> > > > > > > >     struct drm_panel *panel;
> > > > > > > >     int ret;
> > > > > > > > +   int bus_type, mipi_lanes;
> > > > > > > > +
> > > > > > > > +   anx7625_get_swing_setting(dev, pdata);
> > > > > > > >
> > > > > > > > +   pdata->is_dpi = 1; /* default dpi mode */
> > > > > > > >     pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > > > > > >     if (!pdata->mipi_host_node) {
> > > > > > > >             DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > > > > > >             return -ENODEV;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > -   DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > > > > > > > +   bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > > > > +   mipi_lanes = MAX_LANES_SUPPORT;
> > > > > > > > +   ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > > > > > +   if (ep0) {
> > > > > > > > +           if (of_property_read_u32(ep0, "bus-type", &bus_type))
> > > > > > > > +                   bus_type = 0;
> > > > > > > > +
> > > > > > > > +           mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > > > > > +   }
> > > > > > > > +
> > > > > > > > +   if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > > > >
> > > > > > > This is not correct *at all*. V4L2_FWNODE_BUS_TYPE_PARALLEL has nothing
> > > > > > > to do with DSI. DSI stands for Digital *Serial* Interface. If anything,
> > > > > > > the V4L2_FWNODE_BUS_TYPE_PARALLEL type would map better to DPI, even if
> > > > > > > it's not an exact match.
> > > > > > >
> > > > > > > This patch has landed in v5.17-rc1, along with the corresponding
> > > > > > > bindings. As DT bindings are an ABI, we should really fix this before
> > > > > > > v5.17 is released. There is no DSI bus types defined in DT, and adding
> > > > > > > one as a fix so late in the v5.17-rc cycle seems a bit of a stretch to
> > > > > > > me (unless Rob disagrees).
> > > > > > >
> > > > > > > It would seem best to revert this series and the corresponding bindings,
> > > > > > > and retry in v5.18.
> > > > > >
> > > > > > Hi, what about make a patch to change this line to:
> > > > > > if (bus_type != V4L2_FWNODE_BUS_TYPE_PARALLEL), and then change the DTS
> > > > > > file?
> > > > >
> > > > > We could possibly use V4L2_FWNODE_BUS_TYPE_PARALLEL (5) for MIPI DPI
> > > > > (although it's not a very accurate match, so a different type may be
> > > > > better, this should be discussed), but V4L2_FWNODE_BUS_TYPE_CCP2 (1) is
> > > > > definitely not appropriate for DSI. For that we need a new type, and I
> > > > > don't think it should be rushed in v5.17.
> > > >
> > > > Hi Laurent Pinchart, what should I do now? Do you mean upload a bug fix
> > > > patch after kernel defined a new type(DPI and DSI) in new kernel?
> > >
> > > I think fixing this properly requires defining at least a new bus type
> > > for DSI. As this can't be done in v5.17, the best option seems to revert
> > > this series now as a fix for v5?.17, and submit a new version for v5.18,
> > > with a patch to add a DSI bus type.
> > >
> > > Any opinion from Rob (Herring and Foss) ?
> > Hi all, the problem is Chromium OS product depends on this
> > patch and other patches(which is depends on this patch). It may have
> > some risk if redefine the 'bus-type' property for sold out Chromium PC.
> >
> hi Xin,
> 
> I think what Laurent meant was to revert the landed patch in v5.17
> only. The patch wasn't landed in prior kernel versions (before v5.16),
> so it won't break Chromium OS products. There are some patches in
> drm-misc depending on this patch though.
Hi Laurent Pinchart, Hsin-Yi, OK, thanks!
Xin
> 
> > Thanks,
> > Xin
> >
> > >
> > > > > > > > +           pdata->is_dpi = 0;
> > > > > > > > +
> > > > > > > > +   pdata->mipi_lanes = mipi_lanes;
> > > > > > > > +   if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > > > > > > > +           pdata->mipi_lanes = MAX_LANES_SUPPORT;
> > > > > > > > +
> > > > > > > > +   if (pdata->is_dpi)
> > > > > > > > +           DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
> > > > > > > > +   else
> > > > > > > > +           DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
> > > > > > > >
> > > > > > > >     ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
> > > > > > > >     if (ret < 0) {
> > > > > > > > @@ -1301,9 +1414,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> > > > > > > >  {
> > > > > > > >     struct device *dev = &ctx->client->dev;
> > > > > > > >
> > > > > > > > -   DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
> > > > > > > > +   DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> > > > > > > >
> > > > > > > > -   return connector_status_connected;
> > > > > > > > +   if (ctx->pdata.panel_bridge)
> > > > > > > > +           return connector_status_connected;
> > > > > > > > +
> > > > > > > > +   return ctx->hpd_status ? connector_status_connected :
> > > > > > > > +                                connector_status_disconnected;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > > > > > > > @@ -1332,7 +1449,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > > > > > > >             return -EINVAL;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > -   dsi->lanes = 4;
> > > > > > > > +   dsi->lanes = ctx->pdata.mipi_lanes;
> > > > > > > >     dsi->format = MIPI_DSI_FMT_RGB888;
> > > > > > > >     dsi->mode_flags = MIPI_DSI_MODE_VIDEO   |
> > > > > > > >             MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> > > > > > > > @@ -1460,6 +1577,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> > > > > > > >
> > > > > > > >     DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> > > > > > > >
> > > > > > > > +   /* No need fixup for external monitor */
> > > > > > > > +   if (!ctx->pdata.panel_bridge)
> > > > > > > > +           return true;
> > > > > > > > +
> > > > > > > >     hsync = mode->hsync_end - mode->hsync_start;
> > > > > > > >     hfp = mode->hsync_start - mode->hdisplay;
> > > > > > > >     hbp = mode->htotal - mode->hsync_end;
> > > > > > > > @@ -1835,14 +1956,22 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > > > > > > >
> > > > > > > >     platform->bridge.funcs = &anx7625_bridge_funcs;
> > > > > > > >     platform->bridge.of_node = client->dev.of_node;
> > > > > > > > -   platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> > > > > > > > -   platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > > > > > > > +   platform->bridge.ops = DRM_BRIDGE_OP_EDID;
> > > > > > > > +   if (!platform->pdata.panel_bridge)
> > > > > > > > +           platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> > > > > > > > +                                   DRM_BRIDGE_OP_DETECT;
> > > > > > > > +   platform->bridge.type = platform->pdata.panel_bridge ?
> > > > > > > > +                               DRM_MODE_CONNECTOR_eDP :
> > > > > > > > +                               DRM_MODE_CONNECTOR_DisplayPort;
> > > > > > > > +
> > > > > > > >     drm_bridge_add(&platform->bridge);
> > > > > > > >
> > > > > > > > -   ret = anx7625_attach_dsi(platform);
> > > > > > > > -   if (ret) {
> > > > > > > > -           DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
> > > > > > > > -           goto unregister_bridge;
> > > > > > > > +   if (!platform->pdata.is_dpi) {
> > > > > > > > +           ret = anx7625_attach_dsi(platform);
> > > > > > > > +           if (ret) {
> > > > > > > > +                   DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
> > > > > > > > +                   goto unregister_bridge;
> > > > > > > > +           }
> > > > > > > >     }
> > > > > > > >
> > > > > > > >     DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
> > > > > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > > > index 6dcf64c703f9..3ef1d8f4e575 100644
> > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > > > > > @@ -141,12 +141,20 @@
> > > > > > > >  #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
> > > > > > > >
> > > > > > > >  /******** END of I2C Address 0x72 *********/
> > > > > > > > +
> > > > > > > > +/***************************************************************/
> > > > > > > > +/* Register definition of device address 0x7a */
> > > > > > > > +#define DP_TX_SWING_REG_CNT                0x14
> > > > > > > > +#define DP_TX_LANE0_SWING_REG0             0x00
> > > > > > > > +#define DP_TX_LANE1_SWING_REG0             0x14
> > > > > > > > +/******** END of I2C Address 0x7a *********/
> > > > > > > > +
> > > > > > > >  /***************************************************************/
> > > > > > > >  /* Register definition of device address 0x7e */
> > > > > > > >
> > > > > > > >  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
> > > > > > > >
> > > > > > > > -#define FLASH_LOAD_STA 0x05
> > > > > > > > +#define FLASH_LOAD_STA          0x05
> > > > > > > >  #define FLASH_LOAD_STA_CHK BIT(7)
> > > > > > > >
> > > > > > > >  #define  XTAL_FRQ_SEL    0x3F
> > > > > > > > @@ -349,12 +357,20 @@ struct s_edid_data {
> > > > > > > >
> > > > > > > >  /***************** Display End *****************/
> > > > > > > >
> > > > > > > > +#define MAX_LANES_SUPPORT  4
> > > > > > > > +
> > > > > > > >  struct anx7625_platform_data {
> > > > > > > >     struct gpio_desc *gpio_p_on;
> > > > > > > >     struct gpio_desc *gpio_reset;
> > > > > > > >     struct regulator_bulk_data supplies[3];
> > > > > > > >     struct drm_bridge *panel_bridge;
> > > > > > > >     int intp_irq;
> > > > > > > > +   int is_dpi;
> > > > > > > > +   int mipi_lanes;
> > > > > > > > +   int dp_lane0_swing_reg_cnt;
> > > > > > > > +   int lane0_reg_data[DP_TX_SWING_REG_CNT];
> > > > > > > > +   int dp_lane1_swing_reg_cnt;
> > > > > > > > +   int lane1_reg_data[DP_TX_SWING_REG_CNT];
> > > > > > > >     u32 low_power_mode;
> > > > > > > >     struct device_node *mipi_host_node;
> > > > > > > >  };
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
