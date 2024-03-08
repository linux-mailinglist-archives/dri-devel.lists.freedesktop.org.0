Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF128764A5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 14:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EE010F304;
	Fri,  8 Mar 2024 13:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4xv+iBAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6E610F304;
 Fri,  8 Mar 2024 13:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gz8N8hPJ/FOFYcueG7nD3VF4hDH8B0Uj07EI7eRxYyBtUicj+dSSA+mgSnBGT96vBhlUj3P86zFh84OVZIu76pcB29KDPjbZMobRlxA5EVXUnikahi0Lih07qI5IU33nCJdvhQXHJ1/mSaSDbtkN0nKERt/KHecHN05INsVyJjD/k3TggPwLu6sf/pmZLuJkiGP1yVF7Awa/w9/sTotiu+jrz7WC6EhZVRcK+FkzbYcRGlyK3NnZZib1lZO9iMcO7/ol+wtd+9jQN2oJVExsBDYqGrtNc9IIeLjpfBlK9aJpHTN2CMjg4g0bksnUspn4VWTlF/OjP/JiYOBcnd/hvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUWMA3+S4mFtd9lykaegLduwjLis2mkgqHDD+jDLOCU=;
 b=TbEgZG9W0ATu9YWVBAkV81SN0LMKI8qbjWwDaFYxa34jD9tpYT9/9qWLQzNGst0/mw2KGaZVuj5BUQEgjo9YS2s2pG/nGN5QKdTpf/PcYHhviQczpVGJhMhgMwZ0sSgB2uZjcp/FPONiWj8GpluguuCfDHxaJj482b57ipizEBrhIB5v3sIValQgtzD/pwLHyu2tBL2RxCn9lFF60CZSO1utqi9Rw5iyy0mEPuVnf6pzAL7LtT8P1syZtWDlyyeTj6xP02cEK7fCVW9RYradI1dklOxS0+jlKrHxH6Zh/WbdrkUVtMFgWxhHI3D8rwetaHiVMSMtaRI11FNQZPQO2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUWMA3+S4mFtd9lykaegLduwjLis2mkgqHDD+jDLOCU=;
 b=4xv+iBAvEh78zC5GF72q22OvH3OzyzDO2geRT7Tdu+CdUOuVF99WNLOBUDDyyWJmH6KHQPF7sT+wgznTckDcLC242BQv0dZFTzu854LKPmlkuOwadamnTz/aM2NVnJVGsmiOBTY9CDLvhYZHKEZIFdwKAqFAC7RUMGk4ixKLWEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6136.namprd12.prod.outlook.com (2603:10b6:8:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 13:03:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 13:03:14 +0000
Message-ID: <301c8bc9-516c-4aff-9276-7c1d5d6fc8c4@amd.com>
Date: Fri, 8 Mar 2024 14:03:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] drm/ttm: fix ttm_bo.h kernel-doc warnings
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com,
 Huang Rui <ray.huang@amd.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
 <bf51b87689f0c5c5f2343c75e14b984afcb6a58c.1709898638.git.jani.nikula@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <bf51b87689f0c5c5f2343c75e14b984afcb6a58c.1709898638.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 768db073-2a26-430b-1cd1-08dc3f701d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x9e9yo+drflVQd+DyGunyLW2XXOg/j3f8na6D3bzP6tKUDrhQ5Kxb5C803r58+dMvovDGBxgQU/aS+cMAc0TsKsNjD9vcrpw+9k8uJXhOhdE8JWmnL6TnhpzdGNzU6pFW+YbO4wsKaac5Hx00MzSZ2VT6IQHO8GoFvnQR0FA2lxfKrLZAoZD/v0yHDp9t9299kr1YmmqTo/z3OE0oSXKLl6jwjY50hXV3PVs3sO8fLsluTlTd2Y++3i8UAjzUV91vGc02AmNv/0mnJ+0BFwhxjv5S7fB5O1e60pVARSpSZjNrf+x8u/j2up23qEBbsEUIlu0U5mQL7nm0raoLWXSx1zp0CQPx9sh2O+zd2KOt4tgWAojcAn4J5dx8F22mO4lQ9QXVLZx2Zb6CGXYuaCAcPBaSuElkLVEfNa4+VA5m0J5hFsfuyYsj5Zr8sX+4REjRf6ei4jN5XwT0/WCpfsuVGKDx7ePCYZ+H5MkdP6vjaKoNrygf2imvG/vNgjZ83lkyYSD6HhiB5PsljFhyqviCt0ytq6OP1bZggcr61+K/4QBgf6Uw5MmL/IiBnGm4jiqqZv2XS1/vlVntKSDNt7Bh5BNcuAlvArzug98AL8aZP3fQQJ4IePVOv6oIh00AOfg/wyDbxJVPQ1UsrZcNWoZBS/rUVgfymfInijgut5xYf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFNlSjNyWS9rcHBINlZpUVpPZ0pLdHpXdUJkTTBETWFvNTlkck5mRko1Y2Jq?=
 =?utf-8?B?dkN6ZWtTaTRHek0yU2hrNENkbjdnNU0xNG4zNWs2a0VQRUhrZDMxSkNQY1JH?=
 =?utf-8?B?U3IwanRTYWsrclBzNGJ3T0tpRjVOa0JSVGIyU2NQcE1Tak5oVlNHdDlTSDRI?=
 =?utf-8?B?cVRQdDlHWnFyZmdleWhtaXFJYk92VXZHQWFHWVB5M1pRdGZ6bUpxMUxJSE0x?=
 =?utf-8?B?MlFxYnRLY2luYVFnRkh0U1pkVWxWZVhwYkZHeDNNYXp3b1gwdldYeE5FRUpq?=
 =?utf-8?B?UWg1RnNUWldxTlNwcEVIZzNjOXU3N2xVZzVCQ2JnVDNyMnZTSDRzV0kwczd4?=
 =?utf-8?B?SjZjMmtwWmE4MGxGNzFNMTVmS3N4Qm1HMUVaNFQ5SGFDUlRWbnovWTZjcktk?=
 =?utf-8?B?OTBRTmEzd3ZhaCs4UjhJYld2NGh4aGNNaXFaaU9NdjJsOEhDMktHeHhDZ0hX?=
 =?utf-8?B?clNqdE1NdVlNYTBvMmo4WFdBT2JJRUtmbTBqTFRBeGVnQi9HZW5yMXZ6SzFh?=
 =?utf-8?B?OWtrd0pvN2JZYnpJWFU5WldOUUE3bEhPQXRNUkIvV3NGcUFMOUxRMnVKWnZR?=
 =?utf-8?B?M3ZkZWRKUG5FdlJKVStwSmpDTXRacTdFT1QySjF3SEpBTEZ6UkRDdWdiVG9L?=
 =?utf-8?B?TXhrclJiNnpEb0RlMVlGTjZXRm84b1F4U3VEQ0pDbzZha2hDZ0ZySDVlQWNy?=
 =?utf-8?B?WndWMXJJaXd0ZG9hUG00SEpFRW56QkNxWno1bDlTU1JHb28rSjdWS1hXNk5o?=
 =?utf-8?B?OG9NOTNydFVobzhYajh3aHp3eWgvbmRLOGJ2OTJUWk50Ry9HdndIMDJNaVR0?=
 =?utf-8?B?Y2w5cVRZVzlVWlpncUJFY1VCTlpNZ2VKaVhsekdwa0xKcDhEWGNiUlp2Q2Ur?=
 =?utf-8?B?V3hzQi8rRE5LNy9NZmdZRFZZVlJyenBrQit0SlcrejVZZURtT2Z5bm5Bc0FS?=
 =?utf-8?B?MzB4VnZmUURVNmRFclpxNXMwR1JLTUk5Ry8vQmJNbmhYV0s5cGZKcGI2Vll1?=
 =?utf-8?B?eUEvb0lRaGVtRjc4U09WSElxUGlDSkhwN0xQRmZLcjN0NzI0MHg3YkRkaW1i?=
 =?utf-8?B?OS9oRmRrRGozbExheWFvSkpkUENheUNBY2MycDFCMHFlZ1llU1NrTWNyUGZM?=
 =?utf-8?B?R0x5NExoekdMMEMwMzFJSWhMZStWcitxS2RrNTg2QktZQlBhNkJkanhlYUZ3?=
 =?utf-8?B?cHo3eDRFb3l6eDB2aTVWS3ZmSlM1NWFBTkRwSXVkMy9yVlJyZlB4YndkMGpO?=
 =?utf-8?B?dTVIdk9uV1Rpb3FLdFlNQjZNRFV4THRzcDlHZzBuT0p4N3VIMVk1ZzdKY1J6?=
 =?utf-8?B?ckZTWUF1c2VJRCtBQVZjd08rQjdpMGcvNDhXZzdieFdRNGpzUUhaUjFVWU4y?=
 =?utf-8?B?d3N3ZTdtTVRQOU9qRnYrZHF5SWFoWHhGMXlDcC82WmdKL1Vza1AzSWJaa05z?=
 =?utf-8?B?VGQ4SWErSUpaMWZ0NEMveTZyc1p5ZDZobTgwaGJSQkc0QlNGeHRRTENuN09j?=
 =?utf-8?B?QTF3U0xaaUVLdFJMQW5rUmwxb3FyMyt4aTlxTVp2SjgzcVJxQldYemxkZWdU?=
 =?utf-8?B?WU5rdkY5aUMyeHVRamdkMnhLM2ZOTEd3YzlFa2ZSbzFkMjhNWWZHeGc5L0Jm?=
 =?utf-8?B?eWFEMHVVbjllVUpMbnNhcWFzWjZOM3JLTkVDNVlaRFVKckthN0F1ZjAyaUlR?=
 =?utf-8?B?OFZqTnZFc0huaEdHc1FQZUhxaFVxZ0M0MzB4dnR4S1VNbzRicEpVb1UrN1Er?=
 =?utf-8?B?WnNHd0dGK2tENG4yRHdET3BXdFVnakxlaGpTWmF5MFY3TG5sTi9sQ1d6bVR1?=
 =?utf-8?B?aXdDRFluL0FPSms4anZhbGp5VG5tTzVtUU5LZ2hpQUFUTHhxQXRxUGhuTFln?=
 =?utf-8?B?MGFmcEU3TWNsU00yd09UdVpueUJLS2JOWDJhNTlsNzQzY0xwV0xwUU1LSEFC?=
 =?utf-8?B?bkV2cmxiVkxWQUJ2NGNmMzBxbm11dngzY3UrQ2Uwd2o5WUxoWmIxNHZFTEx6?=
 =?utf-8?B?dzhmcHlsd1hWLzlRaVBuNnA0YWJJN3NneEFEUDkxWlZ0QUFSR3hjOTlrZmxW?=
 =?utf-8?B?ckNlaUl2b1ZIRXlkMEpmRWdGaHhHUkRsK0pKOSsrQitpTU96TFZLWUh3b0R5?=
 =?utf-8?Q?xIikLgiStXAjeuDaApEzThfpC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768db073-2a26-430b-1cd1-08dc3f701d70
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 13:03:14.4862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zn4LuOyXnJLNxxOKoKihLkIfPGjZ9nzKSx9dw6uG+SbgFLAXtHJzxq77l8aZJbGP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6136
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

Am 08.03.24 um 12:55 schrieb Jani Nikula:
> Some renames, some formatting fixes, add some missing documentation.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   include/drm/ttm/ttm_bo.h | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 0223a41a64b2..59151ecb2db3 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -83,6 +83,9 @@ enum ttm_bo_type {
>    * @resource: structure describing current placement.
>    * @ttm: TTM structure holding system pages.
>    * @deleted: True if the object is only a zombie and already deleted.
> + * @bulk_move: The bulk move object.
> + * @priority: Priority for LRU, BOs with lower priority are evicted first.
> + * @pin_count: Pin count.
>    *
>    * Base class for TTM buffer object, that deals with data placement and CPU
>    * mappings. GPU mappings are really up to the driver, but for simpler GPUs
> @@ -128,26 +131,28 @@ struct ttm_buffer_object {
>   	struct work_struct delayed_delete;
>   
>   	/**
> -	 * Special members that are protected by the reserve lock
> -	 * and the bo::lock when written to. Can be read with
> -	 * either of these locks held.
> +	 * @sg: Special members that are protected by the reserve lock and the
> +	 * bo::lock when written to. Can be read with either of these locks
> +	 * held.

Actually that is completely outdated since the bo::lock was removed 
years ago.

I would just write that as "@sg: external source of pages and DMA 
addresses, protected by the reservation lock." (or something like this).

With that fixed feel free to add Reviewed-by: Christian König 
<christian.koenig@amd.com> to this patch and the other TTM cleanup 
patches in this series.

Regards,
Christian.

>   	 */
>   	struct sg_table *sg;
>   };
>   
> +#define TTM_BO_MAP_IOMEM_MASK 0x80
> +
>   /**
>    * struct ttm_bo_kmap_obj
>    *
>    * @virtual: The current kernel virtual address.
>    * @page: The page when kmap'ing a single page.
>    * @bo_kmap_type: Type of bo_kmap.
> + * @bo: The TTM BO.
>    *
>    * Object describing a kernel mapping. Since a TTM bo may be located
>    * in various memory types with various caching policies, the
>    * mapping can either be an ioremap, a vmap, a kmap or part of a
>    * premapped region.
>    */
> -#define TTM_BO_MAP_IOMEM_MASK 0x80
>   struct ttm_bo_kmap_obj {
>   	void *virtual;
>   	struct page *page;
> @@ -171,6 +176,7 @@ struct ttm_bo_kmap_obj {
>    * @force_alloc: Don't check the memory account during suspend or CPU page
>    * faults. Should only be used by TTM internally.
>    * @resv: Reservation object to allow reserved evictions with.
> + * @bytes_moved: Statistics on how many bytes have been moved.
>    *
>    * Context for TTM operations like changing buffer placement or general memory
>    * allocation.
> @@ -264,7 +270,7 @@ static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
>    * ttm_bo_reserve_slowpath:
>    * @bo: A pointer to a struct ttm_buffer_object.
>    * @interruptible: Sleep interruptible if waiting.
> - * @sequence: Set (@bo)->sequence to this value after lock
> + * @ticket: Ticket used to acquire the ww_mutex.
>    *
>    * This is called after ttm_bo_reserve returns -EAGAIN and we backed off
>    * from all our other reservations. Because there are no other reservations
> @@ -303,7 +309,7 @@ static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
>   }
>   
>   /**
> - * ttm_bo_move_null = assign memory for a buffer object.
> + * ttm_bo_move_null - assign memory for a buffer object.
>    * @bo: The bo to assign the memory to
>    * @new_mem: The memory to be assigned.
>    *

