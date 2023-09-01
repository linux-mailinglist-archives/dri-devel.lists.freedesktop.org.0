Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CDD78FE4B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 15:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB5910E7C9;
	Fri,  1 Sep 2023 13:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB7E10E7C3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693575042; x=1725111042;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rL1MAV3JOvOyRbdRd5c0vBr+0N7IT95+h4cMZ8uBBwk=;
 b=KyrxCkpOL7ysgkasQVHomPFFLbvm8xDsS6KGw+7IiWMlnDjrrRJURmH0
 bf2sJUWkvEN8TroBLgwgJrmprNppBoUp+n2YCBSZFbx1w4AAudi2dXfzF
 ORJIWfnieYcLdGtrqGiCKWtvPhjnxKwz4dP0QOxEzgzVvyAqDApYHBShn
 HiRUhWppIOFGG5pZ39UiBVO3p6d75kn/SgnE0+Was4YTjE+9j8b29w1yW
 3Efx5rZR7JgVXFtwGNwlA3gN36e8qhZ/OIANZ6haqAHnW5ax2mU8bImxg
 TPG+TjsMOSpMwqzEzCjIrNDRyGHS3GpEpbHgNs8p51cWSqSyuCkELnDOx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380007660"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="380007660"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:30:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986680500"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="986680500"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 06:30:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 06:30:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 06:30:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 06:30:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 06:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJjP4oDZAtqVjAMBQ9JLUYW+PnI4b3MAbngzdGhmpepuALZq4jv3HH/xlf1ZW0hkHQcBoehXnd/x4wdtr5a+OCwo81YzOmhROhR0E0JhPOYozbe++wcIDPKjl6jIK0U6hsWXEt/ZSPFBSB5cExEgdUglQwCb1micsi/B8qXzrOs7W/tDfoDzVKxRzEXSUQAbJjwzZv87Y3HxCGA0o5yt4Pmu1pmZIpI65NmhVMRjwGgmygrufsQlnacXMSd2f8IGB6C40wANDw78jziI3jPsaqaoJ6SGyKxXAsbKPUNsBPvUaE9M0HJ1Z0jHdUvYbGPPhgZmN5SfPZj1Dsq9yrcWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNZWujuBE4fINN+AVtdGhm2nF1kCszYjUfqjwv1CHsw=;
 b=fDrwYgsxR9xK5I/rcDxJ7ajJ0qz9EJx3kb6Y6uqstnXbKSI138KLoVVDGYlXXzN3+IMM8g7Bllq6RLsmln4hivirytSJ9SXvDViWkxvvaiEHSJ8AFa5gW4pMxsbIVvrRkFmxHa482y55kPJqyaGNQtvi6fB6vClNWYjTluVX08mbhqGS6SQAXsYKdxYlOfqmRlWCGAkaJreptWcbySxhHWXorXTkIVo3yPWyW8MMfPDXzWHUZjRU6HSe9+/D3lft1ELV9jdONB2S/matJ3/0vZB+yuBbLqgsY2+XR3N2n1lRcQKG90ExapwLuMosjuyv3w6OTxnZ7JexXC3KxxFUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 13:30:36 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75%4]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 13:30:36 +0000
Message-ID: <443e34f4-3554-e981-f11f-fc4bc459b046@intel.com>
Date: Fri, 1 Sep 2023 15:30:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo functions
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
References: <d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek@intel.com>
 <202309011935.bBpezbUQ-lkp@intel.com>
 <41345404-3440-00cc-745a-d2977b406c64@intel.com>
 <e1061b33-65ba-4049-871c-4e2b4d23177c@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <e1061b33-65ba-4049-871c-4e2b4d23177c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|BL1PR11MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: f01cbcce-8a2a-491a-bdb8-08dbaaef9fd5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z963ugIBAOaL1rYbKs1GBpzXi+PCXfYowpikWs5AT1B5XmOKtdze4lUwERlGkyVhHcbfA+QuWVtT2NfGBiOwA2jcP+7JDODp4Gn6dlCPHcSVkBm7bCPmhJmxFF29Z9a6hot/SOKN5PsfBfv1vVlVzSUL4pcUK4J2ewfvNX09kMEKOeOPG6RW6jDx3jXG012OtCNlrakGHC5anTqRCiumETqdicUlilKYMfyBHd2WYVeWC73hRfZLPVzQpYZyWgcWtCbodkxYeXnSVFf0xuz7cozG3uBhuNg3t8kdTUpAyA4q+mGGTES//Yri30+ZdfCaQgLs4woq8Z7WPsjMfwTWNXpAN4GggiRlRlcb7lA4Kx6u0q+ZqQ9QgmgaRDYjYVhXzClxlkl5MWGY0YkcWBUBV6DAvyf5xot9rUrbd3JE5Gqi6uqAKofDZJEfi4QlQkwAcClqOYCDXMBZx2k8oBbT+51PtDs/xq7UeLynOyP7lu3kkewrPAGHfdVXbZJDA5sqM6q89qs8UhthgXKR/3UmsxtFyT/ZpgBTnx8bZlqT7ytdd/vHleFNsnsRW8wKeoO7T66XQASAv/Ir0/SMubkPQlxwXDni+iqirb9vNwaJoU2qsokewIRKHZFfIt0x8E2BNCwMAReXLQMGdH+Vq2RSYp4HuCZtImH1nObm4HEc1bQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199024)(186009)(1800799009)(6486002)(6506007)(6666004)(36916002)(6512007)(53546011)(966005)(478600001)(83380400001)(66574015)(2616005)(26005)(2906002)(30864003)(44832011)(66556008)(6636002)(66476007)(316002)(41300700001)(66946007)(110136005)(5660300002)(8676002)(8936002)(4326008)(36756003)(31696002)(86362001)(82960400001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBEMGtUai9yekdoOHJFeGxybG1CN1REc1NvZXpqSzA3OWg4SGNGS1dMb3Aw?=
 =?utf-8?B?Mi9pYmRjTDB4U0dVSTN4dE9QMkFCVWFSdVh2Q3UwYVB2V2tidlJjaVFJTnZa?=
 =?utf-8?B?Q2NyS0VyRyt0UkIzQlVGdTRBcGkyZzZ5clo0NDJGM0IvS2ptZkI3NC9ueGRq?=
 =?utf-8?B?VWxDZlRMdkVoSGI2amRwbFNULyt1dmhDTW1EZy9SVkRnSW9aVWlqL1ZuTjdx?=
 =?utf-8?B?aWQ0TG5MUXBCNWU5OExWUWxoR0tWZ2tpSnpVQnlxMUNmOHI3cXhDS2JsTzg3?=
 =?utf-8?B?SEtsNnNNQVFoTkpYZWQrSWRWdEJGZXA0Q0x1K002aGNrV2doV2plKzIrVjk3?=
 =?utf-8?B?dlNpV3FmYTRhcUR4bG1oZnc1Qk1PZncxdEtRc09sRS9hOWg1YzdFZENRRW1j?=
 =?utf-8?B?S1AyZHFWMll5cy9oOEpia0xrenMwZG1rKy8yb1kwVFE3b2lPZlUyS0NLRFZj?=
 =?utf-8?B?R0FaYXdMTW85M2w1RG9OMUhKbXphREtGYW5WMDFlYUxJYmJlR3VpeEE1VVBJ?=
 =?utf-8?B?RFlRVzhTdDYvSUhuekdZVTMxbFE4K25KalFHVUJrQWtEVDVoWkRJWmNHaUN5?=
 =?utf-8?B?K1lmTUgzN0M2MkdGYVBvL2p2dER5U25vbXVQNGwxeG5Mb21IYXdxUjIvRUli?=
 =?utf-8?B?djFMKzNabWVOYkRoSWxxdTFKVS9rdTBMd1Jlb0cwY1hYRGpIVU5Wc09qd1g4?=
 =?utf-8?B?d0F6UW92bURFWHRiZU1va3NGZ2FvQmcrMndiV2IxdVlMRjl3ZUw0M2tYaGp2?=
 =?utf-8?B?OVFrTmRhUURndXI4YUt4QTZwZm81ZDBWWktBZ05KYWt6MGhLUWFoWkZYTld0?=
 =?utf-8?B?OElGYXFWelBWdlRDdTBkOTZZUVRlYkpPU1ZIcDJvZytoNVJVVnRaWUtydmNm?=
 =?utf-8?B?VUw5ZWdhenBXZUgwUWY2QjJ6TFhQSTlyWXZvcjdXeFFDbkkwMzdLaUNsbGRQ?=
 =?utf-8?B?c2dQYVVESENtNVlnQkpCNDJiRkNyMjZBSzZhQzBWdGh0VHlzaHgwN1B6TTRS?=
 =?utf-8?B?a0hNZytXMWJkL0ZPclhRR1YvREt2V1dDZkV5aG9vcEYwUzFacWlaejhxVnFs?=
 =?utf-8?B?dWQwREF2enVsV0JrV0E5c0FHeDBKZEJFeXhwQWlnNTFTUTNIcU5ZV21Vbisz?=
 =?utf-8?B?aDBFM25BaXJ2MEJGZzNSbzVVZ3JhWjM2UTJGL05pbG0vVWl5SWwxanpZOTNR?=
 =?utf-8?B?SjBIK2VpcmdhekVNaUIxWlJva3N4Mm9mMjUvbDkzMmpHQ0JUQ0l6bmQrL1Nl?=
 =?utf-8?B?N0E0ZFlCcktDN1BCUnFlTGljTXltR3J6U3VYTVJXQlZUMS9nRlg1eFVOOXY0?=
 =?utf-8?B?dndXZkEvSkh2SWVXMWh6RXdRZytHV3RVb1o1bStHZ0pJaHdybFhZa1A3a21J?=
 =?utf-8?B?TU55cTJBbHFaWjkrRXFJWXdiZXBFL2RSZWtETDJJNUVCUVljYzVoaVZQY1dO?=
 =?utf-8?B?RWNSc0QwbERjWTN2Mk5oYXRkTkpEZmdVTkt1ckVpRmVZRkpUSXJIMG11Zy94?=
 =?utf-8?B?SE5BKzVHK3pnYStOdTRwcm5tU3MwSFRJMzYvQ3pEWjI5M3Y5SmJ4RjE1eTJk?=
 =?utf-8?B?YmZySlgvOUdsOXpEZU9YeTlSVnd1MG5ZbDQzclFxYnJJSFRyWjZzaTY1NkU3?=
 =?utf-8?B?bTBjdGJmTW9oSTJSRFNhSmhobXlBclBYcDVwZ2t1UjM5Z3BydEFFN0VScm1n?=
 =?utf-8?B?OXFzN0FNK2lvZFM1eUxmWWhhclVUWWxHNTlMTGlpS01tSzh2dllDZzdQbTFC?=
 =?utf-8?B?WWYzM1RNRDJuL3RCNVYwa0IvTU13ZWN2b0wxc2NGdUhDZExQTnpmak9jOThn?=
 =?utf-8?B?V3U2SS9JcHdIck40NkZUSi81ZXNnb2t3ajY2NEN2Z2l4MUQyNy9sTHRicHdS?=
 =?utf-8?B?M0hPUXhqanpxWGJ2K1AxblZBNlJ4blErdVNNMlE5RnJFOGNqeGdWMHRjRVB0?=
 =?utf-8?B?ZTNNdFpGTStJTTE5M1RiSFpIb01TN3RrVHV2aGh6dG50TFFSem1LN01lSUVF?=
 =?utf-8?B?N0lGOU0xUjh3TG55YWtyTWFOZmh6YTZkOFlLNHlXTERLelh6SlVsMmtsMzFE?=
 =?utf-8?B?aU56R2JSemsxL2kvNGx6TkJvZ3dKKzJydnpJRXdockc3M2FWLzg5OXBBemI0?=
 =?utf-8?B?Nm1GUFNmN0RIQ1RMK3d6bW1TcWhYL1dZZ0s4STNEKzdMUmRGRlNnUGJMN2Rq?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f01cbcce-8a2a-491a-bdb8-08dbaaef9fd5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 13:30:35.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uj5gtI8/lc3Jp7+dKDCrOxNa+s7WnL0Xuh6E5P4U9K6HOiYVZar8/w4K5gGL678noMSRD+UyJkUNWAglbDap2li4He0IwDnwFSKLRwxsE3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5365
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
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1.09.2023 15:19, Christian König wrote:
> Am 01.09.23 um 14:37 schrieb Karolina Stolarek:
>> On 1.09.2023 14:04, kernel test robot wrote:
>>> Hi Karolina,
>>>
>>> kernel test robot noticed the following build errors:
>>
>> It's a problem of building TTM KUnit tests as a module, the issue is 
>> not tied to a specific arch -- the subtests use unexported 
>> definitions. While it would be possible to add EXPORT_SYMBOL to the 
>> TTM functions, we don't want to do it with do_send_sig_info.
>>
>> Christian, two questions here:
>>
>> 1) Shall we export ttm_resource_alloc, ttm_tt_create and 
>> ttm_tt_destroy? Or is there a reason why they are "hidden"?
> 
> Yeah, those are not supposed to be touched by drivers directly.

Right, makes sense

> 
>>
>> 2) If we decide to keep ttm_bo_reserve_interrupted subtest as it is, 
>> should I make CONFIG_DRM_TTM_KUNIT_TEST a boolean, instead of a 
>> tristate? DRM KUnit tests are tristate, but I think they don't use 
>> non-exported functions.
> 
> Another option would be to build them together with TTM into one module, 
> but I'm not sure if the KUNIT tests can do this.

While I can imagine doing it with TTM, I'm not so sure about coupling it 
with signal.o. Still, I'll take a look.

All the best,
Karolina

> 
> Regards,
> Christian.
> 
>>
>> Many thanks,
>> Karolina
>>
>>>
>>> [auto build test ERROR on drm-misc/drm-misc-next]
>>> [also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next 
>>> drm-intel/for-linux-next drm-tip/drm-tip linus/master next-20230831]
>>> [cannot apply to drm-intel/for-linux-next-fixes v6.5]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url: 
>>> https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_resource-and-ttm_sys_man/20230831-185954
>>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>> patch link: 
>>> https://lore.kernel.org/r/d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek%40intel.com
>>> patch subject: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo functions
>>> config: openrisc-allmodconfig 
>>> (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/config)
>>> compiler: or1k-linux-gcc (GCC) 13.2.0
>>> reproduce (this is a W=1 build): 
>>> (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>>> version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: 
>>> https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_wlc.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_fo.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_ovf.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_lblc.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_lblcr.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_dh.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_sh.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_sed.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_nq.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_twos.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_ftp.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/netfilter/ipvs/ip_vs_pe_sip.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv4/netfilter/nf_defrag_ipv4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv4/netfilter/nf_reject_ipv4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv4/netfilter/iptable_nat.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv4/netfilter/iptable_raw.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv4/xfrm4_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv6/netfilter/ip6table_raw.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv6/netfilter/ip6table_nat.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv6/netfilter/nf_defrag_ipv6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv6/netfilter/nf_reject_ipv6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv6/xfrm6_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/mip6.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ipv6/ip6_udp_tunnel.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ar9331.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_brcm.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_dsa.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_gswip.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/dsa/tag_hellcreek.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ksz.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_lan9303.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_mtk.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_none.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/dsa/tag_ocelot_8021q.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_qca.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl4_a.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl8_4.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/dsa/tag_rzn1_a5psw.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_sja1105.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_trailer.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_xrs700x.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xdp/xsk_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/mptcp/mptcp_crypto_test.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/mptcp/mptcp_token_test.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/packet/af_packet_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/bridge/netfilter/nf_conntrack_bridge.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/bridge/netfilter/ebtables.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/bridge/netfilter/ebtable_broute.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/bridge/netfilter/ebtable_filter.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/bridge/netfilter/ebtable_nat.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/sunrpc.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/sunrpc/auth_gss/auth_rpcgss.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/sunrpc/auth_gss/rpcsec_gss_krb5.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/kcm/kcm.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/smc/smc_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_socket.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_usb.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ieee802154/6lowpan/ieee802154_6lowpan.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/ieee802154/ieee802154_socket.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci_spi.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nfc_digital.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>> net/vmw_vsock/vsock_diag.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/hsr/hsr.o
>>> ERROR: modpost: "ttm_resource_alloc" 
>>> [drivers/gpu/drm/ttm/tests/ttm_resource_test.ko] undefined!
>>> ERROR: modpost: "ttm_tt_create" 
>>> [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
>>> ERROR: modpost: "ttm_tt_destroy" 
>>> [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
>>>>> ERROR: modpost: "ttm_resource_alloc" 
>>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>>> ERROR: modpost: "ttm_tt_create" 
>>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>>> ERROR: modpost: "do_send_sig_info" 
>>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>
> 
