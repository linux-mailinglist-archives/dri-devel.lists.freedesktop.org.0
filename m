Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3125B91FA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 03:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8100810E240;
	Thu, 15 Sep 2022 01:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2016E10E23F;
 Thu, 15 Sep 2022 01:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663203735; x=1694739735;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b9zPyURNh+3emFCfBRYHU8zT1uhrg1K4MXpp1vE+x1s=;
 b=hReQKuD7ow58n47monKsVYSgmu26ImBU1r/KvE5WxQJcOxfL+joLmgJi
 /0tkafzc8btXlJdISQtCOcMQ0/KykPfO2E30pMQ7ZGRRK+kWE6fiZyw4a
 1I5XpAktYwOPxJBEZswu2a+JAG+ZCteyvKywU2QH5FEQwPVUV+YTnGb6i
 4TVWSVHLqdzQb403mW5qRHPQylWLwT/e/jiCFpAo9O1KKtz8x5JqkPIw3
 NGBqlllXJB8Q4ucCzWB7TRp9/GZZVlcue2YwP5G05LcFGlZVNn2NvoxXQ
 SP83PL25lkozcQQ3IM97u2JfXA/uan3FAtiOh5iFv7lkKjRTdHEpdBfCB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="299393581"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; d="scan'208";a="299393581"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 18:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; d="scan'208";a="647618691"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 14 Sep 2022 18:01:54 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 18:01:54 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 18:01:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 14 Sep 2022 18:01:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 14 Sep 2022 18:01:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAUqCVYCZ/OKqe1Z36jVWywgnkC4Bo/BuwX5ixSEwhLErAg8YR2xFMDzsIsblbsffsvJnKrXYAeIh60LKfgRBh/25jwe77eiwFV9tkuV8nrJ8UeMtaDR8cD6WZGP1SEqUlUvFu8Be0UZS8MdDSNn8HIcSH/civIdvDK55QLPYWbvyo41nHvkoeVBvKa+EabB6Dpklefg6+dIrnX2eNchq79fZI2JQlZUi8WnB4lk8rmi4P2OfM3G+L2qnT88JU0Q7gPEcDr/ju496LYo1Giics6rRKjVCFLXgPM1th25R0GrNfgQh+LlvIEUthT/2lsDy0kAwAP0qmtlqXM4CJxeXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Stg68D5ynfvveQUyUi3ZkVU1wsik09CBVFZOk0oIojk=;
 b=IkMp4KzTb34CMbEv0kuSXM9sO/V+j65ZvwB+FOHMa1AzP0x3GWKB4+9bZHaSu8R43wcAYJDXvYXBeTphdLdz09gqu1ozn4DHDTmwKm5uVytSXNFbyOPCqn39TEgbjqJBVth5a/folfTbkKeV3c8885KWpLIpZmH1oomDxIyca1Qa2GNPIMTFt/qzP6kkOwLa90u7g/TP1L3abI7ReiRpUGBz9jJGcmhiOjRkuqYy+vgvlmmn8mQHUxfpfrfGElXgP2WsNLgvqH7fm+Ih+IffkyxOSwCxaa+flhEsyXUsjm0BB4LQdwlWYtY+ZN42pASHUgUJK+Amo3xySi4kCpyTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 15 Sep
 2022 01:01:52 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::c057:13f9:7c74:62b4]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::c057:13f9:7c74:62b4%4]) with mapi id 15.20.5632.014; Thu, 15 Sep 2022
 01:01:51 +0000
Message-ID: <c77d7988-13c0-86b6-51b6-6dbb4165d5b8@intel.com>
Date: Wed, 14 Sep 2022 18:01:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/4] drm/i915: Handle all GTs on driver (un)load paths
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220914220427.3091448-1-matthew.d.roper@intel.com>
 <20220914220427.3091448-5-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220914220427.3091448-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::6) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CO6PR11MB5620:EE_
X-MS-Office365-Filtering-Correlation-Id: dc23e24d-cbfd-4893-f29b-08da96b5dfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45XWRjyzWO4XZyDty94qvyZu8SjHuKjT/xLPGx5ZVPXa348ZD90cfHrJjTTVULg3OxmKYt1/QDdYHc9C2Syuga8iUmjphmOAVOf9yOwTyKFwgj+XyrBRk6dfhtA4f+wevmOJ15YHUuM0q+tUZxIZxgFR96rNkoEq74H5lownVgs9VZMqKb6Rs6Er+J0YEelsfvizjxQRE98mu9SirioCZsy1u9nE/dGFJAw1ZK2CBL3K9fq5uc+zNJHKlKiXdlWs+hlHTJidD3qiJ9Fkb7JZmUEGz/4+XzgGTt5mmPeHXTmGk4uAQAdM6xbGJ0qpr7esseAw2iQQbxmGExQ9yRukFnq/ZIk1RwDJ9mfuobpX+IXli091PKbTh3Iy0bRTUOdbBeIKfVfZip+qInPFezWXTmahgAFVbUQE+QAkGXFwVK97OtQ3cEXdynVEwBMbOcedaPkrqKvJsNmNd2otn1T25pM6BnFT/gRApBs+TDcZJbqgn0gQfPvY6Mr/UVjconp63Mq5ZvmCPREcbLH0jEIkdrP84wpez0su1QCNvBLkDNfCRbQ1qxNr3GMXCu0oNGHY8bDaiogMOB6YOv+4ZboK0io4ug7evv9ulhSyfZs+07D3wWqmcESyGyPNT+LrD6CcfZarA85+U3Nvk1TsYQ2bVuvdh3TAKeQoc0u2xw2YrWkc+G+xqhlohI78VdDDLdqW6dlU7qKxkumynZELMlTScYVUn/NO1r6jcjHgqVsctbI2cWXL+/Z87ri5tLUVPLwFS3L85ezZ9rdj5XsrjctOAcD2ifqqKLjUFyjMyN5kuu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(66476007)(8676002)(2906002)(86362001)(41300700001)(53546011)(316002)(107886003)(31696002)(8936002)(186003)(6486002)(2616005)(6512007)(82960400001)(450100002)(26005)(5660300002)(66946007)(83380400001)(4326008)(6506007)(36756003)(478600001)(66556008)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emVuSERYU3QvTnRvLzlnaHRzRHdCdm1xZXBKNURVMWVrRFNrWkZNVC9zSWox?=
 =?utf-8?B?ZmtHMG1oQ0h3N1NRblhQVlB0WlIxZ0xwMVkwdWFXd2FDU2VsdEpnbERxSTl2?=
 =?utf-8?B?NmdxZWZ0YTRNaWlMcTl5SnBxNkk3UlY2ZlNwZnAvbDh6a1NHeGFHZ3pFYWpl?=
 =?utf-8?B?V2M2djlNSUFDT0hBcHMzazRoV2ZkcFJWQVp2a1dzMkZkazdLamxwend0dnZT?=
 =?utf-8?B?dFc4NC9qUE5ucHdiZzFhVXZPR0orNVVVVVlicjc1dlJicHA1OVJoSlR0K0N0?=
 =?utf-8?B?R214dHRhR2tHQ2hQY2Y4a2xHQU4zbXAyTlFHQjNTZVA1eEhpWk5vVXdubWVD?=
 =?utf-8?B?ODR0dVdlbWhPenNEVlJibWp4OFJDUWdtdjBxUGxBMUFHV2ZxTGxZdTlVTTBI?=
 =?utf-8?B?S21zMGtGeDBBSTV6T0tTS2Z0SG1ZZmdJY04zLzArcXVLbGMyeDNGa1gwczU5?=
 =?utf-8?B?MEpsYWhtQXVvM0JYUWNEN2p4SUJpaGZjaGcrOUVUUHZnS2ZpWVZHVTFKTWg0?=
 =?utf-8?B?M2doak9vRU1aOHhyUjBiSkx0V2crZktxaUIzUG9kZitROElxSnBGTmxySUVw?=
 =?utf-8?B?WWFQbGMyOUUzeDhiVzJvQS9PM3k4RlZpblVDRFFleDUzZmFQc2NlWEZLQXhl?=
 =?utf-8?B?V1orQXhrMVd2ZGVpT3JXQWsxSkhlaU8vcndWbWFneWU5ZWlyWUVFV041T1ht?=
 =?utf-8?B?VGd1WENTME91Z2g4RkFKbWFRaGtsRmUyQVJKbUUwb2Z0Sk93TjVxK2pKbUFC?=
 =?utf-8?B?b2FaWEFYU0hzdXMxY2xxODBzVHllVHV5VmFMVmovdEJXakdIZmlOVWU2RVNE?=
 =?utf-8?B?SjZFcU85ejB3dDVSRlF5dWM3MFVxRTF4ZFpGWGtZVFRUVXZXZTczUS8yblBW?=
 =?utf-8?B?cXRRaENOdzI1UTgzbGJrT2U0RzlCeFBma1hST1VkSnZHZmRoZFJKbkgyWHJw?=
 =?utf-8?B?NU9XSG16czlrK1pFUGNwMUpqbHVhcGFHRVYvZmpwdlhJS1JSMnpQaHRyOTg5?=
 =?utf-8?B?MFJpdGNQeUFLakNzaWpDbFVjcGlyWWN0ODdHWUxXeFhUREl4SE9sQXE2cENx?=
 =?utf-8?B?VG8rL0FWQkNhc3RoaUVtRmkzcWhxUmMvMXRuUGgrM2xMVHVVSTArdkJ0TjhP?=
 =?utf-8?B?QW5jMDVSZE1ld1RyOTNkUERHUDdKZGxPZjBvcHIzdFplbndoZDVZSGIycjBY?=
 =?utf-8?B?Q3EyYzdudmI4Uy9ZRmExbEhSTjdmTWo2N1JTWkhPQzB1N2ptaWpGVG9QZzVo?=
 =?utf-8?B?d3U5VDh1S1JBcEpoei9jOWJkRmltOVR2UHJUSlZOU1ZNaXozbHFWbzhJWHRW?=
 =?utf-8?B?NnVYcVE0NEh2N2NuVTlqMFVJNEdLWCtyNEt5T2tuMGJvWVBzYXR5RmVrL0xR?=
 =?utf-8?B?V1RMa0NyRFVnNVRsV001OTE2am5zU0NqMCs0TFA5VTh3SktHVVdZVFVsT3FW?=
 =?utf-8?B?Y1pIaFRRTkNhNCtDelAyaEgxNHFtcXZRVVRmWXFab01zYWswRTE3azJFUXRU?=
 =?utf-8?B?MjRLK01Ka1FHdVdmM0QwRU9oTktaT2xrRGRYZ0ptVENwMExKemc5V0lzeTlI?=
 =?utf-8?B?MnVnaUhQZ1gwSzhZZXdGcDJZUUNSVlJuYWNHU083bkdIWk5OdExKcVlQbG1w?=
 =?utf-8?B?dFZqMXl3N0dsWXFpT0t1Q3JXdlFyUWw5a3NzQzU1QjFWNTh5azVITk1UVzlN?=
 =?utf-8?B?cTlPRWlGSlA4N2FBOUVhK0daQVJldUcxdUxlN0NIcDJ2cUNoWFVlQzgzdkIx?=
 =?utf-8?B?azhzZXJSZFFIaEs0M1h3czF3eFZ4T25MUUlxbVJIUklMZ1ViS3FQeDBKVHAy?=
 =?utf-8?B?SGFsWEE5M1J2SUlWbWxhbEJKaUJpRVcvTENwclIzRGlrZG9vcUJUQlhEa0Vr?=
 =?utf-8?B?bXZGdjExTlUzS1I3OFZONTRsQmszZlZhK29zdEJWNWlnMG5CQllFZ01kUWx5?=
 =?utf-8?B?WjZkL3lRSkZpeHgyK2cxQWZQbmdCblZaY29xSWh6dnhUUEUwVVFXckVkMSt3?=
 =?utf-8?B?eVBybGVZVjBFYjA2WWRsVjFIM0kxS3F3Y2tyaGV6SWx1YldZcWl1R1NURzMx?=
 =?utf-8?B?akNZeHg1RXoyTVRMU1hqWjZXTHdmSzJxbmhYOEc5ek5tcWlLbXNJSHN1TktE?=
 =?utf-8?B?aUQraUFHN21YTW9qS3p2UjdsSndxRFNGZERpMG1RMC83MEQzY3Y2WjJrMUNB?=
 =?utf-8?Q?HA8QFAlcUAvpXo7ThLzURxk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc23e24d-cbfd-4893-f29b-08da96b5dfd8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 01:01:51.6719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1P/I4/NZDQI4an/LYBl3b0qPAcVsNDxdO048iHSJy3QVoGFNSk7zGnjP7NdRYur/O+0ck/epv+9PKczEy2yDAoUihz90lT+kbQWDhhZFlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5620
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/14/2022 3:04 PM, Matt Roper wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> This, along with the changes already landed in commit 1c66a12ab431
> ("drm/i915: Handle each GT on init/release and suspend/resume") makes
> engines from all GTs actually known to the driver.
>
> To accomplish this we need to sprinkle a lot of for_each_gt calls around
> but is otherwise pretty un-eventuful.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_driver.c |  3 +-
>   drivers/gpu/drm/i915/i915_gem.c    | 46 ++++++++++++++++++++++--------
>   2 files changed, 36 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c459eb362c47..9d1fc2477f80 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1661,7 +1661,8 @@ static int intel_runtime_suspend(struct device *kdev)
>   
>   		intel_runtime_pm_enable_interrupts(dev_priv);
>   
> -		intel_gt_runtime_resume(to_gt(dev_priv));
> +		for_each_gt(gt, dev_priv, i)
> +			intel_gt_runtime_resume(gt);
>   
>   		enable_rpm_wakeref_asserts(rpm);
>   
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index f18cc6270b2b..0bf71082f21a 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1128,6 +1128,8 @@ void i915_gem_drain_workqueue(struct drm_i915_private *i915)
>   
>   int i915_gem_init(struct drm_i915_private *dev_priv)
>   {
> +	struct intel_gt *gt;
> +	unsigned int i;
>   	int ret;
>   
>   	/* We need to fallback to 4K pages if host doesn't support huge gtt. */
> @@ -1158,9 +1160,11 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>   	 */
>   	intel_init_clock_gating(dev_priv);
>   
> -	ret = intel_gt_init(to_gt(dev_priv));
> -	if (ret)
> -		goto err_unlock;
> +	for_each_gt(gt, dev_priv, i) {
> +		ret = intel_gt_init(gt);
> +		if (ret)
> +			goto err_unlock;
> +	}
>   
>   	return 0;
>   
> @@ -1173,8 +1177,15 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>   err_unlock:
>   	i915_gem_drain_workqueue(dev_priv);
>   
> -	if (ret != -EIO)
> -		intel_uc_cleanup_firmwares(&to_gt(dev_priv)->uc);
> +	if (ret != -EIO) {
> +		for_each_gt(gt, dev_priv, i) {
> +			intel_gt_driver_remove(gt);
> +			intel_gt_driver_release(gt);
> +		}
> +
> +		for_each_gt(gt, dev_priv, i)
> +			intel_uc_cleanup_firmwares(&gt->uc);

Any reason not to have the uc_cleanup in the same loop as the gt functions?
Also, you're looping intel_uc_cleanup_firmwares but not 
intel_uc_fetch_firmwares(). Not an issue since the cleanup function will 
skip if the fetch was not done, but I though it was worth mentioning. I 
can include the loop for the fetch as part of the support for the media 
GuC (which I'll send after this is merged).

> +	}
>   
>   	if (ret == -EIO) {
>   		/*
> @@ -1182,10 +1193,12 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>   		 * as wedged. But we only want to do this when the GPU is angry,
>   		 * for all other failure, such as an allocation failure, bail.
>   		 */
> -		if (!intel_gt_is_wedged(to_gt(dev_priv))) {
> -			i915_probe_error(dev_priv,
> -					 "Failed to initialize GPU, declaring it wedged!\n");
> -			intel_gt_set_wedged(to_gt(dev_priv));
> +		for_each_gt(gt, dev_priv, i) {
> +			if (!intel_gt_is_wedged(gt)) {
> +				i915_probe_error(dev_priv,
> +						"Failed to initialize GPU, declaring it wedged!\n");
> +				intel_gt_set_wedged(gt);
> +			}
>   		}
>   
>   		/* Minimal basic recovery for KMS */
> @@ -1213,10 +1226,14 @@ void i915_gem_driver_unregister(struct drm_i915_private *i915)
>   
>   void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
>   {
> +	struct intel_gt *gt;
> +	unsigned int i;
> +
>   	intel_wakeref_auto_fini(&to_gt(dev_priv)->userfault_wakeref);
>   
>   	i915_gem_suspend_late(dev_priv);
> -	intel_gt_driver_remove(to_gt(dev_priv));
> +	for_each_gt(gt, dev_priv, i)
> +		intel_gt_driver_remove(gt);
>   	dev_priv->uabi_engines = RB_ROOT;
>   
>   	/* Flush any outstanding unpin_work. */
> @@ -1227,9 +1244,14 @@ void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
>   
>   void i915_gem_driver_release(struct drm_i915_private *dev_priv)
>   {
> -	intel_gt_driver_release(to_gt(dev_priv));
> +	struct intel_gt *gt;
> +	unsigned int i;
> +
> +	for_each_gt(gt, dev_priv, i)
> +		intel_gt_driver_release(gt);
>   
> -	intel_uc_cleanup_firmwares(&to_gt(dev_priv)->uc);
> +	for_each_gt(gt, dev_priv, i)
> +		intel_uc_cleanup_firmwares(&gt->uc);

Same here, those can be in the same loop.

Daniele

>   
>   	i915_gem_drain_freed_objects(dev_priv);
>   

