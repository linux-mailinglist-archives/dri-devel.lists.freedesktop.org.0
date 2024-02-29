Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3786C7B9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00810E44B;
	Thu, 29 Feb 2024 11:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v6peOof2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B33010E460
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hT9lD659eaSYtnQuk0J0xCyHsCpWY3DPmrfvtzKiYXoyibJ6Z9D/4AXRbO+3kv4tOgPIpokWwAxxY207p6A6uh3/RSVQYeREZANArTpyprvcs6FcKzzfgjE33leTVUwASz03NSh9a4aa5AUkkM9nKyX80/LxWsoB7kwMtf3mOEiv6J5UN7/tYB6X1kzwwAOIDFkg+ka3aoAtocJVnN8gnUJrDcxReypEMjuRVeZbGxtkE9PPJ4NIkhNTwhrVw45EWoy19mmJgAtLIIRrjlEgapgmGpkYifqNFpXteYRxLl3gnbnOeHtgwMq9tAhzxocGVtEkZTrVW4GwwHIjtKSblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgV+GaZvOJ6r16Z8JtPgJCaeC5ZKm/HhyvzZb2g79lg=;
 b=KJhQxN4pyfIfLU5kmkgXXWtfTMpZIu3qLrOGM+NKiqm3IxkVseUlh8+5Z9qrCLwNHcqllrbdqPDAJKG9dGY3ytj6yjUZuF0BFWfL00mgd5LiNJSi6gTRJqj9r0WoNyKyUunaqTEAiYZYSA/A21Q0DDivAh7nogSf+lb7pFuCPCHLH+Jo+/+9mxD4qGhXtkrdwKZsvS20n948Y12xkcSyjEDjvf2uThmi+32zbGT8bmVJuXi4CEyPTaN4DuV0B+GvNC7gxZVkFgsruhR6YNEbBwQBxdj4AH7Tkkp8Nsq5zJo7jxzcCgmP1xs6qJbKy0oLp/3KzA9bITaaGuTC6BVhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgV+GaZvOJ6r16Z8JtPgJCaeC5ZKm/HhyvzZb2g79lg=;
 b=v6peOof2VBS26Qp/Qw/rJ81RqafxrKed7EQarV3bw/OorKfjRCIT1/JAoIEh7E48Y7UYLKKuQxbcPmCn8g0o6kPnt6Vf6wD3iUve3iRxQhdRweOSPKu7IbeqsmbdOZdG/0lf1cmYD6k94H/9xW9VjgKREOq1njXnPtPtvV3UrSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM4PR12MB7598.namprd12.prod.outlook.com (2603:10b6:8:10a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 11:09:30 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b%5]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 11:09:29 +0000
Content-Type: multipart/alternative;
 boundary="------------cKBnt9SwLULy0jXbZkY98RMg"
Message-ID: <a217c0f2-b387-45ef-9c03-d6363d57783a@amd.com>
Date: Thu, 29 Feb 2024 16:39:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: stop using PAGE_SIZE
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20240229105112.250077-3-matthew.auld@intel.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240229105112.250077-3-matthew.auld@intel.com>
X-ClientProxiedBy: PN3PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::23) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|DM4PR12MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: da948d43-1d55-46dc-4ea4-08dc3916e64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VuOi6wBn6aZ9uIDmuYY8py8LIAPOeLhiUgXMRAcTCAK4b6aN3c+CWIlTrc3NJka6n2OSj2lua1R6wu0VKcRxfYeyonw8N6m+7v8hJzN3g1tw0ephavISszMD8PqLn1kbMu3FrdaJbtkaJ2FFPmNSqJvCmTY+s1sH5WWjvZv7lASKCGzE/k7nk7f4bPq+5/dR18DtSbWRXmY2cHwqtQskkW+ftvXK2N8G+zdDi+7YD2A73xODNUyE7uUHJT3eYm2GWGhMbbGJTl8uXm6QliH8L4HpWGgI/e93Fk2dQ1POm0OgDy6X1S3vyw5FAMM/a0wYo8/FJiGtNDF7DugSBifelF0nwkQySgSP0qyLMLx8F7/RpTHF1UdyEe3EO0Ljxs2EDySYjIPK1vmJ6IH+lV0z96CZiSRqCClvwGtzOsYiBzEzBED53k1OcQZ6+5vFFrKTb+AWgIiOOkqyFMcjD50EPUlmVFO234Hv3wcNX7VUxjsUmVJgOM1SBlWSRDYsUYyKLWs3d7tH5WL2CLF+YqCT/37fQy03bFhZR7Qxe9Fs9zGxpV7NpGBrSVD9ZXrqLOPm1sPH18nSMPVDw80eMX4Jsa3/LQ86JoZgPYF3P1j3Cq2ONsq3xauHlW0dVPpT9ryBqnLZ28C3g7/A7pGlevhKTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5MN3c3SEdobkYybmIrZUtVcm93S2MrOHNtUVg1Rnk5Y1ZhYkw1RE9CcVls?=
 =?utf-8?B?eFdmaHFzZ09LS1VUbjl3VmtnMXliaFpoaUNQY2g0cFFBaG5QRkwvams4ZjY0?=
 =?utf-8?B?YjcwZ1JUOWI1WmpmS3JaWGc3RExFRER0SUNnbjZRcTd3N0wrWGdiNitSYU9D?=
 =?utf-8?B?QlNnMHVuUjRXaFZQZVBFOE9GdGZWdXF2bnorSTNnNDJQUkhMdHI5emx4OTJK?=
 =?utf-8?B?SlRWNVhaWDJ0dWJENCs2d1JLeFpuVGhJSnpLcmRiUHhWZGVlaW4yMUkwdCtn?=
 =?utf-8?B?cE0wM3I0REo3YmcvRENFcndQcFZVWUxDUEpIOWMrWjhoaURNU0VKeVRkbit2?=
 =?utf-8?B?aXUrYVBXekdRWUhTaFpQT1JZUFowMlhYamR3aWxBbmhZN0Q5cUZWRnpKemQy?=
 =?utf-8?B?T1daVU1ySnZKV2dHdFhibTBJK0h6cjRlNG1DZUpZNmhoR2VvZVMrdGdESTd1?=
 =?utf-8?B?UWs1bU5NVHJ3enFBTHJmUS9wdUV4TllNZm9LQWpDY3ZvUFNzN0tyZ0tDc2Mw?=
 =?utf-8?B?K3ZqYVdLSEQxR3lRRUtYQkVvcmpXZ2ZTYnJpaUdXVmQyR3RXRkc1RTlUa0Zo?=
 =?utf-8?B?cGlzemtyVXBFTlFyWTZYaGpUWjZHZFFsSUFQQ25HN2FNVHMvemRjTHp1cFU0?=
 =?utf-8?B?V2s5S1ZOWERXMG5JNEt5bHorbTFXOVhFUkZQZSszdUNjNEVTZ3gweGhHQXp4?=
 =?utf-8?B?ZlkxTWt2cWR2UHRCeDdtWlA1cjcrSEk3ZzZsb0xEWmJBcVZBS205akFMWVNp?=
 =?utf-8?B?RkpLczdPOG1ncDR2U0J1STBKMDJqNENqVm04TVZxYmRZbmo4VGFISVFKSldY?=
 =?utf-8?B?cGVmczgxZFloVkVzK01CT2lnc3lLRHltalU1SXF1VXBYdHVhOUtkZlcrYXFm?=
 =?utf-8?B?VU04ZnRUY2pHUlNoNDIwSXFWTDBRUGV6M3M0MTlLc3dYZTBFc3g1MXRjWm9t?=
 =?utf-8?B?cTlnMUZXU0RnT0dJd3dVOHl1aDZvd1VPUmZSU0k5SEVRZW9vT1dKV3EwVHRL?=
 =?utf-8?B?L3FqcHBIdUtVL2N4Z3hVTUFDQW80TTlyb3RxNTJUTEZZdm52RCtydkEzRlpn?=
 =?utf-8?B?U3dJbGlQdWZvNzMwTHJvRWoySWdudGVOLzRGSHJaN3czdGpHSVF1NWNjaFNT?=
 =?utf-8?B?R3lLOU1JY0RmaVZmbTFYSW45aTJLejJNdi83Qk95azI0bEZpQmIrRi9Cc2Uw?=
 =?utf-8?B?WEtFM2wwc3J4aW4yMFcyOE00M3hJbUs5djVmZkRsV2lVU0grOTNDZml0YVVk?=
 =?utf-8?B?dDJhb3JScFRiSEZwQzk2OXBROU15c0ZUNTFTOXJ5Q3ZEbVA2QzJidERzTldW?=
 =?utf-8?B?VzVFK3FZZjVaZGRFMzZmcGdoMmRPcGpjd3BDUTRDLzhUSnMwb0hZdDJzbFE2?=
 =?utf-8?B?SE8ra3U1bDBKTHduSXdON2xyNnF0OFcycHd6bWVWdTFORkpiY2tzZmp5V1c5?=
 =?utf-8?B?enZSYk80TUMxNzVDR1pqSFJqUUM1ekRWTTdBNUVpWXJkYjVjM29yQjV1MzV5?=
 =?utf-8?B?TmpEVmF6YWlvYkNWZ1dVamxJNitCZ0JjL1NyMnZkZzVWcnVRUGhHVmt5UFRY?=
 =?utf-8?B?VTdMS2FocE84U1d3TTc2TVRVeXA3bXo2ZENPR2NlSEdHSmVtemN6S2d6anIr?=
 =?utf-8?B?dnZ1OWRLNVR4bGFxRXExdjFnSDlpU0hmUk81VlMwaExKelNOY1dOd0JpbTdh?=
 =?utf-8?B?aFRXb1kwVSt4aGViMlE1dFliK2FwMkdlU0w5UEpMbEtkUHJHZTUvemx2dmpQ?=
 =?utf-8?B?U1llYlkrRGNHTnlxZFNFczVKNlh5V1VDQkthak02c2pndnE5L3E5MzFSNVVN?=
 =?utf-8?B?QU0ydmVMQlRoazdsdThacWVPdk9JU1U4Qkk1SjU0Z3pUYVZDb1U3V3UrbHU0?=
 =?utf-8?B?TnlGdjNpRlVYYytBcm1DNWNVbnlUd3JXT1YzVFVndS8yMjVLalc4c3FXdmV6?=
 =?utf-8?B?UCtZVmxBUTNET2hWWG1JMCtSVm1qNkQ0blkrZk05c1kxaFlnWWI1cmxzQjli?=
 =?utf-8?B?S0llTGQyWmt4TGhGZHdBZ25ZTk1IVDNOT1NwQkROMytjQ0lzc2pLcUt6S0Rs?=
 =?utf-8?B?ODVPc0tUeXZUVThhNGJvSjdUK1NKR0tGZTJ6U0pJb3UwWlpreEJsR1R4am9l?=
 =?utf-8?Q?v9ZTPTWuT02QmW83gDAEjpq/v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da948d43-1d55-46dc-4ea4-08dc3916e64c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:09:29.8882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QvRsjymMQc0vRPbZGv6i1YqbSR3JH3sCXUS4xEG1hwP3RdBqKn0Apr2Y06RHuLWQ6F7cLuXDRF22Bf6K+vyfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7598
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

--------------cKBnt9SwLULy0jXbZkY98RMg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

On 2/29/2024 4:21 PM, Matthew Auld wrote:
> The drm_buddy minimum page-size requirements should be distinct from the
> CPU PAGE_SIZE. Only restriction is that the minimum page-size is at
> least 4K.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König<christian.koenig@amd.com>
> Cc: Arnd Bergmann<arnd@arndb.de>
> ---
>   drivers/gpu/drm/drm_buddy.c | 2 +-
>   include/drm/drm_buddy.h     | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 5ebdd6f8f36e..f999568d69c1 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -102,7 +102,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   	if (size < chunk_size)
>   		return -EINVAL;
>   
> -	if (chunk_size < PAGE_SIZE)
> +	if (chunk_size < SZ_4K)
>   		return -EINVAL;
>   
>   	if (!is_power_of_2(chunk_size))
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index a5b39fc01003..19ed661a32f3 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -53,8 +53,8 @@ struct drm_buddy_block {
>   	struct list_head tmp_link;
>   };
>   
> -/* Order-zero must be at least PAGE_SIZE */
> -#define DRM_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
> +/* Order-zero must be at least SZ_4K */
> +#define DRM_BUDDY_MAX_ORDER (63 - 12)
>   
>   /*
>    * Binary Buddy System.
> @@ -82,7 +82,7 @@ struct drm_buddy {
>   	unsigned int n_roots;
>   	unsigned int max_order;
>   
> -	/* Must be at least PAGE_SIZE */
> +	/* Must be at least SZ_4K */
>   	u64 chunk_size;
>   	u64 size;
>   	u64 avail;

--------------cKBnt9SwLULy0jXbZkY98RMg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Reviewed-by:
    Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;<br>
    <br>
    <div class="moz-cite-prefix">On 2/29/2024 4:21 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240229105112.250077-3-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">The drm_buddy minimum page-size requirements should be distinct from the
CPU PAGE_SIZE. Only restriction is that the minimum page-size is at
least 4K.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Arnd Bergmann <a class="moz-txt-link-rfc2396E" href="mailto:arnd@arndb.de">&lt;arnd@arndb.de&gt;</a>
---
 drivers/gpu/drm/drm_buddy.c | 2 +-
 include/drm/drm_buddy.h     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 5ebdd6f8f36e..f999568d69c1 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -102,7 +102,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 	if (size &lt; chunk_size)
 		return -EINVAL;
 
-	if (chunk_size &lt; PAGE_SIZE)
+	if (chunk_size &lt; SZ_4K)
 		return -EINVAL;
 
 	if (!is_power_of_2(chunk_size))
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index a5b39fc01003..19ed661a32f3 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -53,8 +53,8 @@ struct drm_buddy_block {
 	struct list_head tmp_link;
 };
 
-/* Order-zero must be at least PAGE_SIZE */
-#define DRM_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
+/* Order-zero must be at least SZ_4K */
+#define DRM_BUDDY_MAX_ORDER (63 - 12)
 
 /*
  * Binary Buddy System.
@@ -82,7 +82,7 @@ struct drm_buddy {
 	unsigned int n_roots;
 	unsigned int max_order;
 
-	/* Must be at least PAGE_SIZE */
+	/* Must be at least SZ_4K */
 	u64 chunk_size;
 	u64 size;
 	u64 avail;
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------cKBnt9SwLULy0jXbZkY98RMg--
