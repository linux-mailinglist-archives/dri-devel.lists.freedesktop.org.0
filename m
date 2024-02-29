Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9386C6F0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8064910E0DE;
	Thu, 29 Feb 2024 10:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OZKkzWeN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBE110E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 10:30:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbDLKpzPTvna6gV6trNQ28icBiXYXCdOpLdPrJ9P04QzAkSNs716J6+ihSI+muvxzKBT3wMnd+NeAFDDhFz7fZQ+C7kgA/Uzd+zcRhKZDj5Vv+1dXYGbDHdWdxKz5ClQXo0PhdpRQzxIDS1Sl0stSKdIe+9UYntHoJgZj5REhyu0xDfnMBUlJIJveeTr5XQm8DKAFezPwaX2W47StXSjgWLH9VV55pFfZ1xXAWbHRytmcuJLuWc1hvLke4RgweIXeU9tvIXj6VWShtJSxwQ6A9Hx1JqXciD2tO44cprBXUU84ZVyaNc6LVCcru66bmv4DNCNA8kaMfL8YJxQQ1lYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWFXDmt7DVLD16wZ9vyFti45NXjNlNjT7q8O0Ej6q/s=;
 b=gSA9xuPQ4RIkKJDAM6USz9CnB7ss5Y3PZ1H+1CN/UT2m8s/mXylq1PSQlhWH+ZO2seqEZvii+k/TcCIQPVeciDFA4Io4/mEYgf/vNAncbR/0A3oModys5vdB8ZbNFtLIrk089OjxTMnZ+g5xuc1Y/FbbaRP+2jkP/+Y31PuCPbWjOUsB7uNdYt/FW07f5bNMrUZ+MvXaUIfQENDhzNhQTeaPPg/rKnVKF1wBVwbx/+0qEOe4rWst7WLEMDp4g+dJMSkDsF+Ct3umgwdOJbxHgZTst9qrmKhng2Y7UBeyO49dBpWX0CwttJaz42zwDR98wXRNe7xx07gZWxs7R+IhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWFXDmt7DVLD16wZ9vyFti45NXjNlNjT7q8O0Ej6q/s=;
 b=OZKkzWeNXkpS/kaQI/n/hTfBJsoTYi6d5rFlnZU1hdhx+ujo4BYSLjvNZCYPzLYsYDJs13vvKDprXZLEQ9M7tvuaxMznTSZ5spwTUal1VSCTz84rRCrelo2QwW4742ezfkrEBJYSq3umxJpOS8Y9bhQHuJ6TyIt7mJ8lkUkIvew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SN7PR12MB7252.namprd12.prod.outlook.com (2603:10b6:806:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Thu, 29 Feb
 2024 10:30:26 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b%5]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 10:30:26 +0000
Content-Type: multipart/alternative;
 boundary="------------3AsnjHiayd551bEn9AswsQET"
Message-ID: <d84b93ea-039a-48ab-878e-d96c1a75aed8@amd.com>
Date: Thu, 29 Feb 2024 16:00:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests/buddy: fix print format
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240229095225.242795-2-matthew.auld@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240229095225.242795-2-matthew.auld@intel.com>
X-ClientProxiedBy: PN2PR01CA0204.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::14) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SN7PR12MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 630568f1-fe6b-4fe1-3367-08dc39117193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmMXURIz5kntFj5VM5lUq7MazqGeAwi31BKlECx/+lofUuFW8ouvLjcj+TrfhFRbmTeMDAj8hhhmPPHkpW8kqwvuDguF5krTP7y2IfdU5hRmsfszW5JlE2gYKbKlMrZXKfT19/sV5+6J79sF9Xsn4Yi3upjHf9NUm18mTG5IHvY2kuGI6MPFUHtV62LeW6wYXE148xRvBxi7eIBlkfROgBCdYtWr1iTAdWU2dGz+61wCqU1C7HCeAq04ZTHv1zTfgoQjnhGiYR/RHkRnQ0CLljQyffhEC6A/2BqF5YgmAyGA3zru1qh3X6bneaykVZ6NgMkJ3OCl1c+Rs/T/z0BTdLg7+9y4cUyVh5wAFQ8J6/7Fnu/IGKhZKlAQDXxdVmbugGXn2t/yJi/98uoVjD7ArSX9LKqhhh0yLwOYslXkd61DgUrNd8JJ8U8kEk52VE6B3pHD+0uu80yAX99XAO9j/DTcUHV/ReuzZmBQJwkgpExtKzmcHqmXwFqbWx+/i55gzxObOfjtvRq82MnwcdaUUGUC0RnW3v4gC+xYuvM8zRa7dkp7bEYxuEhK8YJzQhQ1ckXcQsMGB0jAc4o2hgjNKtNMysauFe7kHxH09nWwtZqeCSHPwNKy+DOCGLEnq9lI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXBobFVUV2dQQ3hjek9IN1VRK1ZGcXBvMzM2WlJRRDhUYTZWV0k0RFhYd2dr?=
 =?utf-8?B?dHZUcjhrNDUyeWpQdU9IV1ZVem1FU3pMQTFPYnRjQUdYYVlwd3EyN3hsRUdH?=
 =?utf-8?B?Kzhha3N6ampmaXdaQ01oODFpZWhJQWxWbDg2dVBUODFFbXV4RWs4U1VxMTdj?=
 =?utf-8?B?YWdkcHFUUDJSSDJDUWd5NG0zWlFEZlZzdElrbVpDTkhlL1lVRjJvZzVQY252?=
 =?utf-8?B?YVMzQVBZcjU1THc2aTBMTnEwNXlYdUVkN2tCSklJTWtZV0tNdU9TUU1Ea2pw?=
 =?utf-8?B?R2JWZGY0NzFlSlVPSkJwY2lWT2taK2h3RE1tL2VMaWtraWpsOGQzakYzZzg4?=
 =?utf-8?B?U2xMbnZybGNwKzV3MkZTdmxEYldUWmh6amFpVXlWQWZJWG5XVXBrQW40a0JO?=
 =?utf-8?B?TVNPNng3K0pBRGhXYTFud0c1bjF4SC9FYkVVQUZ5TnVDcjNhcUhpNEhYUHg4?=
 =?utf-8?B?WmpycFJXWUNxby9yQTFPNzlmRk5IdGJ3Q2hMbXArM1hiVG5vZjNUOWpDdGtX?=
 =?utf-8?B?ZlQwUUROYmM5ckFTQmx1enlSU1I1SDNsamZ1a1k2TWxQRWNSYmdleDhoV3ZI?=
 =?utf-8?B?UlhoLzlOM0x1Z3NwNzg3OXBBN2ZFOEM2Y0ZRcUh2Q2R3b2xBdUllU3Arekl0?=
 =?utf-8?B?YkFheXV0RXlQbFFBYTRaVzc5TkkrL3o5VWRqRkVFOTI5aE83RDA5VXF3VkE3?=
 =?utf-8?B?U0JFeldJQkxxWERtVGhEM1BzL1lrUW8yaXhLRUZYL2Z6c3pnZ3pSK2NRZE9O?=
 =?utf-8?B?U0FZek9Vd1Q0Mk9QT29LQzg5YXl4aGtUMncyY0wwM21WNFU3OE1XSC9nK1Qx?=
 =?utf-8?B?QXFkMmN6ZStWTTh3Y1hjZXg1bVNnUmpDWTRFMWllRHpkR09ldTlWWGtCUDV5?=
 =?utf-8?B?ZEpoNm9ObnNxYWtVZ0pUVWQ5QzdsaDA2MTVYWTA3aXplZy9pZUJORkpWWWRT?=
 =?utf-8?B?NTJzQklJdVQzbCt2TW82NkdaQm9VQjRkSFllTVNJOUhuL2t3Q3JScWtoNlQ2?=
 =?utf-8?B?YUFLNmhRR3NibmVzZ1FPMjlhUGdzK2dSSUZQVTFmK0U0UTJJU1VZUHJ3Q2s0?=
 =?utf-8?B?ZnF3a3FqN2JPZERaRG4wL3MxVEUvRnZiVmg2QWJFSDZ0K0M4RU9RdkxnLzJX?=
 =?utf-8?B?bm9pZlBSV0hZc2w2NlVKT0tKT1ZXVFdlU3JtMWlVVHYxZDZiK0xzb2RVbVFD?=
 =?utf-8?B?aU5SekU4cEpEOFh0QmpjUmpicnJvU29qWGxJMk4xNVZMOG5kZDY2bnFmRWR1?=
 =?utf-8?B?aldxZm04WkNDMFVnNFpkbWVZdVJjV09hK29vWDJyUk1EL2hlb1ozcDN5d0l2?=
 =?utf-8?B?N0ZzUTBsYzlVQVVKT0hQWnNmVGVuL1FiRHY2WDcweStqZE96Vk1rVTJ3U1Fh?=
 =?utf-8?B?d1d4cU5OQ2VweGNYKzNyN2RjVC9YS0UvaDdlaXhOcTBQOUZsbVg0M1J0VkFy?=
 =?utf-8?B?QkYxakZ2SzFqNGNWSDczZjRtWFBuOHZ1cnMzQnljNXRXNkNvS2c2bGpHbExF?=
 =?utf-8?B?cnA0eFJheFEyV215UWdSd1YrT2NUZlV3YXdoU1BXdDZvQjNWdUhWZmlQTGlQ?=
 =?utf-8?B?bnp2YWxpdTdhN2Q1ek1vSnF3R0dZbHJnTnkyVnNYTEpwWFMvVWZFWDNkRk5m?=
 =?utf-8?B?Tnh4NGo3aktlR3VaSyttYkh6MUE2R1Axb0dkYXg3MmpLRkhvbTlXZVIya21a?=
 =?utf-8?B?NmlGRC9yVGtCWFBmM2k3ZFNnMnRmMGpkR2txaVVLNVUrdUFYZTJRRVRRVVYr?=
 =?utf-8?B?bjZGaXhnay8xazRhTXpTVXpySGFTQjlrQWlEL01sNVA0SE9HV2UwWWxidk9t?=
 =?utf-8?B?dHNBQ21zUVJERmlWNXJZaDJadVN1MXZrMVFpL0I0QUczRFdqR1FXdWI3UVhs?=
 =?utf-8?B?azJMUEY4VEF5NUlrV0RrVDNnc3ZjSXdhY0F5L3J2RVdhMUlSelV6MkZ1eE1n?=
 =?utf-8?B?Tzd0SzNPSmhSeGVSQXl3SmRtYnlIdXQ4alE3WDM5UzJlckg0M2JMZ0xwNEhO?=
 =?utf-8?B?cUxKWUtyL0loZlluRHRXZlNSdWM2cXVwK01UeHdxZXZSOCtUSGRORnZvd1ZZ?=
 =?utf-8?B?bjQzOXlBZDNHemtZN2VzaEYyUkU5Z2IvU0FGVzBkMGRqZmlLYys4ZG1DQTkz?=
 =?utf-8?Q?Wpks4/09vxEcyJVk8/qRa6wYW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630568f1-fe6b-4fe1-3367-08dc39117193
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:30:26.5715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/D9YytUFiRCoRu23RXsIyOLVdJ3e/9gRGKDKuyNHHNa2tO0tXX3P3g+6XgIuo4XA2k3W66gvSMZ9HRHzEBx7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7252
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

--------------3AsnjHiayd551bEn9AswsQET
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

On 2/29/2024 3:22 PM, Matthew Auld wrote:
> This will report a build warning once we have: 806cb2270237 ("kunit:
> Annotate _MSG assertion variants with gnu printf specifiers").
>
> Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
> Fixes: c70703320e55 ("drm/tests/drm_buddy: add alloc_range_bias test")
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König<christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index be2d9d7764be..484360c7e1f6 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -189,7 +189,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   							      &allocated,
>   							      DRM_BUDDY_RANGE_ALLOCATION),
>   				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> -				       bias_start, bias_end, size);
> +				       bias_start, bias_end, size, ps);
>   		bias_rem -= size;
>   
>   		/*

--------------3AsnjHiayd551bEn9AswsQET
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Reviewed-by:
    Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;<br>
    <br>
    <div class="moz-cite-prefix">On 2/29/2024 3:22 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240229095225.242795-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">This will report a build warning once we have: 806cb2270237 (&quot;kunit:
Annotate _MSG assertion variants with gnu printf specifiers&quot;).

Reported-by: Stephen Rothwell <a class="moz-txt-link-rfc2396E" href="mailto:sfr@canb.auug.org.au">&lt;sfr@canb.auug.org.au&gt;</a>
Fixes: c70703320e55 (&quot;drm/tests/drm_buddy: add alloc_range_bias test&quot;)
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index be2d9d7764be..484360c7e1f6 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -189,7 +189,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 							      &amp;allocated,
 							      DRM_BUDDY_RANGE_ALLOCATION),
 				       &quot;buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n&quot;,
-				       bias_start, bias_end, size);
+				       bias_start, bias_end, size, ps);
 		bias_rem -= size;
 
 		/*
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------3AsnjHiayd551bEn9AswsQET--
