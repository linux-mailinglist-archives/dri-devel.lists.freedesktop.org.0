Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD074BB910
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 13:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C223510E505;
	Fri, 18 Feb 2022 12:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD74110E505;
 Fri, 18 Feb 2022 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645186997; x=1676722997;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jI5W0RjQEhaebfVoUSnto00nywU6SZM2MwpKdPW0kfo=;
 b=k31xfngs6BMYF9K3Mfa3fyy/8BjXluuDojylqUihuAYUMioPLRi0S54t
 6JajqSYE5eYGjf9e4Sfce413YRCQRHygU8UrZcXtKWkJClCoJEA2TCg4x
 om4sC6O8GWZnpDsR5ufCCuP4lyA/Nx5LvxAqro+1vqg7qWSdROCj6mIxz
 6QgA1tAYcJ+IkBsG63/0doFV0uZRrmGY6iAuS7BN0XzAe0QwJLyscMeXo
 viOOUMs59Ob0qvIbOljdC7erhNenNC0u6TPx6K+05eDyeoFRY2rNsodiO
 IOGGv7MV/3O7E780Etj90Go2IRaomMOttsTdEDeEIcYRIIIaNktDknXkr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="248711861"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="248711861"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 04:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="626612172"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Feb 2022 04:23:14 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 04:23:14 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 04:23:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 04:23:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 04:23:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvCPiiP9JCAeivvHcSaQALvigYUdhA0LUNE9fkiUjOtjUB1EGUmSTFA5rfdzCVfDw2RGuUJfyGDNQGtXz6j/zoBT8CJNJPYbWzLEajU0OtaxMiBbf+dpmX9je9+36b6zauLpDnT82t2K6k+lhKtWZ2acfRdu9zMToqZrrhoRJUQLi0VBA6fJgUJkbFwBF6K8rJ2Y9dyLi58pYwnzTrv2YUKJPu8Fiq4fv2bHZtomB6/F54JwbZCWP4e1w/LNuB/ruVuICPkcEhoCjLLmBw2hbj2Xeh/y8v39orEld6lrLYBOPUkLA+ms3dVfSaNIFMJkRqOOoekk8/a+cBBtgNRFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MreyNozC1U4PumQ3s3EtZ4u0UEZFDLbPqeBPxsaCd0Q=;
 b=SaK//+8GrUqS2vpMvxJIg0X2wAyTtOL1+0t0Edf2AqV9e3liKXd93d0RdYp1xrtyfMefMXBIsQwanUMkzkEYsJU7xd3cBcUyEhLOnyqgpbzf2VVp6JPtnC5NkMNzwj3RuB2ZsNnTK80+J1vAgsJ580Iri4QVc5B4BNQB+c8Rjk5q6l89c9JzGIfNCfBOocVKD9AE/YFV+QPP58ub0TMat0SjpTHnAxrf8xQEE7a2xdK7uJB/aURicYkr80JZW4ruDpMSA9iq1etKRhgFuCVGrhv/JobSoinCU+HadLJuIkInURjzacqUlLjwEEWRMeYtY2PFThBqCZAW3OuE6005Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 MN2PR11MB3551.namprd11.prod.outlook.com (2603:10b6:208:ea::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Fri, 18 Feb 2022 12:23:12 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 12:23:12 +0000
Message-ID: <3607fa4c-04ce-9db6-a7ce-0841f82e4e06@intel.com>
Date: Fri, 18 Feb 2022 13:23:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 01/22] drm: Add drm_mode_init()
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-2-ville.syrjala@linux.intel.com>
 <0e2baaab-6a38-5f80-5552-57326d781c43@intel.com> <Yg+JivyhsNufopPc@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Yg+JivyhsNufopPc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a4bae52-c020-4ea3-b499-08d9f2d96e22
X-MS-TrafficTypeDiagnostic: MN2PR11MB3551:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB355127FE4B820E6BBB9AAC33EB379@MN2PR11MB3551.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0Cb0rvPoqdtWeyoxw6FR+AMgYdp6foBOWpdAmdfh/GawhVIbXZV26k6cmoYUflVcSZq+EcFCvH9szYjunXOkFUrP+9KmAqz1VemjXLUEFVwaXs1AKnWKaauMHETh1MR6HKJ6NJtYnUPAopQsCSeOrtyWhXBDn2scvphY2C6X+cMa92Zk6MXHqE1rsuuLyDYQUT/lKfoUUSdW/1v47FV56nMxP3d2SNpYz5+HMmr1sDnfNfyG4tgZDcP5W8SY/jMbdsUguVP/W3QOhjXp7P62ILv5Wkw2lHBV4WirmCUv14NzuGMWz1dh77U0zBhL8uC5A0HB1O3p+fgUndARBIYGkvzwC69yNwq+sVuxX0aGBIRnLNXFs1Ub4avDgIF8EyAKJDBVQ2VT9ocsu/JNlBP7rXkCo7GFOOuYNjOxlrVBUITLfhPmDz2hGEoIc4nKOaY8hGvCpw9R+7W5063c+/XceWGdEsPFe4OU1HF9cDrwY8HK8wsb7eJUqHWP9u42TLD1GKNDVD15pWMEAGP43ghgydzSxkurxZ7HVOfJrjdJWR5g8AW39a31MpgPVZ1JVXp0rJorwJY1XK/2UoaMDkc7MlOVmdbZTr9jA4drhE6Q7i/EAb7LUHQYk6agGPc96LajWHmd8V15yAbGFzM3MXuc9/CXJ5+WHqgy2HlMy8WAyJMA+f30VPl0Q+ToIjDG7UFG88Cq/zWrZwHbsEU00tZvGbuul3+/dKX5HolLnLHvnFDIL9Z1rlWRMyfF1IIp8Uo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(31686004)(31696002)(316002)(4326008)(6916009)(8676002)(66556008)(66946007)(66476007)(83380400001)(6486002)(2616005)(186003)(8936002)(38100700002)(5660300002)(36756003)(26005)(44832011)(53546011)(36916002)(2906002)(82960400001)(6666004)(508600001)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUNnRVZ2K2NaR0hXKy90QlhkUEVYK05sU21nREVwbWNMWjJHeXZzMEQveThz?=
 =?utf-8?B?V3d6a1B1UGJJMUdaSEtuZEs4Mk5DNHI3d0RuRENDclhiR3JRY0dWOWlaak9C?=
 =?utf-8?B?VkNOczk5S3Q4N0pZTFZ6YXo5VDUra21CZFFvUU5BbVRaR2psWXNsdFBqc2xx?=
 =?utf-8?B?TnRFdDArekR4YVNjalI1ZFEvNmdsamYzUkRVMGNTRHRFdDNKVFl1VnZSeXRr?=
 =?utf-8?B?U2dKZE9neFJyNmZPYzhIM1dkeWhDUmZhd1JzUlZnYnZTcHlaY1ZsUlR4NHow?=
 =?utf-8?B?YWdpNXZkWFFwODUzWXRiQ2daWDlzZFFEc2wyTXNaU21jN1Y0SVZYTlBHd05z?=
 =?utf-8?B?YVNOREYwNlV1b2tMaUtHU3k3NUZvckU5RzRGQlp4Yit5dDNRYkUycXdNc3N1?=
 =?utf-8?B?TnBhdmZNc3pYcG5wTGtUU1JwUDdaM0psVEppYTN2Wk40T0s2QVJ1ZWs5UGMy?=
 =?utf-8?B?RzJIekp2a3NUNUM5YlQxM0UxZ3BONmVOZXlSYmJuUzU5MittK3pPUmtwSFNJ?=
 =?utf-8?B?UmhTb0J6ZFBDNXJuSmJsS0ZMcEJJbkNBRFArczZ1RjN5S3pxczBYNE1NMTRK?=
 =?utf-8?B?djhKMlEwYThveXdjczlMYk9Ib21QcDZEUlkvRTY0cEQ5MlBKY2VnaGJ3dlRE?=
 =?utf-8?B?ZFVSeWhucjdITDZxcjFsTDUrNHI5aU9HYkd3Qll6OE03aFZmWlZacEJ5Sy9u?=
 =?utf-8?B?Y1BUeW8yR0JvRElCVHJPcHFZbTA5eFBQbVUvVDNHb2dYSnZWNmFSNFJ6YVNB?=
 =?utf-8?B?MkJ1ZEtKaUVHZWpaSzR1YU1WRGU4TS9oSnRveXV2a2pkY1ZyWjJzUnRPZmV6?=
 =?utf-8?B?eFpVTi9lVzZQYlJYRHU4aUJjK2g5NjVGK1dMaHBYL09YRzJobm5BQkVIZmN0?=
 =?utf-8?B?V3p5NlVvZFNwTW1NeXZTWUFmYW4zOTNrSm9ybDBleXV2TEdjaGZ6OEE2NzJ5?=
 =?utf-8?B?WWc4aTVwU21DWllsQ1N2c29wTlFJUSsrV3ZDS1Z1UFl5QkYrcmF1TmNQMWxi?=
 =?utf-8?B?SVpMWnRZYjVXdllQd2dhY2dHbXArQVpEZzBwZ1FMclgxNzRDd29Tcnl3dUZQ?=
 =?utf-8?B?TE0rN0JXaUlkRkNyeUJwUWRVcU1tUXJEMEdOYVJuejhxSDdHb1lZTWl4YSs2?=
 =?utf-8?B?SGJlZUwvai81WW4vNEkzRTVabldRSDFYSkYxNS9kWHl2VHlOSXFHZVdIdThP?=
 =?utf-8?B?a2xZQVBUaDBDWHNLaVp1YStmbENhcDBKT3VhangvSFNPbmNnaUp5MmVXSFNR?=
 =?utf-8?B?bFdVSHBDUlhrSWFtS2gzUENlQzRXMTdpRHI4VlhtUGhLZEFXeDd5ZWZoT0Jn?=
 =?utf-8?B?REhxRC9BQThtTUlML01FZ21Ya0F6SmkrVEJhQmZSOEpScmQ5SEFINWs3SVl0?=
 =?utf-8?B?RitnSndzVjlJVjJZVXlpaWlzRXdxYnJuQVQzZHc5NWtiWVJsSFYrdktNUk1J?=
 =?utf-8?B?SHAxUXZoQWovdmc1K20wc1VlQUlESk44MnVhR3hOYmJ4cEIyNnliSXhFRTl2?=
 =?utf-8?B?YmUwOUdIb3l4SlBwVzZLWWl0TC9RdmEvTFlSZzZKbkNRMjRReVRtVlRSdnFS?=
 =?utf-8?B?ZGUwZlJwcWVCaGpvZFJ5aW9YTE9rb3d6d01rSm9NZVE5UE1lbGFacjlsZ0Fn?=
 =?utf-8?B?QWxYR09uM2pYN1haaFIwQnptRDZsU3pWRTJOclVXaTFPZ1BlY1ExNUFFVjBp?=
 =?utf-8?B?K2h3MWtqa2d1cGMyYzdzbVJNeEJlMUZFRnQvelpVM2JoTU0rOHlxUnBoUjBG?=
 =?utf-8?B?LzdMSlJGMEUyUm9FSEF5V2pRY0xlTDBtSmpXdVo2cGJoYUlENFlEN3Qrd0o5?=
 =?utf-8?B?RlJFaExzTUY2TUJ1TEZ3WGFzb0Y2bGFiREt6UVZMZU9pdXQydGQyRjhsbitS?=
 =?utf-8?B?ZEdmT0tGaWY1MmFxUWxqQWNmY1JqSFdhS1kxNEdlRmx6bmdVaUsxTHRBZElR?=
 =?utf-8?B?YmhwT1JDeTc1bmY5Y2t2OU1CaUU4UTgzNXgzN2pxd3hncUpPWjNBa0hUNW5u?=
 =?utf-8?B?Zk1pWnNaaE5HM3Z3ZDI0VUpSRWtubmMzUzNrNEwrY0VYVGNNS205WE5sTi9h?=
 =?utf-8?B?U3U3OUtsRERRaFh0ZVduRW82WHlkTEwxTDhKcWhFbDhkWnFFUE1uOTBzdlBy?=
 =?utf-8?B?UDl0cDlzbS9WelJoL1BlWk55NytDVVZBQUhieVpKbFVWRUlTSVM2US9WV0h1?=
 =?utf-8?Q?vUaA7QGezvm3FOeDbK3y8YY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4bae52-c020-4ea3-b499-08d9f2d96e22
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 12:23:12.1572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZEVOgFWyEuPsXzBDb+g3bVDuAG24HIFxqYR3ssx36o2gXPc3KiW/B3pKh8qyWFHwP2TPHZ+Hp3+ffy6OdVqnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3551
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.02.2022 12:56, Ville Syrjälä wrote:
> On Fri, Feb 18, 2022 at 12:22:44PM +0100, Andrzej Hajda wrote:
>>
>> On 18.02.2022 11:03, Ville Syrjala wrote:
>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>
>>> Add a variant of drm_mode_copy() that explicitly clears out
>>> the list head of the destination mode. Helpful to guarantee
>>> we don't have stack garbage left in there for on-stack modes.
>>>
>>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_modes.c | 17 +++++++++++++++++
>>>    include/drm/drm_modes.h     |  2 ++
>>>    2 files changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>>> index 96b13e36293c..40d4ce4a1da4 100644
>>> --- a/drivers/gpu/drm/drm_modes.c
>>> +++ b/drivers/gpu/drm/drm_modes.c
>>> @@ -892,6 +892,23 @@ void drm_mode_copy(struct drm_display_mode *dst, const struct drm_display_mode *
>>>    }
>>>    EXPORT_SYMBOL(drm_mode_copy);
>>>    
>>> +/**
>>> + * drm_mode_init - initialize the mode from another mode
>>> + * @dst: mode to overwrite
>>> + * @src: mode to copy
>>> + *
>>> + * Copy an existing mode into another mode, zeroing the
>>> + * list head of the destination mode. Typically used
>>> + * to guarantee the list head is not left with stack
>>> + * garbage in on-stack modes.
>>> + */
>>> +void drm_mode_init(struct drm_display_mode *dst, const struct drm_display_mode *src)
>>> +{
>>> +	memset(dst, 0, sizeof(*dst));
>> Why not just clear the list head? Or maybe poison it? It would be more
>> cleaner.
> Then we have two places that need to be updated if some other field
> gets introduced that needs preserving. With a full memset() we only
> have to care about drm_mode_copy(). Don't see much point in
> micro-optimizing this thing.
>
In such case DOC should be modified to avoid updating it "if some other 
field..." :)

Anyway:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

