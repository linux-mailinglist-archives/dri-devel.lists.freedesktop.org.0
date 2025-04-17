Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FFAA921B1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C9B10EB4F;
	Thu, 17 Apr 2025 15:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NOeV2v4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C76210EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FE+7DNzz47FtnR223xvNAGicf7mzTSrYo4yzyjmeLvJgp3dzkEvPootz95A0HfHmMDOx/YFctK2RCjcjQiimXIW0+i94v3pv7LNZzjrHrr6v6PozkBvkgUXh/2/tDYn9YrmcyYPc2d4Gll7pluvUWDjQvN/MCuj9GPQTpHNR/L3yhILhZVtXL1k/VSBLBum651LWUTtQDc0kfg1TpdemQSjMPYssTSnSIKC+xycv7qyO3D5qmEeB/CEvOGGs4QgcH5FR3yyT1/7piQFV+9eIe48i4Bb1HvRqJ+2SWalIz9WpZxo9Fk7z+NaTcbhvHhcoBsxzaudSFw5oYOVSSASV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btGeTh/88ExStNSgt6CKiNz6JULHX4XzUi6m+IzxOEQ=;
 b=eNIMFPu1q8dE46tyoPJLve4kc6eqiYzYFw+Q7jrZg+w/mb0G3j9ii4c5x6iyPcHPNi6rDT3Jquca8FVvBZhcQj8n3wxQbQ1wLD7YwHg1KE6dhTgTZq1NxxuRsMC5ejnwSDc8/QVyj+2ZzisfJkuu+J3k5bnrnasx610kJEXLXJyyTZ4RJSVHjoWMmsy8p0n69UGSqnCWqkfRagCczZOkrjnf69IelQq7K5UU13TUwGydKqBfmHpJeHyzkE0ojlex4ENc2SKY8WoKabeIL0zxt9Cp6XyOrG8mAFNu5Z4qIGNEKzLL2AFnFIjRvndVz9k78pK2YrYMGCgZP+4xme//JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btGeTh/88ExStNSgt6CKiNz6JULHX4XzUi6m+IzxOEQ=;
 b=NOeV2v4vJgpAzwfa7xoLJQBzEKe2UapZ4JqJj2TP2uy1ATOpIK1QRc0GRAjMmEI/5x2tz8WKvXT4EmNajD8unOlnegvwuOxjj1Ezwwmq+4LEwdVg99ZBDDdVYpfPgIQcO8qAD6dx0DHLm/xwbESAbgHvtA1jG0c2og4SdBvDifw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by PH7PR12MB7913.namprd12.prod.outlook.com (2603:10b6:510:27b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Thu, 17 Apr
 2025 15:32:39 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 15:32:39 +0000
Message-ID: <5f49d271-fdf3-3b52-664a-3f576bc3c61e@amd.com>
Date: Thu, 17 Apr 2025 21:02:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
 ogabbay@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de,
 praveen.jain@amd.com, harpreet.anand@amd.com, nikhil.agarwal@amd.com,
 srivatsa@csail.mit.edu, code@tyhicks.com, ptsm@linux.microsoft.com,
 linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
 keyrings@vger.kernel.org
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
 <Z_imAnYu1hGRb8An@gondor.apana.org.au>
 <4f365fae-aae2-a0df-e8e9-268b536378b1@amd.com>
 <Z_nAo7UpzBqeXLbA@gondor.apana.org.au>
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <Z_nAo7UpzBqeXLbA@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0107.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::10) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|PH7PR12MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2038d8-331f-4201-5269-08dd7dc515f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTQ5VndQRktUQThnUGRpVTBXRUE5blNsM3ZTV2JhWmtFL0FONk9zbzVvUzNW?=
 =?utf-8?B?bXNKL2sxVlk1bm56YjFMNCt6SFo3VTJaL05jTzhWY3UwMC9FVGlIT2ZBWnJx?=
 =?utf-8?B?YW5vL0NrVFRwSG9OZkpMVHRyWDRWV0FZd3U3RDlza1l1RzVqeURCVG1OaFdU?=
 =?utf-8?B?WnVXN0VDN2hzYmxraVJmRWVjZDc3Z0pCeTFWRlBaMCswcTZQTjRjMEtJczY2?=
 =?utf-8?B?ZlB0RDdOdkRGSmtXczNReEUrZ0JXcmdzUjNxR0QzandQUmtDcFQxcDJSZzc1?=
 =?utf-8?B?RVFXRDBNLytqaEVLdmJrZGtmTzBjbXo5Z1Erc1IzYi9nTnJRQ1hTQ2pOOGor?=
 =?utf-8?B?WWlVdk5BZUxUaXAyOVpYM3NVVDUwQWtKejg2NStpZ2JxUkRPWE03ejM1MHVi?=
 =?utf-8?B?ZlhLS2JYVUczWTB1OWl5ci9rZHhYV29mSHdEeWttVmJVVm9GeHpYOHBwZnRx?=
 =?utf-8?B?NFhUbitMVStGeHRmZ1BuK1BaUFQ2OTVrcitsSmxtTzBTN0pKNEcrVXp2RGF2?=
 =?utf-8?B?YnJJc3gwL3R1RW5HZE1Ickw3UnZCZDdTSXloS3g3OVBVZlpCd3p2TGNUck5n?=
 =?utf-8?B?UUNKSjU1TkN6NXFRTVlaMXA0eEFIakFCSUFUbzZrQ21aUVNzTDFtaGF6MHAr?=
 =?utf-8?B?ODFtZXd5Y0dFNFp2WjVvZUJnSVZkOWhJanZwVE14ekUwOGNoQWNVWGJaUnFr?=
 =?utf-8?B?elQ0YitaS0FIZmlISW5nME8wR3ZnQlFHbzViYllTK3VYU3FKb0IvZWNHaUVD?=
 =?utf-8?B?NDBZaHcwVXRXWnIwUmR5NFJPUW1ucnA4L0FibXcySVRSZHk3a3pFMGc5VXdL?=
 =?utf-8?B?U09XdldzTTVjQ2JGQmYrc2ZVUGtMN3haTHRvSGMyNkoyM1l5V0FtenpXOENS?=
 =?utf-8?B?WkFVZTlodm1rQWdyK1JBWlZITWZLQjJaTi90VFY0Y2NKUmNGSUhjTDdpWGZY?=
 =?utf-8?B?Mm45M0ZiY1laVUtVdVBIYXdwUzY1YlZBL1BBQmdPUnNLdk5waDhXUytuT2t2?=
 =?utf-8?B?U2FVN3VyWVVRVXA3cW9YWWROVW9QQkdsenEycE9DL1g4d3REYVVSQ3BmQ243?=
 =?utf-8?B?VWZXYjVqV0ZnVk5JR3R2Ky9CZTJ0d1E1QW53QkcrWDJBZmwyTXVvSXEvd3pu?=
 =?utf-8?B?T280UnNjNHNkN1krbHFLZ1pxbGx2cDcrWDFJc0d3akdOSmF5Sk01OW9tVlRl?=
 =?utf-8?B?SjhyeFRXR0kzSFNOanpKUGI4Z2RqSERUTzFRZ1cwa29qUVVwVjVnR3RqbWho?=
 =?utf-8?B?dkxRN1dZSHFYdEFPSHl1ajRVOVFLTFV2ZVpQbWIveUZsT052RFROVHcvdy9n?=
 =?utf-8?B?RUlxZ1JJVjZRU0oxY0k0RGxTQlZ6YTFVd3BrTVRPdEhDSFNNcDhnQWtTeXV5?=
 =?utf-8?B?MzZmeDJLak9yM1ZkbmVqdGpJRFUzS0FzdG9oM3E4RE9PajVRamZzVUVaNm5N?=
 =?utf-8?B?UkxlaExURmdrZ1FkNWhtOXdpNWxmMGpWNEJYWUFnVnV3cTlGM0hMUFFsdkdt?=
 =?utf-8?B?M1dnMDlYSHNsYlRDUjUwMWI5K2JHZnVubHpZeGpOdTNlblRtYk1OREFZZjdY?=
 =?utf-8?B?Y3puM1NXZ0pkQzk1UXhyWXpYZVVxWlJyREVzYVFuOUVTT3RpRnpjSHk3dndu?=
 =?utf-8?B?RkZNYVllMG11UUt0cmVJb0tCWkNsU2oram1CVVRhVjljbVA5bVZiYjk5YTBD?=
 =?utf-8?B?Y0ZuZ010bEt6UDhvbFhLYjRYVnpDTkdjaU9lTDlxV0dvUWVyTk4rNjBQNXF4?=
 =?utf-8?B?N3pDTFJBODByRlloeFlQNDMvTi8wTERtWjlRc2dGQkhqQlhKVmxjbGZJeTlx?=
 =?utf-8?B?SS9JRGRWMmRuenhwL3JPTmY2N2lEbllJYWRnWllLYldyRmNkWmJ4aC9LWW0z?=
 =?utf-8?B?TFdnc3M3bDQxRyszbGkvTHFEUWo1K1ZqcHc1MHFueitZRGhhYlNtTTFHUGEy?=
 =?utf-8?Q?c+hKWQ91TeE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9193.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU1lL3JXVFJVZlB0SEJydlAvSThwOEJ6eEV1RlgyS013RlZjYmJERW5UR1pt?=
 =?utf-8?B?RllEcGJ1d2hjRUFTUzFQRUZXb1RxQ2x0TXlNOUxLeHVWdC9hbEFWTzMyOXA2?=
 =?utf-8?B?cW16SjhlK29RYnJiZUR1dEFVUlRKbW02WXBSaUZmaDV3V2FYdDRsRjRJUmxV?=
 =?utf-8?B?WkxKOGtqWEVaYVRXdFJnckMwSWlUZ3M2YmhsNk5iSXgxdVQ0YmVQY1B4NENu?=
 =?utf-8?B?WmpHQUhLNDNhTHYyUFZWaE10Njc1WWdkelhYYUV5K245TitMWjhsT2RQK0RK?=
 =?utf-8?B?bEdaOVdmWmpzUkh3N0JnL2VUbnIvQ3NxREZtS0pnZW9HbkRGZ2xuMFdBdThj?=
 =?utf-8?B?aUxwQUpYeW41aTVQaGx1UWp5VFRiS2dQckpTMmk0UkMxcDhLMkhvQ0lWZHRl?=
 =?utf-8?B?VlVZbGVscHpOc3dPYUw1ekdEdVJpZU8yMVBBdzdsRCs5UmR6SGcyNFR5Z0d5?=
 =?utf-8?B?cGRGdHdmQVlIcjRCWHl5Q2VHY0dMU05rVEpPVWVLTkFSZ0tEWGZYcG56T3Jh?=
 =?utf-8?B?cU1XOEpWSlpkT1lPakxhYlc4RnBxNVU4em9YbE42V3VPQThNcDU0MUkvMFB4?=
 =?utf-8?B?OVhNMi9HKzFjV3dqSGxneWdFSS85cU12T2JtMjZMSkd1RkJ5WHY4ZENBK1ZG?=
 =?utf-8?B?bGZ1OHhUNDJEaDJROExLZ1RVK3N1aFBENnV4VWo5WXAycEpodGEwWUtyTlhu?=
 =?utf-8?B?Tmx1OTNoWlNFTkJrOFRpZ1pGZWRMWmtWdG4yaklKbFdGZUV4WDZnUmJiRFp1?=
 =?utf-8?B?bmJmWHJzMllVWVRiNmhFeERYSXFaK2c0eC9Gd1Nwd3pMTW5WMEVnMFZVdFhQ?=
 =?utf-8?B?T0lYc2pReGlHbU9UM3BVUUJvSEdWYWhQcXhBUUlJTEJsSnpuRDBlcTF0N3hQ?=
 =?utf-8?B?amx4cGRsUExBUG5zRllsS1U5REUyZlNrSldqV0VtYWNiRmlFZ0JCeUdXbnlO?=
 =?utf-8?B?djBPdC9SaTZveE05eFN0RzZzY083Z2ZJTGxRRWJwNnB2d01TdTYvOFp4TllJ?=
 =?utf-8?B?L2I0UXFFMWY3OFlCYTBLRnFObFpEWU5YWHRPR0pMVFRBMDVTNjJ1cnMvbGJi?=
 =?utf-8?B?M1ozL1hucTR2aE5qcjA4RHZtSjN5M0QzUThXZVBneVd3bWRtYWxKMFJZWXo0?=
 =?utf-8?B?RnZadTYrNEZYeHA1YkExSGZvVDB2T0NvVS83aVNiM21FL2Fzc2VVZEdSUE14?=
 =?utf-8?B?UDlBZ1dXTlN4R0xlbStrR2tkak5BOFpjQ1lTNVpQVzdUNkZHUEtvbXlkTDB3?=
 =?utf-8?B?MzJJVk00dTZXcGkrcytjeTlyMlUrczlpZWZKN0kyUmdMN3F3KytnaUswTHFJ?=
 =?utf-8?B?eDI3RkN0aWtOSFA1WnRPVGM3ZjlVSmJ2cTZMMzA2SlYzUGxlbVo4SVdJZjJF?=
 =?utf-8?B?bFptaVJYQkp1bUlQT1lqbFhJcDRsMkl2RGYyLzVCMmhVR1JObGw4VGllSExN?=
 =?utf-8?B?VlJRMU1tZTlWZllGZU9zSzlYRHpjODhOOTlUd3RNR2k1eU5IVEtVa1JldjBB?=
 =?utf-8?B?NEZ2UFdFWktXNkFOWFZRc21CZ3JaWitCUjZ1L1VxODlWanJoZTRNSWxDSWE3?=
 =?utf-8?B?OUtDMkVFMlR4NnlrVTRhbE1QeEYxNDR3T0ZpSmtOQ2REMFhWdXczb3ZTSjd1?=
 =?utf-8?B?WlJWSjhabWdHREw1aFZoU09wQ2pqMXVqMm45RjFjbTVtUWJWS05xUHpkV1NO?=
 =?utf-8?B?dUtzdjNteW04RVIyejc2elgwRU5HejRYTEM1Sy9JM1JudHQ4NENXcWpyYlRU?=
 =?utf-8?B?WFRPQ0xBcmY2NkJpZmtlOGFWR0FqRnBWMFpzMCtVbjNRd0NOWHBBd29BVXF6?=
 =?utf-8?B?Rk83UXJKNW00VGR4RTFiQk0xS0IrV0hIQzRzak9MbTRVenpUbzVlbWgyRTF5?=
 =?utf-8?B?c2pXMVdkMDZoTCs1cTNqVVZXR2w2aDJtanVBWlQ5eUt4bTI0K29ubHNKMmE4?=
 =?utf-8?B?U1pFd3BxVXhKZFNodEJlZ3pLVTR2S2FESzNpVDExYlJrRVIxT0ZLTU1FMHA0?=
 =?utf-8?B?YUVjL0xoZ3A0aUdJMTV0VGpYNG56bVpwc3dpQzI5QkpiK0hHRXZ4WHRoS2Uz?=
 =?utf-8?B?eUdzTzBLdjJqQWpSaHpQT1diTE1xWU1RM0FGck9zdVFjNHNKR2ZNbUtBNHlL?=
 =?utf-8?Q?/gnMIfZHYZd4L73b36SL+56Ir?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2038d8-331f-4201-5269-08dd7dc515f5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:32:39.0952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ph6xE0tQRd0aV8VhQZelv0/oFGyvDNITMaDB1mJEk0NIQbk0LXQ/004qVtX8YtlH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7913
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



On 12-04-2025 06:53, Herbert Xu wrote:
> On Fri, Apr 11, 2025 at 11:50:54PM +0530, Gupta, Nipun wrote:
>>
>> AFAIU after looking into it, the keyring subsystem is not to perform the
>> data operations, but for managing keys for these operations. Kindly correct
>> me if I am wrong here.
> 
> Have a look at
> 
> security/keys/keyctl_pkey.c

Thanks for pointing out to the C file, but as these these system calls 
can support only synchronous operations, precludes their use for 
asynchronous operations. In the TLS handshakes, where multiple 
connections occur simultaneously, asynchronous operations are 
beneficial. OpenSSL ASYNC support can very well utilizes the 
asynchronous operations while establishing multiple TLS connections.

Thanks,
Nipun
