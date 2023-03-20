Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43506C1445
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0C910E56D;
	Mon, 20 Mar 2023 14:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE79610E56D;
 Mon, 20 Mar 2023 14:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxPVxbNhssNbZ5+pgYpzKWvqieb2j4XhyV4DBhkDmVaebUQloBRdMMUP4ZFVC6UAVxhTPM5rtmwp5Qg2yLNAglsQvPLfot/I+qb1bnJLbdyTFqZ/tqG6Qw/fl53rgVDRpHTfS+lqvgxKVlzBq/eYYYnDfBHSMaGexiLnYN+9tppffotfho2JdyZlHst2LObfdKOmsNJmVZ6k1m11Jsz1F7r6FlnL2rhVE19weWUiDZ+/Ww6Ea64M8zWp8/8WFMC1AjiIE81Hc2Ny+15tBoWMM/5Bn4FGFSQob1MMkXy37S3+QJid6YaDBrMGBA2wKQYJqIiGjQoh8Q1AokjulrOghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m93Tyc3LAz75zxmVSfFaMPpcjaDYnBjkm/8TCFnphEU=;
 b=kYzPQ6jrvhUz9rLtMObyUDdqxEPSKmBcoGhvTL/0eLHvTT7iWDdMZdEirO24ctJWRrFSA4+dwXkw5ihUxDXFrpnNIs2rHYQwIgTHJ42JWfKPcY/9XxY/ILX4l6HFCoOm+HihXvj8XKwlvITiGv2lzm4eTs4NEc3jHvlROId4wxubSEHbuAzgBczRpoM97bo5LArL+R/JrtHxGqi1hZrL/TS80aCvIorPOpXuRVKltYJT8+5MrbY8BUpmTsa7pN8yglWm/aK5+JJJUqknlkZz98wM75XVYJGy4LUVxwlWgu2OBILXxHPaMevXjZHiDJ0fsRTxVqNYLFM69FeLKEm4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m93Tyc3LAz75zxmVSfFaMPpcjaDYnBjkm/8TCFnphEU=;
 b=3X6XLpQUVyk5544HBSDg51y11/Xx+lCBYVgei5fONu2dqswkdtP1rk7aX/0Oru5PmW+oI1bWOQTpYEo07tv72jR2L9jmdSJCxXKwOitGzbppaVKt53fapWS5pKKI2Gr+WxiGHjPb5h1+k2/7/O+yXoExODXINMes06959dsc7O8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:04:10 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 14:04:10 +0000
Message-ID: <82ef0ba0-a78f-bcca-72e0-2cf330323107@amd.com>
Date: Mon, 20 Mar 2023 10:04:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 28/37] drm/amd/display/dc/core/dc_stat: Convert a couple
 of doc headers to kerneldoc format
To: Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-29-lee@kernel.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230317081718.2650744-29-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0386.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::7) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MW4PR12MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e99418-7e2b-4aba-9ff3-08db294bfa26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJwNW/Fc9szfkR9zYWYCE2HU4kNGiM9suqo9OK3k7T2RD4THEhwFNv4Z1CG7oGbM55wWyd53csbHdOt/TQfjjRUvk4ohqBdtE6ODnfDgOR2CmhTm+pw0M9Ji494z5pD94eEPcfammwSc56g60cFmhVL57+XFPDbr/2Q5vbBf7k+Qt5+1MjwgzizMpPABLq27HRHztRRRAAEILPjGonmQe1SEgJPcp/OYcHp0fdsctw0ykI3uUlOjmVP/THiJyrZu9fW6V0Iwx5u9YVgfkhfHmpM4HcMXRDRymBD/8b9PDc+V6IoLIb/G3f79wUMIBGguLJwGpNvkTjTVH+juwP4wuOWn5SOP8d7sZA61M3jSB3tP+BVeYfTJp6VXU8BI4gsrsbYqDrAOsOCZ4fzsa0ik7b3+w70lo+rNe8GcostbpgToAvRsIpCSaESJd+RU1uU0eLGnIhnk8ZaOUb/p+6WoWNUkpV6NRSwah03v5IYwkK9jl4tymWU8W8AZy5jW1dZvk+3c0fn7c2tzplMinymSadtq0tiKzKGZl11PfLJP0uUxHoccHHDoae1t8HE5sh1goppOLCd2ESL2RTABD+tdIQs2Fh6l/meSbJ0MwGpVlqf0JTauT4ljA93qqD49dIbtUNy8k5xLd8ksnPe6a0UgzSuCP6gRu0LiGFujlbSKhTm3VIDdoPW6XZmtGwTGKeC8fdz31jYksMVHJsoeptKPd+Rs0ip4uCBS+gKzWusLG2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199018)(6486002)(66946007)(4326008)(66556008)(66476007)(8676002)(5660300002)(316002)(41300700001)(54906003)(2616005)(6666004)(8936002)(44832011)(26005)(6512007)(6506007)(53546011)(186003)(83380400001)(66574015)(478600001)(86362001)(31696002)(36756003)(38100700002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFh2UkJvSTljdi9DdHdvVVNXZFZoWk9IZUJBVG9LM0V1M1gwWEx3eCtyRU1Y?=
 =?utf-8?B?bERxTHlhb2RVdXFiYnBIUkEwRmY4TWgvSWFDUjArMlFBR2pzTEtnN2R1QytN?=
 =?utf-8?B?YzErMnRmQnZIZmcyb1ROVE1HRVhxQ2M4YzdTYzFwUEd6TGVmTDRqeGEzdGZm?=
 =?utf-8?B?SDNVQ1g2QTVvbVVNZngxUXBuSG1vNXpOTU5MUWgyQ01ZdWk4a0RuQWc3eEVu?=
 =?utf-8?B?UjlNN3BiUTU5ckYzSGJvS0NiMzRad3hKcUIyUXE0M1djNlNVSVM2bWVWd2Y2?=
 =?utf-8?B?RStuWSt3NTNnS3VxNElRaDJRb3dWWGRKYUtSZG1kajJtSllycUJwMTFxQTZN?=
 =?utf-8?B?NHlqalZTL2R2MUprK3BlUWIzTm5QcTVDeloyR0VFdkxiRGhpZFNod1JlUlg4?=
 =?utf-8?B?SnJXTS9JYVVWUUgySHZheXBpbU9jWXpyWTlMQWVpcmMyQjRoeFAwTlAzVFc5?=
 =?utf-8?B?ekVsdFdwcktPQlNHdTBRRVE2NDYzVWVDd1JPdnhMMnZCZDYzYzQ5WElNdlhK?=
 =?utf-8?B?L1lqaHlJNW1VSnNSYVJLTzFjVlV5SzN0OWNqUExtK3UwRFBpYkxvMXF1ZlJt?=
 =?utf-8?B?ckpZbERLanJIQ0NVUzV6YitnNFpzZVlYamxZNlJuRFFwZXlFMjVINFhQQ3dH?=
 =?utf-8?B?SWtWcXJxc1ZjWGtUWERHWlBTMWhaR3gvOTZNMHRCQWVwaE54RWtMM044N01K?=
 =?utf-8?B?dnQ1c0h1RDhWanJmakRNdzduREthOUJTTWRzeHNjL0Z4VWZ4Zm5xbjJ0dVVq?=
 =?utf-8?B?eGpYb0NFOGFvSEx1SFNJUzc0cUVxaFdUa0dycVZ5bWo3SDFDZi9mSUwvSGNC?=
 =?utf-8?B?NzFkTUlOei9sSlU4MEpnZk9VTG00d0lMVmV1U2hzSlpjdzQ4OVE3L1Nya1hY?=
 =?utf-8?B?TU1UdlRseWROR3E1WnpTbVViRFVlRitMSmYzcmlDS3UyMkpUeGp6Wk0wVHdI?=
 =?utf-8?B?UEdFUnRGR0pMZW03NHA3SVNteXhEZVAxaDV4dm5kOHI4STh2WFF6YVhsU0d2?=
 =?utf-8?B?eTdTdG5rMXdrUmFXMlUzMi92NEd1eHM0MTlkaXI2Z1BNRis0bm9uSFN2R1pK?=
 =?utf-8?B?dEdqOTl6TG9RNUpQUE9XTG4vRWhFS21TQzd3MytsaGhlU25PcUFmdnhFdjNB?=
 =?utf-8?B?MGVXQTdyeWZ4ZUlDekRsekhJaHhIa0Y3ckVCK2NkNTRyemxXRy9vOHByN0VI?=
 =?utf-8?B?TUE4aXJCQlI2VHJjMGI5QUdXYWNTMk13UTl4azRZU0U3OFhlTUFYbHVxNmwv?=
 =?utf-8?B?V3k1S0hjZkZyMjJuNEtoRU5FNjV3eHo4eERPQklDSzJicjhOS1BaUUJUeFBK?=
 =?utf-8?B?VDJ6aE81anJSVS9rWUY3UFBvQzJ4eU54YkhZMkNUNDNzUHhjUmVzaTk1Y2hx?=
 =?utf-8?B?ellUSUhiRVVONFBBR0xlRHJKNzFFTTJkR3BCKzVPUVJ3OVdQYzcwdDIyQ2kv?=
 =?utf-8?B?UWdhUFFCOUdxT0Vrd3Fqcktya0k2YlgwR0pTYlFDNEpsRThuU2VSRVhLMUlX?=
 =?utf-8?B?NVV2TnlSelRwUEJRYlB6eTRCcUY5dG8vS2VqZ2FuQ2ZpMzN5QXl0a2c2c2hj?=
 =?utf-8?B?ekdHUHJvZkhQbkdYNnl5MWk4ZXFKTjkyM0VZWTAzb1VSb3QzNGpTWlVJRGw2?=
 =?utf-8?B?aWJYaUpIZkQvNGJEWDc3UWVnYnc1WWU5NkVmY2VYdjZzZzQzYUlFU3U4WEZH?=
 =?utf-8?B?WGwzemp0aWp2c0xaLyswMFh4UkdqcDBMYUdGK284d2ZxZDZRbHJxTGJKUk1I?=
 =?utf-8?B?U0lmeXJjbkJTNFJlakFsZ2JuNnVLNXNERE9qaER5Y2s3SmFzdU9say95WU9X?=
 =?utf-8?B?RHhPU2RFWkF6R0dpa1BKK3RVWWdFZTE4OEg2SlM3S0dmakFHbVhGeTRlVmdk?=
 =?utf-8?B?QkNhcGw2YXBORUVycWVHZ1VCeWU3RTMvQXd3N0drcGRNc2dZNEdDdEQzNy81?=
 =?utf-8?B?UmtkNjVYUnFZMjczLzZmUFhpc1U0WUFtRko1YTBJdkF5UzRlRUZRc0hLNVVt?=
 =?utf-8?B?amM4ZVJpcm9KZzh2M25FUzNoWmx1cjBVZWxjakJVSjZsR25LaWZWM2ZKdHE5?=
 =?utf-8?B?d3U3TG9aeTZ4TjA0L3RMNlE0aCtXVzY4dnoreGIvbVRzSHBmbG9ibUJsMjho?=
 =?utf-8?Q?yvokatcxvPi0zWitAz4EoKl9R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e99418-7e2b-4aba-9ff3-08db294bfa26
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 14:04:10.1053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dBZ6xgOTDH0SvgJgRdEK8dy5evZdqR/8PjFVenj5HgQ3onxeibwesGoSiAoCshNxe6C9WaunUFtEhvvvbbNRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5668
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jasdeep Dhillon <jdhillon@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Mustapha Ghaddar <mghaddar@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/17/23 04:17, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.c:38: warning: Cannot understand  *****************************************************************************
>   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.c:76: warning: Cannot understand  *****************************************************************************
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mustapha Ghaddar <mghaddar@amd.com>
> Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
> Cc: Jasdeep Dhillon <jdhillon@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_stat.c | 28 +++++++------------
>   1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
> index 6c06587dd88c2..5f6392ae31a66 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
> @@ -35,19 +35,15 @@
>    */
>   
>   /**
> - *****************************************************************************
> - *  Function: dc_stat_get_dmub_notification
> + *  dc_stat_get_dmub_notification
>    *
> - *  @brief
> - *		Calls dmub layer to retrieve dmub notification
> + * Calls dmub layer to retrieve dmub notification
>    *
> - *  @param
> - *		[in] dc: dc structure
> - *		[in] notify: dmub notification structure
> + * @dc: dc structure
> + * @notify: dmub notification structure
>    *
> - *  @return
> + * Returns
>    *     None
> - *****************************************************************************
>    */
>   void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_notification *notify)
>   {
> @@ -73,19 +69,15 @@ void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_notification
>   }
>   
>   /**
> - *****************************************************************************
> - *  Function: dc_stat_get_dmub_dataout
> + * dc_stat_get_dmub_dataout
>    *
> - *  @brief
> - *		Calls dmub layer to retrieve dmub gpint dataout
> + * Calls dmub layer to retrieve dmub gpint dataout
>    *
> - *  @param
> - *		[in] dc: dc structure
> - *		[in] dataout: dmub gpint dataout
> + * @dc: dc structure
> + * @dataout: dmub gpint dataout
>    *
> - *  @return
> + * Returns
>    *     None
> - *****************************************************************************
>    */
>   void dc_stat_get_dmub_dataout(const struct dc *dc, uint32_t *dataout)
>   {

-- 
Hamza

