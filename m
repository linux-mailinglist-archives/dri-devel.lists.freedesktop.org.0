Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E37557D9E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 16:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46E510E392;
	Thu, 23 Jun 2022 14:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9746510E392;
 Thu, 23 Jun 2022 14:20:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghRY/q+AczrBlosibDnz1VOMwjF/ZJuI0Ch9V4Oys0Bvqk0s1V8FcEn4ltaF8U//sffk8WGURtzZTDpDF2Hw6nNoDF8Yl43dZm6fhiikACXHPYlEDcaUntkJCNvVAr1PHMoRKNAOpWnsMmFXVrlQY1l9G9d+/NKUo/dEIjJ6PpIo2JUYk0r2j024Qhc9epMZS2GXRbV+o9eObIpNQULVX49fq6lOcSMPkTkoZX4T858oM/ua/Y0OEuoYCm9f1E2wzeU1ruXqm7DrvBaQBwJlE2fLIMFzMFXQrZ5dift9tyC6OWiKHGDDD/O+yYnTH7611Y12r5StdaIUf7P0ETuxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV4yJZGNkV6ZyV8ZpAOSYRegazPB9XZlwL0SP+5rrOo=;
 b=fv9DMKlrejuEcagm+qmd5gvBLJPGIKSoGVGhQRhXIex8gtG+sVU6tLPl8KnXWOFiB2b13/lUbN/P2ggDwmDJPp0lZA9ADGQ0QOX/7soMiro4BpcCRj8sO+tA6XZxy5zk/XdRnz2fL1PXpNlVNEsTNQ8e3FRYr2c9RjIWKc1Tna56jXDc91vpMZr3D+QE/zzGRzJqTG/8sCmri3YdFAj+NcjKNTerqjEtZJFtgPzUKP7zn1Kzu3sJ21hHSwjNOTaj0BHoswj/cYO0VvqXYcyZ/ObOzR+a5/L8JZNpOrPv+e5No522blgCw7AKl7kTna0eHq5SYzLJ40/0flGi7aLixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV4yJZGNkV6ZyV8ZpAOSYRegazPB9XZlwL0SP+5rrOo=;
 b=KAT12wg2N9WhENp9q4+wiVRZF35dqH4dH8uBpO5/Yq94+Apm8L86p6+8qWcnSBHQq6U2MT2sV6xWRM3F4TJKGcF/YxbKhObR1u3/RPMUFlF9u6TD2h/taPUa11qtyex2qavL8KpjUYeLWY3jj53B4AQkpfArmhcWMvoHrrCbX5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB5645.namprd12.prod.outlook.com (2603:10b6:510:140::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 14:20:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc%3]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 14:20:05 +0000
Message-ID: <d3218391-de1f-d64d-bda7-0042473e9833@amd.com>
Date: Thu, 23 Jun 2022 10:20:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH][next] drm/amdgpu/display: Fix spelling mistake
 "supporing" -> "supporting"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220623080946.19116-1-colin.i.king@gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220623080946.19116-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::26) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 328cb5e6-953a-4e6a-9ca9-08da552377bf
X-MS-TrafficTypeDiagnostic: PH0PR12MB5645:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB564521A5A0A4C5C88386B1F38CB59@PH0PR12MB5645.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: quWnZPfbOEacc0Q871fnR4+Tca+wg6D5bLKla6ztTfHAONuw/aDcsZfMnee7LM6W6zzE9ubV7DL2HWytj4/WVpImjOQqthzYrxw61aV8F8Vheb+MSFDMNgiwZNtzEvcV369Cwi+hsqPJOYo0J5fWEvm1FGvCe8MppWMRM5Ts/nlKmr909/P+x+k3zT1H/ukoJn+xK87F24B40XZUXpfQKfz0D9abKuagPcON2RuLd0NfckGTv7zRT4hTt7zoEl3flEgBm3WEm/kdKKp0XLFeEyaeTDWLHPtqA7qQjI3Cayq0q4C2Z90kOtvkyrg3A1mlKAHlxfhMii9nOO+4xE4Jq2SgyaNFeTPslV6AFspT7r+Y2X5YiwyVXXE0lRCBbMhaLqAVRypZOi2iHUcJpyuHDJWTHzbkoIhYF71hrojXwhltJ5fgrxPrgzfMGwfBN9B4tLilIeMnbAR0sQFo2NStgM7VokJELb+GqBHW19+JGqPE9opXKqA85X4gpgnui1xkX8rZtj6odVnJcIrP5pt3nMG5il9rY4xRKO2TWaoyrtihOj4a0WxrzT+csNnCbW6JJv2LIELnUkeQo16imHfQYmOh0JhscTrPGPZO6X4jgvMiEFlSz4dDcl2OgfCDyao6UockxXm80a9iuZoaS2LFPWWpRI5qSL2NzLpfY0TB6tnhyEetNrXXkiDH0fmUvjimKWNx65VCK1v4Bmq5QxKSsinjC5EJF2ovsLachaadzhQ11rx4ncr2NI+Suedtf3JTvf30sb5FL6vEOwEOr9c8UqmnInhJKSbHuYSaHoa4Enflv4Lo8noo0G1rGlYRMaw+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(6512007)(41300700001)(53546011)(86362001)(26005)(36756003)(316002)(83380400001)(31696002)(4326008)(2906002)(921005)(31686004)(6506007)(2616005)(110136005)(66946007)(6666004)(8676002)(66556008)(66476007)(44832011)(6486002)(8936002)(38100700002)(5660300002)(186003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVk0WGNyQjNWcjNGc292ZU1nbHUvcllCdll4U3A2Rm9WMVpVdEUzc3ZEMUpl?=
 =?utf-8?B?QjNuWWU0MnBtU2tybzRQS3JLSlVGZTdITmlHZUxNNStXUGZqaVFMZi9iRW1p?=
 =?utf-8?B?YlBjTTNlYkM3Z2JRbDdQUVNIR1BPWkJ3YWc3VGh2MldhY3EwRmJuWFV1enZn?=
 =?utf-8?B?ZGNuR1JhMUhERXViVVN0L3RKcGRJVGhCMnVpbWlxRGRZQ1dXdGZkK0xuY1RD?=
 =?utf-8?B?TGNKV3ZQdGk4L1J4M2VJS2ZvY2lBcWp0TU9ZRVV6T2NyenZtSXRlaXUzekJs?=
 =?utf-8?B?NXIwSCttYVJ6RCsxRHh2VDJoMjR4dzVLYXhyNi9LczR4Z3ptNkliNnJqZEVu?=
 =?utf-8?B?Q2FxWlpOSWNnSzFkOGYyKzRqRlNRNnhCZEJDcVJsYU5zVFQ0OFdvMENqUzN2?=
 =?utf-8?B?UWdrOFYzK3dkbm1ZZG55VEh5eDVQTXNrd1d5UHd4anpZdEdqcngzNTEyYVoy?=
 =?utf-8?B?UVZ0MERtcXM5MzJGeUVRc2RyM1Z1c0xGaUZOZHBwaGgzZFJGeEFCSDNwM1My?=
 =?utf-8?B?T2tCV2pDbGpNV05Va3BBRTFPeDVZMTNOTk5sNjd0TWtGRHlYRFk0TFM5M2FV?=
 =?utf-8?B?NHpyY0UrU1o0NlZCeFB6U1YzM2d2SHpmY3ZsTXV0VjZJK281aHFJK0Z6OG9u?=
 =?utf-8?B?cFVPeGpwNTFlaUFhbWVscHlGUGlmSDBlQ0hpZllWQm1uWHZMMFc2UG5WVWtn?=
 =?utf-8?B?OGMrWWxzRnU1UVhnZVFTWmZEQ3c5Z0IxSFVuYXhObFBxVTZOS0VQWjRVQW1s?=
 =?utf-8?B?b1MxcXRWMTZFT1g5VVNRQjlUekJ4NXdxMnc1M3NxZ200TkRvV2hzaTdWYmxt?=
 =?utf-8?B?ajNndmdKZVNLZ3kzRm9qdmEvcHBUeERUZEhIcXJlVXNBSnlMNFY1T2lGdXhz?=
 =?utf-8?B?dy96NGowSXlteW1Bb29rbE1jR1RGWjZYYXlkR0QweTR6bGFJNEJuTnRESGh1?=
 =?utf-8?B?V3JQZzJFM1VqdFVMRFpCRnpYQzZqOTJqTlNHT3dicktjWW9KSmJUK25jVU40?=
 =?utf-8?B?b05NVjFkNU03ZTJIdTdZZDkyQkpScHJXeERUMUc4VVkxemZkL2hoNW5ON1Vp?=
 =?utf-8?B?dkdPdnJLeWZPNmlVU0hFYlJZVDZucFJIeHZyWHpoZWFvdEx4d0tPYUtJUEp4?=
 =?utf-8?B?QjM3bVlQQUVReVVaWC9keExTV3hudENZRk9GVnE4YityMXdiTXNRRjNXcGRt?=
 =?utf-8?B?L3B5emxLWVRuUjdwcjJzQlp5RlhIUzYrbVNCQkQ5ZEs5cExzcE0ybUNjekNB?=
 =?utf-8?B?NjdWd1B0aE9aMjJmTTR5aFZmZDVmTmZDK0llc2MyWmtjMitwaU9iS2M2SFN1?=
 =?utf-8?B?M3NmR1ArSWNPdUtERDhrc0R3dDQ1UFVlZlpEOHFnZ3Y0V0RuTmpJdHRmZmdt?=
 =?utf-8?B?OFdBMXRCNUcvS0ppWmZ5VUNhUDhjTXBla1MySTBSa2ZyTk1wK1N0VW5kLy9G?=
 =?utf-8?B?SHpEcjBVYUVXMFlyZ3NLbXRHYzN3eTZZWmhuVFhaMWVidzIvb3g3U1dFaUEy?=
 =?utf-8?B?elpkT2E1ZGJDNkl3NDlLUFh0NnF5SVdnZmFVS0xkejY1OUhhT0xNSHdQMG94?=
 =?utf-8?B?aU1ub2FPYmc2RUtFbFo5QUg3QUlNS3QycEdFdXJYcElxYkx3TmhuaVRNMU9W?=
 =?utf-8?B?UEJsakNNbHFseUttWEhXRldSb2FLb0E4aHNqaVV2dFN5WEhxMmN5OUFSTWww?=
 =?utf-8?B?VXBNNWtCbDNzNzgrSDFWcitXVUw4Tm9uNkVpWENaamxrSWIvb29jSWw0Yk93?=
 =?utf-8?B?dy9pbDNtdDRKaFlLNlZiOC9EQ0p0M0xveHBscDAzelczdXBKaHhkWEp2dFRL?=
 =?utf-8?B?anNjZXEyS2VaaXBYTVE5ODlyNEhpek0vMjhpT3lPRys1a2xDZXJjZTdqMURo?=
 =?utf-8?B?cFZBb05IY2tqbHBVRERCL1p3MUs5UldMSC9oWDNEaUVmeitZS0ZhdXoxN3JO?=
 =?utf-8?B?VjQzWGRvTUlUNzVlUTY2alhDeU9TM29OU0hxNnVZMXNZMDdjTmtDVzdYNDUw?=
 =?utf-8?B?VWdWM3UxeWJqbjRiVUtreHYxZHZuUmx5QnhseGJUcUo2N3JLbWdaeHZZWFJG?=
 =?utf-8?B?aFpJL0k0TU9hdnJHV256VHlTNEVTempQVldZZ2hiQ0kvLzRvSTRUcDZxenhW?=
 =?utf-8?B?QURvUERjaUpyUXQ1VHlXUVlsNEtxbWFqNDhKVDNGaG1PMU45cUdnNzBmOUx4?=
 =?utf-8?B?L2szazljMVhIM01CbHdYdzljT1k2MFNHa2E3Zk13UWRIUXJ6SnBuYmwwUzkr?=
 =?utf-8?B?U1FsR2hYbnJOaXpMVVRERE5DalRYV0djRnJWZ0RiNExSckF6Z25QVUQ1WllR?=
 =?utf-8?B?c01lT0w0dkxIMnc2MVdGSEVUSGFsWGJGaWNXT2ZFS1licW85SGtmdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328cb5e6-953a-4e6a-9ca9-08da552377bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:20:04.9484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJVfJppz7XWYSi/pRqp7cveXRTmd9kJpOXEqSDFamA3MeT+DkpfPOFw9Oam+AY/d2PKtGVvqi3myxEFo0TdcgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5645
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-06-23 04:09, Colin Ian King wrote:
> There is a spelling mistake in a dml_print message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> index 7f144adb1e36..7d536c2f4477 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> @@ -1098,7 +1098,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>  				if (mode_lib->vba.ImmediateFlipRequirement[k] != dm_immediate_flip_not_required && v->ImmediateFlipSupportedForPipe[k] == false) {
>  					v->ImmediateFlipSupported = false;
>  #ifdef __DML_VBA_DEBUG__
> -					dml_print("DML::%s: Pipe %0d not supporing iflip\n", __func__, k);
> +					dml_print("DML::%s: Pipe %0d not supporting iflip\n", __func__, k);
>  #endif
>  				}
>  			}

