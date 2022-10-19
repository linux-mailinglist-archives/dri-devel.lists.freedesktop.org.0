Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679DB6037FE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 04:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E7710F0BF;
	Wed, 19 Oct 2022 02:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80043.outbound.protection.outlook.com [40.107.8.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C7210F0BF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:23:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZDX5NkdCCxseIwxUKTCqXY46mGHV3VrnguFism2tocZ0bg96VWaHIjneEcorF0RjFGWmgr3JIfdP9cvwD5DIp9DMCCdrltsxHXuf5LKYiAE0wSIgVeaI28KDVFSABpjEwi87wPp2sAIRF66vlGnBPzCvL8n4a1fuOjXB/vIOAEda3hSHKWmrxdMTueIp5DbZlw71OQwohUOTyIR8j/PfldT1rp33fQOVabYB5N3vu74svzUEuiLRoJE/Td3oX6YAAGCimQudXcBN/GysNzwwFzGqYa2QHYGQ8Kd9a0qW8ZhP1LVfLde9wRbjyX4zZ4PF8QQbadjCt3WuOMhqGQ8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJtZh4//vd0pgYoqaQACVbf41pEueAin4tJfeuhl4tg=;
 b=ZzY6UJu6xdXf8UeRDo0EdblPsnHqz4qoDudGpdolXj8FZAXj9mEIZEenu8ppVYgz3vU4E7xPlsUQA0pENIaWI6d1qLIqtjX2PRrkZwXqiB1UPaWhSPWcqbELmJPZ7vV790573wkamTHojMfHW0I1KWcYQiEjOjo6NMatLLwwY0l5hePwOuiDEOUAnWOXqlfys9z54je7Iip0hOYhkOEaCeOZKc7z8zLrWxlstNszh4IMV3MBV9PWvgza6brGoxlSJl5TaNVLbOVUUcsIjgtGyP3d5Mx1LjTBqLs7mb1D1z7G3B7BTyu8s+g15aTqp8Lhn+0i/q2x47jrQOHTQm1LiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJtZh4//vd0pgYoqaQACVbf41pEueAin4tJfeuhl4tg=;
 b=XFZRQG6MXDdg9Rd69/KLmxYfXKo0GudDcYhh4IKTArIxnKsEOoRSXkp8lC80ejxt7dSVdSXZMZf/J8q1Lb9HGsgwE8filnKSNTiZjoAOPkn0Z/WFzPfZKRVh0snFp3TyYYoFRu1QeKqeapdLNnARLyRHOu9uiqzhkhh/47ZLSis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 02:23:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 02:23:19 +0000
Message-ID: <fd29de19b976148011ceb39aab879d55a2f243fb.camel@nxp.com>
Subject: Re: [PATCH v12 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
From: Liu Ying <victor.liu@nxp.com>
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 19 Oct 2022 10:22:43 +0800
In-Reply-To: <202210190730.rlLYtBVv-lkp@intel.com>
References: <20221017092308.249665-6-victor.liu@nxp.com>
 <202210190730.rlLYtBVv-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU0PR04MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af3ac7a-96ec-4b39-d4e7-08dab178e359
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z4PYJluh0poc7zrBkPjyNc/tcV2WEWT4sPKCLBPBVGKWHz2OS7sU5pGSD2T3gswjX0AJNx5v67pD8gt01iMfRutOvCHgy3aJiT3Um6cDuSOCFUtjXGTeIhhumKvVwQBZJez8CTnXQJh9lX2JrewIZ2kP2ac4vubOM97MkvRAQHW/GhwgeQIDurqND/3gg8qDJAY+TaE/pZvhF7ofVfwXuJcFL6DFrIgGWs5dN3RRygsNz2crue7GWQtDvA0/6Z1ZCE5IC6qpwdhfJTmR0K5ri9hzUyRVOr4QJ87hfj/5oqCfy4QWYVdehPyozs0Kr9fjeU3UTU7X+ZA8z7GSqLCFXTJSCIeo0fE3Kg49yRWhUd0PZddidrG8KKV4ei5SeM9ptZbs9igl5szhTHi/IXwladv/k/NCZSDqLRLIHJswkKhOhHsiPgCBtOcID/UnqzZWXj2ye+hFcLrCv9vslUnao0rHpQPYujg8SweetOc9EYDF0nAWt07gCJGozGFcRsqFVzxy44cDsO2/b6DCt9EEwDk8P47toNDVLYiH8ENA+5WeQ+cMtIR6TnbLkD37ZTmZCf17eg0N6A2mS5E1IzRtNLutvyJsgcsIfYfAVXAF86IxrLAl41R3IKofIK+hs2XQ3gRPc+49oJFBdT3ruzAW1buGycTv05hu0X9Ptv5N4ByKl8TbtGN9LL7Ix7gHwvOCeVET7LlDUPRiAXGMtgHJ+pXWQLpxNr+O8RX96XHUgDCeG8CI29rLzPUjjSsJAi2O6hznG9XMnr9wqM0PXFavr7iJ3K14LCpetDMmXQknZdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199015)(6486002)(316002)(8676002)(66946007)(4326008)(6666004)(66476007)(66556008)(52116002)(4744005)(5660300002)(186003)(7416002)(2616005)(41300700001)(2906002)(6506007)(478600001)(6512007)(8936002)(36756003)(26005)(86362001)(38100700002)(38350700002)(4001150100001)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGtDRzd0TXRNbFJ3SE5OQXh3SjY3N3d5UnhVdHFsTFJrTkRmeWtRS3BDNmhW?=
 =?utf-8?B?V0I0b0l1ZmxQekg5RFNONHF5Q1U4RVB2WS9uRGN1L1lGSytTZHhXb0UwU2U1?=
 =?utf-8?B?ZXpqc3NIeUxCOVVyVWFMejRVYUs2dnRXckUzTVRJaUNodmtyUHA0VHh5d0g1?=
 =?utf-8?B?VUhPZTc0enUwdHBsSUx6RWsyN3lVNTkra3o4NlBxRlg5OWhUdmREL2I3TnpV?=
 =?utf-8?B?ZlUwT0ZrMEdpdmNSajMwTWFwR0piQms1R3F6S2F4VVkyZ1V1UWFUK2RkU1ZK?=
 =?utf-8?B?K0dKbGxIR0xiU1YvS3JYQ3doMXpZRVBSR29LVjkvaC9GNThuZXNuUmJmRU1P?=
 =?utf-8?B?Y3VqVS9odFNibEZkTVJFWGVSTG1jcUVDRVVWSnNBelkycGQ1UU56ZFU0MHk1?=
 =?utf-8?B?YktrL0xBMGRndTBJVGxlWFMxUUQvZkdtdEwyQUc3MGt2SEl3ZkNCSUFrWWdn?=
 =?utf-8?B?TldsWFJjUHhMOXA3NU9yc2RsWFJ0K1ZqTEV2eFlwcGJ4K1Jqam1NeDB5RkRZ?=
 =?utf-8?B?VDZ5dlh6MFpwYUprelBrSmhEaSt6cFhRVVFNQWJNaVg1SEVkWEpaM2I2U1Vm?=
 =?utf-8?B?VUluakdEWkRKUWdOY2wreXkyN1p6RmJIQUd6ZnZ1bnYxcjAxeSt1UjNmamU0?=
 =?utf-8?B?K0pRcTB1Y3JWdlcvWnF6STRndFVLZHNzcnlTTmhoUUs3NUp5RUMza1RjVVFS?=
 =?utf-8?B?STZqS053Rk4xVVdTS1dxMDhLbzQwTlBkY2YvdkNJcVpvR25uSUFPbHJtelJ1?=
 =?utf-8?B?Q29HSGtXSGpNaG1zNHh3cmZ2cW5aZ3psaEtwMHEwTGVaRGdDOTNoTGsvelRa?=
 =?utf-8?B?QjJxUkE4ZDFJRVNtVEpxZGRSenVac3R6Y0FybXBMdFJpZnpoSktZREdhK2dw?=
 =?utf-8?B?WGVaOXB1cC81TDVvbENFRGhaejJGYnpKMWZTS3BrM0NmQzJIRjAzYmgyUXlL?=
 =?utf-8?B?UFJPTXc4bnc4SVdqczBEaHRPS1ZVbVZPeXdMSzZuSGpUTmhvV0dOcS9OdThY?=
 =?utf-8?B?Rldndm5WNXBZNmUraWtKN2tVNGh0b3g4TTIwV0ZnelpMU2dCVDJjcXM4OWw2?=
 =?utf-8?B?T3U4YlhaOUowMURXMGtPdXAvNGI0aUhmQWxOalErQ0poMENTRkwzMS9LRDJw?=
 =?utf-8?B?Q0h5TmJDYkQ2U09uUWFQT1pMdVR4aU8vbElXT2RpNnF2S3IxRVhhbGg2emJZ?=
 =?utf-8?B?RDdFTEdrdEJwM2VoVnlkL2FDVUhtNkRoTWFmbWxzMVNiRjFrOWNwQnA5K2cx?=
 =?utf-8?B?WGFGNHBxYzREQTZJZFJyTHhiVzltWktjK3lZM0YwbmIzYStvWWZsbS9BQjdE?=
 =?utf-8?B?clhuY1k1MjdMbUxKUFA0enQ0MTFQYXBzRDlHaTFLaGlkWGdVMWlKcy9qMDRZ?=
 =?utf-8?B?cFFvVTNyNENES1BwZ2pLOTl5bkF1YUJCQ1Eycm83cEpxZGRJdEd2K2tCSXJ4?=
 =?utf-8?B?RnhMY1F3UjNZQzNEcmJhNndlUWUxZzhyQ1pGQ2hqR1JSaWtKQzQxT1h6UWZ5?=
 =?utf-8?B?L24wNUxoN2p0Q1grdUxuN21iRFJFLzRYOHJqUlYwL1dlcFIxTEtiU3VOSEFM?=
 =?utf-8?B?K2poM3gwK3dJZ0R0Q3NCTzlGV0lMOFRzM1YwUFZFNWpWUXpTUlBvekp5bVMw?=
 =?utf-8?B?dmhmRlk1MENweEhDZUlXellGc2htZjh0UEJzY3AyYmY4ZmxyOFpkQnMzSHdE?=
 =?utf-8?B?ODJzYXQ2NkdaMnF1dmI4VHN6MEZYMnNBMzNnUjJrTTNITTJvWG5TaTcvTUx5?=
 =?utf-8?B?VVJwUnNKbDdWdW4yZGdKU1NkcUprN1czRzRVeFlOTFpIZ1ZQTVd6a2pvOUFo?=
 =?utf-8?B?WFNWZ044YzhJdnZ3blY3c0RYQWl6Vyt4VitiUVVIVGlxbFkzVjNoZkVWMDV6?=
 =?utf-8?B?N3JGQkhTQmI5SW9jejV4ZC9RaXd0Tzdzdk5KbEJFV0tsZUFDWjgvRXBQMUp4?=
 =?utf-8?B?QUhYTjlORllsZCtXYWVaNW5kcEorbGVmU1Fpdm90UmdUNXcxRmpjMHVoWlhB?=
 =?utf-8?B?Si8xVTZCK2ZBb0gvSFlZUkl4UXNRTTlhRUV5MXhRdStaNzlSTzNDTkFSTFVo?=
 =?utf-8?B?TWVBbjdNYWM2ajBLZ0FxWmptZjFncVdUd01iUDRVazlsOUg2SFNDY2oxRXkx?=
 =?utf-8?Q?LlH8Ky4yImSJm6jJTLTYN++pG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af3ac7a-96ec-4b39-d4e7-08dab178e359
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 02:23:19.6902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3h1EzhriieRjeFoQ7KOhDT2EfSOnmMcuJJ4TlHMzrDkUsaaBQ2inGWYZTUhYczoIoqKAvGHrUpEmaF63+L2qCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9562
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
Cc: kbuild-all@lists.01.org, tzimmermann@suse.de, marcel.ziswiler@toradex.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-10-19 at 07:41 +0800, kernel test robot wrote:
> Hi Liu,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next
> drm-intel/for-linux-next drm-tip/drm-tip linus/master v6.1-rc1 next-
> 20221018]

[...]

> All errors (new ones prefixed by >>):
> 
>    drivers/gpu/drm/imx/dpu/dpu-drv.c: In function 'dpu_drm_bind':
> > > drivers/gpu/drm/imx/dpu/dpu-drv.c:67:12: error: 'struct
> > > drm_device' has no member named 'irq_enabled'
> 
>       67 |         drm->irq_enabled = true;
>          |            ^~

I've sent v13 to fix the potential build break by removing this line
since drm->irq_enabled should only be used by legacy drm drivers with
userspace modesetting but not imx-dpu drm driver.

Thanks for reporting the issue.

Liu Ying

[...]

