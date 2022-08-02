Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E265588035
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 18:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD479138E;
	Tue,  2 Aug 2022 16:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0A891356;
 Tue,  2 Aug 2022 16:26:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ygm9WdPpw3QlLY/Xmid5PcHg9oZ2FULIywrMSqDxWQ20Yy7xnxjosA02zvsuFL3UygZWWD30kdP6ukp2e7aeInCvo5MFBTHyKmMedymb5C0uuERBJFAe9rJEWOdirxm3jwl9fENnC4Ycx2dGfUANu7PGKTPFMdg5D+f71n6zmS/EWmhmYQM+jEQYW7JMhvLLZpnuA0amVzDt6FGkvxC72/UqMCs6Gbgdk5+x8Vb9eaFvTJnv4vGzfmoZLXBHocckTC3t/7L2nappDfeXvwKo1SohE3ReddiLJAw4guuLrwc4snDHKZQBj/ZEYCAuzdnmdtg9+A9KLelG0Y4X+RD/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsp2YGNaGF/A1ziGW/pgjOOS3lSVUmZjkXm3r0rVlsA=;
 b=B/FsHKDsrDgZjIpTLdTZ0qB4JGpXluqLXCmoqSU8RewCdSNL5n+mpOmNae02pMAcJfF/iX8S9vb1iMysV1R7RnKDIeVZ0gw5X23SUnexT2AUgvc1UliUIp3PD6srRvoN40CBKHbUKHTwhZZhc6fTELDOIYu3cnrswaioYQ5IF+hIfiNS/hbbEECvcRpPWz1pP7U06I8sD4sispqKzMPmVxUXTd+HmUjMEc4Wx4ZqkMirc37AWL/ppU+Y0cGlTvns0Np0t18mrws0c3bq0SUgH/nxmYZxQJe+S5xH1qBeT+nTsht6Q6wpB6hv9xbm4nz0R3ox/j53AMvQ+BNuYrMAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsp2YGNaGF/A1ziGW/pgjOOS3lSVUmZjkXm3r0rVlsA=;
 b=4EvMn3N3/nSiUgMKNNL3jcLp+qc56Mj2aPaBt8COj1vlcx6Ln0IBjuSPPT6CkTbEU1TZx7QIOxi7JFrK1Nh4sNR7i4mBAis+Va8cX/b9TdcWdFlm+zIipH3E8NQL/yfgOj85NorvHaXGd/Dj+p9o34BiS9h93vmgF4kw/Lx8Lo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by DM6PR12MB4532.namprd12.prod.outlook.com (2603:10b6:5:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 16:26:13 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 16:26:12 +0000
Message-ID: <25f53aa0-a84d-9d81-48b8-9bc9e3de707e@amd.com>
Date: Tue, 2 Aug 2022 12:26:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/amd/display: remove DML Makefile duplicate lines
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>,
 Magali Lemes <magalilemes00@gmail.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20220802120406.88845-1-magalilemes00@gmail.com>
 <a79c4c60-6179-1cdf-77ff-6c45d6b7cd87@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <a79c4c60-6179-1cdf-77ff-6c45d6b7cd87@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0002.prod.exchangelabs.com (2603:10b6:208:71::15)
 To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc49b5e2-62b2-4f33-df0b-08da74a3b711
X-MS-TrafficTypeDiagnostic: DM6PR12MB4532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +oTK9mL8bP8lTHDt2XkjJXppGPls2x3XfNc+LyMs5+6i0kK2Qq/yvxGNiuqXSNzh909Zt30CfatVtu1mEoCXdO5pA/doU8+IhJ9kuLFNW5P3a8EGpuv7B2dVHXbFBbny9G3t2SmhHIcalkP1Nc+k1JoJrrKBR+aji6gew2YJtiQ9sE4YOwqeSYhXUJLH+R2nXWIotCIGuSIrodHVjgZtCHBWoEly8mfMxxSXGNtD1KeSKCx390EFBHRi2V1GLdYXLiS2yCV/ZxLxI0I6kr7IMV50ga+yO+PqoN2/4MTMcEY32sWkK9W2flnZmgtDNSnA/YSRK4G6a8GUCm7t8k2qmrq0Q7BM/swRlYmBmDe66VPCarAb6rRTKNs/3zNkthZnfcf5l5x6V2Rp6l5bHauWkaJcMw2sF4TpvhfEKn4Xm2DhhdqOpd2odPIaIFfv5pEIAcmuS50qiY7rJHWaY6meErEp+YVrQMAN3h+cN7isNU/pt4kpst8mUIZn7wcZAOpRRw2IbeCsRt05wEEOWNyUkDwsYjl7KJYU17zJNu9gLOUz+ZLkmDvm/9WcnfXfnzkmkVgv3R70bLGIYRmnzMflvBhNyLZsh6OumESGIlr3zDIZ5A0+rbUClVanOhYtxS6UwPFYE7q11QKpwMDOX44ywnnDHYHmpsKbySBxAaUoWqMr7CVyiFONCRtRy54YK8gbeu8K5DH5S9Xq72ctMzjJgOkJT+5P02RKsUkhnZPWJeW+TAAFdss45Wr3DEo3/V04rnoQ3Dx4B1kaXHvN0PNziOkj4jmvIoS6l5s8dSF6/rWBPkTcD6hDzP6vuYXTzO5NGIjkM9RTMg/gr+pvhjMCbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(478600001)(38100700002)(6486002)(36756003)(41300700001)(6512007)(2616005)(26005)(31686004)(186003)(2906002)(316002)(6506007)(53546011)(83380400001)(31696002)(110136005)(8936002)(66556008)(66476007)(86362001)(7416002)(66946007)(5660300002)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzRPSlVwZFdWdWtYNWJDVXI4THFWYzVyNUZZZnViYU9kdG5XM0g0eStPR2oz?=
 =?utf-8?B?RXRidXlwcFprallKQXZWbXZBT1llQ3pQcElVbzNDZ1p6RnY5UktpdVRwRTg2?=
 =?utf-8?B?dyszQ3ZkQjVXTUlrcXJyRFRoSE5pZjlYSEo4cEpmajVsNWFGYWJRaVJDbmZa?=
 =?utf-8?B?cVAwY1pQYmY0RmdHT0RnajdnNVVNSzFRcnpFdDJjaXg5eGN0YlIveENLK3Vj?=
 =?utf-8?B?c0puY0VPcUpHd2tOUmJRa3VUemZhMXBaTzdFWGgrb0h3MnEwRnF3MEU5U0VX?=
 =?utf-8?B?WUJvK2tPVDhab09RcHVqWHQyT05YaS9rQm0yRFN6MDg4MTlyeExXdzlsL2pH?=
 =?utf-8?B?M1FHWTZwb1N1NWhqYitsNCtoWjc1OVQ3bDdTZVV6SXdBbks5YUdudG0zYTRa?=
 =?utf-8?B?cFZKeHNEWWw0M09zU3pqMFVwOVdmL05XYUxWU2ppYVU5enhPVE02ZjFOaklm?=
 =?utf-8?B?amh0RUtTTm50SnVXMU9QU2J3cWp5YVk4R3QxMmZqTHY5OG1vcGxyb0FRQnNF?=
 =?utf-8?B?YU1Rb1VXemtGQTZIaW5Oald1TGx1OFFtdS9xaWJiaHpWRWRmaUxzM0JVcGM4?=
 =?utf-8?B?c29QQXRhMVZKWmdYek9ybG1iKzJvVDEweWdua3BpcXlHVU9uSXVUd1Z1SXpK?=
 =?utf-8?B?RVRMNXFVV0dhMHhHTHlIMEs1WUhJNWpoNmUvZmljcVZzcnNWQitCL0RnWWhD?=
 =?utf-8?B?bGx5QSs3ME5JNDFpU1hMenZtaHdCUGI3em8zR2orZmljNml5ZVdUekZJakg5?=
 =?utf-8?B?Zy95dUI3YzlaZ0JGTHNDOWVHaUlFbXpSRkJwTVlsL1BwUUJ0VWp0ZHdzSEVk?=
 =?utf-8?B?RmF0VGt2bm9qbU1IVFN5QnpwaVI1bi9HNnd5c21CbjR6OXFKNFhXNms1bUg1?=
 =?utf-8?B?UDFLU052b0N1VXcxblpGV0RYeXNnb3NMK2FXSEYzb3ZuMkZHUmxUSUtMeTlL?=
 =?utf-8?B?eldVRUZwdnJJRXRtdENMSTBxUXlqWGMyYko1MDdTdjBsSG9Qb0tsMzZpVTNK?=
 =?utf-8?B?aUNWcFc1TCtxYjM1U2N5Z0RJdWNXTEpjUmg0NGNnNGxSUWt3Z1FmU3RQKzI2?=
 =?utf-8?B?YlVaR3laYkJ3NHA3NjR1YjhCM3RMd1N3a3pzTXBLTWZNdWQ4MXAxenpVcFdU?=
 =?utf-8?B?UG5BenRYVkxtTUFJdzVmQ1VpbHZOUEdvajJ4dVZ3elZ6RzN3QmlUM1NUZHFQ?=
 =?utf-8?B?UktXMDdyaXdIeWxEOFhIcXl1Sk45T3FObkRJQ2M3NTM2Tk9lak92VlBDYUdJ?=
 =?utf-8?B?QkplVU5JMmxDWmpEYVhmREpacDRVTGFXLzZ4R2FwWXIxLzNYMzVGb21wSVNY?=
 =?utf-8?B?VCtuYVhTWXgvMXkzVjhrWFVjKy9VN0h2b0FJRjhSSEZsTXBURHhKNHpnZThu?=
 =?utf-8?B?RTN3RlVmK0EzQTFyRE9vWVExcFN2eEpEVXN6ak5Jb21LdkN6U2lDRU5DOUM0?=
 =?utf-8?B?TnhWZ0llS2lNS1J1bldXY0V2NDhDR3EvbncyVlFHQzM3YzREdWVNZHZmK1J1?=
 =?utf-8?B?SjdkUEdEa2F2YUNkLzQyR3k4emRKL1QxNndhUWdmT0FzbWgybXJDWmdUMFpL?=
 =?utf-8?B?SHBXQ3B1cDdIdG1WMCs4dzJ6V1VaY1RHMFc0TzUxVjRtcnFDMS92RTE4WVo5?=
 =?utf-8?B?TVU5dThzaUpVQlBkT3BpODBWWWxJbG53emQ0cGI0NUoyOEIwSy92cVY1MXNn?=
 =?utf-8?B?T2g5MUNRaDJYOTA2MmtHejcyOHU2VVhudGpHeUFkZjNwSFRLcGdrOGhPM0s5?=
 =?utf-8?B?U1NWVGY2VUtkMDJvWUFtRFJzNHljNXRTUVVOUXUrN0FnOTBkS0Ewa3FjMU9w?=
 =?utf-8?B?T0dyWTZoQ0ZQQVVnczhibUdBSkErTFE0aE9tWXVzQlQ1MkxhVzg2SmFOMU9X?=
 =?utf-8?B?LzlDYkRob2s0Z3B3ZTUrbGNCZU4xamUyR052UU1ldXh2N2tNa3ExVGh1c2Zz?=
 =?utf-8?B?OHRVU0JITzhSbnpSaXc5a1Fha0g2MGJqVExIdEQ5akFnNzV0WkVLMUtqYXg5?=
 =?utf-8?B?RGtVVkd2WjBLWFp3L3FSVVpZa1lIaE5nbm1PVnEwOStHOUpLNE50VzRBWktM?=
 =?utf-8?B?SnBRZzBTSis4NmxKTGs2UXBaY0QwNEVrb20zZkQzdmNkeGlNRjcrU2J0NWpm?=
 =?utf-8?Q?9UzEiui0UHHGk0EiTsJp4M5vA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc49b5e2-62b2-4f33-df0b-08da74a3b711
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 16:26:12.7801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQcCfKl/AWBhCD1Ip2+1QLRoYAd3FsZ1k2iyQMqfuEdK7gweVUpYxjUzsJNBs3mT9j+iWwl1RkomhRtbaga23g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4532
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
Cc: siqueirajordao@riseup.net, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org, isabbasso@riseup.net,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-02 09:05, Harry Wentland wrote:
> On 2022-08-02 08:04, Magali Lemes wrote:
>> There are two identical CFLAGS entries for "display_mode_vba_20.o", so
>> remove one of them. Also, as there's already an entry for
>> "display_mode_lib.o" CFLAGS, regardless of CONFIG_DRM_AMD_DC_DCN being
>> defined or not, remove the one entry between CONFIG_DRM_AMD_DC_DCN ifdef
>> guards.
>>
>> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> 
> Harry
> 

Applied to amd-staging-drm-next.

Thanks
Siqueira

>> ---
>>   drivers/gpu/drm/amd/display/dc/dml/Makefile | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> index 359f6e9a1da0..41bb6c3cc2d8 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> @@ -61,7 +61,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn10/dcn10_fpu.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/dcn20_fpu.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
>> -CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
>> @@ -82,7 +81,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn302/dcn302_fpu.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn303/dcn303_fpu.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/dsc/rc_calc_fpu.o := $(dml_ccflags)
>> -CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calcs.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calc_auto.o := $(dml_ccflags)
>>   CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calc_math.o := $(dml_ccflags) -Wno-tautological-compare
> 

