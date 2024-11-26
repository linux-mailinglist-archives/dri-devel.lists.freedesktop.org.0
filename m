Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EB9D931C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D75110E7D0;
	Tue, 26 Nov 2024 08:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ppv52o+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0701910E08A;
 Tue, 26 Nov 2024 08:12:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ovq4eYuX4l9qvNcpWBa/ahQdwdQ+H/KJWsHAj8J//xnWgikPVzbBedYG7e3bXLkq881SLXOTVzOhvK21+H3h+Coe9QDXk2KvI27YI/XZt83jQDa0274l+dwSQk/7DEXoWK+6zEcQC0Mhem6Xwve2HtVNbAXEofXly3kBHNJ0pM8AE4lD9Hd9T6MX4FIZCpA5dKQysJh7QP5/dkoc9V7ae1TXgz8EwqFoOhdYkmu53tJVAS5Diz+4ZOEmDKpp63xrQWby9eaoEuK34N52B7Y/sXNcVG0ND8C6qKNK+uD/oyuJMZ7zQbIBrr3TBbo/nMRbIzxs0x3p06Vuk12s/Y8bew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01b/NJ5Hb6lAONpmtoOvkw4iDBH1nRkxLFKmQL2y1hg=;
 b=NPtpHhVyr/NoRXjbWkOG0Mhr+WmPawrdKxxUr1378hRcTnvid0ODO8aqXTK6DyYcds/6cUzB3kNFuSsp1SGq5q1evSbOkz6Tdyvr930SRaxF2Db+F5M1bnz8gx4xlbLVjZyh7Xu1EIjZFTXtirIyd/qQJADTez7EJ8WcxCJlAPhuClvfWb41xyqSnXHD35SDjf+lKioYT6QLKOZIDTaboGtqbV+si2LW5BZMPrM1J0tTJazkVPyel/JJbhZOv9/MkS55hm8skFYd2r+82gqUTvP0xHAhx0ls9ONWEtV8eAUW5xKhrFJhlK3v31aeTC4kh8HLvXr+ruUDFyIzf6yhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01b/NJ5Hb6lAONpmtoOvkw4iDBH1nRkxLFKmQL2y1hg=;
 b=ppv52o+WpB3MwON4R/RanxZZYG/cAqZB+vAkOGE0cRxoaHgBS4tSxxA9bXYWZVuKM9bs9Tem6EYmy4xj2QlKAxkVGzRF9/+c05pSzl3tWi/5iiDPRESCrGhgYa2KnqGkdjMOxwWsChR61mgpW49m81EP/x62fYDO8XDiyMJ6OrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 08:12:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 08:12:53 +0000
Content-Type: multipart/alternative;
 boundary="------------FgvlyC9YSfyydV35mxNAZr1l"
Message-ID: <4a99aedb-e98f-420d-a2ff-69b2a7827a09@amd.com>
Date: Tue, 26 Nov 2024 09:12:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-2-raag.jadav@intel.com>
 <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
 <Z0Atv3Zw1d0N8hvv@black.fi.intel.com>
 <3644d364-6021-46fe-b3a2-689821551984@amd.com>
 <Z0CrJ3C3wJqtySLp@black.fi.intel.com>
 <1018930b-98cc-432a-a4fe-6898ffa51d29@amd.com>
 <Z0VtA5o2cW_snZbf@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z0VtA5o2cW_snZbf@black.fi.intel.com>
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 0038b3d0-3a62-42f5-7b6e-08dd0df2205d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHlNZm1sQkVKWDl6U0pNVUkrTXVXNVRvL3JXY0c4L1dKVlh2RXpaL1k4NnVU?=
 =?utf-8?B?Y3N6aFJjb2pFcFVUbE9TM0wvYWNuTSsxMmpSVXgvMXdCWkdpT2ZYM2ViZ1pq?=
 =?utf-8?B?MXQwOUJUNVp2WFhob0pWV2RxejB3cFg1bTkwdUcrZU9LcUlDV2tWcGFEZXJD?=
 =?utf-8?B?NWVUNDExWHhkcE5OYzFqc0V6OHFUMjZaZitGNC9zQVlVUlZWd09yNXlCYU5O?=
 =?utf-8?B?N1JMajBJcVVxOG9ZYUpUNEJCU3NMdTNBREM5S01sbHYrcWNkK2syUmtXdWIv?=
 =?utf-8?B?OFY1bk01K1ViNVhnYzhEQ0svVTd4bEsyRDcvOGR2eHQ4UEtyWGxaV2NxMHEw?=
 =?utf-8?B?RzJIRVZIZklvdFVHZjhxSGZMeWk5aUJid2dQU2lVaHVYUUZ2bDA4YTllVCsz?=
 =?utf-8?B?UVpXN25TejRrUCtYRHFTS2Vtc0YvZnpsNGQzVVJHT0tNQ1lnZnRsY2ZpOGdx?=
 =?utf-8?B?eFVtNzNoZXFYZVpibkNoZkdMNkMxdWtla014TWgybzBjNDUzK0NWZlBOTm94?=
 =?utf-8?B?MXQ1ZHNJMWlWTS8xT2lRUjFGbWtrSFpLQnc4SU1qK25IWmdZY25yU1E0QWha?=
 =?utf-8?B?Q2g1WkFLK2UvMTNBaGN2NmRacUtlWUlleklMZ21MQm16ODc3aWk2cHVQck1W?=
 =?utf-8?B?UmFkT2d2V3ROKzZLQzRFb1hDRVVJZ3BZZFJ0dlFVRGtwL1dxRitJTzhaRERB?=
 =?utf-8?B?b1F1NnlQTUMyeWRXbm9xT0Q4MUdSMjNWR1NNQlJzbU5yTit3TU1tWE5sTkxC?=
 =?utf-8?B?aXRpY0xJYmtVTTJWM2VBZ2ZTeEw5dVBJV3JSNEdpS1NWaHFEczd2Rm5zVDdp?=
 =?utf-8?B?NVhXdXFxS1BKUjRIeXJ6aVBSYWJjQUREK0NsRyszcjBvMWYyRGVYdnJDenlB?=
 =?utf-8?B?eE0waytWNGxRTCt1dEZ2N3kwUDdLa3V0bnpQVXdCczlOcmpvQS9VLzZFcTE2?=
 =?utf-8?B?S05FM0grNjkweSs5WFpZejVzWGRsT3FtRnh2R25WK25CaW4wZTYwZ2xQa1lw?=
 =?utf-8?B?aWJ2RnRva2huMTBGQXBiNGp6OU90UzJEYmI1cis3Z3ZaZk4wNTU1Y3UwbkJC?=
 =?utf-8?B?SUdMVXMzenh6VjVMN2QrV3FPTHVzMmVyYm9yYWdBcjdMS2hoY0Npam9hVHhK?=
 =?utf-8?B?aE1KQUdBTjBVdFVFSElaa2lEVlJDbzBWc3V6STNnVHZmMTUyRzN3MW9oaldQ?=
 =?utf-8?B?eng0cEdsOWowUjl2WTNDMHpTVlVMMm9lUlpPOHFoTXhuVGZRS05GQkt6bUVU?=
 =?utf-8?B?VzNFZVpjUWp4REw3SHM2c0F2eUNxVFJJRnY0Uy9hNWlmWmlUalAvYUoxNk9m?=
 =?utf-8?B?R1dEbENuTWxwSzB2cmtPWWw1eGJJWnNFOUhvYzRKdi9aaVZrMytuU0FaSWlk?=
 =?utf-8?B?cDNNZG0vVUY2T2sySERma3RPUk5NZi9aUytJMUFZSThVcldjVFIrZmhlYVBQ?=
 =?utf-8?B?UE5KSXprZVhQU0ttS1Jua3hzMjd6MkhzczBtNUxsL1V5eUJvN0U3NEhRL0gv?=
 =?utf-8?B?eGthRGNZYVVPYVVsZ3hyMmg3ZDFCV1ZDdWVyZDNraHFPZmpXQmh6S3JTOXlJ?=
 =?utf-8?B?TTRIQzVHdlpkVEtyaEg4am9QQ1VFYTN6VldCeWVlMXJ6RXlRUkk5eTBBQ2k2?=
 =?utf-8?B?eHlsYWlYakF5eGRTOFNaWHBJaDFXQWtIWGRQRWlwVW1iNWZPRGp6RHZZNFcv?=
 =?utf-8?B?b1ovcnNpck1RdVN1Sm9JaXl0Z1NKQ2xKT0pEVGxJOUoyZTc5bkpOTzRGWWpK?=
 =?utf-8?B?UlVwQ0lnL01PQmJVNWFvLzZGRmZMZnNORm9oRHJpeFFvR29NSDY2VHhWb0dE?=
 =?utf-8?B?cDU0dnZrZjNMbkl6Si9udz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDYrMU9kZ1QyaVBqT0pqdjBnNDlYRVVzS3NYZWMxNnVsYlFGOFpDK2tuc1NG?=
 =?utf-8?B?QVYyRjM1OUx1NmVZaCt2dzV1d3VlTmY0RVFZVnBMbDIxdnppN3pwMEdtQ2RU?=
 =?utf-8?B?NVkzY2NRaWd5V013dk11SkxaSDlXNDV5V2E2Tno2cm9ibHFHZmZxQVcxWTVl?=
 =?utf-8?B?QjFkNHM2Q29YWlVtc3p1TFZBYTY2Vm03OVF6amlaa3d4cG45T1N3MXZwSHlI?=
 =?utf-8?B?clpmb1ovVVJ1SUhSRFo1WHl1Um9CSEo5VStUaWduTnNMbXVWVUV5OUFJYnl1?=
 =?utf-8?B?aUVRWjF0V0J3TnBPTXBOMys2U3pHZFFxclc1TFhVTytmTmRtRW9PZ1dDRzlk?=
 =?utf-8?B?NXA4VHJZTmhVWjdOSHhoalY5WFErbFhBWnU5djJrL1Y2c2U1U2ZZbUpwZXBj?=
 =?utf-8?B?cnRiUGorUWZqY1FBMmNjUE1lNzl4SDAwMXZpbWdvOEMrRUVUNHpwWXc5ZGNS?=
 =?utf-8?B?MWFMbXQ1UThTckhhSnRqZ0h3dXZaWEFMWmxqczcvRjhtK2V2bEJkMXdaMDV5?=
 =?utf-8?B?OTNlK3NWUEJiSm9FVzVUbXlaSnZNY0pVdFhWM0c0K3FXYm5ZNk02MHROeDNO?=
 =?utf-8?B?VngwRU1jUkpMa3VyWUw5Y2kyaHhHcHRpNFhKZExWNmlSRUZvdDFEQmJQSlJL?=
 =?utf-8?B?cUhGUEd2MGN2S0VQaVdxaEUxZ3lKbmh3ZTJlTE5MTXFkOFlkZ3p0eW9NdUha?=
 =?utf-8?B?TUE0b0FkaFFlalkwdXZtZFh3QWt1MUw4UkhJcWRoQ0N2MlJQV1ZPbW5yYzNB?=
 =?utf-8?B?WGNDTHUxZVdzREpxVlVveTQxVEs5dXFyaG5EWnh2ZDAvRWVHU0Y5Wm1DMk5G?=
 =?utf-8?B?bHB2REtLb3kyUzZEQ2FWMEozYU9jWW1OdGdSWS9NOFdBOWJ0SlYyaG13L0d6?=
 =?utf-8?B?M2tCZFprL2FLRGl0eGQ3R1phYzVtYUlETkgrNmV3OXQxQWlqclR0SnJBdFJL?=
 =?utf-8?B?d0FZRTRTOWhhSW5qejZRb2JWU0p3bGV3dGJUVEp4anluSFYwcDk1MWh2Wjly?=
 =?utf-8?B?MGJScHF0aWRBKzh1WmpZOGdxVFAxeVJNdkdRUHdhTDROZURiTm9ja012OEJ2?=
 =?utf-8?B?dXh6VlNBMEdLZzQrRDRtTzd5RE82NnIxNTIrSmo4VzFPM1IvSXlWVHhvV1hD?=
 =?utf-8?B?bXJOc1RKNWRUbFJ6VklHZ2NRNlBsd3ZnTVRQY0RoUTlqOWYzWmRveWpyOUxL?=
 =?utf-8?B?L3BtbHNyeDUxL1BDc2RCMHdiNHMxRGZOVnNwb2VSM1RiUi9TTGF5cVNLVElo?=
 =?utf-8?B?TnpRZmRHcTRSZThWS3lvWnMrMHdwdjNDVUhxc3NsMXgzL1I5c2svMGFRcyth?=
 =?utf-8?B?ajk0RmJMQWxoMVJ6aEliUlZlMm1iV1R4U2JqOHpkdTUydVVvRjVDY3ZhVk4v?=
 =?utf-8?B?cldQclhjY0VWUU80QjhCbnR4NWJ6THhxdzVjVzhiZEt3RzdNN09jRDQ2eXY3?=
 =?utf-8?B?MlFxS3BOaS9pSE5VVWZDM1ZsWGJ2T3dKLyt2MEZGdnFPL2lGTEZwSEFIZTVy?=
 =?utf-8?B?NzZ5VXFaTWYwalIvZ1VYOGJEMzQ1dWtBbVVPOWJVbFpsYTBkcGgwQlk2bmNy?=
 =?utf-8?B?MlREQUNUNGhYWStpamtUcmR4Vk9SRmN2NlBBeGN4ZHNieStVUnJWUkMxZHZT?=
 =?utf-8?B?eExBUE5aOFN6bnF2MVB6RGVsdTJaRVZ5dXBOdjVRRUQzT1NlM054c2FEMkxK?=
 =?utf-8?B?SnVFVGtURWtTMjRmSWxVaURnQndjeHdFL09KUGNidjc0UVlWY01JOHpFb3Bw?=
 =?utf-8?B?QTJnN1E0TUl0cGhBK0RLQ3VPV0dWQXNJYmdYQXRsTG5HdUZEVms1dnRrVFMw?=
 =?utf-8?B?RmNLbWpGZVE5QncyODJ0V1lSWlRoK2hPM2xPWGVVSEsrbENPVm9vT3RWUEhI?=
 =?utf-8?B?YXNpWlo1QmFMSmJULzJLMmREZytrcmkwWjRERTU1QThramZ6dCszNDFCL2lW?=
 =?utf-8?B?MjRXL3MyRWFVU2lBOER5WHg2QkpUZnlSQys2S2JuVmRKUDhudSt1YlFtWlNp?=
 =?utf-8?B?bnF3V3F2WmNpL0NiWjVFQ1RKZ2sycmNiMy81eWcwdWp6a1JxZkxQR2dXeENo?=
 =?utf-8?B?VGZSRUNRVkdWMktWYkdqMURCZFNHRW1HYjFWVUo2MUlBZDRsenlVVE1mNU1N?=
 =?utf-8?Q?ZbG3nPjw4a8pkyq5Hy5fBz9xa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0038b3d0-3a62-42f5-7b6e-08dd0df2205d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:12:53.5884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdHabfWSfMSnvkQT40SSGOzzKG+GD9qYQMb/9ISP98sBRQihYb6xiyvRzLTll+g9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888
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

--------------FgvlyC9YSfyydV35mxNAZr1l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 26.11.24 um 07:38 schrieb Raag Jadav:
> On Mon, Nov 25, 2024 at 10:32:42AM +0100, Christian König wrote:
>> Am 22.11.24 um 17:02 schrieb Raag Jadav:
>>> On Fri, Nov 22, 2024 at 11:09:32AM +0100, Christian König wrote:
>>>> Am 22.11.24 um 08:07 schrieb Raag Jadav:
>>>>> On Mon, Nov 18, 2024 at 08:26:37PM +0530, Aravind Iddamsetty wrote:
>>>>>> On 15/11/24 10:37, Raag Jadav wrote:
>>>>>>> Introduce device wedged event, which notifies userspace of 'wedged'
>>>>>>> (hanged/unusable) state of the DRM device through a uevent. This is
>>>>>>> useful especially in cases where the device is no longer operating as
>>>>>>> expected and has become unrecoverable from driver context. Purpose of
>>>>>>> this implementation is to provide drivers a generic way to recover with
>>>>>>> the help of userspace intervention without taking any drastic measures
>>>>>>> in the driver.
>>>>>>>
>>>>>>> A 'wedged' device is basically a dead device that needs attention. The
>>>>>>> uevent is the notification that is sent to userspace along with a hint
>>>>>>> about what could possibly be attempted to recover the device and bring
>>>>>>> it back to usable state. Different drivers may have different ideas of
>>>>>>> a 'wedged' device depending on their hardware implementation, and hence
>>>>>>> the vendor agnostic nature of the event. It is up to the drivers to
>>>>>>> decide when they see the need for recovery and how they want to recover
>>>>>>> from the available methods.
>>>>>>>
>>>>>>> Prerequisites
>>>>>>> -------------
>>>>>>>
>>>>>>> The driver, before opting for recovery, needs to make sure that the
>>>>>>> 'wedged' device doesn't harm the system as a whole by taking care of the
>>>>>>> prerequisites. Necessary actions must include disabling DMA to system
>>>>>>> memory as well as any communication channels with other devices. Further,
>>>>>>> the driver must ensure that all dma_fences are signalled and any device
>>>>>>> state that the core kernel might depend on are cleaned up. Once the event
>>>>>>> is sent, the device must be kept in 'wedged' state until the recovery is
>>>>>>> performed. New accesses to the device (IOCTLs) should be blocked,
>>>>>>> preferably with an error code that resembles the type of failure the
>>>>>>> device has encountered. This will signify the reason for wegeding which
>>>>>>> can be reported to the application if needed.
>>>>>> should we even drop the mmaps we created?
>>>>> Whatever is required for a clean recovery, yes.
>>>>>
>>>>> Although how would this play out? Do we risk loosing display?
>>>>> Or any other possible side-effects?
>>>> Before sending a wedge event all DMA transfers of the device have to be
>>>> blocked.
>>>>
>>>> So yes, all display, mmap() and file descriptor connections you had with the
>>>> device would need to be re-created.
>>> Does it mean we'd have to rely on userspace to unmap()?
>> Yes and no :)
>>
>> The handling should be similar to how hotplug is handled. E.g. the device
>> becomes inaccessible by normal applications all mappings become invalid.
> Isn't that just unbind (which is already part of recovery)?

No, unbind just invalidates all mappings but it doesn't catches any page 
faults which would validate them again.

The driver or framework must make sure that page faults now get 
redirected to a dummy page. See ttm_bo_vm_dummy_page() for how TTM 
handles that for all drivers using it.

Not sure about i915, since it never deals with device memory it can 
potentially just keep the access to the allocated system memory intact.

>> But we don't send a SIGBUS or similar on access, instead all mappings
>> redirected to a dummy page which basically shallows all writes and gives
>> undefined data on reads.
>>
>> On IOCTLs the applications should get an error code and eventually restart
>> or at least unmap all their mappings.
> Thanks for the detailed explanation.
>
> Rethinking about this, the criteria set for prerequisites is to not do
> anything that could possibly harm the system. So I think the important
> question is,
>
> with fences signalled and ioctls already blocked, is live mmap on a wedged
> device capable of producing harmful behaviour or unintended side-effects
> (atleast until the application has the opportunity to unmap() as part of
> recovery)?

I think we are already rather good there.

The potential options are to redirect everything to a dummy page or to 
crash the application by sending a SIGBUS.

Redirecting everything to the dummy page sounds like the more defensive 
approach.

Regards,
Christian.

>
> Raag

--------------FgvlyC9YSfyydV35mxNAZr1l
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 26.11.24 um 07:38 schrieb Raag Jadav:<br>
    <blockquote type="cite" cite="mid:Z0VtA5o2cW_snZbf@black.fi.intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Nov 25, 2024 at 10:32:42AM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 22.11.24 um 17:02 schrieb Raag Jadav:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, Nov 22, 2024 at 11:09:32AM +0100, Christian König wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 22.11.24 um 08:07 schrieb Raag Jadav:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Mon, Nov 18, 2024 at 08:26:37PM +0530, Aravind Iddamsetty wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On 15/11/24 10:37, Raag Jadav wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Introduce device wedged event, which notifies userspace of 'wedged'
(hanged/unusable) state of the DRM device through a uevent. This is
useful especially in cases where the device is no longer operating as
expected and has become unrecoverable from driver context. Purpose of
this implementation is to provide drivers a generic way to recover with
the help of userspace intervention without taking any drastic measures
in the driver.

A 'wedged' device is basically a dead device that needs attention. The
uevent is the notification that is sent to userspace along with a hint
about what could possibly be attempted to recover the device and bring
it back to usable state. Different drivers may have different ideas of
a 'wedged' device depending on their hardware implementation, and hence
the vendor agnostic nature of the event. It is up to the drivers to
decide when they see the need for recovery and how they want to recover
from the available methods.

Prerequisites
-------------

The driver, before opting for recovery, needs to make sure that the
'wedged' device doesn't harm the system as a whole by taking care of the
prerequisites. Necessary actions must include disabling DMA to system
memory as well as any communication channels with other devices. Further,
the driver must ensure that all dma_fences are signalled and any device
state that the core kernel might depend on are cleaned up. Once the event
is sent, the device must be kept in 'wedged' state until the recovery is
performed. New accesses to the device (IOCTLs) should be blocked,
preferably with an error code that resembles the type of failure the
device has encountered. This will signify the reason for wegeding which
can be reported to the application if needed.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">should we even drop the mmaps we created?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Whatever is required for a clean recovery, yes.

Although how would this play out? Do we risk loosing display?
Or any other possible side-effects?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Before sending a wedge event all DMA transfers of the device have to be
blocked.

So yes, all display, mmap() and file descriptor connections you had with the
device would need to be re-created.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Does it mean we'd have to rely on userspace to unmap()?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes and no :)

The handling should be similar to how hotplug is handled. E.g. the device
becomes inaccessible by normal applications all mappings become invalid.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Isn't that just unbind (which is already part of recovery)?</pre>
    </blockquote>
    <br>
    No, unbind just invalidates all mappings but it doesn't catches any
    page faults which would validate them again.<br>
    <br>
    The driver or framework must make sure that page faults now get
    redirected to a dummy page. See ttm_bo_vm_dummy_page() for how TTM
    handles that for all drivers using it.<br>
    <br>
    Not sure about i915, since it never deals with device memory it can
    potentially just keep the access to the allocated system memory
    intact.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Z0VtA5o2cW_snZbf@black.fi.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">But we don't send a SIGBUS or similar on access, instead all mappings
redirected to a dummy page which basically shallows all writes and gives
undefined data on reads.

On IOCTLs the applications should get an error code and eventually restart
or at least unmap all their mappings.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for the detailed explanation.

Rethinking about this, the criteria set for prerequisites is to not do
anything that could possibly harm the system. So I think the important
question is,

with fences signalled and ioctls already blocked, is live mmap on a wedged
device capable of producing harmful behaviour or unintended side-effects
(atleast until the application has the opportunity to unmap() as part of
recovery)?</pre>
    </blockquote>
    <br>
    I think we are already rather good there.<br>
    <br>
    The potential options are to redirect everything to a dummy page or
    to crash the application by sending a SIGBUS.<br>
    <br>
    Redirecting everything to the dummy page sounds like the more
    defensive approach.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:Z0VtA5o2cW_snZbf@black.fi.intel.com">
      <pre class="moz-quote-pre" wrap="">

Raag
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------FgvlyC9YSfyydV35mxNAZr1l--
