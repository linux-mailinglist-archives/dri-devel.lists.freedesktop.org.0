Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHbyFy5ihGng2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:26:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BADF0A50
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836D210E81B;
	Thu,  5 Feb 2026 09:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NqlM+eTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013059.outbound.protection.outlook.com
 [40.107.162.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCED10E81B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjXAxTsYcWZWgengS0UC1SPgOvZ12rn5dlARURV0dGBJuaJlLT0mAb3asWlsuslgSr7wfSmE4Ua0H4JtjNO2stQlYda5izV1Z/0FitLFSFOhjhFJeSqN2UF0j5kEjDPx0qDJ8kloylIQzb2DmtWQ9se2jcHktxu0wAAxjx3yX/gZo5OC3g1s+nkv1+0d/oU4SIbYj05+WZ0c/s3LIJZmizIG0d8HngQlA0eJbvTR/wKRrRB1IOyh9IIoLRRU1a2mm9oPtiBJIdp3YekJHYuiudULxunwF+UAKrFQiOXBtm/AuQJ0sLEsOGzFd2m/7Xva+Y6fG6AbXouuiwLlroq5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obJ+wh5w4Zro2iUxvXMj+wuEnl8mLF5vODvJjX33U/o=;
 b=Qbv1zxVE3wWyI8+34ynwMcZ/q++uGCgHYsk0648XbDFeTEM12NPvyufsKnpGzF8tdDr7TdCwum28SoXtOVcfQb9mnLUBT19pmaStPTg+5sNYb9eaBtjEZvLFuzdNL8P8SCexV3OutpdgA9FERHwisCqypYgk5k/ekabq2ntxennLVlVm1N7au5aSAnk3QNLAQakOdtaUgGeI1e2N0KJJ5q0OuI/9bI4GnfMYY0o4rkXHIurkhTubgt4yZ5Ugq3fHPoBNGcgtsOiidS7oV8xYn+JvB5NG8wnTkvCOTJFbRkkuajHuS+EVTZPOdTUGGIYB1Kb7Wu0upHWftWmo3UVBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obJ+wh5w4Zro2iUxvXMj+wuEnl8mLF5vODvJjX33U/o=;
 b=NqlM+eTSsos0WVR6U9Md60ev/eU/s1ptwSZYLhosFVOuq4prt+AkM4a2a9TxPJnQ49g9SS0490dod+AVsD2IFY3SPNVD/z7JKn2aLKJzfuzJF1Dli7ssgMIT+cTXoa5oxrx6YpBEUhnTxjtX3X29ss/t/MlCv/gqNDDv+iI0z/OxLt53588Q+X8p2sY7QSErvgf2NhtW7icAp5oMmPmAZIJpbznXLebAdLlHWGheFuAVX0RVc3Qv03zhH/iBDN0488NQPcy3kvJD+ONaZ4YFeByBuE7AblJ7HVdVmWIN3hh8Z0OAlUlMyJIdqjyQU+mm1vA4jbXo1n9WUErUXaik9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7222.eurprd04.prod.outlook.com (2603:10a6:10:1af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 09:25:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9564.014; Thu, 5 Feb 2026
 09:25:51 +0000
Message-ID: <910325b6-2a0a-40ae-82c2-656fcbb0d060@nxp.com>
Date: Thu, 5 Feb 2026 17:26:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pixel-link: get/put the next bridge
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com>
 <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-1-66bda8d617b4@bootlin.com>
 <8d8e678b-bd3f-441e-9496-e1461a1289ea@nxp.com>
 <DG6WFD0WCCMQ.2AT7S8YHVLH7@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <DG6WFD0WCCMQ.2AT7S8YHVLH7@bootlin.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: 462a0781-35cd-4bde-58a2-08de64988dfa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFBocWU5SjZKYlUza1hwc1YxcmlkVmh0Tk5hdnBzM09sTnNpTU92Z0YrZys4?=
 =?utf-8?B?WnIzcWdZQmZCK1BLbklIYkhhNGxvVmVubnV3dm5NZmdaSytZUGU1RTY1KzVy?=
 =?utf-8?B?d1pwc1JzSm01SERQeWoydDBpSXh2ZFN1SC9ITVRGd0IwdjRYYzg4WHFJYytN?=
 =?utf-8?B?SWg2RmhoclJDektzeEJIaU9UVkJXTjZkdkJFalBsWmJOaU5zNXh3b0JjZGtn?=
 =?utf-8?B?QkRjRW9jbWFKcWpwRGJyRVJrL0hkZ2tBU2FtVnc5akJYK05hYkp2VThMTEFn?=
 =?utf-8?B?NWFMUjl1ZnZGb1NyTldyRmROVkJJMnBNa0swL1RpRGFnaU0rYThXZi9rQmtS?=
 =?utf-8?B?VGlXcG5WN0RZL2YyOWZEVXp6WjIwTWdLT1cvbTVvY083cEU2MDJmU1pXN2t1?=
 =?utf-8?B?bVVtNUFtUHVnUlF3VGUyQ1UyUVdaN3BZMEV0enhRdE9WMHVvc1VaaXFDQUJX?=
 =?utf-8?B?eURPTHFwYkd2ZGRETEZRckR2SThrczE2OER6aW4zdEN3VjZNSjE0Smo4bU9Y?=
 =?utf-8?B?Y0xjem5hQk9xSW1wY1FwdE1TRHNkYlBtZHo1SzdITStpS05JbDdVTGZtN1dV?=
 =?utf-8?B?VEM3NFlOazZLSzNBZ2NVak9reDZiRFVHdy9qdUFYc1A4eWwwZ3AzS3R5Mmkw?=
 =?utf-8?B?NTI0dlY2bTBoellqekhVVEhqblJHNUtuaWxhSmV3ZzR5NVd0R1BmRjl6Z1I2?=
 =?utf-8?B?aVU4L3lOeG1rMWVISENQK09JSGppYlhRREJYbExFTnI2RXpXNEMwTlV0ak10?=
 =?utf-8?B?SEYyeTdXQTZZdnlqSXlDSXV4eFBodEdjeDBaQzFZNm53cnVVUTIwbDRUUGFL?=
 =?utf-8?B?VTRtMzVGMjdCZEwzWkV4cE4rdEdCcTlyMi9zbzV5ckkwTmRzQlFtVFNNenRI?=
 =?utf-8?B?bDJSbFlvb3Boa3lENG9aL3JzVm1VUTJQRmd3Sm9mcnRQY0lDcDhtcncvU3Zj?=
 =?utf-8?B?bmY2MTRXZkM1Wi9ucEN6UW1IN01xYUNYZituRm9vTkJWSDJYOUh0ZXNFeUhw?=
 =?utf-8?B?TWVIZ0dJdEU4eFNoT0Q0b1hxQzZPcjE4ZktNOERIWkhRM2lBMndIY0dHVVda?=
 =?utf-8?B?Y09RN0M3UFkyWHZSbDNBU25yMXZqWG1HTkRyNlJjN0NXS05RVnMwMUpBU2I1?=
 =?utf-8?B?bGlFTzk3aTBSTDNtZWlaY0JlL3NQOGhDbkRlMnVHTzluUmJmam5pbnZubG4x?=
 =?utf-8?B?LzFKUDgyY2QxZ1dvV3gzeHh6OHd4UG8xTnI3aEJGK1RUL3E2Mkdua2hIRjN1?=
 =?utf-8?B?RVd5YndRVTRsdkl3eUV1UnZNU2FiS3c3V2RhNHJqSUsvTWFwMUM5REpyUy96?=
 =?utf-8?B?clI3by9NNlRJQ3JodTFNSEp5SHlnaURrSTJNUGRWWk1HV0UyZUw4aGVBMVRF?=
 =?utf-8?B?VWpRaW9VTU1tN3JQNm03K1p2TFAxZ09qWXd2OGVueVJuVzlXRVdSTEFlWkpa?=
 =?utf-8?B?WXVqOFkzMnVlbFBKTDRyQzR3dzliOHF0dE9YZXdKeWJHZVlHRnpKelJzMFBN?=
 =?utf-8?B?Y1pwV3dLT3VLbnU4cUUvMXlUak5yUzlyVXRKVWF3ZzFRTlIzZGluOWZ4Znpn?=
 =?utf-8?B?aHpSZU5iTkNZbjJCVDN6SUppODU1VXFMWjVFVWJtd1dNa250VHZuSnNjV1h5?=
 =?utf-8?B?bmJwVy9GUGt3M00zMGEweURuWE10T1pGd3FBMzB3SG04MC8yaUNPY3BJd0lE?=
 =?utf-8?B?TVRTYWEzZWVFT0EzQzBHbWRWcUQ5N3dibDc1OThWMnpuRElkNFJpbmhmT3l2?=
 =?utf-8?B?SjVOSlpxWkxxVW9tcVBjZ0dQTk1xNTc2UURYUzZ6WFBnUTVsWVRqNlJqNFNk?=
 =?utf-8?B?U1FnV3B5cGVhQlMzcUVTMmgrK2RGaDROb1VIOForMnNoT3pQM1Fxb05CNDNr?=
 =?utf-8?B?eWdqNEpSMXZnNnR2VmxmSlVVMjEzMUIxb3Q2U3dLNm0xSy9ocDFQS0c0R3N1?=
 =?utf-8?B?QXF4eDc0Zk1XeWNSQlNTY1AwUmMyeEk1U0h6dDZTNi90RU1saEJRY3Z2MitJ?=
 =?utf-8?B?SDVtMkdzRE4wRXJLYVJEZE9UWmc1VlpCTmdSZW1VMUpCSUx0dlphWFU2ZGg3?=
 =?utf-8?B?RXRzQThWLytjenV2QUJ1djBoWHg2NGZsYnlsSVB4WEp0LzgzSi9tSFl5eXJ4?=
 =?utf-8?Q?x+zc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NllBRHpsTlBqYllHcUFPTlhxOU1OS3JIKytoMjRPR3J1QUpTeTNqZWFhUGc4?=
 =?utf-8?B?VjhhQkpEaTNFWUw4QkFEcGFnVnVQNzNzOW44UEZJMmROK1VwZWFoT2xFZEkr?=
 =?utf-8?B?SThXdlpFdExWSjNtRmlQUTRmUloyZ05rOHVTa3haRkIwYVFrNVZ6VXYzNno5?=
 =?utf-8?B?KzBITGdDOTVUSHhNUDdMcmFjNlpDOU00SWo4MlgyalNRSGluU0RNWGpxWUsz?=
 =?utf-8?B?RUxxWTRkdTVoYUc1cDgxMnJuWDlRUC9FVEZOZ1Y5ekpkQXFEVElQSTdjcEJF?=
 =?utf-8?B?NDlwMk9LNlZNaFltVUJtRlpGWC9pWDkwV3JNd2plbzNrNzBBZnhVMHRjOWxG?=
 =?utf-8?B?Rm5KUnpaZFVvYVRGVXF3R1J0KzRyRUhtZUxleHpsZzhFUVh2VHc5ZmtNRXdZ?=
 =?utf-8?B?YitRMzJZOTJmdWcvTi9EYVY0a2JpWXFKQTBkcFplT2EydDV3SjJMVWFUNVBO?=
 =?utf-8?B?QXc4bEZoSm4vMWMyUEljY3pKbnVjMjVQcFFRd2NlYUJjOE5QZzVodEE4MnRt?=
 =?utf-8?B?SHREVm9VTkZxK3o3WDNCbkx5VXQyY3RFaE5LMjk1RXlVdG0ra01lYXBJbnda?=
 =?utf-8?B?ZDNPZFJ5QVl2djBpdE52MzZ6aXhTWHNtNGFkSmx1aFg2cTNUWEo1L1FDbGJZ?=
 =?utf-8?B?cWljei9mQXp0dVVQaWpiNFJaa0gzY09aT2o4R0FPaE56dFFSUTV0MDZVNEpN?=
 =?utf-8?B?N0tHaEpTbXlSZkpCVkVtakl5OUE1d1RVeWFVZ3phb1dWSGdkTW80STNSMkNj?=
 =?utf-8?B?ajg4NStMRWNJZTErWkJ5NitNNVdvc09TOVBqYWtoTW45NmZ5eElMdUdxQlFh?=
 =?utf-8?B?ZmdaYU8xS2c2Q1NFQkFiQlRXM2xVd3VLdDJ6emtScyticzhWeGM5VVpISmpT?=
 =?utf-8?B?Q0k2dGwxSUk0cjZaaE9FZmJHR2pqSW52aW9TMWNvTE1KcnNmbjBuQktKQUFM?=
 =?utf-8?B?K05Mb0hzL05tSWdrQjBaKzNRNG1xQytQaEhIUjVQU0VpVHdhOWZ0ampYMnFQ?=
 =?utf-8?B?SW5IU3NZR0xjcnUzWW1tUXpMTzFjL1VUQktsT1VlZGRxeHZpZXBDcmdCMkpm?=
 =?utf-8?B?WFhQNTRpZzFtbnRlMThydTBVT1dycW0wRDRENDFUTWlRZnFVV3lkMncybCtW?=
 =?utf-8?B?SndmbmVUTTRoOWdlV3BsOENPaUcwbURkckNzaWdKa0t2UzBvYlJFQmxpcHN6?=
 =?utf-8?B?MDllQmlLZHV0c09hYW8xZElWREU0WDNIZWNITzZsRGplTmx5ZERTUTdUZ21B?=
 =?utf-8?B?dC9iYUdEUHROM2lkSjhEbzE1c0cxMVNCL3JkbGxXQmpTYkVEMTNaU096dnFP?=
 =?utf-8?B?dms3bjJHbFRKb3BJbHN6UkZtSmUzZ2VuWWZ6MVE3Q0lVeTUrR2tIYjlUTDVX?=
 =?utf-8?B?M1lWMkV2dFFUSm9rTFV2SGxIblQ4d0JKeDdoTFE2a2o0cFNwUHkwenBSMFdX?=
 =?utf-8?B?dENEcW81ZEphakh2T3Z1dERpK1ljRWJ0Q0RzbEpiNFpzS1pRd1Blcm9aL2kv?=
 =?utf-8?B?VlhYUy9iNVhSUkRvdUJWdFVmUTAzK2grM2lIcTV3NDQ0NWxJbXVtbUU2QlF0?=
 =?utf-8?B?VmdLYnE0azliWnEwbFJtdjI5dXFRUjRHRkZVelEyWFl1OURaZlRIVXhlMC9a?=
 =?utf-8?B?TXJZRlB1WURuSjIyamVDMmtoK1lQTG53Nk9aRElMUVZmaW5QL3lxUHdJZGsy?=
 =?utf-8?B?Z2VvSzZMY01lbWFpWkttOU5Uc0w1dEN3WWo4ajJjeDlBbDJ3VmJjMGNSbTNi?=
 =?utf-8?B?RHBSc0o4SVllenNQaS9qUTJ2QmRUVThIWTFxTEM1YlF6akpiS0VQcHhZbFB1?=
 =?utf-8?B?dDgwOWxFWGw5bmRBdXlxc2VYcnJMMVhONG5KWXFJWmhwa2NyMlhPOGwxM3JI?=
 =?utf-8?B?VEtOMmFqbDBBMkxZQkRHcFljelNwSEFyTTNrZnBpbTI5Yzl0Ulh4cWs1Q2xY?=
 =?utf-8?B?WVRGQm9WYWFqUk1WOXhTYkozTjBEd0pWRzhSK0d0Tk51K0dERGdtRlhwMy9P?=
 =?utf-8?B?SjJIaVdZWVprenU3SXlyemwyUW9PTGdaZHZkWkhmdXN0RE8wWktnS3R6TkZS?=
 =?utf-8?B?anRPNkVtemJ6bVlvaUFTcFJDRDQwM2pvbUVocnQ3NHhJK0xiZWlCbWxkbWgr?=
 =?utf-8?B?NzVyMDEwMGVlcnowdGJoK1FMVzg4V0V2dzNMQjE2L0VFMjE4cGtsSzBTd2xx?=
 =?utf-8?B?OEFtR0ZkVDFBVFJZREZ4UmQzRFJ4S2NHVkx2a3ZaTVNnV2RvQ1hGdEp4ODNi?=
 =?utf-8?B?Y3RzNWRGOWx0U05pSkN4UHluOEQ3VWZBZHp4aERKMmlGaTA3ZTlNdHRiUk1V?=
 =?utf-8?B?NWZlWWtYUjZWVnMwem5JUDkxWTBocTlDdm1jTjhnR3VXNmRoT21Mdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462a0781-35cd-4bde-58a2-08de64988dfa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 09:25:51.5811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQRp8EEvYE+QODxXjhpw71x8zGfWaoyg+hB87G2m8tDGpj4FaFbfN0HsY9a3zW18WA6dVlwFgf9k0xT5/mdv1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7222
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
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,bootlin.com:url,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B9BADF0A50
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 09:52:04AM +0100, Luca Ceresoli wrote:
> Hello Liu,

Hello Luca,

> 
> On Wed Feb 4, 2026 at 7:27 AM CET, Liu Ying wrote:
>> Hi Luca,
>>
>> On Tue, Feb 03, 2026 at 11:35:25AM +0100, Luca Ceresoli wrote:
>>> This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
>>> function and stores it until driver removal. of_drm_find_bridge() is
>>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>>> refcounted and use bridge->next_bridge to put the reference on
>>> deallocation.
>>>
>>> To keep the code as simple and reliable as possible, get a reference for
>>> each pointer that stores a drm_bridge address when it is stored and release
>>> it when the pointer is overwritten or goes out of scope. Also remove the
>>> intermediate selected_bridge variable to reduce the refcounted variables in
>>> the function. The involved pointers are:
>>>
>>>  * next_bridge loop-local variable:
>>>    - get reference by of_drm_find_and_get_bridge()
>>>    - put reference at the end of the loop iteration (__free)
>>>
>>>  * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
>>>    - get reference when assigned (by copy from next_bridge)
>>>    - put reference before reassignment if reassignment happens
>>>    - put reference when the struct imx8qxp_pixel_link embedding the
>>>      struct drm_bridge is destroyed (struct drm_bridge::next_bridge)
>>>
>>> Additionally, split the somewhat complex if() for readability.
>>>
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>
>>> ---
>>>
>>> Changes in v5:
>>> - rewrite commit message after Liu's review to clarify the per-pointer
>>>   get/put idea
>>> - split the if()s involved in selcting the bridge
>>> - remove intermediate selected_bridge pointer
>>> - removed Maxime's R-by, patch changed
>>> ---
>>>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 17 ++++++++++-------
>>>  1 file changed, 10 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>>> index 91e4f4d55469..e29e099b893a 100644
>>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>>> @@ -23,7 +23,6 @@
>>>
>>>  struct imx8qxp_pixel_link {
>>>  	struct drm_bridge bridge;
>>> -	struct drm_bridge *next_bridge;
>>>  	struct device *dev;
>>>  	struct imx_sc_ipc *ipc_handle;
>>>  	u8 stream_id;
>>> @@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
>>>  	}
>>>
>>>  	return drm_bridge_attach(encoder,
>>> -				 pl->next_bridge, bridge,
>>> +				 pl->bridge.next_bridge, bridge,
>>>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>  }
>>>
>>> @@ -260,7 +259,6 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>  {
>>>  	struct device_node *np = pl->dev->of_node;
>>>  	struct device_node *port;
>>> -	struct drm_bridge *selected_bridge = NULL;
>>>  	u32 port_id;
>>>  	bool found_port = false;
>>>  	int reg;
>>> @@ -297,7 +295,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>  			continue;
>>>  		}
>>>
>>> -		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =
>>> +			of_drm_find_and_get_bridge(remote);
>>>  		if (!next_bridge)
>>>  			return -EPROBE_DEFER;
>>>
>>> @@ -305,12 +304,16 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>  		 * Select the next bridge with companion PXL2DPI if
>>>  		 * present, otherwise default to the first bridge
>>>  		 */
>>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
>>> -			selected_bridge = next_bridge;
>>> +		if (!pl->bridge.next_bridge)
>>> +			pl->bridge.next_bridge = drm_bridge_get(next_bridge);
>>> +
>>> +		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>>> +			drm_bridge_put(pl->bridge.next_bridge);
>>> +			pl->bridge.next_bridge = drm_bridge_get(next_bridge);
>>> +		}
>>
>> Can you drop the intermediate next_bridge variable to simplify the code?
>>
>> -8<-
>> if (!pl->bridge.next_bridge) {
>>         pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
>>         if (!pl->bridge.next_bridge)
>>                 return -EPROBE_DEFER;
>> }
>>
>> if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>>         drm_bridge_put(pl->bridge.next_bridge);
>>         pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
>>         if (!pl->bridge.next_bridge)
>>                 return -EPROBE_DEFER;
>> }
>> -8<-
> 
> Potentially calling of_drm_find_and_get_bridge() twice on the same node,
> with a put in the middle, looks poorly readable to me, even though it still
> looks correct code.
> 
> However I think we can do even better with an 'else if':
> 
>   if (!pl->bridge.next_bridge) {
>          pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
>          if (!pl->bridge.next_bridge)
>                  return -EPROBE_DEFER;
>   } else if (of_property_present(remote, "fsl,companion-pxl2dpi")) {   <===
>          drm_bridge_put(pl->bridge.next_bridge);
>          pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
>          if (!pl->bridge.next_bridge)
>                  return -EPROBE_DEFER;
>   }
> 
> Looks OK?

Both are fine to me.  TBH, I feel my version with two 'if's is a bit easier
to read.  But, I'd say up to you.

> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/

-- 
Regards,
Liu Ying
