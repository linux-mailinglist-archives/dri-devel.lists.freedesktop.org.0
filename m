Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1D4E39EB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 08:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453F010E526;
	Tue, 22 Mar 2022 07:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2095.outbound.protection.outlook.com [40.107.220.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A0610E52C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 07:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGrYjO6xDV36WnpT5SsPeFkNkc6woe6CZLw/FtdQzukSizinhGdJA226gmqTDeBDNach2Ah7dpwb2QWQ23KMSCF80VnOC/3DAgcO7/gG5aN2fMNJTqvfqH75VydHm60SKKHYl3hFjhfxlNuiOOc/s/mOrEj9ag3UCgRYQITZ+eg+qX5grMAVtNsvCoO7WufXxZbTVPC8z+SGoQc1J7NFArOvCdENBPDg0/bHTIIIym7BjdiCoG7sNmaSf2Ph35v/ciVH5TSlTFddqG5o7BIAHvWvT3LtrG75ZmAybpfpafXu3lMQEE49BSY/f16/LUC+In8S2+9Ete/RXNBO8f6snA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2n9KOdCs7SoxObcPAuDb1ukujWuBGI32TNaJiWrQTA=;
 b=lUwFkOLF4VfiDniRD1yqnyTgN2nzME4TMBzadmQbUEkGO3HK4s/E3pgbFNjls5oIAvmJ4gzCVzXJJMYHqiyFjmW+HIYLXVSLQcGYOnjsgDzBJ224PJMFVYFxTnpMG3Jvq2bWdUpWV6lwegkOU+9KsnDh1eS5adFEMhe4oUz4A/hrzdBXvu8tHyMVoB6pjxki9Uj70/9BDpgjNsI8SqVe7/F/8nJxc1zgNmDFh8i8TT1DDo76MyYZcEbxMzF+ux8IxgwImSotrJs4xFHTQN0TGrZW10w+PW0OothwEKliyZPm2ghLMGopFEjCZVyU+7ILawXP5weW405H1bInyXLEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2n9KOdCs7SoxObcPAuDb1ukujWuBGI32TNaJiWrQTA=;
 b=Tgnepg3oq8PazrBCeMmD3uO6wiBXXzWUvasX4XDE4ejz3FkVowU+NXlYU23SgwabfNofnEIfm7E0b/v8osXrzJtMHmN+DPCjSJxWgWDCethFjP/8ZkKYsQOrWNwVuaWrbPU7G4Cwk7lagfNOH4XtYxIMpFRGa0PnVe/d8iid0n0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by MN2PR04MB6351.namprd04.prod.outlook.com (2603:10b6:208:1a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 07:53:59 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5102.016; Tue, 22 Mar 2022
 07:53:59 +0000
Date: Tue, 22 Mar 2022 15:53:47 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: drm/bridge: anx7625: Set downstream sink into normal status
Message-ID: <20220322075347.GA1486712@anxtwsw-Precision-3640-Tower>
References: <20220302120925.4153592-1-xji@analogixsemi.com>
 <CAEXTbpeUTdfA31gpiJAzvyCScjWLUqCxjpF6-YCFCe5JmiyDZw@mail.gmail.com>
 <CAEXTbpf2V9CD=rs_KkVkD58rhtbiicFNjdphbuS0PU_5P=x0ZA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEXTbpf2V9CD=rs_KkVkD58rhtbiicFNjdphbuS0PU_5P=x0ZA@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fa54995-f9f9-4455-7632-08da0bd91f61
X-MS-TrafficTypeDiagnostic: MN2PR04MB6351:EE_
X-Microsoft-Antispam-PRVS: <MN2PR04MB63512E71BB585465F69BB14CC7179@MN2PR04MB6351.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lm1ik11xHrfKC7Y72k4otnWwAG9rgYdkRu0qqHWOk68bK5C+tWF0/JwLuor3hg9M7HWIakNraEG7rrenl77kShDjoN9NbyLjFLrWvm1739Ib1YqkIQ2sje9NXh6ExtesITAQMV71an2ZoYZYj42gWHI/jsoz0Vcrzp47K5gVA2hOl9czRUkUBAwkCBeMnzPiEGGVHyeRcLNt1HTywcsuu7S172XSfXn4r+J1r+qxWVFywMFv4t040ZM0vioFBHcX/iD05i/sym/tT36zeKwYpMx2scmsEg1EUzrg4yKMetYCziFKA4OUYPOe2FOjEO+0tCfa3YgymH5giGGLOx88mKs7/KbKQz0cIwVEw4sVagdWBKCFelGwI3uSEi0YLq/8BCFpfdGv9n00wTSBFZZdJRR/5krJRV3vGxjHieuMZArZVtN13Qp8szGo2qySMUYsaB9LVE3Hz7Kt9eRdz/TmEnzpJJGVw5LgiYZDZBOLsbSUOd5ejkro7R2uASUgrRkbxNsHO5CaTL3ZKqrv0rRZJu1BKkEqHvEtAGNqBXr6N3DxIWkIub0dWkgLQh+KlObhtXv74wCrTFFJorrzHPjceqjnR/+/5ISoi6H1sJkDmCHi/JndXmIBkQ7bKyOXbr67O0iM8ktInAVo9A8vNy9RHZpSOzm771ZP2v2snUDxY+hZ9ZLITsdNbUWzRJB/dfbVaGK4o2LA6k91gKyeUuACPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(186003)(26005)(83380400001)(86362001)(33716001)(6506007)(66946007)(6666004)(54906003)(66476007)(316002)(6916009)(6486002)(38100700002)(5660300002)(38350700002)(7416002)(8936002)(4326008)(2906002)(8676002)(107886003)(6512007)(53546011)(55236004)(66556008)(9686003)(52116002)(1076003)(33656002)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nY1NqHnnWKowrguLRqG8qI+NoX85shkM3xjIwCD1Sx1dRJ1zwLnLBUpvAfeR?=
 =?us-ascii?Q?kU2ToarYP2eoAkW9E1oM+wY6D2ok0KDbTQ9367npllpy952DP0BmDmUwoEZO?=
 =?us-ascii?Q?ZmFTEs7A8n5eAAT+xiyBL6BPBw14zx/YaTgbWsdtLCQEvNa9bCAK1L8Izoy0?=
 =?us-ascii?Q?FYoRHT3G3BlvGA71aOWkDVpRJMAcguolC0YF8vKsb0+5aKJkXvRe137JTl2p?=
 =?us-ascii?Q?0/rj4se9pqXi3dHW9XtZSYa2msuySG1pK3wOT/64O2XZALvKcR/4zkPAYjIS?=
 =?us-ascii?Q?yyQjxgsAwREaNVqn6CB8s0YOZWEwdlJPZ4/5p89MuoUgK3C53NueAUC4lMKH?=
 =?us-ascii?Q?ttEq2nn2KYQrLCP5IFW3zDQXUIbl2az1pcjSeIPeFhTnkq6Sd8TzZFZlk6EZ?=
 =?us-ascii?Q?asWUTQfoh4b2SSBrPrMf8oRKhNpCjga21f+nThzfjoXKB3Pns2Ab2uhgnUBH?=
 =?us-ascii?Q?Z5FZVSRKv+ktsu3hTx8gSrO4j0llthLtHyL7VGg1PcJ9eV8vQypWjaj5HFjl?=
 =?us-ascii?Q?nKKleMA6yj3vYsU2uYD2cQvZRDvmjHoFZihcT20voUk1feCjAUB0ejTOUM3d?=
 =?us-ascii?Q?pQJ3lrDL8yINssFgCgZ6JVBYJNcK9om/AS2Gm2A94p60Mz6qW1Sffl8uEIde?=
 =?us-ascii?Q?rFXz/wUnZ8N7S013SZdysVvv0wrL61YIzCgKibjKL9TJ8vNFgQlqdd5ukq67?=
 =?us-ascii?Q?s07Sgl5mvc/qMgCy0gtrExLcsEfr2aSQAhZXaGcMQ+qlrlogbmK2+xtkl0+x?=
 =?us-ascii?Q?OiGs9Ng0eT18V25LMFBGHrPtwkGsxP2wsqDqQo7HFYmJ5Y0JEc8cBMtahPra?=
 =?us-ascii?Q?O+uYRmN2IQL/hPFLA9+Jga/noIBuc9d595hxaA1nPjCDxVA86rbqht+7TryA?=
 =?us-ascii?Q?owVCOwbhAUL0H5KOSvUeeUmj+2n2zt5MyqSb3TDYn61nG/w98XUbeZp2ojpx?=
 =?us-ascii?Q?znVAEF64WnqrFmG9yTGWTM+N9KIxG2R/20X08wYDz9jYbqjKrE1IOdT0m7UG?=
 =?us-ascii?Q?/bRIbsAvoEzjt59u7mBcTfajegAx1NKRB14d2aEfUIPBONLw70qxS493xC/k?=
 =?us-ascii?Q?8XzJUuWiodGz5BlOesH/OuwffBfWDsgeo4DnSztXsTlklsCRJXk1lP23fb1p?=
 =?us-ascii?Q?RoWpElFe350VAqdoj0NY7Zhk64Gn4sDjEr1G+NN3eu3qBNwjh2fzG1K88chc?=
 =?us-ascii?Q?mStR6ix6oDCaaX69spV+bt9Rym7CLGApjMJzvKzH7E3d4INCVLf1LCRF9Wbo?=
 =?us-ascii?Q?puGavPILFyyS1RbkfpH+1IM+T/poDJ8nXylZ4Cd+S05wXdyh1+x+MFAULRtH?=
 =?us-ascii?Q?xiy68fCV3gaZp4zP8rNJOnXcLRkzJJaxY/OiMPCfryt/scCenf0LECAUHsc3?=
 =?us-ascii?Q?WHrFNO4J6DtWyeEpR+P7c2nEa2EJ4donLQ6UyXYvmxXudQYm0R8RsJaV+Eov?=
 =?us-ascii?Q?OWySX/g+WMoUdgXYkFFE7YnsEiIvjo8j?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa54995-f9f9-4455-7632-08da0bd91f61
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 07:53:59.1135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ENv9ZH5YihjOJHPywWq43bbByWThLqGVcNwqrSg5AsdTdZjMMa2oLMgv4sIj2eYI3Ih+vvKeyUQc9rMUT7mPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6351
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
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 bliang@analogixsemi.com, treapking@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 03:33:17PM +0800, Pin-yen Lin wrote:
> Hi Xin,
> 
> Can we use dev_dbg instead of dev_info for the logging?
> 
> The log here is more like a debugging message, and using dev_dbg makes
> it consistent with anx7625_dp_stop.
> 
> Sorry for not catching this earlier.
> 
> Best regards,
> Pin-yen
Hi Pin-yen, OK, I'll change it in next version.
Thanks,
Xin
> 
> On Thu, Mar 3, 2022 at 3:52 PM Pin-yen Lin <treapking@chromium.org> wrote:
> >
> > Reviewed-by: Pin-Yen Lin <treapking@chromium.org>
> >
> >
> > On Wed, Mar 2, 2022 at 8:09 PM Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > As downstream sink was set into standby mode while bridge disabled,
> > > this patch used for setting downstream sink into normal status
> > > while enable bridge.
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 9aab879a8851..963eaf73ecab 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -919,12 +919,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > >  {
> > >         int ret;
> > >         struct device *dev = &ctx->client->dev;
> > > +       u8 data;
> > >
> > >         if (!ctx->display_timing_valid) {
> > >                 DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
> > >                 return;
> > >         }
> > >
> > > +       dev_info(dev, "set downstream sink into normal\n");
> > > +       /* Downstream sink enter into normal mode */
> > > +       data = 1;
> > > +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
> > > +       if (ret < 0)
> > > +               dev_err(dev, "IO error : set sink into normal mode fail\n");
> > > +
> > >         /* Disable HDCP */
> > >         anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> > >
