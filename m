Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F4E566977
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A29C10F8DF;
	Tue,  5 Jul 2022 11:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642F110E021;
 Tue,  5 Jul 2022 11:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oT5No5EZjV8s19OZvsZW+zgBmklamul3T/G8kR8yAcPE08adPRGvIrLyZlzcFVMv3fAAv46rbkNw569dKqjJuogfISDfLPGeHdu37D86eO/SN3gi0rIhVdv9NPGbSA5j45lFlzNmJ2ioi6VJZ0NON184zvcODiIscfFXUCkF77MGxW35LbtGpIzj9776bRZtS8mWAsNjFcGUcQLgUUtTMGSjUc7YFM7WdIpJz56AzH1+02jsCdcUfDVQpT7yXHjLuZO5yGGR1iKbsKRUQcqWWw7Ec+1F3lF5bbVzbfuqTuRKnHqaMmTIPRllLtNWWVVRJmFl5jQEA7eM1Xv/QPj3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Cgmq94aTZCfEU/4WRw3dHVYg6icZ9TAyyxiz84ycOU=;
 b=RR65YEOhvaP1E0fyE7VpNOsV82eSsbOqm9Lb8+ndAtHQnoQ1nCeJrTMkZIwiBtlPdRh5rIp3/yliJnggtjvUs3wnZ+sZ3gSrmWhTN3QFhY9GqtNrhAVeSNn2TVoejjUy7/0FgaFLSjK+f7mmJZeOANoa+QsjQWZUNV/yir5qG1nSG3vaKdT5/PhLi/HCfBD+lffJnct75fqjxsL//AQ+/Y5DrnEXp0wiFUAARXLjWeDOvE7oYctN9zRJqNQa+wI6tyszLzWK8dAuyGI+IxaKDIr2300ErYXCXJyCuN75ZtG+Dy0OI67YehCu/A4htVHSTg1oz+DeVnIbgY9fA9QQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Cgmq94aTZCfEU/4WRw3dHVYg6icZ9TAyyxiz84ycOU=;
 b=oCYv8KbgjjzhxkGIBNL94SQJPQh5Gf2lXtrtn2SjY6Y8wcUmUoFRCNPFUydZ2KiaiWXdYRQQBflKhsfNx1b1PMuHV+gp5MPeUfcmn4FirCIStmCfpqgXjPzhwMLjq0F9jBWlGx20yxFobA1itSgBjB50zX9nHYx/0hYp5U4hSKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4004.namprd12.prod.outlook.com (2603:10b6:a03:1a8::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 11:21:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 11:21:28 +0000
Message-ID: <0bbf075f-ebd7-321f-4692-5bb5da0d638d@amd.com>
Date: Tue, 5 Jul 2022 13:21:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND V2 1/3] drm/amdgpu: fix checkpatch warnings
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220704135421.1215140-1-Vijendar.Mukunda@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220704135421.1215140-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44be45a3-557d-4cb1-ad01-08da5e78814e
X-MS-TrafficTypeDiagnostic: BY5PR12MB4004:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6Xs5Zyk+8NLKpzHekCbzaLmlHZwRdY+wDXzaT+ef4pcc2EUHemqte4WjRwwm4wlAWeA494AFJ66ZiXFsDVGG0OQwVTc3eaN/jhQAN1920Eno5kkQWg5NrwgTz6Bm+L/BNm5fsdqJqTNN+Ej2+K5bU6n+aZQ1YUtZoF1DwkiVYhzz+qo0QQ+mDWgcHzbI1wE4J8ifnJzJwhsiT3mQxpi2X7wt8sHSXDW+p7yiJ8rQ7BUMzNhYcUzCd6samK5WchiS7VuDc0lSLHMT5NdUfFuZmV3xnj/ZTaVUpmowpBAtLZY0PYxC6IBEgGNL7W4VsqZZhxomaejJdg1MJISS8pSYIVVleEgNzvUsT+D3gLy79q3TU1WowTZvJgSlypX3Ud1jMGfE3OjppBe96vWMp+jiLr2Buiu2OGwDr8uVYvNhBU4/BZLfWmwajNRt4GmHAQkWVP9NXoMS7hIpWGS5AzT40UnnzFzeYcvAV6Uuf6sW0ZkmW/hfJ4Gc6RYgpSAtVf11ydtWSexMQeRuAx5hp/GaIc59HRx+55+PvrTZSj++XSs5FrIobv31PvYB/nmn6iiRDI7D0qv0r6DZHEJLR6Hf2XRZ7U+Xp6wj8nWmhbX7DUhapuFQWogwgEa2R7XEmXBRx7GB8ZgiRU32gOEKDReOhVGjE8m70oGJQFb+EEmtA1i24BpcLxiZnqnOmPduQK8mt5wFLPFXZDYBqKc1Iz1d22vjZtTYMQPo4gZP08ZNocPCws8MD1Cj3fYC4fAbFvtQLjBNCdWkHQFBl1fZVZ8DXhqn8fFa09bNcVsJcKmnIDqOwVy3aqrXxhnXoBSPYETZFxLX5WMI8okdV4Qo9qJmRi5Ysw7srvjcigYptNW44k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(478600001)(5660300002)(8936002)(6486002)(6506007)(31696002)(86362001)(26005)(6512007)(41300700001)(2906002)(6666004)(38100700002)(2616005)(186003)(83380400001)(66946007)(66556008)(66476007)(54906003)(31686004)(36756003)(316002)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzhWb25mRWRvUzgybmZWa1lHZXhCdmNrek5PY2NHd2gxNEVFZEJRd1o1ZHlT?=
 =?utf-8?B?Z3hhLzNocU9kZG5GZUUzbFhnQ3BZZ3ptTFZybC9CN0YvVzFvMUt3MVMwcDJX?=
 =?utf-8?B?SENJY2FGUFVydXFoVSt4ZGYyMUdYUWljeHo0eG1oNENaWEtLY0ZPUFlhWmM5?=
 =?utf-8?B?SERnK2ZlNDNCa3kxSm9ZUkZwZGJlTDhQYmhpK051cjdmRmoyY3ZMZ1E3ZUt4?=
 =?utf-8?B?TVNDa3pKUVB6ck5EcmpRWmM1NzdzazlQNVhmMWc3L2orc094L2YyZlkyZHNR?=
 =?utf-8?B?VVVXcTQzMkc2cWx3L3pYb20xaTBvaEFTd0lEVGFjUjd0RmdJTTJJc1g0aGkr?=
 =?utf-8?B?UDA4ZU5POENtQ1ljQVppWGNWOUszNXhPVW43RFNGWHFtWnE0Vkxma3VoQks0?=
 =?utf-8?B?Umx4YVhUVEtJYjh3MkdjbGxUSGU0RVlVdlROMlRBUlI1RnRrN3VSNW1LUEts?=
 =?utf-8?B?TFhiYVBqSURIUjBKSk5wM09rWmJWcDZVbHBaSlNkeGU2eU1aUlRFeitOZHdP?=
 =?utf-8?B?MzBZMFhqZDgxYWVxYk9GRDlBcEx6UFpTbnI3dUFaTHM0cjdTL21ocDBoRFFt?=
 =?utf-8?B?b3pXaUxRcTNuWnA0ZlVlekNESXN1K1R6c0dzY1l3WGZPcVVZbk1mRnRZSGox?=
 =?utf-8?B?UlVWK3Y2ajFQZHFVdzc3b294cmgrM3RzL1RSRU0yaGZpK3pWWjI0bVpKZHF2?=
 =?utf-8?B?YTQ1UHVyRXdneTNmNW50MGdDUnhiU3B5dlpKZjRQdyt6ZDY1MXBoc1ByR2x3?=
 =?utf-8?B?YTZVZVlER1RNNFdDVjdZK3JxUnJKbXJSaVRGRGUvL2FnWUhMTVNFL0g0WW8v?=
 =?utf-8?B?alkxaTZXd1lYTm0zS1laRmJPYkpBZ2lYZjY5VS8zcndTSDJ1eWZpSEZYaG5U?=
 =?utf-8?B?a1oxUXNZa0ZjQ0EwejV2eGxsTmFyS0tQZ0U2L2NKZ2YyaFZPSTlXT3NOekl1?=
 =?utf-8?B?c0ZvNUREZDBKYk1TelRKdDdyTzlqOEE5N1BwSEs4QnBXbTJ1WjdST1hMbTl4?=
 =?utf-8?B?VTlrbWNnanNwS1FjZlQ4NkFUblBhdndxSTZkcU5nUHpxTjZZdGY3NFhYaDkw?=
 =?utf-8?B?VWNvRmxHNTBkMTBuR1ZLK1M4djVsNlk1QVZPRGo5MWVuRDYzL3pUK2hlUkpI?=
 =?utf-8?B?MFZWZW9wTHB0dDNhRlRsZGd4Zlp4ZEVuemdYbFNUQS9hN0RyMzhrazF1WnA1?=
 =?utf-8?B?bFpvSWdBMlpTYnR2LytDQ2xGYmV0Y0RsVHJBbEExc2lJZUQwTkdTWmthVmRh?=
 =?utf-8?B?N0RJSTdxU09DUm9nblk2VDR0UnZ4NStscjJMdHpQeXVFemNLcjB5UEZBTFE0?=
 =?utf-8?B?M056S0NuK1JEWitOR1I5cmF6M3g2NFEyb2kxcjJQY1FQaDVVUkJmT2RlZWFJ?=
 =?utf-8?B?N21WRFdvMXRES241SFo0WXFKT1p0QzhHaXhPMlBDSVBPSlJvQ2lITzltaWI4?=
 =?utf-8?B?YlZqdHpPdjl5UElRRWFCQ3ZhQzVBNWpYbGFEeGtsL0o3NjRmMk1hUUNXZk5S?=
 =?utf-8?B?OUVLT3FUNzlTTTd2Uk9EdTRqMU5CelRBaEM5ZkIzM3VDMjBMMVFvclo1NVp0?=
 =?utf-8?B?Um90YkN0TVJDd3NzMXBSdW9JSWZXWW90UEJ3N2MrU1N4cVluRGRSbGRWc0R1?=
 =?utf-8?B?c3NNMU9ySW9WS0FvRmlRNHdKdWlhTkZnNGdabEtKeGN5KzRnYytwTW1tQk9C?=
 =?utf-8?B?NkRkR1IvTEIyQUtucUYvaEU3M1Fhd1IvUllxeVJKS2ZpMS9wZFU3dE80MFVo?=
 =?utf-8?B?YjlmOWs3MFRhRTlpTFQrR3NadjVkQlJvRmlJUnpPUis1czkyOGJ5ZEJCMFZl?=
 =?utf-8?B?WDBKT2o2dXJidTBIVEdTYlhrcEVhdEVUZmt4c29FaDhxNmxzdVdiY2VBWnVk?=
 =?utf-8?B?UWYvZElSVEVtSlFDeC9wTGJ2M2l0RW44L25iRkY5UzUxSTV3RTFmYVJ3ZFNH?=
 =?utf-8?B?dWlWZVN3UWtJRlJDVmJDdmZ3NnpVRm85aE9haW1KdmNOdk1CMTlMU2toWlBC?=
 =?utf-8?B?UmZGVE55V0xCNncyWHZNYzZBNlNISTFSS0l0TEljWC9sdVRQVk1naEhtdTds?=
 =?utf-8?B?N3J5NnltU29tbi9KVytxOENyeXMxMjVoSHhXOHYrZkQ4aWcvWU5wU3l3RVQ1?=
 =?utf-8?Q?pK3f5iFGy9AGsF3Hnp/mlYrUo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44be45a3-557d-4cb1-ad01-08da5e78814e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 11:21:28.7506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJGp5enHju2+oh6QbzeItigAp7nmVc3hnDGhQW5cc1v/EDHkV361O00KBqLqL0Hd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4004
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>,
 Basavaraj.Hiregoudar@amd.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>, zhuning@everest-semi.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 04.07.22 um 15:54 schrieb Vijendar Mukunda:
> From: vijendar <vijendar.mukunda@amd.com>
>
> Fixed below checkpatch warnings and errors
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:131: CHECK: Comparison to NULL could be written "apd"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:150: CHECK: Comparison to NULL could be written "apd"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:196: CHECK: Prefer kernel type 'u64' over 'uint64_t'
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:224: CHECK: Please don't use multiple blank lines
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:226: CHECK: Comparison to NULL could be written "!adev->acp.acp_genpd"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:233: CHECK: Please don't use multiple blank lines
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:239: CHECK: Alignment should match open parenthesis
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:241: CHECK: Comparison to NULL could be written "!adev->acp.acp_cell"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:247: CHECK: Comparison to NULL could be written "!adev->acp.acp_res"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:253: CHECK: Comparison to NULL could be written "!i2s_pdata"
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:350: CHECK: Alignment should match open parenthesis
> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:550: ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> changes since v1:
>      Modified commit label as drm/amdgpu
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 27 +++++++++----------------
>   1 file changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> index cc9c9f8b23b2..ba1605ff521f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> @@ -128,7 +128,7 @@ static int acp_poweroff(struct generic_pm_domain *genpd)
>   	struct amdgpu_device *adev;
>   
>   	apd = container_of(genpd, struct acp_pm_domain, gpd);
> -	if (apd != NULL) {
> +	if (apd) {

Well that's still not correct. The variable apd is compute by an upcast 
of the genpd parameter.

Since that upcast never returns a NULL value (gpd is not the first 
member of the structure) this whole check is completely nonsense.

I strongly suggest to just remove most of those NULL checks.

Only the ones directly after memory allocation really make sense.

Regards,
Christian.

>   		adev = apd->adev;
>   	/* call smu to POWER GATE ACP block
>   	 * smu will
> @@ -147,7 +147,7 @@ static int acp_poweron(struct generic_pm_domain *genpd)
>   	struct amdgpu_device *adev;
>   
>   	apd = container_of(genpd, struct acp_pm_domain, gpd);
> -	if (apd != NULL) {
> +	if (apd) {
>   		adev = apd->adev;
>   	/* call smu to UNGATE ACP block
>   	 * smu will
> @@ -193,7 +193,7 @@ static int acp_genpd_remove_device(struct device *dev, void *data)
>   static int acp_hw_init(void *handle)
>   {
>   	int r;
> -	uint64_t acp_base;
> +	u64 acp_base;
>   	u32 val = 0;
>   	u32 count = 0;
>   	struct i2s_platform_data *i2s_pdata = NULL;
> @@ -220,37 +220,32 @@ static int acp_hw_init(void *handle)
>   		return -EINVAL;
>   
>   	acp_base = adev->rmmio_base;
> -
> -
>   	adev->acp.acp_genpd = kzalloc(sizeof(struct acp_pm_domain), GFP_KERNEL);
> -	if (adev->acp.acp_genpd == NULL)
> +	if (!adev->acp.acp_genpd)
>   		return -ENOMEM;
>   
>   	adev->acp.acp_genpd->gpd.name = "ACP_AUDIO";
>   	adev->acp.acp_genpd->gpd.power_off = acp_poweroff;
>   	adev->acp.acp_genpd->gpd.power_on = acp_poweron;
> -
> -
>   	adev->acp.acp_genpd->adev = adev;
>   
>   	pm_genpd_init(&adev->acp.acp_genpd->gpd, NULL, false);
>   
> -	adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
> -							GFP_KERNEL);
> +	adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell), GFP_KERNEL);
>   
> -	if (adev->acp.acp_cell == NULL) {
> +	if (!adev->acp.acp_cell) {
>   		r = -ENOMEM;
>   		goto failure;
>   	}
>   
>   	adev->acp.acp_res = kcalloc(5, sizeof(struct resource), GFP_KERNEL);
> -	if (adev->acp.acp_res == NULL) {
> +	if (!adev->acp.acp_res) {
>   		r = -ENOMEM;
>   		goto failure;
>   	}
>   
>   	i2s_pdata = kcalloc(3, sizeof(struct i2s_platform_data), GFP_KERNEL);
> -	if (i2s_pdata == NULL) {
> +	if (!i2s_pdata) {
>   		r = -ENOMEM;
>   		goto failure;
>   	}
> @@ -346,8 +341,7 @@ static int acp_hw_init(void *handle)
>   	adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
>   	adev->acp.acp_cell[3].pdata_size = sizeof(struct i2s_platform_data);
>   
> -	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
> -								ACP_DEVS);
> +	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, ACP_DEVS);
>   	if (r)
>   		goto failure;
>   
> @@ -546,8 +540,7 @@ static const struct amd_ip_funcs acp_ip_funcs = {
>   	.set_powergating_state = acp_set_powergating_state,
>   };
>   
> -const struct amdgpu_ip_block_version acp_ip_block =
> -{
> +const struct amdgpu_ip_block_version acp_ip_block = {
>   	.type = AMD_IP_BLOCK_TYPE_ACP,
>   	.major = 2,
>   	.minor = 2,

