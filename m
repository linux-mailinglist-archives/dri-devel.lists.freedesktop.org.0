Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAA45E646C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BFC10EB29;
	Thu, 22 Sep 2022 13:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7B810E37F;
 Thu, 22 Sep 2022 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663855019; x=1695391019;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n9v7jhqzVglFOlhIKu0oZoDqXBjAh+k21zLXX4NdBwk=;
 b=NY+ro4Pk86ZvaUcY823muC1qAjFH7rfO4NYo+dRbZ53TlKl5qjKw63a3
 lS1oFJGLSHwkumaeXgqsBAUtZcbuCkdYwq3CtadQRmz2sOvYfmqeUePTg
 m+C8aWMEN1AC1jk83C3oDdLX01DUwE1Xj0jBB5sVa531E3UnfNm4It15t
 oG/21UsehJcm/BUTTNa7dBH8SalLtxcVv8mSuzj8sxtEeZh6ZSI29JJRf
 gaBM27b6iUnz5HnwkRmbXZnWjmOK59Y0Q7pBsz4fqyyT1UKNfjmZciKus
 iAU0orqIj487vNwP8+p1r5oHEp6JHuL7Dm7z6uyIgOxdnuPG48rs9Bta1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386588418"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="386588418"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 06:56:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="795098421"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 22 Sep 2022 06:56:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 06:56:58 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 06:56:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 06:56:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 06:56:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0HG+aZb2bdY7NgBUw+V6h8+jAoTI/C0mcocjDfxz1KzGBB6bNN2MiqUeJ+pcHoW5xMnbHX9a69gXYvWk7uTr/3PCMnqhwnBbuo2CaFlovFpk3Js1WK3nK9+XB0eRMOmRuWGTaAUnqa7vVjjYXb59auvgMFWkv8YvTpjBlAhCv6YCcpEiYQAs4n2kBGrK/qA9BfLOvJ5NyrOHAj6H+9TceYhGDB1IXIK0t0by1gZGChyVG7mYpnZUfVjPgEnBuCc1IFhBXglU5ZOUetio7tLLWpHHtfz5JGFaepE4UeecfEKrHGOHG9Wl0sRzNbsy9XnYvCUQBEllgGR51DvPMdLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Thv2RiwOHL3KqYenQkNEktHGqxUTjddsrzcRmsg5WQ=;
 b=kFTASc4zpMAnbZgCaLnu+4Z5Fx24tRe/OOp8UbjyZ5um9g8eiV8QvU5d6xb/8SN5tWEv0ES3XqovX5+qmerRpqFwE6u3+R11a/JwSe32JmZopNjrE0l1rc9S55yHfjrZ8jMbqOJmlad6ypDwXobrIdaf/pyVShL077Wqbz5T5ISNAv5meYuWzossVF6Joelv3Akwzwd6oAKmFM5ucpX81/wXAJcF239cHHYlxyBAeo0+CnHNUrtGvqIrUP0cAAM+tudmWeI93krKPeq7izvWVJrXaoCG6nBedJVepOyQ1LaIem3mWE7bjHJF5J/7u9q6MKNqhFay+sp1YWhTiIzuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6559.namprd11.prod.outlook.com (2603:10b6:806:26d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 13:56:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%3]) with mapi id 15.20.5632.026; Thu, 22 Sep 2022
 13:56:56 +0000
Date: Thu, 22 Sep 2022 06:56:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Message-ID: <20220922135654.a5s3hamrocvqsef7@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
 <20220920083149.pfgk62ugajc7trth@ldmartin-desk2.lan>
 <20220920200512.pjjehlrebcr63uf2@ldmartin-desk2.lan>
 <e5d340f9-848a-4bf8-29a3-2bbdbcf7ed4a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5d340f9-848a-4bf8-29a3-2bbdbcf7ed4a@intel.com>
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 1502f0cf-3d87-4e90-3144-08da9ca24fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2MSOEonv3BDHz1km2K+WV/MifhyEM2cn9kNyNuiqE3IdL/HOSXGulzU1a3WEUaPi3lo7v/OoAufJ4mg3VI6ptpp3uc/fVaOgF5Dl30AggjC9yoQeoQFXNHBb6nlSd1oV6KUohz9Sf9ZK5dZOzw2OiutNC3UjiUwMF7zbs+L+PLziIDfz0jdVcT4zbfgli206E+hZqX5LmWHOxkNJ2SbTgpBAaaYViASSCQ26VSYHsoNr0hdUVeyOX4ypq1UdfwQWyyMwLYnZ23BMsY5KIKw5D95FJC3ExZdNNeCdSckqRSyqAwQvf5+OTz86rNizFusnnRSgAT8W6HGsYWCqCued3PMYW4FiM3NQtGu6qHhqZzA5p4J518+6FO3IXOisNBOBoCb7w+w/QSplHzKRXjVF+4EkTtRtITJu2LkDgNFggxk6ZKGyYpRFbheihc2oXO4XqL3uH7A6XJOnrD1SOSH6fRZjrDfQzxVPoY3uuBn2/3/bMmW+rpvtMCM7tD/R3NPDB82m5FSeyN7Tk9OH23NoOPoxXrzGSifsqpWQWoXaNvpeRN+IR0lig/WBuyejWpCFdjsNw/oGQIz34inSf+q91WJ/psQSnrjiPzPMq9XMELIi4YBa8D5nhHMLKfbzxD15RVAMYmOnyaAMzw43NLlasH2uOXhgrvy2bp8ee6kfG+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199015)(83380400001)(6506007)(41300700001)(186003)(1076003)(82960400001)(9686003)(6512007)(26005)(86362001)(38100700002)(36756003)(66946007)(450100002)(4326008)(66476007)(8936002)(66556008)(316002)(6862004)(5660300002)(6636002)(8676002)(2906002)(6486002)(966005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?s0pULyH4DyhdATs8wK2e18gQjkSofTXx3En0rK17yeMTJvWRo9JN3xzHKA?=
 =?iso-8859-1?Q?cv9PayaVUkL+RSzkRl7vbRARV0i7WHVL1agX2RNeOuPc37VGpFShlWhgwf?=
 =?iso-8859-1?Q?eo/9Ezht/Pi+cGLuDf9B0mcKMbzzMeM4f88Y0Ls4G8WkjAZRwqUpJJLR0R?=
 =?iso-8859-1?Q?F2X80RfEZgMq3OIeJwRCyeZZgJZjjG2Wy/eWVBDWJW2D2jMTaC8RLj0VBG?=
 =?iso-8859-1?Q?5VGimhq2PXbPHl61ZpuJePT+TO1YwccMYz19lBt4xTywiOd0SNfRxllJ9f?=
 =?iso-8859-1?Q?796B22W/otigplGF3FpFpYPyEr49Mvc1Is4+4tWCDeWPG3CSbJrBlmGh8l?=
 =?iso-8859-1?Q?ekScu0EQGoXU7sfxm1FMQBmul9MP/Fngr5zefUJkw7x3rGznshFsy7Z0JR?=
 =?iso-8859-1?Q?QDQdIX8dlFxrNlZnT9nECxnxS7cfxuvh/LH1eC2C5S6ugbCpn4AIOS0mPv?=
 =?iso-8859-1?Q?10YYjk4/0THMQ/2XSvpSYvGHl1uWfgiO59Nxd7+f7TUJwnnaASZR+bjcge?=
 =?iso-8859-1?Q?RCh4DDb/ismZ3QYgSfHf+49Ohoos1dVEfMYpsnXEgOykC3Tt43nD6Hv/zK?=
 =?iso-8859-1?Q?eSNuTtKrAEvH8xPZxx2uNGhJP0PqLHzeyVUB5TTqiKk4t0o+pYkAJJSD7v?=
 =?iso-8859-1?Q?D6W3BfCtwfPMmP68uJaLlwV+nEIQlBbpcW4IUCN+dbiTo5nooV6VoL3MA8?=
 =?iso-8859-1?Q?gyvHoFUOeU9Q7WoMywpUpXMGifrkzWb0EpuC5ZMSfrHYd/zJKScvWc8hiS?=
 =?iso-8859-1?Q?dtVheXlqsC+Lj9sV5VaLKRV0xYoHu7pEMbRyK2gRgZbRofnJiFiPFe84sj?=
 =?iso-8859-1?Q?q6AvFw1HYweQEXz616OzWV2DDlsNLoF+hz7zXGKxywrvqDeUJhVCh7P3JK?=
 =?iso-8859-1?Q?d3C4pA+cwCdMrVDIXx50GLjCQ3lxaPM7x3lfhV8h8ivkBiHnoKw8m+zA6k?=
 =?iso-8859-1?Q?6ZhY7kXRgQZvaBhC6Uu/iW4PfdtVHFIXa5DogLqiSTzJJA/UYwsq/EwdE/?=
 =?iso-8859-1?Q?mqQn+DepSUuF4TdW8qZ/i5TfNKrb4FG2de8yZXesEFQCzi5lc70zvBhHqI?=
 =?iso-8859-1?Q?7NqiFtrzE/1a1Jf+Gwu8igdkK4wqvKyDTKbXt5052HjOX6/C8zXLn5tyiR?=
 =?iso-8859-1?Q?2TTCo/Uml++RbK+J8iMg4m7fE0/a6FSOvRx1WITVj/oUEZKKewfyTMbMe/?=
 =?iso-8859-1?Q?5NPwYJBeDnvPTzSW0r3SEndReZSocvssdFDtnF9kwJJH/QH5tYiq/Cfvgw?=
 =?iso-8859-1?Q?jN0WNE+osvjDbQrirlbGTTFqbx+ap4kG5WaS+ozTaTtneJeYG81zjjhzGl?=
 =?iso-8859-1?Q?CeU5+AXGmNSC22hRJwqxBQ07iKviOkJEBbkjkdA6NmBgeWAWvF9RhKTssP?=
 =?iso-8859-1?Q?XJmjJ59M3jOpAg46uWUa7pEMXRSQrznCDwWK+H+FJFb4ysvzFDYZBtEIJM?=
 =?iso-8859-1?Q?x5CYIR6ARfCDy5VYLq8azmG3vjy/3oKW/nYHcnmMe1lSqDBMUMr/GA04kc?=
 =?iso-8859-1?Q?TQVSPpkKxsv76/sD6KQVO1HNFf6hg+3j14W++xL9f/AY1y+90DyyQJVwpA?=
 =?iso-8859-1?Q?/pd/4rZUaoEjPrjqGqDIZ9tY6UMXNPrBje5E4zVGlVuRJEOhze8Vx4zMRP?=
 =?iso-8859-1?Q?1VZeMP7r6xmk/G3Zxewxdj+dUalpcKi3Z4dPTH8UTCMeof8+sg+8bNxg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1502f0cf-3d87-4e90-3144-08da9ca24fae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:56:56.3672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTsWxJIUuwEC2Yp0PAbGj6HHM7zoCbJczCogyTDKBc6MInwbJ23Oy4q+sWU0RwZJmggs7C2KE3qoLEp2EnihruXLtobELo3fV7atODp0NQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6559
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 12:00:38PM +0530, Iddamsetty, Aravind wrote:
>replying here for earlier comments too.
>
>On 21-09-2022 01:35, Lucas De Marchi wrote:
>> On Tue, Sep 20, 2022 at 01:31:49AM -0700, Lucas De Marchi wrote:
>>> On Tue, Sep 20, 2022 at 12:49:40PM +0530, Aravind Iddamsetty wrote:
>>>> As an integrated GPU, MTL does not have local memory and
>>>> HAS_LMEM() returns false.  However the platform's stolen memory
>>>> is presented via BAR2 (i.e., the BAR we traditionally consider
>>>> to be the LMEM BAR) and should be managed by the driver the same
>>>> way that local memory is on dgpu platforms (which includes
>>>> setting the "lmem" bit on page table entries).  We use the term
>>>> "local stolen memory" to refer to this model.
>>>>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>
>>>> Signed-off-by: CQ Tang <cq.tang@intel.com>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Original-author: CQ Tang
>>>> ---
>>>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 113 +++++++++++++++++----
>>>> drivers/gpu/drm/i915/gt/intel_ggtt.c       |   2 +-
>>>> drivers/gpu/drm/i915/i915_drv.h            |   3 +
>>>> 3 files changed, 100 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>>> index acc561c0f0aa..bad5250fb764 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>>> @@ -77,6 +77,19 @@ void i915_gem_stolen_remove_node(struct
>>>> drm_i915_private *i915,
>>>>     mutex_unlock(&i915->mm.stolen_lock);
>>>> }
>>>>
>>>> +static bool is_dsm_invalid(struct drm_i915_private *i915, struct
>>>> resource *dsm)
>>>> +{
>>>> +    if (!HAS_BAR2_SMEM_STOLEN(i915)) {
>>>
>>> I called a similar function as is_dsm_valid() in
>>> https://patchwork.freedesktop.org/series/108620/
>>>
>>> sounds weird  with "invalid" and the double negation on return early
>>> style.
>
>sure, will change it hope i can use that from your patch.

that patch is now pushed, so now you can reuse it.

Lucas De Marchi
