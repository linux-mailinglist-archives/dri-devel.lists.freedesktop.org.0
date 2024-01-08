Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607B82766A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 18:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EACD10E2A7;
	Mon,  8 Jan 2024 17:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC1910E28B;
 Mon,  8 Jan 2024 17:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNCGHF06H0FbPqo+1KOw6FSeU94rXBWBz/+Itd+olLHwL4y/flhiv6ty+v8GhMt4e3deTJ9rCCfe5mE86fGuM4DWTP3ZxBx2GEKTQ8KTKXhqg2gjABILdESlKnx0zjdnfJy3NLTMTqMLgKXkwe7v8YiVrTS+RoAqMKxjoEFs2qtWN3A77ncM12duIU4gwb/JWmtzg9+W/B9tprx728B2d20sgOXgbBiyFMBRC/6vgBCHudGCggTDJAwiR2M/diCO8ZxOLG/SD9eIrutB7FTd87XrpGo36sS6khtkeA2ilXOraWyUgHk4XeSEsOPyjv77/KpZEpCaIZVA9wGfOwRqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/AzxjGhLWAcoCO9JHyA0EUNxxZDea7pfcwcxOqvB2w=;
 b=Wj32opE61iJanvrjuOoAnxY2x+CIIXvwmE2bRYSqy4SlMOhtNK1R8e3ahFwhlAMhFUxtoq9r2nG+LQUwko/nbtvg2o08qizplW+QSMIAE45O8HA+W2gF0YfkOBM5yhUlIwteOqTQxm+CdUquvdRLh35o9ZRdKtegQGGEyEVxzp+OfRskzGlp4A542dJeqC4JrtmKDjoXWrnzSn4Lb35J9YbU5YOnohSLtiXKbDLRAuo0+tANqRdITIQskbp95rXRvrIY3UyAqNTbDbEMFmofl5BW7H/0YXGsRvQ+xstGiCrlFBOSG57Uajoc3HxCDlAm0N2RPqdPXu4KD66hOKCuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/AzxjGhLWAcoCO9JHyA0EUNxxZDea7pfcwcxOqvB2w=;
 b=QS/Cgioa3PYrZQvi6GKJA/myc4HxjSFE2Yx5oKhcMAR8Y4C+U5rMgy2JgQl07BuM2PffzN8tBsi2tzQNRaLsm7ht6PG/93QXiWjrWPoR+FJWDW/ym1cBs5BWNX7r3fHBGYsZdqDdZrBAU7GtK4Ry3vjjQ1fXDGpiYoHsMmZmPrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 17:38:44 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::cfe7:79d1:ca37:b74f]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::cfe7:79d1:ca37:b74f%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 17:38:44 +0000
Message-ID: <fa1a096d-bb4d-4754-a4d0-9e4874c8fd7e@amd.com>
Date: Mon, 8 Jan 2024 10:38:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: cleanup inconsistent indenting in
 amdgpu_dm_color
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <20240105220248.282941-1-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240105220248.282941-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0537.namprd03.prod.outlook.com
 (2603:10b6:408:131::32) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|SJ2PR12MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 21172a74-d701-42d7-ab09-08dc1070a97c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wZ0Tb6Ql3z6Laz0d5WRmXx5hDY1yJ5aD9Ro1wEPYsMGu3KsuRj5Sb6IWmgiirlN3s3nrl8OqrruiWm/NPRqDpP0yutLKyP+vIEA/ASfZQOmaM6d/Neb7jAvwCQnVDj9RK2v6wBvZcqhAk+GADDAU6dRz6Oi/BPCrohg/ybyDZQI0grw8/tyQ4DC1eYvxWmFjdfYoKMqIzzyTqa82nAvyAICiCG8L0lI5kpjRWODgDIRU+yFHCjhrFdzqrY7+iqOpLwde9OtjfL7cHbL/x2lgVA8Piiwk6JYRGIm9NHz0IFKakj/4ScW9pnz+7lMA0ImH8Pu+Xy3OYa5P4ZPr+EM+pYz8RPwS3rWmKxMOcgOYzYDcX+3GEygw/dk+09EfqaM4m3dZPdbE+we9ufqlUdVpdQ2+d1isQwZH/QRfqjsf1zQ2CHDehvlefWYgmZkuglX18Oo8w7VVDNEIMoHU3Bi0Sp/7n7arWT7jzDjNmRLkd/RqhD90k/SCcmM5an3mHrFJA+EoHoT6/zCVy+GVGBU8J0Db4xXRjjtFYQh0nJnLDOd09rjU1ohwdkNaftUo+SCNpC88vao2t8IyzsmtHf4HlOYMAJjqEiIp7yMACY4FrhhN1XwAvTtn3iFtEKZj2AG5o8Og5ArWH7b2GB0HOG2SVkZ7RuEHVrHXmAgcQ9iL5cU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(230922051799003)(230273577357003)(230173577357003)(186009)(451199024)(1800799012)(64100799003)(31686004)(53546011)(2616005)(26005)(478600001)(6512007)(6506007)(966005)(6486002)(6666004)(38100700002)(36756003)(86362001)(31696002)(2906002)(5660300002)(41300700001)(83380400001)(66476007)(316002)(66556008)(66946007)(8936002)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzAwaWRrcTlOMHQwZzNwYitiOWc3UFZVdFBhVGhGSUcwM2gyUjdTaVBGdFdC?=
 =?utf-8?B?eTQ1c05wcDEwUVJSMGtFWk9KaUVINTZLc21tY1hhYitoTTJuN0FlZjZWdEtK?=
 =?utf-8?B?UzFzZ1Y0bUpzU3dZdzIzUTJleWxxT0hMalNBVlZJSTMrR2ltZTIrTmh3eE0w?=
 =?utf-8?B?a1JjQ1VnbXJyMWV2QUhReHJmdkZsU3FwS2NaVFcvVmFZREx5NmE4aXdsWkdy?=
 =?utf-8?B?bDBlektUWHp5WUJIeTZ6d3NUVk1XU3o5ZCs0cThpT1ZQRzN4VjRndmdubTd5?=
 =?utf-8?B?R2FQSm1QOWk4WUNjeTAvcTQ3eklhZ0NUbWUrelMzck9neXRKbTI4L2FJL2tB?=
 =?utf-8?B?bzlJYmxhVFBFN1VnTmZaNTgvaFc0NFlxajhISHNhMlFhTTJmRkx5Y0xXZ2Ri?=
 =?utf-8?B?cTEwbjI5Tk10N29MejljeDNCanpIdmwwKzhzQjYvN3ZWcHgwN09saUdmWnpI?=
 =?utf-8?B?WHlLaDMvNHp6NlI5Ty94ZXM5M2lMU0MxRXl6UGx5OTZscEt6MUhoTXZZcVZu?=
 =?utf-8?B?a1lSdWU3ZGxKTjlkSjc2dVJjMDZ6Sy9iUXJNazl1RTMyZXIwWDlzaDBaWnJi?=
 =?utf-8?B?eWU0RC9IbnJFczVYdTNJUXltc2FldEk1eE5lOSs4OThSNEtZd0MzUW42VHkz?=
 =?utf-8?B?MmIrcFgyOVdNRkVpaHQxa3Y1UmNtSFhHakJqcE5CdGxhdlV2UjVXdHJMOGZy?=
 =?utf-8?B?QUxBdWE0S01vTmx3a3QrZDFyWUNZUXFLM2lqYm8rM253ZDZRQVdIVjV5RDY1?=
 =?utf-8?B?UlhvempTOTdsQ2t4Nm9iUi93NVpFell0M3NqbkI2SXF0ZjVYTDhMWTRpVHJV?=
 =?utf-8?B?bzIyQXNKTWQ3MlZXbUdZMEJxbUZXajViWlFEaXc5dWJpdHk4YnFTWE9EQjE3?=
 =?utf-8?B?RWVjTXNRUWdDQVdpR3dMSUdEMHR2R2FpQTM5a3Fmc01IMXZFRnQySUJNaXpX?=
 =?utf-8?B?MG1WalNCRDYyRWFhT0MwUTQ0UHFnL2dtaU5sNmtNY2REd3RUT1dGR3hrMGtr?=
 =?utf-8?B?clNHSmlrUWVXaXRvUnFnMitWUmhxUjN3dUpZL2RWSGd5S2RGbFR6ZU1lS3VE?=
 =?utf-8?B?MFBZY1Y0eFM2RmlKVnNNajhXYU9pcys4eWpCK2hMWUJlU0tlTlZOekI0djF2?=
 =?utf-8?B?djB5NnR4NkYxUmY3Nk92a1JCUUhPeVpmc09sVWprZjl5TWVBY2NoWE9BMmVY?=
 =?utf-8?B?RlJGOEFmamZzYlJJLzFYRnpGa1ZBUDhpVmQvdlpMbUhrRUNKNUlUZnlYOEEx?=
 =?utf-8?B?SWQ0VEpvYzlnWGJCQngxME9pTWFUbkhxQ3dFbnhCRER1UUpFWDlqUlIxWWtE?=
 =?utf-8?B?K3p2ME9VYzNNYnhaV1pBKzlsT3FidEFLT3BWc0VFNzVBbXkrOTN0eDBRems2?=
 =?utf-8?B?ZmIvVnlLcytxZjgwWmhMQ2J5Nmp3NW5sTVVpK2VsMkM3NThMb0hqeFhKU085?=
 =?utf-8?B?LytOTFM2dFZqOXk2Snlnb21RSTYwVUVyWjhod3ViOGM0cnhnR21yUmUrLzVW?=
 =?utf-8?B?b2M0bUdCTzErNFArWTRjR3h3Z2lTNFhCMHRHNEZ1SmQ3M2lsVUd2N3FOVm5p?=
 =?utf-8?B?NjFkNkk1d1pRV3BSTDJzOEprU2VXdWVYMHpaWGV4bWtycDdGaGlsNXkzazBa?=
 =?utf-8?B?TzVRaCtaeFlnVXRvODBsUnpleHJQdGFncjRWdDJiVVhxWEQ5T0kvaE9lTXBn?=
 =?utf-8?B?UGI3dkNFd3ovbnZJQnVtQ3VZM0VBa2RqQ1ZxYy9zelJCc2YvbHovOGU3bGpJ?=
 =?utf-8?B?WGZmVDROOEsyUXoxSGtUTUNvVUNDNlVBalpiS0ZQU0ZoZXVudnhqeUtreVdK?=
 =?utf-8?B?eWtRWmRpa0g5djE2R2x1RTZ3aEJkeDBHRXlpdDRFRXdCL1lpRVR1VlhoSGFi?=
 =?utf-8?B?U2U3ZFIvWlZPaWFvaCtjWmhkZTRsWnY2TXVPajRpd29MU2FrSy9zNTgxQUVh?=
 =?utf-8?B?NEVlRUIrUnE3V3ZDTmZFeENqTXVVejR0dW1wbWhCNmNWcGJRVk8wcks3eUhQ?=
 =?utf-8?B?amdVbEJ0eXQzZTR6eUNEV3VEQ3NPcXdWUDdmcFFIZFVRQWM4bXNLTmFmUFJv?=
 =?utf-8?B?N29zMHVXU3lMZFQrWlhmSnZDRXc5R0R6QWtCeHdzUVJBeEVLL3ZBUSszem02?=
 =?utf-8?Q?AYinTonxEQ8ytujdbyNlwlSZD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21172a74-d701-42d7-ab09-08dc1070a97c
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 17:38:44.7819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3Sc6kfmuvc/FQ+LtDQIlLBHezcbRtYPKAwH97DhRS0znJL4H5v2cQ4YQLrylT9qhhn//n8C8bIFe+8IATgLww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/24 15:02, Melissa Wen wrote:
> smatch warnings:
> amdgpu_dm_update_plane_color_mgmt() warn: inconsistent indenting
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401051643.PPdbmG1U-lkp@intel.com/
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 9b527bffe11a..c87b64e464ed 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1239,7 +1239,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>   	if (has_crtc_cm_degamma && ret != -EINVAL) {
>   		drm_dbg_kms(crtc->base.crtc->dev,
>   			    "doesn't support plane and CRTC degamma at the same time\n");
> -			return -EINVAL;
> +		return -EINVAL;
>   	}
>   
>   	/* If we are here, it means we don't have plane degamma settings, check

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Change also applied to asdn.

Thanks
Siqueira

