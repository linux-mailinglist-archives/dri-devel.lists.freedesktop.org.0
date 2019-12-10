Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A36118EFB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 18:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E10A6E8FF;
	Tue, 10 Dec 2019 17:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09756E8FF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1XO9FqGc6EhQqGVQa+EOcQ6ucIotbgttEtouJX6wz8=;
 b=TFn0zfb0jEgLmrnZ8q26669RPBEuLV2wMwy7OkLw4FYD5DDNb5zu2hSy/aPBc2XFwV8gLDoboLvRw4Ny95H9o1VMLnSDciZQf16EHMeBQQFm1A25r8mw6oF+Cqvg/UzMn9AEz3y2A0+LHO/ICxi+IhXOKc5I9V9XGdyX27lP2vY=
Received: from VI1PR08CA0132.eurprd08.prod.outlook.com (2603:10a6:800:d4::34)
 by PR2PR08MB4826.eurprd08.prod.outlook.com (2603:10a6:101:24::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 10 Dec
 2019 17:28:15 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by VI1PR08CA0132.outlook.office365.com
 (2603:10a6:800:d4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via Frontend
 Transport; Tue, 10 Dec 2019 17:28:14 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 17:28:14 +0000
Received: ("Tessian outbound 45a30426f8e4:v37");
 Tue, 10 Dec 2019 17:28:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5729deecd66b141
X-CR-MTA-TID: 64aa7808
Received: from b4241bf44f5d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A548F763-10C0-4918-9B96-8C27EAC6C6C6.1; 
 Tue, 10 Dec 2019 17:28:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4241bf44f5d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Dec 2019 17:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9pufVfUYdQN/e7hXahY0Oz84IZh4ENO/8N/b+/TKIvzfrYqXHxIc3/BkJspyMAvIdd6aeP1mJJLeLLGXALzsbptoqjO4uN+/D9IZ7tVJGkstjbbAvwKGbPJw0yXPU4UhHEoprv+41jUp3nofm79svLyh6VeaiWVAuVeHacAOq1Ru/RzmatwGc6NF0HlbfwL11WWufKr5qq/aOBaoIiHOAks0mCC8LwGzU5fZ/L7Ep2cLuLfHhVyIzoMnyAncC4yQaOv1q3kMZ509/53wjHHe/wz/SJ0QSf0EAu+JhyH/DA61ZpGSsnZajF7428qNbXeeGgRImfuCQjITeNXxcTXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1XO9FqGc6EhQqGVQa+EOcQ6ucIotbgttEtouJX6wz8=;
 b=I9CHGAHKILsSR/Y10PmWh7wnKTDCrGHwCY/+r0nba4I2A/iisRM/rFeqNt5JqB87v+ct2gMtW39BpRwcCCK4eYO3Jqe3K3sT5rLw+okthQBR/zTHxx/iRd39Vo3e35LKBinW7vHy9RLAkC7Ru5S9LhXxtN0JwEfEP0grAeDJQzrsib5p0q/EJwbVXmWsYENdfvcHq80nnErlgxsF6Ea8jGEc55e1j+lSbBIjB8njuECJnrl1B1Yl6eHGIIr8BNJBIfvKqmmZ7gUsKN8d3/lYDXOSeaHQDNJayf05fdsTaC85u+hD1M+nSwyiI7pVBIdH+VCwRQD2ZFTgkMwAKU13KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1XO9FqGc6EhQqGVQa+EOcQ6ucIotbgttEtouJX6wz8=;
 b=TFn0zfb0jEgLmrnZ8q26669RPBEuLV2wMwy7OkLw4FYD5DDNb5zu2hSy/aPBc2XFwV8gLDoboLvRw4Ny95H9o1VMLnSDciZQf16EHMeBQQFm1A25r8mw6oF+Cqvg/UzMn9AEz3y2A0+LHO/ICxi+IhXOKc5I9V9XGdyX27lP2vY=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3247.eurprd08.prod.outlook.com (52.134.30.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Tue, 10 Dec 2019 17:28:07 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 17:28:07 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg
 <sam@ravnborg.org>
Subject: Re: [PATCH] drm/bridge: panel: export drm_panel_bridge_connector
Thread-Topic: [PATCH] drm/bridge: panel: export drm_panel_bridge_connector
Thread-Index: AQHVr2juqWlk00ywj0COPSlRR1t0m6ezjmqAgAARIIA=
Date: Tue, 10 Dec 2019 17:28:07 +0000
Message-ID: <2826541.zeyClDNUlX@e123338-lin>
References: <20191207140353.23967-5-sam@ravnborg.org>
 <20191210144834.27491-1-mihail.atanassov@arm.com>
 <20191210162647.GA5211@pendragon.ideasonboard.com>
In-Reply-To: <20191210162647.GA5211@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 63079c85-a512-4471-9cfc-08d77d965697
X-MS-TrafficTypeDiagnostic: VI1PR08MB3247:|PR2PR08MB4826:
X-Microsoft-Antispam-PRVS: <PR2PR08MB4826C290E1747D7000A77C6E8F5B0@PR2PR08MB4826.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 02475B2A01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(189003)(199004)(316002)(71200400001)(26005)(8676002)(6506007)(6486002)(33716001)(66556008)(66446008)(86362001)(478600001)(81156014)(54906003)(81166006)(4326008)(64756008)(52116002)(5660300002)(110136005)(8936002)(6512007)(7416002)(66946007)(186003)(9686003)(2906002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3247;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tNXagoSMVyHtq06mvEAOrj3JY0bVVcNeqLDTDE3VZo2g+tFcmNOPRpgvAYACgHH/jOhPTm123RZl1c5zMVP3UWVxCzIzVPwYAI9bKtkphzHBvnL/YacvfVpo6TOh7IvcMlRY+EfzstVFlRhbCXxB16Uy9IYee9Me2L0U6V1Qde3+8doZLGoqX4awaLkweWSrbZt65f04f86gR7Xsn3PcAuW0g0/TRMMt+e7gc/E7WtBjUAaO3Rezmet3s6RNS+cK43lhU67lKP23iAshXi0WRokvXWXK9jrDsc8TSzWlH9G1izKzdfgyRgGv0a/ZbCzf1D9uGozseFXgEIXiR/4QMTWIk5cASDJssOtN5uHiLx0E3ghQ4iot1tNiTfVfDe/zfrkjSC9buo24XApUlJeA/BBL13sTVZmpAUaBJfnYKoFs4mnfhpkhxKBxWT+nXiWZ
x-ms-exchange-transport-forked: True
Content-ID: <A4DDAF795D42F04ABBEE14B3EAB0B754@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3247
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(8936002)(478600001)(4326008)(8676002)(81156014)(26005)(26826003)(81166006)(6506007)(5660300002)(186003)(356004)(2906002)(33716001)(336012)(9686003)(316002)(6512007)(86362001)(54906003)(110136005)(107886003)(76130400001)(70206006)(70586007)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PR2PR08MB4826;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: abc1e8ca-286c-42e4-8820-08d77d965242
NoDisclaimer: True
X-Forefront-PRVS: 02475B2A01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LZxZrceM/iBUNSJ1pHaH4Wyr4WUEcNbr2CkeSxsECCOfYd2dLbj/scK59oBM+SldEgN6Dgr4bTe6B4z6vQxNFCR4J6ifENgvauBN9EHHHfKkufyShI9wL6Z0e56XWCRP/6/Xvvor2NRTEljZEdd0EDpyHGZVkMYdOZKRggo9ldV/X0Lqx81a7Y/yBfCBabICuiqIrYunpJdQeQv5QqlmiGlg3sq+PFdH7sWI74t3iBzAI83QkFYDkOpwalYaPA7EiyMs6TkozuEciNL0MijWgu1Jo6iSOrxP/VAKGvfmFF/4y8YaBN9QuiOoht5VD+uL0sixJs6FlppUO/EeGY3U/Q3ibXti9YKS4QG+UN4jtuXAg2Of/U3XXveQQTBFTwWOrlXLnYsQngRbfgmukWnSeJa+zye6POiuAIclDBeGbJALDBWR637l54AnS1hf9+DO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 17:28:14.7047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63079c85-a512-4471-9cfc-08d77d965697
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4826
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
 Linux Walleij <linux.walleij@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 10 December 2019 16:26:47 GMT Laurent Pinchart wrote:
> Hi Mihail,
> 
> Thank you for the patch.
> 
> On Tue, Dec 10, 2019 at 02:48:49PM +0000, Mihail Atanassov wrote:
> > The function was unexported and was causing link failures for pl111 (and
> > probably the other user tve200) in a module build.
> > 
> > Fixes: d383fb5f8add ("drm: get drm_bridge_panel connector via helper")
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Linux Walleij <linux.walleij@linaro.org>
> > Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Thanks, applied to drm-misc-next.

> > ---
> >  drivers/gpu/drm/bridge/panel.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index 1443897f999b..f66777e24968 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -306,3 +306,4 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
> >  
> >  	return &panel_bridge->connector;
> >  }
> > +EXPORT_SYMBOL(drm_panel_bridge_connector);
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 


-- 
Mihail



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
