Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75766784C3D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 23:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8B910E2C3;
	Tue, 22 Aug 2023 21:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594A110E2C3;
 Tue, 22 Aug 2023 21:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692741050; x=1724277050;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cVRP5Nk6awkgXabxnRuQxY8d2GYQ3gf9UzyXM4rl6Jc=;
 b=PrZhvN71YnhIpTHddiV/J5QJjElxD9lJMnVZCQkEuyQWqe6eVKb+royL
 fh1TGtSvmROsaEUGSfxVzxwHNCJc1cCgAFpmX7j6+u8Mt9KGUQEgvCKA5
 QFDg5j/hh5DdUBJ/TFkdw8R2ykYjFNdVekcvtiYdoB5Dkc92Ycd9/S66E
 LXzEXt9r5OT1x062RJBIB3i7BZI1BEQc6m1EcCjvYt0BbHcxvcUp9RlLU
 8XtTejBVTPjEHGtx9xoS9jSwwWQa8/s1WK/k0aKF7wcW76abrZ9T9mm/5
 r++U75h1vzX/OYZ8SawkO/tKWdoKKOzYWBfhY33iWw73raxu9arod5VLT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="354336329"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="354336329"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 14:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="850781557"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="850781557"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2023 14:50:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 14:50:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 14:50:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 14:50:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 14:50:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfgUDwMnF0BE16fql2+nDErwPGp3YRgQyye7lV8YLd9Tk2nr2Ob3vcLbxWSi00KQK+cHzApya+cZKaruqYCKJ7xMGGWfgElrfe1Ywa28JqKWtlt3q78y5TPqTwgdsmPELzu9/iQ7GqR6MnIMdiPGUswoHHEmpy/Hyv+c0JL8UsQvfADkgXjkTYO6eqESoyVwW6y4ObhR9rD1xlQ7+w0ex8ceJS94H/W+5UA6ey8H9BX2t3s3OaShSa2FyrXTvsRhCWGmoHbT7EgYhU6rCRHjzwHjcb3GJeJbCFYtldGE4nSBiBJ5FlhFVumALsMg4wL8EfavbmyLKTGduvHqFswrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVRP5Nk6awkgXabxnRuQxY8d2GYQ3gf9UzyXM4rl6Jc=;
 b=hGVq+6D9zc2EKHtFnEI4hhKpDyesXd6l4aTIPZMQRew+hVb3CVQoFQoIpVv2/cKptY5atv3UFVulY3FXt4HQjMcHTkvDWh4eS4FqvIqFie1eWDrrtVTln5JlvKqk7cMeb7qe92BeUaMinaC2fnnWBlOtfhm37lGiaSQ68fN8svjFAEFNfRxJnpfC+5DDLwUIpOvQC989jICQq7+cNsKkIqtuxydm3f5VxdJ2YCdafLCE8DG+BYQ3o4AAvNbP2Ed6I1gtsUvRypINF1kW//PoP/TZouPJ3HQcY6lwV/OO4L1yz+GFdRy3D2nlZBV1ns90G66h2oi5oMBku1wS9XbJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6654.namprd11.prod.outlook.com (2603:10b6:806:262::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 21:50:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 21:50:39 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "harshit.m.mogalapalli@oracle.com" <harshit.m.mogalapalli@oracle.com>,
 "rbmarliere@gmail.com" <rbmarliere@gmail.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH] gpu: drm: i915: fix documentation style
Thread-Topic: [PATCH] gpu: drm: i915: fix documentation style
Thread-Index: AQHZ1EDSAqA/E1jtlkCO8o2L1q2aZ6/07rwAgABN1wCAAaBJgA==
Date: Tue, 22 Aug 2023 21:50:39 +0000
Message-ID: <3ab139c439d0296fe25d9479eb4214141b3d47fb.camel@intel.com>
References: <20230821150241.40047-1-rbmarliere@gmail.com>
 <87il9874cz.fsf@intel.com> <61fa76d7-537e-29d0-b9d8-1b19f05d2ffc@intel.com>
In-Reply-To: <61fa76d7-537e-29d0-b9d8-1b19f05d2ffc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|SN7PR11MB6654:EE_
x-ms-office365-filtering-correlation-id: 520272a3-1cfe-4fdc-6f3f-08dba359d31d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NgjvD2gISygxoHkHbw8uxFPinvNovChpkNRrOWEaNrZHFI+GEoYACTugj2IeaASFL5qzbGhRHaM41Gh2EueVxAYr06TmRb1kJLFoyl3tFDlDSFcdsg7/UvSTe/BVWGlSVg16lOW4geLCB5QCgI1WdYlBbsSLRWivVc+r+TH8fJbg29JNmYK5R06NaQEVUqj/d8xqdINiBCNLotmItXCKjlUJuXDSNx/1lSesp2uvFpag7Pmti0jub75RcdMZEC5jVh07KGXNsZvlA/SKrI18NEEook8m7aT/WkzdEL5JwdyMbPw6CO/Ha7gOqZGwjDRfiqqVchzhuxGmwc4m7VLgv3l08bZZPLAdzr5RuGbMSnPmEMiakKUSCRuN1HTSqG+9/6hApOeEWwLP2qhqE5kq29Oh/HWqPQep5ZxFGlXkUPXCcMahN3rdvUU1ZC1+ja3Qsi8Suf5eZG4tYVMRoD7Zfg99SyGEA16B4E7NCps6oOq6wBbJcXE4xt3pd8gYoOBLTKW9X5eteCd80dZr7xu44EdMj0X7GIzGi+Y1X7slSJnE//Syv5tMvXxQqeSzEsvc6jPboWGhGGyHm57nlJjmma2FxthcbfJOcd8HqEODcJ1n2edUbW7/o1m7MjttGiRoV8SFP9z1XwVmM2V8BXFb8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(7416002)(38070700005)(38100700002)(6506007)(53546011)(6486002)(83380400001)(5660300002)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(64756008)(6512007)(54906003)(76116006)(66556008)(66446008)(66476007)(110136005)(91956017)(6636002)(82960400001)(478600001)(122000001)(921005)(71200400001)(36756003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OERWMk9QRWZZTzJLTHlNc2UzaG80WS80aXdZRUJBRG96MzFqNEwycGdmbEJ5?=
 =?utf-8?B?b3pRaVpGOTFmK1dEU1hUM2NXUlBHd1lJYkk3SFdON1pGZFkyajdhNzdjVkhF?=
 =?utf-8?B?U2txL1crMGZGSUtMdHRUZm1NYmJuaE1PUFAvYmpUTmtucFZqRU1KTG9jeG9q?=
 =?utf-8?B?cFlnZkcxRnZLNFUweWwvVVZ3UE5KM3RVYWpBaWRONGNvaTA3UTBLc3R3eVIx?=
 =?utf-8?B?Nzl2WmJhUVB6RkE3LytNdTJXOXIzbnNUNEpLak1DRVVYTERhQ0t5Z2d6bzRj?=
 =?utf-8?B?c1dKcUlXYTgzQ00zQWRyUVpKVmRWVlp1ejRMTitRcXBNeVBEWE96eHFORVlY?=
 =?utf-8?B?Z3NZcXNQc0hkUXhQb21UdjM0QkZtMkpKckJSWDFlSkxoc1VEMnVlZzhncmpO?=
 =?utf-8?B?RWJ1MktGREdIVUtpSHJNZ3FzVlJseFk4a29PQVFoQnVNd1FjU3AvZ3hEam1X?=
 =?utf-8?B?YW9VSnVzZ0REZjZLQ3F4c2djbmsyRStJVHJBS2xtdm1mbzE2bmhjZHg4ejky?=
 =?utf-8?B?TlVNWUxXd3VjdHUySE9sYW1mVEcxdjFUMnR6VUdpU1N5UlEwTGZndGljSlNv?=
 =?utf-8?B?VDRlQkV1NU85eC9Wbks4NHNXSW04YUhYcVBaSjZqaHB4dGlCVldrZnBmNmJB?=
 =?utf-8?B?RmExMXBNVm1oaHVieHYwZ1dYdjJ4cW5vWnFLZ1ZJdVQyN20yUkVBQTcxQllt?=
 =?utf-8?B?cVUyVUtPeTJDaWhOZlJ4MElBSmJaeEJsVnhBbExyZlpBT1ZtTGdkeGNLd0lv?=
 =?utf-8?B?MEI5N1dEMUt5ejJ6MEtzeGFMdlNWZUtON1Y4cG9oMFZPZFEvZnFzTjA3eE16?=
 =?utf-8?B?N2t3dkxBNUlqZ3VnbXBMTUIrT29UaCtFSC9VOG5HSDc1V0xNdklybzNQSTdu?=
 =?utf-8?B?c1ZYZzRhaXVzZ2hXQm1tZCszM2R1ZmQ1NkZFK1ZPYTJteWtGekxITHN1MS9o?=
 =?utf-8?B?RFhXb0lmZm9HU2RFYnlIc3FaWGJTd1hUY2lYVTlWT2d3NmZ5ZzBRZVFpYmVz?=
 =?utf-8?B?NVhaVEVlLytucVkrZ1Zpb0FYbTRIMmVLQU5HSzFFOUZOTmRLN2ZabUlqM041?=
 =?utf-8?B?SHRYL0RiakFMZmdoYmlja213YWNKeFZMNDVSOGh2dzNBNFFhcEMwYTd1OXpr?=
 =?utf-8?B?M1RZZFQrRzFUamQxRGpEWGo1Q2NtOTBjSU05MjVEV1dzeGQ3RWQwdmNNMkJC?=
 =?utf-8?B?RW5hc0ttMU00bmpnL0F6NVZ2MTZUcUFGM1FXR21Zc3AxUkZOdDZWK3dDcVpv?=
 =?utf-8?B?TXZKRCs2ZHU4ZkZ0NVVFUVc4ODBsMndUTlo4VWJ2eHlOMXdabkExU3dwU3hl?=
 =?utf-8?B?V0RKRGludW9LTFNMWmRnZUl3bVdpU3lwb3V0VnF3Y3Jic1VieW13NGpMMW9W?=
 =?utf-8?B?eU4xaTdsR1hTMUpyVDJqMTQ0dEV1Z3BCdE82Y0xxQlRuaUgxS0hDa2NTd3ZE?=
 =?utf-8?B?NFg2S05tY1A3VGREQnA3enBzTjNLVTlocWJ2bWhzZm5vekhzdTlLSDNaaVVR?=
 =?utf-8?B?N1J5QmFLRE1HUldMa2VuZGpSN1R4QmZ1ZTFxMGJibzN2ZGloM3pacmZNT0ZR?=
 =?utf-8?B?Yk45aWhpZEdFUEQyUk1Ed1l5blZWc2FZUDB0YisyMm5uVExFLzR1bk81aFBQ?=
 =?utf-8?B?U3N6V2N0WkxsdzljSFZDVGY3dlpVVG9Sc3JJUW9QbnFiYmFjbFd4Sk9kZnVw?=
 =?utf-8?B?R0VmZUVSeVg4QVBoRkZISkdtSW9FMEgrQU8xUlFlNnEwYnUrZEFQempEOWoz?=
 =?utf-8?B?cVMyQWdOd1JsdEl0NW1HM1lvVEpCVjdqRHRSNndpRTdqSE9WTHJsZ2tDWGov?=
 =?utf-8?B?dk1ja1BoenJMaVFmc1BqZWcrT0RMQWsrOTJFYzNybEsvZmxPZjBpY1U3ckR3?=
 =?utf-8?B?aGdzNWxMYk12cm5BNUkvVnNRM29GSXlKVVlvVmdNSkxscUpIOUpJZFJtQlhW?=
 =?utf-8?B?bkJVUVFnVXIyMEJacVNYbzNFSzBjaVh4MDB5dlRxQXg0R3g4WHVQbVNzNTIx?=
 =?utf-8?B?WEM0M1dhZlFuSExEVjB1NjdXN0lVUjBob0J2WVl6VVNCOU5aSEVSSHNqZ1Ex?=
 =?utf-8?B?eDBFcDBaRmxIK3NYNEU3bklld3M3RUpsSzROWE1yY3FVNUIwZE5HMVEwSHda?=
 =?utf-8?B?ZlFwMndCU2xXbXd6ZENFRG5UMnFtZGxMRXd2Qk05Mi91Z0c2aGQwb01Qanoz?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDEDE7AB7E1957409A816C302582D2D2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520272a3-1cfe-4fdc-6f3f-08dba359d31d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 21:50:39.1893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j8JG8uCZiXPZIZWWu/eicDFmyJTg3ino4+DxBYSy6MHTJ6ohbPelfKcOvDIHY5QqmZ1ddGBIylW3q8KtHhUbQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6654
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA4LTIxIGF0IDE0OjAwIC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gDQo+IA0KPiBPbiA4LzIxLzIwMjMgOToyMiBBTSwgSmFuaSBOaWt1bGEgd3Jv
dGU6DQo+ID4gT24gTW9uLCAyMSBBdWcgMjAyMywgIlJpY2FyZG8gQi4gTWFybGllcmUiIDxyYm1h
cmxpZXJlQGdtYWlsLmNvbT4NCj4gPiB3cm90ZToNCj4gPiA+IFRoaXMgcGF0Y2ggZml4ZXMgdGhl
IGZvbGxvd2luZyBzcGhpbnggd2FybmluZ3MgaW4gdGhlIGh0bWxkb2NzDQo+ID4gPiBtYWtlIHRh
cmdldDoNCj4gPiA+IA0KPiA+ID4gRG9jdW1lbnRhdGlvbi9ncHUvaTkxNTo1NDY6DQo+ID4gPiAu
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5jOjI5OiBFUlJPUjogVW5leHBl
Y3RlZA0KPiA+ID4gaW5kZW50YXRpb24uDQo+ID4gPiBEb2N1bWVudGF0aW9uL2dwdS9pOTE1OjU0
NjoNCj4gPiA+IC4vZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjLmM6MzA6IFdB
Uk5JTkc6IEJsb2NrIHF1b3RlDQo+ID4gPiBlbmRzIHdpdGhvdXQgYSBibGFuayBsaW5lOyB1bmV4
cGVjdGVkIHVuaW5kZW50Lg0KPiA+ID4gRG9jdW1lbnRhdGlvbi9ncHUvaTkxNTo1NDY6DQo+ID4g
PiAuL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5jOjM1OiBXQVJOSU5HOiBC
dWxsZXQgbGlzdA0KPiA+ID4gZW5kcyB3aXRob3V0IGEgYmxhbmsgbGluZTsgdW5leHBlY3RlZCB1
bmluZGVudC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUmljYXJkbyBCLiBNYXJsaWVy
ZSA8cmJtYXJsaWVyZUBnbWFpbC5jb20+DQo+ID4gQWxyZWFkeSBmaXhlZCBieSBjb21taXQgMTc1
YjAzNjQ3MmY2ICgiZHJtL2k5MTU6IGZpeCBTcGhpbngNCj4gPiBpbmRlbnRhdGlvbg0KPiA+IHdh
cm5pbmciKSBpbiBkcm0tbmV4dC4NCj4gDQo+IFNob3VsZCB3ZSBzZW5kIHRoaXMgY29tbWl0IHRo
cm91Z2ggdGhlIC1maXhlcyBwYXRoLCBzbyBpdCBnZXRzDQo+IGluY2x1ZGVkIA0KPiBpbiA2LjU/
DQoNCjE3NWIwMzY0NzJmNiBjaGVycnktcGlja2VkIHRvIGRybS1pbnRlbC1maXhlcy4gU2hvdWxk
IGJlIGluIHRoaXMNCndlZWsncyBwdWxsIHJlcXVlc3QgdG93YXJkcyA2LjUNCg0KPiANCj4gRGFu
aWVsZQ0KPiANCj4gPiBCUiwNCj4gPiBKYW5pLg0KPiA+IA0KPiA+ID4gLS0tDQo+ID4gPiDCoCBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuYyB8IDIgKysNCj4gPiA+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5jDQo+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Yy5jDQo+ID4gPiBpbmRleCBkZGQxNDYyNjViZWIu
LmZhNzBkZWZjYjViMiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L3VjL2ludGVsX2h1Yy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9p
bnRlbF9odWMuYw0KPiA+ID4gQEAgLTI2LDYgKzI2LDcgQEANCj4gPiA+IMKgwqAgKiBUaGUga2Vy
bmVsIGRyaXZlciBpcyBvbmx5IHJlc3BvbnNpYmxlIGZvciBsb2FkaW5nIHRoZSBIdUMNCj4gPiA+
IGZpcm13YXJlIGFuZA0KPiA+ID4gwqDCoCAqIHRyaWdnZXJpbmcgaXRzIHNlY3VyaXR5IGF1dGhl
bnRpY2F0aW9uLiBUaGlzIGlzIGRvbmUNCj4gPiA+IGRpZmZlcmVudGx5IGRlcGVuZGluZw0KPiA+
ID4gwqDCoCAqIG9uIHRoZSBwbGF0Zm9ybToNCj4gPiA+ICsgKg0KPiA+ID4gwqDCoCAqIC0gb2xk
ZXIgcGxhdGZvcm1zIChmcm9tIEdlbjkgdG8gbW9zdCBHZW4xMnMpOiB0aGUgbG9hZCBpcw0KPiA+
ID4gcGVyZm9ybWVkIHZpYSBETUENCj4gPiA+IMKgwqAgKsKgwqAgYW5kIHRoZSBhdXRoZW50aWNh
dGlvbiB2aWEgR3VDDQo+ID4gPiDCoMKgICogLSBERzI6IGxvYWQgYW5kIGF1dGhlbnRpY2F0aW9u
IGFyZSBib3RoIHBlcmZvcm1lZCB2aWEgR1NDLg0KPiA+ID4gQEAgLTMzLDYgKzM0LDcgQEANCj4g
PiA+IMKgwqAgKsKgwqAgbm90LURHMiBvbGRlciBwbGF0Zm9ybXMpLCB3aGlsZSB0aGUgYXV0aGVu
dGljYXRpb24gaXMgZG9uZQ0KPiA+ID4gaW4gMi1zdGVwcywNCj4gPiA+IMKgwqAgKsKgwqAgYSBm
aXJzdCBhdXRoIGZvciBjbGVhci1tZWRpYSB3b3JrbG9hZHMgdmlhIEd1QyBhbmQgYQ0KPiA+ID4g
c2Vjb25kIG9uZSBmb3IgYWxsDQo+ID4gPiDCoMKgICrCoMKgIHdvcmtsb2FkcyB2aWEgR1NDLg0K
PiA+ID4gKyAqDQo+ID4gPiDCoMKgICogT24gcGxhdGZvcm1zIHdoZXJlIHRoZSBHdUMgZG9lcyB0
aGUgYXV0aGVudGljYXRpb24sIHRvDQo+ID4gPiBjb3JyZWN0bHkgZG8gc28gdGhlDQo+ID4gPiDC
oMKgICogSHVDIGJpbmFyeSBtdXN0IGJlIGxvYWRlZCBiZWZvcmUgdGhlIEd1QyBvbmUuDQo+ID4g
PiDCoMKgICogTG9hZGluZyB0aGUgSHVDIGlzIG9wdGlvbmFsOyBob3dldmVyLCBub3QgdXNpbmcg
dGhlIEh1Qw0KPiA+ID4gbWlnaHQgbmVnYXRpdmVseQ0KPiANCg0K
