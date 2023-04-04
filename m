Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E306D6B24
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B441D10E1D0;
	Tue,  4 Apr 2023 18:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5BB10E1D0;
 Tue,  4 Apr 2023 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680631434; x=1712167434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uVhl1ODcPCLzksfpWS4eivqiHKaDIIWMniwq6iRsB1Y=;
 b=IRzqr6F/toXB1xUZGIS6SFqJ9LKRGk7gqmIl4lzLxERmYDM6uYKgOlzw
 apfEisZj/DZgfRlukvPGSA4hxexFpeYmMpY2Wiw6yJNMMHHO0K58MS4nX
 IqEuJzKOhikZ6sBaoLGP0E2loUGTIvIs8ujR4r8L4byluk31xNU+qRmWe
 mL6trAUBbNqPJBnBnlWkt3Qk6KUZc5fwlQkZacGwsE9Hvl3E2IJI/3P98
 JLaUic4tj99DiD77vUqngDT0LVKcGtJwDbRy3wi0S0beEIsOi7yq8lVUN
 HGWPODXwdDyGpFvPIvMVlo3MFi9LwgyveeNdJYEcnp0+E1NkInXQQP7IB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428548359"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="428548359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="755724134"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="755724134"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 04 Apr 2023 11:02:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:02:12 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:02:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 11:02:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 11:02:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chGOa8AgSW4tI1/zxEbvccLuNrZtyJ2vL2g3WHhI2bZ5NyjFQs1vJCzjjh2khvXilMTQNG51HL7CH0+L2Ia8RbIsZ8vMe16F5X2cwS5HpNd3OcS83naFJs4nS2mM/2FpO1LRPZE6Pg5m2aMia5MeagXtd98ZRPA+yhQ1g5Ifuh63gDwxzx7pRoOtaf/B/T4L+bO6gZzM6oRpYPhWSJda3PbbBDr/H8dYIhKK0zYGhTqRYneJh8a0fOQTBKTCzx191JN5VbgzhQMgvJHEQgfhIjHjHNtVWzP5RfnO9fyrCCZ+k6eTwMt8O27zSSFKol5xk3wb/1EowCB2VsM6sThfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVhl1ODcPCLzksfpWS4eivqiHKaDIIWMniwq6iRsB1Y=;
 b=fKrkLZzGGmL0GFUsJ0AlHqVYgSS7F8ZCcs3WVl/OhfadkKX+Uf6Y9xlQdbARIuJxQAKPBnf9UE3PKNUU6TQZxVnHB8uT7xUSpLfU/0G1NiH9hlHn465BJJLY9+26aI1KPqsz+LMdPte1omnF7FsI7XbHFddrubAgvZLt9MLToQOmA+Op3vsmq3GbxeM0760OjqaVqeJFwx+J5u/IX6a5BCpC7YaUohAPI+DVxqe8GYS/q3aveUnNBa9NX9X0xjpeM+5h8gdFt/bR7QFAjaRFnmVPgQBf1ypqhmiOYe24di54Q+Xbg+gDJKov1WSaI/uLj6RMP24XM2CX6khqjUpvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Tue, 4 Apr
 2023 18:02:03 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::faf8:6c89:f5dd:272c]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::faf8:6c89:f5dd:272c%7]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 18:02:03 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Thread-Topic: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
 plans
Thread-Index: AQHZZoufWCmjZWlwlUCiRpk8O6t5ja8bagjg
Date: Tue, 4 Apr 2023 18:02:03 +0000
Message-ID: <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA2PR11MB5177:EE_
x-ms-office365-filtering-correlation-id: 7e8220be-98ec-46e8-8edc-08db3536b243
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YzK3JNn71ittYV2rdq5Jvf7gSThRQyuVMpC8cXpCtZoyOjXOUiWjj3qU7np+6pyRfmieB4bJKoKJPM5uVzu1z1wBziTLtyAOiuN43Dv0MhEqc+O5kdy/dhtf+IsdbAiA9Gv/9CJoSJbbp/QFTsyv1HHay8Uk4SwyCFzVcYNNBUeHHuLaEzoOghbcP8ryjy0sdQFaCHbfJhgUchj/4IvaEsqqKNjL77c6bk8TH0KkJf5RWQz0X1qwWUrVDUgANS6a7m36uNTzB7QjlPCwil5OYqZUNJS3G+h6IihtpAFapIodziR314dNP88yegrkQStAx/wx5mTWpZ+3ZbXQ21QSEDRs3x6XCveV9MyHAJe6Sb23DduKUUC9gseq0yK9dLWoMQRHXn6cWUcxt5vGzEoqsrHuLObA1kOFwrlfzztdOvfQ+ne9KADvSsT3atV11g4yPaqCyFLSvKYBjyQ4UsVm4I+eIK4TQO2JxycWMEzby483s0x8Rz9LHwtZTI76xkvcpmjJX71zlUvyU7lb4cREwS/FbHqRvSjIoQZKf6XlX8SNxbV8ylvAoYZEEuHJh7ph
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(5660300002)(52536014)(38100700002)(8676002)(122000001)(82960400001)(41300700001)(38070700005)(55016003)(86362001)(66899021)(8936002)(9686003)(71200400001)(26005)(7696005)(6506007)(966005)(53546011)(83380400001)(66574015)(33656002)(186003)(316002)(66946007)(66476007)(2906002)(64756008)(66446008)(76116006)(66556008)(4326008)(478600001)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlBwblF2Vml5M2dmZmU5cVNGbnY1MnVDRVFMWEtFcjdMcXdmUnZPSzFjUE04?=
 =?utf-8?B?ZldVdG5RdXVDc0RweDBKV0JIaUw3a1F1K2dQeGxqdmhYRzVBa1FHUHMwcUQ0?=
 =?utf-8?B?eHArZUJqeDN6dlJOcUE3cFV6VE1vYXd1MWVjMmtsK2dDOHQxTTF6SzJxMnhv?=
 =?utf-8?B?TkpicFpWUFl1YWVOZ2tsR0wxNGk0dnU1ZHBIY2ZEVDVaQnBuV3V3T1U3VXJl?=
 =?utf-8?B?TkRDNHpab1hLKzFNN3BQMFloM1lLcWY2RXdGQVlJWXcwVHJwajljRUhqb2hV?=
 =?utf-8?B?VDJXR1RQa2ZBSHQxenBiU0FkanRTR1FpOGNwdUlFUWNOY01pRmwyYkt5S0hY?=
 =?utf-8?B?dVVURzhxWDlEekhyYlQrcVRIc0NBMWpTSS9xZUN5cTl1ZS81NHQweEs3WjB4?=
 =?utf-8?B?M04yUzFsWTdoWW9yd01jM3dvSW03bW9tOW5yaVlGckJJbEhXRGh3Y2FUclh6?=
 =?utf-8?B?UUpXZmwvYTFmRlJlbVNpdXBLQkU0aXZweU8rS21oMEZnanVueEZuNDMwc2Vs?=
 =?utf-8?B?eW9hVHlLWENUczBOUXNnWTNSeFlZOEJ3TGNmMklWVWxYUVBaK25oNmpFaHo3?=
 =?utf-8?B?NTdYTXVLd0NsTGIwUFRkakp0RVhCUlRKQjdUV3dEZUxYOW91bTVPQlhtWU84?=
 =?utf-8?B?WlVxdFg3OHRPOXZOR0ZyL3d0dDh3Q2x1TlhIbEJSdTRBU1Yxd0ljTTZ2TzdI?=
 =?utf-8?B?OE12QWxFNTkwMldsWHk1ak5GN2hhazZSNkZud2thMkloa25VMGFqSFA1aElV?=
 =?utf-8?B?U2h6dVN4TFg0K3BYdFB6dk9QOVUyTHNHMXpkNlV5dm5ucklJVGJNTGpQMXR1?=
 =?utf-8?B?TytyS0RMM0tQb3Y0UGVkMFprUElsTXFXK0NUTDhhclpuOUptQUZXeWkxdUFa?=
 =?utf-8?B?anhFZEczTlQzcGNJaldISUQxbWZRZWhmRm1rY0lWWDZHQ1pycTJWZ3hSeWtY?=
 =?utf-8?B?ZVV3MUdEeEIvSkc3Um9LekZoaVh2Vi9VUGFaSkZ1TDZleUIxSm13WTV6bEUy?=
 =?utf-8?B?eDJQcSs0TEpBTnFNTGRYNHNYN0E5MlJTYTQxNEhhTFZEMkVnTm1xOXM5eVpz?=
 =?utf-8?B?eDFtOC8zNnBBWXNSME9ObXRpYWlZVWpzb2xSekNXWHNpQ1NsM2dSVlJHcGlB?=
 =?utf-8?B?bnJhMDd0amtaNkxIblowTElsWkVqOUhmMVhOK1duZnIydXl1d2VjczBjUVRa?=
 =?utf-8?B?TGloWE5pOGtOZkt3b1U4aW53TGRTZkxKK283cm9JMEE0UEpFQTNjelZDTFZk?=
 =?utf-8?B?S1BVeWx0d2N5Q3hWZ1R3aE1jY1B0Q2RkWmUvdG9NcUwycVlVYXpTZ3NzTDJ3?=
 =?utf-8?B?MytnSkZNcUlGUW9hSUxObWVsQXFiQW9WNGFCNVpvaTVVRFV0c1c1VTV1eS9h?=
 =?utf-8?B?K3ZIQ092QmJacFlQUVdFQlREOGR2dEFDNDh6Uk1NS0drQ0lrR2xTTEJxT0Vp?=
 =?utf-8?B?Uk1nd2ZqT1ZpOUcwK3BCYW5HcE1wcjdvUUhHSFlQUVZQWVdZYTdsMHR2MW1B?=
 =?utf-8?B?eUpSMzVlckpBSWZNZE5Ic2laOVY2Z1IwRFJjV1ZVTllJVEVYS3o2aUZUcktM?=
 =?utf-8?B?L0dVTDVleUxOUkllOG5Dcy80Y2dSbFBlV3VDbXZUVURLaGo1RkMyVnkxaXAw?=
 =?utf-8?B?Q0ZYRkdTUDhKNVl1OVJvWm9DcVJhRVBpblY5Sk1OU3U2V2tWd0wrOVNIQ2k5?=
 =?utf-8?B?MkJFSHp4SXlSTGY3a3R0MGJ0WStidmRaTXhrRVRWdnZXdVNOMDd3eXdoMGpX?=
 =?utf-8?B?Z3FiTVNzUlBrSldvVGJDbmY3ZUpQalZmT2dmbi8vU3JXOXpDWHlWbmlwcjh3?=
 =?utf-8?B?UzlvK0VSUEM0a2NRSWRrV21kK1VyNklvQ3QvR2NsNUVUdFNJeU9MQVJRWWJh?=
 =?utf-8?B?V1JHU29nTjdWWDRIOWRTV0hsUWlPZytDMjlhQ05TcTdNSDhLSm4rZlhGY2dw?=
 =?utf-8?B?dE9MMFRrOWZ1cnFRUHY4VW4xU0JYdEswSDBFWXFUWUYyaFgwZWZ3dE80OXhH?=
 =?utf-8?B?QjZvSVUrSS9UcHcxTXg1NUZmYUs5aWtOUDBGSTdPT0dSNkM0aU1ZS3UwbmhP?=
 =?utf-8?B?ZEJ6M0IxcTN0V29TRE9oQjZMUDJrNXBXV2I3MDlVWFo5Nm5lekJpN1YvZmMx?=
 =?utf-8?Q?pDu4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8220be-98ec-46e8-8edc-08db3536b243
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 18:02:03.7954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2sEWkwluoNX5zbQp4NxtOlCpEWzHfyP4/0Sdy07b4gqSlEfvPzkVLIaH6TeO0dp8jwIl4iXf4e0gJAZuYl4GYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "lina@asahilina.net" <lina@asahilina.net>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>, "Brost,
 Matthew" <matthew.brost@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dCwgVGhvbWFzLA0KDQpTb21lIHZlcnkgYm9sZCBvdXQgb2YgYm94IHRoaW5raW5nIGlu
IHRoaXMgYXJlYToNCg0KMS4gc28geW91IHdhbnQgdG8gdXNlIGRybSBzY2hlZHVsZXIgYW5kIGRt
YS1mZW5jZSBmb3IgbG9uZyBydW5uaW5nIHdvcmtsb2FkLiBXaHkgeW91IHdhbnQgdG8gZG8gdGhp
cyBpbiB0aGUgZmlyc3QgcGxhY2U/IFdoYXQgaXMgdGhlIGJlbmVmaXQ/IERybSBzY2hlZHVsZXIg
aXMgcHJldHR5IG11Y2ggYSBzb2Z0d2FyZSBzY2hlZHVsZXIuIE1vZGVybiBncHUgaGFzIHNjaGVk
dWxlciBidWlsdCBhdCBmdy9odyBsZXZlbCwgYXMgeW91IHNhaWQgYmVsb3cgZm9yIGludGVsIHRo
aXMgaXMgR3VjLiBDYW4geGUgZHJpdmVyIGp1c3QgZGlyZWN0bHkgc3VibWl0IGpvYiB0byBHdWMs
IGJ5cGFzc2luZyBkcm0gc2NoZWR1bGVyPyANCg0KMi4gdXNpbmcgZG1hLWZlbmNlIGZvciBsb25n
IHJ1biB3b3JrbG9hZDogSSBhbSB3ZWxsIGF3YXJlIHRoYXQgcGFnZSBmYXVsdCAoYW5kIHRoZSBj
b25zZXF1ZW50IG1lbW9yeSBhbGxvY2F0aW9uL2xvY2sgYWNxdWlyaW5nIHRvIGZpeCB0aGUgZmF1
bHQpIGNhbiBjYXVzZSBkZWFkbG9jayBmb3IgYSBkbWEtZmVuY2Ugd2FpdC4gQnV0IEkgYW0gbm90
IGNvbnZpbmNlZCB0aGF0IGRtYS1mZW5jZSBjYW4ndCBiZSB1c2VkIHB1cmVseSBiZWNhdXNlIHRo
ZSBuYXR1cmUgb2YgdGhlIHdvcmtsb2FkIHRoYXQgaXQgcnVucyB2ZXJ5IGxvbmcgKGluZGVmaW5p
dGUpLiBJIGRpZCBhIG1hdGg6IHRoZSBkbWFfZmVuY2Vfd2FpdF90aW1lb3V0IGZ1bmN0aW9uJ3Mg
dGhpcmQgcGFyYW0gaXMgdGhlIHRpbWVvdXQgd2hpY2ggaXMgYSBzaWduZWQgbG9uZyB0eXBlLiBJ
ZiBIWiBpcyAxMDAwLCB0aGlzIGlzIGFib3V0IDIzIGRheXMuIElmIDIzIGRheXMgaXMgbm90IGxv
bmcgZW5vdWdoLCBjYW4gd2UganVzdCBjaGFuZ2UgdGhlIHRpbWVvdXQgcGFyYW1ldGVyIHRvIHNp
Z25lZCA2NCBiaXRzIHNvIGl0IGlzIG11Y2ggbG9uZ2VyIHRoYW4gb3VyIGxpZmUgdGltZS4uLiAN
Cg0KU28gSSBtYWlubHkgYXJndWUgd2UgY2FuJ3QgdXNlIGRtYS1mZW5jZSBmb3IgbG9uZy1ydW4g
d29ya2xvYWQgaXMgbm90IGJlY2F1c2UgdGhlIHdvcmtsb2FkIHJ1bnMgdmVyeSBsb25nLCByYXRo
ZXIgYmVjYXVzZSBvZiB0aGUgZmFjdCB0aGF0IHdlIHVzZSBwYWdlIGZhdWx0IGZvciBsb25nLXJ1
biB3b3JrbG9hZC4gSWYgd2UgZW5hYmxlIHBhZ2UgZmF1bHQgZm9yIHNob3J0LXJ1biB3b3JrbG9h
ZCwgd2UgY2FuJ3QgdXNlIGRtYS1mZW5jZSBlaXRoZXIuIFBhZ2UgZmF1bHQgaXMgdGhlIGtleSB0
aGluZyBoZXJlLg0KDQpOb3cgc2luY2Ugd2UgdXNlIHBhZ2UgZmF1bHQgd2hpY2ggaXMgKmZ1bmRh
bWVudGFsbHkqIGNvbnRyb3ZlcnNpYWwgd2l0aCBkbWEtZmVuY2UgZGVzaWduLCB3aHkgbm93IGp1
c3QgaW50cm9kdWNlIGEgaW5kZXBlbmRlbnQgY29uY2VwdCBzdWNoIGFzIHVzZXItZmVuY2UgaW5z
dGVhZCBvZiBleHRlbmRpbmcgZXhpc3RpbmcgZG1hLWZlbmNlPyANCg0KSSBsaWtlIHVuaWZpZWQg
ZGVzaWduLiBJZiBkcm0gc2NoZWR1bGVyLCBkbWEtZmVuY2UgY2FuIGJlIGV4dGVuZGVkIHRvIHdv
cmsgZm9yIGV2ZXJ5dGhpbmcsIGl0IGlzIGJlYXV0aWZ1bC4gQnV0IHNlZW1zIHdlIGhhdmUgc29t
ZSBmdW5kYW1lbnRhbCBwcm9ibGVtIGhlcmUuDQoNClRoYW5rcywNCk9haw0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gTWF0dGhldyBCcm9zdA0KPiBT
ZW50OiBBcHJpbCAzLCAyMDIzIDg6MjIgUE0NCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogcm9iZGNsYXJr
QGNocm9taXVtLm9yZzsgdGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb207IGFpcmxpZWRA
bGludXguaWU7DQo+IGxpbmFAYXNhaGlsaW5hLm5ldDsgYm9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb207IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbTsNCj4gZmFpdGguZWtzdHJhbmRAY29sbGFib3JhLmNvbQ0KPiBT
dWJqZWN0OiBbUkZDIFBBVENIIDAwLzEwXSBYZSBEUk0gc2NoZWR1bGVyIGFuZCBsb25nIHJ1bm5p
bmcgd29ya2xvYWQgcGxhbnMNCj4gDQo+IEhlbGxvLA0KPiANCj4gQXMgYSBwcmVyZXF1aXNpdGUg
dG8gbWVyZ2luZyB0aGUgbmV3IEludGVsIFhlIERSTSBkcml2ZXIgWzFdIFsyXSwgd2UNCj4gaGF2
ZSBiZWVuIGFza2VkIHRvIG1lcmdlIG91ciBjb21tb24gRFJNIHNjaGVkdWxlciBwYXRjaGVzIGZp
cnN0IGFzIHdlbGwNCj4gYXMgZGV2ZWxvcCBhIGNvbW1vbiBzb2x1dGlvbiBmb3IgbG9uZyBydW5u
aW5nIHdvcmtsb2FkcyB3aXRoIHRoZSBEUk0NCj4gc2NoZWR1bGVyLiBUaGlzIFJGQyBzZXJpZXMg
aXMgb3VyIGZpcnN0IGF0dGVtcHQgYXQgZG9pbmcgdGhpcy4gV2UNCj4gd2VsY29tZSBhbnkgYW5k
IGFsbCBmZWVkYmFjay4NCj4gDQo+IFRoaXMgY2FuIHdlIHRob3VnaHQgb2YgYXMgNCBwYXJ0cyBk
ZXRhaWxlZCBiZWxvdy4NCj4gDQo+IC0gRFJNIHNjaGVkdWxlciBjaGFuZ2VzIGZvciAxIHRvIDEg
cmVsYXRpb25zaGlwIGJldHdlZW4gc2NoZWR1bGVyIGFuZA0KPiBlbnRpdHkgKHBhdGNoZXMgMS0z
KQ0KPiANCj4gSW4gWGUgYWxsIG9mIHRoZSBzY2hlZHVsaW5nIG9mIGpvYnMgaXMgZG9uZSBieSBh
IGZpcm13YXJlIHNjaGVkdWxlciAodGhlDQo+IEd1Qykgd2hpY2ggaXMgYSBuZXcgcGFyYWRpZ20g
V1JUIHRvIHRoZSBEUk0gc2NoZWR1bGVyIGFuZCBwcmVzZW50cw0KPiBzZXZlcmFscyBwcm9ibGVt
cyBhcyB0aGUgRFJNIHdhcyBvcmlnaW5hbGx5IGRlc2lnbmVkIHRvIHNjaGVkdWxlIGpvYnMgb24N
Cj4gaGFyZHdhcmUgcXVldWVzLiBUaGUgbWFpbiBwcm9ibGVtIGJlaW5nIHRoYXQgRFJNIHNjaGVk
dWxlciBleHBlY3RzIHRoZQ0KPiBzdWJtaXNzaW9uIG9yZGVyIG9mIGpvYnMgdG8gYmUgdGhlIGNv
bXBsZXRpb24gb3JkZXIgb2Ygam9icyBldmVuIGFjcm9zcw0KPiBtdWx0aXBsZSBlbnRpdGllcy4g
VGhpcyBhc3N1bXB0aW9uIGZhbGxzIGFwYXJ0IHdpdGggYSBmaXJtd2FyZSBzY2hlZHVsZXINCj4g
YXMgYSBmaXJtd2FyZSBzY2hlZHVsZXIgaGFzIG5vIGNvbmNlcHQgb2Ygam9icyBhbmQgam9icyBj
YW4gY29tcGxldGUgb3V0DQo+IG9mIG9yZGVyLiBBIG5vdmVsIHNvbHV0aW9uIGZvciB3YXMgb3Jp
Z2luYWxseSB0aG91Z2h0IG9mIGJ5IEZhaXRoIGR1cmluZw0KPiB0aGUgaW5pdGlhbCBwcm90b3R5
cGUgb2YgWGUsIGNyZWF0ZSBhIDEgdG8gMSByZWxhdGlvbnNoaXAgYmV0d2VlbiBzY2hlZHVsZXIN
Cj4gYW5kIGVudGl0eS4gSSBiZWxpZXZlIHRoZSBBR1ggZHJpdmVyIFszXSBpcyB1c2luZyB0aGlz
IGFwcHJvYWNoIGFuZA0KPiBCb3JpcyBtYXkgdXNlIGFwcHJvYWNoIGFzIHdlbGwgZm9yIHRoZSBN
YWxpIGRyaXZlciBbNF0uDQo+IA0KPiBUbyBzdXBwb3J0IGEgMSB0byAxIHJlbGF0aW9uc2hpcCB3
ZSBtb3ZlIHRoZSBtYWluIGV4ZWN1dGlvbiBmdW5jdGlvbg0KPiBmcm9tIGEga3RocmVhZCB0byBh
IHdvcmsgcXVldWUgYW5kIGFkZCBhIG5ldyBzY2hlZHVsaW5nIG1vZGUgd2hpY2gNCj4gYnlwYXNz
ZXMgY29kZSBpbiB0aGUgRFJNIHdoaWNoIGlzbid0IG5lZWRlZCBpbiBhIDEgdG8gMSByZWxhdGlv
bnNoaXAuDQo+IFRoZSBuZXcgc2NoZWR1bGluZyBtb2RlIHNob3VsZCB1bmlmeSBhbGwgZHJpdmVy
cyB1c2FnZSB3aXRoIGEgMSB0byAxDQo+IHJlbGF0aW9uc2hpcCBhbmQgY2FuIGJlIHRob3VnaHQg
b2YgYXMgdXNpbmcgc2NoZWR1bGVyIGFzIGEgZGVwZW5kZW5jeSAvDQo+IGluZmxpZ3Qgam9iIHRy
YWNrZXIgcmF0aGVyIHRoYW4gYSB0cnVlIHNjaGVkdWxlci4NCj4gDQo+IC0gR2VuZXJpYyBtZXNz
YWdpbmcgaW50ZXJmYWNlIGZvciBEUk0gc2NoZWR1bGVyDQo+IA0KPiBJZGVhIGlzIHRvIGJlIGFi
bGUgdG8gY29tbXVuaWNhdGUgdG8gdGhlIHN1Ym1pc3Npb24gYmFja2VuZCB3aXRoIGluIGJhbmQN
Cj4gKHJlbGF0aXZlIHRvIG1haW4gZXhlY3V0aW9uIGZ1bmN0aW9uKSBtZXNzYWdlcy4gTWVzc2Fn
ZXMgYXJlIGJhY2tlbmQNCj4gZGVmaW5lZCBhbmQgZmxleGFibGUgZW5vdWdoIGZvciBhbnkgdXNl
IGNhc2UuIEluIFhlIHdlIHVzZSB0aGVzZQ0KPiBtZXNzYWdlcyB0byBjbGVhbiB1cCBlbnRpdGVz
LCBzZXQgcHJvcGVydGllcyBmb3IgZW50aXRlcywgYW5kIHN1c3BlbmQgLw0KPiByZXN1bWUgZXhl
Y3V0aW9uIG9mIGFuIGVudGl0eSBbNV0uIEkgc3VzcGVjdCBvdGhlciBkcml2ZXIgY2FuIGxldmVy
YWdlDQo+IHRoaXMgbWVzc2FnaW5nIGNvbmNlcHQgdG9vIGFzIGl0IGEgY29udmVuaWVudCB3YXkg
dG8gYXZvaWQgcmFjZXMgaW4gdGhlDQo+IGJhY2tlbmQuDQo+IA0KPiAtIFN1cHBvcnQgZm9yIHVz
aW5nIFREUiBmb3IgYWxsIGVycm9yIHBhdGhzIG9mIGEgc2NoZWR1bGVyIC8gZW50aXR5DQo+IA0K
PiBGaXggYSBmZXcgcmFjZXMgLyBidWdzLCBhZGQgZnVuY3Rpb24gdG8gZHluYW1pY2FsbHkgc2V0
IHRoZSBURFIgdGltZW91dC4NCj4gDQo+IC0gQW5ub3RhdGUgZG1hLWZlbmNlcyBmb3IgbG9uZyBy
dW5uaW5nIHdvcmtsb2Fkcy4NCj4gDQo+IFRoZSBpZGVhIGhlcmUgaXMgdG8gdXNlIGRtYS1mZW5j
ZXMgb25seSBhcyBzeW5jIHBvaW50cyB3aXRoaW4gdGhlDQo+IHNjaGVkdWxlciBhbmQgbmV2ZXIg
ZXhwb3J0IHRoZW0gZm9yIGxvbmcgcnVubmluZyB3b3JrbG9hZHMuIEJ5DQo+IGFubm90YXRpbmcg
dGhlc2UgZmVuY2VzIGFzIGxvbmcgcnVubmluZyB3ZSBlbnN1cmUgdGhhdCB0aGVzZSBkbWEtZmVu
Y2VzDQo+IGFyZSBuZXZlciB1c2VkIGluIGEgd2F5IHRoYXQgYnJlYWtzIHRoZSBkbWEtZmVuY2Ug
cnVsZXMuIEEgYmVuZWZpdCBvZg0KPiB0aHVzIGFwcHJvYWNoIGlzIHRoZSBzY2hlZHVsZXIgY2Fu
IHN0aWxsIHNhZmVseSBmbG93IGNvbnRyb2wgdGhlDQo+IGV4ZWN1dGlvbiByaW5nIGJ1ZmZlciB2
aWEgdGhlIGpvYiBsaW1pdCB3aXRob3V0IGJyZWFraW5nIHRoZSBkbWEtZmVuY2UNCj4gcnVsZXMu
DQo+IA0KPiBBZ2FpbiB0aGlzIGEgZmlyc3QgZHJhZnQgYW5kIGxvb2tpbmcgZm9yd2FyZCB0byBm
ZWVkYmFjay4NCj4gDQo+IEVuam95IC0gTWF0dA0KPiANCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsDQo+IFsyXSBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvc2VyaWVzLzExMjE4OC8NCj4gWzNdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvMTE0NzcyLw0KPiBbNF0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzUxNTg1NC8/c2VyaWVzPTExMjE4OCZyZXY9MQ0KPiBbNV0gaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9ibG9iL2RybS14ZS0NCj4g
bmV4dC9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jI0wxMDMxDQo+IA0KPiBNYXR0
aGV3IEJyb3N0ICg4KToNCj4gICBkcm0vc2NoZWQ6IENvbnZlcnQgZHJtIHNjaGVkdWxlciB0byB1
c2UgYSB3b3JrIHF1ZXVlIHJhdGhlciB0aGFuDQo+ICAgICBrdGhyZWFkDQo+ICAgZHJtL3NjaGVk
OiBNb3ZlIHNjaGVkdWxlIHBvbGljeSB0byBzY2hlZHVsZXIgLyBlbnRpdHkNCj4gICBkcm0vc2No
ZWQ6IEFkZCBEUk1fU0NIRURfUE9MSUNZX1NJTkdMRV9FTlRJVFkgc2NoZWR1bGluZyBwb2xpY3kN
Cj4gICBkcm0vc2NoZWQ6IEFkZCBnZW5lcmljIHNjaGVkdWxlciBtZXNzYWdlIGludGVyZmFjZQ0K
PiAgIGRybS9zY2hlZDogU3RhcnQgcnVuIHdxIGJlZm9yZSBURFIgaW4gZHJtX3NjaGVkX3N0YXJ0
DQo+ICAgZHJtL3NjaGVkOiBTdWJtaXQgam9iIGJlZm9yZSBzdGFydGluZyBURFINCj4gICBkcm0v
c2NoZWQ6IEFkZCBoZWxwZXIgdG8gc2V0IFREUiB0aW1lb3V0DQo+ICAgZHJtL3N5bmNvYmo6IFdh
cm4gb24gbG9uZyBydW5uaW5nIGRtYS1mZW5jZXMNCj4gDQo+IFRob21hcyBIZWxsc3Ryw7ZtICgy
KToNCj4gICBkbWEtYnVmL2RtYS1mZW5jZTogSW50cm9kdWNlIGxvbmctcnVubmluZyBjb21wbGV0
aW9uIGZlbmNlcw0KPiAgIGRybS9zY2hlZDogU3VwcG9ydCBsb25nLXJ1bm5pbmcgc2NoZWQgZW50
aXRpZXMNCj4gDQo+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgICAgICAgICAgICAgICAg
IHwgMTQyICsrKysrKystLS0NCj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jICAgICAgICAg
ICAgICAgICAgfCAgIDUgKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
YnVnZnMuYyB8ICAxNCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jICB8ICAxNSArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgICAgICAg
ICAgICAgICB8ICAgNSArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9zY2hl
ZC5jICAgICB8ICAgNSArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jICAg
ICAgICAgICB8ICAgNSArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2Rl
dmljZS5jICB8ICAgNiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fcmluZ2J1ZmZlci5j
ICAgICAgICB8ICAgNSArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pv
Yi5jICAgICB8ICAgNSArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRp
dHkuYyAgICB8IDEyNyArKysrKysrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfZmVuY2UuYyAgICAgfCAgIDYgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jICAgICAgfCAyNzggKysrKysrKysrKysrKysrLS0tLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS92M2QvdjNkX3NjaGVkLmMgICAgICAgICAgICAgfCAgMjUgKy0NCj4gIGluY2x1ZGUvZHJt
L2dwdV9zY2hlZHVsZXIuaCAgICAgICAgICAgICAgICAgfCAxMzAgKysrKysrKy0tDQo+ICBpbmNs
dWRlL2xpbnV4L2RtYS1mZW5jZS5oICAgICAgICAgICAgICAgICAgIHwgIDYwICsrKystDQo+ICAx
NiBmaWxlcyBjaGFuZ2VkLCA2NDkgaW5zZXJ0aW9ucygrKSwgMTg0IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gLS0NCj4gMi4zNC4xDQoNCg==
