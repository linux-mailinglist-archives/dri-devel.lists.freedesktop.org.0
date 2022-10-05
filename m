Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F75F5A16
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 20:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CD710E751;
	Wed,  5 Oct 2022 18:48:17 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8502210E751;
 Wed,  5 Oct 2022 18:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664995694; x=1696531694;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pwgOF+FtAoK2iRcWKE4DoqaFHaH/XkGxURPHzIQww0o=;
 b=iDsVkizOuBtp93hcgwIZGGwiJuYu/htDwCGtJ3mXY0yq/3KVL6LH4KG9
 8ZNlmaBxicgtDpotpE2y/NNkrAI7S+VxHX78Gbm2KxRzv3wxCQQ6jdyDD
 z7dUN7UQZamwp1wqFxMwWX4ASdCtTYXmyX3z/a94aA4EVbqvKuJgGUTKU
 CgPm43DRpSJA5FeI7L+kAekINrSDY8gYRzTt+mtW8o5Wxop3BWfhmqxzs
 7YDgOV2f4OPLFYWVKQIbgORx+pPg9KVOwuUK5Efmwd5ep2oFP5CHrKsot
 bpLWESdQ0C5cWQ6gexiQlIn/S4gTPjAS7AktwJDq0bMYf1y3kx+o6Kld+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="286469293"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="286469293"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 11:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="655277013"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="655277013"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 05 Oct 2022 11:48:13 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 5 Oct 2022 11:48:13 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 5 Oct 2022 11:48:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 5 Oct 2022 11:48:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 5 Oct 2022 11:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTCB54+bAWnzhFW//19ZOV/DphfnBwt8KCU9esSA44VCWBD57KgImcgrRYeTtv9JRC5hR6IUiacfI9y4tes9hDlOrBl0oIpREBElFbhTeYS2zbnVu4WieDfjVf9FSl5OHqlKRFNIFWo/fT2CvXSVopQMverolejnTpk2iIWDOBvqUrKul38vNw4FTSxH7+ZwWXyMh9rs6/0QNVMgQ3z7bm0ldVTkSNwKXUjRoU2KzqiIRFijd8+Wl6XQl5PXp3xkst2/M/mHefCrAiIg/MHwJ8uABSyXUY4+z4bGYw+/egO3oaDNFQU2VZEZx0NRyKukyCdCnET+Ph8f+T2ZoA9ItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+xY7HcqgAq6Vkbs7PpNJeoUFIlivpVGZ5gwGAJzEQw=;
 b=H+TzAF33do3VQR9sRwtjP1+9P56OvKWwR4PsGwxzsE+dK9QsmER4Z0fE4a00dMT0yMZPJNvk4O9odgFG8OCSoudmHU8Gwtkq9RHRTc+zRR8eKYhN5r2kacTFE1F6X1NmGG/DOkh5niQOREXvpViFoghWWbeW3+6fR4OJ41wHvBFdgwi4P93yEIdAYl2GwN8mMyRf3dwP+n8ukyWtKtmfhwk0PjqNYzBdmHm3y/+RLtT7TNnNdoIqW2wLXb3OrB7CK1Hs8Z4I6oGomK8GnGGcxjP6OrtjZspR3lFBH58eVAb8ikJDvPFUPGhGZcfM9NP178MbEcGCBzXVC4lAzJ3coQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5460.namprd11.prod.outlook.com (2603:10b6:610:d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 18:48:09 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6%7]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 18:48:09 +0000
Message-ID: <4cfc1d07-9197-ed5d-52b2-db63490416f9@intel.com>
Date: Wed, 5 Oct 2022 11:48:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v4 3/4] drm/i915: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
 <20220929021813.2172701-4-John.C.Harrison@Intel.com>
 <a2c2cddf-009b-a2e0-2af2-6f1553c59cbc@linux.intel.com>
 <ae042c9d-f6f1-2ecd-e23a-7d6994c97151@intel.com>
 <28690581-b934-b99f-feb9-78a8e6c2d052@linux.intel.com>
 <89566262-2cd0-f456-e8b2-c7bc6ad6fe36@intel.com>
 <c61d540a-9b3a-76f5-2641-c508a6e2bcbd@linux.intel.com>
 <0e29ab23-4304-bd62-7065-4d1ab3a1461a@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <0e29ab23-4304-bd62-7065-4d1ab3a1461a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH0PR11MB5460:EE_
X-MS-Office365-Filtering-Correlation-Id: 150076c3-9555-45d5-a9ba-08daa70225db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJ4TxzQd5OcNY8yBgQpyMbHca+rOAQKdN543AWcyzwaMnEh4OpUR169NgP/dGK2v4oENuWd2fUlje20KZZNf/3rFZy+ckY4eIH8SKoN+4pXqI44QIG2YInNJIfBpKRqk9kqaFbjtClU9eNYw4rE/a9qDAeKwmxefxgfz3eScIlIPypR/ocMcYvpqBRmRc4yggmjbTY/RMLAyCb1bcGGqKzQ4yEwKc+o2Bxpy9HNo0TGzgIIpRBlGuC/YbNsz0AfLa78F3CUX7zy3zrn7ADoojX1ibr7dAPyWZfniYyxVnyhe+09veuZoN0AujbCcw/MyvnUqdrZAaTLmZ0nlbMYWItc760U4sYtRjjDJ+H1qbjURKi/w7A5mmbgU1WoJ+twy0YAG+PdEbKSaiHK4b+CouOr5YA7LuV+ebh0yosUAQLs8NONsP6lDveZAHXJJ05lgtXar7JNJCyXoGfQg/lNgDSu597O4mPpbrAGB48KCAUxIkd2MIbu6YEjRgjfGf4KDA+Kh+qZ/hwiSojKS67ywSLohoz62WUSkrkcJRfyj3kgFBLQOIdftR2V/+9fBcMXDRb6N/7sG6yf0I1pWJtHmdId5fNhdvm42mWigAKNE4iUswUopoIXpzoqrlGyWzqV5TkH4KJu3cnLv7HVJisOq6zlqo5EoFE/iDTlPC9M/t43J4ABHbVI/5qICOm80k1C2+nfx7uc+SfKpmBkw5mZu3SL2pYzk/Y+7UwnEvN0yMz/XFrZbUWI/IWSqOUAj+PGfxN32n9hcjc8i9Ib0I5FBwVm9DQsUDw1ge5HUAVPmk1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199015)(6506007)(478600001)(41300700001)(4326008)(66946007)(6486002)(8676002)(66476007)(66556008)(6666004)(316002)(36756003)(82960400001)(83380400001)(6512007)(38100700002)(53546011)(31696002)(5660300002)(8936002)(26005)(86362001)(2906002)(2616005)(186003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnVkdjVKNzEzdFRreWlZSVk3REU3eTMyaGtzTGp3S3B1dUo5MUVveTlLajA3?=
 =?utf-8?B?bEI4TDR6VDk1S0RpMzEycEhMV3cxcDJlVFNVdE5HMFU5VWk3aVZGKytMVkti?=
 =?utf-8?B?RkJSVkJ4MDRYR2VYTS9GMlNwYlhaQ0ZCYTRZS0pCdXdOV2Y1VFIwZitmSWxj?=
 =?utf-8?B?YXVZNGRpZyt3a1JqVGlxUURHMmt1TG5RYnkrbndyenkxdDV0K3FBUmpPNFlX?=
 =?utf-8?B?em5EY1B3cHBGclYvcGlLRzQ0cFFGc2djT0V0R0p4dnpBcS9NWXVqRm0xSWFX?=
 =?utf-8?B?WDBETXhNdnRKOEhmS1NRZGVFcUxuMWF2Y1cvMGNOR21lS2thdG51WGljdkVl?=
 =?utf-8?B?cUZKcnh1WW5hbDdOd1FFUFpIckhFUjZoQmtlNnFQSC83T0ZrNTI2RWJKbUxF?=
 =?utf-8?B?SjB6bVZ1Mm5KcC9wcUFZNTZubzJPcUhqRENNellhZ0FqSEJmcGkxVTYwcUc2?=
 =?utf-8?B?NzdGeWUvT3VXbS9JWTY2TFBFWks1dXJVVmJ4ZGNDcmFTNCt0cHQrRWZHdGJu?=
 =?utf-8?B?OGNhSnVLUEppbVh3MExQZVZmakdtNitmbkFJcWhmaEZVTWZRcWRxbC80VmJa?=
 =?utf-8?B?dnNLZ2g4Y0FXY1o0NVdRVzF3VlZlVHg0M3dNVmpnU3lZS1lZYlJ5c2Vrd2tZ?=
 =?utf-8?B?blE5OWthSnFORHNONVJXVmg3Uk51bUh0MHpScGlkb0drb3F3UVp1RzR5SE9O?=
 =?utf-8?B?RkdrUmlJdnpPNEFCQ2l1K0JpK251VVlCKzMrZGpOSWt6bk9lYzVTcUh1N1F1?=
 =?utf-8?B?YlUyYktITi9jWlYwVkdrS093WlJsTUswMTJ1ZnJkV3BFN202ZnM0NXBxclVM?=
 =?utf-8?B?VXZKcnArcTJRbWFjcWZRclBtbHJFUktmUkMwYzFMTllzeVBKbzNPcFhwVDMx?=
 =?utf-8?B?UU5Dc1F3MWhVWGpPVkhmY3RWWlJPQlU5elo4bnkycy9WYXFieC9xNTM5Y0RN?=
 =?utf-8?B?WGUySnlYaDRxaHZjcmdidWVqcWtKNmI2YkZKejBZL1oza3BLRVFDSWNEWXlY?=
 =?utf-8?B?UTBqUW5mdlNGdm9sWXZCai9CRXE3V3hrOExkdkhnSkw5S3VqV08zUWtWdVpn?=
 =?utf-8?B?RWFha1RpQkpqc1VKcG5md1llVkRTL0lLUTM1TEttVkJQQXB2VitXRmhlV1F5?=
 =?utf-8?B?VUcvb05QTjArQzFxMDl4SXVTWGtQOFc0R0tPSFFXVDUwUG93bEtNZ0RwTzVp?=
 =?utf-8?B?bHR6bFF0WlVLeFQ5VG15THI4a0Nwc3ZyZVgrVnZxRS9EYUVXVG9qZWdWTFZX?=
 =?utf-8?B?d2c2MEdaSWs2UjV3NWk5cVhFVTVoTW1FM1VreFVQbzVPNldTdDJ6cXV3NFgz?=
 =?utf-8?B?YS9wMDdoR21GdjFRZTJQNVE5SllFQlJKK0creHI4RUdXZ3ZibzhBdmhib1pQ?=
 =?utf-8?B?TVR1aEdFUjlEajlTZmxKUjRDKy8ybk1sRmVTMDNJank5cDQ3cTAyYUM5NW1R?=
 =?utf-8?B?bDY0VXlVeUcvS1NDdC9rM2VjSjFLMkJXSnBka082QmE1dDJ5eEo5aEZlQzRu?=
 =?utf-8?B?NDU3RWZrZWlJZlNNRWFWWlhuYmY5eVZjdXJSaEF1dzczQ0VpVWtKeFV3NkZF?=
 =?utf-8?B?eVdxdTg5ZnFhKzQrbjVQaWZ3OFhuWWtZTmFVODkrdFVQY3dXK0IyOGhlT3h5?=
 =?utf-8?B?RmhsZzhsbzNUdTJ5ZVM1L0xIczNVYjlyZXVPNU5LL0krd25FeUhjR0xnWU54?=
 =?utf-8?B?T1F4TVZjdjU3VUJJcFFYaVo5TVMvVXl0bnNJNlRUdVl0RHZROWs4MlZyZzNF?=
 =?utf-8?B?WVFCWC9kZ093WEpYTGhFbW5YYU5PTzkwTklqOXVEVFplU2xmekpqWXRPNmk3?=
 =?utf-8?B?c3VpSmgxQVJkZTVyYjJ3eW9qMnExRzJaOWdIUG1uc2lCRGM0c1hyYSt0T0FS?=
 =?utf-8?B?T1hXSUlCN2NIR2huUUhPRHFBYW1LM2h4RUgyR3p6WjBLTjlCb0M5VEpocVV6?=
 =?utf-8?B?Z3hzaUN5bDZoMG91ZGxpdkdwQlNLenRrWXQySm5hNFBXWVBUbVp3REZJYVNa?=
 =?utf-8?B?QUd2QkpOQVRJTlpKSDRndGxZRmVFUlFBVFZDY2hickhiV3phVklWZWtjRDBC?=
 =?utf-8?B?eThkaHliMlk5NmhjZVp1T21vNnFsUDJPL04yU2Q5N0ZtM0RLQktvZjNBa200?=
 =?utf-8?B?aEdJakdKcE9UZGk0cTJoVnlES3FJZVIxeTFJcUFoeWU3eUhwSWRPczVCOEF2?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 150076c3-9555-45d5-a9ba-08daa70225db
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 18:48:09.4209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIaPj1sxLj5xvMlwqASS3BE+v6d4rz2LSPH1YUMbkFfeG1azkRHZcnEKu75fa/f1S0aC93NRYI25EHiKZO0dxvqeNdE4ZUDdcLpz4tbHSog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5460
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

On 10/3/2022 05:00, Tvrtko Ursulin wrote:
> On 03/10/2022 08:53, Tvrtko Ursulin wrote:
>> On 30/09/2022 18:44, John Harrison wrote:
>>> On 9/30/2022 02:22, Tvrtko Ursulin wrote:
>>>> On 29/09/2022 17:21, John Harrison wrote:
>>>>> On 9/29/2022 00:42, Tvrtko Ursulin wrote:
>>>>>> On 29/09/2022 03:18, John.C.Harrison@Intel.com wrote:
>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>
>>>>>>> Compute workloads are inherently not pre-emptible for long 
>>>>>>> periods on
>>>>>>> current hardware. As a workaround for this, the pre-emption timeout
>>>>>>> for compute capable engines was disabled. This is undesirable 
>>>>>>> with GuC
>>>>>>> submission as it prevents per engine reset of hung contexts. 
>>>>>>> Hence the
>>>>>>> next patch will re-enable the timeout but bumped up by an order of
>>>>>>> magnitude.
>>>>>>>
>>>>>>> However, the heartbeat might not respect that. Depending upon 
>>>>>>> current
>>>>>>> activity, a pre-emption to the heartbeat pulse might not even be
>>>>>>> attempted until the last heartbeat period. Which means that only 
>>>>>>> one
>>>>>>> period is granted for the pre-emption to occur. With the aforesaid
>>>>>>> bump, the pre-emption timeout could be significantly larger than 
>>>>>>> this
>>>>>>> heartbeat period.
>>>>>>>
>>>>>>> So adjust the heartbeat code to take the pre-emption timeout into
>>>>>>> account. When it reaches the final (high priority) period, it now
>>>>>>> ensures the delay before hitting reset is bigger than the 
>>>>>>> pre-emption
>>>>>>> timeout.
>>>>>>>
>>>>>>> v2: Fix for selftests which adjust the heartbeat period manually.
>>>>>>>
>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>> ---
>>>>>>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 19 
>>>>>>> +++++++++++++++++++
>>>>>>>   1 file changed, 19 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c 
>>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>>>>> index a3698f611f457..823a790a0e2ae 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>>>>> @@ -22,9 +22,28 @@
>>>>>>>     static bool next_heartbeat(struct intel_engine_cs *engine)
>>>>>>>   {
>>>>>>> +    struct i915_request *rq;
>>>>>>>       long delay;
>>>>>>>         delay = READ_ONCE(engine->props.heartbeat_interval_ms);
>>>>>>> +
>>>>>>> +    rq = engine->heartbeat.systole;
>>>>>>> +
>>>>>>> +    if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER &&
>>>>>>> +        delay == engine->defaults.heartbeat_interval_ms) {
>>>>>>
>>>>>> Maybe I forgot but what is the reason for the check against the 
>>>>>> default heartbeat interval?
>>>>> That's the 'v2: fix for selftests that manually adjust the 
>>>>> heartbeat'. If something (or someone) has explicitly set an 
>>>>> override of the heartbeat then it has to be assumed that they know 
>>>>> what they are doing, and if things don't work any more that's 
>>>>> their problem. But if we don't respect their override then they 
>>>>> won't get the timings they expect and the selftest will fail.
>>>>
>>>> Isn't this a bit too strict for the non-selftest case? If the new 
>>>> concept is extending the last pulse to guarantee preemption, then I 
>>>> think we could allow tweaking of the heartbeat period. Like what if 
>>>> user wants 1s, or 10s instead of 2.5s - why would that need to 
>>>> break the improvement from this patch?
>>> Then the user is back to where they were before this patch.
>>>
>>>>
>>>> In what ways selftests fail? Are they trying to guess time to reset 
>>>> based on the hearbeat period set? If so perhaps add a helper to 
>>>> query it based on the last pulse extension.
>>>
>>> I don't recall. It was six months ago when I was actually working on 
>>> this. And right now I do not have the time to go back and re-run all 
>>> the testing and re-write a bunch of self tests with whole new 
>>> helpers and algorithms and whatever else might be necessary to 
>>> polish this to perfection. And in the meantime, all the existing 
>>> issues are still present - there is no range checking on any of this 
>>> stuff, it is very possible for a driver with default settings to 
>>> break a legal workload because the heartbeat and pre-emption are 
>>> fighting with each other, we don't even have per engine resets 
>>> enabled, etc.
>>>
>>> Maybe it could be even better with a follow up patch. Feel free to 
>>> do that. But as it stands, this patch set significantly improves the 
>>> situation without making anything worse.
>>
>> As we seem to be in agreement that the check against default 
>> heartbeat is a hack with only purpose to work around assumptions made 
>> by selftests, then please file a Jira about removing it (this hack). 
>> Then work can be assigned to someone to clean it up. With that done I 
>> would agree the series is indeed an improvement and it would have my 
>> ack.
VLK-39595

>
> One more thing - put a comment in the code along the lines of 
> "FIXME/HACK: Work around selftests assumptions by only extending the 
> last heartbeat if the period is at default value". The the Jira can 
> associate to that comment.
>
> Until that is resolve it may also be worth emitting a drm_notice if 
> heartbeat is changed via sysfs? Informing users the things will not 
> work as expected if they fiddle with it. Whether as a blanket warning 
> or checking first the 3-4x heartbeat vs preempt timeout value. That 
> message should then go away once the follow up work to fix the 
> selftests is done. See what the other reviewers will think.
>
What should the drm_notice say? How can you describe to an innocent end 
user what the symptoms might be in a single, concise line rather than 
the huge email thread that it took to explain to you, an experienced 
i915 kernel developer?

Is there a single end user out there that actually uses the sysfs 
interface for tuning these parameters? AFAIK, the usage is 99.999% IGT, 
the rest is internal developers debugging problems. Maybe someone 
somewhere has noticed them because they have a compute task that takes 
tens of seconds to complete. But the official guidance for compute users 
is to simply disable the heartbeat completely. We never tell anyone to 
try to tune the period or the pre-emption timeout to their specific 
application. That's just too complicated and unpredictable. We need 
defaults that work for the general case and for compute it is disabled. 
Manual tuning just isn't useful. Unless it's to reduce the stupidly high 
pre-emption timeout to get a more responsive desktop because they never 
actually need to run long compute tasks. And in that case, you don't 
need extended last periods because your pre-emption timeout is already 
massively smaller than the period.

John.


> Regards,
>
> Tvrtko

