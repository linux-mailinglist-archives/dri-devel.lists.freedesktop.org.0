Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC2211A982
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 12:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A316EB0A;
	Wed, 11 Dec 2019 11:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40057.outbound.protection.outlook.com [40.107.4.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8576EB0B;
 Wed, 11 Dec 2019 11:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkty0DsxKwRefsHlFoam+BfHuFRLTOzc+s2oWFzDDQU=;
 b=Q2bJT1pxZCuPfKGoOmCSII4NsmUk/3dD1jtlA8gyvGjHvwCeWe4x8aFzd7zIDWkJ+p8h9EsgmSZ+JtunjTuOp5p9AiiPoOMVuzwYb+YplcLEmbkqgXXO1BG40/TYRUrH/roxR4eX4zJ0+RxI5MDfwdcBgoGdq080lxxoCwN7Xy4=
Received: from HE1PR0802CA0009.eurprd08.prod.outlook.com (2603:10a6:3:bd::19)
 by AM0PR08MB2996.eurprd08.prod.outlook.com (2603:10a6:208:5b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.16; Wed, 11 Dec
 2019 11:01:44 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by HE1PR0802CA0009.outlook.office365.com
 (2603:10a6:3:bd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14 via Frontend
 Transport; Wed, 11 Dec 2019 11:01:44 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 11:01:44 +0000
Received: ("Tessian outbound 64ac59f2ee79:v37");
 Wed, 11 Dec 2019 11:01:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 036864db5ce9b4ec
X-CR-MTA-TID: 64aa7808
Received: from 90db28842b0f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75D1E7F5-1143-4087-B51A-8127CD8D0A5E.1; 
 Wed, 11 Dec 2019 11:01:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90db28842b0f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Dec 2019 11:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRw+OBAXN57y87REFW5S0F/vQKEi7rpzXNHdg9mQW9xJuOKETHYPLSBXOyMjIjkE7JBT8eKnwbqvOULfZClZ2GlG39r/U16eFIJiYVLGUYMrrI+QtXCWJ8WLyUXZ8Qha09fzhMkmt+EMzCjM3kNw9D2xVmhJUbrQJlILfOB9xp4AYxStgHwidOnbmEU5SseC4IQnIFF93qnzcEu+8rm37/61tl/Ki8nbWJI6VVdPgSC6EeCz4ZHXvFiWWzch5UmTdt1KKPCh9/ROfJ+sgXWaBCVRfeuHL/uGckqUtoEb7hRJCIbpoS9vwxZgnbPURLby+bvrZO3//7KuTFK88+nkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkty0DsxKwRefsHlFoam+BfHuFRLTOzc+s2oWFzDDQU=;
 b=GbnY8MupJ9uzfJOyf6d4Jxbj9SWIsfgSKVibKKtZaaHs0j0XNsAPsBYK/9hwWt9l1dnIOdAb+WPpmPWTfzfCLoOVZzwvBy7bPaaNFY/t+L8CWkK4+hfdpB2p1Xs7TZuHDH1Lc797eIIB6yshh/CeXrx7C6gnsX71ZU7H3tpJeByKOgqF38CAcQj5ukBomQ1pNzWpYp0XFTAXXZ8WUi4okg1tOit7sJ2cKCqbEOiQIPWz513DeRC9fo1/rkhi2QkrB4pKHkucPWN+fJR/MGAtxFxXi17hOzhZxcFVk7o3r5SvPLrweb4aNOGH77Mpa2p9L38pGyI/n5BN6XiIn2V66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkty0DsxKwRefsHlFoam+BfHuFRLTOzc+s2oWFzDDQU=;
 b=Q2bJT1pxZCuPfKGoOmCSII4NsmUk/3dD1jtlA8gyvGjHvwCeWe4x8aFzd7zIDWkJ+p8h9EsgmSZ+JtunjTuOp5p9AiiPoOMVuzwYb+YplcLEmbkqgXXO1BG40/TYRUrH/roxR4eX4zJ0+RxI5MDfwdcBgoGdq080lxxoCwN7Xy4=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3901.eurprd08.prod.outlook.com (20.178.80.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Wed, 11 Dec 2019 11:01:35 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 11:01:35 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: remove drm_bridge->dev
Thread-Topic: [PATCH] drm: remove drm_bridge->dev
Thread-Index: AQHVr2wdDpJ+XhW2pkOR3j38qbFIV6e0jR2AgAAzWQA=
Date: Wed, 11 Dec 2019 11:01:35 +0000
Message-ID: <28707549.8gE6dfC23D@e123338-lin>
References: <20191205163028.19941-1-mihail.atanassov@arm.com>
 <20191210151111.21510-1-mihail.atanassov@arm.com>
 <d4415681-0734-1de9-05ad-3d1dbd65fbf1@suse.de>
In-Reply-To: <d4415681-0734-1de9-05ad-3d1dbd65fbf1@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0302.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::26) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 18d41fe9-ad86-40f2-0fb7-08d77e298298
X-MS-TrafficTypeDiagnostic: VI1PR08MB3901:|AM0PR08MB2996:
X-Microsoft-Antispam-PRVS: <AM0PR08MB29961F2878F44550F2C920C88F5A0@AM0PR08MB2996.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:293;OLM:293;
x-forefront-prvs: 024847EE92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(51914003)(189003)(199004)(9686003)(33716001)(52116002)(81166006)(6512007)(7416002)(26005)(8936002)(478600001)(81156014)(5660300002)(186003)(66946007)(66556008)(6506007)(66476007)(86362001)(66446008)(64756008)(54906003)(6916009)(2906002)(316002)(8676002)(71200400001)(6486002)(30864003)(4326008)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3901;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BG8g+YfUfxgMANxviouLWlJTS/qRXuhCxZk06qmpha9OzNIoYYzH6OD2pjQrvBxhapxtqb8Lxtnam/7qDgyxSfCW2jACoWdVugVebC6U6O0XcMydCYY/UDFWkSyNbY4oEB/mKjPBwdvvZ7CrOz4YFcy/elnJ8gAIcD6E+u0cwVX4pdrobe1Ms9Y0giHsaexTpdb0l0wcyAluxBxbDYvzzgqibToyzTPSVncPWJVF5JVSdMRAGgbLmCn8Q2OQrsc2Ejt+SSWg0Sp9Cvb+a/j83ecgVbH+kptc3eH+5EeskyVZ9U69wY0qu7zVhrfQUW9mTX9Nii7MKIBRxqx+4mP3slDdnREFiOsrqVLmXw1vRxZoUNwtlZD6ozrzQZzXY3xrIPaC452pjZhfXqYlt3YlP/uGIet6cYKoD8z4v/fYtFrxyf5/HmuhtWKwxznaMH8yI3/ymeEkzZwWp5GqGe2H/42eRdtpDPRCnzcWlDQrIzP1Zn4WbJDqg8HoevK46t6iFXI7nDhGvglw6aL8NswWY6p2kIKgRzFie+7iDDsur+M=
x-ms-exchange-transport-forked: True
Content-ID: <8007B0A18F9FA649BF83C23D28182E1F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3901
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(346002)(376002)(136003)(396003)(199004)(189003)(51914003)(6486002)(966005)(76130400001)(478600001)(336012)(6512007)(70586007)(6862004)(107886003)(450100002)(2906002)(9686003)(54906003)(8936002)(81166006)(81156014)(33716001)(4326008)(26826003)(30864003)(186003)(316002)(356004)(8676002)(70206006)(86362001)(26005)(6506007)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB2996;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 58c177e1-0650-42a4-3c66-08d77e297cf8
NoDisclaimer: True
X-Forefront-PRVS: 024847EE92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yqlPw/WrZ+A3b3fdGxw0oAauJWmcYU1YSzcfx1lxppPrkSjUvUfhQIHE5G4lzT8SwjDRAy1HyfPLli5US10FLgXlh8+oSrmvDoLFPlLnqka7qcSEzFQDlTmD6A3hozuKLigYwYfDc2lhQ9z19YI/Frg1ygOboUIs5wYN8SVUxOKgRwjM3RQ+OQRA5BoZEF7XimHNYatNmCIbYRbmz59HWdys2qxLZz5b36nYiVouqrLUG2R+J+F/IOZdhPAmo12Se+AnDUt3eA+J58flMGETMCZPB5k4m2jBDsqRF0+qn81G3oXT612w3g4pljFUM01INrUnu+MTCH/TXrzIxhAFUtleCh1V0E30+3LtsnuKFaWopC7OWvGvhcVesZIeevtjZQhy6trI1JcVieNvEErrmZS1qgnF41VbjKoOwgEFmTrhpzBnsi6YyvRDv/xlwY0mOyqOlsNg+O3GnZ7Wd0KUYwKeZUURQR9xwxmkYbwhYAU9C79Ok4cClLsWE8238XU0St7shXkGqsj5NhOrk0Yx9kuOsuv9+1ZilOfocw23jlI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 11:01:44.5026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d41fe9-ad86-40f2-0fb7-08d77e298298
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2996
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
Cc: Sean Paul <sean@poorly.run>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, nd <nd@arm.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wednesday, 11 December 2019 07:38:29 GMT Thomas Zimmermann wrote:
> Hi
> 
> Am 10.12.19 um 16:11 schrieb Mihail Atanassov:
> > As suggested in [1], the 'dev' field is a bit repetitive, since it 1:1
> > follows the setting and NULLing of the 'encoder' field. Therefore, use
> > drm_bridge->encoder->dev in place of drm_bridge->dev.
> > 
> > [1] https://patchwork.freedesktop.org/patch/343824/
> > 
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> 
> Do you need help with merging the patch?

I've push rights to drm-misc-next, I'll handle it Soon(tm)/today. Thanks for
the offer, though :).

> 
> Best regards
> Thomas
> 
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c           |  2 +-
> >  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c     |  2 +-
> >  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c     |  2 +-
> >  drivers/gpu/drm/bridge/cdns-dsi.c                      |  2 +-
> >  drivers/gpu/drm/bridge/dumb-vga-dac.c                  |  2 +-
> >  .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  2 +-
> >  drivers/gpu/drm/bridge/nxp-ptn3460.c                   |  2 +-
> >  drivers/gpu/drm/bridge/panel.c                         |  2 +-
> >  drivers/gpu/drm/bridge/parade-ps8622.c                 |  2 +-
> >  drivers/gpu/drm/bridge/sii902x.c                       |  6 +++---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c              |  6 +++---
> >  drivers/gpu/drm/bridge/tc358764.c                      |  4 ++--
> >  drivers/gpu/drm/bridge/tc358767.c                      |  6 +++---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c                  |  2 +-
> >  drivers/gpu/drm/bridge/ti-tfp410.c                     |  6 +++---
> >  drivers/gpu/drm/drm_bridge.c                           | 10 ++++------
> >  drivers/gpu/drm/i2c/tda998x_drv.c                      |  2 +-
> >  drivers/gpu/drm/mcde/mcde_dsi.c                        |  2 +-
> >  drivers/gpu/drm/msm/edp/edp_bridge.c                   |  2 +-
> >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c                 |  4 ++--
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c                    |  3 ++-
> >  include/drm/drm_bridge.h                               |  2 --
> >  22 files changed, 35 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > index 9e13e466e72c..009cf1fef8d4 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -863,7 +863,7 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge)
> >  		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
> >  				DRM_CONNECTOR_POLL_DISCONNECT;
> >  
> > -	ret = drm_connector_init(bridge->dev, &adv->connector,
> > +	ret = drm_connector_init(bridge->encoder->dev, &adv->connector,
> >  				 &adv7511_connector_funcs,
> >  				 DRM_MODE_CONNECTOR_HDMIA);
> >  	if (ret) {
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > index 9917ce0d86a0..5b806d23fcb3 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > @@ -541,7 +541,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge)
> >  		return err;
> >  	}
> >  
> > -	err = drm_connector_init(bridge->dev, &anx6345->connector,
> > +	err = drm_connector_init(bridge->encoder->dev, &anx6345->connector,
> >  				 &anx6345_connector_funcs,
> >  				 DRM_MODE_CONNECTOR_eDP);
> >  	if (err) {
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> > index 41867be03751..7463537950cb 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> > @@ -908,7 +908,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge)
> >  		return err;
> >  	}
> >  
> > -	err = drm_connector_init(bridge->dev, &anx78xx->connector,
> > +	err = drm_connector_init(bridge->encoder->dev, &anx78xx->connector,
> >  				 &anx78xx_connector_funcs,
> >  				 DRM_MODE_CONNECTOR_DisplayPort);
> >  	if (err) {
> > diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> > index 3a5bd4e7fd1e..32863e3ad537 100644
> > --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> > +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> > @@ -651,7 +651,7 @@ static int cdns_dsi_bridge_attach(struct drm_bridge *bridge)
> >  	struct cdns_dsi *dsi = input_to_dsi(input);
> >  	struct cdns_dsi_output *output = &dsi->output;
> >  
> > -	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
> > +	if (!drm_core_check_feature(bridge->encoder->dev, DRIVER_ATOMIC)) {
> >  		dev_err(dsi->base.dev,
> >  			"cdns-dsi driver is only compatible with DRM devices supporting atomic updates");
> >  		return -ENOTSUPP;
> > diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > index cc33dc411b9e..67ad6cecf68d 100644
> > --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > @@ -112,7 +112,7 @@ static int dumb_vga_attach(struct drm_bridge *bridge)
> >  
> >  	drm_connector_helper_add(&vga->connector,
> >  				 &dumb_vga_con_helper_funcs);
> > -	ret = drm_connector_init_with_ddc(bridge->dev, &vga->connector,
> > +	ret = drm_connector_init_with_ddc(bridge->encoder->dev, &vga->connector,
> >  					  &dumb_vga_con_funcs,
> >  					  DRM_MODE_CONNECTOR_VGA,
> >  					  vga->ddc);
> > diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > index e8a49f6146c6..c914f01e4707 100644
> > --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > @@ -223,7 +223,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge)
> >  	drm_connector_helper_add(connector,
> >  				 &ge_b850v3_lvds_connector_helper_funcs);
> >  
> > -	ret = drm_connector_init(bridge->dev, connector,
> > +	ret = drm_connector_init(bridge->encoder->dev, connector,
> >  				 &ge_b850v3_lvds_connector_funcs,
> >  				 DRM_MODE_CONNECTOR_DisplayPort);
> >  	if (ret) {
> > diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> > index 57ff01339559..3999bb864eb9 100644
> > --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> > +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> > @@ -247,7 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge)
> >  	}
> >  
> >  	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > -	ret = drm_connector_init(bridge->dev, &ptn_bridge->connector,
> > +	ret = drm_connector_init(bridge->encoder->dev, &ptn_bridge->connector,
> >  			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to initialize connector with drm\n");
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index f66777e24968..4ba4e9d9537a 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -67,7 +67,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge)
> >  	drm_connector_helper_add(connector,
> >  				 &panel_bridge_connector_helper_funcs);
> >  
> > -	ret = drm_connector_init(bridge->dev, connector,
> > +	ret = drm_connector_init(bridge->encoder->dev, connector,
> >  				 &panel_bridge_connector_funcs,
> >  				 panel_bridge->connector_type);
> >  	if (ret) {
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> > index 10c47c008b40..c32af9c2bbcc 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> > @@ -487,7 +487,7 @@ static int ps8622_attach(struct drm_bridge *bridge)
> >  	}
> >  
> >  	ps8622->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > -	ret = drm_connector_init(bridge->dev, &ps8622->connector,
> > +	ret = drm_connector_init(bridge->encoder->dev, &ps8622->connector,
> >  			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to initialize connector with drm\n");
> > diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> > index b70e8c5cf2e1..6ca297d78a26 100644
> > --- a/drivers/gpu/drm/bridge/sii902x.c
> > +++ b/drivers/gpu/drm/bridge/sii902x.c
> > @@ -402,7 +402,7 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
> >  static int sii902x_bridge_attach(struct drm_bridge *bridge)
> >  {
> >  	struct sii902x *sii902x = bridge_to_sii902x(bridge);
> > -	struct drm_device *drm = bridge->dev;
> > +	struct drm_device *drm = bridge->encoder->dev;
> >  	int ret;
> >  
> >  	drm_connector_helper_add(&sii902x->connector,
> > @@ -820,8 +820,8 @@ static irqreturn_t sii902x_interrupt(int irq, void *data)
> >  
> >  	mutex_unlock(&sii902x->mutex);
> >  
> > -	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
> > -		drm_helper_hpd_irq_event(sii902x->bridge.dev);
> > +	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.encoder)
> > +		drm_helper_hpd_irq_event(sii902x->bridge.encoder->dev);
> >  
> >  	return IRQ_HANDLED;
> >  }
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index dbe38a54870b..99274ca0fdf6 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -2346,7 +2346,7 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
> >  
> >  	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
> >  
> > -	drm_connector_init_with_ddc(bridge->dev, connector,
> > +	drm_connector_init_with_ddc(bridge->encoder->dev, connector,
> >  				    &dw_hdmi_connector_funcs,
> >  				    DRM_MODE_CONNECTOR_HDMIA,
> >  				    hdmi->ddc);
> > @@ -2554,8 +2554,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
> >  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> >  		dev_dbg(hdmi->dev, "EVENT=%s\n",
> >  			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
> > -		if (hdmi->bridge.dev)
> > -			drm_helper_hpd_irq_event(hdmi->bridge.dev);
> > +		if (hdmi->bridge.encoder)
> > +			drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
> >  	}
> >  
> >  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> > diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> > index 96207fcfde19..e35e17b1f396 100644
> > --- a/drivers/gpu/drm/bridge/tc358764.c
> > +++ b/drivers/gpu/drm/bridge/tc358764.c
> > @@ -352,7 +352,7 @@ static void tc358764_enable(struct drm_bridge *bridge)
> >  static int tc358764_attach(struct drm_bridge *bridge)
> >  {
> >  	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> > -	struct drm_device *drm = bridge->dev;
> > +	struct drm_device *drm = bridge->encoder->dev;
> >  	int ret;
> >  
> >  	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > @@ -378,7 +378,7 @@ static int tc358764_attach(struct drm_bridge *bridge)
> >  static void tc358764_detach(struct drm_bridge *bridge)
> >  {
> >  	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> > -	struct drm_device *drm = bridge->dev;
> > +	struct drm_device *drm = bridge->encoder->dev;
> >  
> >  	drm_connector_unregister(&ctx->connector);
> >  	drm_fb_helper_remove_one_connector(drm->fb_helper, &ctx->connector);
> > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> > index 3709e5ace724..ab1524c00777 100644
> > --- a/drivers/gpu/drm/bridge/tc358767.c
> > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > @@ -1407,7 +1407,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge)
> >  {
> >  	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> >  	struct tc_data *tc = bridge_to_tc(bridge);
> > -	struct drm_device *drm = bridge->dev;
> > +	struct drm_device *drm = bridge->encoder->dev;
> >  	int ret;
> >  
> >  	/* Create DP/eDP connector */
> > @@ -1514,7 +1514,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
> >  		dev_err(tc->dev, "syserr %x\n", stat);
> >  	}
> >  
> > -	if (tc->hpd_pin >= 0 && tc->bridge.dev) {
> > +	if (tc->hpd_pin >= 0 && tc->bridge.encoder) {
> >  		/*
> >  		 * H is triggered when the GPIO goes high.
> >  		 *
> > @@ -1528,7 +1528,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
> >  			h ? "H" : "", lc ? "LC" : "");
> >  
> >  		if (h || lc)
> > -			drm_kms_helper_hotplug_event(tc->bridge.dev);
> > +			drm_kms_helper_hotplug_event(tc->bridge.encoder->dev);
> >  	}
> >  
> >  	regmap_write(tc->regmap, INTSTS_G, val);
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 9a2dd986afa5..8a4e64cfca1e 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -275,7 +275,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
> >  						   .node = NULL,
> >  						 };
> >  
> > -	ret = drm_connector_init(bridge->dev, &pdata->connector,
> > +	ret = drm_connector_init(bridge->encoder->dev, &pdata->connector,
> >  				 &ti_sn_bridge_connector_funcs,
> >  				 DRM_MODE_CONNECTOR_eDP);
> >  	if (ret) {
> > diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> > index aa3198dc9903..76229367e2f4 100644
> > --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> > +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> > @@ -135,7 +135,7 @@ static int tfp410_attach(struct drm_bridge *bridge)
> >  
> >  	drm_connector_helper_add(&dvi->connector,
> >  				 &tfp410_con_helper_funcs);
> > -	ret = drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
> > +	ret = drm_connector_init_with_ddc(bridge->encoder->dev, &dvi->connector,
> >  					  &tfp410_con_funcs,
> >  					  dvi->connector_type,
> >  					  dvi->ddc);
> > @@ -179,8 +179,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
> >  
> >  	dvi = container_of(work, struct tfp410, hpd_work.work);
> >  
> > -	if (dvi->bridge.dev)
> > -		drm_helper_hpd_irq_event(dvi->bridge.dev);
> > +	if (dvi->bridge.encoder)
> > +		drm_helper_hpd_irq_event(dvi->bridge.encoder->dev);
> >  }
> >  
> >  static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index c2cf0c90fa26..eaa20804b038 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -119,13 +119,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
> >  	if (!encoder || !bridge)
> >  		return -EINVAL;
> >  
> > -	if (previous && (!previous->dev || previous->encoder != encoder))
> > +	if (previous && (previous->encoder != encoder))
> >  		return -EINVAL;
> >  
> > -	if (bridge->dev)
> > +	if (bridge->encoder)
> >  		return -EBUSY;
> >  
> > -	bridge->dev = encoder->dev;
> >  	bridge->encoder = encoder;
> >  
> >  	if (previous)
> > @@ -137,7 +136,6 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
> >  		ret = bridge->funcs->attach(bridge);
> >  		if (ret < 0) {
> >  			list_del(&bridge->chain_node);
> > -			bridge->dev = NULL;
> >  			bridge->encoder = NULL;
> >  			return ret;
> >  		}
> > @@ -152,14 +150,14 @@ void drm_bridge_detach(struct drm_bridge *bridge)
> >  	if (WARN_ON(!bridge))
> >  		return;
> >  
> > -	if (WARN_ON(!bridge->dev))
> > +	if (WARN_ON(!bridge->encoder))
> >  		return;
> >  
> >  	if (bridge->funcs->detach)
> >  		bridge->funcs->detach(bridge);
> >  
> >  	list_del(&bridge->chain_node);
> > -	bridge->dev = NULL;
> > +	bridge->encoder = NULL;
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> > index a63790d32d75..17a66ef3dfd4 100644
> > --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> > +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> > @@ -1360,7 +1360,7 @@ static int tda998x_bridge_attach(struct drm_bridge *bridge)
> >  {
> >  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
> >  
> > -	return tda998x_connector_init(priv, bridge->dev);
> > +	return tda998x_connector_init(priv, bridge->encoder->dev);
> >  }
> >  
> >  static void tda998x_bridge_detach(struct drm_bridge *bridge)
> > diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> > index 42fff811653e..c08d7ede9fb8 100644
> > --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> > +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> > @@ -846,7 +846,7 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
> >  static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
> >  {
> >  	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
> > -	struct drm_device *drm = bridge->dev;
> > +	struct drm_device *drm = bridge->encoder->dev;
> >  	int ret;
> >  
> >  	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
> > diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp/edp_bridge.c
> > index b65b5cc2dba2..301dd7a80bde 100644
> > --- a/drivers/gpu/drm/msm/edp/edp_bridge.c
> > +++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
> > @@ -47,7 +47,7 @@ static void edp_bridge_mode_set(struct drm_bridge *bridge,
> >  		const struct drm_display_mode *mode,
> >  		const struct drm_display_mode *adjusted_mode)
> >  {
> > -	struct drm_device *dev = bridge->dev;
> > +	struct drm_device *dev = bridge->encoder->dev;
> >  	struct drm_connector *connector;
> >  	struct edp_bridge *edp_bridge = to_edp_bridge(bridge);
> >  	struct msm_edp *edp = edp_bridge->edp;
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index ba81338a9bf8..07c098dce310 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -20,7 +20,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
> >  
> >  static void msm_hdmi_power_on(struct drm_bridge *bridge)
> >  {
> > -	struct drm_device *dev = bridge->dev;
> > +	struct drm_device *dev = bridge->encoder->dev;
> >  	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >  	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >  	const struct hdmi_platform_config *config = hdmi->config;
> > @@ -56,7 +56,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
> >  
> >  static void power_off(struct drm_bridge *bridge)
> >  {
> > -	struct drm_device *dev = bridge->dev;
> > +	struct drm_device *dev = bridge->encoder->dev;
> >  	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >  	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >  	const struct hdmi_platform_config *config = hdmi->config;
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index 2cf44b91853c..83538125a722 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -622,7 +622,8 @@ static int rcar_lvds_attach(struct drm_bridge *bridge)
> >  	if (!lvds->panel)
> >  		return 0;
> >  
> > -	ret = drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_funcs,
> > +	ret = drm_connector_init(bridge->encoder->dev, connector,
> > +				 &rcar_lvds_conn_funcs,
> >  				 DRM_MODE_CONNECTOR_LVDS);
> >  	if (ret < 0)
> >  		return ret;
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 694e153a7531..695d0898df38 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -380,8 +380,6 @@ struct drm_bridge_timings {
> >   * struct drm_bridge - central DRM bridge control structure
> >   */
> >  struct drm_bridge {
> > -	/** @dev: DRM device this bridge belongs to */
> > -	struct drm_device *dev;
> >  	/** @encoder: encoder to which this bridge is connected */
> >  	struct drm_encoder *encoder;
> >  	/** @chain_node: used to form a bridge chain */
> > 
> 
> 


-- 
Mihail



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
