Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8218573B09B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 08:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5375910E5D5;
	Fri, 23 Jun 2023 06:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8DE10E5D5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687500791; x=1719036791;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XrzlwT6VZ3ekbMpelHaYs9SJ9VsuHlkmlXF7pejfsAk=;
 b=hlOlTJZXHtkrDyHDVeLpKKCnxZfZ24KRkxj3Ovh+cV6EqTJmSPNwEUyz
 DOO44UpBWyJNEwH92RFwmWXvlmXl29UwadAFe5juLP81SRObs9FkgS9+X
 4Rj2T/V6XTAXP3frReAIp4nu1aTWYK17wNIcDa4LA0FsJBCmTFrXvOwOn
 fO1y+MjZ8m4w/zn0RC6fozdDH1Mwdz7V2N9jdaJDoUMmLqksg/larlAbE
 zBO0690HCKFtrxQNNIzu3szNy68RUh+QmTTzMdq9jfUPQjfPQOeZXhs5y
 A4zTzFpcxa9dGnMhuosDziiz4ELJb3s76HiVsGLEMP4ssPnuFe9vs1479 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350463088"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="350463088"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 23:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="839330172"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="839330172"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 22 Jun 2023 23:13:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 23:13:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 22 Jun 2023 23:13:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 23:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEY6M/wpuAXLUQEctWVp/+uuss6pEq5q/s5/isIfwz/jv5eTb3I3YzhBfOdpNDlwxSz7XaUzf1OG667xmtiwIgzuEamSkmGQ4YrMdwiK9maAsbhXrJx+QsnpTgvRmhH/zsGR63YImrB21PPN/VfA3jNkEKg+hQuaZXZLUQkIsZdAg2K53YLVtWh17VIN2wrAXN64aM4VL2kkW9ezhxpCM/3bulPs5Cnp5O9tR0YlC2hgBkmOVEsXyrXA7hth2VgHposV7LFfRjSt62k2tUIb/bX5XqnFb9Mf7WaFbbHqUrOJ0KDUxDdVh5J2x2o42vEzRgFDIMlTjfZtN76EbnFORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrzlwT6VZ3ekbMpelHaYs9SJ9VsuHlkmlXF7pejfsAk=;
 b=k/hPHnTHWms6/yCDcVm9gNpcVfR3IWoOOH12daSW465e3k2DEkxD80g/+DbkjN2kp76KAFKObnI63YRjHbvJmBtmt+YxGc1B3cSv3BnjkRGMwNcj9vqO/ivIddhnbSxUBnPe0xMAvbntspL/Nsqn45zUgnyQz26cz4hC81el6bh1QbQI1zij5ogvfCwhP5GYXYXeTJSDJ9eXFirzvuyWid1JDYoIUA0/zJPLF3MXy/wDsFOKZ6OMgpWXZ7pzY8fX6/QnBsx3rOCACDrMXBphPATX2UluKLgiRqXW7XY3WS6FVsbsOcSc0BeEw6jin62chnU6Q0rKUiz7ongihzuSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 06:13:02 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 06:13:02 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: RE: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Thread-Topic: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb
 pages
Thread-Index: AQHZpN59yPT6xb778USyK3pSaYthDa+WfGmAgAD+79A=
Date: Fri, 23 Jun 2023 06:13:02 +0000
Message-ID: <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
In-Reply-To: <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS0PR11MB7558:EE_
x-ms-office365-filtering-correlation-id: a215554b-95d7-4f92-0c7e-08db73b0e67e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yW5+WGTE0VBbpPRTQmtNJ7dkiUxKVVQ3DwCRjWRnzzpVyTLJ9cqhv1XQms0vQf28W2t8YKhoM0lW2iBNuLd9QXwZy5FR/PWi1nPtZ0CAViwS1F4u3o7rXgRvE1/YYVHualVuT5BIJtgad3BwswbXf8qxw0nKiTuAWhpTPS9QpGwzlKiAEFgYIAEXKCEjXHTOVxnpuNk4boucy98wa0WrqiiywbmTwX2gmCqrlOxQgB0CgX9AUm5n/cUzijJlGk6rU77BNJiFfUgwvFTkmFV0HgYo1sn9yPvYWdJ7+Jg2YnXXfZHoV1TEICi+fPGn1lUGG83/JAiS/4qXRjL5XCJT/OjTV886etGl4lDvkhSI7nUvMjeGv7TTgn5DSjyNb8qrwZ0yLK8KPpaKflmOPB5DhlLD31xU4zFBsMQlpgF0r5nNhpvF6FiqMPpQDQufbYu937bXKNbRsTeVqyUJ/qIb3uQ74dKrb8eDG5+FuiGx42hazi7poPCaRZSGibS/1spG+w3SXlawVm4sPmvO5h7E4F8+Ut62mFrL88FnPfwly3CbJriklA9tv3si5WgJyO5CdZBPj24LE7k21Loz0/YgV8VcbXTjg1Ic6JBXYEUAm9Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(966005)(7696005)(38100700002)(38070700005)(86362001)(82960400001)(186003)(26005)(6506007)(9686003)(71200400001)(33656002)(122000001)(83380400001)(55016003)(8676002)(8936002)(41300700001)(2906002)(7416002)(316002)(4326008)(64756008)(66446008)(66556008)(66476007)(66946007)(76116006)(478600001)(54906003)(110136005)(66899021)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXFHWG1nb1p0UXEyMm10OUp5VEdMYUVJWTdhL2g4MjY1RHdXTU9LeWN2aGEy?=
 =?utf-8?B?Kzd3L3VjdWg5L0Z1ZjZRVTdZeTdUbW04Z1JmWXlrSmhSdDZWY3U0QkthZ2F1?=
 =?utf-8?B?Wlg3MlpUcStzNlIydEp6WWN1bjhzS1E0dlVXeTN6am1GMGNRdm1XVTdJWXlm?=
 =?utf-8?B?RU1XSjNVZXFQdkZKUHViT0Z3dFg1YjNEWXBIdE1kemQybk80Z1Bjc2pNbnlQ?=
 =?utf-8?B?WDh0UFBrWmxMbGk4M042Z1hrcVVVZndaVzQxU2dhUjROLzQxZXlZNEM5NGx6?=
 =?utf-8?B?Mm5UeUtTVFY5em5rRHZXaUdYMWJZRUwxWXdzV1kwQitOd1RiK2g4KzdIRTRm?=
 =?utf-8?B?dVFYamM5NHlWK3VRK2trYTlQdnU5MjhEZGlHY0xralJ6cWhBTnd0bXhXSEM4?=
 =?utf-8?B?Z3dla0F1NklRMmYyTDdCRGhVKzBDWG5WVGx5aEJ2RXFBTEEwRVZ1WlBrSVR4?=
 =?utf-8?B?Z0wzMDNURURpOXVrMUQxck1hWFJlZHNTQVg5azFCeElhL1IrM3lwMDZveC9K?=
 =?utf-8?B?MFdIYXlQc3BPZXE4WFhRdDArZGNHcG5OT2RRMkE4bjM3NFRvd2phbS9aQjl0?=
 =?utf-8?B?SklCV2t0NzBjL1dFTlp0elBrU2lvRlUvU1FUTnVDR3F5VU4rNFEvYmdhWlhK?=
 =?utf-8?B?Y2RzZVFOb0FTVGxvZVpDN3gvRlhTc0hQZGV3NGhpUUdJYS9Ta1k0NUxqQnFG?=
 =?utf-8?B?cDlIK1VWY2w5Smk3YWdSdkpSbXVMN0RJZTlGZWY4anZ2cENaL1JzMHZhMGMr?=
 =?utf-8?B?SzZxMFRqRElIL3NNUTRBWnNMVXJlU01MdVRCS2s3ODN4dFRKdVB4NVpGYlNU?=
 =?utf-8?B?Unl4MEowZWp6VjRwKzhEUVRVQzhpS0hzZTVTQ1NwOGYzUkhlZ0ZGN0FNSzFU?=
 =?utf-8?B?ZU9DQjlucDcrZy8xYUFzNWtROVl3bG56dENKM3NueTc1OCtkY1Jic2hZZEdO?=
 =?utf-8?B?NWJzTlcyQmdNNjdQekViZ1JZSFN0VFN6Njd5emVuVXlqOVp0dnV5NktwQ1VN?=
 =?utf-8?B?R2FyN3o4bW5OcTJaeHpZYmM5Y3plcjZiSFQ4QndMeXJDSk1mbXp4a1VJNy9i?=
 =?utf-8?B?QkhwUkNNK25HcEJUNEt0S2x0VU95N3RmU3RTN28zTndCM3F0SkUrWmV4c01t?=
 =?utf-8?B?K1h0cHdva3dZMnp2bGtmSXNMUnE2KzgzSTlDeEJyNmFNVS8ybVkxQ1dRQXV3?=
 =?utf-8?B?R3dpODgxNnAxYTh3NmVraWVKeHE1YzUwNEwzVGVSMC90VFpFUXlLWFM0VTVS?=
 =?utf-8?B?ZHRjbFJCMEhjaFFkQ0Q4aEhGNjVwM3lyTStuM0FIY3k1Y1FHY0l0N0VnM1hL?=
 =?utf-8?B?YnVjTnRKV3E4WFpnOEwzeEtvYmI5V1JQRXRETG9lcXZ1cVdEYmx1M2k3K0FQ?=
 =?utf-8?B?ZlNXZzRSZ3JIQ2xzTmR6UEJMcFU5VHovdjVuUW44R1JUeDFPK2JlOGE3eG04?=
 =?utf-8?B?eUR0SDNjRUNOVDJhNDltbGxhakg4WG9GakYyVGpzTWtBNE1Idndqd3ZGME1t?=
 =?utf-8?B?SndGZENIZXd2OG94cjI0SDlidnFRVDVmN1UzSGUvdTdsaUhLbm1kdVh2QVEr?=
 =?utf-8?B?WkhETDVDZC9lWVU2aklScDVRVEVxSjNjOGFVbHFhaFNQUW5hRnBMNDI2V240?=
 =?utf-8?B?SDFZdENjU1d6RTNGYm1sdXU4UDM0c29TTU84OE14cnh5SzRPUWxkQmlYUXRD?=
 =?utf-8?B?ZXRrUUZ0M084bzQzc2prRDQzVXZyWTdEc3U4UHJYUzh1WWphaXk4R0svMENS?=
 =?utf-8?B?MmFtbnhWVTBXcytWT09LMEtPbW83U3JxMU12OGhFd1VRRXlrVklRNFpPVUxB?=
 =?utf-8?B?NXNraDM4K282QjQyQjdjQzZXUWw1V3BsWkk4ZTVNL1VSby9SRW1zWjhuWTdo?=
 =?utf-8?B?OTB6aGZ0VmRVWkhnbUMrcFpBVzdOWXdLMmg5dzJQVE1NK2V5UjZSU1pOSDc4?=
 =?utf-8?B?M0Vjd0hmWVdzbmZpcGtEQjEzOTNTSG5QTTkxUzAxU1NXOCtKdTJYR1hHbDlk?=
 =?utf-8?B?T25BY1NhRG9ZK0lKbktkaXM4UURyTHpwOGU4Z0h5N0lBb2hBOTQ0VU02OFVI?=
 =?utf-8?B?eEhrY0dFNHpCVC9waXpUc0l2QmhYZmRZenJpZjZ5YmdNZkE0VlBQK2Z0U1pm?=
 =?utf-8?Q?uRdF0OzCOO17Ap8KXdDgKhqcR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a215554b-95d7-4f92-0c7e-08db73b0e67e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 06:13:02.1045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZkyyGAaQtx5oCRGbXQ0KwuY46hQEeCXMuZb9XGJAcGyf8ha7NOBog42Cr5vweoKtX8Wt3MbCIfcGx9WPN3oxujLy5sLPcIVhyGKjLDJnnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
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
Cc: James Houghton <jthoughton@google.com>, Jerome
 Marchand <jmarchan@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 "Hocko, Michal" <mhocko@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQoNCj4gPiBUaGUgZmlyc3QgcGF0Y2ggZW5zdXJlcyB0aGF0IHRoZSBtYXBwaW5n
cyBuZWVkZWQgZm9yIGhhbmRsaW5nIG1tYXANCj4gPiBvcGVyYXRpb24gd291bGQgYmUgbWFuYWdl
ZCBieSB1c2luZyB0aGUgcGZuIGluc3RlYWQgb2Ygc3RydWN0IHBhZ2UuDQo+ID4gVGhlIHNlY29u
ZCBwYXRjaCByZXN0b3JlcyBzdXBwb3J0IGZvciBtYXBwaW5nIGh1Z2V0bGIgcGFnZXMgd2hlcmUN
Cj4gPiBzdWJwYWdlcyBvZiBhIGh1Z2VwYWdlIGFyZSBub3QgZGlyZWN0bHkgdXNlZCBhbnltb3Jl
IChtYWluIHJlYXNvbg0KPiA+IGZvciByZXZlcnQpIGFuZCBpbnN0ZWFkIHRoZSBodWdldGxiIHBh
Z2VzIGFuZCB0aGUgcmVsZXZhbnQgb2Zmc2V0cw0KPiA+IGFyZSB1c2VkIHRvIHBvcHVsYXRlIHRo
ZSBzY2F0dGVybGlzdCBmb3IgZG1hLWJ1ZiBleHBvcnQgYW5kIGZvcg0KPiA+IG1tYXAgb3BlcmF0
aW9uLg0KPiA+DQo+ID4gVGVzdGNhc2U6IGRlZmF1bHRfaHVnZXBhZ2Vzej0yTSBodWdlcGFnZXN6
PTJNIGh1Z2VwYWdlcz0yNTAwDQo+IG9wdGlvbnMNCj4gPiB3ZXJlIHBhc3NlZCB0byB0aGUgSG9z
dCBrZXJuZWwgYW5kIFFlbXUgd2FzIGxhdW5jaGVkIHdpdGggdGhlc2UNCj4gPiByZWxldmFudCBv
cHRpb25zOiBxZW11LXN5c3RlbS14ODZfNjQgLW0gNDA5Nm0uLi4uDQo+ID4gLWRldmljZSB2aXJ0
aW8tZ3B1LXBjaSxtYXhfb3V0cHV0cz0xLGJsb2I9dHJ1ZSx4cmVzPTE5MjAseXJlcz0xMDgwDQo+
ID4gLWRpc3BsYXkgZ3RrLGdsPW9uDQo+ID4gLW9iamVjdCBtZW1vcnktYmFja2VuZC1tZW1mZCxo
dWdldGxiPW9uLGlkPW1lbTEsc2l6ZT00MDk2TQ0KPiA+IC1tYWNoaW5lIG1lbW9yeS1iYWNrZW5k
PW1lbTENCj4gPg0KPiA+IFJlcGxhY2luZyAtZGlzcGxheSBndGssZ2w9b24gd2l0aCAtZGlzcGxh
eSBndGssZ2w9b2ZmIGFib3ZlIHdvdWxkDQo+ID4gZXhlcmNpc2UgdGhlIG1tYXAgaGFuZGxlci4N
Cj4gPg0KPiANCj4gV2hpbGUgSSB0aGluayB0aGUgVk1fUEZOTUFQIGFwcHJvYWNoIGlzIG11Y2gg
YmV0dGVyIGFuZCBzaG91bGQgZml4IHRoYXQNCj4gaXNzdWUgYXQgaGFuZCwgSSB0aG91Z2h0IG1v
cmUgYWJvdXQgbWlzc2luZyBtZW1sb2NrIHN1cHBvcnQgYW5kIHJlYWxpemVkDQo+IHRoYXQgd2Ug
bWlnaHQgaGF2ZSB0byBmaXggc29tZXRoaW5nIGVsc2UuIFNPIEknbSBnb2luZyB0byByYWlzZSB0
aGUNCj4gaXNzdWUgaGVyZS4NCj4gDQo+IEkgdGhpbmsgdWRtYWJ1ZiBjaG9zZSB0aGUgd3Jvbmcg
aW50ZXJmYWNlIHRvIGRvIHdoYXQgaXQncyBkb2luZywgdGhhdA0KPiBtYWtlcyBpdCBoYXJkZXIg
dG8gZml4IGl0IGV2ZW50dWFsbHkuDQo+IA0KPiBJbnN0ZWFkIG9mIGFjY2VwdGluZyBhIHJhbmdl
IGluIGEgbWVtZmQsIGl0IHNob3VsZCBqdXN0IGhhdmUgYWNjZXB0ZWQgYQ0KPiB1c2VyIHNwYWNl
IGFkZHJlc3MgcmFuZ2UgYW5kIHRoZW4gdXNlZA0KPiBwaW5fdXNlcl9wYWdlcyhGT0xMX1dSSVRF
fEZPTExfTE9OR1RFUk0pIHRvIGxvbmd0ZXJtLXBpbiB0aGUgcGFnZXMNCj4gIm9mZmljaWFsbHki
Lg0KVWRtYWJ1ZiBpbmRlZWQgc3RhcnRlZCBvZmYgYnkgdXNpbmcgdXNlciBzcGFjZSBhZGRyZXNz
IHJhbmdlIGFuZCBHVVAgYnV0DQp0aGUgZG1hLWJ1ZiBzdWJzeXN0ZW0gbWFpbnRhaW5lciBoYWQg
Y29uY2VybnMgd2l0aCB0aGF0IGFwcHJvYWNoIGluIHYyLg0KSXQgYWxzbyBoYWQgc3VwcG9ydCBm
b3IgbWxvY2sgaW4gdGhhdCB2ZXJzaW9uLiBIZXJlIGlzIHYyIGFuZCB0aGUgcmVsZXZhbnQNCmNv
bnZlcnNhdGlvbjoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yMTA5
OTIvP3Nlcmllcz0zOTg3OSZyZXY9Mg0KDQo+IA0KPiBTbyB3aGF0J3MgdGhlIGlzc3VlPyBVZG1h
IGVmZmVjdGl2ZWx5IHBpbnMgcGFnZXMgbG9uZ3Rlcm0gKCJwb3NzaWJseQ0KPiBmb3JldmVyIikg
c2ltcGx5IGJ5IGdyYWJiaW5nIGEgcmVmZXJlbmNlIG9uIHRoZW0uIFRoZXNlIHBhZ2VzIG1pZ2h0
DQo+IGVhc2lseSByZXNpZGUgaW4gWk9ORV9NT1ZBQkxFIG9yIGluIE1JR1JBVEVfQ01BIHBhZ2Vi
bG9ja3MuDQo+IA0KPiBTbyB3aGF0IHVkbWFidWYgZG9lcyBpcyBicmVhayBtZW1vcnkgaG90dW5w
bHVnIGFuZCBDTUEsIGJlY2F1c2UgaXQNCj4gdHVybnMNCj4gcGFnZXMgdGhhdCBoYXZlIHRvIHJl
bWFpbiBtb3ZhYmxlIHVubW92YWJsZS4NCj4gDQo+IEluIHRoZSBwaW5fdXNlcl9wYWdlcyhGT0xM
X0xPTkdURVJNKSBjYXNlIHdlIG1ha2Ugc3VyZSB0byBtaWdyYXRlDQo+IHRoZXNlDQo+IHBhZ2Vz
LiBTZWUgbW0vZ3VwLmM6Y2hlY2tfYW5kX21pZ3JhdGVfbW92YWJsZV9wYWdlcygpIGFuZCBlc3Bl
Y2lhbGx5DQo+IGZvbGlvX2lzX2xvbmd0ZXJtX3Bpbm5hYmxlKCkuIFdlJ2QgcHJvYmFibHkgaGF2
ZSB0byBpbXBsZW1lbnQgc29tZXRoaW5nDQo+IHNpbWlsYXIgZm9yIHVkbWFidWYsIHdoZXJlIHdl
IGRldGVjdCBzdWNoIHVucGlubmFibGUgcGFnZXMgYW5kIG1pZ3JhdGUNCj4gdGhlbS4NClRoZSBw
YWdlcyB1ZG1hYnVmIHBpbnMgYXJlIG9ubHkgdGhvc2UgYXNzb2NpYXRlZCB3aXRoIEd1ZXN0IChH
UFUgZHJpdmVyL3ZpcnRpby1ncHUpDQpyZXNvdXJjZXMgKG9yIGJ1ZmZlcnMgYWxsb2NhdGVkIGFu
ZCBwaW5uZWQgZnJvbSBzaG1lbSB2aWEgZHJtIEdFTSkuIFNvbWUNCnJlc291cmNlcyBhcmUgc2hv
cnQtbGl2ZWQsIGFuZCBzb21lIGFyZSBsb25nLWxpdmVkIGFuZCB3aGVuZXZlciBhIHJlc291cmNl
DQpnZXRzIGRlc3Ryb3llZCwgdGhlIHBhZ2VzIGFyZSB1bnBpbm5lZC4gQW5kLCBub3QgYWxsIHJl
c291cmNlcyBoYXZlIHRoZWlyIHBhZ2VzDQpwaW5uZWQuIFRoZSByZXNvdXJjZSB0aGF0IGlzIHBp
bm5lZCBmb3IgdGhlIGxvbmdlc3QgZHVyYXRpb24gaXMgdGhlIEZCIGFuZCB0aGF0J3MNCmJlY2F1
c2UgaXQgaXMgdXBkYXRlZCBldmVyeSB+MTZtcyAoYXNzdW1pbmcgMTkyMHgxMDgwQDYwKSBieSB0
aGUgR3Vlc3QNCkdQVSBkcml2ZXIuIFdlIGNhbiBjZXJ0YWlubHkgcGluL3VucGluIHRoZSBGQiBh
ZnRlciBpdCBpcyBhY2Nlc3NlZCBvbiB0aGUgSG9zdA0KYXMgYSB3b3JrYXJvdW5kLCBidXQgSSBn
dWVzcyB0aGF0IG1heSBub3QgYmUgdmVyeSBlZmZpY2llbnQgZ2l2ZW4gdGhlIGFtb3VudA0Kb2Yg
Y2h1cm4gaXQgd291bGQgY3JlYXRlLg0KDQpBbHNvLCBhcyBmYXIgYXMgbWlncmF0aW9uIG9yIFMz
L1M0IGlzIGNvbmNlcm5lZCwgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGFsbA0KdGhlIEd1ZXN0
IHJlc291cmNlcyBhcmUgZGVzdHJveWVkIGFuZCByZWNyZWF0ZWQgYWdhaW4uIFNvLCB3b3VsZG4n
dCBzb21ldGhpbmcNCnNpbWlsYXIgaGFwcGVuIGR1cmluZyBtZW1vcnkgaG90dW5wbHVnPw0KDQo+
IA0KPiANCj4gRm9yIGV4YW1wbGUsIHBhaXJpbmcgdWRtYWJ1ZiB3aXRoIHZmaW8gKHdoaWNoIHBp
bnMgcGFnZXMgdXNpbmcNCj4gcGluX3VzZXJfcGFnZXMoRk9MTF9MT05HVEVSTSkpIGluIFFFTVUg
d2lsbCBtb3N0IHByb2JhYmx5IG5vdCB3b3JrIGluDQo+IGFsbCBjYXNlczogaWYgdWRtYWJ1ZiBs
b25ndGVybSBwaW5uZWQgdGhlIHBhZ2VzICJ0aGUgd3Jvbmcgd2F5IiwgdmZpbw0KPiB3aWxsIGZh
aWwgdG8gbWlncmF0ZSB0aGVtIGR1cmluZyBGT0xMX0xPTkdURVJNIGFuZCBjb25zZXF1ZW50bHkg
ZmFpbA0KPiBwaW5fdXNlcl9wYWdlcygpLiBBcyBsb25nIGFzIHVkbWFidWYgaG9sZHMgYSByZWZl
cmVuY2Ugb24gdGhlc2UgcGFnZXMsDQo+IHRoYXQgd2lsbCBuZXZlciBzdWNjZWVkLg0KRG1hLWJ1
ZiBydWxlcyAoZm9yIGV4cG9ydGVycykgaW5kaWNhdGUgdGhhdCB0aGUgcGFnZXMgb25seSBuZWVk
IHRvIGJlIHBpbm5lZA0KZHVyaW5nIHRoZSBtYXBfYXR0YWNobWVudCBwaGFzZSAoYW5kIHVudGls
IHVubWFwIGF0dGFjaG1lbnQgaGFwcGVucykuDQpJbiBvdGhlciB3b3Jkcywgb25seSB3aGVuIHRo
ZSBzZ190YWJsZSBpcyBjcmVhdGVkIGJ5IHVkbWFidWYuIEkgZ3Vlc3Mgb25lDQpvcHRpb24gd291
bGQgYmUgdG8gbm90IGhvbGQgYW55IHJlZmVyZW5jZXMgZHVyaW5nIFVETUFCVUZfQ1JFQVRFIGFu
ZA0Kb25seSBncmFiIHJlZmVyZW5jZXMgdG8gdGhlIHBhZ2VzIChhcyBhbmQgd2hlbiBpdCBnZXRz
IHVzZWQpIGR1cmluZyB0aGlzIHN0ZXAuDQpXb3VsZCB0aGlzIGhlbHA/DQoNCj4gDQo+IA0KPiBU
aGVyZSBhcmUgKnByb2JhYmx5KiBtb3JlIGlzc3VlcyBvbiB0aGUgUUVNVSBzaWRlIHdoZW4gdWRt
YWJ1ZiBpcw0KPiBwYWlyZWQNCj4gd2l0aCB0aGluZ3MgbGlrZSBNQURWX0RPTlRORUVEL0ZBTExP
Q19GTF9QVU5DSF9IT0xFIHVzZWQgZm9yDQo+IHZpcnRpby1iYWxsb29uLCB2aXJ0aW8tbWVtLCBw
b3N0Y29weSBsaXZlIG1pZ3JhdGlvbiwgLi4uIGZvciBleGFtcGxlLCBpbg0KPiB0aGUgdmZpby92
ZHBhIGNhc2Ugd2UgbWFrZSBzdXJlIHRoYXQgd2UgZGlzYWxsb3cgbW9zdCBvZiB0aGVzZSwgYmVj
YXVzZQ0KPiBvdGhlcndpc2UgdGhlcmUgY2FuIGJlIGFuIGFjY2lkZW50YWwgImRpc2Nvbm5lY3Qi
IGJldHdlZW4gdGhlIHBhZ2VzDQo+IG1hcHBlZCBpbnRvIHRoZSBWTSAoZ3Vlc3QgdmlldykgYW5k
IHRoZSBwYWdlcyBtYXBwZWQgaW50byB0aGUgSU9NTVUNCj4gKGRldmljZSB2aWV3KSwgZm9yIGV4
YW1wbGUsIGFmdGVyIGEgcmVib290Lg0KT2s7IEkgYW0gbm90IHN1cmUgaWYgSSBjYW4gZmlndXJl
IG91dCBpZiB0aGVyZSBpcyBhbnkgYWNjZXB0YWJsZSB3YXkgdG8gYWRkcmVzcw0KdGhlc2UgaXNz
dWVzIGJ1dCBnaXZlbiB0aGUgY3VycmVudCBjb25zdHJhaW50cyBhc3NvY2lhdGVkIHdpdGggdWRt
YWJ1Ziwgd2hhdA0KZG8geW91IHN1Z2dlc3QgaXMgdGhlIG1vc3QgcmVhc29uYWJsZSB3YXkgdG8g
ZGVhbCB3aXRoIHRoZXNlIHByb2JsZW1zIHlvdQ0KaGF2ZSBpZGVudGlmaWVkPw0KDQpUaGFua3Ms
DQpWaXZlaw0KDQo+IA0KPiAtLQ0KPiBDaGVlcnMsDQo+IA0KPiBEYXZpZCAvIGRoaWxkZW5iDQoN
Cg==
