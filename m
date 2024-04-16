Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBA58A6AD4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C0210E581;
	Tue, 16 Apr 2024 12:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RrDTOyuE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7E110E581
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:23:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diiFzronQODJy73rtOBIARYBFRebs9eRn8ad9NGuBuat/g/2Z9LdTSI67F9StPJzj0khchdOoylDBiii9wDXecAIBpEcWmwitCRDkwNxkkAlKy8k5aD4jDG2o1rljDQVrw+kzaQBHk2stctXnV9O4ly43LcGfQUcg3p1pLaLUlov4Mtn5SKwkQ12CiwKipIQYt72MNTwATvxtXDefLbccNsZsOqWW8ClqKmyENLIp2qN8U8xEyT5T+9ba9HO+cRU51dieEqeUi95qQG0p6u/1mBJLP2Jz0UdvqfnieXN4lHbN+zUx4cgc+staGoPpgmg3HX4WuqDjpr/ZZmPAFeLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxafHxO2xy+Jg7pz5ScZIeKuhrBU2XKvcd9MHiluONU=;
 b=Z++LURE/ETpLp3ineLa4Ada4ZUlh9yPmbBfIG6E4Hb9ZgBPJ+c1xREBb1qmgEDbk40fdAuZEkHURnjwxs/TI/4WSEAAl6EHwbxSuEFQfY5YPhmLUNKt5yhdfo75qAi8IsSeJxUyJ+qjV3eC54uL7ckiFW1shzkJtdKiKBjEaH//2N1ONbTAHYNB1N7noS+9ZJS9TDvLVdpkiP2d8ooSgXpJuKzy+ZWt/izJTjJtlXUJnRGYgM2bLbsp0auyka23TeKHvi4wrr+JJp5iell+sv2y/M9TtWKwfEsXiGbq+uvuNa87NPA7/6tMMIt22y5b6cHuYgSJnztovpDOtusic/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxafHxO2xy+Jg7pz5ScZIeKuhrBU2XKvcd9MHiluONU=;
 b=RrDTOyuEg/gPjn8kijH7PrTaWpzvi7iLDepM1NhidMjL5V72h2Lt4z5vNK/3kj5blAPaf1/vM+tu/EOuGnFJSit5D8c3wvz2bO1XYTuaZGkBSKMtEYCRXDTfHYdWKnZIizTmZ5vIyssmDyI5V7hHbjAwNqEn3dxnZMjAJM9jPHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 12:23:45 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 12:23:45 +0000
Message-ID: <a1557a1d-dd13-536b-1316-507ef08503e6@amd.com>
Date: Tue, 16 Apr 2024 17:53:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 7/9] drm/ttm/tests: Add tests for ttm_tt_populate
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <beb8bc7397ec03d482bf97e6970f4d4f12e8b963.1711117249.git.karolina.stolarek@intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <beb8bc7397ec03d482bf97e6970f4d4f12e8b963.1711117249.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::52) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 267b1621-72b5-40c0-6345-08dc5e100f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JxfpGSTmMyUwZRakqA7XNwJj4RMFxrIWp0JCHZtBKMD/+0ZYvwdhrmIJfxHkDNz7VfBVi89AdUpSj89qo3NcVvEhi71X0zdx78EWd5JGwrCSpk3Oh0dhA3Wrr9FcqKY27xl6NfO23gzBGAIZHpwxjr/mlffktbOjC16n/ZSolvEQFFKrvj3OgFL1KyvGycc5WEmd4SnmrdeKCUkBInESsGi9eGHy5PiGPd3qf0C+LNxNOB6XAWdTmGpg26ROrQGUkkjAbnN4A0FsKy5hPqXRgox4uMoDSKB49TXlz62ZtPUd92+ap9gzC2+scsQwSp0AIxbZkiuuEhvkW+yvM929e26F4xh6ED3wgr2KzyckhdmxyEGCXcxHmuz5X7TPPDRfWZSzZ8yl7A4pbJDziNjvq+2gbi3fBJv1uUEzoXi8n74LOAW33j5JfggLGK7uK3GskVs6XQJwEgirF1PblwJjTUUgZ8X0rOqeYEGklokxEl7eIgakKNRIP0ORXbD2NBPL9WXrRTlvtMDf2ouVHu/3z3Nq9ktP1IrJ022vngNeR+Uk+Qd/Mf6fX8I2eocAJOjYgtlLoIo5t42xx1oxdT6RaPKmRdG9/V/rcxYbvdEKuvPs95rHSjTuclixYV82SDH9lF8SqS8nljYk2XqKwIYrTs8BqU87mriC36MDkdDA7IM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjZnd1p0cm1ONWE0MGVCaElyNDRqZys3MkZERXkvUEhVV1gwZG9iZmVsV2Zs?=
 =?utf-8?B?VTA4QXNWbGJLa0xJVXNpNlhsOXRqOXM3eFF6RGhRM2o0SGpENTc5R0NNUkgz?=
 =?utf-8?B?QXl0eUR4VVNVT0VxV2ZPNURia3luZWVlbW1lekZSWVcrY2VnazBhTTRiaFJT?=
 =?utf-8?B?UjVVVkNCYmJIdVpwbnF0czFUZDZCdmRZV2hGOSs0VVd0K2V1R0VWUnFtVDNa?=
 =?utf-8?B?REQ2M2s0eU5ncnNGcnNUMmFGcVlOQ3ZOS3ozci9TN3BZM25pVFU5RTJIMG5T?=
 =?utf-8?B?citPWldxMjhGazhCZ3VrR1dWT1ZlZ1FkbzJBSVNVcEo0eFo0ZjEwNllsWnI4?=
 =?utf-8?B?UUZDZ1NYMjM0eTM3SmlsbjQzeHFzUVlpNjhqbUg2VzlaZU9ESU5raEtobFFY?=
 =?utf-8?B?ZTVpTkF1cWhIVXk3dWNFcE9OZU4zOGpKT1ZYVnBrNkJrcS9yTk5iVDJZVWMy?=
 =?utf-8?B?WS9tdUw4bGRZVUNLUmFJVlNxRnBMVVpHWDl2ZEs3WUViMzYyd0w1NmF6bXlS?=
 =?utf-8?B?UGQ2TFJKRVllTFlMNE1ObURFMGIyRVFMWHpmYUR4Y2gyVUxBVWszYUV5UUpU?=
 =?utf-8?B?TFQyeDV3eWZHYjdsU3JmcWpjanI5em9TL3QxVno0WUpteXpnY2JDb1VkY1hh?=
 =?utf-8?B?eDkyZW5NeWtWT0oxdmVXb3pvOEJZRGJEZnZKQ1l5bTNENlNJOEhKa0lqbFhy?=
 =?utf-8?B?dHoxczdDKzN1NHZhWjhvWWpDblVUMk1FY1dwdC9PVHNmYnpEQWd3OHlrMkN4?=
 =?utf-8?B?LzlBU0JLYTZhQlJ6TlZINHdlMFJLZXQ0bVJBMU9tM1lmSjBQOFk3S2tjNGpn?=
 =?utf-8?B?MVVxNUZqaEFoZzNweG5MN3pjcSszVlB5SUtETlNOL01LSElpYmQvbGJSNnpO?=
 =?utf-8?B?aU4zdTlBSnpvdmZPL0lza1p1Y1JPbU8yQS83bHhWSE1OMGhDcFBKZW5JbWpr?=
 =?utf-8?B?dm9JcmI0bWJzb1BDODZqYUJKa0J2Z1lIN2JDNHBVM1BCV1I2bno0cjhnMTVz?=
 =?utf-8?B?WGtEc2NDcEdNMGlXWWs1ZldnV2lVUE5zTCtKVWRjNkZjeFdRVzd4U3VLUmFj?=
 =?utf-8?B?WERNMDBDSDBLYmloSHFYclA0MkpIczJNZ0FwcVVyTzJxQXEzT1duSGplaUZy?=
 =?utf-8?B?S2dPMUNsMERrWUprcm9pTGx0eG9uY3ZjZEtuUGoxL1J4STNSaFdhOXBuYU9M?=
 =?utf-8?B?azlRMnp2elkrMEJoZ1lxUzdkbmZiRTBaV3ZSUDFKZjVEUXE0OFMrMjJoNDJH?=
 =?utf-8?B?cHd5dzQ0M1BKT0RPMHJBMzExcUVjd01yTnJoZDJ2M1FyYmZrelpndFRrN3ZR?=
 =?utf-8?B?b3ZYOFRQNGplNXBzTERVN240WGlrZmVFa0lDbjVicC9nZ0xNZUJ1bW0zVWQx?=
 =?utf-8?B?N09QR1A4UmxyMU0xWkc3TktHMU8rc2paTDZsZW9FcXErbEorTVhqV251amtK?=
 =?utf-8?B?a2xJN1FsVzRsTGtDRmppZ1BUNXcrdDhLRHhRMFdCTWxjYTRoNE80cG9lT1Jy?=
 =?utf-8?B?UnpxOWlWL0tGWGVQc0FmVG02WWMxT0RDY1lsYk5IWmZ6U09remdhR3h1U1VN?=
 =?utf-8?B?VEcyTWprV0JFRjZPcy9NMUw2a2FzOTFiWlFxRjQ3RXNNdnVvVVdyUForM1Fp?=
 =?utf-8?B?eHFXWmlkZHIyWGlZQjdQeUE1ell1Q05rNWN4TEQ3Nmt6R2d1ZjJiTEZwOVFP?=
 =?utf-8?B?WGxnYklKSkhncmRRbjN3ZW5QY01ra0ZWeWZyM2hMWHc4bE5yTEdMV2d5WmxU?=
 =?utf-8?B?Sm5CdkRKeUdXd090UUovaytvaWVoeU56RWpJV0taZ25aeXduK2xRRTVwUlVa?=
 =?utf-8?B?MXp0OE14eTBqSkoyalBEUUNWUTg5bldxNWEwNjNmNElkWDdRK1NJYnp4MG5j?=
 =?utf-8?B?LytGZlNlZ1lCT2I2ZHhsTVIzVUdaT2gxajVpMzVaV2hHNWEvaGRHSUZKK0Jj?=
 =?utf-8?B?d1EzQ3BuVnNhZXFYbkJyMmlPS0R4LzRQWGdvM2t1MnNQdkZHUzZpVStCeWJa?=
 =?utf-8?B?dDdVdEpNTVlnaDNvWTBNSWU0UkthZkM3MU9NREVtMk45Q1ZsYmxpWmtMc3Zk?=
 =?utf-8?B?SGFIdmJaa3dEY0pVUFE5d2w1UitoaDV6YXVZYUlBdDRObUExMER4S3pzYkwy?=
 =?utf-8?Q?tr1rk0dUAYXE+2aCRUWQ2MwIl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267b1621-72b5-40c0-6345-08dc5e100f2c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 12:23:45.0730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyz0V9YDUfCo8AyffDvzcflVWwR9MR5UE9eaEur+yiZNkWH0eTovsklv8GgDb7p4gfSF2nj33ZUzmemYUd+Ong==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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


On 3/22/2024 7:59 PM, Karolina Stolarek wrote:
> Add tests for functions that add and release pages to TTs. Test the
> swapin operation. Export ttm_tt_unpopulate, ttm_tt_swapin and
> ttm_tt_swapout symbols for testing purposes.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
Reviewed-by: Somalapuram, Amaranath <asomalap@amd.com>
