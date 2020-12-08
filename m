Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F92D3D7C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A49B6E9D4;
	Wed,  9 Dec 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2105.outbound.protection.outlook.com [40.107.22.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B6F6E981
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 08:34:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zxfmsu26LgfdsDw/RT/ywadAhITULxVW+2/OW32wy+yiVhyBi6SQD59OiYjTJ3cgUitBgSJZ6zOtf+YA5uAFcBMIRv5CZGqnW2y/C3wnQllOVB+HNdcVYzBGFrQYkyU8iGT8R8JyfpZnz7N1evRAWuvXUh/NBdepufcfBtVibW2EBUEcch8bgu80zTZXdCcsDV4OkMUfoaQ2DNBTenWD/oqNthHaV3J8v3xEyTA87WU/YiA68PTgyEP+ZuYGbHq80e4+QDMOIgPkpj1eotCDyuPj58n5l0Hqgoe8zFp4SYKV97nuG95lhbm5urpA8J2d2hMK1PcS/POPCFpSQqZx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUa3dLwySQeY9G2QucDNcDBNuyLx5DyvRZtx8VJFFRk=;
 b=PDVR9r9YLNH4Z+kyjWYE4bXiL5bZ4MXghzLS46DbLqzvuSAOGnJRx1a/px6tQpKIc4F7GWOlTt09EbwmC1TzZiMUBWFWeYuzy7hui/oUXuZ76znjgSByNSrs2nN8HfOCU+tcr0CjdjmY//oDCGs7w708LaaKI5A3/poPJD1b0pJXgPFMlB97k2kRf4/K3JQde5XDPcg+97xudkp0vJBsCk4Y/fsyn4WReyKGl04GTsJztFNDbPytncj5HGrpfdbbpoTVFcMZODHkC86aWrwHbA3qgQTe/lq30CDBwReWn4ZTYZdHm7IkulhI9RS3yMwhH3PKJQP3l8WmIQZC67r31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUa3dLwySQeY9G2QucDNcDBNuyLx5DyvRZtx8VJFFRk=;
 b=M1fzrW/p5cw5Bn1DA8FAkIt3M7Si5nsUApqPZ7yuKPMZ5GrEi+ovTQ9qeakrCEw1Ll9gjDkCIF66ga9zbyKqQRXZ4leFINN8SrRamDIw2Np7zzAbnIB+PWxwg65e549aoLnLq+lnr/oKykbi5v73yCwcOoESX1BSqiKo1l8qblE=
Authentication-Results: raspberrypi.com; dkim=none (message not signed)
 header.d=none; raspberrypi.com; dmarc=none action=none header.from=kontron.de; 
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3588.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 08:34:06 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862%7]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 08:34:06 +0000
Subject: Re: [PATCH 2/8] drm/vc4: dsi: Correct DSI register definition
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20201203132543.861591-1-maxime@cerno.tech>
 <20201203132543.861591-3-maxime@cerno.tech>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <cfcfd349-e0fc-8bd0-4c9e-6cc33bf5f056@kontron.de>
Date: Tue, 8 Dec 2020 09:34:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201203132543.861591-3-maxime@cerno.tech>
Content-Language: en-US
X-Originating-IP: [80.147.118.32]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.30.119] (80.147.118.32) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 08:34:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbed08a9-67b2-4731-ee60-08d89b540695
X-MS-TrafficTypeDiagnostic: AM0PR10MB3588:
X-Microsoft-Antispam-PRVS: <AM0PR10MB3588252EC0AC444A937801C8E9CD0@AM0PR10MB3588.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JaOTnuXvL6PoRLYOjc16jhg+wJ6Q8g+wNrP4IO3i3dhACgK1rm+MFv75X6Tp/p+xdosQl4Y6f3zLwFbqrfQmtJdnyqHltt9WyEoB4ioOwXaYzmic0MYwOvZGy56cFzLHrqTM/G3ba1faLuYcJhaZOMuYOFxvTCRQU6Hu5CUEyEJwcrx+Q0zxsq//Qd+oy0bMIKDjMmY6NS+Txi1NjU/Wo1yWwJqGYM+aEFoMgHtcQIVI7yesNrfK7k63A2opgIzlxsl1CDQC27DMFWbM6Kcln4dJ00dgxrTUSwjHlITwt+Xw84OvyQ8wVY9Zh3UWTcFYIkrqAW1Mqu4yJF1QC0olE20WqJLgX5N4sj7jWAtF781rDDbphGjKqUMqAx4LWpCjb+AJBv4XV80/z4ThVK+PMicm+WjGkVPU3iWPU+2YE9LJUCkW8uhZkItxu7UfJubd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(8676002)(66556008)(44832011)(26005)(66476007)(53546011)(8936002)(956004)(16526019)(31696002)(86362001)(7416002)(52116002)(16576012)(66946007)(2906002)(2616005)(31686004)(508600001)(34490700003)(83380400001)(36756003)(4326008)(6486002)(110136005)(186003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHBtNWlSMm56bGZtWEVhNm81M010TUtWZktMc1V2ZlNQVnpIMFJXd3BZeFZY?=
 =?utf-8?B?bml1SlFIYkkxb2d5R2VnOGozU3Yxc3RNVTE4ZktTejk1MnBQZ1JsMFNvcDhI?=
 =?utf-8?B?UGFiTXJjbzg5K2dtNUV3VElPQTZaOEJ5ZzJjYkRlR2VPdnJJMGRXajFhSUZN?=
 =?utf-8?B?YmVCd1lDRzdoWm0yY0EzMXllM2QrU013NVdsTTgzWHdKcmg2bjlESUVocUIz?=
 =?utf-8?B?SUc4Z3FZZ0tub0NpY2UwK0xNSEppaWt1SncwT0dLSlNDSUtxSU1nUXF0Y3RS?=
 =?utf-8?B?VjNEQzA1OVg1Rm84aVZJSFZTWnhYdGIrT2RyeFViYXBEZUs5a2xDS25RZmhL?=
 =?utf-8?B?Z2pmMVJ3QkYxZ0Z2SGt6SHZTbElIZk4xclpLOVVQWXJiUTBSZCs2V1NhbnY3?=
 =?utf-8?B?c0F6ZEtHMGxNSWxMK2ExY0cwN3FxRXk5TURlaktzbWo1MW5RZFdFNTBSTk9s?=
 =?utf-8?B?QXVDVjArazNWVkFDWjhkU09MUnNTc2xqZ2VBeEpwK1FRR3dFbmxRQjc0ZGt6?=
 =?utf-8?B?MmpTdTJiNEY0MkxwQ2VJQ0ozUGU0WEZYNEVDall0Q1pmWm50TENMdVdhK0k2?=
 =?utf-8?B?QmZPWGRqK0VqZDcrNlhBcGdPTDJ0TXBaMnpJSDd2T2srRDMzYW9FbW05U0lr?=
 =?utf-8?B?UXpjbnhSajZRdnhQQVE2Mkw4dEdzTGNsQVVTWXNRK1psK0ZXYVA4elpELzQy?=
 =?utf-8?B?SmVPOTUzb3dwMnFWY254VGc5ZDRXcGUzUE1HYXBHZm5OUFRlRERHc2g3aTNY?=
 =?utf-8?B?T0dkek0yVXQwRmR6emFwVC9CVWt2NGxReWpjSERRc0k1bFljeDV2dmVkaXov?=
 =?utf-8?B?WUloV3A5R0ZuMmFjajUrT0RSR2drTEFvVFVERVBHNW9CL05ZVmUwUlU1ODdt?=
 =?utf-8?B?MVlOUnNqMDZ5SnhCRGQvNng2MXlYMENHL2hyQ0xJV1RrK2pTVmpHMHBhZ0t2?=
 =?utf-8?B?aXQ0Y3lNK1p3bVFnekZvdWZlbVF3SEZvWERNbVV0ZkV5dHZSWlM4ZnV4REsv?=
 =?utf-8?B?dzduSlhNZzFmbzl1MVdTQ3p4SnZlM1J1cW12Wlo4bkE5SFJKUUpoUkx1NUQ3?=
 =?utf-8?B?eGhJUGZpTkszZndPTys0T0NvS1NPbVdkdUFXSDVHTjZlVWs5QTQ0Q1hwOWhu?=
 =?utf-8?B?YmlXL2hJQ1pzbVR3cFo3YjVUNkh0ekhoVk1uUXFqbmxKZDIweVNGNEVvK0h0?=
 =?utf-8?B?aHhIVmlaUlh4Qm82T1FFOStGa1poTVJsMFI3ZUZGaTRCMisxSVRwcEd4dXFk?=
 =?utf-8?B?c2ZlTll6ZEJRalNYdGtGVjRNdVRTdXM4ckxNMkdUMElob05raTZabGZocDVQ?=
 =?utf-8?Q?D+EVDWYDs0VsBRY2Lxg5CyAtJT9ELeyvxI?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bbed08a9-67b2-4731-ee60-08d89b540695
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 08:34:06.6280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PG4wnI/dItwDg/Lb1f8P9t5mVTGGE5PwuXaXov3FpLzMWG0SXNATcolAzOq52Miy3+cAO7bhziELuWfu/q9jEVQt+rBC9ytEWTxePAxKpLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3588
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 03.12.20 14:25, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The DSI1_PHY_AFEC0_PD_DLANE1 and DSI1_PHY_AFEC0_PD_DLANE3 register
> definitions were swapped, so trying to use more than a single data
> lane failed as lane 1 would get powered down.
> (In theory a 4 lane device would work as all lanes would remain
> powered).
> 
> Correct the definitions.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Wouldn't this deserve a "Fixes: ..." and "Cc: stable@vger.kernel.org" 
tag, as this bug is present in all stable releases since this driver was 
introduced? I think it would be really helpful to have it backported.

Thanks
Frieder

> ---
>   drivers/gpu/drm/vc4/vc4_dsi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index b1d8765795f1..bb316e6cc12b 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -306,11 +306,11 @@
>   # define DSI0_PHY_AFEC0_RESET			BIT(11)
>   # define DSI1_PHY_AFEC0_PD_BG			BIT(11)
>   # define DSI0_PHY_AFEC0_PD			BIT(10)
> -# define DSI1_PHY_AFEC0_PD_DLANE3		BIT(10)
> +# define DSI1_PHY_AFEC0_PD_DLANE1		BIT(10)
>   # define DSI0_PHY_AFEC0_PD_BG			BIT(9)
>   # define DSI1_PHY_AFEC0_PD_DLANE2		BIT(9)
>   # define DSI0_PHY_AFEC0_PD_DLANE1		BIT(8)
> -# define DSI1_PHY_AFEC0_PD_DLANE1		BIT(8)
> +# define DSI1_PHY_AFEC0_PD_DLANE3		BIT(8)
>   # define DSI_PHY_AFEC0_PTATADJ_MASK		VC4_MASK(7, 4)
>   # define DSI_PHY_AFEC0_PTATADJ_SHIFT		4
>   # define DSI_PHY_AFEC0_CTATADJ_MASK		VC4_MASK(3, 0)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
