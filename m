Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428BF4552EF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 03:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A736E151;
	Thu, 18 Nov 2021 02:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2107.outbound.protection.outlook.com [40.107.93.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB426E151
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 02:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/oPdT+LDWc2CU01CxvptM+spPlS2Vhz/sK1nUa4lARM4tFBPJ3SQ40dAjaCX5Z91mmlSVHI3macxIaPFpXbA9ALIG9Q+7jjHys5PfC5x2FlulWjBngt3rtdyCkKgXqSMDxLMSu3kvTsFpsYNjn1gWrroa3XmpK9kyllpCpsZFsommMA/4Kjheo6xd/+QFcDnknZIvXD6GvOC4rK63Fml1jXJ3C577sGuYUw6O8G0Db3QeGa4F9exQ3GxH4u3xzELIfzskmnOkjAbcDGqfDZfUWFRuC+u+nLeW4gG4MKUjoEAH5RYX5bwoe8RI08fD4wcUX1Zx8jhGjt3Zv6uMkATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVFC2WBFrREPIVCFgcfNERWNeGfLQaWQ02oxXyCPnAY=;
 b=Psg42+pIVLwp4WSJgeqKEEkEQAkUNGIehG5+pH4xQkSL79DM/u+XrhFGT6+oMjtlqXLUGUQGwFwiZjopEfUh6W8MprTwQVTYA/2QiqeFy7Y3xzlX7lC1PVBddbKNAONpw8m1Lej6NWrWN8mNruNYuc65kvm7Bdheq66LiuCt3B1mBnUtmh7exLo4VcRHK4WX5oCktsIb4Ufl5ne/6+4OjnF7zwutGiVn5VRfFSSY/+QR7LZSvgZbExiRdUH9LOgkjPVQq1/NrNiL/4RmkuM8YQH6B69AvShAZ9t3EoWLt1qBZak68bTxw69yfjryxX0ccaKsfzc6N5Vcv8YX7l5vVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVFC2WBFrREPIVCFgcfNERWNeGfLQaWQ02oxXyCPnAY=;
 b=OOkkbTcfGR0fqeyP296iGLPPnDA0KdVsW2YYnmFRx/GRMJQN2CjYI+XXyW8LJM/Iz2x+tAaxvW4pZLJH9XvSbJlfShWCu3/ApNKOCI6rNV6BD4stbGMYqY1m849u8eRXNhTHtv6FTu5TC6+mb6vFVsSveFy6Tl13hyYshzP7lXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7630.namprd04.prod.outlook.com (2603:10b6:a03:32c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 02:54:08 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 02:54:08 +0000
Date: Thu, 18 Nov 2021 10:54:00 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP
Message-ID: <20211118025400.GA3778782@anxtwsw-Precision-3640-Tower>
References: <20211117134720.GA6968@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117134720.GA6968@kili>
X-ClientProxiedBy: HK2PR02CA0193.apcprd02.prod.outlook.com
 (2603:1096:201:21::29) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0193.apcprd02.prod.outlook.com (2603:1096:201:21::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 02:54:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3ca7b7d-1a8d-4468-6d52-08d9aa3eb0ed
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7630:
X-Microsoft-Antispam-PRVS: <SJ0PR04MB76302828CEC1E6FEDAD5D4C9C79B9@SJ0PR04MB7630.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etbG6PKFoq1/q8daSB9laJJxh5axGeS2NPhxMWBNi3w5Ul372FF26MmJoNqpnKvr/KPPn7tt7aYOUfXVJfv1e2Uqir7EavvAroK0aHSqMlLv2PsW4A1/U1aR5l6Zqdit3Uf5vSpfUTg+c2CcjRDr5u4bPUjY+ggZNcxfQW1FTbBafJ4Cd1MtyQDCbAPGm9La2iRhP38quwhUreo3PBu14CGN5B1F6NPw/Tzekhbk+mzVBbQLw+VVQU7vs0rXMypFRxUGKTcPYYsvZqEvqXb7fWR2gG6ziYgIQoji2/YgQkHroDm0PToAC9X6zv3T6K5ehlxkFEoC6/nGVSXJ9BBqhfKbRxVfu4ZtFehgFTMLOq5YnNRyu9eyKAsOLQnY1fwk4iIw5hyc0lVSCVLPRaZFd8GeXpuoxCSzSjlKJtv0HLrC82R+HP7uPN1BH5je9E6lXhsG7zWZnp/3fv5jAr1/NLzDFBdTu7ZADhmKU0pv3lkMsXzU1aNV9s9yxQTdpLl2yC6L57XltyxM5qWrwPI4ECT+YId4U/O4YGYP5RzeMwjwfb2rXhk0Zky1DiU4+Opb1augIh3voy8I+LwxjBNjTiOjTMS2wfDvIhBd4hI7TwbPVAZyYQTEpINFeyVnZlvd+AxYcfNJRPWQ1N+xh4xtNbtvFop+GPARFM55ii0grDdsHwfybEJPioU+j2Gl42Vq4y/vNMbsnWlDfd3PTsmmkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(508600001)(33716001)(6496006)(52116002)(66946007)(66556008)(1076003)(8936002)(55016002)(66476007)(956004)(2906002)(8676002)(38350700002)(33656002)(38100700002)(9686003)(4326008)(5660300002)(186003)(6666004)(86362001)(6916009)(83380400001)(316002)(26005)(55236004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oraskRQHBV3Ce95IWo47NL4+wrN9mhqnkdQkYQkJVRnMstZeCsbrOGvW9pjW?=
 =?us-ascii?Q?61zAp2ZAMP0fQcD/y0DYpUgIZ4GP3gpxmPqKxKbIzUpbiVLlCDvLxS7jcHNk?=
 =?us-ascii?Q?GlZ/2WcN6WI6qMNyyBpBMRCVr5vhAK9HwZNSAEbPEUUEOab3gfkgku8FH4nx?=
 =?us-ascii?Q?VMMVdnooh1tHhe6ETFaE96715Enig5crykR784a8K/ASoG2I7p5Z1cnh5JM6?=
 =?us-ascii?Q?G/FptvSqENBhZwjgU6n//R7/ePZlAjp66/PLoUrNzVRtvUQt/YOtOh0v8nAd?=
 =?us-ascii?Q?8PQWRX6/7SMjwb040aov+koQkcYzDkqgwjuIVwSs/2zwZ5ERzJLxvWz+mJ9P?=
 =?us-ascii?Q?d35GrPq6LTsx0BRitgmvuTWaHYW105ygm0II3P5O6J9LJfSXGyOPOJNOVClw?=
 =?us-ascii?Q?U6F2TKuipbFRm9ZikLk4FLD30M3E+gnVsXhyxV0N53yBDHRE5H43sdyS2JIW?=
 =?us-ascii?Q?tblyFl8ZuBKayPYgV2VzzKdPgLUC6Y3+87WeAF6of0J/J5gT1XY+IsIkC2Xq?=
 =?us-ascii?Q?anEThFZ76D7Q9kxzZJprPRjVr4CAGGx8VdTZ+mVFG15egrV9IhFIW0bM5NVG?=
 =?us-ascii?Q?2vL+ecJ0enBTlWGAuDut1n8WQj26uanW3LXd0EwqaytIVgQgsbqslaLneWDX?=
 =?us-ascii?Q?cUKM3IFPuf+2tuDxBFrwr31KiqSGh9jTkyIrPIxk0T54Tv4/o58k8Ofv1CLe?=
 =?us-ascii?Q?5WuJc+M5Myiqs69gVGl7qshV0+NaPI/Dtb/Iq15vERw1LLcn4Q9RqjhoHT9s?=
 =?us-ascii?Q?hJ+l46XhX+Gi0Zl+YLog3oQO3yp6wyIJGZqH3x3I9nTu8ZcBtdJSVB7NjaMl?=
 =?us-ascii?Q?sKFIR6RbL4a+H1mSbLNqkdiWEfueG+T/kSE8Ff+TGES1Y5UrmWE5W8xfg48D?=
 =?us-ascii?Q?2vfLDOe/zgLF72PP0YZRV83sg4qDozycojgAC+iynNogQSBLbd0hhelQ5TPD?=
 =?us-ascii?Q?4wg2c/nQnMTYtrClP/3nyEerD4Yvf+rreBrRjaQNJs8otUx0YcfybeIyD9k6?=
 =?us-ascii?Q?eihvqA2MnhIVEc24sPsVBF3D3VjWHIBQV1B2arwtz5vNQFcFbEYwcq+CRUSb?=
 =?us-ascii?Q?E+Bf1I8w0jRjQYVxYFzK5F8BZ4Xv+BlbDqQmWo36XZX53mZPaUkdYjiBXpX+?=
 =?us-ascii?Q?3i/iD6VEoU+PM124r72MgefkpqqU8kB39kwYztqxtQjGkYylMUm5TASS8c+9?=
 =?us-ascii?Q?LQu+TpTIRP04a86/unet2TZX5ymo8/xo6baDROXqoTswEl+q7R1ahUyG7yen?=
 =?us-ascii?Q?21YhzPESsDBj5hT9Dm7SAiAYHnoipXR1QLys5QTstaswS4vIIl9ExinQ0pkV?=
 =?us-ascii?Q?1RAkLCDEJANRWCvxONK79yLdNGlnHKEQ8L41vwbEYyTpcOcTD3L1pf9HJCN1?=
 =?us-ascii?Q?AXzunrlphTGYIubZoy7EuvkrFlnOZCHftgAeVaSZAivejIDxyPvaekf6WSHr?=
 =?us-ascii?Q?qVQ1H/5Vz61U23HPRS96OqdzMZlH4j+a2EywbqW7xeCi6xh0KgzWQeUYfKTW?=
 =?us-ascii?Q?CsBfFchTSRb8fbrdFkVIbPGYjgTJQ04b1OKaB8cjKAw2bHxhICF6P0YAC1WM?=
 =?us-ascii?Q?iTcOXFHYr7M8yix8caQ4BxJHzvKApXYKX9OAYTy17SFfKpVXrL/KwbqhvotV?=
 =?us-ascii?Q?TlPseDPev3MKvYaTHxQHb1o=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ca7b7d-1a8d-4468-6d52-08d9aa3eb0ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 02:54:08.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKKwn0NcdPxhqBqt0RLmFEwsqrqj4NndfAScZfaWcPOHGBwORTQEcVOyQzqN3/KGktsf9KikPz+/nfv09jwuZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7630
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
Cc: bliang@analogixsemi.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 04:47:20PM +0300, Dan Carpenter wrote:
> Hello Xin Ji,
> 
> The patch 8bdfc5dae4e3: "drm/bridge: anx7625: Add anx7625 MIPI
> DSI/DPI to DP" from Sep 18, 2020, leads to the following Smatch
> static checker warning:
> 
> 	drivers/gpu/drm/bridge/analogix/anx7625.c:1050 anx7625_init_gpio()
> 	warn: 'platform->pdata.gpio_p_on' could be an error pointer
> 
> 	drivers/gpu/drm/bridge/analogix/anx7625.c:1050 anx7625_init_gpio()
> 	warn: 'platform->pdata.gpio_reset' could be an error pointer

Hi Dan Carpenter, thanks for the report, I'll upstream a patch to fix it.

Thanks,
Xin
> 
> drivers/gpu/drm/bridge/analogix/anx7625.c
>     1037 static void anx7625_init_gpio(struct anx7625_data *platform)
>     1038 {
>     1039         struct device *dev = &platform->client->dev;
>     1040 
>     1041         DRM_DEV_DEBUG_DRIVER(dev, "init gpio\n");
>     1042 
>     1043         /* Gpio for chip power enable */
>     1044         platform->pdata.gpio_p_on =
>     1045                 devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>     1046         /* Gpio for chip reset */
>     1047         platform->pdata.gpio_reset =
>     1048                 devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>     1049 
> --> 1050         if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
>     1051                 platform->pdata.low_power_mode = 1;
>     1052                 DRM_DEV_DEBUG_DRIVER(dev, "low power mode, pon %d, reset %d.\n",
>     1053                                      desc_to_gpio(platform->pdata.gpio_p_on),
>                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^
>     1054                                      desc_to_gpio(platform->pdata.gpio_reset));
>                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
> This will crash here but only when there is an error and debugging is
> enabled.
> 
>     1055         } else {
>     1056                 platform->pdata.low_power_mode = 0;
>     1057                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode.\n");
>     1058         }
>     1059 }
> 
> regards,
> dan carpenter
