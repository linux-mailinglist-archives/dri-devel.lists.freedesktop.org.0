Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3FB829B1C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 14:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C319810E5D0;
	Wed, 10 Jan 2024 13:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54D710E5C4;
 Wed, 10 Jan 2024 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704892818; x=1736428818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=H1S4eaBJuyvKGbtR6k/x2ekmgVSSnRBQS8QsuK5spmQ=;
 b=TqTcfGGEICAHX8JxpjTN/RlkJve2d58rsCQChe8y0G4rvcTBdaYo4Yt8
 YC6/1yLLCK3HuRu1i/UpC3Sw50CRRLRSGFYjCqrGLl9W56aOILu+q28q4
 BuZaZxgytuFx7BGFHMg0OgE8YoDv2hDtwQF8fMsrT9uAG57dUTwy3IO04
 zJTHgS7jjDqwEnssqlzfBzWXedzPMw2UQst4FVxxu9R8fgsUNi2PmLii4
 xzoP9lKklxzeYCWHg3OIpC719d0l2maJzJcwJ6mRWfbn8UjUeWttHQf7Q
 WeGpwpjT+rNL4pwWwgUj+lY7R71r+1/SYXGo0r/VvDZV4dFw5HY8cDFzh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="5874656"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5874656"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 05:20:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="731856381"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="731856381"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 05:20:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 05:20:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 05:20:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 05:20:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUPynj9G1D/cKVWcO2dUhHAQauq6uVrT7ikiupUuRLltVF7D/5y+wUq0EGR9GVn73LgPAB26UzKAPmmXLv26t8Z/rHGFSGsNFvD9yYiFzekc2J5RZZzzZLZ7uDnfT6r9VspaVueeoNcbnei0fN+u8mDtTYxk9MEqqZhc51Kn1bkRFEgkDyK1r/Bal8J1E1oy0CcSB6MNYw6bOVBBBVq1f3ojUo+1QBKYODRlgbck8RQUREAIoQzPEFvGpWIVfxwB0cpH9hQsjXhkv41YTAEXsCWM9AXajbr1fGPfxqW8YRJ5rojGuvS2V4eiWa/ePD4AP/gaRqX5qSSj6Bal00/4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1S4eaBJuyvKGbtR6k/x2ekmgVSSnRBQS8QsuK5spmQ=;
 b=SoaKRygplkFf0WFmlUdDzCump5cqoyuVPfPxtuELdMXwJxqctk2FzbGuPDlz/F2gf+Q09qcKFhgg7H1sFKyCrkEfM3E1SErzXE6waAW7FlIZvhDT/lKXTJY3vzabZvusboenWjghy0e4uBZSod2bTMKSvbHFAVUri6aTstC08JJP3DHHeLbQXauaWNoisVeAMz9/nBBSCQK16N224MpMUMRDaAAtE7TD6XzNVh+7Ek5uqsbKbTD6ddMQQ0yAAmfVJj5cY7+PfCI1QvruavqOR/jXshbKm7oZQ3oxLBzZELBlXupNVJIoCRg+zs/YwA5V77f57fK9TJEoQ9hKJ0t8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB6955.namprd11.prod.outlook.com (2603:10b6:510:206::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 13:20:11 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737%7]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 13:20:11 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 10/12] drm/panelreplay: dpcd register definition for
 panelreplay SU
Thread-Topic: [PATCH 10/12] drm/panelreplay: dpcd register definition for
 panelreplay SU
Thread-Index: AQHaPvvA3yIIL6eLx0C4lCvPagKad7DJfCeAgAmVWYA=
Date: Wed, 10 Jan 2024 13:20:11 +0000
Message-ID: <4e0dcb4987cfa67dd810eea2ae18799741a39639.camel@intel.com>
References: <20240104104821.1822988-1-jouni.hogander@intel.com>
 <20240104104821.1822988-11-jouni.hogander@intel.com>
 <CAA8EJppmcgAwk-TnBdf3EyPZsubJgnJOw2HVMopAfJrXdJKkFA@mail.gmail.com>
In-Reply-To: <CAA8EJppmcgAwk-TnBdf3EyPZsubJgnJOw2HVMopAfJrXdJKkFA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB6955:EE_
x-ms-office365-filtering-correlation-id: 47daf361-3b26-4025-7124-08dc11dedfe6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +B/rh9tq2vQaBzD0S3HXqJLWddIzxU0NwT63MM+LoFblKAxp6ulQhq5kp94PZCZ/swx8Z9bIJGA/3Nfaqs44Mfr5UsjappDBQ4ahMd/nUFMUdle9oqZJ7pvHj0IFSaOkyN832UcvS0wXHHAVbBrIqUnO9MwGsPsislZhvDEAOmDVmJ+P8a6iCfixhgdpac+Q85GlwS6cctr/F4cq5vGJH1bKAaabJ1BTr0IOQk03+WTk6Um7ouD5hTiIZJYI6MYH3TnIYmELYtjnoR9QFJckwPTc5RiLhxA5dmHgF+KHjt8I6DNBY/74fGw8wh4ST9KDXTtWDxmprBXNXefagwSWZFDW0VEtOnvCPsIDCN4KW2SyArK7UYX5+Ldt5NlfaCJq8VWlWxmKRuY7St/8GlpCADc3kEYgxje6OOealZyqv6NiIAQocIwEQpnK9tGaEcsae5WCNmAGoJWyhj/wISxtbvB481vUoxwP5hBQg2AkAECVN+ToT1He66P2aQPQv6Q3fu4TSEcOxASSWKvLa4+JF0crW3okGq+DuX/KNBaGmf1/MRRSLT0IVCnDGfyFw7iAWyVMKO1Eopw3ZcjdvagJh3Mv9rdlQrSv8JSBxmMw+Q4tL51KpLgRL+oZWmqTFUOZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(478600001)(5660300002)(6486002)(71200400001)(6512007)(8676002)(86362001)(2616005)(6506007)(66476007)(316002)(91956017)(38100700002)(66946007)(41300700001)(54906003)(66556008)(82960400001)(64756008)(36756003)(6916009)(76116006)(66446008)(122000001)(8936002)(83380400001)(26005)(66574015)(38070700009)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHJwb21kT1EzMlJSNkZobklISXZEdDZBNW5kNENEanovMkkyWHFkdUx6cWZv?=
 =?utf-8?B?Q0Vtd2k5cWF3a2tBUHVBTnJHa3JvMk5FOFFhZTdpQnBSU0NoL1JRaE42Q2Zj?=
 =?utf-8?B?Rmp0TDZMZEV5UUEwRGNOYWpNV1ZiYlJxMW1NRkpaMHcxeGcrVWhmODRPakVX?=
 =?utf-8?B?WEFHajBUcFE1SzBhU00yUUhlLzJOUlFsR0hQdklvZU5MeDVxYjNRZzhFL0dW?=
 =?utf-8?B?QzdTNFRiQTgrZzdNajI3REhFcFlRdFE1aXY5dnJUdUU3dS9ZY1FoQy80cUtK?=
 =?utf-8?B?bWhvZjBsdTcrS2IwNy8rVTUwMHErblpmUnp5cFQ2bHk4ZzZvR3JEVjdhS1Zn?=
 =?utf-8?B?V3FEZWZybkNwU1hkZWs4NS9rSGFhMHY3RUxSTy9hZExwVStOR1owZW8wUi9j?=
 =?utf-8?B?V3BlakFRMnNnb2IvTFdEcjlDMnFyaTY0dVhRYUk0Yzk0M21HdGVIR2lpazJm?=
 =?utf-8?B?bVRDOThNM3NQdStyZzhkTWI2dHZXc1hyc0lpTFFURmRSa3E4emZkamtBbmo2?=
 =?utf-8?B?T3BiNWYydmdtSU53Um9aVzAxN09BRXB3enlEK2RtS0QrYkxsQWN6a2FJTHdW?=
 =?utf-8?B?Tmp3K2dYUCtXMkhpMWFxdTFEckdOTGVjNGtyTTV1c3UyYXYxYkVKUVpoamNz?=
 =?utf-8?B?MG1MczRMZFU4ZEVGSTE0THdUK0FnUHFneWp2NDZxTEpVclBRQXVMaldFTHd3?=
 =?utf-8?B?T0duLzdQUDNQYTVuR1Z4RStKVFZlWmtTdFFYb0pIWUFBQ1R0cG1POVZ1SGJT?=
 =?utf-8?B?QXN6QjQyUUZ2RDBYYzZhaVZZOC9RV1pxZmdDM3AyWHJaQmtZeGNYVjNYbGhx?=
 =?utf-8?B?SkpGbGpKWmUzNUlJamhNYmMzNk5MYldpR2RURTVTWEZ6ZnFmVW9QZkJJRVlv?=
 =?utf-8?B?U1pSN29maSsyNFVqanlBQ1ZTRklzYzdIb2dpSk1qZWVQMkpvZXlhWDd3N3Z5?=
 =?utf-8?B?a0JIdzNvNlU1NDlOQVVTUktEa2dGU2NOWTN2Vkh4cGdjaFhoeVhjN204S1RH?=
 =?utf-8?B?UGIvRmdyUnF3K0tGWTJNL1Nma2N5ZWNzRlRxd1FvQTdUV1hRemNPemlnRnFj?=
 =?utf-8?B?b1JwdUNOWk0xR2RTVlhCS2lZRDlxS0Z1UjF2bkVFcWtYSDlSR3NaU1ZwbWhJ?=
 =?utf-8?B?Z0FCeUtyb0FKYjkwQjFRbFpYMU56OENneVk0T0czbVh4NXc0aEFmdXhLK2NN?=
 =?utf-8?B?WEtDU0xwaVBFVFFiSVJ6QmFuZ2M5ekh5S2VzQ2phbWdGR09qbUpHUWNhc25t?=
 =?utf-8?B?MTRvc3pHQTRsdFNhRmZjK1NYcDVxZ2tETDY0OS8wY1pscUlnK3JXbzBDQ3Yx?=
 =?utf-8?B?ZHBCNlJsbTk0NXBtaGdNdVFnUEUzVEpNdG5PK0gvUkdWR2VsRGROdTV2OC84?=
 =?utf-8?B?L3lDd091RzZiQ2srWm5uSytybnRlb05IQ3lpV2RZZjlwL21PaGF2QzNSc1Iv?=
 =?utf-8?B?LzJzaDkwOVcvU3d0ZGNkaHd0UHZRY0VPai9vOVo4SXM5dzZGNVRsZ2dBdlZh?=
 =?utf-8?B?dTUyR3duazh6SlRUUUdjZEs3cFBkVGhyMWg5MVppdGh3dmNpc2RyTXZQRkhD?=
 =?utf-8?B?UnR4K0gvME1ZV1dIU0RjZzdrS3J6UUJpbmxMQnRmbktoWEhQNWt3Z1lLNWhi?=
 =?utf-8?B?OGR0eWFQM2p2enVJTnR5VVNkeVVEc1VmbE0xc1pQUmpaeTJ6RTFscnh1cTI2?=
 =?utf-8?B?TGk4V1J5bFB4VitHbTBHY3NNencyOWQ1elpqRWMwV0Z6WmVZYlRZemRsWGxa?=
 =?utf-8?B?YkpudExWUUY2ZnEyaGExelhZNXRpbzNFaWhNSGxlVXBCQU1uWFBGeVRsSXVZ?=
 =?utf-8?B?azlURDJpZWNOM2p2NTJ3OTA0TGs0TEpJdGYxY1VLaXRIN05WdUFtZ0JzcHNR?=
 =?utf-8?B?bWFWTENLTUloL2VOWVh0djVzbmdoRGdTNXVRRXFFMkNVSkdjZ09oQXdGckkx?=
 =?utf-8?B?WUYzaHpRd2VtT2ZlekxRa0NxQkphVC9GVllGNldVWTE4TVFFSS8yUTdYL0lK?=
 =?utf-8?B?UkRMQkpEMjNGSWhzMVFTMmlYZVF1N3dtcTdqUk9ndjRFenVEd2JwT1VJelFB?=
 =?utf-8?B?cldLcGpzNXhWZ3M4dFhjcGY2aURMM2liblpQQ25IbzRYTzdPcWU2ak9xQWZQ?=
 =?utf-8?B?NWhnR0cyU0U2ZHdSOE5uZTY0RURXUG8wOHc4UklXTFVYV0p4ejdJNERoZE95?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <070A587D8A95814E83EE99DD1CBBF5A3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47daf361-3b26-4025-7124-08dc11dedfe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 13:20:11.6174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 67DHLEXeZ0KIE9QoHBS66/l1EmSHcWD4z8I0EIQNZni11Bts5ClztmSsqoTyBR6DkpkgPHtPeenia5s/MbSH1HDsiqPfTk664K4MZmti6nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6955
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDI0LTAxLTA0IGF0IDEyOjU5ICswMjAwLCBEbWl0cnkgQmFyeXNoa292IHdyb3Rl
Og0KPiBPbiBUaHUsIDQgSmFuIDIwMjQgYXQgMTI6NDksIEpvdW5pIEjDtmdhbmRlcg0KPiA8am91
bmkuaG9nYW5kZXJAaW50ZWwuY29tPiB3cm90ZToNCj4gPiANCj4gPiBBZGQgZGVmaW5pdGlvbnMg
Zm9yIHBhbmVsIHJlcGxheSBzZWxlY3RpdmUgdXBkYXRlDQo+ID4gDQo+ID4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiANCj4gDQo+IDEpIFRoaXMgQ0Mgc2hvdWxkIG5v
dCBiZSBuZWNlc3NhcnkuIEl0IGlzIGFscmVhZHkgYSBwYXJ0IG9mDQo+IG1haW50YWluZXJzIGVu
dHJ5IGZvciB0aGlzIGZpbGUNCj4gDQo+IDIpIEl0IHByb2JhYmx5IGRvZXNuJ3Qgd29yayBhcyBl
eHBlY3RlZC4gSXQgaXMgc2VwYXJhdGVkIHdpdGggdGhlDQo+IGJsYW5rIGxpbmsgZnJvbSB0aGUg
cmVzdCBvZiB0aGUgdHJhaWxlcnMsIHNvIG1vc3Qgb2YgdGhlIHRvb2xzIHdpbGwNCj4gc2tpcCBp
dC4NCj4gDQo+IDMpIFlvdSBoYXZlIHNraXBwZWQgdGhlIHJlc3Qgb2YgdGhlIG1haW50YWluZXJz
IGZvciB0aGlzIGZpbGUuIFBsZWFzZQ0KPiB1c2UgLi9zY3JpcHRzL2dldF9tYWludGFpbmVycy5w
bCBhbmQgcGFzcyBjb3JyZXNwb25kaW5nIG9wdGlvbnMgdG8NCj4gZ2l0DQo+IHNlbmQtZW1haWwu
DQoNClRoYW5rIHlvdSBEbWl0cnkgZm9yIGNoZWNraW5nIG15IHBhdGNoLiBTZW50IG5vdyB2ZXJz
aW9uIDIuIG9mIG15IHBhdGNoDQpzZXQuIFRoZXJlIEkgdG9vayBjYXJlIG9mIHlvdXIgc3VnZ2Vz
dGlvbnMgaW4gcGF0Y2ggMTEuDQoNCkJSLA0KDQpKb3VuaSBIw7ZnYW5kZXINCj4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gwqBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIHwgNiArKysrKysNCj4g
PiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gDQo+IFRoZSBwYXRjaCBpdHNl
bGYgbG9va3MgZ29vZCB0byBtZS4NCj4gDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gPiBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgN
Cj4gPiBpbmRleCAzNzMxODI4ODI1YmQuLjZhNTlkMzBiN2IyNSAxMDA2NDQNCj4gPiAtLS0gYS9p
bmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZGlzcGxh
eS9kcm1fZHAuaA0KPiA+IEBAIC01NDgsNiArNTQ4LDEyIEBADQo+ID4gwqAjIGRlZmluZSBEUF9Q
QU5FTF9SRVBMQVlfU1VQUE9SVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDEgPDwgMCkNCj4gPiDC
oCMgZGVmaW5lIERQX1BBTkVMX1JFUExBWV9TVV9TVVBQT1JUwqDCoMKgwqDCoMKgwqDCoCAoMSA8
PCAxKQ0KPiA+IA0KPiA+ICsjZGVmaW5lIERQX1BBTkVMX1BBTkVMX1JFUExBWV9DQVBBQklMSVRZ
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweGIxDQo+ID4gKyMgZGVmaW5lIERQX1BBTkVM
X1BBTkVMX1JFUExBWV9TVV9HUkFOVUxBUklUWV9SRVFVSVJFRCAoMSA8PCA1KQ0KPiA+ICsNCj4g
PiArI2RlZmluZSBEUF9QQU5FTF9QQU5FTF9SRVBMQVlfWF9HUkFOVUxBUklUWcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgMHhiMg0KPiA+ICsjZGVmaW5lIERQX1BBTkVMX1BBTkVMX1JFUExBWV9ZX0dS
QU5VTEFSSVRZwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweGI0DQo+ID4gKw0KPiA+IMKgLyogTGlu
ayBDb25maWd1cmF0aW9uICovDQo+ID4gwqAjZGVmaW5lwqDCoMKgwqDCoMKgwqAgRFBfTElOS19C
V19TRVTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxMDANCj4g
PiDCoCMgZGVmaW5lIERQX0xJTktfUkFURV9UQUJMRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAweDAwwqDCoMKgIC8qIGVEUCAxLjQgKi8NCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+IA0K
PiANCj4gDQoNCg==
