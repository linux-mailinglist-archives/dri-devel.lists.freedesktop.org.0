Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E37687CBD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 12:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0949F10E0CB;
	Thu,  2 Feb 2023 11:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DB410E0CB;
 Thu,  2 Feb 2023 11:54:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm8vyBUxkmnYngmBRSZBgfldVz0/RwCb+2urj2JT4nhPfsOY3T3CSjIMhePQfMgzPFUmE4u47cgwNUJnwCZgemm+BsoeW0LsMNrXvJ3/75AXiIRwTm/3gHYOH17hw0A8DXFSeI39yLBeHyBvCTp4hvVdbyY+izd+JH5YNbutHiKqo9UCQqn4zkF1bBHgVG8pbDN/s2KZPVqIp6o9kdYXooRjP8blHfKSWdjwdxybVG1q9XGpArEHLyLwvlPgHz3QfsdG86g3Jh8NoF++eT/bIP9nmODdMZQebJDiJqO4VeM3vyIaXPfItDn4e8sfScVA3J7i3oiRMEa2kud4gpvE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd1++6eH4bibxHvS2TgmZTSEGZnGndGrqiBvt7ElW8o=;
 b=Jano7tyMsbOkOm8aW9hWci5fuZ7Jj8lgY1jo2jb6XXjEn1Jw/vCysIgVnF+A0lQ0O1JHQkpB0erjQ59ScZWMHNi5hri8Xbf3UxuY09nwaQ5E299w8shFtz/vSNF9NHqMfFZGN1F9ZmqGrFE6U9+bucIx1ETDU/CIfo9cUBhOwv3FU0ENR9t0P/nLag56Hkk8MA/tG7LdcrLzgXOxZ0XMWZ3egB5KlN+5H54Y/RtPXg6nqjy1bhV4R7Z99TGYvEQmB3F/x7o89x6ffKxc0gwuHZQ90IE968XFg7cIUUOafrgjcsGy+Shnx+vt6ct63v4zc4Mf/NUxCEaXcPUz76DP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd1++6eH4bibxHvS2TgmZTSEGZnGndGrqiBvt7ElW8o=;
 b=izURMIZ6FXHySnOFKKSGAQSXz11quC7UCGXIjwSbAwT+qkpyey6pTaAIzLAPjtxV+cTA3AY3iX3Vp+JXZyHlrZAus97U+Ngln6f7zyJAcyspqoBCS28NF+OnVSJXHMytTu1G2PQFaIwTe1QaaIcFbGm8f40doP5IDgEc6mymdYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Thu, 2 Feb
 2023 11:54:00 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221%7]) with mapi id 15.20.6043.030; Thu, 2 Feb 2023
 11:54:00 +0000
Message-ID: <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
Date: Thu, 2 Feb 2023 12:53:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 448a0337-5161-438a-d52a-08db05142c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6Bj/m2+OtYEBE2brnQL5lu3Z1fSMxTXNOKNwjXgVrazPr9w8kpLab0oqA5AcJMGK1xZdNQ8kLvMN1EQHwVas7eahKOYvAe69DuiZ1mU14Emj1GXAeIQgbP+Oap6PpbOrgb3Racgd1hyOlxa+ZVLAGHkgIeaD1rOKfOouZRKT6mTPWRudIqLroBl+LnekfAGpoWHXVVXeT9m8YDKli6wfRhw7hRp7wrbEAIg67h164t1TiHHdqBwQwlaEavaow62vcZDSeIzfWIEJ5uUTO99qYSpL28yWMCGEE5UGBcUa9Ah703M/TA3zrgepdoDdbbKfggE9t/kmjfZ3gQEvSd9v048rTkWKeXr/lYyayqJfC/H62NLrefiLul0mLfsgXJhb31wRN8nxBYrskWIJeyeFCwRSO5L6L/1z8vw73mMhJo+Gh5qolscr7sR+pDIsqurTYONouyQqeFoINTsvz+JyJF8rphsAWaB6+b615b0r0DjV9DrdEfiFcMGBfJuQrfKiERCeKsuPh8QExnsk/2dCl3fgFx55JnJ1LGW92c7mmS7dhOl2+1n9WlDhjC+KYVT/1iKA5Xj2YEUk0kK0sb0o+8VOQgxXfoivnZZJfcHApZKNaeQHuju1U1+cgf2jvuN3bBinqk890m8PgX+Hq+Vn3mA42JL21vlb9qQZIWp2o78CkpnEI2nJ4DZVNw+oYhGPK6rtnvud2ufnKMQjnUB60A9/CCOt/hAAw/xwtsMTGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199018)(31686004)(83380400001)(66556008)(8676002)(2616005)(66946007)(6916009)(66899018)(41300700001)(38100700002)(66476007)(26005)(6512007)(4326008)(186003)(2906002)(8936002)(6666004)(316002)(31696002)(86362001)(6506007)(6486002)(478600001)(7416002)(54906003)(5660300002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFU5eUcxTGJZRk5SSFhNN3VpQlU0d0ZUdlRibmpubkVLMXhuZiszNkEwcTFR?=
 =?utf-8?B?SXVFS3ZjUmswNDVBUDBTTEFKb0RQeDJlek1XM3J2UXp4YVhHanFXZ1pqN3Mx?=
 =?utf-8?B?SDZibFd0ODFmc1dUcXB4dTlGckNxd1hBeFhzSjBzQ2dXRlg1V2xjRVJpbHcz?=
 =?utf-8?B?RHNrdmR6NmNCSVVKSElMU3pQa3hjazdMN3dYQXFIQldZVjZtN20wUHpxdVpY?=
 =?utf-8?B?eEFWQlkwVjVzdEc1Y2x6R3VZSzlKZGFDLzdZNFlSSHFtQ1hlWUhoNnYxSjlq?=
 =?utf-8?B?c1MzYUpQTzh3L2NTWjcvV296VHp0T3RobUNiVlI1aUJFZEhqU25BSElHdWhP?=
 =?utf-8?B?STNHMVExRW1RZlVsK1ZlNGovSEt3bG5KZm12eUlaemNnSWxxREZ6T3dqNHhl?=
 =?utf-8?B?UkphWThHT1lSSkVFRkY5bjF2RnZXYVQ4bHVvb3o4NWVkcW15QzBsRGVDWEFh?=
 =?utf-8?B?amtKU3g0RnRhT24vRkhjNW8yUS9EYzROZFEzRklyWTBqelV6TnlBTXJ3RVhz?=
 =?utf-8?B?bmRiNGVTT0pTWUx5TDRaOXVubUhXVy8xV2NDaGVyQlh2YkpzN2JwVmNiU0Uv?=
 =?utf-8?B?OHR6QXhES1RpemYyTlVlWnFZNGpDV2RDaEs5YjNrdENXeEN6SGZlWk15WkVD?=
 =?utf-8?B?NlR2VTRCL1RUV1FxYnVZUy9JYVBYUTBFb2pYZVkwdHpCTmY2WWRCQ1I5YUo1?=
 =?utf-8?B?NXcrR1JwRFptbGRmZ3Q3cURHNUg1anVwZTZSZEJEV1Bra0lTZCsvdjNITTlE?=
 =?utf-8?B?ZnZwQzFSWDZTUy9XQy81YlZpSUwvSmsxTjBjTnk0ZGNuVGN2Y0dBNU51WVJR?=
 =?utf-8?B?V3k2NUFoODdwOFdsTnNpTXUxczRNL2lNUUNma0JKZUt6Sm5vc09FMnFYNTJF?=
 =?utf-8?B?dDhXNDB2ek93QUtLQis0ekJKdXRFcTloUkM2Y2EyVzRjUGFqOEN3akxSVDJG?=
 =?utf-8?B?ZkhrSlNHMVFYNVpYV0tMVDZrYjIwNU5WVEdTYjFoekRPTVIyU0ZPL1gwNHVu?=
 =?utf-8?B?dTRZeDgxL2Foem5VeU11alFHTDNreWsxM3lpK3gxK3MxQjN3ejdRTUNkaTJS?=
 =?utf-8?B?K2F0T2NKdXgxVC9rQ1NrMUJHZjJBdFJTN2RsaGZQVU9BSWgxbFp5ajMxSW95?=
 =?utf-8?B?clFCK0FQSWpTTjZhS1dCMFpXWUhUODVDcGlsMEdxM0lGYUMvOHVReDR1NFpZ?=
 =?utf-8?B?bUVDb3ZGcGUvRUdoMWcxOE5DWnRoaXhjQnJ0NXBHUytlWUJDTVZhcUwwUmo4?=
 =?utf-8?B?UUM3N0o2UWxTZkRJbXkxUklTMUE3OTBQZGg4eDRQQ2hyWFNMeTFML2JiUTRt?=
 =?utf-8?B?bDl3SGFMTUFBSm5tQUthcnJ2NTcrQkI0VnVoaEdDSFBpUFJ3UTlPYWRSSW16?=
 =?utf-8?B?MzcyRm45dXJpU3BLZXR2Nm56MXEyOFlNUEFQN1U0Vm5PVHBBSGF0Qi9Xcnhw?=
 =?utf-8?B?WnZwS3JBWERrQU1wbTBla20zbzVwRm11SkdaTlNMZlJZZUNmQnVvaFFLc2No?=
 =?utf-8?B?dDZ5OXdZaTNLZEhROFBWK1ZqZHp0a0Y2N1FLeGV2dGwyTmNDUlhBdngvaGgw?=
 =?utf-8?B?dEJ5V3JkSXcwdTJ0U20zTUg1dXN3K2tvMmZIdzFaanlWM25Sby9nc3UzdnJj?=
 =?utf-8?B?OFMrWTdlS3RDZVRrZnBCWmUvVmFDWWN5WkIzOGxQL3BaWWluM1M0ejhKK2l2?=
 =?utf-8?B?OWhtUzdkVGdybTFpVGswSnFyN3h1ZWlIOWMyVnVhSldDYnorV3c5V0JmZlNk?=
 =?utf-8?B?czVNZ003ODl6SlNMYkxNWFZBWWplVWQ4eUpBNUg4ZVpJcktOdHhTcEZXWUo4?=
 =?utf-8?B?SVJVRU9oV0gzMWc5Wm82T2RiWmhSRkVxTHJNZ3JvOEM2ZU5JV21SSURhbjBP?=
 =?utf-8?B?dVNmejFtN09iNHkvZmJSTlhOZ2trTGlLRjBZYmFOQlZpV0RZSG4wQ2p3MXBT?=
 =?utf-8?B?dnJURWJjdm5IczFsdjJFL3BFZ2xXbDlKUFJsRzdYTUNORGVJVkFXc1JIQStI?=
 =?utf-8?B?VzN6MTNtbExwQ1pvVlVuaTlueUF2WU51RnFIblFyS3lGVUFQTlB1cHBycEVi?=
 =?utf-8?B?QmpWRXViTkJ6MFAyUUJGWHpZaXJRa2M0K0M2NDFCZEp3dFM4VEE1SjQ3MmQ1?=
 =?utf-8?Q?ArUZVskLkqaJJg6fkEEkXHqcR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 448a0337-5161-438a-d52a-08db05142c39
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:54:00.5341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDmMtEju6G7euwvr5RuolJcBNV/bWOOa0BYWv48BJMj/5PED03xUVB2qhGDskMMP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, airlied@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.02.23 um 09:10 schrieb Dave Airlie:
> [SNIP]
>>> For drivers that don't intend to merge at all and (somehow) are
>>> capable of dealing with sparse regions without knowing the sparse
>>> region's boundaries, it'd be easy to make those gpuva_regions optional.
>> Yeah, but this then defeats the approach of having the same hw
>> independent interface/implementation for all drivers.
> I think you are running a few steps ahead here. The plan isn't to have
> an independent interface, it's to provide a set of routines and
> tracking that will be consistent across drivers, so that all drivers
> once using them will operate in mostly the same fashion with respect
> to GPU VA tracking and VA/BO lifetimes. Already in the tree we have
> amdgpu and freedreno which I think end up operating slightly different
> around lifetimes. I'd like to save future driver writers the effort of
> dealing with those decisions and this should drive their user api
> design so to enable vulkan sparse bindings.

Ok in this case I'm pretty sure this is *NOT* a good idea.

See this means that we define the UAPI implicitly by saying to drivers 
to use a common framework for their VM implementation which then results 
in behavior A,B,C,D....

If a driver strides away from this common framework because it has 
different requirements based on how his hw work you certainly get 
different behavior again (and you have tons of hw specific requirements 
in here).

What we should do instead if we want to have some common handling among 
drivers (which I totally agree on makes sense) then we should define the 
UAPI explicitly.

For example we could have a DRM_IOCTL_GPU_VM which takes both driver 
independent as well as driver dependent information and then has the 
documented behavior:
a) VAs do (or don't) vanish automatically when the GEM handle is closed.
b) GEM BOs do (or don't) get an additional reference for each VM they 
are used in.
c) Can handle some common use cases driver independent (BO mappings, 
readonly, writeonly, sparse etc...).
d) Has a well defined behavior when the operation is executed async. 
E.g. in/out fences.
e) Can still handle hw specific stuff like (for example) trap on access 
etc....
...

Especially d is what Bas and I have pretty much already created a 
prototype for the amdgpu specific IOCTL for, but essentially this is 
completely driver independent and actually the more complex stuff. 
Compared to that common lifetime of BOs is just nice to have.

I strongly think we should concentrate on getting this right as well.

> Now if merging is a feature that makes sense to one driver maybe it
> makes sense to all, however there may be reasons amdgpu gets away
> without merging that other drivers might not benefit from, there might
> also be a benefit to amdgpu from merging that you haven't looked at
> yet, so I think we could leave merging as an optional extra driver
> knob here. The userspace API should operate the same, it would just be
> the gpu pagetables that would end up different sizes.

Yeah, agree completely. The point is that we should not have complexity 
inside the kernel which is not necessarily needed in the kernel.

So merging or not is something we have gone back and forth for amdgpu, 
one the one hand it reduces the memory footprint of the housekeeping 
overhead on the other hand it makes the handling more complex, error 
prone and use a few more CPU cycles.

For amdgpu merging is mostly beneficial when you can get rid of a whole 
page tables layer in the hierarchy, but for this you need to merge at 
least 2MiB or 1GiB together. And since that case doesn't happen that 
often we stopped doing it.

But for my understanding why you need the ranges for the merging? Isn't 
it sufficient to check that the mappings have the same type, flags, BO, 
whatever backing them?

Regards,
Christian.


>
> Dave.

