Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JpJAeQYqGkVoAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:35:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B22D1FF0C9
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324C810E9B4;
	Wed,  4 Mar 2026 11:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ti3BLpNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E820510E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 11:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2KWjkZWHqbz80Yku879GRwttDapKDMjDg8n4eluOqyhe7lvLoFqRdiEzA8YM6q1S4TVVIlqhb9+0atv3xf/gDyUPiFYrg4V0mi6f6nHzvS75yWs50h3xHSxlFRgBGsQpW+4sRELUZVEQEsiRlIKr9Rd89nSF4GKO6ESsY4w+4Q3K4gJWe2E8k00Dxy4v7jy/lz2jsbVvG6j6WQol2ApP2lzN3yyeNnqZfGBFw1VK/bgWWkU5767ZKJMatVkoHpmQjk9iEkv9sxJTWAK4Cy/Hw8TvYTqvXObPvOsixyGk53WVXpnQjar7p3C5d/NW54ZVOPrQjVTzYU3XOvWFn7GBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWdCjO0SJm+5xS0VRNeFWFIrAQQtO2QJBM7dLKYc18I=;
 b=Mk48tz0P8Q2g9IZ6rush5693/YLL/qsVkHQg2ZeOZFKvY3Yre4ICGtVhew8vHQYZZGRseXgnmMpjGgBPwoFAkyYyCsPIlUN4JfR0MBREuGx9DYkhmi5XFrEH7ww6EgTnFTtVTgnkOHErAmVX/3/d+I8rg7FlK4jFsylJoEvcBpCs5924KfK8V71kNFwSlN4+Qybzm3pDShjodMgom08HYYkdN80cA3teHtQ//bBPVZe2LP5L5lnsagLudukSYfkP17uRYFDxIXMedEMZvHCfsyZZ8LjAiM2uxUJNB3O2SjMUihjXRA96317yH4lmOeSHl9dcWL8QX83XlY5uezpu0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWdCjO0SJm+5xS0VRNeFWFIrAQQtO2QJBM7dLKYc18I=;
 b=Ti3BLpNRVcIGo4+qEXKTPCvURUNHJk9gd3ZaCSbN+Ms0hPZ85oAFcHKhE8W1+eTiBr7MxiC00E03/qrEZlHWYpUnkF2rI0ugoWkpiocs7iApF/gWZrWvFctSAYoD870FSug9zcijAMfuszUFeQLjAzgaMFz8WJW63md6kP/vK0x6z+fWEGK39xOTUfLo1d5fmSS2PePTGulIWp3IASWF983M9JTT0kgdggrfY5+RAuyUuPobL11qRh+wKZyNPh5XbaceGgCJCuBz2oW9bpdeBb8xzH/voGwc+tcv4tO6C1ibRkWQuNfJ5UlEudrkVXs+DnQjr6p2syp+hRE/c0BK6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:34:49 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:34:49 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Ying Liu <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Francesco Valla <francesco@valla.it>, linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Wed,  4 Mar 2026 11:34:11 +0000
Message-ID: <20260304-dcif-upstreaming-v8-2-bec5c047edd4@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0027.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::16) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c1f177-1bb1-4885-6b5d-08de79e20b36
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|19092799006|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: ftld1/nC4djRwuN+mqmGfgIda6ItROFZuTpBEf2qTwhMTluznxfmGQhVzUe4+VXhACa92rfIw2ei5qJj7Vv/TQFK/YUS4nAX7Isjd0P56NTe5jDOk2EoZOdMOgqimWUZoLcFw6UYvT38aelCW0Xhy8wp1ngF84wKyructdtOGuJAB9RWhXtZSwTVESAtqBFWRfYsYg6l0dE0F3MjBF5n3iUiiMm1GRAAI5KS9Gph0pZUDeiw/JxdRSdGKUnVDtbjL9NF0NDGUYsUR+xf9Edi9PaSwhNzZLIMjfuCmWjTA1Ik8mf4ALlJPm83oStJOXbYSz8XXGft95Tuu10JOGdpozylVFhKLMphWBvOKEhSPRKA85oEy/jBnIYUO1MGu/Lh7ISlVlAQU/athWGyL7UGEO8U1iMZfZM7RGjYenvcUfMke4CqBggSpG44TZJz2drZiSeOq22vI6VSujPBWyurShI03LmZZIscbbvgPeZwBGc4/BHHx8uOL8e79SsLVNaFQWvjlCHCWsCWWg0OW2iByer9e3hgRYuh9K1wX5nSsdvqJbzM+ahowRqHVxuwjHw1NGc+DMPaglWfH6JecE+2T4HXv8uy0TFVwmWAhhCVCk/YOKByd2XmSk6jC4tPeawPqAwq00H+1t2rVyEsFNZ+/HuHvV4N70zOGK7Gc5ObCIpSD2FMj5pxTCVm4RlQBf8cwVdVPg9Zz7MddiqxqF11vGMmTB5JH/83a3mOHC9Nzms7Qcx4gEDVHQxluJ9Zt7D/EjSXpoQ/jK9Vo12tG8S5Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L28rZmswdzBEcm85ODZkOStXekF4YnpEdWNqL3RGNnFkc1dJT3dJdHY4NlJl?=
 =?utf-8?B?c3YyN1RwTXF0L0M0c3dYWEgrMTlTZFV3dVd2RVpBcmxNdURNeDI4SzdIVGc5?=
 =?utf-8?B?QllmK0Z0OXZsRnNGTXZPVGpWTW9KYnVFUGhTYSthamNaUmcvMWZiQzN2N2lF?=
 =?utf-8?B?S0o4bjg2Q3hIZVFzcTZZT2NUNUF6OHdTL0VtclZoVW4wYVh4SUR0bzNCTUha?=
 =?utf-8?B?QjFmWFFicmhmTUVLY2ZabWVTaW40MWd3U3JRc3lOd2NyYkd3NE1GR2ROQVJa?=
 =?utf-8?B?dit2dm83ZFp6UE1kcU1YZk5DLzBQbWFTYWJaN0ljQUZhWU1oTk1TV0QzOE1D?=
 =?utf-8?B?MkRzSlI1Mldzc21nY2FjaXMvTk5QREp5R2pnSXAvSnZUTDBOZUNxQ2Q5SHZx?=
 =?utf-8?B?SzQ5VlJiTVk4NndGZUdBdHloaXNSTTYzV1doSzNPRThxMmR5NUgxbFUwN2gz?=
 =?utf-8?B?ZUxIR214a0k4dmJPTVIrZFNvRmVudm9UamZrcVM1VTF3VE84Y1VGYnk3aDUz?=
 =?utf-8?B?TFcyQi9qY0dCcEFNT0VEanYvRzlTVTBKa245Syt5bFljWGpNZGVHWHFCZWRl?=
 =?utf-8?B?amhpNWJnUHlPM0k3eEJhbHpaemhURG9UUVgvY0RCc2cxRm4wVzZMRVFTMlZG?=
 =?utf-8?B?ZnQrU0grRTFacktEeVloRW5uOWQ2Y216ME42NzVVMXVpak4wZG9TS2wyNFRW?=
 =?utf-8?B?d3lzbFRnWmRKNVJESFVuZFdINnZ3aUt0azdOTm5IVU1yOTUxWCtpQjFOYnp2?=
 =?utf-8?B?c2dRR3pLTzd5bVV3SEZoRk5qZFp3eHFNT1F2RFlzYjU2WHVnNDVpOTdzdjlI?=
 =?utf-8?B?OTA2TGJMSitoOEQ0Nm5RMmVOMDlRR21QeDgzWk9ZR3NLY3REUDVQNnNjYWth?=
 =?utf-8?B?aE5DeS9JckJvRFJRVFdiQlNYMGhjSXhSWGpvcUZBQ1NDa2pKVmFYdTRPcXhG?=
 =?utf-8?B?Y0xjRzFXOGM0Y0FLTXYrL0VxSkdFMjAzaFRqOEk0SUthb04wNXI1YjJLQi9C?=
 =?utf-8?B?c29yKzl0bEFQWEhrQkNxUG1jaW9Mc0h1Y3BZTlR6QlU0b0RBYmxUMTZPdFBT?=
 =?utf-8?B?ZVJzQ3dDOUtGelk3TlIwQ2hxVHpsOGdPV2h2eWVZWG9RajY4Y0FVaUtFMTE3?=
 =?utf-8?B?Vnd1MXYwMjhIY2VWNTlvL3IzMWhmQjArb0FQc0h4elBXb1gvWkIvMGNjTTNz?=
 =?utf-8?B?U2VqUmdvTlp0enZQYWZnYVdZUnBLUVRuL21aejVZOC9rdDBNNjBTdUpMdkFU?=
 =?utf-8?B?ZXlPa0IvM0UwVHNPWTVJTXZEODhTUWhrNnl2VWRnZDJDR2N0ek5raTltRHFn?=
 =?utf-8?B?ZDB2UjgyeHp6MnBQYjRYc3R0WlZlOHFKL2tXU29DRzNJRVNEYmU0Q1I1aTU4?=
 =?utf-8?B?b3pUM1UwWFIzOFJXTytYNFdWVzgvcCt3dVBHb0NkRWRUUzN2RXV2WHFMb3do?=
 =?utf-8?B?TmVSVXl5SmJCUTA4UlFRSjI2K3lvTkNwKzc4cU40M1V2aFdZelNXUWtRVVp2?=
 =?utf-8?B?RkNWZS9GVHpaNVluOHA4NnVEWkgvT3dUSlQ4TGc4MkRsUUJSK0oyWWR6WTZl?=
 =?utf-8?B?K0dUdEU3VDVnT2NVdGQ5dzBlaUNDcGhTcm9tN0xrRkhjL3hMbmFlK3YySUw4?=
 =?utf-8?B?SjVGd2Z0WUwvQy9yOXFKY2xkdmJDTXJqL0tEdDk5c1BibnJ5emlKSnZMQnBn?=
 =?utf-8?B?R2R3Y0J4QXorUGpMdVM4SEF5RThGUkQ2cERhaHdoMWRSTkRqWDNDTzM4T2ps?=
 =?utf-8?B?UEVKTzhlYVhQRXQrem52anVma2NodjN1UTc0alFveVo0d0RFUjdYZVpQdlJE?=
 =?utf-8?B?Y1F3cWpJamNPZmN1djNaTk9oN3R4VmltR21CMlhrZTYrOGR4aEg0YjNqK2dR?=
 =?utf-8?B?dWxhV1JJaGMrQkFaaWk1cDIrdi90WU00Q2h3QlByb0Q1MzBxT1FXeWNrc0hM?=
 =?utf-8?B?bVE4azFJUjY2OTF3bk1udHVQeGE0TzJGVW1nbDVndi81dUFmYkVFanZoL3dh?=
 =?utf-8?B?dEd0SW1DQXIxK2VkQWlUN3J6VEZYMjRycDZEdzJKVzIrMjluTDVQajdTM0lx?=
 =?utf-8?B?MkFDUXc3MFJEYy9pOU85RlU4UXJvTTMzTzJ5eTVpTFM1NWNURllZaTZLR2Zu?=
 =?utf-8?B?amI3Z0VhbzVsSHB6QlhTbjlXeG05am9vdTFQTlcwNlFmU1kvSC9nYVRzV2Vu?=
 =?utf-8?B?Nys4RHdnaVZGNExEelRzOS9pMWo3cGhkUjVidGNmQStVY1V3eStPaUxoY2hZ?=
 =?utf-8?B?Y1Vhbmg1RnBPelhUUnhMTUpWQ1ZiRUZIQklXd0MrUWVCSWNFWTNweDZ6dkJP?=
 =?utf-8?B?VW1DVTZNNXBUNXphV3JhaFhGTmIrczNaaHlhdCtQSUIvd0MzVGdrSC91Mng0?=
 =?utf-8?Q?CXuHoVQ6eztVN5Ho=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c1f177-1bb1-4885-6b5d-08de79e20b36
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:34:49.2590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rr09NcfkrmFDYy6KtxHhA9I9vf7MQ3dP8r10SVSICY2x2P3AvhPf9/pQ5aM383Yay6Kc4Rwa5NtkTzj4vxY6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522
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
X-Rspamd-Queue-Id: 8B22D1FF0C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Li@nxp.com,m:victor.liu@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:dmitry.baryshkov@linaro.org,m:francesco@valla.it,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[lists.linux.dev,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,linaro.org:email]
X-Rspamd-Action: no action

From: Liu Ying <victor.liu@nxp.com>

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 7b71cde173e0c..d59f26016de26 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -15,7 +15,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
@@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
@@ -119,7 +118,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
 				 bridge, flags);
 }
 
@@ -296,9 +295,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -321,36 +318,30 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_ldb->regmap))
 		return PTR_ERR(fsl_ldb->regmap);
 
-	/* Locate the remote ports and the panel node */
+	/* Locate the remote ports. */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
 	of_node_put(remote1);
 	of_node_put(remote2);
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
-		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
+		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
 	if (of_property_present(dev->of_node, "nxp,enable-termination-resistor"))
 		fsl_ldb->use_termination_resistor = true;
 
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
+						      fsl_ldb->ch0_enabled ? 1 : 2,
+						      0);
+	if (IS_ERR(fsl_ldb->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
+				     "failed to get next bridge\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;

-- 
2.51.0
