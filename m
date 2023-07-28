Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6EA7663C5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 07:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C3E10E64D;
	Fri, 28 Jul 2023 05:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E5E10E647;
 Fri, 28 Jul 2023 05:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690523436; x=1722059436;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/SWZ6KBdc+b+S5L4vg36wR87VF/PfqgkFR+inAbX5G0=;
 b=jxG2Bo8hI2bvPUOwLFZVOzY/kWHyVkN6fWu51YT4Em5QceEFEU7AYyaa
 glCB5IvGVUSarBRGAESlUT9tNcHhzG3aiwtqkcCir1JPtH3B4tJ7kfIMj
 jCg229avuOqU/IuTwvneZXqgCUXy+2yxmzmHyjYAlTIheVbM+o4NF5YW3
 V3twRvrnVkEdQMcYkF/u7ydYlIxG3zgbmIFhAdXO+QIyNQnOslFzm6lkh
 ettes/3EMPkWP0vNlRBeJStsQlKodE0JqcW+bA4EYfLfGlOSxlYy9Cd9E
 IOPw1CNrieJrHqO/5SDAKpvVQILXJiU660VXsINNTC3pGZhGC7f9sGAv8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434796335"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="434796335"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 22:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901093214"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="901093214"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 22:50:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 22:50:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 22:50:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 22:50:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD8iS3CTxi2F7ep+9F8ZvUw/Lr7uyRrzjCEv9Eco8xC1KVxewRFOkRAtZ8h5qIVazOR3RdKBIfCjY9SQCPbInaJ0+7pGcFu1rW3KymTmza3Sg1/IMj2H5rqPBEXJnNMCACP1csbJRFwHQER06pxmxCShUv/T4Ue9CjagdHQ1qDukDjEBCflpfkSnexyhvoCBD193BS8GX1DpYOsn9ZwLvjG2ZUkZNJZlHVyvYcvxxTfJoZQqYqDFCIBgl26m+GOidKaVxvLN+mlTrF+hypc/ruI7TYFmg1i2LrmoDS88TB3Duj7gyhQNiEBv320ZUg2R9xHVzjqj/sTwro3C1NZ7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SWZ6KBdc+b+S5L4vg36wR87VF/PfqgkFR+inAbX5G0=;
 b=NtpZ/b2dDqA0c1aWyT6Tz5O4qlLkt7s5y2Rz8d9evJz5xUmYqAnnWTjbCBv8Jh+/HEV+qwwz3WCzPc4GdZ3f+Qpe1Ngh9zBLtGRWZiYDgy7o7PRV4KeVzh8AdyMDBNQyJGEzdixW7sK8uylImhQdBHhZySqTLYaoXIQKJz5DhFZ1wK3KDsJBLBimB9A1Wm6Z0nodLKH5/l/pJqXvJl7IzZLbHlE4tocBSXX8pVZUNR6nKIJiXr1D0/p2sxRQSdetaJUgp6F6A7jbTQxfGdAavgHiJKVtFTkB03J16bYGvG9ro+s4VMFRuzb/cbLhHBQIAhShJPjenfgIVsMlocUkIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SN7PR11MB7974.namprd11.prod.outlook.com (2603:10b6:806:2e7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 05:50:33 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::ca92:81a9:39f7:933b]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::ca92:81a9:39f7:933b%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 05:50:33 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC 1/8] drm/i915: Skip clflush after GPU writes on Meteorlake
Thread-Topic: [RFC 1/8] drm/i915: Skip clflush after GPU writes on Meteorlake
Thread-Index: AQHZwJpjmd3I5VTKV0aUymZVHouVAq/OrKdw
Date: Fri, 28 Jul 2023 05:50:33 +0000
Message-ID: <BYAPR11MB25671CE1E5354760EC87ECDB9A06A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230727145504.1919316-2-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SN7PR11MB7974:EE_
x-ms-office365-filtering-correlation-id: 0c395fd8-cdb2-4502-6531-08db8f2e8efe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sbjuib3lY7InHE4LVduYmRCuek3qiaBzAbguNrFOJJBqF4Rlp2sGnNWeKFY0r9gy2cnqabQFWJGtiRUMoyjEzzDRonnbv30w7GvfIHNU6bCS8S6Rsa7Qlbb13grNyA2lFGeE0KlKXXlpidsV4LVY2Ejx0bFmC0DNmfG/WNP9/8EQH5XjQKEo0D62s0oFY/Nl/Ym65DJ/NVNpfwgpSCQVbLLCw2iQ5WZOCiZZ7jd66uxcFstYiNtgY2f1czOzUE+EYAFD4b1WA5xxAgjq2Dvzkn3MRvFsxNwS+NVbcsbDHeYypoJC2MWZ5oWk8w6vhxDjNBPOXtsS6sDJ8XaW48KZCFropUVKVje4xILiasPRyn9I8wVHivCA3HiNq9ITKZBmITSvtp8NKa9RoX/4fAev30Y6xZDJ94XCpdalXiAXqhNPHVX/1MWv7KcF+cEhDmHy18MJUx91AGmYkZknmZXC3Omfd1Ek7m7YzXqRQsK90g/4eafiAVn1qGUqnXB4v43R3fTbYoV2zkwo5RgPuZv6jeCOB0BP1ONoJ/sMZ8DP/mM4OcgcOYFgqykk4YNINbQ5a4lJCCsOrM+c5LbKaHlak/AxKijOo9f59Tjk2GRXj2Wfes9r/tf4Maj/vxzssuMP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(86362001)(41300700001)(2906002)(316002)(38070700005)(5660300002)(8936002)(8676002)(33656002)(55016003)(52536014)(9686003)(6506007)(26005)(7696005)(478600001)(71200400001)(82960400001)(83380400001)(38100700002)(186003)(66574015)(64756008)(4326008)(66446008)(66476007)(66946007)(76116006)(110136005)(122000001)(54906003)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emVudlJjd0o4akNCRW5mRlFIRU12Z1h1QjlieTJzaThqdXdYWUhGbnQxR3Rr?=
 =?utf-8?B?MkhNQlluQXk1dENLZXFRU1ZRNlpna2JNd25mdVVmdzdZN2l5eEtXdmNXTjBq?=
 =?utf-8?B?VGFmaEhnOHBrQUxSdFJtUWVYM0lyZ3lHYlN5UWJNVXJPbGR5ODZhcmJDZ0VI?=
 =?utf-8?B?OHQ0YXB6SEYxeHg3Njg0ZExEV3hCK3dObUg1a2dyMlhQYllDWElhTkhMZU9k?=
 =?utf-8?B?OTlUdnNvdXkzMHBxT1JMcTlFbG1mSUJXUDlWZnpQTVZCcVpTU2c4RUlSRG96?=
 =?utf-8?B?eHNkU09TeHRkMmVsRVpTQUNCT0FBYVRwRUwybG5VSDFVTHNFcisrWlh5c2pw?=
 =?utf-8?B?dHNHTWxKSlV3c2kvZkhsa0Nub0hNRE5JaFFoSDIya3RsUDhMMHBmcmErNkgv?=
 =?utf-8?B?dzI5R3F5WkV5TmtXTjNPcG83R3lNMkg2WXRhODRidFFhSFNjTVgrcVREWGZX?=
 =?utf-8?B?Q1RCL2dZUG13S3owa2RYQVd6S2J5UWh4bEk2YThyQjhuZzc5SlRQOWRSQUo1?=
 =?utf-8?B?MjFTK3J4Q1hGQlBGeVVwZ0Uyd2R1ODU2T1I2cjRJR3dtcDVmbmIvSEVicVZV?=
 =?utf-8?B?aUwrbW1BVEZYeWFFcExWVzUxbW1ZMC9jbTFTNFIyNjQ4TEozcjNkc2lCNUVu?=
 =?utf-8?B?RERFcUlGR3NyNDJzdDIvTXVVZDlSN0VtbU5UWTNlZEhyOE9DZ1BuRHNCL0ls?=
 =?utf-8?B?WVpJM1l4eUFXQ2s4Z3hJY1k4YVdQYW1vcHBzZzZpZS9aQ1RkM2ltTHJtY0Yx?=
 =?utf-8?B?Q1JkMzJPMFBHNE42Q2RFM2lNaU5sUnYyWlFmdmFldFozNjhtNzlyM0ZnTUIy?=
 =?utf-8?B?WlAwVVRCcDdFUGJNWUxzeXh2RkxHQVMzcG9MemVMZXRCQnpZU3JXczFRVUdL?=
 =?utf-8?B?Z2lqZGI2VUdHWlhJcXYwL01XR0p3TWIwQVRwUGE4N2JLYk5tcmcwVkhxdExR?=
 =?utf-8?B?c1FOUkw2bWY3N2RNZ1VsNlB3UUZpaVlyOGh6V1hQTmR1cUxpakN0L0tsc1F6?=
 =?utf-8?B?dGJxVjFtYWVseUtEQVo1Y3BGenVRUFFuNUtZTWZ3OHY3RjVVOUxEMG92ZFIx?=
 =?utf-8?B?OVBPOW1sUW92VFY5WXUrLzRDV04yeGFoamtJQW1GYUMzNU8rNmZJakR2NzF2?=
 =?utf-8?B?RjJ6L3BZUGdQQTNsK0R5dzZtNnVBempHZ21iRi9Nbkg0QTBZMmF0M2g2Nmww?=
 =?utf-8?B?dEVrNEM5SjdmOU14S1BWdzZEV01jN2thQVJOK3MzWDkxcS9XOGdnSGt5RzRV?=
 =?utf-8?B?bmFSaHZpbEVXT0djK3BtQk5GZjVDZ3MvZVJuS0VzU0x1NDdBbU5QZUg3V21n?=
 =?utf-8?B?VWkxUWVmajhweGJsT2hZZTZqRy9hRHhMejEwdGR5VDlHaEpnQVJPUjhaL1pY?=
 =?utf-8?B?eXh1RDgyNURUbEFQMVFFU2NEbmphMnpxZnE2R1VRTDNjTllKazB4clJHTU1k?=
 =?utf-8?B?L2F1eXJtZDRNS1B4NStwN0pBZm5lblc5NjBVVE5ZNTNHOC9CbVlvWG1XbThO?=
 =?utf-8?B?aWtzQm5hK0pRcFRNSkMraVRWSFJqTmt6dWpsb1dlVStQR0k5Wk9hRzNIRmZW?=
 =?utf-8?B?ZEVkRXcwOHhmS01SNncraU0yNDFjOVgzZ1dTUFg1bWcwQThyOXFrRHBPTSsz?=
 =?utf-8?B?cy9XRm8raGhYdHlHSmJCNFhoakZZYWFxK3JOUFBPdHNuRWdPMmpqWGxyaDB4?=
 =?utf-8?B?YXNoMmRyR0RIb1gwelBySkkyeHdaTU9TeGpQZGZnaDlKc0MyYSttaURtbjhi?=
 =?utf-8?B?TVBVRHd3a3pCdXJpMEkxT1dTRkZ6YUwySWFmakVuazEyQ2k0L1U1d2cweGJI?=
 =?utf-8?B?SE80TWxzRkxuTWNSQVMwSVY0TVlqbVdQbE5EdFBVL2ZQc3JLTzliTzRwNGpv?=
 =?utf-8?B?QjgwZUNLWGIxMEV3VVZMa1Q0Q0twS0hTeWpFWjMxeGI1a1NTY0R6UERpT085?=
 =?utf-8?B?ZDRmT0Myb3lhREZQeEtmZXZ0RzdXTzhZbWVqQ296UVdMdXJUUXR3UldoeEli?=
 =?utf-8?B?WU1iMWRmQmR4SFhvUGYvNWdQSVJRQXBaTS9vaXMvS3Babm9Na3lXRjhXUUZW?=
 =?utf-8?B?T2kvM3dmSCtEajJublR2MmZEcy9za0NyWVhwYUxIdGNSZjg5WHpUbFZJNGZZ?=
 =?utf-8?Q?iLKWLJCxkN/NQKYxJ5sBEkg/Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c395fd8-cdb2-4502-6531-08db8f2e8efe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 05:50:33.2862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3786igO9LXQuVmQwXZXZ0mBD55fE83Ok6akGp6O+mT6coOZ7XTLJ3csl0nG19BHWr+Hz/b4880/A+Ndkx+6gGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7974
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
Cc: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPg0KPg0KPiBP
biBNZXRlb3JsYWtlIENQVSBjYWNoZSB3aWxsIG5vdCBjb250YWluIHN0YWxlIGRhdGEgYWZ0ZXIg
R1BVDQo+IGFjY2VzcyBzaW5jZSB3cml0ZS1pbnZhbGlkYXRlIHByb3RvY29sIGlzIHVzZWQsIHdo
aWNoIG1lYW5zDQo+IHRoZXJlIGlzIG5vIG5lZWQgdG8gZmx1c2ggYmVmb3JlIHBvdGVudGlhbGx5
IHRyYW5zaXRpb25pbmcgdGhlDQo+IGJ1ZmZlciB0byBhIG5vbi1jb2hlcmVudCBkb21haW4uDQo+
DQo+IFVzZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZG9jdW1ldCB0aGUgc2l0dWF0aW9uIG9uIGRpc2Ny
ZXRlIHRvby4NCg0KTEdUTS4NClJldmlld2VkLWJ5OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwu
Y29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBp
bnRlbC5jb20+DQo+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0K
PiBDYzogRmVpIFlhbmcgPGZlaS55YW5nQGludGVsLmNvbT4NCj4gQ2M6IE1hdHRoZXcgQXVsZCA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMu
aGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fZG9tYWluLmMgfCAxMyArKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX2RvbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX2RvbWFpbi5jDQo+IGluZGV4IGZmZGRlYzFkMmE3Ni4uNTdkYjljNTgxYmY2IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG9tYWluLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RvbWFpbi5jDQo+IEBAIC0y
NCw5ICsyNCwyMiBAQCBzdGF0aWMgYm9vbCBncHVfd3JpdGVfbmVlZHNfY2xmbHVzaChzdHJ1Y3Qg
ZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKSAgew0KPiAgICAgICBzdHJ1Y3QgZHJtX2k5MTVfcHJp
dmF0ZSAqaTkxNSA9IHRvX2k5MTUob2JqLT5iYXNlLmRldik7DQo+DQo+ICsgICAgIC8qDQo+ICsg
ICAgICAqIERpc2NyZXRlIEdQVXMgbmV2ZXIgZGlydHkgdGhlIENQVSBjYWNoZS4NCj4gKyAgICAg
ICovDQo+ICAgICAgIGlmIChJU19ER0ZYKGk5MTUpKQ0KPiAgICAgICAgICAgICAgIHJldHVybiBm
YWxzZTsNCj4NCj4gKyAgICAgLyoNCj4gKyAgICAgICogQ2FjaGUgc25vb3Bpbmcgb24gTWV0ZW9y
bGFrZSBpcyB1c2luZyB3cml0ZS1pbnZhbGlkYXRlIHNvIEdQVSB3cml0ZXMNCj4gKyAgICAgICog
bmV2ZXIgZW5kIHVwIGluIHRoZSBDUFUgY2FjaGUuDQo+ICsgICAgICAqDQo+ICsgICAgICAqIFFR
UTogRG8gb3RoZXIgc25vb3BpbmcgcGxhdGZvcm1zIGJlaGF2ZSBpZGVudGljYWx5IGFuZCBjb3Vs
ZCB3ZQ0KPiArICAgICAgKiAgICAgIHRoZXJlZm9yZSB3cml0ZSB0aGlzIGFzICJpZiAhSEFTX0xM
QyhpOTE1KSAmJiBIQVNfU05PT1AoaTkxNSkiPw0KPiArICAgICAgKi8NCj4gKyAgICAgaWYgKElT
X01FVEVPUkxBS0UoaTkxNSkpDQo+ICsgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArDQo+
ICAgICAgIC8qDQo+ICAgICAgICAqIEZvciBvYmplY3RzIGNyZWF0ZWQgYnkgdXNlcnNwYWNlIHRo
cm91Z2ggR0VNX0NSRUFURSB3aXRoIHBhdF9pbmRleA0KPiAgICAgICAgKiBzZXQgYnkgc2V0X3Bh
dCBleHRlbnNpb24sIGk5MTVfZ2VtX29iamVjdF9oYXNfY2FjaGVfbGV2ZWwoKSB3aWxsDQo+IC0t
DQo+IDIuMzkuMg0K
