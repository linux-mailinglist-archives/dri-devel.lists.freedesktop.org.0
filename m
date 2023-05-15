Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B77040ED
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 00:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0654D10E2AF;
	Mon, 15 May 2023 22:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D78510E2AF;
 Mon, 15 May 2023 22:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684189452; x=1715725452;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=445l22pEshsWVV+aVepaD9wcblQkj2trxvxpt9Q8tzM=;
 b=YHTyNX4juhw8LSIH335DYUxMKznlFr/q5cv8V/AUQ52rUWlnApwDG6kp
 vuMr7wb1fUf1y2BL3fOmHleIAauiR2QkaJ+6N7P5sPXJRAM89g+v+qavo
 Q4qlJUeTWtFdvfuc9j0K63x0NKtdsEg1qI6QwKCDjc3y/w0OkjLKz2P7F
 iSwRSgHVHGvS/uaJV2Elv/Aot/k3venrrltco/8rVfCNOPz4yHtXCicHF
 FlcPi3lPMCgvvpoJKviKvScOUwfn76qnr2IGWTEqaGd0vmMr8T8IIn0+l
 FnmwyNpkOqXLwkh7i61Qu+xLE2XHH076FUAh5W1h2OjrmxUaG2gpXiH0Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="379493499"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="379493499"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 15:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875372384"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="875372384"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 15 May 2023 15:24:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 15:24:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 15:24:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 15:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvoMKln9qCkzBjo2NYmdNFZrYfdODrxJ01Bkhyf5mRYsizO1AI7JU3dYRJNLeoPqyZpjyaj2GqVisWw29/6VjHFTDi/3012VPmUkgK64irOmX2a9mALSbYxfCQjbzv6awJdXf6kpMU+M1cXKCjqbpm04bkQ3jP9uI+K4GYuDvssIF6QErxDfKMWKCrUsJLp8tuN8dl0nzpF2PJbuPt7Di6ok/GvZlIzJ38u64jliri2ixw3OmwXNqNmuIh5tr/+b/cBn71KKx2HVgfxWsdaxhzitjutbxTCV9EUAD/KY/sne0dTbUtb4WfmfPIcNJQsw8pJAReSm1L4igRi5cLuxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+O753gCEUF5nLi4cc5RfT8JRTY0IZ5TABbANIwwmq6E=;
 b=Ksd91TX6wtnEcbREER1IXMOCrQHbqYzKeTXKPUU60jmLUPURzGqkQNB13d/V/hz5WFgCORDu/YlTfM18UkTuQR0h9NQYlY94aUTyB6bzLPofHyEe1KsdpQINAC1P0orBtnyqbW930p9/JugRG94J6zPuiuTgi/zEy5fGr2y0Rhu5eMuca6Xr5kce4ZonMSZnGBbs0LH2Vsy/rQHkeB/lib8AxVsQtm/zQZJnxC/xGDyD25Z78JclutwfTHDUw8XVDZABVBTvkiq5SC5PkYOkkJr4rhqHwUqrfG4zoQqojv+k4+7+hhNjfQVaXUSC5WstISOPEfGR3l/WNH9hVD/7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 22:24:00 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%4]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 22:24:00 +0000
Message-ID: <35ab4783-ab78-a245-7067-d7a3f35d0063@intel.com>
Date: Mon, 15 May 2023 15:23:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/i915/guc/slpc: Disable rps_boost debugfs
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230512235603.431386-1-vinay.belgaumkar@intel.com>
 <87fs81dpz6.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87fs81dpz6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::33) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 009e058b-6a44-4a99-13ae-08db559314e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: swSpqEnOy0+Yq1juZKsCpcWYx83Tqk18pZ/FmbsuDygLZE9CRdJJzOD+zR91q2iVbhPDKqfnzqb5qbk4FxoMLS8zH8+HB54C+S4OSbaux7pgMXMxDTKyYg7JHhSt4qZWi6ORRYAd7r/Mg/2GYae/jFqbVMkO+H5Do060I2FLHmrVqQs7MqeIL+P/zPFPFSt9D2CdwMcwsDt96RAuRb99xvC2JgCjphEdROnPaFkqkiv6bwY0ODCZSooubD8XcucTOIU2V7gXSoaoZzJwmR2shYp4YNLehw36uI8O10VzOfZnxO6aI9RCuL3V+lRAvtJCPqUkowY3PGz+Gym1hPG7TB7ImWTO6ldLxefUMbQJ1CAfZzhDSNQ5DRli3PFW5BPTQYsfIdEXXuRwnQ2XhxDSiAbUzXy/GsG5+gplQWokqE1t8V4xpBFYBKv1BLc+/Invs/aTvI2wCCs/pBagHLN4kYvsYhYDiD7nvuTg+OrvmCLAEHI9M1KG+GGqnFXUYx6LSIzUOVPvfHkZYES1RPrs66/hc2gEOp26E+8Lt1vCHkkx/P4Oo8sXE8wLFNQOotW55s91PgsMZzTnzl+fZZ9XLJ4rhxC/Y7mGy/JmOfy9AEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199021)(66556008)(37006003)(450100002)(478600001)(6636002)(4326008)(66476007)(66946007)(316002)(966005)(6486002)(8936002)(2906002)(6862004)(8676002)(41300700001)(5660300002)(26005)(82960400001)(31696002)(86362001)(38100700002)(2616005)(186003)(6512007)(53546011)(6506007)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkNnUUxLOWFLSm9aVFFNdzZVN2JMc1VKa0M2ajJyK0xwaXdJamt5VUdNdUY0?=
 =?utf-8?B?SFQ1dEVSR3NtdkUwcTdXdEpvbFlraVg0M09UTHI0MnFhRnZxZGlDSmorNTZj?=
 =?utf-8?B?ZUpUTDhDejg2Y3NWWTVWTTVyRE16dnZoWmZZRjBPbzViL2R1cnN3RzF4bVRy?=
 =?utf-8?B?SFhNUW1VYnFkazdFNmUrVEY2UndLaWFBZXBEUnd6c09pOGFobkZxYkFkanlu?=
 =?utf-8?B?ZnVCczNQK3lLRDNGNjhncmEyczNlWDJxTGRuTlV6U2V2TFQ5SkNPYlg1Vm5B?=
 =?utf-8?B?cDlOZndEdjY1am5JSHR2MVB3amZ0Uis1blJCZTM4UTJndko2UUMzODQ5d2tm?=
 =?utf-8?B?aU5Gbk1xdlk3aE45TlAzdDEzMXNBZklkRnpKL0JwRURvdWJEQVFWaXBZMkRh?=
 =?utf-8?B?MlJsWi9rbXhubzR4TkRqMmZndDZWcDIwa1l0eGdmLzZVS09ESHgxanR5UHI1?=
 =?utf-8?B?RjlkZWdvVGtJdlgvODJvbjBpMWwwckEraURBalBBalRyVTM1WCthL0hUSUpu?=
 =?utf-8?B?ZTZ1MnR3M3hJaDNEOGtmWXZueVlqWUx1TVBib2pBdXVqR0xhZ1JCdDJRVklF?=
 =?utf-8?B?QkNlVVU2OVZReW1ZeTZFYjlJL3o2VjJIT1BlQ09oNmRZTll5QXdaMFJ3ZFdZ?=
 =?utf-8?B?cERYVS8yN3BBaE9KemhhNmVWZHM0Vjg5RERRb3ExSWg3eFdUVlJ1dXYzdzJB?=
 =?utf-8?B?ZGhyNmpoYU0rQVhvaDUrSitzTXY5VXJXZkJXVzJ1a1VidjJRVVNQZk40c1dn?=
 =?utf-8?B?ZmQrV3N1OHBQNUFTQXNVMnIzWUNXY1FIalpJbGlkL3ZLc3Z6SUFyZWJkOWda?=
 =?utf-8?B?cFM2anhIU1ZWS1VpRnV5SWlwMERaV0VQc1Y3ekhaalhPL3lIai9RaVpJd2po?=
 =?utf-8?B?T043R1ludnd1RVpqYlA4ZUlyMkNWK2R4NGZ6dUxLcy82Tk5sZGFxSmtlYzRa?=
 =?utf-8?B?Z3Yzc08vNmRmandHbW1VU2dDcFJHYzNNQXRFYTZTTlVrTkVxL0J3ZEZqOXdE?=
 =?utf-8?B?eEhscTZQL0lWZmRBblhtRTdRV1RleCtHSnRobVVSUnRKZ01vQjNZZW9YU0Ez?=
 =?utf-8?B?RTlQNW9UY2h3UGdkd3RKWmlPaDlqWnRRUUJmS0t0NWN3bVJOK1Q3WkJQWVRw?=
 =?utf-8?B?czlRTFVlRzF3WjdFSXVBUWlCNk5qakRseXJtdzljTC9lRlR4azFHbW1md05j?=
 =?utf-8?B?VnBTZUhxSDFJcUx4dXRRelhtSGxtYjZQN2VSWXZaNnpVYTJXUVI5d2pPSXha?=
 =?utf-8?B?VVgrM0VpbGMxd3FWTFprUmNDay9QZEE1Z1laSUZVTGJIN1RtWFo4NGVuS1ll?=
 =?utf-8?B?NkQva3RxbXhNelhBSzFqbTNjNjRpRlVvZThPS2NDVkZOQWNxN0JXbnk1ME5o?=
 =?utf-8?B?U0tFTmFjM25wUnV0ZmY5RkQvNU9hNElTYitoSmdOcVpTdGs2c08vb0JWYjZS?=
 =?utf-8?B?b2hEdWQ5bFp1QTl4S1NPQUJTY3llcjBENDhpQlFQdWRQb3JuSkR4dXZDdnVs?=
 =?utf-8?B?Ym1QQWtlSlYzSVJBQzdWaDBDOWgvR2ZNT091UGZNWUs5dE00MG1rNGhYQktL?=
 =?utf-8?B?bVM1RE11cEk4QUY5eU9vUloySmkwc2ZCWFhuMTlxUS96UGpRREs5aGhPWmti?=
 =?utf-8?B?MWlwcHVYSFN4QW0ySTkyMXVzY0FzVURIOXJ5YVA2bFlKc1RzeEtyL1MrRzFL?=
 =?utf-8?B?Ty9yTzBob1NIMWd3azU5aDhqR1FmR2hDUVdkTnlTMlRjQ3VaS2NuV2FkVlVR?=
 =?utf-8?B?QlFmakVGazlNWU9mSk5NOWFldEdkbHNJTnNXZVZuc3U5THI2U0ovSmdvZ0dK?=
 =?utf-8?B?VW5wRFJqQ0EzTEV5TE53OVJOaXJJbllmbnl3N0M0SVA1dDhpc2FHVGNWY0x5?=
 =?utf-8?B?T2hmWFBDcXJnRDlBdS9tU0hBeTBhYWU0ekRGSGoxc05kaExObXZ6YStsNmx6?=
 =?utf-8?B?Y25Kd3VYUEpNYTRWTXVJSm1TTURycThKUjlxU1FXZU9ycjhnYkx5UzNzUmQx?=
 =?utf-8?B?bWpNckY3TnhmN2hqdG5uSEh0R29WV3VMaGdRbTlUdXMzbUpFejRRbW1wdzli?=
 =?utf-8?B?Tit6SER2ZFFYSUx3dnF2c3FMYUN5VUw4Y1RxM3BBbkQvYVJSYVFmYWlvQlN6?=
 =?utf-8?B?ekJaUnJjNFQrQ1pPTFZUTlJ6d2IrczdqbHlSUWRKSS9qd3lyWFl3THYzNzRG?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 009e058b-6a44-4a99-13ae-08db559314e1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 22:24:00.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTsTuj8LJ+40UDahEYP8IdlBmqHEJ3G0NlhiZ2uVWiiZzog3VfGDJZs7saf7wCh79DAQTXW1KKJ3RFTWgslRa2F4HfVRpucK5d1umCD+JBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
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


On 5/12/2023 5:39 PM, Dixit, Ashutosh wrote:
> On Fri, 12 May 2023 16:56:03 -0700, Vinay Belgaumkar wrote:
> Hi Vinay,
>
>> rps_boost debugfs shows host turbo related info. This is not valid
>> when SLPC is enabled.
> A couple of thoughts about this. It appears people are know only about
> rps_boost_info and don't know about guc_slpc_info? So:
>
> a. Instead of hiding the rps_boost_info file do we need to print there
>     saying "SLPC is enabled, go look at guc_slpc_info"?
rps_boost_info has an eval() function which disables the interface when 
RPS is OFF. This is indeed the case here, so shouldn't we just follow 
that instead of trying to link the two?
>
> b. Or, even just call guc_slpc_info_show from rps_boost_show (so the two
>     files will show the same SLPC information)?

slpc_info has a lot of other info like the SLPC state, not sure that 
matches up with the rps_boost_info name.

Thanks,

Vinay.

>
> Ashutosh
>
>
>> guc_slpc_info already shows the number of boosts.  Add num_waiters there
>> as well and disable rps_boost when SLPC is enabled.
>>
>> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7632
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
