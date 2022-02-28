Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B195F4C6329
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 07:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA52410E262;
	Mon, 28 Feb 2022 06:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10054.outbound.protection.outlook.com [40.107.1.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CE310E267
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 06:38:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAlFn1zItJGQqZmeDZs9TjPSjDJWOMAAD/ENuXdyQ63XevO4e29DHG2jbKawBD8ox7wX7gmafbbQWUotdSaa+T4oZHXNJDR3rA3wav8JvRZiSG762eIFj3FdsqKb9Vrsk5fv7S5VCI6Tjyzt0MVy9TXPZexlnfehk1xH5bgJSKGdWN6PjVHYMgxB5QBbcmA2AZ3bFZUd5LL4H7xsn0sdWaRQUDwUD+cdJ8yXEjbfCgd/8I5fqqMB6OLwxgp5bfiEvq9e7GTliZUWTBppuvafDgkAx85/pwq0tZhOC4+9VLTOFGMwoPZMlvJbHmxh2aToQMLz7TITL/P3P9RTvhb1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt8D7m3QieLYuS3b8CVrZyAJUj0jL22bw22UCMern0c=;
 b=I//N8AEYh1G6SO6ni98YSX8kuXKBnZghQf6T+DxPOHYxopH3nZEsMIjvOaPjs4U2TdSot9nnqc2ZJYIblMNZQnBmaYmKW5+jktsBrQP827BP3piCs4vvzmT9YXzprYgwPFHyVpw+mYNlAThbje3d4WXGc0TRLU27aRLwE8jSpSDeLhPF32ZOrSZP31DXQh0mY9iqDxrp2xFEjXehi44l3Y8+X4cTLxhnkg9AEHf13mt4EZljiw/+yjR/8Oygk/D2YpMoUkAX3pXEY337nCpQf8pYcGY5oZq6LCtXe8tnhPhJEe9xPshvheOHVm8qWENB4ply0Yz2vwxUxDAK/UOrvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt8D7m3QieLYuS3b8CVrZyAJUj0jL22bw22UCMern0c=;
 b=EHFDjhT/fRYuIT5ONKZUjyiny0m7ZrueBTTH7aCV0Im/DB3je+mQSD45VHsAjmP6p8Hrl17ff8gI6invYJq54MULnOChiyCzZlh9IDioMMIVU0OLcQKfCjcBVZTswdvzK1k9mS7lnOieIXDOjlP06d1sBOma2sWc6kqAJXf1KlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 06:38:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 06:38:06 +0000
Message-ID: <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 28 Feb 2022 14:37:50 +0800
In-Reply-To: <20220228004605.367040-1-marex@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0146.apcprd06.prod.outlook.com
 (2603:1096:1:1f::24) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf1c5aba-f394-47b0-d5b6-08d9fa84dff3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6144:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6144DA2FFE9E183E8104EC7BD9019@VI1PR04MB6144.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rsAi7N+r6pwESfx2mI4ZD6yYuveITHlIcYqCz3YwDTs6VCamqurMJQiwjVivnw1JMk670l/wjf+wAGlapROmcrsHGUiphfbA147GQFcRxMGPX2fwuDCQ5jSjtBBlVPpDNjKDl9CdIeEQhv5cA/6by5RmxFCCzFPKzm3Nrm4aeSJFG0QoEnxL9goRWKUjDObDALyAN9zFapVtgtk0wPln/ECMgauToJQyDw32C7Gg2Hq/2XpKLCYuO45Gz+jTH5f8BIy3LU9++DgBdacHHvpDft2NAiEPCkZx7V5aXusspj7drqcc0gtam407IW+yO7/AAbCmP72mmqj+iplJsiz3gcM/OW1QxonMYxmkcF8CdcDr2c/A1vZdoqNeS3xVcSYuoQXBkl4gT3rYTMOLM1R12C2BtyRqGxSEloccT7BqRblTLeMihewj8/HPdKhHgDqPFxKwvA6tDrChtwe0afxLejnezwfNPywq05WF3zbWmezdpikhWFzluNJyq2DEK5AlCdOcxyRgL36hg3yOxL2n67wnm6skn3Fn6a3f7fcbWbPMcWb4WItVJMe5QexVGFAmyrIv7aJALSTpacqJKEhRkmn3SvygHnq8vaSzakA8TnpzBDRBrgDlHXfCgk8iU9pdrZMTIYb2wygZA+kfrQbtOIbtYfmoQBmlKCg1bXNac+jxsq3rspht77T1OrB4KpNdqRamzLCmxuJCU2NC2NmBwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(8676002)(4326008)(66476007)(26005)(6512007)(38350700002)(186003)(2616005)(38100700002)(508600001)(316002)(86362001)(54906003)(66946007)(5660300002)(6666004)(52116002)(6506007)(6486002)(2906002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aENRTkdId1pZbHlNZ1U0eFAzdkxiS3IwLzlxTGJ3SG10ckFmY3RMSC9ISnZz?=
 =?utf-8?B?WjRwVFVMeW96bTd6U1RrOFl6VWFZaHR2SWhKbCtHTklYdnhRRHJsQkhWQTZX?=
 =?utf-8?B?L0FOOTRjeTF6dTNqOEdqMlhwRTIydGt2SC8rL3YxbGZ4TU9KU3d6SWxYcTVW?=
 =?utf-8?B?bGFxZjBhVW1tM1o1TTJqV1RoQlNMalhrc0VscTdNalpNbUMvYThBUFp2cyt5?=
 =?utf-8?B?bVZkWjlxcjRlVDV4MWdKVjE3b3Y4MnFrdEQ1T1ZxUkZSRUN3bTVERmF4SlZO?=
 =?utf-8?B?MkJMS2dkQzBxMGNHQ0lZNG1NUjR6NndMSStlZWxOMG93Y2ZucHk4VWU3UldG?=
 =?utf-8?B?OVBueFlTUFlyUnZxcU5zTVpzeFRLZ3V5UmRnTTBFbndGd2xFRVExTkdxWVVz?=
 =?utf-8?B?b3NnbGUzOGJpeEhDYUNJdUVLUnYwdUh1UXY1akRhaWRvamdKL3pCN0pDcWxC?=
 =?utf-8?B?bWVpd21tdWVqOFNOeFVGVlNGdVkrZ3ZCVHBLZEhwYThsbWJYWlQrVnRUZmlq?=
 =?utf-8?B?dmYwWmsyejU1akRhN1p2MmE5TUplbHgxK2hRZlNLTWJ3QWRaa01Gb1NnTTR4?=
 =?utf-8?B?ZGQyS0k3MjdnRWVKQ1dXeU9XcGMwNi9KWkNxRW8xajR1KzN5VnpXaXNTM2FS?=
 =?utf-8?B?MXB6Z2lQa3RWTjZOanBCb1E1TWpwcnA3ZUcvaXFXU1BoUHdKSEJiTE43WDRu?=
 =?utf-8?B?Y2QwRUV0c0VrOHVGZjAxN0tGR2J2VVpoV01JcGJvWXkweHJvNzAvOHZpWDVq?=
 =?utf-8?B?dXB3akwvZHZVY2hBYTJ4TnZLTjdpOS9XdHZQeTRkc003TVFnWUdDRGtXajBC?=
 =?utf-8?B?YTB0a1BuSzliMUY2cC8vRzNldlZXSk9Gc2VOR0RvY3ZZc0VQaWZ1SzZmNmJY?=
 =?utf-8?B?WXVsak4yNVp2emhyVGFFaHFJTVh2QzdrK3ZIem02MVBXc0dtOE0xandNU1R0?=
 =?utf-8?B?dWk1NkVFZ012SVM0N0FTV3VzM1V0R2F3SWxTVHRsa3BNU2taQy9CcmQzcUhl?=
 =?utf-8?B?NlQ0UnROZ0VVWTlRSndHdGZUVmxNQWxCM3IxNUJBT2pKV2RCSnliR2VseXNs?=
 =?utf-8?B?cThoRHlLMmtOclZibXhFSVhZeW5TcUlFcERsSnl1aG9FcFpUOEJwcTczUXo2?=
 =?utf-8?B?NkRDUDJmK3dxL0VBdmg3WkJmMjFwTXd4aVR3VWJmUWhiMS93TnZ2YlJ6NHk4?=
 =?utf-8?B?SVJuVCsrTXNsOVVaaC9UV2F1SmZtdzRIalNaQk01a1BOejZoMHFYZSttZnZi?=
 =?utf-8?B?aTBaM0JsUk8zWEtiM0ZZV0luTGJmbkF5dG9QM0haMFdtbWN1MkVMbWwwT1lY?=
 =?utf-8?B?ZWZhOGFrWHZwVDZYUmJPRkZjdW1wRnhXelY2SGMrRDVtUkx4UFpxMEdRWnp5?=
 =?utf-8?B?ZGhnczArMHMzZXVPbUl4STlveGhTc3NLeUdUNnNrT2lGYlJuam9hMTBOekZR?=
 =?utf-8?B?d2xBVTNWVXBBVzhlVTFvUHVIWnJGQ2lGbXlQUlBCWG5uWGtsVHQzYWhvZ0kz?=
 =?utf-8?B?eE5MR3VMaXZicnkxZ1hEVjMxWVlrSFljM3lwT2RQenN5VDVhV0JOalYya0th?=
 =?utf-8?B?OERRM3dyT0NQa01LOTVtWXR1eFpCdlVTdVI5RkJBLzJnY2dXM1F2eGdDM1d2?=
 =?utf-8?B?ZEhRVmVyL2FTY1lXekVxMWNGYWUxMFM4Wnd6aFR4Mk1ydCtuS1dYY3NDRmQz?=
 =?utf-8?B?SHR1dnlzYndlV3VvREJNcms1UTdJR0NmS3FsQW8rMVdSQlFGR1FsbFBxQmxv?=
 =?utf-8?B?UllUMmJQeHhERVdsdDc0ejZ2d3pSa3RENHhPMjFYVUZBakxZV20zUEJSN2Ra?=
 =?utf-8?B?ZGxhMGVxVzBsYis2UmQ3eHBzSm1JTmFhUkJnWFhYWmlMQW9JeFFCV0l2VFFB?=
 =?utf-8?B?WFlCQ0xOc3EvL2tIdzkxQXhwbjhNUm9CWGVBZktmYnByVHhONDI1dFlaNFZr?=
 =?utf-8?B?Qm1LSThsMHQ5MytNNy81ZUZQRC82SHJSeGk2S0hsL0VsUnFEdnM1WktOaURT?=
 =?utf-8?B?RWlwVzFNcTI0L3dwNDJLcmcxZ0xFYUNha0N0aDZTYk42WVE1WlRLMjk0cDkr?=
 =?utf-8?B?Y3NUUDZncDZ1dXlrK1ltbWx6TTNxVlVzSFBub3hJaGdKRy80MC92c0N3WSs3?=
 =?utf-8?B?RjdtMHFld3ZtakNYNkQ0ZXl0bWxBdmJZbnUvanJmbkdRWHVtcnVUSkF5NStq?=
 =?utf-8?Q?C4qX4DZhRpNTwV7Dx4N4+tM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1c5aba-f394-47b0-d5b6-08d9fa84dff3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 06:38:06.1591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fF8p1YksMKB4KIUvcLFjLypG5YA8njCcDmuZbf6nCewAA/XWu2xMuVs54CmrrIjxHVlZGmmxFyvPo8P7ZHNI5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6144
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Mon, 2022-02-28 at 01:45 +0100, Marek Vasut wrote:
> Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
> and is completely different from the LCDIFv3 found in i.MX23 in that it

In i.MX23 reference manual, there is no LCDIFv3 found, but only LCDIF.

> has a completely scrambled register layout compared to all previous LCDIF

It looks like no single register of i.MX8MP LCDIFv3 overlaps with
registers in other i.MX2x/6x/7x/8x LCDIFs. The LCDIFv3 block diagram is
totally different from the LCDIF block diagram, according to the SoC
reference manuals. LCDIFv3 supports SHADOW_EN bit to update horizontal
and vertical size of graphic, position of graphic on the panel, address
of graphic in memory and color formats or color palettes, which is not
supported by LCDIF and impacts display driver control mechanism
considerably. LCDIF supports DOTCLK interface, MPU interface and VSYNC
interface, while LCDIFv3 only supports parallel output as a counterpart
of the DOTCLK interface.

Generally speaking, LCDIFv3 is just a new display IP which happens to
have the word 'LCDIF' in its name.  Although both of LCDIFv3 and LCDIF
are display controllers for scanning out frames onto display devices, I
don't think they are in one family.

So, LCDIFv3 deserves a new separate dt-binding, IMO.

> variants. The new LCDIFv3 also supports 36bit address space. However,
> except for the complete bit reshuffling, this is still LCDIF and it still
> works like one.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 900a56cae80e6..9831ab53a053d 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -28,6 +28,7 @@ properties:
>                - fsl,imx7d-lcdif
>                - fsl,imx8mm-lcdif
>                - fsl,imx8mn-lcdif
> +              - fsl,imx8mp-lcdif

Even if LCDIFv3 is covered by this dt-binding(which is obviously not
the case), 'fsl,imx8mp-lcdif' should be after 'fsl,imx6x-lcdif' as an
enum, otherwise LCDIFv3 is compatible to LCDIF.

Regards,
Liu Ying

>                - fsl,imx8mq-lcdif
>            - const: fsl,imx6sx-lcdif
>  

