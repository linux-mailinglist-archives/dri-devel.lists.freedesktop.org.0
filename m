Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED468B4C94
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 18:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDC411259A;
	Sun, 28 Apr 2024 16:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w32lWoWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1282A11259A;
 Sun, 28 Apr 2024 16:09:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B60o1nj9JO8nnVUyehYAYxCIRQvAXPBH2Vt0Q13Ea+sDl9c26ljoa2dm7yVLtTPGTfpVVtKnVfWwnBXsCeBYYM+/DVCjHMZukZd7ZQJoT1SUOM1qrYaFaNDJgY1LDH2LUpWDkyQI/nTXj4konF8yshe+4wIbWf7sZzJGPnUsTJh+OLqbkN8yaaw7X5P5U2ELlPuVh6SegkQr0UH4iQ9MUHl7U+ok7I2e4wWg8T8sYm7M434ACXmsjMswsZC5g2QfuDWIbiQTS/dPz5fv0cmpMbuu5cdhEgZNf9LYaMEnyJ6rdCnUEjYup3cfEPe6rOAdj0cyoPjxpsZZYlqAHFDKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOaIqqvOd3MuVapGVuucF0+BxFfUv0Gqh1hHshwFs8g=;
 b=Vtlg5BOeVMcIhsFsIx0itWKHL2h4P0SIMOBv2wG1lCIgxP7ORW6zFtHD7u2wUYTWpQC4xuMIJFrMvP8NWC0iK/y6LY6+KGaEK9GtvX2rsH6ga3uizm6LtMjwjqaiBO2kWB5gNBOEB0A6SZVOdxmzCqezgVzuxFq0GNa5TA1VV2su51zWFlFnu1lwf4eQOGP0kDagS2jeyfOer8qgoqUtI7U/Ib5i1ZNmwGP9TBo6krSodXrNh4gy5swHJZHccR7R203qyQFCarc1iUMD85T8dekhzkxaaeUxlcZ+yqYqlEKmhZ4WEWGw/jjVAfQoZoYjEEbMKbRoTE4gYeoQ5ALcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOaIqqvOd3MuVapGVuucF0+BxFfUv0Gqh1hHshwFs8g=;
 b=w32lWoWoP5dTc6kUKtzX0Faejms2y+FSmUJIanPMyyyOkIN8/rmF3xSSOemOcJMiRjdl4d5/1LuqtBqqQOX19N56EaaycR1TO972W1a5zvI8gSrOexotNwDQ6IrdAPnXGwDdJk5WanwSjagizA7ZfeKs2BwPWMGHzhKhlqLQASw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Sun, 28 Apr
 2024 16:09:32 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%4]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 16:09:32 +0000
Message-ID: <62025fa0-6141-4332-9d1c-89a3e7cce7b3@amd.com>
Date: Sun, 28 Apr 2024 12:09:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: re-indent dpp401_dscl_program_isharp()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <2b0a61a0-baca-415f-aad4-7dc4cde73ef7@moroto.mountain>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <2b0a61a0-baca-415f-aad4-7dc4cde73ef7@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::17) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: b43df62f-42ff-4de5-d27d-08dc679d972b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUhhT28reGFxTG5pQ0NCQVJJLzZTVjFWelRnVGtkTlAwOWtIRFY5L2s3QWlM?=
 =?utf-8?B?LzFFaTlIQytPeUsxR0NPa0lSNlErc0llYXhpM1k1TDZaZWNGaVBMKzhUZE9L?=
 =?utf-8?B?MENPNkFPWWUrRFJGRk5RQWpMcDVBTmNqTXl5SmY0Sm5qZjdtWnczbG02Tmt6?=
 =?utf-8?B?djlTZVN4ZUxvZk1hZmR3RHFiUUVYUzRDZnRKQm9naUZ2ZnlFWVZWV1Z0MGdL?=
 =?utf-8?B?aEc0bnJ2MmcyTUJ4b0tqdmpMaDZyVHBiaytFSXlVdWpKWGt3c3BYaEpqV2Jl?=
 =?utf-8?B?RlhDNFJVazM2bS9OaUVaK0hDNEhPTDc5K1JEUGtjUVh0b2F5NzZFS2E4OWVC?=
 =?utf-8?B?eEYyU1FldVBycTUxbEh5bDNwT0dqN2VINzdkSENNN3ROMmtxREdndy9kVmJs?=
 =?utf-8?B?WDZqdzh0WWhRK1I5ZzI4cnR3RWZrUitpaDlpa0RjOVNYUTdpTGZ4Vm1oclNM?=
 =?utf-8?B?Vm9xN3lrZXJhSnRubzI1cGJpdTFxVjkrcGZYcHEyYnFBUURreWZtcjFNTUd2?=
 =?utf-8?B?cnAxS1NwRXRsTFRtMjE4b00raTY4aHZ0SG1jaU9wV0J2NUU5UDBOZkRXRnB1?=
 =?utf-8?B?UUw5djlmNWJObHRhVW5ET1BBREg3WHZzTTVZNElUQUdPTEFHdTlPNVIyZ29N?=
 =?utf-8?B?WmhFWlJOSWc2ZnR3dDhKQXhheWliSGxCSWx0dVV6eXFLVXp2c2xPcXJnMXND?=
 =?utf-8?B?NTFmUHFaUEdTSk9OMkh1S2NEQkdZN21qT1Z0VTByNHVJZ05zOEhwaTQwY0Ju?=
 =?utf-8?B?emdoMVR4NXdEYlRvS2NXbis3SnRQZFlIY0FjeG41cmFFRC8rNmNCVFpDTjVQ?=
 =?utf-8?B?d0lIcWt1dUpxdFpzSlpVU1gwUUhCMHBLUnJBTXlQL25yOXVFREdDMFJEeWdk?=
 =?utf-8?B?ZDRvT3B0SWhGUXpxY29icnJtTXc1YlFpWXpTZjlDUnBvNlhPN2l0VUc1WkNn?=
 =?utf-8?B?V0NSaEdISDFYdktUQUxoVEM4aUJqd1dBTFRhSXBKR2FCYXNvdnM2U0lxMk80?=
 =?utf-8?B?YnBjRmV4cXczeWNmNWxmTDR6WUZmOEVuMzR5eTdwaS9HRnZNWGtUMU9Wd2g2?=
 =?utf-8?B?MGVqWldicGJNUmVHbkpTRDkwVnJWQVl2M0F0ZHQrd2Ryb1MyM2JCWk9EaWVs?=
 =?utf-8?B?WnVmNC9MSEhLd3IxaFRCeG9BZG5UbWtrblBqaHA4ZStkSytDRWNPK0w3MjZF?=
 =?utf-8?B?T0c3NVBTTE5ueTZEV0lhNC8xRzdKalZEZ2dMZFJmdGROVVhrOHJLRG5oYkhs?=
 =?utf-8?B?cXBSSVNXL1pScE8yaW9ib250aTZIU1BSanlKeS8reEVNdXl3R0lsRHdaekkz?=
 =?utf-8?B?YXlBcUNkQWZkYjM0NTczbTlRbUwwM2FPeFh3RGJGU1hnNjFPM2x5YjBaYTlM?=
 =?utf-8?B?YU1scldrcmN1RENxaTBhNjJoMWRTdGdXZU5EemJOdytIUnZiK0pwOGxSSG1i?=
 =?utf-8?B?cWVIK0RiYVhHYjhHYUlReVJlZjl5NEFIcDFKSGJ4VjRFNy93NEJHYTBVUko5?=
 =?utf-8?B?ZGI1NS9heEtoajVYV2JQTCtRaUNRVk9vRTdoV0VjQzUwejE1ZlE0bmZCVEJz?=
 =?utf-8?B?NEoyVEg4YzQ1L3YwRjBqbHl0TmhTRlJWWHprSkxhRUtQcFlxT1FzRTZQMXh3?=
 =?utf-8?B?b2p1TVJCN2Qwb0lrNEIyaHZrSmd3N0ViVlRmNUhVdW5mckVXV1huUFF4T2Zs?=
 =?utf-8?B?cUJVRGh3a2h0VlNiVjhCamdpMFNqV0dFZjRsRjNoTEhXOUN1eEpVbWVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxVNkVXYWhMenNMdHY0azQ5Y0IwSWhiOHFRQU81dUV1Y3BEUG9KN2hoRytq?=
 =?utf-8?B?aXQ4c0liV1hiaUtqMWpyM1VpL0Y3c0QvbkpYVjNzLzhDeER3VG1SVkszQnRI?=
 =?utf-8?B?WTcyQ1FGZDlSeGNhVTlCcHd3NVR2bFVZQ3g0eGdEU2tSOEwrSnc3TVhHbTVz?=
 =?utf-8?B?eUZLTzdKazdTb3gzdnV5K3Vwb2RtQlhUVnhOUTFHUm1wbFJWbi9taVhDYyt1?=
 =?utf-8?B?ZjFVTFNqcDJzM0FjODFxd0lMUTg5N09sZFdIbHB4a1VzRGUyYkJ6Q0ZiQjhV?=
 =?utf-8?B?cUI4Y281UUpHc2RqS1lNQ04zZFg2aTUwZ0V5VThvaHhhS3J5TEpXNVN0dUJN?=
 =?utf-8?B?S044cWRuT2RvQmk0dXhWQmJkeFVCcFdialVBdEtJcklPYU9ySkl3M2xmVDBF?=
 =?utf-8?B?SjdWMnBweTZxSFhYdFRhcm8xOUtyQlJOaXVUekNTYU4yalZxelpWVWN6aUlZ?=
 =?utf-8?B?Mzl6OVlobXVVS3VTbEJzenVINlF4T1ZMRE9CQ2dvL25jenh2YXpKbDg1RWVx?=
 =?utf-8?B?bGl6S05iNFUrNUU0WTU4Q2J0MStxM0NkQ21LM0hTN3pvVTR6K29nNk94T1Ez?=
 =?utf-8?B?L25qeGtPVmF6YUc0KzAwLzV1enZzUDZESklPWnFST3hXUHUrbFcxczI0K0Fq?=
 =?utf-8?B?cGpnUHdRVkZVdUNEa3hBemhtTmRONGtXTFdtRDYzaEF6bktSUWJaSHhqZFg5?=
 =?utf-8?B?L0NpdlBpbU5sNmFZcjhQVmEvcFZaMEREeHRvLzJORGUxeXAxSEEvY1dKb3hQ?=
 =?utf-8?B?dmc4YzAyKzdoUnVuNFZmeTc4c2JXdE1QNzVHUzJ0OGhQWWpTNkVyOXdSSWJM?=
 =?utf-8?B?TG5Ld3ZXRis4UWpFVjEydVJXRG5XdWhhRitBRnRhdGZEM3c4cHlZQy83S2Zp?=
 =?utf-8?B?NFd5eDRUbE9iSjgvNHpDNmdXQ2ZFUmw4OHJjSGo0eTV6cXZjWVFxbFh2MVI0?=
 =?utf-8?B?QjdtTTcxc01BYWdJRXBlLzR4WUcrV2RGV2xYOENKUUVETkVHOXpJQ2VJMEFo?=
 =?utf-8?B?c0liazlHVzI0MjIxQ2VGTVJseFZTaE5RM0x0VE5NNkk0T3ZBekNzNDJDVUo0?=
 =?utf-8?B?RmtYenNWbzJGVEE1c2x5UTNhMC90RzZobCtrTDdTN0JMRDBLa2NmS1MxU2pD?=
 =?utf-8?B?SWgrM3VjY05nT2JEREFLTTBzUnM2VzlrUmNoZzUwckhGc1FxR25DY3dXODV3?=
 =?utf-8?B?YWxCejVUTGZVZ3k3anJoZ296OG1LUnAwaTlaL2JaZXRrN2JqaUhGQjY1M01S?=
 =?utf-8?B?VkowaFlUSGVVb3cwSElqVGRYR0o4dDBneWRJcjZmdFFBT1hlT29NL3VQRXpE?=
 =?utf-8?B?VVRMOTdrc212UnNpMFdBZU5nNmVsRkp6ZFdxdGtSU3JxMXVaVGd3emt0dmx0?=
 =?utf-8?B?eHhkbWt1aVBwQXZ0aEUwOE00NmlUaVFLTmg0MWpEVVorRm1FV3VYN2dXZzFZ?=
 =?utf-8?B?Q04vNEhoNnArM3c1ZUlYQXhOWWxpeTJmRW9RRVlOeHBVWm41UCtwZk90VDJH?=
 =?utf-8?B?Zk9USDl0VG5xUUdxTjIvZW5COEpuVHlIbVl3bUlJTGxONWtheXEzL0hUSys1?=
 =?utf-8?B?b3ptN0s1bUppWmdDam5tUkhlVG8rUFhkQUJXcFNKaHF3cVk2UTRZV0Q4K0dj?=
 =?utf-8?B?UkVjMDVjQzBmZFJMMXF2QXdIMFNrc0Rka1NVNmJ5dWY1S3hEcjFEcVExYkk4?=
 =?utf-8?B?R29PRjFKVHMvWDRPMUNKamZUZTlxcnpHbzhuazkzempNNlVCSkdtTVdkWlVi?=
 =?utf-8?B?N3BiTXhWR0NuMnlFa3dPNGFEcHduUXovSEZRUlZ3V3FPK3IvWnFLMjVIWDFZ?=
 =?utf-8?B?UWFGZzFZVkJkVWROdmR2aVNLQWtoc0gzbmlNNTdEd255cGU0MHVMSk9ZbWE2?=
 =?utf-8?B?NzZyWGlub1hjV2ZtUStEbWdWSG9yOEhJSDRRK1B3VXZRdmFDQjMvMHo1T1Q5?=
 =?utf-8?B?SXBJaXhrQ1huRUNUNFpSQ25ESWZJMjUvZElicE5TVCtVWkVaeE9FMlZqMU1o?=
 =?utf-8?B?TW9rVGF6dkthbk54dnd1QjYrVWNSRWZzWFEwM1JmcGprTm9tcithVFprNXVk?=
 =?utf-8?B?MEJnTDhSckI0ZGpudkdWcHY4QlNyTy9CczcyK1R5UDk4cTUxOXpzZnpQNllp?=
 =?utf-8?Q?MgKLcVoVwFpivSNGarw95pukp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43df62f-42ff-4de5-d27d-08dc679d972b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2024 16:09:32.4931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7lV4MyOEqnkoUQzknyQL2HRd2Nbhai60nFrhMKIi25L/aqo+TA9Efh91R7wmh6P/aNO9pKv/rEW0503tyAH4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635
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

Thanks for the fix!

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

On 4/28/24 8:42 AM, Dan Carpenter wrote:
> Smatch complains because some lines are indented more than they should
> be.  I went a bit crazy re-indenting this.  ;)
> 
> The comments were not useful except as a marker of things which are left
> to implement so I deleted most of them except for the TODO.
> 
> I introduced a "data" pointer so that I could replace
> "scl_data->dscl_prog_data." with just "data->" and shorten the lines a
> bit.  It's more readable without the line breaks.
> 
> I also tried to align it so you can see what is changing on each line.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   | 93 ++++++-------------
>   1 file changed, 30 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
> index c20376083441..696ccf96b847 100644
> --- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
> +++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
> @@ -779,75 +779,42 @@ static void dpp401_dscl_program_isharp(struct dpp *dpp_base,
>   		const struct scaler_data *scl_data)
>   {
>   	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
> +	const struct dscl_prog_data *data;
>   
>   	if (memcmp(&dpp->scl_data, scl_data, sizeof(*scl_data)) == 0)
>   		return;
>   
>   	PERF_TRACE();
>   	dpp->scl_data = *scl_data;
> -	// ISHARP_EN
> -	REG_SET(ISHARP_MODE, 0,
> -		ISHARP_EN, scl_data->dscl_prog_data.isharp_en);
> -		// ISHARP_NOISEDET_EN
> -		REG_SET(ISHARP_MODE, 0,
> -				ISHARP_NOISEDET_EN, scl_data->dscl_prog_data.isharp_noise_det.enable);
> -		// ISHARP_NOISEDET_MODE
> -		REG_SET(ISHARP_MODE, 0,
> -				ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
> -		// ISHARP_NOISEDET_UTHRE
> -		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
> -				ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
> -		// ISHARP_NOISEDET_DTHRE
> -		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
> -				ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
> -		REG_SET(ISHARP_MODE, 0,
> -				ISHARP_NOISEDET_MODE, scl_data->dscl_prog_data.isharp_noise_det.mode);
> -		// ISHARP_NOISEDET_UTHRE
> -		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
> -				ISHARP_NOISEDET_UTHRE, scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
> -		// ISHARP_NOISEDET_DTHRE
> -		REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
> -				ISHARP_NOISEDET_DTHRE, scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
> -		// ISHARP_NOISEDET_PWL_START_IN
> -		REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
> -				ISHARP_NOISEDET_PWL_START_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_start_in);
> -		// ISHARP_NOISEDET_PWL_END_IN
> -		REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
> -				ISHARP_NOISEDET_PWL_END_IN, scl_data->dscl_prog_data.isharp_noise_det.pwl_end_in);
> -		// ISHARP_NOISEDET_PWL_SLOPE
> -		REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
> -				ISHARP_NOISEDET_PWL_SLOPE, scl_data->dscl_prog_data.isharp_noise_det.pwl_slope);
> -		// ISHARP_LBA_MODE
> -		REG_SET(ISHARP_MODE, 0,
> -				ISHARP_LBA_MODE, scl_data->dscl_prog_data.isharp_lba.mode);
> -		// TODO: ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG
> -		// ISHARP_FMT_MODE
> -		REG_SET(ISHARP_MODE, 0,
> -				ISHARP_FMT_MODE, scl_data->dscl_prog_data.isharp_fmt.mode);
> -		// ISHARP_FMT_NORM
> -		REG_SET(ISHARP_MODE, 0,
> -				ISHARP_FMT_NORM, scl_data->dscl_prog_data.isharp_fmt.norm);
> -		// ISHARP_DELTA_LUT
> -		dpp401_dscl_set_isharp_filter(dpp, scl_data->dscl_prog_data.isharp_delta);
> -		// ISHARP_NLDELTA_SCLIP_EN_P
> -		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
> -				ISHARP_NLDELTA_SCLIP_EN_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_p);
> -		// ISHARP_NLDELTA_SCLIP_PIVOT_P
> -		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
> -				ISHARP_NLDELTA_SCLIP_PIVOT_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_p);
> -		// ISHARP_NLDELTA_SCLIP_SLOPE_P
> -		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
> -				ISHARP_NLDELTA_SCLIP_SLOPE_P, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_p);
> -		// ISHARP_NLDELTA_SCLIP_EN_N
> -		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
> -				ISHARP_NLDELTA_SCLIP_EN_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_n);
> -		// ISHARP_NLDELTA_SCLIP_PIVOT_N
> -		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
> -				ISHARP_NLDELTA_SCLIP_PIVOT_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_n);
> -		// ISHARP_NLDELTA_SCLIP_SLOPE_N
> -		REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
> -				ISHARP_NLDELTA_SCLIP_SLOPE_N, scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_n);
> -		PERF_TRACE();
> +	data = &scl_data->dscl_prog_data;
> +
> +	REG_SET(ISHARP_MODE, 0,	ISHARP_EN, data->isharp_en);
> +
> +	REG_SET(ISHARP_MODE, 0,	              ISHARP_NOISEDET_EN,    data->isharp_noise_det.enable);
> +	REG_SET(ISHARP_MODE, 0,               ISHARP_NOISEDET_MODE,  data->isharp_noise_det.mode);
> +	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_UTHRE, data->isharp_noise_det.uthreshold);
> +	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_DTHRE, data->isharp_noise_det.dthreshold);
> +	REG_SET(ISHARP_MODE, 0,               ISHARP_NOISEDET_MODE,  data->isharp_noise_det.mode);
> +	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_UTHRE, data->isharp_noise_det.uthreshold);
> +	REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_DTHRE, data->isharp_noise_det.dthreshold);
> +	REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_START_IN, data->isharp_noise_det.pwl_start_in);
> +	REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_END_IN, data->isharp_noise_det.pwl_end_in);
> +	REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_SLOPE, data->isharp_noise_det.pwl_slope);
> +
> +	REG_SET(ISHARP_MODE, 0, ISHARP_LBA_MODE, data->isharp_lba.mode);
> +	// TODO: ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG
> +	REG_SET(ISHARP_MODE, 0, ISHARP_FMT_MODE, data->isharp_fmt.mode);
> +	REG_SET(ISHARP_MODE, 0, ISHARP_FMT_NORM, data->isharp_fmt.norm);
> +
> +	dpp401_dscl_set_isharp_filter(dpp, data->isharp_delta);
> +
> +	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_EN_P,    data->isharp_nldelta_sclip.enable_p);
> +	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_PIVOT_P, data->isharp_nldelta_sclip.pivot_p);
> +	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_SLOPE_P, data->isharp_nldelta_sclip.slope_p);
> +	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_EN_N,    data->isharp_nldelta_sclip.enable_n);
> +	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_PIVOT_N, data->isharp_nldelta_sclip.pivot_n);
> +	REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, ISHARP_NLDELTA_SCLIP_SLOPE_N, data->isharp_nldelta_sclip.slope_n);
> +	PERF_TRACE();
>   } // dpp401_dscl_program_isharp
>   /**
>    * dpp401_dscl_set_scaler_manual_scale - Manually program scaler and line buffer

-- 
--

Thanks & Regards,
Aurabindo Pillai
