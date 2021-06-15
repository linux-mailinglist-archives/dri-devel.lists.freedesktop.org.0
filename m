Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDCD3A890C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 21:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD496E152;
	Tue, 15 Jun 2021 19:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F546E43F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 19:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMKm/e9+K71NJboAOYHWk7TZLUlejAKyQAEH+GkKuZbKZbvuc5y0Y4DP1nrM+20BEHwzRvbrZx9BvymhXzvlOebnDpmdcD3G7ua5jJ2qFWcT+276mWAsthgWdYrkbNSljRVufQ6K8/fv3nEAWT63AVR9MRlrn1vb9uaVJtdOKeJ5R9pwudX+ALm0A483CUwPhYylQpGbkXYIqw8mcEZvlmNFjEYX89scNcC+beAaxMfEUZC0Vx/9V2RwvMvjsc1HG4L24P7TyyabZZ/rNlQzH1gsYosb5r/mMH+5B0UdhEnilp+Y0q6/pno41fBY3jICgXvEOLQWmEbYvdcgoz4qCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8v+r8x/x2fE6DrgYboV+n11inrLk09q8INLlcJfDoc=;
 b=F6FYKY8Sao0O8TiVvFl8p27DS1m5tQjXP/3apNcUleTHMltOAWBKPvYvgo5KKSszRXyBmj4LfnCdh1roi9Zu4BiHXFpW7BZSAJGObeYWn7zuyHX+Y3sIob7D3F/95xS/MgiLgSL4Fp2Tk32TE9Wt80NqTcUoM9TmyOcmvB5ky5hjxzsMMQdd23pDptbRBzG3lDWrq2oJXAuqDAK612uUjOOcTQChFLAbS4rLv6LGK/0+KtAzVIOT6J90yg/naSJq3lS6YnYO1cHfGhBsO9QF1a0c5OmDZeyaMdxU2HP3zfRiOwxzi6omJMVNpw4kXvuAw+5CbDwTo1x2Lse3DHQLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.ie smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8v+r8x/x2fE6DrgYboV+n11inrLk09q8INLlcJfDoc=;
 b=CL/fvcL4aDcwF3of8lRTEyfj6A5ngDEHIZ2TNYbP0kddopGKh9VMWXfixXih1J+FLwg2rRTifHGOHVL7a1TKYAsgMKWC0y76wOLUwVqdnC1LUM0psFKnL8cJoaq+M6ONY/ySwM3ke3Y0pPXiPolQddnvhy3bnWni3Tc2bSiGNwnb0LAnYfO7x6bxJegR+7EI8xqSdnZ3RePIc/E/jdO/zndrKaxXNGaN3nPTdugbVrmASwuNqGV7JTz/BMCwSCt9Ujup1ltlrBCEozfIBP+QLmon7AOutYKolXPmmnAtGQLG6cLJ6eG6wkGleg1G+PNEqcxx2Vt2eXzDp8ymcv1BbA==
Received: from MWHPR1601CA0024.namprd16.prod.outlook.com
 (2603:10b6:300:da::34) by DM6PR12MB3083.namprd12.prod.outlook.com
 (2603:10b6:5:11d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 19:00:13 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::53) by MWHPR1601CA0024.outlook.office365.com
 (2603:10b6:300:da::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Tue, 15 Jun 2021 19:00:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 19:00:13 +0000
Received: from [10.26.49.10] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Jun
 2021 19:00:11 +0000
Subject: Re: [PATCH v7 13/15] drm/tegra: Implement job submission part of new
 UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, <thierry.reding@gmail.com>,
 <digetx@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-14-mperttunen@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <381d3d28-1daa-6b75-962c-53a1a3368beb@nvidia.com>
Date: Tue, 15 Jun 2021 20:00:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-14-mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d555b37-fe8a-49b7-656a-08d9302fce8d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3083:
X-Microsoft-Antispam-PRVS: <DM6PR12MB308315CC9C5D7FDCC9195BD2D9309@DM6PR12MB3083.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /nzPB7c4uKDCkEXhzJ1GLLKhwrMBbS3CJ7IcBWMXM3XE/QtHYmhk2xEqZzYoa+8b46RwzN5hiFmcqvTDph7sIIUfse8+m0xVc6+3e7gCpic/GnGIODrO/Xxy+6TRLAO/4OGqZUXIc2nKQQQhS2/OPKAS3BloE21mUGoczGkQCse3V9KAhUo5K3qyXIoYzFsoJQmnnLKUdEUIvXGnR62ZP7547Y3dh111SztjSakBXJ4RD4wFn+0xsx3YWqMqs2WOrG9hj3o2CboEF3nE+vx5DQP+ow1m9CkMVzanrKRBcPLL6ogDQC4RwFO8QQY0DNoXeU3R+ywqSeYahtMpa+ssGGdijaHVPFdtVOQLAg0dpMSlOhxhZb3KGJRUtiL1AUnG9y0yW0rxCYV6I5T0grocTeTqqXZG8gP/7gGkID7YdUlWp1id87Vwq79BY9KuLsqQUWkFCfzV4s97F8W1UxLDrdonZOCBjM/m8AZNXAFAGJp1vQlrqjbo0C/8dJx0Hyn2D3JrngCmDEAXEHfSwAuMxvgud05JPfqf8QjuFvNLM1mDUrD5TlTvOKB1lQfdESoQFR269/cRGm1L2itKBSjG7BuubD9xcG78b3zCiDucmxMrwdzFV5LPjZaWOYuL7gu4itgGzt07n65vcYtJ8+hojMfJWIZdau1bn+OxZWWxUSpOjk2BDToZ9tcHYte0qPrzjE/MP7C7ZUdkjgJmIQZqwA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(86362001)(356005)(2616005)(7636003)(26005)(36906005)(2906002)(83380400001)(5660300002)(316002)(70586007)(16576012)(70206006)(336012)(36860700001)(110136005)(31686004)(36756003)(54906003)(426003)(16526019)(31696002)(4326008)(8936002)(8676002)(186003)(478600001)(82740400003)(82310400003)(47076005)(53546011)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 19:00:13.5445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d555b37-fe8a-49b7-656a-08d9302fce8d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3083
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/06/2021 12:04, Mikko Perttunen wrote:
> Implement the job submission IOCTL with a minimum feature set.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v7:
> * Allocate gather BO with DMA API to get page-aligned
>   memory
> * Add error prints to a few places where they were missing
> v6:
> * Remove sgt bypass path in gather_bo - this would cause
>   cache maintenance to be skipped and is unnecessary in
>   general.
> * Changes related to moving to using syncpoint IDs
> * Add syncobj related code
> * Print warning on submit failure describing the issue
> * Use ARCH_DMA_ADDR_T_64BIT to check if that is indeed
>   the case
> * Add support for relative syncpoint wait
> * Use pm_runtime_resume_and_get
> * Only try to resume engines that support runtime PM
> * Removed uapi subdirectory
> * Don't use "copy_err" variables for copy_from_user
>   return value
> * Fix setting of blocklinear flag
> v5:
> * Add 16K size limit to copies from userspace.
> * Guard RELOC_BLOCKLINEAR flag handling to only exist in ARM64
>   to prevent oversized shift on 32-bit platforms.
> v4:
> * Remove all features that are not strictly necessary.
> * Split into two patches.
> v3:
> * Remove WRITE_RELOC. Relocations are now patched implicitly
>   when patching is needed.
> * Directly call PM runtime APIs on devices instead of using
>   power_on/power_off callbacks.
> * Remove incorrect mutex unlock in tegra_drm_ioctl_channel_open
> * Use XA_FLAGS_ALLOC1 instead of XA_FLAGS_ALLOC
> * Accommodate for removal of timeout field and inlining of
>   syncpt_incrs array.
> * Copy entire user arrays at a time instead of going through
>   elements one-by-one.
> * Implement waiting of DMA reservations.
> * Split out gather_bo implementation into a separate file.
> * Fix length parameter passed to sg_init_one in gather_bo
> * Cosmetic cleanup.
> ---
>  drivers/gpu/drm/tegra/Makefile    |   2 +
>  drivers/gpu/drm/tegra/drm.c       |   4 +-
>  drivers/gpu/drm/tegra/gather_bo.c |  82 +++++
>  drivers/gpu/drm/tegra/gather_bo.h |  24 ++
>  drivers/gpu/drm/tegra/submit.c    | 549 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/submit.h    |  17 +
>  6 files changed, 677 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tegra/gather_bo.c
>  create mode 100644 drivers/gpu/drm/tegra/gather_bo.h
>  create mode 100644 drivers/gpu/drm/tegra/submit.c
>  create mode 100644 drivers/gpu/drm/tegra/submit.h

...

> +int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
> +				   struct drm_file *file)
> +{
> +	struct tegra_drm_file *fpriv = file->driver_priv;
> +	struct drm_tegra_channel_submit *args = data;
> +	struct tegra_drm_submit_data *job_data;
> +	struct drm_syncobj *syncobj = NULL;
> +	struct tegra_drm_context *ctx;
> +	struct host1x_job *job;
> +	struct gather_bo *bo;
> +	u32 i;
> +	int err;
> +
> +	mutex_lock(&fpriv->lock);
> +	ctx = xa_load(&fpriv->contexts, args->channel_ctx);
> +	if (!ctx) {
> +		mutex_unlock(&fpriv->lock);
> +		pr_err_ratelimited("%s: %s: invalid channel_ctx '%d'", __func__,
> +			current->comm, args->channel_ctx);
> +		return -EINVAL;
> +	}
> +
> +	if (args->syncobj_in) {
> +		struct dma_fence *fence;
> +
> +		err = drm_syncobj_find_fence(file, args->syncobj_in, 0, 0, &fence);
> +		if (err) {
> +			SUBMIT_ERR(ctx, "invalid syncobj_in '%d'", args->syncobj_in);
> +			goto unlock;
> +		}
> +
> +		err = dma_fence_wait_timeout(fence, true, msecs_to_jiffies(10000));
> +		dma_fence_put(fence);
> +		if (err) {
> +			SUBMIT_ERR(ctx, "wait for syncobj_in timed out");
> +			goto unlock;
> +		}
> +	}
> +
> +	if (args->syncobj_out) {
> +		syncobj = drm_syncobj_find(file, args->syncobj_out);
> +		if (!syncobj) {
> +			SUBMIT_ERR(ctx, "invalid syncobj_out '%d'", args->syncobj_out);
> +			err = -ENOENT;
> +			goto unlock;
> +		}
> +	}
> +
> +	/* Allocate gather BO and copy gather words in. */
> +	err = submit_copy_gather_data(&bo, drm->dev, ctx, args);
> +	if (err)
> +		goto unlock;
> +
> +	job_data = kzalloc(sizeof(*job_data), GFP_KERNEL);
> +	if (!job_data) {
> +		SUBMIT_ERR(ctx, "failed to allocate memory for job data");
> +		err = -ENOMEM;
> +		goto put_bo;
> +	}
> +
> +	/* Get data buffer mappings and do relocation patching. */
> +	err = submit_process_bufs(ctx, bo, args, job_data);
> +	if (err)
> +		goto free_job_data;
> +
> +	/* Allocate host1x_job and add gathers and waits to it. */
> +	err = submit_create_job(&job, ctx, bo, args, job_data,
> +				&fpriv->syncpoints);
> +	if (err)
> +		goto free_job_data;
> +
> +	/* Map gather data for Host1x. */
> +	err = host1x_job_pin(job, ctx->client->base.dev);
> +	if (err) {
> +		SUBMIT_ERR(ctx, "failed to pin job: %d", err);
> +		goto put_job;
> +	}
> +
> +	/* Boot engine. */
> +	if (pm_runtime_enabled(ctx->client->base.dev)) {
> +		err = pm_runtime_resume_and_get(ctx->client->base.dev);
> +		if (err < 0) {
> +			SUBMIT_ERR(ctx, "could not power up engine: %d", err);
> +			goto unpin_job;
> +		}
> +	}
> +
> +	job->user_data = job_data;
> +	job->release = release_job;
> +	job->timeout = 10000;
> +
> +	/*
> +	 * job_data is now part of job reference counting, so don't release
> +	 * it from here.
> +	 */
> +	job_data = NULL;
> +
> +	/* Submit job to hardware. */
> +	err = host1x_job_submit(job);
> +	if (err) {
> +		SUBMIT_ERR(ctx, "host1x job submission failed: %d", err);
> +		goto unpin_job;
> +	}


If we fail here, it appears that we may leave rpm enabled. Should we be
calling pm_runtime_put() for any failures from here on?

Cheers
Jon

-- 
nvpublic
