Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B046636D2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 02:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2F610E0F4;
	Tue, 10 Jan 2023 01:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C6E10E0F4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673314925; x=1704850925;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ou0ybd982m+dS36WSv5pXqqM0Qn9Juov74aTfOt2a9A=;
 b=nvxQ3MkejS7eQ21vWT2DlDqmDsLPK0cSddSJd/uqcMNZOGgP6juxh6Ci
 v8nVkn99MS91ZWg1H8GiD1o7mh8dvgXBeW19bD98QdQP/hueNfvtOVgu5
 hxMW/sKYgBBC4kBsn2d18x93/XDZEv2DXP/I2X8vkNIKHSKO5g6IpclMt
 Beq+lcfZPRgKsVXj6JSukj3ymWdpxtUEK06wtAjP2yrMIYU3nS7cQx1hy
 FAvbHP/Wc1kJsw3MbmNNvQOGCGtvenz78Ae6H552WJNHLghtgW90EmuaA
 9E2WfI7jzsosfIlFIqZMJg1g+X4nj0nbvWcN04IMbotu2DzLd+d+2V2jD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="320730676"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="320730676"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 17:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="780898573"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="780898573"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 09 Jan 2023 17:42:04 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 17:42:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 17:42:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 9 Jan 2023 17:42:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 9 Jan 2023 17:42:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eyl70nHHQniiYcsJNtNtxqigieRFk7x7UBDBMemfaVym6HAhTjlEUFNDWeGVTegsBTZG8SfyY8javsUAJ4zjO8qr6Q1nKoeeeRXKVXcQoSXV11SInwC2cWO26eIWiL4c9JLTGk+1vAiI/kNsXcAUuZbEBtKu4J6RgNusmKAWwKwVTnFfDt3OvIcuE8tI2lFhYsrQJ/Ixa4f64SZxkz9Yu+s6OihsoTtvGGVcoNTiiGbVr/RXCAPYISI3DtXvlxR8FKxprkzaP7AZyebT9kH9sBmFuEvFbrY1np2gnyyOyyiR5LowSvGtLQkgdR38aLCE1navik5QEKCDQZfkppR1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ou0ybd982m+dS36WSv5pXqqM0Qn9Juov74aTfOt2a9A=;
 b=Jm9LqvCm9zSskq56eOx2M9Lth9jvRyxrvg4N1o88hKYq1We+o/YWZbeeb6yjP/svXp8TP7mk4wTsvosklYI1yZrS6EtMU3gUss3FZKWNm4z7trCz5OpuhMBiHsBKfcxkAUJ2472SnFpWkjgdUXqp8GvVf/Xc8Do+zqxVMLBfrVLVxPhRzvZQETbs3J0bvEVdD4j5g7PaVHmwvt76TUT3MuTZLsMUyV3g33REqTMWD/PLkAbp+pxgUQVQVkjGiPTicjs+vaBru/QhJDJQSYrFvBO7UHvUL7y2DdcsPPztazCatjRpySSzO/vlPSPZh1OHC5e7V9rjBz2LFAxwsA9F3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:443::14)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 01:42:01 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::6385:771:1bc4:2f6]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::6385:771:1bc4:2f6%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 01:42:01 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Thread-Topic: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Thread-Index: AQHY+vBKyFxofzKh1EOK+i6bB8w65a6RY7QAgAWMGgA=
Date: Tue, 10 Jan 2023 01:42:01 +0000
Message-ID: <IA0PR11MB7185DA1293CCD29C0A0DD978F8FF9@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-3-vivek.kasireddy@intel.com>
 <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
In-Reply-To: <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH0PR11MB7447:EE_
x-ms-office365-filtering-correlation-id: a4ca181f-fed3-4b53-4ea2-08daf2abdea5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V9Cvu6VwhFG6PeIq2vnO5jEzag6hRNAulqYNH9oaicDdEQpdnBgXary6lPHHMI9c6wYMnNX4ogkKCgiGxsuMptEWPE6GxFxfxNTHtQdDHik2duchKbxzYw7QD4MFVSIKK+zKOq5+PjBTnoSZb+fkwBnA2umQQML4yevBiAZgUvmVi9dLEb/kgPcO5rD3Atdij4fjbJWWvxYj4uP1raa/4pOpnxaaaUBsdnsC5YASGR/LPh6NfNx8dX3rT6Jbo6xrWGQ+mM/sgCCQC1OmoQ7itUjKMxkcgMyPb0BJSv1GzsZkWjtbsHl5m1CqosGbOhSZA8o8MzB/hrjivyxbAbO7kMem08WWdCJ4sfIZe+cJzXtbmimwJz56e4VmMRrXZ05hU6FUboVHNegbpq0g4kG2SiCIF7foTZrFeSel9bgy4I1jWqKZ9w+LS3RzupjSb7NnW6YffJX+7UuBFIVr68ilTAN2ES9nGRiuA89xI0BJEbnq5oOzc82T42sjb2+ydyNUAovlvPxYprSbxnhFuSv2zXnSHuwVlPyT0dr44w/fxrX9wOt18xC2AgGyB/R0XrXWOfjf0O3cP4toHzDChXcVV/y/hdrkx6LVgguUOrb+nQR00WK2D9xio5Jcb3zOk3zMSYYaWBDRho8NM60pTKrOlGHOTzFobvUC01Jv8qSiXpbLXyX6/0sJTxZ0ID2E86+oGc/lIJBzOGAHp7mO5OLRqJBoWbEHbLgDseTl3/WY5XR/V9VxemUvAyH1xoUpU3BN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(82960400001)(55016003)(107886003)(86362001)(6506007)(26005)(186003)(9686003)(7696005)(71200400001)(38100700002)(316002)(2906002)(6916009)(54906003)(478600001)(83380400001)(33656002)(41300700001)(38070700005)(5660300002)(122000001)(66946007)(76116006)(4326008)(52536014)(66556008)(64756008)(8936002)(8676002)(66446008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU9DemFzV2ZPVHBqK2xwNmVpUUl5VzBOeWV5aEpBU3ZpMzFOd214RFRKaXRC?=
 =?utf-8?B?Y2N3bjQydHYwL1lhZ2ZDMk9sdzNjcmNVNUVIZUc2OTBxOTBOMVhiZmxUeUNm?=
 =?utf-8?B?Z0VTU0pObmtsemZGYyt0dEhrVUxrNGxmKys0WGZiaFpMbHpudkRpK0VGdUd5?=
 =?utf-8?B?OGkvYVR4TncyT0U4b3V2MW5Wb0tlVEw5YlNxaU1sNFUwdHk1RjNGcHNwcXR4?=
 =?utf-8?B?VE1FTlJqMDQ3UUgwdnlFaDQ2bWdhb0RBUGxaVXZxQXYyNS80NmdBQlZ4ckNu?=
 =?utf-8?B?all6ZjRkdFM1Z1lwSlNVcDdjRkVkbWN5dExtV1VyZXVDRlA3VThZTzVIeW9E?=
 =?utf-8?B?L09TUWJ5MDRCT2ZyWE5LR0luOEl1S1orZjlTNVExaGxIWkhXVFFHMFpMWkZ3?=
 =?utf-8?B?RXVNYnNtcmpUMGxlRlJudWJzTk9jRytMYTFVelExRjd5OVRwaHlzTng0aWpB?=
 =?utf-8?B?Sk9nbDI4ZEFnTUJIQjRKTDRmT0tQZk1PL3dPYU8ranFoWUZLbngrckZJZzk1?=
 =?utf-8?B?aGhjMUZ2ZkJmQWE0SzRsSDNKZG5zSnh2VmlFdWdKdWRKdSt4MjRkcGZ4VXlU?=
 =?utf-8?B?MmtqTjIwZTNQZlBlN0QycWdNZ1M4YVdOTmZqMm1yRGsvQ1dpSmNLTldoZ3Nm?=
 =?utf-8?B?RkNlOTZSSlhBVDV6V1o5ZnhocUFyM0lGSC9vNDFHMy9PdGJGVXRUK1BFdkpC?=
 =?utf-8?B?S3c5eUdrQXQzNnMyd0ljalZjSHpsZGVBL2ppYytQeTd6UW44cHRvKzZpc1pq?=
 =?utf-8?B?U2Z1WjBRKzJJNDBIckZ0VHJGaWtrTGQxYjJzbEg5S1czRC9Pb2xhbVZPMWQ1?=
 =?utf-8?B?UWhFeHVlTnp4NzFvTHZsNGlRcnFIM3VSckd5SXRtdXRwTThxYW1ja3JINUdJ?=
 =?utf-8?B?TlkzdnhvcGJXemtMQnlhSXhxQ0Q2YkMzTk1GdEdUNXZsOWdqWTg5bEgwVnVQ?=
 =?utf-8?B?amRpejJjZm96SWRLdUZEUk5rRFQ2RHFCMnhCbVIrVzhlb2dpNEoxQWt5Z2V0?=
 =?utf-8?B?endpR1hpQ2xubCtJTkwwZElDTTdnTlphcjF1ZTIrcUhZaFFiYVFJR1BYeFZs?=
 =?utf-8?B?VGxYVmNFc2tRNUpEOVphUWx6bGs4d3ljQngwSFh5OVNFZTQvQ3hoeEhJdTh2?=
 =?utf-8?B?ZGdWYVF3U09jQ1ZMd25aM09QV2pDcTNGVVlycWlld2Q0R0pXZURxanNSZVFn?=
 =?utf-8?B?WUNPY2t2aEF1TlQrVkJScWRDd1QrRHFwbVVlaVQ3NEJSbTNZa3BxYjJTRGFn?=
 =?utf-8?B?bnlkRUNZNDRGOXFUYXkxWUdFZW5XVnVhbFJCa0c5T05hVnU2QU90eU4zMy92?=
 =?utf-8?B?MkVvYVM3Qldqc3BEc2tiai8zM2gxS3dnN1N5UW5nRTZzU01GU3NNVnpIUGJt?=
 =?utf-8?B?cGg4ZXpqZlFUMHpvU1N6c3VCdGhuSk0rUWFzRkkwUmdtVkhEZzRVM0RiUk5v?=
 =?utf-8?B?dmlWNUtvUFM2SWg2M3h2Y3JBdW1oMzRoZW5ka0kvZFgzenkzbXJkNHVwQmVa?=
 =?utf-8?B?dmdDZG1NSzFGSDB3Z1ZTUGhmT3ordTVWR0xyOXhGazBJU1BYZXUwTUdDcXI1?=
 =?utf-8?B?aGFjdDRGUU5idysrRzZvUlJxdGxBdnhGYUR4bWxhYkd2Z0g3Wmd4Q21iTUN6?=
 =?utf-8?B?RTM3ZE9md0FHWGZQOHlIcVE0SHdGUkZySzBPUXNWYTVsL2NNY1lRbElQeGFr?=
 =?utf-8?B?VWo0cVlPUDZLV3lYTWtRMExrVXJJTnYyZThML0t3d3YrOGw1VXgyME1POHNQ?=
 =?utf-8?B?MHJMalgySFZ0QzVBcm9UTUVFWFJuREdqSG8ydHV0YjhnT2hjQU1EemVkOTA2?=
 =?utf-8?B?ZlZMdWxhQ2gyS3dzVDdqUFlibU53TzlVZG5MOHcya1VsaTg1bkl3Ynh4V0Ri?=
 =?utf-8?B?ZUxZVC8rSzZ1WDMrc2hiK0ZJd0dGZTJHTm9VTS9IOGpxallnY0VGWHBIMGIy?=
 =?utf-8?B?MDI5L1BxNjcyRjIwdXlIZ2k5TGUvK0w1Q3hvRGNxNTBDYmpTZ0k3VE5UK3FY?=
 =?utf-8?B?UGFwd2hYQ2FjNEFQVERJY2d4dVFwZCtBZXJYcXh3US9XcUlDbUV4V0NxQTRV?=
 =?utf-8?B?ckNyczlkWUlpME9sSFFWdjhxQVNnb2szaDdwdVhCSGZoeGdRejltTWZuRndl?=
 =?utf-8?B?RGVtTmJQQ3ZNMExsdm9KMGwzSkVKdHV2dVhaYi8vM3VMTTJUUGZyaUFNNlhG?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ca181f-fed3-4b53-4ea2-08daf2abdea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 01:42:01.4738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5sEaCXGmSdwyJ5/hwwEkosHva75HMIJHRlUXKSAA2hY6NDV6AY9f42u+R/z7pVmW/6faDydoprAC/76YkD+NsKpNjBJeBK5S6zSo5xJFnI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZCwNCg0KPiANCj4gT24gVGh1LCBOb3YgMTcsIDIwMjIgYXQgMDU6MzA6NTRQTSAtMDgw
MCwgVml2ZWsgS2FzaXJlZGR5IHdyb3RlOg0KPiA+IFNldHRpbmcgdGhpcyBwcm9wZXJ0eSB3aWxs
IGFsbG93IHRoZSB1c2Vyc3BhY2UgdG8gbG9vayBmb3IgbmV3IG1vZGVzIG9yDQo+ID4gcG9zaXRp
b24gaW5mbyB3aGVuIGEgaG90cGx1ZyBldmVudCBvY2N1cnMuDQo+IA0KPiBUaGlzIHdvcmtzIGp1
c3QgZmluZSBmb3IgbW9kZXMgdG9kYXkuDQo+IA0KPiBJIGFzc3VtZSB0aGlzIGlzIHRoaXMgbmVl
ZCB0byBoYXZlIHVzZXJzcGFjZSBhbHNvIGNoZWNrIGZvciBwb3NpdGlvbg0KPiBpbmZvIHVwZGF0
ZXMgYWRkZWQgYnkgcGF0Y2ggIzEpPw0KW0thc2lyZWRkeSwgVml2ZWtdIFllcywgdGhhdCBpcyBl
eGFjdGx5IHRoZSByZWFzb24gd2h5IHRoaXMgcHJvcGVydHkgaXMgbmVlZGVkLiBJbiANCm90aGVy
IHdvcmRzLCBNdXR0ZXIgZG9lcyBub3Qgc2VlbSB0byBsb29rIGF0IHN1Z2dlc3RlZF94L3kgdmFs
dWVzIChvciBwb3NpdGlvbiBpbmZvKQ0KaWYgaG90cGx1Z19tb2RlX3Byb3BlcnR5IGlzIG5vdCB0
aGVyZS4gSGVyZSBpcyB0aGUgcmVsZXZhbnQgcGllY2Ugb2YgY29kZSBpbiBNdXR0ZXI6DQoNCnN0
YXRpYyBnYm9vbGVhbg0KbWV0YV9tb25pdG9yX25vcm1hbF9nZXRfc3VnZ2VzdGVkX3Bvc2l0aW9u
IChNZXRhTW9uaXRvciAqbW9uaXRvciwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ICAgICAgICAgKngsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGludCAgICAgICAgICp5KQ0Kew0KICBjb25zdCBNZXRhT3V0cHV0SW5m
byAqb3V0cHV0X2luZm8gPQ0KICAgIG1ldGFfbW9uaXRvcl9nZXRfbWFpbl9vdXRwdXRfaW5mbyAo
bW9uaXRvcik7DQoNCiAgaWYgKCFvdXRwdXRfaW5mby0+aG90cGx1Z19tb2RlX3VwZGF0ZSkNCiAg
ICByZXR1cm4gRkFMU0U7DQoNCiAgaWYgKG91dHB1dF9pbmZvLT5zdWdnZXN0ZWRfeCA8IDAgJiYg
b3V0cHV0X2luZm8tPnN1Z2dlc3RlZF95IDwgMCkNCiAgICByZXR1cm4gRkFMU0U7DQoNCiAgaWYg
KHgpDQogICAgKnggPSBvdXRwdXRfaW5mby0+c3VnZ2VzdGVkX3g7DQoNCiAgaWYgKHkpDQogICAg
KnkgPSBvdXRwdXRfaW5mby0+c3VnZ2VzdGVkX3k7DQoNCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiAN
Cj4gdGFrZSBjYXJlLA0KPiAgIEdlcmQNCg0K
