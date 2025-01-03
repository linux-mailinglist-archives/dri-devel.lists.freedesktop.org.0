Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E86A00976
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 13:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE67D10E89F;
	Fri,  3 Jan 2025 12:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZpyOOfQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925E810E89F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 12:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ol8HlvpqgGJUao0hqRY2AUzZ1/VmEeFw0QchAJUI+E8WmnyPBGgXyRQrxigkYy/mmLWLvfklxfmwDtEDzTZJPjIF5/jcxZVokL+uAUxwlHtAwvyz7fp9wU1e+0XRkM24nfWkTSCTnD0KvXjjJ6PEYLqP7kYc1KuM2jJjFa2VaaTgzaFc3ep7WpVEbR2dB3gZg3nPFJqCJpZuRoNetV+J7V/HSvzLNP/3VOjPWVaX/6bUHDtir1LYMED9vEBvfgCFD096x2abqkVGOi+mHb1mxBT5wLUw57UCJyZHN/cKfBU1J43HbIL+mW3WkHLKtH8/B1EHfnLT0yxYP7jFB5ltxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miwXon7/K2DnHdA0AyyM/xDTeew9oOD55KgN8aL/czI=;
 b=J8CPfsp9/N5HXSXljFqH3BkpN+UVJLCeVf7s3xcoaZ4lxWIqn35q7FFfi9NRgXhp+OxS/U+xuQPN8hQ7pnghYW23vOlQMWU4N0R5tgemeRvXf/JoeLDejSDNTUxJWcv/EvfbgA6u3zQZQQ5TKrmhQ/DTs822HJ9FItjOZH5GLjsrY7N5RdfF/scAxHmNAQaw8DkxWMx8U1Vh4OxEfQRT3Vd9IfcUm4KYDlqPp/Rgf9C04d1+0UVCHn74PSJN9dn9XYY5jGZcbbSBsacCJmOcn3r1qCF0jO+ctoCOZlvY8jxEKhbCM7HCx6CjSZwc38HIRhht39l+/3sGPCbKbcp4hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miwXon7/K2DnHdA0AyyM/xDTeew9oOD55KgN8aL/czI=;
 b=ZpyOOfQUdQE58azJKISAnjdQnQfQepcyJNNVfa8+RmbNLnoL1QJJvzDKFFDwUBgM0cDX5fI9bvQj1A8LQ3VsicrviBkd65GvBNV+IKrqC/4CqnjDY3URusahrwwEE1dpsSj/DfbWjtQwcbwzH0wRVywuR8zVBm7DLDd5QwFAY74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 12:31:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 12:31:41 +0000
Message-ID: <c4c62ea9-86c0-43c1-99b0-08af7b3bd71a@amd.com>
Date: Fri, 3 Jan 2025 13:31:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <pstanner@redhat.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <31842e821032305e5be7a8dcc3e13593fd09da20.camel@redhat.com>
 <99c7ccf4-a85f-4a11-912f-78f8d5a57516@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <99c7ccf4-a85f-4a11-912f-78f8d5a57516@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 056d4de6-7213-4585-34cd-08dd2bf29318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGRWOGljalJpc1B0NEJxTm1UdDVXc20ydExtRm5xNDFKQVFDQy9mQk8rV2Va?=
 =?utf-8?B?TjZVY2phaTMwL2tCZGlLcDFRM0RrODA2VFY1YkVDbUllTmZlMFNjMnMwalYw?=
 =?utf-8?B?TExDVHFmckduWGlIa2FqMmd1ZWdIbFhTQ3hkcW9taGVmNERQcHcvcHlTL1NZ?=
 =?utf-8?B?MzNxMHNxWWVIWDZTMmh1QmtRZWE4blFiY3ptbUY4cnEyUDd4bUwvMHM3MEJQ?=
 =?utf-8?B?dGlLNHkrWjA3UVhBeXVHWXMrdzI3NzJrb3lrdi9jWGJPdmVrY3JpbU9Bc1Z2?=
 =?utf-8?B?OGtycDBycEFYZVhraDY0V2VKK2RGbkZLR3NWMVJ0NU5XZ3VwWXZCYXVVY1hH?=
 =?utf-8?B?SlVZMHJpT2o4a0Vpai9uZ3hzWFRySHBJRG8xY2pIb1I4MjlpTEFLM0lsZS8x?=
 =?utf-8?B?WGtnSGdqQVdFOStZbXlsb0l1VmV4VFoxa0c3RitVejlHcTRkUnlEa1o2U1Jr?=
 =?utf-8?B?L1d4Y0RUSWwxS00yYjM3UFB2VW9QVDdtcHJ5RXR6NDZNRWZscndRNllkS3Bz?=
 =?utf-8?B?SEdKVmhjTzhvSHdTUlpQalZWM0RLcUlLRVEzUTlPUXJlSUhTUGFnZCtSSDgv?=
 =?utf-8?B?bEg3WlE2c1ZmVHpJYk5WMERpMExFYnlNSWxwazRWT0NLeEhOdjdUNHp6ankx?=
 =?utf-8?B?Y293V1ZRcUpIeGg4N09Ic1ZiSmJMY1gzM1RQQW5LYnZwbGk1eklIaGdvMVVX?=
 =?utf-8?B?bDRhVTBVTTVvZ0tVSzlOcW5PYWovdzJuY3kwc1V4ekdDdUVldW9HNWJ3bGNS?=
 =?utf-8?B?QnA4cXNXVzNVOXZJMHNGLzhRdjBQb3NDT2ZtSk1UeE0wN05oZXdNV0d3UUJ3?=
 =?utf-8?B?RC80cFlzYlN6Nlo5SVpwNUMzNDlPUjFmTkdnWUlDY3J5eFBDc0VVbmU3SGFY?=
 =?utf-8?B?M2d6VTNVSXYrd2hmdUdSR2MwMUtHdTZld3pMN0xuRzVzZGxjd1BySk5STEpZ?=
 =?utf-8?B?dUpZQzk0dSs2U0prbmVkOVFlOTcvNVVqamNkUWp1YU9TUjl3OXdQWWNDS2xq?=
 =?utf-8?B?OGpiNnQ4Y1ZyeEpDQk0rRmdVdWx3UzQ3SDk2VmhIbytDWEN2TnBGQTNvWUlh?=
 =?utf-8?B?RmxxeTRad3RnamZEblFTdmtYa1ZlRWZwdjZhbEx2bVhxcG1ERUJoQTJrRmtB?=
 =?utf-8?B?QzBRd3RuT2sxUnVaYStzSFFzeUh4UjI4N281YzA2dGdFU0VEZm81N1NlYmh6?=
 =?utf-8?B?L21OdkdVSHhyVEVWNytZREV1bWcrN3FyZzkwSHR6d0VEUVU1c2JoeDZTb1Z1?=
 =?utf-8?B?ZVpQZWJTRHZwdjVQVldUOWxRTnQ5YTBNMUVJVThXc3lhd2FPbjNleW1qZUFo?=
 =?utf-8?B?NkpYSGFWU1dqRWNHdnZsK0NwQ2JVcUF3R1VPZWFsMzY5b0xUQzlmYWRLYXVj?=
 =?utf-8?B?SmFGdVorbDk4bEowbzhhbWh6Q3V2T3Y1cDFDYkF5MXhib1VMcmVEVUZpcTFw?=
 =?utf-8?B?RUxpTFhkc3hKdHpWQlhQOEFWaW83ZWQ1TkpsTm1rNENPSjB3SytwOXc1ajBV?=
 =?utf-8?B?UVFxZWxhNUJNMVNLMmtrT2FMTnlsZmJKaFJ1SzRwbzZ3TldMenFkYWlZeU01?=
 =?utf-8?B?V3RsMmp5UVpCQzZrdkJtKy9oY1pXSmh0OG5YS2ZtTlNyR3JDZy9GQURraVBm?=
 =?utf-8?B?dzlFM2dVek1hQkRpUnNkNW82bnlVY0xRV2tSWVVWeXdLckNVQVV2NkwvWkVi?=
 =?utf-8?B?VVZSMmpDZVpkNXhBWkZRUEI2MUZ3Zm9XbVRyYk4zNFhoR29WVWg5dk9CamV6?=
 =?utf-8?B?V3dNTG5kUUxSdmdTSlJ4aURiSFl6S0ZLNmp0SE1BOGZ4NjlyQ0xoZXhPemcv?=
 =?utf-8?B?b3N0L1hudjNzayswZ3ZFdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODNLeHoweUdRaC93V3k2bmh6dmFmclFsRGxyM2pVYzAxU3JEd2U0dTJTdi9q?=
 =?utf-8?B?MkswbXdQdmQ0dzJBY1YrMXZJc2xFTXAzVmJOSTB2ZVMzL2ZTVEl3aGhFZVhO?=
 =?utf-8?B?TkVrVlNzQkZrSmFkQ1hDMkkyTXlQVHJBK2VvVmhHemQ3dENscjVTQWRackFk?=
 =?utf-8?B?em5DRENCNXgxN2FINGpoNlQwc1JIc3hvbGUrSDVQQ04xZjZldGVWMkNFQnJq?=
 =?utf-8?B?T3BDVkFKNTA1T1pWYmlCaDkrNjdma2lOK3M2RWdTOHl5MytOSFhuNUpqM3VS?=
 =?utf-8?B?bVRhU2tlNXlDVFhCU3JBSy9DRmVwM3loRFJHekNZeE9OL3JDUDRvaXhDbXlP?=
 =?utf-8?B?STFQaWkveDVNNmZGTFR1a3pDbm52ZHFveFZrSWUzcXlvaWZjdk9DRHFPcDNF?=
 =?utf-8?B?bEpTK3VPYmFGN21hWFhMWjY4YUJLYkhBTGdFN010VzI1bStnUlJoV1Y0WHA4?=
 =?utf-8?B?eDVqSlRxUUl0QUZ3NnJXU3MwdmFtMHJJYkZkY240WCs0NFBIUTBKN3hqcnFE?=
 =?utf-8?B?TW1pOTN2bW1ic2UwZEIyUkorU1hxM0V6SEMrRFhCV1dDaGZKNzNHQmhRSGUy?=
 =?utf-8?B?S0thOS9HZXFrdEFaNEkzKzVMQmhzSlQwRGJCcVRKYVVwbUlvei9CZDhvdVg0?=
 =?utf-8?B?UENLRWRvOFVVNFFLdEh6ZmtlSW90NU1yenFiV1doeGVoY3FuNzZPNDBpNCs3?=
 =?utf-8?B?K1NtUGEvOVRzdVFZaWx3VDlQRHROa2Y3bWZXR2M3dWZnQWhUbjFrUzBCVVpB?=
 =?utf-8?B?bW8xcEw5RHNCbFFrK3NMRmlRbkV3ZjI2bWN0dXlSMmJaVDl4c3Z5Wi9WYURv?=
 =?utf-8?B?V1ZhNkpTSzRlamxMRWxjNzltNXNWaDM3akZvL3RGc3ZaYm95bEg1d2pmRTlB?=
 =?utf-8?B?L2FjdlJ4SFY0NmFzK1E3TFJTSnN6OWZOTzUvdGZSMndHYzJ1T1R6c0FpMDVs?=
 =?utf-8?B?ZFRhcmoxaWU3V3pmcWdRTkRNR041V2JsdkkrUTQrT2h0bndMQ0RJaDVvWVQ3?=
 =?utf-8?B?OHRydWZxdTk2VWpiNzcyeWZJSHE3MGIxVHNLT0o2dk5nN1B2K051RjhsQjlx?=
 =?utf-8?B?YjV6WnlOWFRLSnQyanQ2d056N1pXYVhESkllR00vakZ6SXlRZFU5Z2xVcU0z?=
 =?utf-8?B?WU9lQ0l5WXBEVkU2SUdnNVBUa2dFSVFrQkJsdGE4SnpGbGFnSnltTm9JSENp?=
 =?utf-8?B?ZjMyQXhIRDNXSk5JWldMRVlsTzBDcjk3UkFMTTkxMHJGdEMwaGxxTTk5OWlu?=
 =?utf-8?B?VnYrMUVHVU1wRUhqZUFuZjA3MXVVckxKZkdSaDVhWEtMSjhKaDBVODhzOGtT?=
 =?utf-8?B?K2pEL3FZTWxBVGdHVUMrSkZpbXdzbHZ3SGxPVUVUZXI1cllkMjVKbDNRUGhp?=
 =?utf-8?B?TlBuMEFiRW1UTnpwdWJNNjJ0bjdwNkwxT2RDNE5wSnBSdnNZeG0rNFJpSC9I?=
 =?utf-8?B?OExWNDhPSEhzaWhKM2ZvVmM0VzR2TmhabXU4ZmZtN0FkY2FGWWNOSWhid3V5?=
 =?utf-8?B?MHY2QzY3UXNHanNPclU2bzFaR05zdXJ4ZG4xS2xpT3RweDExQzB3WGl1TGdQ?=
 =?utf-8?B?a21iNDBldWwyYlJpSmU2ZVQ0b2szaXdCZ0VVUkR0bjRHTlFxY08zYm1XRDBV?=
 =?utf-8?B?RDI2UTV3amM4YkxqeUxuZDNvU0FjZExIR1N0aEFrQWt1VU1ZaXdYaXhBTm5n?=
 =?utf-8?B?b3Nzc0VpQkRkN3dsN201ZElsSTZtL25KM2JQNGprRnhnaStoYU5CeUE5cTNS?=
 =?utf-8?B?NTUxdXpOTjdzTTZnOUZVUVhCMmhvZ2NqVkRKRVZoYnhYelFLUDhHVlVKMGww?=
 =?utf-8?B?Qm9NUm9HQk9vYWFldjBXRjd1M2I0cnBLdGdpbCtxbk16Q0RBN3AvZUtVRE15?=
 =?utf-8?B?UnFXTG9TbXRkdFZDRHFIa3l1ZFlhZWdxU0h6ajQzU3RWaXk1ajhxcEYzcUhs?=
 =?utf-8?B?NkpFNHhpYWVKU3lrSlB5TFNSYXg5M1VJakl3QUVVNGtYMEppaUJkL1lxampW?=
 =?utf-8?B?V3FSLzlDQzlOc2JnY0g0YXFZZEh0bnVWSEdMb0ZaMDd6NXZySHRMUEg5TzU2?=
 =?utf-8?B?TUVwaVMrSmZIY0lJeVZXV2Y5M2xCcEU5TjZxL0xsbzgvaDhOb0Fqb3Q1L0NH?=
 =?utf-8?Q?664cTIoJ21B5qvkvpj3zuHNh8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056d4de6-7213-4585-34cd-08dd2bf29318
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 12:31:40.8796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoMc+mbC09KsRiZ0JKl9xU59KUHqY8CjdHXZivvkcDn2T5VcJizNPFic26PCW/of
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962
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

Am 03.01.25 um 13:02 schrieb Tvrtko Ursulin:
>>> </tldr>
>>>
>>> If I remember correctly Christian mentioned recently (give or take)
>>> that maybe
>>> round-robin could be removed. That got me thinking how and what could
>>> be
>>> improved and simplified. So I played a bit in the scheduler code and
>>> came up
>>> with something which appears to not crash at least. Whether or not
>>> there are
>>> significant advantages apart from maybe code consolidation and
>>> reduction is the
>>> main thing to be determined.
>>
>> Hi,
>>
>> so first of all: Happy new year and thx for putting in all that effort
>> :)
>>
>> I gave the series a first look; Since this is an RFC, let's abstain
>> from doing deeper reviews of the exact code for now.
>
> Ditto and thank you for taking a look!

Ah, yes. Happy new year guys :)

>
>>> One big question is whether round-robin can really be removed. Does
>>> anyone use
>>> it, rely on it, or what are even use cases where it is much better
>>> than FIFO.
>>
>> So AFAICS Round Robin is not used anymore by anyone. And my
>> understanding indeed is, too, that there is not really any use-case
>> where one would like anything except for FIFO.
>>
>> Looking at 977d97f18b5b ("drm/scheduler: Set the FIFO scheduling policy
>> as the default"), it seems to me that RR just was easy to implement and
>> it had the disadvantage of systems under high load cause the oldest job
>> to be starved to death, which is why FIFO was introduced.
>>
>> So my guess would be that RR just is a relict.
>>
>> If we agree on that, then we could remove RR in any case, and the
>> subsequent question would be whether FIFO should be replaced with
>> deadline (or: if there should be FIFO *and* deadline?), wouldn't it?
>
> I am unsure about RR but I agree what is the second part of the question.

Well we came up with FIFO because we found that RR performed quite badly 
when you have a huge number of submitting applications.

E.g. one of our cloud test cases ran 100 instances of a single game and 
the worst response time improved massively by switching from RR to FIFO.

Different priorities on the other hand were originally invented to make 
sure the kernel has precedence over userspace. But later we also exposed 
the priorities to userspace which results in the problem that higher 
priority queues can starve low priority ones.

That's the other reason why I said that RR should probably be removed 
and FIFO changed in a way that the priority is basically just a bonus to 
the score used for sorting the FIFO. I haven't taken a deeper look yet, 
but I think that this is more or less what this patch set here does.

What FIFO is still missing compared to RR is some sort of fairness 
between queues. E.g. a queues which hasn't submitted something in a 
while might get a bonus for their submissions compared to a queue which 
submits stuff all the time (or something like that).

Regards,
Christian.


> There may be nuances with different drivers depending on how much they 
> can queue to the hardware/firmware at once. Modern drivers which use 
> 1:1 sched:entity I don't expect care about DRM scheduler scheduling 
> mode. The fewer jobs driver can queue to the backend the more it 
> cares. Question is FIFO ever better. Keeping in mind that for same 
> priority this deadline and FIFO are actually identical.
>
>>> See "drm/sched: Add deadline policy" commit message for a short
>>> description on
>>> what flavour of deadline scheduling it is. But in essence it should a
>>> more fair
>>> FIFO where higher priority can not forever starve lower priorities.
>>
>> See my answer on that patch.
>>
>> As you can imagine I'm wondering if that "better FIFO" would be worth
>> it considering that we are running into a certain risk of regressing
>> stuff through this rework.
>
> I will reply to that part there then.
>>> "drm/sched: Connect with dma-fence deadlines" wires up dma-fence
>>> deadlines to
>>> the scheduler because it is easy and makes logical sense with this.
>>> And I
>>> noticed userspace already uses it so why not wire it up fully.
>>
>> Userspace uses the dma-fence deadlines you mean? Do you have a pointer
>> for us?
>
> I've noticed it empirically and the one I could fine is this:
>
> https://invent.kde.org/plasma/kwin/-/commit/4ad5670ddfcd7400c8b84c12cbf8bd97a0590f43 
>
>
>>> Otherwise the series is a bit of progression from consolidating RR
>>> into FIFO
>>> code paths and going from there to deadline and then to a change in
>>> how
>>> dependencies are handled. And code simplification to 1:1 run queue to
>>> scheduler
>>> relationship, because deadline does not need per priority run queues.
>>>
>>> There is quite a bit of code to go throught here so I think it could
>>> be even
>>> better if other drivers could give it a spin as is and see if some
>>> improvements
>>> can be detected. Or at least no regressions.
>>
>> I hope I can dive deeper into the Nouveau side soon.
>
> Fantastic!
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>>
>>> Tvrtko Ursulin (14):
>>>    drm/sched: Delete unused update_job_credits
>>>    drm/sched: Remove idle entity from tree
>>>    drm/sched: Implement RR via FIFO
>>>    drm/sched: Consolidate entity run queue management
>>>    drm/sched: Move run queue related code into a separate file
>>>    drm/sched: Ignore own fence earlier
>>>    drm/sched: Resolve same scheduler dependencies earlier
>>>    drm/sched: Add deadline policy
>>>    drm/sched: Remove FIFO and RR and simplify to a single run queue
>>>    drm/sched: Queue all free credits in one worker invocation
>>>    drm/sched: Connect with dma-fence deadlines
>>>    drm/sched: Embed run queue singleton into the scheduler
>>>    dma-fence: Add helper for custom fence context when merging fences
>>>    drm/sched: Resolve all job dependencies in one go
>>
>> It seems to me that this series is a "port RR and FIFO to deadline"-
>> series with some additional patches that could be branched out and be
>> reviewed through a separate series?
>>
>> Patch 1 ("Delete unused...") for example. Other candidates are Patch 5
>> ("Move run queue related..."), 13 ("Add helper for...").
>>
>> A few patches might be mergeable even if the main idea with deadline
>> doesn't get approved, that's why I'm suggesting that.
>
> Yes some of those could be possible and I am happy to extract and 
> rebase in principle. But not yet I think. If and when something gets a 
> positive nod.
>
> Regards,
>
> Tvrtko
>
>>>
>>>   drivers/dma-buf/dma-fence-unwrap.c          |   8 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   6 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  27 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |   5 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |   8 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |   8 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |   8 +-
>>>   drivers/gpu/drm/scheduler/Makefile          |   2 +-
>>>   drivers/gpu/drm/scheduler/sched_entity.c    | 316 ++++++-----
>>>   drivers/gpu/drm/scheduler/sched_fence.c     |   5 +-
>>>   drivers/gpu/drm/scheduler/sched_main.c      | 587 +++++-------------
>>> -- 
>>>   drivers/gpu/drm/scheduler/sched_rq.c        | 199 +++++++
>>>   include/drm/gpu_scheduler.h                 |  74 ++-
>>>   include/linux/dma-fence-unwrap.h            |  31 +-
>>>   14 files changed, 606 insertions(+), 678 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>>>
>>

