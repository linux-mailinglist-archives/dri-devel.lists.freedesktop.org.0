Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9A4CB9E6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 10:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8572A10ECB7;
	Thu,  3 Mar 2022 09:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140088.outbound.protection.outlook.com [40.107.14.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A629D10EDBA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 09:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpaN9m7GfOeXn15QejkaTkT9YpGZ8ogkBuTyFhiLQasX0on0lrMpgED80XfRcf+jEwhHOe0ctbWaXaMZGpHENe4HhlXIpL8bmBSlCuhu31bedlx1Og1lD49vD+SkeBCQQ+y07kuGffQ+FQ+Gc2g9VRRdemjQVvG0UYx3p3grQI+xDns4MISQ20UFZTCOda7ahHDzzHKV6Lb3moVCKk7xKmeoXiQVF+qT19CUABgXUqzgEyAfgu3lZxnbdBt+mP3SZXec9DwHlYiVKs4tpH8+63V6GmMy5ezVWAg0bW89tlGuW1MGbbm9W9wMG4kRDJJykwg80xhrU3vUvdgk6rpmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YfawnKSLnvlebh2fxwoGoRCNAWQCeLE2TBRpz6akC8=;
 b=fezS3GQx9NaZ/91g2mfRAAoBJN4iXRbiOfEEW4Dot1IuDKa+5wq8RYuohiObFXGMgR5gjGc8Jwv0vn6loT7cL7I67UsRk9bRj1lUKp2ML57iF8KzaSoyJGw6FMH3w23tz9q7KToxKk5wD6YtxPd7P+32Ck8MSn9ts/MEMj/AUZayUeQk/p5MiRWLv3RIQ6/XJL4Mg4FIuInG90T6uVFzMaTZcwqLjBKFkQlvcQWmwpWCiH4GRpi2n7jbcvEBfRl6ivXOJI52XFhc0YwgQoS1eslIffBSjg1qQoPdvDRjaeTn2/rAFQVejQ/46hqHYFid1uBfgXfJ3F45Aud8fwt9HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YfawnKSLnvlebh2fxwoGoRCNAWQCeLE2TBRpz6akC8=;
 b=DqtoN9T7ALSgqE9Zj+sRnVzxfKDFcC94eq9uMH8KoSZ6WFL09g/usnwDeFtKTWZhxLIZ8lbaPHH/rpefHw5odnKOMLxMxnArQHHOObiO2Ridu1lSazd93eSb7J4oT/MdvOxm7P/tQxrxE0qOd40stAflAJDFgmdtRXcWXJ6Jovo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB5669.eurprd04.prod.outlook.com (2603:10a6:20b:a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 09:14:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6117:74ed:7550:b3b3]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6117:74ed:7550:b3b3%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 09:14:01 +0000
Message-ID: <dc6594b0f8044e784b2da93d7b69f402b1dcd04b.camel@oss.nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
From: Liu Ying <victor.liu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>, Adam
 Ford <aford173@gmail.com>
Date: Thu, 03 Mar 2022 17:14:06 +0800
In-Reply-To: <8865c3248d860aefb802ccbc3c486fb6d3721b14.camel@pengutronix.de>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
 <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
 <8950434843ff7bbd1a527b0c799d9a74a75ee36d.camel@pengutronix.de>
 <7aeed693-dfb7-950f-fdf0-3c90de285392@denx.de>
 <8bf0b5a1c9ab9faee28077436cdfd49c0cd08792.camel@pengutronix.de>
 <CAHCN7xJ6ypDxZouZV1b1F1EgQFwdTvmY6EEekj+_z-UWbQMD5Q@mail.gmail.com>
 <4253aa4b5dc4a3568e45755678849961468bfd38.camel@pengutronix.de>
 <b655f565-43b2-4e42-953e-d6efa02f0219@denx.de>
 <85af7c5dfa120903a22e5e704e3bddd87830033c.camel@pengutronix.de>
 <049a182d8bf75110dc5ebe72f5b58d209b64d58a.camel@oss.nxp.com>
 <7e0323b120ebd8faef162a9b0f0ab048bdb7a34b.camel@pengutronix.de>
 <15a6222b256f67a01ef947bb44a2737a6606ad4c.camel@oss.nxp.com>
 <8865c3248d860aefb802ccbc3c486fb6d3721b14.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0182.apcprd04.prod.outlook.com
 (2603:1096:4:14::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ae5d6cc-809a-4d46-d72a-08d9fcf627e9
X-MS-TrafficTypeDiagnostic: AM6PR04MB5669:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5669A2EAF280D9E34B5680BDD9049@AM6PR04MB5669.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igjPgmta53UdXqGHcFcN2FVTawnBK1UIyK/xApeEUcSVE3spgO1AhYxENjVdEfghywNYfjEhT5su2MvYRB3gkWuP1I/bxYTxMKGSZUyby/4wLtLPMzAcUOYbpwvRFpeLMue4zke89ouXZiFksqNJDFgY8tceSBNhkIXfxjBsrBv32p64vVnuVAGNnJfvFrb8qhvwxjU/IhUbQYL+8F6pNoSjraf1vLSRW15zmCLTiy/L9R4w6oAY31mZWIqI30e5bWl1tH+oR6jgOAzmxrEVmx2BrtSOoyRWEjfN9Smlqa908PPplsz2+SztkcQUP6JAlCkTV2sr/P2Bl2ncU+wty07TdYKcQ6Ku484KfPTEbI+8XQren20tVKZNKBs6HS+VbrWGGaR3IHoMx/TFPjwWzo3lWQX/fCTkDo4NaTbZ4Lh/zX+JmR7gxSDgYTo3TFi8vzpbKVFrKRgt0Jjb0OFvdfP3ZRUuJQ7v335x5a7oXwmiyUzzHjkcYzb1g4MXFrhJWStQG2B9vXgZhiz+XECWx1faRH9Vg+l5XtkrvwMr6Q9ONft0tTOUmeReLI2X031bBSBxWLpEPYUKKYg6ciBDtLM8xX7iS8CTQvW4agCd8e9DKfs4O/0WUbc20e+ttql2YfFkLsPomd+ZVotnl6EAfYHbnR//xrCTEE+BktQEDTCExSe/LLEN9QcEJmV7b8/V/gwk8tXsl2cpCYVxhDFngQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66476007)(66556008)(83380400001)(498600001)(26005)(2616005)(186003)(5660300002)(2906002)(8676002)(86362001)(38100700002)(4326008)(54906003)(52116002)(53546011)(6506007)(6512007)(38350700002)(110136005)(6486002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEI1YUt0d2VMeTNZa1JRV2h5SSt6elQva0tPRUJGNTVkS3ZwdUlvbmhlVmZ4?=
 =?utf-8?B?UEd2WGh5OVdhQ2pCWHdEc1Z6QWNDVE1ZS1lqaXRsM0N2M3hWV2NhQzlJOHRj?=
 =?utf-8?B?VFJOcEJoUTFJWUVJc1JDU1E0bVJLMUxpc3dBekJ5b1RBNUZQSFhSbXpsYzVY?=
 =?utf-8?B?amNpMXY4NWtLOGQ4QnE1MFZBUCs1aFF5L1Mzc1BFNy9aNEJxb1lzU3VFNCtZ?=
 =?utf-8?B?UzlVcWlCV3l2bkdRSGlyaG1ZUVpuczBndHdOY2twSXVaUkhDYTB0RWJtSW8x?=
 =?utf-8?B?bWloV3I0ZjNDOXhiMGJ4R0hNQmx6dUpEa0xCQXdSTTdwSXpIMHdJQ09WK3JJ?=
 =?utf-8?B?YllUVVo1K1YyK1JkVkJmbDhJYnE5VlVTelFndEMzK29mRnhTbzQ2SFZLUE5V?=
 =?utf-8?B?VzVyUW9UekNZRUV3cU1tSzFMeFdqK2pyRlZPeHVTK1RaVEl3WEh5SE5NYkVl?=
 =?utf-8?B?ekxWOHowVzM4SnE3NGVkQm9TV29WdGM0RlpYYnVNWG03bjFRYjFnT1hHUXdI?=
 =?utf-8?B?cVg3ZmtmQVArVDVMVkFqa2p2QllYVXdmUVMvVnMvTkRBVE9EZWI0Q0xuNHMy?=
 =?utf-8?B?WmJRTXRDYWlIc0xuQkhISndBK2VIdlhCTHFlRCtlYmF1Mm1HQzBUUDlWVGVE?=
 =?utf-8?B?UHdaWXpUSU41T2o2TDZjbTlNMThuL1YybWZyQmlJeFhaV1ZOQ2JKL3V6SGd6?=
 =?utf-8?B?UzVya3VnLzhPZS9UUVFKT3c2TElkN1hHTkp1OTRkemlITzVCK3NnZzF4VDZh?=
 =?utf-8?B?WmRZVGIxL0lodllrQkJCUS9oVlpRallmMjdUSm53dXdGb3NuTGUza0FxdlJO?=
 =?utf-8?B?eXA0TG5RbHZDTFdqeEc3dGdBSFgxYk9PWFhZeGc1UnE0RjV5bEhTRDVvZW9T?=
 =?utf-8?B?WlFMZ0JkZHlpZnhCWnVaUzllTzNNQUx2YXEzb3paWlBsdlFySGZ3ZGo0anFt?=
 =?utf-8?B?b1liNEVLS3I1MDhGOHpMN3R6UVhmb3JMUGJtQzN6cmQwM0ljbmkxUWpFS2NJ?=
 =?utf-8?B?UWozdkxNN3Z4ak9EdDNtU1BGOUdCd3FFQkNpL0N6cURtT0M0aWcxdHhDT1Fz?=
 =?utf-8?B?RVd5WE0rRFRub3k5am9taG9FWEdSbHJPQit2RVhCaEZDTXN6SmRaelpvd0tl?=
 =?utf-8?B?cXhSRnBiaHh4SEJMRWVBTEUrL0xtZmZ5Nm5HQ2paNHJwMmJDa1FBbHFnTVZo?=
 =?utf-8?B?eW1MZGdNWkQ1d0E1UEgwSUtLUm9pa0hvMlJtT2RVMCtpbURVQ1Y5Q3lUMzdt?=
 =?utf-8?B?YTJIYy9RekZkWTdyMmloeFJGVjFyVVJlN3hoUHJscVdCSnEzWmtVRkFtRG1R?=
 =?utf-8?B?THI5bWlmaVkwQm5TZUpsT1NYNktITUc1bW5jWXV1VFlTaWxEblVWd1c3TnRB?=
 =?utf-8?B?TEVGNy9IZjNLWWhhWmhZMlVVdnphYVpWMXJnejhpcitYL3AzSjNwaGhhNGts?=
 =?utf-8?B?Wms2eW1UV2xDeHU0Um53ZTFXa3Mwdk1pTzZjYzZCb0dYalBSQmVhNS85RHFn?=
 =?utf-8?B?N1A2amdNYzhIRURaS2huNXE4UmtmQmZ6UENwQmdWeVl3ZjFRaW9vUGJRdE1V?=
 =?utf-8?B?ZVRQWFF4MGNGMjJEK2NYcVNjTjBiMUsyZTlrYWh6MHNLcG1NbUxVcHZKQkxP?=
 =?utf-8?B?TW1TMkFqelJXT2p3T2lyY0tqV0dud3MzUXM2eHdKdkRXTGZ2Y3RIVFVhYVVa?=
 =?utf-8?B?RTBMRjhKSFljbmFzdXBzME5tNEg1MVVWbEhoQjFpOG8zZUNsLzZqcmEvREEw?=
 =?utf-8?B?M0hkVWxnQVp1azlxcHcyY1pjRDU0NnJKZTM0MFBXaXpMeU9LTHdUN1BURUFm?=
 =?utf-8?B?dEZESkFYL29jRnRXMERkWkdnSzI1TXdzU3ZFSHExVHNUMjA0REFmMk9RMkJL?=
 =?utf-8?B?ZXRyWUk2aG1CeXdNRWEwZ3NSQ3grbHc3VlVHWUhpbEJEbndwWXdSZEE5REt5?=
 =?utf-8?B?aVhBWXl3b3pDaTR0L3RBTmpLa2ZBUnhrL24rc2FENEFVdDQ3RzQ0UUZ1cXp6?=
 =?utf-8?B?ck5BT3RXVllESW8yNlRrYklqMWdJTEVNdVdiRHNCTWVKYjJXM21GOVE4UGlS?=
 =?utf-8?B?aTU1bEJwdStDdzdXSUlMYzFEVDhnZnZOUElOcWx1ck1tU09sUGRCNGc2b0o2?=
 =?utf-8?B?L0VsMmIvMW1CcisvMkVWbGh2a1dFRFlDZE1CcHhzYjhVMlZraFFTOGdtMUZF?=
 =?utf-8?Q?JdAhbN0cMCHPXzQOdevg/3s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae5d6cc-809a-4d46-d72a-08d9fcf627e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 09:14:01.8925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnRsOeP1itzzZEyIleuIr3EBmz6zsC8zv22dOwl+rzGWaihaMOTaJlw9hjVbL4PhQkNdCPvvc2in0KH+Cvirxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5669
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
Cc: devicetree <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-03-03 at 09:19 +0100, Lucas Stach wrote:
> Am Donnerstag, dem 03.03.2022 um 10:54 +0800 schrieb Liu Ying:
> > On Wed, 2022-03-02 at 12:57 +0100, Lucas Stach wrote:
> > > Am Mittwoch, dem 02.03.2022 um 17:41 +0800 schrieb Liu Ying:
> > > > On Wed, 2022-03-02 at 10:23 +0100, Lucas Stach wrote:
> > > > > Am Mittwoch, dem 02.03.2022 um 03:54 +0100 schrieb Marek Vasut:
> > > > > > On 3/1/22 14:18, Lucas Stach wrote:
> > > > > > > Am Dienstag, dem 01.03.2022 um 07:03 -0600 schrieb Adam Ford:
> > > > > > > > On Tue, Mar 1, 2022 at 5:05 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > > > > > > Am Dienstag, dem 01.03.2022 um 11:19 +0100 schrieb Marek Vasut:
> > > > > > > > > > On 3/1/22 11:04, Lucas Stach wrote:
> > > > > > > > > > 
> > > > > > > > > > Hi,
> > > > > > > > > > 
> > > > > > > > > > [...]
> > > > > > > > > > 
> > > > > > > > > > > > Given the two totally different IPs, I don't see bugs of IP control
> > > > > > > > > > > > logics should be fixed for both drivers. Naturally, the two would
> > > > > > > > > > > > diverge due to different HWs. Looking at Patch 9/9, it basically
> > > > > > > > > > > > squashes code to control LCDIFv3 into the mxsfb drm driver with
> > > > > > > > > > > > 'if/else' checks(barely no common control code), which is hard to
> > > > > > > > > > > > maintain and not able to achieve good scalability for both 'LCDIFv3'
> > > > > > > > > > > > and 'LCDIF'.
> > > > > > > > > > > 
> > > > > > > > > > > I tend to agree with Liu here. Writing a DRM driver isn't that much
> > > > > > > > > > > boilerplate anymore with all the helpers we have available in the
> > > > > > > > > > > framework today.
> > > > > > > > > > 
> > > > > > > > > > I did write a separate driver for this IP before I spent time merging
> > > > > > > > > > them into single driver, that's when I realized a single driver is much
> > > > > > > > > > better and discarded the separate driver idea.
> > > > > > > > > > 
> > > > > > > > > > > The IP is so different from the currently supported LCDIF controllers
> > > > > > > > > > > that I think trying to support this one in the existing driver actually
> > > > > > > > > > > increases the chances to break something when modifying the driver in
> > > > > > > > > > > the future. Not everyone is able to test all LCDIF versions. My vote is
> > > > > > > > > > > on having a separate driver for the i.MX8MP LCDIF.
> > > > > > > > > > 
> > > > > > > > > > If you look at both controllers, it is clear it is still the LCDIF
> > > > > > > > > > behind, even the CSC that is bolted on would suggest that.
> > > > > > > > > 
> > > > > > > > > Yes, but from a driver PoV what you care about is not really the
> > > > > > > > > hardware blocks used to implement something, but the programming model,
> > > > > > > > > i.e. the register interface exposed to software.
> > > > > > > > > 
> > > > > > > > > > I am also not happy when I look at the amount of duplication a separate
> > > > > > > > > > driver would create, it will be some 50% of the code that would be just
> > > > > > > > > > duplicated.
> > > > > > > > > > 
> > > > > > > > > Yea, the duplicated code is still significant, as the HW itself is so
> > > > > > > > > simple. However, if you find yourself in the situation where basically
> > > > > > > > > every actual register access in the driver ends up being in a "if (some
> > > > > > > > > HW rev) ... " clause, i still think it would be better to have a
> > > > > > > > > separate driver, as the programming interface is just different.
> > > > > > > > 
> > > > > > > > I tend to agree with Marek on this one.  We have an instance where the
> > > > > > > > blk-ctrl and the GPC driver between 8m, mini, nano, plus are close,
> > > > > > > > but different enough where each SoC has it's own set of tables and
> > > > > > > > some checks.   Lucas created the framework, and others adapted it for
> > > > > > > > various SoC's.  If there really is nearly 50% common code for the
> > > > > > > > LCDIF, why not either leave the driver as one or split the common code
> > > > > > > > into its own driver like lcdif-common and then have smaller drivers
> > > > > > > > that handle their specific variations.
> > > > > > > 
> > > > > > > I don't know exactly how the standalone driver looks like, but I guess
> > > > > > > the overlap is not really in any real HW specific parts, but the common
> > > > > > > DRM boilerplate, so there isn't much point in creating a common lcdif
> > > > > > > driver.
> > > > > > 
> > > > > > The mxsfb currently has 1280 LoC as of patch 8/9 of this series. Of 
> > > > > > that, there is some 400 LoC which are specific to old LCDIF and this 
> > > > > > patch adds 380 LoC for the new LCDIF. So that's 800 LoC or ~60% of 
> > > > > > shared boilerplate that would be duplicated .
> > > > > 
> > > > > That is probably ignoring the fact that the 8MP LCDIF does not support
> > > > > any overlays, so it could use the drm_simple_display_pipe
> > > > > infrastructure to reduce the needed boilerplate.
> > > > 
> > > > The drm_simple_display_pipe infrastructure is probably too simple for
> > > > i.MX8MP LCDIF, since it uses one only crtc for one drm device. i.MX8MP
> > > > embeds *three* LCDIF instances to support MIPI DSI, LVDS and HDMI
> > > > outputs respectively. To use that infrastructure means there would be
> > > > three dri cards in all. However, the three LCDIF instances can be
> > > > wrapped by the one drm device, which is not the boilerplate code in the
> > > > current mxsfb driver may handle.
> > > 
> > > While that may make things a little simpler for userspace, I'm not sure
> > > if this is the right thing to do. It complicates the driver a lot,
> > > especially if you want to get things like independent power management,
> > > etc. right. It also creates a fake view for userspace, where is looks
> > > like there might be some shared resources between the different display
> > > paths, while in reality they are fully independent.
> > 
> > Trade-off will be made between one drm device and three. My first
> > impression of using the drm_simple_display_pipe infrastructure is that
> > it's too simple and less flexible/scalable, because SoC designer will
> > be likely to add muxes between CRTCs and encoders/bridges or overlay
> > plane(s) in next generations of SoCs(SW developers don't seem have good
> > reasons to suggest not to do that).  Another concern is that whether
> > the userspace may use the three drm devices well or not. 
> > 
> > A few more points:
> > 1) With one drm device, userspace may use drm lease APIs to control
> > those independant pipes with drm masters(not sure about the userspace
> > maturity).
> 
> I'm not sure why you are so keen on using DRM leases in your
> downstream. Actually this argument is a argument in _favor_ of
> independent DRM devices: you don't need to deal with leases when every
> userspace component can just exclusively use a DRM device.

Userspace may choose to use drm lease APIs to talk to kernel. It's a
feature kinda nice to have. Imagine that an user has already written an
application which uses the APIs. 

> 
> > 2) Code to gather all LCDIFs as one drm device has chance to be created
> > as helpers once there are similar use cases in other drivers(maybe,
> > there is/are already).
> 
> We already gather the GPU cores in etnaviv and as I said this decision
> proves to add complications in the long run. For example prime import
> with the DRM helpers is currently bound to the DRM device, so if your
> actual HW devices backing the DRM device have differing DMA constraints
> things get really messy.

LCDIFs in one SoC are very likely symmetric from the embodying system
PoV. So, maybe, that's not a big problem?

> 
> > 3) Power management doesn't seem to be a problem, since each LCDIF has
> > it's own struct device which can be used to do runtime PM at some
> > drm_crtc_helper_funcs callbacks.
> 
> It's not a big problem, but it adds complexity that wouldn't be there
> if you have a simple 1 IP instance <-> 1 DRM device mapping.

Just a little bit more complexity, I think. I tend to take that to
achieve better flexibilty and scalabilty(to support potential muxes).
It's a trade-off as I mentioned - I tend to choose one drm device, but
_no_ strong opinion on three.  Once the muxes become real, it looks
like we have to use the 'one drm device' solution.

> 
> > 4) Regarding the fake view of shared resources, atomic check can handle
> > that, so it doesn't seem to be a big problem, either.
> 
> Sure, there isn't even anything to handle, as the pipes are truly
> independent.
> 

Yes, but it's still a trade-off.

