Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC87774EF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 11:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40FB88130;
	Thu, 10 Aug 2023 09:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434DF88130
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691661177; x=1723197177;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NiJFesQ1nfOmsHBXazCeV9dUyx1lud6Llh0XT/WljK4=;
 b=j6/OkvoAeHxx7LNHefADqfjH9NR5NkLvgaxd5Zu+UnHo069qr61TJezO
 J2Njxm9borQwMbAfPrnlgjx2yhm1gq4ItAi5UGOTvlgwhYwlHk/neVhsn
 4m1oQVfMqChsqN0hLhGyPbg25FpkjrYY3XJ6d1PwfOIW22t8fnd3kT40X
 Vfz5E7itzIcWiqgeiiuviIVs4d5YF4YPkngDEZTLBEAz0m8uvy93obysl
 P0MH6tSumWFuK4LVpZ8YJmud8UGxFcIdcGWBaKENAa/MlrpIdUMTkgq/D
 t+VdZdaAcd3ciMktipYugw6ElaiIVc6MPEoNb/GeHSfvdjGZUEIkDMFlY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="435250634"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="435250634"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 02:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="875638652"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 10 Aug 2023 02:52:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 02:52:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 02:52:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 02:52:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 02:52:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUFvOVQ4g68xpEidisQjMaDzc7Wd9gB+DYwQLy2gJOe/c9B9P/uXqZ0OqPn90WrA0pp8eqjA7IIfzy7nkO3SMKPp9xr5oroKlDA//h7+/hBqcB4xkt6XxoqznQLofRwQsq9C7pSOZ6o4EHCN9JJlmT6vgfD817qFSJFAbfsjWdeXUdHSP4jNwlvYVqqHTu/QGRzweRnYo3pzshH1RmKTr/vIxHYMWCt2SWdJ+ClSRUAYll3YgIulTV30XePysGeHhBx/Z6S8ds3sW+jR7/3iSkwq27O5pmflPH2mUDB+V3DzqL7yz1XfYCcxeZfGL484zCHUi6ITbAY/fALc9Mcrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcHlANCBJOgr9l8WPM/6BFRifL6W/Sk83RmxBffOt68=;
 b=dQ8xxVPYMHiU1Db5Xi/u7lqRoD8lAtmOPLsig6sts96fu+X8DXfN8jdWs8LCtOYwq0v4O+4zyhQixDWkn7TOChLmiN7BCFsDD5aCvO8SWxO3J0zyxdI1RTQf8QYEwGvl3BdPqZv1MkjSwRT9ohjQDBkmW+K8P/bJpbLTshVvPQfhYGz1db62f0VIDMRtQlZg+dJsd/NrwydenkoR9/6p84WjOq2Ti0IcPh5hGusrf7SUfcRumjds4sljat2ORiGusiGGF0DAjzFfkdNLM9ck2LH47CIFC4OYHMq4fh7UaHlFaDSomQ2TCdiTXtQFFCE6sgUkbzU1XrYYU4tHBvPsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Thu, 10 Aug
 2023 09:52:44 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::f6dd:da7f:fb1:5bce]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::f6dd:da7f:fb1:5bce%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 09:52:43 +0000
Message-ID: <c7464d3a-3068-0ab5-890c-afe5e0c1cd79@intel.com>
Date: Thu, 10 Aug 2023 11:52:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v6 0/3] Introduce KUnit tests for TTM subsystem
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1691487006.git.karolina.stolarek@intel.com>
 <2362eb30-7582-ac82-f0b3-23db5ee19717@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2362eb30-7582-ac82-f0b3-23db5ee19717@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|PH7PR11MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: df52fa78-5179-427e-bac7-08db99878af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDPyX/sChSGVyyBBu7AXNaT3e8RKLs5Qvrn74hWkPabWX+Tg+ubBl2p34bxvqEnRe1iT9oqPoiHR6qQ5R0dY4S6wxu+ELir8MI8aSfhgApcPmkAf1vVbCoe1FJnhlyK0Xe90NRkXPS4hw6ezxZHLajMWhXCgQRN1WL2qLkzVAxE7C7iS8+U2FSmmOgFCcuzfGmqbJwTPLvGN+4Jrf+fp6udPwB/LTZSyFxJJC/2xw/fULd4GDQ/wt8bSByhfdbXX/pb5c1B614zYpzrDSLr8tVLb1sK+v7zT0YEhO3DMcAR5RQmDRnxuFI5+SlKKbj6sln459+SLq/wvugJnrSoxBtSSFH5WfHKAjUY1ReGG+669J9pXTnyIZP0N7Sp2HcMPL/SBxX6GnvxePYzKFm0aZ+r9nUypormNIdm4Lv/HCtciixpO80a0XT81TZZ56wg9FKRBw5Abo2BUVFgXU1hdUq/SKP3jYawT8yQpitTyh22ouMKgg7lHbDB5uy41uVx616UU5uaF5UGhdJUVGzqp+xkEI8wo3EOM0gxT+8Ly8Xk22S4Y3lkuLcO1+KqcqfeUQPm/9uaZlGIczMuWZLvlakyoJ+mMjsX75a4FBnI8haSbkHk7Yvo7Tm9CS+7lp3/FAjx81/+8enO4RCC05l7vmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(1800799006)(186006)(451199021)(31686004)(38100700002)(53546011)(26005)(6506007)(31696002)(478600001)(54906003)(5660300002)(44832011)(66946007)(66476007)(4326008)(8676002)(66556008)(8936002)(316002)(86362001)(6512007)(6486002)(966005)(41300700001)(36916002)(2616005)(66574015)(82960400001)(36756003)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2ZIdDc3ekVOY2pmT3AyTUkyZ1VLNnovMHBnR01sTkFmNXVXQ3JOTHlUTlZ0?=
 =?utf-8?B?Z2paY2pFY0RiM1R0RG13ZmxKQXpSSzJDcTJVYzFGVWVIYXJHbTRuYjhJYU1x?=
 =?utf-8?B?dVRPNUFFZzRRQUY3ZWZuOTFVZFArSzMrQ2xrbStpR0lRMVM0MFJqTHpMMmk3?=
 =?utf-8?B?bUR5STk0MFM2bWlUaDdRaG8xR0I2Q2llN3lieGFsZDFERkVNMnVPcWFUTUli?=
 =?utf-8?B?M3IvRVhsQWpQSk9uQmZIVjRhb0J5YWFTWHNJSlRVOHQxZldHNmhJa29ESHpH?=
 =?utf-8?B?cjZkS1UwZEJadUpHMkZJK002UThLcWtPRlFkV2pkb3NrSWFtSnhCckZpdVZL?=
 =?utf-8?B?dzIzUXRsVElzNkFnT2xSUU1BeVVCbW9LUVc3UXNkaVZhdkRxVzQ4K1Zqa1hQ?=
 =?utf-8?B?eXdYanFEekk3L09QQWd1OUQ5Z1l6bGJ2bldvSk4xU3dwMmZETldhSHBxcmtn?=
 =?utf-8?B?dTdFRWZ2UVo4K0FSbS95TUxvZDVRSnduOTVkU2FoM2xnMzI2N1VVcEJTM1RH?=
 =?utf-8?B?R3hRa3dVU0NUVklOMkFWb3NQZ2NZQlczUU1QZm9sUFJObmVYaHVwQ0JlREJY?=
 =?utf-8?B?WmxkR0JSZmZMQXdYUC9NRWhka2w0ZEFkRzVOb1UvNURka0doS2I3QlVGYVlj?=
 =?utf-8?B?cVhwcS95eDRUY1c4ZTZ2bURvSFJabXdBMW9RdFN3OWF2bVNTc0hjazdJUkhW?=
 =?utf-8?B?YlBWajRyVmhnck1QVlFUZlFJUHRsak5mVHRHYnNtTDVpRDBFNjNRMlo0NmdZ?=
 =?utf-8?B?NE5wTm9najM0WldmSkR2MXpMd0hFY0FvaXRTRGsxMm1CTW5nWkNIcllCSmRu?=
 =?utf-8?B?a0I1WXFsZER3SGxDLzlrOWx3MTU4QVRuNDQ1K1VjcGdDc1ZQVElvU1JxbFFj?=
 =?utf-8?B?RDVBVUw0eWRDQlJ5UzVLd1AxZ1QyQ0U1ZzZiK1dTRDhtMEtSSEN5Y0piRTZ6?=
 =?utf-8?B?VDNwYTM1dDdzUmJ5MGFsVUpHUklxNEREQ3lrYStHVm1kWEw5YTRRNDQ1eUds?=
 =?utf-8?B?c1NwV1NFQU1oL1dNbUQ0RklyaUl1OEhsMDNBY3loR0pCd1FsM3RZeGF5eUY4?=
 =?utf-8?B?YnVXTmY0L0FVcVpCYkpjalZpRXA4YzdCNGlENTVmbVNXNC94QzVCbW9QMUhz?=
 =?utf-8?B?MmdmN1VPcXd6cGNZTnhzMUE3QnF6bnVnYm9yQWZMS2E3N21GcU13cTFiTjQx?=
 =?utf-8?B?OCtQYU5MekJKSGp1TEUwbEhMVXBvRkNRai9jUldMcWV1RS8wcUp0WkJqak90?=
 =?utf-8?B?UGptTkpITVpWbUZtUHdESW03VUUwNDlMNlBsTUxLMjdCS2dqNng0UTNzUFJC?=
 =?utf-8?B?bkJlL1pGcWo5QXpnNFZPK3JBTE51NFhsTFNneUl0L2NtcUJxRGFBcGtIVFRv?=
 =?utf-8?B?N2x6Mks3Nk5rdHRDc2FwV1djek5ZZCtlZ2ZMQmVJYkVSbm1Cb3czbWtadldV?=
 =?utf-8?B?aDNsQ3VaRGtOY3JnNnV4MTk4RzdFUWhxeXN5K1dLVjhPOGFXWkxTcmFBNnh5?=
 =?utf-8?B?dUNEYnFVVXlXdlNWc3pNRERPS1NVcDNJZjl3Mm1pVWhHMmpOSjNqMjJIbFZF?=
 =?utf-8?B?NGlDdWFFTitzc2FnU0NDVU5ueE1nUmRSZ2xEQXRrWjlRRUFTMTF3YzZhTi8x?=
 =?utf-8?B?OHdmbTQrVHRSQkpYUDBpc2ZIY0xLOFlzcFo2YVhSeThCMWlxWDEzWDNZZGdw?=
 =?utf-8?B?SHN5ZnZpUkpQM0gwRzMwZXU0NGNlVDFEd3F6bVdiZ1B0S3NsbG91UDN4MER4?=
 =?utf-8?B?L0xYTFNFeGFkd3Q2RzJEaUFMODVieC9xQlVSNEU2MXB0L2s4c1hiQitSOUN6?=
 =?utf-8?B?SVdnUVJQYmlORkdNSXVGcVlpdFBmOFdWTU1Iam5kWW1IUnlzeTdFSHNXdWxP?=
 =?utf-8?B?dmlVbXhNWGx0czZZOXNyQXJFMkE1bEMvUFVUc3dadHhaRDQvUTc4Mi9MM2I4?=
 =?utf-8?B?SmFEdGhtSGhhZ2N4TFk2ZFFEUnVJbUk1ZnRiaWI4cklpM2xzZ053c2NQTG1k?=
 =?utf-8?B?TlNOd2FZczRuUmcrM3k4ZjVVYWVWcGR2ZUtKZTBwU2F4MHp0bGJ5cVhrYlB4?=
 =?utf-8?B?WWkvK2I1cmFpNWo3YlNhVU5KQ2taZi9EYWlBN28yd3Uxc2lQekEzM0lqSWRL?=
 =?utf-8?B?dTU2ZCtueDlXS0gwSkE0RDEzekhPY1JRSzlQaDAxV2pEUW83cHVzYVBCbjRq?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df52fa78-5179-427e-bac7-08db99878af8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 09:52:43.8759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSUJTJtbHnxdfwamXMXqwj29H6cPoeTlGhV2YxBn+YVLKiRSWUpNYjbp7UVQf+o4D67LL4JwAzqUeYLIY6rQ+vcMdTUvrJPsySheyogvRq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
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
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.08.2023 09:19, Christian König wrote:
> Am 08.08.23 um 11:51 schrieb Karolina Stolarek:
>> This series introduces KUnit[1] tests for TTM (Translation Table Manager)
>> subsystem, a memory manager used by graphics drivers to create and manage
>> memory buffers across different memory domains, such as system memory
>> or VRAM.
>>
>> Unit tests implemented here cover two data structures:
>>    - ttm_device -- referred as a buffer object device, which stores
>>      resource managers and page pools
>>    - ttm_pool -- a struct of pools (ttm_pool_type) of different page
>>      orders and caching attributes, with pages that can be reused on
>>      the next buffer allocation
>>
>> Use kunit_tool script to manually run the tests:
>>
>> $ ./tools/testing/kunit/kunit.py run 
>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>
>> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and 
>> then
>> CONFIG_DRM_TTM_KUNIT_TEST.
>>
>> As for now, tests are architecture-agnostic (i.e. KUnit runner uses UML
>> kernel), which means that we have limited coverage in some places. For
>> example, we can't fully test the initialization of global page pools,
>> such as global_write_combined. It is to be decided if we want to stick
>> to UML or use CONFIG_X86 (at least to some extent).
>>
>> These patches are just a beginning of the work to improve the test
>> coverage of TTM. Feel free to suggest changes, test cases or priorities.
> 
> Couldn't find time for further testing, so I just reviewed and pushed 
> this to drm-misc-next.
> 
> Thanks,
> Christian.

Thanks a lot for taking care of this, fingers crossed it's all working.

I'll rebase the upcoming tests on the top of drm-misc-next then.

All the best,
Karolina

> 
>>
>> Many thanks,
>> Karolina
>>
>> v6:
>>    - Rebase the series on the top of drm-misc-next (Christian)
>>    - Remove drm_dev_put() call from ttm_test_devices_put, the drm 
>> device is
>>      already freed in drm_kunit_helper_free_device()
>>    - Remove an unnecessary priv assignment in ttm_test_devices_all()
>>    - Delete ttm_bo_put() from ttm_pool_test_fini() (as for now, we 
>> don't count
>>      krefs for dummy BOs)
>>
>> v5:
>>    - Drop unnecessary brackets in 2/3
>>    - Rebase KConfig file on the top of drm-tip
>>
>> v4:
>>    - Test helpers have been changed to make the creation of init/fini
>>      functions for each test suite easier:
>>      + Decouple device creation from test initialization by adding
>>        helpers that initialize ttm_test_devices, a struct which stores
>>        DRM/TTM devices, and can be used in test-specific init/finis
>>        (see ttm_pool_tests.c for an example)
>>      + Introduce generic init/fini functions for tests that only need
>>        devices
>>      + Add ttm_device field to ttm_test_devices (previously
>>        ttm_test_devices_priv)
>>    - Make TTM buffer object outlive its TT (Christian)
>>    - Add a dedicated struct for ttm_pool_test (struct ttm_pool_test_priv)
>>    - Rename functions and structs:
>>      + struct ttm_test_devices_priv   --> struct ttm_test_devices
>>      + ttm_kunit_helper_init_device() --> ttm_device_kunit_init()
>>      + ttm_kunit_helper_ttm_bo_init() --> ttm_bo_kunit_init()
>>    - Split ttm_kunit_helper_init() into full config (with ttm_device
>>      init) and basic (init only with device/drm_device) initialization
>>      functions
>>
>> v3:
>>    - Rename ttm_kunit_helper_alloc_device() to 
>> ttm_kunit_helper_init_device()
>>      (Christian)
>>    - Don't leak a full-blown drm_gem_object in 
>> ttm_kunit_helper_ttm_bo_init().
>>      (Christian). Create a small mock object just to get 
>> ttm_tt_init_fields()
>>      to init the right number of pages
>>    - As a follow up to the change above, delete 
>> ttm_kunit_helper_ttm_bo_fini()
>>      and just use ttm_bo_put()
>>
>> v2:
>>    - Add missing symbol exports in ttm_kunit_helpers.c
>>    - Update helpers include to fix compilation issues (didn't catch it as
>>      KUnit tests weren't enabled in the kernel I tested, an oversight
>>      on my part)
>>    - Add checks for ttm_pool fields in ttm_pool_alloc_basic(), 
>> including the
>>      one for NUMA node id
>>    - Rebase the changes on the top of drm-tip
>>
>> --------------------------------
>> [1] - https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
>>
>> Karolina Stolarek (3):
>>    drm/ttm: Introduce KUnit test
>>    drm/ttm/tests: Add tests for ttm_device
>>    drm/ttm/tests: Add tests for ttm_pool
>>
>>   drivers/gpu/drm/Kconfig                       |  15 +
>>   drivers/gpu/drm/ttm/Makefile                  |   1 +
>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
>>   drivers/gpu/drm/ttm/tests/Makefile            |   6 +
>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 212 +++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 113 +++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  41 ++
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 437 ++++++++++++++++++
>>   8 files changed, 829 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>
> 
