Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081954FA2C3
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 06:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E539010E289;
	Sat,  9 Apr 2022 04:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2121.outbound.protection.outlook.com [40.107.244.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E5B10E289
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 04:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2rACTW8fyIl6B5/gMuNg9SqJbXUpF9ZQ5ZCEIv6ueKQqdflVOLfOgAgiICdoO4J/87V97vKVupo9kpvCZeaNpPE9saGmkaUyOMwI86iZBi7Iaz/YHtATMekHeBxtYUVIAIA8WOXvANd74VFkOrztVeNv92NJtzQ+21YQLOz9x0uujqf9yX7GwrIETp3qlxO4ZCfzmGNSa1MLSsoneZ2hkHgt7DSUbYUgNqdj9rnz7EFcP1AJSCrX5VnQk14IkCbKK7aiuYvSi5gGjsMn5OaGtyYKDlvNYq+4Iq8/zllIiFu5cdNXuvoh6v65Tc/Ckw9DZ1gbDe0QN++aGUEN476AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu//EBPRbY2ybck6eotzkM0S0J2CYaop+QtmEzEG4lc=;
 b=N3ZOMYqE6gfsY1EFVEZ/cup7npNrFnN5Cxuip8XmMrMC2iDTZoB7QS2CaSUTeDGA7GfNgdnplGG66sDyEMUXNtgqbqtBAxxnkUHMsnrvBT4G8hOWeIVdZzjnGQQ3GgdckToJl613fl20gC8N6lxmRBouC0rgmYqU5eCqisYmc8x+VmMMNrfYgd/p0fk8vkwdJfiQpxaAusHjcWvTV849oy72ezRHjzTcbpryyeeqObP4jzKK3p3XOCsovZm6ZrdZxbbYw+pspotVcaUQriECWYx9WE3nX0QJdbC3y+KqEeHFFPH7hGVTHzwNnoAQybRE7TO/FI4UiEGRjpPGy16bxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu//EBPRbY2ybck6eotzkM0S0J2CYaop+QtmEzEG4lc=;
 b=D4VIkyoDyG769uyzsb1EokN+/REGxUfmuKXpPmNKuCWotPwgEbQw8GMCznwpYq3i4yTWdhdaEvfm1YQw8RVwhHICNQt7b8Pf1slXvUY7iHOfWvlWhVzH0TTwPf3x/KXAhHjkF/s9dwN6AAVXJLdmqOW5zcUedbfbDm3buTADi5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SN6PR04MB4685.namprd04.prod.outlook.com (2603:10b6:805:b1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Sat, 9 Apr
 2022 04:47:48 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4ce0:7cd5:e703:3444]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4ce0:7cd5:e703:3444%4]) with mapi id 15.20.5144.026; Sat, 9 Apr 2022
 04:47:48 +0000
Date: Sat, 9 Apr 2022 12:47:40 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: drm/bridge: anx7625: Change bus-type to
 7 (DPI)
Message-ID: <20220409044740.GA595530@anxtwsw-Precision-3640-Tower>
References: <20220328120956.1848795-1-xji@analogixsemi.com>
 <20220328120956.1848795-3-xji@analogixsemi.com>
 <YkswTpDiPYfdIFtE@robh.at.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkswTpDiPYfdIFtE@robh.at.kernel.org>
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88152bc8-2106-401e-b6d5-08da19e41837
X-MS-TrafficTypeDiagnostic: SN6PR04MB4685:EE_
X-Microsoft-Antispam-PRVS: <SN6PR04MB46854216095C78759F4635FEC7E89@SN6PR04MB4685.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ydzcOSI5FQPPCy4gSuASx5Q3BtfJTHqVCDccWpBn5WhIrS3EBXc7VtHYrtM9vyzdNF+Kg8zpZ/WqfMs8pG9SH5G68ZtyeVL5uQ1W7JAwTfOxZuzcKNya+uKuwCh5dJMa2tWT9e5YeLCXfWiSEDHa+s3imdr4WFYxBlg4NZlpZ33mOpDTy6rEwCzs38xnfJBW5T5M+h5J4FH3MIb76dadV8931MPdL0Gi2FJP0b2PrOksLfPUU72jVnJcuiuJplY+NeKZBmgE7JnQO0VGibF+bMgEkQOp3d+3tVG3Q9B+scZrhCVYKF66uFcoEBQv2nPUvgipzsdSyB81JxGUtCD3WUUz8m0VNIqAgFnTGASwaYkHeBkaj3xGvxYhxyGPU3T1+aYSMdZ58KrMR76cSqgzGJDTOMOghs6YHnyftJPHZWlv6bhzYMU752bnbif4wAUuOkuFl9JGN8BiIN7zq+rDL2MuEfgw8a6PWI7uWtZsOIpv8EyIM3VrA6WbbE8hFNQmfCzsL57Wclsa4PEF5wEq/Q+WdflwA01gvCIs1wDP0Qge6BtynVWc2yCaw0JavktmVWCXGQb48uNiVDut/RVzMRNva7ZltSAZAMSYrPNziEpAEm0M0hMBvVakR+IZ6T3k4vML0GWXA/q99AAYPiHMWeCx2LoPmURFQrX+kbTk66BaqOtU4HsRKa8Pd8sStVodM1RUZN9C0wHfOgeEejeMPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6506007)(33716001)(316002)(8676002)(66946007)(66476007)(66556008)(6666004)(4326008)(1076003)(33656002)(9686003)(6916009)(508600001)(83380400001)(6512007)(6486002)(966005)(54906003)(38100700002)(38350700002)(86362001)(2906002)(8936002)(55236004)(52116002)(7416002)(186003)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?01qlJTywqAphopUuZi8fIK/ZmVIW3Egvvm5ShSzNbRNT0wAqSVET++rSkG1R?=
 =?us-ascii?Q?ZLvQL/TzXtNP/kFOIyRprqWcStWCKEbkWomrLdR8pyeiaJ0vsK1rcizswXGw?=
 =?us-ascii?Q?dHC7XsHFcD1RatgqEVPRduo33tFwRNSMfe2YdG9b4OF7ye+Jkf/7XnYrkymL?=
 =?us-ascii?Q?NLQhlRvoLrvAn7KDhgrx1QWojt9Uv6qyhNTlI7IYMSMJCkra7v7KA33wsTxl?=
 =?us-ascii?Q?D6XJwSe8giZXTp/jkYRojB8llg3jdi/LanKuiVMRFKVscuoydM2FppGPExE8?=
 =?us-ascii?Q?iXxwCrBlPW76KixYZRODLjRHsMzBIybK/vy1iwIDIKlSpz4AYsAs4jKFjc53?=
 =?us-ascii?Q?+A6+N0iMIrsa3/kLoP+wwtEj6k2skHK2/0qChXD0hHm1XEkBxLbeZvcbiOpy?=
 =?us-ascii?Q?0fPvsEX5zqvax6GZtBT0yklqVN1sfV4G+BYBcoNKR26YpNXDkI8ZGn+k5/B5?=
 =?us-ascii?Q?W0t5LjdlJDRD6LDuR7yRwgOR24oSqoihlhOR2CwkNxD0pwQw7nENVbffOF4O?=
 =?us-ascii?Q?AGf6XqW88/liC6H0xEpSwSt2Xl2eyl897/0KCH57uG9RGKFF4tV6UD08HJYC?=
 =?us-ascii?Q?985MVjqxT0tRi/C3EUkjhwBcSQDKq7FxjxzQZ5PqFeJA8fquECYz/YKbsGrx?=
 =?us-ascii?Q?aNHavcI8RwQzpvoVYQ/do5M6u4umv3GXDLvA8ivfgtZDxos4WCMxqKXtg/XL?=
 =?us-ascii?Q?kRFTVOL0IbVekASHQUNaC8f+3LXdf7sTFwXN0Fz00fusdyAthYSsiTKLj00L?=
 =?us-ascii?Q?dJs9PJPBvfgZV98OmoS8kHVGVacNCvwlLkXXbLn1N3Zi5X2WDd6fka9l2FyI?=
 =?us-ascii?Q?UwIQ7M64QOslCZAmMxBvtOFgubNYhm7WbFN8op+KYOKy7LuyNayX47SERJt9?=
 =?us-ascii?Q?p+X/kvrTpGEWX9tZqQ52chiuxLmFEOMxwmV4teGhDVsTzXGTtLxJ2+IhZejm?=
 =?us-ascii?Q?EWdPW0Jf5TeVMpUrEtta7vaLBQGrXcRJXUp0TbNqOdSJage54B3qBpjzkMxb?=
 =?us-ascii?Q?od5wxsQ4jnSf4UfSXk32YX7qxuXl4RMfal2ofaDNjsBrFCekMfN5jCHExZ0S?=
 =?us-ascii?Q?zH+VlK8Wg30aHa/qvGHFmcbRtj/OMfYLFtRCL3ppCOzzJLmdKKuCOqp/qbPs?=
 =?us-ascii?Q?IvXvqKN8zegugwpJmlW7uDYqkffmQXo84qWB88CP84Iy/lhwkYkSB2VbIfUo?=
 =?us-ascii?Q?FX0qKQhAajYLIgtcOIflbHaA02uG38I77eibAPbtOohSkzbdcKsBIj/e1fWb?=
 =?us-ascii?Q?MrK/hH94fEwHDRvQSuedBP0WJx52yMPq09okY+RF2bg93rMcqHEsDBd44pDc?=
 =?us-ascii?Q?oltwCmnVYmCyIqQRNsgLfDHKiky0P6cN5dQM5cJGKBrBne+OrJZKsFTmFTPS?=
 =?us-ascii?Q?/nXzVG3l9UYsYxpya5Rb0n1Nkr4s9999910h7EgvkxwnNKEMKv7+FPV3iZmf?=
 =?us-ascii?Q?Xpoe/jH65RF9NAsaYiCbRGeUKBuR4r6DlslUpYgqxxSIAoednlfqnAvG8Kdt?=
 =?us-ascii?Q?NG0fpUujMjsJ4U2KRQNU0jMeqjOkDvRddbVe4KCRsJanY/GwhzN57gPcqAJI?=
 =?us-ascii?Q?D845lJgOgU3JO6Cwn5DGyF6mUbEN3F55+F6r0VqjOWSdKHjdx3jtS2y0wg2A?=
 =?us-ascii?Q?9n0DIUFOyFJyf/aSX1AfcWkNmWjbhBNJeys5n0b9cC1bZX+80hcgO2UQFc4y?=
 =?us-ascii?Q?uC1okn5kBJnWLH+3bTF7WI1plavs+iXN8l12kMh0WaKLaDTzAO5ZKU5O+UvX?=
 =?us-ascii?Q?A3WAFgblzw=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88152bc8-2106-401e-b6d5-08da19e41837
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2022 04:47:47.8232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2Y6ZOAxFOoW3We/e+YGgaRA44ZPJRxzZWgtlYfK6P+AtRMIHvkEY6Jmwapo9a8zchQ3OLcqwGJ8el38E4tYPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4685
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 04, 2022 at 12:52:14PM -0500, Rob Herring wrote:
> On Mon, Mar 28, 2022 at 08:09:54PM +0800, Xin Ji wrote:
> > Change bus-type define for DPI.
> > 
> > Fixes: a43661e7e819 ("dt-bindings:drm/bridge:anx7625:add vendor define")
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 0d38d6fe3983..4590186c4a0b 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -106,7 +106,7 @@ properties:
> >                remote-endpoint: true
> >  
> >                bus-type:
> > -                enum: [1, 5]
> > +                enum: [7]
> 
> Changing is an ABI break, but didn't we revert adding this?
Hi Rob, sorry, what do you mean about ABI break? Do I need remove this
patch in this serial? Or do I need revert patch
https://patchwork.freedesktop.org/patch/462331/, I don't know how to do
it.

Thanks,
Xin
> 
> >                  default: 1
> >  
> >                data-lanes: true
> > @@ -158,7 +158,7 @@ examples:
> >                      reg = <0>;
> >                      anx7625_in: endpoint {
> >                          remote-endpoint = <&mipi_dsi>;
> > -                        bus-type = <5>;
> > +                        bus-type = <7>;
> >                          data-lanes = <0 1 2 3>;
> >                      };
> >                  };
> > -- 
> > 2.25.1
> > 
> > 
