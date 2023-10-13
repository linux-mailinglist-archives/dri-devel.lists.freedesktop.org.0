Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD06B7C8345
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 12:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3CA10E5D1;
	Fri, 13 Oct 2023 10:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78ED10E073;
 Fri, 13 Oct 2023 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697193525; x=1728729525;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jZFkoSJj87XG6zunzBx8xpJ5yZw7x/LM42lp7O2LKVw=;
 b=BD/SM3NtT7sGuRZ4NcSNzC160ReSp+WYSwW5BoT0KX2H1GWpfAlMtqZz
 ksx+5vBoYujN56YhwG5zoK1yLDrY1Ck/AXQWkYiwgWoNivqqRsI5QVFez
 VPg5Ufg1lxY1jTI6NpSYSgM6NhU0Jx3nl5JxW7tdMIj1NbNrpp90q0pHx
 OJcDJW0tvuq46ZjIjFdbIn86gWE7lZ6NNtwIrujjeCfX3fkvSKmyTDlmi
 o5GOoVPt9V0gluys1qhDFoTLm0dMEEojrGvxNiLOCARvmxWuyo/rHp3+Q
 kVDFQK7ET0a7L14Ti3jIDOVr3UhtL5GYq+0R/WHbJeDP4ZSW7sZpKEaUE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375502663"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="375502663"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 03:38:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731321952"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="731321952"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 03:38:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 03:38:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 03:38:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 03:38:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2SqlQB8eJG3r+5HRnwCNLvvGZOpp4cGok9q5eRakscjt3hcRgyGXm3J3AxgVsOH0EfNy+VlPIK8RAcrxT9vNfjkVNrERt38lImxSvOgqqe2LfLPwxxvGZVDz+QL7fa1m5CbMfgQ6n19q5Eo6aSWWeuSbSdVrv/RqwQg0A1dLdIonvluIbaYpMIOfGQxMiqnbKHxaQEwgTL6SSl2Oo+juILazSH3TPJcS3okfXk1WHAqMwvOXjuclRDaEtG0mXAQJ8Ycqcf+I/lWiPaS/NifTc8pauHIA5XzF9D3zH8V2agNESP3K3cIlXZgp5Bz//x0X7Ut+xezHTgZKDRDGlIG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0cVHhUs7n9fLX3NK6emuharY/1t2Q9PbO8PJGvtGyg=;
 b=clNU3IwypgkRS8r47nEN1paCDWqXQlSyaaSpu/7StZlKrYTFK1HxcdyCOrNx9AcccaAAbE0do5YQjfjs8R5A+mQ7kOv1tZsLCxS8wxrn54o97fUJW/Jxsc8NdmvKlByWYaIqwVeURruUVBUs+wMIGg8Xh4tLgEw9C/3/M9rI9a2bAdC/QLgnD67VM+b/9RRfamoMF96w16FrqzKEHKqr+Pw4SBN3nDl0SORbCoAuFTbNzbPMLk93EndRPe5B2FHWqySR8N/aw5KpO5AJdHbG3O8uoDn2+gCiSkMxN55aT7MnawD/He70k0+xueAFiveDlror4+RhWIg56j3cfEX2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by SA1PR11MB8593.namprd11.prod.outlook.com (2603:10b6:806:3ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 10:38:42 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%7]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 10:38:42 +0000
Message-ID: <e519e2c1-b740-58bc-9775-4c5662b1459f@intel.com>
Date: Fri, 13 Oct 2023 12:38:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Flush WC GGTT only on required platforms
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231013103140.12192-1-nirmoy.das@intel.com>
 <ZSkdXLTqGY0z/PCI@ashyti-mobl2.lan>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZSkdXLTqGY0z/PCI@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::17) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|SA1PR11MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d65d04b-c3b8-4529-b6dd-08dbcbd89128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQiKIhFe91Iq5OkFGkhSYi83jOZgO9X0B67Fj7J4NBHajJb/rGdsqDtDCL1wAgLx6jpypdG7feC+hUKZiBm1rgx4Nmf5lrc/l9dLqZcw8aZBmWMqEcwi9YHfmWbOKrz1OJFjFZbj/DwxCs04L1//WZ99GLiA7OVYVrdNSTKpomC+1OFVeGRpsJhhkGJj32rktV5idW398ZOdL7anX41SJpUyhqI6Z75eRcZO5bgyLC9Y5MEictp4+Km5nZTPdA8Z6WLeNv1MjQQGF4UtxLhu5PBcTWDl1EOppSul71ZAuse9EnL4RIUsROsfX4knIrpDFIu91wnHpFA0QRXiXfGaQPyGaqNmsxVLNex5OLF/Ki/FSTDXTwWnI6qazFQvopSOhbOTReWmctb4YJZkiWWQKgu0V0X2xnWEr3BuRwroJT+tTMX4n60WOhYNPwRMnWQzqxYDj/R87+SWqmM1s4mHY8E9z0shh+5IPBXsRywGpwNUD+Z03dJgUPJEV+MZ/MQ08rgMXLfarQtWEp0WXherLEzpYQ1NRbXcGTMLk4uOXSQhPyAgqA+LXcbovYZT6JJSeZ4vSrwRRHM8JsY6TQi2CCyZwdNMtYX6CDnCseEsQMRCA2AKo9Z9yepJlmkeRc50s0ygXzNbiwX6TxZHgKOZfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(6512007)(53546011)(478600001)(6506007)(6666004)(8936002)(6486002)(2906002)(83380400001)(26005)(44832011)(316002)(41300700001)(54906003)(66946007)(66476007)(5660300002)(66556008)(4326008)(8676002)(6916009)(82960400001)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHBGU3lhV2RJTkw5cFpXV3dyRHhyOVFVeUNmbzFwZ0g4VTU5cnhjMjJUVlIz?=
 =?utf-8?B?NGJYRmZwSWNpSm1WN1BEaUFKNVl0RGN1blk5S2k2OGNSNWxUOG9Nd3dkaW1o?=
 =?utf-8?B?TU5vUEhSbmdzdm9nd3hsVVBxU0ZJUEY4eW5aVUZxZm9iZWc3eWhXZGg4b0w2?=
 =?utf-8?B?bittNGVmN1V5OHlDTVJaeFFxcm5VS2dRQWova3hSQVlDQWw4U1V4Q3FndUdL?=
 =?utf-8?B?czBmTGM3SjROOUcyT24wWWpIeEk4TlRPV1V2MWJsLzVlMjhYUE9lSU9OVldI?=
 =?utf-8?B?bjJ5YlhpdjJVUit5QnUrVkthSmVGcGEvV3VtRmk0Y20yVDNnUDhtQkV0U2pI?=
 =?utf-8?B?cTMrc0FoRXpzZGxBdnlPdi9JNmY0NnRnSUFkV1UyajNNM3JVblFEK0lIaFJl?=
 =?utf-8?B?dG95ZEVGREpCRmRiZ3lNYWFIT0IvVzVwaExFQnl2Q2VvR2poN2owbWhGeVpj?=
 =?utf-8?B?ejRMeXp4Sjc5SWIyL0wrUE10bmltOWFjZmd5MmFzSDBjUHhxQzBCTE1jeXBY?=
 =?utf-8?B?bGRnVEoyRGR0S05TMmhnY0V6YlBNMFBXbmNJbXhrWDVZK0tPUEUrR0MwZ3dD?=
 =?utf-8?B?eGNpd2ZtaTZId1FhdnBhTFVkbUE3SEpYcXF3ZkQ5eWNvWWhqbXVKMStkTGR5?=
 =?utf-8?B?cThHV2lBVDdYd2dSQzlGYmRranZXZ3lkS01lRWd1a2RFMldCSXcrakNTdVps?=
 =?utf-8?B?TUpmeEp6QzJScXRndkZxNVRTNzRBdEF6cjA5WUM0M1VGUmE2QWpTTjdDYW5Y?=
 =?utf-8?B?SjlBbGcvQkpRM3N3Y2ZrYllob3F0TlBCbzEvOUwyUGcrTENRT2hoSGVOQkFl?=
 =?utf-8?B?bjZrTksrNjhQdXhsQ3hJRjVMTWpTZlhsNEttWXFGOVRNYXFzZGJiYVRVWlNL?=
 =?utf-8?B?eGZIYTR1VEd4emx4VjZrZzZtLzRpdjFxRmxvWDhVK1ROZDhjTmFmVVJuVGpB?=
 =?utf-8?B?YzhNZlc3VlE3YysxcCtjVmhKRDl3b3oyV3kxWmhoSzFIbm1Kd2twUU9BOWVB?=
 =?utf-8?B?OEZ5ZlZoTEk3TUZ1cFN5SXdVakprS0hQNlhoUmtwNDJMYzBqUVVjUUIyelNM?=
 =?utf-8?B?Zm1rL2lkendYS0M0bzh1N0hKN25ZZElQS1gyTTJYZ0FDZllab3JudWx0c1RG?=
 =?utf-8?B?Y3pzUGVBaGxoSkZ4akpZTGVUQ3htMm1RUW44RUdJakZSaXBnZzZvM0hUSVNi?=
 =?utf-8?B?OWJETXNvRTB3aHJaTzVoRkNHSWI3Zk5oMGVGbm5TcEg2SVBkM0d1UnNaV3pD?=
 =?utf-8?B?bjV6SExlQlZxSFcxQ1VydUpjbjdBeVpRWmJocVgvNUJIc1pCMHI0UnJvZnhI?=
 =?utf-8?B?TmZibi9razFNSHhpQXVFRkdPQW52SXVPem93blo5bEVuWVR2d2lYOU94ancw?=
 =?utf-8?B?TlNSUkdaRmdMVW9malBDVmNPOFJnRzUrOXZSSE12UXlPeTNtbE1BWmpYRS95?=
 =?utf-8?B?aGxVWjFYbnJkZHh3UzBYd1pyYzMrcnJURTJiQVI2eXh3SUJaNkJkdzkwdjdl?=
 =?utf-8?B?cm1SbDZuQ3JncGtMSW9QcGJGeGZlcEkwZkRsbmVYUUlWSTJiQWxCSHFIcDFz?=
 =?utf-8?B?VlZINFQwWTRuZjVvQ1JDMldjWlFSN20xdEY2SE5sWDFKL2RNdDVTcS95cHkv?=
 =?utf-8?B?OTJwKytySW11Z2tMN3NSZVFvQUhTNmt4Wkc5S0J4QkZFM0VpdTRwcmRHWGNK?=
 =?utf-8?B?SGgyUEl2U2tWdE9wTkRlSzlkc29wR0JIeTN1TzNaZmE0T0gyeUExblU3cjVM?=
 =?utf-8?B?cW1qYUlFb21FQTlFcjBVSXlrZmZmdE1oakk1eUkvcmE4cmg1cUNOcVBZMENV?=
 =?utf-8?B?UFAzd1N5Yy9iNkdURGdQa1NyT0pvdmdTM0RxNHZvYmN3Z1lqMjd2RnE3UU90?=
 =?utf-8?B?b0JvUWNIbCtWOWxjd3N3dWZqNGdUTTdwQU5jbTNFbUJsNW8xSndwVTAxV2gz?=
 =?utf-8?B?dmd2aGJvakg4NXQ5Y2hTUHRQN05GMkZORzhlSmJacUtjZTNXYjY5YjZrSnM0?=
 =?utf-8?B?RE1iQVU2T1l1S2VJN3g5V2FTRmxSUVhnM1hOOWx5ZzdVY3ZHUmczeEY3MFdB?=
 =?utf-8?B?MXNVV3UrTmMxOHpiNWFtcjd4RUMwMGdBZkt1dldwejN2aEIzU1g2Q1Frdk93?=
 =?utf-8?Q?u5SuDOE3nuLJ+p6/tGaSfPomX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d65d04b-c3b8-4529-b6dd-08dbcbd89128
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 10:38:41.4013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+kjPySXx+U0ECV+xQgdbsk8drYxY+QsNl4CWD1M4MsxfdhNRYlttrfQs6g9XuYlc8m/p9+itEDuVOE0hgGimQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8593
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/13/2023 12:35 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Fri, Oct 13, 2023 at 12:31:40PM +0200, Nirmoy Das wrote:
>> gen8_ggtt_invalidate() is only needed for limitted set of platforms
> /limitted/limited/

Added " autocmd FileType gitcommit setlocal spell" to my vim config. 
Wish I knew about it

before.


>
>> where GGTT is mapped as WC otherwise this can cause unwanted
>> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
>> valid.
>>
>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: <stable@vger.kernel.org> # v6.2+
>> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Acked-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,

Nirmoy

>
> Andi
