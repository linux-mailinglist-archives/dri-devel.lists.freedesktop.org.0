Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJlRMAOnk2ln7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2239C148116
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C53010E407;
	Mon, 16 Feb 2026 23:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yI0MP5cU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8DF10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFW839YCFi9+WcKT0v24ioxaNJ/kDHEyJuRaZ2VAXg+4x+7Dm8b32T6qpaXzxPRJARL0Bn9HbvN1Q3/JERU+oB9weNCNjxqg/wEqSZFG65OK7g7ZzYv2jdL8W6G6Nqb2iNoDEDXZgeizTvtqK+SAyJuwYJ5103MsdBI9ydMudmxOLrWkMy8gTUg3iJaGB/w/o9v9fPbe3/URpgitzeRLMVs+4/0KGZKRhBvxrRjBjfXiLzsIGo+/fg9uR2dvEz4YjDBK+lbEe+TU6uGzjthkNfVqiZM5xY8ieG3sZUXJAv4vCskUlwcrSv+ndu8hP5cZq1Ee9ZPM2MGaS3H2gU5HXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAi+UYoNutSn5ow3obQu/8mu6tOXB5ia/UqLHYmhGvM=;
 b=fr/Fb4PdRnqHKD1zfVxWOAWpDFzbGBA8m530wykrwnlb63xy/VEy1scIPPF12ibKu1ENt63HIP8Q9TD140Ai07T7ffF4MmxsYT4dj4EFJjFi8P9j60Oed9FUx2bJ5YWi5QVo9ACINamMBkGtBufa4xtr9YbKU9MJvfDFoX/DBmSWSVMB+DtHJB4miwX3DuNtKmBZe2nHU4mcyx1M4IrnSuDIxhPa7/N2e1mDnqlx1/2Fu0dk7tW0qDK3UhBD5EspaHO0DoSgSYXRcD3FLUWSubJ4SgjeIINJkIQ5UNeczPGsKo2m+B3plhVuKUxUZGd/QVpSWWvAwldWgnp+0YPlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAi+UYoNutSn5ow3obQu/8mu6tOXB5ia/UqLHYmhGvM=;
 b=yI0MP5cUYzKXnXFWVhzA7MZfVwAAmsNPXVeeebyUOhFq/4E0MvcpKxkGha5I1q+NvQr0Eb7Pg/DKdwzpmVnnmjJXTECDTIm4b+/XwkVx5dYpdv/JjJi3vPP3ya7GFE39fjbQBXocaXpt9+cCtdDov6M7bBPIBOB7kBC8AuF90KmImrJVkOkhKqydTIjR2eDHOuR6oy64bwvlh7wI+g5zOjG5AuMgweMA9Dx/Ev6adtddA92ppRtSu0Pwj6t2z0BoU53hixaxHNC3+gPiP225tjrQsOgtD7XrI4P9lSJTyh17e4LgfCdiCjg/hYXxo/a1r5tU5a+W5CAgSthOKd2vxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:39 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:39 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com, cosmin.stoica@nxp.com,
 adrian.nitu@freescale.com, stefan-gabriel.mirea@nxp.com,
 Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Radu Pirea <radu-nicolae.pirea@nxp.com>, Phu Luu An <phu.luuan@nxp.com>,
 Js Ha <js.ha@nxp.com>, Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 12/13] serial: linflexuart: Add DMA support
Date: Mon, 16 Feb 2026 16:02:04 +0100
Message-ID: <20260216150205.212318-13-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::6) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|DU4PR04MB12026:EE_
X-MS-Office365-Filtering-Correlation-Id: 36cf8474-03a2-4d94-8c1b-08de6d6c6d69
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|19092799006|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkllcUwvSHQrblNYRzNCM3F1bURNYU85ZElvTXZ5cTRtaWxVNlhVcmdsQnRP?=
 =?utf-8?B?bjJYZUpmRWdwTldSdkNyUjZpV2F1SjlyZG1mZm9aS1J5bDl0Y1JuNHJ5TGtQ?=
 =?utf-8?B?M1NpVFlRaDlFRkpOZnkvanZYSHEyQnAwODFNbVpFMW1Pd3JkT3h6aytPT2Ji?=
 =?utf-8?B?cERpcjRhN1RpTFdlbFRMakRGZWJUSWFzSDE3d0NZUnR2NW9lN2FITWNCWVUw?=
 =?utf-8?B?TWMyd3B6YVZuMmVKeXNxSjZZVEkrWDg5OElCekZPVzdtRjI4cEEyT1dtN3lK?=
 =?utf-8?B?ME85MEs4K2VSL1J6TXoxTzVVeU4rUnBQeXlraGI0OGI5YzBySDdZVHFkTnBH?=
 =?utf-8?B?dW1STzNHRHdKMmtsa1FXT1VyZkN6T1Nla0cvS0dtSmtNSzNPT0YwdHVxaE9J?=
 =?utf-8?B?QXFBSllTcCtPQTF6SUhaK2UrRk1qVlFXTXJDZDdOTzVpRjhIdlgxYmNPQ2N3?=
 =?utf-8?B?a3JENkY3cVFnYW9sbW14WVBocGZQUWI3T0Z2YkJGVnZpZTFyWjJDK0hjWUZo?=
 =?utf-8?B?NTVvTHg3M2Z3bGJOcWkzRGswUnFzVE5ma3QxS2tIaXAvL3BxQmw1K3ZTN2NQ?=
 =?utf-8?B?TEZ0VjN0eDJ3aGZhNmY0TVVQaCtwZllrYXc2WEVvbzEzZm13NlM0Y1JXUWRo?=
 =?utf-8?B?MzhZUklTRVQ2cDBFblIrT1BXQ2Z6SmpqdHV6aG5MTDNrNzVlRDdxQTFKNEVm?=
 =?utf-8?B?bW1LZHJIdWtGQ0RJOVRhVTVYZmNBdjdiNU5JOUhIZkJVSmd6eFBGUEJ5MDVN?=
 =?utf-8?B?QWtLd285LzRVUEdFQW1QdHczUHJtcW9sZHlLeUEwc2lPOWpnYWM0T0VFYWNq?=
 =?utf-8?B?Q0MxWXZNWDFXMnZQS0IxTFZJOGErZldubjdwMnZZekNmT2FZZXRJMmpjbGRS?=
 =?utf-8?B?ZWQyWXJnQUg2ZFlFTXVGNXNhMHpSY1M2aEg4RHBaWDA5UG9JNDVxU2lUajRz?=
 =?utf-8?B?bFU2cGM3MHBmNHhabzJNL3JsNFB3bVNZS2RYcmozaHhnM3Y0d3gvTVE0dTFQ?=
 =?utf-8?B?a1FQYUFTVjN4c1lEclBxWEVtQncyYzVJSkJzMjZOT2syTTBQNXAzdk40U0tF?=
 =?utf-8?B?czRMSjJjTGJPMC9ReDZ3UHVwUmlobjZkbmU2NFJvRjh5RFUrWnF0ZTZIZXQz?=
 =?utf-8?B?QVZJS3MxYW4wZWNCS0NaNEtLVjFhYnpLSlk4MVJ5b1BVSU5wRThGR0thL0Vl?=
 =?utf-8?B?bGc5WWNEQy9rR1hPaWRUTyttYzFITjFlSmRSYmNsbHdmUU00RGZua3UzdFk2?=
 =?utf-8?B?cnhwM05ZNGQxNFBreGMzanlBbjJqS1l1Rnc5aC9oN2xBby9qS2lraWpxZUxR?=
 =?utf-8?B?OFd1TEx2NDV3cVBlWXpDRVE5bFZVc3lIZERYa3JGMFdYZ3d0dTk4cHMxK3lo?=
 =?utf-8?B?NHhIQVRlTHNpbVdwK3FnTWtsc0kyVEpNTkhkd1BiTjZTQkp6SjhYaklnOWZk?=
 =?utf-8?B?T3U3RVd3SmVPaE5BTFduVms0YjNoVEtaUkJRcE80ZE15N0x5YXBESTlGSGFR?=
 =?utf-8?B?bEg2dVBzTlJYNWpoSE5aS1p6NHRES0E3SVBHb2ZYZTdGY1g5MmRzdFRWSXJr?=
 =?utf-8?B?aTFwSlFYL0FzdDI1NCtXazRoaU9CRE5HVUo0Qkp1a0VJY25qUHpUclluLzRz?=
 =?utf-8?B?bm9sZzhqd0NFNGthbEJQZEI1SDNQazRiSFFPMXFJci9WbVNFK0dXanoySlFy?=
 =?utf-8?B?d3k3bkoxbXNFY1kwcEMwRFEvdUM3bTd0WkJFUG5ua3BpQjcxTG96WmVrREZi?=
 =?utf-8?B?MkZpcWVpTmxmMFRxVnhWNldaYmc0T0NaTTJzbzk1cSsrNzJSeTFwQUoxdkJu?=
 =?utf-8?B?bklzWE1tUlk4c0RKWk0vaGhFWGs1cWR0alhNRm1HaUVzRitneFJhMlFDWnNV?=
 =?utf-8?B?cGYzTE5pOGNzeTA1M0xoYmd5bEJTUEszaDhtSmJyUUFNU2FlRUNLOVM0QjNS?=
 =?utf-8?B?VzUycGhHQmJJK2NnQ2psS1phRDRjaHVzMFJheDhHL201NmVpTHVMMFRDcWhS?=
 =?utf-8?B?SG9QWE4zd01pSFFwTlZoZkszZUJrandLSHdkcE5mVWNwZXcrd0VweGpzWDBu?=
 =?utf-8?B?M0M5QzRoT1EyVkJDM3o1RkMrLzN4eXlqRjRDd1F6SVJQN2dJNjVjSzA0RkhZ?=
 =?utf-8?B?VHVIVUdnMVdQbUEyUEs0WG1qU2NXMmQzenhsTzRkUUNsWUJwek85QUZvU0o3?=
 =?utf-8?B?V2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjRSSjh3OXZGdTNEQ01oV2ZLRERhWldVTXdtM2lQSFY4OHJGL1hINVVFcjM3?=
 =?utf-8?B?ckJMVG5uU2FXd1V4SUg0SFpvNkthWVlJZlRJYmxiZEs3bzJOMVFPQ1g5K3BM?=
 =?utf-8?B?Q2VTRlFjSnU4TVJ3cXZoaGpNQzBkWGVKREpia2RaaWNyWDdkQk0vRFQzcSsv?=
 =?utf-8?B?U1hQb1lKc1FLY2d5Umpnd2QxWlFnVVhzaStHNDFlWDFxL0FhUS94ckxubzNa?=
 =?utf-8?B?Z1hGYWc1RkpDV1hQanlWOVptdlpoWFdaYVVpUEF5OTREejlPV3JRQksxOC8w?=
 =?utf-8?B?Qjc3RHRiTGxNQ2lLbFdSWkJ4UXNWaUJiakdnQng0QXUvQ3dtM1lmc0psUjJU?=
 =?utf-8?B?NUhwdUZESFhYWk9IbzVNV1N4Y3Z5b2w2ZzZEdVV6c3RVUTMxQnZHRVNjdHN6?=
 =?utf-8?B?QWRUN0dVSHJUeS9FVzNUTkl2NDRoRWdFeFQ2eEVQa0J1dHAwYVNTLzBGR2t4?=
 =?utf-8?B?eWNDSCs1Rk5weWkwbE9MZEZib1h2YzR1azJYV2NNdlQxbW9JMytnOVJlOEhz?=
 =?utf-8?B?anVrdzdLb0t3ekFqTlpDelZpaGQ0OU1TeE91Sm5iRG84ZjYwcWlURm9LMEhR?=
 =?utf-8?B?dVpHT2cvTkp1K3lVd3hPZzQvVEZuVk4rN0VteEJCMDVHOFdubGlxdFdqMTF0?=
 =?utf-8?B?MFhqdlRVSWtoS1FSbmtyTUI5bVFvMDNZdVh3dVpyQTFMRjJadnBQRWxQdEZC?=
 =?utf-8?B?TmpaTGtiUGVzVTNGZWlSSlR1ekRva3NSR0w4TWw0SUlsNnJNRWs0bUJCZmI5?=
 =?utf-8?B?NnNJUlNHRFhUZVYvVHBaVEtyTy9qbTlQRTF3ck1oUzA0S2JEVXRvVG5HaDZO?=
 =?utf-8?B?VU9FRDJ4NVRPSDRPS3hpaWFEdlNhSW5mMnNCd3lJdWdtK25QamhxWGw0b1VR?=
 =?utf-8?B?aW1mc1g4SU8rcTQ4S1JGazRINzJIK0ZYOFFsdG1pejBTeG54NFRsRGluTTQz?=
 =?utf-8?B?aTVtSTM5R1kvVGw1Yk1VWlRhUnZtc00vczgwS2xCcWhNWkRqZlNsMURuQkZU?=
 =?utf-8?B?ZGFIVFpVTGh6VHJVdmMxV2psVjNxaTJ4ZW9XUEl3K3l5R3Vpa3Ura0dJeFZm?=
 =?utf-8?B?R3dpcy9LbHl5TUh2MmxpUkxSRldJUDZrODloYXkvbWt0K2FyRXdQZXRNaitK?=
 =?utf-8?B?Ri9QdmlOMmc3S1EzU1B4V1lCRnFzNzdZTE94L1ViS0RWVkZkaXVKNW1VanBB?=
 =?utf-8?B?cmNhY0dZNUdTNGV1RTRnb0pLS01VWUZIeFNvYUE2QmsvdUtSd3RvaWpXZWt3?=
 =?utf-8?B?NDlWNmxwdko4YU44VU1zdFhscytPUTlIemRwQkFTQm8ya1pXeENvMlBOSG1l?=
 =?utf-8?B?TExURHkybGJvejRFNVQrVi9maCs1dkcydjJGVjYva3p1TzVFbmZsN21vZmJF?=
 =?utf-8?B?RUhmL3BXdDdQc3A4NUFDcXFyVnFibnUyTWQwWDlmWVlXVU1OY2ZKSTBGVFp4?=
 =?utf-8?B?dWdLVWQ5dHp1dDZ5NUd6YmxvNTkyblYwbW9aR3dJSWVJZVNtTUl6a2VIaHF0?=
 =?utf-8?B?STlUeC9kOStiQ1FncVY1dk1GcTFTN0JValVyNzhac3NtS1lmaWwzTmY2NDAx?=
 =?utf-8?B?OVpWOGRuNGhvTUZXS2pRUHdXcFB4WjlPVnV1eXNqeUVWS0pGMEZDd1BpQ3hR?=
 =?utf-8?B?cjVvNFRUTk51NEFkbkx4WWdoVzEzTFFWSzkralJZZlg2QU5Zb2FDMGdXVmh0?=
 =?utf-8?B?M3Brcld0T0UzYUxrOVhXcjBHUGVzNUpzdzZldUxGUlN6dXYwQTd0VC9pOXhZ?=
 =?utf-8?B?aUVJcEZwV3Nqaklmc2ZXUURZWW5INXdIVzFjZGlCN01VUURPMmhGdVRnaGFP?=
 =?utf-8?B?MVVOZVptZmZmOFJZd0ZoQ0lmWTMvakFNSmZ3dm5kSis4OVZLYnFUcDVXS1RQ?=
 =?utf-8?B?ZkY3YXZ6ZnVCb3plWDdwdDZIUDJyQmpNY2VlSVlOZXhVRDFGYXJqNStsYlky?=
 =?utf-8?B?SXZSeGlqUVQ5eENZSGNKTkJVMmUvTHFESVVWLytHelFHWTQ3aG9Tb0I5RnVp?=
 =?utf-8?B?TFJKQk1HYS9aWGh0L2xhTkRuY3hNdVhZNk5ycHdKTnZua0FwMnB5Ukt5WVdD?=
 =?utf-8?B?WGkyLzdFc1hrK0dnMWJNNWV3Z3c5RVQrdE12MEpIeU9Fd1pLRUJPMHhzT3NJ?=
 =?utf-8?B?QnB6Z0sxZUg3QjhaWUI2VTQ3bXpmeGFVTG0zS3lmeExYMzg4bGYvRGg2YVZq?=
 =?utf-8?B?enBjUXhpRTJ1R1p0VDVlOC9qZlRKd3M1WU9IcTMzc1dwUmlrdmFtK2EwbVAv?=
 =?utf-8?B?TSszMFF1S2wxd1JOM3IzTTNKWVhqcjJMMC9lMUlCZHd6TWtvNjE1UWJpNFFF?=
 =?utf-8?B?Z1NUREp3dU9jYzNJMC84U0I0TzhLQTErSzhYTGJ3UGgzM1JwYlpmNC93QWtl?=
 =?utf-8?Q?wo0Icmlw2lD7AMxA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cf8474-03a2-4d94-8c1b-08de6d6c6d69
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:39.4506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cxt16BNlKnISOhEcv7+/+Ah6U7WHK3Pusb1ElyjIaOqs1m8LnYfK7ZEVkguO5AmVmT7CgGgRuNOLqG0p2Xow1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12026
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:larisa.grigore@oss.nxp.com,m:radu-nicolae.pirea@nxp.com,m:phu.luuan@nxp.com,m:js.ha@nxp.com,m:ghennadi.procopciuc@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2239C148116
X-Rspamd-Action: no action

Add support for using DMA to avoid generating one interrupt per
character and losing characters while copy-paste.
In UART mode, the DMA capability can be used only if the UART Tx/Rx
buffers are configured as FIFOs.
If the DMA related properties are missing from the device tree, the
driver will fall back to interrupt + Buffer mode.
On the RX side, a timer is used to periodically poll for received data.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Co-developed-by: Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>
Signed-off-by: Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>
Co-developed-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
Co-developed-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Co-developed-by: Js Ha <js.ha@nxp.com>
Signed-off-by: Js Ha <js.ha@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 642 +++++++++++++++++++++++++--
 1 file changed, 597 insertions(+), 45 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index a5a34fd81bcf..dff37c68cff0 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -3,19 +3,24 @@
  * Freescale LINFlexD UART serial port driver
  *
  * Copyright 2012-2016 Freescale Semiconductor, Inc.
- * Copyright 2017-2019, 2021-2022 NXP
+ * Copyright 2017-2019, 2021-2022, 2025 NXP
  */
 
 #include <linux/clk.h>
 #include <linux/console.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
+#include <linux/dmapool.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
 #include <linux/slab.h>
 #include <linux/tty_flip.h>
+#include <linux/jiffies.h>
 #include <linux/delay.h>
 
 /* All registers are 32-bit width */
@@ -42,6 +47,12 @@
 #define GCR	0x004C	/* Global control register			*/
 #define UARTPTO	0x0050	/* UART preset timeout register			*/
 #define UARTCTO	0x0054	/* UART current timeout register		*/
+/* The offsets for DMARXE/DMATXE in master mode only			*/
+#define DMATXE	0x0058	/* DMA Tx enable register			*/
+#define DMARXE	0x005C	/* DMA Rx enable register			*/
+
+#define DMATXE_DRE0	BIT(0)
+#define DMARXE_DRE0	BIT(0)
 
 /*
  * Register field definitions
@@ -140,6 +151,9 @@
 
 #define PREINIT_DELAY			2000 /* us */
 
+#define FSL_UART_RX_DMA_BUFFER_SIZE	(PAGE_SIZE)
+#define LINFLEXD_UARTCR_FIFO_SIZE	(4)
+
 enum linflex_clk {
 	LINFLEX_CLK_LIN,
 	LINFLEX_CLK_IPG,
@@ -154,6 +168,24 @@ static const char * const linflex_clks_id[] = {
 struct linflex_port {
 	struct uart_port	port;
 	struct clk_bulk_data	clks[LINFLEX_CLK_NUM];
+	unsigned int		txfifo_size;
+	unsigned int		rxfifo_size;
+	bool			dma_tx_use;
+	bool			dma_rx_use;
+	struct dma_chan		*dma_tx_chan;
+	struct dma_chan		*dma_rx_chan;
+	struct dma_async_tx_descriptor  *dma_tx_desc;
+	struct dma_async_tx_descriptor  *dma_rx_desc;
+	dma_addr_t		dma_tx_buf_bus;
+	dma_addr_t		dma_rx_buf_bus;
+	dma_cookie_t		dma_tx_cookie;
+	dma_cookie_t		dma_rx_cookie;
+	unsigned char		*dma_rx_buf_virt;
+	unsigned int		dma_tx_bytes;
+	int			dma_tx_in_progress;
+	int			dma_rx_in_progress;
+	unsigned long		dma_rx_timeout;
+	struct timer_list	timer;
 };
 
 static const struct of_device_id linflex_dt_ids[] = {
@@ -168,6 +200,76 @@ MODULE_DEVICE_TABLE(of, linflex_dt_ids);
 static struct uart_port *earlycon_port;
 #endif
 
+static void linflex_dma_tx_complete(void *arg);
+static void linflex_dma_rx_complete(void *arg);
+static void linflex_console_putchar(struct uart_port *port, unsigned char ch);
+
+static inline struct linflex_port *
+to_linflex_port(struct uart_port *uart)
+{
+	return container_of(uart, struct linflex_port, port);
+}
+
+static void linflex_copy_rx_to_tty(struct linflex_port *lfport,
+				   struct tty_port *tty, int count)
+{
+	size_t copied;
+
+	lfport->port.icount.rx += count;
+
+	if (!tty) {
+		dev_err(lfport->port.dev, "No tty port\n");
+		return;
+	}
+
+	dma_sync_single_for_cpu(lfport->port.dev, lfport->dma_rx_buf_bus,
+				FSL_UART_RX_DMA_BUFFER_SIZE, DMA_FROM_DEVICE);
+	copied = tty_insert_flip_string(tty,
+					((unsigned char *)(lfport->dma_rx_buf_virt)),
+					count);
+
+	if (copied != count) {
+		WARN_ON(1);
+		dev_err(lfport->port.dev, "RxData copy to tty layer failed\n");
+	}
+}
+
+static void linflex_enable_dma_rx(struct uart_port *port)
+{
+	unsigned long dmarxe = readl(port->membase + DMARXE);
+
+	writel(dmarxe | DMARXE_DRE0, port->membase + DMARXE);
+	while (!(readl(port->membase + DMARXE) & DMARXE_DRE0))
+		;
+}
+
+static void linflex_enable_dma_tx(struct uart_port *port)
+{
+	unsigned long dmatxe = readl(port->membase + DMATXE);
+
+	writel(dmatxe | DMATXE_DRE0, port->membase + DMATXE);
+	while (!(readl(port->membase + DMATXE) & DMATXE_DRE0))
+		;
+}
+
+static void linflex_disable_dma_rx(struct uart_port *port)
+{
+	unsigned long dmarxe = readl(port->membase + DMARXE);
+
+	writel(dmarxe & 0xFFFF0000, port->membase + DMARXE);
+	while (readl(port->membase + DMARXE) & DMARXE_DRE0)
+		;
+}
+
+static void linflex_disable_dma_tx(struct uart_port *port)
+{
+	unsigned long dmatxe = readl(port->membase + DMATXE);
+
+	writel(dmatxe & 0xFFFF0000, port->membase + DMATXE);
+	while (readl(port->membase + DMATXE) & DMATXE_DRE0)
+		;
+}
+
 static inline void linflex_wait_tx_fifo_empty(struct uart_port *port)
 {
 	unsigned long cr = readl(port->membase + UARTCR);
@@ -179,36 +281,113 @@ static inline void linflex_wait_tx_fifo_empty(struct uart_port *port)
 		;
 }
 
+static void _linflex_stop_tx(struct uart_port *port)
+{
+	struct linflex_port *lfport = to_linflex_port(port);
+	unsigned long ier;
+
+	if (!lfport->dma_tx_use) {
+		ier = readl(port->membase + LINIER);
+		ier &= ~(LINFLEXD_LINIER_DTIE);
+		writel(ier, port->membase + LINIER);
+		return;
+	}
+
+	linflex_disable_dma_tx(port);
+}
+
 static void linflex_stop_tx(struct uart_port *port)
 {
+	struct linflex_port *lfport = to_linflex_port(port);
+	struct dma_tx_state state;
+	unsigned int count;
+
+	_linflex_stop_tx(port);
+
+	if (!lfport->dma_tx_in_progress)
+		return;
+
+	dmaengine_pause(lfport->dma_tx_chan);
+	dmaengine_tx_status(lfport->dma_tx_chan,
+			    lfport->dma_tx_cookie, &state);
+	dmaengine_terminate_all(lfport->dma_tx_chan);
+	count = lfport->dma_tx_bytes - state.residue;
+	uart_xmit_advance(port, count);
+
+	lfport->dma_tx_in_progress = 0;
+}
+
+static void _linflex_start_rx(struct uart_port *port)
+{
+	struct linflex_port *lfport = to_linflex_port(port);
 	unsigned long ier;
 
-	ier = readl(port->membase + LINIER);
-	ier &= ~(LINFLEXD_LINIER_DTIE);
-	writel(ier, port->membase + LINIER);
+	if (!lfport->dma_rx_use) {
+		ier = readl(port->membase + LINIER);
+		writel(ier | LINFLEXD_LINIER_DRIE, port->membase + LINIER);
+		return;
+	}
+
+	linflex_enable_dma_rx(port);
 }
 
-static void linflex_stop_rx(struct uart_port *port)
+static void _linflex_stop_rx(struct uart_port *port)
 {
+	struct linflex_port *lfport = to_linflex_port(port);
 	unsigned long ier;
 
-	ier = readl(port->membase + LINIER);
-	writel(ier & ~LINFLEXD_LINIER_DRIE, port->membase + LINIER);
+	if (!lfport->dma_rx_use) {
+		ier = readl(port->membase + LINIER);
+		writel(ier & ~LINFLEXD_LINIER_DRIE, port->membase + LINIER);
+		return;
+	}
+
+	linflex_disable_dma_rx(port);
+}
+
+static void linflex_stop_rx(struct uart_port *port)
+{
+	struct linflex_port *lfport = to_linflex_port(port);
+	struct dma_tx_state state;
+	unsigned int count;
+
+	_linflex_stop_rx(port);
+
+	if (!lfport->dma_rx_in_progress)
+		return;
+
+	dmaengine_pause(lfport->dma_rx_chan);
+	dmaengine_tx_status(lfport->dma_rx_chan,
+			    lfport->dma_rx_cookie, &state);
+	dmaengine_terminate_all(lfport->dma_rx_chan);
+	count = FSL_UART_RX_DMA_BUFFER_SIZE - state.residue;
+
+	lfport->dma_rx_in_progress = 0;
+	linflex_copy_rx_to_tty(lfport, &port->state->port, count);
+	tty_flip_buffer_push(&port->state->port);
 }
 
 static void linflex_put_char(struct uart_port *sport, unsigned char c)
 {
+	struct linflex_port *lfport = to_linflex_port(sport);
 	unsigned long status;
 
 	writeb(c, sport->membase + BDRL);
 
 	/* Waiting for data transmission completed. */
-	while (((status = readl(sport->membase + UARTSR)) &
-				LINFLEXD_UARTSR_DTFTFF) !=
-				LINFLEXD_UARTSR_DTFTFF)
-		;
+	if (!lfport->dma_tx_use) {
+		while (((status = readl(sport->membase + UARTSR)) &
+					LINFLEXD_UARTSR_DTFTFF) !=
+					LINFLEXD_UARTSR_DTFTFF)
+			;
+	} else {
+		while (((status = readl(sport->membase + UARTSR)) &
+					LINFLEXD_UARTSR_DTFTFF))
+			;
+	}
 
-	writel(LINFLEXD_UARTSR_DTFTFF, sport->membase + UARTSR);
+	if (!lfport->dma_tx_use)
+		writel(LINFLEXD_UARTSR_DTFTFF, sport->membase + UARTSR);
 }
 
 static inline void linflex_transmit_buffer(struct uart_port *sport)
@@ -228,18 +407,198 @@ static inline void linflex_transmit_buffer(struct uart_port *sport)
 		linflex_stop_tx(sport);
 }
 
+static int linflex_dma_tx(struct linflex_port *lfport, unsigned int count,
+			  unsigned int tail)
+{
+	struct uart_port *sport = &lfport->port;
+	dma_addr_t tx_bus_addr;
+
+	while ((readl(sport->membase + UARTSR) & LINFLEXD_UARTSR_DTFTFF))
+		;
+
+	dma_sync_single_for_device(sport->dev, lfport->dma_tx_buf_bus,
+				   UART_XMIT_SIZE, DMA_TO_DEVICE);
+	lfport->dma_tx_bytes = count;
+	tx_bus_addr = lfport->dma_tx_buf_bus + tail;
+	lfport->dma_tx_desc =
+		dmaengine_prep_slave_single(lfport->dma_tx_chan, tx_bus_addr,
+					    lfport->dma_tx_bytes, DMA_MEM_TO_DEV,
+					    DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+
+	if (!lfport->dma_tx_desc) {
+		dev_err(sport->dev, "Not able to get desc for tx\n");
+		return -EIO;
+	}
+
+	lfport->dma_tx_desc->callback = linflex_dma_tx_complete;
+	lfport->dma_tx_desc->callback_param = sport;
+	lfport->dma_tx_in_progress = 1;
+	lfport->dma_tx_cookie = dmaengine_submit(lfport->dma_tx_desc);
+	dma_async_issue_pending(lfport->dma_tx_chan);
+
+	linflex_enable_dma_tx(&lfport->port);
+	return 0;
+}
+
+static void linflex_prepare_tx(struct linflex_port *lfport)
+{
+	struct tty_port *tport = &lfport->port.state->port;
+	unsigned int count, tail;
+
+	count = kfifo_out_linear(&tport->xmit_fifo, &tail, UART_XMIT_SIZE);
+
+	if (!count || lfport->dma_tx_in_progress)
+		return;
+
+	linflex_dma_tx(lfport, count, tail);
+}
+
+static void linflex_restart_dma_tx(struct linflex_port *lfport)
+{
+	struct uart_port *sport = &lfport->port;
+	struct tty_port *tport = &sport->state->port;
+
+	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
+		uart_write_wakeup(sport);
+
+	linflex_prepare_tx(lfport);
+}
+
+static void linflex_dma_tx_complete(void *arg)
+{
+	struct linflex_port *lfport = arg;
+	struct uart_port *sport = &lfport->port;
+	unsigned long flags;
+
+	uart_port_lock_irqsave(sport, &flags);
+
+	/* stopped before? */
+	if (!lfport->dma_tx_in_progress)
+		goto out_tx_callback;
+
+	uart_xmit_advance(sport, lfport->dma_tx_bytes);
+	lfport->dma_tx_in_progress = 0;
+
+	linflex_restart_dma_tx(lfport);
+
+out_tx_callback:
+	uart_port_unlock_irqrestore(sport, flags);
+}
+
+static void linflex_flush_buffer(struct uart_port *port)
+{
+	struct linflex_port *lfport = to_linflex_port(port);
+
+	if (lfport->dma_tx_use) {
+		linflex_disable_dma_tx(port);
+		dmaengine_terminate_async(lfport->dma_tx_chan);
+		lfport->dma_tx_in_progress = 0;
+	}
+}
+
+static int linflex_dma_rx(struct linflex_port *lfport)
+{
+	dma_sync_single_for_device(lfport->port.dev, lfport->dma_rx_buf_bus,
+				   FSL_UART_RX_DMA_BUFFER_SIZE,
+				   DMA_FROM_DEVICE);
+	lfport->dma_rx_desc = dmaengine_prep_slave_single(lfport->dma_rx_chan,
+							  lfport->dma_rx_buf_bus,
+							  FSL_UART_RX_DMA_BUFFER_SIZE,
+							  DMA_DEV_TO_MEM, DMA_PREP_INTERRUPT |
+							  DMA_CTRL_ACK);
+
+	if (!lfport->dma_rx_desc) {
+		dev_err(lfport->port.dev, "Not able to get desc for rx\n");
+		return -EIO;
+	}
+
+	lfport->dma_rx_desc->callback = linflex_dma_rx_complete;
+	lfport->dma_rx_desc->callback_param = lfport;
+	lfport->dma_rx_in_progress = 1;
+	lfport->dma_rx_cookie = dmaengine_submit(lfport->dma_rx_desc);
+	dma_async_issue_pending(lfport->dma_rx_chan);
+
+	linflex_enable_dma_rx(&lfport->port);
+	return 0;
+}
+
+static void linflex_dma_rx_complete(void *arg)
+{
+	struct linflex_port *lfport = arg;
+	struct tty_port *port = &lfport->port.state->port;
+	unsigned long flags;
+
+	timer_delete_sync(&lfport->timer);
+
+	uart_port_lock_irqsave(&lfport->port, &flags);
+
+	/* stopped before? */
+	if (!lfport->dma_rx_in_progress) {
+		uart_port_unlock_irqrestore(&lfport->port, flags);
+		return;
+	}
+
+	lfport->dma_rx_in_progress = 0;
+	linflex_copy_rx_to_tty(lfport, port, FSL_UART_RX_DMA_BUFFER_SIZE);
+	tty_flip_buffer_push(port);
+	linflex_dma_rx(lfport);
+
+	uart_port_unlock_irqrestore(&lfport->port, flags);
+
+	mod_timer(&lfport->timer, jiffies + lfport->dma_rx_timeout);
+}
+
+static void linflex_timer_func(struct timer_list *t)
+{
+	struct linflex_port *lfport = timer_container_of(lfport, t, timer);
+	unsigned long flags;
+
+	uart_port_lock_irqsave(&lfport->port, &flags);
+
+	/* stopped before? */
+	if (!lfport->dma_rx_in_progress) {
+		uart_port_unlock_irqrestore(&lfport->port, flags);
+		return;
+	}
+
+	linflex_stop_rx(&lfport->port);
+	linflex_dma_rx(lfport);
+
+	uart_port_unlock_irqrestore(&lfport->port, flags);
+	mod_timer(&lfport->timer, jiffies + lfport->dma_rx_timeout);
+}
+
+static void _linflex_start_tx(struct uart_port *port)
+{
+	struct linflex_port *lfport = to_linflex_port(port);
+	unsigned long ier;
+
+	if (lfport->dma_tx_use) {
+		linflex_enable_dma_tx(&lfport->port);
+	} else {
+		ier = readl(port->membase + LINIER);
+		writel(ier | LINFLEXD_LINIER_DTIE, port->membase + LINIER);
+	}
+}
+
 static void linflex_start_tx(struct uart_port *port)
 {
+	struct linflex_port *lfport = to_linflex_port(port);
 	unsigned long ier;
 
-	linflex_transmit_buffer(port);
-	ier = readl(port->membase + LINIER);
-	writel(ier | LINFLEXD_LINIER_DTIE, port->membase + LINIER);
+	if (lfport->dma_tx_use) {
+		linflex_prepare_tx(lfport);
+	} else {
+		linflex_transmit_buffer(port);
+		ier = readl(port->membase + LINIER);
+		writel(ier | LINFLEXD_LINIER_DTIE, port->membase + LINIER);
+	}
 }
 
 static irqreturn_t linflex_txint(int irq, void *dev_id)
 {
-	struct uart_port *sport = dev_id;
+	struct linflex_port *lfport = dev_id;
+	struct uart_port *sport = &lfport->port;
 	struct tty_port *tport = &sport->state->port;
 	unsigned long flags;
 
@@ -263,7 +622,8 @@ static irqreturn_t linflex_txint(int irq, void *dev_id)
 
 static irqreturn_t linflex_rxint(int irq, void *dev_id)
 {
-	struct uart_port *sport = dev_id;
+	struct linflex_port *lfport = dev_id;
+	struct uart_port *sport = &lfport->port;
 	unsigned int flg;
 	struct tty_port *port = &sport->state->port;
 	unsigned long flags, status;
@@ -316,14 +676,14 @@ static irqreturn_t linflex_rxint(int irq, void *dev_id)
 
 static irqreturn_t linflex_int(int irq, void *dev_id)
 {
-	struct uart_port *sport = dev_id;
+	struct linflex_port *lfport = dev_id;
 	unsigned long status;
 
-	status = readl(sport->membase + UARTSR);
+	status = readl(lfport->port.membase + UARTSR);
 
-	if (status & LINFLEXD_UARTSR_DRFRFE)
+	if (status & LINFLEXD_UARTSR_DRFRFE && !lfport->dma_rx_use)
 		linflex_rxint(irq, dev_id);
-	if (status & LINFLEXD_UARTSR_DTFTFF)
+	if (status & LINFLEXD_UARTSR_DTFTFF && !lfport->dma_rx_use)
 		linflex_txint(irq, dev_id);
 
 	return IRQ_HANDLED;
@@ -332,11 +692,15 @@ static irqreturn_t linflex_int(int irq, void *dev_id)
 /* return TIOCSER_TEMT when transmitter is not busy */
 static unsigned int linflex_tx_empty(struct uart_port *port)
 {
+	struct linflex_port *lfport = to_linflex_port(port);
 	unsigned long status;
 
 	status = readl(port->membase + UARTSR) & LINFLEXD_UARTSR_DTFTFF;
 
-	return status ? TIOCSER_TEMT : 0;
+	if (!lfport->dma_tx_use)
+		return status ? TIOCSER_TEMT : 0;
+	else
+		return status ? 0 : TIOCSER_TEMT;
 }
 
 static unsigned int linflex_get_mctrl(struct uart_port *port)
@@ -354,6 +718,7 @@ static void linflex_break_ctl(struct uart_port *port, int break_state)
 
 static void linflex_setup_watermark(struct uart_port *sport)
 {
+	struct linflex_port *lfport = to_linflex_port(sport);
 	unsigned long cr, ier, cr1;
 
 	/* Disable transmission/reception */
@@ -396,6 +761,14 @@ static void linflex_setup_watermark(struct uart_port *sport)
 
 	cr = (LINFLEXD_UARTCR_WL0 | LINFLEXD_UARTCR_UART);
 
+	/* FIFO mode enabled for DMA Rx mode. */
+	if (lfport->dma_rx_use)
+		cr |= LINFLEXD_UARTCR_RFBM;
+
+	/* FIFO mode enabled for DMA Tx mode. */
+	if (lfport->dma_tx_use)
+		cr |= LINFLEXD_UARTCR_TFBM;
+
 	writel(cr, sport->membase + UARTCR);
 
 	cr1 &= ~(LINFLEXD_LINCR1_INIT);
@@ -406,44 +779,169 @@ static void linflex_setup_watermark(struct uart_port *sport)
 	writel(cr, sport->membase + UARTCR);
 
 	ier = readl(sport->membase + LINIER);
-	ier |= LINFLEXD_LINIER_DRIE;
-	ier |= LINFLEXD_LINIER_DTIE;
+	if (!lfport->dma_rx_use)
+		ier |= LINFLEXD_LINIER_DRIE;
+
+	if (!lfport->dma_tx_use)
+		ier |= LINFLEXD_LINIER_DTIE;
 
 	writel(ier, sport->membase + LINIER);
 }
 
+static int linflex_dma_tx_request(struct uart_port *port)
+{
+	struct linflex_port *lfport = to_linflex_port(port);
+	struct tty_port *tport = &port->state->port;
+	struct dma_slave_config dma_tx_sconfig;
+	dma_addr_t dma_bus;
+	int ret;
+
+	dma_bus = dma_map_single(port->dev, tport->xmit_buf,
+				 UART_XMIT_SIZE, DMA_TO_DEVICE);
+
+	if (dma_mapping_error(port->dev, dma_bus)) {
+		dev_err(port->dev, "dma_map_single tx failed\n");
+		return -ENOMEM;
+	}
+
+	memset(&dma_tx_sconfig, 0, sizeof(dma_tx_sconfig));
+	dma_tx_sconfig.dst_addr = port->mapbase + BDRL;
+	dma_tx_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+	dma_tx_sconfig.dst_maxburst = 1;
+	dma_tx_sconfig.direction = DMA_MEM_TO_DEV;
+	ret = dmaengine_slave_config(lfport->dma_tx_chan, &dma_tx_sconfig);
+
+	if (ret < 0) {
+		dev_err(port->dev, "Dma slave config failed, err = %d\n",
+			ret);
+		return ret;
+	}
+
+	lfport->dma_tx_buf_bus = dma_bus;
+	lfport->dma_tx_in_progress = 0;
+
+	return 0;
+}
+
+static int linflex_dma_rx_request(struct uart_port *port)
+{
+	struct linflex_port *lfport = to_linflex_port(port);
+	struct dma_slave_config dma_rx_sconfig;
+	unsigned char *dma_buf;
+	dma_addr_t dma_bus;
+	int ret;
+
+	dma_buf = devm_kmalloc(port->dev, FSL_UART_RX_DMA_BUFFER_SIZE,
+			       GFP_KERNEL);
+
+	if (!dma_buf) {
+		dev_err(port->dev, "Dma rx alloc failed\n");
+		return -ENOMEM;
+	}
+
+	dma_bus = dma_map_single(port->dev, dma_buf,
+				 FSL_UART_RX_DMA_BUFFER_SIZE, DMA_FROM_DEVICE);
+
+	if (dma_mapping_error(port->dev, dma_bus)) {
+		dev_err(port->dev, "dma_map_single rx failed\n");
+		return -ENOMEM;
+	}
+
+	memset(&dma_rx_sconfig, 0, sizeof(dma_rx_sconfig));
+	dma_rx_sconfig.src_addr = port->mapbase + BDRM;
+	dma_rx_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+	dma_rx_sconfig.src_maxburst = 1;
+	dma_rx_sconfig.direction = DMA_DEV_TO_MEM;
+	ret = dmaengine_slave_config(lfport->dma_rx_chan, &dma_rx_sconfig);
+
+	if (ret < 0) {
+		dev_err(port->dev, "Dma slave config failed, err = %d\n",
+			ret);
+		return ret;
+	}
+
+	lfport->dma_rx_buf_virt = dma_buf;
+	lfport->dma_rx_buf_bus = dma_bus;
+	lfport->dma_rx_in_progress = 0;
+
+	return 0;
+}
+
+static void linflex_dma_tx_free(struct uart_port *port)
+{
+	struct linflex_port *lfport = to_linflex_port(port);
+
+	dma_unmap_single(lfport->port.dev, lfport->dma_tx_buf_bus, UART_XMIT_SIZE,
+			 DMA_TO_DEVICE);
+
+	lfport->dma_tx_buf_bus = 0;
+}
+
+static void linflex_dma_rx_free(struct uart_port *port)
+{
+	struct linflex_port *lfport = to_linflex_port(port);
+
+	dma_unmap_single(lfport->port.dev, lfport->dma_rx_buf_bus,
+			 FSL_UART_RX_DMA_BUFFER_SIZE, DMA_FROM_DEVICE);
+	devm_kfree(lfport->port.dev, lfport->dma_rx_buf_virt);
+
+	lfport->dma_rx_buf_bus = 0;
+	lfport->dma_rx_buf_virt = NULL;
+}
+
 static int linflex_startup(struct uart_port *port)
 {
+	struct linflex_port *lfport = to_linflex_port(port);
 	int ret = 0;
 	unsigned long flags;
+	bool dma_rx_use, dma_tx_use;
+
+	dma_rx_use = lfport->dma_rx_chan && !linflex_dma_rx_request(port);
+	dma_tx_use = lfport->dma_tx_chan && !linflex_dma_tx_request(port);
 
 	uart_port_lock_irqsave(port, &flags);
 
+	lfport->dma_rx_use = dma_rx_use;
+	lfport->dma_tx_use = dma_tx_use;
+	lfport->port.fifosize = LINFLEXD_UARTCR_FIFO_SIZE;
+
 	linflex_setup_watermark(port);
 
+	if (lfport->dma_rx_use && !linflex_dma_rx(lfport)) {
+		timer_setup(&lfport->timer, linflex_timer_func, 0);
+		mod_timer(&lfport->timer, jiffies + lfport->dma_rx_timeout);
+	}
 	uart_port_unlock_irqrestore(port, flags);
 
-	ret = devm_request_irq(port->dev, port->irq, linflex_int, 0,
-			       DRIVER_NAME, port);
-
+	if (!lfport->dma_rx_use || !lfport->dma_tx_use) {
+		ret = devm_request_irq(port->dev, port->irq, linflex_int, 0,
+				       DRIVER_NAME, lfport);
+	}
 	return ret;
 }
 
 static void linflex_shutdown(struct uart_port *port)
 {
-	unsigned long ier;
+	struct linflex_port *lfport = to_linflex_port(port);
 	unsigned long flags;
 
+	timer_delete_sync(&lfport->timer);
+
 	uart_port_lock_irqsave(port, &flags);
 
-	/* disable interrupts */
-	ier = readl(port->membase + LINIER);
-	ier &= ~(LINFLEXD_LINIER_DRIE | LINFLEXD_LINIER_DTIE);
-	writel(ier, port->membase + LINIER);
+	linflex_stop_tx(port);
+	linflex_stop_rx(port);
 
 	uart_port_unlock_irqrestore(port, flags);
 
-	devm_free_irq(port->dev, port->irq, port);
+	if (!lfport->dma_rx_use || !lfport->dma_tx_use)
+		devm_free_irq(port->dev, port->irq, lfport);
+
+	if (lfport->dma_rx_use)
+		linflex_dma_rx_free(port);
+
+	if (lfport->dma_tx_use)
+		linflex_dma_tx_free(port);
 }
 
 static unsigned char
@@ -463,6 +961,7 @@ static void
 linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 		    const struct ktermios *old)
 {
+	struct linflex_port *lfport = to_linflex_port(port);
 	unsigned long flags;
 	unsigned long cr, old_cr, cr1, gcr;
 	unsigned int old_csize = old ? old->c_cflag & CSIZE : CS8;
@@ -472,6 +971,9 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 
 	uart_port_lock_irqsave(port, &flags);
 
+	_linflex_stop_rx(port);
+	_linflex_stop_tx(port);
+
 	old_cr = readl(port->membase + UARTCR) &
 		~(LINFLEXD_UARTCR_RXEN | LINFLEXD_UARTCR_TXEN);
 	cr = old_cr;
@@ -608,6 +1110,8 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 		writel(fbr, port->membase + LINFBRR);
 	}
 
+	lfport->dma_rx_timeout = msecs_to_jiffies(DIV_ROUND_UP(10000000, baud));
+
 	writel(cr, port->membase + UARTCR);
 
 	cr1 &= ~(LINFLEXD_LINCR1_INIT);
@@ -617,6 +1121,9 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 	cr |= (LINFLEXD_UARTCR_TXEN) | (LINFLEXD_UARTCR_RXEN);
 	writel(cr, port->membase + UARTCR);
 
+	_linflex_start_rx(port);
+	_linflex_start_tx(port);
+
 	uart_port_unlock_irqrestore(port, flags);
 }
 
@@ -657,6 +1164,7 @@ static const struct uart_ops linflex_pops = {
 	.request_port	= linflex_request_port,
 	.release_port	= linflex_release_port,
 	.config_port	= linflex_config_port,
+	.flush_buffer	= linflex_flush_buffer,
 };
 
 static struct uart_port *linflex_ports[UART_NR];
@@ -690,18 +1198,16 @@ static void linflex_console_putchar(struct uart_port *port, unsigned char ch)
 static void linflex_string_write(struct uart_port *sport, const char *s,
 				 unsigned int count)
 {
-	unsigned long cr, ier = 0;
-
-	ier = readl(sport->membase + LINIER);
-	linflex_stop_tx(sport);
+	unsigned long cr;
 
+	_linflex_stop_tx(sport);
 	cr = readl(sport->membase + UARTCR);
 	cr |= (LINFLEXD_UARTCR_TXEN);
 	writel(cr, sport->membase + UARTCR);
 
 	uart_console_write(sport, s, count, linflex_console_putchar);
 
-	writel(ier, sport->membase + LINIER);
+	_linflex_start_tx(sport);
 }
 
 static void
@@ -881,30 +1387,59 @@ static int linflex_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sport = &lfport->port;
+	sport->dev = &pdev->dev;
+
+	lfport->dma_tx_chan = dma_request_chan(sport->dev, "tx");
+	if (IS_ERR(lfport->dma_tx_chan)) {
+		ret = PTR_ERR(lfport->dma_tx_chan);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		dev_info(sport->dev,
+			 "DMA tx channel request failed, operating without tx DMA %ld\n",
+			 PTR_ERR(lfport->dma_tx_chan));
+		lfport->dma_tx_chan = NULL;
+	}
+
+	lfport->dma_rx_chan = dma_request_chan(sport->dev, "rx");
+	if (IS_ERR(lfport->dma_rx_chan)) {
+		ret = PTR_ERR(lfport->dma_rx_chan);
+		if (ret == -EPROBE_DEFER) {
+			dma_release_channel(lfport->dma_tx_chan);
+			return ret;
+		}
+
+		dev_info(sport->dev,
+			 "DMA rx channel request failed, operating without rx DMA %ld\n",
+			 PTR_ERR(lfport->dma_rx_chan));
+		lfport->dma_rx_chan = NULL;
+	}
 
 	ret = of_alias_get_id(np, "serial");
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
-		return ret;
+		goto linflex_probe_free_dma;
 	}
 	if (ret >= UART_NR) {
 		dev_err(&pdev->dev, "driver limited to %d serial ports\n",
 			UART_NR);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto linflex_probe_free_dma;
 	}
 
 	sport->line = ret;
 
 	sport->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(sport->membase))
-		return PTR_ERR(sport->membase);
+	if (IS_ERR(sport->membase)) {
+		ret = PTR_ERR(sport->membase);
+		goto linflex_probe_free_dma;
+	}
 	sport->mapbase = res->start;
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		return ret;
 
-	sport->dev = &pdev->dev;
 	sport->iotype = UPIO_MEM;
 	sport->irq = ret;
 	sport->ops = &linflex_pops;
@@ -913,15 +1448,25 @@ static int linflex_probe(struct platform_device *pdev)
 
 	ret = linflex_init_clk(lfport);
 	if (ret)
-		return ret;
+		goto linflex_probe_free_dma;
 
 	linflex_ports[sport->line] = sport;
 
 	platform_set_drvdata(pdev, lfport);
 
 	ret = uart_add_one_port(&linflex_reg, sport);
-	if (ret)
+	if (ret) {
 		clk_bulk_disable_unprepare(LINFLEX_CLK_NUM, lfport->clks);
+		goto linflex_probe_free_dma;
+	}
+
+	return 0;
+
+linflex_probe_free_dma:
+	if (lfport->dma_tx_chan)
+		dma_release_channel(lfport->dma_tx_chan);
+	if (lfport->dma_rx_chan)
+		dma_release_channel(lfport->dma_rx_chan);
 
 	return ret;
 }
@@ -933,6 +1478,13 @@ static void linflex_remove(struct platform_device *pdev)
 
 	uart_remove_one_port(&linflex_reg, sport);
 	clk_bulk_disable_unprepare(LINFLEX_CLK_NUM, lfport->clks);
+
+	if (lfport->dma_tx_chan)
+		dma_release_channel(lfport->dma_tx_chan);
+
+	if (lfport->dma_rx_chan)
+		dma_release_channel(lfport->dma_rx_chan);
+
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.47.0

