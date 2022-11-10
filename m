Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61697624D27
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 22:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650CD10E764;
	Thu, 10 Nov 2022 21:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C057110E760;
 Thu, 10 Nov 2022 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668116243; x=1699652243;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Q9lBGPDZzcpp5AZihc0euVg8zyZJ+PPGuM+Fqj44eZY=;
 b=T/vET2kskuGsKs1WJCIEzQMjb4vjbYoPSlvq5Z6ERhJG+XUE+jSV9dmK
 urgJc91wHJSu33xmnxxG0mzLn4ZV50xgyFzoWGdIN48aUFKxr8Bd9CjB+
 4zTMCdQBLPP/w9mfYvz19WdgOTe7paEDl68eTzPmYaZrspWDWy/OvWcLz
 7XXMZ83ugpPjxSU1uLm8CqIbAFNzd0gUrcogYOM++PKBEzKahVZJrMilr
 c+l4xGWwHYCXWB5KUwUw/D8nIFklk9Zs+hAperQHaxz6xyU73tO3BL6Ah
 0UEq/fAxi7pyhgSKDDF7RpArckeDSFeTTr4ExwISlXCTre39kr+cs6zSm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="373574231"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="373574231"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 13:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="812208993"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="812208993"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 10 Nov 2022 13:37:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 13:37:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 13:37:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 13:37:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lsr2BcKfkMWojJD3ifd3kD2EFVh21ubhzYotRrYi9J2/pZLWjjJZ3KpSZKPC0fRJxZc8+1uAMXqSaa3PmgFKJrHYLOzA7kiLo7CGspoUjwVhYTuOxMb+4+STq1dTpm9vyo30siJ4I7IfShKSlIqIG4Saq/0+0ir88CrxiOyZo+7WxIVLcTU9Yv0G79HAaVmw2QNxUcDES0E4Hgu/5P4Apy9OjzLLE5cMLzUZVZWaxnshAJcQ8GHzS87c4LVHNx80CVApgQ9gb4F0qCjKTOVhI+GYJ30F8A5WPfIZhaNsoTnZocLCTHJmfTxOt8KcrbQyfogNWJlVsdiP7MMQmhYwRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9lBGPDZzcpp5AZihc0euVg8zyZJ+PPGuM+Fqj44eZY=;
 b=TcWiCtB1WNiiwwbdBonL9tcWG/lIjE4+2LuhliKpEDxkXpS78l4IsBYWQ6C9lXTOYR8pTjMsAaSvOzWQxN7I77/deYsEzh1s+gr9ChUH/55rg4Ryt/IR82SvmflJbswbazwjlkkPTsJTIZaPddKQIuYpcsxjstUGQ+Gr1Upvw9EKBJJePGUw9aL5dO6L7zc6FXwpi8WwneCUhWICBoRr5Ifwq7ZNZ7m6vKQXQsdQetys4tgTRnm4fP+sKGTPD+ywAeKQh9ExUpK3vGfo0Yi5kPBBg8FqlZ62iN21TO520Rlea+vqfTvFt81gyXqNXb/GAxnNDY8qyOvAYjRd0gZStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Thu, 10 Nov
 2022 21:37:20 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::bd11:c577:72ab:57ed]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::bd11:c577:72ab:57ed%8]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 21:37:20 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 00/20] drm/i915/vm_bind: Add VM_BIND
 functionality
Thread-Topic: [Intel-gfx] [PATCH v6 00/20] drm/i915/vm_bind: Add VM_BIND
 functionality
Thread-Index: AQHY8oZGcORUHTvlFU2Bok+yfjaDA643TkqAgABc+4CAAJZVAIAABQGAgABtkIA=
Date: Thu, 10 Nov 2022 21:37:20 +0000
Message-ID: <fe3384ea9a76e409234033337de5a3b6f3cbdb8f.camel@intel.com>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <7a1c8c8ba83e3e7ba286e636de0074516a099d68.camel@intel.com>
 <Y2yQ2T7+sILYn3rM@nvishwa1-DESK>
 <9097e704-841e-673d-4969-73ffc8f9093f@linux.intel.com>
 <ab3149ab-730b-c3d5-5296-518a9611dd64@intel.com>
In-Reply-To: <ab3149ab-730b-c3d5-5296-518a9611dd64@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|IA0PR11MB7401:EE_
x-ms-office365-filtering-correlation-id: 9d358ade-bba1-43ce-b94c-08dac363bf28
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZyqLmqNxJ9QOAjQNHQkefWFa1/dIGxW5CE6XNCD+M+wgMU+qVW0iLPfYBnqN5yWlRZulgJ9B44omL5Tb7H1d59lZKT6Dr2SuM9N/FpDbRtuAbtQTJ0CmDZCurwr0S4uqZ41UII4laNUo3xXci1a29iG0ok0tDlw8c/ExbZeb487NwYEDhhFqlP5sPfxkO0RgMHGd+fNhBHWr62DxWMqMJRQcMSjos87pCqg1SR8TVoNBfwKiwn+kFLSpuVa8ee1QUo0HU/6fY7HPMMODHBehgRlYEe5Q+VWF3Z+XJqZtARjyZkmrL7JhKH/9EQKRtTWaCvw7zwFrjpj/9NEVCIVL4XeHRFV4oDb0F1uN4lq3G/e2prtYOsYf4YqptgiGcHftGONhWs06ks2NWNu4ev5lonl+8JYX2tyafK4cn3JhfRu8g2bwnpB4w+DHi1RFNcE2aSsl8zOEwno3lNJVC3vglmNJWNVp6suVOfNS6ZcTvArLpVuYR+rWKsPfSGMW21GwS262ogsDHWZuZzeHQaslzbbw/o77jxM+04Pa65Fm5MyXyOi6O9rapxqaauY71ynKp195CV82lGetDQmfuIKVkV9GHLEdegWifivAGJG4elJ92SaoRgGGQchuEEQyZwd/vvbG3bDQD3yULwKEkJ8OQfhR3+gf+4Bz+eta6ulOwMN6DcSK+pPDl/IUg724RAOumLNO0GIYDj2WRv9VIEZP2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199015)(38100700002)(8936002)(66899015)(122000001)(5660300002)(82960400001)(41300700001)(6636002)(6506007)(91956017)(83380400001)(53546011)(2906002)(4001150100001)(66446008)(66556008)(66476007)(8676002)(76116006)(66946007)(4326008)(71200400001)(6512007)(316002)(110136005)(36756003)(2616005)(6486002)(478600001)(54906003)(38070700005)(64756008)(86362001)(966005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlRvSTFjM3JkSWluS2hhVUM4dnU2emQ3b21xNVpUWkxudWRDeEF3UCt0S1N6?=
 =?utf-8?B?c3R6RGVhRm9pYUdtUm9ldDdtRlY2TVRHb0FTWDcwcmRGMmtHWXFIT1kycWpP?=
 =?utf-8?B?MHlsc3JrdTlqTHpuVWp0eXd0MXpZUXJmeU8xQkRWeVd5OXZQbVBmRC9IK3FW?=
 =?utf-8?B?blVoOGZlV05ldHpDTUw4R2J6OW91aDNhWWMyZ25oZ1JzS24ySmZuS3REZEpT?=
 =?utf-8?B?cXdTZzk5NUFPSTczK1RoalBVdEUvQWxmbEJzazJremhzTFhoS0hnbkJiNXM4?=
 =?utf-8?B?M0tidDNWTlFSd1VTZmRJUllTSjMvcnJuOEd4YXJPaVhRd3JtV29ZendiL2NX?=
 =?utf-8?B?TnNwNkJiNm1IK1hNbUthOFpJNCtaWVQ5ekVXQVIzQjg0ZzBFUm1Od3hrZzNw?=
 =?utf-8?B?Lyt1NXRyb085S1FSNFQ3RThJMTVLOFVzU0dsaTF4MjFUbWVIdnVCY2Y1di9B?=
 =?utf-8?B?RFB3QVVXWG9xbmJQcEZLNU1GYXVqMU9YTzlXOU1qSnhBYTVMd2FXTGY3cTE1?=
 =?utf-8?B?eGlUZEZwNzZWTWtvQUc3eEQ2QVh4L3NSUytFbWZzNFVpL24yQmdabnpSakpr?=
 =?utf-8?B?bGpNVEZsVEF4VnNUZVdSZk1zcWQ2YkNPTTUremdiV3FmMlloTG9ZOUI1bW1I?=
 =?utf-8?B?M3BaYURmMG9pUHZ1cnJnaDdnbUVXNHBNaDZJVUxFUkZzQms5TElCOTZMRTE5?=
 =?utf-8?B?TThYYUpRUFlVOUlKamlBTUVYc1ZUWnZhODl2VE9nbzlIYVdYRkRuS0xaaFZ5?=
 =?utf-8?B?ZXdsRGh5eWgyRXI1QldGT09ZU2NvMFNOcGJHWktWMzdiTzRTOWh0UllMS21C?=
 =?utf-8?B?b1A5U3E3Tkt5ZFQzalg2TU84SjRlcnhaT3VlMnliZXF3Qzd0MU16K0JRSkFK?=
 =?utf-8?B?V240NTZ6eWdpUS9ZM3dETjZoWWxyOUc3WDFhaXhVSWtITFNVUTYvWHRqSGky?=
 =?utf-8?B?TEcva01MeHVhbVZ5d1dXWEVNWDM2TFpVN3RLUHJyUU1hMnEvalNBbVB5cTY0?=
 =?utf-8?B?dW5FNkJWbThWNmlsRG1mL0ttU0x5eG5Dcm5LdlYrT2gvR21WbCtwMS9tU2Ny?=
 =?utf-8?B?SEtqTGxjMDZiZjQzV2NHVE5DVll6bjhMaHM3S0J5MlEzVmtLUzJqTi9FRFpB?=
 =?utf-8?B?MFJMVXcwZHpBSThYaTQwM0hNVmNVZmFlU2dZdWJFUG9lVnVnU0JMcDhJSTUw?=
 =?utf-8?B?TUt4blAyMWV0Z1IvcVoyL21ESSttem02UGdpQU51L2pKbE1MY25GYjNBWjBk?=
 =?utf-8?B?blorU1hPeVJKekhJT2ZNL0tzMFlTdzRXaU5UcStwQzFxYlA5S1Znb1l2KzVI?=
 =?utf-8?B?cG45QUwxQk5xYnBDSHlRRjFTR2IrNkdPMEhRQzY1NGZ5WU1WR2tnQjFaU2Yz?=
 =?utf-8?B?RUF4Vmw1bFA1cmFRZW9nTXcxbTZBZUZPY0ZCOE1Qd3hkTlN2ajJXRGpYRmxD?=
 =?utf-8?B?ajJvVW5UbGkzMldoZUFHQ1AzUW51VWlvTlFSQ0hPTDZWdy9lVkoyV2Q5cnJY?=
 =?utf-8?B?SVArMWtuRE9hWEhPeU1lbzJjdWNUNGJVN0o4dGJyNFkxdzRtcTBPNzdKbGRr?=
 =?utf-8?B?SEpYMTBtdFpQTkVhM1dkYjExZFUyb20zN0ZONk9IOHV1c1p2UDUxaTlZSlNW?=
 =?utf-8?B?UFovOXMzY1F0YkN5STU3c0JDNlhwcld2UzZKSTFseWhpcHl1RjJvbUtkU1k2?=
 =?utf-8?B?dm1CYjFnQnNVRS9XdStMUFFUSGVMZFlJSmxWNU8ycTVIMDdEdHdtcHNsdjVw?=
 =?utf-8?B?Rjl4UTNCOEhhTm1HZWIweVdXKzc1V3Q1RXQ2WE1OamJ4ejlHOFJDRnFtRFNT?=
 =?utf-8?B?bXFtWTJQMjZVU3pQMmhLeFNLNGw0RlBtVnVSU2k5bnMybXF5WGx0a09zR0lH?=
 =?utf-8?B?L2x5M2pDdkdXZGtzQmUwTnRUa2s0dGVHOVlTa25zanpTeTZLUGliZmYzamVh?=
 =?utf-8?B?bVlmQkJyZzgvUWEyTFlIQ09pd3dIM1FvanpreFhaekljUW5NWkcyV1F4NDlB?=
 =?utf-8?B?SUgzODJJNURUZkY1M3hieEJIUFA5MzZqam4zYXBJdEh0ZE9kai9iMi9CaTlz?=
 =?utf-8?B?YTllSHBqbVFiNUZaOVEwL0h1Y0VMVDhneTNWZkgxL2tVMDZ5djB6UnlienRr?=
 =?utf-8?B?RURBQjRvNm1FYU9GTW9YcFdGbVV2TnN5RTFJSHlOdGhZUHNGZ2VHMHgyWi9B?=
 =?utf-8?B?YXVmcnYyenFFTEpMczhCUWRBbXV6Q1l4M2pDSmk3cU50M29ZUlU3WWNkQ0RE?=
 =?utf-8?B?YlRFTHRNcUwyenBvOExBUEQ4UFZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32A9FBFFD9B39143A1A6875A827D8B03@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d358ade-bba1-43ce-b94c-08dac363bf28
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 21:37:20.2329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0d/7f4h+hDF51bijeiuqcmzfqAsFtMiWBCqkHHgjlwE96+3rGplNumI6p7qPp+doFKpYV/IPWWZ1aAMJPevbiLS8Zxe8Gj2LSvsFWxF4js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7401
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTExLTEwIGF0IDE1OjA1ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IE9uIDEwLzExLzIwMjIgMTQ6NDcsIFR2cnRrbyBVcnN1bGluIHdyb3RlOg0KPiA+IA0KPiA+IE9u
IDEwLzExLzIwMjIgMDU6NDksIE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgd3JvdGU6DQo+ID4g
PiBPbiBXZWQsIE5vdiAwOSwgMjAyMiBhdCAwNDoxNjoyNVBNIC0wODAwLCBaYW5vbmksIFBhdWxv
IFIgd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgMjAyMi0xMS0wNyBhdCAwMDo1MSAtMDgwMCwgTmly
YW5qYW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToNCj4gPiA+ID4gPiBEUk1fSTkxNV9HRU1fVk1f
QklORC9VTkJJTkQgaW9jdGxzIGFsbG93cyBVTUQgdG8gYmluZC91bmJpbmQgR0VNDQo+ID4gPiA+
ID4gYnVmZmVyIG9iamVjdHMgKEJPcykgb3Igc2VjdGlvbnMgb2YgYSBCT3MgYXQgc3BlY2lmaWVk
IEdQVSB2aXJ0dWFsDQo+ID4gPiA+ID4gYWRkcmVzc2VzIG9uIGEgc3BlY2lmaWVkIGFkZHJlc3Mg
c3BhY2UgKFZNKS4gTXVsdGlwbGUgbWFwcGluZ3MgY2FuIG1hcA0KPiA+ID4gPiA+IHRvIHRoZSBz
YW1lIHBoeXNpY2FsIHBhZ2VzIG9mIGFuIG9iamVjdCAoYWxpYXNpbmcpLiBUaGVzZSBtYXBwaW5n
cyANCj4gPiA+ID4gPiAoYWxzbw0KPiA+ID4gPiA+IHJlZmVycmVkIHRvIGFzIHBlcnNpc3RlbnQg
bWFwcGluZ3MpIHdpbGwgYmUgcGVyc2lzdGVudCBhY3Jvc3MgbXVsdGlwbGUNCj4gPiA+ID4gPiBH
UFUgc3VibWlzc2lvbnMgKGV4ZWNidWYgY2FsbHMpIGlzc3VlZCBieSB0aGUgVU1ELCB3aXRob3V0
IHVzZXIgaGF2aW5nDQo+ID4gPiA+ID4gdG8gcHJvdmlkZSBhIGxpc3Qgb2YgYWxsIHJlcXVpcmVk
IG1hcHBpbmdzIGR1cmluZyBlYWNoIHN1Ym1pc3Npb24gKGFzDQo+ID4gPiA+ID4gcmVxdWlyZWQg
Ynkgb2xkZXIgZXhlY2J1ZiBtb2RlKS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGlzIHBhdGNo
IHNlcmllcyBzdXBwb3J0IFZNX0JJTkQgdmVyc2lvbiAxLCBhcyBkZXNjcmliZWQgYnkgdGhlIHBh
cmFtDQo+ID4gPiA+ID4gSTkxNV9QQVJBTV9WTV9CSU5EX1ZFUlNJT04uDQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gQWRkIG5ldyBleGVjYnVmMyBpb2N0bCAoSTkxNV9HRU1fRVhFQ0JVRkZFUjMpIHdo
aWNoIG9ubHkgd29ya3MgaW4NCj4gPiA+ID4gPiB2bV9iaW5kIG1vZGUuIFRoZSB2bV9iaW5kIG1v
ZGUgb25seSB3b3JrcyB3aXRoIHRoaXMgbmV3IGV4ZWNidWYzIGlvY3RsLg0KPiA+ID4gPiA+IFRo
ZSBuZXcgZXhlY2J1ZjMgaW9jdGwgd2lsbCBub3QgaGF2ZSBhbnkgZXhlY2xpc3Qgc3VwcG9ydCBh
bmQgYWxsIHRoZQ0KPiA+ID4gPiA+IGxlZ2FjeSBzdXBwb3J0IGxpa2UgcmVsb2NhdGlvbnMgZXRj
LiwgYXJlIHJlbW92ZWQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gTk9URXM6DQo+ID4gPiA+ID4g
KiBJdCBpcyBiYXNlZCBvbiBiZWxvdyBWTV9CSU5EIGRlc2lnbit1YXBpIHJmYy4NCj4gPiA+ID4g
PiDCoMKgRG9jdW1lbnRhdGlvbi9ncHUvcmZjL2k5MTVfdm1fYmluZC5yc3QNCj4gPiA+ID4gDQo+
ID4gPiA+IEhpDQo+ID4gPiA+IA0KPiA+ID4gPiBPbmUgZGlmZmVyZW5jZSBmb3IgZXhlY2J1ZjMg
dGhhdCBJIG5vdGljZWQgdGhhdCBpcyBub3QgbWVudGlvbmVkIGluIHRoZQ0KPiA+ID4gPiBSRkMg
ZG9jdW1lbnQgaXMgdGhhdCB3ZSBub3cgZG9uJ3QgaGF2ZSBhIHdheSB0byBzaWduYWwNCj4gPiA+
ID4gRVhFQ19PQkpFQ1RfV1JJVEUuIFdoZW4gbG9va2luZyBhdCB0aGUgS2VybmVsIGNvZGUsIHNv
bWUgdGhlcmUgYXJlIHNvbWUNCj4gPiA+ID4gcGllY2VzIHRoYXQgY2hlY2sgZm9yIHRoaXMgZmxh
ZzoNCj4gPiA+ID4gDQo+ID4gPiA+IC0gdGhlcmUncyBjb2RlIHRoYXQgZGVhbHMgd2l0aCBmcm9u
dGJ1ZmZlciByZW5kZXJpbmcNCj4gPiA+ID4gLSB0aGVyZSdzIGNvZGUgdGhhdCBkZWFscyB3aXRo
IGZlbmNlcw0KPiA+ID4gPiAtIHRoZXJlJ3MgY29kZSB0aGF0IHByZXZlbnRzIHNlbGYtbW9kaWZ5
aW5nIGJhdGNoZXMNCj4gPiA+ID4gLSBhbm90aGVyIHRoYXQgc2VlbXMgcmVsYXRlZCB0byB3YWl0
aW5nIGZvciBvYmplY3RzDQo+ID4gPiA+IA0KPiA+ID4gPiBBcmUgdGhlcmUgYW55IG5ldyBydWxl
cyByZWdhcmRpbmcgZnJvbnRidWZmZXIgcmVuZGVyaW5nIHdoZW4gd2UgdXNlDQo+ID4gPiA+IGV4
ZWNidWYzPyBBbnkgb3RoZXIgYmVoYXZpb3IgY2hhbmdlcyByZWxhdGVkIHRvIHRoZSBvdGhlciBw
bGFjZXMgdGhhdA0KPiA+ID4gPiB3ZSBzaG91bGQgZXhwZWN0IHdoZW4gdXNpbmcgZXhlY2J1ZjM/
DQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBQYXVsbywNCj4gPiA+IE1vc3Qgb2YgdGhlIEVYRUNf
T0JKRUNUX1dSSVRFIGNoZWNrIGluIGV4ZWNidWYgcGF0aCBpcyByZWxhdGVkIHRvDQo+ID4gPiBp
bXBsaWNpdCBkZXBlbmRlbmN5IHRyYWNrZXIgd2hpY2ggZXhlY2J1ZjMgZG9lcyBub3Qgc3VwcG9y
dC4gVGhlDQo+ID4gPiBmcm9udGJ1ZmZlciByZWxhdGVkIHVwZGF0ZWQgaXMgdGhlIG9ubHkgZXhj
ZXB0aW9uIGFuZCBJIGRvbid0DQo+ID4gPiByZW1lbWJlciB0aGUgcmF0aW9uYWxlIHRvIG5vdCBy
ZXF1aXJlIHRoaXMgb24gZXhlY2J1ZjMuDQo+ID4gPiANCj4gPiA+IE1hdHQsIFR2cnRrbywgRGFu
aWVsLCBjYW4geW91IHBsZWFzZSBjb21tZW50IGhlcmU/DQo+ID4gDQo+ID4gRG9lcyBub3Qgcmlu
ZyBhIGJlbGwgdG8gbWUuIExvb2tpbmcgYXQgdGhlIGNvZGUgaXQgY2VydGFpbmx5IGxvb2tzIGxp
a2UgDQo+ID4gaXQgd291bGQgYmUgc2lsZW50bHkgZmFpbGluZyB0byBoYW5kbGUgaXQgcHJvcGVy
bHkuDQo+ID4gDQo+ID4gSSdsbCBsZXQgcGVvcGxlIHdpdGggbW9yZSBleHBlcmllbmNlIGluIHRo
aXMgYXJlYSBhbnN3ZXIsIGJ1dCBmcm9tIG15IA0KPiA+IHBvaW50IG9mIHZpZXcsIGlmIGl0IGlz
IGRlY2lkZWQgdGhhdCBpdCBjYW4gYmUgbGVmdCB1bnN1cHBvcnRlZCwgdGhlbiB3ZSANCj4gPiBw
cm9iYWJseSBuZWVkIGEgd2F5IG9mIGZhaWxpbmcgdGhlIGlvY3RsIGlzIHVzZWQgYWdhaW5zdCBh
IGZyb250YnVmZmVyLCANCj4gPiBvciBzb21ldGhpbmcsIGluc3RlYWQgb2YgaGF2aW5nIGRpc3Bs
YXkgY29ycnVwdGlvbi4NCg0KVGhlcmUncyBubyB3YXkgZm9yIHRoZSBpb2N0bCB0byBldmVuIGtu
b3cgd2UncmUgd3JpdGluZyB0bw0KZnJvbnRidWZmZXJzLiBVbmxlc3Mgb2YgY291cnNlIGl0IGRl
Y2lkZXMgdG8gcGFyc2UgdGhlIHdob2xlDQpiYXRjaGJ1ZmZlciBhbmQgdW5kZXJzdGFuZCBldmVy
eXRoaW5nIHRoYXQncyBnb2luZyBvbiB0aGVyZSwgd2hpY2gNCnNvdW5kcyBpbnNhbmUuDQoNCg0K
PiANCj4gTWF5YmUgaXQncyBhIGNvaW5jaWRlbmNlIGJ1dCB0aGVyZSBpczoNCj4gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMTA3MTUvDQo+IA0KPiBXaGljaCBsb29r
cyByZWxldmFudC4gTWFhcnRlbiwgYW55IGhpbnRzIGhlcmU/DQoNCkNhbiB3ZSBwcmV0dHkgcGxl
YXNlIGhhdmUgdGhlIHJ1bGVzIG9mIGZyb250YnVmZmVyIHRyYWNraW5nIHdyaXR0ZW4NCmFueXdo
ZXJlPyBJIGhhZCBtYWpvciB0cm91YmxlIHRyeWluZyB0byB1bmRlcnN0YW5kIHRoaXMgYmFjayB3
aGVuIEkgd2FzDQp3b3JraW5nIG9uIEZCQywgYW5kIG5vdyBJIHJlZ3JldCBub3QgaGF2aW5nIHdy
aXR0ZW4gaXQgYmFjayB0aGVuDQpiZWNhdXNlIEkganVzdCBmb3Jnb3QgaG93IGl0J3Mgc3VwcG9z
ZWQgdG8gd29yay4NCg0KTXkgZmlyc3QgZ3Vlc3Mgd2hlbiBsb29raW5nIGF0IHRoYXQgcGF0Y2gg
aXMgdGhhdCBpdCB3b3VsZCBjb21wbGV0ZWx5DQpicmVhayBGQkMsIGJ1dCBoZXkgc28gbWFueSB5
ZWFycyBoYXZlIHBhc3NlZCBzaW5jZSBJIHdvcmtlZCBvbiB0aGlzDQp0aGF0IG1heWJlIHRoaW5n
cyBjaGFuZ2VkIGNvbXBsZXRlbHkuIEF0IGxlYXN0IEkgd3JvdGUgdGVzdHMgdG8gY292ZXINCnRo
aXMuDQoNCj4gDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiANCj4gPiBUdnJ0a28NCg0K
