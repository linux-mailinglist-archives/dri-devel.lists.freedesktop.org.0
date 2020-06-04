Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654761EF1E5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD97C6E85F;
	Fri,  5 Jun 2020 07:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2114.outbound.protection.outlook.com [40.107.236.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5806E29B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 07:51:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHjHpy6OAynVIlk4r0ci5Q+Do/R9TmtjAk5tg656tCNYw5pf7aT3KxowsPB3vOWzNtikFE6FBktZQgx+25+yjWwncgzzSZ3XUOvLgckAH5Fkdik3XKXutBK2YQT3MmB3SYrzcZSO4KSw60AuNhu6KnR9h2JfFYASflsJvgTUoXRnhSP5cWVfDvx/tSRhGw0O+BWYochYlYgFSYAS6vaOsoiGyps5QC/J+WPMIprg7Vumi7xNB832a5YaELe5CDLRT5IorSlMbirlTqUfRBAr21+hcivk4oKfpqWDIriNJ7X0vmRAUgqtq8qHZYVvKpioVjNzbqZrQMcP8fgKjWdq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3mVKoW7JkzpuVgFoR2zPA3o8TzAU16P0Y+IhmTyAYI=;
 b=cHfaKtLwAlVD4UcTDSvkip4zQxFStt8PLfJ/Ou0hnn8nx0oFB4xUcHUkHA/aSVacHeS9u8PqBquezbXkd7NWAk2zF2z1m5FLoAucy4F9aQun6nd54Xw6nkJ4CPJSB/DIhZXOqOlOHqJoW5Nej7yTkV3+DNymSxLj1gM7zxf8FU6h6NtY5/LPrWs2k9CeQXWL5SCP729Ezd9LhFKRAU9y+hLlRsIf9WUGmYxE3V8zAXD9/gioQXjGPcfGRwPrDT+KFrimeblO/UYIsHCBWcSx5Rj4jWw0CQ+OXzb5nqO20ePuJNnudA085gOsMbX0E0bru5mAc4I4jdoJySVpssZf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3mVKoW7JkzpuVgFoR2zPA3o8TzAU16P0Y+IhmTyAYI=;
 b=wHU4dNYL3PFDBeY9DX3HgQzdb2zTMvcXasu82Rq8jJEQJOKqEujEXgBC/7T8Hv3gjsHZw7suqzF0etkgIALDZUvyJ6XcdwDHsK27ac5ZGa5fQjCH91cRZCPQLZ4cB1qRdnGSM9S8d/wZvcoan7mH2IqC3Net5veHRwKBvT8h8ts=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6818.namprd04.prod.outlook.com (2603:10b6:a03:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 4 Jun
 2020 07:51:39 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b%7]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 07:51:38 +0000
Date: Thu, 4 Jun 2020 15:51:28 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v11 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20200604075128.GA2581@xin-VirtualBox>
References: <cover.1589511894.git.xji@analogixsemi.com>
 <3946984ac1024b53b72c2eb39ee41967a2bf9c3d.1589511894.git.xji@analogixsemi.com>
 <CAJMQK-hkrsgbvi91=uBhPfn0scwTSh3OJBGLcy9tC3GYiW1i9Q@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAJMQK-hkrsgbvi91=uBhPfn0scwTSh3OJBGLcy9tC3GYiW1i9Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK0PR01CA0055.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK0PR01CA0055.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::19) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3066.18 via Frontend
 Transport; Thu, 4 Jun 2020 07:51:38 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 269944bd-f3dc-4bf8-0a26-08d8085c1ccb
X-MS-TrafficTypeDiagnostic: BY5PR04MB6818:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB681874DBBC06AA6C83D9BDC8C7890@BY5PR04MB6818.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CKZXna2MjkOzc8n5Aw9zUSid2oOvTbN0AniWspBtlQ0o+2l0Sj8EJpnUalzCGtv91leco6Fjkln2YindeOgtyng5DXcTk9jchNoktBJxX8lem1dR2M+i979uQwh90RnLwPYiApgpOa1W5o4Qih6+OtrPbWc+DfK5iI2RpcKdWFsED94MfB1x+WR3eJGR9LCiLVcJGAJKiD61RjxKzhzcAytcj3QgxhNXWnc9Q2kyQsoyogDbJkXl8kN9/AAcT27rLe4sdqvfGotKU+75i60TW18p/nuiyY+BHGI3t6hYSo7ly5NSvbitS3zeAbqeH9TTZiR0OqdzMu3NIaB4EIKG7VaER3HyLPZRXD3T7d7NcJDpyM0HiWNmk6TCP7WwXAiVUABklS+OfNf/SYWZhwF1vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(136003)(39840400004)(376002)(346002)(186003)(16526019)(86362001)(8676002)(956004)(66476007)(8936002)(966005)(66946007)(6916009)(7416002)(6666004)(33716001)(316002)(6496006)(52116002)(66556008)(54906003)(478600001)(33656002)(26005)(9686003)(53546011)(107886003)(4326008)(4744005)(2906002)(55016002)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ZJPaVOMUxtE7pVMYNFmVe866UPB0dQ8Iaa2MCgb7+b44Uv9J4c6iATCfxUGtWiuLWm7k9KC7kebjXn5f85hyXacAcI6uEmLcncuFH6/Kfg8wfiW7mq+l4yXkvSGXl98qg49TpsgirHyAWMtWKimDOK3W+tkI0R0/whY43tehHhdDqMmI3KyW453IQBVEHajJq+SnNj35yI/3R1s8xUtLehTm023/YMOySjuivunYW4FrQEB60bdx0YaAzRNxJsoil76uFznP6raNAfCm4cchT0rRHrebkdITCKH8DofhjgmqbdyW8ohk9utpUHk3d0ORR1AWrrOcG1Xnj/PkejCX7mK5o3qjRfa+Cm6sq9LiuDBSLBR74XzFaGJfmrvV9oYQoCs7H4f/uif6XA7DRksOhq47SuSBhQu/cLiepjudATQjfyR5hVLntxqFvPSbnNGl6BqpUu9AVfNk3qUDVxqjdvGk/hxVsQspMcGCPAoyJnI=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269944bd-f3dc-4bf8-0a26-08d8085c1ccb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 07:51:38.8267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/psuGyIkh7DAAI/DwZFO6hmfJEijtD4YtwxsKTKCgMylid2XmP2hbi4MJ7OJs/MC1baj2H86KsvK7LDto1EBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6818
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Pi-Hsun Shih <pihsun@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 01, 2020 at 12:14:09PM +0800, Hsin-Yi Wang wrote:
> On Fri, May 15, 2020 at 2:53 PM Xin Ji <xji@analogixsemi.com> wrote:
> 
> > +
> > +static int anx7625_bridge_attach(struct drm_bridge *bridge)
> 
> Latest drm_bridge api:
> 
> int (*attach)(struct drm_bridge *bridge,
>      enum drm_bridge_attach_flags flags);
> 
> https://elixir.bootlin.com/linux/v5.7-rc7/source/include/drm/drm_bridge.h#L70
> 
> > +{
> > +       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +       int err;
Hi Hsin-Yi, thanks for the comment, I'll fix it in the version v12

Thanks,
Xin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
