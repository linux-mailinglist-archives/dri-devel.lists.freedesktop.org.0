Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC333F4BC1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 15:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA71589762;
	Mon, 23 Aug 2021 13:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 14776 seconds by postgrey-1.36 at gabe;
 Mon, 23 Aug 2021 13:32:29 UTC
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (unknown
 [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE91989762
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 13:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQUUs9Ityfp0/jzxTeBTgyrE/KHjgwz2oHbnl1yU+D1p5BD7SYEE0qI8KzKGli8Fi0fhQXzGOR+GV2Wud8T0qlO2cLGZ1104cNY0ux6xJdEu+G+53Nw+FL+aMq5+/GSCq94CMMtWfWmRXd6kHAeRuOCeSO4OQBDAdV8w+PggKpdemmrB6OA4bkOoRbMQaitRJl5mXrAiMmb6uE3WIvLFopoB6smCT3aBY6ehAFdXhiUG4PF5lU2K00XGioaIQ/1kIbIaVaAntiguqyKvXBb44TwKE2U6jFw8DM4dEOt5KcRFpr4MR95lFbeoiRbwuGuzSoMgmHTXGe/e4xQnHXfmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaj3EbavUccsKZsKoY0/Fjq9Rja3StxaShb28ZD7pK8=;
 b=JqfgSC4ihyu0kqPPBwM6c3IeyOkcwuWYFmjkcGBdpfs0v2SRbXKnjdpeXNhS3q4uToTA4WWJqGuk7i6qLe80emcVgesUUbRr8I6NEwD+TNEOXrbAK29EX7yDfjVPUPQ7GpkyvxzPvLdI01Y8vFsKqEpB6yg2kJ8ZgQ/fyXHWrPCm9nEAt2JnmT4YglTsL7D0JASmU36HoEYo0dl9Y5teuon3x8ass1dtu1cZuXL6az4QOTr7OJjkzaPrD6hzH0CykL7NtGDwBe4cgMWhg+Q1pbCJfE+VYmaIHJQ8B9tNu8xOhZoI/mFJhtFadx9y3A4GVzax2DkMBPulqj5T3L7mfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaj3EbavUccsKZsKoY0/Fjq9Rja3StxaShb28ZD7pK8=;
 b=eNB/SgMQZPyXFGxXx0HR01YC9v7pNmgpdSnQ0lAcECsuyaUYSOEn1xHam/h/Q4uYxQekOXNaaITfjZL22e1PDfH8A+jbKBexyLWtYk6klT89Irw5TUaHpIlyk/N1C0srMPHYmHUbXzON1IzfiIjSakaT36Yqcthie7aHQPII84E=
Authentication-Results: fooishbar.org; dkim=none (message not signed)
 header.d=none;fooishbar.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 13:32:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 13:32:23 +0000
Subject: Re: [RFC 6/8] drm: Document fdinfo format specification
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, David M Nieto <David.Nieto@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
References: <20210823112859.103561-1-tvrtko.ursulin@linux.intel.com>
 <20210823112859.103561-7-tvrtko.ursulin@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <52ba613b-be4b-b9f4-5a9e-91c772b810cd@amd.com>
Date: Mon, 23 Aug 2021 15:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210823112859.103561-7-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.12 via Frontend Transport; Mon, 23 Aug 2021 13:32:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c853a1fc-8c92-43a8-6f9a-08d9663a705d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3935614FD09425DE7E59780B83C49@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ba9E8Ww/iZoUGozRXs0C6aCL4E4e20HNL8kCXsLf1BBtgpfnWIBXhuiFGCRAnCLoJRbO3KBPgOJgNf8NVkqwGwyYTTYkXvm88mRvH/ADzZygU0arHgTvv0TrDEFS9+wSXEW+Bd7Y8GDtyg6BbiXQajTsm4gGFNaA9eZnKGMAC/2eQd4mDu551feu2Ks4u40PqbIUkUu7bLkm+jz/1PDc7h4Y34EcZhFuUjwznckqsieDp95mCCPG0TOCkcb7i+nOaTKY0aPZlZiMm1qaCCMCaKLRDM1xYpOFDACM5dQDrd99CUHutR2wZtZ6DwQ33V47Knk+13bsebjyRLc+cmGddS0rBW9jH1viF+oiNE80nVBPA218sVwBAWHtDbKmMQ2juLRdzSqgS2D8+OqsAzoYFaJXXTAXIft+9Ajjq8QI4gfjJZNhjuUxW4f/8onqpvpEVGr09s23TO7Xaz26zeJZxmGW0TTmZJcEC+Qiw9o4T7PlOHsQ+XeT7d9Y8rgXTpv40IRJli9ftYuV7cVpgT/Slus0iG4+pyRZ0eITojHroYIDR1zFCoLuQYPEJvvulKMz7uwF9SkiAeZPSGUXyl4gCJJ5D/MZRSfYrW0SyydlK5NlgMrzEygpMuNHVAwKKek2/Xz7IzQrn+ZbMsqbglhHyMASqkOuW3SKKjeiaB2hTHjmhe65zikeI1Lk5z7pKRlFBpFPaSCwdaOpj1ijaU3QzdFD96sNe/TatzVz3DZYoOTj/st1eb+pyLj/930C02vM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(66476007)(8936002)(316002)(66556008)(2906002)(66946007)(16576012)(4326008)(5660300002)(26005)(86362001)(8676002)(54906003)(38100700002)(956004)(6486002)(31686004)(31696002)(186003)(6666004)(2616005)(36756003)(83380400001)(66574015)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3k0VzY0Tzk2VTg1YitvUFVJQnN5OElNUFNETGswMVl3QlJTZTlJRi9SZUZm?=
 =?utf-8?B?L0tlNk9VQWpKT3FmcDM3Q1pMVmsyem1UTzRNaXVNK25xcTVWV3NIL1JkN0xH?=
 =?utf-8?B?OGIvdFU5Q0luUHRUVnNocTJoUlExWXdUc2REeDRQcEMra2FoMWhVSmdqSlpl?=
 =?utf-8?B?RzlOejNFOUhubGlFaFlFUklIYmt3Skc2dDM0L01Xb1hyQi8rVXZmaWsxYll4?=
 =?utf-8?B?SktyMXB1VnE3K2NXc2w0elJ4Z01SRm15czgwMFBVamdwV3hxQmtJYUlQSFZP?=
 =?utf-8?B?Zjh1cHdWRUU4Y1FoSDFQSk1aUDh0eTQ2ajcrclkwRmJLbHhXOHdFRXM4UU10?=
 =?utf-8?B?Vi9PV2xrUE1GdHovRVl1M2xGdUo2T2lDT3ZuMlp1bmhsdHFVcjMxL1dDZmp0?=
 =?utf-8?B?ejNIVlh0QU9CYVhxQVQzTEsvWDNxUkllbTJaQmc1UE5HSTdmZVNOczdNN0Qx?=
 =?utf-8?B?bklqZXVUK200ZW5DY0R5MWgzYUZKbUkvMWx1ZU9EMDJ2a1ZlNE5FNUs0Zk1Q?=
 =?utf-8?B?cFRRaFBDd0lmRmF6WjI0ZytscTQ2WlBtalJrZ3VXRGZIVUtyYSt6RlZuUjI0?=
 =?utf-8?B?ZG9VQ0Zsd0pBZnhmaVRxQ1krcHhudVN1QXBob2hGSlVOZCt1bFhlZXJmaVpP?=
 =?utf-8?B?SXd3WWZiZjluQ3hpUFpCSEJBaVVCR0RvUWpWSVIwNkNtWEw3R0NMYjNESklv?=
 =?utf-8?B?Q0NGeDd2eElvQlp4WXEybWRVb0NKOUhWTzViNThkL284Z3Zlb3RzUG9RUHFt?=
 =?utf-8?B?bGNmK3BaVndLUzRORXhFM0s4dXQ1UjhvNU52emZrTGRPb0hHaGJ5eFBiUHA2?=
 =?utf-8?B?WXdzcEl4T2tQNG4yK1ZWM2l1REo0c3VDUEYwbUtTUUwrK2lxWDUxSU9OaGtK?=
 =?utf-8?B?akxxUXlCME1qMTQ2ZjZWYnBNdU9XS1BxekFvM0JSOG5QdkNIei9PZlRlRE5K?=
 =?utf-8?B?bTNNU0NaTWU0N0JkbjV2OXdYaDMvbU9jYXo4YktLaHd2bTlDR0lDYmF2L095?=
 =?utf-8?B?ZmlSSFZjd2FlbW93WmVzN2JLNEczK1RjeUdVaTVGQjFSZjFXdG04N0pkVUcw?=
 =?utf-8?B?d0hrQzBCaUsrTjFTU2F5dHY1VzFxaXZYdjZVT1pJc2lkZUE2RG1ITE1ka1pV?=
 =?utf-8?B?VVd6S1crQ1YwUnBpLzVQcG1yWVhXNW5zRDNIMGRpcEp0TGJsbGxvUlZGT1da?=
 =?utf-8?B?YzJVTDllNmlVeUlIazZKWG9WYVBwWmpZV3ZqQURDTlFCeFliUTNvQkwvVU5D?=
 =?utf-8?B?a1R6Nk45VFczZjVSSTBCUUgxQmZHTXpRVE5rTm1BRXZ5VWNrSW16YzVKVXpL?=
 =?utf-8?B?a3hRNndRWmpPekFXbmk1MHlPZ3dmM3k1ZTRJajhWbThqUDl0UHUveVdNYjUr?=
 =?utf-8?B?bFBEQ2kyYmRqWmRhTmtSQ216SWFsenhieWhidjhqaU5HcWRKZzdxVk9aZTRR?=
 =?utf-8?B?Mi9QQ05OTXFXUXhFUGdJS3FCRjk5bmpSZ0VwNnpFMitmYTZVYk9ySlpsVGZY?=
 =?utf-8?B?bm5Ga3Y2U2dNcTc1MmNpT2UybXNkeUI0UnlFTVJSc0lqOFRZb1JidmttNHFm?=
 =?utf-8?B?cUdDMm15TSthcDhWUkwyZENpcS9hWjc2dERBNGJMUGVHUlkrb0tnR2d0b3Y2?=
 =?utf-8?B?NWZ6ZmpleW1FdHZ5cGdOMU9qcnJBU3NvcXFxSGFHWTVkc3NOOWx2RTNReWZZ?=
 =?utf-8?B?UU1PM1l4TFZ1Y3pPdzBVYmc2YkRkTEcxTnMwU3I0aS9SaUJVSk1XT1ppbVdO?=
 =?utf-8?Q?XhItDxzsCVNhkTtQKf7masqs1EzpkC8Uag2rXL5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c853a1fc-8c92-43a8-6f9a-08d9663a705d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 13:32:23.1152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PL8blNg50czU1x4cB6BZ7rpf/epEKnRdzrc51p+ow9KEprdbZW93IXz156/eKh+I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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

Am 23.08.21 um 13:28 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Proposal to standardise the fdinfo text format as optionally output by DRM
> drivers.
>
> Idea is that a simple but, well defined, spec will enable generic
> userspace tools to be written while at the same time avoiding a more heavy
> handed approach of adding a mid-layer to DRM.
>
> i915 implements a subset of the spec, everything apart from the memory
> stats currently, and a matching intel_gpu_top tool exists.
>
> Open is to see if AMD can migrate to using the proposed GPU utilisation
> key-value pairs, or if they are not workable to see whether to go
> vendor specific, or if a standardised  alternative can be found which is
> workable for both drivers.
>
> Same for the memory utilisation key-value pairs proposal.
>
> v2:
>   * Update for removal of name and pid.
>
> v3:
>   * 'Drm-driver' tag will be obtained from struct drm_driver.name. (Daniel)
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: David M Nieto <David.Nieto@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniel@fooishbar.org>

I'm not an expert on that stuff, but as far as I can see this totally 
makes sense to me.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to those three patches.

Regards,
Christian.

> ---
>   Documentation/gpu/drm-usage-stats.rst | 97 +++++++++++++++++++++++++++
>   Documentation/gpu/index.rst           |  1 +
>   2 files changed, 98 insertions(+)
>   create mode 100644 Documentation/gpu/drm-usage-stats.rst
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> new file mode 100644
> index 000000000000..c669026be244
> --- /dev/null
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -0,0 +1,97 @@
> +.. _drm-client-usage-stats:
> +
> +======================
> +DRM client usage stats
> +======================
> +
> +DRM drivers can choose to export partly standardised text output via the
> +`fops->show_fdinfo()` as part of the driver specific file operations registered
> +in the `struct drm_driver` object registered with the DRM core.
> +
> +One purpose of this output is to enable writing as generic as practicaly
> +feasible `top(1)` like userspace monitoring tools.
> +
> +Given the differences between various DRM drivers the specification of the
> +output is split between common and driver specific parts. Having said that,
> +wherever possible effort should still be made to standardise as much as
> +possible.
> +
> +File format specification
> +=========================
> +
> +- File shall contain one key value pair per one line of text.
> +- Colon character (`:`) must be used to delimit keys and values.
> +- All keys shall be prefixed with `drm-`.
> +- Whitespace between the delimiter and first non-whitespace character shall be
> +  ignored when parsing.
> +- Neither keys or values are allowed to contain whitespace characters.
> +- Numerical key value pairs can end with optional unit string.
> +- Data type of the value is fixed as defined in the specification.
> +
> +Key types
> +---------
> +
> +1. Mandatory, fully standardised.
> +2. Optional, fully standardised.
> +3. Driver specific.
> +
> +Data types
> +----------
> +
> +- <uint> - Unsigned integer without defining the maximum value.
> +- <str> - String excluding any above defined reserved characters or whitespace.
> +
> +Mandatory fully standardised keys
> +---------------------------------
> +
> +- drm-driver: <str>
> +
> +String shall contain the name this driver registered as via the respective
> +`struct drm_driver` data structure.
> +
> +Optional fully standardised keys
> +--------------------------------
> +
> +- drm-pdev: <aaaa:bb.cc.d>
> +
> +For PCI devices this should contain the PCI slot address of the device in
> +question.
> +
> +- drm-client-id: <uint>
> +
> +Unique value relating to the open DRM file descriptor used to distinguish
> +duplicated and shared file descriptors. Conceptually the value should map 1:1
> +to the in kernel representation of `struct drm_file` instances.
> +
> +Uniqueness of the value shall be either globally unique, or unique within the
> +scope of each device, in which case `drm-pdev` shall be present as well.
> +
> +Userspace should make sure to not double account any usage statistics by using
> +the above described criteria in order to associate data to individual clients.
> +
> +- drm-engine-<str>: <uint> ns
> +
> +GPUs usually contain multiple execution engines. Each shall be given a stable
> +and unique name (str), with possible values documented in the driver specific
> +documentation.
> +
> +Value shall be in specified time units which the respective GPU engine spent
> +busy executing workloads belonging to this client.
> +
> +Values are not required to be constantly monotonic if it makes the driver
> +implementation easier, but are required to catch up with the previously reported
> +larger value within a reasonable period. Upon observing a value lower than what
> +was previously read, userspace is expected to stay with that larger previous
> +value until a monotonic update is seen.
> +
> +- drm-memory-<str>: <uint> [KiB|MiB]
> +
> +Each possible memory type which can be used to store buffer objects by the
> +GPU in question shall be given a stable and unique name to be returned as the
> +string here.
> +
> +Value shall reflect the amount of storage currently consumed by the buffer
> +object belong to this client, in the respective memory region.
> +
> +Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> +indicating kibi- or mebi-bytes.
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index b9c1214d8f23..b99dede9a5b1 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
>      drm-kms
>      drm-kms-helpers
>      drm-uapi
> +   drm-usage-stats
>      driver-uapi
>      drm-client
>      drivers

