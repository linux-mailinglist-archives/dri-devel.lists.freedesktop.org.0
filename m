Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C95BD807AC0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 22:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1043610E7BD;
	Wed,  6 Dec 2023 21:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37B10E7BB;
 Wed,  6 Dec 2023 21:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701899254; x=1733435254;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qMV65Vzx/nBrSx/xX0tCRJMN0VbH78570+UXF1p8hAw=;
 b=ercKTyLtn7TusSlPNZlCZHKck2TGhbFk5Ho1UDbiI2ihYGkgBoKSc/21
 ve8JpZgExl6Cz2ueG+/Rprx+X246f9FZa+4KgzEF3SeI8OeJbK2BW0BA9
 g0ckPQF/DrkntCTLX5wrr2jgNWK+plhS/iGuOXH2MSS2YpmbI/1BeVtoF
 ZZiKtmGXyRG61rXcpoeqOatselxiSBvksVgFjLEmwr36Zln/4Ay2xOLsV
 cPlMY6qBNXwnDtu4j2gjWP9saLnBhV8VsDOQaMr8T57sRhFD9Us/s4HHn
 41Nttc7BciRU3qVcChZss4NIxxV8uvhp44wQ3zoGHOGi1uyVlA0++t7a0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12846494"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12846494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 13:47:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12862685"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 13:47:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 13:47:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 13:47:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 13:47:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9ydBWToYp25On5/ozsv7mgq4faeCYtcZDuuF9vt4SDoH0Nefc8+ScwZUEOz0bP7RjX+bYYgmJn6tYy2rrixlPcECSiTRRXCkFExrfyQSEq0CpNLfDHWTRCa3g4ckf9/Zn0LXvZdPcjLod4t1X8IoEtvFtdB6uLQZCyED90fPxxr1sKNM+NYhWO/ccWMCYp7xj1a1k3YE49xVafNT5csB1WLQTpZntiLS0eK8aPiGZZBsPX64jd7FY5/MplI5DpX3v5z5UBd348NbASxmI73aTRvxqatyDDaeW27BH00240mCEctQ6zuviujnNUkjJOt26D4Krrp64xarVaAd2qcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUS2XNun1skWP9/YnAZ+JoQ0Swkg1BzqtoDH6HsdSI8=;
 b=BlHX5iYoKYsnAS4lXnOVeJLzOqfGeBcRLWPAHAG/T+gDzqxDvXAWwQS2HAYoS1XMVGkVd+S4Oqk9Xi5IE6LOwQZ41MgQz066al5IxRDLKFrXgBnQyfwkMIStsSec9UJamfU5Fz5ubxRnt8qnJ+Ilh4l8EygbYGpTmQZXvzaZFZ9TkBNT4LJuUBe51c2d8emJlFX734LbF/ie0v2PR4tFOkgRSKiQYiw6pTJm9MnhsI0LUUb1Jaadl+5WIklPSFTrRvi++VCW4aS7ZsylmasEv2Gdamu2ySY9e8WcZIWP0QtOSPv7udc0KlH/Tc2vblYMEwu+zQHWIZjWverUw2Qrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 21:47:31 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 21:47:31 +0000
Message-ID: <cf64cae8-eac2-4e3e-9fd1-aef79c4000f3@intel.com>
Date: Wed, 6 Dec 2023 13:47:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
References: <20231130002013.282804-1-alan.previn.teres.alexis@intel.com>
 <20231130002013.282804-3-alan.previn.teres.alexis@intel.com>
 <ZWj8Ig7tzXLHZbSv@intel.com>
 <79897b361b09274efff9ee010fe9074d66f56bd8.camel@intel.com>
 <ce76d74bdd99d328eca5689ea5815fbb3a689ee6.camel@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ce76d74bdd99d328eca5689ea5815fbb3a689ee6.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:332::32) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH8PR11MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 76efc701-c7ba-4e29-68d5-08dbf6a4f2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SMVJgmJ2oudx0M0D2G3w5CNWNXGjXoIk9eiHeqzjOJgceUKedSXMEDRrN24n6zGwKvtZ1OWANAPw0n+8K7p8wmbiGvB12L7bgpm5vLlg8qN/QLbWcEOZfNUk6q3PaRaB5b6zTIQKSzltOSMh4G/GGhTQMGhrIfs7KYLu4ECcD7l7nd98cSNUKVUatteqMuw7XHJXi0HTpTOR6ksIr0zNtiIOncOaL27J5v8nv64N6HNSU1Q8FfSiNgCMG1pjvMDgd4IMBIHd5xrAiK6PeCrmkyD85WH/chM+5Bv2LdtbEDy5bYM4U9F7rVmlSbB0kxzDCYftA3nf1hjL0paJPtt75TWHNiYQRcPfy+Y99rly0H4ldshA/sS6ZdRXViK61cUDAmuNh01FI0aRivYLm1m63S3vE1GjYdwKGvimKZOzNE0H5DdyWnHgnEFg3iBD9cWN8cSIFDIOe4kgecM43NKG3wfPuqvlIENDNuyeckAiBursjzq67VR/+9RcX3FeleEwK7lSuWM3FDmPXOjVexM5GU+im7GHKBtvdX7tt7K7s9DtkGwC/yBG9ACJQ25OqRvG/exaZO6FY3Nr3KEMlV36fqIDl5tvK8gJ7l3cL3wC0WofeZwOf6WeHUBW4/uj41S9nsNMIE8gJh3c0jfKvQyU0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(450100002)(107886003)(26005)(41300700001)(8936002)(31696002)(86362001)(6486002)(82960400001)(478600001)(38100700002)(2906002)(6636002)(6666004)(66476007)(8676002)(66556008)(66946007)(4744005)(5660300002)(83380400001)(316002)(6506007)(53546011)(110136005)(54906003)(2616005)(6512007)(36756003)(31686004)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGV2cTJVVWd1ek5hbVl3cmFab0gxbTFXcktRWUUxRUlJb2JVeklWdlFTVDBh?=
 =?utf-8?B?Z1lPRmJHVXRJek9oZUlvTi9laE9WT3Rvc0F5bUhKV3ozRjJ2Tm5PdG5DQXJJ?=
 =?utf-8?B?aWVwTE1ISjdSa3ZBNDF1dnVrYnJQNkpDRmU3UXVDU04rTEJmcTRIRnphS0xu?=
 =?utf-8?B?aTFXckdvU3pQVDJTeUFFMm93WDNjZm9Hc3dTb2ozZVNxaUZMRVdQM3JONDhk?=
 =?utf-8?B?UjhlZXZsWjE1RHNoWCtPUEZmMjlkYVR3cStZVnZid2RGQzVCVHBZdUZpUlE5?=
 =?utf-8?B?VDM0STBmdW41NFc5OGFaQ0Z2OFhRY0w0Q1F4UThsalJpK3A2aXdhR0pab0Ji?=
 =?utf-8?B?eHRGQnYxK3I0MGhyTGdtemZyQ0pnRHAzNWFnR0JPckxUaG1qUXFaV3lpbW5l?=
 =?utf-8?B?TVg2bUV4TDk3Nm5MZU9qVmNuNjZWcEtPRkg4K0Y5Z3B5b1F6UUNKcFg5Vk9p?=
 =?utf-8?B?NUF2VWxpblM5d0VnUzlURWFPcy9uM0Q5ZHJuTU1uSzZoMm5Xd2p6bWJBS1c0?=
 =?utf-8?B?Qnc3N0lEdSttS3hsWGhBRExMWTBjY3ppc0k4UmxYUy9rSkRzNWluNlJHSTZY?=
 =?utf-8?B?MkFWdFo5SjhqaFZuVEZMQ1pGK09ocXg2V0ozbjUzYmNxRlVLM29Jb0UyeHlz?=
 =?utf-8?B?T1lvTDVkeUFnanFZSFJWWnVWNHJ0SHcyUTFqNEF6RXdIVWpzWlpIRkRiWi9Y?=
 =?utf-8?B?OTJ3NkF2dkM4RzZ6bm10d0YxUTJmYzdHYU5xZmpEaHBPRU5hM0pqbTZKelQ3?=
 =?utf-8?B?cVh1eXgycm9adDZ1VzdIR1JZUS9EU3FTSzhLWStxMnBKS0hmRU85ZFcwZUph?=
 =?utf-8?B?RGU1dWxYL0xZaHJhR0RRNEVKUWZDemFUZ1FuWjlFMkVOODVKTEFQVm9NeWsv?=
 =?utf-8?B?SDVxN1JueUovand5WC92c1ZTd3pDMVZoQTlLc2JuU2pIWFhTbG9aL1Q5QUZR?=
 =?utf-8?B?TmRmRmhPdkpaSXlSSGdkTTlyV05PbUdxaHJkUEtEMnFnL2Jkb2szTDBCZDVC?=
 =?utf-8?B?QnZRS1NaYjM3RVBjSXo4VlRqdG9RVytPVlpiQUJ2SzRlMThXSm9CZnlZcXdt?=
 =?utf-8?B?V0wvM3NmRzZBK0J4ejc3bktLeVA0NHVwOXo3aExMK3dOd1V4MmlOQmRhcW0y?=
 =?utf-8?B?OVpBZ0VRM1UwekdZekJVMzA4RU84YUl5cjJrZlIxR3pxMm16Ylp3ay9GckJw?=
 =?utf-8?B?UUhtaDdYQ2FndmtPbzUzdFhqU1J3dW93SmROMzU5RHE4TGVZc1lNRkZmNGh6?=
 =?utf-8?B?bXBUdTRDQUtiakFFVTc1MGxobFNmWHJ0MS9FN01UYURtb3ZKZWxaSXRrUTVz?=
 =?utf-8?B?NnU4U2k2VUMxYlRWcUZUdWo4VTZSWkUxVDdPLzZ0V014c3hkY2xBNTdqcFBN?=
 =?utf-8?B?TUV2aFk0RFR0ajJDSXU0UVB2Njl1emdlVmo0dURGR20zVVBvYWk3aWVESlFR?=
 =?utf-8?B?YzU4dlBDbGV5ZE1VekJIOWYzTnlRT3htNVpqY3oxVjI2QWw3R2lBd0JOOWhW?=
 =?utf-8?B?TlFBeC91MGUvVHJJeXVFV2kvVmpwclRjL1l3a2ovUHI4NVdmdm5YZnZtZ2VI?=
 =?utf-8?B?TTdWOXQ4dm12Z3VqZ0NqTytaYkFnL1dKdEorcVRYTXZRRk1aMVBDaU9IVis2?=
 =?utf-8?B?bm55emFKZWRFRitoemgzOXcwT2VuelkzZUsvQS94UURGVVNrSXpVVm4vVkdj?=
 =?utf-8?B?aHdFUThETmpaK2x2Y3BGbHVMeXBFOHdqcmlHRE95eGhZc3o3NVBrTzVZQVc0?=
 =?utf-8?B?Z2Mwb3pIVUg5bW0wVm1uVUpGZG5DcGxoK0ZsNjdBQ0p4VGRFdzJMOWJmc2xt?=
 =?utf-8?B?bFpYOS9GVkl4WjFwWVE5dEI0ckZOWDdHb1hYT05JSUQxSFQ2VGJQMk10eUZm?=
 =?utf-8?B?cTRERGlQZXFScnNvMFQ3K0lzbW0ySVVwS3VrTlhPVUxWSC9GZGxGTFJjQy8r?=
 =?utf-8?B?MGxIMTRyTFVMRXV1akpnUTlIYlVLYUFXZ1g4ekwwVUJtMW1HVlpuTDNzaHlJ?=
 =?utf-8?B?cWVvblB1NERlSU5zc3R5cjVIODAyUEprZ2I3dENaY09rR0tWYU01eVQ3S0Ns?=
 =?utf-8?B?WVJlbzl4WXdwemNJOFdmeHpqWk9kSE0ydTFJTzlkSWgrd2lxMm5OWFplRUJM?=
 =?utf-8?B?RDBRaHAvNk5SS2FmMlNicmpVTXViRnNRZDdSd3MxQzNrUjY2cHJBU0NNSVZ4?=
 =?utf-8?Q?KmoVsTyquqTxOuovaZLy3Fc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76efc701-c7ba-4e29-68d5-08dbf6a4f2ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 21:47:31.1257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RY6JbU+QCYVnUATXyAzUvsBr0L3C9sAZh+selcOr9ZQr79W/MUyMeAaPnkximbYW4Sk4i244UyazzrAZYYGnVC9x3LzxGG8h1lFD+54ra/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6780
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jana,
 Mousumi" <mousumi.jana@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/30/2023 4:10 PM, Teres Alexis, Alan Previn wrote:
>> As far as i can tell, its only if we started resetting / wedging right after this
>> queued worker got started.
> alan: hope Daniele can proof read my tracing and confirm if got it right.

Yup, we don't flush the worker in reset prepare, so there is a chance 
that it might run parallel to the reset/wedge code, which we handle by 
checking the submission status. The list manipulation is protected by 
spinlock so we're safe on that side. The rest of the approach also LGTM:

Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele
