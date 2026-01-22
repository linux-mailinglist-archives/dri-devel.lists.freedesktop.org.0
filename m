Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO4TKbXncWkONAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A9364242
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13B710E957;
	Thu, 22 Jan 2026 09:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZO+/vXun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3F010E96A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLH5PlnAYbgRcRHe+qLm31t9htVRyRRvxqcmibRR+07JTVa9VQm+k6nx6bmVGAI6lZEA0lzPBXaaDOOZWT0cSJo28Rb9PxJp7EyNaBOMs/c2VTcPStgHDfYHuoqGJo3mtcJxH3rYDxGDMI1McjcYPugccijZEhCYJFLHarTThkF5LYgeTBE+BlxrJKtQLpZPccjqGiIQ5sCQPYPl+SX8luk/LYjFZeiIKr1iQKszt3EWqYSzWgF4+2GPA5TzD1/quJBlG2C+R/eM2gkVe4eVYCNt87LYitw1d0bt1Tqa+ByzKnf0zDNX0zSm+pG47ppNRGYBIVOwP6MU04cM2y3lMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/vnICDRcXdUiGAKyXxpfxk8aP+QI4QCp4f05R9nIUs=;
 b=agSw18OqTMm27h+g+g1MJvdArHy6HiJlYJZO7HfU9sIGdrN8UWHREqwFywtNdNdgVh8m10zfnMGngVi3bbxVhNsv3wwr3kHbf1NFDxKBeNaod9ox4IyGT1dslss2yu8gw2DvgcvSV4RdTmpT4BZQhoJV5BmZ2pvTtxC+tjYC53mxFDYuYPrEJxgQcfcrtKe1ODxE/3Qd9dRj/wLjS4NyxRJAPCXrbNopmauysq6qCImiBPpRnlLOSMc4nnm5nRZygPGfwGD/GTY1iGtsHq7w6PR91dvg6WGYjVoXUomLzrizToxjL/Om3IGRJqkCj21M/HD05Ro/cF2+JSEG7n9FsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/vnICDRcXdUiGAKyXxpfxk8aP+QI4QCp4f05R9nIUs=;
 b=ZO+/vXunPXTj5AbZClszIhg5Ya5zp6qRjSgTM2+9oqp9OCx142o8f5QB/+TfPyfqCk+SG6WzRyKaHYf0RHU91uGFb3XNWD8T0z+bA6tjXY8wEKQdS2bccp1Bqn5lH3B3MRRcy+aLEkd5qNbongw1Iz7JiAT1bJZTBe4TqJRoPSnad21IL0S/DBh4e14635LGHlsLCCkFUO32Oc0wgx7dTanUawn9UPv3F/WSMv/+3e1qHzLyhyMeMpCVXOmC5K4lBarZ71712eCjHYbxCZeJhUlC9T13wMZrxeowckmVl2EvllZJwbe7x6hOH6q7+tvNZkYdzVfb436QsuGFwx8Ybw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA4PR04MB7872.eurprd04.prod.outlook.com (2603:10a6:102:ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 22 Jan
 2026 09:02:39 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:02:39 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/9] dt-bindings: clock: nxp,
 imx95-blk-ctl: Add ldb child node
Date: Thu, 22 Jan 2026 09:01:44 +0000
Message-ID: <20260122-dcif-upstreaming-v7-6-19ea17eb046f@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
References: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::6) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA4PR04MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 5668ec20-f400-4d3a-f70f-08de5994fe7a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|19092799006|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFltaW5qalp0cXBhMjF6dENFV09tRzNTcFJOTjc2MHdpOGYxUVpPV0lDcm5p?=
 =?utf-8?B?d3E2M3VZcmpBREgyMCtMYVJYbkZhVFlraGZsQnZ1R2prbDliUkVxOHdzeWZS?=
 =?utf-8?B?TXZMWnQwcUpvVHJMdFBwWlhaeWcwVHE1cWUvcGVyOGdkc2ZTeGtTQWh6Vy9K?=
 =?utf-8?B?eENOeFJDUFlIc3hXcmkvN0pVaTVVWHpkdVZvb2pHMzhqKzdvUlZpc0ExM1pm?=
 =?utf-8?B?UDVFajl2TmJZSHNhZGJ0ZitIRVM4RlN3T0hnZ1lnTEdPdDBmcDJkbG85clJk?=
 =?utf-8?B?aTI1bEpUbDN3TkxDYTMrSlZRSnNGRklUdWxaTHhFZFRCNlRmUno1dUt5WUVM?=
 =?utf-8?B?V0V6SklnUTBqZFdzL1VYdmdVUzJyZXN6WGtubUxRczdLNDE3V2twY0NDaTFN?=
 =?utf-8?B?OFBLQ05GaVFWY0wvVjcvVyt4OVVwUUs5aXcxc1k5RkdRNW9DOVlJSXZmWVZY?=
 =?utf-8?B?LzFOWmc2cUQ2d1RaSzJnM1dhNlArR3VnNld5WmZPc2dvejBvWkJMWWUvQ3pG?=
 =?utf-8?B?ZHFMeVUrUTVkek1CVk5HNmFDUkc5NSt6c2FQR2sxdzZhMUdUNjhhNmNJNE91?=
 =?utf-8?B?aDFUMGp5ODRDcm9PK3lPaUU4a29ZdzZVZFd4SDl5WTZqYTkzZnFyMkFYT1Z2?=
 =?utf-8?B?bU9aWE9rM3piKzFlSEd2dExVRGZ4bnZtVjlZVy9IQlNWalgzVFArcHY5dTFF?=
 =?utf-8?B?K3I3cnNmV25lYjNGTDRkMDlDQW1aZWJkUitSa1dyZVEyYjdYT2dxaENUdll1?=
 =?utf-8?B?ajR0dHJWdFpoZ2NvS0FyWUdxTThtMzEyKzBCQ1IyTURaeFkrWFREdEl0aXdY?=
 =?utf-8?B?b3g3OFJVREk5akl4bzVIRU1WcWFRK2x4V29BdldzSUZkckNORTBON3VOUnJX?=
 =?utf-8?B?em1LRnAwc2hESUtpRUU1M3BON2hqS2JJWmMxS2NqclBNalVLU0FPdnhzUmsv?=
 =?utf-8?B?SGM3RldTSWlaNFV5dUdpNnNwL0R3cUQyRzVrWC8rNUIrbXQ0UW1NaGRDRnZq?=
 =?utf-8?B?aGJBQkFyQmg3T1QvRDRHc1Q4Kzlzcmp0Y0xjaUlhdC9YUXl4eEg5MU83cXEv?=
 =?utf-8?B?Yy95T21MRFdoVFZIUWFzTjZLWjIwZitML3cyVmxFell4YVlGZXVxTnE5MkFp?=
 =?utf-8?B?NWpFanoyZ1Q5aW92M2ttaDRkOW5wQkhkczVmVjE3dGliaEZIKzJhRXhPU2FR?=
 =?utf-8?B?SkgveFFScytRNStSWTU1UHlpZnlkc0dCYXU4TFkxMUZQRUIzc1BRb0JMZVd0?=
 =?utf-8?B?TlN3SDRGeE1ub014aEFCakZHYVlPdXFSNVAveHQ3Mnk4U2JIakVVMHY5U0J2?=
 =?utf-8?B?UDVsYTNhN2FqK1Zicncvdjh4NVlLdnR6K29OclV5RXRCeGN2b1YzQlFVZ2lK?=
 =?utf-8?B?YitaK3B1a1VJWlpMK3V6N1RVeW5UN3V6aG9WZnc2MnhsUkx1eGVNZ2hpaDhi?=
 =?utf-8?B?TW1ENEZWKzdsTXE0dm9BRTFSMnYwRjRIYW95TlJObEptc2dYaVZnN1JKYW9Z?=
 =?utf-8?B?MjcwTC9FMm13U0hlZ1JZK2ZjdmhHZERDNzQwTHNBVlIrandwM0pmVVhSTlhK?=
 =?utf-8?B?RExJMGJiYjdSQ3BBZkU3MVdQRndHZXJ0MUcrMXVJZEU1QXpKemF5UkkvbGow?=
 =?utf-8?B?OUVZMFBrYTVxeVJlYi94N3VJaGlHSXNSNENoU0U4Vi9idnZTcnptZU0vUmdM?=
 =?utf-8?B?elorRlM0Q29ldmc0MTRwcDhtTkZMSk03UmE5Q3Q4cE1ST0JmZ2t3ejB3a2Ru?=
 =?utf-8?B?ZUc5dUwwdjlMaEpoTXZ4SFJpejdZdXJ6dWc0cENRSEpSYXpIajZWQmZOcWNs?=
 =?utf-8?B?ZzAvVXF5T0ZVVGZodmZsRGhJR0lvbmdGT2piSWR1R1BaeTdNaEJkUVE1bHhN?=
 =?utf-8?B?WW9WWFkrVWVHSFJQYkJIQlBzRlRHdE9sb3I4dGIwcTBkbWlubVJrem5xZ1pj?=
 =?utf-8?B?MDcvSmQvMldRSk0xVjUvN0NJMitobHd1MmZNRDFzRGk0VVh5b2FML2hMbE41?=
 =?utf-8?B?aUMzUTBjZ0JJVmhGZFlJRjR3ZGFrR3BKZGtsZHFMbmQ0QUMxUzZxVDVKK0px?=
 =?utf-8?B?aEVHdlhhejY2bGxicit3cUxybXlhMnRVb0trZ0tId2ZFbFh2WjE1WmNNcUY5?=
 =?utf-8?B?K0NZMkllK1JKQVNZRUNNOE9QeFFKbDF3NHZjTy90aUtvQjhVazBCK29scWJM?=
 =?utf-8?B?emc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0U0cmdsOWpVVlAyWjBndE9ybEczWU5LT3ZxNHpWQmlRbXpDRzgzUDRjbHFE?=
 =?utf-8?B?L1g3Sy9nZDgrZ0NOay9RNk9QZ1lmcnRLTk1tZ0VvSDZnM0luRk1QRmRubWU2?=
 =?utf-8?B?RHU2bzBWS1ptYkI3MjVFeDRiWVZmdVlGRjNMRzhrSzJNRnNUZHFHQ0l2MUZN?=
 =?utf-8?B?WmxZZDVoNG5NcTlMNVgrQU5ad1J4V0NlSktCL3VUeE54OGEvOXF1Vmh0OGJu?=
 =?utf-8?B?RU9vdVZDdTV4ZjBIN3dPdmpCUDAvSmMyNGhzL3ZkWG05S1kzRDBpM2JHSmxI?=
 =?utf-8?B?QmZWd0dXMyt4dEY4SDdNb0cza1FLLzNkcWxnbHcwQ2xuRnpUZ2RvcytPZlIw?=
 =?utf-8?B?SzZmczR4Z2FYYkp2a05ISW9PbTBUNzduclpnSlJ2ckhTUzZBaHNMQkdSbk1W?=
 =?utf-8?B?VTh0TUVkTzN1cEl4NGRwRnJOVExuU1BEM2FTQlpJQmtyNkxqYThsMkpLZ3J6?=
 =?utf-8?B?S0ZkQlExQzB0T0w3SEJFVU9rc0o4Z2FQWU54T3JNR1kvUjBUTFlwTTEyQVhw?=
 =?utf-8?B?cnhwZWFLaU5hMzIvc1VXaFBnYUtBTFNJNWxWVWdDZ0k5MEpCa2dzZytLU09i?=
 =?utf-8?B?eFpWSThLZnJmYzZ2Rjlmdm42V1JSb3Jzb0FPeEdNYUwwdEUzeEJnZVhtbTV3?=
 =?utf-8?B?QWMvK0dYTlBYdVJaVDFUaC9ZcVI1STg1SW9LNjFCMEFmWHJDdUlFWmhJUVo2?=
 =?utf-8?B?N0c2SkM0MnkwSUUrSm1BVUR0Tzl3SG5nODJaaitKWTVsRWpZM3kzaVphTEtW?=
 =?utf-8?B?OHN1MzdwYU5GNE9DcGlmdHBvS01xQXR0NjM1Yk95Vm81RDdtcENiUktmQWVy?=
 =?utf-8?B?RVBSRzVlQXRjYkZDVlpvVythUVpyZjU1NDYvVVNQZFlYMDR3T0g0ODNpSS9U?=
 =?utf-8?B?QVIrMEN1MFI0cGlsMVdFN3RWSlpVdFFnOHd2eVhHdXZJeWF4dFBEM2hlTWJY?=
 =?utf-8?B?bWo0STFBN09NSmNad2l3R2ZkRWg3c2Zxai9JbngxcDhJSXlKV3BtS3Q4NkFi?=
 =?utf-8?B?TXYvek5kWGNFVk5JUGpvYU1Bend3OFRCL2Y2RzExcmhybDc5MkhjV2Q3K3o4?=
 =?utf-8?B?UExxZEJ6YlFjQ095VDg5Z1Y2aWpESURtMnFkazdpYW9YRXZSNWhNQjNJdS9F?=
 =?utf-8?B?TXQrZ2lSNXFUWGdlc3E1SkN5UW5pNG1mVVdQMk8rRGM0NUxpTVlXTitPNVVh?=
 =?utf-8?B?T0ZEMlVOaWkwL1VDRVoveGc0MWY0UWZKT1l0eGE4L1hhTTY5SjlvdzIweFN2?=
 =?utf-8?B?MWxlSTBwUTNEbTMxdFUrSk5JdnVMQXpCbHB0ODg4YS9YcE4yeFByOHR2VEg2?=
 =?utf-8?B?MzdHQUpZWHBmS284Nyt6TDR0MUtkazVocGFmUC9iQnNNQ3Bmdm0yYnY0UDJM?=
 =?utf-8?B?b3h5WXlYQVAyYlY3L3FrcGhjbEVCWG9JUTJjbTh1OWE2SWxiSVRHUUNPQUNs?=
 =?utf-8?B?YnpJbnk3d0taeEF0MHBLaGlJZCtjR1RFZDVFbWIzMEI4NCtEcFQvK2lJUS9k?=
 =?utf-8?B?MFhkcGt3OTlmMTVKVXpXNlNMbE83MnRTVHNTdGhvUVFYTmFjYVJ4NEh3NmFj?=
 =?utf-8?B?bDZVbzZjSlZMNUZ6V2NiRWV2SjVuUk9HRXRDT21IdVpmUUNxT0ZaSkpORW8y?=
 =?utf-8?B?OWlzVXJTQlgxM01XYWh3TWljdTBPL1dKQ1R4T20vTnF0YlRjQTBCNnNEYktZ?=
 =?utf-8?B?eGhDOVFMZExFSUtlRnVVd0REc3NpSktKZWZ3d0JiUFVyYURFNWp4akYxQWtq?=
 =?utf-8?B?V3FIRGVqVXVWU1pPZnpnUy9yRmErb2pUNFRnY05BN3NiaEgrekdlc011S2s0?=
 =?utf-8?B?d010U0dvVE9KWDRQSkgyYU5qTTZ5bmEvckJjRlZkTTRYUkdwRmV5ZEptbWFw?=
 =?utf-8?B?UlQvaGsrdWc1K1ZNZVM0U3BFMUcxVkdkdTByNGVST095S29uWTNWZ3QwMVVl?=
 =?utf-8?B?UEpJaVNIcEU5eEwwOXYrQXhMTTRmRDNJeVJBTENHZ1NvbXBhOTJtUzJhNzJ1?=
 =?utf-8?B?NW5rcGpMNDJRK2VsYndZM1J5YVpFeDFkdHU3WEdlLzJGdyswbTRsUTU3eVVH?=
 =?utf-8?B?MWR2RGY3YnBUVVRWVlpHK044QUF2MUJFak9OQ3JuZExhYWh4c2pXOGtkVTR5?=
 =?utf-8?B?MDlQUU1ML2V0WTZCeTlwR2g3QUIyMU5UdU90dFU3SGpMS2NZVm5rbHgzMGd1?=
 =?utf-8?B?aUltSG9xc1B3d3NzczBvV3E1Y08xMThmOXgxS2t1TW9VTkpMYXh6ZlJvaWo3?=
 =?utf-8?B?QjFxSTN5dFprRlBCRkxhR2lJV2hJTWJRK1NESFQyN21LaFZnKy95QUQ3MVRz?=
 =?utf-8?B?NzBYMmdtTGtFUnBUY1ZaRnZMVnBiS2dXb3phRjkwb28xSHZiWHRpZzdjRnNz?=
 =?utf-8?Q?X1Y9IwLvuhEdgF24=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5668ec20-f400-4d3a-f70f-08de5994fe7a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:02:39.3948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2rNd48DtDYFh/T+WleXFHbz0ygzDWzJgcpHMF6gHBe/opkLQa+Fz8ldNQBn7pHMXQvaYwc0jFbRrk+ujoobGQ==
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
X-Spamd-Result: default: False [2.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[lists.linux.dev,kernel.org,nxp.com,baylibre.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 55A9364242
X-Rspamd-Action: no action

Since the BLK CTL registers, like the LVDS CSR, can be used to control the
LVDS Display Bridge controllers, add 'ldb' child node to handle
these use cases.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d6219d31649d75539af93edae0f17d..85d64c4daf4c96372e4171737b6954c3941566ba 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -26,6 +26,12 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
   power-domains:
     maxItems: 1
 
@@ -39,6 +45,11 @@ properties:
       ID in its "clocks" phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
+patternProperties:
+  "^ldb@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/display/bridge/fsl,ldb.yaml#
+
 required:
   - compatible
   - reg
@@ -46,6 +57,21 @@ required:
   - power-domains
   - clocks
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: nxp,imx94-lvds-csr
+    then:
+      patternProperties:
+        "^ldb@[0-9a-f]+$": false
+    else:
+      required:
+        - '#address-cells'
+        - '#size-cells'
+
 additionalProperties: false
 
 examples:

-- 
2.49.0
