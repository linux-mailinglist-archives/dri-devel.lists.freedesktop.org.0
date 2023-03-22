Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A56C5328
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 19:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9B410E3D8;
	Wed, 22 Mar 2023 18:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B83210E3D8;
 Wed, 22 Mar 2023 18:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+ZTMaPuZoYnIQ3pnEwXntZFk5f3UupcvB9YpQSPXD9yyTszF36PRrcyo+anA1/zbGc27wakGH6SM/yFdWosNZwCZ1ORL4u4XcprJV0ZxQ6G0ac67Tm0OrI4OZY6GKQa0ha04+2Kkj3u6fHJAJdB9n5GsjwdRzjk5i+0BLUHUKaWOFWH6FtsJwUHvLCTRTD7CP1cc64xUp6NPxIGVp8tN6gOTvg3wd4Hb4wEwM8EPsW8ORWXtXI69AFpDp5mBYkwBXl+73vzeb7zT0tB9FaTf5d8NdCW8ra56/2GnB38l1AX9bnR4oMgXqokjfPf0V7mzZSzMjr886ESCHHi8OkNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhV0K9xcGmJt4o468Pc54lLn3F2+Ud9InP4csM8J8l8=;
 b=EILd5N43V1kzPP1czyuL+W5kLmCKvewkD1VvMvCJUzpTqMTSLot50yxDau8PX52bsY9wK+5Y0FT7hqxF8S3RT665cdszZit6RFp/+mjprBxGhQzo/mJ0VIvhYTjLoU0HOSddSD29rvv7Yhck5+lZjuWFfIHc4VGarCnjkI1TanMJcHvA53QLSrwrYu1Dlsi+XIqvn6T54inQ0pkBSMpqnSaG68js4cYyY5Achm9n9oRfdeEN1bTdfNhTbTXDRsa6IJ8k0FQnfd6P4NrI/DUxuzrE5F0MXZd0WARksJoTTqK/26meb/kpVpM0duF22/MweACirHLjjr2Q7DthRVX5KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhV0K9xcGmJt4o468Pc54lLn3F2+Ud9InP4csM8J8l8=;
 b=lh7R3WbotRfiPBcso3qQ4kAfco/EvejCRXLsIXoheyoicJaDy+I3ssO5mA+3xkHgWLCTxWZMnhvgH/XhbSAYHms1h/wJVcP22/En+br01cIDdC3Wo73LQU16fHTWDt+yugGQCaKY8indkPun9YFua0Sibk9jxrjGPbFlzUS8rvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 18:01:23 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 18:01:23 +0000
Message-ID: <7cf3ae87-9d7e-a846-89c6-d267ca76472a@amd.com>
Date: Wed, 22 Mar 2023 14:01:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/display: Add missing OLED Vesa brightnesses
 definitions
Content-Language: en-US
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230322160513.1438881-1-Rodrigo.Siqueira@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230322160513.1438881-1-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0160.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: b080ea3c-5efb-418b-1399-08db2aff728c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fGENEWHtKvPuw+1IF/1HIE9kQ5i3ntOJzIlhoTqcZH4mkGTVfwSG+v7uVGRNZD32qUyo5nxBAgxg75VmvCYsJ8zXMlaU/QYZ6inxbpiYIDvV/IkiWXhZLiJTqYzHoDVx3KRyLXwhFISATps+O1H0aEysHtNCp21BSXA6gF0a+lK6RhxWN2daK2VKqXOpVM0MPJLdl8kV2+aWreUkes/50luMnN4fcgrRNrlhXU0euXOk7cz2S5fcDIeRRpkOnnq2KKVbwumtuTUrvoKPpWBaLr6BY8FEposokhFJwATgd7Ka89qUN/DBqqKwFp/LEaiiQ61cJ5cs8fPYN0Lo2dYkaVuT/tbxq8RJGK/SauRsry5UAqg3Z1nKipyr67tDX8/vbRfrmjp4YU9/tlvni8UpMC4tsdE5P3XR5/yzHrVCHF5v29WjoSDdQ6NJDRJjZ9C3zgFPZWodYJ3A2uy09dkLoK2M/+xUCqEh/z20tWdVaqSL6fiVx49kzu/oHaVPRRVTmyW+TE4pq41TBEQ9xgngWFfKPDsgt1XsYXVcDv9hKGiomQvByOiIwZwKGjDzdba+mAN/eew389fM2KvxSe8GSKELz5PKN6Sp86TSMHzgsaEHY8GwwSNZLESEimnd5LqMQ5AOJJqGZjINE/ppgisEsA0Sk6APIKdHUcetRYl+c1dSbrih0odsj7sEfcc8ERcINajrpZFvP0WLJln/djCwTsjTfe4cI4M2uCbVPnyAf5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199018)(6666004)(186003)(478600001)(6486002)(26005)(6506007)(31686004)(83380400001)(8676002)(6512007)(53546011)(2616005)(316002)(66556008)(66476007)(66946007)(54906003)(8936002)(4744005)(5660300002)(41300700001)(4326008)(2906002)(38100700002)(31696002)(86362001)(36756003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1hjL1RGU1h4bm5tWFhsaWlFS2E2VHJGS0k3eVdrb2ZUcHRGbkIyQXZON2ZO?=
 =?utf-8?B?Z1lDTnM1NjNPejNKTDNkZkxPUzR0dFNMdVkyaHY3dVZ3bHRYVTRRQUxSZ1J5?=
 =?utf-8?B?all4aFM1SmJtcFY3SXM1QWcwdDBQaXJwK1QvTEpuL3FXN0JFL2hlYlpNOElO?=
 =?utf-8?B?cjBqOEJWRkI4STJGa2VLeDRFSUdRTmtLY2VsVmRkYndPcjJyY3hmaVB4T09y?=
 =?utf-8?B?c1ozUGhFbUlGVjYvYi9TT2FMSzFGK0dDUU50TEYzd2dPeGFxMlVsUkRmK3JP?=
 =?utf-8?B?VzlqSm1Nb3ZVVXBGYjIwekVhdUlWdEN4aXJZY3JUeTN6ZlJrc1BxbCtIenY1?=
 =?utf-8?B?TU5ENDJ6Si9OaThEeE1hYU9zb1J2dURVbjRJU05pd1RVNllyQkxQeHkxMWpI?=
 =?utf-8?B?YmE4MGxZMjBGQnIvb1RXalBPNTBpeFMwSS8yWWk2SmFaWXhTeStmMGdReVJJ?=
 =?utf-8?B?M1VLWU5xaTdzM2ZTQW9xRUNCZ0NyRHYrQnd4L2pJNWV4SG9PTVNHOXlpSDdQ?=
 =?utf-8?B?Y0NsNDZteFBnNUt2dlN2ZnhYSlpleVRwb1hDNHpxc0krZkxkZzE0a1c3WE5s?=
 =?utf-8?B?SnU2VTRrUEZBWjVpYXRLRTV6T0Nwd0cwV0dZbEU4c2VORENZQWYrcmh5bVVt?=
 =?utf-8?B?NUhhZnp2TU10RUVzMmhmUDQ5V3hrbUdwbllkWEZsTlBZVnZ6eEJQVmJNR0pa?=
 =?utf-8?B?RytEU05QSWt2UjBpOEFkN2dmZTVOMjR4eC9tZ2k4bmVUcHRIRXJhdHhtVkxY?=
 =?utf-8?B?MGg5aGlraHE1Y1RBdmNtS291ZCtlY3A3Zmx1QXVYRklZQzc2cE1Cc0xnSHhS?=
 =?utf-8?B?UEF4ZVl0ejBSV3VETCtXK01qM29PODNXYXhwWHN4ZlUrODJubVJQZStjN2s2?=
 =?utf-8?B?NmZJd2VkajdhOUsvMDU1M3FvUmVrZDBWNytHMU9vMnVYSVZHM0l2OHhNckht?=
 =?utf-8?B?SitXMDl2ODQ3UjZMb2dOZVNsMER6Z1U5TGlGYTgzU3pxejBtbGhqZHpMbHlk?=
 =?utf-8?B?eFhwZlpvN0JCYXBpbTRxaCtFa3g3VTVRUlNmYks0V1N5bmF1ZDZZc05KWlFj?=
 =?utf-8?B?ZHVqSDhYVHJTRlRxZVJxWU04RjVkNDE2bkozeXVnVjlXeno4c1Y5SkMvdEVG?=
 =?utf-8?B?djdmRkhoa21rVFFidXc2eVFMVWsyVm9uaXRYdHJPTXl1RHpQSkJRNTFYZXNO?=
 =?utf-8?B?bytYQTZBUDg2clBrWWZZWWNxMWJkSUx6dzdmQ1IxTWlaaDZOTFd0LzNTR244?=
 =?utf-8?B?by8wZUg0R2ZQM1E1S08zQnlBMi9JUXdweTc5cGc4YkFyV1lrNDdSYWdRdnhO?=
 =?utf-8?B?amRKbG5UZG1ERWhvUnpqUkczM0VRSVhjVlN1RFBaa2xjUjBSckRjeHByYVJV?=
 =?utf-8?B?R25FK0pWZjBSbnl3aUdhNTQ3ZlNnb0RtMDFEUEo5aitnalBVd2JUZzZkRkJk?=
 =?utf-8?B?dzMxRzEyOU92ay9JK3AyWFdmTWZRMDZwaDFDbXlsWkZXWXgvL1Y5K2tNWkZk?=
 =?utf-8?B?Q0g5ajJnRWRJS1J5U0RUUzNUTEtLTUlTTFN0TU4wZ1I5cnNRdFlZdWRQdGpQ?=
 =?utf-8?B?dmlHbGxLcklQMGN6ZGg0T1o1Zko4L1krb3A4bFQrWWo0YThpU3Z3cHFHK1pU?=
 =?utf-8?B?aDRoVU9zMjQ5V0ZydnU1aGdNVWxwODRVb0tZaG5pbmRUWGxNK2JQVk1hVnhB?=
 =?utf-8?B?ZndDSUs1M1RienI5NWFoZ0k2dXBIbjMvZ3c3WVYxV1NoSFNQSkJHRFpoL21l?=
 =?utf-8?B?TGpWb2JYanBqUHk5dDNYMFV0S1ByWVNPSE1WQnMrVldQZ2ZSR2lrK2E3T3VQ?=
 =?utf-8?B?V0pwcFlzb0p1V1kzR3NwTUJtcGR6Sm9EZXI1cGxldDY3Z0JZSFdpSkdrcXkv?=
 =?utf-8?B?aHBna0ZNYjAza0JzaUFNM2h1dzZVSW9xSk5LMHY1SDcxNjdLeVhYUVBIY0dn?=
 =?utf-8?B?MDcrWFpDd1J6NUtTdHk5ZWNha3NTNSt4NzR5WWJaWncxQ1pyR3YvMThjUWpq?=
 =?utf-8?B?T0x3R2N2aVEyQi91UDBGQ1Z6UWwxMi8zTmN6dklGSWVaL0ZkdEYzdjRzaEpz?=
 =?utf-8?B?clM3dkxUd0h0a2xibzNZNlJoeXowWjNjaWxHcmZqNjV4UnhVNXJYTmhmSEov?=
 =?utf-8?Q?ZJI/RC5WT2FbuSDrnljNTvfl9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b080ea3c-5efb-418b-1399-08db2aff728c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 18:01:23.2678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5AKPlJ2BbAqs5IpYbcDbk93/aDz3hF/VcSfnRyivwxkKwwQz29ys8WVvOSz3iJ2LCsHhJMbIdrCpWc5kcANtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362
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
Cc: Felipe Clark <felipe.clark@amd.com>,
 Iswara Negulendran <iswara.nagulendran@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Anthony Koo <anthony.koo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/22/23 12:05, Rodrigo Siqueira wrote:
> Cc: Anthony Koo <anthony.koo@amd.com>
> Cc: Iswara Negulendran <iswara.nagulendran@amd.com>
> Cc: Felipe Clark <felipe.clark@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  include/drm/display/drm_dp.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 632376c291db..d30a9b2f450c 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -977,6 +977,8 @@
>  # define DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP		(1 << 5)
>  # define DP_EDP_DYNAMIC_BACKLIGHT_CAP			(1 << 6)
>  # define DP_EDP_VBLANK_BACKLIGHT_UPDATE_CAP		(1 << 7)
> +#define DP_EDP_OLED_VESA_BRIGHTNESS_ON      0x80
> +# define DP_EDP_OLED_VESA_CAP				(1 << 4)
>  
>  #define DP_EDP_GENERAL_CAP_2		    0x703
>  # define DP_EDP_OVERDRIVE_ENGINE_ENABLED		(1 << 0)

