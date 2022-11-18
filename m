Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4670362F8DA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 16:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DE310E70C;
	Fri, 18 Nov 2022 15:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE9A10E1F3;
 Fri, 18 Nov 2022 15:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMm3nRuEp5zZLKoq7AHL6ZSIszP8a2GdSJd2pPSQYjlzLirTAEZ/lHy2tHZ2Fc0MmnE4LiMmzzX+9aEZgXKH9zB0I3zYz36xnHDgqQ/E9c+xBcGeaHe+F9uresDGn89yb+XVlBt1W3UcvUI0N1D7bJlapyzy23hZl0f4ZMY7+TSm9DJeT5jGhyj48gBMo/DsCzYG7fzHqXAteASxQnSi9YeIMQyJiGxPmRXtQvGCT9IgmQSri5LcW74A6fB7FDr0cH4p3/L8bfNsz0faJ6dYIFoA92MtHI9sIZ+8Q12bgOwMErjdeGNdrGZ0jOikE9EuIh9/va9f/nOF8/qChaz0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iak/rFYNgVO107Pk8bCIgt3TBKp8rsEgEOMGIrXCo0=;
 b=FuGHoQkYp3rCakPCm2kDVpXHyjyWMdqz76CJ3kyPO5ObHbHtu8udHCYUIcBfd9NtW8/6WrkSQwh4k3e17AEGAo0jkF8kMY650bItmqcoGQ4AMvNXkLAsaJSiFVsau6sFRXrLbbTf6zqx62FmH4mL4PzaZKdqvxi9Yd47LP+/xWHempzPaItiMgmNVjfdA90KtZ+F4wmf72PNCxsYLzFwYLLxOXN1McjWDuJxvasS6r/K/iWM5/vzce/XqMQd9CUPLPt8yh5Zpx9VcBXNfb2t34NlKl+6mLbWxCvaXuOkqFjkhgHA1cRX9r/W8YnhGooA9yA89uOJ9gKM0UcUdQSeFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iak/rFYNgVO107Pk8bCIgt3TBKp8rsEgEOMGIrXCo0=;
 b=sra49TAyGTQu8+3sck0akFGrkfEeY3EDpnXeDxvR2iZ2fhzOCAS6oS5JWapg/YckrP1Krq4RTz9ozC0Ane4W5oWrqaR6UzJWlpuXcyMilblRj0TuGk+NPAlx4cL8qA2G5A7iBP2wJlQiO2hPiE4IAxyetDUleGBLXwrYD++yQ0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ0PR12MB5488.namprd12.prod.outlook.com (2603:10b6:a03:3ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 15:06:29 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8bd3:e54b:2f15:989d]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8bd3:e54b:2f15:989d%4]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 15:06:29 +0000
Message-ID: <c4a9504b-bc6a-0817-52f8-ce4c1fd09a08@amd.com>
Date: Fri, 18 Nov 2022 10:07:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amd/display: add FB_DAMAGE_CLIPS support
To: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221115202413.283685-1-hamza.mahfooz@amd.com>
 <8f0c640f-e093-3977-0203-52e69da6e59d@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <8f0c640f-e093-3977-0203-52e69da6e59d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:610:59::34) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ0PR12MB5488:EE_
X-MS-Office365-Filtering-Correlation-Id: df969446-7f8a-4026-68f0-08dac976786d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FFX794OswXi1ifmq9xmIZoGqCxe9QSm9+cUNGfvV6aoKucS3vvps1+ANPpZkffa0qE0OMBDCa/5QkSEzPamKM8XsSABBjS+qU3yI1PnOw+nwI+WgWUAy5qjaZTPh/J4NZRUt5Aqv1Y3qIGHo1Q6Olr2SNAqhzJJ228XVOgoeX+51RXyDAajGg4k3LyFSuFAHqJbghag3Ad86FN3Wl8/jXdASlyA5PR+qWBeam9QqZ5bBpX9IC6vr3fzXWbB2VjHBhY2817UP/xXU+f75Bmpolc5noiRcNDLPTYx1IKsjUKf92FFjsdDxuYk+HzXyAodVh+0OBn3xT16GJYyjkbCjmCLMf5w9NlYeYLhShxXlX1OzWNBvhsbf23qFRc4HMbvQFqhBnDpsuMqhNWYGCWpHg5gTkaFtmwNSagPQMvILnAkWjawWKl6ZwkYVswrjs9+9GYUA+mPSNv2SShq8yCGYuVY6p3EA1UhvElAk04isaodzb9VRvwcHc1jKvJuQMm5frjxpgzn09+/2VaBzI0Ap5P9W3R7eOzbDvI5gLzNbxZJBoMuxbuWYQNkgrraXGGRn01Sr5BAeZBoOgrQMh00ACpJa3xFZsWuvKnwL2q/TpD2xerI7xqmPOZVwfrzAYWDrZvEBGwdSC8hNKPchtkpA8jyb3qicF+EJqlsRIHrdqHCTc1pjG3B1CiqXSIiftLGZqBgtbmEx0d24FZM+6BhKsGZMZ5RktWiWp/BA4oL3fwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199015)(86362001)(83380400001)(66946007)(31696002)(8936002)(4326008)(2906002)(41300700001)(53546011)(44832011)(26005)(6506007)(6666004)(38100700002)(6512007)(54906003)(66476007)(8676002)(2616005)(6486002)(186003)(5660300002)(478600001)(316002)(66556008)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3V1dFU1WEMrM2h0MkdEUC9zS2Y3K2pWR0NWZ0cvT3Y4K2NnWnYwbE4wbEsx?=
 =?utf-8?B?eFFmZUx5R0ptMktPcVVMaER0OHgraVh0bTE5SXp0QzlnNVpEbFN5Q1luNnkv?=
 =?utf-8?B?elhLdjRTNDBRaXpEdmI4U1h3bUVBWUlOc2FqTG85MzRTbndpOVJCWDBwTVdK?=
 =?utf-8?B?emRySkIxQ1BUNDZRL0xvYW9pMzd2elhDWVVDeDUwNitZYnZVMVExdnZ6Vi9F?=
 =?utf-8?B?YWZ1ZTNMVm1TQUxOcXJjMysyMFdybnNwYmJCUEpxWmYvcThKYlZpWDRsRTMw?=
 =?utf-8?B?VCs1RVErYmp1bkpqZWhUaVdRUFI3dDBFZ2tUYmpBVTEyd0xhNG11RGJySHhF?=
 =?utf-8?B?R1ZVWXJhZjJrUkRFZGtVcmxValFSSzhPWmhCTWM0amtlRFJNT0RlNlF6Zm9h?=
 =?utf-8?B?NE9vakljbUNPL0Rwd1l0WW5CM1FPSlQ0K0MrZTZwdDY1RlhBMU5tTURmUmlC?=
 =?utf-8?B?RkVWYnBSS0VQRWN5emlSc251VVRaOEZkOGpad1VEZVBST2FPV0RZdTdNM1R2?=
 =?utf-8?B?a2kzSzBuQWc2Slk2dVk2ZG11WW44MUFraytnREtkS2RFMC9wSmhxZVFScE5P?=
 =?utf-8?B?VnRBTzhsczVmNGdMNU1YMjZCcXVxTGpaQVNCTURGMGlGS05nM1g5cFl6MllR?=
 =?utf-8?B?VzMxK3NqQ2JtZVl5WE5pbE9kaFJNcVJYYjczMlFoSTNBSHlCOUwyZUw3NjZ3?=
 =?utf-8?B?bmpuQ1RNUnExenRxNEcxTVhtMG4yZW5POENkS3ZFNGJ4bEpTSGVWMTJaNGkx?=
 =?utf-8?B?dEdxQlVEejBXOElUczZ4QTQvbDdWd2JCdWJXOXhLemRRdHA2MEpDd2JtcmZo?=
 =?utf-8?B?SGVPS2lMdzRwVnY2a3lxYkRpdkpvSnR1OVpRaUprVEtBdC9lSzFRSjJFSUhH?=
 =?utf-8?B?UDVvYzBNWkpuQWhPS2JTNHRtOGtJb3I4YmJKeDdYcWdPbm9yeTd1K0h4aFlu?=
 =?utf-8?B?M2RpTmQrdXRMMzI1eGszWkgxOW12d296NDNDNDRXZFdTNzV2MjhpV1BoSm1x?=
 =?utf-8?B?Q09NL2lFeVBOWjhoUXVNZ0gzR2Zpa1AzZUorR25adWM3bkFtYzZGVGUxUFkw?=
 =?utf-8?B?N3pZUVlkRVF4WlppTGYxZlVrN0hDNXdXMDlURkkrTll4UURVV3huQlZqajNk?=
 =?utf-8?B?K0FoTjJSOW5yRGFJSG9wclBucmxLZ1pKNmhLZVhQaC9BN25HNUhKMWhiaEVs?=
 =?utf-8?B?Z29iYXF5Z0U0VmhGT1NsYmtmWFVIa3JoejcwZzBHbHJOMnNDZE1iNXdtQmJj?=
 =?utf-8?B?cG96Mk9RUkFSSmM3TGdsVkNndGw0T2F0dUlLWG4vN002azJvOWR4NVoyUW1S?=
 =?utf-8?B?V25tNHJvelZGWTFLZHozaVFjSkpmYnh6YjcyRnprN1pEaFZ5Z2l0QTAvTU1J?=
 =?utf-8?B?MENYYnBycEozVEpreGhNVlgzc3ZEWXBqdDA2WmNWcFk1QzRTa2c4bGxXeW9I?=
 =?utf-8?B?WXFhQ0dZd2tOclB6ck4yRWljZlgxUXFTeE1SVEd0WGdBTW5uYTNDSGR1ZWhO?=
 =?utf-8?B?cFB4Tys2RWRIQ3RySGdodjVpVndWSGR6Z2l0WGZkM1Y1bnhiWTM5NGQ2WVgz?=
 =?utf-8?B?ZVNFdks3U0ZhRE9DdjdkaVB3d0FLQ0lYSjNRNEhvbzR3ZWFhRndGbWxaNktP?=
 =?utf-8?B?RTd2NXoyTmlOQ3FIeGtoMGVmS3pNT3hsUFdSSGpXZWhPVklNbWRCenhPaGNv?=
 =?utf-8?B?VUlIaS9HVFNpdi9oOUJsYXJsY3BtblJ1cm1OTklXNERzNWxzYkMyeUlRWFA4?=
 =?utf-8?B?TWRlK3dUbmNZeWZyT1Y2Mjc3d3h1WkdEanJZWXFNY1NEbVZjS2wxYXg5TWZw?=
 =?utf-8?B?d1c2TWloU1Ixd0pUdFFEVCtHd3JZcGoxTlN5Rm5RYTM5VFdYdTRzK0gvYU8z?=
 =?utf-8?B?QmlTMVIra2RCdVdCcFdRM0JwS05uczI2M28zUVdzQnBCVUZ2NmpBdkJES3k5?=
 =?utf-8?B?cENLd3ZocWJBYWk3V0hIaHFLbGE1OEU1VEJxaHIrSC9xVXlrZmljRkt6TzZD?=
 =?utf-8?B?T2V6UnJDMXpUaXlScXJPWTZoUWs0aElydzRHT3JodmdjMVRQMXE2OEsyeXNZ?=
 =?utf-8?B?RWdFdjBJWmY0OGFabmtkNkUzc1QwbGFPZFBBQnF5TkdmU1g0cEkyVjVEQW91?=
 =?utf-8?Q?49XOfkTn8zDqKOOnz6svYyIf2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df969446-7f8a-4026-68f0-08dac976786d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 15:06:29.1681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsvPiucgtRGyvqhDGSvtPpTHq89CDBWgKqGSqGC8jMBPCMQDfxkX2Qbz3MJiimWXq62apnDvK1qeLk6hUIPKgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5488
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
Cc: Yifan Zhang <yifan1.zhang@amd.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Leo,

On 11/17/22 12:31, Leo Li wrote:
> 
> 
> On 11/15/22 15:24, Hamza Mahfooz wrote:
>> Currently, userspace doesn't have a way to communicate selective updates
>> to displays. So, enable support for FB_DAMAGE_CLIPS for DCN ASICs newer
>> than DCN301, convert DRM damage clips to dc dirty rectangles and fill
>> them into dirty_rects in fill_dc_dirty_rects().
>>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 91 +++++++++++--------
>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 +
>>   2 files changed, 58 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 185d09c760ba..18b710ba802d 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -4842,6 +4842,31 @@ static int fill_dc_plane_attributes(struct 
>> amdgpu_device *adev,
>>       return 0;
>>   }
>> +static inline void fill_dc_dirty_rect(struct drm_plane *plane,
>> +                      struct rect *dirty_rect, int32_t x,
>> +                      int32_t y, int32_t width, int32_t height,
>> +                      int *i, bool ffu)
>> +{
>> +    WARN_ON(*i >= DC_MAX_DIRTY_RECTS);
> 
> Hi Hamza,
> 
> Since dc_flip_addrs->dirty_rects has a fixed length of 
> DC_MAX_DIRTY_RECTS per pipe (a restriction by DMUB FW), I think it makes 
> more sense to fallback to a full-frame-update (FFU) if num_clips > 
> DC_MAX_DIRTY_RECTS. An alternative would be to reject the atomic commit, 
> but that sounds heavy handed.
> 
> 
>> +
>> +    dirty_rect->x = x;
>> +    dirty_rect->y = y;
>> +    dirty_rect->width = width;
>> +    dirty_rect->height = height;
>> +
>> +    if (ffu)
>> +        drm_dbg(plane->dev,
>> +            "[PLANE:%d] PSR FFU dirty rect size (%d, %d)\n",
>> +            plane->base.id, width, height);
>> +    else
>> +        drm_dbg(plane->dev,
>> +            "[PLANE:%d] PSR SU dirty rect at (%d, %d) size (%d, %d)",
>> +            plane->base.id, x, y, width, height);
>> +
>> +    (*i)++;
>> +}
>> +
>> +
>>   /**
>>    * fill_dc_dirty_rects() - Fill DC dirty regions for PSR selective 
>> updates
>>    *
>> @@ -4862,10 +4887,6 @@ static int fill_dc_plane_attributes(struct 
>> amdgpu_device *adev,
>>    * addition, certain use cases - such as cursor and multi-plane 
>> overlay (MPO) -
>>    * implicitly provide damage clips without any client support via 
>> the plane
>>    * bounds.
>> - *
>> - * Today, amdgpu_dm only supports the MPO and cursor usecase.
>> - *
>> - * TODO: Also enable for FB_DAMAGE_CLIPS
>>    */
>>   static void fill_dc_dirty_rects(struct drm_plane *plane,
>>                   struct drm_plane_state *old_plane_state,
>> @@ -4876,12 +4897,11 @@ static void fill_dc_dirty_rects(struct 
>> drm_plane *plane,
>>       struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
>>       struct rect *dirty_rects = flip_addrs->dirty_rects;
>>       uint32_t num_clips;
>> +    struct drm_mode_rect *clips;
>>       bool bb_changed;
>>       bool fb_changed;
>>       uint32_t i = 0;
>> -    flip_addrs->dirty_rect_count = 0;
>> -
>>       /*
>>        * Cursor plane has it's own dirty rect update interface. See
>>        * dcn10_dmub_update_cursor_data and 
>> dmub_cmd_update_cursor_info_data
>> @@ -4894,15 +4914,11 @@ static void fill_dc_dirty_rects(struct 
>> drm_plane *plane,
>>        * requested, and there is a plane update, do FFU.
>>        */
>>       if (!dm_crtc_state->mpo_requested) {
>> -        dirty_rects[0].x = 0;
>> -        dirty_rects[0].y = 0;
>> -        dirty_rects[0].width = dm_crtc_state->base.mode.crtc_hdisplay;
>> -        dirty_rects[0].height = dm_crtc_state->base.mode.crtc_vdisplay;
>> -        flip_addrs->dirty_rect_count = 1;
>> -        DRM_DEBUG_DRIVER("[PLANE:%d] PSR FFU dirty rect size (%d, 
>> %d)\n",
>> -                 new_plane_state->plane->base.id,
>> -                 dm_crtc_state->base.mode.crtc_hdisplay,
>> -                 dm_crtc_state->base.mode.crtc_vdisplay);
>> +        fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[0], 0,
>> +                   0, dm_crtc_state->base.mode.crtc_hdisplay,
>> +                   dm_crtc_state->base.mode.crtc_vdisplay, &i,
>> +                   true);
>> +        flip_addrs->dirty_rect_count = i;
>>           return;
>>       }
> 
> Previously, we always do FFU on plane updates if no MPO has been 
> requested. Now, since we want to look at user-provided DRM damage clips, 
> this bit needs a bit of a rework.
> 
> In short, if there are valid clips for this plane 
> (drm_plane_get_damage_clips_count() > 0), they should be added to 
> dc_dirty_rects. Otherwise, fallback to old FFU logic.
> 
> With MPO, the damage clips are more interesting, since the entire 
> plane's bounding box can be moved. I wonder if that is reflected in 
> DRM's damage clips. Do you know if a plane bb change will be reflected 
> in drm_plane_get_damage_clips()?

 From what I've seen, plane bb changes are not counted as damage clips.

> 
> Thanks,
> Leo
>> @@ -4914,6 +4930,7 @@ static void fill_dc_dirty_rects(struct drm_plane 
>> *plane,
>>        * rects.
>>        */
>>       num_clips = drm_plane_get_damage_clips_count(new_plane_state);
>> +    clips = drm_plane_get_damage_clips(new_plane_state);
>>       fb_changed = old_plane_state->fb->base.id !=
>>                new_plane_state->fb->base.id;
>>       bb_changed = (old_plane_state->crtc_x != new_plane_state->crtc_x ||
>> @@ -4921,33 +4938,33 @@ static void fill_dc_dirty_rects(struct 
>> drm_plane *plane,
>>                 old_plane_state->crtc_w != new_plane_state->crtc_w ||
>>                 old_plane_state->crtc_h != new_plane_state->crtc_h);
>> -    DRM_DEBUG_DRIVER("[PLANE:%d] PSR bb_changed:%d fb_changed:%d 
>> num_clips:%d\n",
>> -             new_plane_state->plane->base.id,
>> -             bb_changed, fb_changed, num_clips);
>> +    drm_dbg(plane->dev,
>> +        "[PLANE:%d] PSR bb_changed:%d fb_changed:%d num_clips:%d\n",
>> +        new_plane_state->plane->base.id,
>> +        bb_changed, fb_changed, num_clips);
>> -    if (num_clips || fb_changed || bb_changed) {
>> -        dirty_rects[i].x = new_plane_state->crtc_x;
>> -        dirty_rects[i].y = new_plane_state->crtc_y;
>> -        dirty_rects[i].width = new_plane_state->crtc_w;
>> -        dirty_rects[i].height = new_plane_state->crtc_h;
>> -        DRM_DEBUG_DRIVER("[PLANE:%d] PSR SU dirty rect at (%d, %d) 
>> size (%d, %d)\n",
>> -                 new_plane_state->plane->base.id,
>> -                 dirty_rects[i].x, dirty_rects[i].y,
>> -                 dirty_rects[i].width, dirty_rects[i].height);
>> -        i += 1;
>> +    if (num_clips) {
>> +        for (; i < num_clips; i++, clips++) {
>> +            fill_dc_dirty_rect(new_plane_state->plane,
>> +                       &dirty_rects[i], clips->x1,
>> +                       clips->y1, clips->x2 - clips->x1,
>> +                       clips->y2 - clips->y1, &i, false);
>> +        }
>> +    } else if (fb_changed || bb_changed) {
>> +        fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
>> +                   new_plane_state->crtc_x,
>> +                   new_plane_state->crtc_y,
>> +                   new_plane_state->crtc_w,
>> +                   new_plane_state->crtc_h, &i, false);
>>       }
>>       /* Add old plane bounding-box if plane is moved or resized */
>>       if (bb_changed) {
>> -        dirty_rects[i].x = old_plane_state->crtc_x;
>> -        dirty_rects[i].y = old_plane_state->crtc_y;
>> -        dirty_rects[i].width = old_plane_state->crtc_w;
>> -        dirty_rects[i].height = old_plane_state->crtc_h;
>> -        DRM_DEBUG_DRIVER("[PLANE:%d] PSR SU dirty rect at (%d, %d) 
>> size (%d, %d)\n",
>> -                old_plane_state->plane->base.id,
>> -                dirty_rects[i].x, dirty_rects[i].y,
>> -                dirty_rects[i].width, dirty_rects[i].height);
>> -        i += 1;
>> +        fill_dc_dirty_rect(new_plane_state->plane, &dirty_rects[i],
>> +                   old_plane_state->crtc_x,
>> +                   old_plane_state->crtc_y,
>> +                   old_plane_state->crtc_w,
>> +                   old_plane_state->crtc_h, &i, false);
>>       }
>>       flip_addrs->dirty_rect_count = i;
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index e6854f7270a6..3c50b3ff7954 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> @@ -1600,6 +1600,10 @@ int amdgpu_dm_plane_init(struct 
>> amdgpu_display_manager *dm,
>>           drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
>>                              supported_rotations);
>> +    if (dm->adev->ip_versions[DCE_HWIP][0] > IP_VERSION(3, 0, 1) &&
>> +        plane->type != DRM_PLANE_TYPE_CURSOR)
>> +        drm_plane_enable_fb_damage_clips(plane);
>> +
>>       drm_plane_helper_add(plane, &dm_plane_helper_funcs);
>>   #ifdef CONFIG_DRM_AMD_DC_HDR

-- 
Hamza

