Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88F5348CF4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23476ECF5;
	Thu, 25 Mar 2021 09:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80057.outbound.protection.outlook.com [40.107.8.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8646ECF5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:31:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzP7DcUqhapY+ceuO+I0euMSf2fuwXk913rdonQSK6t7cSb+cEHHyB5JMXuoZLtEj56H7sSftP76PcYo9qS8Whptab7sg+KB9RFrCC15zJdN6EieYbh28WOV+VBNYw8i2JUNKTR7/tdmeheFBGcJHo7zPA3arCZWA6OXy2BQV43eyv5EPK+Jn063NgYcOjGq6qYXZdHPeKhDLi7XDFm9gq8bQ6YdjLuOVT1J8eE++3nEjt40eVEPMfRoj4LS0am74zklp4v9X3ka5S8gtptm4uRAHB7fEId18LEM0sSWdE7MdIEjBFtSJ9enopzT0EnUGHXkfCBqnC5l6wSN9vqiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdXsgBhk45np1qvfJTeTsRxNR5p6YyBFQrVEJTeuVx8=;
 b=MIHTIuwqbUE+F2imyC2LsfgDuB/WRXZV7b3kb8ZgEVAi2Ii5GEWxj1kMV/8lPPIwehh4q7zi6Y7iqWATJzw8U+iI4288yxIPseHulZHTCTMjjo80oDgNZ5cV6LubQEgIoy5pr+cqp4Pqm25AdgtzKlbqYwzvRdWE/R2IJ+K/4+cyxgQqxiYa5q3TpKNHm/Xof/gCWCe8/Q3mhHzEVeOG1puiErqTkhaAtNBv2czI//HuT30hjhTxvaoZ/lRu5KRlziFV8up8GUZXpVqkzL2gTVHF2QldysyrGLMvtiYa4vIAtwN4nqb224OmVMWMVttxJqa/RfmRRuXZp8g9/0HsUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdXsgBhk45np1qvfJTeTsRxNR5p6YyBFQrVEJTeuVx8=;
 b=o4FrWNGaaA5oiTWjV9LkH9XPh62maRq34ExgWJJLFyGnNbbdcU94RycT+2Z+f9act6/TpkJH7EZCnqUqydWAJj5LKtsiXa204fUN+jKyNVWBB0BpUtg+RMIBX/EQj2fOnY00MaAREJbQk3Mx8gmuxMigqIRS3U3NaUFKy30HGc8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2320.eurprd04.prod.outlook.com (2603:10a6:800:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Thu, 25 Mar
 2021 09:31:38 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 09:31:38 +0000
Message-ID: <483c17cc86c32caaf90e3ab7bbf8b8c0731c5519.camel@nxp.com>
Subject: Re: [PATCH v4 2/5] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 25 Mar 2021 17:30:00 +0800
In-Reply-To: <YFw7udw4G9WrWlAd@vkoul-mobl.Dlink>
References: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
 <1615175541-29009-3-git-send-email-victor.liu@nxp.com>
 <YFHYeZ/ZVqNiG/yo@vkoul-mobl.Dlink>
 <6c52ebc6a027cbe309ed2c8848f2ae8cfa6e15f4.camel@nxp.com>
 <YFw7udw4G9WrWlAd@vkoul-mobl.Dlink>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HK2PR06CA0012.apcprd06.prod.outlook.com (2603:1096:202:2e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Thu, 25 Mar 2021 09:31:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da89ecc4-3f07-4f82-f34f-08d8ef70c9c6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2320735AE7BB6B2E2CF2241898629@VI1PR0401MB2320.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cJuPbs117SmHsnlBpdBG23Df0w1wVLr43T1bNcL+x5IKYu33j70vqOEJVpqBt3tNoYMwDoW8bGIeg3YeWHeENKGg9Ezl3uikUQQ97XBNDVK7mORQrtuoXZ4qnwGtMabVhRDfEe6X2z6QQJSZA2Dvlr6wh/ub0lNM2DIWCFIicKN1l4lUg2yVmhGRcVVd5a7lu3XuuS1JcHzPJltXEftq3RHazbfYweW968hKqyNvANnA65tURrIS+ANz4BMuGbiP6CBdnIAZvZyhHniPqaHzUC/+5NukmeHEL7fCIYYMlENkkZ722Oj5yB0wC7iGNuiwfeEvgIsoh9FurrAZfncxZIsE6BC2xVEdk45noQtIWqWkY+S2FBa77C11FBNQHZ2gnBZ0JFZtUU5w+remqx+4Bw2Y9PpuIiLv6H904dhewsicDu5XbIGPHkWzrQzGV3kjkFPcJ/tMAaz2sB7FF9DiZis09utm/gppVU3rWlXTQppQilUwjhdwxWE8lzpU0sIDiJ7dCHVMnLZV0+7x701T6s8E5VIon5DAc9kMhZ5DK+tCuK5TqQmyZyYL+sa0bWwpjALrSKsLw4o3oFcIK8pMZaR7id1Lmb/PwiYmgkcaw4+rcL7osezsWAquMJsaOUTlePkZGg7j+ZDG0cyZ51vDkgLG4GikMnYqKAuUS3h6gi7+qLTxRZf6DjFNQHi2fpDrxRGgEV0tW655u4gxo9k/kN8oy0E+JjkHkcd43YyU7D0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(8676002)(66946007)(26005)(478600001)(66556008)(45080400002)(5660300002)(2906002)(86362001)(53546011)(316002)(4326008)(6486002)(966005)(38100700001)(8936002)(66476007)(7416002)(6496006)(956004)(16526019)(36756003)(186003)(6916009)(83380400001)(6666004)(2616005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGE3MFhWM0FQQnVYSG5OcnNtNDI2ZGpSQ2orMzhXeS9yeUgyd2R1aksvckxD?=
 =?utf-8?B?T3JUWFN6YVVGNC92TkE0Q1hrWk8yN3V4Mm5TY1M4R2ErNC9ueTgrWjQvSkc2?=
 =?utf-8?B?NU5RVlY2QXFJSWF4aFBWTXdaL2N1T3NKWXVVUVJVR1lIZkJMQWoxbkxGSURS?=
 =?utf-8?B?Zzd1NTBlNU1YUlpDWU5mNlBWWlJxa0paWW9BUE9vVjl4OFlJKzRHY2hjU3F6?=
 =?utf-8?B?amNPdk5ZRWlFZkZES09SWFZvZzFHdG5QODkxMlAxS29LMVFyeFRPbkdtQ3Ns?=
 =?utf-8?B?ZG5uUHoyYlB5TzdhdmQ5ZW9pbGRwQ1hBdEJUUUUrUk1NV3pVLzFjcFVsTm5R?=
 =?utf-8?B?Yi9UOTh2Y2RpTGVDWXQrMUlTWng0SFl1WXRaajhSVFltT05BSzNiZDllb3pS?=
 =?utf-8?B?cEYwS2Z2bHk0MDFlT1ZSNmhqd2RlbG9ZRnlraWFWOHRVOUhJQW9NbDVwM0Ji?=
 =?utf-8?B?YmpQZWRYSklZMmZWelFlUG5rcVdrWTltS1pSTGIxVkhOOTBQUFRjTkp3d1ov?=
 =?utf-8?B?MnY1dnErWlI4VDhMSjlKMEc4YTQ5V01Nd0R5Q0JEZWFNOHBrOWh6L0pTSGZp?=
 =?utf-8?B?cUgwejNsWk8zTENrWkhVMEJVVTRXZkVhenA1WUFZVDBxSHZkU08vZ2NDcDVq?=
 =?utf-8?B?dW9jRzVvSFZHZ0Q1anRnVHBydEswK2pKdkVpV1ZuYUFhTGhyRmgzTEVKTzBl?=
 =?utf-8?B?ak1raWhwVkp0T2VlKzdabWpqSWFSQlpyZEplY3piaFJraWNOK2UycGgvcy80?=
 =?utf-8?B?N3J3R0RWc1BOaVJISUFaVE9YK0xjbHFTTHpJV3ZDMEFZWWxIWTBkMFVWeGdF?=
 =?utf-8?B?VEZhUGd4VEJnNkNTaVF3TUd5QlNlejVlckVWVlJmeDd4cXUxOUtkYlRFcHF6?=
 =?utf-8?B?SmVXOUYyT0g0QmRCUGZJSGVWcjVsTFpqQlpRWWpPNHZVMWI4TTlWb1RFZ29p?=
 =?utf-8?B?Tm03QmlCdFlDN1orTVprVkJOQVN6SWNRL0JBSDBPMWROUEN1ejNVRW9jL1pZ?=
 =?utf-8?B?TlpTMlgxdStDOEpsRklWUkIzUDV1bFU0Y3d2OFNiT0RHM3ZYNUVQODhkWUoy?=
 =?utf-8?B?N0UwWWMyUVFvL2VMdjdnNFFiMGZQVktzTFZqc0JmdlBQd2V4eEtXa29Xak5F?=
 =?utf-8?B?b1RQNzFxYzRjeEhnV21YZEF1bFFUVmZKck5WdWRTZk5ITldkYnhVZmYvUkZs?=
 =?utf-8?B?UEtWZVh4SjBIclRkVUFBWFNBNEtmRkYwbjVIbDZ4RFl1NWxrb2FTTFNCYWJt?=
 =?utf-8?B?VDh0RGtzbDA5ZEc4TG1JNzh3M2pJeWdHOVBPY3hWU3l0ZUlYMjF6MGV4OWtq?=
 =?utf-8?B?MjJtK1ZwTlNsTUZUK3JyeFArbXJucFd2WkNJRkx6aTJlcDlKclhkdlNiMEYv?=
 =?utf-8?B?YUdrODZkL3UxU3l0QllwZ0lnUVRzNVd6T3JTWWp5cFNrNHpBMXE4Q0RDRGRB?=
 =?utf-8?B?RHU4c0RFbkxlZ2pXeEhicnFiUG9LeE9ESldmOW83ZTU3WjFoVHJqdHVxaE1K?=
 =?utf-8?B?MHhSVXlZNkNweVhRWXFqbGQ5N0JTL3RCUXZKVDJnSnJZTjgxOFdSci9Pbkl3?=
 =?utf-8?B?VVRLdWVFdlBMd25xZzg1c3RCUkZkanFOMkp0SVQ4RjFNTHMydDhCSkE0T1Zo?=
 =?utf-8?B?Tk1QZjFYRGc4b0RsTk9OQUF6QjhNditGMkF4WUxmQkQrcjVISUd1VnYvdFBY?=
 =?utf-8?B?V1cwTnNqNms3dElNSnM3RUJ2WFE0V2w2aldWU05TZ2U3aGNLNXp6TUZtTkJH?=
 =?utf-8?Q?Sj+LwZlyJd3HvevwKyAJbRoaAfgdOXi1lejj4zo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da89ecc4-3f07-4f82-f34f-08d8ef70c9c6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:31:37.8886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4t9biptsFoe9UDcf3BKQWYmD1Gul/Jj8SFTlKkiVYQeQ5EUyVnhj/xu6E/WqrgMyQaekFI8adnRsqEC7ynu4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2320
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, martin.kepplinger@puri.sm,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-imx@nxp.com,
 robert.chiras@nxp.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, kernel@pengutronix.de,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

On Thu, 2021-03-25 at 12:58 +0530, Vinod Koul wrote:
> On 18-03-21, 10:22, Liu Ying wrote:
> 
> > > Can we have these in kernel-doc style please, similar to style in linux/phy/phy.h
> > 
> > I take this way of in-line member documentation comment for the below 3
> > reasons:
> > 
> > 1) Members of struct phy_configure_opts_mipi_dphy and
> > struct phy_configure_opts_dp use the same way of comment.
> > The structures are defined in linux/phy/phy-mipi-dphy.h and
> > linux/phy/phy-dp.h respectively.
> > Aligning to them makes a bit sense, IMHO.
> > 
> > 2) In-line member documentation comments[1] are mentioned in kernel-doc 
> > guide. It says 'The structure members may also be documented in-line
> > within the definition.'.
> > 
> > 3) Even the 'configure' and 'validate' members of struct phy_ops use
> > the same way of comment.  struct phy_ops is defined in linux/phy/phy.h.
> > 
> > [1] 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Fdoc-guide%2Fkernel-doc.html%23in-line-member-documentation-comments&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C5f33165920d0484dec4d08d8ef5faabe%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637522541498852343%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=l25%2FXc0Xu2aH%2Fi7cSUqTsKae9L6BTddbhbV3vVRyON0%3D&amp;reserved=0
> 
> It 'may be' but I would like all headers of a subsystem to display one
> style. As I said linux/phy/phy.h use a style which we should use
> everywhere.

I've sent v5 out with this comment addressed.

Thanks,
Liu Ying

> 
> Thanks
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
