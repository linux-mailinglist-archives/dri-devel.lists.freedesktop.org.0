Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA7632BB9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 19:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4007310E00F;
	Mon, 21 Nov 2022 18:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCD410E00F;
 Mon, 21 Nov 2022 18:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669054053; x=1700590053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QwJ6Muruyx6Kj76eseP252ck4E5EonLPHpilLc/jIqc=;
 b=UBxh4LqlGBVp8256LzMmKst2AybFrfzHzWjee0iQZbMrqgD113DhqW3V
 9dBx97XkIfXyN/9o6N5ZTZz6PqDIo7vmMjheKtf/Jcjil6KYSg93d2l5C
 Dyo+Thh4pwvWZdtUs9U+zJQleI0lG1Ub7fFMnxPgvO3BJGgeSL/t68zRA
 sWb2JXZNEnnG6YKO+qTGxFCPtdr0c9NTDAe0fjdaGvq7QxXhtfv2w6Hnt
 DT7D6Whnp6rto00F3Z9a2kzr91Bw4cetc4x3EJITEL339Ymt/RK/4YyCw
 85jXr0vdv1DIAZnEcFE9G0/Smr+kLn15oo50EDq4wfA8RWEho0rzuwFt8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="315446401"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="315446401"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 10:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="730098904"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="730098904"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2022 10:06:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 10:06:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 10:06:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 21 Nov 2022 10:06:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 21 Nov 2022 10:06:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HK+wr8dgYkv/K7m86+dASrXnuZT/FbJo4PnSvyxYt4Grofw1US5tI2IkIcVV6DoCReREDYyx70tfKAcPSVN0QKxxWxjiHiOHnebPjH4uBhxijziVbZuC1EZ7MkgNb1HqGZ8S9knZDAGGzrpeBqmK7E0isnA2vJEXbPEfFRTS1FX+Q2dpLnJDA+7odt2CelxzU6s4qVOxmq7/aU3idD5gMEBBB1VzmxhPhexLznnsIwf4Agz2gGl2FiJ/LMT1+twJF5Asn2pm9pMaRgNTjYiod3Nw/GRADjh6TEu5rbRPhKaGa9Fv8HdqH+ZnAF4QwxfDTGyhV/sut0oSPAJRLeGbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwJ6Muruyx6Kj76eseP252ck4E5EonLPHpilLc/jIqc=;
 b=jcTZi9cHpaDQ9xJIWKP/TFlcSfCGXGYpAPhQ9tKTa/O4fg6rzA61DPMbB15UWNsPUUXTj2lXbNA/XXHhvDV7JBneHtf5UniPPjnLqSEY1BMZEaO/LL4BZ6ZHietQlPU5oSg2JjuDmqpCSwbu8hJP6uiqJvSvoWUr8hyvZWZs2KYwtPRmrZLoP4+DCkqhiWu09JdgrkD4w2rOqILuWlt8ewHeO9WWhn9L68eBabq+IE1StWPLhPrUgeVqOTSpyvxjF94Cqj9h8jTfkI9jv9BejY0RDfafczLzdTMUElwkL1jh4wYjDHDdIC51n9KMgHME59R3wlk4+Fnr6WXpTrpHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 18:06:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 18:06:48 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v3] drm/i915/mtl: Enable Idle Messaging for GSC CS
Thread-Topic: [PATCH v3] drm/i915/mtl: Enable Idle Messaging for GSC CS
Thread-Index: AQHY+3vOvSF5Aby0v0KE1ozhqswYWq5FArAAgAAyRYCABHwcAA==
Date: Mon, 21 Nov 2022 18:06:47 +0000
Message-ID: <eb0ad13dd566403e9605ecb1197d98c7c0132479.camel@intel.com>
References: <20221118183354.1047829-1-badal.nilawar@intel.com>
 <be06273fc45d5cc758a57c2244a1ba43e26458d3.camel@intel.com>
 <871qq0q6zo.wl-ashutosh.dixit@intel.com>
In-Reply-To: <871qq0q6zo.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|PH7PR11MB6053:EE_
x-ms-office365-filtering-correlation-id: dc70d689-6743-4fa3-b74c-08dacbeb284b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Qls1Oa6sIxFud9dgXhS2JBKxzGHxjFFFUFL1/nxFv1KIzDGLRhMhQjY5zRtuL06YrmHHycpPOsvqP83At3O1j1l68tG+gmCAT18GyCb6O4eePYubmYTu1E1aCiholAPhWrjwnIBj47Vn83rX5WT2qvNjAJvbHJ48QbAcC91n6IHITMftJt0hLbQRAwUDRVJ6P5AXfjOjzd0QY2ubUWDGoOah+6MC0VflKRKbWyHHA5wEHzV93SHEHJBd9eNngeKngmydz4X2FIjizwaprGQPdv2DGU3SOaNW6CGvXXbLVLZYYi9Dwk0NJODjQNaSbX1AWzvYpSYKzV3s2XNAuwj/PpphB01DwdZMQcutoGRTgHeVwIkixQfXhbjfYpkgEwJnNTe7E8cab6vrigg+3XGXQ5hS+ePZDcBic+tcroHD2x6sPC8c1071ChRlZCWnQwFMi+qTZi24dQJSi/4iYWqpgqVVWdcBrc5Ewt9LogIOMkdRegvype34ZIkXHgu2PypywNtfSNp2oMBX90Se45hBbd8V9PVD7zlCu8DEafzkwbAO/mi4nKTClgwCt+tFWETXa1Dv3yqoReYiPthVE1LoOzQ5uF6dLLujjT53tPgrgtD8d9OJx7gHY6f53Bec+AjZSGJOhttoTZ1BcaV9iPBEqUhdezRSMqc3q4AcijtECm7SEshIBhDDcITKWUGOKBu5imwDSajHLYsl//dt4ajhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(38100700002)(122000001)(83380400001)(38070700005)(86362001)(8676002)(4001150100001)(8936002)(6862004)(82960400001)(4326008)(2906002)(41300700001)(66446008)(66476007)(66556008)(5660300002)(26005)(107886003)(6512007)(6506007)(71200400001)(2616005)(37006003)(316002)(6636002)(450100002)(54906003)(91956017)(64756008)(186003)(478600001)(76116006)(66946007)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2dNQzNsbVp4bDBmSmxjNEp3dktiaHdTNFlVb1B3OCtUL29uTkRqZXp6Qmxo?=
 =?utf-8?B?TCtIeGYwSkIvZjBFeWdtWnNxUWxtUHFqbExFcjBneEpHL1Nzc0hRZkQ1U3Zz?=
 =?utf-8?B?REt4TnlzUTVnMHI5SXJXVndHaHJwMkxobFl6QlUvcjdLRnBBYjExa0FGbVFV?=
 =?utf-8?B?czljQkMzV3BsekpSMElOQmNwOW13OTZqOE1uSEMwWkE1djY0V2pLSUlZSEcw?=
 =?utf-8?B?NUJ0S0EwN1BVZW5kYTUzb05WaktuV01nL0NIU0Zna3ZZOXpHKzJHSTRRUUJa?=
 =?utf-8?B?RVVsTHpXTU1DV1MzOWZOTDdxaVVkK2tVdC9TcDNDazRTR3BqZ1FtL1VFSjVU?=
 =?utf-8?B?VmV1b2ovVklJUGR0OUlZTkI4Um9kT3h0TmFTZ0NSWjFqK3VvMHg0dlQ2OXo4?=
 =?utf-8?B?dXRxemZRUUtUNDdydnhJT3BleVEyUUpvVHVSVS9uMFYxdzJkdi91UWhDNk5z?=
 =?utf-8?B?MysvS3RYOFlHbDRJWHhOQTlDN0JEQUt1Nm5XKzF2aHQxWkVQK0hoNFNUN1Ns?=
 =?utf-8?B?cEdzSndRMk10eXhucmNYeld4aW4wMVRaTktQZElXWmsrL09HR2N3YlZzUUw5?=
 =?utf-8?B?U1NDcnhJZzZ2TUZUY3ZVdnYwRVNlMHJuOXE1aTJ5anpRRjFIR3dJTnNSMDJE?=
 =?utf-8?B?c0RnSzhndXduRHg4NjR3NFpuUG9JdDg4K3BWR1huLzQ0RUI1c0NiNHA0a1FX?=
 =?utf-8?B?WkVDVld2QnhtajhnNnczVGw5L0ZMUHdjQ21hcnZjeHZrVVpJTVJMVVR6Zjla?=
 =?utf-8?B?NWpYbVgxdlF5a2VXOUFEV0M4Q2Y1ZVJ5bThSTUVORkhSOXljK3FMM0d6bjZx?=
 =?utf-8?B?ay9QLyswbTl0NlBUTGljREwzRnJ2THA3ajVGVHNMTXZySUZPRFllVnY3cG1k?=
 =?utf-8?B?MzY2cSttS3VqVVdWcjFpNWRQQUg4MFlQNklweEE3YW1mVVVNWi9VZHRNeTh2?=
 =?utf-8?B?YmIzZDluSUZIV3dEUHdZWFVBdlNvSTFLUEZQRFpPckNOT2hLNDVmT2t4K0RG?=
 =?utf-8?B?di9VM0s4YmNJK1I2dDErUzRLZVoyZzZCd0poYVJsTHBjY2N1eU15cWRBTlFH?=
 =?utf-8?B?NENjRU56ejUyMHQ0QzJnZ1hFWCtldFR2bUhNQ0JzZDcxcFd2eWExSnVCeUJy?=
 =?utf-8?B?S2JtNGJ2bU5MQWgzeEZpK29QMUQyZjhlU012aHFOQXVnTVA0VDdCOXZQWVRO?=
 =?utf-8?B?eU16RVdqVHhJTXU3UTlndGVSOGhWOGJpY2xZK0o1N1E1ZnR6UmxuTFY4UG5k?=
 =?utf-8?B?VHZBV2V1TGdVdTdSbjhHVW1TMXFGK3c5VGx5d0s4bkwrU2hQcGZTWlpNMHF4?=
 =?utf-8?B?WGFJYmtJRWlxa3BsTXcxMjdQaTVUR0ZIcWRBaGpNM2FYdzJCd1NPRTRsNWhX?=
 =?utf-8?B?ZTcvYVFhNEVtYkR0TnNUTE42eXlzeWdCSWF4bUNiR0FxZlFiZC9wNy8rKzBr?=
 =?utf-8?B?REx5cXBucCs0TEp1eTRjMjVLN1hDRFVrL2xQTXhFZ3R1cnhyM08zM0dadS9H?=
 =?utf-8?B?ZC9kdEQ2WC9DbVArQkVTRTNHdUtHVDQrVTlNYXQ4RHo1UHY1YVFaekd4blJ0?=
 =?utf-8?B?YVYxRTlwVW5EakZ4MVZ3NDBER3NJNTJ6cVNqRGpPRkl1U1pUeW5XaUdoczVV?=
 =?utf-8?B?VU1Tdm9HTmpBanZnR3VMV1dPM0hoNUFQd245Vk5XdzgyQW5kZ2dDMWltSDdY?=
 =?utf-8?B?eEZYYTAremxIMWhDR2FQUTRqVXRCcklES0xvdG5iMXc5WlBHNFlFektkWm5X?=
 =?utf-8?B?UU5WUGVVdkFTd2ZlSlMwVjY0M0JmNFM3ZnhkYUNrZzhxTlZzN2orNG9pNktV?=
 =?utf-8?B?RWE0a290cE9BdmxCT1h4OWVkWEthbjB3ZVplRENWVVpWNGlKQmNiUkdSMmlV?=
 =?utf-8?B?ODBVbEtQWEdiY01LdWY4a1dzdUpWbG95NDlMQ1VUMmt2LzRxNjJsOWpUSVpR?=
 =?utf-8?B?OVhaajJGK1BuVjlJbWNTanp0WUxNR3dsWHFKSE1ram91WE1iSU9uVlVOdjln?=
 =?utf-8?B?a1hpT1VSTTAza1huWWR1R05BVGlxU051MXZyOFpRL1g4WUdmWGxJS29xTXlB?=
 =?utf-8?B?RkxLVmZ2OXU5Z2lGcEExN05vQkFSWEd5YmVIOU9vQ2lNbFZ2YVBCUm9HNDc3?=
 =?utf-8?B?VWZGOTFUMk1tMTBmbUprTHBJdStmejdyZ0U0RDFQeGpnR3lTM2JzSGVrMHVx?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82F0F02627E1284BB441CAD3406168DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc70d689-6743-4fa3-b74c-08dacbeb284b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 18:06:47.9994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m/HoZE9bvnB1f9GDkxUCdEjZVrobA2dimeuWh0W6rMjABEhXH1j5Lpsfg+7ZjqHAv5qyswwQEwwXxCzmHTrZAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ewins,
 Jon" <jon.ewins@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTExLTE4IGF0IDEzOjM3IC0wODAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIEZyaSwgMTggTm92IDIwMjIgMTA6Mzc6MzcgLTA4MDAsIFZpdmksIFJvZHJpZ28gd3Jv
dGU6DQo+ID4gDQo+ID4gT24gU2F0LCAyMDIyLTExLTE5IGF0IDAwOjAzICswNTMwLCBCYWRhbCBO
aWxhd2FyIHdyb3RlOg0KPiA+ID4gRnJvbTogVmluYXkgQmVsZ2F1bWthciA8dmluYXkuYmVsZ2F1
bWthckBpbnRlbC5jb20+DQo+ID4gPiANCj4gPiA+IEJ5IGRlZmF1dCBpZGxlIG1lc3NhZ2luZyBp
cyBkaXNhYmxlZCBmb3IgR1NDIENTIHNvIHRvIHVuYmxvY2sgUkM2DQo+ID4gPiBlbnRyeSBvbiBt
ZWRpYSB0aWxlIGlkbGUgbWVzc2FnaW5nIG5lZWQgdG8gYmUgZW5hYmxlZC4NCj4gPiA+IA0KPiA+
ID4gdjI6DQo+ID4gPiDCoC0gRml4IHJldmlldyBjb21tZW50cyAoVmluYXkpDQo+ID4gPiDCoC0g
U2V0IEdTQyBpZGxlIGh5c3RlcmVzaXMgYXMgcGVyIHNwZWMgKEJhZGFsKQ0KPiA+ID4gdjM6DQo+
ID4gPiDCoC0gRml4IHJldmlldyBjb21tZW50cyAoUm9kcmlnbykNCj4gPiA+IA0KPiA+ID4gQnNw
ZWM6IDcxNDk2DQo+ID4gPiANCj4gPiA+IENjOiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5p
ZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogVmluYXkg
QmVsZ2F1bWthciA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBCYWRhbCBOaWxhd2FyIDxiYWRhbC5uaWxhd2FyQGludGVsLmNvbT4NCj4gPiA+IFJldmll
d2VkLWJ5OiBWaW5heSBCZWxnYXVta2FyIDx2aW5heS5iZWxnYXVta2FyQGludGVsLmNvbT4NCj4g
PiANCj4gPiBIZSBpcyB0aGUgYXV0aG9yIG9mIHRoZSBwYXRjaCwgbm8/IQ0KPiA+IG9yIHlvdSBj
YW4gcmVtb3ZlIHRoaXMgb3IgY2hhbmdlIHRoZSBhdXRob3IgdG8gYmUgeW91IGFuZCBrZWVwIGhp
cw0KPiA+IHJldmlld2VkLWJ5Li4uDQo+ID4gDQo+ID4gb3IgSSBjYW4ganVzdCByZW1vdmUgaGlz
IHJ2LWIgd2hpbGUgbWVyZ2luZy4uIGp1c3QgbGV0IG1lIGtub3cuLg0KPiANCj4gTm90IHN1cmUg
aWYgdGhhdCBpcyB0aGUgY2FzZSBoZXJlLA0KDQp5ZWFwLCB0aGlzIGlzIHRvbyBzbWFsbCBwYXRj
aCBmb3IgdGhhdCB0byBoYXBwZW4uDQoNCj4gIGJ1dCB3aGVuIG11bHRpcGxlIHBlb3BsZSBjb250
cmlidXRlIHRvIGENCj4gcGF0Y2gsIHRoZSBvcmlnaW5hbCBhdXRob3IgY2FuIHJldmlldyBjaGFu
Z2VzIGJ5IG90aGVycyBhbmQgYWRkIGhpcw0KPiBSZXZpZXdlZC1ieSwgbm8/IE9yIGFyZSB3ZSBz
YXlpbmcgaXQgaXMgcmVkdW5kYW50IGZvciB0aGUgYXV0aG9yIHRvDQo+IGFkZCBoaXMNCj4gUi1i
Pw0KPiANCj4gU2ltaWxhcmx5LCBhcmUgUy1vLWIgYW5kIFItYiBieSB0aGUgc2FtZSBwZXJzb24g
b2s/IEkgYWRkIGNoYW5nZXMgdG8NCj4gc29tZW9uZSdzIHBhdGNoIHNvIGFkZCBteSBTLW8tYiBi
dXQgYWxzbyByZXZpZXcgb3RoZXIncyBjaGFuZ2VzIHNvDQo+IGFkZCBteQ0KPiBSLWI/IFNvbWV0
aW1lcyBmaW5kaW5nIGEgM3JkIHBlcnNvbiB0byBhZGQgYSBSLWIgaXMgaGFyZC4gQnV0IHR3bw0K
PiBwb2VwbGUNCj4gY2FuIGNvbnRyaWJ1dGUgdG8gYSBwYXRjaCBhbmQgcmV2aWV3IGVhY2ggb3Ro
ZXIncyBjaGFuZ2VzIHNvIGFkZCBib3RoDQo+IHRoZWlyDQo+IFMtby1iJ3MgYW5kIFItYidzIG9y
IG5vPw0KDQpEZWZpbml0ZWx5IGEgY2FzZSBieSBjYXNlIHRoaW5nLiBJZiB0aGF0IGhhcHBlbnMg
aXQgaXMgZ29vZCB0byBoYXZlIGl0DQpjbGVhcmx5IHdyaXR0ZW4gaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIHRvIGtub3cgd2hvIGRpZCB3aGF0LCB3aG8NCnJldmlld2VkIHdoYXQuDQoNCkFsdGhvdWdo
IEknZCBzYXkgdGhhdCBJJ2Qgc3RpbGwgcHJlZmVyIHRoZSBjby1hdXRob3JlZC1ieSBhbmQgaGF2
aW5nIGENCnRoaXJkIG9uZSBkb2luZyB0aGUgZnVsbCByZXZpZXcuDQoNCj4gDQo+IDopDQo+IA0K
PiBBc2h1dG9zaA0KPiANCg0K
