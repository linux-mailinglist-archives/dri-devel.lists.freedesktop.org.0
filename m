Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618632FD2F4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 15:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E456E40D;
	Wed, 20 Jan 2021 14:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88E66E406;
 Wed, 20 Jan 2021 14:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVhLYyF5LSjddQuR8BCStHDVYkPrG4QyzqS097IYN34qWPxFHis5Sa86RSAn5Zr8FLmMs/g9mQ+CbsJYA7hYTIxWGTiwgnHNLLVTSLfcDb0xdD782LYvrH1aK1HCamOBL8wybkVPZ5W09oaY1Fb56WBkWospIlt325anWkdV86iYD6tbwhHAfk03fuT715FTJy60sfkuDG4cIfZCz4hnI2k3TNjVMQEuPsWYrDEdtucpWR4LsZ715Qt94tBz7gWqht2bexcFkqESKz1xDBkM43AYcAna9BuaGSOtcBCxyn1EP261C5QeJjgVvPCrAg4b9UxJZk0qaIT/5pmK84vZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJIs3wC80mEluZHAF9yGHuc0QrHlmPIoQTp2WpAOJwk=;
 b=lmJG6RkTmmX/aKZyv2zJmT4eZ3/PKZlMJghQPiQMT1WXI33dN0ReXbB93CZupUoRyMej89zulH6bwn2Vni6ZeTqIyVtbQAh3tBuxWjF1xYvbqYXRHBQjxkNjq2+l/B36GrGthaemuSjl1mHhCj4yOKUwtvIoI4QsLdc9IprpkTpvlb9xDF5n1fAKbjui1C/JxU4OdajuIiobTDyAusgvl8M1slt3mLFZFfLPE2k1DkINzSm9pdllV/SMv0zmDslyQFNh7uBHB49UsskLPaqZTblpDdcdRB8oNPZNL6Wz3BzFmVfPl8FFGXe/j/5P91LVJji7GYd7AA8d118GEh11/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJIs3wC80mEluZHAF9yGHuc0QrHlmPIoQTp2WpAOJwk=;
 b=w4QXorGaPdjvHjqz1K+TKl/p3CLDrezIj09J/mr2HPvUACb+9a49+WNgKhLkojH9uGB0ql2XXGZOGDEjywscU7uNwz8rm7BkRAE6Mp4jUP6eSXFeOSZfM2ij6SjfhY+UTUt/+8e/vFiOlbTHH7m1MwGNRAadvu6WyUkSh512rDg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB0205.namprd12.prod.outlook.com (2603:10b6:301:4e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 14:46:50 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::172:235e:14a4:bdc6]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::172:235e:14a4:bdc6%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 14:46:50 +0000
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake of function
 name
To: Colin King <colin.king@canonical.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210120092624.13061-1-colin.king@canonical.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <a06aeb18-b02d-41cd-f717-6ff30ea48bb4@amd.com>
Date: Wed, 20 Jan 2021 09:46:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210120092624.13061-1-colin.king@canonical.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN3PR03CA0078.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::38) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.7.88] (165.204.84.11) by
 BN3PR03CA0078.namprd03.prod.outlook.com (2a01:111:e400:7a4d::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Wed, 20 Jan 2021 14:46:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b6eb747-5503-449c-404d-08d8bd52381d
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB02059EE029C2FA462C06A4728CA20@MWHPR1201MB0205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aNYc6/5eTwHtS4MIJ/C6TGlj83ssXqaqatD3sSMRTtcVTx2XKROSN6ZOeLigp3dzZepUbCmQYYYTsiBBV1L6MkQ1jz53vHI0v8jCtSfhQtkdja5UzVbdmCvkSNOjOoYrazfhakowinFaCMS0ss/oXs+Z1LKbyG9DhqWT+f+shAqKwcuoRqkqDoyafZqokvlx8cs+bpJWKZ7XcIe1QBKKHgjCN64Zthx+Zg/IaF5Ht74kDysatj32mAkyaWFb3RzDIrNvHuySK34WbVf+cwAVZhxCdwSfmZsb0l4G1XOiEHJHmEnxTL4m2uDYsZa5C+9ItHOLAs1Z/C6Stm1eVdIOAr9YdMbT+5GkAG7xGm9fnmLYXtFjKXLzXi2KNObTu2qFoxwMAEMeM4C+EiUwy9MN1FM9vcJWWedtTUqdSTr9lXzSS9BYMypwEwVtJ6rO+3FgPc8c1eC0Im2ZZPHTn733WhM0um3EvccOcXBUF/r2Dk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(44832011)(956004)(6666004)(2616005)(2906002)(316002)(478600001)(8936002)(4326008)(26005)(52116002)(8676002)(16526019)(110136005)(186003)(53546011)(6486002)(31686004)(16576012)(5660300002)(86362001)(66946007)(31696002)(66556008)(83380400001)(36756003)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2k5YzJiVU5QdWUvbHBsUjlVWGpqS2c4SXpaUTdJYlR6dHNvU2hYZzF4N3FS?=
 =?utf-8?B?UnFxTzJRU1hTbk14cEg5TDFCM09VdzFIdW0ydjJjK3ZqeDltM2JlVnAxR0V6?=
 =?utf-8?B?ZUdWVjJPSEVUYmVXcGpIYXEwMmdYWUZSQ1NrQU9wNGFmRGhvQzEzYzZwL2lC?=
 =?utf-8?B?VVhtOFlUd1RLLzFKQkRUZXNheDZhYkFKdkVSYkN4dVpkWjBSTFJzZnBUdFk4?=
 =?utf-8?B?RzdpYVBMZEQvSCt4WnVPdkQ4dGxiSUkwVkl1Um9wQ0gwVzE3eGpsclQ3MWRF?=
 =?utf-8?B?OGRXNFZlanVGbHcycDN0ek1BanBRL3hBbWFaS21HOHJTWXZMSFRtQ1lxdy9i?=
 =?utf-8?B?bDVvblVYdUFKM1lZQ3poMEduSDNaU1IyRk9CSlJpNWFrMlZ4ditSNXlQL0Fo?=
 =?utf-8?B?dTNiWVVjeVBmTkNMTUFvdXF4Sm9Kc29qWDZQem5oMnJ6eWtGUFNHTXFWZVUz?=
 =?utf-8?B?c2lyak1vbmhPQ0JHaGlhaTBDcFhQVUNsM3VYTEZXbzR5VmlaMjI0bVpqSTYx?=
 =?utf-8?B?V1VsNFd3ejNPdnZrbDlQYjh6cFpIREVjUytsdFVrY3JxNnZMNUNyS3F6bVYv?=
 =?utf-8?B?R0llL2JiVWl1OS9lOEJITUt3N2wxNjNhelFsbFdsVHFQQmtJTGE2WWxRT05k?=
 =?utf-8?B?QU01VTlEY01haUo2dWNIa2xRQlRLL3ZqVm9ZdXA5Mng2VjIzOEl2TmEzUVAr?=
 =?utf-8?B?eTM5NU12di9jTHFJVFJST09jeGZ0VlZ5R1NkaHlTeXpIWVpNZThnelVMaGor?=
 =?utf-8?B?WmF2YXBiRVNRUGk4aUlCVERnUDBydEF1NzZVdVZEL0RpdVlYb3BaUVlqS0Yx?=
 =?utf-8?B?TzNpUG42alUrZDU0Qy9RVm9xUjhEQkpDQVRCWGwyOWRRZEZoWlVDQWV1TEVW?=
 =?utf-8?B?ZVJaZjlscjVsNm51Q2k1enlnUGxCeFRuSUtzQmFpcUYrWnFoVTVvdzFiV1c5?=
 =?utf-8?B?SzNEUGhNUkExc3gvMmtxclZoOXNqdG1ybzM2K2UxTVhuN1JwTlZwTDRSODMx?=
 =?utf-8?B?YTloRnlFSWs5SmFqUXgzMW50bTJXY2QwMTE0OThTL3JnQTNqeWlDSWMvSnBI?=
 =?utf-8?B?SE10MnhzUWllODEzenRpRWpJNnNUOXdETTdQdi9qb3E2YVpra2lKMitwNy9N?=
 =?utf-8?B?NnJ0SmxGLzJQcFZ6c29sdnExVC9EZmlWUG1rTTVobEVia25sd2xWSUtnUXhr?=
 =?utf-8?B?NnFzcHhCcnRVN0xuSnhUbkcvSlFJLzhMZytGc2U5alg0OTNjeUZOc3YvV1N2?=
 =?utf-8?B?RkIybUxTK3pCOVZLN1VHQll2VytJOFllZjZyUjZ3V3hFSmszYW5lMU1TQU0y?=
 =?utf-8?Q?MuJJzYj7KZs+vn+P+jL7VoaIGhT660PvCr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6eb747-5503-449c-404d-08d8bd52381d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 14:46:50.0827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCWPFY5yw8PfqY/D1EHfHh/GFRV5GIPPFKZ6CYuDJIJ2qcNYg4FGVQbTb+JdjoHQTf0OWywoSnjoh0inihSONg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0205
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-20 4:26 a.m., Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> There are two spelling mistakes of the function name, fix this
> by using __func__ instead of a hard coded name string.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index c16af3983fdb..91d4130cd2cb 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -1602,7 +1602,7 @@ static bool dc_link_construct(struct dc_link *link,
>   
>   	link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
>   
> -	DC_LOG_DC("BIOS object table - dc_link_contruct finished successfully.\n");
> +	DC_LOG_DC("BIOS object table - %s finished successfully.\n", __func__);
>   	return true;
>   device_tag_fail:
>   	link->link_enc->funcs->destroy(&link->link_enc);
> @@ -1619,7 +1619,7 @@ static bool dc_link_construct(struct dc_link *link,
>   		link->hpd_gpio = NULL;
>   	}
>   
> -	DC_LOG_DC("BIOS object table - dc_link_contruct failed.\n");
> +	DC_LOG_DC("BIOS object table - %s failed.\n", __func__);
>   	kfree(info);
>   
>   	return false;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
