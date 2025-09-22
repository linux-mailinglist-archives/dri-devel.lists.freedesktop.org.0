Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCCFB8FBAC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 11:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A799910E183;
	Mon, 22 Sep 2025 09:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4XofRM30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABFA10E01F;
 Mon, 22 Sep 2025 09:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re19/W8/X4dIu0Y/X1E7rWFVF7aLYUe7dNUXhePYgF/m+lpUgPFwJCRmDIOv/V0oKvs8DMo+fr+7ay/lLvp5PyKYWgBei68Ls4lLDBjAXz8Vmdg+WvIWBKe3FGB3EJwl/dwmWDGG12gnMXNKRggC+YGPLxfRQIrX0dbyAehNy3Nkw8VD8CYP/5Lqx5Jm3F5UM7ROraWQ6FEbgODZskvM6fKnKei0LjyId5O6E1BQx64/GFn3ysH8tB2Konz1Z7bjMbBEzCSBKhCZsT3++wL2Z1Qz8Y1BuEZ2yNxJE6I0Lb29tDbRaJmVsIqNO7BqFesu85bhTVpFJguRQAGJVM44NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyl5VNr69pkoL2jwJv3Q4s4SWgZbJ4LOQwZ/3g9wOzI=;
 b=oNFB3FCgJCpm4pMP8RjS4lUr9SBhSTb8liWJrWTdsKQr0sWieXrD82iCujqRc/dY9ZdUOek9ar6QHy+skkpxTYg7Q/TyspxjDw6N7zlL30eFSIi/WLVaeoSJIa5R+z14niqe7EugENjM6t/HExV39+qn5yx8+0sIfa9NNexoa0U02zBdLkxuyRMruGC/xJyszF1vVf+i6/Wg6jOST+ls7/fhQhDfR9paQDZHKzz0bVXI7k0DzquPMSXpny+dkciHD72w6Iyg1sNxo2dRSfvf5xKKmkc+SN1IqO2orjyF0GNDDV6c+DsEA+LvMQUYvdDYGwPRwKNFyTH52sjOgCPjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyl5VNr69pkoL2jwJv3Q4s4SWgZbJ4LOQwZ/3g9wOzI=;
 b=4XofRM307B++2cvzLvtsGfTFLpvO0I4gvLZcSyhRxM/32oijz8VHvfuE9hq9yhj1e1fHwFT7Pb708G1HPQQD47sxL5W/7gJgR1wipB+2b4dPxmGc12hb0aVxykjb0IPik2NlIKznugri9V+PXZ2jNzS+ZxAC1Q5W2ebXxazWvGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8308.namprd12.prod.outlook.com (2603:10b6:610:131::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:20:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 09:20:51 +0000
Message-ID: <7b8008d6-4ffc-42fe-a6bf-f2ef708fa534@amd.com>
Date: Mon, 22 Sep 2025 11:20:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "drm/gem: Acquire references on GEM handles
 for framebuffers"
To: Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250919155519.1104256-1-mwen@igalia.com>
 <20250919155519.1104256-3-mwen@igalia.com>
 <4762e5ef-8427-4fdc-ab22-da2dbcb7b8ac@amd.com>
 <aa9ee6a7-81ea-46d3-8043-fcdcbfad882c@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aa9ee6a7-81ea-46d3-8043-fcdcbfad882c@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: ae38bad5-0a8b-49ea-cce3-08ddf9b952ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTVjU0UrL0ZVK3pyVmc5TUU3RDRncHM1aHFqSG5ya205VURQVzNldk9JeENY?=
 =?utf-8?B?THdoYWprMnd0VFdCTWxzRVZHVmg4by91SEMzVzJkWUxxYWE1TEJCMmllNzZp?=
 =?utf-8?B?Wi9FdTRVWVAzRkcxQzhBbHJpYnMyRjRJZ3J6aXg3cjgrbDduT1lvbW4vdGF3?=
 =?utf-8?B?ZTJkckFrYmdtUytQRWZJdm05ZVJEU3NmdjV1Y3hqdkg4Qkg2YS9vUzRFTFB5?=
 =?utf-8?B?SytlMU80bDlKRitTdE5iN2VMVUlKalZTTmtwYkhXU3Q3Qk5JRFFLeTREdDZP?=
 =?utf-8?B?MXpnNlAxUzlSMG1sK2Z6d1gzOEttTzhpR0pBbzl4T1dacWFEVFlNNEwrU3VC?=
 =?utf-8?B?TEdKdlNyc2ZWYTl0OG1nU2NqM2lWVHNqUXFycnliZmh0ZGJpY3llYWxRQWU1?=
 =?utf-8?B?d2srSE1kUDAvakRvSEV3N3ppeVlDUzF2OWhTQit6Z3BsTkNrWlIwelNaRVg2?=
 =?utf-8?B?SE81SHBZWjZPaW9aQ0VQY0ZqZDFxYWgrNFpEaHdqZTZUYWJwVVVyL3p6OTIy?=
 =?utf-8?B?OUFyN0pLbTVxS3FtVGtXcC80SkRHTHBRTWh2MlZXcG8vUnJpdzU2WjdzZGNa?=
 =?utf-8?B?MUl1dGMxNWlxWUtnYTJ6YjF0K1JmNDMxV1h0S2Fwb21NTi95U3E0NmVIeS9G?=
 =?utf-8?B?MjgvZzRra1ZsVFpLTVpJbytzL0pXR1E5VWxwd29XbW03L0xEOENEVEVTM2lB?=
 =?utf-8?B?cG5HQ1NhMitaeVlQdUtrbnBNVHVuVEhheHRwL3p1NFdlWXJhUWVjYTNRQUhp?=
 =?utf-8?B?OW51NXZHZjhwL2d1TEZPTXVwcnI3cVo4S2dqa3dIYTZRMFhyWlRWWFZERWY1?=
 =?utf-8?B?ZmdhMmo3S1NuOVhMVEV6MEpTNmtzSnNzSWFGQ0FUZjJtb3RNR2lrU0J4TmlB?=
 =?utf-8?B?MHpoNVl2Mkp3NVd6REFmWkhVMTcrM0I0RSs2WnlZUzFCZ283VzhMR2VRRHNF?=
 =?utf-8?B?cXdqOVY0MUVPalg2QktiQzdSTk9udHdkSE1wYVRiQ1JpUkw5WEV0YnRtQnNw?=
 =?utf-8?B?R0lFOFlnZkROYXZ3VFdkejZSamJIaUZMcnFwTkQxV2NSTTFVN1dHWTQveGZR?=
 =?utf-8?B?Wnl3SGlESHk3NE1neTBrUTF1K2RNRUNmdG5FTmM3TkorQTlzMkxjd0JWd2s3?=
 =?utf-8?B?WkF2YTh4MlFia3N3aVl4VUhuNGN1bjR5Wkg0aDVtaWpJUklQaXAvRnFDb1ZY?=
 =?utf-8?B?KzI4cUNzdm5xKzh2Mk5HQlIvMUhmSUVGRUJPeWY4aG0zSzFhdHNCcUc2QjEz?=
 =?utf-8?B?a0xnZUJ2b0FzY2VtakZuNTRmWHJ3SExsVlV1NlE3cWZGZWFyRDhKWWx5QzBh?=
 =?utf-8?B?bFU0cVJIT0dTdlhqVnIzY2J1enFROVdhdERGRmdtcjd3UjlrSFJEcTRZZCta?=
 =?utf-8?B?TS9PeXZud2tqa2RzQ2Q4bTZ2U1o0TFpjNVdXMHR3Z2hGRVlMYzBud0VjblRy?=
 =?utf-8?B?MU5TOGcwMHIxZkhPMzlmZ2pHTW9ZamE0UXUyTG16SVcxN1BPT2FLSlRnamhO?=
 =?utf-8?B?OHZkL1hsWlV0Nk15SkFWcmZ2MUsxOGFHM3BPbmFaa1loYTFKb2k5ZysxNjZ5?=
 =?utf-8?B?aVVodDhyWndDSitqdzFQWXpnVTlBYmJYU1VTNnpzMHdhUlJrRjV1N2d6UGE1?=
 =?utf-8?B?SHpiUE1hU3lTSThvZVdESXFXeTIwOUJ0QkNLYTV5NS9CdUh1OTRNMDlvaFJH?=
 =?utf-8?B?TG0wYWhvWWlUTGNRSVQvSzZWWkpYdXlIdEl6cUhRcWlJYTFoMGlneXdaNTMr?=
 =?utf-8?B?VFVueFRUZWloYmRBQkdxbWdJV0xaU2xLYjNhRHpBSi9wL2FGRUNMZkFkSkd3?=
 =?utf-8?B?d0xEUzJqZGRiMGtxcFR2THF1cmVSNzZXSjEydUZkK3ZxQ1RvRkxucXZOSlhN?=
 =?utf-8?B?TzBwbXc5cDFicUdBcHNTdTM3N1Fib1dHWVJkaTU5TlgvN3k3TmpjOFpzcDI4?=
 =?utf-8?Q?PRlwKMdlWi4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpQZTE3SndOT0FpWmJ0dmdHWU10c09FSkkxZTZSRmFDWXp3Wk53SWNxVkFQ?=
 =?utf-8?B?WENMbjY1MWNVUHpsN2JUaGRUdHliUUdsc2syTEUybmdEY0FFT3RXSS9VSjNp?=
 =?utf-8?B?VGFWK0NXRnlIbStHTjh0ZHZ5Z0FXVzZubjF2RVNPZ0IreTRqQW1QU0lxQ04y?=
 =?utf-8?B?ZXhKakNQeThxS0JoY1A1UlQyem5oNjROcWpzM0pKQ3VLVTNnbDV4OXBsRXhV?=
 =?utf-8?B?MFRKb01Wa1pJWDdxRmdVTWlab1BlS1hiT3dIb3pYaEZ1MXRpaVV1V1hSSVow?=
 =?utf-8?B?QmVzTkh0RnhBemhpOHQvTnBUc2lCNFE5TVRPQnVnRTNHemdUMGxOSU8rSGRw?=
 =?utf-8?B?Z1MrWFJNSTZBaXNGNFZPbWthdmF3cmRUQlVjcnl1WE43MTI1YkJNTWZscmpR?=
 =?utf-8?B?VTlHeXI1ZHV1YjY4TkNJNGJLRUZiYXRacDc2OUVNd2FBcE9QakxXVDV0alV3?=
 =?utf-8?B?VXFseWMrc2NUZjVXNkt0TlRCQXF3NG1sbERGcnBpRVJRWDluSHVjdWVRR0c0?=
 =?utf-8?B?N1F3aWhOUFB1djNITndaY3NqVmlxeGIxK280MDNFRVpUaFBXSHJ5eFFTM2RH?=
 =?utf-8?B?UytEdUpnaWRKUUZoQWNOQmU4MG5NQkZMUVNhYWxBd1N2NThsVHFzaUl4bTFK?=
 =?utf-8?B?Ni9ab2xDNWZZNDVXbVpQSVRPK25Pak9kcmJUdTNwTVVoNG8vYnBhY1JKR21w?=
 =?utf-8?B?S2M1OHFpQVI3ZUVIYVRWRTZxR3RwZFBCSXdtTE9kbEV0S0kzMkw1Q2YzUWdV?=
 =?utf-8?B?R2JNZ1ZFSy9ENUhIaGw5cm03K0l0Q2pjckpFYmp2SUYvdjdtR3JKMWYrYmRu?=
 =?utf-8?B?dSs4NkNBRldFaWltZFduV1hyeXhVeExONUp3eDA1YTgyaWJiOU9UMDJJL3Bz?=
 =?utf-8?B?YzR3MWlGYXJoUmhTSHpnM25tTDh6amREc29aeWpvU0U2QU1oTnlSMGR1TFh2?=
 =?utf-8?B?UHpOUUY1aStlbHZkdk9XeWVHU2Izd2Zma1R6bzh0b3pUZDJBUmFLR2lISm1H?=
 =?utf-8?B?YXpNZnVKRUlpbEhLWEdFOFZ3NkhDYnkwdlY4K0ozczZ5ckt0MmhtRGIxaTFp?=
 =?utf-8?B?bjBpcFlPRjcwZTJUQWVYNFQ5aExoQmNqSmt0Mjk4UjVJSGJocTNlSi9uak5h?=
 =?utf-8?B?RHFQUFZwTUx4alhuNUo1a1FlWWVpTThxREMzSFlYL05vTlIraWE3eS9ManZH?=
 =?utf-8?B?eWpnSEVZWWs4MWRmWVJ5Rzk2Vndnc2VrR1JGVlRONTY4Q1E1aExlSEVNZC80?=
 =?utf-8?B?Q1paOVNjNGpmc2xYSlpSWlgrVXI2elA2K2k2RmN5QjNiYk93cW1sQmgzcjNy?=
 =?utf-8?B?VTBYdkc4a09NU0xHTVdab3JCSWJjUTdNZkdtK29wc0JDTENYNTJBcW83dWs5?=
 =?utf-8?B?MnRoMDZveEpKYkR4YUw0NkhWUGVQWEFJZTlMOWtteDVYSDM2TGh1SFBIdFZX?=
 =?utf-8?B?MFE3WE5VSHNYMEVNaDU2RnBNWCthaElOUUpvOVdXdWgwS1BtK3VteEJHTGZs?=
 =?utf-8?B?b3FlNHJpTXF2Ky92ZGk2dVRZOExyaHdlcUl6SnRtTTdEU2RuTk5JZ0daVlh3?=
 =?utf-8?B?MEhyZUxxSnVLNHFkNW83d2VvRndhazBVN1RTYlRlNDRaOWRuSWlpaERsbzFw?=
 =?utf-8?B?WTg0eVpWa2xiYTV3N3FqWU5sQUEyZG5NakhqWm5CK3BPeEh5MjNaZnpTbUhq?=
 =?utf-8?B?MGpQTnlWcWJRcWhzMEZZL0lmVEMxd3NDV0lzZmk2REpDOHlrK3pYck02a2o3?=
 =?utf-8?B?YWZhdC85eU5QNTllanM0YnlzT0RHOXhaNXBON3p3bU1HSGFnMFQ2NXRLNU9Y?=
 =?utf-8?B?aXplanJIZnY5NEpHM0pjRjR1dUhFUWo0MjhGZEJXa01rMlhyMDMwWGkrdXhP?=
 =?utf-8?B?NjgwUXFaMnNzWWJISkl0elc2bzFVd0dxMGtoU1dPc053cTRzMjNZR2t5VjU2?=
 =?utf-8?B?c0RmSlJvTCtCYmVqenptSXErQ29LL2ZYQUZicVJnYkxmSm1CWU9JKzNUeVVV?=
 =?utf-8?B?OC9pUzR3aUNBS21DbUxBSHA3Vm1UNDVWRFUzN2VlSGU1blFwa0RHbk4xbzU0?=
 =?utf-8?B?MFUzMGlNWmt5UFFrdjJQcTlRcVNzVU0wVlZFa3dROWVnN2thU1ZlR1RVOHho?=
 =?utf-8?Q?/eps=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae38bad5-0a8b-49ea-cce3-08ddf9b952ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:20:51.0675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SYDywe1KmOMNgRScBr9n9S5sCGtOkJOXd1c5wIjuV2d8KXxk/i2UbvvCJUTxepw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8308
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

On 22.09.25 10:40, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.09.25 um 10:34 schrieb Christian König:
>> On 19.09.25 17:54, Melissa Wen wrote:
>>> This reverts commit 5307dce878d4126e1b375587318955bd019c3741.
>>>
>>> We've already reverted all other commits related to dma_bug handling and
>>> there is still something wrong with this approach that does not allow
>>> unloading a driver. By reverting this commit, we'd just go back ot the
>>> old behavior.
>> I don't think we want to do this.
>>
>> Keeping the backing store alive for DMA-bufs while they are used for scanout is actually a really important bug fix.
> 
> That bug has rarely seen seen in practice. At least I'm not aware of any such report. And it's also just half of the fix IIRC. Not being able to unload the module is a regression OTOH. I'd rather go back to the old status quo than now having to deal with two problems.

Yeah wait a second, not being able to unload the module is potentially the right thing to do.

So were is that module reference actually coming from? And why do we have it now and didn't had it previously?

Regards,
Christian.

> 
> Best regards
> Thomas
> 
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>   drivers/gpu/drm/drm_gem.c                    | 44 ++------------------
>>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++---
>>>   drivers/gpu/drm/drm_internal.h               |  2 -
>>>   3 files changed, 11 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index 09f80a84d61a..12efc04fb896 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -213,35 +213,6 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_private_object_fini);
>>>   -static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>>> -{
>>> -    struct drm_device *dev = obj->dev;
>>> -
>>> -    drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
>>> -
>>> -    if (obj->handle_count++ == 0)
>>> -        drm_gem_object_get(obj);
>>> -}
>>> -
>>> -/**
>>> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
>>> - * @obj: GEM object
>>> - *
>>> - * Acquires a reference on the GEM buffer object's handle. Required
>>> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
>>> - * to release the reference.
>>> - */
>>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
>>> -{
>>> -    struct drm_device *dev = obj->dev;
>>> -
>>> -    guard(mutex)(&dev->object_name_lock);
>>> -
>>> -    drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
>>> -    drm_gem_object_handle_get(obj);
>>> -}
>>> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>>> -
>>>   /**
>>>    * drm_gem_object_handle_free - release resources bound to userspace handles
>>>    * @obj: GEM object to clean up.
>>> @@ -272,14 +243,8 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>>>       }
>>>   }
>>>   -/**
>>> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
>>> - * @obj: GEM object
>>> - *
>>> - * Releases a reference on the GEM buffer object's handle. Possibly releases
>>> - * the GEM buffer object and associated dma-buf objects.
>>> - */
>>> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>> +static void
>>> +drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>>   {
>>>       struct drm_device *dev = obj->dev;
>>>       bool final = false;
>>> @@ -304,7 +269,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>>       if (final)
>>>           drm_gem_object_put(obj);
>>>   }
>>> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>>>     /*
>>>    * Called at device or object close to release the file's
>>> @@ -434,8 +398,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>>>       int ret;
>>>         WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>>> -
>>> -    drm_gem_object_handle_get(obj);
>>> +    if (obj->handle_count++ == 0)
>>> +        drm_gem_object_get(obj);
>>>         /*
>>>        * Get the user-visible handle using idr.  Preload and perform
>>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> index e364fa36ee36..4bc89d33df59 100644
>>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> @@ -101,7 +101,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>>>       unsigned int i;
>>>         for (i = 0; i < fb->format->num_planes; i++)
>>> -        drm_gem_object_handle_put_unlocked(fb->obj[i]);
>>> +        drm_gem_object_put(fb->obj[i]);
>>>         drm_framebuffer_cleanup(fb);
>>>       kfree(fb);
>>> @@ -179,10 +179,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>>           if (!objs[i]) {
>>>               drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>>>               ret = -ENOENT;
>>> -            goto err_gem_object_handle_put_unlocked;
>>> +            goto err_gem_object_put;
>>>           }
>>> -        drm_gem_object_handle_get_unlocked(objs[i]);
>>> -        drm_gem_object_put(objs[i]);
>>>             min_size = (height - 1) * mode_cmd->pitches[i]
>>>                + drm_format_info_min_pitch(info, i, width)
>>> @@ -192,22 +190,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>>               drm_dbg_kms(dev,
>>>                       "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>>>                       objs[i]->size, min_size, i);
>>> -            drm_gem_object_handle_put_unlocked(objs[i]);
>>> +            drm_gem_object_put(objs[i]);
>>>               ret = -EINVAL;
>>> -            goto err_gem_object_handle_put_unlocked;
>>> +            goto err_gem_object_put;
>>>           }
>>>       }
>>>         ret = drm_gem_fb_init(dev, fb, info, mode_cmd, objs, i, funcs);
>>>       if (ret)
>>> -        goto err_gem_object_handle_put_unlocked;
>>> +        goto err_gem_object_put;
>>>         return 0;
>>>   -err_gem_object_handle_put_unlocked:
>>> +err_gem_object_put:
>>>       while (i > 0) {
>>>           --i;
>>> -        drm_gem_object_handle_put_unlocked(objs[i]);
>>> +        drm_gem_object_put(objs[i]);
>>>       }
>>>       return ret;
>>>   }
>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>>> index ec1bf58e5714..5265eac81077 100644
>>> --- a/drivers/gpu/drm/drm_internal.h
>>> +++ b/drivers/gpu/drm/drm_internal.h
>>> @@ -163,8 +163,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>>>     /* drm_gem.c */
>>>   int drm_gem_init(struct drm_device *dev);
>>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
>>> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>>>   int drm_gem_handle_create_tail(struct drm_file *file_priv,
>>>                      struct drm_gem_object *obj,
>>>                      u32 *handlep);
> 

