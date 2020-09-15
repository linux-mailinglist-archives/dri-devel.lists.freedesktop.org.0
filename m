Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C713626A00D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6694889FF6;
	Tue, 15 Sep 2020 07:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B041B89FD7;
 Tue, 15 Sep 2020 07:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMxP3xHThyYih+JEkHY7lm6Aek1H9XNz8vNu3lAoTkGkCwaQmN+/pLCbos9GIQD+ObxJIi+X7vwNDXOrrZjquPgNthjb09CR3sMDs+jEYCJsajXVSjiNtyenpl4lkoxk+GZk77PSQNO9PQutUylJe7UYXQRcpuQIf/r+chwomugPTIlMRuLoNY2Nizsvax1RMp0kugKj1kujEWzP8wCG4nyxNQ0cSNsRFDuy6Py7JXbbWPIUQuztJmUvafw6dY8H/v5dLa66BEhx1UQfKYHc1wIm+sObVwvcwEV6luu638SUYTM6TeU3iL8jjPQla/PIs4oG9lpUWVV1qi5iteBU9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jlu3MYAxLZRbnSIlY9TUCnNJzRZRwMkxWn0MWiAJ6rA=;
 b=R5O4DRQFrnY5XsYpWOlgQHjyeu9oVVFjnsl8JodCXfDYwvMxkv3/sAh0tAYDbQaGRQLO1QQnx373RWc1aI5AMRouXHAo1OVj+AJ9EWYDzVhUC5DdN98ERcQO4dqBQH0GXDC1bmfmwPn5Pvg3UwG9YGnQdSuwi8LM5izBS9Fcs5rtxDBC7WebGxZUp9Xt64zm6YSOqIel6NHRsbsw23H8+iRk3stzU9JCmrSTl1kQDSyCwzRkRdmx5T4SfkbtV9LifTfXRMGSFaPo/i4HJ2R2Rst2KiZVwfQZmY1K8oB1IeG7QMWkjhY47Pps+zerDEYS0jkW4QcEJV+O6UU5ftFWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jlu3MYAxLZRbnSIlY9TUCnNJzRZRwMkxWn0MWiAJ6rA=;
 b=G36rhGttbsvd648DtmyIxwcT8GL9M9FalwE9QaEsODkIzAdnLCm5bAgYt8gkEEvsJsnHPfFSsdD+Ust5DHkkOzgKqNV4jXpF25IXdSGfVe+3FX1hPD22dkNidMocu7hGGEFRoX0obEsfTGHeHAayGS0XN57nwfisIle5cGphA38=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 07:45:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 07:45:21 +0000
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v1=c2=a0=5d_drm/amd/pm=3a_Removed_fixed_cl?=
 =?UTF-8?Q?ock_in_auto_mode_DPM?=
To: Sudheesh Mavila <sudheesh.mavila@amd.com>, evan.quan@amd.com,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 nicholas.kazlauskas@amd.com, zhengbin13@huawei.com, yanaijie@huawei.com,
 tom.stdenis@amd.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200915071820.76620-1-sudheesh.mavila@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <888285ed-62e9-53d7-7fde-e40ac64bc5a4@amd.com>
Date: Tue, 15 Sep 2020 09:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915071820.76620-1-sudheesh.mavila@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR03CA0053.eurprd03.prod.outlook.com
 (2603:10a6:207:5::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR03CA0053.eurprd03.prod.outlook.com (2603:10a6:207:5::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 07:45:19 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f015d51-0b42-4aef-4677-08d8594b4c7e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4206A93EFD805B06038C004E83200@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgVXGieshJnxCuJdu0yhPhM6K2WotW8K6ih+Ma9WvPqDX+ijB+b9ktCHvFcX0uz4GW3xPiMUVHnwGzQUELcSfUvpX1PsLtBR5RIZrzhqCHHvGJMFM0tfhL9vR64EcK0rvXEc1JKN3FgAD/bgGWtGGGH7E5pkVh96YMyD8/pHQRM+kHPGbkmbv+WKDRc5tbWpGK11wgY3UiG8cT2E5fPb2oRw5SgCnvVYkePa51JiJUy2Tsnbj0foR9jhFEjWnBh8OcZga1OZcSyf0zWox1q6zEeDLnDn/MUBeTW8Jcycwl6KtU4ZdC4b4clAzBl/nT9ZNbTb9U7yt+pAgi9OVU3kmOFpZBxXqd76L9FKM/xn6l+AHJ6CfCSXVPODB+cfVX8+eZvU0IogysIqaknrmBXJpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(16526019)(186003)(2616005)(316002)(6486002)(66946007)(5660300002)(52116002)(36756003)(66476007)(66556008)(31686004)(31696002)(83380400001)(86362001)(8936002)(2906002)(6666004)(478600001)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KjWcky5If4Q7SnH1hGE63gvdgpG44IDDvvv0r4PBD1UZUlvycuKARq/cbdci4zigH2pX0bqwKi3e9t+BbGiDzcvHrFFERcZK4zQ1VyGgw/gAqejfOL9sEMes4mOtH7WdgPDv+gzxH49+TCAwQxriuOV/emA2P97BvttStk7eQbpAKh5K0LEQds1ERY1btpYaacpudJP9JWZpWYV5nuXgWPs+AoksRhpWQXT7c2XHxBrkFBm7TNDi2K1cGvJnwzxEbjrzrsorp1aslNaAbJY3du1lFcT5oD9foxyocJ8NLgrKZRt0RQZSwkDVt0LFJHvMTv7dAMCPP8KGn6l7NiIYzRzpLLhvO2CpObCHUiLM28TKl0lijM/C9SAilBu9odPaXPFyi4Kz4ABCF3ULUWjl3iMeYfaCXyepLwa5Gr5HKMv3AbECeQoRN/D3L1ZLa8OeZHYFx5/9dReFRwptwAE3mf+gvWyrGk+LyRiZ3O78SXwvroTSU5SLiLXlYIV9Q5MmILDPhP+svMBCtorxhXKmW8izlHs8oTHRoVFNzEPTs6WPtmo/YzNLCOeC/PMEnGEDotN6VIOOQj0nfY/XheZTIHjN6ho6m2NjF35T6YuKnTdWqVnMhDoekDhLuHCrpUsfXjZzCrzxr4NyGvXAQU1pSc4spGJxwpfltC5uxffj1B7QUG2eS1BJ8H0k/S/l50SX7phN2f+XDENqVZIue9TeDQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f015d51-0b42-4aef-4677-08d8594b4c7e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 07:45:21.8205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnSrsc+bR/WJ62aDqfuA5BqRHku6j/m5qHD0/QazfBxun6smF4Gn/8EoPFM7sXhq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.09.20 um 09:18 schrieb Sudheesh Mavila:
>      SMU10_UMD_PSTATE_PEAK_FCLK value should not be used to set the DPM.
>
>      Change  suggested by Evan.Quan@amd.com

Can't say much about the change itself, but the Commit message is 
indented and the indentation in the code doesn't look consistent either.

Christian.

>
> Signed-off-by: Sudheesh Mavila <sudheesh.mavila@amd.com>
> ---
>   drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> index c9cfe90a2947..081cb9b1b7c8 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> @@ -566,6 +566,8 @@ static int smu10_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
>   	struct smu10_hwmgr *data = hwmgr->backend;
>   	uint32_t min_sclk = hwmgr->display_config->min_core_set_clock;
>   	uint32_t min_mclk = hwmgr->display_config->min_mem_set_clock/100;
> +	uint32_t index_fclk = data->clock_vol_info.vdd_dep_on_fclk->count - 1;
> +	uint32_t index_socclk = data->clock_vol_info.vdd_dep_on_socclk->count - 1;
>   
>   	if (hwmgr->smu_version < 0x1E3700) {
>   		pr_info("smu firmware version too old, can not set dpm level\n");
> @@ -679,13 +681,13 @@ static int smu10_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
>   		smum_send_msg_to_smc_with_parameter(hwmgr,
>   						PPSMC_MSG_SetHardMinFclkByFreq,
>   						hwmgr->display_config->num_display > 3 ?
> -						SMU10_UMD_PSTATE_PEAK_FCLK :
> +					data->clock_vol_info.vdd_dep_on_fclk->entries[0].clk :
>   						min_mclk,
>   						NULL);
>   
>   		smum_send_msg_to_smc_with_parameter(hwmgr,
>   						PPSMC_MSG_SetHardMinSocclkByFreq,
> -						SMU10_UMD_PSTATE_MIN_SOCCLK,
> +					data->clock_vol_info.vdd_dep_on_socclk->entries[0].clk,
>   						NULL);
>   		smum_send_msg_to_smc_with_parameter(hwmgr,
>   						PPSMC_MSG_SetHardMinVcn,
> @@ -698,11 +700,11 @@ static int smu10_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
>   						NULL);
>   		smum_send_msg_to_smc_with_parameter(hwmgr,
>   						PPSMC_MSG_SetSoftMaxFclkByFreq,
> -						SMU10_UMD_PSTATE_PEAK_FCLK,
> +				data->clock_vol_info.vdd_dep_on_fclk->entries[index_fclk].clk,
>   						NULL);
>   		smum_send_msg_to_smc_with_parameter(hwmgr,
>   						PPSMC_MSG_SetSoftMaxSocclkByFreq,
> -						SMU10_UMD_PSTATE_PEAK_SOCCLK,
> +				data->clock_vol_info.vdd_dep_on_socclk->entries[index_socclk].clk,
>   						NULL);
>   		smum_send_msg_to_smc_with_parameter(hwmgr,
>   						PPSMC_MSG_SetSoftMaxVcn,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
