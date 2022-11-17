Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978462E8A6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 23:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC6310E6B7;
	Thu, 17 Nov 2022 22:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A25B10E6B4;
 Thu, 17 Nov 2022 22:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668725271; x=1700261271;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PKHUJov1+h2WmSU+WHGuB8tsCL05y1oSl9AfQzI9ovE=;
 b=cUrxLaFdt2wokcp0G1Ay6+ybFB2W3Y2ok8uyWfpFh6dKIiG4pcHSMDD3
 AajAe7wOg0zGjn5BRqU3ugS1nMwkdcHdpxrRzmAUDhyFa8HnbpeAEsT2f
 xx+YelXq1m7/zrEuW7p3+7WRV0FQ9IGn1ahcTUvq2hVVacH0HCTrbFMXi
 dci9t/pbB9guiq1gTwJv7+RnHmIlfHBmVU/31vF4DghE7iVY1HdSevxJD
 6LKe5FbJas0JJfHwt9a4rB5USuwxHNFUxmxkd4G/kh8Hk39zYUoiFqidG
 gBxKIPEjuMWPDFDoO1/vZQbqTXtmHn04ahbJPoAa//6oxnWXIzugPswvO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="377265137"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="377265137"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 14:47:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="885064039"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="885064039"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 17 Nov 2022 14:47:50 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 14:47:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 14:47:49 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 14:47:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhGE0HTuczcviXEtDrTS/UsiYvyJG63IuNPNHf+M8R+8DNzh1pPPRhoUHUbm2gTGYGzZvgrpagJmhp15yk2C14Nb0Ph5fmgRgkSlHzyLEHaZu4jLv0vo5Rcxih6l7YwoA9XLTX2j4C3gKT3/AYiwDyGBYAyOd4O8SpyL+oHqIyyMUX8OM++O8ifW6kiHZmAnqawQJ2X176dtrYxyyKCxAq6ebA5j/6yYKYE2bqKybj3XNNg3vGUecFAqyQMkmtqJItMt1TtxMk2gyJiBllllHiAecdJ5TuRwoQ5UO3l0i0Vsmr/Hx//G4Nnsrd/BqUoiHKcI51KphA0urk/W7deUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8X5a7+fsO/+dkK2aHq/NematYwO9PVrp4KvxNUPytQ8=;
 b=m/jor+f4IMpHGHh8z7a4QpUZaW/kvufN+4yZrCY0NTmlyWqWz5GzzV/EaXqyolZPbVFLjpk3T54lfWDuraV6olYCS90J5c2vCcpa/6tCetMoreg+WzZ+ak1PiVg9m+waE14Mtm57/mhSGvK8lPIQlFD6hLiZWOv7Qv+QUzbZ2m9fxtWfas5dq9ZSVfYKvcRhqWpxh8HhDtE09e83YWLExrXBxr8qXGNz/eCL9OhaVS8K6xKkxTYVIUNqrXqaycSl9p3G84NsJbeUW4NiReQR+ZUTKrFnoXXQKpKHJKiyXzvdikK0+9G5ogwK7gKjb24Mph6EIgZqi6qI10TGYxzZrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.19; Thu, 17 Nov 2022 22:47:47 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%6]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 22:47:47 +0000
Message-ID: <fe4bc76c-cb05-0d6b-a82d-63d701b7785a@intel.com>
Date: Thu, 17 Nov 2022 14:47:44 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/i915: rename intel_gsc to intel_heci_gsc
Content-Language: en-US
To: "Winkler, Tomas" <tomas.winkler@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20221102213350.2818622-1-daniele.ceraolospurio@intel.com>
 <MN2PR11MB40930FAEBB59ADA13ED5DEC2E5389@MN2PR11MB4093.namprd11.prod.outlook.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <MN2PR11MB40930FAEBB59ADA13ED5DEC2E5389@MN2PR11MB4093.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::17) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM4PR11MB5549:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc1faa8-276c-44e0-e534-08dac8edbf53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WRpokASEHGtvJu9rZvK0P4VoV6beRbdqbFHamthLaU1wKpo2MKKbI8rtXm9eD89pT0ZSTJ6targD67q5AdZaW0RmvXsUmMN8UV0Rjargu+K3S51WfVp0Rem1apwnvdKzXEDVLxPlpPqTMtaG2jU8PvP5lnAWbITVNZsTHAYkh/dbrzvbi2plgeSCbP3B6uWzADpQM2ue4J1524RBY0yGqKVf5gJ0qUPn4Hx+Mtd8riGJiK7g3wY0vv/kyHOZiFFlRDPRMxjfTHfhyRWbqByZCm5hldA5zDC81N1pyxIywgBWoQzXZYgZ6IXJ7is/shM6sJOSO3HWxjqT9ZVTQSrbYYE3TpsbPuKWpsBfntmDaiZv5CW2zYj1ve7YonLmHCXipo9orXsVq8h4h59/aQavqPeF1JuwLACGUc1Igy8pAo04fF2WYTzNEaAbJbCGHtl9mTo+hn9r7gE374MLItjTV1hAcmyoI/kLHUDaCGX9UfZ0DmU1dcO/r0TrZWI2jAS4+HMm/sDGZdrsSNhjJIFxmdrotHKingkFQtnPb84itup7tahAfkqm43qdJI0ESYzjAg3yZ1k3e3QLFFytMh/CgoigImQ/Y06S9YtJN+flaB5dUbKlU67k9UgavORX/6msnoKruDx1QELM2WPgCwrUrGqiCxNf9b6tz3QmwygitUyt8iXDtLcoh6ZNRwUWZK8JcD+h3WIQ0WbkJyAoXHPIcqWaamH8ySnL5um4ae/RFNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199015)(31686004)(38100700002)(2906002)(5660300002)(8936002)(30864003)(450100002)(53546011)(8676002)(66476007)(66946007)(41300700001)(66556008)(107886003)(83380400001)(6506007)(6512007)(186003)(6666004)(26005)(36756003)(86362001)(2616005)(478600001)(316002)(82960400001)(110136005)(6486002)(54906003)(31696002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlhaeHlYSmlNUTFwYzVDc3NUUmU1enYwN2NPZjR6RWo0S3dtQ0ZiSXFnSnNL?=
 =?utf-8?B?N3ZsOHJ0bFRHRk54WUI2YUd5bHJMODBwVkg5b3lWZjJnUjJ6UGNWck54dDYw?=
 =?utf-8?B?Z2I3ODR2REE4ZU5PanVJbittUU5SVUV3Rmdkb085S2pxUWl5NU9wUXJRMXd4?=
 =?utf-8?B?UmRWREZrdnlYNksrdnhILzk0YUUvNVpMck4yQ1NBanJKZzB6SlFWeGZqVVFW?=
 =?utf-8?B?bjRwWjhRa2Q5Z04xMW81Yi9DUENHS1B1Q0JlbGZ0dEZ3SGprZVNZSnR2YzRs?=
 =?utf-8?B?UDdPclJ2YWFJSVoyNldJRFQ4TisrU2o4SkVlMXVIOWNqekFCRUhOWktUMUN6?=
 =?utf-8?B?WVFNV1M4NmpPaG82cjdOaldpQ25EUFF4OFlDVTVlSGtldWJ1MUxyYzh4Yk9v?=
 =?utf-8?B?V085dWhWTFE5N01WWGpjdTRKK1NNc2U5dnVCbUVySWFjd3V6WndlYjBUNzds?=
 =?utf-8?B?a3g1QWw3RmNmTEp5Yzlib28wa2tHM1ZKR0xYVm1tcWF5TSt0Uy9SRFRyc09l?=
 =?utf-8?B?ZllTQkc4UVpEMUhjeHBXUWFORDJ1cG50d3ZyemdDUzY1V0o3NU1QUmwxMmlD?=
 =?utf-8?B?emw0RUxUNmNlYTR3SDBFQk9qRzNrUXcrbXBHRzdxWFY1Y2lRaWcyUEp3RnJu?=
 =?utf-8?B?aTRsSUxFaGZGM2grdk1NUVN4RWdqVmxzd1NTand3QVdnd0FKbFcwUXYwdlNK?=
 =?utf-8?B?VFpKZ2FyOVNub2loeTlvU1JNd3h2RUprWnhWTSs0WHV0WWEwdVl2L3J5azBw?=
 =?utf-8?B?K0I0UWN1c1hKSWxMSVBsT01vaVlhYytzNlVXN3U3TnBqRVlJNzBVWkxNUm1C?=
 =?utf-8?B?RFAvckVNbXBQUFA2Mm9GUkt4ZnBzeGltVm5ic2pvMDdWSVJpY1d0MmJtVXBz?=
 =?utf-8?B?MzY1dWNZVGJkUnFtamo1cVpoelBaeW9WZTNGcG42UnhoQzVBNGIxZzZlZWZL?=
 =?utf-8?B?Q0R0YWNHVXdGSUM5VFlnL1NuVURjYXJWL2hPWVJIaDRVUDRIeGFLTVl3RnIx?=
 =?utf-8?B?NlBVaEdvUys5MjVndzg4d21hVm1aamtDVFd0cFFzdWY4ak9QL2pHNDF6bHk3?=
 =?utf-8?B?Y1dKY0JNR3NNUCtzY3lHY0lQUy80alliYmxBZEJUUm9UN2hmZDNrTDVmN052?=
 =?utf-8?B?ZXRYQXlRSlRSRUUrZE5EaWxWczN0akduaW14TnFrNmFjcWR2aGZjdDd5bDY5?=
 =?utf-8?B?K1JtdjV6Q3lXSHFtb203bExpZms3c0kzb2tKNk91ZEJlV0NoN0Z0dzVzam4y?=
 =?utf-8?B?MVdCZm9RZzFkMWtJOVdPRmV3eHhsRGE3TDhxUmJGb29nWXZNMldKVm9LVndS?=
 =?utf-8?B?OFhONWE2S3BxbldWcTJsSjdKMWJNOXZGdGRld0U3L3A0OW1pN1R1RGxJMnpn?=
 =?utf-8?B?MGtZRnZHTWw2MTIxNTFianBmYWtKVzJ2MExyeXVEMWYxUkJHa0kxczd1K0Mv?=
 =?utf-8?B?NDZBQ05TNnc5RXJpWFB3VnlGK2szTDNCNlBxSkp0QWlQQnlPak9yVWxwczFv?=
 =?utf-8?B?WW5FekEwQ1MyUzNjb2VaaFgwUHNkbUt6MlZkWDNwaW5lYXQ5ekZKNEw3N25n?=
 =?utf-8?B?bXdWd1cyUXZyL0lnRTZ5M2hwZXUrTGZ2ZGJNQUErYUs2Sm84YWtzVjJoQk9E?=
 =?utf-8?B?UXZIcUlpYUpnMzI1UDBoZzd3VnlBcTR4V2s5djltRFVadWF6WC9tVHh4Wldm?=
 =?utf-8?B?MlJCTjNyUXRHSkhQVmhqQVcxOXFGWVJ5bEZXa1drTDZmMFFwMkEyMUVVZk1E?=
 =?utf-8?B?NkZOaE03SzNzdEswMG5aT295MjRiamhNWmdQcDEvOVpySWxtZDNJTG0yb0hv?=
 =?utf-8?B?TTlkTXYyMkNCUDRuSndhb3B6Y0V5dWpwRmJSZi9VYXUwLzVVMjdxRGpxcXNq?=
 =?utf-8?B?ZFdRZ3ZaZXcyTmJ1MEdlTnl2azF0QUpNZlQxM1BJclZQdVpsckNvWmFLTlhS?=
 =?utf-8?B?SkJ4U2hvSFhvTmRzTmFBUjZ0aFd6Q3A1bXlXcjJzYTZicG4wTlhvSWNUL2p2?=
 =?utf-8?B?V3VZSk5GN041anA5V2RxdCtJWUFvWFBtYnZVMTJFUlYzeEN2T1B2aHY1ZS93?=
 =?utf-8?B?U3BYSC9abEhseUx0YTh3TnhBYlZCR3BzTXJ0azVrZWRKcFJvTVEwMmpvVlpQ?=
 =?utf-8?B?ejZnUVNYNUNkQ3Y0ZC96Zm5pQTFETzNsOWcvS1ptTlpESytmZ1RqN2EzcmJl?=
 =?utf-8?Q?iZdTUXalvebPY1OqNYkwSUs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc1faa8-276c-44e0-e534-08dac8edbf53
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 22:47:47.0503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dwoLS+I+D+q6BCAtVu4qoh9UqI2b/8E5nPIWD+0ugtQsqcM88nYMS3lQ9TBSHRAYbgXjICt9aluqWdZMwmZDC71VwbASrGPLUgNl+zBQMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5549
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
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/3/2022 3:41 AM, Winkler, Tomas wrote:
>> Starting on MTL, the GSC FW is loaded at runtime and will be managed
>> directly by i915. This means we now have a naming clash around the GSC, as
>> we have 2 different aspects of it that we need to handle: the HECI interfaces
>> we export pre-mtl and the new full FW loading and support we have to
>> introduce starting from MTL. To avoid confusion, rename the existing
>> intel_gsc structure to intel_heci_gsc, to make it clear it contains the data
>> related to the HECI interfaces.
>>
> Are you sure you want to take this path, it will make backporting quite difficult.

The diff is relatively small (< 50 lines), so it shouldn't be too bad. 
Otherwise, do you have any suggestion on how to avoid name clashing in a 
different way? I really want to avoid confusion around legacy heci gsc 
and new runtime-loaded gsc. My plan was to name them intel_heci_gsc and 
intel_gsc_uc respectively, to make it super clear which is which, but 
I'm open to alternatives.

Daniele

>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Tomas Winkler <tomas.winkler@intel.com>
>> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                 |  4 +-
>>   drivers/gpu/drm/i915/gt/intel_gt.c            |  4 +-
>>   drivers/gpu/drm/i915/gt/intel_gt.h            |  4 +-
>>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_gt_types.h      |  4 +-
>>   .../i915/gt/{intel_gsc.c => intel_heci_gsc.c} | 43 ++++++++++---------
>> .../i915/gt/{intel_gsc.h => intel_heci_gsc.h} | 22 +++++-----
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 10 ++---
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  2 +-
>>   9 files changed, 48 insertions(+), 47 deletions(-)  rename
>> drivers/gpu/drm/i915/gt/{intel_gsc.c => intel_heci_gsc.c} (84%)  rename
>> drivers/gpu/drm/i915/gt/{intel_gsc.h => intel_heci_gsc.h} (52%)
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 51704b54317c..2fa401dcf087 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -206,8 +206,8 @@ i915-y += gt/uc/intel_uc.o \
>>   	  gt/uc/intel_huc_debugfs.o \
>>   	  gt/uc/intel_huc_fw.o
>>
>> -# graphics system controller (GSC) support -i915-y += gt/intel_gsc.o
>> +# graphics system controller (GSC) HECI support i915-y +=
>> +gt/intel_heci_gsc.o
>>
>>   # graphics hardware monitoring (HWMON) support
>>   i915-$(CONFIG_HWMON) += i915_hwmon.o
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 8e914c4066ed..6ca72479c943 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -454,7 +454,7 @@ void intel_gt_chipset_flush(struct intel_gt *gt)
>>
>>   void intel_gt_driver_register(struct intel_gt *gt)  {
>> -	intel_gsc_init(&gt->gsc, gt->i915);
>> +	intel_heci_gsc_init(&gt->heci_gsc, gt->i915);
>>
>>   	intel_rps_driver_register(&gt->rps);
>>
>> @@ -785,7 +785,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
>>
>>   	intel_gt_sysfs_unregister(gt);
>>   	intel_rps_driver_unregister(&gt->rps);
>> -	intel_gsc_fini(&gt->gsc);
>> +	intel_heci_gsc_fini(&gt->heci_gsc);
>>
>>   	intel_pxp_fini(&gt->pxp);
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h
>> b/drivers/gpu/drm/i915/gt/intel_gt.h
>> index e0365d556248..43f73239a363 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>> @@ -39,9 +39,9 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc
>> *huc)
>>   	return container_of(huc, struct intel_gt, uc.huc);  }
>>
>> -static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
>> +static inline struct intel_gt *heci_gsc_to_gt(struct intel_heci_gsc
>> +*heci_gsc)
>>   {
>> -	return container_of(gsc, struct intel_gt, gsc);
>> +	return container_of(heci_gsc, struct intel_gt, heci_gsc);
>>   }
>>
>>   void intel_gt_common_init_early(struct intel_gt *gt); diff --git
>> a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> index f26882fdc24c..3b4bd237659a 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> @@ -75,7 +75,7 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8
>> instance,
>>   		return intel_pxp_irq_handler(&gt->pxp, iir);
>>
>>   	if (instance == OTHER_GSC_INSTANCE)
>> -		return intel_gsc_irq_handler(gt, iir);
>> +		return intel_heci_gsc_irq_handler(gt, iir);
>>
>>   	WARN_ONCE(1, "unhandled other interrupt instance=0x%x,
>> iir=0x%x\n",
>>   		  instance, iir);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index a0cc73b401ef..80a0163dcc01 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -17,7 +17,7 @@
>>   #include <linux/workqueue.h>
>>
>>   #include "uc/intel_uc.h"
>> -#include "intel_gsc.h"
>> +#include "intel_heci_gsc.h"
>>
>>   #include "i915_vma.h"
>>   #include "i915_perf_types.h"
>> @@ -100,7 +100,7 @@ struct intel_gt {
>>   	struct i915_ggtt *ggtt;
>>
>>   	struct intel_uc uc;
>> -	struct intel_gsc gsc;
>> +	struct intel_heci_gsc heci_gsc;
>>
>>   	struct {
>>   		/* Serialize global tlb invalidations */ diff --git
>> a/drivers/gpu/drm/i915/gt/intel_gsc.c
>> b/drivers/gpu/drm/i915/gt/intel_heci_gsc.c
>> similarity index 84%
>> rename from drivers/gpu/drm/i915/gt/intel_gsc.c
>> rename to drivers/gpu/drm/i915/gt/intel_heci_gsc.c
>> index 976fdf27e790..f57771470dba 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gsc.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_heci_gsc.c
>> @@ -9,7 +9,7 @@
>>   #include "i915_reg.h"
>>   #include "gem/i915_gem_lmem.h"
>>   #include "gem/i915_gem_region.h"
>> -#include "gt/intel_gsc.h"
>> +#include "gt/intel_heci_gsc.h"
>>   #include "gt/intel_gt.h"
>>
>>   #define GSC_BAR_LENGTH  0x00000FFC
>> @@ -38,10 +38,11 @@ static int gsc_irq_init(int irq)
>>   	return irq_set_chip_data(irq, NULL);
>>   }
>>
>> -static int
>> -gsc_ext_om_alloc(struct intel_gsc *gsc, struct intel_gsc_intf *intf, size_t
>> size)
>> +static int gsc_ext_om_alloc(struct intel_heci_gsc *gsc,
>> +			    struct intel_heci_gsc_intf *intf,
>> +			    size_t size)
>>   {
>> -	struct intel_gt *gt = gsc_to_gt(gsc);
>> +	struct intel_gt *gt = heci_gsc_to_gt(gsc);
>>   	struct drm_i915_gem_object *obj;
>>   	int err;
>>
>> @@ -68,7 +69,7 @@ gsc_ext_om_alloc(struct intel_gsc *gsc, struct
>> intel_gsc_intf *intf, size_t size
>>   	return err;
>>   }
>>
>> -static void gsc_ext_om_destroy(struct intel_gsc_intf *intf)
>> +static void gsc_ext_om_destroy(struct intel_heci_gsc_intf *intf)
>>   {
>>   	struct drm_i915_gem_object *obj = fetch_and_zero(&intf-
>>> gem_obj);
>> @@ -138,15 +139,15 @@ static void gsc_release_dev(struct device *dev)  }
>>
>>   static void gsc_destroy_one(struct drm_i915_private *i915,
>> -			    struct intel_gsc *gsc, unsigned int intf_id)
>> +			    struct intel_heci_gsc *gsc, unsigned int intf_id)
>>   {
>> -	struct intel_gsc_intf *intf = &gsc->intf[intf_id];
>> +	struct intel_heci_gsc_intf *intf = &gsc->intf[intf_id];
>>
>>   	if (intf->adev) {
>>   		struct auxiliary_device *aux_dev = &intf->adev->aux_dev;
>>
>>   		if (intf_id == 0)
>> -			intel_huc_unregister_gsc_notifier(&gsc_to_gt(gsc)-
>>> uc.huc,
>> +
>> 	intel_huc_unregister_gsc_notifier(&heci_gsc_to_gt(gsc)->uc.huc,
>>   							  aux_dev->dev.bus);
>>
>>   		auxiliary_device_delete(aux_dev);
>> @@ -161,14 +162,14 @@ static void gsc_destroy_one(struct
>> drm_i915_private *i915,
>>   	gsc_ext_om_destroy(intf);
>>   }
>>
>> -static void gsc_init_one(struct drm_i915_private *i915, struct intel_gsc *gsc,
>> +static void gsc_init_one(struct drm_i915_private *i915, struct
>> +intel_heci_gsc *gsc,
>>   			 unsigned int intf_id)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>>   	struct mei_aux_device *adev;
>>   	struct auxiliary_device *aux_dev;
>>   	const struct gsc_def *def;
>> -	struct intel_gsc_intf *intf = &gsc->intf[intf_id];
>> +	struct intel_heci_gsc_intf *intf = &gsc->intf[intf_id];
>>   	int ret;
>>
>>   	intf->irq = -1;
>> @@ -252,14 +253,14 @@ static void gsc_init_one(struct drm_i915_private
>> *i915, struct intel_gsc *gsc,
>>   	intf->adev = adev; /* needed by the notifier */
>>
>>   	if (intf_id == 0)
>> -		intel_huc_register_gsc_notifier(&gsc_to_gt(gsc)->uc.huc,
>> +		intel_huc_register_gsc_notifier(&heci_gsc_to_gt(gsc)-
>>> uc.huc,
>>   						aux_dev->dev.bus);
>>
>>   	ret = auxiliary_device_add(aux_dev);
>>   	if (ret < 0) {
>>   		drm_err(&i915->drm, "gsc aux add failed %d\n", ret);
>>   		if (intf_id == 0)
>> -			intel_huc_unregister_gsc_notifier(&gsc_to_gt(gsc)-
>>> uc.huc,
>> +
>> 	intel_huc_unregister_gsc_notifier(&heci_gsc_to_gt(gsc)->uc.huc,
>>   							  aux_dev->dev.bus);
>>   		intf->adev = NULL;
>>
>> @@ -277,7 +278,7 @@ static void gsc_irq_handler(struct intel_gt *gt,
>> unsigned int intf_id)  {
>>   	int ret;
>>
>> -	if (intf_id >= INTEL_GSC_NUM_INTERFACES) {
>> +	if (intf_id >= INTEL_HECI_GSC_NUM_INTERFACES) {
>>   		drm_warn_once(&gt->i915->drm, "GSC irq: intf_id %d is out
>> of range", intf_id);
>>   		return;
>>   	}
>> @@ -287,15 +288,15 @@ static void gsc_irq_handler(struct intel_gt *gt,
>> unsigned int intf_id)
>>   		return;
>>   	}
>>
>> -	if (gt->gsc.intf[intf_id].irq < 0)
>> +	if (gt->heci_gsc.intf[intf_id].irq < 0)
>>   		return;
>>
>> -	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
>> +	ret = generic_handle_irq(gt->heci_gsc.intf[intf_id].irq);
>>   	if (ret)
>>   		drm_err_ratelimited(&gt->i915->drm, "error handling GSC
>> irq: %d\n", ret);  }
>>
>> -void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
>> +void intel_heci_gsc_irq_handler(struct intel_gt *gt, u32 iir)
>>   {
>>   	if (iir & GSC_IRQ_INTF(0))
>>   		gsc_irq_handler(gt, 0);
>> @@ -303,25 +304,25 @@ void intel_gsc_irq_handler(struct intel_gt *gt, u32
>> iir)
>>   		gsc_irq_handler(gt, 1);
>>   }
>>
>> -void intel_gsc_init(struct intel_gsc *gsc, struct drm_i915_private *i915)
>> +void intel_heci_gsc_init(struct intel_heci_gsc *gsc, struct
>> +drm_i915_private *i915)
>>   {
>>   	unsigned int i;
>>
>>   	if (!HAS_HECI_GSC(i915))
>>   		return;
>>
>> -	for (i = 0; i < INTEL_GSC_NUM_INTERFACES; i++)
>> +	for (i = 0; i < INTEL_HECI_GSC_NUM_INTERFACES; i++)
>>   		gsc_init_one(i915, gsc, i);
>>   }
>>
>> -void intel_gsc_fini(struct intel_gsc *gsc)
>> +void intel_heci_gsc_fini(struct intel_heci_gsc *gsc)
>>   {
>> -	struct intel_gt *gt = gsc_to_gt(gsc);
>> +	struct intel_gt *gt = heci_gsc_to_gt(gsc);
>>   	unsigned int i;
>>
>>   	if (!HAS_HECI_GSC(gt->i915))
>>   		return;
>>
>> -	for (i = 0; i < INTEL_GSC_NUM_INTERFACES; i++)
>> +	for (i = 0; i < INTEL_HECI_GSC_NUM_INTERFACES; i++)
>>   		gsc_destroy_one(gt->i915, gsc, i);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.h
>> b/drivers/gpu/drm/i915/gt/intel_heci_gsc.h
>> similarity index 52%
>> rename from drivers/gpu/drm/i915/gt/intel_gsc.h
>> rename to drivers/gpu/drm/i915/gt/intel_heci_gsc.h
>> index fcac1775e9c3..a20632a4316b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gsc.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_heci_gsc.h
>> @@ -2,8 +2,8 @@
>>   /*
>>    * Copyright(c) 2019-2022, Intel Corporation. All rights reserved.
>>    */
>> -#ifndef __INTEL_GSC_DEV_H__
>> -#define __INTEL_GSC_DEV_H__
>> +#ifndef __INTEL_HECI_GSC_DEV_H__
>> +#define __INTEL_HECI_GSC_DEV_H__
>>
>>   #include <linux/types.h>
>>
>> @@ -11,7 +11,7 @@ struct drm_i915_private;  struct intel_gt;  struct
>> mei_aux_device;
>>
>> -#define INTEL_GSC_NUM_INTERFACES 2
>> +#define INTEL_HECI_GSC_NUM_INTERFACES 2
>>   /*
>>    * The HECI1 bit corresponds to bit15 and HECI2 to bit14.
>>    * The reason for this is to allow growth for more interfaces in the future.
>> @@ -19,22 +19,22 @@ struct mei_aux_device;  #define GSC_IRQ_INTF(_x)
>> BIT(15 - (_x))
>>
>>   /**
>> - * struct intel_gsc - graphics security controller
>> + * struct intel_heci_gsc - graphics security controller HECI interfaces
>>    *
>>    * @gem_obj: scratch memory GSC operations
>>    * @intf : gsc interface
>>    */
>> -struct intel_gsc {
>> -	struct intel_gsc_intf {
>> +struct intel_heci_gsc {
>> +	struct intel_heci_gsc_intf {
>>   		struct mei_aux_device *adev;
>>   		struct drm_i915_gem_object *gem_obj;
>>   		int irq;
>>   		unsigned int id;
>> -	} intf[INTEL_GSC_NUM_INTERFACES];
>> +	} intf[INTEL_HECI_GSC_NUM_INTERFACES];
>>   };
>>
>> -void intel_gsc_init(struct intel_gsc *gsc, struct drm_i915_private *dev_priv);
>> -void intel_gsc_fini(struct intel_gsc *gsc); -void intel_gsc_irq_handler(struct
>> intel_gt *gt, u32 iir);
>> +void intel_heci_gsc_init(struct intel_heci_gsc *gsc, struct
>> +drm_i915_private *dev_priv); void intel_heci_gsc_fini(struct
>> +intel_heci_gsc *gsc); void intel_heci_gsc_irq_handler(struct intel_gt
>> +*gt, u32 iir);
>>
>> -#endif /* __INTEL_GSC_DEV_H__ */
>> +#endif /* __INTEL_HECI_GSC_DEV_H__ */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index fbc8bae14f76..0fd7baf5b0cf 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -47,10 +47,10 @@
>>
>>   /*
>>    * MEI-GSC load is an async process. The probing of the exposed aux device
>> - * (see intel_gsc.c) usually happens a few seconds after i915 probe,
>> depending
>> - * on when the kernel schedules it. Unless something goes terribly wrong,
>> we're
>> - * guaranteed for this to happen during boot, so the big timeout is a safety
>> net
>> - * that we never expect to need.
>> + * (see intel_heci_gsc.c) usually happens a few seconds after i915
>> + probe,
>> + * depending on when the kernel schedules it. Unless something goes
>> + terribly
>> + * wrong, we're guaranteed for this to happen during boot, so the big
>> + timeout is
>> + * a safety net that we never expect to need.
>>    * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs to be
>> resumed
>>    * and/or reset, this can take longer. Note that the kernel might schedule
>>    * other work between the i915 init/resume and the MEI one, which can add
>> to @@ -162,7 +162,7 @@ static int gsc_notifier(struct notifier_block *nb,
>> unsigned long action, void *d  {
>>   	struct device *dev = data;
>>   	struct intel_huc *huc = container_of(nb, struct intel_huc,
>> delayed_load.nb);
>> -	struct intel_gsc_intf *intf = &huc_to_gt(huc)->gsc.intf[0];
>> +	struct intel_heci_gsc_intf *intf = &huc_to_gt(huc)->heci_gsc.intf[0];
>>
>>   	if (!intf->adev || &intf->adev->aux_dev.dev != dev)
>>   		return 0;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> index 4f246416db17..cced240ef8a4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> @@ -3,7 +3,7 @@
>>    * Copyright © 2014-2019 Intel Corporation
>>    */
>>
>> -#include "gt/intel_gsc.h"
>> +#include "gt/intel_heci_gsc.h"
>>   #include "gt/intel_gt.h"
>>   #include "intel_huc.h"
>>   #include "intel_huc_fw.h"
>> --
>> 2.37.3

