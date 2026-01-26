Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCRFGmYgd2ntcQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:05:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B186985433
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617DE10E132;
	Mon, 26 Jan 2026 08:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KyHNbyGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013045.outbound.protection.outlook.com
 [40.107.162.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D693D10E132
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:05:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxE7L5PM5LnuERYrbvhgwHwgm6KGvFhLSOXYPtT96XG86XYhQPWps/zsy9kKPDjVfj+gTRbQt5coisXDi41Ms5Bm7FkOvHhqjqGjSzlLdI0YkJfvauy7K6S9iRkT9k41kSDuOnzdmPrGzGvLoNcYPYsAMBHbA03AbM2DyD/oviAJjliHaCKszdaf/ZA+ooaM/2sQaNLHo7gwTp28uldTAcokRmQHw451pzOpoyhj4VAwE8FSFMRp0XMVHjqUTp3j9Lanc5j8as5ORTMXGJEpRbXY+RvXMSxFvzcKKns6VLaR/5hUhcLauLNPrSwmaVNzBw5JdfGmTtMT7FiMZcYjrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8xQq2+f7pbVsVFg6y3T+/bR8QoQoVK76M7+rTI7KZ8=;
 b=JVCucXLzWDZmDDRjpDYmpJn53p0WZOnXk9o5lSpUzLX0wAzElVjULsugd81k06qzn3kJA9OEDQknVYd3dV/s3dvFoZducqKvDSSCS43vnhCvM13mnkvGF8/I732fn8rlmXY4nBm8MXVRfE04dtsiHpwOa5pDJ23le4pdaExeimfcy2vEgf3xX0XE1wzKJqbeRmHrewweKKRJ15eLnoCe8zCi/hoJNI/TSyAlvuOkoRA81GSVPRtGHmyWZglxGXKW7PhWxK4fi4WaAQrNefQVwdNyxV9Ltk8+z0+lP1g5YutWi386n2cMZ8jC7lVGCCzxAe/BPgti25c/r4X/dyvPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8xQq2+f7pbVsVFg6y3T+/bR8QoQoVK76M7+rTI7KZ8=;
 b=KyHNbyGKKpjyRitN4pAkOSYyhjvRFVaGuQVQsUvqP7AyPbBta8/vFPBD4nCIlnky6dTgVoBEFk3qfvCQxQ1ALLqlAVkEuIAyWaiohTHd8NK5huYKf4/vl/R4cWB/sNS4dIYcwCkxdkU/XNGI/YStIyNqZL8OU/NhX2iT5BdNdK04ElLY8N8DuVea3AV8J/AUbVJFodfPZNEHjWR2b1BAhbwCpkX0gMWbd76T+fDQtUG1U61TXs6YsLMMd/bCiWEUbnoGlm+1EppvlnsAUazs53CF3S2+UXOOCWXHh7fTMgohlpfeeRvSqcWD3pQXLWZVadl3nzDMHJCQsW6v7gwX5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8178.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 08:05:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:05:46 +0000
Message-ID: <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
Date: Mon, 26 Jan 2026 16:06:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d894c2d-29a4-4799-44f5-08de5cb1b5cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1l1d0gzUWMxeXVJbDNjYllrL2NBbUdDc3FkZEhIaERyRHp6T084Q0FKYXFY?=
 =?utf-8?B?ZFFmRE5uK2NGSlNmaHFJT3dnN2paNzBoSXBDTkEvaFZGVWVtaU9FN2kyT2xO?=
 =?utf-8?B?MWh2STI0N0FMdXZ2UmtJdnVvVjFtbm5MdnVxRzN5c3NJN25PcWZVZGViSXdR?=
 =?utf-8?B?S1NuZ0JOMTkvdG00M241SDMrOFJ3cnhGSUh6VVZ1R1l1QUJRR0JVNFZ5N2Fm?=
 =?utf-8?B?SkkvTUdISitNSHNSQXU2L3lLLzcraWk4V21sZkU2OUtRaVYzSDRYR1lhL2Vo?=
 =?utf-8?B?enkrb3d1dmk2MXhwY09pZmVJSnBWVVRVQm1xMEZZVnN5VkRQVUdUNkEwdUoy?=
 =?utf-8?B?OXVwdUovaGsycW01b3Z1dmNNQmZVcS9ZVFVLYXdqM2I2NW00enMwZXJtRGQ5?=
 =?utf-8?B?aERvbkhKZElRSEozY0N4L2hoZGdDNGJreUR1K3c5WXdUbXJuS1NjZ0lOWVpw?=
 =?utf-8?B?Qy9ZVlpZK0liOTFITzBTbWkyRkdjbTdIcWpSenMzSVRHNThYa3FiQnpJMk1k?=
 =?utf-8?B?TkhodmRGQVJwc21IamlmVHhsMkNkcEdkUEFBMjlFNFQzT1g2OHIyMmN2cVFH?=
 =?utf-8?B?M0phSzcxdHBNNFRMTUZzck45a2laeFpiS0RHaFZrM2o0UldXV0pheHNmSk55?=
 =?utf-8?B?Y3NrOWpzVXI4NzZ6b2E2eDZDZXlsanhSZ0JjWDhCbUl0OHZ0Q0xHTnhGZjBP?=
 =?utf-8?B?RVBnZEYwUXZ0LzNkN3BPd2IwdUhFREUwMUxJT3BPYkdQbmpZNmt2dmQ0NFRp?=
 =?utf-8?B?QlA5bHVUZVd6TFBJOFRaV1VRbmhFU2J2Qk9zZk9DbUt6ejFkRjU2OHVCTEg0?=
 =?utf-8?B?SVlha2VWRE5rZXh2Vi9rZXhSWEVWek01NzRtZmg1RHdoMW9FRFJHbEJzUEFE?=
 =?utf-8?B?S003dGpOMldTS0lkMVROajkwdmNsN1VqS3RJc294emNUTEFmeHVibnNxMm02?=
 =?utf-8?B?VDVBbWtqNDEyT0NOZmxpaEtJZjRseXV1VExqZkxXUjRleWZKbW5RQmtYOUti?=
 =?utf-8?B?VmIrUmRPNUttZUVrN2wvS1VuekljbU1UUVVUeVc1MkpkZjJQd2grSXg1Nk5p?=
 =?utf-8?B?dWhaM3JtOEYvTUl1eVVsNFBPcFBXVlRKQmNUa0N1R2JqNHBrSHZtRHpuYWdv?=
 =?utf-8?B?bjN2UEk1amxLMlRreGhNaTlVZUFVTTNqc0FPM0lFcGdhWjd6RE1wOUhUWHg0?=
 =?utf-8?B?L2JUZUpzS0c3QXlNS29RM1NvVTl2cU1NbVFrS1pRTkVCaEtuaDRyU1hQTkUx?=
 =?utf-8?B?T01EVmlSSjgzZEpyVXVoazIybUV4clh6c1I5TUdJbnVtTWdMRVVzZG5nU3c1?=
 =?utf-8?B?SzN1Uk8rcDMvakxPTmtJS2F3MXpxNWpYbCtRNStpZ3EvbzBrRmVaRkl1cWxR?=
 =?utf-8?B?Q25SYzVIUElwaXZCam13NmNmWVBPV1pKWm5KdXhrd3QyTEdlVnJIN2RTQmZL?=
 =?utf-8?B?VVdXcXhJTGRyd09vamtldHM4VmhMcE1HMG1keFJublRwMHprWEJVOVRtcXFV?=
 =?utf-8?B?aGRha3FTOXRtR2ZzNndnM0JESndMa2JjbEZ2QnJNUFRXTERFSnZ3QzNiU2Qr?=
 =?utf-8?B?YXNaajdublZwRHJCSHZ6ZUl1Q3haSXZ4dGNSdnhpMFJsbDNSTHN4WWdSQkJE?=
 =?utf-8?B?UFRPY0dDczZPdVgwQU1WalhrbHRVNGtMeVphMzIrZGhyRS9lZldJanFGNFlr?=
 =?utf-8?B?di9HTzFsbFViVXZwNms2MUlXcVVSRzYrZDNrbmF1cm9RVjF4dkVrRTRYRmVR?=
 =?utf-8?B?L0lWQS9pc1ZaR1ZHUUI2Y1RFZU5lOVVIOGhsOHZxdUlWMXArYm4rVU1TcWhO?=
 =?utf-8?B?cnR4UXpqTlh4SmpwMUlacG1mQlpxMlFVZUZhVWt6bndwN2YyeGorckIwYWoz?=
 =?utf-8?B?VU9YVUZtT1VPSTFNajVQd2tUVjIvaXgxdExRdkZWdlVjNUVOK3hGV2VzbnVU?=
 =?utf-8?B?dThXMWU2Ym5RZDBFdUVDdllWTDFEcXgxd1dYZDNwbjkrRmovUkRmdTFabS96?=
 =?utf-8?B?UmF3S000Y3hjWUI4ZUxxWWRKWTh1NlpRRUFzSDM0Z09LY3NLSGJWbnR5YU5s?=
 =?utf-8?B?ME1paWErZWNVM0t4OHdCUnNQY0w0YUhrZTJpa0szcVVPeVRsV2xDSlFjTVJZ?=
 =?utf-8?B?S3N5aXB0bnlEK3h5SCtualVTV3c2YkNnWWtYUUlubkFFZmtkRmY1MkEzK1V6?=
 =?utf-8?B?V0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBQb3pDOXpQeHNsSVdVenA0RktJTXdFNE83UUI1WTFzdm04eVIxSDNnUitF?=
 =?utf-8?B?cjRhODFCaFJGK2pWck5ESk83d3Y3RStvTitTNEk5b2xVRG04SE5QZ1U2aVpZ?=
 =?utf-8?B?dVVqWXJ2MHNnU2hXamJTSzExK0d0L0hpSlBMVmFtc0ZJSCs0VGR2cGhFYmcw?=
 =?utf-8?B?eEVzSnlObTBBRUtpVU1QNHloWlR4R3doS1ArUmI2NCtBTWNuUEplWE0remo2?=
 =?utf-8?B?K01RTzdkcnd5a0R2SEhHQVBvak5lazZKQVY1S05lc3FFVnlCTW1wWHg3MFI3?=
 =?utf-8?B?Qyt2aGloNzJGcTBHR3JqN3M1b01vTlQ1RS9KQ29Oemt5TG1sUi9rT2R6SWdw?=
 =?utf-8?B?Q2F3dEQvNXRWUTl3YkhvU3B6bk1YRTlESUlia2xjTXJXV2hOUUNhZXJqNDRY?=
 =?utf-8?B?N3JYcFJ4eXorWlptUjhKUkx1MDM4ZWJYQkIwZ08vY3NLSGd2RHprZzNxUGli?=
 =?utf-8?B?T3BqN0M2NjZPSm5IRWtqc0ZUc0dvOXgwUHhzV1NNUHpBdzBvWXNGcnFKNFh3?=
 =?utf-8?B?bTRuZjhmZW42SHRyNkdabjR3amM4R3llY3RQWGE2VG9MZnlBbjFtbVBzbUEx?=
 =?utf-8?B?K1pNQkdJTXVHSFBWSHZzQ3c2cTdmbWhYQ1Q2TnNYMU5DZHlrK2xva1RwbUNU?=
 =?utf-8?B?dFlpZ2I5Z1lXSHYzRWFkaVZjdG9yc1lCZzVqNC91VkxzOEJtM3RwNmRsbkVJ?=
 =?utf-8?B?em0vT3dtdFMwdXlodWlsTTFqenpyRjJrNkQ0R2d3RzFIVWhISmJib1hvSVJo?=
 =?utf-8?B?UVUvQVJWUXdPeW9YOU5OdUNrUHNCR2JmckF2WHIrVW1hYnAyWVQycDhhZkxM?=
 =?utf-8?B?Mk51cEZhMjhEQWlUYVBBTUd2cCtGM01pWTVnWHYzbjVNN1lPb1RMd3RjSmt2?=
 =?utf-8?B?ejNuMTlpRGZKMURLb2pUdnQ5V29wZlRNMW0vaW9ib0d5VENkVHZMR0FLZXh1?=
 =?utf-8?B?T1lrTytncjhhUERIV2lEbGYzZkVJdit2MmZ5WW5aMTZIclpUaHE2UWJEQ3g2?=
 =?utf-8?B?ZUJuVHZNSHlSSTdTYndHYXM4Zm5HelV1S0dKQUF6V3pCdzV6NVpEWVBORG43?=
 =?utf-8?B?cDBsb2tNRkRXbmlYWGRwSHNWZ1d2dlFENUh6bnhvcDU3bWFBYy84dk1KeUI4?=
 =?utf-8?B?Zmp0WmNNN2NWODRtZUhNaDFKb1NVaXpOU29mSEpVYU1iQ3Y4MVZ6bWlOMUZ5?=
 =?utf-8?B?OTRyb0RNMXlrSjRiRDR1MEJnQjIvVk5jZmZDVDlDMUxjc2pod2lnS2YzcU9E?=
 =?utf-8?B?ZytTaHRaNE8wWjJ2UDhvU2trOW9yUXNibk8yaXlQNUpDTG43aGtRb21HQ2ht?=
 =?utf-8?B?ZTc0SFpqTEVLdGhsL3MrOWgxQUdSQ0ord1FibGtJRFhuL1ZvNmZOOEcxQUxP?=
 =?utf-8?B?dUo0ODFNK0c1Q0V0NzkwbHVjblRrK3hHZVc4NTBaU1NhNklGd2pCcnFuWldW?=
 =?utf-8?B?R3IvRnF5dThJR0RmNGlXcGl0Z2ZiaHBEZkF4Qk5kc1ppbmlvT0xjTGthb2pQ?=
 =?utf-8?B?VEFDM25FU2owS3hTbHJIRmdIbjJ6Z1ZTUW1GQUk3Rkg1RW5SQngvZjRIR21U?=
 =?utf-8?B?RDlJdjNoeHI3bHlCRnZrNDFZUFhWUHBZeHVONiswdjlkTnhjZ0RtRkdHcEVI?=
 =?utf-8?B?NnlnZm5MempZZHNiR0xhUVI0Y01mQXRUbWk4WGtmYjB5WDZYRCtjY0VRaDdN?=
 =?utf-8?B?ckJHYkZnZytzWVBXMmpTcGJYMHpNc0FPOGM1QjlTTVlwYjFvc3hjMFBEK052?=
 =?utf-8?B?SXRuKzRMTlZIWWxkcVg2ME5kUWxkcjE2TEc2RFFSbGltSzM2dytaaC85c0Nr?=
 =?utf-8?B?cmJVZkVVdzJjZWRYcmhDWTIycEJPRVk1eVhtV2pkbGdjMjZkcUJUYWRnM1hx?=
 =?utf-8?B?SFErUCtIbWZBT1IwRmp4ZXp1cWhrOXQwWU5ReUxCWDNyZXU4WVl4WUhPS0p0?=
 =?utf-8?B?VDFCSzBNQkNjV1RqL2E3ZjVEZTNNME84clprZ1VOWGVReU5hVDhNSDcySlZ0?=
 =?utf-8?B?dzc0QnA4U1c0Vk94eFBaZk5rWWNjbzk5WkYvUUw0L09wYUtCMFlQQUV5NkFJ?=
 =?utf-8?B?bzF6NEhRSllGa1R3T2FNdzREUnNkeTZ2cU9hbDhWSUo1cXFvRldzdUNVUnBz?=
 =?utf-8?B?Tmx1WUE4UzlQK3JLcldBOEQxaG5meGt4SjlRaE9WNGJtcTdxV1l0a3BiRUdS?=
 =?utf-8?B?aFE5UGtDUU9mcEFqV3Zvdkp6V01oRnBKakxwZDZUUGJpeWg0Rld0QklyTVFI?=
 =?utf-8?B?SVNYWUpTVzV6V0s3NlExdVA2cmhMcGtYMEFNNVA3Tmd4QnBla2NObmZQWEho?=
 =?utf-8?B?WXFIWFl5bUhieFR5TTJOenJ2T3Z1dDZtU3RlU2x1Q2N2VGhvY25jQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d894c2d-29a4-4799-44f5-08de5cb1b5cc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:05:46.4206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDo+8OcwQaVkbPAVSbvF4fVj50nAu3GjrAjeK8W+/f6Ud8BOfRLiDq/2Lj3eh8pgK/1Aj6prsLbWcV+HRPlu4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8178
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
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Hui.Pu@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B186985433
X-Rspamd-Action: no action

Hi Luca,

On Wed, Jan 07, 2026 at 10:56:29AM +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
> 
> This needs to be handled in various steps:
> 
>  * the bridge returned of_drm_get_bridge() is stored in the local temporary
>    variable next_bridge whose scope is the for loop, so a cleanup action is
>    enough
>  * the value of next_bridge is copied into selected_bridge, potentially
>    more than once, so a cleanup action at function scope plus a
>    drm_bridge_put() in case of reassignment are enough
>  * on successful return selected_bridge is stored in bridge->next_bridge,
>    which ensures it is put when the bridge is deallocated
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> index 91e4f4d55469..b3050310a7f0 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> @@ -23,7 +23,6 @@
>  
>  struct imx8qxp_pixel_link {
>  	struct drm_bridge bridge;
> -	struct drm_bridge *next_bridge;
>  	struct device *dev;
>  	struct imx_sc_ipc *ipc_handle;
>  	u8 stream_id;
> @@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
>  	}
>  
>  	return drm_bridge_attach(encoder,
> -				 pl->next_bridge, bridge,
> +				 pl->bridge.next_bridge, bridge,
>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  }
>  
> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>  {
>  	struct device_node *np = pl->dev->of_node;
>  	struct device_node *port;
> -	struct drm_bridge *selected_bridge = NULL;
> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) = NULL;
>  	u32 port_id;
>  	bool found_port = false;
>  	int reg;
> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>  			continue;
>  		}
>  
> -		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =
> +			of_drm_find_and_get_bridge(remote);
>  		if (!next_bridge)
>  			return -EPROBE_DEFER;
>  
> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>  		 * Select the next bridge with companion PXL2DPI if
>  		 * present, otherwise default to the first bridge
>  		 */
> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
> -			selected_bridge = next_bridge;
> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
> +			drm_bridge_put(selected_bridge);
> +			selected_bridge = drm_bridge_get(next_bridge);

Considering selecting the first bridge without the companion pxl2dpi,
there would be a superfluous refcount for the selected bridge:

1) of_drm_find_and_get_bridge: refcount = 1
2) drm_bridge_put: noop, since selected_bridge is NULL, refcount = 1
3) drm_bridge_get: refcount = 2
4) drm_bridge_put(__free): refcount = 1
5) drm_bridge_get: for the pl->bridge.next_bridge, refcount = 2

I think the below snippet would be the right thing to do:
-8<-
{
	...

	struct drm_bridge *next_bridge __free(drm_bridge_put) =
		of_drm_find_and_get_bridge(remote);
  		if (!next_bridge)
  			return -EPROBE_DEFER;

	/*
	 * Select the next bridge with companion PXL2DPI if
	 * present, otherwise default to the first bridge
	 */
	if (!selected_bridge)
		selected_bridge = drm_bridge_get(next_bridge);

	if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
		if (selected_bridge)
			drm_bridge_put(selected_bridge);

		selected_bridge = drm_bridge_get(next_bridge);
	}
}

...
pl->bridge.next_bridge = selected_bridge;
-8<-

Make sense?

> +		}
>  	}
>  
>  	pl->mst_addr = port_id - 1;
> -	pl->next_bridge = selected_bridge;
> +	pl->bridge.next_bridge = drm_bridge_get(selected_bridge);
>  
>  	return 0;
>  }
> 

-- 
Regards,
Liu Ying
