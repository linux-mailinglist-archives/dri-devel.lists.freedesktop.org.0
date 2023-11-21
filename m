Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E47F31FD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 16:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF2710E4DA;
	Tue, 21 Nov 2023 15:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F4D10E4DA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 15:09:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKzDEpWwERqzO4/eUCej8q4GkaJJE5SvKwmwAlVPBGGFKj9KQn+xEPXTqKjtefGDOK6Ms2kyf/GznaEsxbMulAfQYDUnUdPagZGNlT2n1X0qmtva/R108lBaDBSMzKKmVtNpxLd6GyVUlIfDpA4IV5aBo0+6Ib/4uuzWlzJCOo4kgGnhXO5uKiXm+mhykRU5NiuQXyZUDcWVUCA9VT5EkcBXxqc5RZYm5iOETMqghiz9WOoqWCD1aZfSPGOdnFTCXkbVAkxEwiCzxCRXekkRZUzWpFH230LJNfdZDKf6k1g3nYmszD5i1840rs195mtIKN4oEhKg9LiKEqDwHM34Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xlcB9QzBvOj2qD4M1kfU/d+DWRvv/3qRNovjahHD88=;
 b=ja9wxGMHXbSDmCJ4lK1iheY7/Vl0G5LIQnSj//+q+0DG2h0rqY4Zn+2myzplwYQ2Op/woQ67/36PRE0nlIe8ktDfL+7uIWKvUf2QyfSOFbRkOumiI6LhV9EZCCQagXKfRDuiNHUsxt93urTygnGhp0hrFnzdVrQ13IMJfsasOrcOr6d8Mj9HQVbqWlmX4er1hLHzFdrfd5iZQXPhuHqsTQY8YA/DvBbMVV2S/XHxwF8v8Zejsg2X1DTN6on5d8bkV/lqaHs4O+7l8CK675RatfyVCdUZi6EFTphkuAbUdQlJCdnoiLLFFKna6qFsZsWv+o029ZGeQSBHX2CLRiMIaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xlcB9QzBvOj2qD4M1kfU/d+DWRvv/3qRNovjahHD88=;
 b=EJGA1Yj8oRYpPVpIkCDEGagKeyyvF1NYRClds3WmMMUacxKlXQ6BfPb8Q0OQ5pPEiAXaLHx3jM11ZZ9VRa6H7ccoAMg5KsKOyy5CTrBLYRCXZUxzSenWBLaueJyxvjZ+Wm2pspEm5P3rAjeFt84gP4z/AJPd7InDLQAzXQULXLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 15:09:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 15:09:27 +0000
Message-ID: <81280618-dd36-43cb-86bb-e124f505f8b8@amd.com>
Date: Tue, 21 Nov 2023 16:09:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1700207346.git.karolina.stolarek@intel.com>
 <119b80776b83fa71b67ce746afcc3c2ee8342fe2.1700207346.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <119b80776b83fa71b67ce746afcc3c2ee8342fe2.1700207346.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 161d437a-0146-44a8-15dd-08dbeaa3dadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nWGcxzF/QFXFeBGNwGHjj7FB3p0j4Y5hHn8pkI3K5AdP0UgIrkFhVO43Td1ImBNS6K577ldxbdO4w3Oi8dHtDljjqF6xyaEe1uMOeHPvNzOIV2cUAJ3e+Bs5HlonQ5BfFeuNRqcOPVhPyNNczORhPfmcvPXOPjpNglQsdCZsnTRXEu0zJjRFJ2vzHdRoKBzTnoaUvxyuop4RTWB6iQ/yuQVYJa9bdBJRCP73LioDs4MSPpBAd1lpz/l4lsGnZNoVcB585lEosz2tjM/zfHZ8NO3zY/boSYIgj+A0my/lyd31e7XC51I2qBlmdWQR658XrKTWjvryh7fv+nHPsMlOzrUyHUJdG4npacSbKSzpNYV43P8xjeobGVYRSPnCJkmKQOofylO1pojPT2/BhorYiSgQkW0Ftr1bUu/y6r/Dds4j/sHfQQKIDzF9JRsanT0aYU6dT75eNtAwU8qhyr0b04+go/8fXHbg4vrQzvh+YYPugbQ6odetkvnwELYcHOQJAyFQ4lZioa76kXUjpD5UjxuAwWnm0e6zthuxbxfqQJhusD0BZxVagywQ55anOjDkS2Irc/WzLw+bXT5KQkOHzKGTpluHmxU3rgynIarjQVUyFlzf98SGM5HD6l6luWAaHVueS7wdRw4WC4k1D4ETIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(366004)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66574015)(83380400001)(6512007)(26005)(2616005)(8676002)(38100700002)(4326008)(8936002)(41300700001)(2906002)(5660300002)(478600001)(6486002)(6506007)(6666004)(66946007)(66556008)(66476007)(54906003)(316002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEF6QVU4ZHZRaHl1ZEkrZEgzUy9uSnNoMU9za3JxMlZSSkJ1SmpVdkVyQXNx?=
 =?utf-8?B?TDE4VmY0SlhpSWwwTkJxY2VPS216eEZWRTlGOUFlMEJrUnZ2L0JrV1d1VUpl?=
 =?utf-8?B?TUFIZVhxeDgrRFNUdkNER2EvZi95bXJCeVlaTS9WQzcwZnc1aEZPUE1oZUdh?=
 =?utf-8?B?V0toUmY4KzJRYTFqbURGcmFuUTRadmhjVVV6ZWFvYlJ5TWo2eWRKemJpbDhv?=
 =?utf-8?B?ekdzTEh3N2lOU0ZNL0UyNVBGaTBqb0oxaWVsUXFpOTJTY3NVRHJobGRuSGxQ?=
 =?utf-8?B?T1Nlc0p2c3RKQ2hQZE9DVTBCazJSMGViK2xuQmxsSzNIV2pZbGZwUmtkV2d1?=
 =?utf-8?B?cWJCQnBTL1dNVXd4a2VUUUxrL3VyR2kwMlJkb24yalpDZCswZnBZZGxpKzFZ?=
 =?utf-8?B?TGNtUWlFeXJEamJ0VXhnUlNyOHFlVkFVK2tJTG9ZQzRGelEwOVl3bWhVS040?=
 =?utf-8?B?WWRmWDc4MWNGUmNSZXZCdnorM3RlMG9PMiszWitiWmNQd1laK1VCdWNHY3Nk?=
 =?utf-8?B?ay9nbGlnY2wzaEhNU1kvMTgxZVQ1b00rQ3BjMHdQZFJ0ek93KzNjbEFDUjI5?=
 =?utf-8?B?bitQdHpvL2xGRFBlM3ZYL3I5Uit0TFJLQXJRcVlkTWpYME1kbSs2Mys3L0Jk?=
 =?utf-8?B?NVpBaG83cDU2alBBTFJFMDAwUnZqL0RYcFg3TGJyWmZjQUovdHNMeHYxSFpm?=
 =?utf-8?B?MUJlKzFLYk9VRHJWbGZnbmNGYXpLU01EYS9GQWRqbkpuaDlYSFZBcVdDMmxR?=
 =?utf-8?B?WTlQeURjeFAyeUIwRUMrbnd5K2ltN29RWjdVMFljKzZod1RjWVhvNjJxVmRK?=
 =?utf-8?B?Uys1TDRneHZaMzBYYmhac1UrenRKc1NabDVKUHZtUE5GU0lmK2tyNGdDYjRS?=
 =?utf-8?B?ZFhObFJZWUwyL29KZG5vaDNOQXRqTDVzUXVqU2xzaG4yZVFqSFdiZFJwRnY1?=
 =?utf-8?B?ckJ1akNrYnZRNXNUc1NYOHpzVjhvVjBrNG1DeVVlSVZqdlVNblRRKzlGaUU2?=
 =?utf-8?B?Z2xBU2VoU0xwdVZybzl6WDM1OHVZMzRld3d0NkJFaVJPWXBkc0gwOThSZUtB?=
 =?utf-8?B?b1I3a3Qwd05mWkZ3Sm1rWVc5djVXTlpCYW90MVlEQ1BPenV4UTk4ak9vOHUr?=
 =?utf-8?B?ekZLOFUyempRZ3ZkeWQxTngwUjdKQ2pNajNjZnBKLzVtMGxqQmZ3SUxISGFj?=
 =?utf-8?B?aW5XMUJEMzY4MHBoTjAwbEtZVnZJYWNSVkhFdHNJM09mWGVIZkhDZ3Zmcmg0?=
 =?utf-8?B?M2pnbjU5d0pBdG1zd0RvcUl6QnF4RFJVaS91Z1U5N0NXZVE5cGhJcU1uQ1Y0?=
 =?utf-8?B?SjE3bmFwT09MeTdmdmFYWnFZOTROWTB2b2JMMFBQUlZXTEttOFcySFRLRDBo?=
 =?utf-8?B?STIza1prUnBjZlphVkdXdEoybXZlR01CRjVJc2hWN005Nm11QThLZVo5RXBn?=
 =?utf-8?B?eTZLTXdmY0JlNnJXZGZMTFo1T2JJWGg4SEk3NStiaEFmd1FTTEdxdVVudGs5?=
 =?utf-8?B?OGlxOG1ZeTBJMzlsdWRFam1kSkhuQlk0V3JnNzBVdUE4YVdTdVNVZFVmUGNm?=
 =?utf-8?B?U3F4enNGSjJWMUg5V3FWdHA5M244NEJaeURrR1g1N3V5c0dHZlBzTFZ0V2dw?=
 =?utf-8?B?THZOZ2RXOWtKUExhZlNvVnJSZ01qaVVaTmlmUlpHUU1xK29SbGpsaHpINzFS?=
 =?utf-8?B?VlB5eGN1bGpEVXJXdWRVNXY3RnJ5YVFJWVMrYmplZDBiUU1PQ1VFQ0UxQ3d1?=
 =?utf-8?B?R24yV1VDaDhQcmhvQkFhaThxWFVCUmhTWDIxOWRjR3cwQmFWcFJ0NWJuN0xu?=
 =?utf-8?B?Ukh0MmoxUENFeXFZTDZSdzNubGUxK3RPSi9nM3oxbHBzUWlpNzB5VUtRdHhQ?=
 =?utf-8?B?VEZjK09WMkY1TEs3d1ZjZ3FsQ3RNUit1QXdsZ3dNWHBlSXozNzhnbzNXVDFJ?=
 =?utf-8?B?K2VSbWxtOFJWNFhVVzE3WXppVVVTeGFZdGUyVTM4OENVWEErUk9aMFYvcEM0?=
 =?utf-8?B?R3IrU3I1bWI1SVZ2VmRVcTdaQVo1dXM0WThiS29NTzNYMEpyL1dPejg0b1VJ?=
 =?utf-8?B?UXRZM3M2M2VFZS9jQXpXVGN3Y1MwN3RteHNXTUw2MDN1SCtvZEZxclBlUmxq?=
 =?utf-8?Q?Cr8Ix0gb2PNcX/C1XPCHoUd4y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161d437a-0146-44a8-15dd-08dbeaa3dadc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:09:27.7714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2wAkYPiM9R/DInJaVzwUsFbktrVmm4KtQgPMVZWZJKJ1w03TI56BjBhtbpExL2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.11.23 um 09:49 schrieb Karolina Stolarek:
> Remove a leftover definition of page order and pass an empty flag value
> in ttm_pool_pre_populated().
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> index 2d9cae8cd984..b97f7b6daf5b 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -78,10 +78,9 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
>   	struct ttm_test_devices *devs = priv->devs;
>   	struct ttm_pool *pool;
>   	struct ttm_tt *tt;
> -	unsigned long order = __fls(size / PAGE_SIZE);
>   	int err;
>   
> -	tt = ttm_tt_kunit_init(test, order, caching, size);
> +	tt = ttm_tt_kunit_init(test, 0, caching, size);
>   	KUNIT_ASSERT_NOT_NULL(test, tt);
>   
>   	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);

