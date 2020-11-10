Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE9D2AD103
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B4A898F5;
	Tue, 10 Nov 2020 08:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78259897B4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 02:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu7D8qGAwXPzTlt/RR4kkM+Hai8xcYCP9XT2VDE49nvfzYtJPvutjmXZ8SKSyj93hsYTJoDuxFLb++r414VaA6GqGHKlSDYeDnS6S+amRMqgaYpMkaWt/mxw+wsqE9MpewpisW/4AC99SggUL3z1iwjFGzgLS2FdpJs9O0DcEGVKnU0/zCX3WwV9iip0ltWRmD82G2wjtbr9kl2/XuTX8d9ej+AZtKCw0Z0j+eq6l1Rqw13eu/hLEASoSiNXp5vClU216P+PYlPTNtwW9gXfa9wzQX6cuAZi6odly671lOJcv+IQI3uteyRJ4NnHxLh9i1fgcxpkwM62R/UuOdtkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt9AMqPIGq1swt96ZM9OK+RWovewHaTKGZxV977UJVU=;
 b=T1FgcGya+RPpk3e4vNG87J5mwVVPzPS1/zRf16TZ/qneKoxjqOcqXVfQuQ2S98VbxJ7gGjVpnLVuK1VxUSFxH1lp0nct0eAkjpymFD1MziAUiDKRwyE3Kkw72QEV6lSfXoEdVASPNKytgjKZVk9sFLeWq45g4O+d/0xVI6UHt5WbWgVFXZOWNiwMfTZxEI78tPd3FrHtqshFAQsMmsQ7hGiZJlOmLjAj43heAF0+o0nXSHa3SPeJm5om7LdKTIFnpPHvtlkNX0bUPl+06k/LAw58CQpTUlIWjmDNDOqAZeSXye6tJ/GGzwR9aIf+cUwHTHM622NLP4ujgbziLrvUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt9AMqPIGq1swt96ZM9OK+RWovewHaTKGZxV977UJVU=;
 b=nowcpp5mxBbn+PXqweVnicT8jBUqRnXhHPDhTGsSZzho43WuQeV605Vt6UCjnX7M6veh645xMeiHCN6r1rcK1cLB8seIUzN72OH+Nhj683414acRgbqs2o2cSwljF5r09iacqJpfqoZzuB8dD2cW8HR5wfeCxwWFnmIiJliCAS0=
Authentication-Results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB3133.eurprd04.prod.outlook.com (2603:10a6:802:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 10 Nov
 2020 02:39:11 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::e171:19c1:b07f:53db]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::e171:19c1:b07f:53db%7]) with mapi id 15.20.3499.032; Tue, 10 Nov 2020
 02:39:11 +0000
Message-ID: <9a187307aa4f39c44a117f2b99a7f7fd4817e129.camel@nxp.com>
Subject: Re: [PATCH] dt-bindings: display: panel-simple: Allow optional
 'ports' property
From: Liu Ying <victor.liu@nxp.com>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Tue, 10 Nov 2020 10:37:27 +0800
In-Reply-To: <20201104104735.GA1581328@ravnborg.org>
References: <1604477017-17642-1-git-send-email-victor.liu@nxp.com>
 <20201104104735.GA1581328@ravnborg.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR02CA0113.apcprd02.prod.outlook.com (2603:1096:4:92::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 02:39:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eb1ff922-57f8-4297-a093-08d88521cdf2
X-MS-TrafficTypeDiagnostic: VI1PR04MB3133:
X-Microsoft-Antispam-PRVS: <VI1PR04MB313350DA6EA0CA481560894B98E90@VI1PR04MB3133.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDubA98j2OY2kvYFa7UqX8scUJ3L7HnlxCHndawfdE0Ol5pHJRPTbhKwfWOeYbaDMLsn3O+3/tCDz+f6taTlon1zRzaV4MXRvM+e4NDK2bgb11a4eKyBFpxd+iMMfmgu+ydzmG77j1/qWRyH9PQNuAUsR65fhqiE/tx/YjpYZuQo8H8f+lv+CN9eML0kUR7nTfWnmvOlEf6exG3NaQnjvF2dSkrQhmGqwV3F+mdGE0sbC4T1enYdhnU5g9KXcBM4Vgrf4UQAcp34zdbobhTIp6y2Y6i1PIjQgp8ql2fYUEPVmjOQRtAAtH/Ze9P5bGSYz8h8wjRmBg0HmuRNwjZiXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(66476007)(26005)(66556008)(6916009)(16526019)(83380400001)(36756003)(186003)(2616005)(8676002)(86362001)(956004)(66946007)(5660300002)(6486002)(316002)(52116002)(6506007)(8936002)(2906002)(478600001)(6512007)(54906003)(4326008)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qM5I6Ss4wYmbMbtpn8h/Gyp67rmz7gTpHzEihyaIV5Era9fbFjJPMaPucWMWn526mCFTFji5/LZ0cXF/cBSBfCexrWuI+j+/4Nq+lVK5qJydxMtBGADfQvVvFYOvVQxLioL12uM1D0QsM6Z58ExGBkbIPsQ34Nv+mkyv9mbD4r+61oP1ThD7TO/FHXJrKouo7cKk600qTG9SjDtONG3kn27pNDvwqLa6RUqdqzZLyscbQB/8+W3BZP9trGUpo/3C9eQ83v0JeVg5ZOMPaG9pb5p5/5BHjZ198Iaaj43rvA7UXwsyd+fvmBTQr7L8l7lAaNW4xmu2Y7aySFtFZmBGj71jmCrZ8dNtMncbr2AcZuX8FDHU8yc78iXYdh/5BJ7brSUQskmWT0B3UgqlRQtvNF6b+n6ArW1mLOr0/Mz5DqmBiekOXnP4X7b/l0sAe+daOiqZHXuVWP4pOPO3C1sWkOPjHoWjNH1yR0i9RDl1xqruXOqNNBQCXkq7pb2MYnfb8Ll+8O4L0FozvPUBHNHrFYwBkU/XG6c8qEEgJDisRDKNejDKpWP6DvNo8+Gxc369100f/QaY/osvAM/eLI3Lo6xEU5544ZHkncIIutq1NfmEswUu6sRfB1vG3jPv8VlzGf3yglHPOu8x6RyIRlyG/Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1ff922-57f8-4297-a093-08d88521cdf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 02:39:11.7275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2Qjn36MjrjjYTidDy/WbLzudKG2v6+WLpGvR+iy8YRZnfPSBg9vviwilYIL/t+pTY9A8t8Pd1uXYxg015U+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3133
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Wed, 2020-11-04 at 11:47 +0100, Sam Ravnborg wrote:
> Hi Liu Ying
> 
> On Wed, Nov 04, 2020 at 04:03:37PM +0800, Liu Ying wrote:
> > Some simple panels have dual LVDS interfaces which receive even and
> > odd
> > pixels respectively, like 'nlt,nl192108ac18-02d' and
> > 'koe,tx26d202vm0bwa'.
> > So, let's allow optional 'ports' property so that pixel order can
> > be got
> > via drm_of_lvds_get_dual_link_pixel_order() if it's child nodes 
> > 'port@0'
> > and 'port@1' contain 'dual-lvds-even-pixels' and 'dual-lvds-odd-
> > pixels'
> > properties respectively.
> 
> A panel with dual LVDS interfaces is no longer in the "simple"
> category.
> The panel-simple binding shall be limited to the simple pnales only.
> 
> This is also why we have for example panel-simple-dsi binding.
> 
> Please consider either a binding dedicated for the dual port displays
> or

Thanks for your review.

Does a new 'panel-simple-lvds-dual-ports.yaml' binding look ok?
I assume it would inherit all properties of panel-simple.yaml and all
existing compatibles of LVDS panels with dual ports in
panel-simple.yaml can be moved to it.

> a dedicated binding for the specific panel.
> 
> I trust that if other readers of this mail disagrees with this
> recommendation that they will speak up.
> 
> 	Sam
> 
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index f9750b0..5ccb22b 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > @@ -288,6 +288,7 @@ properties:
> >    backlight: true
> >    enable-gpios: true
> >    port: true
> > +  ports: true
> >    power-supply: true
> >  
> >  additionalProperties: false
> > -- 
> > 2.7.4
-- 
 Liu Ying

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
