Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C186F0BCE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 20:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9D910E38D;
	Thu, 27 Apr 2023 18:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ED510E108;
 Thu, 27 Apr 2023 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682619553; x=1714155553;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LSSxNCdH7P0Oa9J8ATrKU5ickhA4gIjEWNqC/UrfBSM=;
 b=hyD1O2Izx6RwLx2EGx8JaEsTwO3ZIM3gPCaUSGh/fgr/7Rd3bQ3DSD+q
 4pGaisE4ysJsGCFOzDM4vHaGh3vc49vLr3Yw5PQ/+YDKNaAHHZQTcGC7f
 e0s58YFdzBOvBXWbdNGNcQRsUY/wtgEJNM+izAJKwB03fKX49hp6w2pms
 KrtK7ow4yA2hOB5wW68fpHVN5Ye8tD0c8G8bLa+vuC95Hbrj7oXebVsu2
 dOfsL+lcZ6He8nFtRQmyLNLAuygxY74SRK9dSEMr1Z3PwuurA++858LOl
 K0DRUgyPlVVHoe1gHNxUipOyBHzuTJmY4eS41R/BbwpcWmuNzfLX7BCf6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="375510786"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="375510786"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 11:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="940761188"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="940761188"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2023 11:19:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 11:19:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 11:19:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 11:19:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 11:19:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmOYX4l48YtnF6KDAM1qZ2leAsJja3UehbAHqMLSs7iRQClqpyoCakYD2pIlaXg89qW2eG+gMS1yP69ooUF5DyhW/kDuUQ2k2TlpYFJTzP+PTb8YfTP1LSv8rvHf7JX+Xf+zeuf8w0VU28cxkQHnb6WPxQWRDZ1n0iAngAJ5XujjUPGw2CQ8o/wSjjMcnZc257BDbshAdx2ru56rE52bUcp5hdxhBt5GPXVNMC2BfsuvSdK0gLNj4cdXtU7xssbIBVJjFfymxveYJdoXhDJX9Mpo/+e3wcrTd4PepDtKCG78jJrO9n0k7niKP0XBKtVsw9sbY1XM2R1qbFjQgKk6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSSxNCdH7P0Oa9J8ATrKU5ickhA4gIjEWNqC/UrfBSM=;
 b=cINqZHlwSNx674e1kej5n/Eq38gl6VyJ3ihYxGgr2I5N9IpuCc6W3isOkebpJFuBA89OPYOJS1ZjHqALIEpf+6qaglRmCYNCF8GuX8gHLMr+fEvpuS7mPXDgPiD+JG41ksuDKE2fZHPzGf40eDAClzyTc6UjRroZHDMhbY9247NZQWI/vEdiFINDNtURFkK745d/Ao8M/07JZk1hrIcv1mvQ8+SESAG1APILgWCxqF64Nc9RKlx6gN4JKj1hda1jR102mK+SltzSt3aLz0hy9woi41R0Y9+vCLVpZWBwkKm5FvD1XcAcvJqmsiSooIkg356sZLn1wwgSuMJv1OoOeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21; Thu, 27 Apr 2023 18:19:09 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 18:19:09 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Justen, Jordan L" <jordan.l.justen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>
Subject: Re: [Intel-gfx] [PATCH v8 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for
 PXP
Thread-Topic: [Intel-gfx] [PATCH v8 6/8] drm/i915/uapi/pxp: Add a GET_PARAM
 for PXP
Thread-Index: AQHZdBLs73/R+FVB002lLr1tVAGsHq897oAAgABIRgCAATm8AIAAENkA
Date: Thu, 27 Apr 2023 18:19:08 +0000
Message-ID: <6ebdd6168e68ce81806f9aaed9356a3bdb7fcfa6.camel@intel.com>
References: <20230421053410.1836241-1-alan.previn.teres.alexis@intel.com>
 <20230421053410.1836241-7-alan.previn.teres.alexis@intel.com>
 <82cab075a8330355b3844cad26fcf842b275afb9.camel@intel.com>
 <168254855442.392286.5736829518983136908@jljusten-skl>
 <27483f34611239dc4a73ff832cda9abc9074a88f.camel@intel.com>
In-Reply-To: <27483f34611239dc4a73ff832cda9abc9074a88f.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4916:EE_
x-ms-office365-filtering-correlation-id: 07b9656f-6a0e-4801-8a18-08db474be4c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U8nsAf6HORzUf2YsBQwx7RqfKuGMwyBV+sDkZ/CcmlveS9kgpHBJSPcD4rrKRx04pl0sv+Ez5vfZq75V6HlsXfZ7aT2tCcjNCo8UOEqoW49Ddh30SDAbC7EPdSTriXJ0GHPFGJeojzm2IhzovDVSBhjzeBChGHY5RBxqkMcaxTpqtdzXbuZpI8Rd4pY3//4zLjgP1UWXgveolyeHxlvVLKTYqv5YSEo4EQirAM3gdR5GyABg3CxAhnMq+9OBhkVlr1ORdw60VULjvc/HlTbdES2xGmaTtq1gxzdEoEWgOpt8oSL/JrRQUJKUco8Ahc8XwoTWM7UAoOJ5uMO0t1w57ISZL/Aw2Po9k8fgiVPilLsmTIkhnibJLlce8zmkahcJLSNr36NsBbNbqXK/Z5rPFLa2MdJAJxDqWnobCC6vxROGHebSAjUDSjTx8KJLOhu5GeD/gXho1tXJ+4WN+WqGALy3ft8cZ5PKB1pNR946xl9qxQOdGpsNztAv3n2bBa0qQdZQbsU5uEQy3YAaQ7bdDY+9BNxM1stdCsdp/lW+fiz6VmEDyKyg4ktAuzkvu0hquiOA3uxk2bCUvAFJJIUB7xrwcM5EBXqSSqgN2VXw90UFftieuHgkdd74Jg90mZXh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(83380400001)(2616005)(36756003)(86362001)(53546011)(6506007)(6512007)(26005)(107886003)(71200400001)(6486002)(478600001)(91956017)(76116006)(54906003)(66946007)(66446008)(66556008)(316002)(110136005)(4326008)(6636002)(66476007)(8676002)(38070700005)(8936002)(41300700001)(64756008)(186003)(38100700002)(2906002)(122000001)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUY5T3VzQVlHKzNrSHNvM0tQR2M1aWxPMGdjL0t3ZGlWOEtSR2dGYVNwS0hj?=
 =?utf-8?B?S2ZDcDcrT1ljbTh0RTFqdWIwcjRqWWV6L0kvbDlMa3J6SVFJVzBJUUNSVW1B?=
 =?utf-8?B?NXNocHlyV3hoQzhXUjdES05iQTNSYUNFUkZTdzVnOVJhaTF5WVhUL0d2cGVu?=
 =?utf-8?B?VkZic1RpRVB6THZvY3ZlWURKam5QUkQ3bmkrRTZ3S3NBU3hCNzFZQm5vN1pM?=
 =?utf-8?B?N3hoNWRldEwvOXBQUE5LVG5SL0JJNnI1WGhPdFp6R0hiUHdQeWMvU1JGTTJ2?=
 =?utf-8?B?UDROMDlxbm0vRjdDb2RhcHVPYldldVVTMkxISVlNVTJsYTJyMG80dUxjT2Vo?=
 =?utf-8?B?azAyMkg5TXRkMUVEYmpWTVYvWFM2R3JsTEt2ZlpZcmRoY0wvRkl1Wnh6NTA2?=
 =?utf-8?B?a0FEeCtYMkpkSURQTzFqeFBGWXN6MTFhN3hDMFhSemtvdlJ0QmZ6MVZwZGlk?=
 =?utf-8?B?QWlVQUlOZENOalFnRENyM2JmblUzNE1USmh4STVHNnRvYk9RZjlBYmZld0Nx?=
 =?utf-8?B?WUZzVXkySGFIa2RqOG9rdG1aVVBNdHIvMWtGK1VVckgyVDlzZDJVM0I5SWRa?=
 =?utf-8?B?VGlBZTdmUXg4WWJ5ODNLTXhIUVNtV2gxZWlpeGRzNG5vUklId1VmZXZYZ1I4?=
 =?utf-8?B?c0ozRUtnL3RQeVVJR3laZ2FDNmMzaS9uanZKRDRoRDZnVm53VWZsM2ZtTUw5?=
 =?utf-8?B?VmRZRHpEWjdrTzR2MUhKRWRWcW9vMjlvTVV2YzRxQVhVM1JKZ2kyaEdkMWdu?=
 =?utf-8?B?SVdlQnVVb0E3UnNieWQyK1NVWHkyVkt3WEpQVHlZT1M3aWU5Z1JhSjBZRUdn?=
 =?utf-8?B?bkUxRDJaNFgwM04yNGNsNEc1UUJUSkZYRDBRWHd2UWhadUp2cU1MZkVOekgx?=
 =?utf-8?B?bGdQdm9FNjMvSjI0UGhBVU5uaGFDMWxTMUFaSU9BNGtsRE9rclIxUUF4Zlhi?=
 =?utf-8?B?bG9HNHFIOXJXcngyRW9uRkFJVi9hMDJGV1ZpZThmSitjQ3VNUHVuNXVTUDZ2?=
 =?utf-8?B?cFJzazZLKysxenRtWW5DMElzNjFONndtbzZCUWVzaGRrcENUams2VUloOUVr?=
 =?utf-8?B?MzE5OFlENVBIU0pWVFNuSDNmbHg2TWw3eHhvU0VpWXdRNnp5RG9EQjQ3dkhV?=
 =?utf-8?B?Wm1zMzhxVGR5RmxuRjZXWFpzalc1cFBCbFBvRXFGc1NrZTIyUjdWRjNWVk5l?=
 =?utf-8?B?ZlpxdW1HOFFvZ1p3eGU4QlNyYXRKRDVxclYzMG1pY1FYTDIrWjJKZEowTHc1?=
 =?utf-8?B?akhRZVBkdkdmblIxOUZvMVV6ZVJhOHBZMjd2UFdnOUsrdmRFVFV0QVlYNUJ2?=
 =?utf-8?B?U2dTa1pFSEVkTUk0MTduelFIeXRBK1FWa20rcG1mMXNiZUNFZUplR1lZWVhu?=
 =?utf-8?B?c3U0R3JoT3h2cCs5VWVmTjA3RWF2TDdoNEtidzZRT2dXOGZuM205R3NLSDhv?=
 =?utf-8?B?eHFnRWhxQzBsNVlNQ0RLZWJQWHVpVGtSQ1BQM3F0eSswMzdyTTYzTUU3OVNC?=
 =?utf-8?B?V2RvSW5TejVNaDNmZmd4ZnNMZU5jUWFSb0dnZ040SXJsRmgvR1NRaTRKYU1X?=
 =?utf-8?B?dmZCZTYrOEhlK3hnOXFNS3hwbFQwZlcvRnBwaXBNNFF1WHpNVS9iNjBVdjNj?=
 =?utf-8?B?eXBqazFUTGZFeUdUOVhiU0tFSHhOVGR1eUtuVGFlR3MrbkpuWHRWRE1TMEVo?=
 =?utf-8?B?bHpPWnlvOTZaOGJHS3NHT3c1ZU0zNVdzbE01T29Pa1hZOUQrWTBRSEwvMVhM?=
 =?utf-8?B?Q0I4UDJSMS90MWJ2clRiSEZlRlFHZFNMUUZiVEpoMGJMOTMwM09ncXBnS3hR?=
 =?utf-8?B?Ykw3ZlM2MFF6QU9NSlF0RnptTDhNUWxyWHhKY25ZQ0NKZTZHdnYrK29pWUI2?=
 =?utf-8?B?K2dpN2RPcDBxU2dHUEJnSEU3UTh2T3k5UGZQZDl0RVIyQVVKNTZzWmZRV245?=
 =?utf-8?B?K3l3cC9zTW5IOVBLWGpaUGgrM3YyRkgyd0kxV2c3UXdwVEpiSHhBN3FYYTV2?=
 =?utf-8?B?eVMza0g4WjAyNHgvWXV5dU1ubU5OUENsaGlPdkNrUFV1a0ZIbVZld1N6Mmg3?=
 =?utf-8?B?Tnk3Vlhsenh1U0dIWDVEZEh1aUJJcjNVaFlLZFdVMWNEY2IrZGVXRVUwR05o?=
 =?utf-8?B?eFcrcWxJNnFiNTVmdlhvbzducGhFTmdoZW11MGNKakJiaU9nY2ZONmdtSmYz?=
 =?utf-8?Q?RBPctLr8SHo1Z3bYV6ZH+h0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C0F8D2F9A4E4D429C4278698CF3D7C9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b9656f-6a0e-4801-8a18-08db474be4c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 18:19:08.9203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2SX+ixON1U8YapgoVQ9/PKkgmrWmdB/U9rfBHV9NfFlTnfHASJ3uPy69vgPmZ+NdAYlAC8YhbKeYDWquZ85PuavpSA2JhZN17ELaaQIrLSxXyg3PtDeL60x2yZtHPcV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "justonli@chromium.org" <justonli@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KGZpeGVkIGVtYWlsIGFkZHJlc3NlcyBhZ2FpbiAtIHdoeSBpcyBteSBFdm9sdXRpb24gY2xpZW50
IGRldGVvcmF0aW5nPz8pDQoNCk9uIFRodSwgMjAyMy0wNC0yNyBhdCAxNzoxOCArMDAwMCwgVGVy
ZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gT24gV2VkLCAyMDIzLTA0LTI2IGF0IDE1
OjM1IC0wNzAwLCBKdXN0ZW4sIEpvcmRhbiBMIHdyb3RlOg0KPiA+IE9uIDIwMjMtMDQtMjYgMTE6
MTc6MTYsIFRlcmVzIEFsZXhpcywgQWxhbiBQcmV2aW4gd3JvdGU6DQo+IGFsYW46c25pcA0KPiA+
IENhbiB5b3UgdGVsbCB0aGF0IHB4cCBpcyBpbiBwcm9ncmVzcywgYnV0IG5vdCByZWFkeSB5ZXQs
IGFzIGEgc2VwYXJhdGUNCj4gPiBzdGF0ZSBmcm9tICdpdCB3aWxsIG5ldmVyIHdvcmsgb24gdGhp
cyBwbGF0Zm9ybSc/IElmIHNvLCBtYXliZSB0aGUNCj4gPiBzdGF0dXMgY291bGQgcmV0dXJuIHNv
bWV0aGluZyBsaWtlOg0KPiA+IA0KPiA+IDA6IEl0J3MgbmV2ZXIgZ29pbmcgdG8gd29yaw0KPiA+
IDE6IEl0J3MgcmVhZHkgdG8gdXNlDQo+ID4gMjogSXQncyBzdGFydGluZyBhbmQgc2hvdWxkIHdv
cmsgc29vbg0KPiA+IA0KPiA+IEkgY291bGQgc2VlIGFuIGFyZ3VtZW50IGZvciB0cmVhdGluZyB0
aGF0IGFzIGEgY2FzZSB3aGVyZSB3ZSBjb3VsZA0KPiA+IHN0aWxsIGFkdmVydGlzZSBwcm90ZWN0
ZWQgY29udGVudCBzdXBwb3J0LCBidXQgaWYgd2UgdHJ5IHRvIHVzZSBpdCB3ZQ0KPiA+IG1pZ2h0
IGJlIGluIGZvciBhIG5hc3R5IGRlbGF5Lg0KPiA+IA0KPiBhbGFuOiBJSVJDIExpb25lbCBzZWVt
ZWQgb2theSB3aXRoIGFueSBwZXJtdXRhdGlvbiB0aGF0IHdvdWxkIGFsbG93IGl0IHRvIG5vdA0K
PiBnZXQgYmxvY2tlZC4gRGFuaWVsZSBkaWQgYXNrIGZvciBzb21ldGhpbmcgc2ltaWxpYXIgdG8g
d2hhdCB1IG1lbnRpb25lZCBhYm92ZQ0KPiBidXQgaGUgc2FpZCB0aGF0IGlzIG5vbi1ibG9ja2lu
Zy4gQnV0IHNpbmNlIGJvdGggeW91IEFORCBEYW5pZWxlIGhhdmUgbWVudGlvbmVkDQo+IHRoZSBz
YW1lIHRoaW5nLCBpIHNoYWxsIHJlLXJldiB0aGlzIGFuZCBzZW5kIHRoYXQgY2hhbmdlIG91dCB0
b2RheS4NCj4gSSBub3RpY2UgbW9zdCBHRVRfUEFSQU1TIHVzZSAtRU5PREVWIGZvciAibmV2ZXIg
Z29ubmEgd29yayIgc28gSSB3aWxsIHN0aWNrIHdpdGggdGhhdC4NCj4gYnV0IDEgPSByZWFkeSB0
byB1c2UgYW5kIDIgPSBzdGFydGluZyBhbmQgc2hvdWxkIHdvcmsgc291bmRzIGdvb2QuIHNvICcw
JyB3aWxsIG5ldmVyDQo+IGJlIHJldHVybmVkIC0gd2UganVzdCBsb29rIGZvciBhIHBvc2l0aXZl
IHZhbHVlIChmcm9tIHVzZXIgc3BhY2UpLiBJIHdpbGwgYWxzbw0KPiBtYWtlIGEgUFIgZm9yIG1l
c2Egc2lkZSBhcyBzb29uIGFzIGkgZ2V0IGl0IHRlc3RlZC4gdGhhbmtzIGZvciByZXZpZXdpbmcg
YnR3Lg0KDQphbGFuOiBJIGFsc28gcmVhbGl6ZSB3aXRoIHRoZXNlIGZpbmFsIHRvdWNoLXVwcywg
d2UgY2FuIGdvIGJhY2sgdG8gdGhlIG9yaWdpbmFsDQpweHAtY29udGV4dC1jcmVhdGlvbiB0aW1l
b3V0IG9mIDI1MCBtaWxpc2VjcyBsaWtlIGl0IHdhcyBvbiBBREwgc2luY2UgdGhlIHVzZXINCnNw
YWNlIGNvbXBvbmVudCB3aWxsIGhhdmUgdGhpcyBuZXcgcGFyYW0gdG8gY2hlY2sgb24gKHNvIGV2
ZW4gZmFydGhlciBkb3duIGZyb20NCjEgc2VjIG9uIHRoZSBsYXN0IGNvdXBsZSBvZiByZXZzKS4N
Cg0KSm9yZGFuLCBMaW9uYWwgLSBpIGFtIHRoaW5raW5nIG9mIGNyZWF0aW5nIHRoZSBQUiBvbiBN
RVNBIHNpZGUgdG8gdGFrZSBhZHZhbnRhZ2UNCm9mIEdFVF9QQVJBTSBvbiBib3RoIGdldC1jYXBz
IEFORCBydW50aW1lIGNyZWF0aW9uIChsYXR0ZXIgd2lsbCBiZSB1c2VmdWwgdG8gZW5zdXJlDQpu
byB1bm5lY2Vzc3NhcnkgZGVsYXkgZXhwZXJpZW5jZWQgYnkgTWVzYSBzdHVjayBpbiBrZXJuZWwg
Y2FsbCAtIHdoaWNoIHByYWN0aWNhbGx5DQpuZXZlciBoYXBwZW5uZWQgaW4gQURMIEFGQUlLKToN
Cg0KMS4gTUVTQSBQWFAgZ2V0IGNhcHM6IA0KCS0gdXNlIEdFVF9QQVJBTSAoYW55IHBvc2l0aXZl
IG51bWJlciBzaGFsbCBtZWFuIGl0cyBzdXBwb3J0ZWQpLg0KMi4gTUVTQSBhcHAtdHJpZ2dlcmVk
IFBYUCBjb250ZXh0IGNyZWF0aW9uIChpLmUuIGlmIGNhcHMgd2FzIHN1cHBvcnRlZCk6DQoJLSB1
c2UgR0VUX1BBUkFNIHRvIHdhaXQgdW50aWwgcG9zaXRpdmUgbnVtYmVyIHN3aXRjaGVzIGZyb20g
IjIiIHRvICIxIi4NCgktIG5vdyBjYWxsIGNvbnRleHQgY3JlYXRpb24uIFNvIGF0IHRoaXMgcG9p
bnQgaWYgaXQgZmFpbHMsIHdlIGtub3cgaXRzDQoJICBhbiBhY3R1YWwgZmFpbHVyZS4NCg0KeW91
IGd1eXMgb2theSB3aXRoIGFib3ZlPyAoaSdsbCByZS1yZXYgdGhpcyBrZXJuZWwgc2VyaWVzIGZp
cnN0IGFuZCB3YWl0IG9uIHlvdXINCmFjayBvciBmZWVkYmFjayBiZWZvcmUgaSBjcmVhdGUvIHRl
c3QvIHN1Ym1pdCBhIFBSIGZvciBNZXNhIHNpZGUpLg0KDQo=
