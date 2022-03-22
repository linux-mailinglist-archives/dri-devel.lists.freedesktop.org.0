Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1B4E3D64
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 12:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256AC10E1B0;
	Tue, 22 Mar 2022 11:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCF410E14C;
 Tue, 22 Mar 2022 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647947988; x=1679483988;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l7x4N4M3hXE6MNVFl5qMNyaVDxXm3qD+CExASVK4oxk=;
 b=h1i8l08+c1U/E810BYFhRMdaWoqINrXlCI5fVrjPrBhmuGYeYiMtgtvl
 quUgl+WbcSIk6WSFQG0BBeAGH8ObJDsL4uXdHc5ff37levE7JlBXEKuO3
 2RQvUAP54p2YgbhOvfKCALhaY3JCx+dOWQ3do15uTmxv7lqOHCLLcU0ma
 UZUYrGDZKlPxNPG/tsOdfDBrOnlfXpFeQylVdNMNIUY8BR+PKmYzRWjLF
 xKUg7k0AbtREFXJLZIj1Rrgg3CzL9FPIBXC5LO0Agetlb0/0ErUBVy2H3
 IXSQEAENlhZUtn+x/PUnbEvYa3A8Z7MirJnMWOPtkAQtRmt8kwYsj6guY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257741716"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="257741716"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 04:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="600844872"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 22 Mar 2022 04:19:47 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Mar 2022 04:19:46 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Mar 2022 04:19:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Mar 2022 04:19:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 22 Mar 2022 04:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niIMvLwqCNWFREw8Ar7/P8RrL9mECwuuuyL4h2WGh4blIKd8NCLixoBrU6QwiBP8sP8TJZdeBlZmnFSPQ6mW/Hlm8G9n3U/IXOB4InZY1NtqIne+9lbbTtXt1fQRxrTsW5cDl5AWuOW9/SIMgHfPLbWUoJ42mPR2uvqHTjKlGjrRBKMOT/dN/pT92Sa9eFQCa6cR8kDPNC1wQ0j8QGoDUsiQwfFx6k3OeBz9ybrFdHknbD4qmhrnuetXwGjVlWZPvQ81qiSO7NwgcVJMP20Yi6VtFL6peFrqFr2jgqhQfhMsA5O//VqAp79fe24fRApm4IALm2GYSRfvAkiR0W/nng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzqjiK6aNxfnW5OPJc7AHnGBiydWeuXrzR76dsTpd24=;
 b=BopiBuNwufQ1nFziCCQmDuYzvZ01i1n2SPzHRDNMDz0ofzn6CVsCkcw3TwfxO/TKEtv1aw9JWTZQgj6VWr4xOeaiFyS5PYGISNpuTAVVVcxMcx26uA/mfffZArocU4GBsFeqwxMQdc+u01lS7230JX945ybmFSakW8ql1lWPmN9Pw09g5IlWiTkGukFE0nxKyjwTWnq7gTP6XlTFqMOTFWRZr+CkeeRLjVk1HqhPc0r1q23X4HASNpplHZbwN6+60q1a2Fh/NfbgTPDh/G53epH4Bm9WoZEO7rSRIj4QA3J18BPEVCzLZ9VfS7rmuytU5oEEwd1XFfic9VK1MmgDoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 MN2PR11MB4319.namprd11.prod.outlook.com (2603:10b6:208:193::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 11:19:44 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::1de5:f9fb:2202:dd64%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 11:19:44 +0000
Message-ID: <94f5856c-46b6-1203-dd97-3c25667484b5@intel.com>
Date: Tue, 22 Mar 2022 12:19:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 22/22] drm: Use drm_mode_copy()
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-23-ville.syrjala@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220218100403.7028-23-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::41) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37487ef5-9185-4121-02f8-08da0bf5ddd1
X-MS-TrafficTypeDiagnostic: MN2PR11MB4319:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB43192A7A7BAA4DC3E78BA1F0EB179@MN2PR11MB4319.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yDNlnI7G1qQ63DzYeHuhii2O8CV1Fq3P4F493Y6OcPp6rUZzDVm4iGfiAUlAkaYvURckXAPqrbYSvoS222uv8sImSVUHGB1zYClYMvOt84E7ROdWNPcCU8XTr84rnhyxkWk0xiHA7lDaEUqukmrmcCt1LSJGF/cSMyVmYbvgGU9CaBWb9XMQWcsXa6os6tnRqBwdS3mTKptP68IvhhDXHb7knSOQ9AlkvwxU57xKIkbLZBcxiDcWZWBJ46csGpcITWAGZrjpY40IxVkCOB0PAufbwJAlJS/wao3whRz1c9gZViBRryFLd+KEMDFXZPFepyfgM3DnvAR6h8lsiupTL9NhpMXWAJtuPNE73V2pVxFRaq674HJqGojsvsEsDMt3gjXA9hAvFt2MP2+r5hTWDfDjX6zfxd3ZP+XXruupar3drO7yxv3pjaMcmpBUMd+eLQbFZ6Z621siLirTEaEbmOcHcPH58/xhn8eysJ0qZhDlc07AuDV+l8reOq0YaeV53b8Gd+EvS1BqyDlpngqDYzLsU7tOCTg6h+MWBsgX9yS9Eq4g6Uq2wZQ/VZ0XLry9y4tRZz9+H4MeiXv+r1zu4zmSliBaVm1RCjRbIUudqQsQUYuaedRM096TFNnuXC7XQzPwWWDsPnvGW4UBZAi+rQQi0ByM6xejXaj+Au/lN7Bm6hyWDYD7+2SiEgzQThmmKGumidUR4lS511ETiE3D29mygiScri7B+qYz6LQrgCZFn0cpZYZPAvQ9xs/JkLZx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(36756003)(6486002)(186003)(38100700002)(5660300002)(44832011)(31686004)(2906002)(6512007)(66556008)(66946007)(8676002)(4326008)(316002)(82960400001)(66476007)(2616005)(26005)(508600001)(6506007)(31696002)(53546011)(6666004)(86362001)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVdrNDZxMDkvSjNVRGY2WkkvcC9iWktpazcrMGZFdWVjTlpTL1FVUC9nLzV1?=
 =?utf-8?B?Qmp2T0ZiRHBtd1NCQzJMc2RjVlk0YS9Lc2thc0dpSjFndVJrRHlaQVRVakY1?=
 =?utf-8?B?UlluZnlVQ01YY1hsSUtpZlhkRUxsYlZHMnVQNVl1bWVVQllpMmlVWnkzeUlp?=
 =?utf-8?B?QnhjOFNsUjRIWlg1cU4xc1lSSnNFMWN5cUhHNFhweElBTTVKYUYzTkhMcWYv?=
 =?utf-8?B?OUNJWFFPYWt2NWEwVFZqUnJCNFpiRGJkT05IU1hiUXdpOFo3SjBPMTlNRzdk?=
 =?utf-8?B?c3lJYm81ZDRPNUpqZ0FhWWJzankxMzQ0dFhQcmZIQnhnZG14N3E5Z2MvUUox?=
 =?utf-8?B?dWJuVENJSW9sNDd6elJ0c1BtL1NaZVBXbklPQW9YVnl0VWhma3dlc2NyZkM4?=
 =?utf-8?B?emFMM2FISzI5S0J1ckp6OUZvdnEvdGtjMWFFendaUkE3d05BdnhEZDNSMHJD?=
 =?utf-8?B?ZXcxN05ZVVA0UVV0MThSUGhTNGlvb2hCNmpLWVhlOWxZSkNyUjUwM1NhV205?=
 =?utf-8?B?VkhwQ0E2eTBJNE9ZTFUyT1MwSUVjNGV0b05OMkpoQlJjS0w5RVAyMXRJYXJX?=
 =?utf-8?B?Zm9Vbmd6bDIvdHRSbi9FelgvME9Zb3ROS0J4UEpWOTJ4NlBtcHkwMXpnWWFW?=
 =?utf-8?B?VGlHSkZ1N3lnU2ZRSDQxSmdqbkRQVlBOcU9KcThxQm9yVHpFSStySy9WR2g3?=
 =?utf-8?B?clk5WXhhVktBaFhSY1RwcWFWdEc2N2tjT043RkNBVS84MzVHRVF4c1g0V1FG?=
 =?utf-8?B?dXdUOGF2RzhLZGhNcnRzVmFYdWRUUDkrNUgwYXdJeVJWTU9nSklockR5bERh?=
 =?utf-8?B?RUZQM082dzVla1NlLzVMcU1TdURVYzNXNlR1MzllZVM2TmlOMUJrOFlPWlV2?=
 =?utf-8?B?a2NPV09FQWdFSjNLOTNYVUt6S2VzQlBTMjdKaWhTSGVpejZtemtZRUZ4b3RS?=
 =?utf-8?B?MFdnU0N2L0o4YkZvNnFsRm1heGdzeWhqdEcvZDRzYWluMmhqWUxoY1FqZ1lv?=
 =?utf-8?B?b2RTTWoxemVWNXlQSTJSR1JLeE96RUlwNEZQM0VJOVBzQ212UlVSWG82NFZw?=
 =?utf-8?B?a2k3VU9ySHNvcnNJOEw1dDhXMjJnM292a1pkMkRLVjNLWHpQcU9BUzZ2Zmp1?=
 =?utf-8?B?Q0x2OFViRFNoR0FBWUVERkljc3FYSXlBQ1c2am5RMW02TTNIWDhYSDVVeHE5?=
 =?utf-8?B?TUY1bysvb3o3akNQTmdDbGZ4dnBpT3hzRnU2bytsY3ZnN1JRbWEvMTBtZGd6?=
 =?utf-8?B?UkZtRmRtdXFVd284UnRoZWRsWkFLZU9tdnFCV3ptajVma25OOFhLL3BaYmJy?=
 =?utf-8?B?cmpObXJIdDNSUU5SSUhjcXk5MFBVbEc0N3hSSTBoZ0NWWGl1cXpYcTROSGlr?=
 =?utf-8?B?Vm5vRjN1TkJiUjFxNGdadHFoVHNvN3Jmb0wvQzJVL29ycXVnemlmQzllZ0ZL?=
 =?utf-8?B?Ym9Pbk9QRTZqdEhzZFVsQkJ1NFF2elBxbG5SdU5TaVNPVW9NcElhblJsczBz?=
 =?utf-8?B?eXJ5d1Zpak9qR0wyd0l1SXlPeVJOSWhwZG9qS0IvRUd5S1E2NE9KMHQxWGU4?=
 =?utf-8?B?Ulgwd1RpYnRkdVgvVjdmZjhuTkpGaGt2ZFdURi80aWZlbWJ0azRPbkJ1cFM1?=
 =?utf-8?B?K0x2V2had1F1SWhEQlhUU05CNGYxZUdCaDRBbDZvc0RmZ2FYeFJmcDRWbVVS?=
 =?utf-8?B?T2kyQTRheXQ4WVVHUGRMbml5WnZJaUZKMDArVkVRMVc1aWwwQ1pkM0FFWSs3?=
 =?utf-8?B?dHZqQXlKWHIxZXRRTVZMY2hCQTNUVDhiQml4bk92ZVJOWUx5ay9nTExzcHpU?=
 =?utf-8?B?NTlaZWtYWG5OdE5zalZpaFMwUGhUbjZWRDR1RHAvdmN4cDFvYkRLQTVTUkVZ?=
 =?utf-8?B?aWpBeGoybVZ3QzFVSWxEUlBJbUFGOEI0ZDNDNW15cGhpNGZxMUZQNWxyRVUv?=
 =?utf-8?B?cC9wdVVJOHFyV2FmK0w0bXlhQkxGallSeEhNRXZ1V1NrRWhhcHhmcmM5cEh4?=
 =?utf-8?B?NERlQVBhVWlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37487ef5-9185-4121-02f8-08da0bf5ddd1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 11:19:44.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQQPxNdNA7oX6OO0jKdWXzG10wHHKvRbBBsp8M21A78p2cafdST/fphdX4FGW040on+q3yltR6F9kj19XoNkxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4319
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.02.2022 11:04, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
> 
> Even if we know the destination mode is not on any list
> using drm_mode_copy() seems decent as it sets a good
> example. Bad examples of not using it might eventually
> get copied into code where preserving the list head
> actually matters.
> 
> Obviously one case not covered here is when the mode
> itself is embedded in a larger structure and the whole
> structure is copied. But if we are careful when copying
> into modes embedded in structures I think we can be a
> little more reassured that bogus list heads haven't been
> propagated in.
> 
> @is_mode_copy@
> @@
> drm_mode_copy(...)
> {
> ...
> }
> 
> @depends on !is_mode_copy@
> struct drm_display_mode *mode;
> expression E, S;
> @@
> (
> - *mode = E
> + drm_mode_copy(mode, &E)
> |
> - memcpy(mode, E, S)
> + drm_mode_copy(mode, E)
> )
> 
> @depends on !is_mode_copy@
> struct drm_display_mode mode;
> expression E;
> @@
> (
> - mode = E
> + drm_mode_copy(&mode, &E)
> |
> - memcpy(&mode, E, S)
> + drm_mode_copy(&mode, E)
> )
> 
> @@
> struct drm_display_mode *mode;
> @@
> - &*mode
> + mode
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
