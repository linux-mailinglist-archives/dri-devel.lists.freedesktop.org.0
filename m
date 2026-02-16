Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAoOEgSnk2ln7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D9714811C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975B010E409;
	Mon, 16 Feb 2026 23:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z6cmkUP1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011041.outbound.protection.outlook.com
 [40.107.130.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CCD10E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBIEC7iEUKlIEDVrucVzYlKnSAhH/3/vD1OylJHMilQuiAkdL2ZUHrwmnfQgJS4WbBpYhBuUWSEHQhDqBqTWfAGtCfGO+yXBSUTzulCg8N+2d9z3DlsqCYaEfu9C9Wdi22/yWCCEZIlilkTJjNIo+mNdRq6f6NQKM2xRNjx2YWPUrcLKeIn9ISxOJsixIK+0eEpXcv1HGb7PVrclib/XuGaZjL8ApDbl2wA22QOyLvqDh+LNhKZsLMccrXMdGaa1ZKSLLQo1CVcIgfuHX/flTrgMHqGiSIP+b2zOJPqXj7NuWilwxbq2tF4eTP+BWZ/g8jJ6H2km4O5qO9hh3hGiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdfgNxiytRrBrIJOcW1dBjEiE/p8rtwowDMe5LTFapg=;
 b=r/YOCYz5pAjOPe8yIwgtyPLKLirZh2QWoQXkyxnQynVTSgCUMQbqKA0GMToGQgdmcCchmbQmyFM41zKGD1lnr1e4/wKRsBst0xUn2Kn6yl4BzDbLP7FoUNYyd24gWgnr1F3hM9ZMrkeu26ltlGvNplU1amL4q7a304HP2smm4wpTcDrsBeROe2Y9WZ8oOb9/BFBjsscZHISZ4SidXfs5qQVnxCXJMM/FK+ypXcZVQfuoBCABM12vetrN3A5h0gWwEDn6iQFBMy0VOdi4YQwUp8wVntMdPmM4lEuSP6hAJD9F77S/zXeuNd2s1egFjEkaxgjBljza87v4JoQyuDn/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdfgNxiytRrBrIJOcW1dBjEiE/p8rtwowDMe5LTFapg=;
 b=Z6cmkUP1wf7nNmjlhajQIobJzPxaScHGvgZlHdRWVOQ40GvimK11S6NHln2OR2wwsK6775h9Atg7DFntfe5gwos5rs+xOdLxpQ0cpE8rVExnuRIn5N4unlkCBDYkQvTMk8HBGGVLIJv1zQztcP0uGyPDDtauqq9TsKyqgTfpjbFtiEg3VYn0O3BiVwF5EoaIfqlobc9BHDGxWVq7XuqX9i3IafcFclgq7Rn7sPSfz4uzcQgFvi0UYfx/4Wed8J0CD4wd75GmyNXJgANkupZtU4a5GzdbaaHYF5ZNBLoF77290bflkVAu2vltGHJnOYDdRGP/wDwu3suuPVOxZnIoYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:36 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:35 +0000
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
 Radu Pirea <radu-nicolae.pirea@nxp.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 10/13] serial: linflexuart: Add support for changing baudrate
Date: Mon, 16 Feb 2026 16:02:02 +0100
Message-ID: <20260216150205.212318-11-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: 85100967-bf1f-42f8-b5bf-08de6d6c6b28
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTB5cXBwWUxMOHRZY3NUcFVhcHVTUERNV1ptRG4xYkh3WmZnMWNuSFZSQVU0?=
 =?utf-8?B?Z25XT2NXQ2JoU1RYNFpMM0Z2ek5TZWI5WWI2LzM5ZG1wci9jdUJkSXVkaFNx?=
 =?utf-8?B?QjYzckRHOFVYcGgwdm0vUVNlOU1OY01YZGdaWGFGRnhjR2htU1dLUkYzRVFV?=
 =?utf-8?B?dkNkRWtpZzlUS0NoZncyaXRmc3lMSUFFbVlQTjhzNEdBM05odEo5ZUM1MzNl?=
 =?utf-8?B?Vk5uei9RRWRKWXpGcjVYQ2dwQ1NNRStBaHRVMW0vRnVjb2todTFSNUtmSEFK?=
 =?utf-8?B?M1RXZGtrYk9oVmYrNHgzQnFsWVJ6aEMrK3pkNjhLYUxMN2NWTWp1ZjJhUWlB?=
 =?utf-8?B?T3ppajdxaUNnZ1hKLzNBV29CVEJSVm1xR2E0Uk04b09zN1pQMXRDT3NXdWg5?=
 =?utf-8?B?ai9uNWZzejFMT28zOEJkazZZL2ZpbmxzckRxOXNrYXcxOWk4bDF5OWRhUGI2?=
 =?utf-8?B?SnF5cDUrcUFRd0dHRkxvY0ZZZ1ZWaStISlpBSUNnUWpQY1pDeElJV3BVN3c0?=
 =?utf-8?B?eWZyMDFoSVcxbUFkMVJPbmpxWnd5dXdZUSsvSnNtVHJEYXZWU2hhSHNoNjQ3?=
 =?utf-8?B?Qm5qcmJOV0l3Y1NKclJQeXdRRU5qNGVUWVNVelA5MXZreDNadUo1ejFGUmsz?=
 =?utf-8?B?Vk1FT0hHQ04yQzljR0wxbXpYeVVrWVRIQUpvUnEvU01nWEJMSFJZRU1EWkIz?=
 =?utf-8?B?L0RTbC9nS0NqaDB0T2tvZ08rcVJkZUI0UE5BdTRURHNBU3FHV0ZlRWozK2p0?=
 =?utf-8?B?dTQrcUI0eitFMmZtZ3lFcFkrUFhoR3EvWmlublJzRi9GZHcxV3BuT2NYSmk2?=
 =?utf-8?B?T0JDaHAwY1YwRkp5LzdrY09PblR2YmROYWNhdUVlazVzRWJ2dS9ibnVkTmhy?=
 =?utf-8?B?MW5aUDV0RkZuYjJNVWxXalppMFphNW9ZeEI2VjJQSmpzbDgyN2V4R0JaZ21l?=
 =?utf-8?B?VksxMTI2aDk5Rm9ReHNVK1JqOW9KVlRwc1ZuUC9pSUJ3L01SdEJRa1J3bWY1?=
 =?utf-8?B?K1ZocW1sVkZ1ek9mb2hJOGZHWFZoUlgyZElOVUZJVW8ybDFMWWdSWmF4bkE1?=
 =?utf-8?B?SWhyTWpweTJBSzJ0V3JkRTIvZmpJZWNnRnRzdzQxZWpOenJ5SW9BTGxZOUN5?=
 =?utf-8?B?RnJOR25ZOEJTK0lwY1lnaTRpbHMwek4rSjE4NitCTVBYenVPbzRDYVp4MjU2?=
 =?utf-8?B?b1RIZXhFMGVHMVlYbHgxNTVwVWF0OUVaVVQvZSszSlMvaVV6clB2ZkdhNDN0?=
 =?utf-8?B?aTU2VTByMVBVOUdoNzZxQlJ4SmpnYjd1L2d4ajBPYno0dkRNSy81T2xQZkFL?=
 =?utf-8?B?YWlNY2NPa1FIWkt0L05xSC8vUVlvaXEwZG0reG1uN2NvZk5mMjVwSHdnZGNk?=
 =?utf-8?B?Znp4ZlBGUnBLcFNHUkpFRjRyNHVrY2RUQTVObGdoR2JlQW9SK1lvYXRSYWQ0?=
 =?utf-8?B?ancyVExoQUFhRXB6YXVRK1pEcjE2NmJucWtNODM0T0ZOWFJOUmpoQnJIVDZH?=
 =?utf-8?B?NytTcjU3N2JMUWt6S09RZi8zbXI5eDZwRDRpbURPUHgrSTBXK3RLWm5kWkt1?=
 =?utf-8?B?UU9DU1dxT0VpMmpjVk1tRE9OQWR3bXU5UjQ5djBCa0F3cjRYN1hVSTlsZi9x?=
 =?utf-8?B?ZXo3WHR0Vk0wME9mdmV2VTJmNGRFeU5pVEkxNVFXY01rTVcxSnhaMDdaMVc5?=
 =?utf-8?B?RXluc29YcDVYbmtIYi9hSUZDTS9hUGRMSEdvVUNxblNhVGg0NlpqTGxyNHFD?=
 =?utf-8?B?c0U4MXhWLzBHdEZvWitJS3VxQnFYemYzeDdLTTZXNjB2TFNKYTRsVVVFd3l4?=
 =?utf-8?B?RFByVlN1WDZ6aE9Gc1UrdzlOdFAzL2xKTk5PMTVtdXFmazBrM01JTk1wdHN2?=
 =?utf-8?B?SCt2eXBzc0hZWkRuQlArLzEwZzNsN204T09zWW50ZFlUY0ROUVdDazFOenYr?=
 =?utf-8?B?VHJSSDVUVWZHc1NoZWsrSzBoVFBUa0JLQnVLcUhqanhhUXRhMGtSRVlNU3Fx?=
 =?utf-8?B?Y1BZaXcza0EzNzRDdEtGQStkMHBKajJiMDFQMVhpWENsV1hDMkRlcTRCbEpI?=
 =?utf-8?B?a1RiZjRoWkdLQnNZWlN1QjQzeTUzdEM2MCtoVDNnVHQvV1h3NDRObkk0VnNK?=
 =?utf-8?B?ZkU2TE53cVg3eVA2Q1pBSnVOVXcwWHZqNHpsUDY1RUQrNUg2elNVMlVDQTd6?=
 =?utf-8?B?M0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rnd2UWhVUSsyU2NKNnFkclFONDRyZndKVTRlK29YNlJwemRNOXo3aFBJTlpZ?=
 =?utf-8?B?R1MxSVY5TTlpc3lwNFc0UWZqRktWYzl3V3V3OTZVL1ZiY09KU2hsVk5HdFVD?=
 =?utf-8?B?Q1dVeG41OTdOYWpBOUtQbFFSUlY2MzNpMUpkUEx4UXdpaUYyNFUrekF1Njhn?=
 =?utf-8?B?MEJJeHNISklzZmJwV29GZDk1TDlEdnhhTjMxRzFKVUFYaEoyL1liSGJ1aUph?=
 =?utf-8?B?di9EMEdDK3doMzBRWnRSZFdhZjE5a1UvcHBCdG52bXgyS0lCYW9xVkpUbXJG?=
 =?utf-8?B?bXhFa0IvVGUzMGNaTnNFajVyUEI1ZE1zVjEwYmZZMEJxZ0FOSFJOQW9GNnY3?=
 =?utf-8?B?MTVjSjZhNVphZDRTL1VRbW5qKzBCMGNudFJqcUl3WkpRY3VDUkkzV2lRNGlz?=
 =?utf-8?B?SDhUdFVLbnNicHFWV21qMVFOM3NkVXRRMjQ2Zy9ET0JhN3F3RTk3endCeHo1?=
 =?utf-8?B?d3Q5WjllalFTeTNuc0VaUGRqVTRuRzZjbXdhWm1EbEVXcndVTDZtS3NsbGI2?=
 =?utf-8?B?ZjYvZkdpY00xN21mUlVWR3VpSm0rNkloZWsxVkliNWdVZVg2eE5KdHJ5QS81?=
 =?utf-8?B?Y3lYR0trN0pzbm9DQ3ZpRHM3dW1GMUFMYUl5N1gydHFvZ0dBNUZQenQ5L3pY?=
 =?utf-8?B?SWJIRjZENHV1UWROVFowYWhJdTJGSWQveGtJS3NOejZ1N1h3blpWSjYxOHNK?=
 =?utf-8?B?OG5nWHBNLy9wTjExSFI5SmxXcGFjd2Z3RFo2YnJBbjhldVlXaW5iN2FZQnBa?=
 =?utf-8?B?ZmUzYUg3WjBra21lUkI1RTQ3bUtXOFdpUFdGMDEyQktuVW1FKytRMjlJeTJN?=
 =?utf-8?B?NnFKZmhLcFNtSC8vRGMxcHlhNmtkN2VaZVJMSDk3bTdBOWJqREI2Uk4rQnJS?=
 =?utf-8?B?Y3k2Z0lqSHVMbWN6OER0UWFhNUwyL0JuUzkxdHBQbGVHUm5URDd0ZzU0RjUx?=
 =?utf-8?B?YU4yejlMRStKaTdCc05LYkJEekQrM0N6SnpRQTRNKzVkc2ZObUZFZFBwL3RM?=
 =?utf-8?B?V09jVHN6NTg1NVdiSmtURkRvSjNKNVFnRGZ0UXE4MitoWExSRVlnb0Z6OVhm?=
 =?utf-8?B?S25IT0dTUjJMN200QXExTHpvWkEzbS9zUzV2akxwaGtFcUNsM1RaaEw1WmtS?=
 =?utf-8?B?L0RiTVppZ0Z6UTRQeEZlQzVsSmFSblZ6cGdPZmN1K0RmWXBnaWh2SUt3NFc3?=
 =?utf-8?B?bEovcWtVZFRmcElLcjBVOHN3K0Y4RXJCVUlMS2FBdGtJRlhqcmlXRHJ5UURG?=
 =?utf-8?B?RSt6UzBqbzVRaGV4c0JDTTRGdWt5eHdicUtYdjRacytLTWJvRFFiZzdQUVh5?=
 =?utf-8?B?a0cwY0RqaXRqSDg4RGliZm5EQm1aOWk3ZURmbUNjQUowVHVvZEQ4SzVnc0VX?=
 =?utf-8?B?eCtMOG5CNHliQjQzaTNGZ2cyendiMDNBaVdsR0t2Qkt2OGgzTHpIQS85cXB2?=
 =?utf-8?B?MU9ncVp5VDVLL3RrcGJ4QThWemViSVp0VGdITVljNXl4MlJYNUozZUoyUEtB?=
 =?utf-8?B?ZW9UUlBTenlUc3Vyb3pURTlPZjZBZnVJVExmc2JQQlV1UDJ1bTRPUEJHUHln?=
 =?utf-8?B?RVkzRWk1R1h1Y1BNQ1VLNnVxS3Q1bE84alZLcEhxNmdlZlRiNmEwZU80ckVn?=
 =?utf-8?B?S0ZWWm5xMGpRYzBTanBaOFdNcHZYNDRldzArRkZhYXBJZ0hzMzBqaDNKVGYv?=
 =?utf-8?B?eGxnVnFtRmw1NkN1K2x2Vmtacmc3S1RlV0ZMb3UrN2R3UnI3T2pvSC9uZVpS?=
 =?utf-8?B?MCtDR0Fpa08vbEtCM2xqd1o4ZjBvTDJrcy9qMVI1OG9uREprVzVHd2hVaWhx?=
 =?utf-8?B?MHU1RDlNM1QrcE5TTm1Xay9UTHJJdTdaS21qMDlPQUhyZ1IxaDNjUWY0ZXJw?=
 =?utf-8?B?VTg4Y3NvZGlqVEIxN2lySERIb1doaWcxRDd4dUg5RnNJYWxXdmJPV2I0TUhQ?=
 =?utf-8?B?aGZGc05iM0xNTXlLMmFDbURxbWhMWWdTemI0V2pLMEcxMzFQSHljekpFaS9h?=
 =?utf-8?B?cE5nTGk3QXNnaW5rbEpoMVkranpTdWMybWFRMlE3OWhjL1VrZDNGOWJ2QUNl?=
 =?utf-8?B?WlhPQjIxbmwrUjNCTHhMQzVOWmM4bUdDTnA2YkdNbjlGdHdqVHd4OWdiTzZR?=
 =?utf-8?B?TlBNZnM1SW14UVlvWHFpT3BVUHpNelhHeWxzdEpjM1NrQk54Q2E0MlFIM3FQ?=
 =?utf-8?B?VkYvZFZIQlVpaDc0THhkdlhGbHRPRXFHRVRLL1FXa2FwWmFhS2txblJZZTVB?=
 =?utf-8?B?YjI4VFJ6V2FHWjB2ZHM4T1hrL3BhaDV3N09CcDZoRHdzTFZjUks2MFpmcXpv?=
 =?utf-8?B?YkVMcS8vQUZzOWEzRnUvWjZpOUI4NU1JR1VKSlArYlNkUFJnZGtkK3RBeDUw?=
 =?utf-8?Q?c1ZOBdjcTHNLJ7ps=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85100967-bf1f-42f8-b5bf-08de6d6c6b28
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:35.7246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4osijy3xsUhiZJNegx+DEivojxb9/QlUZPFXTlyUX9urENP9oF3Zcu4BgA6We301M7k2QNqBc/QiMSpsCitFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12380
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
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:larisa.grigore@oss.nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,freescale.com:email]
X-Rspamd-Queue-Id: D1D9714811C
X-Rspamd-Action: no action

From: Radu Pirea <radu-nicolae.pirea@nxp.com>

This patch adds support for dynamically configuring the baudrate of the
LINFlexD UART.
It introduces clock handling via clk and clk_ipg, and updates the
linflex_set_termios() function to compute and update the baudrate
related registers (LINIBRR and LINFBRR) based on the selected baudrate
and clock rate.
Baudrate is calculated with the following equation:
- When UARTCR[ROSE] = 1 (reduced oversampling), baudrate = LIN_CLK ÷
(OSR × LDIV).
- When UARTCR[ROSE] = 0, baudrate = LIN_CLK ÷ (16 × LDIV),
where LIN_CLK is the frequency of the baud clock.
LDIV is an unsigned fixed-point number:
- LINIBRR[IBR] stores the mantissa.
- LINFBRR[FBR] stores the fraction. This register isn't used in reduced
oversampling case.

This feature is supported only if the clock properties are present in
the device tree.

Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
Co-developed-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
Signed-off-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
Co-developed-by: Adrian.Nitu <adrian.nitu@freescale.com>
Signed-off-by: Adrian.Nitu <adrian.nitu@freescale.com>
Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 124 +++++++++++++++++++++++++--
 1 file changed, 116 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index fb5f325416c0..36c8f90d975d 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -3,9 +3,10 @@
  * Freescale LINFlexD UART serial port driver
  *
  * Copyright 2012-2016 Freescale Semiconductor, Inc.
- * Copyright 2017-2019, 2021 NXP
+ * Copyright 2017-2019, 2021-2022 NXP
  */
 
+#include <linux/clk.h>
 #include <linux/console.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -131,6 +132,22 @@
 
 #define PREINIT_DELAY			2000 /* us */
 
+enum linflex_clk {
+	LINFLEX_CLK_LIN,
+	LINFLEX_CLK_IPG,
+	LINFLEX_CLK_NUM,
+};
+
+static const char * const linflex_clks_id[] = {
+	"lin",
+	"ipg",
+};
+
+struct linflex_port {
+	struct uart_port	port;
+	struct clk_bulk_data	clks[LINFLEX_CLK_NUM];
+};
+
 static const struct of_device_id linflex_dt_ids[] = {
 	{
 		.compatible = "fsl,s32v234-linflexuart",
@@ -421,6 +438,19 @@ static void linflex_shutdown(struct uart_port *port)
 	devm_free_irq(port->dev, port->irq, port);
 }
 
+static unsigned char
+linflex_ldiv_multiplier(struct uart_port *port)
+{
+	unsigned char mul = LINFLEX_LDIV_MULTIPLIER;
+	unsigned long cr;
+
+	cr = readl(port->membase + UARTCR);
+	if (cr & LINFLEXD_UARTCR_ROSE)
+		mul = LINFLEXD_UARTCR_OSR(cr);
+
+	return mul;
+}
+
 static void
 linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 		    const struct ktermios *old)
@@ -428,6 +458,9 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 	unsigned long flags;
 	unsigned long cr, old_cr, cr1;
 	unsigned int old_csize = old ? old->c_cflag & CSIZE : CS8;
+	unsigned long ibr, fbr, divisr, dividr;
+	unsigned char ldiv_mul;
+	unsigned int baud;
 
 	uart_port_lock_irqsave(port, &flags);
 
@@ -532,6 +565,24 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 			port->ignore_status_mask |= LINFLEXD_UARTSR_BOF;
 	}
 
+	if (port->uartclk) {
+		ldiv_mul = linflex_ldiv_multiplier(port);
+		baud = uart_get_baud_rate(port, termios, old, 0,
+					  port->uartclk / ldiv_mul);
+
+		/* update the per-port timeout */
+		uart_update_timeout(port, termios->c_cflag, baud);
+
+		divisr = port->uartclk;
+		dividr = ((unsigned long)baud * ldiv_mul);
+
+		ibr = divisr / dividr;
+		fbr = ((divisr % dividr) * 16 / dividr) & 0xF;
+
+		writel(ibr, port->membase + LINIBRR);
+		writel(fbr, port->membase + LINFBRR);
+	}
+
 	writel(cr, port->membase + UARTCR);
 
 	cr1 &= ~(LINFLEXD_LINCR1_INIT);
@@ -760,17 +811,52 @@ static struct uart_driver linflex_reg = {
 	.cons		= LINFLEX_CONSOLE,
 };
 
+static int linflex_init_clk(struct linflex_port *lfport)
+{
+	int i, ret;
+
+	for (i = 0; i < LINFLEX_CLK_NUM; i++) {
+		lfport->clks[i].id = linflex_clks_id[i];
+		lfport->clks[i].clk = NULL;
+	}
+
+	ret = devm_clk_bulk_get(lfport->port.dev, LINFLEX_CLK_NUM,
+				lfport->clks);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		lfport->port.uartclk = 0;
+		dev_info(lfport->port.dev,
+			 "uart clock is missing, err = %d. Skipping clock setup.\n",
+			 ret);
+		return 0;
+	}
+
+	ret = clk_bulk_prepare_enable(LINFLEX_CLK_NUM, lfport->clks);
+	if (ret)
+		return dev_err_probe(lfport->port.dev, ret,
+				     "Failed to enable LINFlexD clocks.\n");
+
+	lfport->port.uartclk = clk_get_rate(lfport->clks[LINFLEX_CLK_LIN].clk);
+
+	return 0;
+}
+
 static int linflex_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct linflex_port *lfport;
 	struct uart_port *sport;
 	struct resource *res;
 	int ret;
 
-	sport = devm_kzalloc(&pdev->dev, sizeof(*sport), GFP_KERNEL);
-	if (!sport)
+	lfport = devm_kzalloc(&pdev->dev, sizeof(*lfport), GFP_KERNEL);
+	if (!lfport)
 		return -ENOMEM;
 
+	sport = &lfport->port;
+
 	ret = of_alias_get_id(np, "serial");
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
@@ -800,33 +886,55 @@ static int linflex_probe(struct platform_device *pdev)
 	sport->flags = UPF_BOOT_AUTOCONF;
 	sport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE);
 
+	ret = linflex_init_clk(lfport);
+	if (ret)
+		return ret;
+
 	linflex_ports[sport->line] = sport;
 
-	platform_set_drvdata(pdev, sport);
+	platform_set_drvdata(pdev, lfport);
+
+	ret = uart_add_one_port(&linflex_reg, sport);
+	if (ret)
+		clk_bulk_disable_unprepare(LINFLEX_CLK_NUM, lfport->clks);
 
-	return uart_add_one_port(&linflex_reg, sport);
+	return ret;
 }
 
 static void linflex_remove(struct platform_device *pdev)
 {
-	struct uart_port *sport = platform_get_drvdata(pdev);
+	struct linflex_port *lfport = platform_get_drvdata(pdev);
+	struct uart_port *sport = &lfport->port;
 
 	uart_remove_one_port(&linflex_reg, sport);
+	clk_bulk_disable_unprepare(LINFLEX_CLK_NUM, lfport->clks);
 }
 
 #ifdef CONFIG_PM_SLEEP
 static int linflex_suspend(struct device *dev)
 {
-	struct uart_port *sport = dev_get_drvdata(dev);
+	struct linflex_port *lfport = dev_get_drvdata(dev);
+	struct uart_port *sport = &lfport->port;
 
 	uart_suspend_port(&linflex_reg, sport);
+	clk_bulk_disable_unprepare(LINFLEX_CLK_NUM, lfport->clks);
 
 	return 0;
 }
 
 static int linflex_resume(struct device *dev)
 {
-	struct uart_port *sport = dev_get_drvdata(dev);
+	struct linflex_port *lfport = dev_get_drvdata(dev);
+	struct uart_port *sport = &lfport->port;
+	int ret;
+
+	if (lfport->clks[LINFLEX_CLK_LIN].clk) {
+		ret = clk_bulk_prepare_enable(LINFLEX_CLK_NUM, lfport->clks);
+		if (ret) {
+			dev_err(dev, "Failed to enable LINFlexD clocks: %d\n", ret);
+			return ret;
+		}
+	}
 
 	uart_resume_port(&linflex_reg, sport);
 
-- 
2.47.0

