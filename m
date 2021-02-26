Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A96D325E6E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 08:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066166ED91;
	Fri, 26 Feb 2021 07:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914166ED91;
 Fri, 26 Feb 2021 07:49:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chiwwKR68cYfKy59HAlF6DFPidiVg4X8yt9Vd+2lFv6hSai7kcBd+gvVz4Dul7uglWYWs8LZVbKeBWvCu8iSDQDaHPGJT6LDLi3NJ5VZQPcMayqIHV5Kzl96AzPA0ePzNdr/o2GVdQzKYkTQMGptSEzGYvG0K058ii25C+ycydX8Qdl5jjFcNAgA8P7DZ6itxUJq5qFaMCNu6ptuG2LYU3fOIEyoUAhDikBlEcyX+uf102GZbw7zVWiGeYtEj1Ep3Y1wv9Qw7YvkbuU7CRwQpdPyjifwb/YcRlntPbpT9SG8Nb31XQEkkFNqqBe4PFCsC+xs37upWlkSWs3FjHbXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x4QlB798Rm7bFJ8i8H4Is1HqrRV0qbaPOhxttuFK/M=;
 b=doBhqlZUVlvdNw+jZDjC4HemnHK+86o5B7L9z/AMUyCEoTRFSMVbuf1oFXdkttHYLHHCs3hoGwz61Yti0kVM4ciGoyi4Wk9kCp9GJGHmtakip0t1OBPQOdqswucINbJHe8JWm0plOJi6fbhURl8+d7UGE6g/irsRifVWbeSQkZ4YNHp33eLSQBB9wQoRQbngmEomcAmMULz5GZ8EVimFMpn5qg38WLIWZyB30oQnh9Ejex8UFDaRm2OUoxrkFdZmoDFoXc9prsJvum6A7wq13n4wSv8iz99mydvqEF3Yjx+IGGqJgpUPMTFzWXrvgpXYGk/tcjiT1EC5jbbYULtCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x4QlB798Rm7bFJ8i8H4Is1HqrRV0qbaPOhxttuFK/M=;
 b=injALVq0px9Y1Xx1teWqklFDNnEV3hQAYhTVN0c13ZAsK9wENxJMqFo/OD6QQzMTBRtarhq5kFgnc7DrP4VE+jBEzWatReDX4ELZC6zcLhAtyQ/RIPUVWYkANvfFNE3RatkbiOKxiH3lcQXBPlpdT0Sm63UseMP6TsKnwXKI7v0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Fri, 26 Feb
 2021 07:48:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3868.033; Fri, 26 Feb 2021
 07:48:59 +0000
Subject: Re: [PATCH] radeon: ERROR: space prohibited before that ','
To: wangjingyu <wangjingyu@uniontech.com>, airlied@linux.ie, daniel@ffwll.ch
References: <20210226060528.12964-1-wangjingyu@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <170cf966-2248-605a-d640-8e574f94b419@amd.com>
Date: Fri, 26 Feb 2021 08:48:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210226060528.12964-1-wangjingyu@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:bcf6:4057:c09:be71]
X-ClientProxiedBy: AM0PR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bcf6:4057:c09:be71]
 (2a02:908:1252:fb60:bcf6:4057:c09:be71) by
 AM0PR01CA0088.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend
 Transport; Fri, 26 Feb 2021 07:48:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03fa274e-a9df-4e79-db7e-08d8da2afa3f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4047A2E9FB045DEC2AF34473839D9@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzsJAppDOdPcSQ2yKn0I5UzijHVmXF7JXzJgOvTV1oCZH7ztIbj7aVQiyEZeaCel3Hfa+V8lux9rMjHbl+wmPztJ7a/XVRHeGjYIh/ni3CVLDBAbBmiB/KxOCISFxu+HokTb4kSPVLQBcQ59UA1nnCnMT4H0BKy4/rZRXcqSZfGHewutMw+XPm1QZm2Nij2LZ3rv30TDGYlMM7f2EfuiIGVLhBFZdKr1fnU//y1jNjhPaPyElfjpGsmSB8DpIZiWMLnbdpHmvGxco9g0s0OM4dA6T0BJ5WEbP8lkSnWVrTI1idpjB0Py2A1dnx1Jn7DtFSOdvgL3VwxU90nG4Z1pcKbNMB9au07Vpa8FC07YRf326aBmV6+x4cDnmemoE4aBNwOpqeoMwAYpQOBBIUD+FsEDmRY2rV1SVs21ge5zHB9x1n6yZxvywBp+QOC1AdQa4aytwPmzGWZP5ULO1kYBVEtM37UwxIafe9c+BXGc40TnmPzvK0QIMadsO32jM8jZXTFoie7jxvBSIDAxNgtsI7DF1fZIvobO/yg7sn0QQ7tlEuO5iUYcRZBRkpdfN3UwDkRsgG9TtQkSajhqW79AVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(83380400001)(4326008)(478600001)(186003)(2906002)(2616005)(36756003)(66946007)(6486002)(31686004)(16526019)(5660300002)(6666004)(52116002)(8676002)(86362001)(8936002)(316002)(31696002)(66556008)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDBrR3pXalpHWE16R205cGpTYTVIT21iMDdadWdKdmExMGZUUWFWQlNHZ2cr?=
 =?utf-8?B?TjBITmxYS3Z1SG9mZzgyVHdhbVAwY1Jnc0wzS2s3SXc1cHZTUmFMMzIwaWlE?=
 =?utf-8?B?WmpEWXd1UTNaQmVWTDdMbFNpdTFFbkVsWllzQmJxMnJiaWZuQXBnaWx1QXcr?=
 =?utf-8?B?RTZELzY3ZTBlTkk4aE9tUStZRHdmMWxpTytDWTFhMS9YOWJLeDdsUW5MdDE2?=
 =?utf-8?B?dVRuWVY0dVlvclF2ckdxSzVIV1Vpc2ZIZDB1czRpTWY2QXJPTUdiNmtRR21h?=
 =?utf-8?B?WHlRdUd2QThxYkFZYjREOWFNRXZtSlFRcXlRSUJHRkdaZE5kbVpOUkx2VTRz?=
 =?utf-8?B?MHBEeWVqcnRhYjhZayt3bEFUQkFIQ2p2ai9TemtycjJoQUo5UFl2cWZJZnRm?=
 =?utf-8?B?RW5Na0ZEc0lXOVJsVHZxdlR0OUxnRk9SUWJOQkJaUldqaGxoZ3lmclpOSlBI?=
 =?utf-8?B?NFQralE3b3BSdDN6MHQxNEtKTFFKM1dlOTFuRXdSVkIzWjc1QXFORm85b3pn?=
 =?utf-8?B?V21tN3JhWTdWdWpJbjhmRVdMLzY2LytZM0xQS3FWQnB5VUNBMnFDWEdJenpY?=
 =?utf-8?B?SFdidTkzbHZPSjN5U2VhblRZYzFJejM5NHh0THBkckNtbjdYQlZuN0VTYUwv?=
 =?utf-8?B?OFRpVDVDVTNValc4UDZPQWlIaGVWODBPY3NINFc5R3ptbkdTVDd5amlSQ0U2?=
 =?utf-8?B?WVd0cnVwb0dUY1c5Sml4SlQ5SWU4bk5sdWJKVUF1Z2dId0E4dHRxK1FWTDJ0?=
 =?utf-8?B?OWpRVE1CdXNUTnMrQXFYL3RXNTZ4dkdEMEsxQVhUbFBWWkhKL1FITHdOTjZt?=
 =?utf-8?B?NVpwZCs0MUZPbHV6Rml2cVBDTUZjTmN3M3UrSkd3U2ZBS29wTTBYUWNoZzNn?=
 =?utf-8?B?ajFOWTJXZ3RuMjR4SGhsMWxlRk5rZGtoUzNaS1VqaHhhV2kvMWJNb3BRbW5t?=
 =?utf-8?B?K3k2cDBKMGZ6ejRJRGxMZUZYcjBRYU40Rnc5MWZjalhKeW9DYTFDWGtiUnov?=
 =?utf-8?B?R2FqVEQzTHlPU1cxbGtSdWVxemZYR1Bpb01xdVE4YmRYT25odUE1dXJ0VTRX?=
 =?utf-8?B?ZzRoSnVPTVJKOHZDbXZ5MnRFcDlBQU5BeW4wOVR6QjJVWTRULytzVlZreHA0?=
 =?utf-8?B?WnFsUGpCTkFKT0hwc0FQczYrR1R3M2pUdmdqMHdaQko4WTBxN1cycmdPY1ky?=
 =?utf-8?B?L1RaUzkxTUlCaW1YYkc5WmRzdW5pMFRQejB4ZmFMZmhiNXJ6dGcweWp6bllB?=
 =?utf-8?B?S1IxcVVhMGM1MjZhSDJjOEtiTG4vbUljR1ZZWDJSMnEwWkQ0TmRoUEdwL1Nx?=
 =?utf-8?B?T2RkQzBUdm9waWRpTEJTcExYekhUSFNVV0xGTzJEcHdERnB1NlV6ZzB2Vkpr?=
 =?utf-8?B?Ymx3SnRuMHJmeUluQXRkbHYrNVlpZWxLTEtSRDJUenJ6cFQ4RHROSFVIM0ll?=
 =?utf-8?B?Rm9kU0owY2txNDJxRVNQUkVCbExweGhXQ1FxVnV2clVsSWorbWxxWTkvN3k0?=
 =?utf-8?B?QlR3Tis2YTcxN0M5MlN1TFhuSERZUWdmVTlNalE0ajY2R3owTkEwVm9mYVB0?=
 =?utf-8?B?cFdrQnZ2eWFSdXJ1aGFEVkJqRTBiRHdTN2ppSVlua1dsbmtSTWJPVmlnMVlB?=
 =?utf-8?B?Tldsc00rbmRSbXg4Q29vRlptSm14VFVlMFlacXpRWHEydEtCWTd2Q0N1WlFx?=
 =?utf-8?B?NWVZSktWL00vS0dQWmI1YVF6ZktKUU9LckJqbnBLbWt5eit0OUg2Y3lzbDNP?=
 =?utf-8?B?RXFRTmk3R1ZEemxyTkExbmZhamxkOTVBNVZPRnJHejhKMXpHeHBxb0w0NjNx?=
 =?utf-8?B?M09WNTVCOEwvZG1mWDBpaUU2SG56UnVHUzVDcFptMHIrdlBFVTlRZHdtQ3lw?=
 =?utf-8?Q?WAAhe4E6kB7LN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fa274e-a9df-4e79-db7e-08d8da2afa3f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 07:48:59.8073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iViIb0aKL7bjqUauYo0OMQvNswGclt0pnZqFyQ59AHd0hJttPFh3xuOgmvYhfzR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well coding style clean ups are usually welcome, but not necessarily one 
by one.

We can probably merge this if you clean up all checkpatch.pl warnings in 
the whole file.

Christian.

Am 26.02.21 um 07:05 schrieb wangjingyu:
> drm_property_create_range(rdev->ddev, 0 , "coherent", 0, 1);
>
> Signed-off-by: wangjingyu <wangjingyu@uniontech.com>
> ---
>   drivers/gpu/drm/radeon/radeon_display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 3a6fedad002d..439d1b3e87d8 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1396,7 +1396,7 @@ static int radeon_modeset_create_props(struct radeon_device *rdev)
>   
>   	if (rdev->is_atom_bios) {
>   		rdev->mode_info.coherent_mode_property =
> -			drm_property_create_range(rdev->ddev, 0 , "coherent", 0, 1);
> +			drm_property_create_range(rdev->ddev, 0, "coherent", 0, 1);
>   		if (!rdev->mode_info.coherent_mode_property)
>   			return -ENOMEM;
>   	}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
