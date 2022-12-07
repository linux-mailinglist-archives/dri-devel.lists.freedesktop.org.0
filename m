Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D772C645F34
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E580B10E3FB;
	Wed,  7 Dec 2022 16:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496D310E3FB;
 Wed,  7 Dec 2022 16:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670431602; x=1701967602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VuMoQmoJVSWLay0+a3E3L89oXnmGErbA8XAab6rLlts=;
 b=TWz50y1Fa7SGN8TpEo6DHmbYPQNTR31OCf423+oDDL7ZOaebNlC9HbKs
 dLf88neYpbUXdt8ybIekuQFOH1dCA4G4rtgp45EbyEYDe23wXqDAD0THq
 5D/4669dNsQoHRzaRkBKFrXib6qVfM/xnd0myEfEV1qkALkWU4pnrv60L
 sWlPaT0ngW1MFk/VqZX2NeEz0RrZc6en8rng8nZ8ftJCj+9nzk5cFzBSi
 vvJqeLA51cQVeoBbUUFeoMjFpJnRQZXY0lWdmY7kgLsSuCSe/x8JUEgg/
 rQ8EiSkieEKIVO7OFHsIT9NVxtXKRoAia6Hjsjw7Vo0CSEJ+YIfmXe8hn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379108405"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="379108405"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 08:46:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="788957264"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="788957264"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2022 08:46:36 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 08:46:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 7 Dec 2022 08:46:36 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 7 Dec 2022 08:46:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYp3zCWhLh4hKoeHSMhMcwa0VJbv0eqRiLnJI3r/Y5MszyHhOPTbc/s8mgFlQmESUAF6Zo6+BJuqzII3NZBY2jmqaY5HveUi5eMQTnL3mvAmjui72Vn2tVFyM9hBQZCnY5YLBJkzxbPFzRewr8Qx+IKSdEOtcliA8vxOEh/nWjovi6BAKu5bMRqJnz/3uU6zSjgYJ9zvg06e3P8kwHNllnqKSvCF69fuLnwN0BtVml0x74m8r++lNBd9RIFvbHTepZruz1VGfmS8kK7zdTuQvK994QbmahOQy/mmzs6XKxb2YbXi+XHiTna/EOVMKtJ9dyJ553c2QnyZ0Kx5mewv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=338I1d8uIq9N6axxVOSldUN434y/n3gNhJwKrRWxab4=;
 b=O471uEC4QGSBEnQBMJeCJEh2e8Bu4T2+/dEsKVuRhMzHJNlhyrMqjhdzGyiWBqr9Hzammq6/QtylJNnr9wyWK3RCPH/9Le8JdEJLf7Wr3A5JbTowN029gV+019CieouH+hrt4F9tu/MC4JtlxhTt/2mACZls8nL08NZb+pATYHTBv6yYJN0po4564VwwHVNiUSqrSd4nfVkOIClml8JuOAPvZGJWgB7vomb8yYXmS3zeqlqz9Vo2vmVuX2dyzM9cyf7920/JI1tXWJc0PxNM2oR6zgNs4+GdMuQvZ0KkPBSjwGK0NVl6Z4qziQ+ulA1ha64TDlOVry65psOYoCQ0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA1PR11MB5828.namprd11.prod.outlook.com (2603:10b6:806:237::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 16:46:34 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 16:46:34 +0000
Message-ID: <64b04c01-471b-ded6-2bc3-13319f3b01c6@intel.com>
Date: Wed, 7 Dec 2022 08:46:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/i915/gsc: GSC firmware loading
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20221206011908.2745508-4-daniele.ceraolospurio@intel.com>
 <20221206051555.2758268-1-daniele.ceraolospurio@intel.com>
 <7fdc90e651313c3238e66b1a5879300c4680cb28.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <7fdc90e651313c3238e66b1a5879300c4680cb28.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA1PR11MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: f972bfdf-b73b-48db-4cb9-08dad8729971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1xDNxIt0bhvvSeI0BYIQkeAiweBxG4I4uWLQeQBi9TYUDi1dFQdzDPyi2UgcLz0tLGprvFOiL2IDJ7Ba7ldWQCTpRFmRU6YEIiCDWpd8mpy+5OmxeP21krKbFkDOap5RbGBeCqOXTHpGZTyZ5spfqAofUwWYd83JkaIc1/zVhP5wr5UJ3dWRwsCb5rzp8FqhJUyH1Y6/83AhUzuiyVKGu+AhldSVWen2c4pc+K5+UrmPhW1QiiNmt53zdoz/hSrJvVH7NyAh/kM8erdXRrUwFJQq2vdI78vnTI4zYjVNpxfzPtYll+hx8we4zdYNTS97q2U0r7ncI/JAf6vyproTDCyxT+T5y4+FOXwP7V9c3nLKIlUSw+PSjDmCACB7UN7E4Zht3nUrJcANspW967PiuSb0+1OYIn7yyoCn2Zkj8bRxNmlbWdbdQICg8Zqd3Ikhhh9z5iJh/10mCNd96PgzKh8GUSEOuugZ7CRl8oQJjRFCqkYI+PizpVmVW5oH/2obRvi4wMPw2UTCSXDazxkT2z7AM4SxX6oDa22fNPVQWVlsgXIe2FptByRnri06e3+Wsi9JpBJW+PaD7sUDRIva5Nkkv3oFnS0Rk644g8Z1KwpHfsJMDtcjTb0rMPquYB2nlm4UwYsJrj51doUp3yn85zjJzcPquMRoldLn1FFy+fTu1NqbpKLMd8BjRERsywDCW4OQmeKYLHfOhVLVlp9ZkT1QZrSevNhT6Wmxbia2/cw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(86362001)(2616005)(83380400001)(38100700002)(82960400001)(31696002)(2906002)(8936002)(5660300002)(478600001)(186003)(6666004)(6486002)(26005)(107886003)(6506007)(6512007)(53546011)(4326008)(66556008)(8676002)(66946007)(66476007)(450100002)(54906003)(110136005)(316002)(41300700001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZStEYUNYZXN1WHBGUjMzNCs4cmZtSnphYm9xU0RpTXpDQk5JTDVrUzMwaEJV?=
 =?utf-8?B?ZlVIcEd0SkdMOUYxM2N6Z0l4SVUybEtOcEgvcVN5a1VsNVErcUx0cW03VVkv?=
 =?utf-8?B?b011VEhLaWlvekdxYzZkYXZtYTJYV1A2NWtJaUJNNE5PRlpVN2hJZHo3WmNN?=
 =?utf-8?B?WTl3N2lZNXBFRHNVWUMvOG5Iem1FWEoyVWZtN0NXV0sxaTI2UGZKUzJ0Ynds?=
 =?utf-8?B?SlhCSVp2RkE1UnhmMjRuN2JxSE9MQUxOb1l5aWd5MkFid2pUZTdLaGhRTXlP?=
 =?utf-8?B?Y2NwQlF0RVFubzk3c0dvT2lueXNONnpjQUFxZUxMTGdjekkwY2p0VVN6cVcy?=
 =?utf-8?B?bDZPUllxdGI1Mmh0MmFMZU5UMUZFNXhwcmxxOVRodU9EdFp4WFM3NXZYejZ5?=
 =?utf-8?B?VVJ0Q09Nc0RJaTZTVW5QWWlUYTZ4aXZmRGUwZ1RWcnJybC9HSXRCNkQ1K25m?=
 =?utf-8?B?aDQ3RjkzMEtQdXFIYmtyZVhMbDFwbzF1NVE4d05OcWRZTkdxaDA0K2VQZ0VT?=
 =?utf-8?B?Mk1pMWJ2akJZNHIxMDhTQjhZWUdTK1VSLzVzNnhNQ21HbmY3QWF4cWF5Zk9O?=
 =?utf-8?B?Qk9lZ2Y1aS9ZaEZzTEJCVEFLQVpnRThJejlkSHJwWm9SZmJtVjJCK2thS21Q?=
 =?utf-8?B?KzR4bzZueTlOWEZRTFE5VkhMdVhDdDVSdzQzRUtyQ2Y0cXlOUW5MT2JNbXpa?=
 =?utf-8?B?QzdGVFdJRTVFcTZjS29CNloxWW8yVEZNeVY5aE5nSEtLZ2lnMXRPRDliUm4z?=
 =?utf-8?B?azlnL29sbm5iNWNkUkd2NVFXMDJWMmZDV3ZBbEt5QXZhRGlIRjZsOHRraUkv?=
 =?utf-8?B?aUZ1RkdveUkvNStpSzJ0R1BlNW90UnFFNmtUazBpRTc3N0p1ZzlrTnMyUEdz?=
 =?utf-8?B?elRLWFF2bDFxRlFhaXJWbUhGV2NjaDQ1dkEwVGFDTzJNakM0QWt3N014a1pj?=
 =?utf-8?B?VC9qM292MGRBYnViVS9CT01KbjUzbXYwenQvd3lxM0xiRWljN0M2MWpPUExI?=
 =?utf-8?B?U2U1bzdySk1mWGhtRXQyTjBIYnRBbXRtcU1EWUIxUmVYZDgyOEtieWpYMzJP?=
 =?utf-8?B?MlhKQmZxZ3IwOTdtOVFBdkVyVHJyZmgxR1lyMURZZTk3K2RvMlh2b3lEUjdO?=
 =?utf-8?B?Vko4TW9iOTdzbTFJZGFlRE9ZaDdwa2w2YWtBM3BPZGYxTUF2a1JoRmF6Lzkw?=
 =?utf-8?B?RytmUjNCbjFPTlFNL09iZFNaUWNpa3IvaG1NOW5LaWcwNU9IaEMzZUJIL1hP?=
 =?utf-8?B?eTlFaExxRFBFSEZrc3g1Qm14dVVDc25ycHNUMGUrcGYrYkg4ZjNYQWRTanVX?=
 =?utf-8?B?Y2h5dUZycW9KN3RkNEZURVJGVnMycFl5RFBHNWMySlRnbUtjeDcybU1NYUdm?=
 =?utf-8?B?ZjFscnpSQXJFT0tabFN0bWJpWTlMODNpbDdiL2VnQ2s2M1oxTUt4YmQwazVZ?=
 =?utf-8?B?ZEw1VXc0bnUyS1FwN0Z6Wk1YVGRUdCsyVHFFMVBjTzdGekFRdmlqZGRwdUNU?=
 =?utf-8?B?QURiUHFtL21iSFpkYnBreHBpUTNSSEI0VXl1SzlaNmF1SWhqTE80QUVMQ2ho?=
 =?utf-8?B?SmtHQWhOanVJUkNPcCt3cEhYSDRlUlVKZmVrMVZ0ZU4zdlhvVy9WRE83T1hl?=
 =?utf-8?B?ck4wNVU0QWtaVEZwRjBLY0EwaWtGanJyVjlYck50T3A1YmZCUGlyak5vSnMv?=
 =?utf-8?B?RTB4NFNDUWlqTEJKN3EydDlPRUtmaWlIV1lZOCsydXNOTS9DUzV2cDR0bkZS?=
 =?utf-8?B?TG90Z0c2UUIrWlBoQUdRV1BtSUtUaEZxTXlzd3pjZitsWkJ2SUJLVTNhcSt2?=
 =?utf-8?B?ODJUWHN2RkFGaktjT3FQQk1KUFJSYjZ4TFFkUGpNVW1NZVZFeXE4dXljck02?=
 =?utf-8?B?QVJkQkg1NGd3RDVlVHMvdnUwOVdJeEc1dG5mVm1xa0Y4U0tPOHRtRDhpZ1Ex?=
 =?utf-8?B?bTFOenVVN0JXazJFVzFPZEFiT2ozZ3VCdk9iMndLb2ZPWnJpbHVaR3VRS2s4?=
 =?utf-8?B?MkcxbGJmKzU1SkxwZHlWenZJMEYweW5aaSs5c2l0d29WaWxRcEE3WmlmTEpO?=
 =?utf-8?B?dERmL3MvcnJxMmFjYUNBNmxTaG9pakZhTlB4Y2NMNHVYa1lhUVRyWGdCRW9S?=
 =?utf-8?B?WUxZRDFEa0FKL2oxQzZtc0oyYW92UnBQSS9NR3B6Y285M0lSQ09DaVBzUC9x?=
 =?utf-8?Q?oGCJz4wVkRd1FeT3V8G4K0Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f972bfdf-b73b-48db-4cb9-08dad8729971
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 16:46:34.0431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1IILGEje5x0FwoQmstZC5Ar+tK2DUGg+10jyUIVUW163zvKIw/kGQwsYvw/G7vIvW+9tgsbDcFk6TPP8RWM7Gr6hQzSUqMwgZjqN1fxxaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5828
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/7/2022 2:16 AM, Teres Alexis, Alan Previn wrote:
> Diffed the patches and reviewed the changes -- i.e. the use of the worker for the gsc fw loading cmd submission.
> All looks good - just a few nits below.
>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> On Mon, 2022-12-05 at 21:15 -0800, Ceraolo Spurio, Daniele wrote:
>> GSC FW is loaded by submitting a dedicated command via the GSC engine.
>> The memory area used for loading the FW is then re-purposed as local
>> memory for the GSC itself, so we use a separate allocation instead of
>> using the one where we keep the firmware stored for reload.
>>
>>
>>
> Alan:[snip]
>
>
>> +int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc)
>> +{
>> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>> +	struct intel_uc_fw *gsc_fw = &gsc->fw;
>> +	int err;
>> +
>> +	/* check current fw status */
>> +	if (intel_gsc_uc_fw_init_done(gsc)) {
>> +		if (GEM_WARN_ON(!intel_uc_fw_is_loaded(gsc_fw)))
>> +			intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>> +		return -EEXIST;
>> +	}
>> +
> Alan: Nit: I see you've put the -EEXIST back again - not sure if we need it. I'm marking this as Nit simply because we
> dont consumer the return value from where its being called - but its still weird that we are returning an error in the
> case where FW is already there so we skip loading and allow normal operational flow (not error-ing out).
>
> Alan: Nit: not sure if we should explain in the comments how we can already find the gsc-fw pre-loaded (IIRC, it could
> be a prior driver unload that didn't do the FLR?).

It should be impossible to get here with an already loaded FW, because 
we only queue the worker if the FW is not already loaded. However, for 
safety I wanted to add in a check to make sure we're covered in case 
something weird happens. Note that there is a GEM_WARN_ON tied to 
intel_uc_fw_is_loaded(); this is because if that function returns true 
it means the driver knows that the FW is already loaded and therefore 
the error is just that the worker got called one time too many, while if 
that is false it means that we got out of sync with the HW state and 
that's a serious bug we want to flag.

Regarding the -EEXIST, that's in preparation for a follow up patch that 
adds more functions to the worker (SW proxy) that will have to be 
skipped if the GSC is already loaded. As you said it doesn't make a 
difference now so I thought to start directly with it instead of 
returning zero now and switching later.

>
>> +	if (!intel_uc_fw_is_loadable(gsc_fw))
>> +		return -ENOEXEC;
>> +
>> +	/* FW blob is ok, so clean the status */
>> +	intel_uc_fw_sanitize(&gsc->fw);
>> +
>> +	if (!gsc_is_in_reset(gt->uncore))
>> +		return -EIO;
>> +
>> +	err = gsc_fw_load_prepare(gsc);
>> +	if (err)
>> +		goto fail;
>> +
>> +	
> Alan: [snip]
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> index 65cbf1ce9fa1..3692ba387834 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> @@ -7,8 +7,19 @@
>>   
>>   #include "gt/intel_gt.h"
>>   #include "intel_gsc_uc.h"
>> +#include "intel_gsc_fw.h"
> Alan: alphabetical ordering?  (not sure if this is a hard rule, for me its a nit)
>
>>   #include "i915_drv.h"
>>   
>> +static void gsc_work(struct work_struct *work)
> Alan: Nit: would ne nicer to call it gsc_load_worker unless there maybe future plans to expand this worker's scope.

There is, this same worker will handle sw proxy as well.

>> +{
>> +	struct intel_gsc_uc *gsc = container_of(work, typeof(*gsc), work);
>> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>> +	intel_wakeref_t wakeref;
>> +
>> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>> +		intel_gsc_uc_fw_upload(gsc);
>> +}
>> +
> Alan:[snip]
>
>
>>   struct intel_gsc_uc {
>>   	/* Generic uC firmware management */
>>   	struct intel_uc_fw fw;
>> +
>> +	/* GSC-specific additions */
>> +	struct i915_vma *local; /* private memory for GSC usage */
>> +	struct intel_context *ce; /* for submission to GSC FW via GSC engine */
>> +
>> +	struct work_struct work; /* for delayed load */
> Alan: nit: would be nicer to call it "load_worker" unless the future plan is to expand the scope of what else that
> worker could be used for.

same as above.

Daniele

>
> Alan:[snip]
>
>

