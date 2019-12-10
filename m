Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C403F1189C9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 14:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7682B6E8E2;
	Tue, 10 Dec 2019 13:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-eopbgr120085.outbound.protection.outlook.com [40.107.12.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557EC6E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cosQTrS48MmpJTSUWFa6Zdboc/yqChB49MRJZnBLRds=;
 b=F4oWCJWtrgPNFhATOqJI1aK8/XUNnR2hWa59f3AqFSn9qIMVnIo3ciAYOJjlQL1AAlWsKSIebUIXjyBv4BJdEnaHFgkwXwJcc+3Mg/uynPnuJPw9aOebaczR1G/nhg0bxiu+E40ydwjMaERtw48tDAZiRPMiNpVGEtWZ9goRRac=
Received: from VI1PR08CA0129.eurprd08.prod.outlook.com (2603:10a6:800:d4::31)
 by PR2PR08MB4827.eurprd08.prod.outlook.com (2603:10a6:101:22::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Tue, 10 Dec
 2019 13:28:50 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0129.outlook.office365.com
 (2603:10a6:800:d4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Tue, 10 Dec 2019 13:28:50 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 13:28:49 +0000
Received: ("Tessian outbound 1e3e4a1147b7:v37");
 Tue, 10 Dec 2019 13:28:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6764d9970649753
X-CR-MTA-TID: 64aa7808
Received: from 296fd68b5255.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63509ADF-EC12-40CD-888C-6CA1EDF59E90.1; 
 Tue, 10 Dec 2019 13:28:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 296fd68b5255.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Dec 2019 13:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7RQMSm7G7fRRXECKDHpu/lXctQENQOEWynUFf27PgqnnhagTptWjlefq0ydRswtbuAkCEhZdN4nxktwUk4RL6IsqdAEjdLdrpTI7csyOhZATeVd0gxULvTwpR8gzIBZJ2IVhp20x7VYDS5w5F92J3YOFa/lxPQOvyt+vskQluxGra4zj+wzPQkPd//k7DAZj4Lml8hpyehohayUqcedR7aPZg54SjTzd48Ug0Fy4Em5s3oBOpRxzMtAdvy8Lkh8zIGvSJSs8rJf9QL8SBoUH+hMddBUXU1P177RcvXhHRA5MSXnEsoqWeCYYfe3p92jfvSIXz+gMep85a1OR+Vr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cosQTrS48MmpJTSUWFa6Zdboc/yqChB49MRJZnBLRds=;
 b=XSAt0rmj7q0lpMwXBeB6hXA6AcL+sDBBcIfcH+SfmEv+IKScYuf5UWSpFY+U3Ops6kQMpoQ0Z9m7xs5rvmLMr6dWbs5kaMznm4vGlOofTQvns+bKOYheD9TFHOgsQOK/3o8NSHyOzDc/8QCH8J2/C/8aeGXGW/srimok76EvxMJjd09VcTesZU/8cnJSyWtYhTNLH1iXa3zASlHmdcRLpPfbKzvrYNpGoJqL7AtnKT+WHd0ckPYF6w+p9c0BKAuNqUkJW4TDLH1BV/s6eTuoWzaSvkyli16wStvNOeeTEiGmXbM35qDSDU1X9JM4I7MBBCHsMPCLdva2guv8Xb3xqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cosQTrS48MmpJTSUWFa6Zdboc/yqChB49MRJZnBLRds=;
 b=F4oWCJWtrgPNFhATOqJI1aK8/XUNnR2hWa59f3AqFSn9qIMVnIo3ciAYOJjlQL1AAlWsKSIebUIXjyBv4BJdEnaHFgkwXwJcc+3Mg/uynPnuJPw9aOebaczR1G/nhg0bxiu+E40ydwjMaERtw48tDAZiRPMiNpVGEtWZ9goRRac=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3136.eurprd08.prod.outlook.com (52.133.14.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Tue, 10 Dec 2019 13:28:42 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 13:28:42 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Rename drm_bridge->dev to drm
Thread-Topic: [PATCH] drm: Rename drm_bridge->dev to drm
Thread-Index: AQHVq4lXPN/wPtLXyE2pxOrtyWLc3Ker2ioAgAEef4CAAAlgAIAGK6UAgAAJsYA=
Date: Tue, 10 Dec 2019 13:28:42 +0000
Message-ID: <1934781.Wy2AY364az@e123338-lin>
References: <20191205163028.19941-1-mihail.atanassov@arm.com>
 <55bdd2ef-1033-9ae4-f033-bf6c3984cc95@suse.de>
 <20191210101250.GQ624164@phenom.ffwll.local>
In-Reply-To: <20191210101250.GQ624164@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c5505d5-d0a1-4311-4076-08d77d74e481
X-MS-TrafficTypeDiagnostic: VI1PR08MB3136:|PR2PR08MB4827:
X-Microsoft-Antispam-PRVS: <PR2PR08MB48279DB0FC4E559C88E422188F5B0@PR2PR08MB4827.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
x-forefront-prvs: 02475B2A01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(189003)(199004)(54906003)(966005)(110136005)(4326008)(186003)(26005)(6506007)(316002)(7416002)(2906002)(86362001)(478600001)(66476007)(81156014)(9686003)(6512007)(64756008)(81166006)(8676002)(5660300002)(8936002)(6486002)(30864003)(71200400001)(33716001)(52116002)(66446008)(66946007)(66556008)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3136;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rSK37nTxetFYCi7eRp8yXSIcjmG5kkN4KtGriFTBdTPS4bPFeoKlA5FWM0Gn5CbfyVFxxDRUQMS9olga/LXT/YKcFRhQAyfK4xhq5hVj3mu2cqX9QJbUtJSTpxYdLBKVy8/tZv65CfpjWZV3Wo7I+rmT1MqJG8K2QiWK5IGsn4JZ2JCae33KQsNvqxvoXpOpzS6mpV13CQTFSaVYp5uoVrduEw6+8RYc95lBP35RFlHX400+7/aALjH6SHB69Fz600mYFqqT1EvSYFA8RcXbf/urgeBYxT1/p1vGPo3JTyp3hhzXwZdyNlx6kGCvpS9XS82ppEjWsYzN1Bn7ZNfNL/CZ+2ZEHfpuS01fhMBiMg2lbllvHlzIUblOCfFezvUAeEsC+YaCRwO2ponRzqAERDKHKbx78I3wFyFQUR2W4Js/rbqCyGjmHjhCBRqaAg1FW6Wk5zVRGlScC/y2RgGDmizvHJLBDDhR7APWYCKWtc4=
x-ms-exchange-transport-forked: True
Content-ID: <FD800F25E00E894382C2DC2898F832E0@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3136
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(346002)(136003)(396003)(189003)(199004)(70206006)(36906005)(6512007)(356004)(81166006)(2906002)(9686003)(81156014)(110136005)(316002)(4326008)(54906003)(70586007)(186003)(33716001)(8676002)(6486002)(336012)(5660300002)(966005)(26826003)(76130400001)(30864003)(26005)(86362001)(8936002)(6506007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PR2PR08MB4827;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5a2b586e-e388-4b3d-8ad8-08d77d74dfb9
NoDisclaimer: True
X-Forefront-PRVS: 02475B2A01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEvcubbuh/Pnlf/VohfBHo+j/CGbaK3yIhytZh6MDKqR0EGoMdFU6FsvrtjjvKohpMaKUFmA9LyOQ53ZcXDal7RynUIjJu5/NMlPgCE2+3SK2c2C9N63olFFlsUO97Ff6XeQYF4R2zSjRaLMLlSsLVbUyVVXBm3DRBtUcwgU7e8uLwk17fNEBnmPPZf+LuCF5+DZHGWxXOvGTjwuOg15walLACvzNandZ+43H9xqoeAHO+EJVsP1xBHQQL2SeFcGR9WgPRuUmy1pXvK8/9WkyWdT06+tnruE479hsD4zgT9V6hNqPeMHfuF1jA0qv5pIuX1yC+u7Fi6Zfb5l4sGJW9175AROHfuFbrd02pCJ8JYTU8QF5/oOGudIogEICgjybvbB800NxVBdNTxoD+bOe0xy5s5pB47HWr3u7lzal1qrsSL5KRB40aXV6g1u0xSPyHrO5d8jnzGHzZnqUlTMjBPA3nT1xS/zvGtliYN+CpI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 13:28:49.9038 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5505d5-d0a1-4311-4076-08d77d74e481
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4827
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 10 December 2019 10:12:50 GMT Daniel Vetter wrote:
> On Fri, Dec 06, 2019 at 12:59:04PM +0100, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 06.12.19 um 12:25 schrieb Mihail Atanassov:
> > > Hallo Thomas,
> > > 
> > > On Thursday, 5 December 2019 18:20:06 GMT Thomas Zimmermann wrote:
> > >> Hi
> > >>
> > >> Am 05.12.19 um 17:30 schrieb Mihail Atanassov:
> > >>> The 'dev' name causes some confusion with 'struct device' [1][2], so use
> > >>> 'drm' instead since this seems to be the prevalent name for 'struct
> > >>> drm_device' members.
> > >>>
> > >>> [1] https://patchwork.freedesktop.org/patch/342472/?series=70039&rev=1
> > >>> [2] https://patchwork.freedesktop.org/patch/343643/?series=70432&rev=1
> > >>
> > >> I read through the provided links, but can't see why is it called 'drm'.
> > >> That sounds like a reference to a DRM driver structure to me.
> > > 
> > > There are about 550 hits on 'struct drm_device *drm', so I gathered that
> > > it's the most common alternative to just naming it 'dev' (at about 4.5k
> > > hits in the codebase). There's also 'ddev', 'drm_dev', 'drmdev' with
> > > few hits.
> > > 
> > >>
> > >> What about attached_dev or consumer_dev or encoder_dev?
> > > 
> > > Those would be more descriptive, if you think it's worth sidestepping
> > > the above convention a bit. I don't mind either way.
> > 
> > Well, I don't have a say on these things, but it's worth considering a
> > more descriptive name IMHO.
> > 
> > I also wonder why that field is there in the first place. Invoking
> > drm_bridge_attach() sets the encoder and its dev field for the bridge.
> > [1] Could the dev field be removed and all users refer to encoder->dev
> > instead? If so, it seems like the better way to go.
> 
> That sounds like a pretty neat idea (if possible) ...
> -Daniel
> 

OK, I'll poke at it a bit and see what falls out. I'm guessing we don't
particularly care about the extra pointer being dereferenced in driver code?
The vast majority of the uses are in attach/detach logic so fairly benign but
we do have a few in IRQs.

> > 
> > Best regards
> > Thomas
> > 
> > [1]
> > https://elixir.bootlin.com/linux/v5.4.2/source/drivers/gpu/drm/drm_bridge.c#L128
> > 
> > > 
> > >>
> > >> Best regards
> > >> Thomas
> > >>
> > >>>
> > >>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> > >>> ---
> > >>>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c         |  2 +-
> > >>>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c   |  2 +-
> > >>>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c   |  2 +-
> > >>>  drivers/gpu/drm/bridge/cdns-dsi.c                    |  2 +-
> > >>>  drivers/gpu/drm/bridge/dumb-vga-dac.c                |  2 +-
> > >>>  .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  2 +-
> > >>>  drivers/gpu/drm/bridge/nxp-ptn3460.c                 |  2 +-
> > >>>  drivers/gpu/drm/bridge/panel.c                       |  2 +-
> > >>>  drivers/gpu/drm/bridge/parade-ps8622.c               |  2 +-
> > >>>  drivers/gpu/drm/bridge/sii902x.c                     |  6 +++---
> > >>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c            |  6 +++---
> > >>>  drivers/gpu/drm/bridge/tc358764.c                    |  4 ++--
> > >>>  drivers/gpu/drm/bridge/tc358767.c                    |  6 +++---
> > >>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                |  2 +-
> > >>>  drivers/gpu/drm/bridge/ti-tfp410.c                   |  6 +++---
> > >>>  drivers/gpu/drm/drm_bridge.c                         | 12 ++++++------
> > >>>  drivers/gpu/drm/i2c/tda998x_drv.c                    |  2 +-
> > >>>  drivers/gpu/drm/mcde/mcde_dsi.c                      |  2 +-
> > >>>  drivers/gpu/drm/msm/edp/edp_bridge.c                 |  2 +-
> > >>>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c               |  4 ++--
> > >>>  drivers/gpu/drm/rcar-du/rcar_lvds.c                  |  2 +-
> > >>>  include/drm/drm_bridge.h                             |  4 ++--
> > >>>  22 files changed, 38 insertions(+), 38 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > >>> index 9e13e466e72c..db7d01cb0923 100644
> > >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > >>> @@ -863,7 +863,7 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge)
> > >>>  		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
> > >>>  				DRM_CONNECTOR_POLL_DISCONNECT;
> > >>>  
> > >>> -	ret = drm_connector_init(bridge->dev, &adv->connector,
> > >>> +	ret = drm_connector_init(bridge->drm, &adv->connector,
> > >>>  				 &adv7511_connector_funcs,
> > >>>  				 DRM_MODE_CONNECTOR_HDMIA);
> > >>>  	if (ret) {
> > >>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > >>> index b4f3a923a52a..0e3508aeaa6c 100644
> > >>> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > >>> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > >>> @@ -541,7 +541,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge)
> > >>>  		return err;
> > >>>  	}
> > >>>  
> > >>> -	err = drm_connector_init(bridge->dev, &anx6345->connector,
> > >>> +	err = drm_connector_init(bridge->drm, &anx6345->connector,
> > >>>  				 &anx6345_connector_funcs,
> > >>>  				 DRM_MODE_CONNECTOR_eDP);
> > >>>  	if (err) {
> > >>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> > >>> index 41867be03751..d5722bc28933 100644
> > >>> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> > >>> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> > >>> @@ -908,7 +908,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge)
> > >>>  		return err;
> > >>>  	}
> > >>>  
> > >>> -	err = drm_connector_init(bridge->dev, &anx78xx->connector,
> > >>> +	err = drm_connector_init(bridge->drm, &anx78xx->connector,
> > >>>  				 &anx78xx_connector_funcs,
> > >>>  				 DRM_MODE_CONNECTOR_DisplayPort);
> > >>>  	if (err) {
> > >>> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> > >>> index 3a5bd4e7fd1e..f6d7e97de66e 100644
> > >>> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> > >>> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> > >>> @@ -651,7 +651,7 @@ static int cdns_dsi_bridge_attach(struct drm_bridge *bridge)
> > >>>  	struct cdns_dsi *dsi = input_to_dsi(input);
> > >>>  	struct cdns_dsi_output *output = &dsi->output;
> > >>>  
> > >>> -	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
> > >>> +	if (!drm_core_check_feature(bridge->drm, DRIVER_ATOMIC)) {
> > >>>  		dev_err(dsi->base.dev,
> > >>>  			"cdns-dsi driver is only compatible with DRM devices supporting atomic updates");
> > >>>  		return -ENOTSUPP;
> > >>> diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > >>> index cc33dc411b9e..30b5e54df381 100644
> > >>> --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > >>> +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > >>> @@ -112,7 +112,7 @@ static int dumb_vga_attach(struct drm_bridge *bridge)
> > >>>  
> > >>>  	drm_connector_helper_add(&vga->connector,
> > >>>  				 &dumb_vga_con_helper_funcs);
> > >>> -	ret = drm_connector_init_with_ddc(bridge->dev, &vga->connector,
> > >>> +	ret = drm_connector_init_with_ddc(bridge->drm, &vga->connector,
> > >>>  					  &dumb_vga_con_funcs,
> > >>>  					  DRM_MODE_CONNECTOR_VGA,
> > >>>  					  vga->ddc);
> > >>> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > >>> index e8a49f6146c6..ab06394cfff7 100644
> > >>> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > >>> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > >>> @@ -223,7 +223,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge)
> > >>>  	drm_connector_helper_add(connector,
> > >>>  				 &ge_b850v3_lvds_connector_helper_funcs);
> > >>>  
> > >>> -	ret = drm_connector_init(bridge->dev, connector,
> > >>> +	ret = drm_connector_init(bridge->drm, connector,
> > >>>  				 &ge_b850v3_lvds_connector_funcs,
> > >>>  				 DRM_MODE_CONNECTOR_DisplayPort);
> > >>>  	if (ret) {
> > >>> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> > >>> index 57ff01339559..714cb954522a 100644
> > >>> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> > >>> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> > >>> @@ -247,7 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge)
> > >>>  	}
> > >>>  
> > >>>  	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > >>> -	ret = drm_connector_init(bridge->dev, &ptn_bridge->connector,
> > >>> +	ret = drm_connector_init(bridge->drm, &ptn_bridge->connector,
> > >>>  			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> > >>>  	if (ret) {
> > >>>  		DRM_ERROR("Failed to initialize connector with drm\n");
> > >>> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > >>> index f4e293e7cf64..7ed3b3e85f03 100644
> > >>> --- a/drivers/gpu/drm/bridge/panel.c
> > >>> +++ b/drivers/gpu/drm/bridge/panel.c
> > >>> @@ -67,7 +67,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge)
> > >>>  	drm_connector_helper_add(connector,
> > >>>  				 &panel_bridge_connector_helper_funcs);
> > >>>  
> > >>> -	ret = drm_connector_init(bridge->dev, connector,
> > >>> +	ret = drm_connector_init(bridge->drm, connector,
> > >>>  				 &panel_bridge_connector_funcs,
> > >>>  				 panel_bridge->connector_type);
> > >>>  	if (ret) {
> > >>> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> > >>> index b7a72dfdcac3..18cc693734b3 100644
> > >>> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> > >>> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> > >>> @@ -487,7 +487,7 @@ static int ps8622_attach(struct drm_bridge *bridge)
> > >>>  	}
> > >>>  
> > >>>  	ps8622->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > >>> -	ret = drm_connector_init(bridge->dev, &ps8622->connector,
> > >>> +	ret = drm_connector_init(bridge->drm, &ps8622->connector,
> > >>>  			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> > >>>  	if (ret) {
> > >>>  		DRM_ERROR("Failed to initialize connector with drm\n");
> > >>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> > >>> index b70e8c5cf2e1..3d8b3e1eb0aa 100644
> > >>> --- a/drivers/gpu/drm/bridge/sii902x.c
> > >>> +++ b/drivers/gpu/drm/bridge/sii902x.c
> > >>> @@ -402,7 +402,7 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
> > >>>  static int sii902x_bridge_attach(struct drm_bridge *bridge)
> > >>>  {
> > >>>  	struct sii902x *sii902x = bridge_to_sii902x(bridge);
> > >>> -	struct drm_device *drm = bridge->dev;
> > >>> +	struct drm_device *drm = bridge->drm;
> > >>>  	int ret;
> > >>>  
> > >>>  	drm_connector_helper_add(&sii902x->connector,
> > >>> @@ -820,8 +820,8 @@ static irqreturn_t sii902x_interrupt(int irq, void *data)
> > >>>  
> > >>>  	mutex_unlock(&sii902x->mutex);
> > >>>  
> > >>> -	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
> > >>> -		drm_helper_hpd_irq_event(sii902x->bridge.dev);
> > >>> +	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.drm)
> > >>> +		drm_helper_hpd_irq_event(sii902x->bridge.drm);
> > >>>  
> > >>>  	return IRQ_HANDLED;
> > >>>  }
> > >>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > >>> index dbe38a54870b..7a549cce8536 100644
> > >>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > >>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > >>> @@ -2346,7 +2346,7 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
> > >>>  
> > >>>  	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
> > >>>  
> > >>> -	drm_connector_init_with_ddc(bridge->dev, connector,
> > >>> +	drm_connector_init_with_ddc(bridge->drm, connector,
> > >>>  				    &dw_hdmi_connector_funcs,
> > >>>  				    DRM_MODE_CONNECTOR_HDMIA,
> > >>>  				    hdmi->ddc);
> > >>> @@ -2554,8 +2554,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
> > >>>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> > >>>  		dev_dbg(hdmi->dev, "EVENT=%s\n",
> > >>>  			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
> > >>> -		if (hdmi->bridge.dev)
> > >>> -			drm_helper_hpd_irq_event(hdmi->bridge.dev);
> > >>> +		if (hdmi->bridge.drm)
> > >>> +			drm_helper_hpd_irq_event(hdmi->bridge.drm);
> > >>>  	}
> > >>>  
> > >>>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> > >>> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> > >>> index db298f550a5a..1744d7daa534 100644
> > >>> --- a/drivers/gpu/drm/bridge/tc358764.c
> > >>> +++ b/drivers/gpu/drm/bridge/tc358764.c
> > >>> @@ -352,7 +352,7 @@ static void tc358764_enable(struct drm_bridge *bridge)
> > >>>  static int tc358764_attach(struct drm_bridge *bridge)
> > >>>  {
> > >>>  	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> > >>> -	struct drm_device *drm = bridge->dev;
> > >>> +	struct drm_device *drm = bridge->drm;
> > >>>  	int ret;
> > >>>  
> > >>>  	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > >>> @@ -378,7 +378,7 @@ static int tc358764_attach(struct drm_bridge *bridge)
> > >>>  static void tc358764_detach(struct drm_bridge *bridge)
> > >>>  {
> > >>>  	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> > >>> -	struct drm_device *drm = bridge->dev;
> > >>> +	struct drm_device *drm = bridge->drm;
> > >>>  
> > >>>  	drm_connector_unregister(&ctx->connector);
> > >>>  	drm_fb_helper_remove_one_connector(drm->fb_helper, &ctx->connector);
> > >>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> > >>> index 8029478ffebb..fccacd12bb53 100644
> > >>> --- a/drivers/gpu/drm/bridge/tc358767.c
> > >>> +++ b/drivers/gpu/drm/bridge/tc358767.c
> > >>> @@ -1407,7 +1407,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge)
> > >>>  {
> > >>>  	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > >>>  	struct tc_data *tc = bridge_to_tc(bridge);
> > >>> -	struct drm_device *drm = bridge->dev;
> > >>> +	struct drm_device *drm = bridge->drm;
> > >>>  	int ret;
> > >>>  
> > >>>  	/* Create DP/eDP connector */
> > >>> @@ -1514,7 +1514,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
> > >>>  		dev_err(tc->dev, "syserr %x\n", stat);
> > >>>  	}
> > >>>  
> > >>> -	if (tc->hpd_pin >= 0 && tc->bridge.dev) {
> > >>> +	if (tc->hpd_pin >= 0 && tc->bridge.drm) {
> > >>>  		/*
> > >>>  		 * H is triggered when the GPIO goes high.
> > >>>  		 *
> > >>> @@ -1528,7 +1528,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
> > >>>  			h ? "H" : "", lc ? "LC" : "");
> > >>>  
> > >>>  		if (h || lc)
> > >>> -			drm_kms_helper_hotplug_event(tc->bridge.dev);
> > >>> +			drm_kms_helper_hotplug_event(tc->bridge.drm);
> > >>>  	}
> > >>>  
> > >>>  	regmap_write(tc->regmap, INTSTS_G, val);
> > >>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > >>> index 43abf01ebd4c..23576c3fac9f 100644
> > >>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > >>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > >>> @@ -275,7 +275,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
> > >>>  						   .node = NULL,
> > >>>  						 };
> > >>>  
> > >>> -	ret = drm_connector_init(bridge->dev, &pdata->connector,
> > >>> +	ret = drm_connector_init(bridge->drm, &pdata->connector,
> > >>>  				 &ti_sn_bridge_connector_funcs,
> > >>>  				 DRM_MODE_CONNECTOR_eDP);
> > >>>  	if (ret) {
> > >>> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> > >>> index aa3198dc9903..cae9fd584ff1 100644
> > >>> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> > >>> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> > >>> @@ -135,7 +135,7 @@ static int tfp410_attach(struct drm_bridge *bridge)
> > >>>  
> > >>>  	drm_connector_helper_add(&dvi->connector,
> > >>>  				 &tfp410_con_helper_funcs);
> > >>> -	ret = drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
> > >>> +	ret = drm_connector_init_with_ddc(bridge->drm, &dvi->connector,
> > >>>  					  &tfp410_con_funcs,
> > >>>  					  dvi->connector_type,
> > >>>  					  dvi->ddc);
> > >>> @@ -179,8 +179,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
> > >>>  
> > >>>  	dvi = container_of(work, struct tfp410, hpd_work.work);
> > >>>  
> > >>> -	if (dvi->bridge.dev)
> > >>> -		drm_helper_hpd_irq_event(dvi->bridge.dev);
> > >>> +	if (dvi->bridge.drm)
> > >>> +		drm_helper_hpd_irq_event(dvi->bridge.drm);
> > >>>  }
> > >>>  
> > >>>  static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
> > >>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > >>> index cba537c99e43..80f7a1aa969e 100644
> > >>> --- a/drivers/gpu/drm/drm_bridge.c
> > >>> +++ b/drivers/gpu/drm/drm_bridge.c
> > >>> @@ -119,19 +119,19 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
> > >>>  	if (!encoder || !bridge)
> > >>>  		return -EINVAL;
> > >>>  
> > >>> -	if (previous && (!previous->dev || previous->encoder != encoder))
> > >>> +	if (previous && (!previous->drm || previous->encoder != encoder))
> > >>>  		return -EINVAL;
> > >>>  
> > >>> -	if (bridge->dev)
> > >>> +	if (bridge->drm)
> > >>>  		return -EBUSY;
> > >>>  
> > >>> -	bridge->dev = encoder->dev;
> > >>> +	bridge->drm = encoder->dev;
> > >>>  	bridge->encoder = encoder;
> > >>>  
> > >>>  	if (bridge->funcs->attach) {
> > >>>  		ret = bridge->funcs->attach(bridge);
> > >>>  		if (ret < 0) {
> > >>> -			bridge->dev = NULL;
> > >>> +			bridge->drm = NULL;
> > >>>  			bridge->encoder = NULL;
> > >>>  			return ret;
> > >>>  		}
> > >>> @@ -151,13 +151,13 @@ void drm_bridge_detach(struct drm_bridge *bridge)
> > >>>  	if (WARN_ON(!bridge))
> > >>>  		return;
> > >>>  
> > >>> -	if (WARN_ON(!bridge->dev))
> > >>> +	if (WARN_ON(!bridge->drm))
> > >>>  		return;
> > >>>  
> > >>>  	if (bridge->funcs->detach)
> > >>>  		bridge->funcs->detach(bridge);
> > >>>  
> > >>> -	bridge->dev = NULL;
> > >>> +	bridge->drm = NULL;
> > >>>  }
> > >>>  
> > >>>  /**
> > >>> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> > >>> index a63790d32d75..fa430e43f5ad 100644
> > >>> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> > >>> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> > >>> @@ -1360,7 +1360,7 @@ static int tda998x_bridge_attach(struct drm_bridge *bridge)
> > >>>  {
> > >>>  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
> > >>>  
> > >>> -	return tda998x_connector_init(priv, bridge->dev);
> > >>> +	return tda998x_connector_init(priv, bridge->drm);
> > >>>  }
> > >>>  
> > >>>  static void tda998x_bridge_detach(struct drm_bridge *bridge)
> > >>> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> > >>> index 42fff811653e..4ef14d5cdcb6 100644
> > >>> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> > >>> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> > >>> @@ -846,7 +846,7 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
> > >>>  static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
> > >>>  {
> > >>>  	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
> > >>> -	struct drm_device *drm = bridge->dev;
> > >>> +	struct drm_device *drm = bridge->drm;
> > >>>  	int ret;
> > >>>  
> > >>>  	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
> > >>> diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp/edp_bridge.c
> > >>> index 2950bba4aca9..a329c7a79d8d 100644
> > >>> --- a/drivers/gpu/drm/msm/edp/edp_bridge.c
> > >>> +++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
> > >>> @@ -47,7 +47,7 @@ static void edp_bridge_mode_set(struct drm_bridge *bridge,
> > >>>  		const struct drm_display_mode *mode,
> > >>>  		const struct drm_display_mode *adjusted_mode)
> > >>>  {
> > >>> -	struct drm_device *dev = bridge->dev;
> > >>> +	struct drm_device *dev = bridge->drm;
> > >>>  	struct drm_connector *connector;
> > >>>  	struct edp_bridge *edp_bridge = to_edp_bridge(bridge);
> > >>>  	struct msm_edp *edp = edp_bridge->edp;
> > >>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > >>> index ba81338a9bf8..0add3c88a13e 100644
> > >>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > >>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > >>> @@ -20,7 +20,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
> > >>>  
> > >>>  static void msm_hdmi_power_on(struct drm_bridge *bridge)
> > >>>  {
> > >>> -	struct drm_device *dev = bridge->dev;
> > >>> +	struct drm_device *dev = bridge->drm;
> > >>>  	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > >>>  	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > >>>  	const struct hdmi_platform_config *config = hdmi->config;
> > >>> @@ -56,7 +56,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
> > >>>  
> > >>>  static void power_off(struct drm_bridge *bridge)
> > >>>  {
> > >>> -	struct drm_device *dev = bridge->dev;
> > >>> +	struct drm_device *dev = bridge->drm;
> > >>>  	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > >>>  	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > >>>  	const struct hdmi_platform_config *config = hdmi->config;
> > >>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > >>> index 8c6c172bbf2e..12fcfbf31968 100644
> > >>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > >>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > >>> @@ -622,7 +622,7 @@ static int rcar_lvds_attach(struct drm_bridge *bridge)
> > >>>  	if (!lvds->panel)
> > >>>  		return 0;
> > >>>  
> > >>> -	ret = drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_funcs,
> > >>> +	ret = drm_connector_init(bridge->drm, connector, &rcar_lvds_conn_funcs,
> > >>>  				 DRM_MODE_CONNECTOR_LVDS);
> > >>>  	if (ret < 0)
> > >>>  		return ret;
> > >>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > >>> index c0a2286a81e9..795860200ebf 100644
> > >>> --- a/include/drm/drm_bridge.h
> > >>> +++ b/include/drm/drm_bridge.h
> > >>> @@ -376,8 +376,8 @@ struct drm_bridge_timings {
> > >>>   * struct drm_bridge - central DRM bridge control structure
> > >>>   */
> > >>>  struct drm_bridge {
> > >>> -	/** @dev: DRM device this bridge belongs to */
> > >>> -	struct drm_device *dev;
> > >>> +	/** @drm: DRM device this bridge belongs to */
> > >>> +	struct drm_device *drm;
> > >>>  	/** @encoder: encoder to which this bridge is connected */
> > >>>  	struct drm_encoder *encoder;
> > >>>  	/** @next: the next bridge in the encoder chain */
> > >>>
> > >>
> > >>
> > > 
> > > 
> > 
> 
> 
> 
> 
> 


-- 
Mihail



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
