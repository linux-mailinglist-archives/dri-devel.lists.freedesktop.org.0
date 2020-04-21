Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861701B1F9F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 09:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5616E8C8;
	Tue, 21 Apr 2020 07:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497066E8CC;
 Tue, 21 Apr 2020 07:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDl5fmA+5cS+b34ZqO+3mJ7YzKKifh+sL3T/msos6WHsaLqFdbGtlJYr0Iesa3IXs9bkGlKhZh5AM9I/xic4bm5sDiBQqQRXswPGEPnEt0P34F1EHQzUFi9nl/P45AOhdjzEizqUP4si/ymZcql2oZ+8DtxWGyEr3KW7+r1DaUDOqE77+zaCrI73gtzA51V9PBcwzScfmfj+ci4M9nc5QhU8FtMp6bXB9c2abd6PlNUXabWx8m3XAOfRhat19Fxt5fvbVkcW/qP7415azOoid/LYmwES0V3z7UHlA8fEpZ7aklW+yxsS2AETYHrFT/ud53X2fzNcJHJZ6NKM/LA3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGXNcJLW4jk/g+Gp7QI3GcaXDANKpNcHrQATgsmfphw=;
 b=O7Tt+PFEAzEcfC+XYsif1zr5XM+t/ZxVC2dx1YkeMaFC8t5GBFR+/UAS4FYZ2nviOJ00SJH89nHae83Kf8iMQYVXzLW+TCY+6ZfhS/bPZodK/PnLT1OJV6ZpMgNQi/XXQeHtIi21YyFsVraiW+nd/SccqCczmo8ei5xFlZdJmpTwbLZpWIGa9oawrPMx0cdd+k04MR6NJZTFoXpzL5ByelqQczCi9C1MMRbebDDoP8p9aQbNJvKN79pq+yyU/kiUrRuLp6jSkRY88YL93rR8ayHKAbdIde+jbVilTFyVVMI0+9HhmHfiBRaxpg4au+mNdIxowFTPMf+yzMzIvNdSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGXNcJLW4jk/g+Gp7QI3GcaXDANKpNcHrQATgsmfphw=;
 b=qFZMqD/Bd5PVnWrASDQdlnsDwE/Piu5N7zuUK8KI1Y9dAFj9SFg6Udarlq+jki9DI5/VjAD+0pGVhmjBvFeJGb+jXDF/COmdGa/ap0QlJqjARqaWBlXkwcHhlBibVXcdMgzvWJn9AvpsuvZCp9k19mkRNQQdJ6mljBj67Ln8m1w=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3851.namprd12.prod.outlook.com (2603:10b6:5:1c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:15:20 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 07:15:20 +0000
Subject: Re: [PATCH V2] amdgpu: remove unnecessary condition check
To: 1587180037-113840-1-git-send-email-bernard@vivo.com,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200421024159.126753-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <35ff841a-c3ee-d127-adbe-2c2c54880aef@amd.com>
Date: Tue, 21 Apr 2020 09:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200421024159.126753-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::38) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0025.eurprd07.prod.outlook.com (2603:10a6:208:ac::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.10 via Frontend Transport; Tue, 21 Apr 2020 07:15:17 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 519f9509-1a0b-45b9-d965-08d7e5c3bfe7
X-MS-TrafficTypeDiagnostic: DM6PR12MB3851:|DM6PR12MB3851:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3851201221D4330847B7D67C83D50@DM6PR12MB3851.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(5660300002)(6666004)(110136005)(186003)(4326008)(316002)(2616005)(16526019)(66556008)(66476007)(66946007)(2906002)(36756003)(8936002)(8676002)(81156014)(45080400002)(6486002)(86362001)(31686004)(966005)(478600001)(31696002)(52116002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qB4e1B6U8zUTdQ2A7Az/qwN4w36JqMDPmLaxlm4PT+xfOM3LZ6rQGrc4u3Wk9EDsgvBOGOu40Ic2UYPJKq4ld43HR4ekA0OJeYvJtDjy/EL0dciC/zyVp/DqhUy6nPn4pChZZUom/eswS+V2jbmev4PqF95pt62sNEVN4locmHB0rTP6aa/kcabITx34Y7YQ6QP5SjrNPNj30HE2JnYEQmJiHD8CvvddPdC8tuEFYuuO2X0z6VPPwJfUKnh1SD97fHSzL9eZAE32xFlYrlaPNDwHlj1wG4yZLcedYTjMXFGupau+Ff34EsiMY2jzWn04G90WOEVlzcvRWiuXTt2uVkYXvktehlAXjyjzUsqw6bVzwNf0D3pzBPksjlQ9fYbfBD2UGfq2k8sgDnkJPGU+H937I8hDbbkC5Of6lxNeDLfzdqgrvftm9YaK0A4Y/zCMYPT4uubFZsVPqLHXSEStcrm/m+3g3MPwz3zjBmuAw6BiVrvrpX14nWsAbSRz6QO2JsLNSLFsZalbHGzqTIdjKQ==
X-MS-Exchange-AntiSpam-MessageData: PAzhmdB50Eu4Skt7R17WafxRwO8WHlvNbx0CuzVOiqQgrkQLlx6lF4lxlu7qiGhtLLquSBJd/plTT+HwGh7a1AfLDKc5O1XP1G26EoyGp21JZYzvBq7+W9rwRnV2Led97CHE2y/gHg7AtDf4Qhk/naZ0xvcxNSN/2Aj/s7Tpnbs2cSHlndNu3HWetuHALW+8GyXzk0N4YYDAxZT6gqJhV3aUCq4xOgyM8JJCFNwEVIEqI6OuM8h0SnGys4B6hI0Le+LmLyyNMBr27pdX0V1bHg+eSab0/lqA8VEHVQqHROK6IWeTz5L6b9etUNtuCXBFhdYaaKiAQ65OEycBl2EoHA+K+hWOMftiNfCvArwwvmy93Ypz13faIvs+M7K3i7U2Kipl/2nMwQ9ocQW4fSH2/PkyJ3Mqx/nkojZE0gPJWoqbmt1qlNTlWf/2pVfdbR1WkzPAjLkx43xbMIU8zRBjKZvi+qQVEbsFospDekwhlTYrtnv7htsovKL1qaCWTu/NTbtaThz2pjpMxBkmxPjIlfNQBU62peffmmEnRl07GhJGCN3RzK20LrkG6B9LcFRK6pPmtZH6MKVHhBXIQqOuUt8bt4SMtffdvynA3ALdzQW5DVsLYyeR77U6I0X1xydZprB6qdE+6eBPaljfJ+2MULKlkR51tGeJL5xmAcoOBk1FZ5EdFMOECrJD4V5ksECYE5fKRtmtQtdbaNtMYhxhGtrGcdSzk2Q3VPurIwm+CPqRWNYt7iw33sF7XsqOfieXgyvuvYFIdC1ja4iho11u/ZZeOHB3V0WYofZ4Et8g7Ktmy9dBD6iN8rVMTL4t1b78U8YOCt2e9COdQ8+XVbpC/uyKhUofaUwZEsKUFmL7G/k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519f9509-1a0b-45b9-d965-08d7e5c3bfe7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:15:20.0267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWU7lFe+9ZbeZfNPrPHJVzEoY9FNGKhDQRK3gdBLGCQ8dINb1YN9GKUDRlwLFmwF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3851
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.04.20 um 04:41 schrieb Bernard Zhao:
> There is no need to if check again, maybe we could merge
> into the above else branch.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
> ---
> Changes since V1:
> *commit message improve
> *code style refactoring
>
> Link for V1:
> * https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1226587%2F&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C50bb3a13f28b4e5d787508d7e59d9903%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637230337359422169&amp;sdata=LXUJgHOxfwSpacdW6suiI00z8egbRC3z3za0H3XtNV4%3D&amp;reserved=0
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 9dff792c9290..a64eeb07bec4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -660,13 +660,15 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
>   
>   	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
>   				     false, &ctx->duplicates);
> -	if (!ret)
> -		ctx->reserved = true;
> -	else {
> +
> +	if (ret) {
>   		pr_err("Failed to reserve buffers in ttm\n");
>   		kfree(ctx->vm_pd);
>   		ctx->vm_pd = NULL;
>   	}
> +	else {
> +		ctx->reserved = true;
> +	}
>   
>   	return ret;
>   }
> @@ -733,15 +735,15 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
>   
>   	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
>   				     false, &ctx->duplicates);
> -	if (!ret)
> -		ctx->reserved = true;
> -	else
> -		pr_err("Failed to reserve buffers in ttm.\n");
>   
>   	if (ret) {
> +		pr_err("Failed to reserve buffers in ttm.\n");
>   		kfree(ctx->vm_pd);
>   		ctx->vm_pd = NULL;
>   	}
> +	else {

Please use "} else {" here.

Christian.

> +		ctx->reserved = true;
> +	}
>   
>   	return ret;
>   }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
