Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ECE310C05
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FE86F428;
	Fri,  5 Feb 2021 13:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2125.outbound.protection.outlook.com [40.107.243.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7E26E055
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 11:40:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1aE44Tl7knKV8t31D1vy8VIwQGLLtbu8SlASzKuSXhpL9sm3WQE2DIKe+MNJDmgRKpm1YgSg0ZaU3t8+S9mx66p8esuyULhWImG275tIXydX9ozAb6B9oA33GIGROGUpIN1DvhW3q2Oxf/SOxWSkVVl0UTa7yebfzWdCkUagqm8KO5Ji08513XfVeAN4dq+P7g0DHQ37ti3WZFM4rjYzqhPM60IVgMptkyObGHTsJs5Y9pZjqotsP43efOq8ACPvWnRGlYXtkqVYZFSYyna7EZWDoSqIfiilXhCe2snnA+FRhNJss26KeXEadGx+0inie0tSAC07GQRRUWc/J0aCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWtteU3sm8XOgVI+PxmO6tn20zmqgORGi8ey9s8IUSE=;
 b=mNd0HyEC3Yj6MlKIx0Rjqb8gYZEHeldNWLBrOe8Nfur/AkemJBx1SOz3+goB0I70cMRZyqncbZlS84leJD6Tl6tvZhzlYaQV7smOCm2xaSjWKg02/pFy2ZjdZzAlkUpctjggTgSACDQOodooyQoeMnG5Fpm5duCUMnBVCWXWJRfhPt1qeDAOrXbCUaxtFF7sC1SSJJzrXixTVphg153hg8SL/A7cmHmI6jlDd0vTq0UIa9178Bz4asS6kjvPiD4aCv+ZmAqxPX/NiSfyNexMEwTcL/oEzR5FEkp9ID56HVzRvJpOx8ZcxTWZIrPhOewTFGqqnl5KXJnMpKLGgl2VWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWtteU3sm8XOgVI+PxmO6tn20zmqgORGi8ey9s8IUSE=;
 b=va9hGZwEu6WlMi8CGcK+v/s2lb0EesFnergUhNQRFEC9a6mzE2kgfjjy8iuWQqBYGb+qgzt/OnzEArkofohbGyxK6mGZMoN7YZkM4kGWThQzZULxka+7bou4UiDqGpd5ADDRioc1pm9OWjoqTTLL9il/eCvze7nDwDw2GJyqqEs=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (10.186.134.72) by
 BYAPR04MB3927.namprd04.prod.outlook.com (52.135.217.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.14; Fri, 5 Feb 2021 11:40:45 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 11:40:45 +0000
Date: Fri, 5 Feb 2021 19:40:33 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v4 2/3] drm/bridge: anx7625: fix not correct return value
Message-ID: <20210205114033.GC18836@zhaomy-pc>
References: <cover.1611802321.git.xji@analogixsemi.com>
 <23b62a447364a9047f0b1b144557e8d95f6ad7f7.1611802321.git.xji@analogixsemi.com>
 <CAG3jFyuAixFQ0L_2zw_8Ze3cF11PFMm-sN6ZQR7=opEjWV1nNw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAG3jFyuAixFQ0L_2zw_8Ze3cF11PFMm-sN6ZQR7=opEjWV1nNw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0219.apcprd02.prod.outlook.com
 (2603:1096:201:20::31) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR02CA0219.apcprd02.prod.outlook.com (2603:1096:201:20::31) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 11:40:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d5ab96c-2731-46f6-7f70-08d8c9cadfed
X-MS-TrafficTypeDiagnostic: BYAPR04MB3927:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB39278E1213355DE0770E9912C7B29@BYAPR04MB3927.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HkZ2hhzgvicYOznIVfk1NYkvXVBViwsm1ekR1hh64dldEfe/uih2DNh0OspQgZgiEucT9smEsNdGW7Q86yM7wkZidr7PSnD7lzW7ep6xLgYy+uE9qyQn3SSLlsaZaV4RGIO4wXFnbKng/FO9zB0or6/A0/bAfMP3v3bShdggPIwnX34afOlqBsKmspiHCKBoL0yeHam/KHwet65VfHihK7MLGS19ObbvWRBqV+0qAnUlS7HdNf09r0OnaiHmh7H+2LZU16IaJ1KbNDq97JUfbg33UOZGYtxKpWQqzlNehGhcHSypruvmtwlyjE6vIWgS6Wqgu4Yst8Z9kEWYXQ+jBz9DuBI7bboSaUoCxPCJR8pOGpXci7mtdD/xS0VQB2wma+A9vGmAo5EY3iAtU7OzqeXvJQzAWcgWlf9Lrge7qB97MAgT9nonvuJaRVL/5wLXIBfI+Ji+yge0CMBmTiR4lTM+R4Wgor+yQsCL0nh+EW4SdCx4owFMYUnk947sePf8kQ7mf0s/pLBVuq1R8jcI/UvcIMI3uvYCzv4VNDBlATuQSC55WgLJ0H/on2+H+JGGXX1ZVa/sSEk8JVN0fTRO8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39840400004)(346002)(366004)(396003)(136003)(66476007)(52116002)(4326008)(6666004)(33656002)(54906003)(83380400001)(316002)(956004)(66556008)(186003)(66946007)(2906002)(5660300002)(26005)(9686003)(1076003)(8676002)(16526019)(33716001)(86362001)(478600001)(8936002)(6916009)(6496006)(7416002)(55016002)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VpnDkdHNL4mGhFJjQb4CNkyzO2IE/ZL1mqsJWjTPH87NocNwVJu/S+6CV9iQ?=
 =?us-ascii?Q?wgpBFqGdpjpqwihZ0HhgFxVxTXgiIzJdvBKnPwdOoTRv8JJttLLuup7LJjiB?=
 =?us-ascii?Q?HK/y5o4+31SS1lkLtfpZVMhLZyjg7WjYeKmNbT5Jdeqxr7r/dykLQwZzLGsI?=
 =?us-ascii?Q?vqnfU3fLUVpEglSsqCFja9/TxTUzo2KlydlAgzRVi991IrvRidgh/ViLxUPN?=
 =?us-ascii?Q?vu439x0Z6ru/ty4rQK69etjieGRp2ugkz3RXLmjfxsiykvDFqQM53x680B7R?=
 =?us-ascii?Q?cHPkZxGLgPvGpHD0lEun5FI+LTsKQ3rzcBAMgqQLhenzli6lmKsOqWdBth0/?=
 =?us-ascii?Q?TXAwUefxijndb6PzoENph4Ge8KdtNUP/JbZVsmrcbzhjgHJvSaOT5DosJqZ/?=
 =?us-ascii?Q?OopdHia8H9lavazXLwMWxGnlTz4Z+Fhs/ZnQA21gfEtxb9Yee/pxR1MrYnKr?=
 =?us-ascii?Q?CNxURc9xVcJPssq2+UHZ/Luj4rRlJgZbIMrDkazTk7oM+JVB4Jj+zpfbsF+U?=
 =?us-ascii?Q?SPbQOFcglYqPmryeM4WvMFQQMIYAjlZ3Zld70+6SFl1NhY2upkXm5yGCpFUV?=
 =?us-ascii?Q?gdNcg13tX5pQL6kPMk6TcMTeXg5GHDgzLqNvu42DqjcuHabgbfM9EouGqEQv?=
 =?us-ascii?Q?HPjqZwxPtT9Jvz7AALodMCUDLVOf5CryAKgX9yWk8Nsl6XJ5Yl/CNAGFzRwr?=
 =?us-ascii?Q?zfyiwUcM+h27zrvUx9uH9B3A/oYrUs885yUHg4981pLppNa6ZFbFHM6INfmA?=
 =?us-ascii?Q?ll4Q5zrvDMr9iqPny+ujPlXbecGsdaGb3HvyGQ6tR/DilaFAbCBqBWPEhCoK?=
 =?us-ascii?Q?0LHFsKIeH5YEVdHbmzMiVXASKPP6ZlCeKmszmDhmvNKxuvFdNEoFWsOymBLB?=
 =?us-ascii?Q?AXjK0/eOaOmXbHJUh99DeGiseW8FewHyMZ/JXzGamzpjAJaD9+7D4XejfYLa?=
 =?us-ascii?Q?O/ckTENi1+WXGoChQju/2J9vN+SyMqCboM2YmCqGTpICK2oiOQWtzQQL0wEg?=
 =?us-ascii?Q?UGhEhHDHc5Zt0Be24xOBoRZKxhzF+qx5oDUv4WJbAerlLasquKrA2zikdKpB?=
 =?us-ascii?Q?PZnFz/waSulKgLMaNGdcPHvFRTVhr7gBVzR13kX4pOZGpB6Mt5EsK7ajr63u?=
 =?us-ascii?Q?ORF+n91t9ocVX4gJe8DDFLZ2a/xJeDoV+sPG5W5shBqaUt5Kh7XzSkl2vsw2?=
 =?us-ascii?Q?CWhsiBMxJqSwuny5aED5oVX5XgxWzz/SJrrxssNASVFmedY15Ap2YAWMUWwN?=
 =?us-ascii?Q?Hi9tzxCd2+aeMyYMLRbmfpkhnVh0NsmksytgpeRLA96ZbXYgtNQNOF4VYL9b?=
 =?us-ascii?Q?fsAeProg1VK1jNgq8sjeusUx?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5ab96c-2731-46f6-7f70-08d8c9cadfed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:40:45.2874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TUiP025LTV9gp2LY7q+8tVEJMbzbuJnMXjGK76ciyMMNdEaoQOmgaoqlja3WBvRCMjMIFh6neM/ktv1CS6jHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3927
X-Mailman-Approved-At: Fri, 05 Feb 2021 13:42:56 +0000
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 01:28:30PM +0100, Robert Foss wrote:
> Hi Xin,
> 
> On Thu, 28 Jan 2021 at 04:12, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > At some time, the original code may return non zero value, force return 0
> > if operation finished
> 
> Missing "." at end of line.
Hi Rob, OK, thanks, I'll add it in the next series.
Thanks,
Xin
> 
> Other than that, this patch looks fine. Feel free to add my r-b.
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> 
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 65cc059..04536cc 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -189,10 +189,10 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
> >                                AP_AUX_CTRL_STATUS);
> >         if (val < 0 || (val & 0x0F)) {
> >                 DRM_DEV_ERROR(dev, "aux status %02x\n", val);
> > -               val = -EIO;
> > +               return -EIO;
> >         }
> >
> > -       return val;
> > +       return 0;
> >  }
> >
> >  static int anx7625_video_mute_control(struct anx7625_data *ctx,
> > --
> > 2.7.4
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
