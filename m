Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065B72DC63
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 10:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53EB10E225;
	Tue, 13 Jun 2023 08:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4910C10E225
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686644783; x=1718180783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tGdlH38NjwE5rDPkh8tzpNcB4IF3vev/QJJyZtxanFQ=;
 b=nS5dy1PLHrC5BUTHgTLjCgSjjRZYkosvtL0zJ5SUqrFL9izkWXJU/Jls
 EvMJKolZkK7mAoE8wdl1rLcfF56Ak1ML3MOS14Mrgvir3rQi48Wwr1b5t
 2osfKpvEvgb0yrLSTI3s7xou8O6lQTqoEv64PyI9GDSKd+ekvHg/B08+8
 7HYfoaeA1k6McJ3AjNqWE4+DaRYN8S8ySoE0ihMUuGkZy/CBLP6nXp0y2
 t1HMrSyRlXMrVDFNRv/iXiunIRTdL4i6ULlKT/2WVfJbCu4U7NJ5OUQ+f
 8Kds9ypckAeYt0K9NQZ99+jAmC2GwsMajGRigd+wbcH9AC29Dvf9ac6B/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361636663"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="361636663"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="885765201"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="885765201"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 13 Jun 2023 01:26:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 01:26:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 01:26:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 01:26:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 01:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1cAZn41BW5+6+gBY02bQ2XN0oG0oFEOKBbCc4BMeskjZ3ARG6LvXlu1WmB3MUDbnmybR0XeE7JLc8GEPcguvvqXJRpC5z8bC9hcwAZGwBvKiry+9KVYe1mWwR2NIl8SroGAzp0yDrUYGnNZpXwf/5ZxJ/WxRGw06e+hi5bwiLbq3xTw7ijJvPpMaVX0ZskkRS7JdzHvMKUXis2vUG/hBi84vVOqT6GBZnTMP21Xs5wVPi9wOB2C3RHZcgRUgZvCPRN8HBzaanJ9/TPaJEf8Qa36A+byzKIU82OQNLGjNpqN1S/T6c6Vno8eB+LpzQiThcg48O8Zq4Yjj7ML57u9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGdlH38NjwE5rDPkh8tzpNcB4IF3vev/QJJyZtxanFQ=;
 b=X85xFccuUzlUu2z1QhOOXmfJ8piGj2Xo7kTRjBIGLIPfZt1PieQXEjRtCYcEvhZVz36WEWSCuZxkAN2sHqq+oprAX5HfkpsYcAuxNSy27gPCkxzJFK2Ch9rRlNs+w+aHzrZLp7UjZzRRLgnRb7+k5croJ5t5/lxAU2SEjse7nPC0h7Al7qFajd3F8iepvyUN+h6zG+BlzXVxszPCpkJNFbOE4kSbEkowpYPGgAspXOqJ/ABMft59EdTKG9dhdEXhlwSlznvWfL94GytHP+cfOnwJzF+h7UQ3OQNFqqAwCgzn7IPC1Uumo4zPAi4YfCeny2kSPAmu06mssECx+jVz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 08:26:15 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a%5]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 08:26:14 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, Mike Kravetz
 <mike.kravetz@oracle.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Hugh Dickins
 <hughd@google.com>
Subject: RE: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Thread-Topic: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Thread-Index: AQHZmkrTMFwnMH2R1EGnnRur83Hw9a+FyCfggAEHOQCAAT7FoA==
Date: Tue, 13 Jun 2023 08:26:13 +0000
Message-ID: <IA0PR11MB71852D6B27C83658670CBFBDF855A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230608204927.88711-1-mike.kravetz@oracle.com>
 <IA0PR11MB71851B64A5E7062E3BDD8D2FF854A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <281caf4f-25da-3a73-554b-4fb252963035@redhat.com>
In-Reply-To: <281caf4f-25da-3a73-554b-4fb252963035@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH0PR11MB5219:EE_
x-ms-office365-filtering-correlation-id: f82362f5-501f-439d-55f6-08db6be7d9c4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IsVp/91QE5+8wdkN661amN31dMsFKIzWxWH4C6EaE4WaZLtb3UnX0OzDwBwyJ9k6mQcn1inVGaIMNXsRx0jC+IBZ2q6r57DwzRzDlabCrmYwK6Hi9yvIpEDU/dMvKEnDwFwmoW6CoMoFp0yk2Ldu/0MyFkomwJRR/cBeGUVswEOkn/InM2HQLIeEnwfgSY4MiOSZ1N1wkc6FxmFsib936mx/PWOZ1SmvJuUI570WA7h4Y1+TDwvZkE3CAUKqwL+aBPIufsHleHZoW1qfmFZUBq7Fr+Oao2wpH1441VsHLkgK6vHIjw65Jwdbbh5i0+4j8Q1tgEiGcXSDoOzISs/4xnM3OlpdFQXMlBHSPeeW7GIKRPfyQFXz55vwSJPMnPgTezHUZAStjrG48oKjPyKcQ1BSUQvVhvUxPVMkOJl52en+3MSII9LOcJ4IAOCSpr6VTnNU2NtVmOrn3+Io9ul+VgHF7A+Ia9J2YVOktVxMseJ6XIam7kf16b1hVAYSOQSbyDk5m/MFnlxTEXZ1QUezFXhZcm+8o91FJs5YkFOKC7AoYqkm4TXa85WATK9DIrRa+AAv/zo5eEl2U2kpMuWC2O3El14VvV78m8QI5wlHOfQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199021)(33656002)(38070700005)(2906002)(52536014)(7416002)(86362001)(5660300002)(55016003)(83380400001)(71200400001)(7696005)(186003)(6506007)(9686003)(26005)(53546011)(478600001)(122000001)(82960400001)(110136005)(54906003)(66446008)(66476007)(66946007)(316002)(76116006)(4326008)(66556008)(966005)(41300700001)(64756008)(38100700002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlNiMGdHbFYzM2lXeWdXT1BiVmNkWG9xN0ptTUcwOFlDQkFhUXNzMi9SN2JF?=
 =?utf-8?B?bEVhWDVZNXFFdW00RncxRTRIOUtra1JUcm55S0xlWStWbzl4bkpFVGZTMm52?=
 =?utf-8?B?L3VsbUhVT1l6Zk4zQWRlQnpZeFIwSUoydlpsNUpvSnByTldVZ3RLQlR3UWtZ?=
 =?utf-8?B?WWRWdDhtUDhCR0dJSGcyVkQrUk12UXB5N2FGOWNUd3ZpZ0g5Y2RBS3poMHJN?=
 =?utf-8?B?Szl6djMwbGRTZjlzN25DWEpSRGlWWnpibVhzQzkrNU9NRlJzRno3Tk0zbXI1?=
 =?utf-8?B?STZFc3JrSU1kZHViZ2MvcGwvZjRKT3NTSEVMTXV2MlMwMXdudU5vb2hyN2Fj?=
 =?utf-8?B?bGR2ZTRtWjVYUEN2R0dnUGZaU3hjaGdTZkJrYTRBeXRTNGhzaldMeDU1QmdL?=
 =?utf-8?B?b0RsVy9xM0VEQUhmdVd2aGR6ajA0dk1qYkpZdm4xc2hJVE5xOVM3eHdYS0o4?=
 =?utf-8?B?b3dBU21kb21nL1lDN0FvdUNMWjQrZUErQ2VaK3JIejVVREE3QVQyczFRalFp?=
 =?utf-8?B?NU9EOEFHZXNjY2g2d3pJTE15WEZYZm1KRkE5L1QyeDF0QllkZmNyTUJyV1lS?=
 =?utf-8?B?QUxNaWJqeHAzdTN5M1dtVG0yWW1xWWxCcGduRUV5V09YcCtXTHc2Z3ZnWGFN?=
 =?utf-8?B?S1A1Y2FFa1lEZ2VZSmtVWWtSS1VUb0JMOHNjaDE5NHkrRStPRkplby9xTlFp?=
 =?utf-8?B?WWNVeDk1cWZrOGZDSFFGY3NHRnRSbWd4WVEwei91dyt5bzBKYXc0Z3BKQ1JS?=
 =?utf-8?B?QkxrUTdnOXpyUnJiN3BkN1hNcG1ZZllRZTdDU3E0c0RLV3RNaXdKN3VzdTFI?=
 =?utf-8?B?Y01HZFROQ2N2TE1TOWxIU3AyeVFWOFhJOGpVN0NWN2ZUaURYL013S0w0M1JR?=
 =?utf-8?B?NVhXanVIejNlK0h5K1lmeXZuWHlhMlRteXNtMk12Wk9oTUJHNzExdWpkemNo?=
 =?utf-8?B?dWtQKytqbEd1MXRlVUg3QllvVWVTUVlEazJQREM5TlptTExjMWZsYmFuYkoy?=
 =?utf-8?B?ektRR2dkNExYbXVSM1hjSGgvb3E1ZE05L2tsT2tMMmk3WE9Fb201L240SHdq?=
 =?utf-8?B?akkxWHFKVHVFUmhNSVc5VmlnVkhDdGh4SjB1cnBYMGhPSzBlckhaT0NHVkFI?=
 =?utf-8?B?OHRsWVBucDdSNDhVaVN0L2dTZFdMcXpLZTlNbjUzWVhnRG5lZzZUQ1dmcktH?=
 =?utf-8?B?V203NlF6WG96eXo4bVIrbDRMYmppUE5Ec0VTL3ZSbERJMmhUakdnL2NOM2sw?=
 =?utf-8?B?NzlQK01TbnhmTklzelhOZ2lpYXdFVjdFeTBjMytoalRGMkZNMVM1ZmFjOUVJ?=
 =?utf-8?B?eFRKVnZkc09KOXhuUWNFZGwrLy9oQTNSQWhTRzZ2UjdTQTExWXZkMVFDQUZL?=
 =?utf-8?B?MENQeEtuc2RsSzEvYW5lOHloemhKWnpjRUpCRnEzRVE0WG9ZZU5pR2YydFRX?=
 =?utf-8?B?d1M3bEdGa2pxN2xScVFtM0ZwTVdxUHRFcTFQLzh6VmNpN0U4QTFEckFFODhL?=
 =?utf-8?B?YU9VUmpWOWhBdmMxcUFIMjUweHcwNVRQYnM0R0xNRnpsSGd6Yy85SGk3akM5?=
 =?utf-8?B?RlB0bHJ3V2M4UHJnb0M3MUcrWWtnNzNUTmFCcmxJaDZQNCtRVnBFTThUZy9S?=
 =?utf-8?B?QllzWFJGZS9lZ2ljUDNiTVJaZ0ZFd2krR3RRblNqSHJpdm9ZNEdFMVh3d3Ru?=
 =?utf-8?B?Y0Y1a1V1NVk3Q3RrZ3E4Q3FtTlV2OFN6SHg5bUhtMTJ0QTBkNHRoY1FoMnZk?=
 =?utf-8?B?YVVOeW5ZODVTUE1uL21idVZEZWxoQlMwZ1RxZjJ6SmJZd2RndFVVWDJ3Y09Q?=
 =?utf-8?B?eXM3d2hJcDg4Rmt1cWlSY1Jaa2FmKzNyUTJUSklPam5RU1RJNXdSa3FrWnlO?=
 =?utf-8?B?SFZ0UlFlZDZQMjJvTnliakdNS3RmSldPQUtFd3NqY1k2TjJOMTZuQU1XSVQw?=
 =?utf-8?B?bUJZZjR6bHNrWXM2ZVg3VlpDY2pRTEJtc1lVNmFCUDJTWkp0TDdWNnJaQXZz?=
 =?utf-8?B?M0xKc3VpakpMeDdYc3R3OGtGYVF0T0txK3JHR0U0RDZxUUZTSWNYUG9GRmR6?=
 =?utf-8?B?TFQ3VU14OWoveVliZkg1T2U2STZZVjlETytodmNxMXcydVlHMkpkVTZXS01N?=
 =?utf-8?Q?A7yDm6Ne285n/bEjcp063R7QP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82362f5-501f-439d-55f6-08db6be7d9c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 08:26:13.7645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9EMhxn64WJORa42N+YoCkH4beh95DvloxEMoMcHE4KBKdNJk5jzEa6Y4NhSJjWVbJgCPpTUrDchM16CILzm0CYftUcrqQcQI5BqM7U3H6X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
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
Cc: "Hocko, Michal" <mhocko@suse.com>,
 "jmarchan@redhat.com" <jmarchan@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQoNCj4gDQo+IE9uIDEyLjA2LjIzIDA5OjEwLCBLYXNpcmVkZHksIFZpdmVrIHdy
b3RlOg0KPiA+IEhpIE1pa2UsDQo+IA0KPiBIaSBWaXZlaywNCj4gDQo+ID4NCj4gPiBTb3JyeSBm
b3IgdGhlIGxhdGUgcmVwbHk7IEkganVzdCBnb3QgYmFjayBmcm9tIHZhY2F0aW9uLg0KPiA+IElm
IGl0IGlzIHVuc2FmZSB0byBkaXJlY3RseSB1c2UgdGhlIHN1YnBhZ2VzIG9mIGEgaHVnZXRsYiBw
YWdlLCB0aGVuIHJldmVydGluZw0KPiA+IHRoaXMgcGF0Y2ggc2VlbXMgbGlrZSB0aGUgb25seSBv
cHRpb24gZm9yIGFkZHJlc3NpbmcgdGhpcyBpc3N1ZSBpbW1lZGlhdGVseS4NCj4gPiBTbywgdGhp
cyBwYXRjaCBpcw0KPiA+IEFja2VkLWJ5OiBWaXZlayBLYXNpcmVkZHkgPHZpdmVrLmthc2lyZWRk
eUBpbnRlbC5jb20+DQo+ID4NCj4gPiBBcyBmYXIgYXMgdGhlIHVzZS1jYXNlIGlzIGNvbmNlcm5l
ZCwgdGhlcmUgYXJlIHR3byBtYWluIHVzZXJzIG9mIHRoZQ0KPiB1ZG1hYnVmDQo+ID4gZHJpdmVy
OiBRZW11IGFuZCBDcm9zVk0gVk1Ncy4gSG93ZXZlciwgaXQgYXBwZWFycyBRZW11IGlzIHRoZSBv
bmx5DQo+IG9uZQ0KPiA+IHRoYXQgdXNlcyBodWdldGxiIHBhZ2VzICh3aGVuIGh1Z2V0bGI9b24g
aXMgc2V0KSBhcyB0aGUgYmFja2luZyBzdG9yZSBmb3INCj4gPiBHdWVzdCAoTGludXgsIEFuZHJv
aWQgYW5kIFdpbmRvd3MpIHN5c3RlbSBtZW1vcnkuIFRoZSBtYWluIGdvYWwgaXMgdG8NCj4gPiBz
aGFyZSB0aGUgcGFnZXMgYXNzb2NpYXRlZCB3aXRoIHRoZSBHdWVzdCBhbGxvY2F0ZWQgZnJhbWVi
dWZmZXIgKEZCKSB3aXRoDQo+ID4gdGhlIEhvc3QgR1BVIGRyaXZlciBhbmQgb3RoZXIgY29tcG9u
ZW50cyBpbiBhIHplcm8tY29weSB3YXkuIFRvIHRoYXQNCj4gZW5kLA0KPiA+IHRoZSBndWVzdCBH
UFUgZHJpdmVyICh2aXJ0aW8tZ3B1KSBhbGxvY2F0ZXMgNGsgc2l6ZSBwYWdlcyAoYXNzb2NpYXRl
ZCB3aXRoDQo+ID4gdGhlIEZCKSBhbmQgcGlucyB0aGVtIGJlZm9yZSBzaGFyaW5nIHRoZSAoZ3Vl
c3QpIHBoeXNpY2FsIChvciBkbWEpDQo+IGFkZHJlc3Nlcw0KPiA+IChhbmQgbGVuZ3Rocykgd2l0
aCBRZW11LiBRZW11IHRoZW4gdHJhbnNsYXRlcyB0aGUgYWRkcmVzc2VzIGludG8gZmlsZQ0KPiA+
IG9mZnNldHMgYW5kIHNoYXJlcyB0aGVzZSBvZmZzZXRzIHdpdGggdWRtYWJ1Zi4NCj4gDQo+IElz
IG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdCwgdGhhdCB3ZSBjYW4gZWZmZWN0aXZlbHkgbG9uZy10
ZXJtIHBpbg0KPiAod29yc2UgdGhhbiBtbG9jaykgNjQgTWlCIHBlciBVRE1BQlVGX0NSRUFURSwg
YWxsb3dpbmcgZXZlbnR1YWxseSAhcm9vdA0KVGhlIDY0IE1pQiBsaW1pdCBpcyB0aGUgdGhlb3Jl
dGljYWwgdXBwZXIgYm91bmQgdGhhdCB3ZSBoYXZlIG5vdCBzZWVuIGhpdCBpbiANCnByYWN0aWNl
LiBUeXBpY2FsbHksIGZvciBhIDE5MjB4MTA4MCByZXNvbHV0aW9uIChjb21tb25seSB1c2VkIGlu
IEd1ZXN0cyksDQp0aGUgc2l6ZSBvZiB0aGUgRkIgaXMgfjggTUIgKDE5MjB4MTA4MHg0KS4gQW5k
LCBtb3N0IG1vZGVybiBHcmFwaGljcw0KY29tcG9zaXRvcnMgZmxpcCBiZXR3ZWVuIHR3byBGQnMu
DQoNCj4gdXNlcnMNCj4gDQo+IGxsIC9kZXYvdWRtYWJ1Zg0KPiBjcnctcnctLS0tIDEgcm9vdCBr
dm0gMTAsIDEyNSAxMi4gSnVuIDA4OjEyIC9kZXYvdWRtYWJ1Zg0KPiANCj4gdG8gYnlwYXNzIHRo
ZXJlIGVmZmVjdGl2ZSBNRU1MT0NLIGxpbWl0LCBmcmFnbWVudGluZyBwaHlzaWNhbCBtZW1vcnkg
YW5kDQo+IGJyZWFraW5nIHN3YXA/DQpSaWdodCwgaXQgZG9lcyBub3QgbG9vayBsaWtlIHRoZSBt
bG9jayBsaW1pdHMgYXJlIGhvbm9yZWQuDQoNCj4gDQo+IFJlZ2FyZGluZyB0aGUgdWRtYWJ1Zl92
bV9mYXVsdCgpLCBJIGFzc3VtZSB3ZSdyZSBtYXBwaW5nIHBhZ2VzIHdlDQo+IG9idGFpbmVkIGZy
b20gdGhlIG1lbWZkIG91cnNlbHZlcyBpbnRvIGEgc3BlY2lhbCBWTUEgKG1tYXAoKSBvZiB0aGUN
Cm1tYXAgb3BlcmF0aW9uIGlzIHJlYWxseSBuZWVkZWQgb25seSBpZiBhbnkgY29tcG9uZW50IG9u
IHRoZSBIb3N0IG5lZWRzDQpDUFUgYWNjZXNzIHRvIHRoZSBidWZmZXIuIEJ1dCBpbiBtb3N0IHNj
ZW5hcmlvcywgd2UgdHJ5IHRvIGVuc3VyZSBkaXJlY3QgR1BVDQphY2Nlc3MgKGgvdyBhY2NlbGVy
YXRpb24gdmlhIGdsKSB0byB0aGVzZSBwYWdlcy4NCg0KPiB1ZG1hYnVmKS4gSSdtIG5vdCBzdXJl
IGhvdyB3ZWxsIHNobWVtIHBhZ2VzIGFyZSBwcmVwYXJlZCBmb3IgZ2V0dGluZw0KPiBtYXBwZWQg
Ynkgc29tZW9uZSBlbHNlIGludG8gYW4gYXJiaXRyYXJ5IFZNQSAocGFnZS0+aW5kZXg/KS4NCk1v
c3QgZHJtL2dwdSBkcml2ZXJzIHVzZSBzaG1lbSBwYWdlcyBhcyB0aGUgYmFja2luZyBzdG9yZSBm
b3IgRkJzIGFuZA0Kb3RoZXIgYnVmZmVycyBhbmQgYWxzbyBwcm92aWRlIG1tYXAgY2FwYWJpbGl0
eS4gV2hhdCBjb25jZXJucyBkbyB5b3Ugc2VlDQp3aXRoIHRoaXMgYXBwcm9hY2g/DQoNCj4gDQo+
IC4uLiBhbHNvLCBqdXN0IGltYWdpbmUgc29tZW9uZSBkb2luZyBGQUxMT0NfRkxfUFVOQ0hfSE9M
RSAvIGZ0cnVuY2F0ZSgpDQo+IG9uIHRoZSBtZW1mZC4gV2hhdCdzIG1hcHBlZCBpbnRvIHRoZSBt
ZW1mZCBubyBsb25nZXIgY29ycmVzcG9uZHMgdG8NCj4gd2hhdCdzIHBpbm5lZCAvIG1hcHBlZCBp
bnRvIHRoZSBWTUEuDQpJSVVDLCBtYWtpbmcgdXNlIG9mIHRoZSBETUFfQlVGX0lPQ1RMX1NZTkMg
aW9jdGwgd291bGQgaGVscCB3aXRoIGFueQ0KY29oZXJlbmN5IGlzc3VlczoNCmh0dHBzOi8vd3d3
Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjYuMi9kcml2ZXItYXBpL2RtYS1idWYuaHRtbCNjLmRtYV9i
dWZfc3luYw0KDQo+IA0KPiANCj4gV2FzIGxpbnV4LW1tIChhbmQgZXNwZWNpYWxseSBzaG1lbSBt
YWludGFpbmVycywgY2NpbmcgSHVnaCkgaW52b2x2ZWQgaW4NCj4gdGhlIHVwc3RyZWFtaW5nIG9m
IHVkbWFidWY/DQpJdCBkb2VzIG5vdCBhcHBlYXIgc28gZnJvbSB0aGUgbGluayBiZWxvdyBhbHRo
b3VnaCBvdGhlciBrZXkgbGlzdHMgd2VyZSBjYydkOg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzI0NjEwMC8/c2VyaWVzPTM5ODc5JnJldj03DQoNClRoYW5rcywNClZp
dmVrDQo+IA0KPiAtLQ0KPiBDaGVlcnMsDQo+IA0KPiBEYXZpZCAvIGRoaWxkZW5iDQoNCg==
