Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297896BD259
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 15:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B22A10ED19;
	Thu, 16 Mar 2023 14:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C456D10ED07;
 Thu, 16 Mar 2023 14:27:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W64Fz+ynTjaFL1CSqY5LdBkfsjg1p+x2E3OHO7pKkalqAkPv1H+n6tNg8axEoY8jvh5U3t9/HZtRWCDqIOLdYTMrwfUgnBFVm5Sqduu51ewdIye8itLAeQmQY8xrbaRxuLIQkjY3PQm5IJEcGRhrHXBcNNyyMr2+bXAnD+/wIMYfh6fqvH+4NNfelVo2j93IgsSOwFQMQDiFM+GXMthV7LuRnuV57r4ZHP5rYntEpWfhUDlbM5YenchAyIcpnCx3jYrHiwl8AUbN4Ht7BibQc54KBL+/F4Ap5ZaUnZGdAG3VSELhsO4TtJUeRASM6CflixdiHitJWWxYxflmzF5bbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIR8F9iU9ybQgdbuOvLE+tacp9QExuSO+M0BZt2N62c=;
 b=JSZsCqgGBfYMl4XO/xn/wCyujIXelXRy+qb55VjTASgviLpd2z3NbPDC7bW351YNl5XB6EB3QrHBwSzX6ID3h3dU2whE7P4fcA7F9k0Oy7j9nc1+6SaPZZUwn6peYmsxLhe1C5Kny/7HmWC12IhNirtqKRu4BXvcMDBCATk9x4NSD0XGtjnl5M7ZAVctd1Vh6spXLmYy7dX1WisHul3KvkDleBm9MUWogIIRJqfl/40RCJfXXs2yz4DOTi66pj+ktNvYtKB0s1K6C5rw2jj2uGJEHqOALZs3YyxkqlVWGY2ojIauopR/Zj5cNuxhxdM8C3O1k/lxXIgrQwjXZv2raA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIR8F9iU9ybQgdbuOvLE+tacp9QExuSO+M0BZt2N62c=;
 b=k/9wseldoxsFlSMvwglaMwyhAs6TNUDxl+6pjJah/vwoWmqYI2av3YMVnQq01Dyu/EJJIauksXdFY9EwtdpGeZZeZ7wJb9Y1/3JTEyWc7w7DSzjVf+cpDyc0Mk5XPSN2Q2AemaJjegMkuVO4EOsESVhUI51A/rz8ONiJYthZS8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 IA0PR12MB8714.namprd12.prod.outlook.com (2603:10b6:208:488::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 14:27:46 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.024; Thu, 16 Mar 2023
 14:27:45 +0000
Message-ID: <6aa169fe-4453-2eff-4c41-8e650d11c22f@amd.com>
Date: Thu, 16 Mar 2023 10:28:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm/amd/display: make is_synaptics_cascaded_panamera
 static
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <20230316095143.73368-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230316095143.73368-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::25) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|IA0PR12MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff93055-b440-4e51-e4eb-08db262a9c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibzAi+sOFEKe3z/1RVJaompVeiLMm1FN9G1te0WtDU6VewTtXO/rNYTXU+T0POFgq5Q7TzAJJflYrW+XRnT/Ydquy9z2aMG6kAoC51n7ae+4b3oDY2FvdLB6VgxSRRnHs97RSSaAt3dcLveRytUSBy/t0I+wKl20iKYtKeG0TYGjMQI+7vv7S/G99Dy+LHEIufpAtazxtT/17TdB1eDrKYm2sXBS853ADYC5W3rN9Du/UXgRyQR5enXK41EfTlMeqsLlKLHgu9+SJ1vVZaRO64kimaoEKWVTKZayYa8lDDVNGneKreqO4eEYP1hsSIIm8btoglZzedBGG5JbGUgukYPHdNylCk5Ccc19IYpDUsmflcT+3EQoxNpSBETdMJR6saDg//M1GFKWExV7b96vEbEKl0IoJlYrWoxBO4ZqSdWd0RTHsQNBHphI/8JknG5Y0+QDtmWGj+m/6G+5HJl5GXuJPVm0PNFSfPiZqZ6VWvIQjTYLpf8Wgrnu3ZehuM2Wl8xHKkyfEiAPlxQRy/csVohCJw4Zq7gKRb5kJYDkCPDYobP0kv8gcPr9V/6rBQudQNSvtagoqSZ5fueRduZek0RPlNX6WUCA8VDzccK3PvtNp/g8YGZZSZGIXei9olI7wXjhqY2VY0WMnu9T7Q6/o/9T4dPLVZ7n4HsUuDlB8/pDR0eufcEmyUYp1x+vbko43Bo59Am1AKb35VUKR927N6T4+dPFGLXbD8pvT9pI5Os=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199018)(31696002)(2616005)(478600001)(83380400001)(5660300002)(6512007)(966005)(6506007)(2906002)(36756003)(26005)(53546011)(6666004)(186003)(44832011)(6486002)(86362001)(41300700001)(38100700002)(8676002)(66946007)(4326008)(66556008)(31686004)(66476007)(8936002)(6636002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkVoZUJnbzVBU1BOYXFCT0pydlFTdWUzdmtyS2ZBVjcyNnRIL0N6NjQyclZk?=
 =?utf-8?B?WXFJZHRzOXlrVmx0TmtoVDM0emh0eGRPdWpkeitmeVlJd28rOERKNTNIcGgw?=
 =?utf-8?B?cEtEcmhXSDkyR2Z1YzB5ZWtINHpDbEZ5TjdUSGExcm05NVFGOGUwbWFySzZZ?=
 =?utf-8?B?OGtkU2w3aFVDL3g2aDNicWNFcEtNbFgwd2xSYWtOREdYcHdQUGkyaE1FTXRG?=
 =?utf-8?B?bjkzZnpjekR5WFNRSk1LcUlaVHFBSXFtelgxMWZuZkkrcnBEUVdTL3ZqNjJH?=
 =?utf-8?B?MjQvOU5HQ0RVazJJVVBYUnBQdGROdE5UWVhtWmt0ZnNTRkRFZGJ0U3c3MkpV?=
 =?utf-8?B?NXZ0V3BUYUw0S1BrNFczM25QTDlFNHVXOVRUV25lejBpTXZtaFYrR25VZzhV?=
 =?utf-8?B?aTRaQjNtYWJyOUV3Nk1wTGFkdU9oNHdlVVQ1TCs4VnN5SmhDSHgwbzB4S0I1?=
 =?utf-8?B?ZVN3T1YxQTR1ZEE1T2gwMS9iNS9Ed1F5dnhwWEVyNHJka01MU3FVbUhVaUhP?=
 =?utf-8?B?OXRjK01IOWNBZkEzTmlxTFk2dWQ5anZtaDB0eVpyWnhRbWRPWmlaNmJtdFhv?=
 =?utf-8?B?TFJTYy9XSXVHWERUek50ektGM3lrcE5Sd3VSVkk2ekcrVytEQkF0UnIrN01z?=
 =?utf-8?B?MTltSEcvSUZYK0NFZU5PWUE2ZStuOGRwNzd4QlhOQnZ5cUpmMWtGWXR1VHFK?=
 =?utf-8?B?bXNBREsyV2VWTW4vZ0VXTGlrNTlWR0xlOE11SjZ2b2xmbU11TEtvUGlvd1Q4?=
 =?utf-8?B?bFdRR3BtaDl5OStwTlZOeWh0c3dRYXVjNmkyYkc0UDMyS3JqcDhVcFMzR2lH?=
 =?utf-8?B?TklaWjlIbFpxY3RpM3FwbENyYStqY3ZVOGdTYXk2eDFwclFaaTY2aWkxOTBX?=
 =?utf-8?B?RUxyeEc5eFZGbjk0ejQ1dTdidXlISW96YjliR1F6Sy9INkZyZmM4QmZHc29N?=
 =?utf-8?B?RVpnQ1Q3ME5NcGpiQ2tKUVU4MnZSN1BTK1ZPeEd5MXppNmFFRzlCQ29HQ0Zr?=
 =?utf-8?B?WGVxdERBZnZTemlubnhmWHBROGIrbysyRW1yUVRNdGFqVGxOdEdaNlBYeGNu?=
 =?utf-8?B?bFYxQUZyTFVvdlQ0RDlNL3g5ald2dWhOUUZidjZtNTJiTUJwenNNSVp1VXdR?=
 =?utf-8?B?c29LMm5NaXhBU0toS09yeGp2MnBGREVwTTBKemFDbVNwWnRqb3RFSkRBMjhQ?=
 =?utf-8?B?ZGxlVmZySTdDWkc2WWJzVGdiSVN3NjNsOWZrbHpYcFlVNFFkc3N3aWl1MUx5?=
 =?utf-8?B?VElFVXhLdGxSY3RYakoyZkZya3ozRnhoWlJnWnhNYVJlUkFYOVdUT1dSMTYx?=
 =?utf-8?B?WERsd2p0YVhMUmVSZGhJblExc3dEYm84QW9lNnZ6VjBxWDl2Sjc3SStMc1hr?=
 =?utf-8?B?bHN1QWZmQVMrbU1XSXpIbXJIZ3BLSnRhaFR3SG9DKzZLZ21JS21ZMG56bFFs?=
 =?utf-8?B?ZjBzV2xtVVhCSFhoM1k3Qm9aV3Rxemx2OEkxZE5IK2hZdlBBN3k2ZEtyQXpV?=
 =?utf-8?B?ekxEMkpFa0ZGdE5rUVBjeHJZeHl2RnVtTTlaRUNEcU1YUUVDek1LSmVCVlpv?=
 =?utf-8?B?b2g2clIxL211RUVyaDd5TE90NFM3eWVwQzFhb1BtTXkyWlBVTHRtTGN0cUpv?=
 =?utf-8?B?UURYVFVUa3cwbUVTSTZDVHhwYzZKR2dnY1hGMTdTV0VEMmcwZ2ZaNHhSK2o3?=
 =?utf-8?B?dGhsS3NEQVFuVFlGbGNLL1k5aERvbkpWd0N1QTVOQk9zYkFQMWwxajVDaWt5?=
 =?utf-8?B?SFlDeFNuWVJsSTBodkplclpGak9hMU1vR2kxakJNT2FNSTJ0a3NuTzRWMmNj?=
 =?utf-8?B?L3BMWTlFQ3FCMXFIeFlGRzJ2Y3ZPUVZmN1dTdFhVaU5TYjhPNGN1bDNvaVNx?=
 =?utf-8?B?dmd0bGJLbFJuL0JNMjhwVUlUcVh1V1kxNUFVZjllV1RkUGFnUTRkU1B2OXg1?=
 =?utf-8?B?THlwUytQVTFvSlRXZzVSaUlLYUY3ZU5NZFpOWlNZN0NMVnZNY1NnNXJ3VDZO?=
 =?utf-8?B?b085c2laZ3lPN3hBbzVNM0dHczlKbFNZajNpMWJVN2s5T1hsU3dhNGgxbmFq?=
 =?utf-8?B?M2JZYXRjNnNLVWp5QU0rU1psT3o2dnJYZTJ2Q0t4aE4wdlc0cmE4aVBwdkpx?=
 =?utf-8?Q?mBH24p2ljhwU0k/6PTTywu1Yj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff93055-b440-4e51-e4eb-08db262a9c22
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 14:27:45.6366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2JtR0Q8PIJ2iPZQTdyKq+gxEgYPcoJdEjTZtTLIz53ZDWCa5nJdU+u4sET+UeULhNnL/uz+/sNVoP/gM2dZ2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8714
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/16/23 05:51, Jiapeng Chong wrote:
> This symbol is not used outside of amdgpu_dm_mst_types.c, so marks it
> static.
> 
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:211:6: warning: no previous prototype for ‘is_synaptics_cascaded_panamera’.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4548
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

I applied the series, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 6378352346c8..994ba426ca66 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -208,7 +208,7 @@ bool needs_dsc_aux_workaround(struct dc_link *link)
>   	return false;
>   }
>   
> -bool is_synaptics_cascaded_panamera(struct dc_link *link, struct drm_dp_mst_port *port)
> +static bool is_synaptics_cascaded_panamera(struct dc_link *link, struct drm_dp_mst_port *port)
>   {
>   	u8 branch_vendor_data[4] = { 0 }; // Vendor data 0x50C ~ 0x50F
>   

-- 
Hamza

