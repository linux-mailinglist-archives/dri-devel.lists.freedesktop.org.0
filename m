Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D217DE5AD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 18:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86E210E761;
	Wed,  1 Nov 2023 17:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7E510E760;
 Wed,  1 Nov 2023 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698861459; x=1730397459;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4rspOiS7IK9OLZSLUYzyLFQm0tNIsye+dEpM45QOnU4=;
 b=LbMNkkWK3HOuL3egy3ZQXGMHBUMafgSbBLPZf056pgraE+K6VQpvW+pY
 TO1UwjHScWW/xOyoF+ogLJWmjpSma57voMeWYMw24/33YC0fRSzXU5tZa
 eI15gIZzzbdhmnPMeS63Wi3S5jKgIv2aEI+J+UaSp2W0yGNAuK3I3i8dd
 E3MaJI0THSXwD0YMDSQZDaKPi2gNQRT8Oy66k5T8BfbXOI0SbhTPabRn8
 tHjamRqOyj8Vsv8CTqv38CD8sWUA25UZ2bjAJrCmXs/uykpp7oQE11BF4
 g+LFIa522vcoRsBkrdEE0s9/kKcrucpH5EmKOyQIPNA9Zmie2BacbxKJM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="391408339"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="391408339"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 10:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1092423360"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="1092423360"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2023 10:57:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 10:57:38 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 10:57:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 10:57:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 10:57:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWltlM3FKye/XxUbkV7jUgIigK4Z+gix00PbaA8EHJKr0SvSOYdNxHBpNUw4CM29Im6pdaCANKFGuGwEv4cfW3bpc4NKANeOwy20Wd32ZBfuGqf5sO9tM5fwyRR7O25oacGbguA/em8avO+96Pm73vnMFBIdl5QSU+dYQDJ9EFy4x+xAM5dxqmjKefihwE0qiC6V6O9xF15ysifVt5ssBn1TfV90PgDtS8KNY/I/VygJX+mIWqUE2MvgmKkk3FNVe3lFLSuDOgwUnnaNrJx1TNaAWv8iNVwSuK42ozbFNmrMp4TDK3FsFbJBtANZm1ghUUYonhhJDRRJ2YiyydEy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IdmJHF6j/OUiP17SJR8JD3CVHUROQKZfdWT3BXGzD4=;
 b=j7KZn/kZ9IqqlkwsIMJlsRQUaPV7IiBunjYnIaNNmTaJsWGXVifG2/3g5+J14ij+cpT0nz9CcN9gNbXSNnLhBNh+m2g0m+INIxI5E0Jmp2KCY/oqlAnbJp5Z9B7Gqb1saLPL9t5OCgZhbsqeC6jSHLuc9tqlIsDd83n2pWq1Pe7WOnSSpPqCakVQfGd2Hgyl+ji2P6YKKp8FAMESXXRR90ZPdXHxd8+rIZnUkxsWYrO4bVSNKs90GKB/UtFjmmXhAvdS0+PisKpW4M1RxKxW1KuZnkCQJZJ3LfnmLS+zxRrbDIZ6vCiNW3vHWi9lng+OV+Q30F7T22UMNadBKHmPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB6653.namprd11.prod.outlook.com (2603:10b6:806:26f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Wed, 1 Nov
 2023 17:57:35 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::a6b9:d4fc:1cff:7688]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::a6b9:d4fc:1cff:7688%4]) with mapi id 15.20.6933.029; Wed, 1 Nov 2023
 17:57:35 +0000
Message-ID: <c4bf0161-3b70-4a8e-86a6-2fa7e3848d3d@intel.com>
Date: Wed, 1 Nov 2023 13:57:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Skip pxp init if gt is wedged
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
References: <20231026215444.54880-1-zhanjun.dong@intel.com>
 <87a5s47d1p.fsf@intel.com>
 <99df74b59af6abc51d5d13947912e11eb32f5a72.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <99df74b59af6abc51d5d13947912e11eb32f5a72.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SN7PR11MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e0e75b-01b6-4ed8-c193-08dbdb040711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n82SdKPmjmgD3+6opXYKXaDoSUkBLpCVqvPF2cEgKCn3+ftxDXt9+cEifc6Cz4ar8+kiL3mU8qyDtVSERyHh0LLBEuwsyLvwJReNdR0jDaFXCjHucs94orFSdNA2O8MStFAkxnw81RvcunWUVEldUAan6XGuMRBXZ3EBKgWi60qKmaKqNwhNlHcsJaVMp/sPVXPdkRstWiAq0gIvVrS7T9QsMQmzYCwOE8C5L6cerTYz7uFiyY5lT5Yri4K2RCKUqrWaLNcebt+siv/oPlqVf2VsbcUJl5XLGFAwH4gEwsYqC53Mdxk3yfkKWNi//R+yQRQVEuSdxxt1RlbNj80mTKLdIg4eJVhTXIwtdgTbs+cpb4SE+WdMOORBNdkr2ank90mCz6XevcYhhXzek3MjHRpBOa5UqRip5gVddylgmd74qRgBXa1fs2nskUhozl+5QhjkdIcO6BVQtjC2tCMV7nD7wMXASA8QXtoyYcnVQheTH204frAqqxgmKufNsO608VxpQ2bw/jRylwwG2tOEV9lnBxMn8Cdef2/velGegmQR7fuLT+MRZiUmeOXETeJoQxjaPYrESFrHQfbgDngXAtjqII7ZHF0B/Z54PDyYaJMX2XLUOyBCtyXWdSkje0xjdtuTTgGTNx2Zw/zZ1PpKjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(346002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31686004)(316002)(2906002)(4001150100001)(38100700002)(41300700001)(8936002)(86362001)(36756003)(8676002)(31696002)(83380400001)(6666004)(66946007)(66556008)(2616005)(66476007)(53546011)(26005)(6512007)(478600001)(6486002)(82960400001)(110136005)(5660300002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEoyWXoxOGMwL0ZaN3RoUnczbFkrdkhwd3VPRVBOTnlQVXc3M3hxNjYwZk0z?=
 =?utf-8?B?ckk3RWFNcUwwS3Z6NFUvOW12ZTZuZWk4c2FSYkhHSHFtMmVtY2pLNTZOZUE0?=
 =?utf-8?B?ZHpsV1pQMVJDUzgwdWNnZDFnMERYeFlUUnJxWXdIVE8rd0ZZMmJYSXMzSFR4?=
 =?utf-8?B?cWRzSnM0NmEzalM2T3JIbS83QVEzSUZqYTFmYjZiN3hyQ0pXUGpQeFE3UTEy?=
 =?utf-8?B?Y1pTeTlTT2tGa1Y4Y3VWT0x2SWpxN0tlaFlCWlc5MTBHdFpWeHhSSWZkZTEy?=
 =?utf-8?B?empKay90TWl5U2lBc05TTVY5ZEZyK1d2L2xndWZqNDlWRU5NcjZ3YzJ3ZStz?=
 =?utf-8?B?eTl3cWxObkp4R0U0ZkNQN0pkMnVwajZ1ellnU2R5eDlwcjFXR1VZVmgyUTY4?=
 =?utf-8?B?UjMvQ3V4MjBZNi9maUhodWlVVTFJdUxHVlhGM1pMWWdXSWR2YmEzOGZnVzk3?=
 =?utf-8?B?aEU2b1BpL1BQbzIxZEZBWGpxaFFDTERsSk9Sczl0ZTNxblJsY0RyV2U0ZXda?=
 =?utf-8?B?c1FsRldvdEZFR3c2RWE2TzZ5WnBlbWhtVy9xMW0rMHU2V2lXaHgzT0U2TTdO?=
 =?utf-8?B?MlBYZDNxeGZacUR0Wit2VzNFOHNyUXBSNERnRDlQam9aVk5RWHk2YXExL1lI?=
 =?utf-8?B?dDRCL1FhMG1OUnIzUWx4Z1Vhd2xaNnNYeGJWWlRNdUtjTksxZzhBbEVFVkNp?=
 =?utf-8?B?ZjJ5ZzVMZi9Vamp1Vkc0RWNuV0p6Y2N0RlhTdWc5bkVSR0VielI4R3ZWd21N?=
 =?utf-8?B?VFFsZzFNV2s4ZWRSa3BIOUR6M1ZKeGtWdlFLbCtXYUNNZGhmZzZROHRxTEVy?=
 =?utf-8?B?ZjJlRmhodFoyVXBQdWtOaUdHajRBckd5azNrUFphMFVCbWhNUUxqNVhXWGM4?=
 =?utf-8?B?ZjdRS2wrbnJrak1PNXA5YzFvZ2FnWndweWFmbVMyNlIyeGhNd0dkYXMrd1pQ?=
 =?utf-8?B?aUxRcUhUZm9ZSGJOcGV4bUYzdFNNWmVlaWM3Um9Ia25aQ1dJM1VXQnhVUm9R?=
 =?utf-8?B?bzNXdUMxRGJmejVndGdFR0EwN0JUL3lYR3FRRGsxYlVNQUg0dTl1YldpY3hP?=
 =?utf-8?B?Y0EwdUxKMUJ0SUxwS0M1QjJJM2dJZnBpdlB4OEkxMUkwYmdUK1JDUjAzbG1z?=
 =?utf-8?B?cU9wdmNucVUxWjAvYTdTajlrVzJ3MzVjK3ZZNWtZL0JqTURnZ3piSnEwTjJ1?=
 =?utf-8?B?cFdUMTNRd1hUNzBzaktHRXZFUFJGbHNadkZ0bHp0MXRhSGFXQW9rcWhpL0NG?=
 =?utf-8?B?eGJycnRLQ0NIL3UwWkZ1UTJzS2hvaUo0U2lZUGUwcnJ6b0F4SzhuRTNiNHdG?=
 =?utf-8?B?OU5YK2pqa2MxYWRHYTZBeGptdWdhOHFqOUFyVi90djgxYndqZWM4RmtuV2E4?=
 =?utf-8?B?L2NxVXlRanNLSnEzK0pXSkUvOTZHU1hLSThpSnZTN0txTndzVEVJRUhXZngy?=
 =?utf-8?B?eE1qUXRvNnpvZys5V24zaVhUSTlxc0dXYjNPTEJJWG95SVQ4V2pIYWtzL1FD?=
 =?utf-8?B?bVR5QUFBaFplUXRFVVB3d0EyZEViNUdNNjd6b21EWXBIVHRyczJ0QnpTUEZT?=
 =?utf-8?B?MTYrakx6L2xVM2UvS1JMTUUwcDJlQTd2ejNMSHFzQlRyNkM2cGxkK0RIUXlW?=
 =?utf-8?B?WkplaDUzOWxZK0FNM1R2eVhnZzlEbHdITU5pMStSRElUYWhYemJCK1JKLzIv?=
 =?utf-8?B?UGV1S3h2eU1JN1JLT2NXdzBvdEVCNEpzZWpDTmFTOUFDUDBRd3N5L1ZqSjYz?=
 =?utf-8?B?N091ejl0VW4ycUJvLzVxS2lGL3pVMEEzK00vMEhjd25wNFQrQnNUaGRzeDZ5?=
 =?utf-8?B?ZVVDNStLNm8xRGlvOE1wWXcrbWRVVWRZL2tlelJ2V1hlWGFZa3RGZURHY0o1?=
 =?utf-8?B?OGM0azdFSnBBaXZqaTFPVnRwT2JkQmY4eStlTkZLUWkvU0E1MkdjeURQa3gv?=
 =?utf-8?B?dTQ4Y1hkMkFHRDg2bk1TcEh2a3VyOEZKTHNBVkFGaW5BZTZkY2w1c2pSWlJO?=
 =?utf-8?B?NFNrZnFINnU4bkNiSUpnSm5EekNMWW5JVUVwUXh4VE5YVVlxZG4ra082UDZr?=
 =?utf-8?B?NS9XcnJ4cUhXMDVudDRBejdRdUVmUUlWcUNIbmg1STZkSndvdWcyQmx1UmJU?=
 =?utf-8?Q?s0G2PxxDO1UwUuX2QDyNJw8nH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e0e75b-01b6-4ed8-c193-08dbdb040711
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 17:57:34.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyqK1VpAskITQj8v47VdNU/DZ6jRJj180G/MK+npo4V3hAZZkCCx/yqrA4yEq18/fKDnNaNckP4RTw/Pg1rj3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6653
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-31 5:38 p.m., Teres Alexis, Alan Previn wrote:
> On Fri, 2023-10-27 at 10:13 +0300, Jani Nikula wrote:
>> On Thu, 26 Oct 2023, Zhanjun Dong <zhanjun.dong@intel.com> wrote:
>>
> alan:snip
>> I'll note that nobody checks intel_pxp_init() return status, so this
>> silently skips PXP.
>>
>> BR,
>> Jani.
> 
> alan:snip
>>> +	if (intel_gt_is_wedged(gt))
>>> +		return -ENODEV;
>>> +
> 
> alan: wondering if we can add a drm_dbg in the caller of intel_pxp_init and
> use a unique return value for the case of gt_is_wedged (for example: -ENXIO.).
> As we know gt being wedged at startup basically means all gt usage is dead
> and therefore we cant enable PXP (along with everything else that needs submission/
> guc/ etc). With a drm-debug in the caller that prints that return value, it
> helps us to differentiate between gt-is-wedged vs platform config doesnt support
> PXP. However, this would mean new drm-debug 'noise' for platforms that i915 just
> doesn't support PXP on at all which would be okay if dont use drm_warn or drm_err
> and use 'softer' message like "PXP skipped with %d".
> 
> Please treat above comment as a "nit" - i.e. existing patch is good enough for me...
> (after addressing Jani's request for more commit message info). ...alan
> 
> 

Thanks Alan.
I agree, add more drm-debug looks like add noise in case of 
gt_is_wedged, existing code already output useful info.

If logs already let us know gt_wedged happens and we are not expect pxp 
init running on gt wedged condition, then silently skip pxp_init looks 
like match the expectation.

I will re-post with updated commit message later.

Regards,
Zhanjun
