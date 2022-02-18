Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E964BB6E4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1489610F2AC;
	Fri, 18 Feb 2022 10:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B38310F2AD;
 Fri, 18 Feb 2022 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645180127; x=1676716127;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6J9SnhVh0d6dHb5vZ/jAgEoLQELQ6sMOECI73nDYiFk=;
 b=F2YPlB/9eZ9/iXHwzdOjACBpH/sPoPDN6ii6RDwlmb+ZeAEs0fMIuvBa
 7kyDGvY/jwEgg3g5c3azms8Vk42PDPGQaR+5wFPExq9XizwrtJ6z8bY2d
 4DQ9reAtvxYKea0mbrAN2BEFE+uhRAurpFP1TTBbzpVRy18QqtDkAELEB
 dYfu/RDPmew3tJk3ZJGBqokiBsHJvsLIbbiVb8a8EwRwUKAexMpbFkGZd
 sDkYXhQRnQfZbZcrLhmbEBWMyxHaLy1k73Sm9eElh0GerK1BFyp+ZQHUn
 IwZGws3iZiY+xz+R43ALLbHOcR95EA2Rc62sp51LwM9FPMaJ1+87Ir50J g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311843826"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="311843826"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:28:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="489348266"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2022 02:28:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 02:28:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 02:28:45 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 02:28:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKq9ehbeLpmlTPnbbnQVFkk4By0WRFiD7LILLeuh7zSrx1fi7gvRHfYPz2HEn0QhULm19ufqibxWG2Z2pb1tntYShJ9VBydAp2FZze/lMHeKatjSzXATSK6lmSF2HpVFzq6ZV8rMMtPc5wu/IT79libCpvPIdCOo4X+oLB8blmY3zL2dFAtMXObUJB8ySxbmWbnhyEQM79QjCodmpWNRE5JpS4GVxFCKE/tA1ODd8LTg+N1lgCLFKit4XJ3pmUGKYQPXVHmRrskr7VBUqpLAQ+4yCft/QKm1PqlxaEMF5AJ7HmIblBooBBUNnuvAmAeZcf4XmsKw4sVacLjHNfjmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgZ2onuJPS5mvspKbKHvhKlNA3zByI5R8dH8gYEiMCA=;
 b=PZTDSu4zKjD1x75LyrqasJzyfW0gdTHn4LfVyCf8DbMatp9QO3natO9K49oHq4qoU0KMNeLmLdD2xBxQ0/85G5mtTp1bbjkakTgphG4V6dUmz/Rjsg0Vdn74neIZPXLanHX8kJVrBWHZJHPXTOPXaX/RiH9ESQqlYgFwHsRWjLUbgkvSuHd2IpJ/T15BMKuUWj2vvYVQHSfu7Mm3o394g//UvSc5+DOUMG9PI8mQvU0fxgxZX5OXeOLk0Yyc2e/x9rOaCfsI0p15vasRVhsrhyVeqaj1Jsx4YEcp3OFwITME9u0Z4JA9WEaF9s5wmnW6yaRHS1/7F8+gNL+0iKalhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BL1PR11MB5509.namprd11.prod.outlook.com (2603:10b6:208:31f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Fri, 18 Feb
 2022 10:28:42 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 10:28:42 +0000
Message-ID: <8f6fb098-d0d9-910e-7d42-9fbc541f9891@intel.com>
Date: Fri, 18 Feb 2022 11:28:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 5/9] lib/ref_tracker: improve allocation flags
Content-Language: en-US
To: Eric Dumazet <edumazet@google.com>
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
 <20220217140441.1218045-6-andrzej.hajda@intel.com>
 <CANn89i+nCZ6LV_1E2OnJ4qWE0XkO2FGW+A6_tkmQpdxiiEh=LQ@mail.gmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CANn89i+nCZ6LV_1E2OnJ4qWE0XkO2FGW+A6_tkmQpdxiiEh=LQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0406.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::34) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c966715c-e43a-4a22-64ad-08d9f2c96f82
X-MS-TrafficTypeDiagnostic: BL1PR11MB5509:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BL1PR11MB55097B561E7A8584D428D7A4EB379@BL1PR11MB5509.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rt6GTge+DQskhEwzdw+hS04GcrvNbEmuCxWvrVH7R776Kujohza7d4EMBxcDpYVexN3koJhRzu5O4JrDZeyqUVtgZumO+1EdXd+w13Vb221etGIOiNfJwI7UeXXtWvo6NXg2hrmwuLBhUomQ2aViQIC3MOSXODSNxFUjPrv3paU6r1fyV5Hv+djtFKs5vbXNoiopiIiUUwFHcnDUvDD6nUB6SPyESSwZK2BNafeqMchHw9qxGmwD9+mR++gwKAEvZhe68mLfhIPDIHzdGp3hqZmix+JKoAHoLGZWK9CidEIDCgzpdeIQw1AkqNaiKus+ESW3h/MjS80LP7eLcRNP/DgVpnBETMF1vADokZTVvnB/+FW499on+AY1gQAckrSPWg/gng85refFkOJTLZ3uIeVcGb4lNhHWT0GjMRNiN1Y2OBe9BGmN5z40aR8u1hBY4p7DpIvfmTIPRmcJuml3hQZPcq27SOhBNbxGQR3WiqldrrzA9lNXhVGL2z6E+CJ+srxaRnKvbpIJxIAugDZqWgLN7xQC9y/YhI8DHFr1ktVSsp7WHujzAG2M5k2CmVIpaN9oYge3kk74qs7gGPmDVkQearMGQTFsOvv0PTRwCuTUtOJRU91h7bVy3XxQ4CPG4jq+umOGU8l3XzLcPUv8dOv65U30zsyn6Sb7zkGdnvo8SwjLIJzOS/6ZmCkGRNAt7lnzjVJ9vYarSnFjZakOm8tuAUL9b5NK5CnAbsNRY58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(31696002)(8936002)(44832011)(83380400001)(36756003)(82960400001)(66476007)(8676002)(4326008)(2906002)(86362001)(66556008)(316002)(508600001)(66946007)(26005)(6666004)(6512007)(6506007)(2616005)(186003)(31686004)(6916009)(36916002)(38100700002)(6486002)(5660300002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjlnWnJ5Y0dJaU83dWE2Z0dsSXBqcDZiNTZlblhHRzBiVFhmYi9NQmt1NHZi?=
 =?utf-8?B?TFVzUFJ5VkxHSVlaSmptWHBRRCsvWnY3U05zRnYyMmZnVHpzTnBGT3N4YzZG?=
 =?utf-8?B?SXc1bXJDcjU3d0dyMTh4dkN0REU5a0NpUXQ3UGR0K1YwMExMNjFTWHVqNWpC?=
 =?utf-8?B?ZEJORkJzUnJINGFPVXlHNmpJL2Rtc1VQVythZGkxZDFrenp1RWVQeVVSQU5O?=
 =?utf-8?B?RjV2M28xeEZkYmZwSUMxSmdJMFRoV1FENmYxNmxqa214cGhFamhhdjV5anNs?=
 =?utf-8?B?TE5Vc2R0OVdYTTgyTkNKM04xbmViWlc2NmI2MHgyd21lSUJpU0ticGpoV2NZ?=
 =?utf-8?B?aUFVYjR3Wlh6M1NKUzFKYitqV0N6dWZWSmZuVkN2dFlFK1JEb21VR21VSm42?=
 =?utf-8?B?VVQzR09DYlJHNGEyYWRqYmt6d0Y2Yk5HRW1PWkxoYmxSQTJ5ZHpyY2lYeVFP?=
 =?utf-8?B?NCtCcE1UUFRUcjV1S1pXQnhGaGhQNUk1TlJTV29MaHFyM3ZCMkhsRXRGVE1K?=
 =?utf-8?B?YmtxcmIvRlZUeVJJVEVTdXFXOUk4di9JUVQ0K0pCeGQ0d01SWnhUU21kOUgy?=
 =?utf-8?B?dXVQNUl0cmxaNXBnQ29WSkpTakpPYTdmNUtsSGkwdzM4aFVtMnRUSHVNc210?=
 =?utf-8?B?bE90TWppRVludTNqUC9HOEFMNkoyOGVkRVZMZmNtNmFwdGJ1NTlNdTRERDZI?=
 =?utf-8?B?N1RKcTRPSVZZbWZyckxBT0VnSEdIT3VJUTRqSEpDakxhc1NIc2hIY2I2Q05n?=
 =?utf-8?B?ZFYrRTR0RTZsWk84d2RqaGN1U1ZsQmtNQTdMNGR0N25BcWw2cFVMcHZDL0Rn?=
 =?utf-8?B?ZWpxVzE0MlczeVJVOFhIRTBNUnhlZzFsUURkSkpldlRkSGdib0I5TktqSnJD?=
 =?utf-8?B?MmtsazdZQ3pLTGZNOWMwRkQ4YXB0TjRETk1reGRTTGM5cHFvVmNCL0owbnpO?=
 =?utf-8?B?c0REalU5TzJSOWdxSkViZitSWC90NU5SVmlqM1NOWFZYeDZqUStocndlcEZv?=
 =?utf-8?B?OXFsVDV5blpDNGhVNG9xSE5OVVg0dmRQbVo2UG5mSk5pQkl6OEtqWFFlUldZ?=
 =?utf-8?B?WHBsdjMzbno2MkpRcW0xdEhUWlFYcWZ2VTg5SkxKMjJ0Tk5KeE9EWTVJMHY1?=
 =?utf-8?B?U2dJMmF0Ym5IS2dqSTY5S2E4eDE1L0FRN0VpQ25XbzZIdkJWVHl5R0s0MnZ1?=
 =?utf-8?B?UU1rYlBtVHJtRG0zaEh0R3E1NmQvL2VkSVV1azBlVE42VXJkUU1CaFBKY2NH?=
 =?utf-8?B?UWVLVmZBYlhQZmVaRmx3ZVByZFNSSi96UCtHSDY2SElVKzVaMWw1RlN1K2Yy?=
 =?utf-8?B?K3IxYzVxRWh4OFpuVW9kSTNhUkRISnp2ZlBLOFBFenYxaVRueWpLWVhicGtW?=
 =?utf-8?B?cElOR1VJTjlyR1FsekZyR3NxTUpjZ2hUcndaR1pIUG5sZmE2ZkZrcUVvZlg4?=
 =?utf-8?B?VEVEZXZPWnlGcFczSDQ1eW9oSjdsbTE1LysrL3c3SW0zdC9MZXB1OEhBS1BZ?=
 =?utf-8?B?bVhiTVBLQkcrK3pqOE5MNGh2SHZ2b2NOYWU0MFhMSTBaREJ4QUVjQVBaSXBR?=
 =?utf-8?B?WUtJZHFhcjdhVHFmMTBkRHhlU21kNmIxZWl6Sm9JOVMwS1ZsQ0d3RFFlbzRi?=
 =?utf-8?B?ME14czRJcm5DMkdwVHVxWnd3Wm9DTXpNajlaT2Yrd1NZYlhWY2EwNEM5UjRV?=
 =?utf-8?B?bUtJMWdCSTdHcUFWZCtnU1E1Qk56Zlo3TWxiUHBLbGQ3a0tGa3VrMy9Eelgw?=
 =?utf-8?B?dmtlQkFrd0xLU2NwaGQ4VE9HYU5XdVowOW95WElpMkFnOEhBQjJRSDJPaEVM?=
 =?utf-8?B?MndtelRtbVJjMHZZVmZkZjJhOXB5MEhFaWFFYmFBNFN1SGxQOExFVUlydTBV?=
 =?utf-8?B?RERGRzQ1QnB2L2NLRGZoK1M3cmdZQUJ3Z0lPM1hvMlpPS3ExYzNyWDRmcU5v?=
 =?utf-8?B?WlFoS0RGQ0M2d01OTlNiOERnZWpHL2ZyNy9EcGw3WVpKakwyUFN5SEJrc1dV?=
 =?utf-8?B?bVcrSDRWS3lTNytxejJCTHNrd3YrTTk0Ykl1VHphclh1dmN0dkFNVE4vbU13?=
 =?utf-8?B?MUdrSHM1ZjR3Vkl2SzFxRXUzTkZZR0tENlZwcHZlTUs0ZGVJTGtPdnJHNWRK?=
 =?utf-8?B?Z01qQ2I3ZDJrbzVIQUNCa3h4SDhCdEYycmdxNkQvbDVtczlXOCtpZnJBbC81?=
 =?utf-8?Q?XaMTzkjiDtYXkWrCWgpdGbM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c966715c-e43a-4a22-64ad-08d9f2c96f82
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 10:28:42.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tkVd5mUuUayHdVzPEIrfci8iTV1zjGp5tFZLGbeqTE+zD/iELgrY8jQpCCdMAw8DB8MbOxoQpfp+RvzUDyAyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5509
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, netdev <netdev@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Jakub
 Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2022 16:13, Eric Dumazet wrote:
> On Thu, Feb 17, 2022 at 6:05 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>> Library can be called in non-sleeping context, so it should not use
>> __GFP_NOFAIL. Instead it should calmly handle allocation fails, for
>> this __GFP_NOWARN has been added as well.
> Your commit changelog is misleading .
>
> The GFP_NOFAIL issue has been fixed already in
> commit c12837d1bb31032bead9060dec99ef310d5b9fb7 ("ref_tracker: use
> __GFP_NOFAIL more carefully")

I based the patchset on drm-tip, which do not have this commit, I will 
take a look how to keep drm-tip base (to allow intel CI tests) and take 
patch above into account - maybe simple cherry-picking?

>
>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/ref_tracker.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
>> index 7b00bca300043..c8441ffbb058a 100644
>> --- a/lib/ref_tracker.c
>> +++ b/lib/ref_tracker.c
>> @@ -59,7 +59,7 @@ __ref_tracker_dir_pr_ostream(struct ref_tracker_dir *dir,
>>          if (list_empty(&dir->list))
>>                  return;
>>
>> -       sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT);
>> +       sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT | __GFP_NOWARN);
> This belongs to patch 3 in your series.

OK, again historical reason.

>
>>          list_for_each_entry(tracker, &dir->list, head)
>>                  ++total;
>> @@ -154,11 +154,11 @@ int ref_tracker_alloc(struct ref_tracker_dir *dir,
>>          unsigned long entries[REF_TRACKER_STACK_ENTRIES];
>>          struct ref_tracker *tracker;
>>          unsigned int nr_entries;
>> -       gfp_t gfp_mask = gfp;
> Simply change this line to : gfp_t gfp_mask = gfp | __GFP_NOFAIL;

and "| __GFP_NOWARN".

>
>> +       gfp_t gfp_mask;
>>          unsigned long flags;
>>
> Then leave all this code as is ? I find current code more readable.

Yep you are right.

>
>> -       if (gfp & __GFP_DIRECT_RECLAIM)
>> -               gfp_mask |= __GFP_NOFAIL;
>> +       gfp |= __GFP_NOWARN;
>> +       gfp_mask = (gfp & __GFP_DIRECT_RECLAIM) ? (gfp | __GFP_NOFAIL) : gfp;
>>          *trackerp = tracker = kzalloc(sizeof(*tracker), gfp_mask);
>>          if (unlikely(!tracker)) {
>>                  pr_err_once("memory allocation failure, unreliable refcount tracker.\n");
>> @@ -191,7 +191,8 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
>>          }
>>          nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
>>          nr_entries = filter_irq_stacks(entries, nr_entries);
> lib/ref_tracker.c got patches in net-next, your patch series is going
> to add conflicts.
>
> git log --oneline 5740d0689096..4d449bdc5b26 --no-merges -- lib/ref_tracker.c
> c2d1e3df4af59261777b39c2e47476acd4d1cbeb ref_tracker: remove
> filter_irq_stacks() call
> 8fd5522f44dcd7f05454ddc4f16d0f821b676cd9 ref_tracker: add a count of
> untracked references
> e3ececfe668facd87d920b608349a32607060e66 ref_tracker: implement
> use-after-free detection


So I will cherry-pick these patches into next version of patchset, with 
"NO MERGE" annotation (to allow testing), and if my ref_track patches 
will be accepted then they can go via net-dev tree and intel patches 
will wait till update of drm-tip.
Is this scenario OK?


Regards
Andrzej

>
>
>> -       stack_handle = stack_depot_save(entries, nr_entries, GFP_ATOMIC);
>> +       stack_handle = stack_depot_save(entries, nr_entries,
>> +                                       GFP_NOWAIT | __GFP_NOWARN);
> This is fine.
>
>>          spin_lock_irqsave(&dir->lock, flags);
>>          if (tracker->dead) {
>> --
>> 2.25.1
>>

