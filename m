Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515A7EB5A0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 18:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B1810E49B;
	Tue, 14 Nov 2023 17:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C010710E498;
 Tue, 14 Nov 2023 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699983444; x=1731519444;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yxTKNsmFB6jFLy1UgWyrUCjtp0CPfdW+1y1OM/eqJIk=;
 b=UrRijubnLCUDFDuzF8k+vsZLCMel8RkiEfzVEyRiQqZub9Ctw9qwIHXm
 GP6cBJs8E+RP9XjhMco44G0TDVnC/ccIwmTIatVJ5jIGuZyZEx4l3iX3t
 n02v42BZAzhUsTIG92jgI7tsysYePumwmpHMJgZz24b1imVyjD6KYvKEb
 KywFDRmvjrRD+B44RjgtkK1zHPgeht0g8WaEfYDTEg1eDHieEFbHgHyKx
 G3xaDjP+BpcTaJ3y747k1WMhEm3gcd4zjLePBg1+orqKUO6V9he+4f68Q
 dSTLP4BWcofa/Nv+HZ7myBJQ2yPdI1/4Lty88lq88J6VZ/+xWZ5ziejbM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381101910"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="381101910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:37:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="741156742"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="741156742"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 09:37:23 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 09:37:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 09:37:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 09:37:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 09:37:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBzYuo5tmF8E4Iz61olfZ/yGiAM8H2AjCLKibxS6BTlmK1EORmQ2RWskUdOIe/LXpxcz6O1zDS97AEkHE+iQ8/lj0/Lse4bImEs8YVLArs+MY7vKp/jVxxQoW+GXw3TKKcW9SjYDUhH2mdcZBcn8gYhbKM38SgjP99pkgCtQkxXrj7ZG08TWFlGMJFyLhQyMnTGjUiLR0hYeu5uPMsFusy/8dYgomV9ttHw6IVjnRXqaoIOfHKs+PCma/IM7gXT/YB+7yptBuE/7IFOXTLtSuDUqKsFhADisEpTI3FyQBVRxQOEDC2nn9zg4wnAS9n+Ftx7aBw5JvAs18tmWcN46+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxTKNsmFB6jFLy1UgWyrUCjtp0CPfdW+1y1OM/eqJIk=;
 b=W6/a0MZELL9KZH5A8ki3pWmXu3y/BiKUpwc1uwP5eawMrC8KnGb9XwjTRuUa+5jBunQn9ZGX/g7za7LO51onS0lSkRLddAlYpOke5H2UkamkqS4dDEg2fHfmM5XnAgfCqfX5Fr1k/zB2sTUhuBpStSCAXz/TyxwRU9/DLV86cQ1ftIouaVvRyyTUJ7sjm6rodb9BU/0bANMXmHj/xtInh4sRBSfAd6j2OeEt2hXVqgtGA3hrb7L5xi6eLokwCif5Fd8Yop69AsbMxPwtzcqvEeaKIJA4gMce0ofdOYj+5pebOnN69AWVpmeEPTzkB8JFWVqpZo45SRTpBA49uLvRug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB6770.namprd11.prod.outlook.com (2603:10b6:510:1b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 17:37:20 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 17:37:20 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Topic: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Index: AQHZ8Kx2E7YYzy1lTkO6NJtn5NHgRrAuYVuAgAB+x4CAAVIIAIAJxYEAgCCs+QCAHi+1gIABifAAgAACywA=
Date: Tue, 14 Nov 2023 17:37:20 +0000
Message-ID: <246ecbb0dcbbc96d9e48f8de6798bd9d16961c8f.camel@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
 <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
 <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
 <0c1e1e713fc46bf0783ca6e0a72a39d6671a6b57.camel@intel.com>
 <ace7375e-d9a8-4b6f-aa92-6360ca3bfa96@linux.intel.com>
 <16068beebe0fdac5aabd83816fd25367f5170c24.camel@intel.com>
 <eeded970-cee7-420c-9b34-26ea9d78e420@linux.intel.com>
In-Reply-To: <eeded970-cee7-420c-9b34-26ea9d78e420@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB6770:EE_
x-ms-office365-filtering-correlation-id: fb621149-21c9-45cf-1812-08dbe5385a79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KkENCKEOGQCkPn48xd1BGFtHWC51QjLwDA6u5Wbj2aUqLUOVUwVnQCuiQyqRdCs5cjA3i51kLJmtf8rPkfFsD7tntyNJJsiRh7K0nyP5omzqoQSjp98YAasZtBwanINsFjeU22vvzXACfrWxqHratlVDBs15VXftCNYp0lzym2csxF0n+HzgG6iKYEJiB58HWO33taRrfusC0XSw/205hhBnkcAmH9ox6UClEdNWTfoYriAVnCKh07eHueXEybfVZoz99uXwrnEXyJlQKkECyM/ddAABT3hLl/mRKDzuNl/gBG9YxOjg0DvC81ehKHRW4f9wgrPAIwOd1vskeoXoLjdglmMIQfyX4I4lMq2n4CE/9IXFAEq13j9hYIGklc62HxwrrgD4YwyD29Yh/6c67WJCGRbt3eJ1PSIQXNHYGd03h4fOlP1W+espcB7tAykopx1HKmy8w6KCmUoN/ll1iRNBTQfISXkn706pdpdIGZ/tPY+dTXe87Zh2WCqgrqxpKk5O8uDoxdP+SDgHWIKWUga8nt8kxby6t41RXEzyTqYbwZ1dDRxGMKefc9BdxZL8wW9I1gtNR8rQKndoIKfPoYdSxl8dXow9i/+zrQsGKvdPLFf6025a+2jiDMZBHVmx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(38100700002)(2616005)(122000001)(4326008)(8676002)(8936002)(6512007)(6506007)(53546011)(26005)(82960400001)(83380400001)(6486002)(71200400001)(478600001)(38070700009)(110136005)(91956017)(66946007)(76116006)(66476007)(64756008)(66446008)(54906003)(66556008)(316002)(36756003)(41300700001)(2906002)(86362001)(5660300002)(15650500001)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3NMN2YzczJlaG1jYWdPZWg5OVVSSnQrSVlEVnY3WGJRWHBidDNrbmRQb0la?=
 =?utf-8?B?ekU2Q2RTb1kyRzByMERRN0E5cXduK1ptM0FiY3E5bTV5anRCMS81cXZ3eW9z?=
 =?utf-8?B?SGtNZ3kyRDMvQ0NHWmMxcTMzdWdnMUhnU2RETzJnQVc4NUE2M1hFWU13UlUw?=
 =?utf-8?B?ZUlRcEpvMkZ6Q2xLd0pDN3Nma29PZkxWN2xjSk9QRWMzL2pUZWEwUmRoalIx?=
 =?utf-8?B?WGhuSnYrVHYvVmZEUmxVVUVYS1AzcFZPK2JxOGZucXdPcVp3WUMxVWlvV1BG?=
 =?utf-8?B?Y2ppQ2tjZXJmUGZwdmhJdkpCTUZCUkxXS0JRTnJ2MmtzbnoxeERESzNtbGJD?=
 =?utf-8?B?UjQ3SkJqUkJvTFVtK1FucjBrMUVBMWZjNGkwVjhENXRrOWRqSW9EY0hEL3di?=
 =?utf-8?B?NkNLR0FTVWJVTjNnNzMzNEs5bk1INzhFT2NkdUJSTjJmcFF1TzFrd0NaYWtR?=
 =?utf-8?B?MVROSXF5VmtFenFhYXMxZ2t2VlF2NjloUUlkYVpSK1Y0TjZNcDVrOGd2TWRy?=
 =?utf-8?B?WHkxYi9mMGMvcGpEa1lUQVpIMjd1M21KdFFFdUNHNnhENHplQmZTRWIxbitv?=
 =?utf-8?B?Q1NOZWlwV2lGRk9DUWtlZm5BQ3B5K2V3UkkwSUtpZVJWd2N5dWJIV0dFaUd0?=
 =?utf-8?B?ck9mQzBmeFVTaWc3TGFBOTQ0YUNUblNYc2hYdHRBMWthT0VKc0MxSW5ON0Vu?=
 =?utf-8?B?aklyM2c0NDVUSmhNTTNJejBkWllJY3RFK1oxQnFxWUVoaWtOQjh5VWFmWEU2?=
 =?utf-8?B?enVOUmpTN2IvK3Z4MzFQcmpqVmQ0dDZYeEs5ekpTUU1sb0ZBUnZLMko2Tm92?=
 =?utf-8?B?WEJwNnRHcGJOcGZ1a1h3SndRQUl3SVliQ1pOdWV2aXZaTHE2c3ZRMXgyVktZ?=
 =?utf-8?B?c1lHenVrdGdaWUhsb04xV3YyRnBQRlA4VEtveU50RkhmcnZZTkZkQnF4UFY1?=
 =?utf-8?B?dXUrOTF2MGl2UENEbjA4RXRjVFRYeTY4eVF6QmhiOGFYclAyTTRJZ0NvUW9v?=
 =?utf-8?B?SStDYS9xeTRPMmJjdmRoZTkvT3FwM01Vb0lZOFphNS9iaTA5U3ZVbC9tWGFS?=
 =?utf-8?B?cjN3S0kzNFd0blF6ZXVmZkV1TDhZR2ttYmJDUUcvSi9UbTFuaW9kNGJhMTJh?=
 =?utf-8?B?NHVPY29KRXZKSy83ZkZhbDZjcGxJMytoVWRocVltNUlKT3BpUW1RYnhHbCtY?=
 =?utf-8?B?M1MrdkNGUjcvUkxqNkYyd2czcFJEcUs1SFpZblYzcERLZWlnSm1Ka2JwYVg3?=
 =?utf-8?B?bGxRclNDNDhRbDNtdVZpK29RamdGajB4RkN0bmNicVpBVnF5WkxMZlB6OTJO?=
 =?utf-8?B?Y2x4ZmY0cWhGVnBXOFFmZTg4VkNPM2toQWx0OVZvUTZueHlhNDk4K1RQZFh0?=
 =?utf-8?B?cnRETllGRnpRMUtzUkxWTWZ1VnZSeWlGZ1BMamExMjFsZ21ZUEZxbzhyRlVU?=
 =?utf-8?B?MEZGZHJFQmpjRi8yOFdxVjFqK3lYNXZsMTFkQ1J5OUVMeWF1dUZtU3A3Q1Bw?=
 =?utf-8?B?N2liSHVTcGE4WitiSU5WVUVwTGRnS1N1cldtSC9mWURIbWVHTjMyYWtTYzdL?=
 =?utf-8?B?ekNPWHllSnNEc1ptamcrV3VldEpYVEdBVmQzQW9MZE5HZlh1RnE1aFZnN1Nw?=
 =?utf-8?B?RjQvVTNIdkNFdFZyYVM5YjBjNVVGSFQrZFBoTC9YTkxNSW9kdkFUYkxNYXFM?=
 =?utf-8?B?SDhMWXJudXRJWUJkWUZOVWtUTFo5dndWSzluanFoZ2FXWms0NlVYMzM4c3N6?=
 =?utf-8?B?YmdqSDlXSjBhSVpwSWpDc3dvcDRwS3d5TE4wVFpRVkNnWFZsTVJwY0ZwWUtl?=
 =?utf-8?B?bU1GcDZzcHJBYi9vQmg1MG05WjVhWm5XTGI2MUpWZlU5Ym04YWJhMEdEc254?=
 =?utf-8?B?aVU5bWxwTVpaU2p1TVpaMHdMNHJMYlBKazVRTm9YSHpybkxMY1BabzF2bkhm?=
 =?utf-8?B?VnVpT0NYRytVaE92T29raVJnN2ZETHgxRTIwSWQ2bUFCVXlrUHJNaWVkYXFh?=
 =?utf-8?B?MnM5M3oyVkp5WlQ0R1NlWlBvYTZCK2tNUWlIQTdnZjg4RW9NTWR5WVY4a012?=
 =?utf-8?B?aklRYUhIZzlhdTM4ckdtRm9MSHdSNjUyQkRZM1FvMTlac1lvM1BWbHI0eTk0?=
 =?utf-8?B?WGMwWURsbFN2U1E0MHkxVVdPb2FGclBja0pwMThibUM4UG1CcFRPbi9nT09r?=
 =?utf-8?Q?tWJLwtUybxsozunvzQiRBAk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF53077F0DACF74796DF86C58FA94E6F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb621149-21c9-45cf-1812-08dbe5385a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 17:37:20.1752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NF40YhM9BRryhm5CPCnbsFSoRib/oE+SdhXyMFnaMyUXvcUylyw9v9NVh75pueSPqnBTqwduE+x91zdpywvQ24uDNxvb9NmAu4zDy+jGV2IIM78xUib4UGhJ4DVv1T1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6770
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
Cc: "Jana, Mousumi" <mousumi.jana@intel.com>,
 "intel.com@freedesktop.org" <intel.com@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTE0IGF0IDE3OjI3ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gT24gMTMvMTEvMjAyMyAxNzo1NywgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToN
Cj4gPiBPbiBXZWQsIDIwMjMtMTAtMjUgYXQgMTM6NTggKzAxMDAsIFR2cnRrbyBVcnN1bGluIHdy
b3RlOg0KPiA+ID4gT24gMDQvMTAvMjAyMyAxODo1OSwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZp
biB3cm90ZToNCj4gPiA+ID4gT24gVGh1LCAyMDIzLTA5LTI4IGF0IDEzOjQ2ICswMTAwLCBUdnJ0
a28gVXJzdWxpbiB3cm90ZToNCj4gPiA+ID4gPiBPbiAyNy8wOS8yMDIzIDE3OjM2LCBUZXJlcyBB
bGV4aXMsIEFsYW4gUHJldmluIHdyb3RlOg0KYWxhbjogc25pcA0KPiANCj4gPiBhbGFuOiBJIHdv
bid0IHNheSBpdHMgTk9UIGZpeGluZyBhbnl0aGluZyAtIGkgYW0gc2F5aW5nIGl0J3Mgbm90IGZp
eGluZw0KPiA+IHRoaXMgc3BlY2lmaWMgYnVnIHdoZXJlIHdlIGhhdmUgdGhlIG91dHN0YW5kaW5n
IEcySCBmcm9tIGEgY29udGV4dCBkZXN0cnVjdGlvbg0KPiA+IG9wZXJhdGlvbiB0aGF0IGdvdCBk
cm9wcGVkLiBJIGFtIG9rYXkgd2l0aCBkcm9wcGluZyB0aGlzIHBhdGNoIGluIHRoZSBuZXh0IHJl
dg0KPiA+IGJ1dCBzaGFsbCBwb3N0IGEgc2VwYXJhdGUgc3RhbmQgYWxvbmUgdmVyc2lvbiBvZiBQ
YXRjaDMgLSBiZWNhdXNlIEkgYmVsaWV2ZQ0KPiA+IGFsbCBvdGhlciBpOTE1IHN1YnN5c3RlbXMg
dGhhdCB0YWtlIHJ1bnRpbWUtcG0ncyBETyBOT1Qgd2FpdCBmb3JldmVyIHdoZW4gZW50ZXJpbmcN
Cj4gPiBzdXNwZW5kIC0gYnV0IEdUIGlzIGRvaW5nIHRoaXMuIFRoaXMgbWVhbnMgaWYgdGhlcmUg
ZXZlciB3YXMgYSBidWcgaW50cm9kdWNlZCwNCj4gPiBpdCB3b3VsZCByZXF1aXJlIHNlcmlhbCBw
b3J0IG9yIHJhbW9vcHMgY29sbGVjdGlvbiB0byBkZWJ1Zy4gU28gaSB0aGluayBzdWNoIGENCj4g
PiBwYXRjaCwgZGVzcGl0ZSBub3QgZml4aW5nIHRoaXMgc3BlY2lmaWMgYnVnIHdpbGwgYmUgdmVy
eSBoZWxwZnVsIGZvciBkZWJ1Z2dhYmlsaXR5DQo+ID4gb2YgZnV0dXJlIGlzc3Vlcy4gQWZ0ZXIg
YWxsLCBpdHMgYmV0dGVyIHRvIGZhaWwgb3VyIHN1c3BlbmQgd2hlbiB3ZSBoYXZlIGEgYnVnDQo+
ID4gcmF0aGVyIHRoYW4gdG8gaGFuZyB0aGUga2VybmVsIGZvcmV2ZXIuDQo+IA0KPiBJc3N1ZSBJ
IGhhdmUgaXMgdGhhdCBJIGFtIG5vdCBzZWVpbmcgaG93IGl0IGZhaWxzIHRoZSBzdXNwZW5kIHdo
ZW4gDQo+IG5vdGhpbmcgaXMgcGFzc2VkIG91dCBmcm9tICp2b2lkKiB3YWl0X3N1c3BlbmQoZ3Qp
LiBUbyBtZSBpdCBsb29rcyB0aGUgDQo+IHN1c3BlbmQganVzdCBjYXJyaWVzIG9uLiBBbmQgaWYg
c28sIGl0IHNvdW5kcyBkYW5nZXJvdXMgdG8gYWxsb3cgaXQgdG8gDQo+IGRvIHRoYXQgd2l0aCBh
bnkgZnV0dXJlL3Vua25vd24gYnVncyBpbiB0aGUgc3VzcGVuZCBzZXF1ZW5jZS4gRXhpc3Rpbmcg
DQo+IHRpbWVvdXQgd2VkZ2VzIHRoZSBHUFUgKGFuZCBhbGwgdGhhdCBlbnRhaWxzKS4gTmV3IGNv
ZGUganVzdCBzYXlzICJtZWggDQo+IEknbGwganVzdCBjYXJyeSBvbiByZWdhcmRsZXNzIi4NCg0K
YWxhbjogU28gaSBkaWQgdHJhY2UgYmFjayB0aGUgZ3QtPndha2VyZWYgYmVmb3JlIGkgcG9zdGVk
IHRoZXNlIHBhdGNoZXMgYW5kDQpzZWUgdGhhdCB3aXRoaW4gdGhlc2UgcnVudGltZSBnZXQvcHV0
IGNhbGxzLCBpIGJlbGlldmUgdGhlIGZpcnN0ICdnZXQnIGxlYWRzDQp0byBfX2ludGVsX3dha2Vy
ZWZfZ2V0X2ZpcnN0IHdoaWNoIGNhbGxzIGludGVsX3J1bnRpbWVfcG1fZ2V0IHZpYSBycG1fZ2V0
DQpoZWxwZXIgYW5kIGV2ZW50dWFsbHkgZXhlY3V0ZXMgYSBwbV9ydW50aW1lX2dldF9zeW5jKHJw
bS0+a2Rldik7IChoYW5naW5nIG9mZg0KaTkxNV9kZXZpY2UpLiAobmF0dXJhbGx5IHRoZXJlIGlz
IGEgY29ycmVzcG9uZGluZyBtaXJyb3MgZm9yIHRoZSAnX3B1dF9sYXN0JykuDQpTbyB0aGlzIG1l
YW5zIHRoZSBmaXJzdC1nZXQgYW5kIGxhc3QtcHV0IGxldHMgdGhlIGtlcm5lbCBrbm93LiBUaGF0
cyB3aHkgd2hlbg0KaSB0ZXN0ZWQgdGhpcyBwYXRjaCwgaXQgZGlkIGFjdHVhbGx5IGNhdXNlIHRo
ZSBzdXNwZW5kIHRvIGFib3J0IGZyb20ga2VybmVsIHNpZGUNCmFuZCB0aGUga2VybmVsIHdvdWxk
IHByaW50IGEgbWVzc2FnZSBpbmRpY2F0aW5nIGk5MTUgd2FzIHRoZSBvbmUgdGhhdCBkaWRudA0K
cmVsZWFzZSBhbGwgcmVmcy4NCg0KYWxhbjogQW55d2F5cywgaSBoYXZlIHB1bGxlZCB0aGlzIHBh
dGNoIG91dCBvZiByZXY2IG9mIHRoaXMgc2VyaWVzIGFuZCBjcmVhdGVkIGENCnNlcGFyYXRlIHN0
YW5kYWxvbmUgcGF0Y2ggZm9yIHRoaXMgcGF0Y2ggIzMgdGhhdCB3ZSByZXZpZXcgaW5kZXBlbmRl
bnRseS4NCg0K
