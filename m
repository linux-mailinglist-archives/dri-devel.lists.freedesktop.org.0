Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A486E7F20
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C4410E079;
	Wed, 19 Apr 2023 16:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86BA10E079;
 Wed, 19 Apr 2023 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681920363; x=1713456363;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qp2xYed4+aX70O5WR2LsveeZo0jvG7EUnxjyl+0uLg8=;
 b=NK3PADdcs7+mX5hZRK3pxJcbEOXhrNH0UOxeURGvBkjpYoQsVE8pz/O6
 4P8i3Xcagf6vYFs6hQUMftG6mX9pfMdbBrggWO/FbIeIpUOz4fzrItgEP
 ms7JXTGzW4A8l4l850hqCZRxupxayVOYDvTBOrYCWVXXAn8H8FMsX9D6s
 iAb9o37DXxSNsXYKWYQZw/HSsRoDIYsO5BKca9dzthagzaIWfuGXTpPg/
 8bwWi32Mw9Q0+OMvXNsSg9MX8Tlfd3DAK8v8lymXAmxxsq0BpDOCPEgml
 PU4xYno/bnN4/1IaNLQ7Bn6lrDwVgHXQOCcezrQ8hiz+/TqYoxdYPQwSK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408399600"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408399600"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 09:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="802961251"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="802961251"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2023 09:05:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:05:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:05:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 09:05:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 09:05:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXeUDMc45bNuLPY0Y84+M7fgjO0PwxGQMXLuUzJ695aKTQHS5440oBppzz6wNJddn4DWMbPGNMj1tKYS51PF7grS5c4wq60EbcGfWjqEXnHLzAjaj+nusP15OYmCB7XFU8MOkqICk/0aGJYHAFjAAAArEx+zs1349oqp9/glswYQz02YYxswDVjb2DZXDekdpnzccPoA0tZWnP27Ce81tPtOCjxRnV4QnVQjQvVCw9xQ1Npxzkyz/JdlaOXpHfeSDoIg3ceFIsUYnBlxVVonYHDEqcb5tnG/VQTYQkQa+VdRLVFVUFN99lcKcyMEopay1Gzp2DnfpH7/bnNZpqvU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp2xYed4+aX70O5WR2LsveeZo0jvG7EUnxjyl+0uLg8=;
 b=FBv8qryZJX4ITEha4BxcQ09Gdn7hv6gfuJ5FIpADylIfE5cLWEEjuRNCkNx0yiOM1uUmmpDJWxZz2jKxS7bAKPDAqcjKQHJiQ6JGXebaWsCjNhpmTPxqXh9+cnM2+SMmXBYV8urf9hR4wNfWU0Kg5bnj/p1rxrdFkJrAeTZUxdFAQbVw9uwZlOts81bNVV0Wo8lpm6N058fbxZNJXiUKIfgAGXEDRickcw0fia9p2IjR37bCMeur2J4TnsxDeVLJcTRGRiVqLdGa2HC+Yse5wLyd7aHHHoePXOEyjeDUhZh/mIWVBtICmMJpra9bcIRKBO6qIsNZgcLmovHoRwB0Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:05:55 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:05:55 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Index: AQHZcPU8pV7LJrvK6E+GLGIe52dGEa8yts2AgAAYjxA=
Date: Wed, 19 Apr 2023 16:05:55 +0000
Message-ID: <SN6PR11MB2574C31587EAFDDE581EC14B9A629@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-3-fei.yang@intel.com>
 <cea7ab1a-3127-8147-26a7-2b5310ac65ae@linux.intel.com>
In-Reply-To: <cea7ab1a-3127-8147-26a7-2b5310ac65ae@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|CYYPR11MB8360:EE_
x-ms-office365-filtering-correlation-id: ed6c9698-bb8e-43a3-62ea-08db40eff4c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r+by72xHApupHuLO1tYrKGkFy1NIqzAdbUbqJe4ScHkkUNW5LXv00cW2ZPOWwloGw4zCG8HKS81pdb5pYyd/Ep2/c2siRvsOmMRIm9CuG18kBJR02P12o0jVhXjDBv+1uqpzal8uHrFtZ2KQk/CiemuxD5mnuY2TiJghuHA5ZBDJN/X31+PnECGxDRF4526NVMRI1QupOHlahw3ifkY7V0/UXh6+NHbvyUofCnRgGN5PlyF8KMv5jYBnMt+n+5rz20Z6Az74SK0/BajsuN9Xj4PULXyf1cT1isltStDxlxtbIpE0dhX5hAPbU44FVsRkVdn8lr4dpqaOuMXwUGqVH1YKZ9YeJyjnef9hDow2ENqh+r7Pg6W3w4uoj3zWjDZnDzHP+sRjAGOiUwUf4i3R4S3IAXuMe5JplWXZ1WDSF3YeNBez4VaOKZb7RDT4oKhveaEgJR/uTVvtZfCeBpBqBjl5lVNS9z1IKVFeO9dx6yBFJr+KTEVSilcIJm/id/UYgu7t0dDKEjdDJDyBgyaIy4xDMXWhkjEc5Z+UHMvNhy8M4vEb+hnKF8VFqD+ZlX1UivSEh+lws9nLPESMrIpZUoF8DZi8jQByX7zFd6aB/3p99wBpmAdLdt0WGDQdjlfO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(186003)(4326008)(110136005)(54906003)(316002)(66556008)(76116006)(66446008)(64756008)(66946007)(66476007)(55016003)(478600001)(71200400001)(7696005)(8936002)(41300700001)(8676002)(5660300002)(52536014)(4744005)(82960400001)(2906002)(86362001)(38070700005)(33656002)(38100700002)(122000001)(26005)(9686003)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVZ1aytqak8rbmxucTAzU3ZzSENZcDZOTXpqcGNYMUNmVm1sc0pSL3RXc080?=
 =?utf-8?B?RlQ3SG8ybFhPeDZiLzNoTkoyeThzVS8wdHcxaFgwSVNFTWJNRmtTQ01GSS9h?=
 =?utf-8?B?cXpYcjRycCtzbmIvM1lWZzRkbCsvRVdOYWkxQ2JmVG9HNElLSCt2L09ldksy?=
 =?utf-8?B?dDhOclRGZ3JpUzBvSDFtcDF0eTB5dU0zNC9GelVyRms5RkxSOFRVQ1FXcGxF?=
 =?utf-8?B?Um9mSUJVZjQ0M2JKREFNY0xFNHQ3YTVIMGR3RE9IeHhZWWN6NVRWdnFnWXRC?=
 =?utf-8?B?Y2JIdEI2VWFJNnlwdUxwTUJVK1owV0V1UE44MXNiT0hzWGJXSWRSWFE4ZHFH?=
 =?utf-8?B?aTR2NXNLVUhaeUcyYlJ6eWVxUE5lejA1VEo0VDR2ajUzdlVOSmhndzQ3RDFY?=
 =?utf-8?B?ZmZTU204MUNFSG9vTDBPVllxV3dGb3lkTERIOURrYlYzeGw3UndoNE50UURY?=
 =?utf-8?B?V1JnbW9QdHp6UkhxVXdlZ0R0SE1EbElvL2FYVW5iNCs5UjR2WDNJRUNGampO?=
 =?utf-8?B?K0lJSVpmWVUzVm05dHFxVnRjbW0rUUc1T0RzbGJEcmFNMlJLNEhTT2hjaXhy?=
 =?utf-8?B?SWtQSDJudzJRQWlEeTltTnVialZKQXk0MHV5U1JnSWNOMERrRFh3R3owWG5h?=
 =?utf-8?B?WXpmMXZKMVZFTlFyTExVTkFSUnZ4Q1hETHZUYzBsWWNOSVpxdVNnRUtiN2pM?=
 =?utf-8?B?MnhZOEttNHJDYzJObzVFVWFZcGVPMmk4b2RlY3BCK2NUVUIxVlVrL1ZuQlVt?=
 =?utf-8?B?NTdqNGlqNE9aYmpWSlBhZmN3RDF6T1FWRmdzeHVpcFNORzVLcTZjZXg3Rkky?=
 =?utf-8?B?U0ZnOTNmalloUDVWWTkvYkJ3WWtWeTVCeDd1dVNBNEVrdjB1SHkxN3pMUEFP?=
 =?utf-8?B?NStuUGlxYWJvSTF0cUVmZDZOODkyVHdHeHBtSU14VytwWEJZU29QdEtiTVFK?=
 =?utf-8?B?Rk13UC9DaG84VGlnTCtHVmN1SmNvSmtkRk9uLzRIc1lqS3hyekZmMzg5bW50?=
 =?utf-8?B?dXhqZVI0SnN4SFRxdmhIa01FL1htNW5TNlFYRjB3VDFTUFZSU25EMzZlZVVP?=
 =?utf-8?B?dmpXOEhCQ2xuZlY3WjhYdUwrd0FMb05LOVZVeHdoZGxlYnc4U2YwK2FieUlI?=
 =?utf-8?B?ajdYYytWTGN0bXNDeXdQdnNJalhvMTFIeTkxbWlVc3NjWHFpS2JNR3lmZmxN?=
 =?utf-8?B?VG5lbjZEdVBhbDAxaU9XKzkrUm1hL0VXb0Y5b2l1b0g0cUFwcjNZQ0d0Zldp?=
 =?utf-8?B?S3N1S3pzeWN5czFycDZBUjdIU0JUYWgrb3Zad1FORUJlOWxiTFdtbDZYVlJx?=
 =?utf-8?B?bWU4cnBvSVc0aVlmd0RFSTltcnY0VUU1N0xNRFhLUm5RRTBlb0RpZEwyVHZO?=
 =?utf-8?B?dGQ4bTVmUi9RMDYxeWFnZGVCRXB6c0VuQWhQNkttcXU1OXpwSFV0dExONzZB?=
 =?utf-8?B?V0cxNDRaVUJZTGhIamtlNFJ2eitpak5Gbm04aEhNVk9uekNLMXdhR3h4ZFQv?=
 =?utf-8?B?bXVvMGhnZHhOeVkyV2dRbWJIeVR3Q04xN1RrMzNBS2FzalJ2aEtCV2xTQVpF?=
 =?utf-8?B?N1pzSW5KUWZPSjc0enE1N0pLbnI0ZUcyRGNqYkhMT1JtOVg5YXJ4WlBFdUZN?=
 =?utf-8?B?RWNRb09iYkNxVXY2dGZEVWp4MXpWNERBMEI2eThWUWN4OWMvOVdtRURYSWkz?=
 =?utf-8?B?ak1ranU0Ym1FaTN0QTJRSEFjQzFRWFRDRURrUTJ6OUNXWFV4S0dWWmZzdHFC?=
 =?utf-8?B?aWF0WjJCdnV2WXVrN1NNZzVVNDIzMHVjRE1RVE1FRHZZeVJ1bDFkZStCaEpE?=
 =?utf-8?B?WUxKRDBacjc1UmJGMnZzSmphcHpCNEljeW5lQVlzcGEyU0t3UFg4eU0rYUcy?=
 =?utf-8?B?Zi9sMG1ieEdLY3RjRmttblppbW1jL3l0Mmd5UXFzOCttUCsyT2dhcUhrbGpT?=
 =?utf-8?B?SHRoZWhndHdBRGFLYWtMbkYxLzVLZ2FnOHlmcVBLb1FkK0xQMFZ4cEhCL1A5?=
 =?utf-8?B?OU9pcFp4aE5kUzBaZkluSEpUUTljby84SzdndDJ6Y28xRmxQRVYxaWwvY2oz?=
 =?utf-8?B?REpBOFZKUldvSkdXOWEzUDZha050SklZWG1YUi9xVVFIdGtzYWl0T1h1d25a?=
 =?utf-8?Q?kGQA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6c9698-bb8e-43a3-62ea-08db40eff4c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 16:05:55.0931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVJUmwurix/In10DmfJemOTLf6iGDU4TQjiYqDINA2JIRow0xsgNj8RRpVHzLTM7vbA4qCA+AH4gOb5QR+FekA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8360
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4gT24gTVRMLCBHVCBjYW4gbm8gbG9uZ2VyIGFsbG9jYXRlIG9uIExMQyAtIG9ubHkgdGhlIENQ
VSBjYW4uDQo+PiBUaGlzLCBhbG9uZyB3aXRoIGFkZGl0aW9uIG9mIHN1cHBvcnQgZm9yIEw0IGNh
Y2hlIGNhbGxzIGENCj4gcy9jYWxscyBhL2NhbGxzIGZvciBhDQoNCldpbGwgdXBkYXRlDQoNCj4+
IE1PQ1MvUEFUIHRhYmxlIHVwZGF0ZS4NCj4+IEFsb3MgdGhlIFBBVCBpbmRleCByZWdpc3RlcnMg
YXJlIG11bHRpY2FzdGVkIGZvciBwcmltYXJ5IEdULA0KPiBzL0Fsb3MvQWxzbw0KPj4gYW5kIHRo
ZXJlIGlzIGFuIGFkZHJlc3MganVtcCBmcm9tIGluZGV4IDcgdG8gOC4gVGhpcyBwYXRjaCBtYWtl
cyBzdXJlIA0KPj4gdGhlc2UgcmVnaXN0ZXJzIGFyZSBwcm9ncmFtbWVkIGluIHRoZSBwcm9wZXIg
d2F5Lg0KPg0KPiAiTWFrZXMgc3VyZSB0aGF0Ig0KDQpXaWxsIHVwZGF0ZS4NCg==
