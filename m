Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB4FENcElGl7+gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 07:04:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E485B148EE8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 07:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1680510E445;
	Tue, 17 Feb 2026 06:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="olND4wS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013029.outbound.protection.outlook.com
 [40.107.201.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AB210E441;
 Tue, 17 Feb 2026 06:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S28HDNUK0uuO06BWs4j7ikhROi2LJEFrbeXEbZP9BBscRIXbfkDBBv4H80DVHMS7vtAGdGsuA5vCF2VKkNCP3Zb5eqT2ArgfQY5HwTX4MalFLnAgGXE5QfvU3wQe7+dew8c6OKry7wZqRXIwFRvZeR195nmxHM21HlkJKMyGxBZx4WppvBR+YdruJb0jOD51XiLgd4V0+N700KHIdsDGgOy6UOP/cfUrTKliyCdcs07w8jJkbQdFNpvHZGaWFYCIHYCG7YQyBqgT7s4fZ7BMyKHngQBtDMEwVlvGAt1bFbVQYUvFgZRCe1dn6hGOzFeVB4iBXwKUeJTXyg9oWIgZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vQcYLi73fTfc6807FNxPiP0wkNaroLQM+qvDl528XQ=;
 b=mw+t04+6VHkmw1CD4sBXP5/9bsrrRP+4k7G5wESxPOH8MZd8DmB/pJsNi2Ti64cS2+yjK4Ah+eO8BTtfCG3ZRbWUZNIS6yU7WDAIlRTCmS/b1qfTgUh5OaFcYij02d92AAwW20/zI5MWcECe4cUQZQddIeJpSs2oXRr7Ewtvu1et1AAy9g2NsGCSrdzc30/SMUK+//aPRe57Th5/XbCFQOwH4XFWQnCmtz1eaE53c8/hdKjH/D4Eo3L5CLEFA7y0FF0Q6Yy1wWQNYaTqkGDipC7/ctijmXma2edzWxNIlkPqAd+dksIcK+5yXP2tVEbOwXVXAzy9xYIhZANsNvglMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vQcYLi73fTfc6807FNxPiP0wkNaroLQM+qvDl528XQ=;
 b=olND4wS3Eolr2S3hxGY/R557vxfTpgX4CLHQWBr9IMoW0qf+Avv7xUqyqOtoVWa6fYApDxO2euLUnWcOiYdHCXE5+b009jiE05ownBLe8NLf6llT89xzwNNmQG00KKySTP/bywo/GFifXIDftTR3LoUrjfkPkTXq5dKdD7ezZAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 06:03:55 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 06:03:54 +0000
Message-ID: <08987287-ce6a-452f-a1aa-080562afe7bd@amd.com>
Date: Tue, 17 Feb 2026 11:33:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/buddy: Improve offset-aligned allocation
 handling
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
 <ce9833ef-8cfa-4b1a-b4d5-eda0158cb19d@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <ce9833ef-8cfa-4b1a-b4d5-eda0158cb19d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0083.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::15) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: dca3520b-655f-43dc-34d1-08de6dea5481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|19052099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnUwSWoxaFVVZTRTZHlvWG5lL3BWTVhuSlI3c3BOaDMxZnVCQStlWVpnQjND?=
 =?utf-8?B?b0dCaml4bk5NdE4veGNOR29qOFFpSHFYYVRPYVdkN1JGVXRsZmNSd2FSUzZT?=
 =?utf-8?B?ZEdFUHZSa21wMkVzV2lUMWVZYmQ2Vkt0OGZYY0IxYWZ6U3JOaUpEZVhhcVp3?=
 =?utf-8?B?ajQxTlp0UFNJQVV4YVIwZy9yZWFnUG5hMFNrQmozbEtycUdnVkkzWnBwYUQ1?=
 =?utf-8?B?aml2bk9yditMYTltb3dNbTJzRW5kc2sya0JFdTd5SDB5elJEeFE2ZklxbENH?=
 =?utf-8?B?MzlEZVVQRmlkZmxlWU43dWdZb3Z0OHdXT2c0MTM2TUZHblJ4RW4zUVB5U2ph?=
 =?utf-8?B?OW01NkRVSW8xTzAwQjE1emg5VXBWQlFneTk5L3ZMMDVRbHlzOWpRSXBnWXJW?=
 =?utf-8?B?ck1iNlZ5MVRzbk4vaFZvTjJNQzJKY25ZdGo0MHY5Z3pRa2FiZzQzR1EzcmdC?=
 =?utf-8?B?Uit5RDBiT09WTEpDWlJxMGFtTFNoZWVXQkpBL1luSDlSdzN3MG1Fcy9lYUU2?=
 =?utf-8?B?a21qVEREaDM2ejdlZHZHVWt2R241em9XOXY0UmY3NkNja0VRZWN4YW9QM1ox?=
 =?utf-8?B?S3MxMnZSWUJPNXcybytNMUR6Z0dUd0J1OE80R0FqQzlDdU9mSUZoeS9sZjlI?=
 =?utf-8?B?Z1ZmeHZuVWl4RXlLN1hIVXJUQUlHYzZXTC9qSUJRVkFVZE5CU0J4eEhMeXhz?=
 =?utf-8?B?dmsrdmJTN1M3U0ZzRFJ0ZUZoYzltRS9pdEhVY2Y5ZGc2YTZERHRLd2JtSEl2?=
 =?utf-8?B?UVd6OHd2di9iVm1aVzZOZzYvNmgzUGZJcVRxQTVDQVFkTTdZeHJLQ3ppVkYw?=
 =?utf-8?B?L2xpMzhnTklIWW40QW5VTU5keTh1RFlVNURaV2lkVitENUtxeUF4Vi9NbWFq?=
 =?utf-8?B?RE9CblBaTStYNUxMcnJNcTlCYmdRNVNPbHN6b1gxVllDdGUzbWFBdzdKb0NN?=
 =?utf-8?B?Vlg5eXpFK09QcjFjdzIybUxFdUJGSTdCaXZ4cUQ4aDBoWFhiSDlWMmdSK0I0?=
 =?utf-8?B?V3RDV2JFaXVlSjNOSktTbWNjQXVNWnM5RXRYTEZ5b09qcFc4MitzaEM5VWdQ?=
 =?utf-8?B?NjdrVHpEZ0szYmE1UXp4R1pnR0hiem1IbFRIYlNHMzlxQitGdVVKYjcxMXlN?=
 =?utf-8?B?STBwdFVSMVVST3M3MUtsTUc1clZNRHlFY1hwV20wbTJleUFQVlJjN29nS054?=
 =?utf-8?B?VlAyYWc0VUJYYmFwdWJxaTYyTkM0aGtLbHpWWng4by9KWUp5dE1QN09VRFJF?=
 =?utf-8?B?U2gweUxrZG5kYzZYYUlpUHI3V0ZuQzhMRzN0Q2R5YXprRVNNSkRkSjVTL1VJ?=
 =?utf-8?B?TVpQT0R6THUvUDdqT05CUlZDdE1YWno2ZHRmNDNhZ0pUdlc2alVldzNTemNY?=
 =?utf-8?B?SU9zeU9Bd0N0REE5NDhMYmRDaG5Sd2FhRVFzbG1paDNGZXpVOHNiTE1DazNI?=
 =?utf-8?B?bUp5cjlibUhSNEY1Q1Z4TnhBT1ZXaURoTDBNRTJvbEVHZ1B1V3dOYmpSMGN4?=
 =?utf-8?B?a3Y2QnBPRTJQOGcxMTgya2N6QjgvN3l2blhVS25PL3BZY251NTZXR241aTky?=
 =?utf-8?B?ZDlJOC9XVmdUQkdaK3ZuT1pwSWFieDY3QnkyQjRDT2tCNng0MUtkSStHTTZL?=
 =?utf-8?B?Z1ExeER5WVJsUjNNc1pCc3l5WmtwMHRaYW1OeURUS3lyZ28vL0xQbDhWd0dv?=
 =?utf-8?B?Y2NvcDBxN3JjT3hQY1NWaTMzdWo0SktzU25GZjQ0YmZsajMya2JMelBFbFEr?=
 =?utf-8?B?cUFRbEtVRExVYmNNZTN4ZkMxNVc3VEQvUWxUZlNZZldjaGJHWFg5T2xjUHNL?=
 =?utf-8?B?Yk1Nc1M1dG9tS2YwR1B6b2l6cnJZcFFPTUxqTFNGZkdqZXdtV2gzSTl4SkRX?=
 =?utf-8?B?Mm5zUWdGOXdyeldJWFFVVmN2bUxuOGd2QU5ubUlwQXVtSzlXZmM2aXVGR1JY?=
 =?utf-8?B?V3B3Y08rUnFldzFrUHdseGpvdGk1emZOOXN6K1N3MCtJUlE2MlE3RHJKOExX?=
 =?utf-8?B?bmxyMFFhaTV1REplN09XZE5VWGtTNGFrclBaNVhRc2hqMlozK2kvbE91bzlL?=
 =?utf-8?B?Y1UwcHFtcVhVdEpGam12eUpJRVlqTjJaNVN2dkVtcnBmaWNwQUp3azBtTXQ5?=
 =?utf-8?Q?z69U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(19052099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTRRcU16TXpKcUNISmdTWjhqNnVQYTA5UnNtQTF2SkhiVVcxbUJ4R2o5RERR?=
 =?utf-8?B?dEljMUhlWG43UC8yUFdtM2dMdUkvWHphK005TDRRQ2Q5TXR5TWdxMlFGU1dq?=
 =?utf-8?B?bE5yZ0ZkL3lJbG55VVU2SWlsTzR5bnRVaU1CcSsvNnhaeFBmK1NDa2xKTWh6?=
 =?utf-8?B?SkVJSGRnbFI2a2J2WGNrUUErS0xjbEFJWUJ4dlloWlVDa0JwWjZPenh0ODZK?=
 =?utf-8?B?TFEzcEg2aFl4QnVsUE1MS0psbUhlZFc4eG4xRWlIOGtYRzI2YmRhOTZZRUNq?=
 =?utf-8?B?UXk0RlluWnlBbDAwam1HMStCSkpXS1NmM2FQc1BpY0ZYZWc2VTMyaGxLNDJk?=
 =?utf-8?B?bDVHUGlDV1NUV2hSMFRQYktzWHZKL0pUcHdyTzVSWGZON3RIeUtsVkxHWklS?=
 =?utf-8?B?aHE4U3dvN2wxbjdNckh4L01LZnNMTHRIWnhmZTNFRFZpY2Z6aFlvWUE1VG1F?=
 =?utf-8?B?UmkwRXZ1UyszeEMxK3p2ZmwvWE10SXRrT1NyT1haRjlUWjhtaE5NR0loeVNX?=
 =?utf-8?B?K3RMSDNCaEpQRmZ4OFJ0cU1hWGc4ZjlBTTRGc1JtalE4NzhUekRRS244Ykcy?=
 =?utf-8?B?c1oxT3Q2MW9Tc21DdXNSeUw4YXFKUXk2N0poNDhzV0RZdkdVOVlaQzRTbU02?=
 =?utf-8?B?eDBMMWg5ZTNMN0s1aWpVeU5Ob2c5NTRZV2pLdWo3bTRUTHU4eDBtTk9ERTV5?=
 =?utf-8?B?b2t3S2Ztb0U1bk9SOFRtUFVtZWlBOFlnUVUzNWU4SnVlTzFvV2J3Sno2OWJk?=
 =?utf-8?B?VHZYNDB2QXV1QWlTVW9EUGM0QUZwWTRnUENkaTMvOTFrSk1hOXN1cGtXUzJh?=
 =?utf-8?B?U1ZmN2g2RmRxblZJZ2NsOE15VXdhSVd3eGQyRFJja0JpMm5yR0JUeDVqNTJa?=
 =?utf-8?B?bkpGQ2ZMcXc4dllFVlVzT0NURmx4eWNGNWNIME1wNHE4YzBHSjBCeG1ySXNa?=
 =?utf-8?B?THFZVnJyZnh2R0ZvNFdSZnJUM0plc1huWkhLbmp5VTc4aGF0RlI3YjRhQzZB?=
 =?utf-8?B?Yy9FSmFKTlFvYnFNZEdXZ0xDa0Q3NEdpbXRMeVpPVzNsWi9NSjdZK0R6N3p1?=
 =?utf-8?B?WjVHYUQ2ZlYrZG9KQUpYckdWWWd4WldacnJ0UEhhL3hTZVlKS2IrZU0xOW9m?=
 =?utf-8?B?dS8vc0tWd3ZVTGRTRVVyR3N4TnpLZEw5dWdQNnY1TlZwM2NXdkV2ajZITzNI?=
 =?utf-8?B?dXlPaDRYVWllZFFoZElscTZ6eFYyNlBqSm80L2dFMDFBWVBOc1NOcEpGNy85?=
 =?utf-8?B?aks2VEs4OEtJb25SVFlCbDJWTXdlQkJYVFhkN2NnMDFPbjhvTmFncnowWC9N?=
 =?utf-8?B?aWgyMjBFOFFneVZnV3o2NlB5MTRRcDZFakd0NXNFWlpkMW9tVkRkZndYK0pt?=
 =?utf-8?B?ZE1JdE9aRisva1M2VzBVbC9xVDRCVUJrcDNWbG96U1d6bWdzYmg3MnNoaDhO?=
 =?utf-8?B?TUFYbUNpem5XYmxaWVhOd0lYc21HUW9jTVpWSHlZVEt6b1Y5NlYzeFhuNHZG?=
 =?utf-8?B?UVlsSm5oT1J6V1ZNanBnS3dwMjlnMlU2WGJpRlNQZHIvQ09PMmFQb3BKdVpX?=
 =?utf-8?B?blB5cnVaYmxVQklmanBBdGh5Y0N0eDRleTY1QTk5aGdnWUl5Y1NSVEdOQ0Qz?=
 =?utf-8?B?bjByTWhwSDFvQUduRm9MQmlJV2pCQ2hhRkxPQ3ZWc0kvMFd3eUs1OCt1eDVN?=
 =?utf-8?B?a1YrZS9aTFBkQW1lT09LOTkrdUJXMmRnUDhGWU1JWmwxMVh5U2FXL3RsSk1S?=
 =?utf-8?B?UlNadUttUkh0SjNndk5GdTduWU9vbmJONEJmOC90K01lajM1bG1DRlhpUllO?=
 =?utf-8?B?QzVtcFJBSW5nLzA1TzhHNVFSalNMWHBRRld6U3VuUGhuTzJDdWo4R1ZsNmx4?=
 =?utf-8?B?dUdCbTVqVEk3Q3F5L3hSRXYxSUYxUEV1MVZyRmhHaUYvcEJiOUExU3VGMkdC?=
 =?utf-8?B?WHp3bWNFTnBPWmZGbXNLTk5iVUVGZkcxaEI4K1ZmMTJYZGN3OGNkRVdnWEhV?=
 =?utf-8?B?S1lxREZiTkZaMkFtRlljb29kaHZCb243Z2Z4VmR6SHRaVEpSSUhld005NE5v?=
 =?utf-8?B?Y2c2dFZOQzRiU3RoNlhDOUMxMkFUQ3RhM1BKZ2xWTGlEQkNsUWxQM3dPWDRq?=
 =?utf-8?B?S05CNllaOWtjOTdDcGkzaXVXL3B3YU1oY0FQRFVyTG1IU05RMnVWOEZoME1U?=
 =?utf-8?B?dWZkaHdtanJ4cDNMNjUrKzJrc0lwUnFVVjY0eW9lcTN5MlFTeE1wM2syUVE3?=
 =?utf-8?B?MWtpYUo4WDRsdmxWaWJ5OVdmbWFGV3VYbVhYeDNQMm96SHRCZEFvNnpDa1RN?=
 =?utf-8?B?bzc4VVpqTllqRERibUdKeUNBVHhRNUlqOXMwOUswbTdjSHdCVU93dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca3520b-655f-43dc-34d1-08de6dea5481
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 06:03:54.6470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouBwjcTBQKxpmWX6SNcmdiJeDlT20VWSdidY6++/tW/U6kqrGir1q7LONG3la2zzO9r9GFJut+dVc09puy2POg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: E485B148EE8
X-Rspamd-Action: no action

Hi Matthew,

On 2/10/2026 9:56 PM, Matthew Auld wrote:
> On 09/02/2026 08:30, Arunpravin Paneer Selvam wrote:
>> Large alignment requests previously forced the buddy allocator to 
>> search by
>> alignment order, which often caused higher-order free blocks to be 
>> split even
>> when a suitably aligned smaller region already existed within them. 
>> This led
>> to excessive fragmentation, especially for workloads requesting small 
>> sizes
>> with large alignment constraints.
>>
>> This change prioritizes the requested allocation size during the 
>> search and
>> uses an augmented RB-tree field (subtree_max_alignment) to 
>> efficiently locate
>> free blocks that satisfy both size and offset-alignment requirements. 
>> As a
>> result, the allocator can directly select an aligned sub-region without
>> splitting larger blocks unnecessarily.
>>
>> A practical example is the VKCTS test
>> dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which 
>> repeatedly
>> allocates 8 KiB buffers with a 256 KiB alignment. Previously, such 
>> allocations
>> caused large blocks to be split aggressively, despite smaller aligned 
>> regions
>> being sufficient. With this change, those aligned regions are reused 
>> directly,
>> significantly reducing fragmentation.
>>
>> This improvement is visible in the amdgpu VRAM buddy allocator state
>> (/sys/kernel/debug/dri/1/amdgpu_vram_mm). After the change, 
>> higher-order blocks
>> are preserved and the number of low-order fragments is substantially 
>> reduced.
>>
>> Before:
>>    order- 5 free: 1936 MiB, blocks: 15490
>>    order- 4 free:  967 MiB, blocks: 15486
>>    order- 3 free:  483 MiB, blocks: 15485
>>    order- 2 free:  241 MiB, blocks: 15486
>>    order- 1 free:  241 MiB, blocks: 30948
>>
>> After:
>>    order- 5 free:  493 MiB, blocks:  3941
>>    order- 4 free:  246 MiB, blocks:  3943
>>    order- 3 free:  123 MiB, blocks:  4101
>>    order- 2 free:   61 MiB, blocks:  4101
>>    order- 1 free:   61 MiB, blocks:  8018
>>
>> By avoiding unnecessary splits, this change improves allocator 
>> efficiency and
>> helps maintain larger contiguous free regions under heavy offset-aligned
>> allocation workloads.
>>
>> v2:(Matthew)
>>    - Update augmented information along the path to the inserted node.
>>
>> v3:
>>    - Move the patch to gpu/buddy.c file.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/buddy.c       | 271 +++++++++++++++++++++++++++++++-------
>>   include/linux/gpu_buddy.h |   2 +
>>   2 files changed, 228 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
>> index 603c59a2013a..3a25eed050ba 100644
>> --- a/drivers/gpu/buddy.c
>> +++ b/drivers/gpu/buddy.c
>> @@ -14,6 +14,16 @@
>>     static struct kmem_cache *slab_blocks;
>>   +static unsigned int gpu_buddy_block_offset_alignment(struct 
>> gpu_buddy_block *block)
>> +{
>> +    return __ffs(gpu_buddy_block_offset(block));
>
> __ffs() will be undefined for offset zero it seems, so might blow up 
> in some strange way. I guess just return the max possible alignment 
> here if offset is zero? Also are we meant to use __ffs64() here?
Yes, I had the same concern about __ffs() being undefined when the 
offset is zero. My initial thought was to derive the maximum possible 
alignment from the allocator size using ilog2(mm->size) and return that 
value for the zero-offset case.

But, RB_DECLARE_CALLBACKS_MAX() requires the compute callback 
(gpu_buddy_block_offset_alignment()) to accept only a single struct 
gpu_buddy_block * argument. It does not provide a mechanism to pass 
additional context such as the associated struct gpu_buddy *mm. As a 
result, deriving the alignment from allocator state (e.g., via 
ilog2(mm->size)) is not directly feasible within this callback. When I 
tested the zero-offset case locally, __ffs() returned 64, which 
effectively corresponds to the maximum alignment for a u64 offset. Based 
on that observation, I initially left the __ffs() call unchanged for the 
zero case as well.

One possible alternative would be to store a pointer to struct gpu_buddy 
inside each gpu_buddy_block.

All other review comments have been addressed, and I will send a v4 once 
this point is clarified.

Regards,
Arun.
>
>> +}
>> +
>> +RB_DECLARE_CALLBACKS_MAX(static, gpu_buddy_augment_cb,
>> +             struct gpu_buddy_block, rb,
>> +             unsigned int, subtree_max_alignment,
>> +             gpu_buddy_block_offset_alignment);
>> +
>>   static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
>>                              struct gpu_buddy_block *parent,
>>                              unsigned int order,
>> @@ -31,6 +41,9 @@ static struct gpu_buddy_block 
>> *gpu_block_alloc(struct gpu_buddy *mm,
>>       block->header |= order;
>>       block->parent = parent;
>>   +    block->subtree_max_alignment =
>> +        gpu_buddy_block_offset_alignment(block);
>> +
>>       RB_CLEAR_NODE(&block->rb);
>>         BUG_ON(block->header & GPU_BUDDY_HEADER_UNUSED);
>> @@ -67,26 +80,42 @@ static bool rbtree_is_empty(struct rb_root *root)
>>       return RB_EMPTY_ROOT(root);
>>   }
>>   -static bool gpu_buddy_block_offset_less(const struct 
>> gpu_buddy_block *block,
>> -                    const struct gpu_buddy_block *node)
>> -{
>> -    return gpu_buddy_block_offset(block) < 
>> gpu_buddy_block_offset(node);
>> -}
>> -
>> -static bool rbtree_block_offset_less(struct rb_node *block,
>> -                     const struct rb_node *node)
>> -{
>> -    return gpu_buddy_block_offset_less(rbtree_get_free_block(block),
>> -                       rbtree_get_free_block(node));
>> -}
>> -
>>   static void rbtree_insert(struct gpu_buddy *mm,
>>                 struct gpu_buddy_block *block,
>>                 enum gpu_buddy_free_tree tree)
>>   {
>> -    rb_add(&block->rb,
>> - &mm->free_trees[tree][gpu_buddy_block_order(block)],
>> -           rbtree_block_offset_less);
>> +    struct rb_node **link, *parent = NULL;
>> +    unsigned int block_alignment, order;
>> +    struct gpu_buddy_block *node;
>> +    struct rb_root *root;
>> +
>> +    order = gpu_buddy_block_order(block);
>> +    block_alignment = gpu_buddy_block_offset_alignment(block);
>> +
>> +    root = &mm->free_trees[tree][order];
>> +    link = &root->rb_node;
>> +
>> +    while (*link) {
>> +        parent = *link;
>> +        node = rbtree_get_free_block(parent);
>> +        /*
>> +         * Manual augmentation update during insertion traversal. 
>> Required
>> +         * because rb_insert_augmented() only calls rotate callback 
>> during
>> +         * rotations. This ensures all ancestors on the insertion 
>> path have
>> +         * correct subtree_max_alignment values.
>> +         */
>> +        if (node->subtree_max_alignment < block_alignment)
>> +            node->subtree_max_alignment = block_alignment;
>> +
>> +        if (gpu_buddy_block_offset(block) < 
>> gpu_buddy_block_offset(node))
>> +            link = &parent->rb_left;
>> +        else
>> +            link = &parent->rb_right;
>> +    }
>> +
>> +    block->subtree_max_alignment = block_alignment;
>> +    rb_link_node(&block->rb, parent, link);
>> +    rb_insert_augmented(&block->rb, root, &gpu_buddy_augment_cb);
>>   }
>>     static void rbtree_remove(struct gpu_buddy *mm,
>> @@ -99,7 +128,7 @@ static void rbtree_remove(struct gpu_buddy *mm,
>>       tree = get_block_tree(block);
>>       root = &mm->free_trees[tree][order];
>>   -    rb_erase(&block->rb, root);
>> +    rb_erase_augmented(&block->rb, root, &gpu_buddy_augment_cb);
>>       RB_CLEAR_NODE(&block->rb);
>>   }
>>   @@ -790,6 +819,132 @@ alloc_from_freetree(struct gpu_buddy *mm,
>>       return ERR_PTR(err);
>>   }
>>   +static bool
>> +gpu_buddy_can_offset_align(u64 size, u64 min_block_size)
>> +{
>> +    return size < min_block_size && is_power_of_2(size);
>> +}
>> +
>> +static bool gpu_buddy_subtree_can_satisfy(struct rb_node *node,
>> +                      unsigned int alignment)
>> +{
>> +    struct gpu_buddy_block *block;
>> +
>> +    if (!node)
>> +        return false;
>
> All callers seem to handle null case already, so could potentially 
> drop this?
>
>> +
>> +    block = rbtree_get_free_block(node);
>> +    return block->subtree_max_alignment >= alignment;
>> +}
>> +
>> +static struct gpu_buddy_block *
>> +gpu_buddy_find_block_aligned(struct gpu_buddy *mm,
>> +                 enum gpu_buddy_free_tree tree,
>> +                 unsigned int order,
>> +                 unsigned int tmp,
>> +                 unsigned int alignment,
>> +                 unsigned long flags)
>> +{
>> +    struct rb_root *root = &mm->free_trees[tree][tmp];
>> +    struct rb_node *rb = root->rb_node;
>> +
>> +    while (rb) {
>> +        struct gpu_buddy_block *block = rbtree_get_free_block(rb);
>> +        struct rb_node *left_node = rb->rb_left, *right_node = 
>> rb->rb_right;
>> +
>> +        if (right_node) {
>> +            if (gpu_buddy_subtree_can_satisfy(right_node, alignment)) {
>> +                rb = right_node;
>> +                continue;
>> +            }
>> +        }
>> +
>> +        if (gpu_buddy_block_order(block) >= order &&
>
> Is this not always true? With that we can drop order, or better yet 
> s/tmp/order/ ?
>
>> + __ffs(gpu_buddy_block_offset(block)) >= alignment)
>
> Same here with undefined offset zero case. I guess also use the helper.
>
>> +            return block;
>> +
>> +        if (left_node) {
>> +            if (gpu_buddy_subtree_can_satisfy(left_node, alignment)) {
>> +                rb = left_node;
>> +                continue;
>> +            }
>> +        }
>> +
>> +        break;
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +static struct gpu_buddy_block *
>> +gpu_buddy_offset_aligned_allocation(struct gpu_buddy *mm,
>> +                    u64 size,
>> +                    u64 min_block_size,
>> +                    unsigned long flags)
>> +{
>> +    struct gpu_buddy_block *block = NULL;
>> +    unsigned int order, tmp, alignment;
>> +    struct gpu_buddy_block *buddy;
>> +    enum gpu_buddy_free_tree tree;
>> +    unsigned long pages;
>> +    int err;
>> +
>> +    alignment = ilog2(min_block_size);
>> +    pages = size >> ilog2(mm->chunk_size);
>> +    order = fls(pages) - 1;
>> +
>> +    tree = (flags & GPU_BUDDY_CLEAR_ALLOCATION) ?
>> +        GPU_BUDDY_CLEAR_TREE : GPU_BUDDY_DIRTY_TREE;
>> +
>> +    for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> +        block = gpu_buddy_find_block_aligned(mm, tree, order,
>> +                             tmp, alignment, flags);
>> +        if (!block) {
>> +            tree = (tree == GPU_BUDDY_CLEAR_TREE) ?
>> +                GPU_BUDDY_DIRTY_TREE : GPU_BUDDY_CLEAR_TREE;
>> +            block = gpu_buddy_find_block_aligned(mm, tree, order,
>> +                                 tmp, alignment, flags);
>> +        }
>> +
>> +        if (block)
>> +            break;
>> +    }
>> +
>> +    if (!block)
>> +        return ERR_PTR(-ENOSPC);
>> +
>> +    while (gpu_buddy_block_order(block) > order) {
>> +        struct gpu_buddy_block *left, *right;
>> +
>> +        err = split_block(mm, block);
>> +        if (unlikely(err))
>> +            goto err_undo;
>> +
>> +        left  = block->left;
>> +        right = block->right;
>> +
>> +        if (__ffs(gpu_buddy_block_offset(right)) >= alignment)
>
> Might be better to use the helper for this?
>
>> +            block = right;
>> +        else
>> +            block = left;
>> +    }
>> +
>> +    return block;
>> +
>> +err_undo:
>> +    /*
>> +     * We really don't want to leave around a bunch of split blocks, 
>> since
>> +     * bigger is better, so make sure we merge everything back 
>> before we
>> +     * free the allocated blocks.
>> +     */
>> +    buddy = __get_buddy(block);
>> +    if (buddy &&
>> +        (gpu_buddy_block_is_free(block) &&
>> +         gpu_buddy_block_is_free(buddy)))
>> +        __gpu_buddy_free(mm, block, false);
>> +    return ERR_PTR(err);
>> +}
>> +
>>   static int __alloc_range(struct gpu_buddy *mm,
>>                struct list_head *dfs,
>>                u64 start, u64 size,
>> @@ -1059,6 +1214,7 @@ EXPORT_SYMBOL(gpu_buddy_block_trim);
>>   static struct gpu_buddy_block *
>>   __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>>                u64 start, u64 end,
>> +             u64 size, u64 min_block_size,
>>                unsigned int order,
>>                unsigned long flags)
>>   {
>> @@ -1066,6 +1222,11 @@ __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>>           /* Allocate traversing within the range */
>>           return  __gpu_buddy_alloc_range_bias(mm, start, end,
>>                                order, flags);
>> +    else if (size < min_block_size)
>> +        /* Allocate from an offset-aligned region without size 
>> rounding */
>> +        return gpu_buddy_offset_aligned_allocation(mm, size,
>> +                               min_block_size,
>> +                               flags);
>>       else
>>           /* Allocate from freetree */
>>           return alloc_from_freetree(mm, order, flags);
>> @@ -1137,8 +1298,11 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>>       if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION) {
>>           size = roundup_pow_of_two(size);
>>           min_block_size = size;
>> -    /* Align size value to min_block_size */
>> -    } else if (!IS_ALIGNED(size, min_block_size)) {
>> +        /*
>> +         * Normalize the requested size to min_block_size for 
>> regular allocations.
>> +         * Offset-aligned allocations intentionally skip size rounding.
>> +         */
>> +    } else if (!gpu_buddy_can_offset_align(size, min_block_size)) {
>>           size = round_up(size, min_block_size);
>>       }
>>   @@ -1158,43 +1322,60 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy 
>> *mm,
>>       do {
>>           order = min(order, (unsigned int)fls(pages) - 1);
>>           BUG_ON(order > mm->max_order);
>> -        BUG_ON(order < min_order);
>> +        /*
>> +         * Regular allocations must not allocate blocks smaller than 
>> min_block_size.
>> +         * Offset-aligned allocations deliberately bypass this 
>> constraint.
>> +         */
>> +        BUG_ON(size >= min_block_size && order < min_order);
>>             do {
>> +            unsigned int fallback_order;
>> +
>>               block = __gpu_buddy_alloc_blocks(mm, start,
>>                                end,
>> +                             size,
>> +                             min_block_size,
>>                                order,
>>                                flags);
>>               if (!IS_ERR(block))
>>                   break;
>>   -            if (order-- == min_order) {
>> -                /* Try allocation through force merge method */
>> -                if (mm->clear_avail &&
>> -                    !__force_merge(mm, start, end, min_order)) {
>> -                    block = __gpu_buddy_alloc_blocks(mm, start,
>> -                                     end,
>> -                                     min_order,
>> -                                     flags);
>> -                    if (!IS_ERR(block)) {
>> -                        order = min_order;
>> -                        break;
>> -                    }
>> -                }
>> +            if (size < min_block_size) {
>> +                fallback_order = order;
>> +            } else if (order == min_order) {
>> +                fallback_order = min_order;
>> +            } else {
>> +                order--;
>> +                continue;
>> +            }
>>   -                /*
>> -                 * Try contiguous block allocation through
>> -                 * try harder method.
>> -                 */
>> -                if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
>> -                    !(flags & GPU_BUDDY_RANGE_ALLOCATION))
>> -                    return __alloc_contig_try_harder(mm,
>> -                                     original_size,
>> -                                     original_min_size,
>> -                                     blocks);
>> -                err = -ENOSPC;
>> -                goto err_free;
>> +            /* Try allocation through force merge method */
>> +            if (mm->clear_avail &&
>> +                !__force_merge(mm, start, end, fallback_order)) {
>> +                block = __gpu_buddy_alloc_blocks(mm, start,
>> +                                 end,
>> +                                 size,
>> +                                 min_block_size,
>> +                                 fallback_order,
>> +                                 flags);
>> +                if (!IS_ERR(block)) {
>> +                    order = fallback_order;
>> +                    break;
>> +                }
>>               }
>> +
>> +            /*
>> +             * Try contiguous block allocation through
>> +             * try harder method.
>> +             */
>> +            if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
>> +                !(flags & GPU_BUDDY_RANGE_ALLOCATION))
>> +                return __alloc_contig_try_harder(mm,
>> +                                 original_size,
>> +                                 original_min_size,
>> +                                 blocks);
>> +            err = -ENOSPC;
>> +            goto err_free;
>>           } while (1);
>>             mark_allocated(mm, block);
>> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
>> index 07ac65db6d2e..7ad817c69ec6 100644
>> --- a/include/linux/gpu_buddy.h
>> +++ b/include/linux/gpu_buddy.h
>> @@ -11,6 +11,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/sched.h>
>>   #include <linux/rbtree.h>
>> +#include <linux/rbtree_augmented.h>
>>     #define GPU_BUDDY_RANGE_ALLOCATION        BIT(0)
>>   #define GPU_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>> @@ -58,6 +59,7 @@ struct gpu_buddy_block {
>>       };
>>         struct list_head tmp_link;
>> +    unsigned int subtree_max_alignment;
>>   };
>>     /* Order-zero must be at least SZ_4K */
>>
>> base-commit: 9d757669b2b22cd224c334924f798393ffca537c
>

