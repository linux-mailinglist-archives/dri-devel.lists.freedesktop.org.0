Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75510689F32
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 17:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C063A10E0D0;
	Fri,  3 Feb 2023 16:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B04110E080;
 Fri,  3 Feb 2023 16:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoUrqxrhrWpy+zYr1By1l+rHr4DVFlfST/6BwLxQ6FBZXeV9URdOMfbm9IiWKGqniMK1w4bLpR/XhWwPDFLFiudptHTuHJEPRz6VlQCgaxu0hy4tuDl38IHqnqawegFq9IkJva9GX483qsSEurApj0Vsj++hKED1a2nSsMBZWaqAQ80LnDI4t1+WqTnziOaEt8oTq6uMz98Oiluem4yMYatU9fT4RKdoZGiZFrDfEr+54FcsAxey/o2q3+0rUvWQKsjNG0i9n0FMWKuS++s5glpcXaT/4HsJJQ8IQpUQ2Zaf5qUoUPqjT5NwqLk/yl0H2+qVUxCvy/Ze0odLaV5Tlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG+gKIbo6OpZZY/jLmTr42U5CDfvKNcNDj6KTjy1a/Q=;
 b=LTGCNniVPXpFPj9tqPLcSeE0lm7FeqVq7U8Bbx/tVPe9MOS+Xn0ZV2nHTrUgp/pcSzRvH6+JAjGozCzWspmiWhvaIlKOIHrQHF4iE0NIFZ1r8C04GSlKvyAZzCD/GpPhvY6nrFL9iPMP98QFp4pnF+0odHT5Auy2PU1xHO+4o93PTHx0aXiehgO1YwIYNWB8VeWXfcTcH3U3u1oaXpbc0hPRMagSCzWCAexQ2yPH/dP7PezLSGXx8n3EhWPRWLzCZIJ9q/53TPZ2ooxjvwskpLtxfTdYZHcHNuKgG8qrs29UY2sp49iiNI8dFkg5l8alsnu3KLjAm13ZpBeLgzMzAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG+gKIbo6OpZZY/jLmTr42U5CDfvKNcNDj6KTjy1a/Q=;
 b=qkC4wtNLP7pvUtTRc67Bhnfy2I93cvp9//yR1JBMz4HrkIwk/DgHUmr4d4C6unXrSjJOMX3g5JrKgPsYBqq2YqHTCv/MVMuLt0Glu9A4QGerefYChQc3DNhTWGEM9AQQ3iGuY6RnojXBOP/MO2cK4jPQNkBBPxo5mgEAGPeEZMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by SJ1PR12MB6027.namprd12.prod.outlook.com (2603:10b6:a03:48a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 16:26:46 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::6947:fb51:bf73:b72e]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::6947:fb51:bf73:b72e%5]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 16:26:46 +0000
Content-Type: multipart/alternative;
 boundary="------------ob0dUsK0C5mQbg8eJoRmobcx"
Message-ID: <b4f1a552-384c-c033-23dd-7cfe297d6b15@amd.com>
Date: Fri, 3 Feb 2023 11:26:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amd/display: fix read errors pertaining to
 dp_lttpr_status_show()
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230203154326.76121-1-hamza.mahfooz@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20230203154326.76121-1-hamza.mahfooz@amd.com>
X-ClientProxiedBy: YQBPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::42) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|SJ1PR12MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 86768eb7-69ac-45f5-7c0c-08db06037131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJKrHQuNsm6vYtOalBtPcmCcLlUcRcJRRMpeL2KjXFC170fjBb+5d/TfRxPOwshRJYUaR0GkUNcUwHZiz28+qtduMY5645ZlKdMYfRPvwtiAWiWU0ryKlhd2weaWSH9NMAHPSlcxEcpFABEQaJ1LkYiKgOt2ZGG2ItCiTNfjLDCVDtzVU9dLlfmvHbkUGaGTnTBeLq9eB6GtOQbk3berTPGtEbYXDHma/PDNSQbJxc2iE4wWsxTX9bxJXUESIP+8KxqnpfznDXsMwjTYEsj6X1/paz8Az3fIALSyr8mQ8DNgJZU2J9VCTqF8XSBewtm6olFbBtsEDs1eti/ifcIdmD7RzJ0J78FKsSrRGjUeAKsETE9a1sCuwFPyyPQF7/cbqMk1Lj5mlKTQGdi7Din7yQbMrliQKmAvCP0wIAhdGouSw8XTQGtdQem/zAiz/dQR8pcgght/WsAsM66xka0HuxImv9oIfAgZ7cNpbBV5FOyWG+J+g0Fdt9d1JH5WNOlya+2b80lFg3U20KMdv8nEJyC3GPbFnUW6YjWLGXaQYV+Vc0npy9+jTAjFU7wDgJnxbTqf7G6IdIfFtJfLgG7kdBKwd3YpS2dFnfrK1kn4AzZmcl66lpXK/TdaGnvNSOBci3aZRPJO5DNWXO2LjOP7uNEC5KWNGusZl1cfbFkEYc52alhDK3YGhdUb3DdyuzMw7S4jCZPNygkkh0/HCQMsMSIQ7j9vXhtIJBzN+TZqWY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199018)(41300700001)(31686004)(6486002)(6666004)(53546011)(6506007)(33964004)(5660300002)(26005)(8936002)(6512007)(31696002)(2616005)(38100700002)(478600001)(44832011)(186003)(316002)(2906002)(83380400001)(54906003)(86362001)(36756003)(66476007)(66556008)(8676002)(66946007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3NDTDVoWGJ2aE41Q3lzeWhYanVtWitUU0JCYXZwRGI2blUrYVVlcVlpcXNM?=
 =?utf-8?B?MEcwczE1S011eUJtZWlBY2ZWeXcycmRDcHNMTjVPcVg0UFNQOVF1R3FrN29u?=
 =?utf-8?B?bmx5Nm9mSmZ6K085K0wyajhwR2dzRmdBMUhGYW5uNmQxOFA4Rkd5K3VIRCtv?=
 =?utf-8?B?SUwzY2xrOTE5SmtRSEdyWVNZYWZKVStmc2gvQVlIQ1pBSWxEUzN2ZG9mTWw3?=
 =?utf-8?B?eU9maWJrV2pxRzVpTDl0OXp4RytITGx1MTI2cXdRT3J5bVFYM1JBSTRjZUlx?=
 =?utf-8?B?Rksva090STU0RVZXcjA1c1RpQ2dCN0JOcjcxS3U3azNsUTY2TTd2dzlrODBs?=
 =?utf-8?B?bElUM1V4c1J1c05tNXdIVFhTMzNlbHFnUFRiRkxNK0RCdEs5NXRsU2xqRm0r?=
 =?utf-8?B?V3VITjB4Mlh1WWRCamVCNnAvNlNSVGNZTlR6M3pwL092LzBYMjM5WmNyMnhX?=
 =?utf-8?B?MS9OUDlkakxBeGFJRmVDVkVobHhXMFJobVpGNVMxYWpZZndRT0pOYXVqa1Bq?=
 =?utf-8?B?RjQ1a0ZrWlJLU1VLV09vNGJ6T24zWld0SStUekNJSWp3OGFNTUdoaVVFZ1V5?=
 =?utf-8?B?SEFWczkveUxiZ29hMzdDdDFCY2ZCTm42dzBnZ1h0SXYvUGpXaGpwTHk0Sjh1?=
 =?utf-8?B?MzVkQlpNRDRScUsycGFONWZ6UDNDNnp5M3k0eU5hb2JKTFhucTZWd3RIeXFh?=
 =?utf-8?B?YkxZbFRXeGRvMzRUQUdoTUhuSm16WXdpM2pSN1JjMFJHSEtwZHc5RWxEc0dJ?=
 =?utf-8?B?Z253eERrNEo4M1lpVStLRCs2OXJqNDYyVnpPZDJCVzZGS2RzRG5UeUVUSkZm?=
 =?utf-8?B?dnN5ellXOEI1N0YwbU9ralNFcjY1ZURscUlvMWVoSVdjUWduNDk1ZUxBazFj?=
 =?utf-8?B?Z2RvVFNJRTFPM2wzQ1NpN3RkaU1nRTJIci9vUU9NWFlQVHozZ0tsN2RtVEty?=
 =?utf-8?B?UlA2TTVLS3djM2dueFZLak9vY0VNdzJQSTVVUkFwRlVZc21RNytERmVlZEdS?=
 =?utf-8?B?U3l5VkMzZ25qbThTYVlCOHNJZm0zblZUc09qTnhrbkJVYVE3OGswUStOVmZ6?=
 =?utf-8?B?K0duRFcxTUhiYk9BcG10SzVzK0Z5N3YwYVV4Q0dQTzhJVTlYTFlZYXNmcVlI?=
 =?utf-8?B?VTBQRTI3YTdLdkZrcTFpM0djTisvRmJ3Mkh2aER0YkVOdHg0ckZmdlFSUFRB?=
 =?utf-8?B?aE1TUDZSa3lKUGRFVkc3VlJxRlJlcWxUc20zZ3pWQXlCUkdoVDBFczNtenJq?=
 =?utf-8?B?dDlXdGVVQ3puanpnNkhZUEM0dXBReFBkbU9aZXdoWTBRc3V5cGMzV0Q4bkNv?=
 =?utf-8?B?NVJYUk92NlUzck0xM2pyVFRYY1hMam5Rb2RHZEtPUDB6ektPT05tRXdVUVh5?=
 =?utf-8?B?NzJBQjhhZCs4clliSHlPTml1d0kxM1Z2aEV5Zk5yY1FNditUVEdIUTRZcUZa?=
 =?utf-8?B?QzNwWEJLZHZkZkFkV0o5cjYvUTN6RnNEeS9hb2hQQnBFZDNBZGNocjhxdTVz?=
 =?utf-8?B?S0ErSEFIWWdpOXdMakJSRExwQWxpVW9lNGJmemt3WWxNK2tLYlNzeVNFMjhq?=
 =?utf-8?B?eG0zNkV4UWJzRjRqbldpTE96YzZHQVdyK0pDcGU4RVdTRm9LQ0hXNmt6YjJw?=
 =?utf-8?B?dEVwWEFTaXk5QkdlbEVBSDFRcmx3cU1GcjRRVitjek0xSGhnRlkwUkV6aG5a?=
 =?utf-8?B?OTRSL2t6aENDYUw5RHRzcWxqQ3BzaE1TNEZxRkJwT0l1N2luWlg3N1Jkandk?=
 =?utf-8?B?RG5zZ1c2QUIxMVdHZWpzSnFKNEpFVUZ0U0R1SVVEOVl1cy85Q0RmR1k2OFM5?=
 =?utf-8?B?dHU1ZHg5TFlYT1VpTW12bDJ3dnE2YTIyZllWNnplMjdPUi9JYVNtMElhYXdm?=
 =?utf-8?B?NlRBSTMwY3BLQU0xWHIwMFgwNnhmcHJpNTN2czVpSW94eG4vQWVlQ2pxY2t0?=
 =?utf-8?B?bUNSMlBxMnUrMUdwbncwWFQ5b0RZS0ZGNTRZSnBiZndzQndBdzZpWldhalFv?=
 =?utf-8?B?aU0yb21nTE52eTNVRUdrOHZuaE5FODFsSUpuUVpoNDdNdWExVUEzQUZEcTR3?=
 =?utf-8?B?ZXFhQ3dBcHBTUWhwTStTTkJaL0w0a1RiZ1pORFdYKzdDNzNJbWtQK1hmTW80?=
 =?utf-8?Q?rJLNy+kmM4co1hiZqxLP5O1QP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86768eb7-69ac-45f5-7c0c-08db06037131
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 16:26:45.8825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tS2V4+xiid9NsQsXxvKovxl+fh0frc+ojIFBESMfGvycXz0iixlRI8hYcCi4SqCkAzaED44DRFbudgHkKifiSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6027
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
Cc: Alan Liu <HaoPing.Liu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Leo Li <sunpeng.li@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wenjing Liu <wenjing.liu@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------ob0dUsK0C5mQbg8eJoRmobcx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/3/23 10:43, Hamza Mahfooz wrote:
> Currently, it is likely that we will read the relevant LTTPR caps after
> link training has completed (which can cause garbage data to be read),
> however according to the DP 2.0 spec that should be done before link
> training has commenced. So, instead of reading the registers on demand,
> use the values provided to us by DC.
>
> Signed-off-by: Hamza Mahfooz<hamza.mahfooz@amd.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 72 ++++++-------------
>   1 file changed, 22 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index e783082a4eef..cbc241596c1f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -36,6 +36,7 @@
>   #include "dsc.h"
>   #include "link_hwss.h"
>   #include "dc/dc_dmub_srv.h"
> +#include "link/protocols/link_dp_capability.h"
>   
>   #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
>   #include "amdgpu_dm_psr.h"
> @@ -418,67 +419,38 @@ static ssize_t dp_phy_settings_read(struct file *f, char __user *buf,
>   	return result;
>   }
>   
> -static int dp_lttpr_status_show(struct seq_file *m, void *d)
> +static int dp_lttpr_status_show(struct seq_file *m, void *unused)
>   {
> -	char *data;
> -	struct amdgpu_dm_connector *connector = file_inode(m->file)->i_private;
> -	struct dc_link *link = connector->dc_link;
> -	uint32_t read_size = 1;
> -	uint8_t repeater_count = 0;
> +	struct drm_connector *connector = m->private;
> +	struct amdgpu_dm_connector *aconnector =
> +		to_amdgpu_dm_connector(connector);
> +	struct dc_lttpr_caps caps = aconnector->dc_link->dpcd_caps.lttpr_caps;
>   
> -	data = kzalloc(read_size, GFP_KERNEL);
> -	if (!data)
> -		return 0;
> +	if (connector->status != connector_status_connected)
> +		return -ENODEV;
>   
> -	dm_helpers_dp_read_dpcd(link->ctx, link, 0xF0002, data, read_size);
> +	seq_printf(m, "phy repeater count: %u (raw: 0x%x)\n",
> +		   dp_parse_lttpr_repeater_count(caps.phy_repeater_cnt),
> +		   caps.phy_repeater_cnt);
>   
> -	switch ((uint8_t)*data) {
> -	case 0x80:
> -		repeater_count = 1;
> -		break;
> -	case 0x40:
> -		repeater_count = 2;
> -		break;
> -	case 0x20:
> -		repeater_count = 3;
> -		break;
> -	case 0x10:
> -		repeater_count = 4;
> -		break;
> -	case 0x8:
> -		repeater_count = 5;
> -		break;
> -	case 0x4:
> -		repeater_count = 6;
> -		break;
> -	case 0x2:
> -		repeater_count = 7;
> +	seq_puts(m, "phy repeater mode: ");
> +
> +	switch (caps.mode) {
> +	case DP_PHY_REPEATER_MODE_TRANSPARENT:
> +		seq_puts(m, "transparent");
>   		break;
> -	case 0x1:
> -		repeater_count = 8;
> +	case DP_PHY_REPEATER_MODE_NON_TRANSPARENT:
> +		seq_puts(m, "non-transparent");
>   		break;
> -	case 0x0:
> -		repeater_count = 0;
> +	case 0x00:
> +		seq_puts(m, "non lttpr");
>   		break;
>   	default:
> -		repeater_count = (uint8_t)*data;
> +		seq_printf(m, "read error (raw: 0x%x)", caps.mode);
>   		break;
>   	}
>   
> -	seq_printf(m, "phy repeater count: %d\n", repeater_count);
> -
> -	dm_helpers_dp_read_dpcd(link->ctx, link, 0xF0003, data, read_size);
> -
> -	if ((uint8_t)*data == 0x55)
> -		seq_printf(m, "phy repeater mode: transparent\n");
> -	else if ((uint8_t)*data == 0xAA)
> -		seq_printf(m, "phy repeater mode: non-transparent\n");
> -	else if ((uint8_t)*data == 0x00)
> -		seq_printf(m, "phy repeater mode: non lttpr\n");
> -	else
> -		seq_printf(m, "phy repeater mode: read error\n");
> -
> -	kfree(data);
> +	seq_puts(m, "\n");
>   	return 0;
>   }
>   


Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--------------ob0dUsK0C5mQbg8eJoRmobcx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/3/23 10:43, Hamza Mahfooz wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230203154326.76121-1-hamza.mahfooz@amd.com">
      <pre class="moz-quote-pre" wrap="">Currently, it is likely that we will read the relevant LTTPR caps after
link training has completed (which can cause garbage data to be read),
however according to the DP 2.0 spec that should be done before link
training has commenced. So, instead of reading the registers on demand,
use the values provided to us by DC.

Signed-off-by: Hamza Mahfooz <a class="moz-txt-link-rfc2396E" href="mailto:hamza.mahfooz@amd.com">&lt;hamza.mahfooz@amd.com&gt;</a>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 72 ++++++-------------
 1 file changed, 22 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index e783082a4eef..cbc241596c1f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -36,6 +36,7 @@
 #include &quot;dsc.h&quot;
 #include &quot;link_hwss.h&quot;
 #include &quot;dc/dc_dmub_srv.h&quot;
+#include &quot;link/protocols/link_dp_capability.h&quot;
 
 #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
 #include &quot;amdgpu_dm_psr.h&quot;
@@ -418,67 +419,38 @@ static ssize_t dp_phy_settings_read(struct file *f, char __user *buf,
 	return result;
 }
 
-static int dp_lttpr_status_show(struct seq_file *m, void *d)
+static int dp_lttpr_status_show(struct seq_file *m, void *unused)
 {
-	char *data;
-	struct amdgpu_dm_connector *connector = file_inode(m-&gt;file)-&gt;i_private;
-	struct dc_link *link = connector-&gt;dc_link;
-	uint32_t read_size = 1;
-	uint8_t repeater_count = 0;
+	struct drm_connector *connector = m-&gt;private;
+	struct amdgpu_dm_connector *aconnector =
+		to_amdgpu_dm_connector(connector);
+	struct dc_lttpr_caps caps = aconnector-&gt;dc_link-&gt;dpcd_caps.lttpr_caps;
 
-	data = kzalloc(read_size, GFP_KERNEL);
-	if (!data)
-		return 0;
+	if (connector-&gt;status != connector_status_connected)
+		return -ENODEV;
 
-	dm_helpers_dp_read_dpcd(link-&gt;ctx, link, 0xF0002, data, read_size);
+	seq_printf(m, &quot;phy repeater count: %u (raw: 0x%x)\n&quot;,
+		   dp_parse_lttpr_repeater_count(caps.phy_repeater_cnt),
+		   caps.phy_repeater_cnt);
 
-	switch ((uint8_t)*data) {
-	case 0x80:
-		repeater_count = 1;
-		break;
-	case 0x40:
-		repeater_count = 2;
-		break;
-	case 0x20:
-		repeater_count = 3;
-		break;
-	case 0x10:
-		repeater_count = 4;
-		break;
-	case 0x8:
-		repeater_count = 5;
-		break;
-	case 0x4:
-		repeater_count = 6;
-		break;
-	case 0x2:
-		repeater_count = 7;
+	seq_puts(m, &quot;phy repeater mode: &quot;);
+
+	switch (caps.mode) {
+	case DP_PHY_REPEATER_MODE_TRANSPARENT:
+		seq_puts(m, &quot;transparent&quot;);
 		break;
-	case 0x1:
-		repeater_count = 8;
+	case DP_PHY_REPEATER_MODE_NON_TRANSPARENT:
+		seq_puts(m, &quot;non-transparent&quot;);
 		break;
-	case 0x0:
-		repeater_count = 0;
+	case 0x00:
+		seq_puts(m, &quot;non lttpr&quot;);
 		break;
 	default:
-		repeater_count = (uint8_t)*data;
+		seq_printf(m, &quot;read error (raw: 0x%x)&quot;, caps.mode);
 		break;
 	}
 
-	seq_printf(m, &quot;phy repeater count: %d\n&quot;, repeater_count);
-
-	dm_helpers_dp_read_dpcd(link-&gt;ctx, link, 0xF0003, data, read_size);
-
-	if ((uint8_t)*data == 0x55)
-		seq_printf(m, &quot;phy repeater mode: transparent\n&quot;);
-	else if ((uint8_t)*data == 0xAA)
-		seq_printf(m, &quot;phy repeater mode: non-transparent\n&quot;);
-	else if ((uint8_t)*data == 0x00)
-		seq_printf(m, &quot;phy repeater mode: non lttpr\n&quot;);
-	else
-		seq_printf(m, &quot;phy repeater mode: read error\n&quot;);
-
-	kfree(data);
+	seq_puts(m, &quot;\n&quot;);
 	return 0;
 }
 
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Reviewed-by: Aurabindo Pillai <a class="moz-txt-link-rfc2396E" href="mailto:aurabindo.pillai@amd.com">&lt;aurabindo.pillai@amd.com&gt;</a><br>
    </p>
  </body>
  <lt-container></lt-container>
</html>

--------------ob0dUsK0C5mQbg8eJoRmobcx--
