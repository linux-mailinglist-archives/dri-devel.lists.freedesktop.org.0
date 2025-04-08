Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93486A805E4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F9810E67F;
	Tue,  8 Apr 2025 12:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1C3EvZqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A759A10E67E;
 Tue,  8 Apr 2025 12:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elUCMuyOhDQc9msuQbO4xoVGo8zk88Ivi2NAbhhgV4jKTJXlV0S+m1ibVOVIjGDf/Xj34AAB3x4JkDZgQQtiP8FpVok1Zxy2Vxch9j2B0ihsJbcRXdS9SFKAgmSwpRxUP9TCI7iHCOoWHkB1BHgTNJM+777daRo3EzLayt4BHG6R7GMDfK4muM2WP4TXnjogdwHnyWLrzhDpHTJAy4V7CWC//95ABmNvDSGLHRIGwCR5A4TiVlGCquu3r+dy1G6W/WYJy2wjA5X60E7kQmSSDJsSlopcxd0sEGQAqU6RS7j9JZAMBS7sox+lF32wwLiN6YeBCOHeJaA0G3npkfCVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScoOMxlOeXfLbTpbb7n4xVigLOkf2ZEqOQMGlB030po=;
 b=g/vqhNj2XplCR0SoZV7j5bfUtzmO91ruaA/wp5wMpMhefXhwIaMWn+nfK9KP7HfNp01558Gt3Lnypis0yOWGnzMmAdYqOBFeD4IbW3LTC+7IhSYwiZiAW3I9CT1QWNiaV+Cj6sLUIwY7VZf8Ud7qfAk9kngUoeuOG4D8PGWKv9mk4Zh6s1sdjvY0roThvCwW/KEaoWuB3/OozJUruNblJzbvqo7E/h2UxeWdh0Mels6YKkV/ExN0XtJDF5CPNU+N7BE48+/S6BC/BEFPBKfcGZ/CjlB98Qa1CzT/s4Q2yqzfynr2zv/kW4q4XLwzt4ZHmdLeeqfjyjDZIRH9y8wnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScoOMxlOeXfLbTpbb7n4xVigLOkf2ZEqOQMGlB030po=;
 b=1C3EvZqf7nDF02ILkKj11K/xaMFy7NyjpCAPrzjz04TdirfTUPIlyCxceLFNcpq5XSvz2ynaprj1kbCR8lJdRJMp3aahCEo5NhreAmbfJmJ1n1W617oYVkbq9qJjrKDFYAXGynZiS/x1rLZQN0dGzeaAeH1HaXuXeISOekLdBhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB8607.namprd12.prod.outlook.com (2603:10b6:510:1cf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 12:22:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.045; Tue, 8 Apr 2025
 12:22:15 +0000
Content-Type: multipart/alternative;
 boundary="------------WIXEKWs0zxs6QCUjx0drVUMh"
Message-ID: <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>
Date: Tue, 8 Apr 2025 14:22:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Denis Arefev <arefev@swemel.ru>, Alex Deucher
 <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>,
 lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250408091755.10074-1-arefev@swemel.ru>
 <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
 <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d30075b-162e-4215-5cd5-08dd7697ff4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M29kaFRuMEIrS0hFVHNGQklyWmdiYzd4SzRjbTJaNTViVGwzbjBqeThpM0hy?=
 =?utf-8?B?dzlWVHg4TFhaaUZNdzRnVWhoQXZNYTVHbzRBOVc4akZKWmxwRkNJcitjMUxu?=
 =?utf-8?B?NFI4dDZLTk5Rd3Q4b3ZhVkU1RE8xalEyU280T3loa1BkYXNvWU5XbG5DNndE?=
 =?utf-8?B?ZzcvM3haYmF5eWp0KzRwQ2R0ODA2UkFUdmZ3SG9ZSmlybnFsanpQSUhPemtX?=
 =?utf-8?B?SDNOelZBNTY3dm44UENuTFA2K293VWpZVTNLK1BLanVWUEMxeThhWDNQeTlx?=
 =?utf-8?B?Vmp3bGFNZDNsbkRmeWZrKzNBQnlWNU8wRHJBaEwxVU56K0hGWE1vZ1VWZHdx?=
 =?utf-8?B?cnZNNURoWlY4eWpETGVxR2NMNlpUOGRnTTRuaE9rZmdDUHZZY3JtaUZHcEt6?=
 =?utf-8?B?dUF2bXhXM0hUS2ExNGtrRy9TVkJkNjVTVmtQNDBXWVN3anhGZE5EdFZ0MDVo?=
 =?utf-8?B?NnYwUmY2eWtnakdHLzMyQU9pVm5Ea0xwM0QxUWF4YVdkQzZQSXV4Q2gyMk1k?=
 =?utf-8?B?VlU0WXhXbkFxeW8yREd1MmRQdFRJWXZKZjl3cnZmY0VmdjE1MFBSdnhCOXFT?=
 =?utf-8?B?b3lHTm1CeVNQY2dkbkI5dkdrb2N1ZFkxTGtBelR3WmZFSzZ5SGhkcGVETm45?=
 =?utf-8?B?R2RsRXNIZ3VwcWM1NUs5NkpsdlFFQXB1VzdBdEhaMFNRZ2ZxZEdaS3ViRU9i?=
 =?utf-8?B?MXNKb2d6SVUzREYrRWorcWFCcncwazdyTVQ0YjFqSWd5T2JqTXZmay9RTjNO?=
 =?utf-8?B?TkJ2d2p6amV5ZDNPWUZJaE1ackQ0VVpTWmc4VDR6eGtFVG0rMlRRQjI0S1Nw?=
 =?utf-8?B?TGtPekk4ejBkU21WbU5ZM0l0NmpETjczSWJjT1ZZN3A1M2Rka0c0VXBiUkFS?=
 =?utf-8?B?SUdienMzWHRCOE5BeVhsMWZxbk5VZ295dGUwWmRiNHEwSE5LcGdMZUNWeDdH?=
 =?utf-8?B?VGp6dTN2bk55R3VuNUxGaUZJQ3RJSXpTZmg5eXoxMlZZT1A0Z3VZdjNwalRQ?=
 =?utf-8?B?MGhFeHJNNHFtVWY4VnNrZnU1U2Z2VTFiUWh6Q3l2Nkh5T3VIc251enFPM2pK?=
 =?utf-8?B?TDN4M3NXaFJ5VkRNcE5vdzdzMm5nT3piNlQwYTJ6ck5KOHhlRU5QemlhSUdk?=
 =?utf-8?B?WTBMZ3pzdlVvRjFUc0x4Qll5UHl5VUZvT1U1SlMrTmh3TDZHa1pVU2VpMzNz?=
 =?utf-8?B?cjdETzAzaTBxeUhRVkFiRXpJWmwrK0FkVk5EQStFbTBrVFFYK1E4RGtkdkJn?=
 =?utf-8?B?VHhOdTRMNkJTUWRsM0JibEg3VHFvdytVb2FnM2JsQnpuZ3d1RWhsRVhRVlMv?=
 =?utf-8?B?QXlmaU9YV2xJS1ZOZUdyNTI4enNxUy96aGpLMjVaT0FiaktWMzBWb0R3eWlt?=
 =?utf-8?B?Tm9yOXNab284OEVWNytkQWZhdmdmQzFuOVB6QzQ0cWcvK3p5VW16blhkZjVk?=
 =?utf-8?B?WXNpTDREcWRxNTdSYzd5RE84MVdzZHZ1cXdyVDNpc1ZoLzdxTlBwRmE2M1ZK?=
 =?utf-8?B?Z0o4bytTVzlzNHJ5YzRaWFpMZk14TWM0VEE3YU1RSXFHS0N4eHkwTVhLdUt2?=
 =?utf-8?B?cXRWdnozNXV5UFRkdUVOWFA3NGRYU0V6MUNGYmgwMDJtSFRleDBOdUJHdWtu?=
 =?utf-8?B?Q3ZFWktEY1ZDVjVPOTJ3Wk5CUkVWellvaTU3NmR1bk5kYTJEOTZQQXVhb1po?=
 =?utf-8?B?dmYvME1JMS8vYlVoT2EvRVAzRlkrdys2b2RkWVZndUpjRndqSmlrdFVCK3Qv?=
 =?utf-8?B?NjdsSXY1RkVodTlmeDNxRERmTDZlZjZYNURNY0Y5cElGRHQxTWFEQkVxeWNl?=
 =?utf-8?B?Tm1NdDYvbXdQcnNzWEdHOGhIbzJOdCtJWW82VjBWQyt3em44eCtiMFZaK3E1?=
 =?utf-8?Q?RbAKV8VX3rzO2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1N5MlI5RGV1aXZ1RVZDa0NYZEtFUWlnS2Y3YXlMU1ZHcWtRcFBlOXJXUFpl?=
 =?utf-8?B?LzRZZ09HaU53a0tpU0laRjNWQWE3NzVUWXRGTktEanZvV2huT1RqQnVEVHpI?=
 =?utf-8?B?MFlKanFUUzZQY1BEWXFqczFmb1NyY0lwQWlNSVg2Y3Z1NXVvK29jQytSajN5?=
 =?utf-8?B?OVV1dUx6SFhtaXdaNVpyNFM4WGQvZ2trZENUQzRveTllSEFZWGh0YmZreGhK?=
 =?utf-8?B?NDdxamdER1RSb3BMZy9aaGM1aGpBTTNSSmVtbndheGtQY2MrQ0MyKzFreW9i?=
 =?utf-8?B?RC9RdWd3ZVBSaWpMcVFNTWI2STZZVGR4Z0FDMTBYcHJCMVQvR2pDd1FBeFBZ?=
 =?utf-8?B?U3ErWTRYQ1NtM1dOdDJwNkpqTlJRY0xPRW9LK045UzM0eXlpZDREVjhCdlJn?=
 =?utf-8?B?NENVUWY2ZnNiMklDcnFUNjROY2ZPWmdkb1EyRlBVUkRMRXpXOEQrY1czSGpt?=
 =?utf-8?B?eWZISWtvL2wrQy84Q2ZJR2xIckhXalJlZkpWVUNzQTdZL0xOQ3ZIQ3ZMakFB?=
 =?utf-8?B?TUlSYkZpMU9xN1pDdWtGT3dDaTVwUUpkeklMZngrTktXaFEvTnZoaHhucjdn?=
 =?utf-8?B?aHFDUWU1ZDFGdnNXcHdrOGhDdm51Vjl4bkdWV2NJU3FrMUxjSUlHdGJXZmhs?=
 =?utf-8?B?OEZiazRWeGpvNkNBUm5ZZlEydTAvWk1hZHlQZDdsWlZPdHBCWmU5YWZkbjRq?=
 =?utf-8?B?NGlFTE9zVVlvV2VkaHZVWms2bjBIL2l5ZGI4SmlpSFRjdDFRWjl4bnA3RXdD?=
 =?utf-8?B?UXFReUR4UG5ob3htdzUvRnUvNlpKa2RWd0N1d2lpbVBUOUNpaXNwbnVtem44?=
 =?utf-8?B?UkpjRFRRVHErR1VWV3ZXb3N3eXhkU3VtUFBPZlBPRHlqOC9RTTVvRkFieU4x?=
 =?utf-8?B?WkREMXI2UnNzMkRLcnBUQzFuVjRrRzM4b1Baa1Z1N0JtZUlDUUYySnZpdGdW?=
 =?utf-8?B?aXIvN0hXbW5Gcm1jTlBVWXhrNmo2VDRVSUhzb0VJYkJIa1BoR2UzOFByelh5?=
 =?utf-8?B?ZHJrejJjamFPa1ozeFVoU3hheWNPbk1XRFVOcFdJR1pPb3lndEVVL2lDVUV0?=
 =?utf-8?B?M29RWUI5a0pETkRYejZVT3gzdjlHY1JkbFpYcFNZY201dlhqN28yZDdhL3FI?=
 =?utf-8?B?TysyNmxnSWNrSVo4bnF0SmVVcStUODZZU2N2M29Dd0l3NGk0cnV2VVVtdC84?=
 =?utf-8?B?VGsxUzV3cS9XRE9PbDYyQVBzeExURWVTdmMyakRyMFBsL0VZZ1JGSzQyT0kr?=
 =?utf-8?B?bjZjd3hnRXo1RUNXWURxTmg3L05jRm92dHhoL0NYRXd2OXNqZEtFLzBlSWhm?=
 =?utf-8?B?eGwvME1mZnFiczd3UGlUMldHSmJJMDhHaGhUL0ZKSERrVE9QV25BMlEzdEVD?=
 =?utf-8?B?M0NoVjJxWmVGVWNFNHN0aXpCa010MW9jcDdXQi84KzE1ZmZiT0p2YnlKMlJr?=
 =?utf-8?B?SFFQZFlwU3RCd09QNVF3YTBBMzdGcGFhZ2ZudHJONnd0a2VWYXhGZVpWdVgy?=
 =?utf-8?B?RUd2ZkNtd0JIWnRrOVY3SlpDTVB4cHJEV0U0T2tZOTN2ZEk5RFl6NUp0U0xU?=
 =?utf-8?B?SUNVUUsyVk45Nk4xdFNiWjdLcE9PbkF3SFIyQVhYZDhvU2lzV0hnS0REWkxV?=
 =?utf-8?B?WVZxZHZUU3QzV2dEWWdmK1ZQbWNjMFlJRkZtNjJ5ZVdMQmxVR1VIbXZaQlNj?=
 =?utf-8?B?TlBnNSsveExtL0VONmdvZlh3WUxCRVpqNEdiZDRpcGI2OW9xMWR0M2ZhTUtB?=
 =?utf-8?B?UFk1YVVWTGdqTTlZM09tN2FNMjAvbEZwcE5GOGNta2tOVkFLem9iT1M5N3ha?=
 =?utf-8?B?anQ2dUxoR3Buazh5N0VsdDA5UmQrZkJCY0pYdW5qblYyam41aGg4T1BkbEx5?=
 =?utf-8?B?VkFYajJiMkJwOFN0eTFSNnBSbVRKSXpmU0UwanN6aFhGZ0VkOVlzOUprVGxv?=
 =?utf-8?B?ZW96UDNLUTk2MVh6aW1WT0E0c1d3aGlQZms4aDlieHN2SlZ2ODFXdlF6S3NO?=
 =?utf-8?B?aU0rdW81aWRyVSs1UGVocHBndzFSQzNmRllSdlRmSmJzUXBrNnNFSEcyYjZI?=
 =?utf-8?B?aVhXOHNnZkFnRGtlTENCOU9xNXI1OFZqRmc5akQreWFXV0dYcTNKR0t1cEJo?=
 =?utf-8?Q?RH2DwSq9AjR9e00wSgLAMOOQW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d30075b-162e-4215-5cd5-08dd7697ff4c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 12:22:15.3241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHCKOomSZZxBkPomoC8xl1tyxF93MDmxA3/JCdpiN4UAhS+LywE6VwUOOek66DrK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8607
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

--------------WIXEKWs0zxs6QCUjx0drVUMh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 08.04.25 um 13:54 schrieb Fedor Pchelkin:
> If user can request an arbitrary size value then we should use __GFP_NOWARN
> and back on the allocator to return NULL in case it doesn't even try to
> satisfy an enormous memory allocation request (in which case it yells in
> the log without __GFP_NOWARN being passed). Maybe that would be a more
> appropriate thing here?

Using __GFP_NOWARN is most likely an incorrect approach as well, this might disable all warnings. E.g. also OOM if I'm not completely mistaken and we clearly do want those.

> Please see:
> https://lore.kernel.org/dm-devel/CAHk-=wi8Zer6tnqO-bz+WxFpMv9sPc-LxGRm_3poOtZegjhfrg@mail.gmail.com/

Linus comment is about kvmalloc(), but the code here is using kvmalloc_array() which as far as I know is explicitly made to safely allocate arrays with parameters provided by userspace.

So pre-checking those parameters in the caller once more is a bit questionable, especially since we need to spread that around to all callers of kvmalloc_array() which looks backwards considering the purpose of kvmalloc_array().

Maybe we should reduce the warning to info level for kvmalloc_array() since returning NULL when incorrect parameters are given can be perfectly handled by the caller.

Regards,
Christian.

--------------WIXEKWs0zxs6QCUjx0drVUMh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 08.04.25 um 13:54 schrieb Fedor Pchelkin:<br>
    <blockquote type="cite" cite="mid:qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t"><span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">If user can request an arbitrary size value then we should use __GFP_NOWARN
and back on the allocator to return NULL in case it doesn't even try to
satisfy an enormous memory allocation request (in which case it yells in
the log without __GFP_NOWARN being passed). Maybe that would be a more
appropriate thing here?</pre>
    </blockquote>
    <br>
    Using __GFP_NOWARN is most likely an incorrect approach as well,
    this might disable all warnings. E.g. also OOM if I'm not completely
    mistaken and we clearly do want those.<br>
    <br>
    <blockquote type="cite" cite="mid:qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t">
      <pre class="moz-quote-pre" wrap="">Please see:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/dm-devel/CAHk-=wi8Zer6tnqO-bz+WxFpMv9sPc-LxGRm_3poOtZegjhfrg@mail.gmail.com/">https://lore.kernel.org/dm-devel/CAHk-=wi8Zer6tnqO-bz+WxFpMv9sPc-LxGRm_3poOtZegjhfrg@mail.gmail.com/</a></pre>
    </blockquote>
    <br>
    Linus comment is about kvmalloc(), but the code here is using
    kvmalloc_array() which as far as I know is explicitly made to safely
    allocate arrays with parameters provided by userspace.<br>
    <br>
    So pre-checking those parameters in the caller once more is a bit
    questionable, especially since we need to spread that around to all
    callers of kvmalloc_array() which looks backwards considering the
    purpose of kvmalloc_array().<br>
    <br>
    Maybe we should reduce the warning to info level for
    kvmalloc_array() since returning NULL when incorrect parameters are
    given can be perfectly handled by the caller.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
  </body>
</html>

--------------WIXEKWs0zxs6QCUjx0drVUMh--
