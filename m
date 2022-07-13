Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F37573218
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D27611AD18;
	Wed, 13 Jul 2022 09:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D6B11AD18;
 Wed, 13 Jul 2022 09:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657703351; x=1689239351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=7SGWp2dt0/uAgDLdsYB5QEcC/tLa8w4HC0+H4zH6kW8=;
 b=kUz7H64RyRGqwkdX0QdVicw9E86P7ZinKaogQJmxGAHwc0xCOvVQkWDt
 DY0DweqwMux0WwKakLEx63S1WWlSVRKwcy25o9DuE9RLfa45rcyTIj7Su
 Mje87XdmOSB3QbGIK3l8AQHfMYuE0qHxYXQ97vBjrl08XdYKGVwn7JfIP
 RToqw6qf9VPte5/zf2RzEe5jAhjxLRHgrUC2rnw6aMHiSwfjzLi0Va0pA
 EgBQmfzjiiGcahMSCOf6Zf7qGpu2zs4lXPO56eeST/gdS2a3eUL1WNCz1
 oi8qfKUBCgv/Vsz7pF1xHDkTdmUMXZn2UF7roX3XC+w2q5FTg/VDSu4G1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="371471906"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
 d="scan'208,217";a="371471906"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 02:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
 d="scan'208,217";a="737804127"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jul 2022 02:09:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 02:09:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 02:09:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 02:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XP2Q3qXqzkFPZqQWhP723qhlIHH3j3Sl43+1S+GsqP6186H8YHMJzml2eRvwAhZUNzH24ijqncReBQAosoN/tnCjEGzQvFrRlV8iFSvfve83Y7dVn8mOHlaJNH6tkp6IKbyDfaSeJ7kFtbfjowx7L4GKdyrGpzSWIqMBPgA65VZcTx4ISJxItbRvGCjRftGIvJvMF0q7bem+tTdSdtSFBqYqGrvTWoLPZTRL78OeIyu1di+DOcuKJ11/ENGQZPMFSgVJyHqhQK3MsjOVv3QpWd64Izvxo0J0vVjBMpi44dOkpfPklCL/z+KKUKKrvdaaQnUhjavHuUKMWLDCgvgQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXU51/FHMgyessnzW9jtW2CKmR4aD6lgavYFLYcfaEk=;
 b=m+bwEAVpFwCYHLiBNEcrq33KgIAS7krDoQpGenVtJIxS9e55q0KuU40rTbVWaSPg5XOcoMtooPH+xgOpkf6GYY1TJpm1h0Yxwk3v+kT8GAAYB8t/wVHyl74zToaJFZUgjJJHFouJxgKu28CHnZGKpsIYQwGyWTqtPw9mzdJQmrp+MHLkVnT+OL72QTB5yhyfMmCHfiwpIiny/5B5g9S9Yd5tj4heDtsDK1JNwDAMqexiAf6notIOkmRpaWSBaNc01n0xxchjpp6goHlzdrdiYGbSwCR193KwZTp5Wh4q5zrCtD7zPPsZxmCkP8fRWt4ho5DH7dijhuzA9Tj0nzL1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Wed, 13 Jul
 2022 09:09:07 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::71c4:bbd3:4a5a:ad1f]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::71c4:bbd3:4a5a:ad1f%4]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 09:09:06 +0000
Content-Type: multipart/alternative;
 boundary="------------SPGEivuie6OOrOC7xPmyRurG"
Message-ID: <cb84de36-8cc9-ff86-7577-291c786ba885@intel.com>
Date: Wed, 13 Jul 2022 11:09:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 12/39] drm/i915: gem: add kernel-doc description for
 some function parameters
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
 <7940f1767c5c6f70196ae599448b87d75ba46834.1657699522.git.mchehab@kernel.org>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <7940f1767c5c6f70196ae599448b87d75ba46834.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: LO3P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::21) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98571ed2-7eb3-4e44-0735-08da64af56c0
X-MS-TrafficTypeDiagnostic: BN6PR11MB0003:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CKxJjnZMhouqUtdLkdaLKSf6S2RvKb546eJFzCh2jiqtFB5la4xMUkkipLutOWKvrFIg5dmzhDpbosU0HQeBaIeezPfrzrq3Gd/xmDZIr0teM5UJmlw2sRU9CGrvBrLHD0wfCaJP57o53farOj1WxkK+CQkA7qxfwyKzL5pbOt7MHqiV+F3tIHXFbvz64L9886ZlWt/AGVQb7xLvzKq/dxTFCQfbkCakHaV/FKAsAkJ6Hi5eC9cZrGUd/dyTuKuUnBpeJT8gEO1tkGPKqnMDkPAgkIOCrYdmekJv8j0qj2j42O1A8a0op5ZHx2OIMCBx9v6Hi3Ynrb01hAsmsAkySIczh3KgvIunoD8AzuNJF8KdeCoj3M6Bb4iZaw3YAmNytpKQWvANs6hpy6YBVgL22kwttVohuQIrVX3yffMFS9OgRIuOYwUe/86YzlJlYyZZAg75WMjxLhA4HOCvTSlu1fdKajh4WPsqPveu8WiK7S0sTX/otINSgqD4Nf+AwHNHmzAIOMcJjglo3s47sdiiU3iBU0xSgNV/bsuqj3rFODyEcDkKYTbS+Un+sechS1fXrEaAnBLIguAd/J76MLgEqi6zPfQrSu1Ys/41ss2IrnDRzu7/yQS9R0ocnXqwWkoK4BMCaNzs/ibTpYuP+jkGAFA1pRX67hQFQbkvqEosaxAEZThoUa7mRg0qcw0oFYiRwP1bi3tZ7VsOfU3SC0i0v5IPVMV8ziGXCngEiStwbv+0oIF+oh8Ms9WjGU7hzEVYQ0kzPqUnPN5Gz2HWaXjTI9LTukF0lNwAuuMEps1Q5OVrQ2a3L71xNujDEEK7/NFgzmxUBLdctRYWqoMPs6mi0ZWIRsYPGu0ot1fCXzpODiYoB/z1ACx7jcNeiJvlhV6g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(39860400002)(136003)(366004)(346002)(66476007)(8676002)(66946007)(478600001)(66556008)(33964004)(6506007)(966005)(6666004)(4326008)(41300700001)(36756003)(6486002)(186003)(31686004)(316002)(31696002)(8936002)(82960400001)(2906002)(6512007)(26005)(54906003)(53546011)(5660300002)(2616005)(6916009)(7416002)(86362001)(166002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUJMWFpURVFJQTJVQnp1UmxZd2hZQUc4RDNBcnp0RSsvaE9sZmM5b1Q0aDdj?=
 =?utf-8?B?V2RHTFV3Zk1lOW5FU3lUdnVvNlVEdkk4QStFTjQyaGlPcXRvaFAzVzdIWUVV?=
 =?utf-8?B?Q2RrcHU2YzltY2pFTGU5WlRRMnh2T1BJWnp5YWNmV3FGMHVzTXhsVFVjMzR6?=
 =?utf-8?B?eXI2M21IaXRaU0tnSzFYUStFTEthcm1sQ1J1bkJwY2Zia2RPR2h1cjFXNmRl?=
 =?utf-8?B?QWdOR3FCUUdEY0hMMHJCWXFkR2l6WFBHcktQczk1anMrbXl6MGlwRG9oWE9t?=
 =?utf-8?B?aFBueE0vUzdQT1o1K3hsSHgwblZFbVhHMGtPYnJKMEhuemhxcGlOU2oxMldS?=
 =?utf-8?B?K1o4SWdtWVJrUjJuSEpzZ1FuRStjMlZISFBpMTFGLzdOUkUxY2N5aEs4aDlB?=
 =?utf-8?B?TE5PTXFUL0Z1Y2NReVhiRVVqU1ZvalhhWnZkblNmOUVGYUc4aXB1TjB6aDRM?=
 =?utf-8?B?MnBUZ0xQTFZJelJMZHFDaXQ5enFuVHo5ZGlGbC9DUDRHTTJ0MlFxUHYyRExt?=
 =?utf-8?B?U2ZyOXNIbDBXNkVMTTZXNlUrRld6ZWxkVER1MTFGZWF0a1FJNlpERFlWNlFs?=
 =?utf-8?B?MmlNWEdwd0FYWWExV3dVQnNPRTUveEVZUWRWTDRVNHphNEtTZFRqbDRXNTRo?=
 =?utf-8?B?ZW5reGdjbU9zM2R5MkhsZTdESUxLZVNiQi9EQSthK0pjblNoS3dvVEowWTYz?=
 =?utf-8?B?VURYVXJNUU5oYy9qRThXK0J2Tzk1UkRwMUpaTjBXZjc1YUxiNTgwTmtQRkpv?=
 =?utf-8?B?bHJGTmRXNUgzYWR2YTJNNEg4ekgybitScytBVGcvTVlrQ05tdUZGeEVvZFlt?=
 =?utf-8?B?dENmTFFkcEhyd3ZEUm0wSmttSTZNQnRtREV1VHh1dzRuZmh5RXRYS1Bnc05Q?=
 =?utf-8?B?aHVmd290RXRrcGlLOGlGV2lZNjVwSGZ4S0FnMy9VZDhwYkFJVmF1VDh0UElR?=
 =?utf-8?B?NGVad0xmL3ZFMzVEYnFmcDlsdk9xRkRhbm1xN2JteW03a0FqM29MclVwYVgv?=
 =?utf-8?B?VFRuVG56N2dIVHFTc1BlTC9ML1JXYUk1Mk9sODc4RXZnamRLZVdQY1R1MUlp?=
 =?utf-8?B?VXRnWGVLOWlxc3FENTRjMGI4azBpb2hzaEVZNEJyNXBySnlmeVQyb3dYSWhu?=
 =?utf-8?B?K1Z4bTdlc2c1Q3dyL2tueE9sTFUwNTdUdjRBdHFlK0VQaXZabGpQaldGa1ds?=
 =?utf-8?B?ME1QSCtyTWJPL25LOS91ak54dmlGVHd3anBVcHJvdHY3Sm9JSlRaQ0p1bmVZ?=
 =?utf-8?B?cEVZOFZIc1NVZlFuZEMyTUdmdGtJRGdRbjNhM2VFTUZQMlRkZ0RKQ3ZZZHlh?=
 =?utf-8?B?QlkwTHJLR3V6ckxza3NZaGFNVzZaYzd1WEZINDBLWkFhMFVUV1JQSXI3OWxU?=
 =?utf-8?B?VWs2akZWd3h3OVcraVJ3bE9leE5adklXNkNkWFNmYU1vL3ZrQmlZVUJVQWZn?=
 =?utf-8?B?bmo5bmJCTGZLV1ozOHRiM1FGK1krSHpGT2hUdUVjQXlYUkRCOUxJWjZXUjZh?=
 =?utf-8?B?ekd3NWNGMHcxTkNpTTArOG5oT05XeVphZnZXMnVFVFU2K3Rsdk1ncnNyUnUr?=
 =?utf-8?B?cG1sc3pDY3htdFgvY1B0UGtDbHgyM01Sb204T2ZZaEJZMGRuUGNyb1dFMGIv?=
 =?utf-8?B?RVhQZmRlcEZOQlVIdDBCVkpqTVl5QTF4Nks4OEZBaFJMWFhLUDh5dURPUnV0?=
 =?utf-8?B?U3ZoeGVwNERDVzh2OUZZMnpOZFdIUkZkT3VNQTllZlBUVmpjNjZKSGEySWZv?=
 =?utf-8?B?UWJEVEtyb3RhUkx4aHlkdk9mU2hFNmxTdWFXN092RnZyZ283NGhZMFdBL3Nw?=
 =?utf-8?B?RVRTaGUrSlRBMkRhZ1dwTG1ET1A0ZVdVQ3Nrdk1oUk51ZlhaYlZrWGwyck9W?=
 =?utf-8?B?Y0FwNHhrVnYzOVVWeE9QMlBZTm1UcnFKaDYxaVZsRWk1ZFNvZVRST0ZWdGYv?=
 =?utf-8?B?QUV1V2pQL3hGTCs0WE9Xa2k5cUVEMkNVM0VFVStwR3NadmxybEhsZ1N5alNv?=
 =?utf-8?B?K1BpTDh4VnF4YjEzZDREc0Vtd29HZTEyR2FYbE93MVZlWmwrcFFPUThwUFk0?=
 =?utf-8?B?eE15ME1VYlFpV1BTb3hycHczTFVBZUMrc05TOUN2bW55NkdxMmMzRm9ZV3Vk?=
 =?utf-8?Q?4apf1zI+mUeMT9qzXJaHhhXil?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98571ed2-7eb3-4e44-0735-08da64af56c0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 09:09:06.6169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xV6uxkk+jzEyZUILsfLvPQBD04/iLZRJ7ET7+7yLHSkwEa7ZglZMbTePocAxPsGIiXepO6jtooY9pEq8Sih1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0003
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------SPGEivuie6OOrOC7xPmyRurG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

fFJldmlld2VkLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGludGVsLmNvbT58CgpPbiA3LzEz
LzIwMjIgMTA6MTIgQU0sIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToKPiBUaGVyZSBhcmUg
c29tZSBwYXJhbWV0ZXJzIG1pc3NpbmcgYXQgdGhlIGtlcm5lbC1kb2MgbWFya3VwcyBvbgo+IHNv
bWUgZ2VtIGZpbGVzLiBTb21lIG9mIHRob3NlIGFyZSB0cml2aWFsIGVub3VnaCB0byBiZSBhZGRl
ZC4KPgo+IERvY3VtZW50IHRoZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBD
aGVoYWI8bWNoZWhhYkBrZXJuZWwub3JnPgo+IC0tLQo+Cj4gVG8gYXZvaWQgbWFpbGJvbWJpbmcg
b24gYSBsYXJnZSBudW1iZXIgb2YgcGVvcGxlLCBvbmx5IG1haWxpbmcgbGlzdHMgd2VyZSBDL0Mg
b24gdGhlIGNvdmVyLgo+IFNlZSBbUEFUQ0ggdjIgMDAvMzldIGF0Omh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC9jb3Zlci4xNjU3Njk5NTIyLmdpdC5tY2hlaGFiQGtlcm5lbC5vcmcvCj4KPiAg
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuYyAgIHwgMiArKwo+ICAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bS5oICAgICAgfCAxICsKPiAgIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG1fbW92ZS5jIHwgMiArKwo+ICAgMyBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1fb2JqZWN0LmMKPiBpbmRleCBjY2VjNDA1NWZkZTMuLmI1ZGQ0MzQwNTM1NSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMKPiBAQCAt
ODIwLDYgKzgyMCw4IEBAIGludCBpOTE1X2dlbV9vYmplY3Rfd2FpdF9tb3ZpbmdfZmVuY2Uoc3Ry
dWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKPiAgICAqIGluIGFuIHVua25vd25fc3RhdGUu
IFRoaXMgbWVhbnMgdGhhdCB1c2Vyc3BhY2UgbXVzdCBORVZFUiBiZSBhbGxvd2VkIHRvIHRvdWNo
Cj4gICAgKiB0aGUgcGFnZXMsIHdpdGggZWl0aGVyIHRoZSBHUFUgb3IgQ1BVLgo+ICAgICoKPiAr
ICogQG9iajogVGhlIG9iamVjdCB0byBjaGVjayBpdHMgc3RhdGUuCj4gKyAqCj4gICAgKiBPTkxZ
IHZhbGlkIHRvIGJlIGNhbGxlZCBhZnRlciBlbnN1cmluZyB0aGF0IGFsbCBrZXJuZWwgZmVuY2Vz
IGhhdmUgc2lnbmFsbGVkCj4gICAgKiAoaW4gcGFydGljdWxhciB0aGUgZmVuY2UgZm9yIG1vdmlu
Zy9jbGVhcmluZyB0aGUgb2JqZWN0KS4KPiAgICAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
aTkxNV9nZW1fdHRtLmgKPiBpbmRleCBlNDg0MmI0Mjk2ZmMuLjY0MTUxZjQwMDk4ZiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtLmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtLmgKPiBAQCAtMzAsNiArMzAsNyBA
QCB2b2lkIGk5MTVfdHRtX2JvX2Rlc3Ryb3koc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7
Cj4gICAvKioKPiAgICAqIGk5MTVfdHRtX3RvX2dlbSAtIENvbnZlcnQgYSBzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgdG8gYW4gZW1iZWRkaW5nCj4gICAgKiBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29i
amVjdC4KPiArICogQGJvOiBUaGUgdHRtIGJ1ZmZlciBvYmplY3QuCj4gICAgKgo+ICAgICogUmV0
dXJuOiBQb2ludGVyIHRvIHRoZSBlbWJlZGRpbmcgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0LCBv
ciBOVUxMCj4gICAgKiBpZiB0aGUgb2JqZWN0IHdhcyBub3QgYW4gaTkxNSB0dG0gb2JqZWN0Lgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtX21vdmUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG1fbW92ZS5jCj4gaW5kZXgg
OWE3ZTUwNTM0Yjg0Li41NjIxN2QzMjRhOWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bV9tb3ZlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fdHRtX21vdmUuYwo+IEBAIC0yMzcsNiArMjM3LDcgQEAgc3RhdGljIHN0
cnVjdCBkbWFfZmVuY2UgKmk5MTVfdHRtX2FjY2VsX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKPiAgICAqIEBfc3JjX2l0ZXI6IFN0b3JhZ2Ugc3BhY2UgZm9yIHRoZSBzb3VyY2Ug
a21hcCBpdGVyYXRvci4KPiAgICAqIEBkc3RfaXRlcjogUG9pbnRlciB0byB0aGUgZGVzdGluYXRp
b24ga21hcCBpdGVyYXRvci4KPiAgICAqIEBzcmNfaXRlcjogUG9pbnRlciB0byB0aGUgc291cmNl
IGttYXAgaXRlcmF0b3IuCj4gKyAqIEBudW1fcGFnZXM6IE51bWJlciBvZiBwYWdlcyB0byBjb3B5
IG9yIHRvIGJlIGNsZWFyZWQuCj4gICAgKiBAY2xlYXI6IFdoZXRoZXIgdG8gY2xlYXIgaW5zdGVh
ZCBvZiBjb3B5Lgo+ICAgICogQHNyY19yc2d0OiBSZWZjb3VudGVkIHNjYXR0ZXItZ2F0aGVyIGxp
c3Qgb2Ygc291cmNlIG1lbW9yeS4KPiAgICAqIEBkc3RfcnNndDogUmVmY291bnRlZCBzY2F0dGVy
LWdhdGhlciBsaXN0IG9mIGRlc3RpbmF0aW9uIG1lbW9yeS4KPiBAQCAtNTQxLDYgKzU0Miw3IEBA
IF9faTkxNV90dG1fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgICogaTkx
NV90dG1fbW92ZSAtIFRoZSBUVE0gbW92ZSBjYWxsYmFjayB1c2VkIGJ5IGk5MTUuCj4gICAgKiBA
Ym86IFRoZSBidWZmZXIgb2JqZWN0Lgo+ICAgICogQGV2aWN0OiBXaGV0aGVyIHRoaXMgaXMgYW4g
ZXZpY3Rpb24uCj4gKyAqIEBjdHg6IFBvaW50ZXIgdG8gYSBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9j
dHgKPiAgICAqIEBkc3RfbWVtOiBUaGUgZGVzdGluYXRpb24gdHRtIHJlc291cmNlLgo+ICAgICog
QGhvcDogSWYgd2UgbmVlZCBtdWx0aWhvcCwgd2hhdCB0ZW1wb3JhcnkgbWVtb3J5IHR5cGUgdG8g
bW92ZSB0by4KPiAgICAqCkludGVsIERldXRzY2hsYW5kIEdtYkgKUmVnaXN0ZXJlZCBBZGRyZXNz
OiBBbSBDYW1wZW9uIDEwLCA4NTU3OSBOZXViaWJlcmcsIEdlcm1hbnkKVGVsOiArNDkgODkgOTkg
ODg1My0wLCB3d3cuaW50ZWwuZGUgPGh0dHA6Ly93d3cuaW50ZWwuZGU+Ck1hbmFnaW5nIERpcmVj
dG9yczogQ2hyaXN0aW4gRWlzZW5zY2htaWQsIFNoYXJvbiBIZWNrLCBUaWZmYW55IERvb24gU2ls
dmEgIApDaGFpcnBlcnNvbiBvZiB0aGUgU3VwZXJ2aXNvcnkgQm9hcmQ6IE5pY29sZSBMYXUKUmVn
aXN0ZXJlZCBPZmZpY2U6IE11bmljaApDb21tZXJjaWFsIFJlZ2lzdGVyOiBBbXRzZ2VyaWNodCBN
dWVuY2hlbiBIUkIgMTg2OTI4Cg==

--------------SPGEivuie6OOrOC7xPmyRurG
MIME-Version: 1.0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+CjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4
dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4KICA8L2hlYWQ+CiAgPGJvZHk+CiAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPjxjb2RlIHN0eWxlPSJwYWRkaW5nOiAwcHg7IHRhYi1z
aXplOiA4OyIgY2xhc3M9ImhsanMgZGlmZiBsYW5ndWFnZS1kaWZmIj5SZXZpZXdlZC1ieTogTmly
bW95IERhcyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86bmly
bW95LmRhc0BpbnRlbC5jb20iPiZsdDtuaXJtb3kuZGFzQGludGVsLmNvbSZndDs8L2E+PC9jb2Rl
PjwvcHJlPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiA3LzEzLzIwMjIgMTA6
MTIgQU0sIE1hdXJvIENhcnZhbGhvCiAgICAgIENoZWhhYiB3cm90ZTo8YnI+CiAgICA8L2Rpdj4K
ICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDo3OTQwZjE3NjdjNWM2ZjcwMTk2
YWU1OTk0NDhiODdkNzViYTQ2ODM0LjE2NTc2OTk1MjIuZ2l0Lm1jaGVoYWJAa2VybmVsLm9yZyI+
CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+VGhlcmUgYXJlIHNvbWUg
cGFyYW1ldGVycyBtaXNzaW5nIGF0IHRoZSBrZXJuZWwtZG9jIG1hcmt1cHMgb24Kc29tZSBnZW0g
ZmlsZXMuIFNvbWUgb2YgdGhvc2UgYXJlIHRyaXZpYWwgZW5vdWdoIHRvIGJlIGFkZGVkLgoKRG9j
dW1lbnQgdGhlbS4KClNpZ25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86bWNoZWhhYkBrZXJuZWwub3Jn
Ij4mbHQ7bWNoZWhhYkBrZXJuZWwub3JnJmd0OzwvYT4KLS0tCgpUbyBhdm9pZCBtYWlsYm9tYmlu
ZyBvbiBhIGxhcmdlIG51bWJlciBvZiBwZW9wbGUsIG9ubHkgbWFpbGluZyBsaXN0cyB3ZXJlIEMv
QyBvbiB0aGUgY292ZXIuClNlZSBbUEFUQ0ggdjIgMDAvMzldIGF0OiA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIu
MTY1NzY5OTUyMi5naXQubWNoZWhhYkBrZXJuZWwub3JnLyI+aHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL2NvdmVyLjE2NTc2OTk1MjIuZ2l0Lm1jaGVoYWJAa2VybmVsLm9yZy88L2E+CgogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5jICAgfCAyICsrCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtLmggICAgICB8IDEgKwogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bV9tb3ZlLmMgfCAyICsrCiAzIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmpl
Y3QuYwppbmRleCBjY2VjNDA1NWZkZTMuLmI1ZGQ0MzQwNTM1NSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuYwpAQCAtODIwLDYgKzgyMCw4IEBAIGludCBpOTE1
X2dlbV9vYmplY3Rfd2FpdF9tb3ZpbmdfZmVuY2Uoc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3Qg
Km9iaiwKICAqIGluIGFuIHVua25vd25fc3RhdGUuIFRoaXMgbWVhbnMgdGhhdCB1c2Vyc3BhY2Ug
bXVzdCBORVZFUiBiZSBhbGxvd2VkIHRvIHRvdWNoCiAgKiB0aGUgcGFnZXMsIHdpdGggZWl0aGVy
IHRoZSBHUFUgb3IgQ1BVLgogICoKKyAqIEBvYmo6IFRoZSBvYmplY3QgdG8gY2hlY2sgaXRzIHN0
YXRlLgorICoKICAqIE9OTFkgdmFsaWQgdG8gYmUgY2FsbGVkIGFmdGVyIGVuc3VyaW5nIHRoYXQg
YWxsIGtlcm5lbCBmZW5jZXMgaGF2ZSBzaWduYWxsZWQKICAqIChpbiBwYXJ0aWN1bGFyIHRoZSBm
ZW5jZSBmb3IgbW92aW5nL2NsZWFyaW5nIHRoZSBvYmplY3QpLgogICovCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtLmggYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fdHRtLmgKaW5kZXggZTQ4NDJiNDI5NmZjLi42NDE1MWY0MDA5OGYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtLmgKQEAgLTMwLDYgKzMwLDcg
QEAgdm9pZCBpOTE1X3R0bV9ib19kZXN0cm95KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8p
OwogLyoqCiAgKiBpOTE1X3R0bV90b19nZW0gLSBDb252ZXJ0IGEgc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0IHRvIGFuIGVtYmVkZGluZwogICogc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QuCisg
KiBAYm86IFRoZSB0dG0gYnVmZmVyIG9iamVjdC4KICAqCiAgKiBSZXR1cm46IFBvaW50ZXIgdG8g
dGhlIGVtYmVkZGluZyBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QsIG9yIE5VTEwKICAqIGlmIHRo
ZSBvYmplY3Qgd2FzIG5vdCBhbiBpOTE1IHR0bSBvYmplY3QuCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtX21vdmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV90dG1fbW92ZS5jCmluZGV4IDlhN2U1MDUzNGI4NC4uNTYyMTdkMzI0
YTliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtX21v
dmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdHRtX21vdmUuYwpA
QCAtMjM3LDYgKzIzNyw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlICppOTE1X3R0bV9hY2Nl
bF9tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAgKiBAX3NyY19pdGVyOiBTdG9y
YWdlIHNwYWNlIGZvciB0aGUgc291cmNlIGttYXAgaXRlcmF0b3IuCiAgKiBAZHN0X2l0ZXI6IFBv
aW50ZXIgdG8gdGhlIGRlc3RpbmF0aW9uIGttYXAgaXRlcmF0b3IuCiAgKiBAc3JjX2l0ZXI6IFBv
aW50ZXIgdG8gdGhlIHNvdXJjZSBrbWFwIGl0ZXJhdG9yLgorICogQG51bV9wYWdlczogTnVtYmVy
IG9mIHBhZ2VzIHRvIGNvcHkgb3IgdG8gYmUgY2xlYXJlZC4KICAqIEBjbGVhcjogV2hldGhlciB0
byBjbGVhciBpbnN0ZWFkIG9mIGNvcHkuCiAgKiBAc3JjX3JzZ3Q6IFJlZmNvdW50ZWQgc2NhdHRl
ci1nYXRoZXIgbGlzdCBvZiBzb3VyY2UgbWVtb3J5LgogICogQGRzdF9yc2d0OiBSZWZjb3VudGVk
IHNjYXR0ZXItZ2F0aGVyIGxpc3Qgb2YgZGVzdGluYXRpb24gbWVtb3J5LgpAQCAtNTQxLDYgKzU0
Miw3IEBAIF9faTkxNV90dG1fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogICog
aTkxNV90dG1fbW92ZSAtIFRoZSBUVE0gbW92ZSBjYWxsYmFjayB1c2VkIGJ5IGk5MTUuCiAgKiBA
Ym86IFRoZSBidWZmZXIgb2JqZWN0LgogICogQGV2aWN0OiBXaGV0aGVyIHRoaXMgaXMgYW4gZXZp
Y3Rpb24uCisgKiBAY3R4OiBQb2ludGVyIHRvIGEgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4CiAg
KiBAZHN0X21lbTogVGhlIGRlc3RpbmF0aW9uIHR0bSByZXNvdXJjZS4KICAqIEBob3A6IElmIHdl
IG5lZWQgbXVsdGlob3AsIHdoYXQgdGVtcG9yYXJ5IG1lbW9yeSB0eXBlIHRvIG1vdmUgdG8uCiAg
Kgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICA8cD5JbnRlbCBEZXV0c2NobGFuZCBHbWJIPGJy
PlJlZ2lzdGVyZWQgQWRkcmVzczogQW0gQ2FtcGVvbiAxMCwgODU1NzkgTmV1YmliZXJnLCBHZXJt
YW55PGJyPlRlbDogKzQ5IDg5IDk5IDg4NTMtMCwgPGEgaHJlZj0iaHR0cDovL3d3dy5pbnRlbC5k
ZSI+d3d3LmludGVsLmRlPC9hPjxicj5NYW5hZ2luZyBEaXJlY3RvcnM6IENocmlzdGluIEVpc2Vu
c2NobWlkLCBTaGFyb24gSGVjaywgVGlmZmFueSBEb29uClNpbHZhJm5ic3A7Jm5ic3A7IDxicj5D
aGFpcnBlcnNvbiBvZiB0aGUgU3VwZXJ2aXNvcnkgQm9hcmQ6IE5pY29sZSBMYXU8YnI+UmVnaXN0
ZXJlZCBPZmZpY2U6IE11bmljaDxicj5Db21tZXJjaWFsIFJlZ2lzdGVyOiBBbXRzZ2VyaWNodCBN
dWVuY2hlbiBIUkIgMTg2OTI4PGJyPgo8L3A+Cgo8L2JvZHk+CjwvaHRtbD4K

--------------SPGEivuie6OOrOC7xPmyRurG--

