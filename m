Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGGeK+SuoWk3vgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:49:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A611B9372
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62F410EBAB;
	Fri, 27 Feb 2026 14:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gPUwe5r/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010010.outbound.protection.outlook.com
 [52.101.193.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CB710EBAD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:48:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxOc0M4PUXPD/iwT2XYMJr3W+XbUkAfXuzuV4Zml+oAHUmY2zfzvIar3sy+tokGzg756F3pvoySBmCRB/axAZlzl8fszUGW8HbEPAQwJcotG7JKv8PVMNEKGGmoVPFpglnSPWnQyEEiH6Z9fuqAIx34ZofjSxaqpbJEjwCGGalIQnAcY6S4PLhBjDooSxV74pur8pz8vTj6+SvH2FUrHLyf+Po17El9nH6ej3og4WkX37kQQ2MOvRMHEtD3JBmZJUIpcmWJKnfCsgA5EUBSBAjTywIHYsRXwA0xYhMH7RMh9CZVS4pl8A3sogJHOxuq5GHhctE5vTgi98n/wAXa/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiBzwXH0Z7RgY/LacCxhlyM1USvo8D7NBCnd0jvEOCk=;
 b=QmkP542RhcpW6bPKs6JmkXk9h9QKjcPCZqt4en0nnuU0OI9ndpVzloIGmMMjXAaO3TliglOLriouPQXGDooAr8vumZ3kpXbE1Tq3PLt1UJnR6N2j7UaMNSZp2gytJbALzfeRE03DFPXGyn6ie8uOSlx8zoy5ryhiQuMqClbwFx+adhYA0ElVpnfGeklGXRh8OwjA/80Mjp2i5frIq3z+tYnSeWbvPq6VjFKqL5BeEzJaH8IaTplrRgdyEbbgmQM1ig/TsZqAJfyyBxzzii37r9759GkXgNZt8W4sHnsJ4QzZyheQ9RXbdbBYP2u6fKyfuHR6QNtLvoXD5ZHf14e2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiBzwXH0Z7RgY/LacCxhlyM1USvo8D7NBCnd0jvEOCk=;
 b=gPUwe5r/QFelqwPle/mgZs38GxxdEA99H/gqbn8igtgWswQZCqwpIQZ1tiXQNVd1PWISP1bgeNzdkRaToX7Gb+n5ZWu7381VVVWzosBEUG1JIFCUjjOIs4ihv7IuHXqEZEbAJmugKbh2aLd2UeXJNTOKJbvgfQlUTVmrtHHHrUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 14:48:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 14:48:49 +0000
Message-ID: <9b0fd219-706c-4f15-9c71-f4e577ab6061@amd.com>
Date: Fri, 27 Feb 2026 15:48:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix ttm_pool_beneficial_order() return type
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo
 <cascardo@igalia.com>, stable@vger.kernel.org
References: <20260227124901.3177-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260227124901.3177-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 89597a2a-c3c9-40bb-dd57-08de760f50e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: RysTnzbdcZUCkn6os3bnphXBwNuLqBEmcPQpbvBLOGI9EdSSbmudCUEv8du/LkHcTCI6nUlO9kABt3+IrPzVMNVu8lXul3pc3ZObt/jSZNHPCNeC/1Gc/c+msfAeM09D4UyThk+1QuRI8Qi/WKV7xSc14iIFpwSltMjYatcwrlUzja9yxSnC6F86OnvQaCYQWgU9UXZLrrhSd/QENv1ouxRh0YsDNxa4GkfxvQhCjUqJ8AF48810ULqWC7uA2rf7fcQYY9SA2HWZOc8EffpWhHRKxS9XrVaLoHCisBoQlyn1hkkdc1k/gbqKx0RhvY2jAkpyKVDUnm67ZQD9dMrLBSlp6NXHUIp/61H37K0HvRhjwjJnV3U3VdbiGTCEFb9qrToNlXmUxNkYshiVXR3J8ih1RmtVL/z5sIngITFrWbwAKfvlaU8SoGBmDFYc2tTTopZ7VoVWIIurkCKU/1VjQ3BSUyZaxRZFsosmW6u6+dqVUWu/te7jwS/dL9d7fCqoE37p/+DXGFiIRw7AHiynNXDJ0NLkoXyZlWufUts+6zYfKdv+DOFl4iwPqInZ2jlrIIXk6uSbIXFynJOuWPz/RlhWJC2iImKDlplXxl8cmc4/HIRae6oFuRuuwMJ3R5HmvbnuJo/lZKLcU96EmNMQDUjr1ufcp1wvwpjG/AUIAOuZgDzLEpxzkeAMX0DoTW6Y4hzG3TIUqoN+Cfx2UU2uKiLwJnuu5UMROzdO24zw7iE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0RocWJqM1V6NThESUNBNEtLSlpmSVE1WEs0OGxycld3K1JyUVRwYTFpdGtU?=
 =?utf-8?B?RURPUVF4NUExalFwbTRCN08rdU55dHdOd0RYdzg1WVhNTGE4T0JFVmlJYkh1?=
 =?utf-8?B?RjQ4RUxuK3pOb2NGTUo3cHd3ampXWnc4QllZRk42Z21peW1mNVg0OVU2RHNW?=
 =?utf-8?B?U1hYUUtGTUI1VW5KN3dmRHJldGE5bzN4V0FPNnkralBqdTJsMndVN3FVdk1T?=
 =?utf-8?B?MytVL0lxcFN0MVluSnNLVS96cUdxVDZUUERjVGVZdEhueWM0TFlnZFFubUFF?=
 =?utf-8?B?MzRyaDdpTzltVEFnOFZpY2Z0SjVjMVlqN01pUEdNclY2R1liTjdnY2s2ZEVn?=
 =?utf-8?B?K1B5TEFLR2FWVGZDWnhJYzF6UU1CdGY4NnVzS09wejFralJSOWRiRUE2cjFE?=
 =?utf-8?B?UE9DYWQzbjVDYTFYc2Uxd1Y4VzNoMmhVanBRZXBBbXdlb2hNNTBDYjFBZkxi?=
 =?utf-8?B?WkJCYytGSG1COWpuek1aREJqSXpKbXVyUGFuNERLY3NMcDQzZlZLL2xLTDZK?=
 =?utf-8?B?TEpEek50MHl5ak1Qd0xkbVpxOW01OE1VL0x1dktJbUdaMGpNZWZ5KytDZE1l?=
 =?utf-8?B?aUUxUFRVVmRzUjhRdFVGSFF3SjZTWXdveU1MMXAvVzNIVmdlTyt1aVRZWHk3?=
 =?utf-8?B?U1JKSHlDUXRLdVNGRmQ4Y2VPU0lMR2I1Q3ZJOGJVaVNSM0hxUkwraVZGaXQ1?=
 =?utf-8?B?T0JSNENVWnlSUVFxTXY5elZEb0hKMGNlQksvaklBVzg0cWt2cmZNZ0drSlFv?=
 =?utf-8?B?bFJ6ekJVZ3pzZTViUzBSZHhManBOeCtoOTNvZGRWSGQ3TGFWYmt2L0EvK2No?=
 =?utf-8?B?enlnZnpZWlYvUVV2dUIwOWdFYkV1UUttY05zbEFpZmtmZzZVTS9MTWNOZXpE?=
 =?utf-8?B?ejNOcWMzTXpHaE1CaElmRERraUlZVEpSckJKMHkxSjM2OGNuc3pZMDRWRk12?=
 =?utf-8?B?VHhwUVpyOUxobVB0dkhCVWI4Tm1rWXJ0ZTRpeWVycmlVczJ4T0prQVY1RkNr?=
 =?utf-8?B?R29KVGhBK1M5RUozMTJhZFExRDgrZXpEcXBHMEg2Szd6dXZ1NWg3d0cwTU9n?=
 =?utf-8?B?TWFOOEY3WFRNSVFzOW53b3dFVVJvN3dJME9DZW9yL3lKMGJLS0VqcVcvbW1k?=
 =?utf-8?B?OXdhcnpXTGdMcGFkYmVLS1NUK1MwUmNwUEpUYjhCbTVEWXhvVHdGUUpzeERo?=
 =?utf-8?B?dGlkUUYvZjBpZzJmK0NZcXVmZzdXMUFYRitCMDBtWFFnRFVqYmJ0RFl4VVcy?=
 =?utf-8?B?NEZ1ZTFtNUNYckw4dkRsVys2Q09GbnZxdzBRNjVVQWthZEllWGtKNjVmMXBo?=
 =?utf-8?B?bFdyaTRFK0gyZGdiVUEyakpSaVJnWVRSOHk0T21BN1ZXRXZuZmFDUkp5ZG9I?=
 =?utf-8?B?N1BUbytBWVo2djI3S01oZVc5UDEyOURzamxaQUJPWGZiVyt1cmJRU1Y3eGZk?=
 =?utf-8?B?bmdYVjhJZFBmc05RbjRMbUtUZjM5akQ5QzNBVFF2c3U4Ti9ZTUtHdm5UclRJ?=
 =?utf-8?B?MFFsV2RTaTNnSUU2YkhhWXpibHJJcmZqdWFpY1NVZGduMDVHWEw3Y2lMTERl?=
 =?utf-8?B?dzcyUE16VlJZY0dWbG9SNldadDRQS2tVS3daSmhDcUFLUHpwN3E5NFM2T1N0?=
 =?utf-8?B?aERaU2JFU21qcktEM1VmNmVWaFRzYUc2VHMvT2tvRzNGSm1ia0dUWFhqWHNL?=
 =?utf-8?B?ZC9TR1czQTVOR0V5MEJBWDlqc3BuZC9HbVBXVlEyUjBhbG1ZeFk1NDRLOXpr?=
 =?utf-8?B?TWV1TVFhT0NpMm9kYnhUdmNDVXljRktrWGQ5WlJvb1ZjYVV2NnloeU5qYjNG?=
 =?utf-8?B?QTZrd05RMGw2M3BnemlMd2NNQms3R2FJbXluYjlwUGR0RHlaVVI2Y2ZCTFZ2?=
 =?utf-8?B?SWJRRTBSTXgzZmlSd3lYVEtZeUJ1OG14cTh1L0J5QUp5aDhVTXI1Ti84NE8v?=
 =?utf-8?B?L0hDSzd2NWpEMDFnSnZzTWJ4aWhxN29wRmZHZDR3eDNVcC96VHQrMkcxUFR3?=
 =?utf-8?B?elcvSWpYNkgwUndRbDFGbHN1aFBiUEl5U2FldjE4blkwM1NUOGNoRnN2NCs2?=
 =?utf-8?B?SjliaHlMM3FuUlNTb0FYUkhEejd0aG9sVEhhSUNxT2VIczRhSVNLTlV0WVRL?=
 =?utf-8?B?V3pjaU9tZ2RFUEpRS212bElqVWhsanB4dXUzU3dhZTdWNXdEK2pGSDZycnU1?=
 =?utf-8?B?b1U0NkVieXo5WUZZSzFIVS9IRjNKNmJBMVJEZGs2VURzcXBsTlUxSExBcVZ4?=
 =?utf-8?B?TnhxQW9XQUppang4QjlQbTJqL0JUTnJweXBVSVFRRm5jS2djV0VwbTB4K1hU?=
 =?utf-8?Q?UwwzQZ9lRLhT4zDSXT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89597a2a-c3c9-40bb-dd57-08de760f50e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:48:49.0217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znGaQp8tm241yO7G8mywRCPbgPcVTWhg/1dgivzZGgobnNJTFrGwXy/MeWY10ZlD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:kernel-dev@igalia.com,m:cascardo@igalia.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 95A611B9372
X-Rspamd-Action: no action

On 2/27/26 13:49, Tvrtko Ursulin wrote:
> Fix a nasty copy and paste bug, where the incorrect boolean return type of
> the ttm_pool_beneficial_order() helper had a consequence of avoiding
> direct reclaim too eagerly for drivers which use this feature (currently
> amdgpu).
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 7e9c548d3709 ("drm/ttm: Allow drivers to specify maximum beneficial TTM pool size")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.19+

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_pool_internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool_internal.h b/drivers/gpu/drm/ttm/ttm_pool_internal.h
> index 82c4b7e56a99..24c179fd69d1 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool_internal.h
> +++ b/drivers/gpu/drm/ttm/ttm_pool_internal.h
> @@ -17,7 +17,7 @@ static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
>  	return pool->alloc_flags & TTM_ALLOCATION_POOL_USE_DMA32;
>  }
>  
> -static inline bool ttm_pool_beneficial_order(struct ttm_pool *pool)
> +static inline unsigned int ttm_pool_beneficial_order(struct ttm_pool *pool)
>  {
>  	return pool->alloc_flags & 0xff;
>  }

