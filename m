Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5237F9F82
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 13:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192C810E253;
	Mon, 27 Nov 2023 12:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBCE10E253
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701087878; x=1732623878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4nrTB11pdRhbFRPJj9ytCkjz2mR8N8IRRsfntF1Zoj0=;
 b=fijnjY8a9dYL/F6dM9B31A6SblKEumLsdysqYlbSAzkREUMqjpl8QBt1
 A00p9xnmgDf+N/aH9SZUWZ6Vho4k1bPEXDdE+oKebpAM3JaSUMRDoLomH
 JP2SQ4gbtFGlwtJAruFlkMMSTJb+S0KUhE9wBkQgaEAK+FEA84TmM1wZb
 /yhELCuJtFnHaXbZgJjUyXhllBCIq/I4KOp4BkpwRd4+Os6pGyeb0Dsrt
 O7Au1IF7HJ//ySpIvLjNenYS4Rp44zhZPjRxdTXP6w5ttUo3l2umASN4l
 obBYk29SlxzGuPx1Xby0hI5sm0jhH5bXv3uA+KDOl27MO2c3fGPODlJRA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5880045"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="5880045"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 04:24:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="9605730"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 04:24:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 04:24:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 04:24:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 04:24:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYjXG65T54NmyFuDfiTUSOBCxTvbyU2+xgnQ9sauRlk3pwJSc7c0bWXJ7LbpXM6Lp/J+ng9hsyV/QmvSuTPpzcwBSW99QsTalGQbAxBEDae0+kzOe+PJJwb/2LniwzLQycjy1lFlpXUrYfSoomASEo6+VuwA/yWbf6qhhzvipdpRLDmCVzSfk/KwBbJLPOBJJhRSROkg7IGcuS83CtKVeK7Ev4w7LlppY2AefZ9UCsEA7lOVmXUbaHEwqKeaHgFGT3mOBK4wC6jx35f+G4YHIwnK4XLtB+hmzqpIpxLRGNZtj25N0L72FQcxB341YAHEznP3Sv9XsxSRhmNnl3UKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxBRDLzbdBedkSuslSvVd5rtJv0Zdl93HfMBggj4ACw=;
 b=kWSr5sp658NcP5cfQQkUmGBrWf5cDtSTP5IW8kvJe5nG5eroSQkHH1hIwCXRLgUVFQG/wiJLlnZfZsfqxr8ZWntq0Rep2ckOQOEIxdnKJJBrtgM7Y7IIVkQ5+o+GJGJ8vRw1K9pXFgpkDWrY738bnXz0tymgRiem0a6SDpm6vREBkij2FHiY+dHfzt5smmLa8ejU0DriVAmxrMVAtTJvssDGxdSzAQ6BYgRrq7VvsB33BN+pw8Rxy1jY8vMGuEL2QEQGO/zVIlbOXVTOWg+fU+S2Ar7c7tAxisaxPLxjxBDW4QxauMqNOvFeD2AjlFyTvVheiPFYn5GBTK5L50fVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 12:24:31 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692%6]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 12:24:31 +0000
Message-ID: <b6b1dd0d-f53e-4b65-acee-c55bd76572f5@intel.com>
Date: Mon, 27 Nov 2023 13:24:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in the error handling in TTMs pool implementation
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <78a97668-a97d-4637-969c-e724a7423909@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <78a97668-a97d-4637-969c-e724a7423909@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a22aa7e-d3aa-4b5c-429f-08dbef43ce5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pVY503joWDhwpmuAbJT3N44ct3bLb0/hxFnPRE/bkCu3zjH1YqRQrTIgbst3IZZnXLQTCFH37p8U+o6GOvrCZXisEB+0WL+W6OgXpwSMDrPVIf3KZ7EGtrl0khap8bpXEEWTISMHycndOBDtKG17/VwKwecSxKgvnaGJwfFqdcHmUVUUXjiUGYKZ69EkDOZKQIeDg61fNzxTb5GPfSFVVN2JpyfymUf00QCEG4GgqkIethjkBJEj5PhfD6YPyBYdDrpvYWcuE1eIxogxZI94y63qnKo80RGe9bLXmE2m6AzI1WOlXiuMSZOOM3N3+KP3rZSxpH7IysaxDA2uzQyNSRi0djJH/dE+kDTJQegOWYZuyP0sZkrJZmC+q+FRcd0nXj35gWf+nnZZsoHNXknodP4i3/WBgls5i5okSZiPi1SWrWf3xnOl6MourerUq+1wB5tg9MuT6R1yeX3AtPGowJr/IA0Xh4fihUfBLGE6KAovKsDKD+xonb1OqI81e7NcJXJOgPV5QtVXTmjaMd6+N6xaZpy2PPWRKTXmlPeJrjDdV0bi0hh4R921lmB1UBilmXipjsPe9ZiYocjlkEDtA8yvm99CLeGXZg/B8Cp4wSUgZPH4CMGz33uDU4yHcgOavPrJrOcsc8IMAjZ3Se+Xqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(31686004)(66574015)(8936002)(82960400001)(31696002)(6512007)(36916002)(6506007)(6666004)(8676002)(316002)(966005)(53546011)(66946007)(66556008)(66476007)(54906003)(6916009)(86362001)(44832011)(4326008)(6486002)(478600001)(5660300002)(2906002)(41300700001)(36756003)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEkybnBOTkNYN2k0TDZRQjJNTVVjZTNqZjI4UHFMRk0zbjVoSzRZYUNmREtY?=
 =?utf-8?B?MlE1eVpOc0FQVU52WTJYYkgyNEZwRDhEeWxpalljeHVHbTVWL3hIUGxiUGIx?=
 =?utf-8?B?V1JJc3g0RHY5ME9DUVdITzlPQ2tnWlNBQmhJUjF1TE5YdzJzUnBaUDNFSnJp?=
 =?utf-8?B?cmcwU2RoQnlHNlpTekplYXdiYWs5dmczMjdqTzBTaHBKODBEM2R2ajFGa0R0?=
 =?utf-8?B?Q1EzTG9YQ2tqQU1Pdmgya3NOOEhkN2t5MXN4NFZWZEErRDkzZ1NUZWtUeVJQ?=
 =?utf-8?B?UHJzcEdBUUJIRFFSYVoxNDN2MUlaeXlpclNVNElpR3k1QlBIYnAreEN5alVX?=
 =?utf-8?B?b0ZCY3JrQ1h0YlZLaHhIdUFkazh3VnNQRTFiZWpxb0Q5SFRLdU1pWjRNaHN2?=
 =?utf-8?B?dzlRWWNOT1JRV1RmeHlOVnVKMFdYK2dJWWQ3SFVKS1graWlpUUtQMDIraTRx?=
 =?utf-8?B?YkZZWFdYU0pPaDBMenV0K3BPamc3UG12QkRNdzZzWW5Vamd6bFZJZ0lNc1Jx?=
 =?utf-8?B?TkJ6RDk2Y0JERG1FY0VWWisyNG0xcU0rN1p4NzQwdUx0V1c0MFBraFZieEd0?=
 =?utf-8?B?MkZZNThGTFJVL3M1T0lPNDVldDZ5ZTB3L09DUFg2OFhWQmJTWm9scXFpMW5i?=
 =?utf-8?B?bS9TdzB6czVJeVU1eStsTitYMUM3aGZvT0hyTjc4V093Nm54cTZTZVZzL1lv?=
 =?utf-8?B?MEtqdWI3aHpOVmV0dmYyMCtaZ0FOWEczTTAzM3hOV1VYQ2lzMUthdGRQTWdj?=
 =?utf-8?B?WTBQMGMzK2JYRnBuSFA4UmpIL2Q2T243cDlOM01ZcDdNNW5xYWttbVRDSGhV?=
 =?utf-8?B?cEdJZWhHaWkzdjZFVVNBOFhQWUhMZU1Odit1Rkx6NEVkekRhUlVVMzJMRWxF?=
 =?utf-8?B?RWx1V2xXUnBCOWlGcUlzWTNiVHR1Vk1tQ092MEpqZFR5K0YzT2d5c2I5N3dD?=
 =?utf-8?B?bG91Rjdyc3lhZllWeHpVSUdqYlBMU1MrZnRwcTZLQTVxNkNETEFPSlZoYWw0?=
 =?utf-8?B?YlBzVHk5MGY5Y3cySGp5djRLOHpxN1hYQlU2SW11VStZL05paHkwL3M0Mjk4?=
 =?utf-8?B?S3NyT3R4NmF1N3NhUUxyaVVrU2o1SDlnRmFFNlN2d0pWaTBSVDZaSVJZVzJE?=
 =?utf-8?B?bDVadThnRG1KTS81NTVaSGlDbW5qVE5remVxNzN1c2UrZDc3YWlaUjRRYUx0?=
 =?utf-8?B?MllNZlFycGkraGxkSTZabWlLMzFlVjltdTRUZ203S0o0cDQ2MllTWG4yY0R3?=
 =?utf-8?B?TW1keFV0TWNVeFRScGZYYzVFM25iN1M2NzJua3NWRm4xMEttNDNXKy9QNFRS?=
 =?utf-8?B?Z1B1MHJic0hkOXhqRTVYS3NCQmNPdW0veW5wTVBYZ2ZNYTRoREZlaXFCVnpt?=
 =?utf-8?B?VXJYZjBoZWI1OGo4V0lENGlTVktLNUY4MTV3THYyR20zSGtLVkhreWszZi9T?=
 =?utf-8?B?bDR5Zk15eFRJRDdCNjJzUHZPRW9wc3ZXY0V5NlVjQStYTjNyMGFEUkdtTHpy?=
 =?utf-8?B?dWZLYTNZMW5LTEhvTGZrQzNHOVBiTWZxOVJSZS96aXNhbmNjWjJjUWQ0M2Ur?=
 =?utf-8?B?cm5TY1FyN1c3bWErWFd1ZnVMZmNqdWJReWxyMFUvdTdhb3RtSmlnREtyNFQw?=
 =?utf-8?B?b2pQNWJRN2twS0dZMjdwN2V6d2FHOFAydW5nS3FjcDZVU29GTy9lMUl4aGF2?=
 =?utf-8?B?dExKTytVQTVJMVBXRzQ0U0Q4ckMwWFJlNFN1T3I3bmsxZzBpM2pub0FwWUlI?=
 =?utf-8?B?UTZya1BzbTF6dE5CVGZqMGtkOXNRRkV1QjRWN1Vyc0ExSXkveWtKczNMMGUv?=
 =?utf-8?B?OWI1TW1tTzM2T0dmYk1SaThnbEhCT1A5a2lpVlk0amJDNmdkNVdQbmM3NTRo?=
 =?utf-8?B?cXF0M3E5SXZnb2xZZno1aVZYL2RaVDZqL01PYVI5bTQxU2ROSy9zUFNVNndN?=
 =?utf-8?B?a0RvMTM5UE1ZR1oxaGg5Tm94enV1czByZ3lwU21aTXoyYkErUXZ5QXl1VC9n?=
 =?utf-8?B?cnNHSm4yLzBnSGZsRWNDUnZXYmUzamZ1eTdOSnRTMnBsclMzU2xCSTRIcWFk?=
 =?utf-8?B?STJDMlQwUkVndWoyY1A0QWlYbE1RZTl6czlidFNFVjE2aHZKZ3JxTDY0WHBJ?=
 =?utf-8?B?SmtlUkNIVEtzUzNKU2p5NmxmV2xGWG9aem5MMU83elVlTG5GNVZvK0RPVkcx?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a22aa7e-d3aa-4b5c-429f-08dbef43ce5b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 12:24:31.3525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZr8QpSiH7Y4aPMEJ6/5dLe5CFqYsFrNfmlQRl6hiFvKVbTzgHLQnpJ1rXRqykeWjKtmQXnHb3yTyomTsliwMd6NZjA3q66eMOf48c3pNoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Karol Herbst <kherbst@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24.11.2023 16:53, Christian König wrote:
> @Karolina do you of hand know a way how we could exercise this in a TTM 
> unit test? Basically we would need to redirect the alloc_pages_node() 
> symbol to an unit test internal function and let it return an error (or 
> something like that).

Do I understand correctly that you want to mock NULL from 
alloc_pages_node() in ttm_pool_alloc_page()? I had a quick look at it, 
and found a(n ugly) way to do it.

KUnit provides an API to redirect calls using KUNIT_STATIC_STUB_REDIRECT 
that can be registered in the original function and then overridden in 
the test. You can read more about the mechanism in [1].

The problem is that we'd need to introduce a wrapper call for 
alloc_pages_node() in TTM and expose it, so the function can be 
substituted during the test. We can't directly modify alloc_pages_node() 
due to cyclic dependencies caused by kunit/static_stub.h.

For example, in ttm_pool.c, we'd have:

+struct page *ttm_alloc_pages_node(int nid, gfp_t gfp_mask,
+                                 unsigned int order)
+{
+       KUNIT_STATIC_STUB_REDIRECT(ttm_alloc_pages_node, nid, gfp_mask,
order);
+       return alloc_pages_node(nid, gfp_mask, order);
+}
+EXPORT_SYMBOL(ttm_alloc_pages_node);
+
  /* Allocate pages of size 1 << order with the given gfp_flags */
  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t
gfp_flags,
                                         unsigned int order)
(...)
         if (!pool->use_dma_alloc) {
-               p = alloc_pages_node(pool->nid, gfp_flags, order);
+               p = ttm_alloc_pages_node(pool->nid, gfp_flags, order);
                 if (p)
                         p->private = order;
                 return p;

And in the test we would say:

+static struct page *fake_ttm_alloc_pages_node(int nid, gfp_t gfp_mask,
+                                             unsigned int order)
+{
+       return NULL;
+}
+
+static void ttm_pool_alloc_failed(struct kunit *test)
+{
(...)
+       kunit_activate_static_stub(test, ttm_alloc_pages_node,
+                                  fake_ttm_alloc_pages_node);
+       err = ttm_pool_alloc(pool, tt, &simple_ctx);
+       kunit_deactivate_static_stub(test, ttm_alloc_pages_node);

Christian, what do you think?

All the best,
Karolina

---------------------------------------------------------
[1] - 
https://lore.kernel.org/all/20230128074918.1180523-1-davidgow@google.com/


