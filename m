Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DBABACD08
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 14:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5308610E2B2;
	Tue, 30 Sep 2025 12:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ffEk1Ikn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010048.outbound.protection.outlook.com
 [52.101.193.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5D210E2B2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 12:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/bomXlLWx9aJpwQRO/eNOj9KdAQNG+/Lcj+oN/zcJ7C/D7cAtYikKZdvUSZTEXHYl6K0i0p1POOTu72Iyjb9Wn+27O74iWE8FuKPkAQK0oFZDrDYVx0EOiwewIDaHyJ+eWOCl5cA2zMIEzH7KvEOECI2KOml+rbnPU4EBG1I2KFOtjj0N4YyDZthaW4Rfc/ZVcUkJQBnEpU2EGtai0WSvNZNrvOr9BjL7HchvtvwQs3Apq8OwuUEHHN78ymgOxxoQ02uuxjPx3XpnHG7c6vElDAOBJ/cxOeD3KcXJhcEediHgq7pRjwsxpbS8ioFCn7tk3jEXz56uP42RA6JIbsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcUi5LzSfxpESw1bRUVQvYumQka+BuIS73XBEAsbhDs=;
 b=u3hwRj3nNfhKd3y1bS2nlL65LLRvtFH5yqPqVkBDTwFdvkK7xaIf+c4PjDHEhbfBL2o9xaRHV386KJHrzzA8pKrKXhRheQTydQm8zDF4sU/rx7QWhPIWvyVYk8H7XyBClGMDjt8xX43zuJ3xDZ2zQCN3G0mc9oie3gwilHVvEfSAKtiS67q/+cSYwMyk4D8zLQVWIw+QA+h/B+s0vOefD45x1o9q7baoYc7b1hqpOk+bd1YrM7YQDyQOlHkg3qqfUeWT5jp/TMlU5U1lZi/btI5Dvnv5IfEfXpZPmfjIyVPgXfXxfmDwqeOTk08e/r1819BmCzKG67HjNIwJfPB9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcUi5LzSfxpESw1bRUVQvYumQka+BuIS73XBEAsbhDs=;
 b=ffEk1Ikn4Vjnqy3w3mJ316MslRLzBKFjPglUF+Q6FsGBREbzd7l8DTY2zaiGBWaTRtYdFqaJBHS9ThRehfd4EZc707WF6Hek6xo7A+CteDgdDff6dMD4xhBsYAp2LgMhq6eTsyxdhnm1hv/MP+spVhI92q2ij+ODpdXybBQjdv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:25:32 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.017; Tue, 30 Sep 2025
 12:25:31 +0000
Message-ID: <443ced9e-1bf5-49a9-bec7-aeba449f8523@amd.com>
Date: Tue, 30 Sep 2025 08:25:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] drm/vkms: Add configfs support
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250901122541.9983-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::41) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: bc558a89-f075-40ab-f55c-08de001c723a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVJ0aFBxYkxxMW9pS0lNMVFNNnlHTXMycnNyMTgyL09GSnRNQUw1Q0ZBMnlt?=
 =?utf-8?B?Sk9yYTNucWdtSDdxMEtkZDRUaHoyZzBCb0x6NkdiQUJrMXo2M2E5MVU1Z3Rz?=
 =?utf-8?B?cnBSR3lrczVGRisrTnM5OEU2NUlLMUZsVEFJTWwySkNXNUpGUGN2dW9lcmNN?=
 =?utf-8?B?eGhxUXRJcWxZK2QwaUFtNGJWbmhqZ1V3NitzREpyY0JRQzB1UUtIMkVVQkRL?=
 =?utf-8?B?ZmcycDh1ak9INVJBeUQ3WmVUSndVT01WMkxwNFJ3cE9YL2xKVUhaT1NWOU4w?=
 =?utf-8?B?Y3FqcHpLOTJpUTR1WWdiSHg5N1lNVW5tQy9uWlBENzlXWXAvbWJuUm1Rd1lu?=
 =?utf-8?B?dW1ENEtaZW5qUHJkcDd1b1ROZTczQlBwQjNVUS9KeXhPVi9DUjczYU05c2tH?=
 =?utf-8?B?NlFPQlk0cXlSamFrd0lmanQzQW05Q0l6bmV1RHdWMlF0cFZjaFo1Qm04RHNZ?=
 =?utf-8?B?MTV2aTl4TjNnNW1aYWlvZEU4WGhFWFdOZ2NXbWx1S1NqVlhKYm41N0NMMUdz?=
 =?utf-8?B?em9wdWNDNnFkL2pMMFpQSE03WjFOWTVKRHV1Wk9vWVRUS1I1TEh5QkwxZmNT?=
 =?utf-8?B?aDhDL05BSWV0Wlc1RG1ld1dOVnBvcDlKWjRiV2MveEJUdWNmSXJzR2d3S3BK?=
 =?utf-8?B?aHhVYkMyVVluMUpIaTdodkptcFErN0oramt6UUNBbFNyWDNucmVSNEFnQXFW?=
 =?utf-8?B?TDhESTR3SEJ3MG4xTWZhQ1JhYm5aZkVnUG9IWWhzVENRWkJ6MnVqSVJzWG9l?=
 =?utf-8?B?U0FLcWpkNVFOZTIxZCtNbytrOVNjKzZ0S2pZaGxBUEdPbDlQRlU1VThzMnE5?=
 =?utf-8?B?RXZSbnNwTFQ4VmsxMnVGbWxQelBkV1BHdmc5Q1g1UkczS0NTenBIZEczQzJI?=
 =?utf-8?B?blNML3hCTXBGOHo0d3BDWlduTWNTdFpYUGxLVUlTOERoVmNLSnd4NlZpMFFH?=
 =?utf-8?B?dHI5aVdLZk1DeEZuWFdNUEV6TXFqS0x0S2VzRGllQ20zWnNuSG50YjVRLzZN?=
 =?utf-8?B?UmF4MXgzWWkwTUwvdFYzTy92VnFpQzEydDQ2d0orODJTSVZ1a1dIZjBuNmVn?=
 =?utf-8?B?VUpOcTJJUUp3aEdPK2ZOQktoMiszUENDaWpHYVZCSXNBVTJGTkNmWEtuamdC?=
 =?utf-8?B?WkZwMllLRC9SMzN2WVhaL1hmWnE0STF3K1FQZ1luUXA2b1IvdjRIeEI2VVZm?=
 =?utf-8?B?MW82WjFKc1orSGlmYVZUSWdnNWRjakRUVkplSExTYTgvYjM5RHgxbC9ud0V4?=
 =?utf-8?B?cWt2MlhZRXEyQmVUeDUxRStGbkdrSzlJVVg0UUgrM3ExU2RJanNsaktuenhk?=
 =?utf-8?B?a1hXY29HVk5xSEZvQ1VEUzZXb200WmdPVUV0NGVHcVdOeG13LzFkb2VHb2Ji?=
 =?utf-8?B?aE1iMUpQbW96TTNra3lGaldJTldFaVNjU1RmTHFzZ2tCblpRVHQxSStXdGV2?=
 =?utf-8?B?WjRHQUZaUkdVdFVJZmdyZkxXbTh4M1Vsc2cvc3lydUMzMkVLMDJDVEsvbUhF?=
 =?utf-8?B?R0o4eFpLSjZMR1JRUW1XQzFZL3VsMlZCS3BRUEU1K05jVkw3eTFKd1VaTVdH?=
 =?utf-8?B?bWFac0xpMXp2SWJuRE5VN1dET2hvTko4N1FGaTJiUzA2Z2dDcStYZlo4aGlW?=
 =?utf-8?B?Q1hTNkJ1UEFzQ0dKb25WM0FYcGtrd3l4aHhJMG8wbFNndDlBS1FONkdzSDdD?=
 =?utf-8?B?RnhSdm9GUTVMaGwweHRTYkRxMnlQRmJZNU11Mk1pRlZaVGZWdmxZRVBqZ09C?=
 =?utf-8?B?WUtsMTE2NEZxSXRmU3cyNUg5OGVSUmtIOFhsREIxQmFsN1ZlTXkxSkV6R0hD?=
 =?utf-8?B?eTE4d25TclBxUHYvNEpERWhVNEo1SjYzcGEwWitJRGNnbjVvVXBIRFhiS2Y3?=
 =?utf-8?B?N0d2ek82NElmeUkyNTFBVldtTmlNMTVtM2RVVlV2TExkaStKeDl2cWpqdVJR?=
 =?utf-8?Q?V8gcww0HUjg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzhyVktqLzhSMmpvNzh0dWhyc1JQSTMzSnhqYkRMTUpBRGowR0g4UGNQWUJo?=
 =?utf-8?B?aXNvR3RNc1FXajdZakRIN001TFRpNlUyWmFuR3FMM1FpL3BHSGt6ZHkvSFMr?=
 =?utf-8?B?VnMra2xEZXArNGppd0dvZk13T3hZbzU1T05lTnp3MG5XSUMya0R3RHBsOVFW?=
 =?utf-8?B?NHFDalI0bU92czJGeldXbnhiSGFhNWZBVUVxTVZySFhUQW9sbzFKdlR6SFkw?=
 =?utf-8?B?bFZabFpRWlBHMm9nSHh0dEdjYyt4eWVybHdvZi9iK3pCWHVjcDdFT2dNOGRp?=
 =?utf-8?B?UHB5YlBGb0xNZWNsSWx5YXlBYmVoZEdML3ZkNXlxSzNGbEoxRXMxVVppdE4x?=
 =?utf-8?B?M25nVndtalI5VHU0STdFamRYOVNoTm1qdVk0TkFNdUFaTFpBOUdNZEtxVEhC?=
 =?utf-8?B?Vk1IYVJ2bGxTdkR2cFRBZmZEMGZFNzYvL1BLVW4rdFBiMlBGTktVMm9xTm5s?=
 =?utf-8?B?K3dITkhpT1U4OUs2Vk1JTWRGSFNOelJhdjJNNjkxVFRuVWFkdWxkWG1zbEsy?=
 =?utf-8?B?eVBiZ1BacFhrVnRCc0p5SUd2bVFkT3UxeGorMllyU3VqbWN6SitOVU5vTnFJ?=
 =?utf-8?B?RHA0ZitBMm9hbDF4cUpZcUsrWjNKV20rVG9PWElmWmNIWlZ1Y05LeXJsOExp?=
 =?utf-8?B?alcyWGRYNUljaG1xdTJ1bE4vaWhQb2s4clBUWWh0dURsVEdTU3pjTTIvOVRy?=
 =?utf-8?B?QmxkU216R2xNMnM4Nk9hTXdod3U2Y3gxanZ4eHZIY0xGemh6YWI1TEE2QnVs?=
 =?utf-8?B?SFZFeFY3VVZzM3lmSHFtWHY5NkUrZlo2UVJpK2VVT3FVZjMvYWliWDJnMk9u?=
 =?utf-8?B?ZHNqcVpkMXdYNW4xTUI1Sk4wZW9QNGduNWJkOGs0NnRKc00wSS85ZG1qWWYx?=
 =?utf-8?B?UFFjMzhtM2lRTjZwNEpaU2JFM1k1UnZDQnJTbU5zZlNGbmhldlZtWDJsL29u?=
 =?utf-8?B?bms4Q2NhWG9rSXBMMlJzVCtpTmVZNHlaZnQ2SGJSTk5DWjZMYm9TcDZ3UXkr?=
 =?utf-8?B?b3lvaHpCNGw1enplL3NtODNVbUxrMzdqajVVbWUybHlIZHZhLzJ5Y3BJMVNa?=
 =?utf-8?B?cTNVR3lnRHFtd1d4dVNnS0hRZVV2Q0REdDFrMy8rTURBc2lZSzRsQ3FaTEhX?=
 =?utf-8?B?VzU1M1RNMWxoeXF0RHhtV2haM2QyZW8rTEhkSkJ3TTFFZnBRQzREaTVsU2Jw?=
 =?utf-8?B?MTlOczdsMmhETnlDcE9IQTkzSzVKQjRSS0JZNUFaeUlqWjFZMnpTTHVBRUtP?=
 =?utf-8?B?cDBmdjFlc09QNHE4RlVRNllERFNzdXdhMGZlWmZFM0tQNnExNTErZnhMK2ta?=
 =?utf-8?B?dTVaQzYvU1hMY3lmUGlTQWFUMGF0Q1JIS1JPaEVoKytRWXdmaEU2UDhEQUZ5?=
 =?utf-8?B?cFdJcHpZSzYxVjFQMTlPVWlxYlJWK1JKWkNlRlpVWlFzaitRTWErOVNKUFpq?=
 =?utf-8?B?RDBVRVJzTk9PbjF5QS9HZG1EaEdoZXhkbFJGNW4yL3l3WVlzYXBrVklnTlBP?=
 =?utf-8?B?YUhHUlR6eSt5K2p2K01WTk9TZThzYUpqU1hHT0U2N0tBakVoRWxxaGFJeFdP?=
 =?utf-8?B?Ni9HSCt6WHFGSDEvRndPMHZkRzViN05OcVZ5WDczOHdORllxd1hvOWFSQXZW?=
 =?utf-8?B?U3dCMENSL0hoLzNhYk45Q3JtcGVjRUMwajhXdnYxandreXI2SUtGdURUN0tQ?=
 =?utf-8?B?b01hRW51NlVSMGNlRFlTK2NFanN0cGlJbmxBMjdYN1pzZnQ4dHYrc3B0T2h0?=
 =?utf-8?B?NHJ2WGY1bC8wZHZlU0FFaVNpcWhQdlJQTjhTeWQxZlJaWDA2S1hJeGQrTitD?=
 =?utf-8?B?MWpsRWJYaDY5clFQMmJEcG42SythQTFuWWVIM2RFa3pmNXB5MkNLZG1oRU16?=
 =?utf-8?B?RFc5YXN3WGllR1phVVNMeG1Kby8yOGhMYkhRMU9VZW1JcUtjOWRGaXBJbEhm?=
 =?utf-8?B?S3dBWmpRWGN2czc2UG9qMzhQaC9xK25RRldWU1pOQ3pDQ3BEbkxZdHF6T3o1?=
 =?utf-8?B?SE0rZWNKdTR6QnEvd2djK1c0OWhhMHI2RXNHQU9EVFJFdUx2N3ZtZXNSTk1p?=
 =?utf-8?B?S0phdC9Ib3c5Q3hGY2NPdzhFZm9DUDRlbVVHb0Y0anVROGc5UStLbVVNTVh3?=
 =?utf-8?B?bEpDMjlNWWVzUzVvcHBqSk1uWjBqSDdYa1lxdko4N0U4RHlQMkpPMWZwd2pX?=
 =?utf-8?Q?whqSPxo5lMMYhOisCYr+nYM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc558a89-f075-40ab-f55c-08de001c723a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:25:31.0237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ8Yxk2/EOGqM0y6VZGH+fOu6IKq94q6xrPIsYEYlFyFEAIM5p3x/JJcUQF7Xfot681cgYYR9FynZjuKOBxd6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534
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



On 2025-09-01 08:25, José Expósito wrote:
> Hi everyone,
> 
> This series allow to configure one or more VKMS instances without having
> to reload the driver using configfs.
> 
> The process of configuring a VKMS device is documented in "vkms.rst".
> 
> In addition, I created a CLI tool to easily control VKMS instances from the
> command line: vkmsctl [1].
> 
> The series is structured in 3 blocks:
> 
>    - Patches 1..11: Basic device configuration. For simplicity, I kept the
>      available options as minimal as possible.
> 
>    - Patches 12 and 13: New option to skip the default device creation and to-do
>      cleanup.
> 
>    - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. This is not
>      part of the minimal set of options, but I included in this series so it can
>      be used as a template/example of how new configurations can be added.
> 
> Finally, the code is thoroughly tested by a collection of IGT tests [2]. The IGT
> series is almost fully reviewed (1 patch is missing) and it is waiting on this
> series to be merged.
> 
> I don't know what is preventing this series to be ACK by a DRM maintainer, but
> please, if there is something missing or that needs to be fixed let me know.
> 
> I CCed the configfs maintainers in case they can give feedback about the design
> of the configfs API or the configfs related code, just in case that is one of
> the complicated points to review by DRM maintainers.
> 

While I'm not a configfs expert these patches look good to me. With the 
two comments about function docs fixed these patches are
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

I went through them manually and also asked both GPT 4.1 and Claude 
Sonnet 4 to review them for correctness against the configfs.rst docs.

Harry

> Best wishes,
> José Expósito
> 
> [1] https://github.com/JoseExposito/vkmsctl
> [2] https://lore.kernel.org/igt-dev/20250807074550.6543-1-jose.exposito89@gmail.com/
> 
> Changes in v6:
> 
>    - No code changes, rebased on top of drm-misc-next
>    - Added Tested-by: Mark Yacoub, who merged the series into the Android tree (thanks!)
>      https://lore.kernel.org/dri-devel/CAC0gqY6ZH8h5aoNh31ck3dP6c3YYtfTRjJ47Obu6xSXSVXm5mA@mail.gmail.com/
>    - Added a link in the cover letter the CLI to configure VKMS: vkmsctl
>    - CCed more people to try to get the series merged
>    - Link to v5: https://lore.kernel.org/dri-devel/20250507135431.53907-1-jose.exposito89@gmail.com/
> 
> Changes in v5:
> 
>    - No code changes, rebased on top of drm-misc-next
>    - Added Reviewed-by tags, thanks Louis!
>    - Link to v4: https://lore.kernel.org/dri-devel/20250407081425.6420-1-jose.exposito89@gmail.com/
> 
> Changes in v4:
> 
>    - No code changes, rebased on top of drm-misc-next
>    - Since Louis and I worked on this together, set him as the author of some of
>      the patches and me as co-developed-by to reflect this joint effort.
>    - Link to v3: https://lore.kernel.org/all/20250307163353.5896-1-jose.exposito89@gmail.com/
> 
> Changes in v3:
> 
>    - Applied review comments by Louis Chauvet: (thanks!!)
>      - Use scoped_guard() instead of guard(mutex)(...)
>      - Fix a use-after-free error in the connector hot-plug code
>    - Rebased on top of drm-misc-next
>    - Link to v2: https://lore.kernel.org/all/20250225175936.7223-1-jose.exposito89@gmail.com/
> 
> Changes in v2:
> 
>    - Applied review comments by Louis Chauvet:
>      - Use guard(mutex)(...) instead of lock/unlock
>      - Return -EBUSY when trying to modify a enabled device
>      - Move the connector hot-plug related patches to the end
>    - Rebased on top of drm-misc-next
>    - Link to v1: https://lore.kernel.org/dri-devel/20250218170808.9507-1-jose.exposito89@gmail.com/T/
> 
> José Expósito (6):
>    drm/vkms: Expose device creation and destruction
>    drm/vkms: Allow to configure the default device creation
>    drm/vkms: Remove completed task from the TODO list
>    drm/vkms: Allow to configure connector status
>    drm/vkms: Allow to update the connector status
>    drm/vkms: Allow to configure connector status via configfs
> 
> Louis Chauvet (10):
>    drm/vkms: Add and remove VKMS instances via configfs
>    drm/vkms: Allow to configure multiple planes via configfs
>    drm/vkms: Allow to configure the plane type via configfs
>    drm/vkms: Allow to configure multiple CRTCs via configfs
>    drm/vkms: Allow to configure CRTC writeback support via configfs
>    drm/vkms: Allow to attach planes and CRTCs via configfs
>    drm/vkms: Allow to configure multiple encoders via configfs
>    drm/vkms: Allow to attach encoders and CRTCs via configfs
>    drm/vkms: Allow to configure multiple connectors via configfs
>    drm/vkms: Allow to attach connectors and encoders via configfs
> 
>   Documentation/gpu/vkms.rst                    | 100 ++-
>   drivers/gpu/drm/vkms/Kconfig                  |   1 +
>   drivers/gpu/drm/vkms/Makefile                 |   3 +-
>   drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
>   drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
>   drivers/gpu/drm/vkms/vkms_config.h            |  26 +
>   drivers/gpu/drm/vkms/vkms_configfs.c          | 833 ++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
>   drivers/gpu/drm/vkms/vkms_connector.c         |  35 +
>   drivers/gpu/drm/vkms/vkms_connector.h         |   9 +
>   drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
>   drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
>   12 files changed, 1072 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> 
> 
> base-commit: 6b53cf48d9339c75fa51927b0a67d8a6751066bd

