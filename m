Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663F37076B1
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 02:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E83710E4AF;
	Thu, 18 May 2023 00:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659F010E4AF;
 Thu, 18 May 2023 00:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsPq5y+8kcMREHPlu7U5ErVvUV+YWFWLNohpMr3a6EdfM6KXLWCDiz+UszVywXnfk2kPtaAYx/9W+zhUdum53uGOmIeSfEqfnRyDk/RAbOnONljJL9UnX7OcekmYgtYUrjGbgwEi0Ep+/DP3jWr1WcibJk12cY4bdmHGVbhK3FmNLJ0pD5d9VoBGXFPKVbdzAqpXvLI79dOgo6yaoNRF+HvXRIHoWJH08f83oRkFN+oJFPzsoSVwGbsuUT3aqY8al0mDP72mnDuMO5Vt27Et/THYLNXkb0H/N/0eG27RiH0zeehEp6I5SpCx8lwBqGYnQS85gMvbVK+hM0dtAtyYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2EcSff3PSpX9PNycprp65HHxUTh0kNmVd0av6XpQio=;
 b=JkhPB+PGXcUvVIJEFD/sPHWchpnoKn3sZ9Rz1ivg0UEpFW4UutA4sA9uwS39QDX/8sGjwZo+hbkTdhIWcEbDLncBzLPpR1syTQmfKFNZBU1+IQHbmQSo6CjxiyKbEd4PfGil6Bi2zZZ04+EX6nHvoOWma8xyCNa+/+ngplkboEflhTValn7cEnURwkj/P27hY4StqS6n936qicHGEznp24lCBJlwZ9xUeojN7Sr9nZVBu1JUqxTWxTmThaqeaKXcacQf4pP7d3/7TOHpK0peDKGzWAadSC0dyP4Ry5YwhTTdeYE+4GB18jNJUeO1wVBoJuuyEzqpXrq2BlJP8od0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2EcSff3PSpX9PNycprp65HHxUTh0kNmVd0av6XpQio=;
 b=AJW0sa8n1qOvaftNu2zEKmz4b3oIlJmh1Brk1Cx40Hb4cW23CB5RGU9j6O7NZSLdKdsFr/wyIAXqLWqr4Bc4Vde4/8S/c60HuhglpzRmYzdzCUOjxCTIU15AD7tedmH7C99IL2WCRESEKScWvuHP4Eh4qQIHqKls+ohVODDdJPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CH0PR12MB5236.namprd12.prod.outlook.com (2603:10b6:610:d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 00:03:23 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::3d88:4b4e:e0aa:3c36]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::3d88:4b4e:e0aa:3c36%4]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 00:03:23 +0000
Message-ID: <3e4b8bed-005e-1b12-82f4-45b5cf3e7b71@amd.com>
Date: Wed, 17 May 2023 18:03:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] drm/amd/display: drop unused function set_abm_event()
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230517183350.314082-1-hamza.mahfooz@amd.com>
 <20230517183350.314082-2-hamza.mahfooz@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230517183350.314082-2-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0266.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::31) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|CH0PR12MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc94623-7dac-4f00-b483-08db57334bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KBxS0xnTVso6GfJawy6MQt1OrSJ1VKTO6xYGzyI43Wkfve7ZD76zrniiU8n5X0QfYWirnlufKZoQJi/6DZhmLEX2IUKhQHLMgj8OVWLzLaoNIBCvuG1NoF4FKeuAPv63ECO/RM/RFHJLhO64LTwJEdlFCL/+VadwceWPbh65Z/Ab5/heE8FAuoGWhV/B5668gPu1p8fgsGAvAyKz9U0nnE1p07DU2ftCK7o78FRoesJaEYqC5WcU86A0SpxogTdan5UbPBxGKUlN4XZFyq8HK4LdNmuJJiXe0sm8cl6Q8JgTeK0AkzpfTRDwzBC8CnZenk9rp4kzYEHhwWSZJe+KzugRy/DxFWqrglDWGipNUXBm6fIekY39G7KToq1dAZsIgRHnlOzcK4Hq3FzqK0ESt/rteVAS6xIE60YEJ6Z4JQK9OdJG0A5UmWSnhoLPlxK7HCz/kbT/VSZVhbZY18nvxMMKCy1lryu1lHg2yoxtXiD3IyP1WRYkU3BEregushiVuM/bJxYikjcgq41h7e3C+L3BO3NhNHtarBfnYkXSRr4SYCtR2x6w9z/X2eu59uAuy1FADzpqVmJJ2iSbKNoBO66MhRj3YWdElXJDvEl5CPVBj28FWOZ86fRu6fhFt6sf7BywYYiXRbb8Zr028bUWcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(6512007)(6506007)(31696002)(53546011)(186003)(2906002)(86362001)(83380400001)(2616005)(36756003)(38100700002)(6666004)(41300700001)(6486002)(66476007)(66946007)(66556008)(316002)(4326008)(54906003)(31686004)(478600001)(5660300002)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RndKTnZ3TjJLU2RhTy9LZENKSDZZdHZUeFE5VWVMd2x1YVB2dlpGdzdrekpq?=
 =?utf-8?B?WVEydGUxeWJCY3RlWHBFc3dad2Q5MHNZaFNDNkNHMmJtSnNKUXUvUTdsWXJz?=
 =?utf-8?B?OFo0MXNaM0hEZzZWNXEzcktqRHlVSklJVVlsVXp3V2h3Mmx3K1FjWHlCQytq?=
 =?utf-8?B?T2YxOVJaMFE5cE5lektjK1hUWG92Rm94ZVJRYTdyV0JiZlFVeEtqbHAxaWpj?=
 =?utf-8?B?Q0RvUmR0RTNvOW8zT3dnWkN6dmJPdnRJdk9JR3NHdUhYcDIvQlIyU1l3TnRq?=
 =?utf-8?B?YXBYQlVmUlg3U3F3bDdLekMwWVdvcjVncG9YRmJpbS9WTjJMRVlNZ1luSzgx?=
 =?utf-8?B?NHNJOFVnNnVDaTFubG9QelI2M1BTK3JOekdKb3UrUjl5bDdUckFHbDg0ci9R?=
 =?utf-8?B?UkJseHhNblBQR1dTTzYxMERHVEE0SE1JYWhMYk91WE9qam1wSTJuZ2JUcEg0?=
 =?utf-8?B?eFdjK3RLLzhZUG03K2dMbkNOR0crVCtEc2Q0emFSbWo1Q3g5RXFpNDNoaThv?=
 =?utf-8?B?STF5R3ZDWEtySks2T2dSY2I5OWVTZHNwdTVKYVREeHRQN2k1cEtPOTh1bTZ3?=
 =?utf-8?B?Vlc2WmdicjdaSjVRenJ6LzBhS2JSSmFQYnNEOEpFRVE4bG5YYWpWaEpXYWx6?=
 =?utf-8?B?a3NsWlo3VUk5dUZVc0ljTldCQkM1aHhoOXVKR29ncUJpWEtrNXVoWWZ3L3NC?=
 =?utf-8?B?aTVJbUI2R1FXZGFlMWJNQ0xybENCMkpMcE9XNTRQWk9iakZKYWpiSEd2LzdP?=
 =?utf-8?B?RGxlY3psUC8xQUNMKzRGbWVWMVlkck1heEhYUzJIaWpyckh1T0pnQ1poaitH?=
 =?utf-8?B?MElPRUFvR1NVa2dEZXY2TzNwVGVUVVNmcDEvUmRNNENMTWhtWjgxWVd1N0hr?=
 =?utf-8?B?VFpGZmN6ZGNGTC9rdG1qdFZmQ2tMMjVoSm9NMHQzMU5yYlJNaVhTQ202N1lj?=
 =?utf-8?B?QnIzTXhZaVFnKzJrVjJPdXRDdEVrMUhlM3FnN1lYVGoyWWdQYm14RWJkWW9l?=
 =?utf-8?B?MXdEbFpRZGtDYzNudjYvMDlWc3FBRFFqajQ1WVhteGZ3L1FjRy9yUEt5K1Q2?=
 =?utf-8?B?QTRFVlVJSU80clVBTWFML2pHNXBTZGN5Y2l1MGNhS0tWQWtEVHlrWkxjWTBp?=
 =?utf-8?B?NDZrMGhiVmhwYVIzZzA3UEIyYU9JZCszQ3B2OENUNzNjSTlaU3BxQ3RlOTJh?=
 =?utf-8?B?akphd0Q5OG42L004MUhqdHpCdjdzTE1LUWhyL1VNZkZKNkQwOTRRaDIyY3Nm?=
 =?utf-8?B?NlF5WTBlR3BaMGpWMGVjYW0vOTdWa2ZKSktFWkpzZk5rWXZaK0JRZUQ5VldU?=
 =?utf-8?B?aXd3Qk85RFlLeC80Q1RKQkMwelYzbHlxMk5tT254bVNXcUxHbGVmVExGUFN1?=
 =?utf-8?B?WXZwVXUwOHBJOEVKTkM2a2xrR2FiNFFmaHYzT1RobDhGWHBPcUFCOVppSmJT?=
 =?utf-8?B?R1pzeUFRRDJIeG8zd1FTdkNKK0gwU3A5TW45Yk54cHNwY1pYNFlaWUtscGRF?=
 =?utf-8?B?VzdxTjY5eTByU2Zkd0h4dGIycitTYkg1aVlPOEVvM1dtTHFLYU92b1UvVmtE?=
 =?utf-8?B?M3E3R3lkT0U1bDBwcE5tK1FlUnduWkhvOTJ5VXFXSGk1MU9ZT2hoakNsWUVv?=
 =?utf-8?B?anpldUo2Rjl2NWNteW5oWS9CbmJFMGlwWGRyOGxmRm9EQUcwUk44c09VcmIw?=
 =?utf-8?B?VU5Vam5kanpnVmhQUVF3cHZJaXJ3Z28rR25PeWpMTjZ1S1RPZER2dTFLTitU?=
 =?utf-8?B?K2pjZ1hUTWZkdkJKYWxXdVBJSGI2aFRJaSt5MnhOUmFmTE0xRDNmL3c5Q3JU?=
 =?utf-8?B?UGtXWDdVMFB2QjhVOFdzOUpzb2RtYXo3ME9XRy82d0JDTGFwSzhyUHk5S0JN?=
 =?utf-8?B?azJSUWNYSGd6ZlRuMm5GSG95Nk1WbjF6a0Y0dUx1N1pTQWhYUTdUMnpjVXZY?=
 =?utf-8?B?V1hMVmJWaWdVdlUrOGFQYmFpandzRUZDS3JXc25mVm9oazUxRXZzbjhDbUdF?=
 =?utf-8?B?ZlA5dFY1dWk5YTBhb0RFY09WWGJvd1k1c2htTVloVGpvLzVldjhkSG9OQkUv?=
 =?utf-8?B?UjE2OEJseC9uVTg3THhMZFBoODlmZ25xZ1NidkZZT09OOEdNSDVWOWhNRUJv?=
 =?utf-8?B?bzVJWGpZVmswaURwb2NOQVNwdndzSVZQeEMrdDJNVUlsa1JlRUh6anU1S1Nu?=
 =?utf-8?Q?stptw+fnBbGmeAHEDAw7789WeLDtB4UY2sXsGEe5R8aM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc94623-7dac-4f00-b483-08db57334bae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 00:03:23.1824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqp/9rJv4Q3NrhM7majZRy7ZljNVkvVkFjbiQeenPYs7ukZYJk6YvbusviDhEaR+/i6do6BzQPRSdSrdEgmL4Q==
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 Nasir Osman <nasir.osman@amd.com>, kernel test robot <lkp@intel.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 pengfuyuan <pengfuyuan@kylinos.cn>, Hersen Wu <hersenxs.wu@amd.com>,
 Cruise Hung <Cruise.Hung@amd.com>, Mike Hsieh <Mike.Hsieh@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Leon Huang <Leon.Huang1@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/23 12:33, Hamza Mahfooz wrote:
> set_abm_event() is never actually used. So, drop it.
> 
> Fixes: b46c01aa0329 ("drm/amd/display: Refactor ABM feature")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Tom Rix <trix@redhat.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 12 ------------
>   drivers/gpu/drm/amd/display/dc/inc/hw/abm.h   |  2 --
>   2 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> index a66f83a61402..2fb9572ce25d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> @@ -131,17 +131,6 @@ static bool dmub_abm_set_pipe_ex(struct abm *abm, uint32_t otg_inst, uint32_t op
>   	return ret;
>   }
>   
> -static bool dmub_abm_set_event_ex(struct abm *abm, unsigned int full_screen, unsigned int video_mode,
> -		unsigned int hdr_mode, unsigned int panel_inst)
> -{
> -	bool ret = false;
> -	unsigned int feature_support;
> -
> -	feature_support = abm_feature_support(abm, panel_inst);
> -
> -	return ret;
> -}
> -
>   static bool dmub_abm_set_backlight_level_pwm_ex(struct abm *abm,
>   		unsigned int backlight_pwm_u16_16,
>   		unsigned int frame_ramp,
> @@ -167,7 +156,6 @@ static const struct abm_funcs abm_funcs = {
>   	.init_abm_config = dmub_abm_init_config_ex,
>   	.set_abm_pause = dmub_abm_set_pause_ex,
>   	.set_pipe_ex = dmub_abm_set_pipe_ex,
> -	.set_abm_event = dmub_abm_set_event_ex,
>   	.set_backlight_level_pwm = dmub_abm_set_backlight_level_pwm_ex,
>   };
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/abm.h b/drivers/gpu/drm/amd/display/dc/inc/hw/abm.h
> index db5cf9acafe6..d2190a3320f6 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/abm.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/abm.h
> @@ -59,8 +59,6 @@ struct abm_funcs {
>   			unsigned int otg_inst,
>   			unsigned int option,
>   			unsigned int panel_inst);
> -	bool (*set_abm_event)(struct abm *abm, unsigned int full_screen, unsigned int video_mode,
> -			unsigned int hdr_mode, unsigned int panel_inst);
>   };
>   
>   #endif

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

