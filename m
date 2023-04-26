Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CBF6EF9D5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962BE10E310;
	Wed, 26 Apr 2023 18:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736D410E2FE;
 Wed, 26 Apr 2023 18:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682532610; x=1714068610;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FFUwCKOE9t7CMPlH7qz5pArFaVKUySEPHBY1KWZu9SU=;
 b=AlV25nQKvqGV6p+7HpHzluK2zUIfYS6qdzboqLQyEuOExL15wniNsR7K
 J4lx7FKk5jwXkTXITh/LbIvYmlqCH3pNWsfFhXsD9qyY9N1TxFs4Dhbx8
 mgNO4zCoAiwPKjcz05PQ04AnkrGXBqihEvbZ3f+/jOsINdMVuAIR1XDTz
 5/1Z2BrXbWA17NNcbQnZ816BYeoKYHh2y48gJpyByyhXUyLNSVswuMgun
 R5pMxg4XDOVCHB6IycFI1RF+KAuKc6cd2pL1YUYtaHH6YnpSerlC6sRnX
 moDU/EjbY7kyq0Iz62zvzn9RVjW3nkJu8bfDOqOcXnisPChmdvR0PWyx4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="345952401"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="345952401"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 11:10:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="694049288"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="694049288"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 26 Apr 2023 11:10:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 11:10:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 11:10:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 11:10:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 11:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J58nnkfoLyyxiTyJTzu+VhQSMkEOwHdmvX63dtTm7VMDmdFCUntLy2nsik73o9ToBirbRti5AuxWIfWmTOvt1P4Gs2lJZwZJ2m0gFBs40MgZNA2xCtjYe5lHjuOpWkAbJ6iurdDbdYXI9cSp9jF15wx9ILzk/Tp3E+bgNvK8291l1/5auj/TyKm9sLQB2I3Cc6hcupOYG7POtiEUknTfaIUyn+oRVWUdJg7pqGaTc7QvQlYMyCd/5NmfS0pwp6+f7bmFUrVSb2jslofAQhXz30dLQ58sB9dM5DV9pDUkeSBwjPZ3M5dXb6y0jWrfBYXf4tqW5wr1ZR06AtNBDusvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGCZV9SF0ty2WaeAvpA2xyMAec2jJoOqmqNbWM/UTFo=;
 b=fy202usZfIf8fP9+CufJxK+b5UGEbvM7FVnIC1fEUbzyilSxfhQ8RWtG199oP7oCFjQ8yfVDIsYdNsBoudSi+Ylf1zIqCN645hkhUl0VTww0KdG50EAgXbHX3PPP3sdNF4zvNyjAPp8JE6+fWedacFZ91iI87KUiqmRIOpL8WIrGEwjt1HE4Tx/NCJh1sKo+iX6eCJfhetV998XSr0lFdXTCCSC/8iRx2BjvGe0oWyHEms2/S+maxrL0OrLaFnzzdmDUHG8wpNnrebE5CcjgDK0v4ojQWf2+ooJtv/MDW5mNXk7Rd/XPXUdYoktsFyj5jWN4kb/EcLxu0/1/i279lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH3PR11MB7913.namprd11.prod.outlook.com (2603:10b6:610:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 18:10:04 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 18:10:04 +0000
Message-ID: <d6eb91b3-9a3e-40ea-a7f9-23c4591c860d@intel.com>
Date: Wed, 26 Apr 2023 11:10:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: IOCTL feature detection (Was: Re: [Intel-gfx] [PATCH 8/8]
 drm/i915: Allow user to set cache at BO creation)
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>
References: <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168211012988.392286.16107510619704913123@jljusten-skl>
 <BYAPR11MB2567F03AD43D7E2DE2628D5D9A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168232538771.392286.3227368099155268955@jljusten-skl>
 <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
 <168235638024.392286.14697291321034695564@jljusten-skl>
 <168243011485.13318.1376529380245430200@jlahtine-mobl.ger.corp.intel.com>
 <ZEkQi6Zrb6lR4DEm@phenom.ffwll.local>
 <a05b4a926fc84158476c59a7c7d39651d0ff1d9d.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <a05b4a926fc84158476c59a7c7d39651d0ff1d9d.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0054.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::31) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CH3PR11MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: be8b3702-7129-4572-3d81-08db4681753f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MYci/B6wwAjfdfJ5xgIAf58CLQlT03fGHD0D8yuxfF0b1NdV8Cm9COMVtRMebjsx8KvUhiqLOr/3gieGtUexnCtuhC29LMxw6c0C3KvhULGUfpVdGvACTPy8rIrg78Mm6tPFnG+LkE3II1GRZ+RIVcEbfRVQ4xhRS9fpGE9WPMcFb/Jg17od8OZmciLrGTH4vI8DA9D/B/K9RQ5NETi5NbMeYGYoxW8gKQEvVL9H0AkpGygwPVuHvYCmLKxYfWA1HFewmQqpVlMzSxFf9RkAyetQCCig41OaJPdC6/pNOmnMZfYOAd5zkMUziYoVTbCUIuf1xfNKw+E5WN1XqXAA6D1JuckmGTyKykIQsbS8h9ATDPrCchHWUjQogo+UOIBw/1UCPGpsfQyigtCMmnnqjlNEcs10KxoEn3GhO6gI3+0mD3LP/d0nsbxVlXdbulpmN3X3ts58h55r+8RAGiiDi2no2hF21TQ5+ctk+mJMxf+WFdDZ4kweW2YW6vrJZgVyad2q2G1R5D/s1J/Qobi1JMUEwpl9+mP7mCOvHdHENB7BovqJSZy19FH8Z2vq9KrnExcRZGvzX4B9RHh/TIvbWr0k1YtFOPcOaIefJsal6FSgaUKnqQ/+NxPxmxyHmtfJqBd3rwSdBBjRXsria7bK3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(83380400001)(186003)(6486002)(478600001)(6666004)(110136005)(2616005)(26005)(6512007)(6506007)(53546011)(54906003)(5660300002)(36756003)(82960400001)(86362001)(38100700002)(66556008)(66946007)(2906002)(41300700001)(66476007)(31696002)(4326008)(316002)(8676002)(8936002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmdOWVZSbEk3SFArV0NUblB5ZmVPc2Q4MUYyWmNSNjlpTURIYW5zZ0dBK005?=
 =?utf-8?B?bGNKalQvU0dXODBDcXlYNFcyVEVzWlVIOW1ibS8zQ3QvQ3ZWZmtFUXU3N0No?=
 =?utf-8?B?TFcxbmVTSTAxeHlJbmNVVGVsVldiZ290V2pYeDZsRFM4c1lKaTVTN0toS3l2?=
 =?utf-8?B?TEFoRXRVNjlycklFOVRqdE5CdWNCenlGeUd6MCt5MHVSQVdjNi9LZ21XdkRj?=
 =?utf-8?B?Tk1DckZJK2h5YTZHcnIzUUsrc043YXlWYUR6RWhsNi9mTWtlSHRseGxtTmdy?=
 =?utf-8?B?SjBObHdIQTlpLzBCa25BM05UQmU3anVadzZVbUxFMG5HTW5RUnpMUHE4UE1N?=
 =?utf-8?B?RUI5bFAyV2JxdWsvLytZVnNtTzdBNUxNSEViZmZ5UEFyYW13c1R3RGdnUEpN?=
 =?utf-8?B?ZDM1a0dSbWZ0cDJrVnhaczRUSjg4ZTlTSFkvWGVKaXZVSVAvdWxkSUpXemg0?=
 =?utf-8?B?MmphbHFMelRYdjFjT0NsUFVRR1dJaDcxMzNvamc1Y2NPeDZlbm5rUndsMlRO?=
 =?utf-8?B?dFIxdnNWLy9CejFXci94eDIyTXhzK3A4QWRqSGdLUDRpeU5mMjFocWk5YnVm?=
 =?utf-8?B?UEhTd0Zsc0N1U1hDSmdGcHlCV2R0c2R4NlpScC9tZnBQbWNvUjdqY2c0M2M4?=
 =?utf-8?B?NDhjQ1g1MStiSDFDQ2lXemJDQTB3RFA3Vkh2Z3NoRVdvQzI3d3NaRFZXSlFk?=
 =?utf-8?B?VUFGYUUyTnh0cmsvRmpzNU9iRzc5WWlndjI5RGVwY2VjeWRrcVdrYlZFRjk5?=
 =?utf-8?B?cUJPdzBsYko1UEhpTXdoc1FyWXNoUjMwQmk4TGxqRncxcW1GOGRwOW1kQzNS?=
 =?utf-8?B?UlRIQUhXMnRnUkFCZDJZbUkxcXdhNU1Rc3dtMHRRTm5HakdaQ09WZExqNzJh?=
 =?utf-8?B?RFdyVEsvVFJrWGorTnQrZjE0cjFUTXYxb3UxV04yaUpCYjB6cnB4citmV0w2?=
 =?utf-8?B?SWczTFJJNFBiK0Y0Qy9TTHFPeWJsMTAyb0QxOXp5QXQvbkdXZGxVZmNiTmIw?=
 =?utf-8?B?YWJHSU9RVjRxeWVoYkZVZGQ1QVBWOFBCUTIrVGxKRHVjeVpRMXdlQi9IdE9a?=
 =?utf-8?B?MEkyV1NhSXlQL21hd1ZPOVNqZTZKRmdtWEEwelNuUWxtbGlUOHRBckVnTFN0?=
 =?utf-8?B?ZGhLamZSTVdMWHZJVERpWkNDV20vVnkzMm5ZZHR2VktESFdsWmRaN0Nmbk5I?=
 =?utf-8?B?SmJlQ3VtSVh6Z1ZLZVIwckJaMGFMcSszaGRrbU4yNzRoMkxQZmwxU1Yrdlcy?=
 =?utf-8?B?SWV1L2l1eGRrNjVzSVg2WDhJQTNxNFVCZUE1cG5nemVxOFEvWXR6UEFBOWdJ?=
 =?utf-8?B?S0loY2RSUW1uSUlkMGJ2MndtNTd5TEFaZkRFOFFjSUU0d1kzcFV2a3ZUVjlm?=
 =?utf-8?B?KzJpZ3AwNVE3WUpXMGtrNFY5RXU4ZXhjRDFjbUJ6Q0ZhWXFiMEFNRW1jL2pB?=
 =?utf-8?B?YlN4REd3YmpKWUtHVFJjdEdmMHUrZVZVdFpwMzArMEVYRlZ0QnpiTDVPZXc1?=
 =?utf-8?B?NHg2cDZJaDdFS3VxcTdoeG5UNk9jMDFqS1phYTNWTGdWTXFWRUNLR1RVeWQ2?=
 =?utf-8?B?RjNVVTgyUDlIMDRnb1lRSmdwWkh1ZGNGNkdydCtjQVpwbzZNWTVyTm5QWFZN?=
 =?utf-8?B?aCtWZm51akZpNUVPTE9CeFREd0VFaXJneWw2Z0U0SFkxYkJWZXFlODJIR3Fs?=
 =?utf-8?B?elplaHRwK3VMV1JPMUdvbVBwejVZWWhmVFM2TFh0MnBtejhDMnpzUUF3eEU1?=
 =?utf-8?B?bEhMcUI5bUNVc3MvQVpYa1ZoZVdWdVhKY25TWjZzaUY3MDlQQzVDRndlZVFh?=
 =?utf-8?B?TnVnTHFadi90dUk3bDN0UXZuV0p4Znp3ajlFa2VmYXFJVFYvcnFDYm91Sk0v?=
 =?utf-8?B?cVZYMElRdTlVS3dpajVqTElFeW9mQ1JjNWRXd29aay8rMUVxUy9LcG0wWlpI?=
 =?utf-8?B?bGV3WW9KSGtqT0c1a1NWUmJvZ1ZsSnh5L0xsYkVvdDNocktsTCsydkV5QTRR?=
 =?utf-8?B?dDBBdkdSYUFrY050NjZOKzBQNStCMlN6NWs1NTJpMUoyenNVQ2N4N2RpQm1U?=
 =?utf-8?B?Y1V3eTdPTElGOEtxS0t4UG9wZTJ0NHZMWkhzcUhHYW5tNHpCTGhBakU1SE5Q?=
 =?utf-8?B?R2NQRlJMM2VSKythZk83MWMxYzc2ZnN0T1ZNc0RxTDQ2dXVtUWJ3dldYU0Jp?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be8b3702-7129-4572-3d81-08db4681753f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 18:10:03.8828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFJQl4zmPtsBR0rOMW9FioFiHjPF5H2pnGvEIQuLyCKEbebIkjQ6bykIDsc6fVS21XcOhsNeQlnoaeotD0SHmkxN3UCGsm7NsFno+JgJcao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7913
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Yang,
 Fei" <fei.yang@intel.com>, "Justen, Jordan L" <jordan.l.justen@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
 "chris.p.wilson@linux.intel.com" <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/26/2023 9:48 AM, Teres Alexis, Alan Previn wrote:
> On Wed, 2023-04-26 at 13:52 +0200, Daniel Vetter wrote:
>> On Tue, Apr 25, 2023 at 04:41:54PM +0300, Joonas Lahtinen wrote:
>>> (+ Faith and Daniel as they have been involved in previous discussions)
>>> Quoting Jordan Justen (2023-04-24 20:13:00)
>>>> On 2023-04-24 02:08:43, Tvrtko Ursulin wrote:
>>>>>
> alan:snip
>
>> - the more a feature spans drivers/modules, the more it should be
>>    discovered by trying it out, e.g. dma-buf fence import/export was a huge
>>    discussion, luckily mesa devs figured out how to transparantly fall back
>>    at runtime so we didn't end up merging the separate feature flag (I
>>    think at least, can't find it). pxp being split across i915/me/fw/who
>>    knows what else is kinda similar so I'd heavily lean towards discovery
>>    by creating a context
>>
>> - pxp taking 8s to init a ctx sounds very broken, irrespective of anything
>>    else

I think there has been a bit of confusion in regards to this timeout and 
to where it applies, so let me try to clarify to make sure we're all on 
the same page (Alan has already explained most of it below, but I'm 
going to go in a bit more detail and I want to make sure it's all in one 
place for reference).
Before we can do any PXP operation, dependencies need to be satisfied, 
some of which are outside of i915. For MTL, these are:

GSC FW needs to be loaded (~250 ms)
HuC FW needs to be authenticated for PXP ops (~20 ms)
MEI modules need to be bound (depends on the probe ordering, but usually 
a few secs)
GSC SW proxy via MEI needs to be established (~500 ms normally, but can 
take a few seconds on the first boot after a firmware update)

Due to the fact that these can take several seconds in total to 
complete, to avoid stalling driver load/resume for that long we moved 
the i915-side operations to a separate worker and we register i915 
before they've completed. This means that we can get a PXP context 
creation call before all the dependencies are in place, in which case we 
do need to wait and that's where the 8s come from. After all the pieces 
are in place, a PXP context creation call is much faster (up to ~150 ms, 
which is the time required to start the PXP session if it is not already 
running).

The reason why we suggested a dedicated getparam was to avoid requiring 
early users to wait for all of that to happen just to check the 
capability. By the time an user actually wants to use PXP, we're likely 
done with the prep steps (or at least we're far along with them) and 
therefore the wait will be short.

> Alan: Please be aware that:
> 1. the wait-timeout was changed to 1 second sometime back.
> 2. the I'm not deciding the time-out. I initially wanted to keep it at the same
> timeout as ADL (250 milisec) - and ask the UMD to retry if user needs it. (as per
> same ADL behavior). Daniele requested to move it to 8 seconds - but thru review
> process, we reduced it to 1 second.
> 3. In anycase, thats just the wait-timeout - and we know it wont succeed until
> ~6 seconds after i915 (~9 secs after boot). The issue isnt our hardware or i915
> - its the component driver load <-- this is what's broken.

I think the question here is whether the mei driver is taking a long 
time to probe or if it is just being probed late. In the latter case, I 
wouldn't call it broken.

>
> Details: PXP context is dependent on gsc-fw load, huc-firmware load, mei-gsc-proxy
> component driver load + bind, huc-authentication and gsc-proxy-init-handshake.
> Most of above steps begin rather quickly during i915 driver load - the delay
> seems to come from a very late mei-gsc-proxy component driver load. In fact the
> parent mei-me driver is only getting ~6 seconds after i915 init is done. That
> blocks the gsc-proxy-init-handshake and huc-authentication and lastly PXP.
>
> That said, what is broken is why it takes so long to get the component drivers
> to come up. NOTE: PXP isnt really doing anything differently in the context
> creation flow (in terms of time-consuming-steps compared to ADL) besides the
> extra dependency waits these.
>
> We can actually go back to the original timeout of 250 milisecs like we have in ADL
> but will fail if MESA calls in too early (but will succeed later) ... or...
> we can create the GET_PARAMs.
>
> A better idea would be to figure out how to control the driver load order and
> force mei driver + components to get called right after i915. I was informed
> there is no way to control this and changes here will likely not be accepted
> upstream.

we could add a device link to mark i915 as a consumer of mei, but I 
believe that wouldn't work for 2 reasons

1 - on discrete, mei binds to a child device of i915, so the dependency 
is reversed
2 - the link might just delay the i915 load to after the mei load, which 
I'm not sure it is something we want (and at that point we could also 
just wait for mei to bind from within the i915 load).

Daniele

>
> ++ Daniele - can you chime in?
>
> Take note that ADL has the same issue but for whatever reason, the dependant
> mei component on ADL loaded much sooner - so it was never an issue that was
> caught but still existed on ADL time merge (if users customize the kernel +
> compositor for fastboot it will happen).(i realize I havent tested ADL with the
> new kernel configs that we use to also boot PXP on MTL - wonder if the new
> mei configs are causing the delay - i.e. ADL customer could suddenly see this
> 6 sec delay too. - something i have to check now)

