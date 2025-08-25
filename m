Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D8DB34A79
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 20:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AD210E530;
	Mon, 25 Aug 2025 18:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EovErRZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FE510E283;
 Mon, 25 Aug 2025 18:35:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lERs2WCSv9ENhtg9XfkRj63S3VPe4pWlNJHGrK5kIf8QZx3DFe3P6e9SnyoMgHgPC/90SU7n68s1bF/jkbvUALHMqw5dQLJML0jpP3Rmv3cA15UjD6lXbUPJ3eFQ84Ndo8ybRoUs6QmS6v2rmhuYBfik649sKHqzqylzBlJv1sGJsvSMsX7enK9vDfdk5L0f9MET0PhL+GJrKpeUEX+BOSSItAL1xCJTOU2kTI3VdJLShwKnC4b8fjeUAhaSXpMwzxTwyZXUZDOL17LUguF4yJjvSJUHMfYSQ9uKhOkIRPR1DOIwXNcuBE0/UgtIXyuGlz8yxLWCk9pP2oR5bgv5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ie0TPe8kWFdzwdIY137WSlgVUhuSj61ER/RdXNrmM38=;
 b=jddo7vZPYmVQWl0tgT0jGg6m99Dnoox6K3Qk7Jx2UOgcCken99Xm4mhaxV42PaAIpqthgxKam6q64Nkc8+lLQFnx64OBGbugDbOBuWnfrr3zlr/6zgpQav8QF+q9peE4eYPWa6WHQ5k2ywzCNlpp1rMh+CqDIc+hV3iiffFwyN105vcrUzlZ/ZYKomvpPYKfLHnhXPUMYLeGFtsxESEURtjIOPJ6u2wTbttlLoUdEa63fxdAITQmTqSZXOsF6EewhFD6dfNT7/CowdaLBv/V4OgHmA+X1lCdZcIx0Red8T4cdX+t3dr407MpHCk2TrCKu+ktCvd3wCD8fMoI0onGFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ie0TPe8kWFdzwdIY137WSlgVUhuSj61ER/RdXNrmM38=;
 b=EovErRZEgx51PFm/zgL5HOCRcgIb2489PW5lgkJ9MTcWtkE9ob0VSJ+/Qi8DpGc0yXNpBPc/Uqx7Ur/HXjrqVpj2UUS2sYVht3jSKsY505PKY3grmXw5HXqf7r6M9f0wy+uzfXiOyxSGFg1qXXXApvJsh6dY3cGBIV+2noP20zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6171.namprd12.prod.outlook.com (2603:10b6:a03:45a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Mon, 25 Aug
 2025 18:35:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 18:35:26 +0000
Message-ID: <d51c2e8f-70cb-4211-9196-be9021a33070@amd.com>
Date: Mon, 25 Aug 2025 20:35:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: your mail
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org, airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Liam Howlett <liam.howlett@oracle.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <7db27720-8cfd-457c-8133-5a7a1094004c@lucifer.local>
 <82e5e566-87e9-43a8-a0e9-00656572d65c@redhat.com>
 <f6f85c73-2a1e-438a-82c9-f3392d91020c@lucifer.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f6f85c73-2a1e-438a-82c9-f3392d91020c@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0322.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c20b062-d60d-4961-2dfd-08dde40628cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qklpd2RzaWpmQm45bkRtdWM2NDVMZVZYSTl0eGFXbEs4UVNHWkc2Um9XUWhL?=
 =?utf-8?B?dWM4UEhicHJla0JXaktMYS9rR0UreUEyQ3JTUkRMNlpONVgvcjJYcGNqYUM2?=
 =?utf-8?B?VmEvQkJmUU05N1BQdUg4dnJLNmpMZUZBcFpSZDU5Uk1ZNjJPdkRocFhjbG90?=
 =?utf-8?B?YzZETjhCWG9jU25sOGxsYXU4bmZKNlRRY1JDMGdJVk1IYW5rTzhjMEZ5Y3Vq?=
 =?utf-8?B?M2F5Tk5aUm9lZU5pbVNLRHlISUk2YzBpVDdPUmc0Mi9FSEczWG94eEEwVlpG?=
 =?utf-8?B?V0lpZ0M2R2FyTjJ4WEMySkJZcG5BeEpkN1ZDeHBReXh0dnZKM2VWaU1OQThW?=
 =?utf-8?B?dkFJMEh3Mk5ZN0lhTWtSdnNHeTRjMktFdVNDMUVZM2crQkhEejFYSXBlR0hx?=
 =?utf-8?B?UitJaGJnejc0cFNJZThJaU9mZTQ5ajR4eWY0MzJvNXZJbmlUTHVzY285UDFt?=
 =?utf-8?B?cis5YWhoUFBTNWo5cFVpcmVoc1dTMWFObUFOSWNHbE5vd2M1ZlFYTjBQcFNZ?=
 =?utf-8?B?UGZBdTFxc1VrS2JwYkdjM0dma2txNFpFQXo4cDRoTFI4anVCblAxTzhHc1pG?=
 =?utf-8?B?ditVVnhlS2tJUWlqZ2VnVXlyM0JmRmxHQnNucXFJNkRrRDQyTnZjei9JdmRU?=
 =?utf-8?B?eDJKU3kvWkd5aENmUlNCVklQeHhwZEFqVmp0bVA1Z0Y2L1MzM0xCeUQwa1Fo?=
 =?utf-8?B?MXZ4UGpCYUI3RmVCbXVvZXIvVmxvcWx2Uk5xamR5MWhMRzdqdWlBS3NuSlhK?=
 =?utf-8?B?cG5jQTFWMXI1THR5cE01WlB5VVowQXM5dnp6cyttVlNTOFNxQ1pLMGp2cHh1?=
 =?utf-8?B?bkpWTlErdzdxbzQ2am5RWXRmUkwwbDZ2S2ZKQUM1bEhNVXBGcjVkczllMFNs?=
 =?utf-8?B?aHZKdk1ZOVpVYndINzhVd0tjK0MzMEliRE9QdUdybGljb1RVby9RMTBHUEFv?=
 =?utf-8?B?VlZpcGp6aUpxVWt2UlJGZGlEMTVlQVQ4ZUZxVW9YdWpIZ2lNWTZlZWVrdXk3?=
 =?utf-8?B?QS82KzcydlZxZHVBemtDNWIydEhTZTROYzFMaVFRRy9VbGQ1MFZZbmZhSzJo?=
 =?utf-8?B?VWdmaVlUSVpQWGVLOENFRGoxeFV6Y3R6SUh2SXUvNy9hY2hKc1VtYS90cDJx?=
 =?utf-8?B?dHo4WGFibzZNNEVwTFNHUWEwaVFoNFJJeTdaVmhVcFRZa2c4WmF4RkxJWmhx?=
 =?utf-8?B?bElDYzBDaENCdXgzS1E1Z1hZcE9QN0EwREtIRHQ3bHRadDd0TXBnVHUxeno2?=
 =?utf-8?B?cm5xTUNoY0dtakQ5NmxhVFhaUG1RT1BmcnlLbmF2NVhtWUxxd0NRSHNWOHdT?=
 =?utf-8?B?alBZK29DUHhaTUFxNUg1Q1ZCRDBYWGZ2TUY5QlFGMlNZQm5GVk5MeVZyWWdD?=
 =?utf-8?B?NzlhTzNGVmtjdWtpQ2RId2oxY20xV1RtSkNEV2pocDBrcUNyRjFOSFlpQm9J?=
 =?utf-8?B?SmlSRkVDRnFmcFlYVVZ1Ri9rbndYWDlkbnhyd1E4blRVeTFOK1NpeVNISDNM?=
 =?utf-8?B?Z2pLS3A3U1N6TkF2ZjM5Yk9DZmRvekVOb0Y0L0FZT2dOOUlGdnNMbC9VYWxC?=
 =?utf-8?B?U2IvYk54cXJUVjA1NE5Wb3pRSGZZREZiK1hQMlF4OURmT0Q1ZFlOeFdoOGZx?=
 =?utf-8?B?ZXdQU0p6Y2wwTmw0MnRKQmZDSXQrYVkxT0VyRThKSFhFUWFxdWdjOXphMk55?=
 =?utf-8?B?ZUo4d0FoTHdTa2FEa2MzaHVROG1rU0tSVW5HOEYwemNYcUx1TEJnT3JnZU5m?=
 =?utf-8?B?dVRaVGFGelRSTHpVeE5PWUd2cGxVdGIwWEF1dGQ1eWFnT0VzdnhzSUFZWjZ2?=
 =?utf-8?B?RWxhUThrQnlSZTZSZ2UvSmJkWE5ucFp1cCtUVHRodlNJSi9HbGpFYVF5Unhz?=
 =?utf-8?B?Z1RvOHpzZEp2bGV3VnI4cUFzRy9oNFltanptTkJxNWdpSjA0MUVxNXNJdzhh?=
 =?utf-8?Q?rOD2GIu89yQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjh3SnhRTThsSU93Y1c4S1FBVlBmbTkreTVmUXhhOW5IaVF4aDBwWWZlRGJB?=
 =?utf-8?B?UWV5Mnk3NTFTdGE2Mk92Ung5MFY2b2VPSnZsckZOYjJRa1JoSkVkOTd5QTdz?=
 =?utf-8?B?SGFvcEZ4ai9nWFFGUDF0ZHBCL1pIUVVSc1J0U2lwSnN1NmJZVmRZTkRWb3Nt?=
 =?utf-8?B?YmwvcVdGT1NZRy96cHRiL1FmdXhQMmo3MFRiSnVrNWxtNk8yNUZjNi95aFNE?=
 =?utf-8?B?cHdEanNsUlRZcGx6eVl3NHZxWU9yMkRaWnlnQ1BqcXd0TU9yL2hBeFNpU1Bo?=
 =?utf-8?B?V3E4UzcwZnRJSDhCdVp6bU5oQlNkTThMOXdQVEU3ZDFMSGRFU3kwTFNaRUF2?=
 =?utf-8?B?aVZiRG4ySU9sYkN2d21DSHhjYzBXWHlwZllHckd5akM2c2RVOGoyOXRqR1Fh?=
 =?utf-8?B?aFd6bTFsWE5BRFRkd3MyZWxWTTVZUnl3QVhEZ0FRa0s1OXQxbEpydWpIc1FP?=
 =?utf-8?B?ejhvWFFHMG9KMkFWN21WVVh4WUFQd2U3MXJBY1BUeWpobThnaUR2RGZld296?=
 =?utf-8?B?ejUybGFYOUNzMXFMb3ZlUjVkOG9XZFQ3ekFTcDJPdUlyaTZQb2VXd1M5VFNi?=
 =?utf-8?B?YTV1MFBKWXdKNTgvWjlMc0lqdXBiNFJudlNlS1ZVbGZpRm91Q0RlQWc0OGM1?=
 =?utf-8?B?cmI3TFBkcllKOC8zRllKRUE3cGtCS1lpRG02cE44c1BneERDU3hRcnh2Zmhm?=
 =?utf-8?B?V1MzeW1meHNRZUQ4NUJyYTFjWWN2WGhjK2REYmhhNys0bVpzZDc5bjFrMmpV?=
 =?utf-8?B?TDdGM2EyNDVINzJMTHlVY2dDOTZiUktJR2Vsd1ZUbGRMZDhqc0ZSUTI0Q2t2?=
 =?utf-8?B?RGVvTlBDbzNxaElxR1pzZ2lqNSsyUG04MDFrdVBocDEwa1U1NlQzUUk1L3NW?=
 =?utf-8?B?Y3dIdVlHV21nVjY3eTRHMS9rOVBmYlFhdWhhUEVGYmtrcHl4WVVTWXBTZEVr?=
 =?utf-8?B?aXBZTW5KVjBMNmt5N3lSTTVqWTRxUXd3dDBzbG4yU3gxdDZUMmVoUlY1a2Rv?=
 =?utf-8?B?ZXRkdDRrWHNIN1A2VFV6WjJIV3psQVhlU3hCYU13ZGxub1pMTlROR0xQbVh1?=
 =?utf-8?B?L0dlMjQ5UnA5OW1lbmFHbDFQdXJpRXZ5eFJERlFYNmtRWUVKUXJUbzV2VFBl?=
 =?utf-8?B?b3hOTHZoRG55VUttQlphNjRRalFrMGZsa0dGcTBhQThDUWtESXp5dWUyMGFq?=
 =?utf-8?B?QkFmNnVCTDhsVW5TblNIWkkzb2QrVG9oNlNMMFVIbktqWTV2eHZTNkh2V2Nt?=
 =?utf-8?B?UGdRWi9UZFE5aHBKd0tsR21HYlRwSHpYNHZ1QXJNT0t4c2U2WElKdUNJMlVZ?=
 =?utf-8?B?NVRqYldHUjdSczJCT2ZRc2RTWWFyZmRzd3lmaHRQdVBBVUJlbnFid1R6bjVH?=
 =?utf-8?B?enZQUzVzSXZZaEJ5TTErVG5zTXJQWnRVSy9XTzlwS2M1Vnk2NGN2VVIvQXZ2?=
 =?utf-8?B?aDhLbkxrQSthQTE1ekxPNTQrNHROZGxwY1dMdER1Z2RYZUpzYmtLQW1ra29W?=
 =?utf-8?B?MTVtWTZKY0FTQ1UxSG1SSmZlSTZ5RzByd2VrWm12TmthNEErOERMSVRsM0Uv?=
 =?utf-8?B?R0x0aERrQnVGQmRBNG9TZmo1eGcwU1p0RGNMODYwWHJVdXJ5Z25PNlVzMitH?=
 =?utf-8?B?MlR0Y2lweCt5VTA3SWl0VXQ4bitCbGdvS25LTEh2a1JxNG1GNkMxKzF2bmlq?=
 =?utf-8?B?S0paVldXK01jbG5OeG1ZM0xiZ2tIVU5veDlabjQxVStLTFRBY00wMkNpQmpJ?=
 =?utf-8?B?MW93eUpkNkVXb1g4bFhwKzBNaDF1eUVUc1psbjc3N2pxcENnanlOazU2R1l2?=
 =?utf-8?B?T2E5YnhYeTZuK0J3MTcwWFl5eWlpd0ZwUmY3U09IL1dwRFNYTGdncUlKZDYw?=
 =?utf-8?B?UmQxa0ZqS2JsZFo1cE12MW9MK25IaGhlN09ERGpPREwvVmoxSTJLekt3MTZn?=
 =?utf-8?B?d1BXRGk4bWlMdzF3SnM3TzR0TC9DY0NSaVZGc0JNc3hJVDhVSmlFaUlPYWNN?=
 =?utf-8?B?RFZCanJmSjZRK3pNSFc5TGZKelJZMG5KRmFNSDB0RFdERGxITGdmNWFmZHht?=
 =?utf-8?B?TDlNMEFTVThadUZPS0Z0VGpYY0VhVkNHUlU4d1BjTWVSUDcyUXo4QVBpMDJ2?=
 =?utf-8?Q?wxpwk4hwUtcMEkwVPjvGkVUnh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c20b062-d60d-4961-2dfd-08dde40628cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:35:26.6096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsGu6s53zItGR/RJHKjyG8MKjsJcykrSLc97jFtQvOZQrdGNfULT9dnOkvDhAgi8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6171
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

On 21.08.25 12:05, Lorenzo Stoakes wrote:
> On Thu, Aug 21, 2025 at 11:30:43AM +0200, David Hildenbrand wrote:
>>> I will add this xen/apply_to_page_range() thing to my TODOs, which atm
>>> would invovle changing these drivers to use vmf_insert_pfn_prot() instead.
>>>
>>
>> Busy today (want to reply to Christian) but
>>
>> a) Re: performance, we would want something like
>>    vmf_insert_pfns_prot(), similar to vm_insert_pages(), to bulk-insert
>>    multiple PFNs.

Yes, exactly that. Ideally something like an iterator/callback like interface.

I've seen at least four or five different representations of the PFNs in drivers.

>> b) Re: PAT, we'll have to figure out why PAT information is wrong here
>>    (was there no previous PAT reservation from the driver?), but IF we
>>    really have to override, we'd want a way to tell
>>    vmf_insert_pfn_prot() to force the selected caching mode.
>>

Well the difference between vmf_insert_pfn() and vmf_insert_pfn_prot() is that the driver actually want to specify the caching modes.

That this is overridden by the PAT even for pages which are not part of the linear mapping is really surprising.

As far as I can see there is no technical necessity for that. Even for pages in the linear mapping only a handful of x86 CPUs actually need that. See Intels i915 GPU driver for reference.

Intel has used that approach for ages and for AMD CPUs the only reference I could find where the kernel needs it are Athlons produced between 1996 and 2004.

Maybe we should disable the PAT on CPUs which actually don't need it?

> Ack, ok good that we have a feasible way forward.
> 
> FYI, spoke to Peter off-list and he mentioned he had a more general series
> to get rid of this kind of [ab]use of apply_to_page_range() (see [0]), I
> gather he hasn't the time to resurrect but perhaps one of us can at some
> point?
> 
> Perhaps we need a shorter term fix to _this_ issue (which involves not
> using this interface), and then follow it up with an adaptation of the
> below?

Sounds like a plan to me.

Regards,
Christian.

> 
> Cheers, Lorenzo
> 
> [0]:https://lore.kernel.org/all/20210412080012.357146277@infradead.org/
> 
> 
> 
>> --
>> Cheers
>>
>> David / dhildenb

