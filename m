Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C971455461
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 06:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81E26E8F6;
	Thu, 18 Nov 2021 05:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2118.outbound.protection.outlook.com [40.107.94.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67646E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 05:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iovsJHltHYipGNQiigWfb/Xy0PkSHrd4+E9FngJzXsLLizXwfIcsHLTy+EKGp+xHq6BneyK31sXihs5k6c7ZVTxdUKEN2YMQT1+Ka3hSSPHk6YiqgXxAZKBoakm6Pg0rUIYWTUzApt+1ckVkap2LkmRGXKklzLsmZ0pov0sAs45gKIVCDTymbXikwT6pLYKqOUN9mFdLspbJmMkHqGwglXjznr7yzGNLhX2Gy0y2BhO8kdYP+uLNhKn2J2bDLSFMGpof6MI28TDZE/OF1CJR7Ur7A6fowDNEo66JLaW6UJQETh2t4cVaBZyktJMgrz5kUhL6VLQ/IE3aUD4ZCNvmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c1w7LYaoCSbDg2ebgYAAc6JUyMONns9ZNRL3TYDAZA=;
 b=jg7rgoAo5Zy+lKolQlZ+jY2ugzCpJ0Q10JSKIWWy0sivsNIo5wXIVO1fKgNtMENomdOBo6wymbvihwyGp6U7lum2LoDmhwDVsqGaUzjR1AoBXPc2vl8PWQpdBgmKZHJLlhjJylIXW5Ox2QyKE3d63rnxAUW811JI39G8ZJJ+k4iu7Mhrvo5tfuSAMAC64jWIdnEJSj5M3YqwaiYWYcOdoUDyJm4fAE9K6cBhRRI7QkUxowEoiJr/NrBP3D4V/FPwVdTt+G753J00tkxCqJ+nIoo+gIhqeaOLUF+5+hC8hfdtJaHs9ilkCRtlencXkodXuOe85hYyM43OXRg67JJl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c1w7LYaoCSbDg2ebgYAAc6JUyMONns9ZNRL3TYDAZA=;
 b=vX4Z8FcNf85y8NX2STbN0TzLsQxH++vyUamI0dbHp6bPcJN0KM4+C/jY46UUbOv21sJEUX37ALQzzwyBRhXDOdPZksmWq7fgXpg4f0dwWbg5kAeymWPTciWSdaVsNwb6z+MwD3f07EqEIo+VXr7oM4iirNsj2wG/6twQl7b1mZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from CH2PR04MB6741.namprd04.prod.outlook.com (2603:10b6:610:96::19)
 by CH2PR04MB6710.namprd04.prod.outlook.com (2603:10b6:610:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 05:43:55 +0000
Received: from CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::d062:2525:29dc:13df]) by CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::d062:2525:29dc:13df%7]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 05:43:54 +0000
Date: Thu, 18 Nov 2021 13:43:46 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Check GPIO description to avoid crash
Message-ID: <20211118054346.GA3796880@anxtwsw-Precision-3640-Tower>
References: <20211118031125.3778969-1-xji@analogixsemi.com>
 <CA+Px+wUc8+5HtkS8y4b9aw7m+wLS+zC1em6VKRNog1QKnJrZ=Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Px+wUc8+5HtkS8y4b9aw7m+wLS+zC1em6VKRNog1QKnJrZ=Q@mail.gmail.com>
X-ClientProxiedBy: HK0PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:203:b0::23) To CH2PR04MB6741.namprd04.prod.outlook.com
 (2603:10b6:610:96::19)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK0PR03CA0107.apcprd03.prod.outlook.com (2603:1096:203:b0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 05:43:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9c039a4-e390-4bbc-e352-08d9aa56684f
X-MS-TrafficTypeDiagnostic: CH2PR04MB6710:
X-Microsoft-Antispam-PRVS: <CH2PR04MB671096ECED6EB86C65DC621AC79B9@CH2PR04MB6710.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sFlf9Ft4V1RKm6ccDsnoYk3wrpAfIQq5rmI7/SBPezO6Nt1fCpo7RQUprmnBwkA5GlQ0QeBz2Y5VySqmVdIlzHW0DTeqacffgamdsOCNEni25q1+NjC8VaeWqQtMVccza+3fdvcvmoJbFtYXA10uXQ30vjim0PbyQc2AclQSDhFbHPEPk/fCThQRxeuTsmBM7XAVTo/O2++7la7k0+gGCamz3iMcYtpiFWEVc4HyhJlthVM/sjLCU2PSqFRB+2gskXyOGscps8fdOwkjo2FKw1KjojWZrC8mBOiNqoxzBUIAcVf2wXfKa6F6WLwUd1Z/XHVRnIkVnzZq5XUnTzxl1rcgMs0UMO39O5p/+X318mBiPzhMVunJWU9garviCh/a+ITUSCbrvdw6NIjTiJhCw35FfJ1YGt8b9VdbB4zuE8dn8uHSfd2W7AU13ARqIwyHrp0AbQOPeJvlMHdXEumBIXAah8+CT4UzamF3DVUXAZqdsLJrX2gA+P1qLw/tC8fGr9CpiwF+clrlG5HO8VqblRd2gOFQYIqo4YCl+rGlwhMdcTSv2BOiGu4WKYpL3Ra7ngWeDJNBos6zAcR/Zbw1KVQer2rKpuZ5u6y2LSsLoGIezbgCxBEvQgXMg7nASlDtAyrXvi8J0LA4nFH5gI0ceQIIRZCZVS5X1hrXztsT+lNT7efyAUuuJ7pBGS2i9EDo8oRDzRnQ5dfbfoD53r3SB4W22pxprUe/Yu4hk2EOcitDgnsKoh84CMOH/BdyAdSRVCIDIj9TRrRhwPafwg//DoWjjM9DPjBGjgw9TF43Nyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6741.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(38100700002)(5660300002)(956004)(7416002)(6666004)(9686003)(55016002)(66476007)(1076003)(38350700002)(107886003)(66946007)(66556008)(26005)(186003)(6496006)(8936002)(4326008)(52116002)(966005)(8676002)(508600001)(33716001)(33656002)(2906002)(86362001)(316002)(45080400002)(53546011)(55236004)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MeIV+gNDXuugK3GCXHE0KdR6fccTF9aI/zY7BbaK6sAx+RMbjuSuDLmECN/K?=
 =?us-ascii?Q?no+Cl/AHWJN66O838nsItEp0lFK5WlEurtSrLvz29Y93PY6GtuBgDPSJFZ1y?=
 =?us-ascii?Q?FBEpIut2Aac2K3U/dMB0lKX+iIr+u4jCk89Lnmsq3zwWEUwUr1bvXilyc61U?=
 =?us-ascii?Q?Z1zOnIFGIFXEypiWLjp5EUBRVFmF8zCAb2VlbLSnhGoIBuuS64xBSx/jSVRM?=
 =?us-ascii?Q?GsTbvUNDNXVq0qjfDlgtlz/VhmSoTtjgRB6N3wPV0bDTEl+QsDq8XzSgD1EI?=
 =?us-ascii?Q?tmK84uh7gqKWZm/PRr4GzNptsMQQenLdD2PVGi+5VyY0GN+FtcyUQju98ssC?=
 =?us-ascii?Q?8ueV+QoORhgvh0ZFk2X15YUjzZWpaE+2D4LKoF3R5YDlRqXOQGzs6Oc9Vt9c?=
 =?us-ascii?Q?aXEGRKT3ubbmUeQ8rI4AGHUpDp9fCCZdGO6uXyuYdlYOhViNwqAyapnh2i0d?=
 =?us-ascii?Q?j+DXAJV0IucivoALmmHF8/dINdtovpRTh9IzGCh7W0YA/mIX/052Dbt1HMir?=
 =?us-ascii?Q?IuJwoSzd6cXx+usnHKOT5HLifzh0H6S0zD2rORguXhvadUDzthNVNL1iB0qm?=
 =?us-ascii?Q?xiF/uUQ/tayjyfj9GxgE090Vxy23jqiu3lc3IqBnGKsKY0eebDd1hG2WyaWv?=
 =?us-ascii?Q?jc1OFGfohIqKsUPiVxbVIsVz5mN/BDUspH0plmzA9Gh5YuIfYjUg8Rl9Uhtc?=
 =?us-ascii?Q?NrI9i+MQrJNrlGeAHwM67Q3DSbCkLvtFFIsRUvN+imZtIl4eSLHKCOLKzLJI?=
 =?us-ascii?Q?lz5Ouatog3qgrP88/1CCaL873HinQHx5ehJEMvxKusXBl3GLUwPpNz6c/XvD?=
 =?us-ascii?Q?DLOKDWIkkVDPp0yDxxfNvadOGZioxtdXQdF7Y6gUx/JuAwsXD1Q9WA4MgjUL?=
 =?us-ascii?Q?iFSB9J07eXHhTAfAJu9WAPKBDGsTuTE1W15Q8b0NiLzlrZSni3yACAcbxccL?=
 =?us-ascii?Q?JWjRYPkj8Yycw9JB0fbjt+rVczYtwuXFPtQ/cfHbRoiHr2VROjrHAjPZW6cy?=
 =?us-ascii?Q?92lacVo0+zgqe9yaHEybRnrt4z6Yka0TBBWExC8v4vFSSs2/Br96haWSjbvc?=
 =?us-ascii?Q?9ldZOKVY+tQVy1yBxdqjA8oFuGAmILIgnMz/D0ljTUiVjtAI0xT5q/7B8bfE?=
 =?us-ascii?Q?HT1SAndoEFGNHF47PBXwqo4gHO8+LEV77EF9Frw1vil9p8VKi1+9hGAibjZc?=
 =?us-ascii?Q?GeJUBRoaU5ykMfo+g9aX1AoyIXnZywGPJVhlHd05HH5/RL7zKqem5BmOAjdj?=
 =?us-ascii?Q?NLP+aeMW5eZzxUcjPwIue/80NCi8Qkamdo6iv3FnoeYPI0+NFBKND47DQB4d?=
 =?us-ascii?Q?3px2gt/HJv72u+y2iAHZ5XcH69gYB9Wh5dnsCos47dw6HFaPP5ZRk1gitajY?=
 =?us-ascii?Q?tDVEPyKAoprYkmBW/YrkAuDVuFcbBzv4Oe8YgLhce8MAYOdXh+TbIESLo6/+?=
 =?us-ascii?Q?0S0ljFIHN4WDgT8W11mfr5Q98T6HuibvvkizzZj4JrRLokMYRVgM4BII9cyX?=
 =?us-ascii?Q?qyDtkKBls0tl8qfhCLWoF9Fd/XDnq5qhDEVwBulqs1DO8rdTOeg5wLoRXfcW?=
 =?us-ascii?Q?UxseAlZH22RK0btgEiFxvR9SuBWx1VtTEPbSaL3WkPyZ5gfsPwvMlqkv+Bg4?=
 =?us-ascii?Q?Y4HNybVfKddpQqBQvOqrQVk=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c039a4-e390-4bbc-e352-08d9aa56684f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6741.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 05:43:54.6667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqaNfmik9uWgaAVqD/AzBHFgZv3MrP20KMGh2/ujcIzVxvMnWHpjeNUm9zUu3OS17Ez4iU66cuq8KraK8IMIVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6710
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
Cc: drinkcat@google.com, pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, bliang@analogixsemi.com,
 Laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, sam@ravnborg.org,
 qwen@analogixsemi.com, dan.carpenter@oracle.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 12:52:14PM +0800, Tzung-Bi Shih wrote:
> On Thu, Nov 18, 2021 at 11:11 AM Xin Ji <xji@analogixsemi.com> wrote:
> > @@ -1098,9 +1098,18 @@ static void anx7625_init_gpio(struct anx7625_data *platform)
> >         /* Gpio for chip power enable */
> >         platform->pdata.gpio_p_on =
> >                 devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> > +       if (IS_ERR(platform->pdata.gpio_p_on)) {
> > +               DRM_DEV_DEBUG_DRIVER(dev, "no enable gpio found\n");
> > +               platform->pdata.gpio_p_on = NULL;
> > +       }
> > +
> >         /* Gpio for chip reset */
> >         platform->pdata.gpio_reset =
> >                 devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> > +       if (IS_ERR(platform->pdata.gpio_reset)) {
> > +               DRM_DEV_DEBUG_DRIVER(dev, "no reset gpio found\n");
> > +               platform->pdata.gpio_p_on = NULL;
> > +       }
> >
> >         if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
> >                 platform->pdata.low_power_mode = 1;
> 
> devm_gpiod_get_optional() is possible to return NULL (see
> https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.15.2%2Fsource%2Fdrivers%2Fgpio%2Fgpiolib-devres.c%23L250&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C40e84a44676149c2544a08d9aa4f37f0%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637728079481953910%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=2UPuAadtM%2FObwkwE6fLhJr7uCfWN%2Fr29o4t8uqUU2Ls%3D&amp;reserved=0).
> Thus, we should use IS_ERR_OR_NULL for checking the return value.
Hi Tzung-Bi Shih, IS_ERR_OR_NULL is better, I'll use it.

Thanks,
Xin
> 
> The cases here would work fine except it will skip to print some
> informative messages.
> 
> Acked-by: Tzung-Bi Shih <tzungbi@google.com>
