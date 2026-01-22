Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DC1EK7ncWkONAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C560763DFA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFAF10E976;
	Thu, 22 Jan 2026 09:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BnltRlRa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BBA10E95D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:02:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrKtqfRbK/I8qfH0WrHcRZwFy3kFE2+4T81DiD3kp7aKQ5pAop/rHivRgqGewraYE09U6CXheMJ/EWZ3HWLlsU13RU1iWaRc0eQDjr/FXlJBth5OX4OZnXdjRvdj1VXokSt9rnOMLF2UAc/g8/GhoUxZojKANSAYgR/dOAc2+EvPEAe92ixGWlw0Om/YdWJxAVR8ohuJPi/N90lgTckv/Q1O+PZ+TCUoHaRVAbCLIFda9X5JzWycGT9ig0LzeSGpZQYoG+POQb/6oHURYrShGs4srsab6TvKOmhk2GY6FSvyq9Ej+FUuVZt8zQlSId9ugZOvV6SW2VO6AevwkKrigw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BjzY2aL4+nfh0OLp5zefSQTeTTudRyi5ib1aUqHzLw=;
 b=lLjFhpd6GUxD8YUWhxY9nnrW4gW4lg8o+qwLdsLEDsfzUgQBzpfndovgHoVSVwNx8eeKWxX/uqolwt6z4syCtRHYt12ohYQ7ijTaCmFEZvyDjKLlu/RxvyibpNG6Z3iJ7t2Tr/kRUiGn3yQ7LobLpARifvt21G2LB+h6XrdGzwK8VMwQcQa227ZVVP7PCoFSfuj6Sck3sC0LfUIUR7EV0cKg/eyxKRH1hvldcUObaiDVig4aknwbkoY/MOwVJqC4tTW6A80Eo3wlLIUl+kb+5D/AFEsPHK3cVNo+erbaZNpm1+5wKutknvhf9+yWk/9eVS9G8Szmw8zHtaub+PYnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BjzY2aL4+nfh0OLp5zefSQTeTTudRyi5ib1aUqHzLw=;
 b=BnltRlRayhdG6jbIMS8mf05EdIUWVUtXNGCEHJp/jdKWQ3qqRuM4zBY9yIAL2xcCXIVSerf/T+MLNIZe+U8e31zcVRkH861Nla+9qn+Wh1eTGkk01AwDZhISPzJSzZySJTCw2SdiKsonrU9HV90W1iRWt9pd1aXLvocDauchDk6jvaiY53UuALGQ1yTIwrTSfo1VdT4UBTe/RrVvtP4yriAFfXOw0C6Sn6n+Knw5M6lpcGm68kdyl/kdQwXEDikzG7Fne+zmllwj4T19eyGhT43/6ZYNKqnamR8fp4oEOsk0CKrtPJ39lzXUAShQzfK2AuNc36uXdcrmrLx6UUFFvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA4PR04MB7872.eurprd04.prod.outlook.com (2603:10a6:102:ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 22 Jan
 2026 09:02:28 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:02:28 +0000
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
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
Date: Thu, 22 Jan 2026 09:01:41 +0000
Message-ID: <20260122-dcif-upstreaming-v7-3-19ea17eb046f@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
References: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0044.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::13) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA4PR04MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b4e4d8-6317-477c-6344-08de5994f7a8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|19092799006|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnV2MkU3SWxNclJpS3pHYnZtT0tkYVBVS3EyUUwzbnVSUVd6QXJ5SW0zZWtP?=
 =?utf-8?B?emVuajRYVlFxUDR0OEVBTWtheXRDQ0x3cnRZTDlRUEttdWxqM1VQMVJHNFRa?=
 =?utf-8?B?VGd3OU5GTWpoKzUzZHNDejQzejZxMGNJUG43WnExNWNUbWJMQ0Jielc3eFpF?=
 =?utf-8?B?dDdCZlNNNU1qMk1CMHJEQlRUaHpmN3pnczB6YmhVN0w2NW9TREc5bDhmZnV6?=
 =?utf-8?B?L0dPa2VSK1FKNWt3N3dQZHdUSjVhaiszTW9HQ0VwNVJvTnYvRysrQnF6empS?=
 =?utf-8?B?M3pkdHhTQ0psaElxNXZrL3M3Y2JuVEkyQ3R5ZEttRmRtdVJ1aFh2eVV2VCtu?=
 =?utf-8?B?ZmpHOFBaKzR5SzFJd1cydjZNYkdFZm9iaUVVeURKK21wbGgxdnJyc0lLT1Fh?=
 =?utf-8?B?VTdCRDlNRHE0QTdxSHVwbUduWUkzZ2VrSDN1bFhOQkxZYzJ2Q0s3bXlnRWJs?=
 =?utf-8?B?dkNRZ2M0WHZWM2dReVVSb2t1VGZZV3FEWUtrUmQvY0xKTG83YS9WaDRrTTQz?=
 =?utf-8?B?UEhvaDB1Z2N2MlhnTnkzQzlwUFUvcWdBa0JyR3hvN1VFTCszbkdkUGVkN3Y1?=
 =?utf-8?B?bC9hOTB6UnkyMUUrdG9jcVpXckN6OWZzYnoxbWkrNUd5ZnA2eUI2RnlKcmhs?=
 =?utf-8?B?cDNraWdiV2pBTGQ5bmNFVTlqYzJQS0ZMRXpOcFptT1YxbGp3Z0lmZjJoZW1P?=
 =?utf-8?B?Q2ZpaTN4UVdZdUp5K3ZtblZ1MWdVVmtQRkxoMERuWit2U1JMZG5LbWh1RlJW?=
 =?utf-8?B?aGJ6bWxpSEVkeUR0bnAxbjVTbmhXdzEreXltODhsdzN5aXlZZ0M4TEZjekR6?=
 =?utf-8?B?eWcxQ3RjTFozUTZBMU5Ndm1WS2VJWkIydkhGTWJ3OWFhaXdRaG1FdDcrVFU0?=
 =?utf-8?B?ZmJ0cU43VmtqYjJaeC9VVFVhc3VSUjVYWk9sKy83OUtVYjdUbGordWl5QTF3?=
 =?utf-8?B?V0VwRGNFMHd2N09OZFJjVUlwYkd2SWdMaCs2c3NlaU5qdkdQVkFmeXF0ZGtv?=
 =?utf-8?B?M3VhdmYvclIvc2V0Y1hrYjU4TEtIYVJpRGZmWVE4dHJuZjZXajNDWmptWlNp?=
 =?utf-8?B?cGFOSXBWNWNyQlM5WHhGQ0dodlZIU2VvZDNQWkZIUW9GSzJZQzkrenBHbStv?=
 =?utf-8?B?NUNRakdOR1NEbk4xSms1S0dPbVYrTDJGcGt2NTBXdGpobEt4L3JvVWI1eHdp?=
 =?utf-8?B?OWVnMW1FVlZ6TVJCTkJ1S2crK09vdS9CTDZqYjViSkpJYXlrSitobEwyUitJ?=
 =?utf-8?B?QTc2YkMvdkhYV3hsRlhyWFY1eFp0ZE5FSUY3d1pmMEQ1S01hUFlVb0RUMkhr?=
 =?utf-8?B?dDBjUmFXcnNTTGNsdkZ1dlNjckFqL0NhOFhKQjRRQVFOV0RqcU5FMUV2TklK?=
 =?utf-8?B?NTRzNjU5UFVzOXFwdlpCQlF6ZnhPc1pQOHhsNy9HVFRITnlJOWpQUDR2Rktj?=
 =?utf-8?B?L3VFcTUwK1dScWFLWlZVVEtwL2Z3NEVPYUY2Ri9qQk5xdnhrQlY2c05EY09P?=
 =?utf-8?B?RjdrdFNHWjJsV3JlRlpDcjZiZDlwZ05ORUJhNlRId0ZNaHFVOSs1U2dsSVdC?=
 =?utf-8?B?S0xiMXV1Tm9OU3l6ZjQ3S1UrcUVWcFhsemc0cm14MVJxV2VXUGtqYmwyc3Rx?=
 =?utf-8?B?WUNUZjRKdFA2VnprdE1kM0Q1RFpzTURNaHFRZlVXQVUvODBNM201WDNGdldG?=
 =?utf-8?B?K0JvczZPV3ZWV21FVnhKcGdYcUtNNzd4c3VwYWRKM1Nnb1RZNlM4MWFvdXhl?=
 =?utf-8?B?VVZhTzRaUWVrM0FYbGJjSjM4NnA2Mzllc1pOQ09oQ2dhWlVvclZhUTNyRkJz?=
 =?utf-8?B?UWE4UHFGR25EUnRoNnNsZllES0RPSTFGMWxLbStYbWVYdVVldlJkV3hyTXlX?=
 =?utf-8?B?eGtiOE80Rjc5YjZtVXVCWk1GV2RqWDBtclc5R3BESUYvODl2SkRqQTFqTUV2?=
 =?utf-8?B?dlhBYU40aFk0SmJDSnJjWmtETTRmWHoxa1dtTFg5SU5BWGdGcUk5L2p3OWo2?=
 =?utf-8?B?ZDZma0QzdkhkUU9KNW9DWG9FVjZKc090ekVhL0NFSmw3RG5VZzNsWGNwZDNw?=
 =?utf-8?B?ck1uVXVscmh6akZZVjkxR0dwcWN2TXRIMmhHYndqSnNuSnYzN0R2TDI4Nzd5?=
 =?utf-8?B?UWlPckYrN3hxaU11VmFhbEE2Q3B2RjNKb0FGRmFvR01EMmQrQnluRVkySGRq?=
 =?utf-8?B?aUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFNRzQ4Mm5sVlRzb2tXVkE2MFBxNUFyTkFzRG1WSmRMSFZKenFZZno3MXl3?=
 =?utf-8?B?K3Q1Ym9qRGRqM2k2Wnl2dVhjNXpxd2M0aGIrdWZJbGo5Rzc4M3kzeU44d0xR?=
 =?utf-8?B?UCtWVnNsRStEVFBCOXRJL09pT3BzY20zbHMvRVRBVTJFaXRYY1Q3eWI4UEFB?=
 =?utf-8?B?YjJtSmVGNExpZUNpQ1c0REJ4Z1pjcEJPYytadk9qaXVMc29RUGUvQVRSdENt?=
 =?utf-8?B?RWNHOEQzMndSSlRCMzcvOTRadFlyOTl5S3RQODBZR055N3dMa1U3Sm51eEdn?=
 =?utf-8?B?eFVtcGdvR25Ka0RMSDhtaWJUQmNVU1dHRWM0VnNmV1VQVU1UUEtQYmh2SWNz?=
 =?utf-8?B?eW5EYi95TTVreVpnRkNTR1NnVk03R1I2OUViMEJTVmNKQUxEMVhmY1V2Nml4?=
 =?utf-8?B?cGVBd0dLeEM2MCs5ZXpwS3l6Tk1mTkFnYllrZmw2Mzc5c3prcStDekY4SThw?=
 =?utf-8?B?Q3JzZ3krYjJ5cDQvUk1rZy9CaXJ4RjBIRlcvVGNPUkMxUXRTbmNOcUNqSDRH?=
 =?utf-8?B?VWhwcTJLcHhRYTdWUS81dWVmb3R1VDVrWm05QmhtYWYvd3RjNmpBYWsyWUVi?=
 =?utf-8?B?Zm9ESSszN2lPK0hyMVZIOU16bFJKUEQ3dFV5Mi9Vdy81TXczNit6NTRjb1M0?=
 =?utf-8?B?UEdNQ1FDSjZjSjM4ZzJ5TFgweWttcGJCc25jQTdCMkRRbVpyL3pHSmE5WXFk?=
 =?utf-8?B?WS8vbTVPaGlHbjQ4YTQ3WnBIZm1MTG1NSTArQ2hieHNzalBhS0JKWG1BRmpJ?=
 =?utf-8?B?UlNKMVU4L3YrL0grZ0hSVXcrVkxGYWpRVVUvWlRxWXcxQlk0UXBHTS8yZnpJ?=
 =?utf-8?B?eHRIRmJzVzB4ZnhkY1hBSW9qaFNtdHNHd3hwNVhiUGNORCtkMDdCTE1PV096?=
 =?utf-8?B?RmNhUzJyUTR1RWY3RmZMU2ladlN5RmxublZIUDlvMThKVnp6SERqcFJRaGxk?=
 =?utf-8?B?aWVITXFBWmhTV0k4QkN0bVU0aHY3SXdrTHp1SjJOWEFnR2FGSSs5N09JUUlK?=
 =?utf-8?B?RFJ0MGYwd0lwUHdhYysvdWxQSG5YeE1KU2RSa0s4TldoVm5DczltOEE0SzZj?=
 =?utf-8?B?azVTVU1LN1pFcDNvMHBkdHl5N3ZIcXM5ZDgzbERCMWg2UEYxZzhCcE4xUUZz?=
 =?utf-8?B?Rnp5Z0JPOThZZngwSUY4V2oyaFZsQkdDbElZQUE3ZnU4cnhDRTZLbjZEU05H?=
 =?utf-8?B?K1RNSTI2WGVVK2NpK0xXcWVJK2ZiMWZaV0lzUkU0MmJKbzBjUFFPNVQwbnlh?=
 =?utf-8?B?NG83R1EwaVVuaThRNitLamhUUXkxRU1QbFBPS3MwTjdtbHVOYnUyMzZhTUZx?=
 =?utf-8?B?SnJPMkxrMDd4eUIvN0hOSXpsU2JIaVFzSGFFTnlWVDFveW9TdkNMWmVDTmQ4?=
 =?utf-8?B?MTFHeW82bExZa2ROZXg1aFhLYlc2T2RVdFdPUjNsNytXVUluQ2RJVWhqTzM5?=
 =?utf-8?B?RGFJZnI4U2duMFQ0YjF4bUJjajBmemxoaTN0Q2FpK3hPVzJ4c21YWTdGNldt?=
 =?utf-8?B?cGpIVEF1R3ZNbGZJdW9NTCt4QnBjcnM5dHhuVE9CWHY5Q2N3WlpLbFZFYzNJ?=
 =?utf-8?B?S2VHV2U3Rm9EOWNFd0lZQU5zNVVkck5OczIvS2w4dnRvQXZ1NTg3WS9pc3NT?=
 =?utf-8?B?Z2NMVDZFYnhBNUhEZ0RkNk10WmJMRFJlMUtHWHZVb0EvTnl6K3o1VFdGMW00?=
 =?utf-8?B?alozWCtCaGpCVlplQTNpdmdha3VwN1FGL21DdEN2ajFLTXVmS05oVXhvNjEr?=
 =?utf-8?B?RjlIWDk1UTRabUY2eU1GNTZMUFR2SXV0VGVUWCtwbEVuS2FQd1hiMXd1VHdt?=
 =?utf-8?B?TlIyMWNKS3dhNUsrQ1AwSDFpcWNmSTlwNHM2dFRvMkJmT293by9oSm1lb21M?=
 =?utf-8?B?UFFZWVE1S3BYeThZa2plRTFmbGNxWitwSm84VkRHa0NzSDk0M2cxeVZ6TWY4?=
 =?utf-8?B?cHcvancrM0toVERESXByaWFnN1BxNjlQZHNLY1ZQckt5NjZoY3VKTkZFeFhN?=
 =?utf-8?B?dUtWSkUveTBlZzdnT1E1UnZhRmFRakI4aUltVGRRcUZXaWpaSnpuQ0RZZUVl?=
 =?utf-8?B?emhhbWZyNGtkYVJjRTRJN1FEc0ViZGhUL2U5QVhDS3dsZCszUnV0OGxBSU5M?=
 =?utf-8?B?YURPS09BLzR5TGQ0VTNOTzNTSUxrSUdieGpac2hXLzl0M0M4d0ZZT3E3b0Fp?=
 =?utf-8?B?amdZcVArcytDaDhEblNISzF2S3JXWlN5M1ZPUXdZdU9VWTFDckRodmpHSXpC?=
 =?utf-8?B?Tk9YaGU3enJZdkFSUFZyNG5QZ2JFWC9FY0xqVVZ1U0lBTUVwN3VwcUJCRWs2?=
 =?utf-8?B?UVpKbU5FaHVaa3VNSXA1ei9oNDhuc1M3OEhEZWE3K3N3bE0yTFBadll5ajV2?=
 =?utf-8?Q?/2O/b9qjhcnE+pjw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b4e4d8-6317-477c-6344-08de5994f7a8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:02:27.9917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1R6gBX8J3HpDjXZuyG9oEH+qWzX7iRfSINXUCLGEoWHwQrAufpq6gpk4stbLUe9hh4RbyU76eYcRkRbNfRg07A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7872
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
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Li@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:luca.ceresoli@bootlin.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[lists.linux.dev,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.nxp.com:mid,bootlin.com:email]
X-Rspamd-Queue-Id: C560763DFA
X-Rspamd-Action: no action

i.MX94 series LDB controller shares the same LDB and LVDS control
registers as i.MX8MP and i.MX93 but supports a higher maximum clock
frequency.

Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
be able to set different max frequencies for other platforms.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 665053d0cb79d2b4f50e69c397863ab024553867..96065a83898666fd789cde5fa1008ac2c841b815 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -57,6 +57,7 @@ enum fsl_ldb_devtype {
 	IMX6SX_LDB,
 	IMX8MP_LDB,
 	IMX93_LDB,
+	IMX94_LDB,
 };
 
 struct fsl_ldb_devdata {
@@ -64,21 +65,31 @@ struct fsl_ldb_devdata {
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
+	u32 max_clk_khz;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX6SX_LDB] = {
 		.ldb_ctrl = 0x18,
 		.single_ctrl_reg = true,
+		.max_clk_khz = 80000,
 	},
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
+		.max_clk_khz = 80000,
 	},
 	[IMX93_LDB] = {
 		.ldb_ctrl = 0x20,
 		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
+		.max_clk_khz = 80000,
+	},
+	[IMX94_LDB] = {
+		.ldb_ctrl = 0x04,
+		.lvds_ctrl = 0x08,
+		.lvds_en_bit = true,
+		.max_clk_khz = 165000,
 	},
 };
 
@@ -271,7 +282,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
+	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 : 1) * fsl_ldb->devdata->max_clk_khz)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -377,6 +388,8 @@ static const struct of_device_id fsl_ldb_match[] = {
 	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
 	{ .compatible = "fsl,imx93-ldb",
 	  .data = &fsl_ldb_devdata[IMX93_LDB], },
+	{ .compatible = "fsl,imx94-ldb",
+	  .data = &fsl_ldb_devdata[IMX94_LDB], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, fsl_ldb_match);

-- 
2.49.0
