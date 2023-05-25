Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EED710A39
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 12:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA5D10E15F;
	Thu, 25 May 2023 10:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DECC10E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685011129; x=1716547129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HHBfbPq3lvdwHCPok3UTmHrpmpFGd7LsCVxcdlUNQYo=;
 b=VIxbutgojMrAgQb1Y4wb2mjgyyPbsX1Y5xmkTu5/YvbA2iYU/y4C9F+i
 K9QDqGxfvC9LPq+dGMR2JH5qG4B9qVMLQ78/Eew2TP/kB91WRbcALUqBB
 o0QRnqILQ9xlo5/H21lVmaA+IA+RRtFn1FGI4lC4i6NJAcFeT4oRfoe5o
 b6OsAWFEWaL37h4uOj+GzeCn/Wza4kAmucLg26XhGrN5m1wfAVoy19Rdp
 lpK07ObmY+T99Waoij87Uw+HjdlzpQMKp9hhGgHivDwe/bFfhRktf409K
 KuEW891GmomtXdhNVfD7FvYzOAhCV1s/hwF+iba6P0p+J4V6T6fsAMCBv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343324363"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="343324363"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 03:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="794605631"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="794605631"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2023 03:38:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 03:38:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 03:38:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 03:38:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 03:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUXh7tCxhGMWoGgl4/ID8aMOwMZyaUH9f/BAs5fwu2BF8ZeEiodq75YqQf1WYN5heOzee0iAtBEL30VgDU83tB//SO9lw3Rtk0AK55eCdDnDdtQ5Ufw29MQcXpeOx0l4EYvsu0N9xvJhhvbXht+b9FO3aWXSOxOwNuYm9dfZ9IqCrhfmH0cSWfDP6QtXAVCY6kcbk/0Hk7Aqi7WTpVCIVnQUUo2dsH+hY0pA1fYDsS/f3KDan/kml79tUx85Hz0e9H8Z2Rd3QwwwPQeLuEDotzWdZWnE6P2bvr4Ys8NShdN3uMZPubdxKQwU5H/4yemOBEFV3s1YetFmvCshLqoPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5eI6AA5EAwPBm0GIrSfD/zf+hheECig6mCsyxf64is=;
 b=NqNB0NgbBUH9CZIslmdPHVdhcxtvLs2uMtz8w2EpkTwHlfNCi0ImEuJXyXoO9vO/IzpBZ3aMjYTY9EaiGgMfLFTOmXaAzS6gU1DRzQV14D38R3HsI6nYADtXwSTa3IXSQ7cjWQrPA9Qna7A5iwaJBjxSFczmLW/1XtYn7ow7AjHrb36d0quo2VCF+eQcZtDO5LKILGufsHVPFNwF6+ha1j89AUki+C2nMSeR8Z9fxTQ1y/JT2kiiufCF42eUlS5T5tGN/aWpUOJZLPfQiLsIc7jOAuuxEaofSiU1IC3Zoj2rVPymEH8lK4sfx5hA2nI1xuzKXaWRT/BQ9XFMC5qKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 10:38:45 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::fc54:d7e4:5469:da46]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::fc54:d7e4:5469:da46%5]) with mapi id 15.20.6411.029; Thu, 25 May 2023
 10:38:45 +0000
Message-ID: <f3238bbb-1b18-2ca1-1c46-4e654be2a378@intel.com>
Date: Thu, 25 May 2023 12:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: KUnit tests for TTM subsystem
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cc04343a-de20-4e60-aca0-695ba69253df@intel.com>
 <7b324b38-833a-070e-7f95-e1bd2c48782f@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7b324b38-833a-070e-7f95-e1bd2c48782f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f1bdfc-6455-49ce-d8f4-08db5d0c3745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l0OV69oIwLcaS8DU/IeXH5uXdQYz4UtP0wDPp9NUPi8oqdMsYW+GFlOZA6LdpcZ5fY07DGKyzJPO1HhN631HQr7pr5V48hIOP+uclor3MhgeNLPBrJ/2vmlV5ysf1Hz0qSx9a1gDyXLazn6gcFCQrWSuXOaSelijDM10z3OTOHsjUN1tbiHDZ/3CoMl2mYr5a3R5MbJmhxt7Fk9thdpNAfZydp90sib1jceH4Z2NCQ5u0Sek+LkshRZx3sGym2IPWi0NUTjNOr6eihmeA+TVpFP0K3lXaYj4VjqccfISVVkgaWqLh8PJNPKUEavuzeBhT3TYCiSrCOjDn8I0y951xRFD2uWNQHFl9hqikoIBvxULA588/aLL8C9R9ulVECOCAYNrUKHY5or0Rtsbi95nGzJdwM5ucD6PHwaTrGZXySkJohYGw1LQGhD+m5m4W8hsXRXYLZwJtndlfJXDVlYFfPiJ0j7m1WoxmksvsZzc1DPeLFnPltMiGkG5KMjyjB5UyC9yJBkSgftppo6I+7n3WL0Z3u/xF8MYKoXKsF/UD61YnEx67OW0akieumW/Y3naCfliz6UN4t7d8UeWjFxn5dnEuhZdEUHtQ+qNfpA5BytgfREFDvDLKDpC3nNCylsjd5VpkINLtqWl0HiJoK/QgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(31686004)(66899021)(6512007)(6506007)(186003)(41300700001)(8676002)(8936002)(2616005)(44832011)(26005)(53546011)(86362001)(4326008)(36756003)(2906002)(66574015)(478600001)(66476007)(36916002)(66556008)(66946007)(5660300002)(316002)(54906003)(83380400001)(31696002)(38100700002)(6486002)(6666004)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU1wU0FXS0pndjFOOGhQMjBkWSsyUWRMaDNNN1ZaWmlMVURNMGxWWXUwNG1L?=
 =?utf-8?B?Rjk5RTJPZWlXM0hnWVArRUhWemEraTEyUFoycDhZZmxWa1Bwd0tpbnRnby9U?=
 =?utf-8?B?TkpQMTVhZEQrUm1GTVdhTU1hd2wzL2FkZTQ1SHEwUlVGNXVWYWdRcVJ5QmJV?=
 =?utf-8?B?L2JKMEFhR0l6czNNVUVUK284b1lxb1dhMVdBb1ZnSmRsUXZQSHl0c2lxeFZu?=
 =?utf-8?B?enZKakYxTngwcGMySjZPeGcxakx5eWtQYUJ4eERwZHNSWngydURXbVB4Q0JC?=
 =?utf-8?B?WVhIOEwvSW42VW9UdFU3WS9BUDVva2lzalJmTWhNaUZBL0hidVduQTdQRmZ1?=
 =?utf-8?B?bitxYS9MUDFBNldRcUxZb3k4VFVnSGduYklnQlBzOVJGQ1FvWmFJaWZBa05a?=
 =?utf-8?B?dCttZ015T3ZLUTJqdEtVMjJFT29rZGlma0tCMVp5Rm1WMFFOd0VQdHRzdTlC?=
 =?utf-8?B?cFlYNkh6UDBXYnFYS1IrdHhQTGUyc0lwbzBQMjVVQnJ4VDFseWt0UlRSSGZT?=
 =?utf-8?B?VE9BZS9uajNnQzZHZWp3SkZUbUZIREpERTV3amx2SEpOTWZWd244Qk1IeTEz?=
 =?utf-8?B?d0NjQml6ZURqOHhDZElhQ1g2dGFFaDJoUUNJbDlaK3YzSHREaGpKalRTUE9s?=
 =?utf-8?B?Vk9EQ3pYemhqeXRyYUtoY1VYWE5UcG4yNGNWRG1tSjhRMW1PZllaSUtMM0NM?=
 =?utf-8?B?NUt2Sm1DK0QxY09Ib2lZcXlHN3VjajN3TE1jZVF3b2NoL09sTU5iNmNaZFRh?=
 =?utf-8?B?bkJUbDM5eVQ2NlZqcnZHaVlaVVRiY2N1cU02cWhvTkI2WVJwV3pibVVDYlZx?=
 =?utf-8?B?VEJzR3lGRmJ5eUNyMmo3Mmg1TkhrR2thOEFjRzJCVExzRmlobzlzTUJFWWMz?=
 =?utf-8?B?ZnBabGV4V1hpc2E4SDhnTUdzUlkybGduMFJrU0xVYnZQV1I0OXJ0UkVsVlYw?=
 =?utf-8?B?bXp6RHlISnFzMXQvRUx2RzhCa1Jiam4wbHlSaVpkckdlRU9MaWxtZTN2ZG1t?=
 =?utf-8?B?ajlZM3hLV0JMc3U2bnBMazg1bXh3OTdTcVZ4RnVTZWx4bXMway9vSHF6SUQx?=
 =?utf-8?B?VWZLM2psd1ZPMyttTUphNzI4L2ZCeXBEWHdZY1lzbHJ0MExxTnhuaVhMUXJs?=
 =?utf-8?B?YURCc053c014RExjTzN4K1lKcVR6elFIekpGWVJnS0tWQXZWSTVRNk15MWkz?=
 =?utf-8?B?L1l3aGdvM00vVmJGRC96MU5YUE8zcHAySUFUemROSVMzc3ZtcWFTSDRlZHRJ?=
 =?utf-8?B?azg5VzlVbkpuc0dCMFA3Q0JYa3dqWDVFU21ocVFhekJmN2R6MFJwSFlhN2ht?=
 =?utf-8?B?N2J6c21ScTFCRzRXZVdxZ0JkMDZMVXJJck0ySjhzdmZpMWRETmROWmFCNisy?=
 =?utf-8?B?eVYva1VBdHkrNEw3Q0RnbEVZRmJQVjc1SFd3WGhoVTF2THNPYURBSEZrWmd6?=
 =?utf-8?B?aXlqOFl5N1RtV0Z2cU1KV2ZwYkwzQnpqWGJWaWlzQ1RKOWQ3T3d0L0VvZ1k2?=
 =?utf-8?B?T1JvcldtalZzMHVvTmZhdjl4Q3E3WUxkbTJqbnZwYzVYVGlZdkMrcUZnQzBB?=
 =?utf-8?B?bEhWazRLdC9uTUEzYVNrWlBML0RkOHd6QjdncStDVGl1citUU0gzMEFKV25p?=
 =?utf-8?B?azdjWXVsMThmd0Vka0tjdklFaU9Zc1hXWCtSekVKRmVjdG43Rm93NmV6K3Yz?=
 =?utf-8?B?NW5ET2lLZ1FUaGlQQTFJVFZWS3RydGhKTTFsamQvc2xsdU9iK0lJRFV0d3Fv?=
 =?utf-8?B?Ty9ub3JBa2Nha2lsa0h3b1NNWlJSdTFKRUl6WDRHVmdSaFZjNlpPOXl5ZE9M?=
 =?utf-8?B?N2l0cktKd0hOUExPVzlERmlsUW1sNS9nUmphRmh6WVd5VUJSSWxhTnBQaE5q?=
 =?utf-8?B?NWJpSnZSVDJzaXBzdW85YS93Z21sNHFGMVB1dDh2NjVCZXh2NFFWM0RiS3VS?=
 =?utf-8?B?L0tuZVh6QzFPUlhaVFdseVJDK1g1NUJPaHZjTDBESTg2dy9oV1RnYVVEU25q?=
 =?utf-8?B?SWI4UjF1eGJMTmVEQjJVZTVlWG1Qc2FZdGxSWDJ5SGZ2U1V1bFE2a0xzTVBt?=
 =?utf-8?B?TVVSQXZpQlExMVR4VkFKUDM3ZTVRaFdmUXRya2d0Z2FNS0RyNi84dzlWZVhu?=
 =?utf-8?B?V1UrOGREZytjOW82VTBmL1dNeFVWcURRcFFZaTdlMUNTT0t3QVlyWCtrQXBU?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f1bdfc-6455-49ce-d8f4-08db5d0c3745
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 10:38:45.3713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2dMNdKG2qIoCe8vph48v2Ux3BzcCDVEM/aB2UX+pphhj31ODsJKmW1+tab2+AYryoFRA4tpBOqAKMR4aEebZtEzjaQ5i1gnxMOTvAHGkGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 25.05.2023 10:30, Christian König wrote:
> Hi Karolina,
> 
> Am 16.05.23 um 16:02 schrieb Karolina Stolarek:
>>
>> Hi all,
>>
>> I'm working on KUnit tests for TTM subsystem (nothing RFC-worthy yet), 
>> with an aim to provide better test coverage for the code used by i915 
>> and Xe. Before digging deeper, I wanted to check if the priorities 
>> outlined here make sense and clarify a couple of things.
> 
> oh, yes please finally somebody taking care of this :)

:)

> 
>>
>> My plan is to focus on testing the higher layer structs to cover 
>> what's below, e.g. test ttm_pool functions by testing 
>> ttm_device_init() and ttm_tt_populate(). I want to split the work into 
>> a couple of batches:
>>
>> 1. Basic testing of structs (init/fini and reserve/unreserve), with an 
>> introduction of fake VRAM resource manager to test 
>> ttm_resource_manager init. Add some ttm_bo_validate() test stubs.
>>
>> 2. Eviction-specific testing with ttm_bo_validate() to trigger 
>> ttm_mem_evict_first(), possibly with a separate testing of 
>> ttm_resource_*_bulk_move() and ttm_bo(un)pin(). Add tests for 
>> ttm_resource_manager struct, including ttm_sys_man.
>>
>> 3. ttm_tt_(un)populate() testing, adding more coverage to what was 
>> implemented in (1) and (2).
>>
>> 4. Testing of ttm_bo_vm_ops and mmap/kmap/other features offered by 
>> ttm_bo_util (not quite clear on how to approach it; suggestions are 
>> welcome).
>>
>> Is there something else I should pay attention to here? I can share 
>> more detailed plan listing specific functions and what tests could 
>> cover what, if needed.
> 
> Sounds like a plan to me. But I suggest to start with the ttm_pool since 
> that one is easy to test and initialize without the 
> drm_device/drm_gem_object stuff etc... Write a patch for that, get it 
> reviewed and upstream and then extend from there.

Hmm, I can do it, ttm_pool has little dependency on other modules. IIRC, 
Thomas suggested that I should try to cover ttm_pool functions with 
tests from the higher level, but I don't mind writing independent tests.

As for drm_device init, I'm using functions from drm_kunit_helper.c and 
they work fine. I was able to write simple tests for ttm_device_init() 
with a dummy device.

If you don't mind, I can write some tests for ttm_pool, add some for 
ttm_device, and send an RFC. It's going to be quite a small patch 
series, but that fine, it'll make the review less painful :)

> 
>>
>> Also, I have a question on how should I treat drm_gem_object when 
>> testing ttm_buffer_object. From what I understand, the majority of 
>> drivers initialize and use the object, but the TTM BO can work without 
>> it. Should I write the tests against TTM-backed gem objects or use TTM 
>> BOs with a dummy gem object embedded?
> 
> IIRC VMWGFX was the last one to not use the GEM object, but Zack 
> implemented that a whole ago. So the GEM object is now mandatory.

OK, that makes sense, thanks. I'll go with GEM objects then.

> It should be trivial to initialize. Just see the GEM unit tests how to 
> come up with a dummy GEM driver and GEM objects. IIRC it was something 
> like 10 lines of code for the EXEC unit test I've wrote.

Right, thanks for the pointers, I'll check this out.

All the best,
Karolina

> 
> Thanks,
> Christian.
> 
>>
>> Many thanks,
>> Karolina
> 
