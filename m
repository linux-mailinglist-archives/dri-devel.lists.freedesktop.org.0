Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8549F577
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B361124D8;
	Fri, 28 Jan 2022 08:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5DA1124D5;
 Fri, 28 Jan 2022 08:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+i/8jGoCKS6qCWK9EDnCc2Y02kS6jw6FHjEpKVGiw/rxuMEwbvRzd2/ft0bFiFJlA3cQfkReNmzyfUAk5tSGjiJ/NDQLnuQk4qkkE50Jb3/fkCvTCxryZJeTHBxuYZkGFSZ4I3wYbXoXu/cr9LY9Q27ydvApsx6uEwhXo7y4oDSg6INkPXnaYPgjhDuVO7VrZghZnQ0XiNUeDkcZ2i5mwU226uTnheFcV+n0eb1CsLZbRmyRTvnQhSLjxpF0CUHCmt/IA3+rVcbzCSWEm/U6GBPzwL6Kj0blewYuP6UeMQYzFWBFRmUjB1o0sQrKaRj8f0HbWcag7QgU/mOWC7PCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAOUCac6eZc9ffKQxNN+bMcpjW+VI7MUVnxA0vbjkBk=;
 b=QeOf4+1aOsQtwjOWV4v7jBxtVUpxx65uupXGOlgOAvmu3zfNguF68u6yaWIkZhRYZwomp5XwVsGK0duiyq8NSDY6gH99OUUnDerEr2WpGYQXXZPuCXxsxTfIX3+NflDTT3wvN/KijNaO4tmrNejucrocg97iLWCtAHgdPKb8XLAPWnHwpq3xlTQRcr2FIgLjaUf7a1Y2/sqzPswOCUbq/2C58P0SpZNeGTcmiq8QrPoj+h2HGOBQBk66YvKhzVZ1nThl8myoJrkbIfWvfKUWiAhIMRStG/UXXGjebjizwyqX/Nu2EXT1gaDe0u5PuYrYyfZCWnnPTOg+DnvTu+WKOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAOUCac6eZc9ffKQxNN+bMcpjW+VI7MUVnxA0vbjkBk=;
 b=Jl1JgLKZjJUbuwjViriCvMtI13npp3UjASdFY9m403kbBY6rtWKOj++Ie9TwWJNXiRou1JZajenDMTxOd7i0qLBABCKcfwe6JXRwlJ6iOuKh5UZhpVOWJ1h/MWHKt8n1/tpAeOXufO48ex/X+ljb/YS1tl7yuM2bhdJck7HTMI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB2912.namprd12.prod.outlook.com (2603:10b6:208:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 08:41:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Fri, 28 Jan 2022
 08:41:21 +0000
Message-ID: <a45a8cef-f5e7-604c-64f1-e893ec9ba8af@amd.com>
Date: Fri, 28 Jan 2022 09:41:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/14] Rename dma-buf-map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::25) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8dece6d-c52c-4047-23d9-08d9e239f5a2
X-MS-TrafficTypeDiagnostic: MN2PR12MB2912:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB29122EB21ED6D5C67EE0601C83229@MN2PR12MB2912.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmUskkLXCAdBOsJJBcs62jOnTqm0lasveGV03752N+cXpDgXmLnVkA+y2SgVvilciqOovQq94Bmf1gNcRsq4CZwgM4Cifjt4x/rxcUFp8YHMWuvX+tM6qRU1c5KFF4zE0KbtbnFxCWfb5mKZNh5/oIN3uraBLw3JWI4JbgnAFC9XQq8aIW1qJ/memIDZW47AJ6iOoFZx3Nl/Zt0jVS+tBc2E7cJx1jp9os3p2eOmQ9c/RHL4WeXwH7Nyw9lgBvG4tIp8F1hcFuF/B0gRyVK8elQSg8bmJRQshXizyGDpA+HrcvXRBqqjR7cohaMVcJQw8QLgyPo8Ewu5nX2fG6ppLadLdMSumNh16vT1zMbaq75GSJ1/WV1c0t0FtvqIyofE6+f/UM7hHLIoJ/I0doAzzfpmHkowXt5DJbky82WYXpUXsmWJ0+1VWnHCJHvdtfwZdOaG1AG9grI70OVyVr6iob5G3TcfSVQ/ZwKgmuWCpOFsRiDfbJMHuxBwe02AZqQirBbvxguWKUaGlvwlpS2Ht98zztjQeV5YlmKeEBtNfx7K1IMBFVlhOaA79nzYZz0wNE2bg0zNN0HnObPiZMD9UshyGWh7uXFw22tAn/PcrVbFwC4see/jKoH11gs/Txi0cwBhYtzhI5pw4/bdSyJZOn9j56NlrVtaemV3tA/3zT/w+rCcU36xShct4EQTKdjFAx/Hy44ei/hM996X9olKtzKi1O6w2LjITyjVjrydGANFfwSrOx2qO1TaK/50goaQ3sij/RImZdkEGFUnEkp2qSGwN0xKhC3maNR9t/5F+Z4FzMGbPDtSL3FEwcEw4/u45AwkP1LMW6P3hNyPfJgW2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(31696002)(8936002)(6512007)(8676002)(966005)(6486002)(66946007)(66476007)(66556008)(4326008)(508600001)(6666004)(316002)(6506007)(83380400001)(31686004)(38100700002)(2616005)(2906002)(7416002)(5660300002)(186003)(36756003)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak9mbXRMajhHdk5BV0hIYUlBZk5JZmg5OUpqNkIzQzB2NHNXS0F6eUlMSXVh?=
 =?utf-8?B?NzRUUWxXTnVYZVBwRXZHM3NqSWsyU2hybzVnNEFiNzJPam41UWJBT1h4SXRz?=
 =?utf-8?B?TEFMMFpKY2FjbDJZRVlkQm5nTW9TdTlPKzRzQmZJSDFYdUVvQW56em4wWGF2?=
 =?utf-8?B?RDR4akdUaGlGRzF6dzRsQkVaL3RBcjJrTk9ONE5OS1kxRzl2aFdiOEwrdWxq?=
 =?utf-8?B?aEQzNi9ybzJiU3FPcWczMWJHaTdqcUJDa1pVb1ZXVmxFRUYrL01SdmlVUVNC?=
 =?utf-8?B?dmtWVzRMaXVaNC9ndHczaS9YUFRNbmRtdTFPK1RmODNHdFFvL3IwbStucFlh?=
 =?utf-8?B?THkvVDVoalpQU3ptdlN2NDdjWERhSDd5L0wreHVJOTJwR1hRZUVKbHJOOEtD?=
 =?utf-8?B?THU4dHdGTnh6K2hxTFhSR2lZZCtJL3Zmc3Z6ZEMyakpVWVNyOVV0T0FJc2pT?=
 =?utf-8?B?OE5BYmpLanREV2xlQm1NYWVoR2xHL25ZeldmekQ5OGhMMURSUEpnLzk2SlhE?=
 =?utf-8?B?MUZ5OG9teVhVMjFhejJ6Y2F0WExWSFdKTFRENWVPU3ZVUWQ3YXpYMmR0UTdH?=
 =?utf-8?B?bk5DTGJVREpyTEpQZVdYazEzRzdTMHQxQmxRWDB1Y2lNcWlnaVZSS1piTmRK?=
 =?utf-8?B?Y2RjNVRtOFFBb3JIZHNZc0ExVGpCbmVycE1Sd0h5cE4zcUtyaEk2SmdNdlky?=
 =?utf-8?B?ZStLQkI4YnIvaTNDQUs5THJyZEFzTkIrRjBoMEo2SDhseXg0RmpJK090Vk44?=
 =?utf-8?B?YWIrVjlUNVZ6VHd5MDRJek0vbFFSR3BUSFRIV0pDT0NKbUxCdEpYazgzMkc1?=
 =?utf-8?B?WmgvVFVFQ0ZPNi92WThsU0R6a0IwTENHMVVhMERSWkFobHFNVzNWRmtHYldR?=
 =?utf-8?B?ZVlHUnJhNndYZXFFSzdGOVJjQzdkM2k5d0pWYWRjMGpYUGlTejVVQVNUem9a?=
 =?utf-8?B?VXhCTmFRVGI4VmVqbHlGMjc5VnFBYW0reEJHMEtPZ2FBemdHMWI0VSs2bTNp?=
 =?utf-8?B?cWNCY2ZaSlVib0dpUjZOSGZ0T1BHNDVTZ3I1SVNxemxPdHAwNTZOMWlJOGJv?=
 =?utf-8?B?UHl0bkVJdzNSejJMT1c5a2h5a3BzZitUSm5HVE9uZG9mSnBpdno2REtyazdW?=
 =?utf-8?B?QkVCZEthd3pJTytRMGZuUEFuTWUxenlMbnNlNEprRzE2Z0VtTy8xNDBwT0xs?=
 =?utf-8?B?YlpkU2duNGU5ZjU4YnViaWdYd0poS2hKZTkzTU1WQnJsT2xyTWN5RTNVZTRV?=
 =?utf-8?B?SXBFcHhERCtFbElKQk00TjA3azVIdlZNVzF2WjIvc2IvT1RPNXJqSWsyWkF1?=
 =?utf-8?B?OXM2TWpYSzBsRlZQNnE0Y1RjOXhheElpSFpEUjU1bnlPSm5LZ3BXSkVUdUFP?=
 =?utf-8?B?VFZxOHdZM1FSTDRpZExuWTVQYkVpbWtZWnRJekVoZE0vdW9pWDFtZzhSNkh6?=
 =?utf-8?B?dU9KQzZheHBmWnhtaFM0WHYrVzJVSDFwOHhNOURWdFhTN1laNmcxWC91RkVz?=
 =?utf-8?B?WjAwMkIxN2w3cnpTOTN0R3E2aUVVZEFzU0gxYVF2RnlhZVVzMC9ZRUF5N3Z6?=
 =?utf-8?B?MzJYVlpDVU1yQ1NaL3c5blNPUHE4SlFGRHFKdU16aGxUdFhKZG5IN3dNZDFI?=
 =?utf-8?B?M0ZXci9IS2tWL2NHU1U1U0paRjJSalNENVNuY09NMStCZzFmMEppLzE4TVRY?=
 =?utf-8?B?R1ZJNkxydDZ6SHdBcVJwYkhQRnNaY2FEeEJtQkg2NmZiNzJMT1pDb0FWL3c4?=
 =?utf-8?B?VU1FakhkVUJhRlZwZjh1L0owUDZBQ2IrTDkrWUtMR3ZwU0hKalRuazAwWnp6?=
 =?utf-8?B?Y0s1REJBQjlNcWd3a1lyVy9YbGN2NUErMVBFY3cyVC9FNXRId3dCL2EyTDNT?=
 =?utf-8?B?cEwrdURHYUo4MkJqUVIwREYyNTgyS3lOK0Nvc2k2L2dYcXo5WjRXaS9INHgy?=
 =?utf-8?B?WWJLYlJhNVIrTWJ3ajFFZ3RXbW42ZTZEYmYzU1I4cDRtelErdGltK3VmK3cz?=
 =?utf-8?B?WGxaOEVmSEQvZUdsVG9wMnRtRHVwK2FGR2NsUmd0QVJTSU9vVXdkNFFiUERM?=
 =?utf-8?B?WUJ6OTFaR2VUQTFsZGRCWWpGZlArSmlZVFFCemlnVGlvWTdqekh5NzVhMDJv?=
 =?utf-8?B?OXl5MTRweTF0a2w2NE5yN0lvRFZHK3M0eDUyQllrWjNrRXRnZllLQjc5NmNr?=
 =?utf-8?Q?5GKUXce7gAgm0O0KcqI0Jr0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8dece6d-c52c-4047-23d9-08d9e239f5a2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 08:41:21.2942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6vX5TAL2PwKvQ+UPEPjg8x7tNX57P2XrZWtsEO8t+NwMrR2hOcIEAtWPBjrMyPy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2912
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de, daniel.vetter@ffwll.ch,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rule #1 is to never ever break the build.

Because of this all those patches needs to be squashed into a single one 
as far as I can see.

Regards,
Christian.

Am 28.01.22 um 09:36 schrieb Lucas De Marchi:
> Motivation for this started in
> https://lore.kernel.org/lkml/20220126203702.1784589-1-lucas.demarchi@intel.com/
> when trying to extend the dma-buf-map API to cover new use cases: help a
> single driver with allocations and sharing code paths for IO and system
> memory. I'm leaving the API additions aside and first renaming the
> interface as requested.
>
> There are already some users in tree outside the context of dma-buf
> importer/exporter. So before extending the API, let's dissociate it from
> dma-buf.
>
> The iosys-map.h is introduced in the first patch in a way that allows
> the conversion of each driver to happen separately. After all the
> conversions are done we can remove the old one, which is the last patch.
> Another possible way is to squash everything and merge together,
> but I believe this would make much harder for review.
>
> The conversion was done with the following semantic patch:
>
> 	@r1@
> 	@@
> 	- struct dma_buf_map
> 	+ struct iosys_map
>
> 	@r2@
> 	@@
> 	(
> 	- DMA_BUF_MAP_INIT_VADDR
> 	+ IOSYS_MAP_INIT_VADDR
> 	|
> 	- dma_buf_map_set_vaddr
> 	+ iosys_map_set_vaddr
> 	|
> 	- dma_buf_map_set_vaddr_iomem
> 	+ iosys_map_set_vaddr_iomem
> 	|
> 	- dma_buf_map_is_equal
> 	+ iosys_map_is_equal
> 	|
> 	- dma_buf_map_is_null
> 	+ iosys_map_is_null
> 	|
> 	- dma_buf_map_is_set
> 	+ iosys_map_is_set
> 	|
> 	- dma_buf_map_clear
> 	+ iosys_map_clear
> 	|
> 	- dma_buf_map_memcpy_to
> 	+ iosys_map_memcpy_to
> 	|
> 	- dma_buf_map_incr
> 	+ iosys_map_incr
> 	)
>
> 	@@
> 	@@
> 	- #include <linux/dma-buf-map.h>
> 	+ #include <linux/iosys-map.h>
>
> and then some files had their includes adjusted so we can build
> everything on each commit in this series. Also some comments were update
> to remove mentions to dma-buf-map. Simply doing a sed to rename didn't
> work as dma-buf has some APIs using the dma_buf_map prefix.
>
> Once finalized, I think most of this, if not all, could go through the
> drm-misc-next branch. I split i915, msm, nouveau, and radeon in their
> own patches in case it's preferred to take those through their own
> trees.
>
> Lucas De Marchi
>
> Lucas De Marchi (14):
>    iosys-map: Introduce renamed dma-buf-map
>    misc: fastrpc: Replace dma-buf-map with iosys-map
>    dma-buf: Replace dma-buf-map with iosys-map
>    media: Replace dma-buf-map with iosys-map
>    drm/ttm: Replace dma-buf-map with iosys-map
>    drm: Replace dma-buf-map with iosys-map in drivers
>    drm/i915: Replace dma-buf-map with iosys-map
>    drm/msm: Replace dma-buf-map with iosys-map
>    drm/nouveau: Replace dma-buf-map with iosys-map
>    drm/tegra: Replace dma-buf-map with iosys-map
>    drm/radeon: Replace dma-buf-map with iosys-map
>    drm: Replace dma-buf-map with iosys-map in common code
>    Documentation: Refer to iosys-map instead of dma-buf-map
>    dma-buf-map: Remove API in favor of iosys-map
>
>   Documentation/driver-api/dma-buf.rst          |   4 +-
>   Documentation/gpu/todo.rst                    |  20 +-
>   MAINTAINERS                                   |   2 +-
>   drivers/dma-buf/dma-buf.c                     |  22 +-
>   drivers/dma-buf/heaps/cma_heap.c              |  10 +-
>   drivers/dma-buf/heaps/system_heap.c           |  10 +-
>   drivers/gpu/drm/ast/ast_drv.h                 |   2 +-
>   drivers/gpu/drm/ast/ast_mode.c                |   8 +-
>   drivers/gpu/drm/drm_cache.c                   |  18 +-
>   drivers/gpu/drm/drm_client.c                  |   9 +-
>   drivers/gpu/drm/drm_fb_helper.c               |  12 +-
>   drivers/gpu/drm/drm_gem.c                     |  12 +-
>   drivers/gpu/drm/drm_gem_cma_helper.c          |   9 +-
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  16 +-
>   drivers/gpu/drm/drm_gem_shmem_helper.c        |  15 +-
>   drivers/gpu/drm/drm_gem_ttm_helper.c          |   4 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c         |  25 +-
>   drivers/gpu/drm/drm_internal.h                |   6 +-
>   drivers/gpu/drm/drm_mipi_dbi.c                |   8 +-
>   drivers/gpu/drm/drm_prime.c                   |   4 +-
>   drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   8 +-
>   drivers/gpu/drm/gud/gud_pipe.c                |   4 +-
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   5 +-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   8 +-
>   .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
>   .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |   6 +-
>   drivers/gpu/drm/lima/lima_gem.c               |   3 +-
>   drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   7 +-
>   drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   5 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
>   drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
>   drivers/gpu/drm/msm/msm_gem_prime.c           |   6 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c         |   2 +
>   drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  13 +-
>   drivers/gpu/drm/qxl/qxl_display.c             |   8 +-
>   drivers/gpu/drm/qxl/qxl_draw.c                |   6 +-
>   drivers/gpu/drm/qxl/qxl_drv.h                 |  10 +-
>   drivers/gpu/drm/qxl/qxl_object.c              |   8 +-
>   drivers/gpu/drm/qxl/qxl_object.h              |   4 +-
>   drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>   drivers/gpu/drm/radeon/radeon_gem.c           |   1 +
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   9 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   5 +-
>   drivers/gpu/drm/tegra/gem.c                   |  10 +-
>   drivers/gpu/drm/tiny/cirrus.c                 |   8 +-
>   drivers/gpu/drm/tiny/gm12u320.c               |   7 +-
>   drivers/gpu/drm/ttm/ttm_bo_util.c             |  16 +-
>   drivers/gpu/drm/ttm/ttm_resource.c            |  26 +-
>   drivers/gpu/drm/ttm/ttm_tt.c                  |   6 +-
>   drivers/gpu/drm/udl/udl_modeset.c             |   3 +-
>   drivers/gpu/drm/vboxvideo/vbox_mode.c         |   4 +-
>   drivers/gpu/drm/virtio/virtgpu_prime.c        |   1 +
>   drivers/gpu/drm/vkms/vkms_composer.c          |   4 +-
>   drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>   drivers/gpu/drm/vkms/vkms_plane.c             |   2 +-
>   drivers/gpu/drm/vkms/vkms_writeback.c         |   2 +-
>   drivers/gpu/drm/xen/xen_drm_front_gem.c       |   7 +-
>   drivers/gpu/drm/xen/xen_drm_front_gem.h       |   6 +-
>   .../common/videobuf2/videobuf2-dma-contig.c   |   8 +-
>   .../media/common/videobuf2/videobuf2-dma-sg.c |   9 +-
>   .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
>   drivers/misc/fastrpc.c                        |   4 +-
>   include/drm/drm_cache.h                       |   6 +-
>   include/drm/drm_client.h                      |   7 +-
>   include/drm/drm_gem.h                         |   6 +-
>   include/drm/drm_gem_atomic_helper.h           |   6 +-
>   include/drm/drm_gem_cma_helper.h              |   6 +-
>   include/drm/drm_gem_framebuffer_helper.h      |   8 +-
>   include/drm/drm_gem_shmem_helper.h            |  12 +-
>   include/drm/drm_gem_ttm_helper.h              |   6 +-
>   include/drm/drm_gem_vram_helper.h             |   9 +-
>   include/drm/drm_prime.h                       |   6 +-
>   include/drm/ttm/ttm_bo_api.h                  |  10 +-
>   include/drm/ttm/ttm_kmap_iter.h               |  10 +-
>   include/drm/ttm/ttm_resource.h                |   6 +-
>   include/linux/dma-buf-map.h                   | 266 ------------------
>   include/linux/dma-buf.h                       |  12 +-
>   include/linux/iosys-map.h                     | 257 +++++++++++++++++
>   80 files changed, 579 insertions(+), 552 deletions(-)
>   delete mode 100644 include/linux/dma-buf-map.h
>   create mode 100644 include/linux/iosys-map.h
>

