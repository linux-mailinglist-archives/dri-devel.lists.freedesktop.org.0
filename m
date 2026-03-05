Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNIoKDGMqWl3/AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:59:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09720212E30
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3BC10EB99;
	Thu,  5 Mar 2026 13:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WXxtCxay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010064.outbound.protection.outlook.com
 [52.101.193.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D49810EB99
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 13:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvKZE0Q62OoNUOWsztIst1hcM0v3RfYfkNEnrAyciJ0sadbdNzBX6qhmO7Y7cmqQhSjIwuApnuUaXH6/InfNoEqqQ3lEY1eCChelnU3QwSc4tipQKUqozgeZbwsSe7K2F6Pxj6ue7YXrc36fkhEEpiZ1/ee6zj+wsH18l2yb46XMugHCJTrr5OPe8/Qow5JaiRQa7ZxuFepW9BcOHdUTqOq4P4L3NaZplo3/q+G5Ge1F4kA1yJNM+KqTxmSRmXW+P7OY5WRtFUVX29RDX2ixek74oNDlfxbtKpMSSD5YPkQGlcWeQJ31KjeRVjl9f4bjE/51qSgwm+/kpdl68djlGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGatJ9zMkZbCRoPvpablYolLXIBeOAgqeuI4O2t5/mo=;
 b=OzsAPHjQTgA68ZUgE5QcAlXPyHQY64jYOmI9MPPAPdEUkNDZJN6NwgIJva6c1BuuL+OPYKegu1TiXZJnOjF3seLOgHusuYQTd1pJTaMWkepaI6aaVkoykf+0ZiExYh1mSL7i3nV5POHBhC2bPrw/ZxMJAIAOLhnSZk7/7rmE6JBuANDzOLasr6i59HQuI8QJpfePKM7CCxg1sM1KX/Gy6r52tMWb5SZT2T4uthFLQ/JTIFRRpWGmNlx4kzXIHcMjtEIfASSScmPMroSYC0qGM9SmtCvY4vOmynQ5QyqVfClg+H3aCpaYMUn3FcmulsM7GkUomUrndfQ0vrVuMjYctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGatJ9zMkZbCRoPvpablYolLXIBeOAgqeuI4O2t5/mo=;
 b=WXxtCxay9pvHcJ5OnPcnYe9mRjz/2Ca7wPuVZFiNqajK1m7sF4sjAvcfSAXJdkMv9/SifwB9t8mo2lGZ4/6DDr5pMUEOGOzElmuXW1nSPKM+lrzECMpEHNVdkkITZCALD2QZuHBc6wIvWfe/hzKYNpTKSzBdSiDautto9Vyk3L4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 13:59:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 13:59:06 +0000
Message-ID: <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
Date: Thu, 5 Mar 2026 14:59:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: phasta@kernel.org
Cc: dakr@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f41971b-3ba1-40ee-afc8-08de7abf5d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 45UpmzwPC6AWGuNvX9np5EAzq28pKfgJ9DJfgvqfWDoA5JAiGGBzGkvXOL5UEng/PpgGadAfxjSHZjD01EkAYx8pyaro7zHekpWDJLF+y/8k07LDGzNUKfaiMoWUqyxZ/BegzWzj2D9oADTKVHH+c1dwzlXoTh9ia8qWyb4+vWiMVFe3jxhYaK+2rbYbQIMfApqjLD8bxN+UPXVyIUL0SjOgTukfd9NHHQOczDKaJaEMx0nTGF9bz8yYQ/cbTIMNHvr/OLsK0Y4lQLuEYiyxY43WSxDfr/xaojVBM2E2UJ2ifQ7JmRIJK52sHyYQ8AVv8+/Kb9jvGyEYEVfFUkB8fYDcJ9hboiLCdQvi4ZUTi2f9XPYEem2aD+nOy9I8cHAY4XHwjOY2nat6ZtifQtc65ur/aW5FFe1M7VvBmc8aTRFob9EqXaeTr1Wb3rh+DHpmuaV9+BL5P7j+8wQIY3mO5sIrSI7zksArbqFB/pDsdd9R/2nlsYN4XwBasZbvGirFyDpcBeEEtla/2mtRYtF5TpZzdzXXd4SVLxzntDCkg/0brnDnkJ7aye5qrTCJkEUMpYM4sLCCNG8pP/HlRaeqCCUN0r5Y3oaChBoUnmPVXObKa0XTUSAQuY1aTk+ExLidab8vzO1md/1u3gzmJWja+8ZtqiIPtx6cxEbdJ0r6DBa/GAByFjTymdrIQyWjkqG547rRHSiD7q5CctrSzSzC40y4LW6Hh7D1/JH/szzw1C0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alloSFVVQnM4UjN3elVlSnNKc2J4ZmJQb0kzdHQyYmVLenNreWVadXNxUm5V?=
 =?utf-8?B?aGhCYWxVeGt2ejZJd3B6c0N6aUYramdmQlBHZThlWUxDTzEyK041TDltVFdo?=
 =?utf-8?B?TTBUaU5mMXg5RFVNYTVrdVB4V3pSTmEyRTNjU3J2c1hvSSs2MTdDRWhRejNC?=
 =?utf-8?B?RWVqQldnL2RrWkJCMnhqMEpxaG5idmRhQnpjeVFQUkRHb1lIMUdoNS9ZcUNC?=
 =?utf-8?B?TWN1cHZLZkZlN1k1bmpHMk0rSFE4WWxpa2NIZUo1MUhLdTIrQlZzTzRXay9w?=
 =?utf-8?B?THNQdkJocmJ3SzVjcVJ0cEtvSjVSTWMvQVp2OHFYdU1ZbzlXbXEwbGFCT3dK?=
 =?utf-8?B?N2FmaHUrWHdERDRRMXFjRDZPL3lZam1qNkFQMWMrL0k5THMwb2NQR0ZKSkNV?=
 =?utf-8?B?WVBaalN3cm51dTFZWktBQVRXWjE4eW5LNUovdWI4aG5PNWNzM3dreDFEQTBZ?=
 =?utf-8?B?TTQ1T1FOZXdGTThQNHdaa05MMk52c25JVk5UejJKdVJ4bFhURjBoWExxMnhF?=
 =?utf-8?B?aWJLSWVRTUZTbEdDSGxaVlpNM3NkcG9La1BxT3hVRUFqSXhLYUpYY2tMNHMx?=
 =?utf-8?B?TDBvN3hPaW1NZ2Y4YytHcExIWEtEU0tKL1BHQ25VUVVBaVNONUlZeS9xL3RM?=
 =?utf-8?B?SFdFeFREOTkxWHBWMzNaNGlRSXpFb3BQSEtKdGdrNndvYjRHVzMrcSs2eGM0?=
 =?utf-8?B?VmxsZFl5Sk1sZDBNNFNwNVFFN25Fd1preVpLMG5JSUttMFhZSzhNOXV2VEV3?=
 =?utf-8?B?K3ZFUnU4MGlvMVFjb2pNbjBXcHY5UW9rUDhYc09ZczA2ekEwblZMUi9lWCs2?=
 =?utf-8?B?MFNXQXhOaGJwZ3hyVzI1U0c5b08xRm1sejVlOFBSbWJqOWp2dnRHVWdBcUgy?=
 =?utf-8?B?L0FzWUVDMEJxeWtFYXNFdWVaTXNtd0NpRTI5cnkreXZjMmRxdFZQdlduSkdY?=
 =?utf-8?B?NHRMWG9LclhxV1Ribzg3V3ErS2FKZUYxbmFXZjRqeFpPb0F4NUZwMWpPOE1J?=
 =?utf-8?B?N3hGcERyaU1xL21VV2N3bTJBaGxZQ3NYOE1kTDZVS2k4ckxSdWVQVmFIalV4?=
 =?utf-8?B?Z0hUOHdBdyttcWpFZ2pibzhkVzM5NkRKamdHQmdvMHdZSloxNUwrMXB0Visv?=
 =?utf-8?B?QjArd1hyb0lqZmdZSzVVQ3ZaZFQxaFd4di8vUWVIdGk4MWpzcndqS1NZVHJi?=
 =?utf-8?B?b3NUZGd5Y0pTTEN6Q2JsTUFBVW5rdDIyWVRCa09KYXEvWUpvbDlsL3R4MHdC?=
 =?utf-8?B?TTZoT1hDQXZ3UTNCQjFyUitVdStwT3dEeUo1RENNTWs4VzMxQStDT0FZbit5?=
 =?utf-8?B?ViszdWV3R2ZONUlxVFd6NllRS2JmM2RjQmlKNGt6ajFpTFdvUHMvdlZoRFN5?=
 =?utf-8?B?UnJxMlRZYTIwRElibWd6VDZyTUlHTmNCZHRNdldVNXFSWS9GZ1U0a1lnbkRy?=
 =?utf-8?B?SVZlbkk5VW9WZDJGL3U2dDRsM1pHejFmbGkvaDVWL1lXRXYwYTE2V2RxMytH?=
 =?utf-8?B?UTljQmRKL2tsYmhVUzc4TEdMRWJ0enBMZUlLd0VxUllDRkNZK2tYQmIxTXBN?=
 =?utf-8?B?S28zTHQyRHpHb0pWUGRSd3kwZGFOcGRxWFM0ODBHSGVzYXE3eUoxb1VQcFEz?=
 =?utf-8?B?WFo5a1pJV0RabW12Q0ZxT1lEdUpNQjZnTHpNMXJIeURkRzlWNnB2c1U0eEN1?=
 =?utf-8?B?NS83MnEwNGxPNTRub3l4eVRoKzBHYkk2dTc3bXdKb0NmN0FBcXU5OTBmM2Np?=
 =?utf-8?B?VmdvQVhWY2VzRWtFNGc2VFBuZFJMWUhlcVgxYTVad3VSeFpDL3FCTnNvZDU3?=
 =?utf-8?B?c1NmQWZyNUIvdERKdVJKcWlSbXdHK1dieGsxK01jajZoWFBEYkNZeG9YdzE4?=
 =?utf-8?B?a1oyQXpGMTRLUG52dGhMNHE5Y1B4bXpsZFdmT3cydlpOcnMxbFhrNDJEM1lv?=
 =?utf-8?B?Yjc1d0puYzNHUTlHS1JEUUltWkNjRWx6dHdmR2VNcyt2ZjhVcTRYVjJSOUJk?=
 =?utf-8?B?SkRrTUE1SUpnS3pGWTZkRWxwSnAxOFl5a2VmTmdqNkY0UDMrWFowdkxHd29K?=
 =?utf-8?B?UVFLc0lQWVh1WTEzVDBPalBMRXhNclpWNjlNNkIxWFByQjY1YjM3L2dvZ2ZZ?=
 =?utf-8?B?d0Nkam90em9RS0VUVXFVemZLbmJWaUR1Qjc4WWFWNVJzM2Z0Yk0rcloxK1BZ?=
 =?utf-8?B?emh2Wll0ejVpTkNidHV3S0N3a2VVUlJ0dDU0WE1QUDErVjQvUG53V1FBRWpX?=
 =?utf-8?B?TUZ4VEc1cTMzOWo0WWl2NGFxZDV3bU1iWSt4dThaZjRJTjhGUCsrMzZUYktr?=
 =?utf-8?Q?miyMVvsWUGAv/E55wk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f41971b-3ba1-40ee-afc8-08de7abf5d9c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:59:06.4913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvgipJYwMl6xE6CUC/0r1BE1CMp0pypxc6Z7QGuR+C5LStOVs2Uq+CLLAZ5zBO9/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411
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
X-Rspamd-Queue-Id: 09720212E30
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
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:mid]
X-Rspamd-Action: no action

On 3/5/26 14:54, Philipp Stanner wrote:
> Yo Christian,
> 
> a while ago we were discussing this problem
> 
> dma_fence_set_error(f, -ECANCELED);
> dma_fence_signal(f); // racy!
> 
> 
> I think you mentioned that you are considering to redesign the
> dma_fence API so that users have to take the lock themselves to touch
> the fence:
> 
> dma_fence_lock(f);
> dma_fence_set_error(f, -ECANCELED);
> dma_fence_signal(f);
> dme_fence_unlock(f);
> 
> 
> Is that still up to date? Is there work in progress about that?

It's on my "maybe if I ever have time for that" list, but yeah I think it would be really nice to have and a great cleanup.

We have a bunch of different functions which provide both a _locked() and _unlocked() variant just because callers where to lazy to lock the fence.

Especially the dma_fence_signal function is overloaded 4 (!) times with locked/unlocked and with and without timestamp functions.

> I discovered that I might need / want that for the Rust abstractions.

Well my educated guess is for Rust you only want the locked function and never allow callers to be lazy.

Regards,
Christian.

> 
> 
> Regards,
> P.

