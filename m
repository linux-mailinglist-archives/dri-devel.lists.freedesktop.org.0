Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A54CACF9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 19:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13B410E49E;
	Wed,  2 Mar 2022 18:07:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D397210E407;
 Wed,  2 Mar 2022 18:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646244468; x=1677780468;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tS6d+BIFWr6b/fgK6DjhwVctx4hsK5Vpk7JfZGwCq1o=;
 b=ZycBX/etxvKhNWoBDZ523W3qIEmXeOw8ok631bI2m8uZnymE8ugUNf0O
 md/MmaucN3D1A9GwzAVLOPn9v6fZJBW2zPNBIaLyPnrkG0sAYPRpUHBzP
 Vn0psEzJzF2M00C8/gaCKzVbypywyOHG72GrJVdg2zmS1w3x8Cv0+avYO
 uORyuqydxSRnlfsjtK5zSU1ehaqZujsoJVduj7vY/d8VTyrxjq5mEcETs
 kBZ02hHBNaX8ywupEKbYyLSfSDZmjsgxzmok1k1/KHx5O4dlsd5hVKJhn
 OIXwHld3V450Lj3xeZ+GZjFqwoCqEswohJUPBK4N17SKtooh2LvVfsEBs Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253663724"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="253663724"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 10:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="545584805"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga007.fm.intel.com with ESMTP; 02 Mar 2022 10:07:48 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 10:07:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 10:07:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 10:07:47 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 2 Mar 2022 10:07:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nu3TzdlhWZepECYggpVw/xPR+gSczIsetZZTNe554/Vii7UZuMB+nuC8SHNl86kdI93tGCmzTmGUpOCjJEug7iVOZ1FUcDndckXIExfIngFdOLlluz/WIwdilIddGfOyELvGCKWp7sdn5RQ+DqUoPhMYxI+DP8wEFY52QacIbHKvRGWQM7TF2eNNyp9nFpAUeJbPGhAb2a1EUwgX1oZuSEzJhhCr+ZiCoIvL2xsWTs3xHeSY4HRoSgQF6/wBza8HBU//QlLz6SwzfapWp6t6ntWkTjNhCIxWO4ehwRugmUq0+fcg5r/sNTxblYtfMnLbHfVHN4KK0YcUPotrOjxTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZB1Hxi3nte9OOHOXSc6xYH+CfDwTg9Ztw5KS0azelvY=;
 b=k+UxxEDXUIUG73GLREn0PfrxByrMemnos2PHZftDG5ni4Yl4UEgx8Eez+KB8AmDrU1B7AHmJNXHrKsobiMl2Qrv/TGmLBmT2ZHTjWf/4Y+r6ZRgG7l+0cMP3VmdPkl2M0zdCXku/UwOhvhqZcST+Ik2RqN2xQSknzga5sUn1TKTsqJIQ9AfmesBBMwH6/XEzoq/OjE30D7Z+gPN+oabhy2wIPZ89yE6XpfUOQZgy/hct6qKdmXUCJ/hjMMYcxIpH1VDO/vwhYLwg7X39OyLtrgWLjGgaxzozQ31ZjElKrBnV4+c+Qe3TjdflFiAsj+a7QR8cywKDRZ+7Dc6MSzeWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL0PR11MB3249.namprd11.prod.outlook.com (2603:10b6:208:6b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 18:07:44 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 18:07:44 +0000
Message-ID: <68a2f3db-f65c-f6e1-1c21-3b0fd50710f6@intel.com>
Date: Wed, 2 Mar 2022 10:07:41 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
 <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
 <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
 <85105590-a8be-f4e1-69bc-cd34cad108e2@intel.com>
 <16a2687b-4996-8d40-456e-019a112f0fb6@linux.intel.com>
 <c1472196-260a-d2c8-c508-10fe58d4cd47@intel.com>
 <74d30fd4-cb72-113e-fc09-12602b3cf06d@linux.intel.com>
 <986dae97-6c68-34cc-d972-22edaddf7261@intel.com>
 <4e8888d0-f0da-12f3-4010-159b4ff2bdb3@linux.intel.com>
 <fc96ce57-37f7-9962-6d15-1741de9fcd89@intel.com>
 <d931b54e-0b89-877e-9a7f-ede3c3bf165f@linux.intel.com>
 <1b8edddb-f0c4-0ff9-a07e-25e4a496ea4d@intel.com>
 <588709b6-c19d-eb14-dd31-cb6bc0bdb08f@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <588709b6-c19d-eb14-dd31-cb6bc0bdb08f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR22CA0062.namprd22.prod.outlook.com
 (2603:10b6:300:12a::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70d2701d-b178-463c-f032-08d9fc778c89
X-MS-TrafficTypeDiagnostic: BL0PR11MB3249:EE_
X-Microsoft-Antispam-PRVS: <BL0PR11MB3249E4C8E69E3DCE11745D4EBD039@BL0PR11MB3249.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+bdSsK64cfB15bnLNJeGd7XizWe8hNcvkSyfZRNe5ASYTN0mbR9NOXuFsNdOJLhciDfOT9VtesF5vwobaONbLaW6+xjbTIA4i7kx+dx8mp1IzCqBCpzcMEKQ4HjtU5XujNBHTsYLLRh9pNahon0iaLDJfCa7Bi3TxM+Gvh8HWKGJ3pln6OgcixWQOmWETiWqKSkINz5m1s+IeHPz0UbLsQSIeXtFSFYp5SDxFQlnDO5c6vizojk/jsBil29x5KjzzWFcOmcMl299ax5o5Xeg3ylv+Pz5ANYMJksoW0t7IOkwO0r4AlAMXDbJQOb27791Yh3VN+7C8f7NaFCcmj0F9MSBcg5iFJ1B3/trhxlJ8Qx8pA+CrBSEJF+hNc56mtgkzll7Li2qhfHaEcncN36T6JD/PDdbyl0CvzzgGgEUXTIetkcMtFQhSNwPgQlBgRsDlWmQzmFXh5agF4x1shYNpuxjrYP7r6nAtbZYgzcyoPHcqFtvfsgiC+7x8Vgr7EuezaPQjkXwPe36xdMvpF7jo00fjMALIb80YEYWj3mE6LKsAIPUsFP3wRAZhrxv+7/UjMrjCLeHmW13r1vAtGy2qw01q3GjRol5z6EQtYsBqiIEHL9GOGJHd5rC6c5ZJd4o8OdyvElACfZV9s5hvEy/zv9iQxTkuGTpMnYIJiysJltXOOiEeW7eLGcriYXPpvjH0kvJDvlITjnUEeavMYO56Ng2djZD1DkdCH6Y0jJZPTcTib57QdmY1L0C97xq+i9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(36756003)(6486002)(53546011)(508600001)(8676002)(83380400001)(316002)(31686004)(66946007)(66476007)(66556008)(4326008)(5660300002)(82960400001)(31696002)(8936002)(2906002)(86362001)(26005)(186003)(30864003)(2616005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2hYdTM4Z1dvTTgzVEIzNmxmOURGNEIyK00yN3NwMXlUS2k2VGJBTGtCcnBa?=
 =?utf-8?B?eG0zT2ZrQi8yVEZ6SUl2Rzk1K2dDb0xObExlVnovdHh4WUdOcVZHYVNpbU9h?=
 =?utf-8?B?cVlwUmthZjdMc3MrYnZVMFhxK3k1MEFiV1Z6U1o0Rk9ENlg4emd1VzB3YU5B?=
 =?utf-8?B?NUZxZzR1TmlsODlKL0hUUXZxdXRJbjNPaXNYOVM0bDlqUnppMHZaMnlnY3dr?=
 =?utf-8?B?b1h6L3U5UlVzOGdvVUlZandPay9VS0I5RWsyRHRsR2tJa09NRXhaUThJVDd1?=
 =?utf-8?B?empjVFZtN01iOWlMaVl6N2hKa1gxVlg1QkMxWmV5NXlTVFdNeVg4TjcwWW8r?=
 =?utf-8?B?bVlXSWYwb0xaVkl3NzNnTGg0eFZROG9mYlE1NkhId05FQ0NlZkV4dmcvN0pS?=
 =?utf-8?B?WEVsSW02VVVhWUt0SVMvTG95NWI2RXJQRkRjd1pEOUtCZnFQSWluZ1ZCamhy?=
 =?utf-8?B?L1EzVzU1T0tvQnZaUEp3LzVVMlhyWDhrSGV5NHVUWk5VZktnU21rNEZhcHA5?=
 =?utf-8?B?alJDb3JaMmZUVDIvaU5IVWd0VEQzWTBjcStrRTYxdFdOaVF6cGpDdWtEYnA0?=
 =?utf-8?B?MDZ5ZmVZV2w0Tkh5N3dLKytOcFY4WmJvbWZ4QnpHRnI3dDl6TzVMRnpGVlRT?=
 =?utf-8?B?VDVOSnVSNW1IdkpLdHFoRGVNNUY0ckl2N1lodnRxZ3ZMcURZeWRxTDlSWTlv?=
 =?utf-8?B?VWtJTVRvSExSOGNBQzNxc3NjWTlyS3NNTDlrUHU1bU1jeGdEemhOckRJWWtt?=
 =?utf-8?B?TFZxa1JGblgvNENWdXdjL2NOaytURlJQa1FpVU5YTGorNnpQdTlOSGJLWTVD?=
 =?utf-8?B?UUZGK05jdG8rTXlpSWIzc29FRUcrUkRJVlBiSnQ1MHFSWEVNQ0E2VStpM1lY?=
 =?utf-8?B?c1hVREczNjIwTURRejgybGt5dk9hbDU0WjJ3eFZHMXpvcmVrWjhwdVI4Q01I?=
 =?utf-8?B?dWVVT3k2bkJGTE5ja3ZNU1lFV0MvKy80Z3I3K3c1NHVzU3Y2eXdDaU5wVWxZ?=
 =?utf-8?B?MjlLeFd2blRTTFNOT2MyazdRb1VhbXZOYXRPbHVRMFVPZ0JGdUtuenViNzd0?=
 =?utf-8?B?QVprUUhYd0o1Si9BZ3Y2ZE9NdVVxVjFXcXFGTXhacDJkRVVHOWpvYjVjVjI2?=
 =?utf-8?B?R01qVUZ0VlRKeE9VdmdldVl4Q1JUaVNYQ0dUWlJLWTFPZlZIWXM4bmh5Nklw?=
 =?utf-8?B?aFRBemxtempSdGJ1ZTh2bzlSZU9SRVcrZS9ZVEJMZzRkQWROZkJBeGJxT0dY?=
 =?utf-8?B?dXFjNTNyZ2tVTWc5cmNDaG9qNlJzTGVMRGFvSGM4RUhPZURZcHlqaVdQdElM?=
 =?utf-8?B?V0xRWFhtWGJMQjNhZGZ6aCtDVTA0Nkx4Q2RJenVabUQwdWVybHA4SndEZWs1?=
 =?utf-8?B?UVYyRzhMWC9FRkJIT0IvcW9tMUdSZDZvTGxiU0xMNWRuNGg0eHVqNjk5SWhX?=
 =?utf-8?B?UXJneS9KTXc5WVU3d25IV012Z2hkMkNSQWN5b3NhNi9FTTYwdTZkK3h5T2ZV?=
 =?utf-8?B?eHBPTzNqVC9pZk1xdDg5VmtSNmdPaklUV0NXM0E2QVF0K1R1ZHZwWGI2VUhk?=
 =?utf-8?B?MDEzeFRMRHBYdUhDYXc2VzBnSWE5emVaKy83emJmOFYyR3loN2ZEN2tkcEJs?=
 =?utf-8?B?LzNzUyt1Z0tLYjlzbHhqN2VXd2FwMzhsU2NhQXpYY2tLM2RxaTdqalAzdjNt?=
 =?utf-8?B?eUQ0cW9pdFNNQXd2UDBYRVI0UHFHV3cwZFFqV2ltSHhLdmRpcGQzdTgrZEZN?=
 =?utf-8?B?dHRqUHlHY3lkMmZJT01rYjkyaXdIWkY0SUR0NXVLTDA1WFJRZmhwaWRPWkww?=
 =?utf-8?B?SitsOS9RYXhKaURLVDN6VjFmTWlQRXhPQlZHUlk3YkljejJuTkljZHhHVzN0?=
 =?utf-8?B?TW9sUnRoY0tWTkxFUUhEVE5QZXlyQVd2VXhzc1diVHNFNXlubHhIK2ZoQ2cw?=
 =?utf-8?B?R3hBQ0xFRFc4YlJYbUVhWUhxSmpqdjFCaDIvNVNURjZ5ZlFmTG1IakdmNng4?=
 =?utf-8?B?V3JKQnN3SGMxdFhvV3VPSjZUQjJCamtXRXVma1RReE5Zc0kybTY2VWtvUG8w?=
 =?utf-8?B?MDdyWGE2UnRmdDV1dklrcjBRN0Y2alR4NjNWalJGOHJaSmxDS3ZoS2xxd0JO?=
 =?utf-8?B?MmE0K05ScWZCSVd3eUh1TVdLOWNKckdhTVBoZTRNWkd3T25QSDNFaTF0L25H?=
 =?utf-8?B?NUZIUlhiMVZ5UzcvWnd6ZFVFNWVZbmdaZW5MZ2crT2paNGVZVWRoZkkwTEhC?=
 =?utf-8?Q?VvT7ZMdzN7ToEeO+jMSxhD4HUimS9R19lVTjWeA+GA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d2701d-b178-463c-f032-08d9fc778c89
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 18:07:44.0824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLrKUKAbcUznUEyGSRGp6be3Hqomfu0cY9e6u8zZ5fKf+AYWoJa8hhMCQk0ouKsgRGFHsI267PQDF4dyfbnxq3P4vBufAP7mfUAUAegebGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3249
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/2/2022 01:20, Tvrtko Ursulin wrote:
> On 01/03/2022 19:57, John Harrison wrote:
>> On 3/1/2022 02:50, Tvrtko Ursulin wrote:
>>> On 28/02/2022 18:32, John Harrison wrote:
>>>> On 2/28/2022 08:11, Tvrtko Ursulin wrote:
>>>>> On 25/02/2022 17:39, John Harrison wrote:
>>>>>> On 2/25/2022 09:06, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> On 24/02/2022 19:19, John Harrison wrote:
>>>>>>>
>>>>>>> [snip]
>>>>>>>
>>>>>>>>>>>>> ./gt/uc/intel_guc_fwif.h: u32 execution_quantum;
>>>>>>>>>>>>>
>>>>>>>>>>>>> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
>>>>>>>>>>>>> engine->props.timeslice_duration_ms * 1000;
>>>>>>>>>>>>>
>>>>>>>>>>>>> ./gt/intel_engine_types.h: unsigned long 
>>>>>>>>>>>>> timeslice_duration_ms;
>>>>>>>>>>>>>
>>>>>>>>>>>>> timeslice_store/preempt_timeout_store:
>>>>>>>>>>>>> err = kstrtoull(buf, 0, &duration);
>>>>>>>>>>>>>
>>>>>>>>>>>>> So both kconfig and sysfs can already overflow GuC, not 
>>>>>>>>>>>>> only because of tick conversion internally but because at 
>>>>>>>>>>>>> backend level nothing was done for assigning 64-bit into 
>>>>>>>>>>>>> 32-bit. Or I failed to find where it is handled.
>>>>>>>>>>>> That's why I'm adding this range check to make sure we 
>>>>>>>>>>>> don't allow overflows.
>>>>>>>>>>>
>>>>>>>>>>> Yes and no, this fixes it, but the first bug was not only 
>>>>>>>>>>> due GuC internal tick conversion. It was present ever since 
>>>>>>>>>>> the u64 from i915 was shoved into u32 sent to GuC. So even 
>>>>>>>>>>> if GuC used the value without additional multiplication, bug 
>>>>>>>>>>> was be there. My point being when GuC backend was added 
>>>>>>>>>>> timeout_ms values should have been limited/clamped to 
>>>>>>>>>>> U32_MAX. The tick discovery is additional limit on top.
>>>>>>>>>> I'm not disagreeing. I'm just saying that the truncation 
>>>>>>>>>> wasn't noticed until I actually tried using very long 
>>>>>>>>>> timeouts to debug a particular problem. Now that it is 
>>>>>>>>>> noticed, we need some method of range checking and this 
>>>>>>>>>> simple clamp solves all the truncation problems.
>>>>>>>>>
>>>>>>>>> Agreed in principle, just please mention in the commit message 
>>>>>>>>> all aspects of the problem.
>>>>>>>>>
>>>>>>>>> I think we can get away without a Fixes: tag since it requires 
>>>>>>>>> user fiddling to break things in unexpected ways.
>>>>>>>>>
>>>>>>>>> I would though put in a code a clamping which expresses both, 
>>>>>>>>> something like min(u32, ..GUC LIMIT..). So the full story is 
>>>>>>>>> documented forever. Or "if > u32 || > ..GUC LIMIT..) return 
>>>>>>>>> -EINVAL". Just in case GuC limit one day changes but u32 
>>>>>>>>> stays. Perhaps internal ticks go away or anything and we are 
>>>>>>>>> left with plain 1:1 millisecond relationship.
>>>>>>>> Can certainly add a comment along the lines of "GuC API only 
>>>>>>>> takes a 32bit field but that is further reduced to GUC_LIMIT 
>>>>>>>> due to internal calculations which would otherwise overflow".
>>>>>>>>
>>>>>>>> But if the GuC limit is > u32 then, by definition, that means 
>>>>>>>> the GuC API has changed to take a u64 instead of a u32. So 
>>>>>>>> there will no u32 truncation any more. So I'm not seeing a need 
>>>>>>>> to explicitly test the integer size when the value check covers 
>>>>>>>> that.
>>>>>>>
>>>>>>> Hmm I was thinking if the internal conversion in the GuC fw 
>>>>>>> changes so that GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS goes above 
>>>>>>> u32, then to be extra safe by documenting in code there is the 
>>>>>>> additional limit of the data structure field. Say the field was 
>>>>>>> changed to take some unit larger than a millisecond. Then the 
>>>>>>> check against the GuC MAX limit define would not be enough, 
>>>>>>> unless that would account both for internal implementation and 
>>>>>>> u32 in the protocol. Maybe that is overdefensive but I don't see 
>>>>>>> that it harms. 50-50, but it's do it once and forget so I'd do it.
>>>>>> Huh?
>>>>>>
>>>>>> How can the limit be greater than a u32 if the interface only 
>>>>>> takes a u32? By definition the limit would be clamped to u32 size.
>>>>>>
>>>>>> If you mean that the GuC policy is in different units and those 
>>>>>> units might not overflow but ms units do, then actually that is 
>>>>>> already the case. The GuC works in us not ms. That's part of why 
>>>>>> the wrap around is so low, we have to multiply by 1000 before 
>>>>>> sending to GuC. However, that is actually irrelevant because the 
>>>>>> comparison is being done on the i915 side in i915's units. We 
>>>>>> have to scale the GuC limit to match what i915 is using. And the 
>>>>>> i915 side is u64 so if the scaling to i915 numbers overflows a 
>>>>>> u32 then who cares because that comparison can be done at 64 bits 
>>>>>> wide.
>>>>>>
>>>>>> If the units change then that is a backwards breaking API change 
>>>>>> that will require a manual driver code update. You can't just 
>>>>>> recompile with a new header and magically get an ms to us or ms 
>>>>>> to s conversion in your a = b assignment. The code will need to 
>>>>>> be changed to do the new unit conversion (note we already convert 
>>>>>> from ms to us, the GuC API is all expressed in us). And that code 
>>>>>> change will mean having to revisit any and all scaling, type 
>>>>>> conversions, etc. I.e. any pre-existing checks will not 
>>>>>> necessarily be valid and will need to be re-visted anyway. But as 
>>>>>> above, any scaling to GuC units has to be incorporated into the 
>>>>>> limit already because otherwise the limit would not fit in the 
>>>>>> GuC's own API.
>>>>>
>>>>> Yes I get that, I was just worried that u32 field in the protocol 
>>>>> and GUC_POLICY_MAX_EXEC_QUANTUM_MS defines are separate in the 
>>>>> source code and then how to protect against forgetting to update 
>>>>> both in sync.
>>>>>
>>>>> Like if the protocol was changed to take nanoseconds, and firmware 
>>>>> implementation changed to support the full range, but define 
>>>>> left/forgotten at 100s. That would then overflow u32.
>>>> Huh? If the API was updated to 'support the full range' then how 
>>>> can you get overflow by forgetting to update the limit? You could 
>>>> get unnecessary clamping, which hopefully would be noticed by 
>>>> whoever is testing the new API and/or whoever requested the change. 
>>>> But you can't get u32 overflow errors if all the code has been 
>>>> updated to u64.
>>>
>>> 1)
>>> Change the protocol so that "u32 desc->execution_quantum" now takes 
>>> nano seconds.
>>>
>>> This now makes the maximum time 4.29.. seconds.
>> You seriously think this is likely to happen?
>>
>> That the GuC people would force an API change on us that is 
>> completely backwards from what we have been asking? And that such a 
>> massive backwards step would not get implemented correctly because 
>> someone didn't notice just how huge an impact it was?
>
> I don't know what we have been asking or what GuC people would do.
Despite the views of some in the community, the GuC team are not evil 
monsters out for world domination. We are their customers and their task 
is to provide a usable offload device that makes the Linux experience 
better not worse.

Just from this discussion alone, ignoring any internal forums, it has 
been made clear that the (long standing) request from the i915 team is 
to support 64bit policy values and (more recently) to officially 
document any and all limits involved in the policies. By definition, 
that also means that there would be significant push back and argument 
if the GuC team proposed making this interface worse.

>
>>> 2)
>>> Forget to update GUC_POLICY_MAX_EXEC_QUANTUM_MS from 100s, since for 
>>> instance that part at that point still not part of the interface 
>>> contract.
>> There is zero chance of the us -> ns change occurring in the 
>> foreseeable future whereas the expectation is to have the limits be 
>> part of the spec in the next firmware release. So this scenario is 
>> just not going to happen. And as above, it would be such a big change 
>> with such a huge amount of push back and discussion going on that it 
>> would be impossible for the limit update to be missed/forgotten.
>>
>>>
>>> 3)
>>> User passes in 5 seconds.
>>>
>>> Clamping check says all is good.
>>>
>>> "engine->props.timeslice_duration_ms > GUC_POLICY_MAX_EXEC_QUANTUM_MS"
>>>
>>> 4)
>>>
>>> Assignment was updated:
>>>
>>> gt/uc/intel_guc_submission.c:
>>>
>>>   desc->execution_quantum = engine->props.timeslice_duration_ms * 1e6;
>>>
>>> But someone did not realize field is u32.
>>>
>>>   desc->execution_quantum = engine->props.timeslice_duration_ms * 1e6;
>>>
>>> Defensive solution:
>>>
>>>   if (overflows_type(engine->props.timeslice_duration_ms * 1e6, 
>>> desc->execution_quantum))
>>>     drm_WARN_ON...
>>
>> All you are saying is that bugs can happen. The above is just one 
>> more place to have a bug.
>>
>> The purpose of the limit is to take into account all reasons for 
>> there being a limit. Having a bunch of different tests that are all 
>> testing the same thing is pointless.
>
> I am saying this:
>
> 1)
> The code I pointed out is a boundary layer between two components 
> which have independent design and development teams.
>
> 2)
> The limit in question is currently not explicitly defined by the 
> interface provider.
>
> 3)
> The limit in question is also implicitly defined by the hidden 
> internal firmware implementation details not relating to the units of 
> the interface.
>
> 4)
> The source code location of the clamping check is far away (different 
> file, different layer) from the assignment to the interface data 
> structure.
>
> From this it sounds plausible to me to have the check at the 
> assignment site and don't have to think about it further.
It also sounds plausible to use the concept of consolidation. Rather 
than scattering random different limit tests in random different places, 
it all goes into a single helper function that can be used at the top 
level and report any range issues before you get to the lower levels 
where errors might not be allowed. This was your own feedback (and is 
currently implemented in the v2 post).

John.

>
> Regards,
>
> Tvrtko

