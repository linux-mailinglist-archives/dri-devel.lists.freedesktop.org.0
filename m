Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923C6E7DB6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 17:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB4610E9DB;
	Wed, 19 Apr 2023 15:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A0B10E9DB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 15:12:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIVgMt6kruTKx7vkWyTkRDd/grknYFKFD1H467K3G2yop4YTinOA984ec3bBY8Q0o2VniE6c0LmXqq59Np6jLCTxqmgZkvMghI3YumsbzIFT09rmW4opLeGbqDbEmL8navb7b/xsO1c2JYkEuq6Xyn7/2oXUO7EZUvOGqgfD0zaTy3S9aPnzKSB0yLVYa6wp3QYC/cBKDPlXFYteG99B7IZ2xZ4bRId0RJ6MwrosYGgstufrTJ0pHDG/4YHT3ZkG81AtpLQjpyo5Kljk9AtUtYMtrVhwOlU5c0p0BQaxcSt2LKwR3HKKaj3kBrS0I75F8lLk+I/Zx2aOnAnTy2agnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSzT5WrC7iecR37ejyyExxSkb6YvlrAgAw6XLwPTTQc=;
 b=iVFd/1dtgzBXtt98sYB4z9IfCiqH7QAPv77IjtQokjvKllr8Fo87UxLpzLqxS3qTuHEO86/n7BOCPEefzqCFrcw71d0ax9VLdfxj1ovkRyGSV6pAe2qEbmmPA08b3RJvi2pgf/bLg1tYGrzPJlfrBPY9kC1hLv4jDx8v/jEiU9wEhsB08qG73R9hq/0GmnfSugAML+tWY0lj73OEvYsAoBN0/JvOe6nSNxZTbphWFBxmldMqW8I/8oJUQxM/23aIF+VqrMEfDANTMCVOnHylBnvQHT0bGZQ8tirwuPdEDUlC5g18tT5bTy6q0wTY2NUzGkuTyzduh9q1lcP2hO60MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSzT5WrC7iecR37ejyyExxSkb6YvlrAgAw6XLwPTTQc=;
 b=SEIF0KRsRZFFremRfNQjYl0kF9hvAxxfehPFk3Tg97gdZ+aFs4tq5n6cmrKm7LM5MYqVJUifOek5Tk/+VId3E3UGOvIDRqrXRJITlAl81GjobqIBRQ8NW5oycbtsFHrzcFp5EnuJhsYoP1TglBkLBXpnLUt+H1q2ely1axAfeIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY5PR12MB6155.namprd12.prod.outlook.com (2603:10b6:930:25::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 15:12:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::441:3118:e408:9ddc]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::441:3118:e408:9ddc%6]) with mapi id 15.20.6319.021; Wed, 19 Apr 2023
 15:12:53 +0000
Message-ID: <91654bbb-4bc1-2218-14e7-99fed3a3408b@amd.com>
Date: Wed, 19 Apr 2023 11:12:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/display: Add missing OLED Vesa brightnesses
 definitions
Content-Language: en-US
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230412000943.429031-1-Rodrigo.Siqueira@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230412000943.429031-1-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY5PR12MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae2978e-3ea6-493b-1ff1-08db40e88c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtEGSZZ0CZDt7riQvNsAZ/zzn/62r8AU+/fXWezayih2YwbbRPbFaOGkt9AVboSxhhBcREyI14C2jTEdR8QoI/p71+bLpzq6WPp8eW9HMUzg+FxN746mRE5rGoheDwatNh8AOsf5CwxyfD4ZJha+kdFSrkjB4zvrgI80AC5CUv9wvQtMQFj2fECyiHsw50ftej6ulW/38j4CSLYKkxgP3iZOdoPY5cZoaZZXKSc0s4az1ckLsnZLxwV6nLBekYmWD6o+9j8/qSqhROJUnX8efINP/QE8TaFWpeg1spQeNx8MlYF4dhXux89roqv0J3OPfvmC5rlXvJt4Jclkwme71QPckRdiUKZYObTB5TPW7wD+NfOhRr/wnopGZzNrigMnWajEjFpL163hvFH1gBdgfYq+Tk9CvtHvGMkD/dRqQtxmz26wAHTS2kgk5gu/224LylBn5Sgv0TRZxFzuv+eIGf/bn4tYSD6lf6mlvq/AA3m/5KLVvB7eApFHTRM1yVtcOwuAsXyBtrJcSlrDxkfcpylqjmCEvpkJLqtw2W41YM1LxpGN50qPqPEpAC0FBeSFE9RTfljT+BXt/LldCwea4zy/tBEc+rLqZAiZD9sY1ST/vcI9XC5I98I4JZhFS8quiGJ2xRT4TIpjnZKSapJ8fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(36756003)(4326008)(54906003)(316002)(66946007)(66556008)(66476007)(53546011)(6486002)(41300700001)(478600001)(6666004)(5660300002)(8936002)(8676002)(2906002)(44832011)(86362001)(31696002)(38100700002)(2616005)(6506007)(26005)(83380400001)(186003)(6512007)(31686004)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NSt2bTkzMlJISndScmZEVkh1MjNjU2pOOFIwYUNyaEhQODJvNUxKQm1BUkVI?=
 =?utf-8?B?UWZldmNRS0o4eU4yT1ZFMTIwQlE1V2FqTTM0czA1TEdlbm40c2xJUGR0TFFC?=
 =?utf-8?B?Uy9yM0pzWFNxNzhjM3lzTkNDMkl4ckkxUjkzTC9peWl0emQvWElRYTE2UzRv?=
 =?utf-8?B?eWg5YzJhenFXMjJpZ0tuckNaK2dsSDVpbHcxbjJiNFVBeFlvc21GakpOdVBV?=
 =?utf-8?B?dmdMb2hvUHZ6WWxKYWhPM0RZNEZoejRkazB2eG5FUjJiNWhNanBHQS9DTHNi?=
 =?utf-8?B?UTlMTHZMbWdNMTRUL01EeW4xTGwyVGoxWXpWUUhvMFZyMHcyTm5RSSt4dnZv?=
 =?utf-8?B?dEZMVkZ1bEpKK1VPak0xUm1YK2VUcjF6a0NYdHdUamordjE0N0pRNW1DeVZh?=
 =?utf-8?B?YktDeDI2UGtRU3c0U1MvSkttc1VqNkhOd1B1WlZKZkdQNWxtMTdlMDN3MWlY?=
 =?utf-8?B?ZWp0WUc4UmtvdTYrR0dMMGUzMjZTNE9WS0hXS25oazlHN1laYjM1WnhZa1JZ?=
 =?utf-8?B?dWZnMTBoNUpXNitxTG0wY25kWUlLZUl0L09iWFhVdldHemJOMkdvVUVZb0Fh?=
 =?utf-8?B?VVBMRFFDdmNRVkdDS1dqbzNFODR3SjYwYmh3OXd4d1hxOWpUdUdHblBZS21V?=
 =?utf-8?B?TFV1K1pKM1lMLzNyZ2krSFNEckdpc2VOMTV6OGRuOEdjZUJsWVdSQzkydGNy?=
 =?utf-8?B?SFNOTFJYck5ONXNmaHlUVWV2VXpUNEgxVnBsMVlJZGxkT09nS2dXRkU4VnNW?=
 =?utf-8?B?QXYzYk1jeGJzaGZvZ2xuckVHWFFGcmRxRnVaRFBXNU5tVmxvWDZEOFcySHpB?=
 =?utf-8?B?ZDAySk9zUXkzTTNGbmh0aUhVY1hTMUJXaG1UeDZrdkVKTFN2Q1Zjb0Vrd29D?=
 =?utf-8?B?Q0ZIdVdJQURZMWIrYTVoNkhjVzNZOEFzVkV5cjVLbjdjNjNMVnJDSThuTW90?=
 =?utf-8?B?UVNtVG45YWxmby90SnIxK2ZRU2oxdnE0RjVNMUJlZ0RsMWxyV2JuVzlIUFgy?=
 =?utf-8?B?T1J3ak0wZ1NlMDVXMGhJQlpDbi9ueFhZdFZacyt4dlJvMEY5cDZTcGJOQno4?=
 =?utf-8?B?OElOVmVweW1Wc1Fvd1krOGR6OTloVjdCTWpnNE4ramJKNnJKZDdhNUpxSmJK?=
 =?utf-8?B?ellvQ2FvUE9pbHYwSDBkZGJiM2tUcDdUakJxN3FxaXV3S3RiS0c1VEFZVXpy?=
 =?utf-8?B?VFJwUXRHSVhxYnAzYmNrN1JVMm1NYko1dWxMTHpxYjZEUEVhZUE0dzc2N1dO?=
 =?utf-8?B?RDF4NlVGUHYrZXBNNk5DWEZmK1NlY0pEdUx2WGVHd0Z3YTRkTXo2UHd5MHQw?=
 =?utf-8?B?NjRyUUZYWi8wcm9LWFFYVHF6dEhxZ1ZhWlBMV3R6cHJldjNDV3crTlZZS3Bx?=
 =?utf-8?B?SXJua1lCOVFaSCtEM21Tc0Z6b2tLR3lmS2tXbVlRSGswZWRZUkpBbVRjeWJn?=
 =?utf-8?B?UFJ5NFBoQWhEUkp1a0dsa3JqVFBCWUp5M09LRitvZHBrQXZVNS9MQlM3U2s5?=
 =?utf-8?B?TzZJV3hMdXU1ekEzUCs5MXdXZDM4bFBvQkRlaVhnZHN6TWREdGNMV2VGTldQ?=
 =?utf-8?B?ZVU4NGpJeVNUTHRQczN2NzFiTEgvN0cxQTRFQTRaN1FLVVJhY2ZzdmxUeEdW?=
 =?utf-8?B?NUdYajNVVUlBbzZUQmNQSUFaTjVDd2dHNkNOelV5Q21ObnNPUTVjK0hDM3cw?=
 =?utf-8?B?MDltZEI1SUxicG5ua1FTT1dncjBJZkwvNVdIM1hLOFNETThBWElHdUphMVJ0?=
 =?utf-8?B?bDY5dW0rY0czK2JxWW5Cbms1Rm94L3o0TmVSODVGT1BjK3I2YVZRS3N2cUtk?=
 =?utf-8?B?U1I0ak4wU241dGZXaEZKUUNhVmxLbGJvK0ZkMS9SRkYydDg0OFordjlrU0t6?=
 =?utf-8?B?UjdSblhvaVNWQ0ZSL2lKb0dXbHd3SktvVVBwNWprenRmWjQzR2NvMW9NZkFX?=
 =?utf-8?B?bEdibEhJcmVSQVNaYlVsWXZHbUdpMHhObjREQ0VEdlJUeGM5bHdtQ00wVXJH?=
 =?utf-8?B?RW9NcFFMREU3dlNCd1h3OGhvM3F3V3hrNWpZajNqV1VYOG5KbEdhREE5Wk9Z?=
 =?utf-8?B?TXlMUDNZYWh6bkx2VnFsTlV4a1ZHaGJMT3d1RHg0QUFUdTROcU5TM1o1M2d1?=
 =?utf-8?Q?uJUV24s5lqRFR1f2AUsX0Mfrn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae2978e-3ea6-493b-1ff1-08db40e88c3d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 15:12:53.6073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvWCeCW75ZzibbD7A6kwPPEdXAIBn4X4+fvG8WGXI2vx5Y3C8LrGJvFWy6cRCVPeR5k6Lz73AP7qHZ0uuxvi9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6155
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
Cc: Felipe Clark <felipe.clark@amd.com>, Anthony Koo <anthony.koo@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Iswara Negulendran <iswara.nagulendran@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/23 20:09, Rodrigo Siqueira wrote:
> This commit adds missing luminance control registers to enable a more
> standard way (VESA) to deal with eDP luminance control.
> 
> Cc: Anthony Koo <anthony.koo@amd.com>
> Cc: Iswara Negulendran <iswara.nagulendran@amd.com>
> Cc: Felipe Clark <felipe.clark@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  include/drm/display/drm_dp.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index ed10e6b6f99d..7ad749423a48 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -973,6 +973,7 @@
>  
>  #define DP_EDP_GENERAL_CAP_2		    0x703
>  # define DP_EDP_OVERDRIVE_ENGINE_ENABLED		(1 << 0)
> +# define DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE		(1<<4)
>  
>  #define DP_EDP_GENERAL_CAP_3		    0x704    /* eDP 1.4 */
>  # define DP_EDP_X_REGION_CAP_MASK			(0xf << 0)
> @@ -998,6 +999,7 @@
>  # define DP_EDP_DYNAMIC_BACKLIGHT_ENABLE		(1 << 4)
>  # define DP_EDP_REGIONAL_BACKLIGHT_ENABLE		(1 << 5)
>  # define DP_EDP_UPDATE_REGION_BRIGHTNESS		(1 << 6) /* eDP 1.4 */
> +# define DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE		(1<<7)
>  
>  #define DP_EDP_BACKLIGHT_BRIGHTNESS_MSB     0x722
>  #define DP_EDP_BACKLIGHT_BRIGHTNESS_LSB     0x723
> @@ -1022,6 +1024,7 @@
>  
>  #define DP_EDP_DBC_MINIMUM_BRIGHTNESS_SET   0x732
>  #define DP_EDP_DBC_MAXIMUM_BRIGHTNESS_SET   0x733
> +#define DP_EDP_PANEL_TARGET_LUMINANCE_VALUE 0x734
>  
>  #define DP_EDP_REGIONAL_BACKLIGHT_BASE      0x740    /* eDP 1.4 */
>  #define DP_EDP_REGIONAL_BACKLIGHT_0	    0x741    /* eDP 1.4 */

