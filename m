Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8F625DD2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 16:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262A710E844;
	Fri, 11 Nov 2022 15:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC0510E843;
 Fri, 11 Nov 2022 15:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAkAKaLhkcvvDMeY1KpzSFlvKIEENHgZWZYAcM/qLEg1a9LCFb4zfRXqwwMarVSOeItojj/uV7rZCRcQmAhjXgEIDyN0ps9GVqGfQa7Ep0j2I5k41zdGdfT7MOn6ZbWO7VDpjU1oH6bs9amSulsVAm6S6D6TEfIvwgHVcQOYqlxn9PxG+L/ot28+in6D7u8/UanliwuPbAa20pI+iKQbUmYv5Y1/EO/t9+PaHdR9JDBxHOQlzrmIz2zifhTkIEczGohEzRbGjZ4saPZYu14NOWEwuC7vxBrLUd4qRrfko+bF6FoZNR7GSCsuiq8e3rRDd1FDCPxafro/JIzM/zGccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRLwK/ISslo2P/EWSH678lE8kYt7zrnmlZ9hOR0xh98=;
 b=W7Kh2TcXAMD2gPfYkMtOD/Gfu0DVULiahkVZFMGtEydrtYYEt9OFd8cUmkkci1/qyXKVrWOwbBhc2lfnOUIJvPE0/rfsNm/AbvgOX2ewWeKxgSWkT6gNcyaCKQQmEM4Cy3tMT/K1bc0jQraHLi5lRI8nBxTFmpKwZ3CPERbN4E6FK8EWVpb5zpVjIqUNMKz2046iQZ3KrZg6duJ4f1cRBlTyAypOTisnnnDlE9aT+lx+jB2yF3zbrDNyqpOxewW05JsCRDmVGxTodkuHmIidpj5aN3cIagUhEX4c8iv/9t3zFR12txDLQMIfnzKtp5TCsKSf/ZHshWrWFkuMaeBuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRLwK/ISslo2P/EWSH678lE8kYt7zrnmlZ9hOR0xh98=;
 b=WJMeowJXcDG5tyVhKswS3NwWo3Vb3Hn6dQs9xAz8a4LQyJJmnoxtuYQEziQvufsGuZ2B3RtZIfHswUwUlfb0GPFZ4zP2s/psgYqqvzwhMeDNVdS0GSeESVBL1HPq23CZgxu/PpZYOyfNol+ZoOwdsgDEsNgcsJ7NR3aBtPkb7a0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB7631.namprd12.prod.outlook.com (2603:10b6:8:11e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 15:05:14 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8db:7ef4:cd2b:2926]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8db:7ef4:cd2b:2926%5]) with mapi id 15.20.5791.030; Fri, 11 Nov 2022
 15:05:14 +0000
Message-ID: <546750a0-2619-5df2-482d-a6c22e209702@amd.com>
Date: Fri, 11 Nov 2022 10:05:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] amdgpu_dm_2027: Add pointer check
Content-Language: en-US
To: Denis Arefev <arefev@swemel.ru>
References: <20221111071446.22951-1-arefev@swemel.ru>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221111071446.22951-1-arefev@swemel.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c37f04-a00b-4d2c-e823-08dac3f6230f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Kk6MAmJYCWk1505wyY8gpCeQzytO7NkGq+t3dp7BjTLlpdQV2w9hQ5qigLGIM/Snw4mkNXtQionTpFjEnEWflFHT+PGGC+VqiVimXRasCzxh1NPgMnzAFyAPEVFX31sDm0+PWSgEyjqEoTRUu7NmsvyRaxbF6IVBD8avWKbPrAkdbNmkjX7kgTZMHSC5ctQNcQU5uPj0Y2ip/B+NBkCQ9i3kWuUZAlbYRyImPgS9P+QmPYUYND8ycw1VuOeRlRNRO9MGM0jt9lWrrXCnMektHG2+qden6ZW3yvhiHrLgNU4/M39ivwIKLnvlet6viXaXbwm3KcQx3aeQZv40fgiQ3NS8IfdHhSm+5o/B7BrBs5zYpuUeXgkUUs9LCobF0oiXMbHpMUQC/LHUBahZIiUtvoZtZ9rTO8dkRYhlkmSQFyXV2AuSocqcQi2NMHAb/QW6bY+A6HbSli3DkwN5s7PLxkKjDHhX8YkzewAsTHTurGgTF10dRh1Z/3NAPn9dVqJv3fCyadwDYkCjWOiLW6rjUlAGjAPS2pXzOFi7Af9f0XZ9GXZTRvmRRm+CzEGcakmrqQ37Mc1Y+ntL3bXlw5aDk0Kt5M/SDDooWR5MtrG5sn75w5Jdho1d5n/N0E46sGY9tPI4+u3E0SROMKxOaEEBYboFs7hoWxOm6SD2GS4hEfaelQfoWwEo2OBh6clgvbROuSqDN8ZnH6frPk0x8u3niwsHoUGyPcDtIqOAAo4YrwfdJiiTCnyAGEjLO8fX0PLo+PIaQ7X/3zgyD2FBm5AaqNP3clAXZ7xk1anAai+M4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(2616005)(38100700002)(6512007)(6666004)(26005)(2906002)(83380400001)(316002)(54906003)(4326008)(5660300002)(6486002)(186003)(41300700001)(66946007)(66556008)(8676002)(6916009)(478600001)(8936002)(66476007)(44832011)(53546011)(36756003)(31696002)(86362001)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkRKbjZzbWx6UklkdmNZS2lqVS9nK3pRRUpxSTRQdlRuVy9OWmN0eWFpRjFp?=
 =?utf-8?B?SUF2ZXJDT1BjMm9ycEdaUHcrbGRPcW4rZlZLVld3ZXBQbmh3OU5OOGE1NmF5?=
 =?utf-8?B?c0hzR0RMbnd1TUY0Skh1VUE4TEV1QzFsSlRDdWUwQXNDSUgvYUs4M3VRTVVK?=
 =?utf-8?B?aEdnMVpJZi82NFluQ09QRklrVWhaVENlZktNWktqbDZ6K3dkN0MyTUNzb08z?=
 =?utf-8?B?cGU4NlV0WG1CdHM3T0IvTEpsKzU3TEFFWU5oT0RBYm9odEJCOUJWK2d6S1B4?=
 =?utf-8?B?dStVWGwrWHMyK3NuZ2kwaW5BYWZBOStNVnEvWi9zQWhhSEFqcTNRRlJ1bDd2?=
 =?utf-8?B?cWwzL2hWYmZHU1FGM25KWnZhS2FiNTBRMVF6UUJnK09MQTF3REYxVVFRWVBI?=
 =?utf-8?B?Z3dlajA0Um9BVVp0VjVlOHdydCt5WkpZZE43Zy9uUklSejltMlQvbCt3YW5l?=
 =?utf-8?B?cFowL3pQaGFEMHVFTkM2dDBXaVUxY0ROMUtxTGdTRWkyKzMzOCtTaS9RMy9v?=
 =?utf-8?B?ZFVTb3psZThNVmtrbGhXeXJ6YkxOa1h4bG4vV1FucWJhdXpRUzNyNXJ5c1M5?=
 =?utf-8?B?UVFSSWgzT2cvQk1DQlNtdy9XVEN0R0RMSEY5SkhLZUkrMlJtYzlmbExPaTBL?=
 =?utf-8?B?WS8xK1RCNGMrRmRLQjJUL3NEclhpcGN4OEh1cUcvLytkbVRlRmRZem1BOVk2?=
 =?utf-8?B?Y1o0UGlkdTAyaWMrYkR0akhEbVlFc1MyQmhScGpkdVE5YXE2clBGZEVDQk5n?=
 =?utf-8?B?by9QWmp4RkZvVExDVGxMdTROYm1LaExnVWJvRFhWS3JMeWZYMU8wUE00WG51?=
 =?utf-8?B?bHRjZEw4RGtSb3UxTFgrOXFtSUNCekQ4NG93dUc3bStPa09jR0hGWittWG1u?=
 =?utf-8?B?dzFOQkd0aTA4TVZMZENhZlQrSHpoRVVVNklSVk1wcktLTG41UTQ4enQ0SUU1?=
 =?utf-8?B?bFBsc0IreW0wWHYzZWY1S3lsTzdJRDU0d1o4ZTNRYjVFK3U1TlIyUEk1RUxK?=
 =?utf-8?B?cTROd0hEaHlaYmNNd1JnSVgvOXprKzF2YTc3TS9BZUFEbFZIa2Fyckhvb1Ev?=
 =?utf-8?B?RUF5VHpkbHlodGZoRERvT3QxYUk0dytyZ1V3TGp4UVVtU25oazEzWkJFK2c4?=
 =?utf-8?B?YytSY2RWRlhreHJlaHJOVFJTanVTMXJqcXVZMVJjMVF5MFFGL0tjcUZWeUQv?=
 =?utf-8?B?cW1HbTh2aEJwM3Ntb2loZkpOT281RVYrTEgwalJXU1ZlT2d4cWVNMWNvMUkz?=
 =?utf-8?B?blR4cEJmVW9ONXdDUWp2Vi9Lc0xVcmtQWWtYbE5yRGl5TldxWGZ6WTIvQXUw?=
 =?utf-8?B?bHFyOGJRMmRaYWhjc0V0NEZXZDU0cVpqUkxnUUVzMTR2MW5Bd0ZVcUdYODBC?=
 =?utf-8?B?Y0d2SitabEpKSWVtWkJxSW1ya2RTb003WSt6TGlqdWhlUitQUnFqbjFCQ0RP?=
 =?utf-8?B?blR4dFlCc0tiNDNEZXc3QUxjT25QanAzWk9meEFPOU12dmQ1azBWTWFrMjlZ?=
 =?utf-8?B?ZDNkUGdiamJUK0tNN3F1M25NUjUyUXJaVG1EVTUxcDZBZ3JTQVRLQTZmMHNM?=
 =?utf-8?B?S254SGwrOVUzRXNOVS9YSFpYTVVGdGMrYkFnQUgwS0hqVkNHN0V5bEI1bE54?=
 =?utf-8?B?MFN0eU9hYkZJbkZka2RCcTZYRERPQkloWStjVC95dlNONnY1QUduTmJYWFI4?=
 =?utf-8?B?SElVcmcxdlptd0ZrcWNlN0NnOXR1SGs5ekY2ME5NUGE2Wk9wTGZJeHRBdjlz?=
 =?utf-8?B?c0xUcUFCTmhhZldydU9ZZ2swcDV5MUxvaUlySk0wK3Jic2E5Z3BFdWZaQ3Zy?=
 =?utf-8?B?SDh6a3h1VVZmSk4zNU0xNEtMR2F5ZFI1ZmtmUEZsamVPMHF3Sm1kcUFUVmxn?=
 =?utf-8?B?cW45Tmx5Tk5hVmZFOUhjcXFYTmkySVVvMGQ0VURBMjFQK0hJZjU1ZnRHMGto?=
 =?utf-8?B?Z0ZkQXFDeWVnNHhPcDhTVTVRMGJkbEhCdy9UZnpUaHNtQndkMVAvVnNSeEdG?=
 =?utf-8?B?WEJYd3c1bEhIdTBNZUdVc1JoYXdDaS9QNjZ0bHM2bHM0OENXNnRQSzZLTkww?=
 =?utf-8?B?TUgwa1JNc0Vic0xVb21CZlZuQURRbDI4dlRFUWFzM29EblAvWTVCcjVyZlEw?=
 =?utf-8?Q?G9b0k3er/32a3p83W/BOWyiI+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c37f04-a00b-4d2c-e823-08dac3f6230f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 15:05:14.6475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iv3mIjY77RDCl9e4HO5fwqfnavMQ6iY443TbpsjeQ+XDU9/3fA5VJLxFOvGalpHXDydG+RPYWmj/DuE5zDlrgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7631
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
Cc: Leo Li <sunpeng.li@amd.com>, trufanov@swemel.ru,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit title should user the drm/amd/display prefix.
It might also be good to be more specific, like:
drm/amd/display: Check dc_resource_state_construct succeeded

On 11/11/22 02:14, Denis Arefev wrote:
> Return value of a function 'dc_create_state' is
> dereferenced at amdgpu_dm.c:2027 without checking for null
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 

Does this fix a test case? If so, please describe.

> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0f7749e9424d..529483997154 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1960,7 +1960,9 @@ static int dm_resume(void *handle)
>  	dc_release_state(dm_state->context);
>  	dm_state->context = dc_create_state(dm->dc);
>  	/* TODO: Remove dc_state->dccg, use dc->dccg directly. */
> -	dc_resource_state_construct(dm->dc, dm_state->context);
> +	if (dm_state->context) {
> +		dc_resource_state_construct(dm->dc, dm_state->context);
> +	}

I don't see how this won't leave the driver state in a
mess. Are you sure this isn't a fatal error?

Harry

>  
>  	/* Before powering on DC we need to re-initialize DMUB. */
>  	r = dm_dmub_hw_init(adev);

