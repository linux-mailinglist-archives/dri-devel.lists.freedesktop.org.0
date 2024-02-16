Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CF7857B91
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E92E10E5EB;
	Fri, 16 Feb 2024 11:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RHy+rmQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A716910E24B;
 Fri, 16 Feb 2024 11:25:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzaMUvq73O1YvZyRrOU95GRyASU7EtUuG+yfCO5o2ixx4b42tTaqvLWvq0Raih9Y2AyG0HAKkNgqBALQZGWniqbDUzCLhPz0qzuSWoz9aQNVbj5Z6dcxDtua9ocwBvz2+zU5bMzSUx1BMAAQInPfM1txwx+Q9hraB7PurrcUisFwnZjsPE30nyuUcKr9M99rzhG45rURNHcqOeqSjco+WVTj9EDFG0ngaeYkN44TMA0VSF0S/Q3L1DRbpnJ18jnfMAXRX9bOti7MfLUyjZktWDapyF3iZnaB6staHVUBBeJemjMXhBa7FcA50yefXgO+/EUM8qkl/npYAGwi3yvQzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRGh0yZhnqscBovahDUUIvZTi7BuvPDKzFwl26vQ3ls=;
 b=HZtc1As45pjUoGNFdQDo9nQVVCkXezSEaDcKQOKsvB2/DfGubOYaVEPl5wbGN+ZTa1B4EYTo1vbZzhzz5wulxr9PWZwJ2y7U7r9BC8KAxAWRgWSb3fqQkteyxufPOojACXaZiVUwHyk2QEaDJrEJbbbLee6qgJHw8ieubgxfGRzX2cVM3HlMpuK123Zs17W5JasvMUVRV3P5rxXNl/UsDBLW/BufzMQIgVfdVA9ZLvrqAUjZsz9Qj1lSsRbtCgd4ZHXYrcxjDzkiRw3AmQxbvpKb/PsumSzBtij7lCdJ0kttTAwmiWMnoFCT0dswGyGuJ3aXFFfECn7eHm72KTqOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRGh0yZhnqscBovahDUUIvZTi7BuvPDKzFwl26vQ3ls=;
 b=RHy+rmQqug+X0KM+Y6QQYuiyr/08TQuQkTz7rw/8dyuj2jvYveC0F78XXs4OPuaehwYoicxdSOKXT0LfxNQxkZoORgaeFCR1QK5SYho7iHeDeCT8AGG0CHt86uYCC8slGFZynkNhc8a61lHn+UxtZnrXgvNUe2McFmtmKHWoU78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 11:25:39 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6%5]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 11:25:39 +0000
Content-Type: multipart/alternative;
 boundary="------------ERP4qmwu21Gn9NYwCNks0xQ4"
Message-ID: <2f43cb5d-492c-fd7c-4f55-e65cf50a7559@amd.com>
Date: Fri, 16 Feb 2024 16:55:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/6] drm/buddy: check range allocation matches alignment
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
 <20240215174431.285069-9-matthew.auld@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240215174431.285069-9-matthew.auld@intel.com>
X-ClientProxiedBy: PN3PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::22) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a26fe25-cc11-4957-6af9-08dc2ee200d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ensrEqGgW3bvB2Xja0CRC0ySfDBx682/mu9AGSP9x9bBH/sfMTeoSL5NVV6eTpHJoxLVWN1CQnFEXK4GQbDs5pIJ3DkAdnP/uaAjWo498upBK2jg+lSgStX7Zt6xFnEVBwnoMN26FS4Lj8rKvkFYs4+/IMdoL+9T1PxwC8EGX80f2Vn3jFCZTysgIg4zBNqNgZoDZHY19cfBu9vvt7HkzGTGmnUa0JZALgOElFLrQW7Hufa2ZiCVo1avHEgELjBxKMzWUFdVCusca8cKQ6kC6fnqh/nVF1Wo1a6US71RieZiuF0HGhS4z40cnOfijsy7ZF51V0uZ94CO47obSUy1jET7MmqTyhwiLh+B11ItikDDHdJYPDYm4c0FWzwxbrRe3ZfdI9J20dLPAKAlHJiTmx8eBJFWA+T3puW+R3Yy7a2099NsThIv8BO0PCbql/2ODdWksdAgzrC8My+t01lZ3otvW2cBcRX3i0f+jNWc983AgvRA2V/l9Fto4sBsMUeDuwz8SOlzKMI3jvbkOXSb66EL8ApewPSlePdw4tXVlWR90s3tGxuqzhJrrDION3T+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39850400004)(366004)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(2906002)(5660300002)(26005)(83380400001)(2616005)(36756003)(66899024)(38100700002)(6512007)(6666004)(478600001)(53546011)(33964004)(6486002)(66476007)(31696002)(66946007)(66556008)(316002)(6506007)(66574015)(8936002)(8676002)(41300700001)(4326008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWNRWlVBb2d4bWxjNVZZbmZYNjBkVWJ6WjRBZWxjL3JGVUtmZHhlR01HTXZD?=
 =?utf-8?B?cUMrdzRzU2xVNXZQc2RjRXVMMmpjUnNjdk1hZ3ZldWMzeTNiUjRpUEFxcDZY?=
 =?utf-8?B?dnF1TlQ3WVE1TzRWcEhuV2ZEc3FBMWJHRk4wdnlFVmlPb0hlS3V0L21hZHJr?=
 =?utf-8?B?cjd2aytURHFKY25nT25mNG1jRWVjdGU0NG5HeFdPZUFVSTUvU29INXlKN0xx?=
 =?utf-8?B?QVZ6WlFIYjUwWnBpbGJjTDVGZEEzQWYwRXowa05EbndzY3hmcmc0bnNCMCtu?=
 =?utf-8?B?VThZRXNsS1JPK2sxZjZ0K0dKelRnR3pqRWg0RVJXTTZCTWV2MkExd2ZLb3BF?=
 =?utf-8?B?U1Ria25wQ2p5RFRXWGxZTU1KYVVRRys4OTM2SG9TV3RoRzVoWUpVWlJYaGxa?=
 =?utf-8?B?aDZscXpjcUNrVVNxK1NpcHVtMFJEaEtFSjd1UnJPODVXa2hadkcvRWhrSGRh?=
 =?utf-8?B?VUFDUk5IOGFqN3NPQ3dXKy9MNTdNa1FzYUZtNmF2MEZFYzREQnlDUjJlVlVh?=
 =?utf-8?B?ZjRMY2RRZ1FKWVpXY25QLzZVRFFzVWtRUEFSbG9JbHRGOVgzRkdYaGQ4QnlI?=
 =?utf-8?B?Z0EraVJwNmViUWRXVGJaN1VGSitjZTAvWXNzL1hlYTg1emFtYjFSaE8vVEJM?=
 =?utf-8?B?UlRzdzhpN1hjNUNrYTZFczNkNnY4cnZYcTJMQlRSZmtGcTVXSDRob0JKSVpi?=
 =?utf-8?B?QklwTEFYZFhtVHVFdGROMGN4cVFoWHpaTDFpMzB4dXIyTnBZUmxmaDVlRG9r?=
 =?utf-8?B?OGoxK0RPZjU3NmFzRlp6RXBmbjVkdGphUGVoM2ZsZ2F4bUc2cEl3QXphQkQy?=
 =?utf-8?B?Z3UwcXlaWEZOK3lHZDBYWURmS1BFcWRqWjBjL3BWbXRWWkkwd3JxRWJBTTU2?=
 =?utf-8?B?SHgxQy9nb25Oc0R2ZFFYQlZNTWFiRnB2SGdtSHN1Qzd1YzlGSklRcVlZbmR4?=
 =?utf-8?B?eUFMYzhTSG91Q2d1WUdFSkk4UmRwRnR5YTFUbjNHcXJOeTBaR2NUbk1MSHVM?=
 =?utf-8?B?VFF2SFQ1SzcvN21QUGhqc0NWcjJrc1J2RVYzY3hpSURMOHM0ckk2K0JHRnoy?=
 =?utf-8?B?TEhNUlFLbEtna2J0aFpzL1NRdlNvY0UyYzFneEU1TFB1VnJjL205eE0zdWVy?=
 =?utf-8?B?NVZqZktGTnd6SFZtTmthaVBvdnBObERGTHpwYmdQNHU3ZWlHQ2xzbkNzYlpP?=
 =?utf-8?B?SG1RWkxYYmN3QXhvaFg5TWRKaDBjTS9MREw5bEMrUGtBcTJtcVZqVjhacEpX?=
 =?utf-8?B?WnZrcjJKTDVjdEkvZW5BNFZUejlzTFB4bnVyRDc4Rk5DNzVkeW93U0l5Nk1l?=
 =?utf-8?B?a0x4Qi9WaERPTkZmR3V6cnpQNVZWdC9jdUQyTmRXdHZpd0tDUTNrSkNRbEJ5?=
 =?utf-8?B?QWI5NFloZlhUYnpFbHliVVZIUnJMTjhJUmlhT1B0YXZaQXgxZThtajQ0Q3Nm?=
 =?utf-8?B?Y1hTUFo4cVFHZWQzMHNnMzRZSk9vSC9ab1ZGVnlPaUxVdjArMTJhUTVkY2lu?=
 =?utf-8?B?bXZBbDZXTWNEMjJoN1k2RUF0cy9iVVorQW5Wb3VVNHl6eVFubUxrODI0ckVz?=
 =?utf-8?B?aHl0R0pWSTZuN29lR0VyZkxNNFY3Qk4ybmdzdWpDbGhPMVpkbVV0UlczWjFE?=
 =?utf-8?B?UGl0c3pFMUlzSjVrZmtRVmF5VUxLK056ZCtZQk9qV1Y3NnEyZWEzOHpGWmZF?=
 =?utf-8?B?SWQ3c0NndTBiZVpkUE9ITTNTV0ZHZzJmN3JTQjJzbVFEYUpFSlIvenoxS1JE?=
 =?utf-8?B?MmhMeDUwR0dzYTdzemIyYUEvTElCTUc5c0E2dEZjUWFQSmwvRnNra1VUOXFj?=
 =?utf-8?B?dm0yU3krcnM2bHNGa2wzaHUvT09GTTMwSkpDUUlGY3JSMlUwSllaWnUvZFJC?=
 =?utf-8?B?ZWVOUTNQWmxSN0Z2R0hsaTJTTys3Q0FYclNkOGxEV1RnTk5nOTlFaXViV2R4?=
 =?utf-8?B?TlNqSGlNNzBmYlJoZ0Y5TTE3b1hOakZ1U2pwZzJzVUdyMjFXWWFGOXhCS2lT?=
 =?utf-8?B?aTNZc2toZnA3SWNzWTVaVktSdlpWWUQxRmJMZlVNanRBMnRyYmZ0R09yWWpa?=
 =?utf-8?B?Q1hwNlNDMlZQNUNpLzRaYzlsQmFSSzRHcldqckY4NEx3RktPeDlJTGd6cy9D?=
 =?utf-8?Q?I0XwfFXAusRdtrek0V3x0W2+h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a26fe25-cc11-4957-6af9-08dc2ee200d8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 11:25:39.4359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZoX5OgqXE5OA/1EDeB5/9h1467Q0bX6kvygjL03723/vXY7GsHHNNaN/BwoE/paMjSUcG/xMgwizz4UeR+ctg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544
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

--------------ERP4qmwu21Gn9NYwCNks0xQ4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Its good to check the alignment

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>



On 2/15/2024 11:14 PM, Matthew Auld wrote:
> Likely not a big deal for real users, but for consistency we should
> respect the min_page_size here. Main issue is that bias allocations
> turns into normal range allocation if the range and size matches
> exactly, and in the next patch we want to add some unit tests for this
> part of the api.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König<christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index d09540d4065b..ee9913016626 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -771,8 +771,12 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		return -EINVAL;
>   
>   	/* Actual range allocation */
> -	if (start + size == end)
> +	if (start + size == end) {
> +		if (!IS_ALIGNED(start | end, min_block_size))
> +			return -EINVAL;
> +
>   		return __drm_buddy_alloc_range(mm, start, size, NULL, blocks);
> +	}
>   
>   	original_size = size;
>   	original_min_size = min_block_size;

--------------ERP4qmwu21Gn9NYwCNks0xQ4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Its good to check the alignment<br>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Reviewed-by:
      Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;</p>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/15/2024 11:14 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240215174431.285069-9-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">Likely not a big deal for real users, but for consistency we should
respect the min_page_size here. Main issue is that bias allocations
turns into normal range allocation if the range and size matches
exactly, and in the next patch we want to add some unit tests for this
part of the api.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
 drivers/gpu/drm/drm_buddy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index d09540d4065b..ee9913016626 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -771,8 +771,12 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		return -EINVAL;
 
 	/* Actual range allocation */
-	if (start + size == end)
+	if (start + size == end) {
+		if (!IS_ALIGNED(start | end, min_block_size))
+			return -EINVAL;
+
 		return __drm_buddy_alloc_range(mm, start, size, NULL, blocks);
+	}
 
 	original_size = size;
 	original_min_size = min_block_size;
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------ERP4qmwu21Gn9NYwCNks0xQ4--
