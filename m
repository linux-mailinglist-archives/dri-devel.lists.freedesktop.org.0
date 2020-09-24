Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A3276E9A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 12:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B649E6E1BC;
	Thu, 24 Sep 2020 10:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E2A6E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 10:23:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O34M2PhTE8LmN9cY/sNc5395mn/mEku52rNody84886uzoLQOLUn+PUVdrYlChmJbDvkoKLyb6+r3vb6QeODgDomZ1BEFaUwFocKehm7Bg461ViXLMUoVzr1tQNIpfyIYLunoIZP0fFv+tUnnyJocCvBfy0BLCaNC9sDwVJQZLCm6At3Bkf/nCxC1zN18hsCzvjJ0wbAMiFsxSU/PbK3Mw+DAJkvhI8KUKYg3flo/Jjlb9cVtZgMF0pM4x0yUzufczB/92nufL74Sg3suhW6xntDyvd8CS8GWsbxEQ703O8036XrOkTlR6J1yXy88Vp3a/zjIKc435X7PbyOBrjzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6Ogw+3r3dVnKRFZ2B/M+ANVH6QktqnuzJDJjT2t3fU=;
 b=CM/mInTDl7nADZusGfGIzz+ULr3fUHkMixvQp6VNB+mUWd0X2hY08CW649LYSHtJx6iYNnwIYUpeHSqlyJlAmDGGldLvZzXieBCxOoaTby0if/zibB5qvs7hVSmompZSDhze+JdIK9HkqVM9EzrkwvmVgXAWa3K0yZI4rGxXFe9Lwf/RLXXwZCEm6gWiWURGyCR1NafeTz4jyu1FiNYsEKWw6Yt6nH/3iY/m/Eo4ElmN5Bc51Q7sTAIVm/vA8Eodsn2ug/b9Mgl7ClQYb3opq5YKxiNhjOANks2GTEwCEUoZRuRfHAC8CwU92FVVB3FUdophX+gPJahOyVV2zkiPmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6Ogw+3r3dVnKRFZ2B/M+ANVH6QktqnuzJDJjT2t3fU=;
 b=SLBuxXeEKhsh3SXA1iWFdYNuc9wpTB/D7YOZ65wmw2kwObAUdjUBWUOJleAwdJxTG1ufVgz6S820SvShauMcjAs/GhvHGoNcKUiheOEbR83PhRvMwFX/Ylg4CBeRst6z7A0HOQykuRU/U0M8MCkBRd6qMxjUmboqY+88tOoYQWk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2385.namprd12.prod.outlook.com (2603:10b6:207:4d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 10:23:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 10:23:32 +0000
Subject: Re: [PATCH 01/45] drm/qxl: drop unused code
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-2-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a337a9d4-7990-34cc-4cd8-3dec8a7a05d7@amd.com>
Date: Thu, 24 Sep 2020 12:23:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-2-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0084.eurprd03.prod.outlook.com
 (2603:10a6:208:69::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0084.eurprd03.prod.outlook.com (2603:10a6:208:69::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 10:23:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bcc18283-dc44-4b5f-d086-08d86073e314
X-MS-TrafficTypeDiagnostic: BL0PR12MB2385:
X-Microsoft-Antispam-PRVS: <BL0PR12MB23856B5FBE9843ACEECB9B6D83390@BL0PR12MB2385.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MmEH4Zt7R21f4QAJj4XZ50AJH6CQiKDTZ2mDFn4uYNNSSNwVd/ubqsVJBChZGPy2oIIBi8IiVA7EvE3Mp0epTuQkKWrdAvwWN6FVJWiQCUeDdZGCLKRdAVbbthQAb40mTlETwvRvlw4JacwIjwrLNJ8k0n1ACXoWWQVAUvBLXESHmQz+E20QZvWAyFrXx6H2hmTtHg8G+x0pJmAg1j8OP2t43MTqjJLibZ04PUt6eRLxoucNyQHPKTM7wv6mXhkqUnYwPitqyY2jXr5VbXgncLNw7Q/GlVdghLRTYxbItDeo84b+4/lyVxoFIA1oRpUR2k0hGwaA6z3pR+OZ7k68JDiyMbl5mTTPM9BYL0dt8z/0vx++lKeWQdScj2n4DMTC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(186003)(83380400001)(5660300002)(8936002)(86362001)(316002)(6666004)(31686004)(16526019)(31696002)(2616005)(36756003)(2906002)(8676002)(52116002)(6486002)(66946007)(4326008)(66476007)(66556008)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GHA2qA+uRKByMFSx22VphjeLS8amsC9mLG1QSq1E827HaJJN4bdWIZQc5mrhc9kknP2A8s0vIF2EAardAUShE8/ESGPuIY+Nwb9emHATCelJpXJN5xxarH1D3d8tgVLrSrwf1As9noPfajs/iRUY1J3Cm0bupJven5rtvhJcJZ+DOmgMndfsRgQayavgasyW1dKz9Ogzc/nTMIetw3JrPJxFp/Zcn/oDw47+Q3RSe5HqCfU8SRa63VBr5JZfQyXBgnqyWGdkVrCS+NgfO8QkKFKquXIMWdIDy0T5HZHYiLrs86lMY1tZEZARNSyFqzXTtl9pPWN9WmoMz6zgFFbWgcVGme2CDmU4WnK3ow9f8BJRjSoRzUDLcaZnSR7R19pg5EM+wnEbP8ilLFRNVod7quZBxpihJpNFtLhAsA11r5HzncMyGpjaumxty80lWy9L4jM7YNzfUZR3lQO/5h0wN4pXSeH+pP6G13PpJRWLn9UyefQSY6FSvgjL4BCy0dYBPDvHGVrDD6ZtHCXv1ukfg2SnYyT31cPZGXm+jhJASqUil4rpWcnrx9REdB02ItBgjiyAv4PcYz0wPU86AZiE1hlgEImjaQL7Opz4hD8QHEHsp3CXVwTYJwVYM7Gv+mwLeibrDRddMsFuwSKXhhn8il21Qm9hX/sVM+/q7go4Ft43NAKBGY4xqt48EJD9KGpwaBZBfWfPhGqZO6kAxsYS2w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc18283-dc44-4b5f-d086-08d86073e314
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 10:23:32.4410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hqiTSWSFlQ8c+qMcQy7r71fqacUEnhPLsiIMcQaZshX4gycRVXwHpUAlCqQ+7ig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2385
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.09.20 um 07:18 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/qxl/qxl_ttm.c | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 2c35ca4270c6..5738be300078 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -100,17 +100,12 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
>    */
>   struct qxl_ttm_tt {
>   	struct ttm_tt		        ttm;
> -	struct qxl_device		*qdev;
> -	u64				offset;
>   };

Any reason we keep the qxl_ttm_tt structure around when it only contains 
the ttm_tt field?

Christian.

>   
>   static int qxl_ttm_backend_bind(struct ttm_bo_device *bdev,
>   				struct ttm_tt *ttm,
>   				struct ttm_resource *bo_mem)
>   {
> -	struct qxl_ttm_tt *gtt = (void *)ttm;
> -
> -	gtt->offset = (unsigned long)(bo_mem->start << PAGE_SHIFT);
>   	if (!ttm->num_pages) {
>   		WARN(1, "nothing to bind %lu pages for mreg %p back %p!\n",
>   		     ttm->num_pages, bo_mem, ttm);
> @@ -138,14 +133,11 @@ static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
>   static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
>   					uint32_t page_flags)
>   {
> -	struct qxl_device *qdev;
>   	struct qxl_ttm_tt *gtt;
>   
> -	qdev = qxl_get_qdev(bo->bdev);
>   	gtt = kzalloc(sizeof(struct qxl_ttm_tt), GFP_KERNEL);
>   	if (gtt == NULL)
>   		return NULL;
> -	gtt->qdev = qdev;
>   	if (ttm_tt_init(&gtt->ttm, bo, page_flags)) {
>   		kfree(gtt);
>   		return NULL;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
