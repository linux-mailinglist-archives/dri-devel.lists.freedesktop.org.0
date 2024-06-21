Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB411912898
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 16:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B1910F1C4;
	Fri, 21 Jun 2024 14:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0ddAKqZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F8710F1C4;
 Fri, 21 Jun 2024 14:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dn9vsgmJ5D1C1h/wJVOc3wVNwkDcQWhMJRSZPmCRmVeu89B71paiFUGXFaQCbt2z7LoIfjcNjHCnlDn/Nhm/11JDnLmkrzQoubx4WHZMgPLjCR8HmI2Ir9rC3X8I2bt5/uAQaIXj/ATUE3AesnK44mjMOHFay1KMVfsp9QNkzYxSsn9rrXp4dLjsflR4nlxDgw2OM1KiXSYFRu9N+r+5y9zU7L5tEi5G5+koD1lYAseq+MvIFAsNSBtMdh5PFGoLS8rGhgz0DMMO9mallj4S3nI7AutLHi6DvPDmueO0H9EC7Lem/G6mvYFLnYbgDCAMGYulNzq/y7DCEEQNAyA2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLdn2XkX+eb0xqm1SBtIfAJeHFL0vVdhcZUx9SAf9Ms=;
 b=GRMc2TdlBi4miSy1WAag+OuSTjkfbO0inwFj1EOEhaXmHoVejfwiWCiMqj2Vu+pKuNdADp1hJdXifwbKSqln1t7zbligKwrULrJMwG8R2iLAZJREFizbK+z6Ge/0a0iOYIQD/JhgJWgR7k5Pta0o9VCV0Xqs1fxlqI1qK75UK0V8ofWyc804kGu4JeHbQD+eK4N0ktyGqTe5n7/IT01+2LDwifgJl4j+w5UJb3Zox3/ozq8E0uajyvrjc/Au3xsZP9Kf+WcrEwswmdpXbO8a0XzEWVj8eIpex39rwdo09f2Y2R9eKZ3GN61/uicbYx0r+3let6yGTeOn9eXAuM78qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLdn2XkX+eb0xqm1SBtIfAJeHFL0vVdhcZUx9SAf9Ms=;
 b=0ddAKqZcgYPuvbUNbNVtj0ro2q29p5mAhuXMAfkcftv5GTtdYtpN+l81pnmhMaAtueB/yDq5OhvKNMrwMUlaC/hXfVbEcrVvqiM9g2TRenTXjEYDe23/eaxOohDLsfaOBKFpvivWxgTvAx1F4HXxsstI8WlSD8Niat8whRsX0Cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6666.namprd12.prod.outlook.com (2603:10b6:510:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Fri, 21 Jun
 2024 14:55:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.023; Fri, 21 Jun 2024
 14:55:06 +0000
Content-Type: multipart/mixed; boundary="------------ibV40MH9avcvzD8NAkyVX9ty"
Message-ID: <98890fd6-43b8-4a08-84e8-1f635abb933d@amd.com>
Date: Fri, 21 Jun 2024 16:54:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm/pool: Revert to clear-on-alloc to honor
 TTM_TT_FLAG_ZERO_ALLOC
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20240620160147.29819-1-nirmoy.das@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240620160147.29819-1-nirmoy.das@intel.com>
X-ClientProxiedBy: FR0P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f672857-2e71-4cb1-9788-08dc9202234d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTBtN0NhZGEraDRiT0pxOUVjTXRaNVVMTXh1TkJKK1NuUWdqNGdzLzFYL21q?=
 =?utf-8?B?TzBWa1VteWViSGpZRVVXUnkwbkRKQzNPb01vU0xIMWYxL0g3Y0g1cFJpcmxo?=
 =?utf-8?B?dGZJSEd5YlhZZHhNWjlMbGpQNVdlS2NlZUg3T3lKM2M3S1E5c3kwNUdPNnhw?=
 =?utf-8?B?azZpVmV4YWJjZHl1TkFxMkxhOWFKaUFtVE9lWENkcVA2SURWVjgwcUN2ZkxS?=
 =?utf-8?B?T1pzMURUSTJkNndUSi83T3V0ZUlRaFVUZHEwek5pVnhYb0psMzJJS0haNmY4?=
 =?utf-8?B?d2ZUZWZickVvTE1xOHhnMFR0bHZ3aVlwY2xSRXJXTkI1a0NIU3NxemZTNHAx?=
 =?utf-8?B?Rmo0b2QvTk14dUZDT3Ewb09xYTVnd1BlVWYyZkNoK0ZDSFNsQUFHL2hqd2R3?=
 =?utf-8?B?S3dMWVphaFJpOVAxRE44Q3ZlY0thUXFSaWNhQWlZa1V3bngzOTd5VEpQV3p3?=
 =?utf-8?B?QnQvY1lDWTdIa1laYXp6OTdXM25YRWVoTUJPZGltL0NDenM3V0gyTFJSSjlO?=
 =?utf-8?B?c3NmWXFzbXBxM3N4dm55UGdqdXg1YXpoclpvMDBoZWZBSU5rcjVvOUdGTEpU?=
 =?utf-8?B?Yk01MDYwbm1ueE93OFpaQWxZYUswQmdhbXVTN1hnN3dzVzlsUVZrYUxHNDhS?=
 =?utf-8?B?eFRydGMxQU5tRW1HUVR1YTNTTjNyS0dZbms5YXVhdGl4N0ZzQ3Y3NGF0VHJX?=
 =?utf-8?B?Uk44eDMrRC92dzVKdHgyOHVZaGJzZDJ2RkxRRHVCMFpRZC9QdncvcXF6c1dz?=
 =?utf-8?B?eVNVVy9rSjlkV0x5SmthYzlMcmJjN3NtUWc0K05paWZjUVF6RTNtV2NGU3Uw?=
 =?utf-8?B?aElzcnhHUlFmTTFkMVRLVjJxR1pYVkVaQy9mK1pTdHN0eTNZejhPa3RiMnF2?=
 =?utf-8?B?M0RESTdNeW1SOHVycW9HdzlCb2FFV0xDOUxObkptSjdFRWl1NSs5aFNuTGtF?=
 =?utf-8?B?TWUxT2UxeUN4NENTdjVNTk4vc2lTU3ZwOVNJZ1JrWGh5UzJOVjVXUFhGWis1?=
 =?utf-8?B?YkV3aTN3UW9pcWZVbUVIS040S1JIallzMkZzVlhGcnpxeUc3UWJvODNXMXho?=
 =?utf-8?B?a3l2bDhFYTdCcFQxWTk1VVYvb3RXc0U2WHAyUVZuR2Nyd0dPd1dMVldRWmJZ?=
 =?utf-8?B?cG03Z3NyczIzS05YSjV2NWY3NEpKU1JtaFNlSmR5Lzd3MmkybjN3UThZUXVi?=
 =?utf-8?B?cis4SXBLU1h6dlVqbU80TWIzYnhOZUlROFpXMktxb1cvbmpXcmdUd3JLNnJH?=
 =?utf-8?B?VlJGckZaYzZ2bllpVG5rOWhkb3dlVEFURUd4VWlsTFhhWEYyTTZ6WWJKRVlG?=
 =?utf-8?B?cktiSnpVcHVYS1JqZXZPeEhxVGFzdGMwMFRIMExtdnpLY3BwYktoTmZ5UUtt?=
 =?utf-8?B?WENLNVRqRHJ3dXV2dURjSVR5ZXdheFNuQzdTYkg3NW85cUpXS2FiUTBzUldT?=
 =?utf-8?B?anJScmtpK1ZPcmNKdVl4d1BYSEgzZmRkcWFiVUpNK01acDNCVHpac1JxN0ZS?=
 =?utf-8?B?ampnV0liY0xyRkd2LzNRNkFGMUQ0ZjVkeS9rbnE5Zzl0byszWmp1ekxHWEd6?=
 =?utf-8?B?VHlVYmVScmlwZi85L2Rnc2hrTnFrUzBFbGZoVndNMWs4aHdKWTFpcWhKYVpL?=
 =?utf-8?B?NlRRcVI3SHVkc0VXbVdMSkdxVmkvSXM4UWgrZlNkTWxtVVE2cm9wVndVY0U5?=
 =?utf-8?B?QnB1T2oyYjRzY0JKalMyaDc3VjltNU1xNkV4bWpUM05rVmpYQm14eE5qenh0?=
 =?utf-8?Q?ZnwrkiTukIDgxHEMsgI480v5SlDPXEvID7ObPqB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RklrNitJdXhOUlo2REZaek0vN2pjdGU3MzdRSXdiN1ZvNTVkcC9Sd3dmQkhm?=
 =?utf-8?B?aWE0RDBmdFoxOGVXc0lPMXVpM1lyanIyeEQ5VUJUOHVacFM1MWhuSnpDcUxL?=
 =?utf-8?B?OStraWRvalBZc3RCUHpjSk01ZWs5bmZ0SnNDRE8vSENaVURJOE1DL1pWYzVY?=
 =?utf-8?B?OTVsTFRUbzB4eXhUeTlLUkF6ZzFXTUNablY0Y1g2OENXMkJMbkd5UkoybXli?=
 =?utf-8?B?Q0hIWUVNaUtrSU55aVJYdTRnYUFJdDEwTEJyM0VNY2wzYi9iSmJESzlpU3Rk?=
 =?utf-8?B?UEJoOFFMelNuYXpxWWRTbE45elFBSnc1NGlQc2tvcndJRXFqcStLa1BSOXR0?=
 =?utf-8?B?aDZXZUxveXBhdFdIcjRJSjd2QWorTC9rN3JsY2VGeC9sSGYxWlJOTlFzbndC?=
 =?utf-8?B?OHpUbXFoZUZkcXVYUUZXRkpiMWRXU1RSMmxnUmdYNWxoMTB5WE1jN28yRks2?=
 =?utf-8?B?YTBlUWZwZHF3LzhqRDZaVDZWeENuWXR4YkxJSThoNmlNQ0FWVE5IenNxeG9H?=
 =?utf-8?B?ZC9zalNKQXRkdEpSM0w3SUdNdGVlVTZ1OGJQTzIrTDQ1a3RKRkRTSlpwb20z?=
 =?utf-8?B?QyswUkpyWG9EOTFlSnk0eXZTVjI5TnVTclZERndzSWJwY3BlWDNqMlBzMHcr?=
 =?utf-8?B?eXF6dVM2K293ZmhrbFBVY0dMeE5uSzU4QnJzWEUrVXlsSWdFZXZ0KzRMNE0w?=
 =?utf-8?B?WE1jcFc0TEFUZU4vRFFGUWphL2R2cmlSWUpXeVl2NnpWWVpRL1IzWFlSVVov?=
 =?utf-8?B?VWxhUTI1bTlOeEFhaXAwa0Qyakgzc3JPVHBHcEdRNDF0d2hHRHhid3p1cDNx?=
 =?utf-8?B?OWR3SXo5QWNEVXBpdkdMaElKd08vRXkxYXlVeUJlZVhXT3dZZjA0RldKU2Zy?=
 =?utf-8?B?SXJhRm03Rm9XZnQxc3A1SXoxNjdEckFHZlMwUWhSaFlxV3BGZGFRUzE0SFBk?=
 =?utf-8?B?RGlabldqeWlJTnhQQkhPYjFPSnZCaW15MWxwMktnOE1OR3VtOCtxa2xMa2lU?=
 =?utf-8?B?bG5Ma3pEVG9KbVpVZEZPUitpUGtZMjA1amFjQVNJUmNsRFpqc0t0RUhnVGpU?=
 =?utf-8?B?OEdEMHZXcDdXeFFQeW5kdHMrVzNTRzJlOElEVVZZM3pZaFMzNkJGTFV6UGhV?=
 =?utf-8?B?Tzh0SEM3dzRFMzVFa2ZoOGJ6QUVPcEI1Mis0aVdqR0pqaDg5NkJOV0w3bHZN?=
 =?utf-8?B?Z2N5c0NRQ0U1Q2wwUFJwOXQyVm9rNytyRnZrNnlHREVzLzB3NXZ5NWdyOVNp?=
 =?utf-8?B?SE9mckNpTjNpdEVMSk0zRXdheGJlcjBQZ1puUzhzS3RLVGFCZm1sRmtaWUN3?=
 =?utf-8?B?SHp2WEhGUzZvRk9LUS95WUdJSUdqU21peGVLTncxYXl6SWo1TjZmQzF2Q1BN?=
 =?utf-8?B?Y08rMmdFSGwrUDIxc3lzWXFBK0pJeDZlM2Y3YitDeWZtSTJtcDQ0dTdmd0VN?=
 =?utf-8?B?dGJEVzcwSG8yY0ZkWExoSXZxejIvdDdXWWxPSW15ZCtWYnhOMGw5Y3A3N0JG?=
 =?utf-8?B?RDB0Y2tBSG1ONnN6ellMNUtuaHhrck1QMGhKQ1ArODViK21UUGJuOGdxenNE?=
 =?utf-8?B?U2VPcWxUNDdCdUNKOHJJcGZhMUpiV3pYT2N5aVV5WTJsMnY1MjlCUXFKYzhG?=
 =?utf-8?B?UFdDMlhZRk5EVHBySnVEUjEzVUMvK0N6RDcyOXVpMTZRcFVzMHVYNXZyR1Mx?=
 =?utf-8?B?d0p3OVM3cmZYTmJtMGQ5ZGowVm42RGtTelFsZFBxSnNZWWttcEFDREtjQ05U?=
 =?utf-8?B?YUpCc3Z1c1dHem9tZ1BtbVFRRWFDdEUzY1Zqb3BmTlFvZU9UVDZJUWtvZHMx?=
 =?utf-8?B?TGk3TGNObzdZejJGSlFYUzNYdnpwZHoweXNpam9uTk5temxTTFhkZVpYVzho?=
 =?utf-8?B?eU45M3UxWU8xZzJUbVJxSkZBc1NFOUUvU2RxNm84b21VM21qZFpTRlJQRURl?=
 =?utf-8?B?R2JMNmdSeVVLYVpRR0dScnJIOFBSdmNPaUF3bkM0U1NVZE1WREdEYXJVMUI0?=
 =?utf-8?B?S09MV2YxVWdwZjZaNGF1TmJRYmNhYUIyaEUyNGI0U3FGN1JibUFuVkVMOXNG?=
 =?utf-8?B?Ym5naUpQVjdkQXFJQUxNelVsUDNkZHhRVGwrejNHVXNnMUVScjBRa1RFVDRB?=
 =?utf-8?Q?qUn+zWkAIzv6K/ZyIjMGPvbV0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f672857-2e71-4cb1-9788-08dc9202234d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 14:55:06.2343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45KmEoirwtPUmcXMZzyR3cqmufs7mZcXXKDzm2Qr0ShF8pBM/DKrNzhdzo3Whmlr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666
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

--------------ibV40MH9avcvzD8NAkyVX9ty
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.06.24 um 18:01 schrieb Nirmoy Das:
> Currently ttm pool is not honoring TTM_TT_FLAG_ZERO_ALLOC flag and
> clearing pages on free. It does help with allocation latency but clearing
> happens even if drm driver doesn't passes the flag. If clear on free
> is needed then a new flag can be added for that purpose.

Mhm, thinking more about it that will most likely get push back from 
others as well.

How about the attached patch? We just skip clearing pages when the 
driver set the ZERO_ALLOC flag again before freeing them.

Maybe rename the flag or add a new one for that, but in general that 
looks like the option with the least impact.

Regards,
Christian.

>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 31 +++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 6e1fd6985ffc..cbbd722185ee 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -224,15 +224,6 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>   /* Give pages into a specific pool_type */
>   static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>   {
> -	unsigned int i, num_pages = 1 << pt->order;
> -
> -	for (i = 0; i < num_pages; ++i) {
> -		if (PageHighMem(p))
> -			clear_highpage(p + i);
> -		else
> -			clear_page(page_address(p + i));
> -	}
> -
>   	spin_lock(&pt->lock);
>   	list_add(&p->lru, &pt->pages);
>   	spin_unlock(&pt->lock);
> @@ -240,15 +231,26 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>   }
>   
>   /* Take pages from a specific pool_type, return NULL when nothing available */
> -static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
> +static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, bool clear)
>   {
>   	struct page *p;
>   
>   	spin_lock(&pt->lock);
>   	p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
>   	if (p) {
> +		unsigned int i, num_pages = 1 << pt->order;
> +
>   		atomic_long_sub(1 << pt->order, &allocated_pages);
>   		list_del(&p->lru);
> +		if (clear) {
> +			for (i = 0; i < num_pages; ++i) {
> +				if (PageHighMem(p))
> +					clear_highpage(p + i);
> +				else
> +					clear_page(page_address(p + i));
> +			}
> +		}
> +
>   	}
>   	spin_unlock(&pt->lock);
>   
> @@ -279,7 +281,7 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>   	list_del(&pt->shrinker_list);
>   	spin_unlock(&shrinker_lock);
>   
> -	while ((p = ttm_pool_type_take(pt)))
> +	while ((p = ttm_pool_type_take(pt, false)))
>   		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>   }
>   
> @@ -330,7 +332,7 @@ static unsigned int ttm_pool_shrink(void)
>   	list_move_tail(&pt->shrinker_list, &shrinker_list);
>   	spin_unlock(&shrinker_lock);
>   
> -	p = ttm_pool_type_take(pt);
> +	p = ttm_pool_type_take(pt, false);
>   	if (p) {
>   		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>   		num_pages = 1 << pt->order;
> @@ -457,10 +459,11 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	     num_pages;
>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
>   		struct ttm_pool_type *pt;
> +		bool clear = tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC;
>   
>   		page_caching = tt->caching;
>   		pt = ttm_pool_select_type(pool, tt->caching, order);
> -		p = pt ? ttm_pool_type_take(pt) : NULL;
> +		p = pt ? ttm_pool_type_take(pt, clear) : NULL;
>   		if (p) {
>   			r = ttm_pool_apply_caching(caching, pages,
>   						   tt->caching);
> @@ -480,7 +483,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   				if (num_pages < (1 << order))
>   					break;
>   
> -				p = ttm_pool_type_take(pt);
> +				p = ttm_pool_type_take(pt, clear);
>   			} while (p);
>   		}
>   

--------------ibV40MH9avcvzD8NAkyVX9ty
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-ttm-skip-page-clear-if-ZERO_ALLOC-flag-is-set-on.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-ttm-skip-page-clear-if-ZERO_ALLOC-flag-is-set-on.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0NjZiN2IzMTVhZjc0YmFlNjM1YjkyNDVhMWQ5ZTY2MTlhM2RhMTcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Q2hyaXN0aWFuPTIwSz1DMz1CNm5pZz89IDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkRhdGU6IEZyaSwgMjEgSnVuIDIwMjQgMTY6NTA6NTkg
KzAyMDAKU3ViamVjdDogW1BBVENIXSBkcm0vdHRtOiBza2lwIHBhZ2UgY2xlYXIgaWYgWkVST19B
TExPQyBmbGFnIGlzIHNldCBvbiBmcmVlCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTog
dGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0
CgpUaGlzIGFsbG93cyB0aGUgZHJpdmVyIHRvIGNsZWFyIHRoZSBwYWdlcyB1c2luZyBzb21lIERN
QSBpbnN0ZWFkIG9mIHRoZQpDUFUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9v
bC5jIHwgMTkgKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fcG9vbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCmluZGV4IDZlMWZkNjk4
NWZmYy4uNmFkZDUwMDZjNTc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9w
b29sLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCkBAIC0yMjIsMTUgKzIy
MiwxOCBAQCBzdGF0aWMgdm9pZCB0dG1fcG9vbF91bm1hcChzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2ws
IGRtYV9hZGRyX3QgZG1hX2FkZHIsCiB9CiAKIC8qIEdpdmUgcGFnZXMgaW50byBhIHNwZWNpZmlj
IHBvb2xfdHlwZSAqLwotc3RhdGljIHZvaWQgdHRtX3Bvb2xfdHlwZV9naXZlKHN0cnVjdCB0dG1f
cG9vbF90eXBlICpwdCwgc3RydWN0IHBhZ2UgKnApCitzdGF0aWMgdm9pZCB0dG1fcG9vbF90eXBl
X2dpdmUoc3RydWN0IHR0bV9wb29sX3R5cGUgKnB0LCBzdHJ1Y3QgcGFnZSAqcCwKKwkJCSAgICAg
ICBib29sIGNsZWFyZWQpCiB7CiAJdW5zaWduZWQgaW50IGksIG51bV9wYWdlcyA9IDEgPDwgcHQt
Pm9yZGVyOwogCi0JZm9yIChpID0gMDsgaSA8IG51bV9wYWdlczsgKytpKSB7Ci0JCWlmIChQYWdl
SGlnaE1lbShwKSkKLQkJCWNsZWFyX2hpZ2hwYWdlKHAgKyBpKTsKLQkJZWxzZQotCQkJY2xlYXJf
cGFnZShwYWdlX2FkZHJlc3MocCArIGkpKTsKKwlpZiAoIWNsZWFyZWQpIHsKKwkJZm9yIChpID0g
MDsgaSA8IG51bV9wYWdlczsgKytpKSB7CisJCQlpZiAoUGFnZUhpZ2hNZW0ocCkpCisJCQkJY2xl
YXJfaGlnaHBhZ2UocCArIGkpOworCQkJZWxzZQorCQkJCWNsZWFyX3BhZ2UocGFnZV9hZGRyZXNz
KHAgKyBpKSk7CisJCX0KIAl9CiAKIAlzcGluX2xvY2soJnB0LT5sb2NrKTsKQEAgLTM5NCw2ICsz
OTcsNyBAQCBzdGF0aWMgdm9pZCB0dG1fcG9vbF9mcmVlX3JhbmdlKHN0cnVjdCB0dG1fcG9vbCAq
cG9vbCwgc3RydWN0IHR0bV90dCAqdHQsCiAJCQkJcGdvZmZfdCBzdGFydF9wYWdlLCBwZ29mZl90
IGVuZF9wYWdlKQogewogCXN0cnVjdCBwYWdlICoqcGFnZXMgPSAmdHQtPnBhZ2VzW3N0YXJ0X3Bh
Z2VdOworCWJvb2wgY2xlYXJlZCA9IHR0LT5wYWdlX2ZsYWdzICYgVFRNX1RUX0ZMQUdfWkVST19B
TExPQzsKIAl1bnNpZ25lZCBpbnQgb3JkZXI7CiAJcGdvZmZfdCBpLCBucjsKIApAQCAtNDA3LDcg
KzQxMSw3IEBAIHN0YXRpYyB2b2lkIHR0bV9wb29sX2ZyZWVfcmFuZ2Uoc3RydWN0IHR0bV9wb29s
ICpwb29sLCBzdHJ1Y3QgdHRtX3R0ICp0dCwKIAogCQlwdCA9IHR0bV9wb29sX3NlbGVjdF90eXBl
KHBvb2wsIGNhY2hpbmcsIG9yZGVyKTsKIAkJaWYgKHB0KQotCQkJdHRtX3Bvb2xfdHlwZV9naXZl
KHB0LCAqcGFnZXMpOworCQkJdHRtX3Bvb2xfdHlwZV9naXZlKHB0LCAqcGFnZXMsIGNsZWFyZWQp
OwogCQllbHNlCiAJCQl0dG1fcG9vbF9mcmVlX3BhZ2UocG9vbCwgY2FjaGluZywgb3JkZXIsICpw
YWdlcyk7CiAJfQpAQCAtNTE3LDYgKzUyMSw3IEBAIGludCB0dG1fcG9vbF9hbGxvYyhzdHJ1Y3Qg
dHRtX3Bvb2wgKnBvb2wsIHN0cnVjdCB0dG1fdHQgKnR0LAogCWlmIChyKQogCQlnb3RvIGVycm9y
X2ZyZWVfYWxsOwogCisJdHQtPnBhZ2VfZmxhZ3MgJj0gflRUTV9UVF9GTEFHX1pFUk9fQUxMT0M7
CiAJcmV0dXJuIDA7CiAKIGVycm9yX2ZyZWVfcGFnZToKLS0gCjIuMzQuMQoK

--------------ibV40MH9avcvzD8NAkyVX9ty--
