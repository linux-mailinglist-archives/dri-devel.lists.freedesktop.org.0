Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF273F76E5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7116E220;
	Wed, 25 Aug 2021 14:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E319F6E21C;
 Wed, 25 Aug 2021 14:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRLoaT8Pn7sz+igOiPsoqfo0+eNL8test+hMRJY6Q4ouVG5bH4B/UJzh8efVu0g/Ks9IIBf9BS121uw3+gbdr+aHDzaHLUb33NCdsw7vVZxt+0prn6oFCUbq89WBowfBz6hCbY8sGr84LDYo3h/D2ewHKKcexLjmzwYmPJwVFqPgtjCbZl1RW5PQB05n3PZaHiSfTwrrqgXaJiLpoHWHBhYb0ZE6kV8+XzafpDl6WZCbZ+W7ELZIvN4t/DtBjW6qSJ1h19x8hoJmYPYz/4OBXNCRY1C+vquOipPdcQnb/bu3IfjT3ftHnIhLEZM9iLFBmxvrt3wcgFDWIMfGYzvwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AmS9PqHHsL8Ex0UsaMIpPhKf5z7B1OdA0G2RWCS4VA=;
 b=Yn+6a3wGZjMRxh+kdhpvjtm2NvrYyj32p31xkSdFpAnElQ7Vs9k8lgKaACrMxv+WvbVTjWQ4rG0uuuMbundfvYhAGF6BAk7zr09JAiDtj5o9aZqIzPFAA78VlQsER0atZYafwAEQM/8mU4oJtG4JU6beOQK7MSteVuLUr+yg/tetGE2FWbmX0xZNgxwPmfJXyeRyxhJABtqdoxJRDrjkVyNFklEPYJrKjP9gGveH56MpgrY9tGMHwbI1jP0PnfvImdsv2q//D2v0CMEndGdSiMTCkAXAozBGtum+SnQU/c2LcfGUlHDvkm4vnJYctUcGNria+bmfi2FrmNE1Ttv7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AmS9PqHHsL8Ex0UsaMIpPhKf5z7B1OdA0G2RWCS4VA=;
 b=2gl0shdoeAudRTd6gsbGFfB6bzKXJ3RLdmy7IPAU/G9YdcWO9XRbD0XTRyN34t5bVtamZoU7y6FvFlnpXRNS2ymr2yT9u0QhHOk5OBmYDpPhDTDakZd6Sk8hTQR3aIj4Juz9F1R0BMNV6ACmcUBn1zUGHtixbRzixyZNS/mJHQQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5443.namprd12.prod.outlook.com (2603:10b6:303:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 13:53:18 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e99e:c0a1:4e9d:322f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e99e:c0a1:4e9d:322f%9]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 13:53:18 +0000
Subject: Re: [PATCH][next] drm/amd/display: fix spelling mistake "alidation"
 -> "validation"
To: Colin King <colin.king@canonical.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210825113615.14555-1-colin.king@canonical.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <feed4359-c682-bb13-5584-6f34bb9960eb@amd.com>
Date: Wed, 25 Aug 2021 09:53:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210825113615.14555-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0430.namprd03.prod.outlook.com
 (2603:10b6:408:113::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.254.43.216] (165.204.84.11) by
 BN9PR03CA0430.namprd03.prod.outlook.com (2603:10b6:408:113::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 13:53:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6372a7d8-e4e6-40f6-597b-08d967cfb14a
X-MS-TrafficTypeDiagnostic: CO6PR12MB5443:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB54432C3113F7E8A7500EF8D28CC69@CO6PR12MB5443.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:188;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PaBN0wjEKLoDP4XiClTP4GAOgxsSRYX4nO98NKBciRC1qFwmquhNMr2joZ+D+UhBKn9pF9IaDsub6ifKUNso45Tk1RDZ/t19dTY2K7FsLxYy28L9fhR3q7uxEj7x33QP3Ky28AB+LmXBlpyU7xVtyiMidJYlaB53kQo97bmWrR4LKXRW/pNsbjK8/son/Zblc4GJCPhf16+1nGYcFQdiggcv81IYidxpCSRpi1uIc7+yIkKWgkwD6u8JXPo+EhzQMuzeIMT4WcelYa5OCJkJUJ1MXMF3wtEY+8K55I0aVfgQsjN/rP23orNEpU47bVx2f42IhqflqgHf1VnCGcv+USnEgWdRiOlUQOHh4dq2Ys7WbD9MCVKheriD6CgCgXWH3FsfohPQJoCrssXQn7DQPDcpwDByydBlv3GudzUMH3LbhgYWiJjiJGUUtuiNdtJo80S/79Ql7jsOUN95orCaRPZ0ucLK8pYJL/o/kjao3+kLZ14a2mcG2iiHlnLSObmlgM/R9DmSc0WfaqtD4r1DDR+P14CfinBEayIYHIwnWl8mnBICyax97wx9GbhVI/rgC4vgBpvjkoMYln1tpBcpV7inKtWBdsyHv1dICnF0QTKES0dfS7TPhlOKKZqIUlVnZiR6OMY82ZsKk/VSPyF+HS9LzPw9S3zkgRvvh3gHS1JTonscOqPxVrDFu4OrLOYSF3j1qxFyJPXObEovvUVWM1U1EWnQMt+pvYAiVcVAfT4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(83380400001)(2906002)(478600001)(4326008)(186003)(26005)(53546011)(36756003)(31686004)(38100700002)(2616005)(956004)(44832011)(5660300002)(316002)(8676002)(66946007)(110136005)(66476007)(6666004)(66556008)(16576012)(86362001)(31696002)(8936002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUd2T3VwOTVRVHo4WmFGemE0Y0U4UVMvdWMzRlhmWWVacC9uY1J4ZDNCRVBl?=
 =?utf-8?B?Qm85cmdnS0J5Ukh5ampYVTlKYk84K01nZ2JGVUdqVTRabXFLSzJub1dPeXJQ?=
 =?utf-8?B?M3BRS1Zub0NvSnI3TzgyUTk2eEtkZExvTzVONzlBSSt2eUdNTUhFRlR2S2tT?=
 =?utf-8?B?RjRpVUYxNFJpWG9ubWE3dWdxTjdvYkVVUkJuT0VXcHl1a3VHQmFva0dQbUFn?=
 =?utf-8?B?d3VsakpEVWJORm5BQmJod2EzKzVCTmhROTVZVUplTE1NZFJUVWNrU2JCb0cx?=
 =?utf-8?B?NTdIdDUyZXZsVDJYVmF3WnBwRlorZVg1OUl5OEF2VldTa2dyVkllejJtS3Vh?=
 =?utf-8?B?RjVlYS9LMnJ5SFFGS0xCT3ZkMllWMXdtamRPSllHVEVBRlRGT29id2N5cnFZ?=
 =?utf-8?B?VFVaRmpwM0xYdlJXQllydTQ2K3R1RmlDdUp4QzBTVUg5WHdMU0crenVmSVBP?=
 =?utf-8?B?aTZHOGJiL2FTRTRSMkRNU1FabG9EQlh0dEdCbHNFb0NJUnlMN3ZZRnFrNFRo?=
 =?utf-8?B?MFZXck1MaHBHbnNtMXFPQWNSMHoxc3pCSHBHSVhuWGtpck4xTFpwb3djYU03?=
 =?utf-8?B?Y3RaZDFRa09iYzRCL1RUV2ZvOGZENEppRlJOMis0UzNaMmwwdWN1YTJXbmRh?=
 =?utf-8?B?TkZOOGducHcrbmxTR1RYZHhmUWRmS1h4RnJRR1FZZWFoMmI5N1EzOW4xRTFZ?=
 =?utf-8?B?ZU9sL1VoR3R1M0JZTEVwQVhDMTVpL0VJcGxBUTJ0Vk1SZFJJWFFFMVJyLys2?=
 =?utf-8?B?RUdBWk5rM1RQOGgzTFZiaWYyYkswQ0daeVNNYUVGejFnZzhCNlJtNDNnSldF?=
 =?utf-8?B?c0ZiM0lrTXdPQ0V1ZEc1R2gydWpXUzBiczRGSUtsL1FpQUVmQU9zVTlhblFK?=
 =?utf-8?B?NWdOZUN0bXBENE1wNWRHZkZsRkF2NUQzdmFxYlNXMm1kY1dYVkNaOGp1Y1FO?=
 =?utf-8?B?T2xlV3RWUnQ0c3pOd1hLaEg0ZHhmSGFEeVFQc0NZc01MMGlKQm9NcnJPY1I5?=
 =?utf-8?B?c2M5c2N0SjRUWk9YQ2tjdG9uc0o4VjVSWkdDYTJVckowUVhwZWtwQ2RqMXJz?=
 =?utf-8?B?QXpNdjg0T0dLMUZ0bkNKc3BLQ0poOGJWQUl3bFZnUWNXOTlZekIydEpVQ0hQ?=
 =?utf-8?B?bGhWblJHc1JyT2docHNCTkFERlBkbC94SUVMbkk2K0IxWG1nd1Q1SC9BYWVm?=
 =?utf-8?B?M2wxZktseC9jdkFWMGlYd0ZiUkdJdUFYWWt0TCtZY0VVVTNPaUdIL2lINlpE?=
 =?utf-8?B?UXJ1eGZPM3daZEJVYURGZXMyZTVqNkZsYlNyZ0pFKzVXdWhidDlGTXlSVGxU?=
 =?utf-8?B?am5URjh4YnhDcGlGcHRrN3p4dlo4c0Z0WEh4MUhvZ0g5R1VzaHQzWkw5bGpP?=
 =?utf-8?B?ZkVSUG4wTnIraTBENG5uaUpuNmFaTkdTVDlSZVJ5UnRxZm5sY1J0ZXRBcVda?=
 =?utf-8?B?ZDNmQXZRUTI3b2ZyY08rYWFlWDMxeEZEOUtSRm5sVEZpV1hTdmFoMGVIcG51?=
 =?utf-8?B?UGxLeW9qMlhPMGVWR2hkSERPbTVPWFMyT0dqcGphTjQxMWd6VTQ4MFZCTVVQ?=
 =?utf-8?B?QlNVcEJoWnM2WEhJVjlOMG42TVBDZDU4cXJ1dkZnUDhiSmorMHpGMlZLdWll?=
 =?utf-8?B?L3E3U212cWFOTU02eHFFK1FPYURtUmxNQ0x4dG0vZmRVekFQQjdJamoxQUs3?=
 =?utf-8?B?blJza3FIdkEyeVk4R1EwRVZzZVJibjZzVWtnT004TnA1QVU5ODhIWW42azZG?=
 =?utf-8?Q?dITO672RBtteReIkmlxm4D4e2vb9eIm9hj9kB8O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6372a7d8-e4e6-40f6-597b-08d967cfb14a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:53:18.2525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1YHaYs/u9kuSSfFAerN2RD+8TnKJQbWK3EFhBYTsmmzFCLgZ/laLnFrZrwVAu4NmVIXlT7mw67L28yXkxUFDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5443
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-25 7:36 a.m., Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a DC_LOG_WARNING message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> index 3223a1ff2292..91cbc0922ad4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> @@ -1999,7 +1999,7 @@ bool dcn31_validate_bandwidth(struct dc *dc,
>  	goto validate_out;
>  
>  validate_fail:
> -	DC_LOG_WARNING("Mode Validation Warning: %s failed alidation.\n",
> +	DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
>  		dml_get_status_message(context->bw_ctx.dml.vba.ValidationStatus[context->bw_ctx.dml.vba.soc.num_states]));
>  
>  	BW_VAL_TRACE_SKIP(fail);
> 

