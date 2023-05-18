Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805947076B2
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 02:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6973810E4B4;
	Thu, 18 May 2023 00:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACED10E4B4;
 Thu, 18 May 2023 00:04:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOaGb+LFd632mOQN3DPdcG6p5+65pKZavWMtLvnCtX/sz4BBsUQjHgbQAM+cAhWmVPMiMX5yWwEEm47kiewJ15Tp7igpjsxvOdCIQ7b+ptRkQfcpPwxKGz4r24tM/hDYE0Ny8jFRFE66R++X9lzQqMcUHB/AQk0aTjoZYr7KeSqX9fZcMJGulhGjjm+MPEmm+++oyDcEd0hXMRYBJ1A8nE5Q3j/+FqCfXU4IaWvA/2V+CCH5DDoIcMz5gqR+7rdYTOTv0KRkgGWT7dc/RB3RoSBhOTt/X+FzYTqVud/4rrz7Ea2qcspTNnIj/LTHaEYHlUHIsUVViG3LwcUYMfODew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OpYGcuSiiq04w8eRVlrxb62kxVQ0lH1lTrKOSa40V0=;
 b=cVristeVT/JkcdmlkHv7nB/lP+oxx93CKIB7kjIGS3/A9dz9vkLhgDcI+62pov3+J/i8UeDGfpPgSe+f80Q+8li7w6Sm2otA7GgWJY8dLzAnDtvFnls03RPaa26chF9KothVVdruIoZ8VgNbaefRlxwUcpTcrJ6pF+PVhqC5jy/3UBAUJmg1xcRD2nprPG6fi0M9s0eOkBi4hDqFQLntkSgitkykxaYUxcPhj3Spt6Rb9zwkYTEQqt72bxeQllV4sUw24StPRFXSrk+pTFxjFlNNiVI8qDJ0qiygEFloEL90S2Y4ggdZNuIAYEUKEyVH/dtlUnN1BFtIZikCkY7+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OpYGcuSiiq04w8eRVlrxb62kxVQ0lH1lTrKOSa40V0=;
 b=dDADUmpiF1K2i798cspQ956cswzZ0zkp/0gAiC+0MZV9TMUMnK/oDvy4Vd7GDFUH43f3lONLOj+RTSTKu0w/rXor+tISungb6nZAehM/e/Dwetfd31SZhiMh4N/Js2DfnTVdI+PsUyN2Uxmv27+ePanM1m3n/EKPSNbjBbRW6no=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CH0PR12MB5236.namprd12.prod.outlook.com (2603:10b6:610:d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 00:04:49 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::3d88:4b4e:e0aa:3c36]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::3d88:4b4e:e0aa:3c36%4]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 00:04:49 +0000
Message-ID: <f424478c-dc1e-a75d-d7ea-853546dd582c@amd.com>
Date: Wed, 17 May 2023 18:04:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] drm/amd/display: drop unused count variable in
 create_eml_sink()
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230517183350.314082-1-hamza.mahfooz@amd.com>
 <20230517183350.314082-3-hamza.mahfooz@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230517183350.314082-3-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0260.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::25) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|CH0PR12MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e944c35-b1d8-4eb7-6475-08db57337f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RfQbwAms9heJHdR/hTBKB1poqgCe5tVTiyIOduosOLOqmRsiQdYkIaj7W2RMCaqVOU8HqBwTl4PG8zE+3mnektcups3TM2wo7Rg2cwwW4NDdZIyl2FeRRC5eMy5geQHNhW+wEjGdH4auI+pU/jZ2H37Ix0xJzoCV5lBTZYOJLab14GKhA1PX/qWSXdQeQSWtb/2MQ5SbuJwnHUePpq5q4yTrYehRIr6bNE4ykcsckLDV9KDLAVLf0KHJCtBmoSpYVofZq57SVcXltyJeXifSNv1K9GoxRPI3bThgqjKw5b3f7frolPw54fCHnKj57od1LW1eF+pOWMod9Ixk8N5C1nnpwa8oL/9GCY+athDiEOyshwPhlpsw49WAia5/UhVmaOpngRUGfqtclvUkQYZZ/BtRPC6juIQnRJQQJBfB2k4rKoIRm2i6YXxFhYuAZlqeOBGr9qv2yApMs+xDVFRGGS+c/ZTFFTi3lcZFhS3KaQrwcoqjITYolLcmIxs/AcYGGAvcFaNfqHqHyLo5UazDniliRsuZOEXpPf1p5303o1rmj/hOtbJKoMG3jKHDKC4N81zJjTkJ/rnDZNIwzaPQsaGbXU/PASErG+rlv/gndZeUQKUAGKNbxdW2YShRm3PlW89MbNAVCv07UHFNhir85A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(6512007)(6506007)(31696002)(53546011)(186003)(2906002)(86362001)(83380400001)(2616005)(36756003)(38100700002)(6666004)(41300700001)(6486002)(66476007)(66946007)(66556008)(316002)(4326008)(54906003)(31686004)(478600001)(5660300002)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2VrRzczcGd5ZXlSN2dOUHl1ZnFNcnRhV0xmS2lmdnZtZzN6cDczL2YyWVQr?=
 =?utf-8?B?YldSQUFHMjhiL3Aya1ozZHM0cUZ1Rk85WFNmVTFSODhBbmxwT2h3dVJNTFJm?=
 =?utf-8?B?QWVnRnliSHBJVTZJemZhMHRnZzNyZkxsKzAzRnFSbEhLT1Frb1JFU3lhYm9W?=
 =?utf-8?B?VzMzS3F5NFU4NGw1Z3VMNS9MTGhwR05nMStseHl2RUNlcUVaQTNZaWtmOFFE?=
 =?utf-8?B?VHhMemhBWlNFdnFBN081cFBheXZYUWRKKzFlSVFYR1FwY0RlWklBV05sNXJk?=
 =?utf-8?B?ejhVQXZWQU9Jc2dvbzRXZU5BSERkcWVCTDc2WWpMcytFNkcvUDh0VDZWWitJ?=
 =?utf-8?B?T3Q5WXMvMUlMMnhhdkxqLzZlQzFaRVlMai94ZEQ3bTFEUlpJNmk5NVBNcFJ0?=
 =?utf-8?B?L2tUTFM3bmt0QlhFWWVGU3I3ODJoelRlQW5DcVFWcGVOSXZmWVhpaGlUbkY4?=
 =?utf-8?B?NEFwSmliVXpiRUZqWlBTcEU3N0N2ZFhPR1ZHaUNkNVZpOEowVEhaUndkR1RH?=
 =?utf-8?B?bzBDMnl1VE1mRlNkREFSYWUrQUpYb2RNck9WM0hTaDJEYU9GRHdzaE1qV1FL?=
 =?utf-8?B?WXowTFBtQnpJZ1dTUDhZQ0c4YTNrOWt6bHNZcmtWeWxqQndDbDE0OEwvbG5u?=
 =?utf-8?B?L05VNE9qelRGMDB6cDNqZHgwNmJrSG8zUDloL01NUHFUQXljakNqa09wdVlY?=
 =?utf-8?B?WXBjRUF2bVlNQVBOblNJZlo3djFrVDNzdDRjb0pKcnNJaTI2RkkyT2tjUkNN?=
 =?utf-8?B?QTZUbWNoT2NPcktBeWFFWjVoWXVBRXlhVEtYOWpGU25vT3NaTWVFOUFPZ3Nh?=
 =?utf-8?B?dHVNZ2hlYVpiM0lLZUQ4RFV1RnZCZU9iSGUxOUk5cUFlSW5wRVpxUDZkR0N6?=
 =?utf-8?B?OXdqa3RUNTcxWDNLakk2N1U3RDZlU29STmx4MUFnamlTb0FlWThOVDg3cDBL?=
 =?utf-8?B?RzlnS0J3SDVpakxlSnIyZyt3SWI0WWpsNzQwNmxrTU1ybzR2SzBIRXZQeUp0?=
 =?utf-8?B?Q1Fxbi92dlROak5DNlprUG92ZHBBdWMwdjVCYk9qQzhvYVZPWGwrK1JqWDRu?=
 =?utf-8?B?elZFUndBQUprbVlGMVVJcHlQRmhRaFJWOUVwYWkwSXlta3BUMW1pOGo5RVp0?=
 =?utf-8?B?VlluNGJYQVFZdjhrYWl1Q3lyZDRFUGlRcU1lRW1HTTA1QUxuR0FPcC9NRVA4?=
 =?utf-8?B?RHhrS0s5MHpnWmtqMlJDbEVlOEdqUWZoaWpZb0RrdERMcWc2QlFoMzZWM0tw?=
 =?utf-8?B?NjJUdDc4YkdwRjFWMUlSdG5nVmdST2YzT0F4UDNSL0lwNXg5V0hRTVYzeUFn?=
 =?utf-8?B?VVZraUY1L01jeEczbjdzTld3bHlxcG5ad09vdmM5WE1yVm54VTUyWW5HQTNB?=
 =?utf-8?B?cmZyYnVhaWNqT215M055RVdSZmpzOEQzRWh0SExtNkhFVUJiMUFiVkhUQXBY?=
 =?utf-8?B?aXBGZFhxUk95N1YrNjhyNlNhd0tYSVd6cmdmdDZ4bVFoVkFDVy9ianl5RDdW?=
 =?utf-8?B?T2NrSzg4SHhYdXJKS1lxYkJWcmZHRFVmQ0NtT3VqbHpLZFQveTdWSVlGTkRh?=
 =?utf-8?B?clFJS1MzZTJqZjZlYUdqSWRseUZkS2RJYktqa1hXVTJCOW42eVd1VlhQa2Nl?=
 =?utf-8?B?V1FsTUF3UzZQQS9oRjJsR1MrWFhoZWRWdkJPVklwTE9CNzdLTjV2OVVUTFpy?=
 =?utf-8?B?ZURtT2FjZnJTU29tMTZTWk5hKzZGdk54QmhVSHA5WTNhR3pxbTIxa04vV1Bu?=
 =?utf-8?B?aUZKY2w4SmF6aUR2Qzg3MnAvWlhjTjFJekpoWi80UU96QzAvbFNReGtKRktO?=
 =?utf-8?B?RzdZTVZyekZBVHRXSzJhQjNYcHpnMlVFS3FzUlRnaHRVaDZEZ2dreWhObFpH?=
 =?utf-8?B?Nit4b2w4dGttQ2ErRkNIVE1sTVhadGhNeDRsWUVrbkd1cXc4ejVjdWZJTWhk?=
 =?utf-8?B?Zm9TSnRLcFQyTjZqOHNBMzExZy9rOHkvUFlvWHhJRU9xSnA2cFI0NjlKMUVR?=
 =?utf-8?B?aUx6VTRKRjBsb3A0ODl6RU50R3h1WnF0eStGbHN5NThtVzRheTdBTkR1aFhr?=
 =?utf-8?B?QWVibGdKbXY5bGgvWkdhVTdhYTZXc1hnaUI3NjlGVnFyS0VoSjZOVWlyOEJ0?=
 =?utf-8?B?SDMvak1uLzVPSnRRVG9kWmpEU0ZzZWd0bjYva1J3aURGSTJ5Y2hLbGoxaE1x?=
 =?utf-8?Q?iQdGrurwRSOVXPPon6DlikPLDtOSi3PrVAfKcTo686uD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e944c35-b1d8-4eb7-6475-08db57337f3a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 00:04:49.5141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3NsDLDwmZdSUgSKVfxoovSNEmgnFDGv1I/TAoAnUNcTDC45YwFFl70vdKaI7MCcrgbNaOf+CzMoDoHbW67QiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5236
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
Cc: Stylon Wang <stylon.wang@amd.com>, Mike Hsieh <Mike.Hsieh@amd.com>,
 kernel test robot <lkp@intel.com>, pengfuyuan <pengfuyuan@kylinos.cn>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Leon Huang <Leon.Huang1@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nasir Osman <nasir.osman@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/23 12:33, Hamza Mahfooz wrote:
> Since, we are only interested in having
> drm_edid_override_connector_update(), update the value of
> connector->edid_blob_ptr. We don't care about the return value of
> drm_edid_override_connector_update() here. So, drop count.
> 
> Fixes: 068553e14f86 ("drm/amd/display: assign edid_blob_ptr with edid from debugfs")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 14b296e1d0f6..5a2d04f47276 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6396,9 +6396,8 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>   		/* if connector->edid_override valid, pass
>   		 * it to edid_override to edid_blob_ptr
>   		 */
> -		int count;
>   
> -		count = drm_edid_override_connector_update(&aconnector->base);
> +		drm_edid_override_connector_update(&aconnector->base);
>   
>   		if (!aconnector->base.edid_blob_ptr) {
>   			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

