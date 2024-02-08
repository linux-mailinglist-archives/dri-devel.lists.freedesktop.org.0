Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085C84E3E1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E85710E8C7;
	Thu,  8 Feb 2024 15:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayGb6hGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DB510E8C7;
 Thu,  8 Feb 2024 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707405560; x=1738941560;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hACLJLKxkVxAHgtcy9ho8NIOpf/dAZa9XfHbulfX0io=;
 b=ayGb6hGnnFneJ3Mq8ljvqS/MHIzswfpAuKtfa6afE16OyUUGEuklj9R0
 t7Cklb+4b+hkeF9NZntZrTYmLbH/f4xJ75hayh9Dh+K9dFrkefsrEY5yC
 Y3Jk1nHao2UO5vivszDBueACalcxaMUOR2fjO+8bM05iS9kk6GUQiDTkf
 LnlDkygHXNOxTQaaIpnMVaWiLAYKXZlA5aE86odMbQpwerzlZZohTuDdO
 YR8dlIUn2CNW2Liwc/q4SjW6XZFBZTJwGJ8zIXtZiFrc79rzUpkR/0nru
 x/W2ONNSxVSHZep6YPggCJNQ3PwSYXew+mVDav+Ve4XvUky0m+0T2SFEA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5024507"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="5024507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 07:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="39111772"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 07:19:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 07:19:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 07:19:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 07:19:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 07:19:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aphnzsnnXa8TLRZ1cyHYGAJPdfhbB0ZQtVHeZYNlDpWdf1Y8iFG/M52hwv7pLwhPtwn7RJmZrsAI8ESO/EPdUI9oXflQ8UWRKVhkZVESYcPFOZKCZwAbctaBfKlQTbTa+BC57hr9CByJp4QWeAbpTsfZc94R9tmEmx0lbapoRYpHO6vBBAk6F27oqb5LZN6OPCefYrffPG+3Izwof3hVALLgOGaiwvWieUUyDfHYMH6UwHTXlcyNXrN3vjkH84BWF7FVRQojZcRqtVnF5ABhDWDa/jq5N7vge9gJDFXzrugbSTWwQmeroVO3SJerx560FkXSATaItjMgWByKCzUGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hACLJLKxkVxAHgtcy9ho8NIOpf/dAZa9XfHbulfX0io=;
 b=OTWiInUVYcGL6Nx5xlgNww2ZNu9zCqHhr6aWaBqJvjwGdq15WRRpSv7QbDw7vdPKfmT+BpeI2xEr9c6QvXIeCMpDgf1CBfTR5g/OSrdX0oJw5KNhUCCTatGdPlj4l+h6DSKuR7O+CAydqCCb64kSb7hm16SEKtlUmGcJj2eicPGMjNTY5GLM7QgnxSbdlnpYBQawEDpnZ6HFtv0HbnR2DgYMWslltVDN9LgV5gFHWehXyfVH1fsdKlWfar9BTDwmXeSPk8Or8GUuRZchkfkJNpMFUuKDX5ZuAt7v/xZ7sR1QsVvizEKsdtrGVzbV1892NdatwYbena3Vi9+xiJT1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BN9PR11MB5560.namprd11.prod.outlook.com (2603:10b6:408:105::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 15:19:10 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630%7]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 15:19:10 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Zanoni, Paulo R"
 <paulo.r.zanoni@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Ghuge, Sagar"
 <sagar.ghuge@intel.com>, "Balasubrawmanian, Vivaik"
 <vivaik.balasubrawmanian@intel.com>, "kenneth@whitecape.org"
 <kenneth@whitecape.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: Re: [PATCH v2] drm/i915: Add GuC submission interface version query
Thread-Topic: [PATCH v2] drm/i915: Add GuC submission interface version query
Thread-Index: AQHaWmhhgwFANVHU4kmlLC0PYFc33rEAgdiAgAAIDQCAAAWcAA==
Date: Thu, 8 Feb 2024 15:19:10 +0000
Message-ID: <5daf0215abaf92d9b34fef732d1be010d59bd69c.camel@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
 <20240208082510.1363268-1-tvrtko.ursulin@linux.intel.com>
 <8a0a964cc1312e5fcccf0850d72e6374bb578943.camel@intel.com>
 <db762e07-a5e1-4c47-b1b6-85742ce6498b@linux.intel.com>
In-Reply-To: <db762e07-a5e1-4c47-b1b6-85742ce6498b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BN9PR11MB5560:EE_
x-ms-office365-filtering-correlation-id: 0ab1718c-a8d6-4975-231a-08dc28b94cfd
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5UNCyqznJcD94p3ZgtnWHcDv9Cw9UAD2Os/A8WrjIL9Vnyx+qk2fh1L+i6LclH6KKj+/h+txVh1rEwR5aQTaPB6M/b+/LBoUHY4pjhUSsvREX9Q2HXxe2agyd8nM5qoVF26++R7NPiE9w8eufiA1pE0oWxrkq4Uw7/vvj4r5nkSgn6iXFdQecUv4RhSvBkxQ9gZGi+m1u1PUWENBzOfXpgilo80JLEmbqiouH2MajpMK/6xuNygIdAfXDyw9rZvhgd1gvMxqE2J/dgwCAqCwAOqDbC/CqwhwNQjdT2kOdpzqjbtEdf0v0PYJ9ocs0URInCT6RMMe0sZiSJ0rpNglIlJaHmmR2OKL7gfLm39YgRuQXvwK0aSco0iiDZom909L0A81nw/cvLURryx0prOzHPGL3kSDSxvsDI4OWW7iOOgV6RqJG4MshybVBn840kzrZPQTpQlH8I/AQTTk1hIGOPUDRMVPbuTNXq5pFvT6wPOMfO6rEXC2P5GZafhf0+L7d17pvGFmAGu59ZMAsbhbi3ptM7Dj9H5oEOxeTzI6xjwoGRp70L43XyBrrzENKhK12iHreXkdDyYb5N2trEffjhhdi/HceRcxoiftelL+DNo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(2906002)(5660300002)(41300700001)(82960400001)(83380400001)(122000001)(26005)(86362001)(38100700002)(2616005)(54906003)(64756008)(53546011)(6506007)(110136005)(66556008)(66446008)(66476007)(71200400001)(66946007)(478600001)(966005)(6486002)(6512007)(76116006)(36756003)(8676002)(8936002)(4326008)(38070700009)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2FPeXpMdnNjenFjV2xabC9lODZxYUdEQmd1Nk1OMURpTklRVnRsSTJuN1Iz?=
 =?utf-8?B?MkxxQkxWbm0vM3cyK0tHYTFKUDNNZGF5dXE4N2VvU0NPY3ltTnRZY0U5V2ZQ?=
 =?utf-8?B?eUgwbUdzdVkxeDA3NzFYMEh5TVF2OHJ6L2czTHhWaFQvRXREZy82b2RpRDI1?=
 =?utf-8?B?ZWJBVnlzejNXRVV2dGZGbXIwYURoMVFrYVhJY3N2ZmcxRGtXaWQ0K0JyT0h0?=
 =?utf-8?B?TFdSUUF3RXRQTUVyZXNSVW1vMlBHbUJsMEpFLzJxemZ0OU1ZVlJ2a080cll1?=
 =?utf-8?B?d21Tb1FWWkw4WTVCbHRZU29ReGozNGhuSzVKektJby85YUo3akcwa0VrSHFu?=
 =?utf-8?B?Yk1EeVB3QVBYR2NVVE11MmRmbWNKcWprQk9vNE9PRGVsbVFVMTl6M2N6MFZw?=
 =?utf-8?B?ZFVYV1MvM200RTB5L2tZL2FLRFZ1MDYxbVdSRlA0TmpjVzE0MUkrQnVzOHhi?=
 =?utf-8?B?WlB1MUwwenk2ekNoeDgzajF4RnBqeTJGcUphRDlsTVdjSkM0aU85ZXRvYWVm?=
 =?utf-8?B?aVlhQU5abHJVeWxibHIyMUQvNHI4cDJYeXZCVFYybDFSeHdORG43Ykczb29y?=
 =?utf-8?B?TmlaU0s1SlRETjVNeHRhRVM5c2pOQlNPN05sQ2F0dmtIQVFNRW5ldWJVV3c0?=
 =?utf-8?B?aGhldkhZRWFVU0txdTF3OEtlVHBJR3Z0azJ1bGZaT0IwaGR5d0kvajB0MEZ4?=
 =?utf-8?B?TkFadnQya2JRUUYyZlY0Yyt0dlF1SFBYTkliRXhjVUlKUENhSFJUKzIwcDJJ?=
 =?utf-8?B?bDB5bTFtaVJMZXlRUlhpS1U0dW1HQ2E2UTY1RzA3c3VjcEx0Q0g3YzBmRDMv?=
 =?utf-8?B?dXpYMDA2NTVKT3FCZCtiVmw3bXNyNXFMdXRCUG9Ta2NPanJ4aTRrei9jWWxG?=
 =?utf-8?B?RHM0NjNlMVBvM05YSmdDdlRTd2R4WTNERmNQU1dvRDN2QlBqS1FwNzVmYUdQ?=
 =?utf-8?B?L3ZudkFZQ0I2T3FIRnFjUlZJWno1eEp1WFV5MUpJRUZCOTYxMHRaN3ZzNm5r?=
 =?utf-8?B?cFNqWjRmV0lmeTZ5aGoreWp2U2lhWnV4eUkvY3FoazdrSkgyZnZTMzVoUWU0?=
 =?utf-8?B?bkk1R0E0aTZ1clV2cWFWTXArdEVhaG52U3I3TnN1Q1pqODRWbGdtSWdiQUxz?=
 =?utf-8?B?UU9SbmtHN3U2MVFDR0k3cFRiU3h1U2dwN1dveWs1Z3BWcUx1d2RpRVAzd1hq?=
 =?utf-8?B?cUV0TE5aeTNwNkl1VFRJd3ZOWjU3Y1R1dGdqUHRTQWRxR0hieGN0cXR4UURk?=
 =?utf-8?B?Qk92alBKTTFueHhUaXBZOFBkM3NuYlVkNm9SWlo4dWxNQWlGOXpWUFEzVEov?=
 =?utf-8?B?VEVuYXRMYktJQ2FzSXR2TWpHUjBDVVpmdmVXOS9oNWc4NlhSNEIrNEF1T3cx?=
 =?utf-8?B?UVZPd1B3ZldxSDNHRDN3MUdkSHl3UEVlVDA0M216MGRoRERabFhnbkNWWnYr?=
 =?utf-8?B?ZlE2RUtPQkNna3NzSVRPeDNJMlNmd0d3UDlMbjhEbDMvOGdOWFBIeEQ5WE5F?=
 =?utf-8?B?NzVCTVBkT0laK2R5K0tsb2xwWldndGwvS3Y2Ly84RXhlTkVkVE5SOGhXVWk5?=
 =?utf-8?B?aW8rMWJGWXM1cFFEMnNmaVFyS0xhaEI2TzY1THM4VkdjN3p0Y0tqaEE2dDhm?=
 =?utf-8?B?Q05IeERlYU5qSFJ3MTIzbUZwejBTQnFaUDI3dytTOFhidHYvNGh2alJLaWF0?=
 =?utf-8?B?VkM3MFBvc3JQOHNELzdTSUM0UmxSWGV4Z3VhYnNXbGI4VlpCK241dytpV2dS?=
 =?utf-8?B?dHlhR2JZZCt5cEkrRzIwNkpRKzdGTW5kZzB0Y0Ezbzg1aHNmbkFNK1ZoNGJh?=
 =?utf-8?B?VEE0SkNuV1ZrK0diM1p4bGZpaFMzcG5QaTBJWWpEa2YxcCtrbFA4Uy84ZjB6?=
 =?utf-8?B?WEt0Y3B2ZTY0R2k3OXdxenVsWUJjdHhQaWkwZ0x6bnVPeTg5Z0JRdndQd2VF?=
 =?utf-8?B?Y3dUcW0wRU82Ni85amdZWjNUSTRYK2hYOXhKY2ZjV09sN1VGYmZxdjU1NUh5?=
 =?utf-8?B?aEVMakZjNVNJNXJDWUN3Y0R5SDlIUU5PWXhLMUpwVjVGOUVVVUkvbkQ0cEZi?=
 =?utf-8?B?M2M0S1pjaTlwekl3TTZhRmMrWDRPRUJScHFFTWh2VXVGWWlKM20yVUFtNDY3?=
 =?utf-8?B?d2JHOUk1QTgwYVhOMzFqaXY0WlYvSk1Ma2FXUk8wbWFCRzBKa1V1ZXR5NHBp?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DC1E5C6CED10B459FAB91B130D849F1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab1718c-a8d6-4975-231a-08dc28b94cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 15:19:10.5374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7FCM2BlyBfdUihKWhO4tXxFJ6ipPU0Ml8UnhQgM5SSwgz4tZxHWQ7i8yADXJnclJvXjDGoK2+uS2YADl2dfHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5560
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDI0LTAyLTA4IGF0IDE0OjU5ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gT24gMDgvMDIvMjAyNCAxNDozMCwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gT24gVGh1LCAy
MDI0LTAyLTA4IGF0IDA4OjI1ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToNCj4gPiA+IEZy
b206IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQo+ID4gPiANCj4g
PiA+IEFkZCBhIG5ldyBxdWVyeSB0byB0aGUgR3VDIHN1Ym1pc3Npb24gaW50ZXJmYWNlIHZlcnNp
b24uDQo+ID4gPiANCj4gPiA+IE1lc2EgaW50ZW5kcyB0byB1c2UgdGhpcyBpbmZvcm1hdGlvbiB0
byBjaGVjayBmb3Igb2xkIGZpcm13YXJlIHZlcnNpb25zDQo+ID4gPiB3aXRoIGEga25vd24gYnVn
IHdoZXJlIHVzaW5nIHRoZSByZW5kZXIgYW5kIGNvbXB1dGUgY29tbWFuZCBzdHJlYW1lcnMNCj4g
PiA+IHNpbXVsdGFuZW91c2x5IGNhbiBjYXVzZSBHUFUgaGFuZ3MgZHVlIGlzc3VlcyBpbiBmaXJt
d2FyZSBzY2hlZHVsaW5nLg0KPiA+ID4gDQo+ID4gPiBCYXNlZCBvbiBwYXRjaGVzIGZyb20gVml2
YWlrIGFuZCBKb29uYXMuDQo+ID4gPiANCj4gPiA+IENvbXBpbGUgdGVzdGVkIG9ubHkuDQo+ID4g
PiANCj4gPiA+IHYyOg0KPiA+ID4gICAqIEFkZGVkIGJyYW5jaCB2ZXJzaW9uLg0KPiA+IA0KPiA+
IFJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCj4gPiBUZXN0ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50
ZWwuY29tPg0KPiA+IFVNRDogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVz
YS8tL21lcmdlX3JlcXVlc3RzLzI1MjMzDQo+IA0KPiBUaGFua3MsIGJ1dCBwbGVhc2Ugd2UgYWxz
byBuZWVkIHRvIGNsb3NlIGRvd24gb24gdGhlIGJyYW5jaCBudW1iZXIgDQo+IHNpdHVhdGlvbi4g
SS5lLiBiZSBzdXJlIHdoYXQgaXMgdGhlIGZhaWx1cmUgbW9kZSBpbiBzaGlwcGluZyBNZXNhIHdp
dGggDQo+IHRoZSBjaGFuZ2UgYXMgaXQgc3RhbmRzIGluIHRoZSBNUiBsaW5rZWQuIFdoYXQgcGxh
dGZvcm1zIGNvdWxkIHN0YXJ0IA0KPiBmYWlsaW5nIGFuZCB3aGVuLCBkZXBlbmRpbmcgb24gR3VD
IEZXIHJlbGVhc2UgZXZlbnR1YWxpdGllcy4NCg0KeWVzLCBJIGhhdmUgYXNrZWQgSm9obiBIYXJy
aXNvbiBmb3IgYSBkb2N1bWVudGF0aW9uIGxpbmsgYWJvdXQgdGhlIGZpcm13YXJlIHZlcnNpb25p
bmcuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBUdnJ0a28NCj4gDQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPg0KPiA+ID4gQ2M6
IEtlbm5ldGggR3JhdW5rZSA8a2VubmV0aEB3aGl0ZWNhcGUub3JnPg0KPiA+ID4gQ2M6IEpvc2Ug
U291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IFNhZ2FyIEdodWdlIDxzYWdh
ci5naHVnZUBpbnRlbC5jb20+DQo+ID4gPiBDYzogUGF1bG8gWmFub25pIDxwYXVsby5yLnphbm9u
aUBpbnRlbC5jb20+DQo+ID4gPiBDYzogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQElu
dGVsLmNvbT4NCj4gPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+
DQo+ID4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiA+IENj
OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPg0KPiA+ID4gQ2M6IFZp
dmFpayBCYWxhc3VicmF3bWFuaWFuIDx2aXZhaWsuYmFsYXN1YnJhd21hbmlhbkBpbnRlbC5jb20+
DQo+ID4gPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwu
Y29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcXVlcnku
YyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICAgaW5jbHVkZS91
YXBpL2RybS9pOTE1X2RybS5oICAgICAgIHwgMTIgKysrKysrKysrKysNCj4gPiA+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3F1ZXJ5LmMNCj4gPiA+IGluZGV4IDAwODcxZWY5OTc5Mi4uZDRkYmExMjQwYjQwIDEwMDY0
NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9xdWVyeS5jDQo+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMNCj4gPiA+IEBAIC01NTEsNiAr
NTUxLDM4IEBAIHN0YXRpYyBpbnQgcXVlcnlfaHdjb25maWdfYmxvYihzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqaTkxNSwNCj4gPiA+ICAgCXJldHVybiBod2NvbmZpZy0+c2l6ZTsNCj4gPiA+ICAg
fQ0KPiA+ID4gICANCj4gPiA+ICtzdGF0aWMgaW50DQo+ID4gPiArcXVlcnlfZ3VjX3N1Ym1pc3Np
b25fdmVyc2lvbihzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwNCj4gPiA+ICsJCQkgICAg
IHN0cnVjdCBkcm1faTkxNV9xdWVyeV9pdGVtICpxdWVyeSkNCj4gPiA+ICt7DQo+ID4gPiArCXN0
cnVjdCBkcm1faTkxNV9xdWVyeV9ndWNfc3VibWlzc2lvbl92ZXJzaW9uIF9fdXNlciAqcXVlcnlf
cHRyID0NCj4gPiA+ICsJCQkJCSAgICB1NjRfdG9fdXNlcl9wdHIocXVlcnktPmRhdGFfcHRyKTsN
Cj4gPiA+ICsJc3RydWN0IGRybV9pOTE1X3F1ZXJ5X2d1Y19zdWJtaXNzaW9uX3ZlcnNpb24gdmVy
Ow0KPiA+ID4gKwlzdHJ1Y3QgaW50ZWxfZ3VjICpndWMgPSAmdG9fZ3QoaTkxNSktPnVjLmd1YzsN
Cj4gPiA+ICsJY29uc3Qgc2l6ZV90IHNpemUgPSBzaXplb2YodmVyKTsNCj4gPiA+ICsJaW50IHJl
dDsNCj4gPiA+ICsNCj4gPiA+ICsJaWYgKCFpbnRlbF91Y191c2VzX2d1Y19zdWJtaXNzaW9uKCZ0
b19ndChpOTE1KS0+dWMpKQ0KPiA+ID4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ID4gPiArDQo+ID4g
PiArCXJldCA9IGNvcHlfcXVlcnlfaXRlbSgmdmVyLCBzaXplLCBzaXplLCBxdWVyeSk7DQo+ID4g
PiArCWlmIChyZXQgIT0gMCkNCj4gPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gPiArDQo+ID4gPiAr
CWlmICh2ZXIuYnJhbmNoIHx8IHZlci5tYWpvciB8fCB2ZXIubWlub3IgfHwgdmVyLnBhdGNoKQ0K
PiA+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiArDQo+ID4gPiArCXZlci5icmFuY2ggPSAw
Ow0KPiA+ID4gKwl2ZXIubWFqb3IgPSBndWMtPnN1Ym1pc3Npb25fdmVyc2lvbi5tYWpvcjsNCj4g
PiA+ICsJdmVyLm1pbm9yID0gZ3VjLT5zdWJtaXNzaW9uX3ZlcnNpb24ubWlub3I7DQo+ID4gPiAr
CXZlci5wYXRjaCA9IGd1Yy0+c3VibWlzc2lvbl92ZXJzaW9uLnBhdGNoOw0KPiA+ID4gKw0KPiA+
ID4gKwlpZiAoY29weV90b191c2VyKHF1ZXJ5X3B0ciwgJnZlciwgc2l6ZSkpDQo+ID4gPiArCQly
ZXR1cm4gLUVGQVVMVDsNCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiArfQ0KPiA+
ID4gKw0KPiA+ID4gICBzdGF0aWMgaW50ICgqIGNvbnN0IGk5MTVfcXVlcnlfZnVuY3NbXSkoc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LA0KPiA+ID4gICAJCQkJCXN0cnVjdCBkcm1f
aTkxNV9xdWVyeV9pdGVtICpxdWVyeV9pdGVtKSA9IHsNCj4gPiA+ICAgCXF1ZXJ5X3RvcG9sb2d5
X2luZm8sDQo+ID4gPiBAQCAtNTU5LDYgKzU5MSw3IEBAIHN0YXRpYyBpbnQgKCogY29uc3QgaTkx
NV9xdWVyeV9mdW5jc1tdKShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsDQo+ID4g
PiAgIAlxdWVyeV9tZW1yZWdpb25faW5mbywNCj4gPiA+ICAgCXF1ZXJ5X2h3Y29uZmlnX2Jsb2Is
DQo+ID4gPiAgIAlxdWVyeV9nZW9tZXRyeV9zdWJzbGljZXMsDQo+ID4gPiArCXF1ZXJ5X2d1Y19z
dWJtaXNzaW9uX3ZlcnNpb24sDQo+ID4gPiAgIH07DQo+ID4gPiAgIA0KPiA+ID4gICBpbnQgaTkx
NV9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGUpDQo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9pOTE1
X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oDQo+ID4gPiBpbmRleCA1NTBjNDk2
Y2U3NmQuLjg0ZmI3ZjdlYTgzNCAxMDA2NDQNCj4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0v
aTkxNV9kcm0uaA0KPiA+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oDQo+ID4g
PiBAQCAtMzAzOCw2ICszMDM4LDcgQEAgc3RydWN0IGRybV9pOTE1X3F1ZXJ5X2l0ZW0gew0KPiA+
ID4gICAJICogIC0gJURSTV9JOTE1X1FVRVJZX01FTU9SWV9SRUdJT05TIChzZWUgc3RydWN0IGRy
bV9pOTE1X3F1ZXJ5X21lbW9yeV9yZWdpb25zKQ0KPiA+ID4gICAJICogIC0gJURSTV9JOTE1X1FV
RVJZX0hXQ09ORklHX0JMT0IgKHNlZSBgR3VDIEhXQ09ORklHIGJsb2IgdUFQSWApDQo+ID4gPiAg
IAkgKiAgLSAlRFJNX0k5MTVfUVVFUllfR0VPTUVUUllfU1VCU0xJQ0VTIChzZWUgc3RydWN0IGRy
bV9pOTE1X3F1ZXJ5X3RvcG9sb2d5X2luZm8pDQo+ID4gPiArCSAqICAtICVEUk1fSTkxNV9RVUVS
WV9HVUNfU1VCTUlTU0lPTl9WRVJTSU9OIChzZWUgc3RydWN0IGRybV9pOTE1X3F1ZXJ5X2d1Y19z
dWJtaXNzaW9uX3ZlcnNpb24pDQo+ID4gPiAgIAkgKi8NCj4gPiA+ICAgCV9fdTY0IHF1ZXJ5X2lk
Ow0KPiA+ID4gICAjZGVmaW5lIERSTV9JOTE1X1FVRVJZX1RPUE9MT0dZX0lORk8JCTENCj4gPiA+
IEBAIC0zMDQ2LDYgKzMwNDcsNyBAQCBzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfaXRlbSB7DQo+ID4g
PiAgICNkZWZpbmUgRFJNX0k5MTVfUVVFUllfTUVNT1JZX1JFR0lPTlMJCTQNCj4gPiA+ICAgI2Rl
ZmluZSBEUk1fSTkxNV9RVUVSWV9IV0NPTkZJR19CTE9CCQk1DQo+ID4gPiAgICNkZWZpbmUgRFJN
X0k5MTVfUVVFUllfR0VPTUVUUllfU1VCU0xJQ0VTCTYNCj4gPiA+ICsjZGVmaW5lIERSTV9JOTE1
X1FVRVJZX0dVQ19TVUJNSVNTSU9OX1ZFUlNJT04JNw0KPiA+ID4gICAvKiBNdXN0IGJlIGtlcHQg
Y29tcGFjdCAtLSBubyBob2xlcyBhbmQgd2VsbCBkb2N1bWVudGVkICovDQo+ID4gPiAgIA0KPiA+
ID4gICAJLyoqDQo+ID4gPiBAQCAtMzU5MSw2ICszNTkzLDE2IEBAIHN0cnVjdCBkcm1faTkxNV9x
dWVyeV9tZW1vcnlfcmVnaW9ucyB7DQo+ID4gPiAgIAlzdHJ1Y3QgZHJtX2k5MTVfbWVtb3J5X3Jl
Z2lvbl9pbmZvIHJlZ2lvbnNbXTsNCj4gPiA+ICAgfTsNCj4gPiA+ICAgDQo+ID4gPiArLyoqDQo+
ID4gPiArKiBzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfZ3VjX3N1Ym1pc3Npb25fdmVyc2lvbiAtIHF1
ZXJ5IEd1QyBzdWJtaXNzaW9uIGludGVyZmFjZSB2ZXJzaW9uDQo+ID4gPiArKi8NCj4gPiA+ICtz
dHJ1Y3QgZHJtX2k5MTVfcXVlcnlfZ3VjX3N1Ym1pc3Npb25fdmVyc2lvbiB7DQo+ID4gPiArCV9f
dTMyIGJyYW5jaDsNCj4gPiA+ICsJX191MzIgbWFqb3I7DQo+ID4gPiArCV9fdTMyIG1pbm9yOw0K
PiA+ID4gKwlfX3UzMiBwYXRjaDsNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gICAvKioNCj4g
PiA+ICAgICogRE9DOiBHdUMgSFdDT05GSUcgYmxvYiB1QVBJDQo+ID4gPiAgICAqDQo+ID4gDQoN
Cg==
