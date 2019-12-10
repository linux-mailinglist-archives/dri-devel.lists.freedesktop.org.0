Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB001191F9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7716E179;
	Tue, 10 Dec 2019 20:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760050.outbound.protection.outlook.com [40.107.76.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C666E176;
 Tue, 10 Dec 2019 20:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixkWlwjs5SaChlehXYg0ZhubwqjE54XeFJywMvSB5gLONFvgVh8yrWgsvalgUQl/hOF/RSTtZgsIXAK447TBDpot4NzUlKB0Z21ef5aeIJRkpxW3Dv0VXQrkbe9BfX2EgoE3PG6XFC0sawDpfRckfOv170NAklI4AhdSGAUp1+XqLkpI0L6+/Z0tKGyV1P8NM4toKibJpYc892oI624uCylAEuWLyqj/OQpxwmmYDeclSI6DI940EZAxv6N/NsA1i2XxOQ8UU7w+oiwi8ne8UjeSvfpT5HdqPPRCArbhHyRmd1dMBPMDhjtcQ1+Ob9O4G8u9S3fvDGAMu5vF9YnBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCyvppKbKI0qwsCNf/PsfxLZC0SBZCyE6Yrsf7k+GlE=;
 b=Ndbk4+J8k3HSQ5sj6RaP1Sk7fz2PQ7PkXLf8Akhc8s4Z8Dm7txx2B50lX80ik9bYlNeQfMM6hLzz/w430IPCcgKf/XwL1a2GZkjkASG1R8j2QV9USIpPKzP94Hikt7Urky8bclv0/QcXctXrXeuqFGw27sBOi4PkLaw73N3ss7Xo8MZCIEkme4xvmt4ALAsjTfsOqxdJV8C+F9LsyYAfeMGEdbd2a/OryicicXMAQNt6xcqGIA5r/5a8TbKcwmy1hx7NBAcjIV9D1FtwlfgPC/iK+IUewgfRBM2EKvZBKfpV8lWY5xZXVptHWD1fl82mweGEGww3USou6bg69g/bTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCyvppKbKI0qwsCNf/PsfxLZC0SBZCyE6Yrsf7k+GlE=;
 b=QIL3h0O4IfO75c5n5V7YQsQq2GKzcqm4qAPtpsZc13iFLLK1R6R7RPjwu9udm5SmTz1EnfiVgzfe8z1nEPC5QFJLKKqITu3oiMtjJJKF5PCgFssDjPjAIZcFb0YIZY/CNztIZ6z9gEmeYCENEGHPhs+nuwuVlaLRrTpQJPHEKUU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2744.namprd12.prod.outlook.com (20.176.255.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 10 Dec 2019 20:30:26 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::81f8:ed8a:e30e:adb0]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::81f8:ed8a:e30e:adb0%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 20:30:25 +0000
Subject: Re: [PATCH] drm/amd/display: include linux/slab.h where needed
To: Arnd Bergmann <arnd@arndb.de>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20191210195941.931745-1-arnd@arndb.de>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <cded03ab-40fe-a904-7b1f-5b3623bb7af4@amd.com>
Date: Tue, 10 Dec 2019 15:30:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <20191210195941.931745-1-arnd@arndb.de>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::28) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 887df509-16fd-41ff-be5d-08d77dafc9bc
X-MS-TrafficTypeDiagnostic: BYAPR12MB2744:|BYAPR12MB2744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2744545568DF8001C71C663AEC5B0@BYAPR12MB2744.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(199004)(189003)(2906002)(36756003)(4001150100001)(54906003)(52116002)(2616005)(26005)(53546011)(316002)(6506007)(81166006)(81156014)(110136005)(8676002)(66476007)(31686004)(8936002)(478600001)(31696002)(86362001)(4326008)(186003)(6666004)(66946007)(66556008)(6512007)(5660300002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2744;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PhVw+sDhY+X6TWmj8G1oWP3GlXom8fireg8F24HBnvkORYa2m0LfHN+W0Q2a0uWZlweH4xl/RD9zvfRgy3XLwqnybfqyCMiQt4sXUqyaTnC9Q92t4bQJgzMldt+YpciPR03Mvrbl9DcJPHYaWEJzLtNkiN2BvJIzlXdQwbxdYyzOPNHPs4pAqeqFOL6pRHyTCjpSqoviCSUvScPnlDUq3VYyOgFDi7njzMQY4eNooLoq0DCH/QV5C0BwtQO/3HgEqRw7AX4rZNSYRCN7Y+8Zx2THzdMYM9Sfjn4Zs7PecZwqIZrDrdQO7XlGfpMWolLooG8brtZmaP96gyDB4X/bdkf5peP/1fkUGN5eLky21B+mDZr4C7qYOjBAqxowyfr3yjg77Bc1UPNCO4BCm2b/B8n2LqjayhL7t5FndfRJw7l/mDGPGKDYn55gbofF4qtH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887df509-16fd-41ff-be5d-08d77dafc9bc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 20:30:25.7041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvmUZm89pFyTxanMR3yIaoqnIf1ESN7jQ8YpEzDim+l3hT8wtlMNquy8zLj76sVrDiVeIHGvqArYva5QDjgipA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2744
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
Cc: Eric Yang <Eric.Yang2@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Roman Li <Roman.Li@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, amd-gfx@lists.freedesktop.org,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-10 2:59 p.m., Arnd Bergmann wrote:
> Calling kzalloc() and related functions requires the
> linux/slab.h header to be included:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c: In function 'dcn21_ipp_create':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c:679:3: error: implicit declaration of function 'kzalloc'; did you mean 'd_alloc'? [-Werror=implicit-function-declaration]
>     kzalloc(sizeof(struct dcn10_ipp), GFP_KERNEL);
> 
> A lot of other headers also miss a direct include in this file,
> but this is the only one that causes a problem for now.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

What version of the kernel are you building?

We have:

#include <linux/slab.h>

in os_types.h which gets included as part of this file:

#include <dc.h> -> #include <dc_types.h> -> #include <os_types.h>

Nicholas Kazlauskas

> ---
>   drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index 906c84e6b49b..af57885bbff2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -23,6 +23,8 @@
>    *
>    */
>   
> +#include <linux/slab.h>
> +
>   #include "dm_services.h"
>   #include "dc.h"
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
