Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15598D1919
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5549410E65D;
	Tue, 28 May 2024 11:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bvWTqqkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1C510E43B;
 Tue, 28 May 2024 11:03:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z90ILAnXC1ZItvNLN1mIjEjOn801KcJ9DsAAcUOwiEkaxtyJzLQyu/JnE1x6opiKciQ5Cw97Mp7slwv94ZAQ3GNEx5h0FfmhENwjenxlygGW7gA3ThKhjSlvi0JnGXqVPIx8DtfWlbcB3WCTmKXUnxXrV/tWOowhkRD+6VIagsmC8b+2IHb2pv9FeGOQhSu+zUV8iYUUUwpag4kr4lSSYTxK1c8/67JnD6CqBjrulV3pgFmGLX+kbRoAp5i2oi8Og1sBxeGoa+Ov/1AApPLUIvnAQOGE2o0hCYYyNf9xzGqx46YsYi/GQDPJs/Ck/O3ykaRyItMILTk18rLb3SKZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVGJgaDG0sb07g9siFDuf3oyFoO8N9WlL69uw5oUcbU=;
 b=eDKtpfNjv75qov3IfOuCU1Oh2Lkw5xFIl3T/M6CEPkci0uWGatg1nmg70v1fOJZaASiYy1e+7u8dpftlZo0/vIKrK6BufTqlMaje1mbXanS8j8lzKQNjTz+RViihC71pQW+MFdEl3rkm+gi6cT2xBZ5B0a7fKU6pw7XWQZ+KWmOhST+VYF8pyoz6kQ8LreV6ZhY98Z+ljp24HCoZuv0rS5sFS4TSFRNHOSvvdEZ3vzzbkqE5jW8o71eTTPBQSCYmL8/Um4lfMGrEGiELzDCfvYG/KukzbPwtmHazuW3AZT5iEtCrVzSiIS8Y4em+sTrhICoamGz2UXK1fWqvTwRMEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVGJgaDG0sb07g9siFDuf3oyFoO8N9WlL69uw5oUcbU=;
 b=bvWTqqkpjvbGoeiM2bgNXLtQ4ByWbKD/PxU2h6tCJ7h2bUWF/q9iCexKGUzY0vPQcibBxN4lhH7h1IBWVMeTkZn2ZryjNDbk/ay36fg4wUwilMWeymchkJfzCE7b/gKX7d8+Aj2b0gNY62ATqFyI3lOnXlnMdiLS66NTB03tcBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8750.namprd12.prod.outlook.com (2603:10b6:930:be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 11:03:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7633.017; Tue, 28 May 2024
 11:03:38 +0000
Content-Type: multipart/alternative;
 boundary="------------nipCO9CCWmh0z9MX2U0wKxmK"
Message-ID: <651da09d-347a-49b0-9387-7d33d02eebb5@amd.com>
Date: Tue, 28 May 2024 13:03:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 13/21] drm/exec: Rework contended locking
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-14-thomas.hellstrom@linux.intel.com>
 <fb9efb6b-fd2f-424e-8c9c-8ca590ee714a@amd.com>
 <3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com>
 <e0fb45b9-69a8-4e36-a518-30380583fcd2@amd.com>
 <b5dfb6280aa6a9fd0d2449027b8bf14276f1baab.camel@linux.intel.com>
 <dc1262b26f16daabcf0a9b7018f7605da4202d41.camel@linux.intel.com>
 <5d6f1197-3303-4197-a4d6-ff1fe4d7f1f9@amd.com>
 <3716d43462188590743060755b37e3d060f7600f.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3716d43462188590743060755b37e3d060f7600f.camel@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fa8d51-555f-4062-10cd-08dc7f05d3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WS9jSHZNMTh6cUYweEhtZ3ZsczdLRTd3N0taaDZGSzFWblcvMzhDRExoUG95?=
 =?utf-8?B?QUkrOUlpVWxxbTU3ZjBERnZnTU9IeUtzUDhGaTNndzZNL2NwU3BhUm42WWp5?=
 =?utf-8?B?L1d6cktTWjF0cktqQjd2dnUxTjRINkJ0YzRYZ3RTOCttQVZHQWRsRWd4VFF3?=
 =?utf-8?B?bGVIZFJxektSQm9QbDhuSzFYN3M0Ui9EMDRJUDF6TjYvQ21hTlpSS0RmNStE?=
 =?utf-8?B?NVloQ3NibDZPVzZ3d0RsdEpFbDI4cW1HeVVwL00vZDhHZ2xZRUpRTG5jNXhj?=
 =?utf-8?B?RFVFVjhxa2Nmb0NpeHoyMmZ2YWV3c0hIbTd1NU5uK05nOUlaYTZEMjEyRDlZ?=
 =?utf-8?B?ZVlOcENlUTA0b2Z0WDV3ZW9mUXB1VCt1U2tPUTFXL0pwNGNqSjYrM00yVWhC?=
 =?utf-8?B?Ylp3TXNoeEZJRlROVzlIR2d0RXZTNHVQSDZZSG9IeHJyQlJHUjVSQVRHN3N3?=
 =?utf-8?B?WmdWMnJOM3pMQUkxWWlvTEpkK1RKL1pOenFUMjZuRitPamNxR3YvUjIrUnZp?=
 =?utf-8?B?b1A1Wkd4d3lkbEdpNnJkVEEzK2xVbW5uQ2srMU4yN0lBRjhBdk5RQ25xUExj?=
 =?utf-8?B?a1hRWC9HY2RPNnhuOFUwOXl4TnZhYUxmNHprRExNT2p1ZXlKN2RReGdpNEJS?=
 =?utf-8?B?d3RjaEVHdERTWXJDVU1HeHZMNm9IbDUyZlFHSi96Q0RaRDQ4K1k1RGtReG5Y?=
 =?utf-8?B?ZkVvNkdEdG1pWC9jRWdFb1JITlpXZWdwOWxkdklESmxmRHFHaWtSek54Vyty?=
 =?utf-8?B?YXBoTFFETkhJQ0h5Nzd4YXI1RjJFVTdMWlNPVUVicWdMaVlkRTJWaTBLc25Q?=
 =?utf-8?B?elFIYmkwK2ZNMm5rdXdHKzV6Tms3a0lDRmVzeituejV4L1pMTCtUS0FwMWZu?=
 =?utf-8?B?dG1qWUkzQlZQUU1ZOU53cElNcUVGRTZrSW1zOW1yVXQxT3RGb3d0VG1kYjZW?=
 =?utf-8?B?TEhiWWFPRVhzOG9rM2tKd093bHJuWndJZ1ZMczVtZXlYN0t5M1ppK09lNDR2?=
 =?utf-8?B?NkwyKzdBMER3VUUyQ1kwdDdRU0Y1S0RvKzczWFF4bUpCYlZ6bXV3dEo4TU1T?=
 =?utf-8?B?M1NoSTFMdVU1VElVOCt0bjBuQjZTM1ArVWNjNFBEaTZJZFNFWmd5cDhFTnRD?=
 =?utf-8?B?eWdJbGx6ODZHWERUNXl0WG9pbldnUFFqUDRUK3k5eW5YdlpkTE9QWlNaNnBk?=
 =?utf-8?B?akx4M0poWGVudjF6YlpjYUEvUnpVSG1oTzM1cTluOFFtT0Q2ZkxyV0RBU2Ux?=
 =?utf-8?B?Y0JCVXg2dzNCMUpPMUloMGNycHJUWXZvN1FoS2JON0sxV0NjNmsySUsxdU5Y?=
 =?utf-8?B?VHFoY0VzaWJ4VURPcGVFTnJYaEQvMVVoUXRkNmtVOW4wUm9wamUvQlU3WVNz?=
 =?utf-8?B?YjJaZUxMbnpWQ2UrSVlVWlJjVWE0UkZ2V21GUDhITWNzazJPUnVCVXB4ME9N?=
 =?utf-8?B?bjAxQnZEVnlhM0oyZGxCVVJ0bmlMYnhwUEhYeDh1b3RKbkRyWUc0VzRrTXRy?=
 =?utf-8?B?MXpWZ2Z6RjVSNWwyS0xEQURjeFE5NU00UU9lem1GWWxub2o5aURiYkkrbzUv?=
 =?utf-8?B?M0E2NUQxcHNYdWlDOEF3dUdXS1E3ZTF5endWNlB6WUttdkd3U0ZlNW5Xb01O?=
 =?utf-8?Q?BnBS76ihyaZUGUn6SWXybpeJguGcm6t/df0vUlYjD8Ro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjVuT2ZaelZJWjFONHJlQVpBbzhEdkM2cjlaalI5VjdKTHBhM2FKMFV6RHBK?=
 =?utf-8?B?ZituNlBvbkhlK0dWSW1oVUlIcjhVbGRRYkF0Q25BNDI0SkduYTBZSko2QUdI?=
 =?utf-8?B?cThrbWh2eEh4RWwyWXhvMForRFVURXBEcDF6cEhUZ0ZZSnNmV2VqVktPZlpu?=
 =?utf-8?B?U3JRbSt0SGxNWkFxMjhLR0MrYnFoUU1Cc3pRejVXVlBpckZHVWVtcENVTGtB?=
 =?utf-8?B?T21KaTlqcUpibWZXSExaOGFOOVlLcElNME1oQnBhSjdMTFozSGtDMGNEK0RL?=
 =?utf-8?B?OUtmOHZKbS83NWo3ak15R0pXMzBZb2xTVklQaGJFWUpzUFhDcTNud0Z3VlF5?=
 =?utf-8?B?YjdaZ1ZJdGUxemlYRFRBazQ4eXJyamRsd1ZjeEdHaWFSWEQxUys2RkNxMjJj?=
 =?utf-8?B?V3paNmVhNjErVTFEUEtUL04vaklaN2cra2VmMTUwTXpkMUN1OVg4R2FjamVh?=
 =?utf-8?B?NWhUQ1BsYjlnSEFBempJa0N0ekNVWEN6VTAxUDRjYUNKOTZFZFkzUDNKL0JL?=
 =?utf-8?B?OFVFeElES3lzWXVTRlBpbFRyYmNIZjBVOEUvSE9KWU8rM3NFREp3VlJSQStG?=
 =?utf-8?B?YTIySVVkWjFNaW5YUXdLZWtJbTVrRnVZTDFONXZqbCtLbFViVXgvcGtlSENq?=
 =?utf-8?B?U1hGRlF2Y1VPRTlGS3BxYlNUY3dDRmJWODZTY1dkSncvVmFNMjNHeVRPSUo3?=
 =?utf-8?B?UGZxWXV1dVJTNkx1NlVhOSs2aXd5RC9VSlozZ3BFUW5VNjk3RHllUnRENi9o?=
 =?utf-8?B?NEdjWG5RR0MrQlFGN3pFOXptNE5RUThpcHVLeWpNVFlGcmFzVHd5TmlHMHAv?=
 =?utf-8?B?MU96SmFiTTlCNDd3SkhFQXVLekZMSTRwZ0JXMlNDc0tib1dVQ3JzeHFqT0g0?=
 =?utf-8?B?WFBzbkhhNjBRcGxYVnNYSWhYWnVFNVpNclZGN3E1a0hQamgrMkZ2cm1IUVkw?=
 =?utf-8?B?VW9PdlFNQ2ZhVERERXFtWElWZFZnemRJYi9IT00zSW1rOEVVSzRIZzVoVjh4?=
 =?utf-8?B?UW9OclJSRDUwYU5CeVQ5alRtMFZKM2pGYWlQRTlEb29Pbno5NWhKYVhJT0ZL?=
 =?utf-8?B?Ukh5WHNkc25MRWVGYWpUN3VjaituYmg3YldoRkxBdzNsdENvcXc3UllwMmJS?=
 =?utf-8?B?eU9hQkdhRVJRcFhIdTR2RzlWamJQUDZoN0xudGQzd1BaVVk5TFNUWDBLc3BV?=
 =?utf-8?B?TlJmdit5MjUreC9vcFRBbVNwUjdGVXVwa1Jjd042NzE2YlFlaVR1Z1htRTVl?=
 =?utf-8?B?cmN2eVNmenFwS21pUjlXSEg4dGN5bGx0eVdmMGhnbk1UYXpwVy9KWUpHWGla?=
 =?utf-8?B?SzFLZmZ3SjFJbVROY2hCUkJ1SmtVbVpJanNBUitlM0N4b3FXaTFadXpnUDlB?=
 =?utf-8?B?ZUszVXdNTW9ONVRtN0p5Nkh0RTcwWitpbXc1OUorWnY2akF5SDZSSFFaSGdr?=
 =?utf-8?B?K0plNS9lUWVZY3hMOHBPSWI1ME9WcFJCb3JsMXlGSU82cUVJU1VNZU9hMjhE?=
 =?utf-8?B?RjhLWE9uTk5RWFFGMGw5TmxLZk9sby9WNUdrLzJ5ekdTL3RRenEvUCtxSUVv?=
 =?utf-8?B?eXRLcTh4aFNUMFZsaHYyamVmd00vbGdUTlgzWGk0TG5pckp1aW0xWnVZYUxK?=
 =?utf-8?B?Sm9UbmgxZjZzRmExY0psQUNMVmlvRXNkSDVLdnRmU1BnL1FuSG40elJXRWFh?=
 =?utf-8?B?Smt5am1jcTRuK0dEbmRPdExtQkp5ZWxiOXV2Ti8zMENoSW4rSVpHdTBhU1RQ?=
 =?utf-8?B?c01oYjd1WlhzdGVsTzNVTi9zcndpQUlBcmgzTnBxZGtrcERhZDFJUlV5elVT?=
 =?utf-8?B?S21NT2pjdVhkWXBQK0hzZDNTWHpicVg2WVMrQXdabHZzVzZBTUJjNTRTN2t2?=
 =?utf-8?B?SndkanBSZHQzUTN6UnpjbHJqTnVYL3J4VExDcGYvbENBTmp3OHRCalFoSFpP?=
 =?utf-8?B?cmplb0laRmVGWEVrU1pXdVY0NjU1Y1R4ZGZHWXJyc21WeW0xZi9FNjBMK2Vh?=
 =?utf-8?B?L3NGOC9UUUgxZDFQbERWNzVOb3NSVE4zU09tUm16aTZ0L28xdVdXR2V2NzFm?=
 =?utf-8?B?SWZ3emZyaUsreXlnWmJUdUl4Sm1jZGVXREx2UTFsSDVha084OEp2cXd0TWlk?=
 =?utf-8?Q?uFauLjmSQ/IMh8028lGhe7c63?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fa8d51-555f-4062-10cd-08dc7f05d3ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 11:03:38.8450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jjue+zZhWcwJrOcpRYKwzfHzEjjFHOiv0HXZ02Id1Gh1uc5r/AjmKnfRn7ClWNTc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8750
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

--------------nipCO9CCWmh0z9MX2U0wKxmK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.05.24 um 10:07 schrieb Thomas Hellström:
> On Tue, 2024-05-28 at 08:51 +0200, Christian König wrote:
>>> 2) Any contended lock held at loop start is completely encapsulated
>>> in
>>> the ww transaction and can and will be unlocked when exiting it, so
>>> this patch doesn't introduce any additional problems for userptr
>>> handling AFAICT.
>> The drm_exec object was intentionally design to not have anything
>> locked
>> at the beginning of the loop. See the discussion I had with Sima
>> around
>> that when pushing the drm_exec object upstream.
>>
>> I would really like to stick with that design and honestly don't see
>> the
>> reason to change that. Contenting on a trylock seem to be much more
>> questionable.
> The change here is to make sure we *don't* have contention in a
> trylock, which is otherwise inherent in the current drm_exec design.

My sentence was probably a bit misleading. What I wanted to say is that 
trylock as first thing in the loop sounds really odd to me.

See the intention of a trylock is to acquire something optional. What we 
do for the freshly allocated BO and the 'don't try to block with the 
mmap lock held' case is actually kind something different.

A clean approach would be to to have the BO initialization and backing 
store allocation steps separated. In this case you don't even need to 
use trylock here.

And for the VM fault locking case the clean approach would be to tell 
the drm_exec object of the vm_fault parameters so that this helper can 
do the drop all locks, drop the mmap lock, acquire the blocking lock and 
return -EAGAIN.

This has the huge benefit that we not only stop blocking for the faulted 
BO, but eventually all others which might need to move so that the 
faulted BO is CPU accessible. I think that this is actually the more 
problematic case.

> What I'm trying to say here is that we end up with the contended lock
> grabbed at loop start you already conceptually have a conflicting lock
> held (the we_class::acquire_key). Both these can be resolved.

Yeah, I'm perfectly aware of that. But this is just a shortcoming of 
lockdep and not a real problem.

During the drm_exec code review we already moved the ww_acquire_init() 
into the cleanup function so that it's only called at the start of the 
loop. Background is that we ran into lockdep warnings with that otherwise.

But functionally it would still work if we do this in drm_exec_ini().

>>> 3) The need for a fully capable ww transaction helper moving
>>> forward.
>>> If we need a tool that also does userptr locking, then I think we
>>> need
>>> to separate that from the ww transaction tool and only pass the
>>> latter
>>> around to TTM.
>> drm_exec is *not* meant to be a ww_transaction helper.
>>
>> The functionality here is to support drivers in their CS interface
>> and
>> that includes userptr handling as well as a couple of other things.
> Then if so, I don't think drm_exec is the correct functionality to pass
> to TTM to resolve the eviction issues, but rather a ww transaction
> helper that can be used standalone *and* by drm_exec. Now the
> functionality would be more or less what drm exec is today, but
> slightly augmented.
>
> But then IMHO instead of changing name and more or less replicating
> what drm_exec is today wouldn't it be a better idea to subclass
> drm_exec into a full-fledged CS helper at the time when that
> functionality is indeed added?

Mhm, interesting idea. But it still means that the base object needs to 
be designed in a way to not prevent the implementation of the subclass.

Christian.

>
> /Thomas
>
>> Regards,
>> Christian.
>>
>>> Thanks,
>>> Thomas
>>>
>>> On Wed, 2024-05-22 at 19:42 +0200, Thomas Hellström wrote:
>>>> On Wed, 2024-05-22 at 18:52 +0200, Christian König wrote:
>>>>> Am 22.05.24 um 16:32 schrieb Thomas Hellström:
>>>>>> On Wed, 2024-05-22 at 07:52 +0200, Christian König wrote:
>>>>>>> Am 21.05.24 um 09:16 schrieb Thomas Hellström:
>>>>>>>> If contention and backoff occurs during a drm_exec ww
>>>>>>>> transaction,
>>>>>>>> the contended lock is not locked again until the next
>>>>>>>> orinary
>>>>>>>> attempt to lock a dma_resv lock. However, with the
>>>>>>>> introduction
>>>>>>>> of
>>>>>>>> drm_exec_trylock(), that doesn't work, since the locking
>>>>>>>> of
>>>>>>>> the
>>>>>>>> contended lock needs to be a sleeping lock. Neither can
>>>>>>>> we
>>>>>>>> ignore
>>>>>>>> locking the contended lock during a trylock since that
>>>>>>>> would
>>>>>>>> violate
>>>>>>>> at least the ww_mutex annotations.
>>>>>>>>
>>>>>>>> So resolve this by actually locking the contended lock
>>>>>>>> during
>>>>>>>> drm_exec_retry_on_contention(). However, this introduces
>>>>>>>> a
>>>>>>>> new
>>>>>>>> point
>>>>>>>> of failure since locking the contended lock may return -
>>>>>>>> EINTR.
>>>>>>>>
>>>>>>>> Hence drm_exec_retry_on_contention() must take an error
>>>>>>>> parameter
>>>>>>>> and
>>>>>>>> also return a value indicating success.
>>>>>>> After thinking more about that I have to pretty clearly NAK
>>>>>>> this.
>>>>>>>                                      
>>>>>> I thought we were beyond upfront NAKing in the first reply :/
>>>>> Well my memory could fail me, but I mentioned concerns on this
>>>>> approach
>>>>> before.
>>>>>
>>>>> I was a bit annoyed seeing that again. But could as well be
>>>>> that my
>>>>> response never got out or that I'm mixing things up.
>>>> I haven't seen it at least. Last discussion on this I saw was
>>>> here. I didn't see a follow-up on that.
>>>>
>>>> https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.camel@linux.intel.com/
>>>>
>>>>
>>>>>>> It's an intentional design decision to guarantee that at
>>>>>>> the
>>>>>>> start of
>>>>>>> the loop no object is locked.
>>>>>>>
>>>>>>> This is because Sima and I wanted to integrate userptr
>>>>>>> handling
>>>>>>> into
>>>>>>> drm_exec as well in the long term.
>>>>>> First I agree the interface looks worse with this patch.
>>>>>> But I thought generic userptr handling were going to end up
>>>>>> as a
>>>>>> gpuvm
>>>>>> helper (without using GEM objects) as we've discussed
>>>>>> previously.
>>>>> We might be talking past each other. That sounds like SVM, e.g.
>>>>> on
>>>>> demand paging.
>>>>>
>>>>> What I mean is pre-faulting during command submission like
>>>>> radeon,
>>>>> amdgpu and i915 do for the userptr handling.
>>>> Yes, then we're talking about the same thing.
>>>>
>>>> We discussed in this thread here, started by Dave.
>>>>
>>>> https://lore.kernel.org/dri-devel/CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com/
>>>>
>>>> I still think the right place is in drm_gpuvm for this sort of
>>>> stuff.
>>>> And I think that's the concluding argument by Sima as well.
>>>>
>>>> In any case, If the planned drm_exec development is to be a full
>>>> execbuf helper, I think we need a capable sub-helper for ONLY the
>>>> ww
>>>> transaction locking as well, with support for the various locking
>>>> primitives. In particular if we're going to be able to port i915
>>>> ww
>>>> transaction locking over. There are more uses of the ww locking
>>>> transacions than execbuf.
>>>>
>>>>> For that you need to re-start the whole handling similar to how
>>>>> you
>>>>> need
>>>>> to re-start for the mutex locking when you detect that the page
>>>>> array
>>>>> is
>>>>> stale, the difference is that you are not allowed to hold any
>>>>> resv
>>>>> locks
>>>>> while pre-faulting.
>>>>>
>>>>> That's why it is a requirement that the drm_exec loop starts
>>>>> without
>>>>> any
>>>>> locks held.
>>>> But wouldn't you need an outer (userptr) loop and an inner
>>>> (ww_transaction) loop for this? Why would we want to re-validate
>>>> userptrs on -EDEADLKS?
>>>>
>>>>>> Anyway if still there would be helpers in drm_exec for some
>>>>>> other
>>>>>> generic userptr solution, those need to be done before the
>>>>>> ww_acquire_ctx_init(). The contended locking here is done
>>>>>> after,
>>>>>> so
>>>>>> I
>>>>>> can't really see how these would clash.
>>>>> Yes, that indeed was a problem. The ww_acquire_ctx_init() was
>>>>> intentionally moved into drm_exec_cleanup() to partially
>>>>> prevent
>>>>> that
>>>>> issue.
>>>>>
>>>>> I haven't fully figured out how to do handle everything
>>>>> exactly,
>>>>> but
>>>>> at
>>>>> least in principle it can be made work. With this change here
>>>>> it
>>>>> becomes
>>>>> impossible.
>>>>>
>>>>>> Still, If we need to come up with another solution, I think
>>>>>> it's
>>>>>> fair
>>>>>> we clearly sort out why.
>>>>>>
>>>>>>> I think we should just document that drm_exec_trylock()
>>>>>>> can't
>>>>>>> be
>>>>>>> used
>>>>>>> to
>>>>>>> lock the first BO in the loop and explicitly WARN if that's
>>>>>>> the
>>>>>>> case.
>>>>>> Unfortunately that's not sufficient for the general use-case.
>>>>>> If
>>>>>> we
>>>>>> want to keep the ttm_bo_vm approach of dropping the mmap lock
>>>>>> when
>>>>>> there is contention on the bo resv, we need to be able to
>>>>>> trylock
>>>>>> on
>>>>>> first lock.
>>>>> Mhm, why exactly do we still have that dance in the first
>>>>> place?
>>>>>
>>>>> I mean we have sorted out the mmap() and dma_resv() locking
>>>>> order
>>>>> long
>>>>> ago. See dma_resv_lockdep() which is enforcing that.
>>>> I explained that in my reply here:
>>>>
>>>> https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.camel@linux.intel.com/
>>>>
>>>> We shouldn't be holding the mmap lock when waiting for stuff. In
>>>> particular not while waiting for mutexes that may be blocked by
>>>> gpu
>>>> activity.
>>>>
>>>>>>     Also bo creation is using trylock but might be able to use
>>>>>> a sleeping lock there. But if that sleeping lock triggers an
>>>>>> -
>>>>>> EDEADLK
>>>>>> (DEBUG_WW_MUTEX_SLOWPATH) we have the weird situation of
>>>>>> referencing an
>>>>>> object that never was fully created as a contending object.
>>>>> I wanted to eliminate that as well by not validating the BO
>>>>> during
>>>>> initialization any more.
>>>>> So bo creation would then be:
>>>>>
>>>>> ttm_bo_init(bo)
>>>>>
>>>>> drm_exec_while_not_all_locked() {
>>>>>        drm_exec_prepare_object(bo, 1);
>>>>>
>>>>>        ttm_bo_validate(bo);
>>>>> }
>>>>>
>>>>> if (r)
>>>>>        ttm_bo_put(bo);
>>>>>
>>>>> return r;
>>>>>
>>>>> I have that on a branch here somewhere prepared, but never got
>>>>> the
>>>>> time
>>>>> to clean it up.
>>>> Still, bo creation and validation may be part of a ww transaction
>>>> as
>>>> well, like page-table bos (Although those are pre-locked so
>>>> perhaps
>>>> not
>>>> a good example). But in the general case, I'm not sure this is
>>>> sufficient for all use-cases.
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> So the only really working alternative solution I can see is
>>>>>> that
>>>>>> drm_exec_trylock simply fails if there is a contended lock
>>>>>> and
>>>>>> we'd
>>>>>> need to live with the weird bo creation situation described
>>>>>> above.
>>>>>>
>>>>>> /Thomas
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Cc: Christian König<christian.koenig@amd.com>
>>>>>>>> Cc: Somalapuram Amaranath<Amaranath.Somalapuram@amd.com>
>>>>>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>>>>>> Cc:<dri-devel@lists.freedesktop.org>
>>>>>>>> Signed-off-by: Thomas
>>>>>>>> Hellström<thomas.hellstrom@linux.intel.com>
>>>>>>>> ---
>>>>>>>>      .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 16
>>>>>>>> ++++---
>>>>>>>> --
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6
>>>>>>>> ++--
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  4 +-
>>>>>>>> -
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  8
>>>>>>>> ++---
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  8
>>>>>>>> ++---
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c     |  4 +-
>>>>>>>> -
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  8
>>>>>>>> ++---
>>>>>>>>      drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
>>>>>>>>      drivers/gpu/drm/drm_exec.c                    | 35
>>>>>>>> ++++++++++++++-----
>>>>>>>>      drivers/gpu/drm/drm_gpuvm.c                   |  8
>>>>>>>> ++---
>>>>>>>>      drivers/gpu/drm/imagination/pvr_job.c         |  2 +-
>>>>>>>>      drivers/gpu/drm/msm/msm_gem_submit.c          |  2 +-
>>>>>>>>      drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  2 +-
>>>>>>>>      drivers/gpu/drm/tests/drm_exec_test.c         | 12
>>>>>>>> +++----
>>>>>>>>      drivers/gpu/drm/xe/xe_gt_pagefault.c          |  4 +-
>>>>>>>> -
>>>>>>>>      drivers/gpu/drm/xe/xe_vm.c                    | 10
>>>>>>>> +++---
>>>>>>>>      include/drm/drm_exec.h                        | 23
>>>>>>>> +++++++++---
>>>>>>>>      17 files changed, 92 insertions(+), 62 deletions(-)
>>>>>>>>
>>>>>>>> diff --git
>>>>>>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>>>> index e4d4e55c08ad..4a08a692aa1f 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>>>> @@ -1152,12 +1152,12 @@ static int
>>>>>>>> reserve_bo_and_vm(struct
>>>>>>>> kgd_mem
>>>>>>>> *mem,
>>>>>>>>      	drm_exec_init(&ctx->exec,
>>>>>>>> DRM_EXEC_INTERRUPTIBLE_WAIT,
>>>>>>>> 0);
>>>>>>>>      	drm_exec_until_all_locked(&ctx->exec) {
>>>>>>>>      		ret = amdgpu_vm_lock_pd(vm, &ctx->exec,
>>>>>>>> 2);
>>>>>>>> -		drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec);
>>>>>>>> +		ret = drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec,
>>>>>>>> ret);
>>>>>>>>      		if (unlikely(ret))
>>>>>>>>      			goto error;
>>>>>>>>      
>>>>>>>>      		ret = drm_exec_prepare_obj(&ctx->exec,
>>>>>>>> &bo-
>>>>>>>>> tbo.base, 1);
>>>>>>>> -		drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec);
>>>>>>>> +		ret = drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec,
>>>>>>>> ret);
>>>>>>>>      		if (unlikely(ret))
>>>>>>>>      			goto error;
>>>>>>>>      	}
>>>>>>>> @@ -1199,14 +1199,14 @@ static int
>>>>>>>> reserve_bo_and_cond_vms(struct
>>>>>>>> kgd_mem *mem,
>>>>>>>>      
>>>>>>>>      			ret = amdgpu_vm_lock_pd(entry-
>>>>>>>>> bo_va-
>>>>>>>>> base.vm,
>>>>>>>>      						&ctx-
>>>>>>>>> exec,
>>>>>>>> 2);
>>>>>>>> -
>>>>>>>> 			drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec);
>>>>>>>> +			ret =
>>>>>>>> drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec, ret);
>>>>>>>>      			if (unlikely(ret))
>>>>>>>>      				goto error;
>>>>>>>>      			++ctx->n_vms;
>>>>>>>>      		}
>>>>>>>>      
>>>>>>>>      		ret = drm_exec_prepare_obj(&ctx->exec,
>>>>>>>> &bo-
>>>>>>>>> tbo.base, 1);
>>>>>>>> -		drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec);
>>>>>>>> +		ret = drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec,
>>>>>>>> ret);
>>>>>>>>      		if (unlikely(ret))
>>>>>>>>      			goto error;
>>>>>>>>      	}
>>>>>>>> @@ -2619,7 +2619,7 @@ static int
>>>>>>>> validate_invalid_user_pages(struct
>>>>>>>> amdkfd_process_info *process_info)
>>>>>>>>      		list_for_each_entry(peer_vm,
>>>>>>>> &process_info-
>>>>>>>>> vm_list_head,
>>>>>>>>      				    vm_list_node) {
>>>>>>>>      			ret = amdgpu_vm_lock_pd(peer_vm,
>>>>>>>> &exec,
>>>>>>>> 2);
>>>>>>>> -
>>>>>>>> 			drm_exec_retry_on_contention(&exec);
>>>>>>>> +			ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      			if (unlikely(ret))
>>>>>>>>      				goto unreserve_out;
>>>>>>>>      		}
>>>>>>>> @@ -2631,7 +2631,7 @@ static int
>>>>>>>> validate_invalid_user_pages(struct
>>>>>>>> amdkfd_process_info *process_info)
>>>>>>>>      
>>>>>>>>      			gobj = &mem->bo->tbo.base;
>>>>>>>>      			ret =
>>>>>>>> drm_exec_prepare_obj(&exec,
>>>>>>>> gobj,
>>>>>>>> 1);
>>>>>>>> -
>>>>>>>> 			drm_exec_retry_on_contention(&exec);
>>>>>>>> +			ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      			if (unlikely(ret))
>>>>>>>>      				goto unreserve_out;
>>>>>>>>      		}
>>>>>>>> @@ -2875,7 +2875,7 @@ int
>>>>>>>> amdgpu_amdkfd_gpuvm_restore_process_bos(void *info,
>>>>>>>> struct
>>>>>>>> dma_fence __rcu *
>>>>>>>>      		list_for_each_entry(peer_vm,
>>>>>>>> &process_info-
>>>>>>>>> vm_list_head,
>>>>>>>>      				    vm_list_node) {
>>>>>>>>      			ret = amdgpu_vm_lock_pd(peer_vm,
>>>>>>>> &exec,
>>>>>>>> 2);
>>>>>>>> -
>>>>>>>> 			drm_exec_retry_on_contention(&exec);
>>>>>>>> +			ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      			if (unlikely(ret)) {
>>>>>>>>      				pr_err("Locking VM PD
>>>>>>>> failed,
>>>>>>>> ret:
>>>>>>>> %d\n", ret);
>>>>>>>>      				goto ttm_reserve_fail;
>>>>>>>> @@ -2891,7 +2891,7 @@ int
>>>>>>>> amdgpu_amdkfd_gpuvm_restore_process_bos(void *info,
>>>>>>>> struct
>>>>>>>> dma_fence __rcu *
>>>>>>>>      
>>>>>>>>      			gobj = &mem->bo->tbo.base;
>>>>>>>>      			ret =
>>>>>>>> drm_exec_prepare_obj(&exec,
>>>>>>>> gobj,
>>>>>>>> 1);
>>>>>>>> -
>>>>>>>> 			drm_exec_retry_on_contention(&exec);
>>>>>>>> +			ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      			if (unlikely(ret)) {
>>>>>>>>      				pr_err("drm_exec_prepare
>>>>>>>> _obj
>>>>>>>> failed, ret: %d\n", ret);
>>>>>>>>      				goto ttm_reserve_fail;
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>> index ec888fc6ead8..299e46a6d934 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>> @@ -897,7 +897,7 @@ static int
>>>>>>>> amdgpu_cs_parser_bos(struct
>>>>>>>> amdgpu_cs_parser *p,
>>>>>>>>      
>>>>>>>>      	drm_exec_until_all_locked(&p->exec) {
>>>>>>>>      		r = amdgpu_vm_lock_pd(&fpriv->vm, &p-
>>>>>>>>> exec,
>>>>>>>> 1
>>>>>>>> + p-
>>>>>>>>> gang_size);
>>>>>>>> -		drm_exec_retry_on_contention(&p->exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&p-
>>>>>>>>> exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto out_free_user_pages;
>>>>>>>>      
>>>>>>>> @@ -905,7 +905,7 @@ static int
>>>>>>>> amdgpu_cs_parser_bos(struct
>>>>>>>> amdgpu_cs_parser *p,
>>>>>>>>      			/* One fence for TTM and one for
>>>>>>>> each
>>>>>>>> CS
>>>>>>>> job */
>>>>>>>>      			r = drm_exec_prepare_obj(&p-
>>>>>>>>> exec,
>>>>>>>> &e-
>>>>>>>>> bo-
>>>>>>>>> tbo.base,
>>>>>>>>      						 1 + p-
>>>>>>>>> gang_size);
>>>>>>>> -			drm_exec_retry_on_contention(&p-
>>>>>>>>> exec);
>>>>>>>> +			r =
>>>>>>>> drm_exec_retry_on_contention(&p-
>>>>>>>>> exec,
>>>>>>>> r);
>>>>>>>>      			if (unlikely(r))
>>>>>>>>      				goto
>>>>>>>> out_free_user_pages;
>>>>>>>>      
>>>>>>>> @@ -915,7 +915,7 @@ static int
>>>>>>>> amdgpu_cs_parser_bos(struct
>>>>>>>> amdgpu_cs_parser *p,
>>>>>>>>      		if (p->uf_bo) {
>>>>>>>>      			r = drm_exec_prepare_obj(&p-
>>>>>>>>> exec,
>>>>>>>> &p-
>>>>>>>>> uf_bo->tbo.base,
>>>>>>>>      						 1 + p-
>>>>>>>>> gang_size);
>>>>>>>> -			drm_exec_retry_on_contention(&p-
>>>>>>>>> exec);
>>>>>>>> +			r =
>>>>>>>> drm_exec_retry_on_contention(&p-
>>>>>>>>> exec,
>>>>>>>> r);
>>>>>>>>      			if (unlikely(r))
>>>>>>>>      				goto
>>>>>>>> out_free_user_pages;
>>>>>>>>      		}
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>>>>>>> index cfdf558b48b6..8b2b86c7a6c5 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>>>>>>> @@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct
>>>>>>>> amdgpu_device
>>>>>>>> *adev, struct amdgpu_vm *vm,
>>>>>>>>      		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>>>      		if (likely(!r))
>>>>>>>>      			r = drm_exec_lock_obj(&exec,
>>>>>>>> &bo-
>>>>>>>>> tbo.base);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r)) {
>>>>>>>>      			DRM_ERROR("failed to reserve
>>>>>>>> CSA,PD
>>>>>>>> BOs:
>>>>>>>> err=%d\n", r);
>>>>>>>>      			goto error;
>>>>>>>> @@ -114,7 +114,7 @@ int amdgpu_unmap_static_csa(struct
>>>>>>>> amdgpu_device *adev, struct amdgpu_vm *vm,
>>>>>>>>      		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>>>      		if (likely(!r))
>>>>>>>>      			r = drm_exec_lock_obj(&exec,
>>>>>>>> &bo-
>>>>>>>>> tbo.base);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r)) {
>>>>>>>>      			DRM_ERROR("failed to reserve
>>>>>>>> CSA,PD
>>>>>>>> BOs:
>>>>>>>> err=%d\n", r);
>>>>>>>>      			goto error;
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>>> index 67c234bcf89f..17e16c971e21 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>>> @@ -239,12 +239,12 @@ static void
>>>>>>>> amdgpu_gem_object_close(struct
>>>>>>>> drm_gem_object *obj,
>>>>>>>>      	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES,
>>>>>>>> 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		r = drm_exec_prepare_obj(&exec, &bo-
>>>>>>>>> tbo.base,
>>>>>>>> 1);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto out_unlock;
>>>>>>>>      
>>>>>>>>      		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto out_unlock;
>>>>>>>>      	}
>>>>>>>> @@ -776,13 +776,13 @@ int amdgpu_gem_va_ioctl(struct
>>>>>>>> drm_device
>>>>>>>> *dev, void *data,
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		if (gobj) {
>>>>>>>>      			r = drm_exec_lock_obj(&exec,
>>>>>>>> gobj);
>>>>>>>> -
>>>>>>>> 			drm_exec_retry_on_contention(&exec);
>>>>>>>> +			r =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      			if (unlikely(r))
>>>>>>>>      				goto error;
>>>>>>>>      		}
>>>>>>>>      
>>>>>>>>      		r = amdgpu_vm_lock_pd(&fpriv->vm, &exec,
>>>>>>>> 2);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto error;
>>>>>>>>      	}
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>>>>>>> index 5ca5c47ab54e..1b1a5147606e 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>>>>>>> @@ -1221,12 +1221,12 @@ int
>>>>>>>> amdgpu_mes_ctx_map_meta_data(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		r = drm_exec_lock_obj(&exec,
>>>>>>>>      				      &ctx_data-
>>>>>>>>> meta_data_obj-
>>>>>>>>> tbo.base);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto error_fini_exec;
>>>>>>>>      
>>>>>>>>      		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto error_fini_exec;
>>>>>>>>      	}
>>>>>>>> @@ -1292,12 +1292,12 @@ int
>>>>>>>> amdgpu_mes_ctx_unmap_meta_data(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		r = drm_exec_lock_obj(&exec,
>>>>>>>>      				      &ctx_data-
>>>>>>>>> meta_data_obj-
>>>>>>>>> tbo.base);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto out_unlock;
>>>>>>>>      
>>>>>>>>      		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto out_unlock;
>>>>>>>>      	}
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>>>>>>> index e22cb2b5cd92..72b8213e352c 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>>>>>>> @@ -77,7 +77,7 @@ int amdgpu_seq64_map(struct
>>>>>>>> amdgpu_device
>>>>>>>> *adev,
>>>>>>>> struct amdgpu_vm *vm,
>>>>>>>>      		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>>>      		if (likely(!r))
>>>>>>>>      			r = drm_exec_lock_obj(&exec,
>>>>>>>> &bo-
>>>>>>>>> tbo.base);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto error;
>>>>>>>>      	}
>>>>>>>> @@ -138,7 +138,7 @@ void amdgpu_seq64_unmap(struct
>>>>>>>> amdgpu_device
>>>>>>>> *adev, struct amdgpu_fpriv *fpriv)
>>>>>>>>      		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>>>      		if (likely(!r))
>>>>>>>>      			r = drm_exec_lock_obj(&exec,
>>>>>>>> &bo-
>>>>>>>>> tbo.base);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto error;
>>>>>>>>      	}
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>>>>>>> index e01c1c8e64c4..63392ce43945 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>>>>>>> @@ -89,12 +89,12 @@ static int map_ring_data(struct
>>>>>>>> amdgpu_device
>>>>>>>> *adev, struct amdgpu_vm *vm,
>>>>>>>>      	drm_exec_init(&exec, 0, 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		r = drm_exec_lock_obj(&exec, &bo-
>>>>>>>>> tbo.base);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto error_fini_exec;
>>>>>>>>      
>>>>>>>>      		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto error_fini_exec;
>>>>>>>>      	}
>>>>>>>> @@ -152,12 +152,12 @@ static int unmap_ring_data(struct
>>>>>>>> amdgpu_device *adev, struct amdgpu_vm *vm,
>>>>>>>>      	drm_exec_init(&exec, 0, 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		r = drm_exec_lock_obj(&exec, &bo-
>>>>>>>>> tbo.base);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto out_unlock;
>>>>>>>>      
>>>>>>>>      		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		r = drm_exec_retry_on_contention(&exec,
>>>>>>>> r);
>>>>>>>>      		if (unlikely(r))
>>>>>>>>      			goto out_unlock;
>>>>>>>>      	}
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>>>>>>> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>>>>>>> index 386875e6eb96..a3aa7fd22f6a 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>>>>>>> @@ -1499,7 +1499,7 @@ static int
>>>>>>>> svm_range_reserve_bos(struct
>>>>>>>> svm_validate_context *ctx, bool intr)
>>>>>>>>      			vm = drm_priv_to_vm(pdd-
>>>>>>>>> drm_priv);
>>>>>>>>      
>>>>>>>>      			r = amdgpu_vm_lock_pd(vm, &ctx-
>>>>>>>>> exec,
>>>>>>>> 2);
>>>>>>>> -
>>>>>>>> 			drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec);
>>>>>>>> +			r =
>>>>>>>> drm_exec_retry_on_contention(&ctx-
>>>>>>>>> exec, r);
>>>>>>>>      			if (unlikely(r)) {
>>>>>>>>      				pr_debug("failed %d to
>>>>>>>> reserve
>>>>>>>> bo\n", r);
>>>>>>>>      				goto unreserve_out;
>>>>>>>> diff --git a/drivers/gpu/drm/drm_exec.c
>>>>>>>> b/drivers/gpu/drm/drm_exec.c
>>>>>>>> index 2da094bdf8a4..3770a5d30213 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_exec.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_exec.c
>>>>>>>> @@ -28,12 +28,12 @@
>>>>>>>>       *	drm_exec_init(&exec,
>>>>>>>> DRM_EXEC_INTERRUPTIBLE_WAIT);
>>>>>>>>       *	drm_exec_until_all_locked(&exec) {
>>>>>>>>       *		ret = drm_exec_prepare_obj(&exec, boA,
>>>>>>>> 1);
>>>>>>>> - *		drm_exec_retry_on_contention(&exec);
>>>>>>>> + *		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>       *		if (ret)
>>>>>>>>       *			goto error;
>>>>>>>>       *
>>>>>>>>       *		ret = drm_exec_prepare_obj(&exec, boB,
>>>>>>>> 1);
>>>>>>>> - *		drm_exec_retry_on_contention(&exec);
>>>>>>>> + *		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>       *		if (ret)
>>>>>>>>       *			goto error;
>>>>>>>>       *	}
>>>>>>>> @@ -48,7 +48,8 @@
>>>>>>>>       */
>>>>>>>>      
>>>>>>>>      /* Dummy value used to initially enter the retry loop
>>>>>>>> */
>>>>>>>> -#define DRM_EXEC_DUMMY ((void *)~0)
>>>>>>>> +#define DRM_EXEC_DUMMY ERR_PTR(-ESTALE)
>>>>>>>> +#define DRM_EXEC_CONTENDED ERR_PTR(-EDEADLK)
>>>>>>>>      
>>>>>>>>      /* Unlock all objects and drop references */
>>>>>>>>      static void drm_exec_unlock_all(struct drm_exec
>>>>>>>> *exec)
>>>>>>>> @@ -131,8 +132,7 @@ bool drm_exec_cleanup(struct drm_exec
>>>>>>>> *exec)
>>>>>>>>      		return true;
>>>>>>>>      	}
>>>>>>>>      
>>>>>>>> -	drm_exec_unlock_all(exec);
>>>>>>>> -	exec->num_objects = 0;
>>>>>>>> +	exec->contended = NULL;
>>>>>>>>      	return true;
>>>>>>>>      }
>>>>>>>>      EXPORT_SYMBOL(drm_exec_cleanup);
>>>>>>>> @@ -194,6 +194,27 @@ static int
>>>>>>>> drm_exec_lock_contended(struct
>>>>>>>> drm_exec *exec)
>>>>>>>>      	return ret;
>>>>>>>>      }
>>>>>>>>      
>>>>>>>> +/**
>>>>>>>> + * drm_exec_handle_contended() - Perform cleanup before
>>>>>>>> a ww
>>>>>>>> transaction restart
>>>>>>>> + * @exec: Pointer to the drm_exec object.
>>>>>>>> + *
>>>>>>>> + * Unlocks all held resvs and re-locks the contended
>>>>>>>> object.
>>>>>>>> + *
>>>>>>>> + * Return: 0 on success, negative error code on failure.
>>>>>>>> + */
>>>>>>>> +int drm_exec_handle_contended(struct drm_exec *exec)
>>>>>>>> +{
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	drm_exec_unlock_all(exec);
>>>>>>>> +	exec->num_objects = 0;
>>>>>>>> +	ret = drm_exec_lock_contended(exec);
>>>>>>>> +	exec->contended = DRM_EXEC_CONTENDED;
>>>>>>>> +
>>>>>>>> +	return ret;
>>>>>>>> +}
>>>>>>>> +EXPORT_SYMBOL(drm_exec_handle_contended);
>>>>>>>> +
>>>>>>>>      /**
>>>>>>>>       * drm_exec_lock_obj - lock a GEM object for use
>>>>>>>>       * @exec: the drm_exec object with the state
>>>>>>>> @@ -209,10 +230,6 @@ int drm_exec_lock_obj(struct
>>>>>>>> drm_exec
>>>>>>>> *exec,
>>>>>>>> struct drm_gem_object *obj)
>>>>>>>>      {
>>>>>>>>      	int ret;
>>>>>>>>      
>>>>>>>> -	ret = drm_exec_lock_contended(exec);
>>>>>>>> -	if (unlikely(ret))
>>>>>>>> -		return ret;
>>>>>>>> -
>>>>>>>>      	if (exec->prelocked == obj) {
>>>>>>>>      		drm_gem_object_put(exec->prelocked);
>>>>>>>>      		exec->prelocked = NULL;
>>>>>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>>>>>>>> b/drivers/gpu/drm/drm_gpuvm.c
>>>>>>>> index f9eb56f24bef..0923d6ae18e2 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>>>>>> @@ -1254,18 +1254,18 @@ drm_gpuvm_exec_lock(struct
>>>>>>>> drm_gpuvm_exec
>>>>>>>> *vm_exec)
>>>>>>>>      
>>>>>>>>      	drm_exec_until_all_locked(exec) {
>>>>>>>>      		ret = drm_gpuvm_prepare_vm(gpuvm, exec,
>>>>>>>> num_fences);
>>>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>>>> +		ret = drm_exec_retry_on_contention(exec,
>>>>>>>> ret);
>>>>>>>>      		if (ret)
>>>>>>>>      			goto err;
>>>>>>>>      
>>>>>>>>      		ret = drm_gpuvm_prepare_objects(gpuvm,
>>>>>>>> exec,
>>>>>>>> num_fences);
>>>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>>>> +		ret = drm_exec_retry_on_contention(exec,
>>>>>>>> ret);
>>>>>>>>      		if (ret)
>>>>>>>>      			goto err;
>>>>>>>>      
>>>>>>>>      		if (vm_exec->extra.fn) {
>>>>>>>>      			ret = vm_exec-
>>>>>>>>> extra.fn(vm_exec);
>>>>>>>> -
>>>>>>>> 			drm_exec_retry_on_contention(exec);
>>>>>>>> +			ret =
>>>>>>>> drm_exec_retry_on_contention(exec,
>>>>>>>> ret);
>>>>>>>>      			if (ret)
>>>>>>>>      				goto err;
>>>>>>>>      		}
>>>>>>>> @@ -1346,7 +1346,7 @@ drm_gpuvm_exec_lock_range(struct
>>>>>>>> drm_gpuvm_exec *vm_exec,
>>>>>>>>      	drm_exec_until_all_locked(exec) {
>>>>>>>>      		ret = drm_gpuvm_prepare_range(gpuvm,
>>>>>>>> exec,
>>>>>>>> addr,
>>>>>>>> range,
>>>>>>>>      					      vm_exec-
>>>>>>>>> num_fences);
>>>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>>>> +		ret = drm_exec_retry_on_contention(exec,
>>>>>>>> ret);
>>>>>>>>      		if (ret)
>>>>>>>>      			goto err;
>>>>>>>>      	}
>>>>>>>> diff --git a/drivers/gpu/drm/imagination/pvr_job.c
>>>>>>>> b/drivers/gpu/drm/imagination/pvr_job.c
>>>>>>>> index 78c2f3c6dce0..6e0ce6c4576c 100644
>>>>>>>> --- a/drivers/gpu/drm/imagination/pvr_job.c
>>>>>>>> +++ b/drivers/gpu/drm/imagination/pvr_job.c
>>>>>>>> @@ -574,7 +574,7 @@ prepare_job_resvs_for_each(struct
>>>>>>>> drm_exec
>>>>>>>> *exec, struct pvr_job_data *job_data,
>>>>>>>>      	drm_exec_until_all_locked(exec) {
>>>>>>>>      		int err = jobs_lock_all_objs(exec,
>>>>>>>> job_data,
>>>>>>>> job_count);
>>>>>>>>      
>>>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>>>> +		err = drm_exec_retry_on_contention(exec,
>>>>>>>> err);
>>>>>>>>      		if (err)
>>>>>>>>      			return err;
>>>>>>>>      	}
>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>> b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>> index fba78193127d..01992b43ea4b 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>> @@ -259,7 +259,7 @@ static int submit_lock_objects(struct
>>>>>>>> msm_gem_submit *submit)
>>>>>>>>      		for (unsigned i = 0; i < submit->nr_bos;
>>>>>>>> i++)
>>>>>>>> {
>>>>>>>>      			struct drm_gem_object *obj =
>>>>>>>> submit-
>>>>>>>>> bos[i].obj;
>>>>>>>>      			ret =
>>>>>>>> drm_exec_prepare_obj(&submit-
>>>>>>>>> exec,
>>>>>>>> obj, 1);
>>>>>>>> -
>>>>>>>> 			drm_exec_retry_on_contention(&su
>>>>>>>> bmit-
>>>>>>>>> exec);
>>>>>>>> +			ret =
>>>>>>>> drm_exec_retry_on_contention(&submit->exec, ret);
>>>>>>>>      			if (ret)
>>>>>>>>      				goto error;
>>>>>>>>      		}
>>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>>>> index ee02cd833c5e..0c871634fdfb 100644
>>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>>>> @@ -1350,7 +1350,7 @@ nouveau_uvmm_bind_job_submit(struct
>>>>>>>> nouveau_job *job,
>>>>>>>>      	drm_exec_init(exec, vme->flags, 0);
>>>>>>>>      	drm_exec_until_all_locked(exec) {
>>>>>>>>      		ret = bind_lock_validate(job, exec, vme-
>>>>>>>>> num_fences);
>>>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>>>> +		ret = drm_exec_retry_on_contention(exec,
>>>>>>>> ret);
>>>>>>>>      		if (ret) {
>>>>>>>>      			op = list_last_op(&bind_job-
>>>>>>>>> ops);
>>>>>>>>      			goto unwind;
>>>>>>>> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c
>>>>>>>> b/drivers/gpu/drm/tests/drm_exec_test.c
>>>>>>>> index 81f928a429ba..28558fdb08df 100644
>>>>>>>> --- a/drivers/gpu/drm/tests/drm_exec_test.c
>>>>>>>> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
>>>>>>>> @@ -63,7 +63,7 @@ static void test_lock(struct kunit
>>>>>>>> *test)
>>>>>>>>      	drm_exec_init(&exec,
>>>>>>>> DRM_EXEC_INTERRUPTIBLE_WAIT,
>>>>>>>> 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>>>      		if (ret)
>>>>>>>>      			break;
>>>>>>>> @@ -83,14 +83,14 @@ static void test_lock_unlock(struct
>>>>>>>> kunit
>>>>>>>> *test)
>>>>>>>>      	drm_exec_init(&exec,
>>>>>>>> DRM_EXEC_INTERRUPTIBLE_WAIT,
>>>>>>>> 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>>>      		if (ret)
>>>>>>>>      			break;
>>>>>>>>      
>>>>>>>>      		drm_exec_unlock_obj(&exec, &gobj);
>>>>>>>>      		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>>>      		if (ret)
>>>>>>>>      			break;
>>>>>>>> @@ -110,13 +110,13 @@ static void test_duplicates(struct
>>>>>>>> kunit
>>>>>>>> *test)
>>>>>>>>      	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES,
>>>>>>>> 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>>>      		if (ret)
>>>>>>>>      			break;
>>>>>>>>      
>>>>>>>>      		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>>>      		if (ret)
>>>>>>>>      			break;
>>>>>>>> @@ -137,7 +137,7 @@ static void test_prepare(struct kunit
>>>>>>>> *test)
>>>>>>>>      	drm_exec_init(&exec,
>>>>>>>> DRM_EXEC_INTERRUPTIBLE_WAIT,
>>>>>>>> 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		ret = drm_exec_prepare_obj(&exec, &gobj,
>>>>>>>> 1);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>>>      		if (ret)
>>>>>>>>      			break;
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>>>>>> index 040dd142c49c..20ec1ab1b52d 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>>>>>> @@ -200,7 +200,7 @@ static int handle_pagefault(struct
>>>>>>>> xe_gt
>>>>>>>> *gt,
>>>>>>>> struct pagefault *pf)
>>>>>>>>      	drm_exec_init(&exec, 0, 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		ret = xe_pf_begin(&exec, vma, atomic,
>>>>>>>> tile-
>>>>>>>>> id);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      		if (ret)
>>>>>>>>      			goto unlock_dma_resv;
>>>>>>>>      
>>>>>>>> @@ -543,7 +543,7 @@ static int handle_acc(struct xe_gt
>>>>>>>> *gt,
>>>>>>>> struct
>>>>>>>> acc *acc)
>>>>>>>>      	drm_exec_init(&exec, 0, 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		ret = xe_pf_begin(&exec, vma, true,
>>>>>>>> tile-
>>>>>>>>> id);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		ret =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> ret);
>>>>>>>>      		if (ret)
>>>>>>>>      			break;
>>>>>>>>      	}
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_vm.c
>>>>>>>> index e2ec148c9c33..335524e803e7 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>>>>> @@ -501,7 +501,7 @@ static void
>>>>>>>> preempt_rebind_work_func(struct
>>>>>>>> work_struct *w)
>>>>>>>>      		bool done = false;
>>>>>>>>      
>>>>>>>>      		err = xe_preempt_work_begin(&exec, vm,
>>>>>>>> &done);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		err =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> err);
>>>>>>>>      		if (err || done) {
>>>>>>>>      			drm_exec_fini(&exec);
>>>>>>>>      			if (err &&
>>>>>>>> xe_vm_validate_should_retry(&exec, err, &end))
>>>>>>>> @@ -1052,7 +1052,7 @@ static void
>>>>>>>> xe_vma_destroy_unlocked(struct
>>>>>>>> xe_vma *vma)
>>>>>>>>      	drm_exec_init(&exec, 0, 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		err = xe_vm_lock_vma(&exec, vma);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		err =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> err);
>>>>>>>>      		if (XE_WARN_ON(err))
>>>>>>>>      			break;
>>>>>>>>      	}
>>>>>>>> @@ -2148,11 +2148,11 @@ static struct xe_vma
>>>>>>>> *new_vma(struct
>>>>>>>> xe_vm
>>>>>>>> *vm, struct drm_gpuva_op_map *op,
>>>>>>>>      			err = 0;
>>>>>>>>      			if (!bo->vm) {
>>>>>>>>      				err =
>>>>>>>> drm_exec_lock_obj(&exec,
>>>>>>>> xe_vm_obj(vm));
>>>>>>>> -
>>>>>>>> 				drm_exec_retry_on_conten
>>>>>>>> tion
>>>>>>>> (&
>>>>>>>> exec);
>>>>>>>> +				err =
>>>>>>>> drm_exec_retry_on_contention(&exec, err);
>>>>>>>>      			}
>>>>>>>>      			if (!err) {
>>>>>>>>      				err =
>>>>>>>> drm_exec_lock_obj(&exec,
>>>>>>>> &bo->ttm.base);
>>>>>>>> -
>>>>>>>> 				drm_exec_retry_on_conten
>>>>>>>> tion
>>>>>>>> (&
>>>>>>>> exec);
>>>>>>>> +				err =
>>>>>>>> drm_exec_retry_on_contention(&exec, err);
>>>>>>>>      			}
>>>>>>>>      			if (err) {
>>>>>>>>      				drm_exec_fini(&exec);
>>>>>>>> @@ -2884,7 +2884,7 @@ static int
>>>>>>>> vm_bind_ioctl_ops_execute(struct
>>>>>>>> xe_vm *vm,
>>>>>>>>      		      DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>>>>>>      	drm_exec_until_all_locked(&exec) {
>>>>>>>>      		err =
>>>>>>>> vm_bind_ioctl_ops_lock_and_prep(&exec,
>>>>>>>> vm,
>>>>>>>> vops);
>>>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>>>> +		err =
>>>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>>>> err);
>>>>>>>>      		if (err)
>>>>>>>>      			goto unlock;
>>>>>>>>      
>>>>>>>> diff --git a/include/drm/drm_exec.h
>>>>>>>> b/include/drm/drm_exec.h
>>>>>>>> index aa786b828a0a..fafb40d96e38 100644
>>>>>>>> --- a/include/drm/drm_exec.h
>>>>>>>> +++ b/include/drm/drm_exec.h
>>>>>>>> @@ -51,6 +51,8 @@ struct drm_exec {
>>>>>>>>      	struct drm_gem_object *prelocked;
>>>>>>>>      };
>>>>>>>>      
>>>>>>>> +int drm_exec_handle_contended(struct drm_exec *exec);
>>>>>>>> +
>>>>>>>>      /**
>>>>>>>>       * drm_exec_obj() - Return the object for a give
>>>>>>>> drm_exec
>>>>>>>> index
>>>>>>>>       * @exec: Pointer to the drm_exec context
>>>>>>>> @@ -113,15 +115,26 @@ __PASTE(__drm_exec_,
>>>>>>>> __LINE__):						\
>>>>>>>>      /**
>>>>>>>>       * drm_exec_retry_on_contention - restart the loop to
>>>>>>>> grap
>>>>>>>> all
>>>>>>>> locks
>>>>>>>>       * @exec: drm_exec object
>>>>>>>> + * @_ret: The current error status
>>>>>>>>       *
>>>>>>>>       * Control flow helper to continue when a contention
>>>>>>>> was
>>>>>>>> detected
>>>>>>>> and we need to
>>>>>>>>       * clean up and re-start the loop to prepare all GEM
>>>>>>>> objects.
>>>>>>>> + *
>>>>>>>> + * Return: If no loop restart occurred: The error
>>>>>>>> status.
>>>>>>>>       */
>>>>>>>> -#define
>>>>>>>> drm_exec_retry_on_contention(exec)			\
>>>>>>>> -	do
>>>>>>>> {							\
>>>>>>>> -		if
>>>>>>>> (unlikely(drm_exec_is_contended(exec)))	\
>>>>>>>> -			goto
>>>>>>>> *__drm_exec_retry_ptr;		\
>>>>>>>> -	} while (0)
>>>>>>>> +#define drm_exec_retry_on_contention(exec,
>>>>>>>> _ret)			\
>>>>>>>> +	({						
>>>>>>>> 	
>>>>>>>> 	\
>>>>>>>> +		struct drm_exec *__exec =
>>>>>>>> (exec);			\
>>>>>>>> +		int __ret =
>>>>>>>> (_ret);					\
>>>>>>>> +							
>>>>>>>> 	
>>>>>>>> 	\
>>>>>>>> +		if
>>>>>>>> (unlikely(drm_exec_is_contended(__exec)))
>>>>>>>> {		\
>>>>>>>> +			WARN_ON(__ret != -
>>>>>>>> EDEADLK);			\
>>>>>>>> +			__ret =
>>>>>>>> drm_exec_handle_contended(__exec);	\
>>>>>>>> +			if
>>>>>>>> (!__ret)					\
>>>>>>>> +				goto
>>>>>>>> *__drm_exec_retry_ptr;		\
>>>>>>>> +		}					
>>>>>>>> 	
>>>>>>>> 	\
>>>>>>>> +		__ret;					
>>>>>>>> 	
>>>>>>>> 	\
>>>>>>>> +	})
>>>>>>>>      
>>>>>>>>      /**
>>>>>>>>       * drm_exec_is_contended - check for contention

--------------nipCO9CCWmh0z9MX2U0wKxmK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 28.05.24 um 10:07 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:3716d43462188590743060755b37e3d060f7600f.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">On Tue, 2024-05-28 at 08:51 +0200, Christian König wrote:
</pre>
      <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">2) Any contended lock held at loop start is completely encapsulated
in
the ww transaction and can and will be unlocked when exiting it, so
this patch doesn't introduce any additional problems for userptr
handling AFAICT.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The drm_exec object was intentionally design to not have anything
locked 
at the beginning of the loop. See the discussion I had with Sima
around 
that when pushing the drm_exec object upstream.

I would really like to stick with that design and honestly don't see
the 
reason to change that. Contenting on a trylock seem to be much more 
questionable.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The change here is to make sure we *don't* have contention in a
trylock, which is otherwise inherent in the current drm_exec design.</pre>
    </blockquote>
    <br>
    My sentence was probably a bit misleading. What I wanted to say is
    that trylock as first thing in the loop sounds really odd to me.<br>
    <br>
    See the intention of a trylock is to acquire something optional.
    What we do for the freshly allocated BO and the 'don't try to block
    with the mmap lock held' case is actually kind something different.<br>
    <br>
    A clean approach would be to to have the BO initialization and
    backing store allocation steps separated. In this case you don't
    even need to use trylock here.<br>
    <br>
    And for the VM fault locking case the clean approach would be to
    tell the drm_exec object of the vm_fault parameters so that this
    helper can do the drop all locks, drop the mmap lock, acquire the
    blocking lock and return -EAGAIN.<br>
    <br>
    This has the huge benefit that we not only stop blocking for the
    faulted BO, but eventually all others which might need to move so
    that the faulted BO is CPU accessible. I think that this is actually
    the more problematic case.<br>
    <br>
    <blockquote type="cite" cite="mid:3716d43462188590743060755b37e3d060f7600f.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">What I'm trying to say here is that we end up with the contended lock
grabbed at loop start you already conceptually have a conflicting lock
held (the we_class::acquire_key). Both these can be resolved.</pre>
    </blockquote>
    <br>
    Yeah, I'm perfectly aware of that. But this is just a shortcoming of
    lockdep and not a real problem.<br>
    <br>
    During the drm_exec code review we already moved the
    ww_acquire_init() into the cleanup function so that it's only called
    at the start of the loop. Background is that we ran into lockdep
    warnings with that otherwise.<br>
    <br>
    But functionally it would still work if we do this in
    drm_exec_ini().<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:3716d43462188590743060755b37e3d060f7600f.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">3) The need for a fully capable ww transaction helper moving
forward.
If we need a tool that also does userptr locking, then I think we
need
to separate that from the ww transaction tool and only pass the
latter
around to TTM.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
drm_exec is *not* meant to be a ww_transaction helper.

The functionality here is to support drivers in their CS interface
and 
that includes userptr handling as well as a couple of other things.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Then if so, I don't think drm_exec is the correct functionality to pass
to TTM to resolve the eviction issues, but rather a ww transaction
helper that can be used standalone *and* by drm_exec. Now the
functionality would be more or less what drm exec is today, but
slightly augmented.

But then IMHO instead of changing name and more or less replicating
what drm_exec is today wouldn't it be a better idea to subclass
drm_exec into a full-fledged CS helper at the time when that
functionality is indeed added?</pre>
    </blockquote>
    <br>
    Mhm, interesting idea. But it still means that the base object needs
    to be designed in a way to not prevent the implementation of the
    subclass.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:3716d43462188590743060755b37e3d060f7600f.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

/Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Thanks,
Thomas

On Wed, 2024-05-22 at 19:42 +0200, Thomas Hellström wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Wed, 2024-05-22 at 18:52 +0200, Christian König wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Am 22.05.24 um 16:32 schrieb Thomas Hellström:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On Wed, 2024-05-22 at 07:52 +0200, Christian König wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Am 21.05.24 um 09:16 schrieb Thomas Hellström:
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">If contention and backoff occurs during a drm_exec ww
transaction,
the contended lock is not locked again until the next
orinary
attempt to lock a dma_resv lock. However, with the
introduction
of
drm_exec_trylock(), that doesn't work, since the locking
of
the
contended lock needs to be a sleeping lock. Neither can
we
ignore
locking the contended lock during a trylock since that
would
violate
at least the ww_mutex annotations.

So resolve this by actually locking the contended lock
during
drm_exec_retry_on_contention(). However, this introduces
a
new
point
of failure since locking the contended lock may return -
EINTR.

Hence drm_exec_retry_on_contention() must take an error
parameter
and
also return a value indicating success.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">After thinking more about that I have to pretty clearly NAK
this.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I thought we were beyond upfront NAKing in the first reply :/
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Well my memory could fail me, but I mentioned concerns on this
approach
before.

I was a bit annoyed seeing that again. But could as well be
that my
response never got out or that I'm mixing things up.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I haven't seen it at least. Last discussion on this I saw was
here. I didn't see a follow-up on that.

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.camel@linux.intel.com/">https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.camel@linux.intel.com/</a>


</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">It's an intentional design decision to guarantee that at
the
start of
the loop no object is locked.

This is because Sima and I wanted to integrate userptr
handling
into
drm_exec as well in the long term.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">First I agree the interface looks worse with this patch.
But I thought generic userptr handling were going to end up
as a
gpuvm
helper (without using GEM objects) as we've discussed
previously.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">We might be talking past each other. That sounds like SVM, e.g.
on
demand paging.

What I mean is pre-faulting during command submission like
radeon,
amdgpu and i915 do for the userptr handling.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yes, then we're talking about the same thing.

We discussed in this thread here, started by Dave.

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com/">https://lore.kernel.org/dri-devel/CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com/</a>

I still think the right place is in drm_gpuvm for this sort of
stuff.
And I think that's the concluding argument by Sima as well.

In any case, If the planned drm_exec development is to be a full
execbuf helper, I think we need a capable sub-helper for ONLY the
ww
transaction locking as well, with support for the various locking
primitives. In particular if we're going to be able to port i915
ww
transaction locking over. There are more uses of the ww locking
transacions than execbuf.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">For that you need to re-start the whole handling similar to how
you
need
to re-start for the mutex locking when you detect that the page
array
is
stale, the difference is that you are not allowed to hold any
resv
locks
while pre-faulting.

That's why it is a requirement that the drm_exec loop starts
without
any
locks held.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">But wouldn't you need an outer (userptr) loop and an inner
(ww_transaction) loop for this? Why would we want to re-validate
userptrs on -EDEADLKS?

</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Anyway if still there would be helpers in drm_exec for some
other
generic userptr solution, those need to be done before the
ww_acquire_ctx_init(). The contended locking here is done
after,
so
I
can't really see how these would clash.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Yes, that indeed was a problem. The ww_acquire_ctx_init() was
intentionally moved into drm_exec_cleanup() to partially
prevent
that
issue.

I haven't fully figured out how to do handle everything
exactly,
but
at
least in principle it can be made work. With this change here
it
becomes
impossible.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Still, If we need to come up with another solution, I think
it's
fair
we clearly sort out why.

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">I think we should just document that drm_exec_trylock()
can't
be
used
to
lock the first BO in the loop and explicitly WARN if that's
the
case.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Unfortunately that's not sufficient for the general use-case.
If
we
want to keep the ttm_bo_vm approach of dropping the mmap lock
when
there is contention on the bo resv, we need to be able to
trylock
on
first lock.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Mhm, why exactly do we still have that dance in the first
place?

I mean we have sorted out the mmap() and dma_resv() locking
order
long
ago. See dma_resv_lockdep() which is enforcing that.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I explained that in my reply here:

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.camel@linux.intel.com/">https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.camel@linux.intel.com/</a>

We shouldn't be holding the mmap lock when waiting for stuff. In
particular not while waiting for mutexes that may be blocked by
gpu
activity.

</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp; Also bo creation is using trylock but might be able to use
a sleeping lock there. But if that sleeping lock triggers an
-
EDEADLK
(DEBUG_WW_MUTEX_SLOWPATH) we have the weird situation of
referencing an
object that never was fully created as a contending object.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I wanted to eliminate that as well by not validating the BO
during
initialization any more.
So bo creation would then be:

ttm_bo_init(bo)

drm_exec_while_not_all_locked() {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_prepare_object(bo, 1);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_validate(bo);
}

if (r)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_put(bo);

return r;

I have that on a branch here somewhere prepared, but never got
the
time
to clean it up.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Still, bo creation and validation may be part of a ww transaction
as
well, like page-table bos (Although those are pre-locked so
perhaps
not
a good example). But in the general case, I'm not sure this is
sufficient for all use-cases.

/Thomas



</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">So the only really working alternative solution I can see is
that
drm_exec_trylock simply fails if there is a contended lock
and
we'd
need to live with the weird bo creation situation described
above.

/Thomas

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">Cc: Christian König<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Somalapuram Amaranath<a class="moz-txt-link-rfc2396E" href="mailto:Amaranath.Somalapuram@amd.com">&lt;Amaranath.Somalapuram@amd.com&gt;</a>
Cc: Matthew Brost<a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc:<a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>
Signed-off-by: Thomas
Hellström<a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
---
&nbsp;&nbsp;&nbsp; .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c&nbsp; | 16
++++---
--
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 6
++--
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
-
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8
++---
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8
++---
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
-
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c&nbsp; |&nbsp; 8
++---
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_svm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/drm_exec.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 35
++++++++++++++-----
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/drm_gpuvm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8
++---
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/imagination/pvr_job.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/msm/msm_gem_submit.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/nouveau/nouveau_uvmm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/tests/drm_exec_test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 12
+++----
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/xe/xe_gt_pagefault.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
-
&nbsp;&nbsp;&nbsp; drivers/gpu/drm/xe/xe_vm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10
+++---
&nbsp;&nbsp;&nbsp; include/drm/drm_exec.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 23
+++++++++---
&nbsp;&nbsp;&nbsp; 17 files changed, 92 insertions(+), 62 deletions(-)

diff --git
a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index e4d4e55c08ad..4a08a692aa1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1152,12 +1152,12 @@ static int
reserve_bo_and_vm(struct
kgd_mem
*mem,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;ctx-&gt;exec,
DRM_EXEC_INTERRUPTIBLE_WAIT,
0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;ctx-&gt;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = amdgpu_vm_lock_pd(vm, &amp;ctx-&gt;exec,
2);
-		drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">+		ret = drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">ret);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(ret))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_exec_prepare_obj(&amp;ctx-&gt;exec,
&amp;bo-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">tbo.base, 1);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">+		ret = drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">ret);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(ret))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;&nbsp;&nbsp;	}
@@ -1199,14 +1199,14 @@ static int
reserve_bo_and_cond_vms(struct
kgd_mem *mem,
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;			ret = amdgpu_vm_lock_pd(entry-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">bo_va-
base.vm,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;						&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">2);
-
			drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">+			ret =
drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec, ret);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;			if (unlikely(ret))
&nbsp;&nbsp;&nbsp;&nbsp;				goto error;
&nbsp;&nbsp;&nbsp;&nbsp;			++ctx-&gt;n_vms;
&nbsp;&nbsp;&nbsp;&nbsp;		}
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_exec_prepare_obj(&amp;ctx-&gt;exec,
&amp;bo-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">tbo.base, 1);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">+		ret = drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">ret);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(ret))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;&nbsp;&nbsp;	}
@@ -2619,7 +2619,7 @@ static int
validate_invalid_user_pages(struct
amdkfd_process_info *process_info)
&nbsp;&nbsp;&nbsp;&nbsp;		list_for_each_entry(peer_vm,
&amp;process_info-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">vm_list_head,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;				&nbsp;&nbsp;&nbsp; vm_list_node) {
&nbsp;&nbsp;&nbsp;&nbsp;			ret = amdgpu_vm_lock_pd(peer_vm,
&amp;exec,
2);
-
			drm_exec_retry_on_contention(&amp;exec);
+			ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;			if (unlikely(ret))
&nbsp;&nbsp;&nbsp;&nbsp;				goto unreserve_out;
&nbsp;&nbsp;&nbsp;&nbsp;		}
@@ -2631,7 +2631,7 @@ static int
validate_invalid_user_pages(struct
amdkfd_process_info *process_info)
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;			gobj = &amp;mem-&gt;bo-&gt;tbo.base;
&nbsp;&nbsp;&nbsp;&nbsp;			ret =
drm_exec_prepare_obj(&amp;exec,
gobj,
1);
-
			drm_exec_retry_on_contention(&amp;exec);
+			ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;			if (unlikely(ret))
&nbsp;&nbsp;&nbsp;&nbsp;				goto unreserve_out;
&nbsp;&nbsp;&nbsp;&nbsp;		}
@@ -2875,7 +2875,7 @@ int
amdgpu_amdkfd_gpuvm_restore_process_bos(void *info,
struct
dma_fence __rcu *
&nbsp;&nbsp;&nbsp;&nbsp;		list_for_each_entry(peer_vm,
&amp;process_info-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">vm_list_head,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;				&nbsp;&nbsp;&nbsp; vm_list_node) {
&nbsp;&nbsp;&nbsp;&nbsp;			ret = amdgpu_vm_lock_pd(peer_vm,
&amp;exec,
2);
-
			drm_exec_retry_on_contention(&amp;exec);
+			ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;			if (unlikely(ret)) {
&nbsp;&nbsp;&nbsp;&nbsp;				pr_err(&quot;Locking VM PD
failed,
ret:
%d\n&quot;, ret);
&nbsp;&nbsp;&nbsp;&nbsp;				goto ttm_reserve_fail;
@@ -2891,7 +2891,7 @@ int
amdgpu_amdkfd_gpuvm_restore_process_bos(void *info,
struct
dma_fence __rcu *
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;			gobj = &amp;mem-&gt;bo-&gt;tbo.base;
&nbsp;&nbsp;&nbsp;&nbsp;			ret =
drm_exec_prepare_obj(&amp;exec,
gobj,
1);
-
			drm_exec_retry_on_contention(&amp;exec);
+			ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;			if (unlikely(ret)) {
&nbsp;&nbsp;&nbsp;&nbsp;				pr_err(&quot;drm_exec_prepare
_obj
failed, ret: %d\n&quot;, ret);
&nbsp;&nbsp;&nbsp;&nbsp;				goto ttm_reserve_fail;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ec888fc6ead8..299e46a6d934 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -897,7 +897,7 @@ static int
amdgpu_cs_parser_bos(struct
amdgpu_cs_parser *p,
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;p-&gt;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(&amp;fpriv-&gt;vm, &amp;p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">1
+ p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">gang_size);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;p-&gt;exec);
+		r = drm_exec_retry_on_contention(&amp;p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto out_free_user_pages;
&nbsp;&nbsp;&nbsp; 
@@ -905,7 +905,7 @@ static int
amdgpu_cs_parser_bos(struct
amdgpu_cs_parser *p,
&nbsp;&nbsp;&nbsp;&nbsp;			/* One fence for TTM and one for
each
CS
job */
&nbsp;&nbsp;&nbsp;&nbsp;			r = drm_exec_prepare_obj(&amp;p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&amp;e-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">bo-
tbo.base,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;						 1 + p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">gang_size);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-			drm_exec_retry_on_contention(&amp;p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">+			r =
drm_exec_retry_on_contention(&amp;p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">r);
&nbsp;&nbsp;&nbsp;&nbsp;			if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;				goto
out_free_user_pages;
&nbsp;&nbsp;&nbsp; 
@@ -915,7 +915,7 @@ static int
amdgpu_cs_parser_bos(struct
amdgpu_cs_parser *p,
&nbsp;&nbsp;&nbsp;&nbsp;		if (p-&gt;uf_bo) {
&nbsp;&nbsp;&nbsp;&nbsp;			r = drm_exec_prepare_obj(&amp;p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&amp;p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">uf_bo-&gt;tbo.base,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;						 1 + p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">gang_size);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-			drm_exec_retry_on_contention(&amp;p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">+			r =
drm_exec_retry_on_contention(&amp;p-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">r);
&nbsp;&nbsp;&nbsp;&nbsp;			if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;				goto
out_free_user_pages;
&nbsp;&nbsp;&nbsp;&nbsp;		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index cfdf558b48b6..8b2b86c7a6c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct
amdgpu_device
*adev, struct amdgpu_vm *vm,
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (likely(!r))
&nbsp;&nbsp;&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec,
&amp;bo-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r)) {
&nbsp;&nbsp;&nbsp;&nbsp;			DRM_ERROR(&quot;failed to reserve
CSA,PD
BOs:
err=%d\n&quot;, r);
&nbsp;&nbsp;&nbsp;&nbsp;			goto error;
@@ -114,7 +114,7 @@ int amdgpu_unmap_static_csa(struct
amdgpu_device *adev, struct amdgpu_vm *vm,
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (likely(!r))
&nbsp;&nbsp;&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec,
&amp;bo-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r)) {
&nbsp;&nbsp;&nbsp;&nbsp;			DRM_ERROR(&quot;failed to reserve
CSA,PD
BOs:
err=%d\n&quot;, r);
&nbsp;&nbsp;&nbsp;&nbsp;			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 67c234bcf89f..17e16c971e21 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -239,12 +239,12 @@ static void
amdgpu_gem_object_close(struct
drm_gem_object *obj,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec, DRM_EXEC_IGNORE_DUPLICATES,
0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		r = drm_exec_prepare_obj(&amp;exec, &amp;bo-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">tbo.base,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">1);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto out_unlock;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto out_unlock;
&nbsp;&nbsp;&nbsp;&nbsp;	}
@@ -776,13 +776,13 @@ int amdgpu_gem_va_ioctl(struct
drm_device
*dev, void *data,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		if (gobj) {
&nbsp;&nbsp;&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec,
gobj);
-
			drm_exec_retry_on_contention(&amp;exec);
+			r =
drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;			if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;				goto error;
&nbsp;&nbsp;&nbsp;&nbsp;		}
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(&amp;fpriv-&gt;vm, &amp;exec,
2);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 5ca5c47ab54e..1b1a5147606e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1221,12 +1221,12 @@ int
amdgpu_mes_ctx_map_meta_data(struct
amdgpu_device *adev,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		r = drm_exec_lock_obj(&amp;exec,
&nbsp;&nbsp;&nbsp;&nbsp;				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ctx_data-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">meta_data_obj-
tbo.base);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error_fini_exec;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error_fini_exec;
&nbsp;&nbsp;&nbsp;&nbsp;	}
@@ -1292,12 +1292,12 @@ int
amdgpu_mes_ctx_unmap_meta_data(struct
amdgpu_device *adev,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		r = drm_exec_lock_obj(&amp;exec,
&nbsp;&nbsp;&nbsp;&nbsp;				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ctx_data-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">meta_data_obj-
tbo.base);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto out_unlock;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto out_unlock;
&nbsp;&nbsp;&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
index e22cb2b5cd92..72b8213e352c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
@@ -77,7 +77,7 @@ int amdgpu_seq64_map(struct
amdgpu_device
*adev,
struct amdgpu_vm *vm,
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (likely(!r))
&nbsp;&nbsp;&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec,
&amp;bo-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;&nbsp;&nbsp;	}
@@ -138,7 +138,7 @@ void amdgpu_seq64_unmap(struct
amdgpu_device
*adev, struct amdgpu_fpriv *fpriv)
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (likely(!r))
&nbsp;&nbsp;&nbsp;&nbsp;			r = drm_exec_lock_obj(&amp;exec,
&amp;bo-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error;
&nbsp;&nbsp;&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index e01c1c8e64c4..63392ce43945 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -89,12 +89,12 @@ static int map_ring_data(struct
amdgpu_device
*adev, struct amdgpu_vm *vm,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		r = drm_exec_lock_obj(&amp;exec, &amp;bo-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error_fini_exec;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto error_fini_exec;
&nbsp;&nbsp;&nbsp;&nbsp;	}
@@ -152,12 +152,12 @@ static int unmap_ring_data(struct
amdgpu_device *adev, struct amdgpu_vm *vm,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		r = drm_exec_lock_obj(&amp;exec, &amp;bo-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">tbo.base);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto out_unlock;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		r = amdgpu_vm_lock_pd(vm, &amp;exec, 0);
-		drm_exec_retry_on_contention(&amp;exec);
+		r = drm_exec_retry_on_contention(&amp;exec,
r);
&nbsp;&nbsp;&nbsp;&nbsp;		if (unlikely(r))
&nbsp;&nbsp;&nbsp;&nbsp;			goto out_unlock;
&nbsp;&nbsp;&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 386875e6eb96..a3aa7fd22f6a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1499,7 +1499,7 @@ static int
svm_range_reserve_bos(struct
svm_validate_context *ctx, bool intr)
&nbsp;&nbsp;&nbsp;&nbsp;			vm = drm_priv_to_vm(pdd-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">drm_priv);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;			r = amdgpu_vm_lock_pd(vm, &amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">2);
-
			drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">+			r =
drm_exec_retry_on_contention(&amp;ctx-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec, r);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;			if (unlikely(r)) {
&nbsp;&nbsp;&nbsp;&nbsp;				pr_debug(&quot;failed %d to
reserve
bo\n&quot;, r);
&nbsp;&nbsp;&nbsp;&nbsp;				goto unreserve_out;
diff --git a/drivers/gpu/drm/drm_exec.c
b/drivers/gpu/drm/drm_exec.c
index 2da094bdf8a4..3770a5d30213 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -28,12 +28,12 @@
&nbsp;&nbsp;&nbsp;&nbsp; *	drm_exec_init(&amp;exec,
DRM_EXEC_INTERRUPTIBLE_WAIT);
&nbsp;&nbsp;&nbsp;&nbsp; *	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp; *		ret = drm_exec_prepare_obj(&amp;exec, boA,
1);
- *		drm_exec_retry_on_contention(&amp;exec);
+ *		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp; *		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp; *			goto error;
&nbsp;&nbsp;&nbsp;&nbsp; *
&nbsp;&nbsp;&nbsp;&nbsp; *		ret = drm_exec_prepare_obj(&amp;exec, boB,
1);
- *		drm_exec_retry_on_contention(&amp;exec);
+ *		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp; *		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp; *			goto error;
&nbsp;&nbsp;&nbsp;&nbsp; *	}
@@ -48,7 +48,8 @@
&nbsp;&nbsp;&nbsp;&nbsp; */
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp; /* Dummy value used to initially enter the retry loop
*/
-#define DRM_EXEC_DUMMY ((void *)~0)
+#define DRM_EXEC_DUMMY ERR_PTR(-ESTALE)
+#define DRM_EXEC_CONTENDED ERR_PTR(-EDEADLK)
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp; /* Unlock all objects and drop references */
&nbsp;&nbsp;&nbsp; static void drm_exec_unlock_all(struct drm_exec
*exec)
@@ -131,8 +132,7 @@ bool drm_exec_cleanup(struct drm_exec
*exec)
&nbsp;&nbsp;&nbsp;&nbsp;		return true;
&nbsp;&nbsp;&nbsp;&nbsp;	}
&nbsp;&nbsp;&nbsp; 
-	drm_exec_unlock_all(exec);
-	exec-&gt;num_objects = 0;
+	exec-&gt;contended = NULL;
&nbsp;&nbsp;&nbsp;&nbsp;	return true;
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; EXPORT_SYMBOL(drm_exec_cleanup);
@@ -194,6 +194,27 @@ static int
drm_exec_lock_contended(struct
drm_exec *exec)
&nbsp;&nbsp;&nbsp;&nbsp;	return ret;
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; 
+/**
+ * drm_exec_handle_contended() - Perform cleanup before
a ww
transaction restart
+ * @exec: Pointer to the drm_exec object.
+ *
+ * Unlocks all held resvs and re-locks the contended
object.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_exec_handle_contended(struct drm_exec *exec)
+{
+	int ret;
+
+	drm_exec_unlock_all(exec);
+	exec-&gt;num_objects = 0;
+	ret = drm_exec_lock_contended(exec);
+	exec-&gt;contended = DRM_EXEC_CONTENDED;
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_handle_contended);
+
&nbsp;&nbsp;&nbsp; /**
&nbsp;&nbsp;&nbsp;&nbsp; * drm_exec_lock_obj - lock a GEM object for use
&nbsp;&nbsp;&nbsp;&nbsp; * @exec: the drm_exec object with the state
@@ -209,10 +230,6 @@ int drm_exec_lock_obj(struct
drm_exec
*exec,
struct drm_gem_object *obj)
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;	int ret;
&nbsp;&nbsp;&nbsp; 
-	ret = drm_exec_lock_contended(exec);
-	if (unlikely(ret))
-		return ret;
-
&nbsp;&nbsp;&nbsp;&nbsp;	if (exec-&gt;prelocked == obj) {
&nbsp;&nbsp;&nbsp;&nbsp;		drm_gem_object_put(exec-&gt;prelocked);
&nbsp;&nbsp;&nbsp;&nbsp;		exec-&gt;prelocked = NULL;
diff --git a/drivers/gpu/drm/drm_gpuvm.c
b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0923d6ae18e2 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1254,18 +1254,18 @@ drm_gpuvm_exec_lock(struct
drm_gpuvm_exec
*vm_exec)
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_gpuvm_prepare_vm(gpuvm, exec,
num_fences);
-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			goto err;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_gpuvm_prepare_objects(gpuvm,
exec,
num_fences);
-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			goto err;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		if (vm_exec-&gt;extra.fn) {
&nbsp;&nbsp;&nbsp;&nbsp;			ret = vm_exec-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">extra.fn(vm_exec);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-
			drm_exec_retry_on_contention(exec);
+			ret =
drm_exec_retry_on_contention(exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;			if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;				goto err;
&nbsp;&nbsp;&nbsp;&nbsp;		}
@@ -1346,7 +1346,7 @@ drm_gpuvm_exec_lock_range(struct
drm_gpuvm_exec *vm_exec,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_gpuvm_prepare_range(gpuvm,
exec,
addr,
range,
&nbsp;&nbsp;&nbsp;&nbsp;					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_exec-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">num_fences);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			goto err;
&nbsp;&nbsp;&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/imagination/pvr_job.c
b/drivers/gpu/drm/imagination/pvr_job.c
index 78c2f3c6dce0..6e0ce6c4576c 100644
--- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -574,7 +574,7 @@ prepare_job_resvs_for_each(struct
drm_exec
*exec, struct pvr_job_data *job_data,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		int err = jobs_lock_all_objs(exec,
job_data,
job_count);
&nbsp;&nbsp;&nbsp; 
-		drm_exec_retry_on_contention(exec);
+		err = drm_exec_retry_on_contention(exec,
err);
&nbsp;&nbsp;&nbsp;&nbsp;		if (err)
&nbsp;&nbsp;&nbsp;&nbsp;			return err;
&nbsp;&nbsp;&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
b/drivers/gpu/drm/msm/msm_gem_submit.c
index fba78193127d..01992b43ea4b 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -259,7 +259,7 @@ static int submit_lock_objects(struct
msm_gem_submit *submit)
&nbsp;&nbsp;&nbsp;&nbsp;		for (unsigned i = 0; i &lt; submit-&gt;nr_bos;
i++)
{
&nbsp;&nbsp;&nbsp;&nbsp;			struct drm_gem_object *obj =
submit-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">bos[i].obj;
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;			ret =
drm_exec_prepare_obj(&amp;submit-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">obj, 1);
-
			drm_exec_retry_on_contention(&amp;su
bmit-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">exec);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">+			ret =
drm_exec_retry_on_contention(&amp;submit-&gt;exec, ret);
&nbsp;&nbsp;&nbsp;&nbsp;			if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;				goto error;
&nbsp;&nbsp;&nbsp;&nbsp;		}
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index ee02cd833c5e..0c871634fdfb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1350,7 +1350,7 @@ nouveau_uvmm_bind_job_submit(struct
nouveau_job *job,
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(exec, vme-&gt;flags, 0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = bind_lock_validate(job, exec, vme-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">num_fences);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret) {
&nbsp;&nbsp;&nbsp;&nbsp;			op = list_last_op(&amp;bind_job-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">ops);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;			goto unwind;
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c
b/drivers/gpu/drm/tests/drm_exec_test.c
index 81f928a429ba..28558fdb08df 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -63,7 +63,7 @@ static void test_lock(struct kunit
*test)
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec,
DRM_EXEC_INTERRUPTIBLE_WAIT,
0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			break;
@@ -83,14 +83,14 @@ static void test_lock_unlock(struct
kunit
*test)
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec,
DRM_EXEC_INTERRUPTIBLE_WAIT,
0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			break;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		drm_exec_unlock_obj(&amp;exec, &amp;gobj);
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			break;
@@ -110,13 +110,13 @@ static void test_duplicates(struct
kunit
*test)
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec, DRM_EXEC_IGNORE_DUPLICATES,
0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			break;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_exec_lock_obj(&amp;exec, &amp;gobj);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			break;
@@ -137,7 +137,7 @@ static void test_prepare(struct kunit
*test)
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec,
DRM_EXEC_INTERRUPTIBLE_WAIT,
0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = drm_exec_prepare_obj(&amp;exec, &amp;gobj,
1);
-		drm_exec_retry_on_contention(&amp;exec);
+		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		KUNIT_EXPECT_EQ(test, ret, 0);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			break;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 040dd142c49c..20ec1ab1b52d 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -200,7 +200,7 @@ static int handle_pagefault(struct
xe_gt
*gt,
struct pagefault *pf)
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = xe_pf_begin(&amp;exec, vma, atomic,
tile-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">id);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			goto unlock_dma_resv;
&nbsp;&nbsp;&nbsp; 
@@ -543,7 +543,7 @@ static int handle_acc(struct xe_gt
*gt,
struct
acc *acc)
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		ret = xe_pf_begin(&amp;exec, vma, true,
tile-
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">id);
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">-		drm_exec_retry_on_contention(&amp;exec);
+		ret =
drm_exec_retry_on_contention(&amp;exec,
ret);
&nbsp;&nbsp;&nbsp;&nbsp;		if (ret)
&nbsp;&nbsp;&nbsp;&nbsp;			break;
&nbsp;&nbsp;&nbsp;&nbsp;	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c
b/drivers/gpu/drm/xe/xe_vm.c
index e2ec148c9c33..335524e803e7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -501,7 +501,7 @@ static void
preempt_rebind_work_func(struct
work_struct *w)
&nbsp;&nbsp;&nbsp;&nbsp;		bool done = false;
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;		err = xe_preempt_work_begin(&amp;exec, vm,
&amp;done);
-		drm_exec_retry_on_contention(&amp;exec);
+		err =
drm_exec_retry_on_contention(&amp;exec,
err);
&nbsp;&nbsp;&nbsp;&nbsp;		if (err || done) {
&nbsp;&nbsp;&nbsp;&nbsp;			drm_exec_fini(&amp;exec);
&nbsp;&nbsp;&nbsp;&nbsp;			if (err &amp;&amp;
xe_vm_validate_should_retry(&amp;exec, err, &amp;end))
@@ -1052,7 +1052,7 @@ static void
xe_vma_destroy_unlocked(struct
xe_vma *vma)
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_init(&amp;exec, 0, 0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		err = xe_vm_lock_vma(&amp;exec, vma);
-		drm_exec_retry_on_contention(&amp;exec);
+		err =
drm_exec_retry_on_contention(&amp;exec,
err);
&nbsp;&nbsp;&nbsp;&nbsp;		if (XE_WARN_ON(err))
&nbsp;&nbsp;&nbsp;&nbsp;			break;
&nbsp;&nbsp;&nbsp;&nbsp;	}
@@ -2148,11 +2148,11 @@ static struct xe_vma
*new_vma(struct
xe_vm
*vm, struct drm_gpuva_op_map *op,
&nbsp;&nbsp;&nbsp;&nbsp;			err = 0;
&nbsp;&nbsp;&nbsp;&nbsp;			if (!bo-&gt;vm) {
&nbsp;&nbsp;&nbsp;&nbsp;				err =
drm_exec_lock_obj(&amp;exec,
xe_vm_obj(vm));
-
				drm_exec_retry_on_conten
tion
(&amp;
exec);
+				err =
drm_exec_retry_on_contention(&amp;exec, err);
&nbsp;&nbsp;&nbsp;&nbsp;			}
&nbsp;&nbsp;&nbsp;&nbsp;			if (!err) {
&nbsp;&nbsp;&nbsp;&nbsp;				err =
drm_exec_lock_obj(&amp;exec,
&amp;bo-&gt;ttm.base);
-
				drm_exec_retry_on_conten
tion
(&amp;
exec);
+				err =
drm_exec_retry_on_contention(&amp;exec, err);
&nbsp;&nbsp;&nbsp;&nbsp;			}
&nbsp;&nbsp;&nbsp;&nbsp;			if (err) {
&nbsp;&nbsp;&nbsp;&nbsp;				drm_exec_fini(&amp;exec);
@@ -2884,7 +2884,7 @@ static int
vm_bind_ioctl_ops_execute(struct
xe_vm *vm,
&nbsp;&nbsp;&nbsp;&nbsp;		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_EXEC_IGNORE_DUPLICATES, 0);
&nbsp;&nbsp;&nbsp;&nbsp;	drm_exec_until_all_locked(&amp;exec) {
&nbsp;&nbsp;&nbsp;&nbsp;		err =
vm_bind_ioctl_ops_lock_and_prep(&amp;exec,
vm,
vops);
-		drm_exec_retry_on_contention(&amp;exec);
+		err =
drm_exec_retry_on_contention(&amp;exec,
err);
&nbsp;&nbsp;&nbsp;&nbsp;		if (err)
&nbsp;&nbsp;&nbsp;&nbsp;			goto unlock;
&nbsp;&nbsp;&nbsp; 
diff --git a/include/drm/drm_exec.h
b/include/drm/drm_exec.h
index aa786b828a0a..fafb40d96e38 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -51,6 +51,8 @@ struct drm_exec {
&nbsp;&nbsp;&nbsp;&nbsp;	struct drm_gem_object *prelocked;
&nbsp;&nbsp;&nbsp; };
&nbsp;&nbsp;&nbsp; 
+int drm_exec_handle_contended(struct drm_exec *exec);
+
&nbsp;&nbsp;&nbsp; /**
&nbsp;&nbsp;&nbsp;&nbsp; * drm_exec_obj() - Return the object for a give
drm_exec
index
&nbsp;&nbsp;&nbsp;&nbsp; * @exec: Pointer to the drm_exec context
@@ -113,15 +115,26 @@ __PASTE(__drm_exec_,
__LINE__):						\
&nbsp;&nbsp;&nbsp; /**
&nbsp;&nbsp;&nbsp;&nbsp; * drm_exec_retry_on_contention - restart the loop to
grap
all
locks
&nbsp;&nbsp;&nbsp;&nbsp; * @exec: drm_exec object
+ * @_ret: The current error status
&nbsp;&nbsp;&nbsp;&nbsp; *
&nbsp;&nbsp;&nbsp;&nbsp; * Control flow helper to continue when a contention
was
detected
and we need to
&nbsp;&nbsp;&nbsp;&nbsp; * clean up and re-start the loop to prepare all GEM
objects.
+ *
+ * Return: If no loop restart occurred: The error
status.
&nbsp;&nbsp;&nbsp;&nbsp; */
-#define
drm_exec_retry_on_contention(exec)			\
-	do
{							\
-		if
(unlikely(drm_exec_is_contended(exec)))	\
-			goto
*__drm_exec_retry_ptr;		\
-	} while (0)
+#define drm_exec_retry_on_contention(exec,
_ret)			\
+	({						
	
	\
+		struct drm_exec *__exec =
(exec);			\
+		int __ret =
(_ret);					\
+							
	
	\
+		if
(unlikely(drm_exec_is_contended(__exec)))
{		\
+			WARN_ON(__ret != -
EDEADLK);			\
+			__ret =
drm_exec_handle_contended(__exec);	\
+			if
(!__ret)					\
+				goto
*__drm_exec_retry_ptr;		\
+		}					
	
	\
+		__ret;					
	
	\
+	})
&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp; /**
&nbsp;&nbsp;&nbsp;&nbsp; * drm_exec_is_contended - check for contention
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------nipCO9CCWmh0z9MX2U0wKxmK--
