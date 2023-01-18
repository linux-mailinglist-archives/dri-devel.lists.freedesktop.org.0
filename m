Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C0672510
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 18:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D625810E7C7;
	Wed, 18 Jan 2023 17:35:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02C510E7BC;
 Wed, 18 Jan 2023 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674063348; x=1705599348;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uzN5MDnqxFypIRVJ/pk1R99l/BVeEKDfV+5GoEe1wdM=;
 b=Ed7im2yMMjyNvz0yjey/ULIBw5WAQ4UzOPQXm3EzBQ/FVvR/dUjjwkBi
 eFxjzXy39ugHKrv4n/5JdWm+9HuUq3tfPJQia8Sy4PsVEsGCZOBbKlHfw
 ryptMoz0v3Kz+RLU1x/iUg8oKfbGzZnl+BnciCvikluySM4sAqDBL5X0Y
 1DfxpAkU3whBpXGak6nIepiEcgLgEFTXqhyPpZGl8ktgQU6136T0f3U9t
 Bo8CYj6tLnfLjY4IPGwg+079ZHnJ3nhwS1YHynE+XxIZh4/q/R3U5jh3E
 ICXiHN9cI++gM2t0Ew/gXleopx4bpw1TLnh4k3h5Fkk9L/sMrucVDHqVT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308608388"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="308608388"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 09:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="905188785"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="905188785"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jan 2023 09:34:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 09:34:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 09:34:50 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 09:34:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1XJiyNkPtKCgRd2Nuvg5U/DPZk+oh04Dn3pgMZDYYmJZOiM719Y5PgnmUIDaRJy7Zc+lCwWxxCyffkPiai6AcOUMeDgBB1mKqZTiGPcCqs2QMFOWrxS9nlNXePXh/mAymTgUa4BtlQDxFT/YV3MFrfgi7V4N52OTvTVPpYFLqRVz6cdSHSoteR2Xg7zh+NtT52uKBpo6WU67m7XeDqfnW98XBbyFnQov27Ji3aO5vk037J/wRli/N/LVL7yZibMnMR+tlj1weE11BCNzet4jVfMGwyhBhfK2M11AmlrGxu9C2PZ8UrfPYk6dPBM3IRtfVCh+NBwO53xlM5ngNCB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DieT1tGTWKdEU1lvuB1PcHxL/R/RkbsW89P7JKIEJKI=;
 b=b00pUm5beIsM8L4Ua57Efg4p8pp/mSoOdT4Z3+6zmvV+pfbc5QdX+5s5eaQ/gvk+UHRdhXBeX5n0JBE4Rf9WN9hzdQNTSkUkyGAXcbnAZ2/Ee9q+uZQyhY4pKeTd6NAlA6uc5p07FDeL1aywRx4VAwbdGnifu5+tfHfTaxePR8HpQ14UVJ3rtAzsA4g3twq/BK3gSV2tkX2vjL9wW/nHimITTDCcpxLKMi5ZzoL3EqfvWkvlRhYyqH2tukSBGuOQt4Woes+eoWIaWlgH3/pUOAjltLSzesz3ZBH/38SAt1zqOVo6yGYGmBsqAet4kx8/H5CXjUllwW9FtNcmVPagmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 17:34:49 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 17:34:49 +0000
Message-ID: <8d9b9bdb-7e08-47b5-416c-69e743675e45@intel.com>
Date: Wed, 18 Jan 2023 09:34:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/5] drm/i915: Fix request locking during error capture
 & debugfs dump
Content-Language: en-GB
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
 <20230117213630.2897570-2-John.C.Harrison@Intel.com>
 <Y8et+QikzQE88t1L@smile.fi.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Y8et+QikzQE88t1L@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0044.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: af88c4dc-ac57-4529-84c4-08daf97a4c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ona4FxRwEMdYsxpYxHdqe9d1gJgG2PoYs6R0zjHNOMdEHxohtGvrDzJlZ8cjmv5RguhVpnTy1SBvLWNBbGFamwNjdAX7a80gHgI4kPZGVrE7UjhcrssqSc6ObYGvx4Urt2QYN+x249MCf1VbMeIYrFoNWnVlDDmVHGhFKdi4W1xqbCh5SOxEW3EjJNsX1TKXZefOS0lRxslRrev2mLM1YGw4fGnJ4xUOAO1Oc/aQ+YRBPvm5NYZZfVHLAMQ7VW0eICH9r7Epf6Argg+Kon/C4SghVgMdxCy4yhbIbgYiYrIb2l44ylMjwf3o+1K82yYKrrIXam8iO0SQ5Rpgxcbfvt+J0UlSL762WmnIiZ9okpFgBJLAjWCAs1q5EDPI21NfkQuHAuEeBg+VRQtxm05m2E0O57Pkne3c0DYhTjoz4Ze8bJq2oDTy6wDFSZcKCQF8UbayDvc4nOV4noIoZjFUS0m0B7DRntZ9FYp8R+uyh/DpmRd5gc26jGVksVkRoQnV/1Omxx8mGv/MZ/spGH/AYA21EC9aJ7uWYYLrlFUbEAD+/oefBEDFcliMpq52wYlcW0bTxHf69mmiIL/qI0pg5pPH6MGsW5Mc1QapxK8CWxHdncFk0Z2xD7D6H6QTNZwXkuvxirPOiWZfFZDtJq1Qm7r5iPWBz9f/9xVhL/JvHrcIbaSe6yxCLlsLXDEu5qzW7mrHqbAMUCBHFWExrr2qxiTQ1Ra/wdMjCUOB6jFBPRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199015)(31686004)(66946007)(6512007)(6916009)(2616005)(41300700001)(26005)(66476007)(4326008)(53546011)(8676002)(186003)(86362001)(36756003)(66556008)(31696002)(5660300002)(8936002)(82960400001)(316002)(83380400001)(6506007)(478600001)(38100700002)(2906002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGFFa1ZhUE5IU1VnVXNvZDNWcmUwaEFvdFFXcnhnY0hUQkNGc3UyZUJwV1h2?=
 =?utf-8?B?R3psVTRwR09wbzVMMS9XVUoyZFo4RjRFQ3NVY0ZlOXcxN2RuMGQ0U01EeGdY?=
 =?utf-8?B?QzJRbjU5eVNOZFc5a3BFRWZvSis2eGxQaTdncTR0L2l3T0duMGE0dzRkTFgv?=
 =?utf-8?B?dHllSUcya2xRNWwyVloyNFhRTXlUR0xqL0ZIbWZPR1huNnRMdWZtZytwc3J0?=
 =?utf-8?B?dGZOdmRscFd4OVB2Z3ptUUF1WmRjWUxYbmpmUkpRQ0xTN0pEVjU0Vm1VYXRJ?=
 =?utf-8?B?S2JFT1ZBcFZaSTZGZkw4ZURGSHFDK1ltRDd5c3VHRjNFc25TMDlSOXdZSDla?=
 =?utf-8?B?N1c5SmQ3NUFZUnczVFoySEhMaFR4dlpiR2RqQjFJUVBVVXAzaWlKdjFQTmdI?=
 =?utf-8?B?emtMZ2tPK2ZRcWtya3FwNjVlbHV3RFJMd1hnVEJlNW9ZWlFFNVJnMVhxempz?=
 =?utf-8?B?VmhvNjNhUnBQN1gyUnpoWDZIWm1yTmpuajdidDhqbm42cE1mRC9CKzFoZ3kv?=
 =?utf-8?B?RTZVZHVJMXBjNUQ2TDdFWk9NVnladmVoZ0lmSzRSa0lWZFU2aUpJMmRtTDZ5?=
 =?utf-8?B?SUxvUlh5RWRQRWpvWEhVZk0wZ2FqODJzWkdEZUxSUkFBTmZnUkN2WWJzWElI?=
 =?utf-8?B?alZkSk9oOWZBUUtaeEVwSFdheGsrNGxHT2hKQTNSelBpOEwyQU5nYlBMWWtQ?=
 =?utf-8?B?bFpHc2gxNkdSQ1ZRYjA1ZW92Rm10TzRaMm82N3gvTC9DNlF3eUh1cklJbFFX?=
 =?utf-8?B?dmllS3JLRW5OZHpGemFsOXBBKzFtc0tUT1k4R2w0VmdNRitJS2ZhRDZxWm8r?=
 =?utf-8?B?dGhEY3EyeUkvWmtlWCtGQnUwZlJtMkl2Wmx2Z1BWdGxWRXlhNzVTK3hhOUt1?=
 =?utf-8?B?aFFNbjdPNVhUUXZKaE13OXhDZ0dRMFZiQ1JZOGswdmZBYzVzZklzYjZ1SU9u?=
 =?utf-8?B?Y3JGWVRXVGdOcmpobmRYWWZ3UlZmRnZPSTZEVzMyNXl6dXBndEhZNWJFU0ZJ?=
 =?utf-8?B?bmREN294SjVIbWV0eVE4Qjk0a2xWa01mV053MDFheU5QZEpwa3k1YlVLU1BC?=
 =?utf-8?B?OTN0eXNZT00ybjJuNHN0emtseVZnNVBaelY1MExZK09lNHhVMFhrVVEybjhZ?=
 =?utf-8?B?YUw3cUFzMmpQemNSY3ZTOWhYdm1pTmZIM2JybU85YWNnSUp6T0NqQjNyOEJn?=
 =?utf-8?B?bWY5T1pVdDVrUUYwNkhpWDdwaEhKVVJ5Q3dNQkloMEZZNTBDcFRSK2F6ZXZq?=
 =?utf-8?B?ZmxRZ0JlQ3BWNytZN0dRYVBsVCtWSjVTYjdoV0trSWRmS2pXVlorR2dhQzFY?=
 =?utf-8?B?R3loSjVCNE1QelAvMXZJZzUySFpBNW9lYmlZeEdvMDdqVVlxZStrcmtISmVv?=
 =?utf-8?B?b1M3WkZ0bWxTVytJMEtiMy9LSVBMREZ6MjhlVzhZYXVhangyQVlxY3loTEFi?=
 =?utf-8?B?TEhKT3NvT2NTcG9xSTRCTE05RUM3VWhYa2pRMGxOY1BtYU1SM3dhVHlyS2Zl?=
 =?utf-8?B?L2VoeFc5TW5Gby90NGwrbkpjM1h3eGRTRXdDMk82bGRhcmtaUGQzdWt4MWhm?=
 =?utf-8?B?eWU2NENpTnFnQ1Z6Qm5RQUUvSUVoczJiSzZUakJHREJYZ1o4cUFydFE4UGpz?=
 =?utf-8?B?N2N4bkJsWk1panlncUZvM0pNdWdnRjVTUDJvQjVaTWx3QVhNS3BGYjJtMm9I?=
 =?utf-8?B?V2V4eHIzWVNDUTFsRHc0aTdxeThVYlhpYXUxS3o2THEvMnBLcG9FSzgvN1ps?=
 =?utf-8?B?K1JsRWUva2Jxek9qZ3RJd0hnOG5DZmE1SXlnT0MrRFc0WTdzRHo1STNaZXNJ?=
 =?utf-8?B?dGpXR1NkWktnbFRyODQ4V3p4RHRDam1aeU4veFU4RkpKQ0UvSXg1V2gvQkpS?=
 =?utf-8?B?azdOTCtQbHNiQ3lReDRqaHZrUHhNNlN2QVJxWmJJSFA3TFZMMUIxUnZYVWVX?=
 =?utf-8?B?dUgxWW9pcFRCNmQraStYWW41eFNsRkIwN1ZWQzJXY3R1d3pFdjZGcTJyMXFs?=
 =?utf-8?B?QzdjSGVBa1Y2NjVRYzNSamdWN0ozOEFYWld4RXczTS96VDVmd1VBOXpkdUJK?=
 =?utf-8?B?bXMxU001TklQRnd1eUxmTmNod3Z4YVNpcThBeWlXTmtSUm9lK2tyY1QzM2Nv?=
 =?utf-8?B?OEYvOUR0RFdtdkNLNEVaZXBTeDQ5S1BQbUNNM1I5Z2FOMDh3amhXRUwwNGJC?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af88c4dc-ac57-4529-84c4-08daf97a4c4b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 17:34:48.9096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8txN6bDhLPLDke3eL83XDaIdrjBlnwvm3JD4I/XQDPquxkDpFYKdqiC488Plt2reB/pvTF3OFJbcoGqUhmm7IXnhb05+aiiKKZBDSspbYbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
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
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/2023 00:29, Andy Shevchenko wrote:
> On Tue, Jan 17, 2023 at 01:36:26PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When GuC support was added to error capture, the locking around the
>> request object was broken. Fix it up.
>>
>> The context based search manages the spinlocking around the search
>> internally. So it needs to grab the reference count internally as
>> well. The execlist only request based search relies on external
>> locking, so it needs an external reference count. So no change to that
>> code itself but the context version does change.
>>
>> The only other caller is the code for dumping engine state to debugfs.
>> That code wasn't previously getting an explicit reference at all as it
>> does everything while holding the execlist specific spinlock. So that
>> needs updaing as well as that spinlock doesn't help when using GuC
>> submission. Rather than trying to conditionally get/put depending on
>> submission model, just change it to always do the get/put.
>>
>> In addition, intel_guc_find_hung_context() was not acquiring the
>> correct spinlock before searching the request list. So fix that up too.
>> Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset
>> with GuC")
> Must be one line.
In my tree it is one line. git itself does the line wrap when creating 
the email. I missed that I need to manually unwrap it again before 
actually sending the email. Although the CI checkpatch also pointed this 
out in it's own obscure manner.

>
>> Fixes: 573ba126aef3 ("drm/i915/guc: Capture error state on context reset")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Michael Cheng <michael.cheng@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Bruce Chang <yu.bruce.chang@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org
> Is it possible to utilize --to --cc parameters to git send-email instead of
> noisy Cc list?
This is the list auto-generated by the 'dim fixes' tool. I am told this 
is the officially correct way to create a fixes patch - copy the output 
from 'dim fixes' as is into the patch headers.

> ...
>
>> +	if (hung_rq)
>> +		i915_request_put(hung_rq);
> In Linux kernel the idiom is that freeing resources APIs should be NULL-aware
> (or ERR_PTR aware or both). Does i915 follows that? If so, the test should be
> inside i915_request_put() rather than in any of the callers.
That's as maybe. But this is how i915_request_put() currently works - it 
is simply a wrapper around 'dma_fence_put(&rq->fence);'. So passing in a 
null pointer will immediately cause a null pointer deref. If you want 
the put implementation to change and to re-work all its callers, that 
should be done in a separate patch and not piled on top of other changes.

>
> ...
>
>> @@ -4847,6 +4857,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>>   			xa_lock(&guc->context_lookup);
>>   			goto done;
>>   		}
>> +
>>   next:
>>   		intel_context_put(ce);
>>   		xa_lock(&guc->context_lookup);
> Stray change.
Intentional change to improve the readability of a function that is 
being modified by other changes in this patch.

John.

>

