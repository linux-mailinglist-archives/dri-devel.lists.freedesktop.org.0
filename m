Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B5B49F06B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 02:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B65B10E21A;
	Fri, 28 Jan 2022 01:17:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E9410E21A;
 Fri, 28 Jan 2022 01:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643332668; x=1674868668;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e7ckuY/B0zXwHoHvMa1vzXgCjuZwYk1W8X3ljRDzu1s=;
 b=jh3/hJiNfXScs6PNUW2Tcx89+MhuSPb2AClJ5F8QBHGkyGlSk4xfGDQj
 KIz5NAI8bAbV+3v3R429gfklCkoXF0bs2TtAQ7fpaAwCty1darImSSFdj
 fIMzl6ZqtkylQ90PpWAI9JSFjL73NLJnHBJAqisp0kE55hiclcqpWD7l0
 +wOPFf2Onmq4IHKRSjTifZZcEc0Yo4zTaMacQaSemBlq1zSnwbmt22b7I
 pajMnL3rF1Y1NcdsUDVAg/lGaATuU1g8IC3Nj86UEeMMo0M4UZFWadfx3
 Jn4qC4ufq0Aq350xWIwLMZigkRwSme/qFKDwFzlOqZMAgkXKGOc+7UOlK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227683652"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="227683652"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 17:17:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="696889946"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga005.jf.intel.com with ESMTP; 27 Jan 2022 17:17:48 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 27 Jan 2022 17:17:47 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 27 Jan 2022 17:17:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 27 Jan 2022 17:17:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 27 Jan 2022 17:17:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8g47vUUm9XDEJpAVlEs44ncZndLwvJIelsuO/pvoQiVmOyrlArWD6XK15jZKzILYoGJmDbuqx3Py+c81am3DMwDDkrkStEQH1UaIQVne5WXQQOMkrcXwy93LtwgBFSMj4DUZSFmuXvJjDoiosfBok9VDqI2pJNqHNrpPVo9MvYvDzAztzW93J4GKifq9IwTRqHy3dl/opvtA523Zv/q4KNeuW/GFe/lZB0MUpbPP2KzLkNK91Nxn6vyNMe+BKhL/VhMrxucTcJmEpnAhdIRE27cPP9UNzRIbBQVKMTPOY5/y8FnzAQ9Qx7ANmIhcogSGt+So9QFOuok5HZAUNwcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rVm68cXXIARTTCuR1ebnBQVWYJ0xAhziFyIg2W9O5o=;
 b=XKy/RktAOYt5ERkZMnNBu/OG2VTQrU+KkU7JQkHWzkJ3cx3SYtxuHtiSAVRsAmIfBTHvpSGsTfw+FTUIwTRVpLJ+P1lhdXRubZDAw/cx7VvBFBZFXxjvukVofZ5tjPhCAAuIQoY7Eyp9GSYNxCxemeSiAbTEqZ6DDLqenpNS+mEErhzU8h/arZdVsorss7i+MK76Zb6UP6bDniOIF/hV2EsmNhSxNX9gcaaRzHn1Cc1nDW1iQt6XVfuizEhRLnobpD/OrqggT5XekcH8zum9DCoyiN47Woc8ogEwZ7qYB6THqM52AhB/00oySz29BbjI/QfVtdlmPutq0OA6eNxRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 01:17:44 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4930.015; Fri, 28 Jan 2022
 01:17:44 +0000
Message-ID: <d01902bb-354d-828d-8ba6-a03c1664a5e9@intel.com>
Date: Thu, 27 Jan 2022 17:17:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/uapi: Add query for hwconfig
 table
Content-Language: en-GB
To: Jordan Justen <jordan.l.justen@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
 <20220119203541.2410082-3-John.C.Harrison@Intel.com>
 <87k0eksn0w.fsf@jljusten-skl>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87k0eksn0w.fsf@jljusten-skl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR2001CA0003.namprd20.prod.outlook.com
 (2603:10b6:301:15::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcdef292-95b5-4238-11c9-08d9e1fbfce6
X-MS-TrafficTypeDiagnostic: SA0PR11MB4702:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SA0PR11MB470244DB72D9706BB4CADFB8BD229@SA0PR11MB4702.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCcYnD5VPpIdf4idcqNSxcfmwdLDqp+mdNiG72mcd5PZfYbRmmv79By6V0m9wvNwtYo/GzGK7s3BLL+TB//n8fhzcbKK/IcYdapNp5n6qTiVe9ZensfmPOe3EEcU0i7xrM/GhULC/oAaf4wOcgbWS5zz3iWqHNeGA1qG6Pul0pYGa+6+w0vqWRwwdJ83nwG+bfKPGQy+ySa36VCUDE45+IHJR1gldbCEH8W7vmC7ukhHG0aQkuDjmlwjvEniZ/ghU3/SwAsaORkr9LH4S3LSLht5hEexjjCc1iJ2g5vgsWYHiq77EqVqe9ZvDT1Dgbk1QgPdYLM1zgYoViUq9UbBhS0kiCcjrHC1WmfZGFzhwqfuxU2Mjla5RZohoKuqx4rtFTR8Lo3e/upgmTrpjwhbO9JNX/vTdz5aI1oOPKFpqK6Az6/lK08ubkFtcRV92Elw1SuiXPVZxVH+yGHHJx/ME5UFVeDH+XMa//PGac5JqdU04lKILTGWJBvl8pemWAmpbLdKmCMdLnI9oMT/w9ix/6yjprL9f/Ow9EwLJ5tV/UcPy3+0gAsq/k/24QZg72q3qKc9PRojmzA5M3d0uzOztUsWErb3qvz6JBbKinTsSGK2xx1S28GOLoqfSIsqqPM4aBOVKUA9QbKZ/CPyJDvlaloeffxJmXTyDxw3aAkm6K8tVrwdnydWylhxxFQIblW1SsUge4l/Ck4ZGdQfwpKV8NkB5ycAHci9c9PuyzdpCqrHfZyOhOge94wKurynmcwE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(6512007)(31696002)(83380400001)(316002)(450100002)(53546011)(508600001)(6486002)(54906003)(86362001)(5660300002)(66946007)(4326008)(36756003)(82960400001)(2616005)(26005)(186003)(66476007)(38100700002)(107886003)(66556008)(8676002)(31686004)(2906002)(8936002)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzFpRldsdEhoRHNBUjVBcWp6MnlOb3BVOE5HS25ncDlySFFXb3FzQjJWVm4y?=
 =?utf-8?B?UkFKTDB6dmhuVTl3b0IyRnh0S2ZqbDdCMjMxaCtKUjJWWXFiQmZwdFQ0UE92?=
 =?utf-8?B?QVRCZ01aSE94YjRpQWdmbjZPUG5rRkNwN2FjRmYySUVsOHRLM3ZreE0zWUp4?=
 =?utf-8?B?azJxaVlaQTdZaTRSQ2FDQW45T09DTnRLa2NDcnIwVjNHVEZIUkRrL1pUWEZw?=
 =?utf-8?B?cHdEV3lSUkxPbEVyT2l2WHpEcTBzU3VobmJnZTlGYmxlTjBzWXRERDkvYVFP?=
 =?utf-8?B?MlhqRndGV2RXTkxPemV6eXR1OWxwdE53UEc0dUtRbnp3a2FueWY3czlpUVFO?=
 =?utf-8?B?L2hDY3RjcWc2eEs5VDdJUWpIQUZIN3BTbGx1blQzQWs1ZkZEbGp2QWtDcGtY?=
 =?utf-8?B?Q2wyTjFZSHUwSmZUVEtIWjdHQ1l6TmNtRUZkMS9BQVFrKzJ6TkdNNXpNdDhj?=
 =?utf-8?B?aFJwNGE4U2Joc3VTeDAxWHZFdWFNMmFkaURuY2htRzFsTmtUV2t4QTZjQTZl?=
 =?utf-8?B?R3ZWTUJFNUxHalErakR3ZG1BZUFrY1dDOVNMc1VpRTZxUHZvZ2ZYZy9ITEs3?=
 =?utf-8?B?bUZwRzNDb2dSSXk4WGxYZm5EdHpwYjY5aS9oOUhCZHdUNStsVlFuaG9SSnpJ?=
 =?utf-8?B?d3NFWkoyRVpSSlJKN3p6MERxQzFRQkRmYVQwOUpzUnI3M0NUQ2E4NkJFeDhp?=
 =?utf-8?B?bFJLMlp4dXNTQnN3YXV1dnlabW1OQjRYdjRiV3pNanVLL2wrU0VIcjVNcDAz?=
 =?utf-8?B?SGFpYlVZblBVSm5CUDE1R2tNUm1kY0l3SlZldU1KVytFVVdVVC9pbjlaMWdD?=
 =?utf-8?B?aVFnZk0xUHlkR1F5VVlsaWIvcUsycnRXdCtUK1FXQUFwK2JSTUtTbGF5bVla?=
 =?utf-8?B?Nlk3YmlPMEprUWY1TDZDaXRNaHBSYkhYZkgrOHJoRDg4OHZwc2RVVitqT1NF?=
 =?utf-8?B?N3pjTDZkVFlBbElnQmc3TEpXRkJBVERGSVN5aE04WWN0WTAvQnBTaFNPMllE?=
 =?utf-8?B?cnA1Uzd6WTR0LzY5UllhbHIvd0RZUDRETVdyTE1WZ0lEem9TTk9zbHRweVpi?=
 =?utf-8?B?SkFIemZLblBycGo0L0lZdWJNOHFHam1wc05nRGVRM0Ftd1psWHg3VHMyY1Er?=
 =?utf-8?B?ZTJKMDYvNVVtQ0xaZEhLU2tMU2s3RXJhOXZTUnJ5dWk4eDB1cFZPMWhmdUFL?=
 =?utf-8?B?cmpQVDFTMDNiaDZjNkV2VnZ2S0ZXKzFwV3U4SVhacFdDWFFtTjlVNXQ5elFE?=
 =?utf-8?B?ZDN5ZFNob2RqTkdaMXNib3p4NlRvalJWU1N1UThoWkhWTGtHMW15cWRnLytz?=
 =?utf-8?B?RFQxd0xLeHpqMVVsRVRBSmFmMGw5MzQ0cnBCWWdqN2tJOG40ZVFUZ3ZjT0Ev?=
 =?utf-8?B?eHlXZGU4RzlvMG43YXNRQlREVXA3eGcrRTdQeHNJdXk0WUVmUXhIalMxMkkx?=
 =?utf-8?B?UVFTNEhDS2VEdFNLL2prNHp3RFpXRWpZWkpoRVpGd3kyRjJXT1RteVNNR1pK?=
 =?utf-8?B?WFY0TlhLYlVadDdKR1p3VmQ1UFFFK0hUd09yY2VRRG5ZVTNxQXo5eHl2SVJZ?=
 =?utf-8?B?Ly9BMTExZmJaT3EySDJRQ3pHcThSSzl3WCtMb1M3VTQrMWJwbXdlZUQrbTRF?=
 =?utf-8?B?Uld4d1lPMWlBNjlmL3N1YVNDbno0bHE1UEprcjA2d0ZaTzY2OVJDUjVtcWVt?=
 =?utf-8?B?YTVKRXVBZGV5Wll5MUhrY3o1L0NEREdPbHNzSExvWnFyYncyMTdTNDY1a1gr?=
 =?utf-8?B?THN5U2V5UGpEYzdTMDhEVDBnUFVBcDdHVTN3eW1HT2J5RFBZdWNJdlZrdHhL?=
 =?utf-8?B?UWhPcmw3WHA1dEZSbVk4RVJ2alZUNStUaWFYc25lMlJTbDdoQzlRam9wSElz?=
 =?utf-8?B?N3ZvSHcxczRSSFovUFBQRVZDZ0duaVZwSkRxT2NrN09HVlpMRjFHdlRaVGs3?=
 =?utf-8?B?bnlJYTBxNEN2RWNncW1IM2thQ1VQMVY3VG92QlhFb1JRSjVnWGkyY3Y5ZVJw?=
 =?utf-8?B?TE1UaU9rT0RmZThQeTk0Ujlqc21DaWEyazdBUENCblVGZEp4Z0VMbnNQOHcr?=
 =?utf-8?B?R0FGUzl6WVVpenJ6b05jbXlVb2VOSGVueG8wQTY2eVY5dkxHZHJqL3dVWFRX?=
 =?utf-8?B?UkFyVnR2Uzlkbk1NMmJYSldWSjFGOFZsQldUWFIxazFCN2RvUXdxVm4zNUF4?=
 =?utf-8?B?cmUvUnNnWHl0NHRuZTZ3cHNKUjJ3bVY0dFpjVW42aitnYWowZGZvVUJTMkNw?=
 =?utf-8?Q?GYm3KqaBVBK3XoQOm402dNv7zUJdKoJGqqEQ8Spt8s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdef292-95b5-4238-11c9-08d9e1fbfce6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 01:17:44.7644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zxv/P103jexHuIYRVFzVXlk/WxJhkI+Kqm8O0AguWaz4P2SrKiRKsuruCe1a3d0Z4AvNxVVmfC2spBI9wG0yNqq/8URKmLJPlrQQw0PRRss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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
Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/27/2022 16:48, Jordan Justen wrote:
> John.C.Harrison@Intel.com writes:
>
>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> GuC contains a consolidated table with a bunch of information about the
>> current device.
>>
>> Previously, this information was spread and hardcoded to all the components
>> including GuC, i915 and various UMDs. The goal here is to consolidate
>> the data into GuC in a way that all interested components can grab the
>> very latest and synchronized information using a simple query.
> This "consolidate" goal is not what I was told for the purpose of this.
> I don't think these paragraphs are the true.
The intention is to remove multiple hardcoded tables spread across a 
bunch of different drivers and replace them with a single table 
retrieved from the hardware itself. That sounds like consolidation to me.

>
>> As per most of the other queries, this one can be called twice.
>> Once with item.length=0 to determine the exact buffer size, then
>> allocate the user memory and call it again for to retrieve the
>> table data. For example:
>>    struct drm_i915_query_item item = {
>>      .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
>>    };
>>    query.items_ptr = (int64_t) &item;
>>    query.num_items = 1;
>>
>>    ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>
>>    if (item.length <= 0)
>>      return -ENOENT;
>>
>>    data = malloc(item.length);
>>    item.data_ptr = (int64_t) &data;
>>    ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>
>>    // Parse the data as appropriate...
>>
>> The returned array is a simple and flexible KLV (Key/Length/Value)
>> formatted table. For example, it could be just:
>>    enum device_attr {
>>       ATTR_SOME_VALUE = 0,
>>       ATTR_SOME_MASK  = 1,
>>    };
>>
>>    static const u32 hwconfig[] = {
>>        ATTR_SOME_VALUE,
>>        1,             // Value Length in DWords
>>        8,             // Value
>>
>>        ATTR_SOME_MASK,
>>        3,
>>        0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
>>    };
> You said on 03 Nov 2021 that you would remove the parts of this commit
> message that document the format. Why? Because i915 will not make any
> guarantees as to the format of what is returned. Thus, i915 should not
> comment on the format.
And you replied that you would prefer to keep it.

>
> Can you Cc me on future postings of this patch?
>
>> The attribute ids are defined in a hardware spec.
> As this spec is not published, it's hard to verify or refute this claim.
>
> Think this is a more accurate commit message for this patch:
>
>      In this interface i915 is returning a currently undocumented blob of
>      data which it receives from the closed source guc software. The
>      format of this blob *might* be defined in a hardware spec in the
>      future.
>
> I'm sure you will prefer to replace "might" with "is planned to". I
> think "might" is more accurate, but I suppose the other would be
> acceptable.
>
> -Jordan
Getting brand new spec documents published is not a fast process. That 
doesn't mean it isn't going to happen. Also, just because a document is 
currently confidential and private doesn't mean that it doesn't exist.

John.


>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_query.c | 23 +++++++++++++++++++++++
>>   include/uapi/drm/i915_drm.h       |  1 +
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>> index 2dfbc22857a3..609e64d5f395 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -479,12 +479,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
>>   	return total_length;
>>   }
>>   
>> +static int query_hwconfig_table(struct drm_i915_private *i915,
>> +				struct drm_i915_query_item *query_item)
>> +{
>> +	struct intel_gt *gt = to_gt(i915);
>> +	struct intel_guc_hwconfig *hwconfig = &gt->uc.guc.hwconfig;
>> +
>> +	if (!hwconfig->size || !hwconfig->ptr)
>> +		return -ENODEV;
>> +
>> +	if (query_item->length == 0)
>> +		return hwconfig->size;
>> +
>> +	if (query_item->length < hwconfig->size)
>> +		return -EINVAL;
>> +
>> +	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
>> +			 hwconfig->ptr, hwconfig->size))
>> +		return -EFAULT;
>> +
>> +	return hwconfig->size;
>> +}
>> +
>>   static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>>   					struct drm_i915_query_item *query_item) = {
>>   	query_topology_info,
>>   	query_engine_info,
>>   	query_perf_config,
>>   	query_memregion_info,
>> +	query_hwconfig_table,
>>   };
>>   
>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 914ebd9290e5..132515199f27 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -2685,6 +2685,7 @@ struct drm_i915_query_item {
>>   #define DRM_I915_QUERY_ENGINE_INFO	2
>>   #define DRM_I915_QUERY_PERF_CONFIG      3
>>   #define DRM_I915_QUERY_MEMORY_REGIONS   4
>> +#define DRM_I915_QUERY_HWCONFIG_TABLE   5
>>   /* Must be kept compact -- no holes and well documented */
>>   
>>   	/**
>> -- 
>> 2.25.1

