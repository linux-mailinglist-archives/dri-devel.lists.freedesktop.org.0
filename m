Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE02614F25
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 17:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4402B10E0BF;
	Tue,  1 Nov 2022 16:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB26A10E3FB;
 Tue,  1 Nov 2022 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667319996; x=1698855996;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k08FPDu8e1V0CHDCwQoN0MxwNgCvHe8MVKZiZ5XQWnI=;
 b=mHj6xswEkr6Sc/PiQqhz2dcuHKja9D2c8NdUSSFs3jEn6FOjpaacUKdR
 3Xu7dduan/DHwR17lm/1WC92kYLE891LSb7WD2cQdXdJqCZjdBbUTCaa4
 EcGscVNMnbN6NJVUeYJcFzXYpZA66TnPMcQhykAdjwMtwhHeyWGk0fUna
 2EUvarbdS/ZrEJK8Ub+RfJP+CLlFKugY8lPMXJGCb3yFT7Rg3M8ttKCEj
 xrnI5GKuQvr2dqXc5mHrnOdTbvMAFDpoWRynBRbXoKAFIL0y+IH8HI2Ug
 3skeF11WqPzd9ujT3hYMzadXlA0QglqkLH+ao67LOcSMjnAx12XaalZZm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310886243"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="310886243"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 09:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="697457730"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="697457730"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 01 Nov 2022 09:26:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 09:26:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 09:26:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 09:26:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 09:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnJZpDb5eZhNEq8vbqJ1CmLvtMPSJSkORsdq7aeKQRZ8tuuTOpzv58TulB3xa4avcj/lmdPjHTPeOBTo64SZKUv0t+su1FBLLf++MbgcKXRWJ0yx5C/HvioPOn4ZUOQjo8kHFlO8YzJ6liz7TZs7eHluKAkDrAlrnTjL0nJFM7G+2aQuv/S33K7fcQoioIUOYaGRIheagPjEPvQ3fnNK4JxFxfmzVUw1q5A5ymLe2A8uWQKDHuWii4eD0YWpon8MX3gO/jNT85iW1s6pXy4zSZnN0ORGxStNRnt8h0X3mcicufl3YSP4p3LBA3Y5mPGZOAfSDId7JaQyzPDq2vMP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+kRtURisl42Phyd3Db+eSGH1oWs60fK40NSfmEIZOM=;
 b=Oi/W0NBWmNuPFu4Ona424f7aDwtwBTGRhsOXqgZfvO7zy8cS9pL7aSkjGSbOtKLuu61+kagv8bZvqAaDPKUBNklWhflP9P00VEsyVzo1WV96xXOqQkgXNEj6laAQU5Upj6LkIfiknE1L8RB0IeqWBsyzm61Hndu/6gk3QO6j3hD6ZWrAcOqKZEOEbm5OrkYk3t8A+rFelcGDcKhSZfmN+qKHEr8+p8uc4fnAV+mNmwBUUfkTszP9LeJdhiZQC8CG3MJ5u/lOzNnuAzwCedcEmrxQ5RxZc0ayyFl0vAiwkQRg/4ERf7g+RFlDoUzSATbG3a2oCwUy2ffWhp8YQK4bcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 16:26:17 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1357:5e64:1336:fddf]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1357:5e64:1336:fddf%8]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 16:26:17 +0000
Message-ID: <537d2735-08f3-ba2a-2bb4-c547652b208a@intel.com>
Date: Tue, 1 Nov 2022 21:56:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/i915/mtl: Add MC6 Wa_14017210380 for SAMedia
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221028192935.1458271-1-badal.nilawar@intel.com>
 <Y2E4j92zwv0Yx69t@mdroper-desk1.amr.corp.intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Y2E4j92zwv0Yx69t@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: e87def79-3f70-44f7-a769-08dabc25cce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2BbgWvluEJh219FrY+++bTi9PoV4qZjEMnsS/rJgpJfzDtQM8IyrKmD5UBb/0RXM3f9jU7T7YTiyMjryN+89kx1m2JhSrlmxFmxT7UCrPGumDLtWxjqztPLHg61fSL6RyYvWdrXYH6K6k7DhwgxVIPgbNQWr+YuY6JI8ugYRgw6DAmlkCTYdURKX2yXMvd0zl1EEOixYOv2ooiRDUXqlzY3JuyHkix5lyniEIzoWhMQ+Yn8uoAmLSS076uv/8F6F/dVKnIV7Ll+haFdRAdtujzE+w6JYQpDhLsA0c4ytSpE0Mljimg+fCg0G2O4t1XaMMm4wv3+pxPC01JoUzVPpgVkFs7RWQWh44Vuejixs3j6DlXyiSV8Fkq/y2EJdfs0P9lfKidLZ1RuGwWGizuh0rLCU43gwqP9TxUg/FlVgMGZtHeWqdK70psFE2Q8Oxi9KfinDuDmIunhicl2xEWgRYNPNqIzFT+zAaBC1TvfSO229SCvcYyy7I2WuEQWDraEpRbp71s6THb/pSeaE173CfRt491WG1SaPqPEJZgFnzqCMtAODCPnjqm3k4wLyN6zKFWtywJv1iFPpeISi6WPgW26UXdQjrL8ysJjsXNI/Z/SlNC6sLrTeUevySpB1rMmFxY2N3o9Etosf+Mr41VSo09nzPYOlL/XBBg6QRaVQTyZK4TkFovuIlakSa4APoHxnpcdwp94brFqQT6uKuLXhZZpUjOiaGiI++/bEREVtnK9s4Ua4znBMjM6zoTK+76xqd3+rAFe4GUMIrvUAUHRDdLL4Cluu2Ro1FD6ja9amGBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(2906002)(86362001)(38100700002)(31696002)(5660300002)(41300700001)(66476007)(4326008)(107886003)(2616005)(8936002)(66556008)(6862004)(66946007)(8676002)(53546011)(478600001)(6486002)(6666004)(26005)(6506007)(186003)(37006003)(6512007)(316002)(6636002)(450100002)(83380400001)(82960400001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amhqL3ZGeUowZHpVSm0wa05QNWV6dHVNYit4b1BaeFB1UEpxeFJWM3VyQ29N?=
 =?utf-8?B?eWZwMVJnZ1N1NUo0eWdOSWc2VngrVjRjUUNoSXZBdXNWcmhmaWhGeUU5WFE0?=
 =?utf-8?B?S25NWHFjU2xtVzY0SXhmeWhIUWlITzBxU0JVR0hYRmNiSCtUd0p1NXFWaGVQ?=
 =?utf-8?B?Tnd0WjhzSWZOekwrVCtXeW1RRVFCdEdIbzYxT2g3TTN5d21GZ0hLVVNJeGJU?=
 =?utf-8?B?R0dPUzg4cnZVaWJaRDN5MFg5Q0dYUXVka3dmS2JMVG1yWWRVVy9YOW9aQnNX?=
 =?utf-8?B?ZFNlSjNFcVZWUktGWFIxendpN3Z3cHgxdFMxNHh6NUk2SjI4aDhpdVJpMmha?=
 =?utf-8?B?VGpHQ0x3RE0wYW9jZnRNWjV4L0g5UHZLZk5QMUozTUVwMytaaWRwWFdPUW5h?=
 =?utf-8?B?dzFWdFFYbm1pNGxsQVUvTjIvNFl5WFE0aFA1WjhxMEJIVHNFNklrODU5MDg1?=
 =?utf-8?B?RGNvdERLandxZ2FSK0JHUGx2b01SR0MwdTZuUENNcFpySXFaUEt1bTBVQ0o5?=
 =?utf-8?B?QUkxRWZsWU4xOVVyNjhhaDR2aSs3ZHVDVURBWFZkZzRlTVhXcDZhU1JrU3R3?=
 =?utf-8?B?MllKbVZsdEU0bDVKaTNzalloU1Z3a1g4YXpUQ21aQk1NRXJLQ2pZVlg5U3BG?=
 =?utf-8?B?eFR3MlVPVXVxUyt6blBhNEFiOHpiQWhIbXBJaDlScEFQSWFjSnBwaVNwNElh?=
 =?utf-8?B?cUtxU3NUNi9CSWJLRGdnNVBwN25lYVhKUkZSSUp4WHpxWEUyTzN1RHdxL1Y4?=
 =?utf-8?B?VXFzSXVaZFVYMXNGdHl0YnRyRDZkVWtEY2doSUoralJwMFRMcGhwWTlLWFRR?=
 =?utf-8?B?UC9iUUdRbEorRXdqRnFlVEtSem44bWZFMmExM1Z1RkJ1YTZJM3RwV0JudXgx?=
 =?utf-8?B?Q0VvT1UxL0xtYnhUZ2lsdHpzOUd3aFpHT0U1b2hsbk05bG9pZ0tEZEQydXhl?=
 =?utf-8?B?K0IvOTNCQW9maC9FcjdpWlUwVDcrVGJqSjd6N0V0UmtKbElQd0pEMlY2WGJh?=
 =?utf-8?B?MCtrUU01ZXU0Qk11YWhIZTZieHpZK05IR1lpRVpWa1F6KzZIa3N5TitkWVU4?=
 =?utf-8?B?cWZBaXdyYlVyS0VTcVRqdVdDTndENC9FajhrK1N0ck5USVErSUhabSt0Rmp5?=
 =?utf-8?B?UDYwb0ZjSXpwVCtJcmxCT2kwVWI1cGRRU1JLYjQ4MHd3UEdMMUFyYjdFVnov?=
 =?utf-8?B?dXNnZ2tqSmdrL2VHYUo2QU9EZVFKZWVCcWYrWGNPVWtBZDF2NExmWmtOSmdt?=
 =?utf-8?B?Um40amxpeEg3a3dybHBqcC9lSm1xYmZidTBIRkFQRkFzQUt6WXZsL2lMUGVx?=
 =?utf-8?B?WHVKaFRVZlhmNWl0eXh6QmhjRXozbmpjQkNGODJzTnNqVk8rSGt4RVkzOE1R?=
 =?utf-8?B?TkRkbmx5cWFhUGdyY0Q2SEJWTHEzeE9Ta2ZYMDMwYlpCbGY4NjJSQlZ4bnZW?=
 =?utf-8?B?NmRJQnNFd29XVCswZlpQd2g0a010NktmbmNBUTNyRjIzTHJxREcwNGxQOWc0?=
 =?utf-8?B?VXdFL2RGRmZOd3FoUFplZ212YUo2aHBKS2txRG1OTHB3dnB0a05SZXNqZ0Vn?=
 =?utf-8?B?MzZjWDVSQ1JvR0grZkxqd3JkcWpmenZySEIwWjBkOHhUU2RWZFZHY0cxT3Ez?=
 =?utf-8?B?ZDZEazY0Z0l4NHIrV2U1emFBRDVVNy82eVNKK3VNcVVVeXZtVU1VUmRBS1NP?=
 =?utf-8?B?bkxCZC8rWVBEYVUrNVZKdTBSRElYVnlxR2Z3OGoyVVlRSnlZb2pVL3ROOXJP?=
 =?utf-8?B?V29lN0tLa1AyRDlUZmpFVEVMeloramxEWGZlVHBsUFM5U2dPQm5WSkZVU0ZP?=
 =?utf-8?B?TkJUQ0lDZjgvMUY0NkpTVms1ZWdwbmVRaG41OHRmb3pvUjVDMnpwWU1nNWFo?=
 =?utf-8?B?b1dUZHNicWN0VUJBYy93ZjQyNS8rRnlRellRUElsN2oxczdvbHRZUVhBRHdq?=
 =?utf-8?B?cURwVE8zVjh2b2lUOVJNMnQ0bFpJWVJRb1hFY2xFMm1Vb1hCOHdUbjFzem42?=
 =?utf-8?B?WnhMS1NWb29VMHZsLzJiTTZFSFlsY3pOaXBkMjUyNEsxWHNzUTdRdW50R0NR?=
 =?utf-8?B?M1J5Z0ZCaFp3RGRXS0N2cEJYY3d1aTROMnFFT3lLUUR4aUN6NGZKZU9yQnRK?=
 =?utf-8?B?azhBWEV6T2lOa3JlSm9DUnNSWkhPS2RlZFBzN0FVbk1Ga3pnSG4yVEx6SXBy?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e87def79-3f70-44f7-a769-08dabc25cce8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 16:26:17.0888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aP+YewRAjZBkCR1qWvTe1R37MZnDakEsfyq5smrgDYEn9zaqBo/wG3U2k25+RKK5+aL1i71E8k8chypTRagq5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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
Cc: anshuman.gupta@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 daniele.ceraolospurio@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Matt,

On 01-11-2022 20:47, Matt Roper wrote:
> On Sat, Oct 29, 2022 at 12:59:35AM +0530, Badal Nilawar wrote:
>> This workaround is added for Media Tile of MTL A step. It is to help
>> pcode workaround which handles the hardware bug seen on CXL splitter
>> during package C2/C3 transitins due to MC6 entry/exit. As a part of
>> workaround pcode expect kmd to send mailbox message "media busy" when
>> components of Media tile is in use and "media not busy" when not in use.
>> As per workaround description gucrc need to be disabled so enabled
>> host based RC for Media tile.
>>
>> HSD: 14017210380
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 33 +++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 13 ++++++++-
>>   drivers/gpu/drm/i915/i915_drv.h           |  4 +++
>>   drivers/gpu/drm/i915/i915_reg.h           |  9 +++++++
>>   4 files changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> index f553e2173bda..398dbeb298ca 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> @@ -19,10 +19,37 @@
>>   #include "intel_rc6.h"
>>   #include "intel_rps.h"
>>   #include "intel_wakeref.h"
>> +#include "intel_pcode.h"
>>   #include "pxp/intel_pxp_pm.h"
>>   
>>   #define I915_GT_SUSPEND_IDLE_TIMEOUT (HZ / 2)
>>   
>> +/*
>> + * Wa_14017210380: mtl
>> + */
> 
> This doesn't appear to be a valid workaround number; workaround numbers
> are always supposed to be the "lineage" numbers from the workaround
> database.  Wa_14017073508 seems to be related; is that the one you're
> implementing?
Thanks for pointing out I will correct the workaround number in next 
revision.
> 
>> +
>> +static bool mtl_needs_media_mc6_wa(struct intel_gt *gt)
> 
> Drive-by comment:  names like this aren't great since even though
> there's only one "media MC6" workaround today, that may not be true in
> the future.
I think its better to drop this function and replace its calls below 
with (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) && gt->type == 
GT_MEDIA)

Regards,
Badal
> 
> 
> Matt
> 
>> +{
>> +	return (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
>> +		gt->type == GT_MEDIA);
>> +}
>> +
>> +static void mtl_mc6_wa_media_busy(struct intel_gt *gt)
>> +{
>> +	if (mtl_needs_media_mc6_wa(gt))
>> +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>> +				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
>> +				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
>> +}
>> +
>> +static void mtl_mc6_wa_media_not_busy(struct intel_gt *gt)
>> +{
>> +	if (mtl_needs_media_mc6_wa(gt))
>> +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>> +				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
>> +				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
>> +}
>> +
>>   static void user_forcewake(struct intel_gt *gt, bool suspend)
>>   {
>>   	int count = atomic_read(&gt->user_wakeref);
>> @@ -70,6 +97,9 @@ static int __gt_unpark(struct intel_wakeref *wf)
>>   
>>   	GT_TRACE(gt, "\n");
>>   
>> +	/* Wa_14017210380: mtl */
>> +	mtl_mc6_wa_media_busy(gt);
>> +
>>   	/*
>>   	 * It seems that the DMC likes to transition between the DC states a lot
>>   	 * when there are no connected displays (no active power domains) during
>> @@ -119,6 +149,9 @@ static int __gt_park(struct intel_wakeref *wf)
>>   	GEM_BUG_ON(!wakeref);
>>   	intel_display_power_put_async(i915, POWER_DOMAIN_GT_IRQ, wakeref);
>>   
>> +	/* Wa_14017210380: mtl */
>> +	mtl_mc6_wa_media_not_busy(gt);
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> index 8f8dd05835c5..cc6356ff84a5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> @@ -11,9 +11,20 @@
>>   
>>   static bool __guc_rc_supported(struct intel_guc *guc)
>>   {
>> +	struct intel_gt *gt = guc_to_gt(guc);
>> +
>> +	/*
>> +	 * Wa_14017210380: mtl
>> +	 * Do not enable gucrc to avoid additional interrupts which
>> +	 * may disrupt pcode wa.
>> +	 */
>> +	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
>> +	    gt->type == GT_MEDIA)
>> +		return false;
>> +
>>   	/* GuC RC is unavailable for pre-Gen12 */
>>   	return guc->submission_supported &&
>> -		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
>> +		GRAPHICS_VER(gt->i915) >= 12;
>>   }
>>   
>>   static bool __guc_rc_selected(struct intel_guc *guc)
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 05b3300cc4ed..659b92382ff2 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -740,6 +740,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>   #define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
>>   	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))
>>   
>> +#define IS_MTL_GRAPHICS_STEP(__i915, variant, since, until) \
>> +	(IS_SUBPLATFORM(__i915, INTEL_METEORLAKE, INTEL_SUBPLATFORM_##variant) && \
>> +	 IS_GRAPHICS_STEP(__i915, since, until))
>> +
>>   /*
>>    * DG2 hardware steppings are a bit unusual.  The hardware design was forked to
>>    * create three variants (G10, G11, and G12) which each have distinct
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 1c0da50c0dc7..abe62cea083d 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -6678,6 +6678,15 @@
>>   /*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
>>   #define     PCODE_MBOX_DOMAIN_NONE		0x0
>>   #define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
>> +
>> +/* Wa_14017210380: mtl */
>> +#define   PCODE_MBOX_GT_STATE			0x50
>> +/* sub-commands (param1) */
>> +#define     PCODE_MBOX_GT_STATE_MEDIA_BUSY	0x1
>> +#define     PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY	0x2
>> +/* param2 */
>> +#define     PCODE_MBOX_GT_STATE_DOMAIN_MEDIA	0x1
>> +
>>   #define GEN6_PCODE_DATA				_MMIO(0x138128)
>>   #define   GEN6_PCODE_FREQ_IA_RATIO_SHIFT	8
>>   #define   GEN6_PCODE_FREQ_RING_RATIO_SHIFT	16
>> -- 
>> 2.25.1
>>
> 
