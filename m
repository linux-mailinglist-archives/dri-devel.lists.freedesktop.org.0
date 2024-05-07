Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADF08BE442
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FF410F8ED;
	Tue,  7 May 2024 13:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="daLF9FlD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F87C10F8ED;
 Tue,  7 May 2024 13:36:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/Rq6jvit874ispERFxc7GFoejhAoMPhWKQex4jA4oSIYpi8crTPkfp+wdnXli9TaxP6TV0ucOFuP0sKH5vbOC8LfEejuYvTPSBav2+fFlJiJzKj9gN1xQkJd1+GGbvIpYIFHTvwICdfefvTo1Qnx5NzPPBkP+MEdpYFMMv+2kFOezXphB+a6tgPoHEshILu8x0klWAMed0kP04fXPNXWHgbe8+4is8gedewnJijAthycQzdkeUIO3veq/cobNYybnhn6B/OAoJVWKho0zNTPnvL22MqzSolHkNiKy4jiR3DX2cbUc5VirL/TY9q+I9IvPKns5C9qu+w+2yhfoWdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QteV0nXeiqzwV7QD2pWwe4NyKgahJmwJlW/yzDl5IUk=;
 b=HJ7mBKpvRmRoZZz212v/0V/6o0z9BH76J0yISi+25mWv8PsBhMY6jvHp13SnRX3NDvKH0d5Ch8j3EAqgyWFdAjG5wX3VCtaRxB8LptkCJIZpnDId2Q73TyTkt9oH3Uluyx11xIF/yPBfN35B6AGpwKX4b+BStSGeTkTShChoVje5UdFPBUzMAPsabgRSxe/8QI94EfvsMR42QjFQrRJWDSd0lu4kkvdJcBiBZw4gkPWDmK4GzyKDncIDt7uwrCHI4q26oY+Ao4sfXnUuIguZDYKNyfUjHVYAbSaI1gQWdE+UpdCIY6WqCc0LyCbNUSq5p9cRDhAI396zbYTv7eOvUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QteV0nXeiqzwV7QD2pWwe4NyKgahJmwJlW/yzDl5IUk=;
 b=daLF9FlDrLzjqO7Fs7eo7f4pPhEGZYglz9zsZOSGRgq4x1mRftIzgPN/8Dvg7BTcH31DEvnqPWof9MsocSR/3XpqqddYf5HZdGHQZvXlEYsnbT77MTHkz4h1wnieSeS8BnvnbClwdZIzWm57hdE6yPcQp/NWtWMrFyOVjgtqrVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5905.namprd12.prod.outlook.com (2603:10b6:208:379::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 13:36:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 13:36:47 +0000
Message-ID: <e54f1ffc-854f-4dc0-b1b5-257cbe5d9772@amd.com>
Date: Tue, 7 May 2024 15:36:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm_exec changes for eviction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <9f5f8b3b93b629c8530bbcce9567b51a320c5537.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9f5f8b3b93b629c8530bbcce9567b51a320c5537.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: a82e46dc-3b34-4e93-11f1-08dc6e9abe2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0FkenB0MXp1L1ROMlBmdDNEK2dCL0JQcUdQdmJDcGI4cktHNlV0bWVTNTlI?=
 =?utf-8?B?QmJjYkV1SWpYTzJjWk5JMjhnb3JoUlRiOE9XVUFVcU95Mjd0VWpuaFdicUt0?=
 =?utf-8?B?ZkVIQ05mZGs1VDNla2hDOENtYklPM0dEeUM2NjY3cGFQbzRZTlZCbEhSS21V?=
 =?utf-8?B?bElSbk1rV1AzV2c0NW9YejFPQ3JSUHRRbW93Ym1qWUk4RXIyZmMwbUJQMnVN?=
 =?utf-8?B?clV1a0ZWZVNsa3RWMW83WE9JTnk4K2ZwWXdxb0hCSTU1b1g5cXMxOXpzQzdD?=
 =?utf-8?B?TDlyN1NlM3RLaVozUk9wRmFpbTR1Y1VoR3N0c0d0NkxOT0RDUnhzQzMzeEd5?=
 =?utf-8?B?azN0eC9NNFM1QmgyK1VXbUdEdkc2YXJGYnNQV2RrQWFFZ3dSZVF1TzczVFBO?=
 =?utf-8?B?cXA0Nks4NWJCMUsyc0VNTm1HUmZSQUxJYXZZc0VNZm9kRUNBQ3pMNEQydktP?=
 =?utf-8?B?cHN2MTV2SU5LV3lJT1BpdHhNV3F1OTk1OUl2Q1E5dklZSXdtNG4xOXRocFFt?=
 =?utf-8?B?K0ZmNFJ4TStKcWdmd2tkcEtrUFhNQTR0KzRSd3RoUmxZQ0U4akEyTVpZdUY2?=
 =?utf-8?B?SWNrRGE3Rk5hSjZMUmN2VVpRWXdrODd3WjZSK0NQS0VUQVF4MC90Rklzbk83?=
 =?utf-8?B?ek5aUHFDSmxRVW5pRGx1ZjNmLzlxSlZoM1pYcVUrZXdjS2FBM3RKN1hOREow?=
 =?utf-8?B?MW1uUGorUzFvZkJ2T0E3Umh0OWVCSktuenhsWCtPc3NqejkyNVdCcDhDWjUv?=
 =?utf-8?B?Sk9rOWtCVDZYUTlpMVMzODdwU0dZdWxNRUhaa242STJIaWtLc1Nwc2xlNlkx?=
 =?utf-8?B?aWpscS82VWhKRmt4TG5DazdlbjhEcXNDMEkwdGh2RjhKSHVUdkpOZ3dlQ0dY?=
 =?utf-8?B?cDdMRGFmZFlsZHdjdmtic0lSTk5jZTRZcmxrbDJ5RDVxdmVhWDREdW5FN2Vs?=
 =?utf-8?B?UkxHSFRqd05lMmF0Q0M5UzVvNW9ET2RKT2lsQkFKc1ROUWxtN3p6U2dlSE1C?=
 =?utf-8?B?M0h6RXNaK0ZnMUErNTNkcHo5NjE3VVQxdjZINHpWcDVMYmZaUkJENW9FeC9P?=
 =?utf-8?B?Vm4wQnVRVi9KYVcySExSUi90MUI3WnFEY0VubXhFOU5OVzNOVy9XdVhkMnBn?=
 =?utf-8?B?K0h2WGZhYWkvUXJERi8zZnRTVENiQ2d1Q0ZRV1V3Y2Nza29oZ0FEczNNenlX?=
 =?utf-8?B?c3FFdnBNUTU2U1YzRmVzSE9QOUtoWVVnQW1oMzYyUzc4alhOZHlUSDVXYWls?=
 =?utf-8?B?TFFiYVBJUFRsK0ZDSzZ6THNJMnhPUHpkaTFqYUV2VlVYa2VER2xGZitQUmtn?=
 =?utf-8?B?WTRzZUtuaWwrNEVOdVV2ZmZHb2pLWC9rNFMzN0tsZUY1WnB1MTRLTC83aTY2?=
 =?utf-8?B?SGs1a2NtNzZIK1VucnNjdDIxTS9oMHdPdFdFeCs1N01kNDJPeFQrOG9BQVh3?=
 =?utf-8?B?Z2pQc01oa2laSG1jMUI0UkZXc05WZ2VBT2JHb1B4d3cwMTUvdzlsbmJ5NzlQ?=
 =?utf-8?B?bVYyY1pLQjlUQWR6Zi9PZVA1S2Faa2RGMnE3b1VMTVlMQnFuM0pUQUtoMXlS?=
 =?utf-8?B?cmZYSURmMG82bWVZTkIwa3pVdnlPczlHRFlGdFdiWnd4Z1VuWlpIQ1JWUldQ?=
 =?utf-8?B?WktaUjZsVEhCL0tYaVdiTUQwTTdYdGVxdUVzYzQzdWprUVgvWXpvTVhUT3RJ?=
 =?utf-8?B?WUcxVHpyUlA1RWlwNTQvZlByTGxWeFE2eDlzeExRZHJpMVY0cHdzR0RRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFNVM0t6a0pCV2ZXeFNoR3EwZUZ5bnZic1UxUjRMVVRZWkdKSmFwdzFlMWI1?=
 =?utf-8?B?OTd5RHdsK0duR1FBQ254cWZQa2k4MWlmNFp2eHlIY2hEQ3FCV3VzUXBTZXpv?=
 =?utf-8?B?cDZqMHZLRlR0TTBPcmh3MnJvVjNHZFVWa29yalEwbmo3SjBsOHlaUE5FVWRM?=
 =?utf-8?B?U0VKWlhLVVJXbHlEWm9COTN6Uk14VVlKRExkeVlPTFdzeXRONTZ2TjZjcmt6?=
 =?utf-8?B?QjMvUGtham1zZTVGS2MxdC9HU3lqNmxMZjNGYXFDNUFnWGE2dWpkNHpWbVov?=
 =?utf-8?B?WVEwSld0amNvRmp4a2FhTXM4MFZIUmNHbkloL0JOc3pQdlREcVA5cGRoemF0?=
 =?utf-8?B?US9qakhGZ0dDSTNWeVNGb0NtQWpIOHdMSGhQczJ0aUMxTklrRjcxOHM3R3dU?=
 =?utf-8?B?SWcwNE5wMk9LM1ZVaGZZSDVtNWYyRVJ5eVRXUXFlSGNJazA2M3FKMzdRNXov?=
 =?utf-8?B?QzVEOTZMK2JvOWI3Qjd4ZkdZZ0JIek5aTzkySGpBK0ZkQnlmbVowY3dlVGk5?=
 =?utf-8?B?UXFTaSsyMlFGZERINkc2V3EzTkJGQ0RibDFxYThiNFFTMjc4SkovMW1FNmlo?=
 =?utf-8?B?cW1LSk1LaWNWZnFmQmNpWjNpV1J1WElXWE12Q1plSEFhcEtHb1o3ajczYzRz?=
 =?utf-8?B?SnBRKzcvUG1qRzhkKzlodnVWdjcrOW4xVy83akhVS1FTcmozRDAyVk5LdmZT?=
 =?utf-8?B?aFVZaXkwVVVXZG90MmFWbjhKaUl0dW5teVg5MFFYSDFWQTAwVnF1eUhteGlh?=
 =?utf-8?B?YTRCQWxXUnhONE8rbWh5amk0Q0FuSHF1cGRYYnZwdnZrT0dPclFPL21zekJK?=
 =?utf-8?B?ZmpINHJ5N05RdWxHVkJ0dStja0xBZS85bFF0Z29OTXM0K0k1MnI2bUprY0xJ?=
 =?utf-8?B?cWNjQVZFck1Wcnk4dG9INWtRRWFoVEZNWGU3S1BMaGRZSmNacjhvdHdhNnIx?=
 =?utf-8?B?K0RWc3BHNUZOTEJ2b3FJdUpWNy9PTjFZOC94L2g2eFlJU3BmM0lJSjdrM1pk?=
 =?utf-8?B?NG9pc3BZb3RDVzhqZ0YyNXlXNkZBaVVvWUxmVFJTc2lVUGpWQ1JjOWlVckhB?=
 =?utf-8?B?NVB2WE8yWGlKMzlpYVhsVjQ3UytZOUNub2hhSXBlOVhMSXoxZEtub0w2Umdr?=
 =?utf-8?B?WW02WXd6ek82YWtqWkF0NTczQmJuQ3JXOS9ZOW5RQktvSmJGVmlyUUtxOEFx?=
 =?utf-8?B?MzJlR3JhVnluTmYvbC82cHp4dXFkbXp4SUFUTnl0a2NMeVU4aFdmZmJCSmF2?=
 =?utf-8?B?aHhiT2ZmSHFZQ0NVZkVYdUU4M1pNODFCaStpSmMrSi8yQWhNekUvd0hMU0x5?=
 =?utf-8?B?bjlXMS9NU211TmxpMitYb1VSWFg5K2VuSVRLTk1wdWxVRmpMZlRsNUpGamMr?=
 =?utf-8?B?RnAvTWxzTWpOMUpzbzk0c1lOUTdBYzFxeU9RL0N3LzQ3YmlscldZcjlRejVq?=
 =?utf-8?B?ZnFVNkdBTk1adVo4T0U1WWVnenVnSDdUMGpHWkNZV3Q4bGdJMUZVWEVzakN5?=
 =?utf-8?B?czFnWFY3SXpGVVdlWkdEWWhRR2doOG9DU0p2ZEFLVEJKR2t4Umd5QUdCK0xU?=
 =?utf-8?B?OHRQTkNBclI0NkxDajcrbFRSNjUvVXMrUzNqM2ZVQ2xabmFXYTdqdGFnenFG?=
 =?utf-8?B?NlJxOUJNaEdyaVJUVzBhZE9MWDZGQVJ2NlhGYmdlU0tidmlNa2NMaUh1WHph?=
 =?utf-8?B?UDNBaExDL0dUT3pCZXRvOUlNMHZqVFgrOWVNYlJFbHdkYkJYMkJ2RjBJc1pn?=
 =?utf-8?B?Vm5xRjVBNHBnWE1OWjVleWd3MW5KR0RCVFV3QXYvMG9wQjZLTDNEUGVCSVdV?=
 =?utf-8?B?SkRzRkt2SCtXSE53akt6RmhJT3hrenAzdzRIN0xZaEd3bzhoc3c3R0poaFZC?=
 =?utf-8?B?QzdDYVFydDdGYjQ2aGt0YS93RTkwZkQrK0xsU0lXVExoMDVnWG5STVFKMTND?=
 =?utf-8?B?Zk9nRnNzN0RUTDQ5UTN3aVl4R1FQOW9UY3hLd3VxY09zTzk5SlhBTGNUNGpx?=
 =?utf-8?B?RHNzL1JZUGRCU1laWWoyQlloVXJ6T3hDMFUvM1FLR1VQUXliTXd0bW5Ua1Q3?=
 =?utf-8?B?dkhYdGNZeXMwY2xpYkxheXZ6V2VyTGFmM2tScnNKOXlVTjdKLzA2ckJBMXhh?=
 =?utf-8?Q?J6noqX5X3OUbOhhU9pa7kCz0h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82e46dc-3b34-4e93-11f1-08dc6e9abe2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 13:36:47.6981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iW0YbTMqtQ/lOtN6GAE/XgQbvgIrIuP0LN+OEdAqeDBXW8Iw7nlKX89cwRBhUU71
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905
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

Am 06.05.24 um 11:46 schrieb Thomas Hellström:
> Hi Christian, Others.
>
> In order to support exhaustive eviction there are some changes that I
> think needs to be made to drm_exec:
>
> 1) Trylock support
> (This is for ttm_bo_vm, ttm_buffer_object_init_reserved, and also for
> the eviction path where I think we want to make a trylock pass before a
> sleeping lock pass).

Not sure why we need this for ttm_bo_vm, but in general that sounds like 
the right approach to me as well.

> In essence this means we can't leave any contending lock unlocked until
> the next sleeping lock, but rather need to relock it on
> drm_exec_retry_on_contention(), meaning that that macro also gets
> passed and returns an error code to handle -EINTR.

Hui what? I can't really follow what you mean here.

>
> 2) Snapshot unlock
> After successfully obtaining backing store, we want to unlock all
> evicted objects. So snapshot the drm_exec state when eviction begins,
> and unlock everything down to the snapshot after successful backing
> store allocation. Essentially the snapshot contains the number of
> locked objects and a pointer to the prelocked object.

Interesting idea, never though about that. Not sure if that makes the 
situation better or worse.

One goal of drm_exec was to be able to keep evicted BOs locked until the 
whole submission is completed and that obviously contradicts that.

Regards,
Christian.

>
> Any concerns?
> Thanks,
> Thomas
>

