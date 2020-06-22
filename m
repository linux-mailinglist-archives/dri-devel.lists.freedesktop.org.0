Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC394203A1E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 16:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195516E81A;
	Mon, 22 Jun 2020 14:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0516E06E;
 Mon, 22 Jun 2020 14:57:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfvgjpvB4gNv3FRKXHOokxWChYJatpjLI0A63vt9QoVsFecv018+IgpFp9dqX4yQI+lPFx97brYgJXjBu9v1mG70RJWaRLof1erGBM+ozVoj2VnFpUWqhDVd5PF7Oa25S00eMe866DXPDDD1ZMW6ThcumoVvozc9QbwIoACtEKNrXd8JpfprpD/drOzPs1aEHVO/DqB7uStGWMH3ckMCQYCyS7byovzsevNq5qr78iWGdtjjrQ2v9GGLFMmQF5Mumd56Th7hEvtrshFBYkrnZX+j2TKhu4bcujRHPzaU3WA1T6Z3PFeY+6blAtPE1+ycD0ffsKpHxtCE9HWOFNXT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VF6eeH2gH4OLMEnZfXAi9pczK8E6k1+kfIcxgCgC1o=;
 b=fCL70+WpjRrZ7PedZ3/L6tu2OYG9JYMWwFpE9VEMkm8ch5pE2uFg1e4Qhl28+E4mFXSOVCJeNHPpRbrZ2GDR5wpMlm+al82AR4BkpWx1+ZKx6tW59l72opgtJC1dyetUSb6Vjb7GsDMDgO0sHPvebPTyu9PCbin9zor/drZF8UX9tovguyTiiZ/X7zFC9Oo4i+boBa7BilgfH1s596ZY32Hrzqd7cc5st9TIq1i+FAGlDYqzi9ioH2c94UUGkRJP3RrebV37dkBvkJlLXNBP7n02LeMdbOni+vBS41MVKEC3C9/v/DumDTdnIc1jKhbbe0tAGUpw3PC4ewi9+UfZcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VF6eeH2gH4OLMEnZfXAi9pczK8E6k1+kfIcxgCgC1o=;
 b=gYzVB+zlZM9Mj2shDdGQueQt6DabriEi0YWgAcOMLyHSPE9SXfgJS64P4eIyEFcUdHX1goFvwDyo7qvtFYfkr/JK0aaymhPs0kvldJg2Aku6FOIj0ox9RIq5mo0QSP1DWJIq605BVN/ij9c0AMWT5g4ixHME8hURIhLgElDsXKc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3606.namprd12.prod.outlook.com (2603:10b6:a03:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Mon, 22 Jun
 2020 14:57:06 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::fd29:4119:9ef5:8210]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::fd29:4119:9ef5:8210%7]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 14:57:06 +0000
Subject: Re: [v1 3/3] Revert "drm/amd/display: Expose connector VRR range via
 debugfs"
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20200622142519.16214-1-bhanuprakash.modem@intel.com>
 <20200622142519.16214-4-bhanuprakash.modem@intel.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <f9c32dfa-0a23-45c0-8991-545c071da388@amd.com>
Date: Mon, 22 Jun 2020 10:57:02 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622142519.16214-4-bhanuprakash.modem@intel.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 14:57:05 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2cf9e0c8-d352-4158-ca70-08d816bc87e9
X-MS-TrafficTypeDiagnostic: BYAPR12MB3606:
X-Microsoft-Antispam-PRVS: <BYAPR12MB360642D84A649DE8C8B3DCEAEC970@BYAPR12MB3606.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LtiEtzfuYHKqZYPCSQUxH7fr1i9geY9uRsatlEmrtnCrKR3Pqnrcz8rlYqV5Gje4ZK3IOWwHz1WuJaiyqYst65aXAspT4odR1ri9ItQaFB7EtiaWqgdW6CPhcdkoKFdkpYHp0iFFjCROaSI2g3MAH/j4efD/u7pgxyZHJYkaXfzP3BpVr3H27iL53JP/miPtPoI35hBHkCCOgfaGDdFOSTvX6ChGqTSQ9ZivDJTzAv4Vt4LjoCgVSnKPOOLHRQy+C4vf4P33UB8mUgC9FU9Lf1Mm4tYE6KiwUx3YIeaqmXtv1Za5nzFvkVL+i5781v5Y50Dv3E6dprRNqReYg46UZDFe4jtu7CePKP0Yp31AERWZJjJKuoGExJVpkEasoDoN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(66946007)(5660300002)(478600001)(31696002)(2616005)(66476007)(956004)(66556008)(8936002)(36756003)(86362001)(8676002)(6486002)(6666004)(53546011)(26005)(83380400001)(52116002)(31686004)(16526019)(186003)(316002)(16576012)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YNg5vKgZxF6tQ9epI8HUBOz7HnKHUomKuLd7zJprXOp/lrp7cFZz2ZpiNsmzLR9KefoLUA+gGFUfZabMObNxpEWOzzglV5z5PQnGAdQyqMjTF5Syrn0ecm5DQpLYIEQXmZ4fGjrJuovghQ+8ccGMPViWlN0N25RpNJ/CqjdYpDuEbDjnMFllL2xysF4xDRIdeBXKB4KXrrtTkalFAUa7gxYNLGgEj0pI0GEHBndvMl1uFzVf4LRlcw5UmDa+MW3UJ9MLRTBvtwK/dht9om3Fp1F1758RZN6o04RccNCrzW03+sfJOIsGiMFlVjyAdQNR9B0cjLjE20UGOJVbxcbGlt3JU9dFiA+DsKRbSX9JlLu9mYQzDrZW1KULZthkYUKb8Hub3V6svFdmloWq12ZEgq3YlisYFRn2B7y0xw8xszhA+5BOk/Ty7ULaGhlEZONvdiMGQ/14iEA/WYOLMzMccMKY5KOYK3EAKQ6UX/BqEppfnxF87TgceHUC7/2EAyeX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf9e0c8-d352-4158-ca70-08d816bc87e9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 14:57:06.6541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ2L8x1Pxb6orjNI58t9jpP/5w0d6vqanI101fiAGDy9pA+LsGvJmFPV7EjWs1C/4wWIRpf1Fge4e5NMRDM86g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3606
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

On 2020-06-22 10:25 a.m., Bhanuprakash Modem wrote:
> As both VRR min and max are already part of drm_display_info,
> drm can expose this VRR range for each connector.
> 
> Hence this logic should move to core DRM.
> 
> This reverts commit 727962f030c23422a01e8b22d0f463815fb15ec4.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: AMD gfx <amd-gfx@lists.freedesktop.org>


Looks good to me with Patch 2 part of the series.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Thanks,
Nicholas Kazlauskas

> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 20 -------------------
>   1 file changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 076af267b488..71387d2af2ed 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -820,24 +820,6 @@ static int output_bpc_show(struct seq_file *m, void *data)
>   	return res;
>   }
>   
> -/*
> - * Returns the min and max vrr vfreq through the connector's debugfs file.
> - * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> - */
> -static int vrr_range_show(struct seq_file *m, void *data)
> -{
> -	struct drm_connector *connector = m->private;
> -	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
> -
> -	if (connector->status != connector_status_connected)
> -		return -ENODEV;
> -
> -	seq_printf(m, "Min: %u\n", (unsigned int)aconnector->min_vfreq);
> -	seq_printf(m, "Max: %u\n", (unsigned int)aconnector->max_vfreq);
> -
> -	return 0;
> -}
> -
>   #ifdef CONFIG_DRM_AMD_DC_HDCP
>   /*
>    * Returns the HDCP capability of the Display (1.4 for now).
> @@ -1001,7 +983,6 @@ static ssize_t dp_dpcd_data_read(struct file *f, char __user *buf,
>   DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
>   DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
>   DEFINE_SHOW_ATTRIBUTE(output_bpc);
> -DEFINE_SHOW_ATTRIBUTE(vrr_range);
>   #ifdef CONFIG_DRM_AMD_DC_HDCP
>   DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
>   #endif
> @@ -1059,7 +1040,6 @@ static const struct {
>   		{"phy_settings", &dp_phy_settings_debugfs_fop},
>   		{"test_pattern", &dp_phy_test_pattern_fops},
>   		{"output_bpc", &output_bpc_fops},
> -		{"vrr_range", &vrr_range_fops},
>   #ifdef CONFIG_DRM_AMD_DC_HDCP
>   		{"hdcp_sink_capability", &hdcp_sink_capability_fops},
>   #endif
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
