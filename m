Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPrjGPevpWkiEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:42:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9331DC0F1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABED10E533;
	Mon,  2 Mar 2026 15:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VkxtcpMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E294610E532;
 Mon,  2 Mar 2026 15:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTxOt7zqOyDDEs0Zws6VN6BuYviGH+vD+OiPMilSdlSo2alORJfO4PYL3eIhS72KxiB5Mjq726Ru0IqKVCcMGQ1GBC4QOzJ9Dm5OYi3wbdCcrp/Z6E/VVHFBoP1WNoBRy68PxBBG9MWzBKcBjbkn/LVHniTkwC/nNFp2vTlbIJbhwiOtl2fPJy9LDDcyodaJsv8COXivGMehutcW6ffqt57qpQjhEaLH5nX8dOijUSSD3DOzPlwN533fEiqunm1HLTq57n3dPvTc2t8lY99NIcJUjR9EiFLwi9uMREeH5K5zTCA6I+cJ57NlpO9E6hWqehLkhTrJAFGPknTjd8R2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5VyYlBq4phku4GFbqkPAkhcrgtHABQx9MZSH8Z1F5I=;
 b=F1FGKp4bVt40Cx3PwuNEbbEx4L49w5WBq0nvY0Qzb02IBn4ZfHTCo30dY8tnZz//1rg3glPO9GFFdFwKseLp3qR0iz6N/mjhTmFsmprpuZZric2xAsrHCb9Hc9nbByc/Xa1G8S4VRu7N8JdgvjUYkSDEBgmZzSkgFhczgMP8UjWINQBzfCWY1kMD0zIfseQRH6ZrLSJqUPN+rr2HZFNEubCoiY6qLkSh++nkLZE589O6iWYtbcZA7/AyOjVWCzqhZRYuq3nzuPk8DU7HZNj4U+nz4zp9Z5qecblnJ5lHE9n0yrnXUSyhpqXVbjqS8fyXy3J5VDhR56sG5eNaVV++2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5VyYlBq4phku4GFbqkPAkhcrgtHABQx9MZSH8Z1F5I=;
 b=VkxtcpMTnCqexqy0JxVnl73ZdP49UBoZlMMAeQDY9KJYCNvC/qtXYTqX5Dn5dCZHVBheit5Smi07vyjcJSoIgT1c7kRSaqAYPHAkjZPG/hKsj/Oud79kXdSbjHpNNXl4Rw5Fdg5gcsz2mT7u2FwJXZUtBYmJmxjl+1ORqiIV0fo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6639.namprd12.prod.outlook.com (2603:10b6:8:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 15:42:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 15:42:33 +0000
Message-ID: <470ae9bb-e955-4773-b5b5-cc97b5bda20a@amd.com>
Date: Mon, 2 Mar 2026 16:42:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: Assign separate lockdep class to chain lock
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20260224175544.2167712-1-matthew.brost@intel.com>
 <20260302162812.15a0614b@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260302162812.15a0614b@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0445.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca9afd5-ee44-4b21-0f67-08de7872525b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: SkjtvA/CEJ7t8/ufwCEbtcfp47MLBfCDNWXaOYhH5D/fiSewsn5NhNRYdBPGfbimijRIS8t+E7Zv2MLSiieklPv/dYzXik5s1zcQ0qu4k5YHHUYLWU3u52OYq3RFFsJ+6LaWV3zoinHOrIEinBlE47PMd4NUzabMC/dxfy7XN6MTXo9K71CwP/1B0cdwKGSUUz12NxxOuvSq6l2h2ncB/faJg8CISX7xa1+UDoYrFVXZb+HJYbu5lEDl5O8sIbzUsv9TWQ1LjyYi8Wl/57p17vhPpL9FvJ6snaRYCrDbkUEMXsGfmOJ6drw0l+F+8yYouvfE82GwF1/SOcab+EnJVE3mID3Yk/PerdZFtJGe86DYPAbjaK9/LRn3aw2CPVjbN53595DdWSk6uzmco3OxvN8CpEOi1JgUL2JftkW0ek2rec+6R1XNxBKHjnGbii4QdLBosMJ0jQX48Wiz7jVlIqgDAvTWOvcAySKf1fTxu1bt5rLWpvt+N/mRAf5JqXtcdeRbbUfhfpUUuExlOyIf9rGsIcOL4pN0TuRbO8fix/28xB0g3X6xsvz6lhA/0zNdZNbFcGI9HXuk8AfP2mmKs29amJdW8xbs48QWzSW2qziKzK+kYB6Kv5O69A2iMnzvqwauq3AhdhlltUpfn1K06qxEqJImLc7mPCGVCy0bgZdFGwJZ7CWGK2SMjLZl1mVkANE0/xJyyJmNlZVC6Yw2iUZwIdHY8roUirY95tGLMz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWplY29aOHYzeUUrL2d4WFdMYmQ1UDZ1WmhkTHlLNnF5REJsUzB2N2FxblI3?=
 =?utf-8?B?aldhbjVRVXlJdUZWRDVxVGtxa1ZSQ01VL1hPRVU3ckQyQm9sdmNnanVlSWVw?=
 =?utf-8?B?WTZQNHVLUk1SSXFJSjBHR0JoUnhGTTBjRG02SGcwWUNhYnhBOTRzU0RKaXJt?=
 =?utf-8?B?NVJ0NDhNMEtiSnlSQ1kzODFha1Z2MjIvNmJXRnVvbnpIUjVxdkhmNHpSTUx5?=
 =?utf-8?B?ZkI3OEdyUmY0UmdDam5jZlk2YUR5NkFxRjZQVGlOUFFUbXY2TlZ2dFdqZDd3?=
 =?utf-8?B?NEhkNUh2NzZMN01FL0I3U3pwSlZsUmdUQm4vcFdUcFBsenpJcEZKYmZDbU43?=
 =?utf-8?B?Z1BWdnVUSTRSS3dLemhsOGlZUzVWYlVuWFpoSjdla0U0UVJuSlRSZzVqMGFW?=
 =?utf-8?B?N3BkblVGZXlVLys4dFpCMEdBN2tpR0dSaWk4alBhT25oN0RTcUVsVUtQb0ts?=
 =?utf-8?B?U1FzeUd6YU1VZ2k0azBYalo3cUx5VXRMVnJKMzVDY1pLYzhycTZsckhNTEIx?=
 =?utf-8?B?U1FnQTcwREFpUEttN0w5dVZZNzNqRUhXZmo5S0plZWgwNmUycExtN2NJMFFL?=
 =?utf-8?B?RG9Idm5EbmJqOElNUEZINTlaVjFFSXQ1aVVFRTdBYUtuQlVxaGkwMzNFRmUy?=
 =?utf-8?B?UHhtUldmQ0ptd2hNMXRvaC9oazVxQTBlK3Y0Q3dCSFdWZ1JEZHhldlB2NXVS?=
 =?utf-8?B?NnZJWk1OdEZHNUdrdWV1V1FIeVRqcDFNMmRDZGJFZ2JBd3F0L3lmWmZOazN2?=
 =?utf-8?B?TXFoU2VtVUhvS01zTGlaaVRKWExMUEpWcUZuSFh0elM0TjdTS2toL0ZSSDdj?=
 =?utf-8?B?UUV3enJ4MDFDdlhKRXBBbWU2U0J2ejZsSklmMUt2d0FCeFZBaFBxNzRObU1T?=
 =?utf-8?B?d0hLdTM3S0VOMUFQK0tpcXVmS1RuNVUzcFRlR2tUT0xWZEVHVzdFUGdqTG41?=
 =?utf-8?B?dTltc0FmVDliNzExR0E2WUlDTWhMOUFUemhtbklERWtEWHBrZDhnbVY2bXJz?=
 =?utf-8?B?UVNBdDZqNHBkMzZHRmhIZlFSaEEyWWw0M1JFRExGdXIrUWFWL1J5NmtEZ2Nn?=
 =?utf-8?B?cmVCUzdUMUVVM010VzUwWVhhK1JZYjlRTTB1S2k1TUxqanhkL1VDTEZEcGJG?=
 =?utf-8?B?YnpSWkNkMFVCUlZraXp5Y3J2aGkzbHNxRkxUYzNhSDkyZ2g5UDllZ1hCc3FL?=
 =?utf-8?B?NEJEWXFqaXZiajVSSE5GQ28zNitqWFpZNHhScjE3YXNjWHBNQ1BEazJyWHdk?=
 =?utf-8?B?Uy9FTXg0TDV6ajhCdnhkaWhWVXNxVld4emw2U0dvSlVLbSttdnpTRG9TNk9N?=
 =?utf-8?B?ZmZQU2pFRjV0WjI0RjJ2SnlseXRxN1lpYng4NG8wMUxhSTZqbk1KOEJJQndY?=
 =?utf-8?B?bzVYMit0VlpjWmliWEdSYXpzV3lXMUp4SVJmYTNML2UrZzlHdUZTekx1SVBr?=
 =?utf-8?B?Y2huekRwaitFTWtMZXFMYzVCQkRicDljOWpEdWVEZTExMUQxMFZLT1hrQXBz?=
 =?utf-8?B?Z3dMZkp0MWhyNTd5RCtLVmVIWFo0YWcxTUZXUFFlNWEvZDdYRXo5M2FBaFpG?=
 =?utf-8?B?bnhpaS9TRkhiQzFZZllYU0pSYlZwTndFc0FvVkVhTnNqaTF5dG1DcVJiZDBL?=
 =?utf-8?B?NTZHZ3Zwd3N5WkVJZkxEUUphY1BmVCtoY1JXL3MyMFRzSWtZaUpTeUJIZ2l6?=
 =?utf-8?B?Y3B2YXRVenVGeGxtUUJ0VXRyK1ZOL2ROd3VHUW0vTlM1ZzFNcVRKU2ErVUpy?=
 =?utf-8?B?ZGljWDFtS0U2aGhnRXVuSjNzMzZZTWYwOGg3NGVubkpybmh6YTdzSkZlemFK?=
 =?utf-8?B?NFpaL2pYc1FWckF0aGFESFZ3cmJsbFpvYTQ0bUIyUHVCZjIzZXpnWUtqNHdS?=
 =?utf-8?B?VHBGOElWZUhSbEE1eEhtYlQzM3VmaG5iOHNPQjR5cTl3aUVzY1pwL0NFZS9H?=
 =?utf-8?B?Z0tKZG9YbmxCS3dsL2txRk1wN1BCdWZlNXY0SzlXUDFFemNBRUZFemswMU1Y?=
 =?utf-8?B?R0RFN0IzTnhTLzh0Ykg5WnJ0clAzbU9LM1BTVWFFWG8rcThHWEFVRnpMSTJN?=
 =?utf-8?B?bDNpdjcyNUdyWDNOcy9acDdzS3I0T1Z2Z0J5bXBQdzdDQktaMFVwaGUydWw5?=
 =?utf-8?B?TzFmMUd4aHpwTVlLeHdhQTVsaGk5MUU2aVFiSGlJbmxpU1VwZWZ1cDlxTHo4?=
 =?utf-8?B?eTNsdGhqejk1dy9Td3R1K3dkN3lzaGpYUmxNajE3bStUVlZKNEV0OWJIVTVP?=
 =?utf-8?B?Y1Z6YVpMQzBKOFcvaVp3WXBQb2VDbzdqanpWMnBzbGtpbGF6OTVDNkM4c0dm?=
 =?utf-8?B?TDdGS1ZpQlp4TkI1WnJjUVMrTEVBZjgvQWU3Mk9qOWlKSytlK3BRZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca9afd5-ee44-4b21-0f67-08de7872525b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:42:33.8973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DC87WjtUr/HKwevRAeOwxqX9UMuFSb0gq7CI3zdvnfhXGt/UW6UPbOcYikKkpqo9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6639
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
X-Rspamd-Queue-Id: 5A9331DC0F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:email,amd.com:dkim,amd.com:email,amd.com:mid,intel.com:email,collabora.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Action: no action

On 3/2/26 16:28, Boris Brezillon wrote:
> On Tue, 24 Feb 2026 09:55:43 -0800
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
>> dma_fence_chain_enable_signaling() runs while holding the chain
>> inline_lock and may add callbacks to underlying fences, which takes
>> their inline_lock.
>>
>> Since both locks share the same lockdep class, this valid nesting
>> triggers a recursive locking warning. Assign a distinct lockdep class
>> to the chain inline_lock so lockdep can correctly model the hierarchy.
>>
>> Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the dma-fence-chain")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/dma-buf/dma-fence-chain.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>> index a707792b6025..4c2a9f2ce126 100644
>> --- a/drivers/dma-buf/dma-fence-chain.c
>> +++ b/drivers/dma-buf/dma-fence-chain.c
>> @@ -242,6 +242,9 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>  			  struct dma_fence *fence,
>>  			  uint64_t seqno)
>>  {
>> +#if IS_ENABLED(CONFIG_LOCKDEP)
>> +	static struct lock_class_key dma_fence_chain_lock_key;
>> +#endif
>>  	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
>>  	uint64_t context;
>>  
>> @@ -263,6 +266,20 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>  	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
>>  			 context, seqno);
>>  
>> +#if IS_ENABLED(CONFIG_LOCKDEP)
>> +	/*
>> +	 * dma_fence_chain_enable_signaling() is invoked while holding
>> +	 * chain->base.inline_lock and may call dma_fence_add_callback()
>> +	 * on the underlying fences, which takes their inline_lock.
>> +	 *
>> +	 * Since both locks share the same lockdep class, this legitimate
>> +	 * nesting confuses lockdep and triggers a recursive locking
>> +	 * warning. Assign a separate lockdep class to the chain lock
>> +	 * to model this hierarchy correctly.
>> +	 */
>> +	lockdep_set_class(&chain->base.inline_lock, &dma_fence_chain_lock_key);
>> +#endif
> 
> If we're going to recommend the use of this inline_lock for all new
> dma_fence_ops implementers, as the commit message seems to imply
> 
>> Shared spinlocks have the problem that implementations need to guarantee
>> that the lock lives at least as long all fences referencing them.
>>
>> Using a per-fence spinlock allows completely decoupling spinlock
>> producer and consumer life times, simplifying the handling in most use
>> cases.
> 
> maybe we should have the lock_class_key at the dma_buf_ops level and
> have this lockdep_set_class() automated in __dma_fence_init().

The dma_fence_chain() and dma_fence_array() containers are the only ones who are allowed to nest the lock with other dma_fences. E.g. we have WARN_ON()s in place which fire when you try to stitch together something which won't work.

So everybody else should get a lockdep warning when they try to do nasty things like this because you really can't guarantee lock order between different dma_fence implementations.

Regards,
Christian.

> 
>> +
>>  	/*
>>  	 * Chaining dma_fence_chain container together is only allowed through
>>  	 * the prev fence and not through the contained fence.
> 

