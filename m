Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9404E88A3B7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEE710E80C;
	Mon, 25 Mar 2024 14:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gqnh6Tii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CCD10E8ED;
 Mon, 25 Mar 2024 14:09:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL5Ztdn8IViYA6WhxKg+tMD6aUGzm7ne4BLb9HUqZmaziGDBdAdDiPXPynb2/BCMvIIxHWOxgy/DyX9Mn4cuOD4wg35VDVyyUHL2xnOrCcmBj47x0PlcnV6CIgKqAIJPVvLKzxU/cizYHuBsf6D6lK+GvN4W/n/cTm1kQgrTWks481KIXuw/6ONRDcucXHgLNUSPWn9eoghL3ygCriOlHylmTl8ZlTkZW9iI3R72NWwsxa49H7nb2u11fBNlF+sM68XdOhDTrxBabeYeAnmdiAMFLTErznuMpPuDrOzFcwQDQawi+HRhD5nUBwuP/e2yv0jrNB7YAbvsQPumi6eYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTj3M1O2ZC/2kxtH7Wc9sblO1b1EeF66tqhU1MbgaAM=;
 b=aUr/JG5bAv/jUKdJoJw14t5bp1iHL/16zZFin5t5MkipcAHWJhISX0o0dWqYhIY2jDUPfO2jHCX2WIwStMkWXehZSG+prGRgMVjEf6K8qq02bXsyw+jOpD5jHGtRA7ENcKP5sjP9/xknNje+Ep11fkt7Y8dz7PvpA+NNG8A+bYs2hVrtqbyYayahwdCO21PGUKXQRjOqS04CYIyF8GP1oz7FaYuC+ur4ffmFGIpOmV/8mWKTL6j6s8IgRnADniGxdyDBN30kjc7lC2dZ+kaLuXR3rIZwzJC/YzNH33rODpDoNRY68iVcCjkrVVfFKFvcFtD17f0ReC2ulCCo5Kubnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTj3M1O2ZC/2kxtH7Wc9sblO1b1EeF66tqhU1MbgaAM=;
 b=gqnh6TiiR8+RjB6L7JY8DZ3cqn2HlqzEiNUNpvADE6TBOGy8ZzrciLGg2n9RK9GJWVkOj2Ap484x8W8wNP9MH9eXETsofuI4RHp/vVQemkTLxl4CW1b7z0zud6PpuHGaMKe+bA0KqTxeOqoCXHBUahv9/C4GQ3UtWP8SE7qdvmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 14:09:35 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::9494:43c8:64df:6c1a]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::9494:43c8:64df:6c1a%5]) with mapi id 15.20.7409.031; Mon, 25 Mar 2024
 14:09:35 +0000
Message-ID: <b4af9fda-8685-d486-95aa-ca46c11a2cc5@amd.com>
Date: Mon, 25 Mar 2024 10:09:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdkfd: return negative error code in svm_ioctl()
Content-Language: en-US
To: Su Hui <suhui@nfschina.com>, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Philip.Yang@amd.com, alex.sierra@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240325063148.3950639-1-suhui@nfschina.com>
From: Philip Yang <yangp@amd.com>
In-Reply-To: <20240325063148.3950639-1-suhui@nfschina.com>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::27) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5149:EE_|CH3PR12MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: f6922a75-7d6d-4d09-cec5-08dc4cd5338c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUlUB5TrVKsQnMfyKS3vhRGEeZjCv7zvLssM2L+k6GKrHRRdP1n0jACKlNWaScoUes+YaeeryCgIGjEHVg/0k1HV+e20Ezqqz7ZSiZdfvoi3xXG3gJmDiJX5tmLigu8w7L5oplxvu8DuLRD44pNFlEsdho4TkQxNx90i1NotoLJprsz6NpxogWpUKJm+UtyReIsfHbu6SpFQvs/PwBicokse8DSVkdiccZ3ubaFTZTvg1Ov+QLrn8L5XdTlrB4TMsSLqrpweQ7JYPQvNTiZMOzAio+ifGETs/NzPP2Usmz+/lHXqeft9uk7a0Gev6WssZfVbViKHUoWRPjoUehLqmOX4BbMHwxWlCIXzjvg5gQ6p+Rlzchkri7RXLID5YFkJXkQx6vva9E59bO89YVV5QhxCyIxB6Gvb5VDV5ueWvXv/lKG9ZYhUEE7DNo9axUqUgrAVDh4/Tr9BWvWXWoJYZbtHz4pQ74Vn0EnOOd7LFoTFqrYbeXgnw+mDNBV/tIxxvxHs00UFGraUI7S6RFxbSyYwr5xClTkxERErZ8ljePMMRu+HQrECoc17rx26RM+hlvnUkME+6wHaXHt45W8xPN0pXWqZkEL7Lh9H7ZbGhkP9pXCGp2CsKJcCp3QF7xcQ8vqYSSASw5eCFzV1B064vz30kpgqb2QlZVdNciQV8SU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlNnT3RTenN5VVVhVFdwaC9CUmxGY0NEdDZobzV5ZGtTdWZOYkZ3aTh1OXpC?=
 =?utf-8?B?MTRqZXNnck9EZ01zSWkwK3FPeFdEWkZvMWU5aVZNMDNEdnQ2OExKOVFZNngx?=
 =?utf-8?B?em80MmF6bFdyOCtMYjlDSTNPR1VoeHFOL1VGbnBWcm1Va0ltWDgyWWRlS2gw?=
 =?utf-8?B?bUpTaDhQVTcyamhNRXhRY1FKN1pUZnh3NzgrbDY4dHVwUWNybXMxYUVNUmNX?=
 =?utf-8?B?VlpwTm9RN203T0w5b0FYS1BQdDY2Und6KzhZUC9rcG1vL0gxRTRsN3RINGhv?=
 =?utf-8?B?NjRNWWI1cTd0WjE1czhaSlRWZkF5TGx5QmZ5aWFlK3RuODB0d084QXBUcVBT?=
 =?utf-8?B?azB2NUpIZ2NGK2NiaVUweHJlSWFXMEEvUXdkVGw4VWM0VGVNUk4xd3gzRTFx?=
 =?utf-8?B?eXlxNFo0Sm5FVmVJc1h2R1RqVjN6Y1R2R2lHRURhVStPRWRkQ05aYmxoUm9C?=
 =?utf-8?B?Qlk4RVdDTmRZc2RjcnNNL2JETmg0T2pQWGxRb0IrMndGZ09iVG00c0xrOXFl?=
 =?utf-8?B?TExCdml1VHJqL1RvSW9ienlpKzljSjBTZkdxVFhCNnQydXhqbjMzeEZQV0xt?=
 =?utf-8?B?a2s4Qzd1djBiL3dxb05WQVB0dDcwR3ZCa2tCTnR5aENnRTRhOXhSZ05LU1d6?=
 =?utf-8?B?VnVnUXBNY0kzV2ZNZjlRYUkvOUFKLzNvWHR4MFlmY2twZjdGKzRRdVVrTlFH?=
 =?utf-8?B?MXhVVEk3cDh4YXE0L3hqL0lOcXN1UzdRc095d3ZmNkNoR1JJbSt1bDNqRWx2?=
 =?utf-8?B?bEJCTE5VTW1xZDZpelMvR0VHckp2QmhoRjlzR1JFREgwYm0wRUFxNWtmMm42?=
 =?utf-8?B?dzJpT29yZC8rMVpWREFSM1pTZEhCblhVcDByblhqYzFDY0NHY2RiT1lheGZJ?=
 =?utf-8?B?eGg5WXNKbkhYcTRwcEdlS1lJci8xQTZuVDdXMk9qa2E3aWs5T05UVkxMUWJ3?=
 =?utf-8?B?TDhqVllYc2c0WC9FdXFGaUVvU2ZsZEJKbzhMTWRoazBJamZ1YmFxdU5PRGVh?=
 =?utf-8?B?OHFDOWs3R25FZzZMbzd6MkVXZVl3S3h2VWRVb0hoTHMrRjVIb1dGMUQ2RlNR?=
 =?utf-8?B?RTA0NkZ2MVNPTEl5dXpheU42WURWcDE5cUVzc0lYT1h2Z1JLTW4xTjN4WlNX?=
 =?utf-8?B?S2ZITWtkWE55ZlJqbW51SGc1Uk44WlU2ekEyOGtWZTErNjJ0RWNFK3pLZkZk?=
 =?utf-8?B?NlVnblR0NnkrZzZKL3JYTEY5Q3hWOTlMeW0zMnQxd3k3RXpBTUliS0ZKaHVW?=
 =?utf-8?B?QWVjcnJNd0lsRXV4aU5pKzFmNEQrYUx0U3pHOUthbWR3SmNuY1JIcjZWc0l2?=
 =?utf-8?B?d3F3TTA1QmFiVVBoRi9sN3o5SWhWakRmK2I0YWJNZWVVVk1kMnhaZWVtSThG?=
 =?utf-8?B?SUlVaWVlUFA1RUlud2hycWZYckNSa0dzT3U5YmVqK0YwYk54VWtvQzh5L1lp?=
 =?utf-8?B?SFlqZXVnallFNnBlWmRpV1M2aGxGRTdhbTFTQXBReEoyWnVCNVpZYURjVmJ4?=
 =?utf-8?B?TjFzNDlnQTgwMXlSSWh1b0EyTTd1QzlRSExQTWI2cXdDbUo3bUZVV3lERXVt?=
 =?utf-8?B?YTdvY3lZeUNhUzdFc2JQdWg3U0htN1RvUkg2TFlYUHZPZE5ZN3lOK2R4RkJw?=
 =?utf-8?B?QjRBYWg0Znk0c0ZGWjdxYlNmcEZBemFlMUd2TVdaSlVBem9BUllydXAxMkc1?=
 =?utf-8?B?V0dUT0hEMVVZSVdRT2ZJZDhMWmN6RHVPa0Iwem9ZalFoYTEzSVFUTDhYd3k0?=
 =?utf-8?B?TlFVdC9HQ0IyTmNwWXhDdkw4MDdRbExUaW9nRU9MbGxBcXNyRTZubGk1NVJl?=
 =?utf-8?B?UDBkWGZXMzhFUGw0Q0Riem5ybEJjYzNYR2NUdW1zdDV0YjNjTGxVeTRudUto?=
 =?utf-8?B?bFhUTlRSKytSTGQxNHllNDExZ1pwcUZrYndtU3BiYkIraHJGV3JPY1FVVjRo?=
 =?utf-8?B?aEtPWHM2QXNWbEkwc0ZzNHVudTk4TWl1Z3RiTFJNS0ZQeXNDSDBOUDgxWlZ1?=
 =?utf-8?B?dmpYSnNQdTJ4a0JLUmxFa01VMmhqZjJMY0R2Q2lGVCtLcHhiKzBjeXdNV1Ju?=
 =?utf-8?B?Wk5NQ1UrUWkzNTZyK1VNWXVZVElmcmk1aEp0VFVST0p6cERqbEpLWHVNd2Za?=
 =?utf-8?Q?FP38=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6922a75-7d6d-4d09-cec5-08dc4cd5338c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 14:09:35.8067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqFxFpsoI0aMYcYQR+hQMgVEZ0iHVEiYVBw07HztaUkjwDcM3YSZLcNpw6khbfQN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7738
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

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2024-03-25 02:31, Su Hui wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240325063148.3950639-1-suhui@nfschina.com">
      <pre class="moz-quote-pre" wrap="">svm_ioctl() should return negative error code in default case.

Fixes: 42de677f7999 (&quot;drm/amdkfd: register svm range&quot;)
Signed-off-by: Su Hui <a class="moz-txt-link-rfc2396E" href="mailto:suhui@nfschina.com">&lt;suhui@nfschina.com&gt;</a></pre>
    </blockquote>
    <p>Good catch, ioctl should return -errno. I will apply it to
      drm-next.</p>
    <p>Reviewed-by: Philip Yang<a class="moz-txt-link-rfc2396E" href="mailto:philip.yang@amd.com">&lt;philip.yang@amd.com&gt;</a><br>
    </p>
    <blockquote type="cite" cite="mid:20240325063148.3950639-1-suhui@nfschina.com">
      <pre class="moz-quote-pre" wrap="">
---
Ps: When I try to compile this file, there is a error :
drivers/gpu/drm/amd/amdkfd/kfd_migrate.c:28:10: fatal error: amdgpu_sync.h:
No such file or directory.

Maybe there are some steps I missed or this place need to be corrected?</pre>
    </blockquote>
    <p>Don't know how you compile the driver, amdgpu_sync.h is located
      under amdgpu folder, amdkfd/Makefile is included from
      amdgpu/Makefile, which set ccflag-y -I correctly.</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:20240325063148.3950639-1-suhui@nfschina.com">
      <pre class="moz-quote-pre" wrap="">

 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index f0f7f48af413..41c376f3fd27 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -4147,7 +4147,7 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 		r = svm_range_get_attr(p, mm, start, size, nattrs, attrs);
 		break;
 	default:
-		r = EINVAL;
+		r = -EINVAL;
 		break;
 	}
 
</pre>
    </blockquote>
  </body>
</html>
