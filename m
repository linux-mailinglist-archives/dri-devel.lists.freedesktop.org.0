Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718BF6A95C9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 12:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2263F10E0C6;
	Fri,  3 Mar 2023 11:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67F010E0C6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 11:05:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVwkt1WiOK5Sxu8h1EmiN10OBehrTkMcz0xdBpqi+1jq7JrTL6z1+bzL2NzX5fQQBaaAEwGsd4rpAC+FspNxOqnmqucvkFgOVURBgTXRvmzRw8Aw0RVsz/fuRU0TbPgDN95AsmN+lCZB51rWPBdkCywdxPaB9To6Pv6cEoe+4encWNrUfs6D6cOQ6hHQm64aTkxgU+Dergy3CcMYSv2o60hvdQvV2J3jeNaTl1+i15wqGobh9tTVfiwJgZ0yWZB8v4v5a5Dx5RcHHOZLzN6h2Dc8xlRMSi6nTjC1vd1pyiBxCJoNp4DLd6GIe2qTJOqe3CZraU5+JjYZHbFSgrrfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyilYlCWEtSM6pfVAJa+qFtJRE0/ly9N3fS9n/S97Wk=;
 b=mb5dF//iov9cHWc5dHw/qXyiWR5hXWv3EbmThTsYoOlr43gByPufkC2CwhTgtfzk17cDR1DO/n3kmeG7gYuhu9NhftzjD0Ncw6hi6CoFvn6tCYpBDJgi9i+75C1aJv/9DYF+4aQdOg0QBDMXGpoopNyY6w4eXo2DfO708J0oLzx4xqSdLYW4wvL8dc0HFSDHoSCBykTJF1iZgJJasT+5HUsTKFv89dBZUyw8dKYFoc7Pgih+3DImEo4vpcbymnSFObifGKD3ZO3huke2b8NgFHs/0YYHtcqFSTnKlV/YdMBzs3uirGt2wk5QXwRSmbloozctyAQ2S276Gxh56LVv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyilYlCWEtSM6pfVAJa+qFtJRE0/ly9N3fS9n/S97Wk=;
 b=JPS3+hOxFFkhLDK1lVGIFXqyNITPYiTGyepLV+xlpw17sTRFzdgbiykZamM0GN2bdv3O5bVktUJ8+9T4EnxK+EUFlMGtFEHEfSrD5CGNnh8iQfNRP9ZieIeee707x1Zd8wwAwhMj7E2bvYMNwtVYnazHOd23zBW9q8C8ScB0HYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB8125.namprd12.prod.outlook.com (2603:10b6:510:293::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 11:05:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 11:05:20 +0000
Message-ID: <248e314c-8214-bde3-4344-b9b1211496d0@amd.com>
Date: Fri, 3 Mar 2023 12:05:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ttm/ttm_device.h: fix a trival typo
Content-Language: en-US
To: suijingfeng <15330273260@189.cn>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230303101216.788971-1-15330273260@189.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230303101216.788971-1-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 90315644-e3d8-4b55-ec40-08db1bd72dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d6KtxUHi1psWRyhGYAb1rO6vC0whugVWxepEGapT4+W/FTGDYZp4BG0uCe8c9Du7+npLBbREeaQYXR1N8xpV4xmgJyV8aMDki5lAovcWMHKrmv09qt9i5p53E9TRPTqyBF+Dh68Wed6dJgWIte3y+X3JJJ2sB4VSRnanWm9gqLmJ7N8KNI2/kP6v80lQArU3yS38UGN3r9g/G7FB0bK0wenT4XLUwpk61bv+o4UEOw0fwTrqiEPYQRwhdvXOZhG4maynzaH2+f9ocMSiB573X1vmUpc+o/sNmSnMyEbrFZv+PTbynRJ8wFwaxEqxPh1yKVIEecwcZ1I1+pe/EtGp1Dlcggr5RXmfOPIHaCdJsLyXMhj2f3ZpjATcJYbe/5sUvCxiozGqD/CkJHnt8w3I7bVUKOnT/iYAsjaoGav4j2C3NStD1mpnR5G++hsjMtvh/AHg9oXGNeSCXri2jkrsXOAycwW/FMBQQXfqjU4vbUGBLEvUGPthwlfufT3upoRcyfOcbsYNM9yAEJt9y8TnteLZRswDMwLkDNry9oh7UeALG0147TN7aCMbHsdbBQtASuaK6UNa88lfu/6CWhmQigU8nRWRqKfpD1xT3dtowrN/OgcR5Q8DkLMIboyps9CYkymNsC8D9ZCVzrt8YfNIkthUHmd44XOcCq/Lou2scHlNd1Oa8FvPjSyAyBeqkTuorFnvaGdFFEchxBiMapECrQPRdKK9HFE8f5DESyA893M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(5660300002)(478600001)(4744005)(86362001)(83380400001)(6506007)(186003)(6666004)(6512007)(31696002)(2616005)(6486002)(36756003)(2906002)(41300700001)(38100700002)(316002)(4326008)(31686004)(8676002)(66556008)(110136005)(8936002)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW1RMGVlT0hxM3BIUE84NHhsUlhBRnRMWjdnWmdSUjlpM0drT3VGaGNNY2lC?=
 =?utf-8?B?ZmJRdVR3SUhQUUFIb0tGNnN4TElFbkEvbTBlcTZaL2Jlc1ZKOUNoZ2FvU1Rk?=
 =?utf-8?B?UExYZEJDaHNVblBoUUJCT0xsNDF6R2tPSmZrTzVydUpBcWszTDRSNnI1L3Ft?=
 =?utf-8?B?L1IwRWx6dnRSa1BFWTZ2M09ZRWdnVERYdFkvZFUxazhHM3lJMFVJdkZkaDJ0?=
 =?utf-8?B?cjRXNzA1TXpSVUYvSldYZVAyQmpkUUFPVkpEd2ZWTXo2eFpKUXBDMnBkUStL?=
 =?utf-8?B?cWljUVBFdisyQTFEVlQyOGdiZWo1NFdONU1qQk45VS9OUnZqb2hFeHpHSEty?=
 =?utf-8?B?cldFMG9PMEJ4UFJ4NEVidHZrQnNmMTRJd3ljNzNReWY1UE1idEd1M2pXMkQr?=
 =?utf-8?B?bVpqWjREdjF0azFybndkVStmSWEvV09WN25hRmhiczlsTUtpaWQ1bHREaWpu?=
 =?utf-8?B?R2ZYdlg2Z21xc0VCN3M5eTNzM3NPMXZxYjFRdm8xclI2MjZTUmVnQjM2Yit1?=
 =?utf-8?B?cGpEd2Z6ZkVZMXVTekVsY2dGdTE5KzkrQVFXVHJ3YjAyZXRSbWtrQlQ0eDZH?=
 =?utf-8?B?dUhndzROU0RYeTY2Sk15Ky92a0xiNFdzR0dYbS9mQ29VcUltQ3EzenhGbDR1?=
 =?utf-8?B?M3ZybTFGZmFKa3JzUWxEcUNpUzNuSlFob1R0NFZrYlphNUdoT0V2U2J3WWVu?=
 =?utf-8?B?V1pkQ1gxOHhzaFNuVjUzMmRhREpaNnAxeDF4UnM0YXFma1oxUEh5RUk5QkJn?=
 =?utf-8?B?V1VvY0lQc2VsSWZhUXlWUDlzRGE5MDU4SVYwOU9TT3N2T3NaSU9PUmx5SlJo?=
 =?utf-8?B?L0kwenBxRjI1Q3graDhoaGlzQkZPTnNENGowNEkrRkYvdjBJWm83TmVMeklB?=
 =?utf-8?B?RFZVVlN3Mlo4SWNaTmxRYlZRUWljTGtyMGwwRjBXVlUrYmVLSUd1Y3U3L3ds?=
 =?utf-8?B?ejh2dnRHdzVTeUxhLzBCbDJZMzBIN1JHUzFybFhYSE1tb0JZVEZNVmJiM0dF?=
 =?utf-8?B?Tjhsd25EQy9MZTh3aFdZVjJEczFFaUQ5RnA0MlBlbmljbmJNbUdLMWQ4cDVT?=
 =?utf-8?B?OVltVzRTLytKSnJQV0hLSWJiMnpBcU9iTVlWWklVWkp5YzBuZUptMXo0dHlw?=
 =?utf-8?B?U3g4cWtvNG1VS0tNc2RNTWFBZS9ETlo3OGEvZURPYllSNlJHUU5rTi84Y291?=
 =?utf-8?B?UGtkRDlmd2VXRnhDQ1pLa1dvSTRMalh2Ums0d3F1VGI0emJ0Ly8zYmErNEMw?=
 =?utf-8?B?VExKMUhRVHVFZE0xdHZYU0pENlVmRmhrSkRKQlJNdDNpckNJYXRNMEFjdnM0?=
 =?utf-8?B?di9McGd6eUlGNm82VlVPZHFwNVhMN1JLcElxSWRlS3FpVUNuYlFkR2ZzL29k?=
 =?utf-8?B?WTAxbkwwVTdPQll5T3ppRE11Qk9BZXVtRUhBd3NESmtjZXBMYlhJVXc0RTdC?=
 =?utf-8?B?MU1BaVJnVGVsckxVRmNGNzZQNW80a29RdnlRZ2c1SDFuV1dNZFpScFpVTVRC?=
 =?utf-8?B?N3NNcEtYdHNDSlk5LzN4VTc0YkEyMjNkM3FObmdaWW45TWFUbUIrOEwwNEdV?=
 =?utf-8?B?am40bnFuTm9nMmtHMlBQYVJDWHh5SGZRUDNQa0Rva2VQMXBRMy93aTZuTkpz?=
 =?utf-8?B?RmY1SldsZnNteGNrOEY0dGFmOE5Zd2M1bU9BSU5saWFPUDJBc1hpTTVPSXVJ?=
 =?utf-8?B?U2pkOGJtQSt6MmpHRFVoMzZGaFJIMWQzN3FHeHhYaWNWOTVkclI0RDlDMU0x?=
 =?utf-8?B?YVJDZk8vRG5BWGJTSG5lVytISnFXWlp6eEJlSEhEbzNOaVBrMzdwa2pITXd4?=
 =?utf-8?B?SnRtTDFIWmp4cDZDcUVOSmhmSkYvT0hRYmxYV1RDRzFWb3h1WjRaQ0l5SVBD?=
 =?utf-8?B?TytESVlLN2d2Tjg4L0lza0NHV1A2VjNLamtnRkRGaGN0N0daYXVFaFgxaDFv?=
 =?utf-8?B?Sm9ETloyOXRnbXd2OWZoZU1Pd3Yzai9PTFFwZkp1L3prU3RNUG80OHdwWWY4?=
 =?utf-8?B?b3U1ejVDbDlqcXJLMnpJK2c0TXpHM2NuY1NBZXpZUlppZkZzb2xoaGxFbS9D?=
 =?utf-8?B?SWNJMW11YWExNlNXY2tJN3F4TGhiL3drbE5seXJQVHY2c3dnYUx4ZXhyTitP?=
 =?utf-8?B?cmpzTjBmQWx5V3huR0J3YkRnaFVEeDhtZkFTb3Q2Skw0UGhCTHFWRkt0cFJQ?=
 =?utf-8?Q?Rzqz9vrbZu72OX/487G9mZaJp1m5ZgZl2qa35+W5ty78?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90315644-e3d8-4b55-ec40-08db1bd72dbe
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 11:05:20.5275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oU1idVEdK9fpzDLJ0izwEkZiVxkM8n230Yr4GNwCpRHHOqTYfaNdgsGInysq7D4d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8125
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
Cc: suijingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.03.23 um 11:12 schrieb suijingfeng:
>   should replace '@' with '*'
>
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>

I've just reviewed and pushed the patch to drm-misc-next.

Just please use your full (first and last) name for author and 
signed-off-by tags in the future.

Thanks,
Christian.

> ---
>   include/drm/ttm/ttm_device.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 4f3e81eac6f3..56e82ba2d046 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -141,7 +141,7 @@ struct ttm_device_funcs {
>   	 * the graphics address space
>   	 * @ctx: context for this move with parameters
>   	 * @new_mem: the new memory region receiving the buffer
> -	 @ @hop: placement for driver directed intermediate hop
> +	 * @hop: placement for driver directed intermediate hop
>   	 *
>   	 * Move a buffer between two memory regions.
>   	 * Returns errno -EMULTIHOP if driver requests a hop

