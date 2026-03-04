Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAyvBYunp2kHjAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 04:31:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C41E1FA5B4
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 04:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA31C10E93F;
	Wed,  4 Mar 2026 03:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LJc62dkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D996310E93F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 03:31:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iujaLeKLNmzeFTDy41SLsWBxpwEdlfmaVL3Zek/EzGIHVZONG0Grl38Bz6+wKNejPQ+dVQJaj9wk0IrCL/aAFcJuIGoWwk9y7nGWfKkp7DbcJrYkKr8o90D/P1htsORkYWwMO0OIk5RS5i6kgMfQrEG17wjVGuc2Fc2DnqLKWUacvzFUV/5W6ynbKd2y6G4+L0RpS+C05jV6tsQ4mIqbuFEre+cU6NjFvdq8BTeSrQdZNzTR0IUhMd2FE3klcBUDBMHjVjdvXKbGd0LItfew2omOXuGrfkvfXLPskWrk/d1ieJGJ48bXhTxUhyZnvUlrOac1zqZrgjAW7JtJKDlY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGQAcd4mdGb2un6imewGx9Nt2bob0H7GOya4b4v6htc=;
 b=ANt9XOyA1pZp/JKmdDZUAZXuJ7joGBg0FcLqsnBs7/HEHswbTWh2EjO1tW4VGhL11GFVoqFcJc8Xv5mEPiKdbpLVIN12BRwZPzqp7FNdwjcwpcfuUCwSouHg9nVrMXCUP7ZvQJm8Tm6dWbxXt5xxgZVypL9IfhrcVAwlpj0Hv9yxHSljSta6fUN2wTmfIRj+rK152FKBw3AMtIRIEB8XxDAFfsAhRDKmXoS+jXJ8MaRRnDSww4VcqUf2l40lZfCpVPvdzoY4ONGluFOLcqrVhtFG0crT4KI4r1yQdS1F7Pvi/5LvxOTiEx+hi6CcnyWB3TsEqSU4pMv3/Ur+socBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGQAcd4mdGb2un6imewGx9Nt2bob0H7GOya4b4v6htc=;
 b=LJc62dkUOY4SP9JI8FqVEvjdml89LvPAc4avp5DJRlCyCDGREANX+YOTtOx6b5fVHTcNWlbWcIgD8nAQgTW3izJ/Yn1yuDyksv58rtQGO2/N1+0rtWVBbUMvB68fjjC1ZvX1+egejSWQ9eTpg2lKRYZtdINLMXmg3AnGeXzG1sAN9Xvydh6j86S2PiY0fBC54ubztT1VgqSHQ0ipFcF4bfKElUFZQdXdxRXUW2/sLKPgKgRQ5np60IGxGicBCq7SJWYe/21YU0+xJbR6NK7RBfF5OVsXMwsZJ96cMyDxHjIvt+QKbunCryd8XXTTOHxhy/eFOzcotiOn+um9f9EdEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8641.eurprd04.prod.outlook.com (2603:10a6:20b:428::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 03:31:16 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 03:31:16 +0000
Message-ID: <e1a53a3e-9af1-4062-a790-48a7935c08e1@nxp.com>
Date: Wed, 4 Mar 2026 11:32:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5c79f3-f3af-4aac-9c65-08de799e7de9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|19092799006|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: ToWw0HMQseButOBm0F7nIMxU4ccFBiMFG3hjjANGUIWUPkazybWTHuj++nS2LMh6hZrv/yoKEqob36OD6ldEiMI2JgsH9y6DF6K3ifWoZwrYlbhzhqA99SSjY9bsrpar1suMJ+SjTJJhlx74aD2AvoEvQ6nCqRZ93PagckwiuLQzVdaYi8s/Ls2w/TwxNZGl+UaoEaAnEkEs8n72jjQnDBrCIS34O6htwa9mv8P3yZFrRXvuuAUuI9WOf/lGR5+YyWAnq6T6rXdQWeVZHRqGMq1MACk4BG4wh5JGK4LRwMmpIkJc16Wdxp/vzTte7jRtroIZr/83I2/yqXJEpkQ7edUQEUMQKvcIWVyLILS1LHJulO3ly628qwN7PPVE/pnVR7QGsh/KJN7y4+AAMS1FfDf4EwDZMjFFTlF8bBqjN71l5nD0i1CdHxswjK1LQW++xCb8hk5QqLr//xqdWAPa7rq8jg2zyxYsU5EKwOkSQTP+9KnWhOs7WLZ77i0mQZR7gU6x89S39KHpG5hwEIQ96im7v6jkuojen1eUicvVdhEpHN8RUssRcJY9Pf7CdH0V5HPxTNW9Y3MCLIekdTVVtk/TgvkpBGJF/P8JApgCSZZb1/azO11maHvfsDJmbUHZtWrHjOiQd1sHTI9jJQqSRMYdynDGJ5j4qnpcmfHB+HjHTyFy+9hRsGkTBOxuTXkdSvOVuL3CtaHZ8ovDCJbYCYeuDM+9AVHU0ayLsjWrCqt/HfzdBzDVR2FKkYmeoGIrLEFaKTdbNqA3+aN+964NRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(19092799006)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhqMmc3aWtkcUJJNFNzNSt4N0txNy8vM2YrckV0M3JETnNrN1VYZFJ4QzlU?=
 =?utf-8?B?Zm10UnlkbHRmVlY1VjZXaUl5RFdYRktWbXQvM3Bhc1liWjduUWdhQkxaaU0v?=
 =?utf-8?B?MmxYUythVDVPTS9ldzhqV0E3MlRScGdoa3hMTXpqVk13ZGVibXFpSkpwbUl3?=
 =?utf-8?B?Wjl5WitrWkJIOWJLSVdvQ2xsOVcwTmE3UVpCTC9yeDVXUGpCN2VxQjFGajRP?=
 =?utf-8?B?N0lvZ3pyVTRYeEtTVk80ckc5K1pVNjZIN3I3VzhLT2NMT2FPdk1vbXdKQWxk?=
 =?utf-8?B?RnN4dUx0cWREQkZDeFlNRmo3ZXVlUmxXUHhkSmhlL2p2Q3pEdTUwVE9XZVhZ?=
 =?utf-8?B?YTlEODlONFVKdnhmdmdXaGNrODcwUGcvZE9SaU9aSGFpUXBnVFYydEFHRmo1?=
 =?utf-8?B?TytsRm5HbzBBWmtDc1ExTlpuMlNFRVptVHdrOVNYTXkyYkFMeUNLMzlmRnVn?=
 =?utf-8?B?NFNYQ055MkIrSTJ1WVpHVVEvZTFkSm5sM1lXVUNvT0hTYnNuZEE2Y3pVM0Jz?=
 =?utf-8?B?ZjFiczJxVVA1bkhTUXZEd3BPelJuUnBTeFlQTEpSUnlwbUpCVEhLT25wQkhF?=
 =?utf-8?B?eGpsYklvUVNFWkJ4ZXhyYkVkYVUyZjVsa1RsT00zbElDWFV2eXN1cFVleXAr?=
 =?utf-8?B?UURqMUhJeUo5SWdod2RsRzlHaVR3aTYxQXNCdm5WKzZFQUlzOWtQK2JXTzBS?=
 =?utf-8?B?V0VGTXJNc051YzNMVjhtcFlZbmhIdGM1OWlGT1dPNFpzM0ZYa2tjcC9UMEU4?=
 =?utf-8?B?V1ZUOXFMdFdHdVhiMHZKVjhmWU1JZVg2TElORENlWVZ5WnVIdncya21lWnBK?=
 =?utf-8?B?N2ZTbFU5WkZvRk5XSHB0ZlNseEFUODcxT2dMVVc5bTFCQWtIZ3pzem1ZN0Z2?=
 =?utf-8?B?MmFMcytZM1didUwxeUg5ZWl2QnZYSkx3V3hwaHdwbFk3YjZ3V29QSC93aytO?=
 =?utf-8?B?WTc3dmU5Nm44SEx4anhnMnBwU0owREZLS2o1clltSTg5ZWpHQ2VBVVpEM3lP?=
 =?utf-8?B?S2J5MXcwWmdOdE05REJpaVhYUnY4Z0Jqd2d2NzJWRXpEbEMxWDBWL1ZRaFQ4?=
 =?utf-8?B?bkRHQ1plb0RUem0vRXBvNTBXc1FqR1E3bi9mN25EN3lIZW1ENHRYbEgzSXk5?=
 =?utf-8?B?RnBORHQ3dVZ6RGZJMEhVbEVJdzFQZmxqTnlsbDFUNUFSd0FNT2lyUzVZMmVX?=
 =?utf-8?B?QXhLUEVYZUVZTXlnTUJUZ05yREErK1V0Z0dYRkJMTWRnRi9wdDI5NENrTHk1?=
 =?utf-8?B?Vi9XSjJhT1NsWjVxdkgwSkt0eDFhOWxrbDJhTkhvOUpSSVlYcGUrcUgwV25W?=
 =?utf-8?B?cTgvdnBkMWg5Y0V3ejNKT3oxY0NxM1M4YWR1Z2Q2Vlk1RE55YzVNQW1mMlBw?=
 =?utf-8?B?dEtkQkNMRzg3aWRnUVE0a2RYRngwMU5QZW55NU9pWWdwd0lFMjRxeDhyYzJD?=
 =?utf-8?B?UElvMUtab1BWVDJWbit2RHM4ejg2d1hYZVpHUk5zLzNNdnhYQnhmQUZBd2di?=
 =?utf-8?B?K3hTTzB1Y1J5aHJIOWplajB1ZlFmaGZrTWJuMmRHbXNqd09XK0FDSTNnWWJ2?=
 =?utf-8?B?WjM4RGZyWFlZUEtmVFJxYWdhdkZSdFlFblMvSWdXU0VzdCtUZXZOTmNpTGVh?=
 =?utf-8?B?K1YrMHVGTlZ0MFFhTFNLSDBDVmo4Z2JocTJvT3FUQWdrbW1qVWlkbTk3T2VQ?=
 =?utf-8?B?STM4cHpPS1JxN0hQeGpWTnU2VGFBQWNSMVpZdkVqRnJUMXRiVnE5bjJEeWV4?=
 =?utf-8?B?MWtmZlRXMlh4cU1HWTM2akdzZm80c2ZLR0NQQVQ1L0F5U2lGU2hLWnFEZnhj?=
 =?utf-8?B?M0IxNTR0YXE5RWlWOCs2eUdRYTNUOEFFQTJNSU1XWXcwSmNRYzBSNDJHem80?=
 =?utf-8?B?UVZqQVc4TU9ka2grdnVpM1dvQitmbXV6MzJySVlXMlEwMTV4NURjSzR6N1gw?=
 =?utf-8?B?U2ExQmw3dEtUMGZqRFNsNWVYRHBTdjY4ZlZETVY3UkJjVXFIcVQ2QVk1bEY2?=
 =?utf-8?B?WE1lVmMwQ3pyK25IRmt1Ui9JSHlyczdZemRSVXhRUVhCbVZSQ0JkcXFWYlJu?=
 =?utf-8?B?Wkp3Z1hZNFRxT3JRVGQvNXMybnJtb3kxWFRjUjcrQWl5d0Q3QUFIRVJLbllC?=
 =?utf-8?B?b3NaTVJqQkhXaXduVU9VMThNSG9nUGEyVWFacUdyazhqeVhEMWtUVmFKLytR?=
 =?utf-8?B?RzNsSXVNUEd5ZXIvRUZmb1dMYU1iSis4d2JPdkhwN3VFb1lEMTFKUnZXU2p1?=
 =?utf-8?B?Lys0WGNjOE1sZ20rVkR3c3pBblVTalJUZ0xmY1JzZWFlSWJ3eGUva1V5Vjdr?=
 =?utf-8?B?dG9PeDJhK3M4SitRdkpUSmtua0ljR2Z3ZE5RR0hEQWd4TlhHMUVaZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5c79f3-f3af-4aac-9c65-08de799e7de9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 03:31:15.9547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAlMi5W4vjo/1tkuQc4yOM2Kkrc/JNdKTQH1aPkoKbnOlb1T7hEZl3S/Af3hkdW7jQ/o+7upt52Tc5C0nX2Sqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8641
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 6C41E1FA5B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:34:27AM +0100, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Add a DRM bridge driver to support the display format configuration.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v7.0-rc1]
> [m.felsch@pengutronix.de: add review feedback (Alexander)]
> [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> [m.felsch@pengutronix.de: add bus-width support]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 225 ++++++++++++++++++++++++++++++++
>  3 files changed, 237 insertions(+)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

Thanks!

I'll wait for a week or so to apply this if no objections or someone else
applies it sooner.

-- 
Regards,
Liu Ying
