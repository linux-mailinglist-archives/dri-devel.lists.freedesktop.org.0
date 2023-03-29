Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620F76CCF18
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 02:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC4510E08D;
	Wed, 29 Mar 2023 00:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321D310E08D;
 Wed, 29 Mar 2023 00:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680050909; x=1711586909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ffdu0Gs3QwNzZwqcaJ8dLDay37fR6GAyMAEl+Obz3To=;
 b=Td9vsbsCpCUj0rMi5WwNtU+oB7xadia18v7i4Gw7LloynIDwhLk38lEZ
 X0+g3tdH7rq6Q+b4lVJUMQOpI1oQJw2CDAJg9PhPD/B7raDAz9TnN2LKb
 EydPlkzpY1YF22qNRKK21NLxfR238U7iyGY7JgUQkStccgBg7XLVAN0sX
 AK91OQ9rKY2BNnrciPTLw1Y5FiXqHs8CObWxnqZPnhgeh6ie619os92yF
 J4k5dW3S4LdY3cBVKFtVtIWiApZYKh+98BJ187IhTRqpBMtfENLdmoZpK
 YBvSuSDy1Xg3nuTn+ma1DS8gy76syy0IcWukPcuQ7Gc+JeuHnetTaf0Gc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="324635571"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="324635571"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 17:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="716679249"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="716679249"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 28 Mar 2023 17:48:20 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 17:48:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 17:48:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 17:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUySTYgoVZIQMAuixNreC/vTJfyqfpw/Ru4Clf+Hxssmb3kNqQGPumsC0H6aYfOK1nm8q3Ga1yKhC+Cxk99jtllULUFlbncQDdQqqbNYXOMPg0l78q5k+ksKcA86zSboc17eePVrQx4Nf7nEanscFbcMMZT3DPoVWrrvdlHNkJAdr2X/9LMlHq+gTwbceQC8/rxAtPRJCWYn9Jc8bo3g7MtqMWR1y+mnKjBRubf/rffMXprMzWnzK4wBfEgawrDsdAoR853JKIfKs1xuyYAN7udKpWzsF3F74Kzh1QSDag3AQRlrGlhrddww3T65sh5tvOa/F4H7DI95NBFrYWRc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbvMvYqnG7YL4N0ZI5u1LPWQglk0VC13JaHniDxPcx4=;
 b=baDt0aMCypqIWcoXEIOkZ3azpX4s6Fj5adwDZILp/7KGLiYMw+/+10DM/heXlMezP5CsEO7BERkEWwNwV8QwOFBypr1SCT6kmk/CijAF3hjMEA9o0EP7FZZXjbTMG4raLGsJ0VtK6zpOml+2getq1SU3YLl7R4DHx2sd1nv+fIERtcxNLXoeytqPuCF7QQePzvpNKJnemwok100Mkaa8m50I20Og90LjjJwb8/btjl2yM1g69rQ9VDLTtCm6W2ioRGB/eXvyytvUPpsiMEYKyT4RVW8RPgf+nsqIkYuv/UjkYxTE5H4pVKyHTPByGeNp4MVG84w9yMh0JGeYa0HAFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Wed, 29 Mar
 2023 00:48:18 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::110a:8742:df45:10ed]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::110a:8742:df45:10ed%4]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 00:48:18 +0000
Date: Tue, 28 Mar 2023 17:48:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/1] drm/i915: fix race condition UAF in
 i915_perf_add_config_ioctl
Message-ID: <ZCOKz62qE7jASyg1@orsosgc001.jf.intel.com>
References: <20230328093627.5067-1-lm0963hack@gmail.com>
 <e7541f73-f100-3b1f-de80-376fa55f2479@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <e7541f73-f100-3b1f-de80-376fa55f2479@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::47) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4527f8-0c5b-46cf-8c53-08db2fef49a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OqTBl92DMyuCnq5QQQEwinMuzj9iylzzGpQGe3Z3vVm+tDIoXe2KEKqy+niR5gWhvoJQRySSf1p3RjKGsQOBbyY8gF5hxMNxwDJMkJz2JI3gKelgf2MlLmMjxepGuqVAH1h+3jRT5QTW//n8XFQbKmnzrsY7zKJrAG9g8PIApwYdFPSQby6y/Wiy+haSn2RgTuaLay7G3ETF/BW+AZHNbcLECA9LzcXxSmIaeHvSTpemoAJRjxA0g9vct5BktGh5p48TipAbDzlutQyF+b8mrk4Ki8aCoxFBmD7c7mfnaYh9Lui5eAfwVPimkEpWvfOyRCb+uWQECXOGvlOknMhqWtTujOK7hWJpvSyMqp1ydvgtPmkiM0MoUhr1LZV66AQqNzaX8RIECIuf42j2Ke+RqshicnuNz5YS/djYItyPSa+NY8RsnARKPDC4MtrR6ZsGIDtgVnuYOIHOH/fooTlZCJk64y3V8UYEyjANd99aiNuBCiexy6KMmJu9bChWx/MA+4I9uq9AjpCgf7BKepQe9IN7LpcPF1/fbbV9sHJ06OB8L4HtA3CmpHj+orYe7E4q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(5660300002)(6512007)(6506007)(2906002)(86362001)(6666004)(186003)(83380400001)(6486002)(26005)(8936002)(82960400001)(41300700001)(38100700002)(478600001)(66946007)(4326008)(6916009)(54906003)(66556008)(8676002)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0tWcHNCNFBWVldvUkpvQkF1Um83Yk5BNXBjMmx4bkd4dlh2SzVmL2sya2NP?=
 =?utf-8?B?TVh0UDZNR2lXSVh3b1BWc1pHeGJVaDdlTWNOdnR4ajBiTDNISkxlQ21BM2xY?=
 =?utf-8?B?SXRjOEl2WUVNVEFSK0RVOEVrLzlmanRTWUtqR1lWdE9pQXMyb1JTbFBHeUdU?=
 =?utf-8?B?bkxEZzV1OGl2MmxPWUdvMjVJRGg2NnNKSTl1OFd4bURZbDVTcGxDbmZuR0ZD?=
 =?utf-8?B?Q2YvUHZZd0VMMk9iV05jYmVzblZabVUyYWo1K01jdUd3SThUeTUrb0J2a0xw?=
 =?utf-8?B?Y1lKNVpvSU00dzNYdFQ3dHYyaDhicFcrTU5kMk5NaytNRCs5MTZrckJLc3I3?=
 =?utf-8?B?UXgrZzZyR28rSWpOc09nTFdISGIyejZ3MGMrY1dRRHpFT3NSaXltT2lWRnly?=
 =?utf-8?B?WkFxVDJtUFdRS3ZHK1Z4bWJ2Ni9XYWZCMWZ0Z1BLb2tUenhvRFJiZnRMamtl?=
 =?utf-8?B?SmhLMTlhclJDbXVEZEgxaWlpbkhSRStwKzQxRHM5dnJhMGVsZUxuaklKbUl4?=
 =?utf-8?B?R2V6SDFsMkpXN0RHenJLR2Q2Z1Q5bjVKVDNxTUFlQTJpeVpVSytpZHhWOWw0?=
 =?utf-8?B?dzhxZkZ4QmF6QUU4Nk5jN3VVSXJVWmtMNHBvQjBoQUZ1VlNpQi8wKzVYQlBs?=
 =?utf-8?B?a1pzdUpxZGpENGZRMHByK3dwSTIxdkVqUkFINGJIWVN5ZERTdXlrVS85Qkxk?=
 =?utf-8?B?UGdBZTJITWZqSDBKcFVGMGM1OXJIRkZWTkZVcWJWUVl1S2JlWGpmMFBLNElB?=
 =?utf-8?B?THk1R21QaFRiTHhqSy80UkVqN1FJeVh3elNyVFJFbGZPTzRYWTJRSFZ2K00v?=
 =?utf-8?B?UlR1Ym4wcnBVcWNuRlhUREdMQ0VvanpicndpYVNWQ0JjRXVzQVFzelRlNXJZ?=
 =?utf-8?B?Q3prZWdkSDJuTWczVmZJeDc2Nm1ZMzBxTytHc1VqQ3VoQTI2V0tsbVNZU3VC?=
 =?utf-8?B?MkQ0c2hhZkNydnFkNmJKQ3B0RVpSWnRRa21IYVd1MGJxVFJyYk96SHB0ZzJV?=
 =?utf-8?B?OG43MktBNzhxNzVyall1aHhrOTJ0SXpwOUVUcnF0OGs1aGg1MTRMaWlncUQ5?=
 =?utf-8?B?bDR0YmdwY1VxSkVTT1RjN2dncmRUU1RWSC81aXVHTnhpYjJQSDlFNHdOWmRl?=
 =?utf-8?B?V3FKT1M3TTRQaStGTFZsbTNHTW9SWnZWOGZ4UXVFZ1U0RWVoNVA2Tlp0cklC?=
 =?utf-8?B?ZnJsdDFvVktyaGE3TGU4My93ekp4a0ppamFCS3NLc3VJbmI0QWp0aFpwTTli?=
 =?utf-8?B?OE1CUWxuRzhzRllTWnBEazlRTWtwQ0QwTWhFRjBxSnYrU1pRaDJYNHlPQW01?=
 =?utf-8?B?QjliQTdXNVRYei9HOEFDeUM1clFIQVZMdEdoUU1QTnZNTFVoY1pTL3RYTUds?=
 =?utf-8?B?WGNFNEtPTnlqRFJYUmVDV1B5MlI2WGZSazNLbzZESGIzbytLeG8zNThDd1Fk?=
 =?utf-8?B?cnJJbXBhQStKUkVyU04xTm01c3JLb3NjcGoyMU16T0I5VnBma0dSdmNPNHJk?=
 =?utf-8?B?WW9tZ1gwVTc3RUJCUlJiQjFOLzR6YURDZUFrSWR1ajhHQXNoRnJ6T3hmb2Nw?=
 =?utf-8?B?QVRBYUR3NmxvclNjL2MxK1RtUG56VXloT20vdVgvNFVRKzlqR3JKT3gvaTNa?=
 =?utf-8?B?R2thZEhXZUtvTVZIUTFjLzRRN1ZHT2VTc29idFMyTzErS3V3anFRa1lyVVR4?=
 =?utf-8?B?b0FLSEx1K3JyckFDTHR2NXBMdlVrbElVQmg0TDBXdDZkY0dsbGpFcXNmMzZN?=
 =?utf-8?B?dm81cVlRQ2pNdnBRT2k5NEhRbjQ1VjhBaUo4VWhHOCtqUXVrU0xqVmVSalhy?=
 =?utf-8?B?MUdWdDZobVRiL01rcXd1R2JOR29YRHgwMlZKUE9TWngwMU9QOXVVUnJIdTJn?=
 =?utf-8?B?RzN4S21Ud3NDRDA1djUxS3FybnFtMDNCZTc1MWdvSWcwWGd2NE9ES3JTQUFH?=
 =?utf-8?B?d3VDTXRHWmRqdXhUVFRRSkZOMTBuL2lTK1ZDOFIrWVRvSnpqcEFoNklnMThh?=
 =?utf-8?B?dDF2NWxjYkVEZ0kwRkpYWHZRd3M0anRQTGlFb3JUMERlZXBYSEZqeEI1dUE5?=
 =?utf-8?B?MWhobExuRHhkc3g1MXkzN1VjZTJKdE9LUjV1YnNoblFDMmVONjgzQyt5empY?=
 =?utf-8?B?SDZmQnZ0b2FNNHZoQ3N0YWFGcHZIc3ZaQWZiWWtBaVNhdVFkL2RoRzB5bjgz?=
 =?utf-8?Q?GdRTP8a1ptGZlxLo4xpMSgE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4527f8-0c5b-46cf-8c53-08db2fef49a9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 00:48:18.4380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9TE3p8CwFrcY/QIpcDd+qGVyiUofJwCYNW+QzeCrAPXFUdIcDK2PCin9C1a+PCHSEI3NLIu0RmwpkXDJTKJGkuHNwerkZ3RWHaKQXL2IGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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
Cc: dri-devel@lists.freedesktop.org, Min Li <lm0963hack@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Lionel
 Landwerlin <lionel.g.landwerlin@intel.com>, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 02:08:47PM +0100, Tvrtko Ursulin wrote:
>
>On 28/03/2023 10:36, Min Li wrote:
>>Userspace can guess the id value and try to race oa_config object creation
>>with config remove, resulting in a use-after-free if we dereference the
>>object after unlocking the metrics_lock.  For that reason, unlocking the
>>metrics_lock must be done after we are done dereferencing the object.
>>
>>Signed-off-by: Min Li <lm0963hack@gmail.com>
>
>Fixes: f89823c21224 ("drm/i915/perf: Implement I915_PERF_ADD/REMOVE_CONFIG interface")
>Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Cc: <stable@vger.kernel.org> # v4.14+
>
>>---
>>  drivers/gpu/drm/i915/i915_perf.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
>>index 824a34ec0b83..93748ca2c5da 100644
>>--- a/drivers/gpu/drm/i915/i915_perf.c
>>+++ b/drivers/gpu/drm/i915/i915_perf.c
>>@@ -4634,13 +4634,13 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
>>  		err = oa_config->id;
>>  		goto sysfs_err;
>>  	}
>>-
>>-	mutex_unlock(&perf->metrics_lock);
>>+	id = oa_config->id;
>>  	drm_dbg(&perf->i915->drm,
>>  		"Added config %s id=%i\n", oa_config->uuid, oa_config->id);
>>+	mutex_unlock(&perf->metrics_lock);
>>-	return oa_config->id;
>>+	return id;
>>  sysfs_err:
>>  	mutex_unlock(&perf->metrics_lock);
>
>LGTM.
>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>Umesh or Lionel could you please double check? I can merge if confirmed okay.

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>
>Regards,
>
>Tvrtko
