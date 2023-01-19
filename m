Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DAF672E9C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 03:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CD810E88A;
	Thu, 19 Jan 2023 02:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2082.outbound.protection.outlook.com [40.107.15.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7112010E229
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 02:05:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdI02PUN+Igss4dqvfRBMRgmEkCbqeBk4R7RFA73UlhAvRJ7Svaw6gsqLpa3Q7PW7rzfHI++punUD3GAVDCeMF0BaR0HeR23HM+fLF5KYOfi9fF/GNy5LQeGo783ptL8JKrBnumFYu6oTngAObab4modYLOCcv09+UKfzd7KYUEuwW4sRR3kvJXx1o/J0MasYE7DmNi0L3JtXb2U+romIV4ETBHE//HUs5WUy0DSmWLa05Ab4nWKhU3D939i9WGmwxuIcC2UNL9FXX1TShH/b8phT6lvOSvTEY2ROildjFiyHl7HvHzQ/TRYIpZcj+ULc79YjF8W1P2xsR1VZwR/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBlmcPN22kU9aI8S+aAfv8vDJQ7zbBMgie+/C5izEJs=;
 b=eiq9RDTkBSpomxcbLqZEiMKoqAz9qvZYmrjmL1hb0SENOJM0cMwfwjDYenENVPfp40mA28z3KDQXpZRvC7CGZVS0SzzWky4HpgFVI/RcZgLzQFyt0bRrvi93IdRk2i038juDQ9Am6hG9G/D/Wr83/d4x0HMCDlnL3bQNnn1+sLhMOwnD1p3OKRzkhY1gxWSbqp79MnEI/YjsuozyoerG9Xs84jUUdDAoGTkTWXkLJTN6W5t2HeOpeCyQVgA9VaF6CkbKHxI/JkJT+8MDxNaR2I/xoWUw4aSEDuRvsfuzq9CVsvUYH7KJAZQICwhxEhedvLMeiZbKbh6S9q+3Y8hWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBlmcPN22kU9aI8S+aAfv8vDJQ7zbBMgie+/C5izEJs=;
 b=mzsho9PTtho3LL0n8nlqt8Eh+i2ZBCMvAfVgU/tnudKsOvO3IF8yDv9FEwf3DGFDEvOWZ1jbM7ENVToRqVDDYCxxYxn7Mtx7Iuscy9V2MAljRRLCcxlwvGKZpqH4Ex9Ea1dOe+uKNSUFYYm3Ef1mqozIjB2ywf3WOHEkZa+4n1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8568.eurprd04.prod.outlook.com (2603:10a6:10:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 02:05:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%3]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 02:05:14 +0000
Message-ID: <6aead6b78540d30ab2db5a8e8d062bc3cde711f9.camel@nxp.com>
Subject: Re: [PATCH v13 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
From: Liu Ying <victor.liu@nxp.com>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
 "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Thu, 19 Jan 2023 10:04:33 +0800
In-Reply-To: <549bf1f26b8212de2d4890a27e396250257aa027.camel@toradex.com>
References: <20221019020226.2340782-1-victor.liu@nxp.com>
 <20221019020226.2340782-6-victor.liu@nxp.com>
 <549bf1f26b8212de2d4890a27e396250257aa027.camel@toradex.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: f7dedcf8-06ab-4369-9fe3-08daf9c199d0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vopjH+xllM+8HoJk9u/ePmaUWqQP3xTvoLLjQCW1PcW+bhkZX12oyGkOX5WoSaRWy1YYRFM5KKHb9BxUmcPT01lZ4La/9wGtKI7laxjXi3VHlz9urfuzB/NUDi4Os9vOMpvZyBhprfWIfb/FhtqZRle1MAAdREypPQAPjGLCRzpuVPh6MRi/NDyk5ukqLKJc4OTJrOsB9gU5zJajIGJkXL6DxJRAfYOekAVJI/wSZhghyRIv4ewRzIQ+oEV/n14XwQHoCL72mJdIyF7JXxq1WMevRei9bxRQS4OAciqZUaqQn+XGVd49xvITyGDomEA/DscMJe7hVzZW9mUWZLezpBG6JxcXcnQMJY9LluyEkGlhmtznAH2BOp3/yHi9nF06AiymclB8FP0q1jIhybQSPUnJmct/Wxrxnk4Bgd4OxdthyBV01LJrhfNDR/UONBJk4sVu577Yjg+sfYsgaUdqxUTjOZgK0d44mgcMvA975tJ7pYYA/5nUGCD2S+wOsL6aEowVNHkuA9ef0El4HdzD++q8AVD6wLoVet5o2HNUPRR4UnyUVzlEH9QYqjVB3QFNBx71wgGvXQKcWL0hML4XUzkNg+cfHpWqj3tPO5T+rSMs2jG7JcoH7+5lnRVaiLtPlnucCWx9CVBNAyNeTbsgI0ni0OH3EZDPVOGvBX48n375eM0g2Szbr2unW59Wh290GwMBftB0Q+Cc0LLXChXbIvfP+y7LSEgtJ33FmFrJEIaMz6j+Hj3CK6T6m5U9W1/b8X7OI1C4bHTrAY+3P8VusMW68dtSBMZU32p8JcUU9v8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(38350700002)(38100700002)(36756003)(86362001)(8936002)(41300700001)(30864003)(5660300002)(7416002)(316002)(4326008)(8676002)(66946007)(66476007)(66556008)(2906002)(4001150100001)(2616005)(83380400001)(478600001)(52116002)(6486002)(966005)(110136005)(54906003)(45080400002)(26005)(186003)(84970400001)(6512007)(6506007)(6666004)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGp3T1VlUmRHYXh2d0F3YVBJcHFMVGswWndpNExDa3Vsck1mN01wcWpyUUQz?=
 =?utf-8?B?QjUzR2VqS3d4SXlSRUxRMmJOUEdIUS8vTEU1K2R0MDFqY3pXaGYvTVpISDJK?=
 =?utf-8?B?a3poYmU0MXRGSVFya0NNcWZuVXBxTEI5WXhMRGtETk1FeVBkNngwdlJDUmdo?=
 =?utf-8?B?Wk9jYWRNR0k5NFBSY0dnMWJyWndYaUZWQ0xjWEpTaWZnTCtyV3Q3MmwrRmJV?=
 =?utf-8?B?czZFUjdEU3hkN25YS1REaFZwZ2pWaVhlV1hNdHlBektVNW5KZFZDcEY3VlVX?=
 =?utf-8?B?V1BMWEhvcGQzdWhabFM3aStLcVRMWXRneUVwYTZIWkdwZUc0WjlpQy9yQXVr?=
 =?utf-8?B?ZkN3MGE0anpxRitjazlLb2J2dUJrQytSYW45OURwZ3c4aElaS3hzTTQyWWl4?=
 =?utf-8?B?bmhObjFXU1NNM1BTQUhwd1VWRTRZK0ZKMkgwRWZqYzF0Wmxjd2ExTG1CWW9O?=
 =?utf-8?B?UkRUR2U3UUFsKzFPUm10bWdzd2Q4VTY0cXpsOFBCKzhtNUxoSDdqcGxHNjNG?=
 =?utf-8?B?R0ZxVVZLSWxxMmoxQUo1N1dJM2kzbFptQjV6S0p2SG5kc3ZndmJCRHdIa01I?=
 =?utf-8?B?dWREU1kwYkZzWERkT3E2Vm0zRFpqZ3lkaENrc3JKMTdWc0ZYRDlnSVh0czdl?=
 =?utf-8?B?RVNvb2R3K0w3OS92ZDNUbVdwQml3aHd0VFU5eThHNUFQcGoxZm5YSjVxZFh4?=
 =?utf-8?B?U3d6Q05WcDJ5UkJaV2NjcDF6RXBuMGVOSk9uayt6VmdTcmpnK3Z0cm9ZZk1U?=
 =?utf-8?B?bHdKZFcyWGRUN0xjTWVmLzhtL3BkZFBqWnE0anpITk0xekpXS3V3ZUgrd3Ja?=
 =?utf-8?B?VTZONms0OWNhOGRNd1FrbEtrOWd6N2Rma3hPdVF6UWErSG55cjk1UE5nNDhO?=
 =?utf-8?B?NXZQQnp0MUpRZU9MbXptQUMrWTVPeEFBT3p2K0hERERKODNVK2JXS1RoZnZD?=
 =?utf-8?B?blNtUHJtdzltRXlKNnc1bzNXcDBnTVA4cnhndXVlb1AwR1VwSXpRNEZXN05m?=
 =?utf-8?B?Ny9OSm13VC9lbzA5ZmhpbDJvRmZRZ1BxWGpyZWJiVW9JSFBWcHpQaW1JcjI2?=
 =?utf-8?B?cWRteVhORUZlSFp6K005T1U2VU1mKzhaa3EzZ25obzY5aDFlUUpvMWt3Nm9m?=
 =?utf-8?B?d2RrS3BNR0pCTmVqR3hTR1hBSldkVUM5VDJhaVRkZmppbVEzOGNUdWgvanFk?=
 =?utf-8?B?VTFnZU0rQ0xoWWlvNTBpeXhVbEt6dU9zNHBLQ1JiYVYzbzA1NDFkK2hjakJW?=
 =?utf-8?B?enBoTklDQUk0djIrRldROEhoNldqMUJrQUVJdmFGcWdlNk9IYUllYUo2RGdq?=
 =?utf-8?B?QnF4VjFJYVdDQlVGQnl0K2E5R0R0OHZ5Ty9VdDJtaXo5cmxTUGFaS1J0bGZn?=
 =?utf-8?B?b0NrS2FKVDZkdWhTdDBCdE43eVRnRllqTjBaQi9qNG1WZnZGVGZXYVdKN200?=
 =?utf-8?B?eFhIV04yNVVFckRVanR1enpKUlh5Q2ZvWVpJeit6elhDNis2RFRQS3pxems0?=
 =?utf-8?B?bGJGeEFtd0VCU2hmMHlEeHpnaURZRjRFNHJPTHUrOXdMaGNaRk9jT2EwdkFQ?=
 =?utf-8?B?NkNQK3BweFIySks1SXhwVElHT1VEM2pBbktDSWtLNDJ3UDlmVlprK1ZGcndV?=
 =?utf-8?B?bDA0dEFLdHJOeUE5ZDFuejc2dUVXMW8yRU5mY2tVbUNUclVkQ3JIZmFTdG00?=
 =?utf-8?B?MlNuUHZyYkVkRnZJSkN5TjBQbnBVUzU1Y3liZ0NzZ090Q1A0UTExZG9MRXFD?=
 =?utf-8?B?N1ZTa3dSTmFyQnZhbWV3VmUzbkFLRG1TS0dDTUNSa1NJSENaTnlKWEZ1c0Ft?=
 =?utf-8?B?ZHFLMHNMUmhOREJRMXEvdHRncno3eGw3aUl0a0lYdk1FREVqcmMzazFxZFU2?=
 =?utf-8?B?U2Y5VkxVWHNuV2M3Z3JNWmRzNHNoSisweFVzWDJEQ09ULyt1bTlWOWlhanRU?=
 =?utf-8?B?bFVYS3dlcWMrdnVKME5GVzlueW9ZVTgvOCttK0pWcGJiVVhIUUhKZ04wTjJn?=
 =?utf-8?B?M0JDL2pMOXZZUkVoam5LNk5FY3l2RmVhc0FqRytXVTVuVE5Yc05HUnJSTmNm?=
 =?utf-8?B?ZENTY1RTblYzRldKZEp6NmQrWGY1Q3FBcUs1anJWSXBZNlN0eTJWRzFGcy9i?=
 =?utf-8?Q?eX4BpfVoCP579nCjRTEMybAX+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dedcf8-06ab-4369-9fe3-08daf9c199d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 02:05:13.7342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6v7GaVaXDHPSmb7lmCvdlH69tg4hWgSm9+JoeDPd2hZW/U6cJhP6ElLwM1AX9oK4X1tZo0m+nhqEelKS1JALnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8568
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "laurentiu.palcu@oss.nxp.com" <laurentiu.palcu@oss.nxp.com>,
 "guido.gunther@puri.sm" <guido.gunther@puri.sm>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marcel,

On Wed, 2023-01-04 at 10:01 +0000, Marcel Ziswiler wrote:
> Hi Liu
> 
> Thank you very much!
> 
> On Wed, 2022-10-19 at 10:02 +0800, Liu Ying wrote:
> > This patch introduces i.MX8qm/qxp Display Processing Unit(DPU) DRM
> > support.
> > 
> > DPU is comprised of two main components that include a blit engine
> > for
> > 2D graphics accelerations(with composition support) and a display
> > controller for display output processing, as well as a command
> > sequencer.
> > Outside of DPU, optional prefetch engines, a.k.a, Prefetch Resolve
> > Gasket(PRG) and Display Prefetch Resolve(DPR), can fetch data from
> > memory
> > prior to some DPU fetchunits of blit engine and display
> > controller.  The
> > prefetch engines support reading linear formats and resolving
> > Vivante GPU
> > tile formats.
> > 
> > This patch adds kernel modesetting support for the display
> > controller part.
> > The driver supports two CRTCs per display controller, planes backed
> > by
> > four fetchunits(decode0/1, fetchlayer, fetchwarp), fetchunit
> > allocation
> > logic for the two CRTCs, prefetch engines(with tile resolving
> > supported),
> > plane upscaling/deinterlacing/yuv2rgb CSC/alpha blending and CRTC
> > gamma
> > correction.  The registers of the controller is accessed without
> > command
> > sequencer involved, instead just by using CPU.
> > 
> > Reference manual can be found at:
> > 
https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.nxp.com%2Fwebapp%2FDownload%3FcolCode%3DIMX8DQXPRM&data=05%7C01%7Cvictor.liu%40nxp.com%7Cf90aa93b0cb145ed962e08daee3a9c4e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638084232760483936%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=4oy%2BQF%2BnTzinsMhjq5swmvVDZSZwK8h%2BtUbOIxveqHE%3D&reserved=0
> > 
> > Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v12->v13:
> > * Drop 'drm->irq_enabled = true;' to fix a potential build break
> >   reported by 'kernel test robot <lkp@intel.com>'. drm->irq_enabled
> >   should not be used by imx-dpu drm as it is only used by legacy
> >   drivers with userspace modesetting.
> > 
> > v11->v12:
> > * Rebase upon v6.1-rc1.
> > * Minor update on Kconfigs, struct names and macro names due to the
> > rebase.
> > 
> > v10->v11:
> > * Rebase upon v6.0-rc1.
> > * Include drm_blend.h and drm_framebuffer.h in dpu-kms.c and dpu-
> > plane.c
> >   to fix build errors due to the rebase.
> > * Fix a checkpatch warning for dpu-crtc.c.
> > * Properly use dev_err_probe() to return it's return value directly
> > where
> >   possible.
> > 
> > v9->v10:
> > * Make 'checkpatch.pl --strict' happier.
> > * Add Laurentiu's R-b tag.
> > 
> > v8->v9:
> > * Use drm_atomic_get_new_plane_state() in
> > dpu_plane_atomic_update(). (Laurentiu)
> > * Drop getting DPU DT alias ID, as it is unused.
> > * Get the DPR interrupt(dpr_wrap) by name.
> > 
> > v7->v8:
> > * Update dpu_plane_atomic_check() and dpu_plane_atomic_update(),
> > due to DRM
> >   plane helper functions API change(atomic_check and atomic_update)
> > from DRM
> >   atomic core.  Also, rename plane->state variables and relevant
> > DPU plane
> >   state variables in those two functions to reflect they are new
> > states, like
> >   the patch 'drm: Rename plane->state variables in atomic update
> > and disable'
> >   recently landed in drm-misc-next.
> > * Replace drm_gem_fb_prepare_fb() with
> > drm_gem_plane_helper_prepare_fb(),
> >   due to DRM core API change.
> > * Use 256byte DPR burst length for GPU standard tile and 128byte
> > DPR burst
> >   length for 32bpp GPU super tile to align with the latest version
> > of internal
> >   HW documention.
> > 
> > v6->v7:
> > * Fix return value of dpu_get_irqs() if platform_get_irq() fails.
> > (Laurentiu)
> > * Use the function array dpu_irq_handler[] to store individual DPU
> > irq handlers.
> >   (Laurentiu)
> > * Call get/put() hooks directly to get/put DPU fetchunits for DPU
> > plane groups.
> >   (Laurentiu)
> > * Shorten the names of individual DPU irq handlers by using DPU
> > unit abbrev
> >   names to make writing dpu_irq_handler[] easier.
> > 
> > v5->v6:
> > * Do not use macros where possible. (Laurentiu)
> > * Break dpu_plane_atomic_check() into some smaller functions.
> > (Laurentiu)
> > * Address some minor comments from Laurentiu.
> > * Add dpu_crtc_err() helper marco to tell dmesg which CRTC
> > generates error.
> > * Drop calling dev_set_drvdata() from dpu_drm_bind/unbind() as it
> > is done
> >   in dpu_drm_probe().
> > * Some trivial tweaks.
> > 
> > v4->v5:
> > * Rebase up onto the latest drm-misc-next branch and remove the
> > hook to
> >   drm_atomic_helper_legacy_gamma_set(), because it was dropped by
> > the newly
> >   landed commit 'drm: automatic legacy gamma support'.
> > * Remove a redundant blank line from dpu_plane_atomic_update().
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * Fix build warnings Reported-by: kernel test robot <lkp@intel.com>
> > .
> > * Drop build dependency on IMX_SCU, as dummy SCU functions have
> > been added in
> >   header files by the patch 'firmware: imx: add dummy functions'
> > which has
> >   landed in linux-next/master branch.
> > 
> > v1->v2:
> > * Add compatible for i.MX8qm DPU, as this is tested with i.MX8qm
> > LVDS displays.
> >   (Laurentiu)
> > * Fix PRG burst size and stride. (Laurentiu)
> > * Put 'ports' OF node to fix the bail-out logic in dpu_drm_probe().
> > (Laurentiu)
> > 
> >  drivers/gpu/drm/imx/Kconfig               |    1 +
> >  drivers/gpu/drm/imx/Makefile              |    1 +
> >  drivers/gpu/drm/imx/dpu/Kconfig           |    9 +
> >  drivers/gpu/drm/imx/dpu/Makefile          |   10 +
> >  drivers/gpu/drm/imx/dpu/dpu-constframe.c  |  171 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-core.c        | 1044
> > +++++++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-crtc.c        |  969
> > +++++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-crtc.h        |   72 ++
> >  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c   |  117 +++
> >  drivers/gpu/drm/imx/dpu/dpu-dprc.c        |  715 ++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-dprc.h        |   40 +
> >  drivers/gpu/drm/imx/dpu/dpu-drv.c         |  290 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-drv.h         |   28 +
> >  drivers/gpu/drm/imx/dpu/dpu-extdst.c      |  299 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c |  292 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c    |  224 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c  |  152 +++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c   |  610 ++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h   |  195 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c   |  248 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-framegen.c    |  395 ++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-gammacor.c    |  223 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-hscaler.c     |  275 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-kms.c         |  542 +++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-kms.h         |   23 +
> >  drivers/gpu/drm/imx/dpu/dpu-layerblend.c  |  348 +++++++
> >  drivers/gpu/drm/imx/dpu/dpu-plane.c       |  804 ++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-plane.h       |   59 ++
> >  drivers/gpu/drm/imx/dpu/dpu-prg.c         |  433 +++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-prg.h         |   45 +
> >  drivers/gpu/drm/imx/dpu/dpu-prv.h         |  231 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-tcon.c        |  250 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-vscaler.c     |  308 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu.h             |  385 ++++++++
> >  34 files changed, 9808 insertions(+)
> >  create mode 100644 drivers/gpu/drm/imx/dpu/Kconfig
> >  create mode 100644 drivers/gpu/drm/imx/dpu/Makefile
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-constframe.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-core.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-extdst.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-framegen.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-gammacor.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-hscaler.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-layerblend.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prv.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-tcon.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-vscaler.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu.h
> 
> [snip]
> 
> > diff --git a/drivers/gpu/drm/imx/dpu/dpu-drv.c
> > b/drivers/gpu/drm/imx/dpu/dpu-drv.c
> > new file mode 100644
> > index 000000000000..2a2dd92269c8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/imx/dpu/dpu-drv.c
> > @@ -0,0 +1,290 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Copyright 2019,2020,2022 NXP
> > + */
> > +
> > +#include <linux/component.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_drv.h>
> 
> This may also need the following addition:
> 
> #include <drm/drm_fbdev_generic.h>
> 
> Otherwise I do get the following error on compilation:
> 
>   CC [M]  drivers/gpu/drm/imx/dpu/dpu-drv.o
> /var/home/zim/Sources/linux-next.git/drivers/gpu/drm/imx/dpu/dpu-
> drv.c: In function 'dpu_drm_bind':
> /var/home/zim/Sources/linux-next.git/drivers/gpu/drm/imx/dpu/dpu-
> drv.c:99:9: error: implicit declaration of
> function 'drm_fbdev_generic_setup' [-Werror=implicit-function-
> declaration]
>    99 |         drm_fbdev_generic_setup(drm, legacyfb_depth);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[7]: *** [/var/home/zim/Sources/linux-
> next.git/scripts/Makefile.build:252: drivers/gpu/drm/imx/dpu/dpu-
> drv.o] Error 1
> make[7]: *** Waiting for unfinished jobs....

This build break is caused by the below commit introduced in v6.2-rc1. 
The include/drm/drm_fbdev_generic.h head file was newly introduced in
the commit.
8ab59da26bc0 (drm/fb-helper: Move generic fbdev emulation into separate
source file)

I've rebased this patch set upon drm-misc-next to fix this build break
by including the head file and sent v14 for review.

> 
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_dma_helper.h>
> > +#include <drm/drm_modeset_helper.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "dpu-drv.h"
> > +#include "dpu-kms.h"
> > +
> > +#define DRIVER_NAME    "imx-dpu-drm"
> 
> [snip]
> 
> I am trying to actually get this to work on Apalis iMX8 [1] and
> Colibri iMX8X [2] but so far I am still missing
> some crucial recent changes on the SoC device tree side for the dc-
> pixel-link (e.g. fsl,dc-id and fsl,dc-
> stream-id),  lvds-csr (e.g. dropped clock-names) and/or dpr-channel
> (e.g. interrupts-extended especially the
> resp. dc0_irqsteer numbers) parts. If you know of a recent complete
> git tree with working examples like back in
> the day [3], let me know. Let's see...

Like I commented in another thread(
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230118072656.18845-6-marcel@ziswiler.com/
), I'll see if I can share some local patches/changes to you in some
way as we don't have any official git to share them, or please wait
until they are submitted for review.

Regards,
Liu Ying

> 
> [1] 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20230102171023.33853-1-marcel%40ziswiler.com%2F&data=05%7C01%7Cvictor.liu%40nxp.com%7Cf90aa93b0cb145ed962e08daee3a9c4e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638084232760483936%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=YanxvVSRTkpMaRifVM%2B%2BiCGcTMb9mAumtUCyoBwAGks%3D&reserved=0
> [2]
> 
https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3Dba5a5615d54f8adfeb4edd005bbd0dfeb65feb9f&data=05%7C01%7Cvictor.liu%40nxp.com%7Cf90aa93b0cb145ed962e08daee3a9c4e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638084232760640140%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=WZZfPkLL9HWqykuRtj96eMePEAbpIRW63DTZXqAPuEA%3D&reserved=0
> [3] 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fc4c93c217d21dc20435fd7615c146397d4fcafc7.camel%40nxp.com%2F&data=05%7C01%7Cvictor.liu%40nxp.com%7Cf90aa93b0cb145ed962e08daee3a9c4e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638084232760640140%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=bZyeEQeUAXuYq9UXYYXjPCjoeTln7kT8Y8B2xAj%2Fp2o%3D&reserved=0
> 
> Cheers
> 
> Marcel

