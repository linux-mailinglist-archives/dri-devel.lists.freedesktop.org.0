Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83624AF9B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6366E8A9;
	Thu, 20 Aug 2020 07:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680126.outbound.protection.outlook.com [40.107.68.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAF76E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 07:05:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoyRhYyUCyeMmkcC14PV+OrSB2k09aAjPwCovhENep/gXDvmwXiloDxn4KC4I7ybaUpXLPbDzpWSPkzznCNqu6UCuh2H/A8UMI0Yl9QdnT7kqxKTIajD9V17CUOLHbS08zvhx2G3CF2MQuLg6IsE4KZUSVJXy9hGWnDUpzKDE5WHRkD0AkuC21+Bx9RzAPsSY6DNhkaJA4p8Rc5cwOCp0SUxR+2TGVfPc2fbfGK0zuJzvqOhPbjlTXL9X0KpQVOomHS5wY0p7GKLqINuBLu5R53XJXzBVxHWKkbKKJkOQTJ9NMiuZiBBWAq3ih/gqR7oRuzXdJdhWkmVq+s6CpJnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYWTiegyVIRDwQDyKiMoHHLE7nzFGm2qXIdWmFcvSs8=;
 b=m8VvMPSmec9k4GAvh+0PBUQKRaPxBQtD4J9mE+qfN3qvfl6elBaMMpx/EZPwo3SLhp89spHfzQX+E4NBusyQf3C60o82jpw6msnWedLqVuVIR4PUK3ZDkdMDQ9J+mwcre5AuOU96FVIU4mAaayP4/OzNc5UwHWAdrlwpgidVlPLly5yPcRE0L8pwLbAcT/jfSgpnYpW/cwNlOJNODcOS8eZK3AwhCOxYhg4C3qj15TiTeSFw6hJDJJMA0oglL+GDO+tQF39LjxMFO/Sqt+cgRi7iaxJwfZxWwkisZgYpclAs6GDT82gbMcYUnn7SyPdLF+ijZDTUJ09o1y73ySwAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYWTiegyVIRDwQDyKiMoHHLE7nzFGm2qXIdWmFcvSs8=;
 b=Cq4Szb2bqsMjleUqqAKm6imQ723CVTc7U6xj+g6aFgbM7UMi3mwmaaGBDZatPucb0j6QAXwTk1yfdKlIDnaMutuIzMMkSfzpQj0uWzhADuqODGbfubbRLywWrs4bRMaHjdaMg5931/xrq1p7m6U61P9eITaxTPO8aHYV3lIkEPg=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6868.namprd04.prod.outlook.com (2603:10b6:a03:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 07:05:23 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6845:5e8c:51b:db77]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6845:5e8c:51b:db77%9]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 07:05:23 +0000
Date: Wed, 19 Aug 2020 15:05:13 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Fwd: [PATCH v14 0/2] Add initial support for slimport anx7625
Message-ID: <20200819070513.GA8965@xin-VirtualBox>
References: <cover.1594283160.git.xji@analogixsemi.com>
 <20200810203546.GA421906@ravnborg.org>
 <CAJMQK-h1BLDS_-q9n9vuOyYimqG7qonGsy7f5w8M=A_pffxHBQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAJMQK-h1BLDS_-q9n9vuOyYimqG7qonGsy7f5w8M=A_pffxHBQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK0PR01CA0069.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::33) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 07:05:22 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d18fd61c-6242-49fd-65ed-08d8440e3d8e
X-MS-TrafficTypeDiagnostic: BY5PR04MB6868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6868E8A1EE4C975A9FD00581C75D0@BY5PR04MB6868.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: unLxwYZaQXl1D46mBVpQwtBQ2Pn7FHaFnQ4N8CrVYjZFbVmjDi5KZVmibIgxm4dvwi9TjF+dpRX1Zs+l30m5BLsZUnKsiaHbQoHAg/GrEytPTmr3aFs0KxRdGOJKNAyhE0HQwLLQdq/Jorix6fd2Hzhx9A7mfs6oFEnF9Ser02BaAQ/lL5dMg1Y1xaGYMXjAvJFEBAz8+L5UdWoqH0oHe51IF7i9nnz59v9NZCIe9xDNrMcIQ7ENhLjYLZv4CGuTFPbqAuhyhKMmqPpaKMk7dHR3XydOht6bD+snZwUkyEdsKVOUPrfC82fmd+7EKQQLuWd9WTSSnsH4kHAlowPJ1tKmg8AODf/DJ6aKcyRrY4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39840400004)(376002)(136003)(396003)(366004)(52116002)(110136005)(55016002)(6666004)(316002)(66556008)(66476007)(26005)(16526019)(8676002)(9686003)(478600001)(966005)(2906002)(83380400001)(5660300002)(33656002)(107886003)(956004)(186003)(33716001)(86362001)(4326008)(54906003)(7416002)(8936002)(53546011)(66946007)(6496006)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: au6w/B4atshzW0B/LosvhSQlv9a3xUujrm9riOyvju7bQp7JKYXpnAa7X4eCod6LeC45Vx0GCll9HqVW3MEFkMyUYbwrWEHH1qqsgYe7msYtMBHUJeDw/fcF5qrIqQnNOdFvXo2/DK33kLi9wqtB/LMbgRNHIoYyk5ijRkU2oepzYAY726g4NuSmvgUttcGQ8+qRJ51Itk3j4Y4wBxvfqWrwMREZjFvekyhdolabjGq3bIF7dlQo5ev10EkiF+ZK/uhqxhrFkbUsQLJO4MuY6QjItDuphG1wo/KY3/bRUinBJkmyhxqW7PUtjrNQB1cc5bDH5lnE7yVHWdmIUtZNKUomRTAoUVfouppTxYlt9aEvKZuD6eLQdVIjs426qg3cKYcAPmyeVvp6VzUeE46j2LjR7WT1UUmyBWyyG9cBKeWu7xPxn4Iq4lcfbRgkMlMLQ6KXWNZoQqA9ZVP4f/mcrdmLEOp5mT4A1CU++hNa7NLdjtLA8IQFZ6lPhaEdygDpPtJJcaSW/oyJbE4J1qc2Bsm8J3dH92+h/6zBaLEjAhMBci0opz1JTjoiwlDJXJuHy2ACcQe+7XJtrFnar3EEKrWUJVecew0/qOl+GCq+Z813qDJhi+6iaMUkLcA4193anVAobPch58Spg+trmfi+hw==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18fd61c-6242-49fd-65ed-08d8440e3d8e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 07:05:22.9084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSiqR3UVSaDfKtcXpluY1tynDH9NNm+HooHn4suLu7Qvs1S1oYEMwv+Noe4yesJoeIXApg2bFbSqHtRh9+0alw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6868
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
 Hsin-Yi Wang <hsinyi@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 02:57:14PM +0800, Hsin-Yi Wang wrote:
> I think you missed this email :)
> 
> ---------- Forwarded message ---------
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Tue, Aug 11, 2020 at 4:35 AM
> Subject: Re: [PATCH v14 0/2] Add initial support for slimport anx7625
> To: Xin Ji <xji@analogixsemi.com>
> Cc: <devel@driverdev.osuosl.org>, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
> <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>, Jernej
> Skrabec <jernej.skrabec@siol.net>, Nicolas Boichat
> <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>, Jonas
> Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>, Neil
> Armstrong <narmstrong@baylibre.com>, <linux-kernel@vger.kernel.org>,
> <dri-devel@lists.freedesktop.org>, Sheng Pan <span@analogixsemi.com>,
> Hsin-Yi Wang <hsinyi@chromium.org>, Dan Carpenter
> <dan.carpenter@oracle.com>
> 
Hi Sam, I missed this email.
> 
> Hi Xin Ji.
> 
> On Thu, Jul 09, 2020 at 04:31:09PM +0800, Xin Ji wrote:
> > Hi all,
> >
> > The following series add support for the Slimport ANX7625 transmitter, a
> > ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.
> >
> >
> > This is the v14 version, any mistakes, please let me know, I will fix it in
> > the next series.
> >
> > Change history:
> > v14: Fix comments from Sam and Nicolas
> >  - Check flags at drm_bridge_attach
> >  - Use panel_bridge instead of drm_panel
> >  - Fix not correct return value
> 
> Sorry for ignoring this for so long time.
> The patch applies but no longer builds.
> 
> I could fix it locally but wanted to know if you have a later version to
> be applied?
> 
>         Sam
Hi Sam, there is no new version patch. We have another patch for other
project, so we will upstream new patch after this patch has been merged.

Thanks,
Xin

> 
> 
> >
> > v13: Fix comments from Launrent Pinchart and Rob Herring
> >  - Picked up Rob's Reviewed-By
> >  - Add .detect and .get_edid interface in bridge funcs.
> >
> > v12: Fix comments from Hsin-Yi Wang
> >  - Rebase the code on kernel 5.7, fix DRM interface not match issue.
> >
> > v11: Fix comments from Rob Herring
> >  - Update commit message.
> >  - Remove unused label.
> >
> > v10: Fix comments from Rob Herring, Daniel.
> >  - Fix dt_binding_check warning.
> >  - Update description.
> >
> > v9: Fix comments from Sam, Nicolas, Daniel
> >  - Remove extcon interface.
> >  - Remove DPI support.
> >  - Fix dt_binding_check complains.
> >  - Code clean up and update description.
> >
> > v8: Fix comments from Nicolas.
> >  - Fix several coding format.
> >  - Update description.
> >
> > v7:
> >  - Fix critical timing(eg:odd hfp/hbp) in "mode_fixup" interface,
> >    enhance MIPI RX tolerance by setting register MIPI_DIGITAL_ADJ_1 to 0x3D.
> >
> >
> > Xin Ji (2):
> >   dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter DT schema
> >   drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP
> >
> >  .../bindings/display/bridge/analogix,anx7625.yaml  |   95 +
> >  drivers/gpu/drm/bridge/analogix/Kconfig            |    9 +
> >  drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
> >  drivers/gpu/drm/bridge/analogix/anx7625.c          | 1939 ++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h          |  391 ++++
> >  5 files changed, 2435 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
> >
> > --
> > 2.7.4
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
