Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE47660BC5A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 23:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826610E0A1;
	Mon, 24 Oct 2022 21:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06A610E08B;
 Mon, 24 Oct 2022 21:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666647578; x=1698183578;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VRzcjH5TNCSqeNRwQvlbWnY5yAdZcOK3PJBfZwxupR4=;
 b=MCOZrGnFIZaQfWLVCGBhqili9NRHl7mns3Ql/ivBFV9Kv1936dVCekli
 smzP39DeBdHltfy6RS+NSGziUngpV37+3+UGQn67SsWqVyNWf1GcieHiu
 DrXLYNry8na/iso/9M1cbT15OS9f0L5kLxL1vJvjWvomfOQqZxzmjxTQu
 z0+vlriTAg+D2BGRIPxF64E9z6gYPHoGVQ6mt4TBNTu2b/EM2MkXm1k8z
 o8+hs3QJ5tXe4N17lFWsaKxH7hP3SHdJd2b7SST/cZDsoprLz+jJU68pc
 zqYFMvtYdfFhp/iR7lEKcUW9lhDo75k6w4AfLTRlTeI+p/bhFrOJyuOTg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287925976"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="287925976"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 14:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="694706127"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="694706127"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 24 Oct 2022 14:39:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 14:39:37 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 14:39:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 14:39:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 14:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPU6r2R2myLumOe2bAAq/YHzKu88YwzZk+Res2Rbw/VRzj1XuGidkg+4Z/leVr5rU7q39NwrKZZ5lVOaV/3QJNJeeHbtKddOkBpb1mP06hdp5RZUkemz1dk7XSSJbs8INEvl74sWu0qR/R0cx94szT9BBoQdVgXrA80l3XzRoU451V7WSttfbygSWKTZTFZCNvu0v16ux2WDDBWo86xvCTphxWP++HLC7si9anXgcuXacbEjWb7htyz5Ehoeti1KM0mrGUKvPwuzjMtExz8IkioJBv26eY/GoPcSHLgciRXxuZih5QrUjLKlBUfP39q/4mCCtrCeEDEAmk1vaHV85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRzMGH3Z8IPgINT+okdOS3hxCWtk1zJwybthLe7Anao=;
 b=EXV2Kdxf3cuAfnV591LfWHFM0QRSaRQCGBij03I+spvRW0v/E5uev8U/4pUkq18SSMSIfyNsCDf+ZgxJsG8TyRajVhOMx+n2KXgasTly62+WfLAZSzZhNbx0T0xCi7rC8P/SDVKtmHilzAbgKLqZtSD3bOQFqP8KZoLlLFCbxOJMBtaciNOkXBrqwwrwaWF14TKh545PbQbrQInN+hHNmzfjtuM6F/8kpU0G/NojqUq7qKR1PrrDverekinyZPfsFeongooODRf+iG7sNi8P5t84LUNWGublOfdlcXXDBUFvN5e266v6umIn4VxiUwkHOJGMkeqiPiDpAvFbRtLwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 21:39:35 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%4]) with mapi id 15.20.5723.033; Mon, 24 Oct 2022
 21:39:35 +0000
Message-ID: <279ca89a-e00c-5d11-cf92-08873121d04a@intel.com>
Date: Mon, 24 Oct 2022 14:39:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 5/7] drm/i915/mtl: Handle wopcm per-GT and limit
 calculations.
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
 <20221022001008.2340224-6-daniele.ceraolospurio@intel.com>
 <e444179e-c722-2a06-4fa9-3122dbd39966@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <e444179e-c722-2a06-4fa9-3122dbd39966@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA1PR11MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: bc166181-0dd4-4b11-a0d0-08dab6083e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAqXbhji3+Zefx76JxtczYDI4eJZp+aTbRyeJs8lRrGmsmDG1/PCgyp0JH38TwV7zWPluvfHhWhIyTqybZLjTMKGzkAS6jbVFgL7UUwQpxG6uMFGvPKYi9VbIQ9z9qa1JtNuToxxxKPeyk9+st4r9wxZWywl2aLEx/7aT0SSbaUJLYNbMsL0ycDL/eRWFwV7ugXRPqDlGWfbzHdU6VKVN91J0ZCp/nd8hKmeUHhalKE9gVuh9pvJ3voeO8YozEjL8XfIowocFpxhn03EA5Fqrwe3b+EizKUYtfd63Hj62yJrxl1A/X6xn2P5WioPX4ViYHwsy/D7g+LOnztts/IWSAZXPFXSG5vsOwrO9dTKfin355UUZm1A6nd0HnJ8T/81X+NpXci95o3U2VXW7i74d5X6ku/G8JgSKAJweEO5bvubzVb1bmyvONE51GyrHPPcNTBGM1ZbTgkLZCvQFpS6J/7pnSATeQprZIkuLI1SBPiRhUJkPlDfVdCkNpKPyT8HiBZdQ6WezV+bw+AUOecN8hM7xniTgIHeJ/pNx4hAVGeIkr3EL8nmBo/EtFUS2OOyj+f7U4wo7SdKscfHCQDDL28/FiqkXIzm3+z3iLszNn70JXhLidgMqHo9I14OAHYwg9fU9FGqNE6KOwIX7aN8myroAiIY2jGJfvudCxb4DBlwYwByz0Que4BXljgb16N/99JhsV03pyk4aIz/ZZHf5KVZVUUgwrzYj5r/Kgjlcloyb5zLaJkg0i1ztvPW1oQ4g7gHi9A9uJ3HBgJZ41YeYJxc5XzieH6p6bk/7kkuCFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(6486002)(82960400001)(31686004)(5660300002)(478600001)(8936002)(38100700002)(4326008)(316002)(54906003)(6506007)(66476007)(8676002)(66946007)(66556008)(53546011)(41300700001)(2906002)(186003)(83380400001)(66899015)(6512007)(26005)(36756003)(86362001)(30864003)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVNOTWx5VUVCTHhBL0k4VmN6ejFqMHo3VGpPRGRpQVFIaHBlWTh0Y2ZNYUho?=
 =?utf-8?B?REdjTnd3TVF6M3VUbW9XdGxvdW1uaDNaOWlFaVVkQ1J3dDdocXh6N1Q0ODZQ?=
 =?utf-8?B?UDRWdGtMbFllYzMzVEhURU16cXg0am1uZ3JwR1RGK0cwbVVZcEhIeEZCaGNV?=
 =?utf-8?B?Zks1Wk9OK1NWRTZjK2FxS0ZFbWNOY1ZyenVoZkJhUkNrZk91Z0JyWlRJTEFj?=
 =?utf-8?B?c0pCQ2NtUkZqcDJYbkk2SmtMckNmMlloblhiTjZhb015c3pLcFFKTGViYTZE?=
 =?utf-8?B?VnZoUm5OeHRFbFlTNVpaR09jNEdLazlvUEdqOTBlNlVXVG92Rk52VG5KUEIy?=
 =?utf-8?B?TDBGM0xOWGRqN1B0eFdZQTZOK0JlbDZDOEc3SzJaUWZvVTJQVU1RMWt4VmlU?=
 =?utf-8?B?UkhYazFmVUFWcmF1R1o0YW9BUWFkWnZvNXNuY3FnenFaZlg3TS9uWWdrOG1p?=
 =?utf-8?B?RjVqWThzUlNzVjgyVVZzSWtXZjRwdHN5L3dxTE1YbGR3MExBVE5jcTZOVHdr?=
 =?utf-8?B?dk9RN00yY3hVeE9zM2tSN2g0dGdIRTNjOERJYjdQdkgwOTFtNkREKzlERFdr?=
 =?utf-8?B?L20xL0tWZHZjV1pKcm9JOEliaFlWRVpNYjB4L0FnL21FZVBWZDNpcmN3dzMr?=
 =?utf-8?B?SkZZZ3JlNTJNOVRJdW9zUkY3TVdOTGs0SUNMMTZQWVhPRHg2M0tmaEpMNFpZ?=
 =?utf-8?B?T3dvbDFuTXJyV0FnbWd0TXlRVEpqazNDSzdETHJTUjE3Si9qa3lRckRNQ0sw?=
 =?utf-8?B?WXkzNHdNL1ZidGVXdEJoeFlGaUFicUFLOHloWDB6OGMzMlNyL0tiK0UraCts?=
 =?utf-8?B?N1Qvd3ZybDNWQ0FLWUtEdkFqWFJoZ09xeXJxU0tkNm5qelN3Vmpic3FBNXFK?=
 =?utf-8?B?WC9HQitQWlZJTGZjOVJuWndoUEVKRjNLcStQSDJrbmRkNldHSGZjblBmMkJp?=
 =?utf-8?B?MmVydTNGRG5BSm9iNmpXQ092NEp4TysweDNZdk5nSXU3MzBQVHkrRmNiaDd5?=
 =?utf-8?B?UnMvQTYzUWoxeVZyYXR6RnU2TEMyNWFMWmozeDFjZ3NwanpDQnU2U2dMRmZR?=
 =?utf-8?B?MnVJVnEvc0h6NDRxaFNka1N0cHc1OXV0U3M3Z1o0dy9iVFowUHFoYTRmMWJG?=
 =?utf-8?B?OGJQT3Z5ZWFUUTIzZGh6enVOQnlISXMyRm93emEvQ01uU25YUnpXRVZzL3Bv?=
 =?utf-8?B?L3d0SHd0QXlnMXJzY1FwTDBvVXRFNUNIczdnY2pidnc5UGFwOEh4ZkFrdEhN?=
 =?utf-8?B?SDJ3Z0JQbURCZGlzZjdWNG1qY3E1ZENseTZkREJ1SmhzckhLYXgzV2NFeXRH?=
 =?utf-8?B?SXA1KzhsVU5PQ1Z4UU1sQ2xmczd3ZXFrU09kYStrR2ExM0svRXYxckFyYzlp?=
 =?utf-8?B?VzR0Zk1EUVlJOVR6aXZKUUV4SlJ5bTBRQ1FjU1dxclFDMEtTY0NJblFFTjQv?=
 =?utf-8?B?MlZJK2NKRzZ1Tm0zKytJdm8yK01ENEhlV29RWmF5U0dJZ1JDQnJpbmwrc3l4?=
 =?utf-8?B?U2t6Q3hESUZwdlFUZTZoZXBTTmFWLytoc3VFZ3NaLzNEd0tCd3JmNzBVV3Ja?=
 =?utf-8?B?cWp3NUZnbXVmM0gzNjgyRG1NY1ZuOEpWaWhwOW5Jays4amVseVFoc0VIMHNn?=
 =?utf-8?B?empBWTRzaTVIREJESngyZWM3akxvQUZDZ043WWoxWXlZZHVyMXpZekRpUTVT?=
 =?utf-8?B?a2NNc0E3OGhQVHA2U3BzSlNZR3pNN0hrQUcySjlEK3ZMbEMvdlZBUGZLY0Rt?=
 =?utf-8?B?Vm1Gczg1YlZ5cEx5M0lybWJFMndhaDhvTWJZYnRNaktCektHQnZmUzBJYmht?=
 =?utf-8?B?U01tbHR5SVlVTWJNeTNZaFdoaHZDTWFuTnp0Q1NTNTMyK01ycE5vRythOS9k?=
 =?utf-8?B?MWVPUjFmWDJZU0g0WmdLVGU4RVlFS09malhtSVhFVmg3NzJoYWFJbVEwZmYy?=
 =?utf-8?B?OHhTVU16UEJrdXpVZTE2aDBhanllTmJYSTY3a3VmdE1IazBrSTVIZ0VQb0M1?=
 =?utf-8?B?Z2preXB2M0hKK2VRTFE0TjlMMHEyWkt1dHZiVmhMYmpKc2srcmw1Q0s0QWhk?=
 =?utf-8?B?ek9wbkhNUnBsM2V2L0J2cHFpc0xDUkprUmxlL3BBTHorSjBYZ1RXNDNPdWow?=
 =?utf-8?B?UlNNeWZVOE5iR3ZVdnlqOURMZEFZZjBFZzBjYkR0a3ZiWlpNMkxVMnI0bFUv?=
 =?utf-8?Q?QbB9LpcqJtXsfcFQm7lZgys=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc166181-0dd4-4b11-a0d0-08dab6083e68
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 21:39:35.0490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29vvYo7tZ+dE5eV301YKQW3T96jHEIUPe/x5V5u2ZJItzenNFonDsbn/NQA5gKvrCw8j0wOcy4UIKYVCtKFMBl7DWbSun4L1ALW6TIgLS/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Alan
 Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/24/2022 2:33 PM, John Harrison wrote:
> On 10/21/2022 17:10, Daniele Ceraolo Spurio wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>
>> With MTL standalone media architecture the wopcm layout has changed with
>> separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The size
>> of WOPCM is 4MB with lower 2MB for SA Media and upper 2MB for GCD/GT.
> Given that GCD is not a term used anywhere in the driver, I think it 
> either needs to be either explained or dropped. Plus, Graphics 
> Companion Die seems a confusing name for the root GT. Surely the media 
> GT is the companion? Especially as the code seems to be written such 
> that the 'companion' is required but the media is optional.
>
> While on the subject, the explanation of SA should be more explicit. 
> E.g. "With MTL Stand Alone Media architecture, the wopcm...".

would this work:

With MTL standalone media architecture the wopcm layout has changed, with
separate partitioning in WOPCM for the root GT GuC and the media GT GuC.
The size of WOPCM is 4MB with the lower 2MB reserved for the media GT and
the upper 2MB for the root GT.

>
>>
>>      +=====+===> +====================+ <== WOPCM TOP
>>      ^     ^     |                    |
>>      |     |     |                    |
>>      |    GCD    |   GCD RC6 Image    |
>>      |    GuC    |    Power Context   |
>>      |    WOPCM  |                    |
>>      |    Size   +--------------------+
>>      |     |     |   GCD GuC Image    |
>>      |     |     |                    |
>>      |     v     |                    |
>>      |     +===> +====================+ <== SA Media GuC WOPCM Top
>>      |     ^     |                    |
>>      |   SA Media|                    |
>>      |    GuC    | SA Media RC6 Image |
>>      |   WOPCM   |    Power Context   |
>>      |    Size   |                    |
>>    WOPCM   |     +--------------------+
>>      |     |     |                    |
>>      |     |     | SA Media GuC Image |
>>      |     v     |                    |
>>      |     +===> +====================+ <== GuC WOPCM base
>>      |           |     WOPCM RSVD     |
>>      |           +------------------- + <== HuC Firmware Top
>>      v           |      HuC FW        |
>>      +=========> +====================+ <== WOPCM Base
>>
>> Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
>> by the bios. Therefore, we can skip all the math for the partitioning
>> and just limit ourselves to sanity checking the values.
>>
>> v2: fix makefile file ordering (Jani)
>> v3: drop XELPM_SAMEDIA_WOPCM_SIZE, check huc instead of VDBOX (John)
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> ---
>>   Documentation/gpu/i915.rst                  |  2 +-
>>   drivers/gpu/drm/i915/Makefile               |  5 ++-
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 44 +++++++++++++++------
>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 ++++---
>>   drivers/gpu/drm/i915/i915_driver.c          |  2 -
>>   drivers/gpu/drm/i915/i915_drv.h             |  3 --
>>   drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
>>   12 files changed, 52 insertions(+), 32 deletions(-)
>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (87%)
>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
>>
>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>> index 4e59db1cfb00..60ea21734902 100644
>> --- a/Documentation/gpu/i915.rst
>> +++ b/Documentation/gpu/i915.rst
>> @@ -494,7 +494,7 @@ WOPCM
>>   WOPCM Layout
>>   ~~~~~~~~~~~~
>>   -.. kernel-doc:: drivers/gpu/drm/i915/intel_wopcm.c
>> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_wopcm.c
>>      :doc: WOPCM Layout
>>     GuC
>> diff --git a/drivers/gpu/drm/i915/Makefile 
>> b/drivers/gpu/drm/i915/Makefile
>> index 2535593ab379..cf3a96b3cd58 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -127,9 +127,11 @@ gt-y += \
>>       gt/intel_sseu.o \
>>       gt/intel_sseu_debugfs.o \
>>       gt/intel_timeline.o \
>> +    gt/intel_wopcm.o \
>>       gt/intel_workarounds.o \
>>       gt/shmem_utils.o \
>>       gt/sysfs_engines.o
>> +
>>   # x86 intel-gtt module support
>>   gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
>>   # autogenerated null render state
>> @@ -183,8 +185,7 @@ i915-y += \
>>         i915_trace_points.o \
>>         i915_ttm_buddy_manager.o \
>>         i915_vma.o \
>> -      i915_vma_resource.o \
>> -      intel_wopcm.o
>> +      i915_vma_resource.o
>>     # general-purpose microcontroller (GuC) support
>>   i915-y += gt/uc/intel_uc.o \
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c 
>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 6b58c95ad6a0..9263f10ecd28 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>>        * why.
>>        */
>>       ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
>> - intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
>> + intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
>>         ret = intel_vgt_balloon(ggtt);
>>       if (ret)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 27dbb9e4bd6c..8c751314df3d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>>       seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>>       intel_gt_pm_init_early(gt);
>>   +    intel_wopcm_init_early(&gt->wopcm);
>>       intel_uc_init_early(&gt->uc);
>>       intel_rps_init_early(&gt->rps);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index 64aa2ba624fc..2d18fd9ab11f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -30,6 +30,7 @@
>>   #include "intel_migrate_types.h"
>>   #include "intel_wakeref.h"
>>   #include "pxp/intel_pxp_types.h"
>> +#include "intel_wopcm.h"
>>     struct drm_i915_private;
>>   struct i915_ggtt;
>> @@ -100,6 +101,7 @@ struct intel_gt {
>>         struct intel_uc uc;
>>       struct intel_gsc gsc;
>> +    struct intel_wopcm wopcm;
>>         struct {
>>           /* Serialize global tlb invalidations */
>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c 
>> b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>> similarity index 87%
>> rename from drivers/gpu/drm/i915/intel_wopcm.c
>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
>> index 322fb9eeb880..c91f234adc55 100644
>> --- a/drivers/gpu/drm/i915/intel_wopcm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>> @@ -64,9 +64,9 @@
>>   #define GEN9_GUC_FW_RESERVED    SZ_128K
>>   #define GEN9_GUC_WOPCM_OFFSET    (GUC_WOPCM_RESERVED + 
>> GEN9_GUC_FW_RESERVED)
>>   -static inline struct drm_i915_private *wopcm_to_i915(struct 
>> intel_wopcm *wopcm)
>> +static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
>>   {
>> -    return container_of(wopcm, struct drm_i915_private, wopcm);
>> +    return container_of(wopcm, struct intel_gt, wopcm);
>>   }
>>     /**
>> @@ -77,7 +77,8 @@ static inline struct drm_i915_private 
>> *wopcm_to_i915(struct intel_wopcm *wopcm)
>>    */
>>   void intel_wopcm_init_early(struct intel_wopcm *wopcm)
>>   {
>> -    struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>> +    struct intel_gt *gt = wopcm_to_gt(wopcm);
>> +    struct drm_i915_private *i915 = gt->i915;
>>         if (!HAS_GT_UC(i915))
>>           return;
>> @@ -157,14 +158,16 @@ static bool check_hw_restrictions(struct 
>> drm_i915_private *i915,
>>       return true;
>>   }
>>   -static bool __check_layout(struct drm_i915_private *i915, u32 
>> wopcm_size,
>> +static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
>>                  u32 guc_wopcm_base, u32 guc_wopcm_size,
>>                  u32 guc_fw_size, u32 huc_fw_size)
>>   {
>> +    struct drm_i915_private *i915 = gt->i915;
> This is no longer required now that the MEDIA_VER check is gone?

This is still needed because i915 is still used (e.g. in the line 
below). It was passed as a parameter before, but now that we pass in 
intel_gt we need to define it locally.

>>       const u32 ctx_rsvd = context_reserved_size(i915);
>>       u32 size;
>>         size = wopcm_size - ctx_rsvd;
>> +
> Likewise, is this blank line still intended?

No, I'll drop it.

Daniele

>
> John.
>
>>       if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, 
>> size))) {
>>           drm_err(&i915->drm,
>>               "WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
>> @@ -181,12 +184,14 @@ static bool __check_layout(struct 
>> drm_i915_private *i915, u32 wopcm_size,
>>           return false;
>>       }
>>   -    size = huc_fw_size + WOPCM_RESERVED_SIZE;
>> -    if (unlikely(guc_wopcm_base < size)) {
>> -        drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
>> -            intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>> -            guc_wopcm_base / SZ_1K, size / SZ_1K);
>> -        return false;
>> +    if (intel_uc_supports_huc(&gt->uc)) {
>> +        size = huc_fw_size + WOPCM_RESERVED_SIZE;
>> +        if (unlikely(guc_wopcm_base < size)) {
>> +            drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
>> +                intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>> +                guc_wopcm_base / SZ_1K, size / SZ_1K);
>> +            return false;
>> +        }
>>       }
>>         return check_hw_restrictions(i915, guc_wopcm_base, 
>> guc_wopcm_size,
>> @@ -228,8 +233,8 @@ static bool __wopcm_regs_writable(struct 
>> intel_uncore *uncore)
>>    */
>>   void intel_wopcm_init(struct intel_wopcm *wopcm)
>>   {
>> -    struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>> -    struct intel_gt *gt = to_gt(i915);
>> +    struct intel_gt *gt = wopcm_to_gt(wopcm);
>> +    struct drm_i915_private *i915 = gt->i915;
>>       u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
>>       u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
>>       u32 ctx_rsvd = context_reserved_size(i915);
>> @@ -274,6 +279,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>           goto check;
>>       }
>>   +    /*
>> +     * On platforms with a media GT, the WOPCM is partitioned 
>> between the
>> +     * two GTs, so we would have to take that into account when 
>> doing the
>> +     * math below. There is also a new section reserved for the GSC 
>> context
>> +     * that would have to be factored in. However, all platforms with a
>> +     * media GT also have GuC depriv enabled, so the WOPCM regs are
>> +     * pre-locked and therefore we don't have to do the math ourselves.
>> +     */
>> +    if (unlikely(i915->media_gt)) {
>> +        drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
>> +        return;
>> +    }
>> +
>>       /*
>>        * Aligned value of guc_wopcm_base will determine available 
>> WOPCM space
>>        * for HuC firmware and mandatory reserved area.
>> @@ -295,7 +313,7 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>           guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>>     check:
>> -    if (__check_layout(i915, wopcm_size, guc_wopcm_base, 
>> guc_wopcm_size,
>> +    if (__check_layout(gt, wopcm_size, guc_wopcm_base, guc_wopcm_size,
>>                  guc_fw_size, huc_fw_size)) {
>>           wopcm->guc.base = guc_wopcm_base;
>>           wopcm->guc.size = guc_wopcm_size;
>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.h 
>> b/drivers/gpu/drm/i915/gt/intel_wopcm.h
>> similarity index 100%
>> rename from drivers/gpu/drm/i915/intel_wopcm.h
>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index dbd048b77e19..4cd8a787f9e5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
>>   {
>>       struct intel_gt *gt = uc_to_gt(uc);
>>       struct intel_uncore *uncore = gt->uncore;
>> -    u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
>> -    u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
>> +    u32 base = intel_wopcm_guc_base(&gt->wopcm);
>> +    u32 size = intel_wopcm_guc_size(&gt->wopcm);
>>       u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC : 0;
>>       u32 mask;
>>       int err;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 81e06d71c1a8..0c80ba51a4bd 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -478,10 +478,11 @@ static int check_gsc_manifest(const struct 
>> firmware *fw,
>>       return 0;
>>   }
>>   -static int check_ccs_header(struct drm_i915_private *i915,
>> +static int check_ccs_header(struct intel_gt *gt,
>>                   const struct firmware *fw,
>>                   struct intel_uc_fw *uc_fw)
>>   {
>> +    struct drm_i915_private *i915 = gt->i915;
>>       struct uc_css_header *css;
>>       size_t size;
>>   @@ -523,10 +524,10 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>         /* Sanity check whether this fw is not larger than whole 
>> WOPCM memory */
>>       size = __intel_uc_fw_get_upload_size(uc_fw);
>> -    if (unlikely(size >= i915->wopcm.size)) {
>> +    if (unlikely(size >= gt->wopcm.size)) {
>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > 
>> %zu\n",
>>                intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -             size, (size_t)i915->wopcm.size);
>> +             size, (size_t)gt->wopcm.size);
>>           return -E2BIG;
>>       }
>>   @@ -554,7 +555,8 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>    */
>>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>   {
>> -    struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
>> +    struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>> +    struct drm_i915_private *i915 = gt->i915;
>>       struct intel_uc_fw_file file_ideal;
>>       struct device *dev = i915->drm.dev;
>>       struct drm_i915_gem_object *obj;
>> @@ -562,7 +564,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       bool old_ver = false;
>>       int err;
>>   -    GEM_BUG_ON(!i915->wopcm.size);
>> +    GEM_BUG_ON(!gt->wopcm.size);
>>       GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
>>         err = i915_inject_probe_error(i915, -ENXIO);
>> @@ -615,7 +617,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       if (uc_fw->loaded_via_gsc)
>>           err = check_gsc_manifest(fw, uc_fw);
>>       else
>> -        err = check_ccs_header(i915, fw, uc_fw);
>> +        err = check_ccs_header(gt, fw, uc_fw);
>>       if (err)
>>           goto fail;
>>   diff --git a/drivers/gpu/drm/i915/i915_driver.c 
>> b/drivers/gpu/drm/i915/i915_driver.c
>> index ffff49868dc5..ba4b71aedc40 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -371,8 +371,6 @@ static int i915_driver_early_probe(struct 
>> drm_i915_private *dev_priv)
>>       if (ret)
>>           goto err_ttm;
>>   -    intel_wopcm_init_early(&dev_priv->wopcm);
>> -
>>       ret = intel_root_gt_init_early(dev_priv);
>>       if (ret < 0)
>>           goto err_rootgt;
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>> b/drivers/gpu/drm/i915/i915_drv.h
>> index 9453fdd4205f..66aa2cd9aefe 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -62,7 +62,6 @@
>>   #include "intel_runtime_pm.h"
>>   #include "intel_step.h"
>>   #include "intel_uncore.h"
>> -#include "intel_wopcm.h"
>>     struct drm_i915_clock_gating_funcs;
>>   struct drm_i915_gem_object;
>> @@ -235,8 +234,6 @@ struct drm_i915_private {
>>         struct intel_gvt *gvt;
>>   -    struct intel_wopcm wopcm;
>> -
>>       struct pci_dev *bridge_dev;
>>         struct rb_root uabi_engines;
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c 
>> b/drivers/gpu/drm/i915/i915_gem.c
>> index 9093d2be9e1c..7a9ce81600a0 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private 
>> *dev_priv)
>>       if (ret)
>>           return ret;
>>   -    for_each_gt(gt, dev_priv, i)
>> +    for_each_gt(gt, dev_priv, i) {
>>           intel_uc_fetch_firmwares(&gt->uc);
>> -    intel_wopcm_init(&dev_priv->wopcm);
>> +        intel_wopcm_init(&gt->wopcm);
>> +    }
>>         ret = i915_init_ggtt(dev_priv);
>>       if (ret) {
>

