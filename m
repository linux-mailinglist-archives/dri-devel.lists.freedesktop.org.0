Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902FE48D0F7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 04:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2421E10EC52;
	Thu, 13 Jan 2022 03:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2130.outbound.protection.outlook.com [40.107.236.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CD410EC4E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 03:32:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCvmU3CwTwdOLW2vBAgBco6Xv92+Tn+fgOOx++iHByWL6qVoJYsYi6X0Xxnv7HgA+FFe99HomI4SSqh44en/JY2b6gvnMpinNNeWOATUBVHRcoMAUrxjFobF0TvuIhs16LqAG7F1Q6+wPYlpq75A8SO8fFSR1P+G2C192yHW8dAeL2euajGkCvFPCk0d04TCv067AHuVymqOV8I5DMAfESVHo0I6wP+DZsHAT9G7r6uMCYU4l65YhdorKmWJ0yTmEuLKZbire0EoC/1LakL33hFLGifUh3+jclCioGUltB8Jvl66KmYazAq1GxOR49vuHhKZm3XHoMdY8ll1tNM7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhWZH2QvxCGrA7vpOZWIYuPKPZ91OPw08QndXwdwckg=;
 b=mN1hZXEGcPCVX18Y5ORlficB+GyZS7EdwhjzYCJlnN9YCIM7UGyfc+4jFJuM6mMd8+ldBXCwniltd5SoI7LvUKqDW6QZ08M78sdRNb5GzfShZeoPy0M5LQuYZds4CM5Aj3G4aIMZKl3vn02s76bWHsyy2113XZq9U24P6O94tRViCjvQI8gQS9cmOjCimt2KwiR5HuCdg1gtPGfe1oSPXvhM0h9jPD6ZnNcz7rF0673De5HsMtmObvEbaqTIK94jqxzmWttFeuOcJgf7OdFJiUXY3/E7IQYmsXev3dPWaIet90GyaNLNO+QCwDQMBISNTDEGXtROEZ0IyqctJ8Ml8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhWZH2QvxCGrA7vpOZWIYuPKPZ91OPw08QndXwdwckg=;
 b=VT6jFPzpfu6lvoadg8HBrA/oVXxR3eX68c+UaBSlz90jzlsEqNAQtOKXz6vg4Bh1YdCayXDlJe+CUr2XDZvH5yhFrocaELA8ynlx9QLMBqxOgRVVDwv2amC8pM4F/QDDMYhJp4aDr5nEIijEcHApu0blVVSVy5YoH2EhD5+nDUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from DM6PR04MB6748.namprd04.prod.outlook.com (2603:10b6:5:247::8) by
 DM6PR04MB5706.namprd04.prod.outlook.com (2603:10b6:5:161::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Thu, 13 Jan 2022 03:32:33 +0000
Received: from DM6PR04MB6748.namprd04.prod.outlook.com
 ([fe80::7dd5:4725:ade2:d8f9]) by DM6PR04MB6748.namprd04.prod.outlook.com
 ([fe80::7dd5:4725:ade2:d8f9%3]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 03:32:33 +0000
Date: Thu, 13 Jan 2022 11:32:26 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: drm/bridge: anx7625: Add aux-bus node
Message-ID: <20220113033226.GB2478030@anxtwsw-Precision-3640-Tower>
References: <20220111112701.1064458-1-hsinyi@chromium.org>
 <20220111112701.1064458-3-hsinyi@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111112701.1064458-3-hsinyi@chromium.org>
X-ClientProxiedBy: HKAPR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:203:d0::11) To DM6PR04MB6748.namprd04.prod.outlook.com
 (2603:10b6:5:247::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d1e94e6-beee-4f7d-5591-08d9d645560d
X-MS-TrafficTypeDiagnostic: DM6PR04MB5706:EE_
X-Microsoft-Antispam-PRVS: <DM6PR04MB57068D2FDA163BCA6E8FDD48C7539@DM6PR04MB5706.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: auaZG7mttcJO05abfB41mfFBbybPxyHYYoxEB/eS/TbTYLB7ecFMPLPvi9ZcHDV0wiflibtWNvcNizj7lmSmspZkAk+XyfsAhh4ZScblLMKPvBd/OBVmRgU9F1YvY4CvM4wSfznMsFv9wXp/yFzQGsrUfy4awnW0+ExaELOb4NiYT2tyF8Og8dT5J2SP1Dji3j8qsZPgytue8wOPTw8Qvs+Sp0rI7U3abeeDSqOBFJoav6Yit4v+hyuxCHa87QnxgSxia4I4Anl9z1XbnnulCLHSwrPzhWInCr7l4han7sFIX+pd9PdNX8nq7+2E6/7gNwq6aNVnZr4eLnDzcUrbgO+kq5y3+qNYy2798LQ3s0r8TpcOwwppdBw6S4m4Z3+0rLyR8AmR43HhTNtezwcIYCH6rkAcUVRFkgeToJsrOsRMXUnASu6884sOyCvFduM+zVbeRbnQ1JCvlbJJoXeKlDhjA8V6OPnBGbI0QTlKPr3UvDP2dr4R7y/SAcY8IJH2SEotZ79arOJVWkBsuc/ISQA5vB66GX2goo0BmAyZgAB7gHrHxyeLqnrEoaeyfRLRoeCWe4LXq7t+CUkdIh+OxeEftBfDMKcwqvXZzL0OJogbTHjHXx+puCFkJq8EP5qhxn8p2nLzYrx1NBSousvEwV1jahJ2ltr2fWO7UvI9la9H3ONm9Gz8CH89I5qPT7+eh7yTv94c/tU/VOwA268kzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6748.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(1076003)(186003)(4326008)(8676002)(508600001)(33656002)(7416002)(86362001)(8936002)(55236004)(2906002)(6486002)(66556008)(5660300002)(66946007)(110136005)(6666004)(26005)(52116002)(38100700002)(38350700002)(33716001)(6512007)(9686003)(54906003)(316002)(6506007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q1FzugVauG1mbfhlcBLL5tqeXqSympDfgqfb4RvC+hfjstGwoU0tVybwwLCF?=
 =?us-ascii?Q?+72Z2sg1bhSfaKVjTVO/vUx2ZDluLIE21pUl9mMhd5Qoj6DQPNEyMyJO9T8Q?=
 =?us-ascii?Q?L/ettVKYSNRTxRwCX4W3hh3rLYqYKvHh6tmgw/BTHW/M1igBiWwrzERP9/7G?=
 =?us-ascii?Q?/5OVa8FJsogpVa8AlyiM1OOgdBSozTIMe0+gJbNbet3u+YVT3Xz/ffY4X9TW?=
 =?us-ascii?Q?qRXERoBdcTnetusHpzTZugmI+wdL3K6hMjMbMdl6ypaHnzx7SBZhGh0bbXaM?=
 =?us-ascii?Q?ibb3CHQQvvTk05J2wnsl6Q8Uq/QpBGaGWuykOERyuY9sv1WB22IsTQrvgDys?=
 =?us-ascii?Q?iseYGupHMqD53cZ5gaVVcouRHvrfU1WcHYtV7rm4ckMbQKUH0UTPNYKA9vTb?=
 =?us-ascii?Q?o75h0VEuGh5m5NsX2LJQulTVWODNM0JWJUxQ2GM+nC+NL3oFIsNYxK+HglCL?=
 =?us-ascii?Q?APTnPcij6fOXLu01FwpIyKlAKmg8BufQzWxpAynRo4HFhsWNsI5nn2rj1OBR?=
 =?us-ascii?Q?E/FwKl/OZjMYY6u9uWY6JYVTsozA/jZKkZU1DnIXeqHaHgH/BIbtQb3yTQr6?=
 =?us-ascii?Q?Eruj91XaC65MT97i8scrdhN869kXpCgkgkkHfUTrhhuDyT7buAEJW6wW2Q/j?=
 =?us-ascii?Q?wBL0u8422wG1oL3qGMomG/AXkocD2fylpdhXWSSzBPdrXHJEODhGdGQjWou0?=
 =?us-ascii?Q?OpsE3ZK9uuu8D6nvyclFXj3XSaaaBEYq7iNqgcW/XEeXC63tgfFVqtYgwPo5?=
 =?us-ascii?Q?oGdpiM0PltTAe4ftm+Bpu1jD3QGkV4uzH7NtucTCxSM16eu5u/PIKe8swIao?=
 =?us-ascii?Q?5U2BzBEPoI8KExJ8ybqHpiat84JQxhPVqNbYyUYKBnMD9bWRSrFZk4BEfNZv?=
 =?us-ascii?Q?wB8P9r8gUtNOwGm2Er/CZ3GT1fhaY/hr3QSXcp+vqXwB/SWqws91KkrbU9nJ?=
 =?us-ascii?Q?p3lumt/dj2/kg6mJmGWVniVaIziwVlsuUNkzXKk+GCaKiepLBPMQJz6GxCMc?=
 =?us-ascii?Q?L3JEwzCCyZ9k8tTU9EM3CkN/X18VMIb+Mlh9eQgzmEssNVTlYhfkqeyU+50B?=
 =?us-ascii?Q?bo/XKJt1yraO3oV3Mx2oOdGeBvfKO3ngvqPtY95bBPcexqTmpFtyuX03KU3W?=
 =?us-ascii?Q?jLEtroLbbGphOEB6FlY+CphAcUWRGNu+rqEWFy9uQWcGABWdPuJRRGQdxEY1?=
 =?us-ascii?Q?vgKeePMkN5kdcMCvxfxpGOpsDciQCCKD1j5zOXpMjUXEsNdowJusJsuZELSq?=
 =?us-ascii?Q?MX4+QiYqkgMYbpVzSWtwgpQc51xa0B4eLNw8nYsG6Fw5eoOdbPvf6s88yer7?=
 =?us-ascii?Q?QocC/C9vM6vUbdmq5wHwQFNphxuMWiDWC9sqR0PKrG50lnWWxn0uueWnbT4A?=
 =?us-ascii?Q?oRVFaBuoAAX6OCzkuGj9ePaqWKJzWhVOBe7mZTphjT2tbSavFzkutkuYq/rA?=
 =?us-ascii?Q?l13HoKjH7vw1cR+09VJNuHIfmH0run1x54s7B8FFiuOVl/OXAxlJmBF+TLCK?=
 =?us-ascii?Q?CjXgTGHpXvIm4MWibAvRWrXlce+2jMUHJAHJh0kD6c/jrYJ56O0FrErthGtG?=
 =?us-ascii?Q?x0LT+dXevDo4X8xLrMdTgZ10lTLwYRx0yymyIrcranHcA9Qt46FbcpXdiDzM?=
 =?us-ascii?Q?Mn9/VUktJquKJit5UybPqxs=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1e94e6-beee-4f7d-5591-08d9d645560d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6748.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 03:32:33.5374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9facUCFIvEVdarVKRXn576KV9QywxGTIxLrQPW2vfy5bHxmH80tNGaqo1KU07RoxJ+Pocm46kFjCxGPbNL96w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5706
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi, thanks for the patch! It's OK for me!
Reviewed-by: Xin Ji <xji@analogixsemi.com>

Thanks,
Xin

On Tue, Jan 11, 2022 at 07:27:01PM +0800, Hsin-Yi Wang wrote:
> List panel under aux-bus node if it's connected to anx7625's aux bus.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../display/bridge/analogix,anx7625.yaml        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 1d3e88daca041a..0d38d6fe39830f 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -83,6 +83,9 @@ properties:
>      type: boolean
>      description: let the driver enable audio HDMI codec function or not.
>  
> +  aux-bus:
> +    $ref: /schemas/display/dp-aux-bus.yaml#
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -167,5 +170,19 @@ examples:
>                      };
>                  };
>              };
> +
> +            aux-bus {
> +                panel {
> +                    compatible = "innolux,n125hce-gn1";
> +                    power-supply = <&pp3300_disp_x>;
> +                    backlight = <&backlight_lcd0>;
> +
> +                    port {
> +                        panel_in: endpoint {
> +                            remote-endpoint = <&anx7625_out>;
> +                        };
> +                    };
> +                };
> +            };
>          };
>      };
> -- 
> 2.34.1.575.g55b058a8bb-goog
