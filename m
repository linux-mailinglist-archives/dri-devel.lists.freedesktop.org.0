Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A08EB711AA9
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 01:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DD010E008;
	Thu, 25 May 2023 23:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B24210E008;
 Thu, 25 May 2023 23:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685057385; x=1716593385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dKJJH23+du0in5SmabL6RefZjGyoStqCWcKPVBJeJ0A=;
 b=fayRc/5KB0GGFqTi2PDdTW9A+yk3VBdhF+g9/GWRYYvbAkNhhP334zg2
 Mq2vouJEBpwZW93t7hnk7WqT0tl/YB3cQxj3tcHzrHTst7XpxZaD3AUER
 HVK60aUgB/FNr4eDy18xgGrWwMKbMg+71Fmhulb5OUBr/RlaKVvgHtAUr
 Std2VhsIv3aQdndyRN3/6q84I9CRb9plIRFArOHAo9pHqNH5YMBb89do8
 rQ7xgVEyfuX84MaX52eFBfzAOzOYKKPbzRO1ayYPOuj5jqvTlR1pU7dFk
 XnVoNUXqDCzFUf6HKp58lRkKCUbRqdMwv1BmhuWHDsAfzXnY6Cyh5B9Dg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357308174"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="357308174"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="849369945"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="849369945"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 25 May 2023 16:29:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:29:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:29:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:29:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:29:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mV/5YVnmqeJiB5GPDTLrOkiAM5y3wBnTavP7tKx8w2/fcloWW0r2dA4WfonAr6kKSvB2Hdfdlx8fkB7b2aPA/z+upRPFkIAfJu0TkLfL7YvkqEJYE9zMDG3bgSNN2BGiXgbwx+8w0CxVttgpH33c65JVq5N3WE4DV/qHhdzOQw7Tdk1xjZT7WJRrz/2EDJUsiMJ7yopH7i6w5IdKqxypyGuvsFQOnEz074488egKg5RxYWEPjU5CiXhbsbZrtGO/Tz6QEYNIQ3xvDGlc4ezrD8aFnCvz+juPh4NAAyKWXzgCl1p2kq3Oc8/EThWi1yse7bMtvbpT3UtgNfX5IJTKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKJJH23+du0in5SmabL6RefZjGyoStqCWcKPVBJeJ0A=;
 b=RWMQM70phycbwrDL6sinOkoG+M4nboL7DbkJ4n2qjbRYUFU1b2WL0iYEMPgqEg8ZKz06vjdUmxUo5/ElgoxTGCGHpgssbZ6zBLeDgHsBcsJEKvsCottAmtrVisQqtyT7Xhh1rRmA3wP+e9DP3ozwhY3XK/wfCi4oXLMH2ho0es5KIHGTQ/6T8hf9bo+2wVEE0okcEC9lotuc6x/V07LGySnUOZez1a0Kg6kPJ41CucYoxfqRc8t/JCbfakW0/znH3WrZ4VVRr4jhaYWKJoCk5GOpkrmm4AhArGuK03rQTi2vRiIe+SgPuobnjBkOqioaWPIicKl9gmsJ0bk9WfqgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 23:29:40 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::b62f:36b0:a11e:cc76]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::b62f:36b0:a11e:cc76%3]) with mapi id 15.20.6433.013; Thu, 25 May 2023
 23:29:40 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/i915/uc/gsc: query the GSC FW for its
 compatibility version
Thread-Topic: [PATCH 4/6] drm/i915/uc/gsc: query the GSC FW for its
 compatibility version
Thread-Index: AQHZf2tKxtA5LJGdxku+Jf8poTPgs69rwrOA
Date: Thu, 25 May 2023 23:29:39 +0000
Message-ID: <f34f960c06971bc784fdfb1cf2f9e067bddacf47.camel@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230505160415.889525-5-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|SN7PR11MB7114:EE_
x-ms-office365-filtering-correlation-id: 005ea0e3-ff13-44bc-f220-08db5d77e90a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ASza4uqOfDH2AfBjBtKECNADH3kYQrG7TMTRU+j2Gu7A2zgMCX+YRIKRbBrktpv3wUG7JQbFjY80oRY0BwQCy2gi+8WFPlUrEJsQ827Fy2drNN0JqdrU7CKqjDAAbBQxEfE7bM4IoH1eBB7xdiaAK+Ib34eVNjXsK8IuWt0fWb8xfsAbqxORZW4pvE5MHVnxHRICQfKxJYtPGK/EbOCcn4xiLaiQ6RffsveOq0M6fzIkg7HnJTjvakjegTQL64wvKG3jGZZaM1aN7/unLBVlFXfY5T3fC2b7ckVGhTIA6FXqel7n9yS8KQ7aP9eLyLT2CKY8Va0jnIH7kCbiv39patanCPkGKvjqP69DN7TvPDAchQsf+fPHHoB1vo2sc7aK9rKNR3tl/77V55TFNhscHzZt8mfqrKFh7Zwebemsh8EAeumWzWtSQIR+/4GG02F0wbDF8xF6PRpzJ3CUJ5FggBEkqiZ3YAkILKDyFA/+nc37PBChzZOntqD8qLNxEwYUiJ3kXXK4bieSi2DgJV0zjrjLqpyJjA3qiI4J6OAWqkqC2OXQN6DZ+zbITX+eNUFelssrUBqsbVVUnIJCWBe4XLRX9qtzGxd9i7uDYujRNaE8fdLwDtn3LKtr3N8pD7iO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(8936002)(8676002)(86362001)(54906003)(110136005)(478600001)(6486002)(41300700001)(5660300002)(316002)(71200400001)(6506007)(6512007)(450100002)(66446008)(64756008)(66946007)(66556008)(76116006)(107886003)(26005)(66476007)(4326008)(91956017)(83380400001)(38070700005)(186003)(2616005)(2906002)(38100700002)(36756003)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yzd4aEltazFoQUNIc0w4dXQvVmRTRkdaelRpVVZYWnNvbHlQa2tWcC83aW91?=
 =?utf-8?B?WVpvZFpGeGNHWFpycDdTekRtS2VqdFNrUUFOdldKOXFSN3BKSXRJKzQvT1ow?=
 =?utf-8?B?UW40Q1cvL0JtZ1VqeUdia2pXZUozek9VK2pxOWNRYTUxMHdNMnRTdVlJbkdH?=
 =?utf-8?B?MVV3U3grMG8xbzBFcGZtSVBycnY0cUxGWUVoM3ltK3JvdzM0MmFQc1BKRXZx?=
 =?utf-8?B?dnFILzA1eFVYeURxUTYzVCtTdFpGT1pUekV0VzNEenpHUzkrNHgwSlZOL0R3?=
 =?utf-8?B?T0gzbE1oMVU3NzBxbkIrRG4zMGgzdk85Z3hrd1lhY1dOVEM1NE5LdHRrNEc0?=
 =?utf-8?B?a3RmM3RIaFg4SUNsU2I0RDd4aW9vc0h4UGZ5bjM3eVJZdGx1QVRwNDR1aGk5?=
 =?utf-8?B?NUp1VURtM2VrcysyOEtJMXJ0WGhqT0FtbTBzTStIUFdzWHRPVHczenIwTm5B?=
 =?utf-8?B?aEFvSFZTWmU5Nm9NOUxvQTZsQjRrRmdoMVJPNzN2ZGw3c0d6YlVJZG9ldkRR?=
 =?utf-8?B?MnJuMDBUbC8yVFFhS0MrcEpxWFJ6NWFHMmR6YVZ6eVA1STRoVjBGamhQTU8y?=
 =?utf-8?B?QVYrV1RnQ0ZwdnVRK014WFJNVWowaGtWZXUwN1lweWd3dEpvdkJEVnZwbnBW?=
 =?utf-8?B?TjZRdHZVT0l6Zkc3eGI2cGZOQ0x1QTV4a25keGVTeVJJU3NNaytOdzIxUFJl?=
 =?utf-8?B?cnhoZUlubFNnczNlRUxDTFYvOGxiWFl3Nlc2NXlJd2FrdVhrMkZ2dlFMeGx1?=
 =?utf-8?B?V0JwTWt2ZGFHNEJ6R3Z2UU1YSXJiTkgzK3ZWbHo0T3p2VERvM2pqcHo0Tkha?=
 =?utf-8?B?WUtTc1VOSjJpT3VkQmlyWFRvMU4vK2hiZWJkekk0cnRZbElWWUJpeURaY2pN?=
 =?utf-8?B?OVlnMDNEekpaWlhqZHN5SGQ1bDJMNFpHN2x0V0lUMS80WDZMUTVPY1FRbzU4?=
 =?utf-8?B?MVBaVkxMcXdld1ZkTHF3ZnAyckd1bzBQYTBiOG9sWDhFU1dZWHhnNnFzaUZt?=
 =?utf-8?B?RXhpano0dHRMdHE4RXM4V0RQT1VRblZPZUFod3d6TWdNaytmRUJLVnEvUlhG?=
 =?utf-8?B?MklLVXFlMjc4amdIeWhJZjkxSWxWMFBQdnJDenIyVWRLY0lHcTAxTjVQZ2o5?=
 =?utf-8?B?M2x5Q0FleEtqN1MyTHNHbUFDd1ZycXNxQXNOWE9yYktmZElndDFudXptc3lP?=
 =?utf-8?B?N0JDWlQrWk5WQ1ZnM3R3cXMrbzdlTHhsTHRMcGxpY21HQktqWThVYWlodS9F?=
 =?utf-8?B?UDc1ZHpmZWI1RnA4dEp2RlBXRWlsV09ydnVaQnFPRVYzRTUwNGgxZ0M1K2px?=
 =?utf-8?B?QmlSY0FiTCsvakd2bFZ3R3FvVisyOG9nM2xISkc2VG51TEQ4Uk83QlM5YjZ6?=
 =?utf-8?B?dUc5TXJwZzhOdmhCSnNoZXVKOW9Dd1FlSVRYWWFxSUdmSTdIN3EyNThEVUxr?=
 =?utf-8?B?SllXWE1RNmJxVm5zOHJwUW1uc3BuZzBoRDBqam1ZYTA1SThZNDJCY09mMm40?=
 =?utf-8?B?bENQWTVlRXUzbzduS1FMa0ptTzl3YStTMGhBT3V1eHp2cmFmUVRBbldGdy9n?=
 =?utf-8?B?MTQ3cnJEVlVkbi9CSFhyOVBKMVVDcFBsRWxqaERaVWljQnpVNU1vNllic0Iv?=
 =?utf-8?B?OTdUc1VSZHU4YnFJcGM1aVR0ZnJHWHpvS09MWUdoUjE1S3hqS1NGRGJtd3ZU?=
 =?utf-8?B?aGVocUVFSWgvTVZSNWEraXJHeDd0djdDNUFHMkovb1I1OTB1NnNVSmhnckpz?=
 =?utf-8?B?WjVaRms0RUdBRFdYSzBBWnR5TnhXZ0p5Zm4xa2VURWJXZ0o2b0UrSHBEbzF2?=
 =?utf-8?B?UWlISkFDNDhSOGVFMEo3VUlKdHpyK1FjZXl0NzhXKzNWVHRrS21tMHBtWEpJ?=
 =?utf-8?B?OGJyU3EvRW0reEVHdnA5MHM4Y0huZ2tVVUFvNlFvaFlpeitYTk1oKzdTNUFr?=
 =?utf-8?B?NW5QWEljRFRtYnFZQ0tOQjdjbXhZQlpGQitTelNQaVVEMS9GVkRQczR6NzNw?=
 =?utf-8?B?VjZCZExxZ1lzZlByZFBzRk5pcGJNSW5Td2JmN1JqQkVDbnBEeEJ2b0tTS0pL?=
 =?utf-8?B?czBqbXJPU2RoaDlhRUhod3lsN0VSRERDMkNEdk9oRXMwNk1GMVNKM1JHRUVL?=
 =?utf-8?B?RjVuRTZyVUhVNlAwdkJKblVmZ3BsZTkwWFlSM0FSYUN6d1BhRFhJcjdsNkpJ?=
 =?utf-8?Q?yeRbIFT5gQA4sdBRIInKwqk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2831F8425C9D64BA5B977C22E19141C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005ea0e3-ff13-44bc-f220-08db5d77e90a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 23:29:39.5069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lP36sYQ504wcDrveMT//vWP3LFbvGHaJtGpNInSZmEo60lBx1SmCS/3/mevXspool6np49bt2Uf9qUxlI5xs7qACewzFWdB0uD8DcWiBsQM9Ujxp5RI0OYm8HIvCuP4k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA1LTA1IGF0IDA5OjA0IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gVGhlIGNvbXBhdGliaWxpdHkgdmVyc2lvbiBpcyBxdWVyaWVkIHZpYSBhbiBN
S0hJIGNvbW1hbmQuIFJpZ2h0IG5vdywgdGhlDQo+IG9ubHkgZXhpc3RpbmcgaW50ZXJmYWNlIGlz
IDEuMA0KPiBUaGlzIGlzIGJhc2ljYWxseSB0aGUgaW50ZXJmYWNlIHZlcnNpb24gZm9yIHRoZSBH
U0MgRlcsIHNvIHRoZSBwbGFuIGlzDQo+IHRvIHVzZSBpdCBhcyB0aGUgbWFpbiB0cmFja2VkIHZl
cnNpb24sIGluY2x1ZGluZyBmb3IgdGhlIGJpbmFyeSBuYW1pbmcNCj4gaW4gdGhlIGZldGNoIGNv
ZGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxl
LmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiANCg0KYWxhbjoganVzdCBhIGNvdXBsZSBvZiBt
aW5vciB0aGluZ3Mgbml0cyBiZWxvdy4NCk9uZSBhc2sgdGhvdWdoLCBpbiBsaW5lIHdpdGggdGhl
IGNsYXJpZmljYXRpb24gd2UgaGFkIG92ZXIgdGhlIG9mZmxpbmUgY292ZXJzYXRpb24sDQpJIGFt
IHdvbmRlcmluZyBpZiB3ZSBjYW4gZG9jdW1lbnQgdGhlIGZhY3QgdGhhdCB0aGUgZmlsZV9zZWxl
Y3RlZC52ZXIgcmVtYWlucyBhcyBtYWpvci1taW5vcjo6emVyby16ZXJvDQpmb3IgdGhlIGNhc2Ug
b2YgZ3NjIHVudGlsIGFmdGVyIHRoZSBmaXJtd2FyZSBpcyBsb2FkZWQgYW5kIHdlIHF1ZXJ5IHZp
YSB0aGlzIGZ1bmN0aW9uICh3aGljaCBoYXBwZW5zDQpsYXRlciBhdCBndC1sYXRlLWluaXQpLiBI
b3dldmVyLCB0aGF0IGNvbW1lbnQgbWlnaHQgbm90IGJlbG9uZyBoZXJlIC0gcGVyaGFwcyBpdCBi
ZWxvbmdzIGluIHRoZSBwcmlvcg0KcGF0Y2ggdG9nZXRoZXIgd2l0aCB0aGUgb3RoZXIgY29tbWVu
dCBpIHJlcXVlc3RlZCBmb3IgKGFza2luZyBmb3IgYWRkaXRpb25hbCBleHBsYWluYXRpb25zIGFi
b3V0IHRoZQ0KZGlmZmVyZW50IHR5cGVzIG9mIHZlcnNpb25zIGZvciBnc2MpLg0KDQpUaGF0IHNh
aWQsIGZvciB0aGlzIHBhdGNoLCBMR1RNOg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFu
LnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQphbGFuOnNuaXANCj4gK3N0YXRpYyBp
bnQgZ3NjX2Z3X3F1ZXJ5X2NvbXBhdGliaWxpdHlfdmVyc2lvbihzdHJ1Y3QgaW50ZWxfZ3NjX3Vj
ICpnc2MpDQo+ICt7DQo+ICsJc3RydWN0IGludGVsX2d0ICpndCA9IGdzY191Y190b19ndChnc2Mp
Ow0KPiArCXN0cnVjdCBtdGxfZ3NjX3Zlcl9tc2dfaW4gKm1zZ19pbjsNCj4gKwlzdHJ1Y3QgbXRs
X2dzY192ZXJfbXNnX291dCAqbXNnX291dDsNCj4gKwlzdHJ1Y3QgaTkxNV92bWEgKnZtYTsNCj4g
Kwl1NjQgb2Zmc2V0Ow0KPiArCXZvaWQgKnZhZGRyOw0KPiArCWludCBlcnI7DQo+ICsNCj4gKwll
cnIgPSBpbnRlbF9ndWNfYWxsb2NhdGVfYW5kX21hcF92bWEoJmd0LT51Yy5ndWMsIFBBR0VfU0la
RSAqIDIsDQo+ICsJCQkJCSAgICAgJnZtYSwgJnZhZGRyKTsNCmFsYW46IG5pdDogaW0gYXNzdW1p
bmcgdGhpcyBjb2RlIHdpbGwgYmUgdXNlZCBmb3IgZnV0dXJlIGRpc2NyZXRlIGNhcmRzLC4uIGlm
IHNvLA0KcGVyaGFwcyB3ZSBzaG91bGQgYWxzbyBiZSB1c2luZyAiU1pfNEsgKiAyIiBhYm92ZSBz
aW5jZSBkaWZmZXJlbnQgaG9zdC1jcHUtYXJjaA0KY291bGQgaGF2ZSBkaWZmZXJlbnQgUEFHRSBz
aXplcyAtIHRoaXMgd2F5IHdlJ2xsIGJlIGNvbnNpc3RlbnQgd2l0aCBleGFjdCBzaXplIGFsbG9j
YXRpb25zLg0KYWxzbyBpdHMgbW9yZSBjb25zaXN0ZW50IGluIHRoaXMgZnVuY3Rpb24gLSBtYXli
ZSBhICNkZWZpbmUgR1NDX1VDX0dFVF9BQklfVkVSX1BLVF9TSVpFIFNaXzRLDQphdCB0b3Agb2Yg
ZnVuY3Rpb24gaXMgbmljZS4gZWl0aGVyIHdheSwgaSBjb25zaWRlciB0aGlzIGEgbml0Lg0KDQo+
ICsJaWYgKGVycikgew0KPiArCQlndF9lcnIoZ3QsICJmYWlsZWQgdG8gYWxsb2NhdGUgdm1hIGZv
ciBHU0MgdmVyc2lvbiBxdWVyeVxuIik7DQo+ICsJCXJldHVybiBlcnI7DQo+ICsJfQ0KDQphbGFu
OnNuaXANCg0KPiArDQo+ICBpbnQgaW50ZWxfZ3NjX3VjX2Z3X3VwbG9hZChzdHJ1Y3QgaW50ZWxf
Z3NjX3VjICpnc2MpDQo+ICB7DQo+ICAJc3RydWN0IGludGVsX2d0ICpndCA9IGdzY191Y190b19n
dChnc2MpOw0KPiBAQCAtMzI3LDExICs0MDYsMjEgQEAgaW50IGludGVsX2dzY191Y19md191cGxv
YWQoc3RydWN0IGludGVsX2dzY191YyAqZ3NjKQ0KPiAgCWlmIChlcnIpDQo+ICAJCWdvdG8gZmFp
bDsNCj4gIA0KPiArCWVyciA9IGdzY19md19xdWVyeV9jb21wYXRpYmlsaXR5X3ZlcnNpb24oZ3Nj
KTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlnb3RvIGZhaWw7DQo+ICsNCj4gKwkvKiB3ZSBvbmx5IHN1
cHBvcnQgY29tcGF0aWJpbGl0eSB2ZXJzaW9uIDEuMCBhdCB0aGUgbW9tZW50ICovDQo+ICsJZXJy
ID0gaW50ZWxfdWNfY2hlY2tfZmlsZV92ZXJzaW9uKGdzY19mdywgTlVMTCk7DQo+ICsJaWYgKGVy
cikNCj4gKwkJZ290byBmYWlsOw0KPiArDQo+ICAJLyogRlcgaXMgbm90IGZ1bGx5IG9wZXJhdGlv
bmFsIHVudGlsIHdlIGVuYWJsZSBTVyBwcm94eSAqLw0KPiAgCWludGVsX3VjX2Z3X2NoYW5nZV9z
dGF0dXMoZ3NjX2Z3LCBJTlRFTF9VQ19GSVJNV0FSRV9UUkFOU0ZFUlJFRCk7DQo+ICANCj4gLQln
dF9pbmZvKGd0LCAiTG9hZGVkIEdTQyBmaXJtd2FyZSAlcyAociV1LiV1LiV1LiV1LCBzdm4ldSlc
biIsDQo+ICsJZ3RfaW5mbyhndCwgIkxvYWRlZCBHU0MgZmlybXdhcmUgJXMgKGN2JXUuJXUsIHIl
dS4ldS4ldS4ldSwgc3ZuICV1KVxuIiwNCmFsYW46bml0ICJhYmkiIGluc3RlYWQgb2YgImN2Ij8N
Cj4gIAkJZ3NjX2Z3LT5maWxlX3NlbGVjdGVkLnBhdGgsDQo+ICsJCWdzY19mdy0+ZmlsZV9zZWxl
Y3RlZC52ZXIubWFqb3IsIGdzY19mdy0+ZmlsZV9zZWxlY3RlZC52ZXIubWlub3IsDQo+ICAJCWdz
Yy0+cmVsZWFzZS5tYWpvciwgZ3NjLT5yZWxlYXNlLm1pbm9yLA0KPiAgCQlnc2MtPnJlbGVhc2Uu
cGF0Y2gsIGdzYy0+cmVsZWFzZS5idWlsZCwNCj4gIAkJZ3NjLT5zZWN1cml0eV92ZXJzaW9uKTsN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19o
ZWNpX2NtZF9zdWJtaXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191
Y19oZWNpX2NtZF9zdWJtaXQuaA0KPiBpbmRleCA4ZjE5OWQ1Zjk2M2UuLmZiMTQ1M2VkNGVjZiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjX2hl
Y2lfY21kX3N1Ym1pdC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVs
X2dzY191Y19oZWNpX2NtZF9zdWJtaXQuaA0KYWxhbjpzbmlwDQoNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2Z3LmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC91Yy9pbnRlbF91Y19mdy5jDQo+IGluZGV4IGNkOGZjMTk0ZjdmYS4uMzZlZTk2YzAy
ZDc0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF91Y19m
dy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2Z3LmMNCmFs
YW46c25pcA0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRl
bF91Y19mdy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZncuaA0KPiBp
bmRleCAyNzkyNDQ3NDRkNDMuLjQ0MDZlN2I0OGIyNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZncuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC91Yy9pbnRlbF91Y19mdy5oDQphbGFuOnNuaXANCg==
