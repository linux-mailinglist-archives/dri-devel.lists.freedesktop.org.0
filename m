Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FCF28CE8B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 14:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBD46E3CE;
	Tue, 13 Oct 2020 12:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6966E30D;
 Tue, 13 Oct 2020 12:41:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRBB838i14AS9DvYcr0jikoBgcGS09aQG+oLz/zKZ1rwsLVq4uieEwt4eCKAl5UtcBNRQ5VxUyvjAOsIU5Wq05tD1NCoglOzg3UhtRoXPfOg+FYDffhvsKkUEsAZvdctwynJalmUkL1tgivhVwmABLUMcaKBriFGHNgM9aZ/mxfXiG9SQsI7M468uDMRYsSOc//Xzf0zV/1g/7xwInpl71KfBoizDuE2XvfnNWVjPB76Z9HPHNDH+5nRtmRzNd9sfjYs7NoHULTn94Z4rKaIL1a5ORmn1ufOjVYGJ+j7FkkJEeUFDmbcz6AYBQhBkXqo1cuU4MDUWUx3nrZ1sllI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFzoAspnzrGSlxB4um6wmOt6wviJg+HS0xcX+sd2tqE=;
 b=BJik+hVxuHtKym58J0oarAS4ZuS9DU6osC9OT2Xk5LSCcZn2JIlkrW2Gwortar1q8TwCJqisXFN1gxF8LeR2aqyXAbymfNWdyFZyVTnTF5WYeQmq7QBKZK0YElVm6mWQ+XFtU2DBI5hmzknSg+tznGF8LRfM3myGfcN5JnBvdMrnX63Rdleh6upR9A1rSByr9VCzElgJos7z6gASmVtjs2+W++46TUf4UXXRBfhNEupatYKYKy8DTrMXjJ5qiBmAiIK248TQsIAdpjec3aKXOE7nNVKdq3fouUHaVpaBwuJY3UwB6PFU6jflFpiQwvrXZ+VD+Ja3d6HyURBAWm+OjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFzoAspnzrGSlxB4um6wmOt6wviJg+HS0xcX+sd2tqE=;
 b=FUD+FvhD1GB3SSPJ0H8LKWmmCcqgd78xkvIzOr/Ew/YX8YdYfPWv1GVXGWqKpcrKwEZsq+YPZaXgu1lHKfrEgFncD/sMNMg0PGkPN3/QH7JYWMl4qoRfk1e39a6FG3HP4N3zICVU6SjPTsuaHAjTgIvBRgjVDzBMsklU5G7uNOw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2419.namprd12.prod.outlook.com (2603:10b6:207:44::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Tue, 13 Oct
 2020 12:41:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 12:41:40 +0000
Subject: Re: [PATCH v2 07/24] drm: amdgpu: kernel-doc: update some adev
 parameters
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <e8d8081e713010edcae2414427fec4a497182fae.1602590106.git.mchehab+huawei@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <50178896-8166-0912-c3b3-5671b72740a5@amd.com>
Date: Tue, 13 Oct 2020 14:41:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e8d8081e713010edcae2414427fec4a497182fae.1602590106.git.mchehab+huawei@kernel.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.12 via Frontend Transport; Tue, 13 Oct 2020 12:41:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c44a1aec-a579-450a-210d-08d86f7554f6
X-MS-TrafficTypeDiagnostic: BL0PR12MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB24195C3749D765664F86C65F83040@BL0PR12MB2419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:304;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yJL2/hyRavGiweobgi2ETv/bwf9Rk2lJKu03qvVDjs/omarMkdb7IPMZkPjCRd75mMB2WAdwllYx6snKxUoAGaAbpmV1byD9OgcdPUcMYU5ksempIJxtwjXVAo4szn0HhGOk8uRhqOOS9BpQAly1yEX/p1PT+ULvnmq85gHE2BmwNxt46X0rH2rTYw/XUMu8dE8PVwKRA0DyDMx6oyLkfijYxTzY6hP6ViudmHqqskw1mC2heHKd/eHiT1ohRQsuRnJZNESPws59lU4NVqo9opzM0joZRR/wMCrPbMtL+/A+DLwoy4U3rquVXPG9hueboOi4QCSPXbof9FjB7IqOYPVGgtF3qYk9j/QG1q2fPgRS8ZUj0duKAdMvriuW6AQP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(6666004)(316002)(66556008)(66946007)(5660300002)(52116002)(54906003)(110136005)(15650500001)(66476007)(83380400001)(86362001)(186003)(2616005)(478600001)(7416002)(31686004)(31696002)(6486002)(8936002)(8676002)(2906002)(36756003)(4326008)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: iGbubkCwWsuMXud1JJe2cgAuYD18+ubzQ7JGJLUZNmQz6Ksf49UK/3TI007ZMnuev28oQLFQ/1i8Rq1WKu1LYfujGwAd5ylYis0F4NXklbLQSk6ma/neJ/3t+TAZ7ZhLcqM46CH42xIVa7uY+zhbuAZLlatNzokPUZFM+8CpI2s+gXMj4/I/ahr/M69Rcu8PYh98ghz2u2ftEPFE2Ds8nQ3De7LvL99OBzlQCJfj0biOMZjLNFYrq42AfqZ1DsHxT5qiNZzMkXhAiz9m8gsD6yXzBPWynk/zl/+PvTtWpl3LZpoaKo04/i2Az+0S18I5JCeH12OK/qUKdcYIHcylYk19RXAKP8LArAogEmEFTnAyRYTgt9GAXjjw3bLECClM9v3nlI2fg2ASK+ibnKt/A6fVjDtEdzj+ORjjQu7W9lhy6meuxzJy8YzocFkP38GVl99dAnNRDqXAbOGgBEK6piRaPJPtnDMx6rKPf1Kn+h/Nc/1DAaXf1lCo8Kqd07waGQ+sjvk4U2l7H37hq8AMMoDdazJi8A3cEHP1/hasokQ1DwpyobThfxZMxFA0WzMIjtrXs6c34WEyFTM6jLgyGfcXUod2et3yR19geTYTuLJEXM/pZKxYbbneBYdigSRvZmkNvCgbwRXb8ncw2Qp45WraFGFlZduidG5SM03yQYpg1Oz+fJS3pdXeskr8y/zlo/vPByrifJCBHU8z5Ko0rw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44a1aec-a579-450a-210d-08d86f7554f6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 12:41:40.4366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZvPW/yrn9rMXB5OCd3Vixejn6DfcFrcON5fwzVK+EXZcu6vc6TEmEA/1tNJXWu2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2419
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Colton Lewis <colton.w.lewis@protonmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, Evan Quan <evan.quan@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.10.20 um 14:14 schrieb Mauro Carvalho Chehab:
> Running "make htmldocs: produce lots of warnings on those files:
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'p_size' description in 'amdgpu_vram_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:211: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_fini'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'p_size' description in 'amdgpu_vram_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:211: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_fini'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'p_size' description in 'amdgpu_vram_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:211: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_fini'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:177: warning: Excess function parameter 'p_size' description in 'amdgpu_vram_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:211: warning: Excess function parameter 'man' description in 'amdgpu_vram_mgr_fini'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:90: warning: Excess function parameter 'man' description in 'amdgpu_gtt_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:90: warning: Excess function parameter 'p_size' description in 'amdgpu_gtt_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:134: warning: Excess function parameter 'man' description in 'amdgpu_gtt_mgr_fini'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:90: warning: Excess function parameter 'man' description in 'amdgpu_gtt_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:90: warning: Excess function parameter 'p_size' description in 'amdgpu_gtt_mgr_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:134: warning: Excess function parameter 'man' description in 'amdgpu_gtt_mgr_fini'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:675: warning: Excess function parameter 'dev' description in 'amdgpu_device_asic_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:675: warning: Excess function parameter 'dev' description in 'amdgpu_device_asic_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:675: warning: Excess function parameter 'dev' description in 'amdgpu_device_asic_init'
> 	./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:675: warning: Excess function parameter 'dev' description in 'amdgpu_device_asic_init'
>
> They're related to the repacement of some parameters by adev,
> and due to a few renamed parameters.
>
> Update the kernel-doc documentation accordingly.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 6 +++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 5 ++---
>   3 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f8f298b34805..fb375752feb1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -817,7 +817,7 @@ static void amdgpu_block_invalid_wreg(struct amdgpu_device *adev,
>   /**
>    * amdgpu_device_asic_init - Wrapper for atom asic_init
>    *
> - * @dev: drm_device pointer
> + * @adev: drm_device pointer

This should probably read amdgpu device pointer, but apart from that 
looks good to me.

Christian.

>    *
>    * Does any asic specific work and then calls atom asic init.
>    */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index f203e4a6a3f2..5f3a04cd0fba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -81,8 +81,8 @@ static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
>   /**
>    * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
>    *
> - * @man: TTM memory type manager
> - * @p_size: maximum size of GTT
> + * @adev: amdgpu device structure
> + * @gtt_size: maximum size of GTT
>    *
>    * Allocate and initialize the GTT manager.
>    */
> @@ -123,7 +123,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>   /**
>    * amdgpu_gtt_mgr_fini - free and destroy GTT manager
>    *
> - * @man: TTM memory type manager
> + * @adev: amdgpu device structure
>    *
>    * Destroy and free the GTT manager, returns -EBUSY if ranges are still
>    * allocated inside it.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 01c1171afbe0..a0e787ddbbd7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -168,8 +168,7 @@ static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
>   /**
>    * amdgpu_vram_mgr_init - init VRAM manager and DRM MM
>    *
> - * @man: TTM memory type manager
> - * @p_size: maximum size of VRAM
> + * @adev: amdgpu device structure
>    *
>    * Allocate and initialize the VRAM manager.
>    */
> @@ -199,7 +198,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>   /**
>    * amdgpu_vram_mgr_fini - free and destroy VRAM manager
>    *
> - * @man: TTM memory type manager
> + * @adev: amdgpu device structure
>    *
>    * Destroy and free the VRAM manager, returns -EBUSY if ranges are still
>    * allocated inside it.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
