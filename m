Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F289B6081CF
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 00:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16710E08D;
	Fri, 21 Oct 2022 22:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CF010E065;
 Fri, 21 Oct 2022 22:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666392412; x=1697928412;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b103SQHTU75cnv9Dj8PE/alX3o7sjxHWa8KA11FJjag=;
 b=SveKI/PFdvSnunwhnK0Sp5MZrcP9X3Ny9TGQynRkh41VSfnhFwKflLCA
 uB9JS+80bkw5NpysCFn4vpYw0zmHPrLymQX9OpA7+5wQdihzsgWF9uZFv
 9MeYjyeaMHhgM+0Acu+mT5Dp8hz9l9dLtx/pcuupc4ARYtbLb9KJFGmHm
 k4VyNk57U2b0isj45Jmgpf83MsMdn+JxaM1fYQQypL7aIg71qo37Muexb
 Bmia5I5VsfHFl9WjL2+LjKjvmyKEqCa6zmp0YZSxjIDecBOVUDg+jmF2j
 Vc0pUnOOOJuMdfw1d/3O+h2k+RTkuB4M1eKV22XnxG3Q0PUNP9ShY8IwV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="333697782"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="333697782"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 15:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="661781188"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="661781188"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 21 Oct 2022 15:46:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 15:46:51 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 15:46:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 15:46:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 15:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVaeCz1KYHPfaoEUgI6TGN5mva5cFUa4WgEaPlIsH0RIhyfPOnLyuxWJJ+q4jS3PZ2eQeMPiqOwSj5UOWv9QvI+8VPku4FTUFWXcR/NthnhufrZsAReMne+IRLGoY7BloItBtsHsxXbGzHoCQMdlJ2oQhhK8FHOHEkzGQc5pKUjbSpT+7apOvDVeh8zXXGjLDD2KY3zY2IHIa7C7d8Hhnv0ERaxjMF2+aMflTBy6NFtSRgs2Qw/vEECpnCRx4RFlFuigg01jPuPlcbj9DDONykcZlFY6Aby0TCgGZnYvoWX8uX9AsfW0ZairIlIx6OShI3sSHjBOBgd5l7R8QGBslA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dp/32UGMquk5ilXr9Ww964lcs6OhP6iVSvE2ORCLHGQ=;
 b=Hcazx7fUGRPrXFeGLQodOewcYTsRMuQi54Qf6TUE9O205JE/LqfeXcZ/yTYYCGVowzWvt/JlQw1egvKuD2zmymEitqsgMmeCsZxhEe7SnmkXtZ2DlvdTmvgTSbj1/LDESGYV+0zCIJrEH0qLSLXB+GraETY9ycSj6us/4GzUXFbizPFlARxLp5lHU363CSiOMFgL9lHpI1HgeaaOIoIQJb2IRy1rCzAhOClx0jHkjXv6DVQSVmMyjE2E/Lc/Hal6NP5K+IGEqdFSpAxIlwuV25gZWY3pLICRWEzeba73B2AP+cEP0FPrJyImzsUyEiCGMHtGxMqTPtgDGhUaSwj82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CH0PR11MB5540.namprd11.prod.outlook.com (2603:10b6:610:d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 22:46:49 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 22:46:48 +0000
Message-ID: <9731a9ca-0e67-0519-f87b-cad040ca3d82@intel.com>
Date: Fri, 21 Oct 2022 15:46:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20221020002944.4228-1-vinay.belgaumkar@intel.com>
 <874jvyqr9o.wl-ashutosh.dixit@intel.com>
 <bbe2b4c5-04be-bdc3-3911-d1544516eac1@intel.com>
 <871qr2qd7y.wl-ashutosh.dixit@intel.com>
 <2287a44e-80df-ef3c-1d4e-5ee80a62e381@intel.com>
 <87y1t9ow9n.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87y1t9ow9n.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CH0PR11MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a44f24-2ac6-4405-1786-08dab3b62342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NVfJVdLB2N/6J/k7WucdBXRUaiDEWY3xsdfdj0FB6JtZIgR+h9FdQZbFX9FtdfD7x4++ATG1H+z7lK6Apfy2fT/k1Ws0WOW/jYzHhCkG1GlXQvdgvgJF4S6I5oEvx+mBokqF5T5TApO3d18oyM3hc7knaz21KmzWtZBHSyb4toIaQI8h1QZcSJQXbTEydI9ruK7eLyVw0NBlbcemBOBTRTHEnywA1Nb5uRzZ/w0plwd8z3svVVNvCLoS4VrZjMUWIFoXuSE8eLmKWcGC+Z7GJaRek4WWnl7RvXcoY60pgClktU/oe07pSRWNnnUuawqEbbCd2EyUJ7LriWNJWydwFAJk/ounKGDk9RretDJjOXtRY2v+2R8nTVrF+m1Hh3ZRr/DxeDALOZxpq5jzpyd9R7unhhinYn4Ntjph5Xq+seoiF/ayIEIdS5j9LaEuWqazph7D/TPuK+Rq4lG/x+tSvEix+GBNy6EwAyvam6u2BBm3P/qqaBhzrwc49+thFA+TKWhtnDiCkbiUCAdH+mDWUJqvHt7kTbYbXWOIB2hi9PJBs4I8idB8FIURZvTWU0o0jOMSzDKbv8bf+1C0hCT1uj/YSUBMsjqWAPi5PXCV8APeEQhcZIcZCsEZryrfkpjphEKdag70MwN9iAW0wcWPGt+7ou0SOPI4VJc9vvi7heZKacuJuHV03Fd06ShwNbsl2c7lj1qm5vS3RKRtW6sLdvrHBW1wH2Nr7q19lFenApBLlFiuRV55Mi8dfXLzKBryb4S8DzME3qB7GN/FOVzQW6TH1/duLq1sKSxiQRq3TQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199015)(37006003)(6636002)(66946007)(66556008)(8676002)(6506007)(66476007)(4326008)(31696002)(83380400001)(86362001)(5660300002)(53546011)(36756003)(41300700001)(26005)(6512007)(6862004)(8936002)(316002)(31686004)(186003)(2616005)(2906002)(82960400001)(478600001)(38100700002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0VkVEdLWGpOdHZxSG0vOEptNFhaZGVCMnZ6cys2NXF0NGU4Q3hEeWl1aXFr?=
 =?utf-8?B?WFlVb3ZVUTdkS21lQ0cxQ003OFNKc2ZHVWVSeUpLdkRWMzZEaXBPeGhLb3RE?=
 =?utf-8?B?dVRlK01ZTW1MdnBhMkZ3MGhFN2p2dlR0YjYrMWo2Nkk5clAzWFZaNmtpclo4?=
 =?utf-8?B?eUlueDJ5UmNWT0xaRU9RZUJldG1rKzJyZ05zR0xvUlMrbXFIa09UbkcwbUJT?=
 =?utf-8?B?UURjY0pXaDVPNE1OMWpHS0UzdE00OE9CanVuUHFjZ0ZsSjdsNnFOZ1NqSVYx?=
 =?utf-8?B?bDhYTXFwU3BjcXhEMUV5MWdLZ0V0NFY4TDdaWUJyZi9OdjFjTjFpbWtPS0VG?=
 =?utf-8?B?U2VRcXRENGtJTzZrZmdVTUNqT2hlbEFoN1VOVklCc0JvTytwVnNuS2tnclp3?=
 =?utf-8?B?MGZFSi92cHJJd2FFUTVjempCY0ZNUDZEdzhyeTNlSExJeXpLVlV2a2VodlJl?=
 =?utf-8?B?NjlFQ0NUUUFJUk0xbTBmaEdaZ3QzTVRLaU9YYWFIVmQvWUp5Q0FibC9SdXJD?=
 =?utf-8?B?amtmWGVBNFlnUFF6b0VHRDlMSGlFbi9GU3FqWERKR29tblJtT0RXZU5aZ3d2?=
 =?utf-8?B?YWY3bWduSjlOREhlNXBWNTNJTlZlTDZlM08wemw1YUFVQ2lPWVZXcXFvYno2?=
 =?utf-8?B?bXVxeHdOQ3FJVkJJOHd0anQ1NzIvUVJyVWZpWVFNMHc2dmYxd0EvUy9LM0tM?=
 =?utf-8?B?QlM1QkNqWDd6MWpOOWczSWwxVGYyaDc1akhzMWRzejF0MytwU28wMEwvQVB6?=
 =?utf-8?B?QUtFYlBQMUQ2UWV1aXFtalFMelBzdUpkU08xd3k2TGcrcmdNalp0ZFV5MFRy?=
 =?utf-8?B?cEVnMzU0MXlPcVJqUHphVG41Q1ZSVFRJMEIza1ExOEV0MkpYdW1CM1JkNFBD?=
 =?utf-8?B?NTZEOXlJM0JGRm9ueWJ1bDM2TDgwRXFSZ2o4bGJEajVENjNqbmhGNXBSZyti?=
 =?utf-8?B?WHY0MFlwK0dPY3BrUjdJdGI3YmwxZ2x6REh5cUsrd1RiakFPL3ZielNrZ3hM?=
 =?utf-8?B?SzNFUFBkWjdKU2Nabnpqd3VVdmJlVUIySi9oanYrelRLaTI3OXdyWFdqNk1B?=
 =?utf-8?B?SitwdXhyVk9raHFUZ09OL2s1RU5IVEg2RE85b2hOaFBmQytudlpNVHFEdFJJ?=
 =?utf-8?B?NWU2cjhHc3A2dnRkWUR1T25NVEd1bnA1TWs4QVZDMllXTzlpQ0RGZWE3RUR4?=
 =?utf-8?B?azlBZDZSWVJzbGRHMUhTUU1uakRIYnNVVGk5UVZmUWp1eDdjeFhtcXJpeXJj?=
 =?utf-8?B?RnpSNzVjQVJOMUhhVCtDeUxyOU1VRThOdU83UDdXK1JUWjVtcE5oSmttek81?=
 =?utf-8?B?SCtiM3JCZ3Y4SDFkdWpVdWYreE01OVV3R28ybjl1MGxmY3FCQXZ4TlBnb3Yr?=
 =?utf-8?B?aVdkNWZBbHNnWFpZWW5PMlppN1cxTkcvai9Rc1hEU1JXWEtCRjlubG8xNldp?=
 =?utf-8?B?MlNXRytGTExQdUcxbHJFeThVY0J2U0dmMlZIUVlGRE1jTzllcFZzQktqR1Na?=
 =?utf-8?B?UlRVb2dzU21LU1EwVkxwZEVITDRlQmdiNVA2MjRIMlljVTVXSmIwQW8rRDNZ?=
 =?utf-8?B?VHhaNCtmS0JMSXdiSnFiV3IwYzhwUnJSb2RTOUxocG4zR1VEc0J6RlRoZlVk?=
 =?utf-8?B?Z2lhZzExRS9GaE00VENYZnNMUTRrbjBmVmNYaGtrZVJ6dUpvNXRnWEVtM1Nw?=
 =?utf-8?B?NWNDMld4NEY5RHRCVWFySjNNSU00TnorK3h6L2JnVDlzZ0JScTZlcXdwaWk2?=
 =?utf-8?B?clpMVU93UG42NWdacXhidVZDMzJYT0pxQ2RHT3pHZlFmYkV4dlNnYjlZSDVt?=
 =?utf-8?B?M1luMXAxUVdLR0pMb3BwY3FXZFdIODhOZkZzb290aWczbVg3THc4N3VwaWpP?=
 =?utf-8?B?K2tUelYyU3VsVjQ0dk51MjdwWG90eHNid2RFLzdIR2RmQVRJQU9rV1F1bEQ0?=
 =?utf-8?B?QjJYdEl0UjFweDdNRUJCKzhOcnIzcGYzV2c2UDRFMzNTSVBMWFhXYWpLUzY2?=
 =?utf-8?B?UmthSEZMcEZCTFJPNDk0TXVGbVMzYUhSbmxVMTlVa3lSZVJ4MWxuSTBMRjhR?=
 =?utf-8?B?clo2ZlZiRjRMRm9pMHRmR3crVk5PS2EwK1FxYzFUbEhxQlE0cngvZ3NTdHpn?=
 =?utf-8?B?enFzZGErNzZDS0pUOWpieHlZTmt2YWVMVjJ0UjRxbER5VlMxOUwwYU9RM1ZK?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a44f24-2ac6-4405-1786-08dab3b62342
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 22:46:48.5018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkavMUSfWNj+JfUFE/0Zlzx84K9zD94XeIGdqomzbxVRereXfApDIDmGyGh2CY5xMKexY5/h7MQdOYP2tMRW0+AynDmk/xVhb137GMD5MXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5540
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/21/2022 11:40 AM, Dixit, Ashutosh wrote:
> On Fri, 21 Oct 2022 11:24:42 -0700, Belgaumkar, Vinay wrote:
>>
>> On 10/20/2022 4:36 PM, Dixit, Ashutosh wrote:
>>> On Thu, 20 Oct 2022 13:16:00 -0700, Belgaumkar, Vinay wrote:
>>>> On 10/20/2022 11:33 AM, Dixit, Ashutosh wrote:
>>>>> On Wed, 19 Oct 2022 17:29:44 -0700, Vinay Belgaumkar wrote:
>>>>> Hi Vinay,
>>>>>
>>>>>> Waitboost (when SLPC is enabled) results in a H2G message. This can result
>>>>>> in thousands of messages during a stress test and fill up an already full
>>>>>> CTB. There is no need to request for RP0 if GuC is already requesting the
>>>>>> same.
>>>>> But how are we sure that the freq will remain at RP0 in the future (when
>>>>> the waiting request or any requests which are ahead execute)?
>>>>>
>>>>> In the current waitboost implementation, set_param is sent to GuC ahead of
>>>>> the waiting request to ensure that the freq would be max when this waiting
>>>>> request executed on the GPU and the freq is kept at max till this request
>>>>> retires (considering just one waiting request). How can we ensure this if
>>>>> we don't send the waitboost set_param to GuC?
>>>> There is no way to guarantee the frequency will remain at RP0 till the
>>>> request retires. As a theoretical example, lets say the request boosted
>>>> freq to RP0, but a user changed min freq using sysfs immediately after.
>>> That would be a bug. If waitboost is in progress and in the middle user
>>> changed min freq, I would expect the freq to revert to the new min only
>>> after the waitboost phase was over.
>> The problem here is that GuC is unaware of this "boosting"
>> phenomenon. Setting the min_freq_softlimit as well to boost when we send a
>> boost request might help with this issue.
>>
>>> In any case, I am not referring to this case. Since FW controls the freq
>>> there is nothing preventing FW to change the freq unless we raise min to
>>> max which is what waitboost does.
>> Ok, so maybe the solution here is to check if min_softlimit is already at
>> boost freq, as it tracks the min freq changes. That should take care of
>> server parts automatically as well.
> Correct, yes that would be the right way to do it.

Actually, rethinking, it's not going to work for client GPUs. We cannot 
clobber the min_softlimit as the user may have set it. So, I'll just 
make this change to optimize it for server parts for now.

Thanks,

Vinay.

>
> Thanks.
> --
> Ashutosh
>
>>>> Waitboost is done by a pending request to "hurry" the current requests. If
>>>> GT is already at boost frequency, that purpose is served.
>>> FW can bring the freq down later before the waiting request is scheduled.
>>>> Also, host algorithm already has this optimization as well.
>>> Host turbo is different from SLPC. Host turbo controls the freq algorithm
>>> so it knows freq will not come down till it itself brings the freq
>>> down. Unlike SLPC where FW is controling the freq. Therefore host turbo
>>> doesn't ever need to do a MMIO read but only needs to refer to its own
>>> state (rps->cur_freq etc.).
>> True. Host algorithm has a periodic timer where it updates frequency. Here,
>> it checks num_waiters and sets client_boost every time that is non-zero.
>>>>> I had assumed we'll do this optimization for server parts where min is
>>>>> already RP0 in which case we can completely disable waitboost. But this
>>>>> patch is something else.
>> Hopefully the softlimit changes above will help with client and server.
>>
>> Thanks,
>>
>> Vinay.
>>
>>> Thanks.
>>> --
>>> Ashutosh
>>>
>>>>>> v2: Add the tracing back, and check requested freq
>>>>>> in the worker thread (Tvrtko)
>>>>>> v3: Check requested freq in dec_waiters as well
>>>>>>
>>>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/i915/gt/intel_rps.c         |  3 +++
>>>>>>     drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 14 +++++++++++---
>>>>>>     2 files changed, 14 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>>>> index fc23c562d9b2..18b75cf08d1b 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>>>> @@ -1016,6 +1016,9 @@ void intel_rps_boost(struct i915_request *rq)
>>>>>> 		if (rps_uses_slpc(rps)) {
>>>>>> 			slpc = rps_to_slpc(rps);
>>>>>>
>>>>>> +			GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
>>>>>> +				 rq->fence.context, rq->fence.seqno);
>>>>>> +
>>>>>> 			/* Return if old value is non zero */
>>>>>> 			if (!atomic_fetch_inc(&slpc->num_waiters))
>>>>>> 				schedule_work(&slpc->boost_work);
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>>> index b7cdeec44bd3..9dbdbab1515a 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>>> @@ -227,14 +227,19 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>>>>>     static void slpc_boost_work(struct work_struct *work)
>>>>>>     {
>>>>>> 	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
>>>>>> +	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
>>>>>> 	int err;
>>>>>>
>>>>>> 	/*
>>>>>> 	 * Raise min freq to boost. It's possible that
>>>>>> 	 * this is greater than current max. But it will
>>>>>> 	 * certainly be limited by RP0. An error setting
>>>>>> -	 * the min param is not fatal.
>>>>>> +	 * the min param is not fatal. No need to boost
>>>>>> +	 * if we are already requesting it.
>>>>>> 	 */
>>>>>> +	if (intel_rps_get_requested_frequency(rps) == slpc->boost_freq)
>>>>>> +		return;
>>>>>> +
>>>>>> 	mutex_lock(&slpc->lock);
>>>>>> 	if (atomic_read(&slpc->num_waiters)) {
>>>>>> 		err = slpc_force_min_freq(slpc, slpc->boost_freq);
>>>>>> @@ -728,6 +733,7 @@ int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val)
>>>>>>
>>>>>>     void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
>>>>>>     {
>>>>>> +	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
>>>>>> 	/*
>>>>>> 	 * Return min back to the softlimit.
>>>>>> 	 * This is called during request retire,
>>>>>> @@ -735,8 +741,10 @@ void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
>>>>>> 	 * set_param fails.
>>>>>> 	 */
>>>>>> 	mutex_lock(&slpc->lock);
>>>>>> -	if (atomic_dec_and_test(&slpc->num_waiters))
>>>>>> -		slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
>>>>>> +	if (atomic_dec_and_test(&slpc->num_waiters)) {
>>>>>> +		if (intel_rps_get_requested_frequency(rps) != slpc->min_freq_softlimit)
>>>>>> +			slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
>>>>>> +	}
>>>>>> 	mutex_unlock(&slpc->lock);
>>>>>>     }
>>>>>>
>>>>>> --
>>>>>> 2.35.1
>>>>>>
