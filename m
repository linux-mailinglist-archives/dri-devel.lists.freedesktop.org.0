Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126A7A31DE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 20:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C8B10E178;
	Sat, 16 Sep 2023 18:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCBE10E178
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694889107; x=1726425107;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iA4FRo0QPdAQ2LVDtynJSuVeE1+zUWRcrvdfu0ETHm4=;
 b=UO0HetWfX0Nra+VHcSqX/iU8PMbhhqjz6dO6JcCUfQavGkcetOU03GDH
 ckCqfXHzLrqcgSS3L/5SJoyQbWE9vHk1x+9Di8UOy3QF4UNtcdH7Yov7u
 qNDyTmmysarirwYeD+qcfxGATQfCtrlwGhRDPC6zIiXYqamFbJnGuFzuG
 XOf7ywor1PGf78qWG6XwBx8lfMEEz68FjnyyeCl7EMn9g3BhD3Bd/F36P
 X6rX1BnldGX+z/x8CiP5dBAi3mYceFtWyrI4WzhJyXuoPVY14WGAy9svI
 Q5lzg+4begqPhwE9n/DPd1NcFDgoJ29mEuPxK8SQyvQilsIRLAgCwWHyV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="364491798"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; d="scan'208";a="364491798"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2023 11:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="774697522"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; d="scan'208";a="774697522"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2023 11:31:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 16 Sep 2023 11:31:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sat, 16 Sep 2023 11:31:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sat, 16 Sep 2023 11:31:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaPJm34nmyHjfEAkGhiHnv/hq/0YlkbAN+x3ieOqIxrJTmSYCbnqaVdlQTx5+JMpo6xZsie1x4SuOYCXIkX/JK/4ajW+z5lnvQzDp+PgMZcEWpr+vZw6WZW+j2zrOdmDVUn0UTTFZwW6O81wyORlQS3VoLlPanJueeYjxJ31OtsqSv0gNdLexzlXWZvWxExZNIgQYVWz1Z13pPA3qj94eL+JpbLp0KeveDfYF5PX7yviXOqqNpZyDgyfAfCT5xGvV2iyuDTpLyH40qEiRxm/qsOkmvHvnVLkBHs5nVWGdR6aVXQKUQKx4Jef+prDn8e3Ilb/lxsTEQnhkXVrHwbZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iA4FRo0QPdAQ2LVDtynJSuVeE1+zUWRcrvdfu0ETHm4=;
 b=fYjRosB+rRJ5meLugRjCpYG/TII3X5Qi+/NhO1ISz8u35U9tWjxPhmrBb0d9x20hwlhZgKSm1Xg0TPhWYpfG99qW6vJ1aUPbWsxLveiZ9G1cKooz450lmNDuNm5LOxpyZw3hzahIe7jo23DYAM7FTcZhX5JTAyUuAEZO/emxHMzE76rD756/GnfZXvvPole8s1y+cJye2h5MuIjgQCEEgReBbTrgG132ZMPph0Pdxb+Nr+HghKKGPGlJ4quPDHEyYVkbwyL1NH7RP8pPD3pauXe/urtTBaCJyX/NgR9I3NPJx4TJZDsQ+wy2VrMgmPczQeDGC41677Rl7rJNhjy4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by PH0PR11MB5158.namprd11.prod.outlook.com (2603:10b6:510:3b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Sat, 16 Sep
 2023 18:31:44 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::95f:45a3:da21:b79b]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::95f:45a3:da21:b79b%4]) with mapi id 15.20.6768.041; Sat, 16 Sep 2023
 18:31:43 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Topic: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Thread-Index: AQHZ0Nnu32u80K2Na0Cg35Cfz1LQWK/ulcwAgABFA3CAB2qDgIABYwaAgACkLFCAAYPXgIAAADKAgAAAm4CAAYCYAIAAg3cwgAK4g7CABJ/gAIAXU6cAgAJLysA=
Date: Sat, 16 Sep 2023 18:31:43 +0000
Message-ID: <CH3PR11MB7177E6DFCD893D41AAF0CA7FF8F5A@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
 <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
 <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b35cd8f7-e7dd-e47b-112c-62ee84c92768@redhat.com>
 <ZOeh4x58eGel7WwI@nvidia.com>
 <20e38c1d-24e0-4705-6acb-87921962ccee@redhat.com>
 <ZOjlBGcj2VMP+ptd@nvidia.com>
 <IA0PR11MB71857A044B51DBEBD7D131F7F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <IA0PR11MB7185D5451D4DFBDFD4C258E6F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZO98rj4y0TA4+CfO@nvidia.com>
 <d7b8d777-d97e-6465-01e7-9702efafab43@redhat.com>
In-Reply-To: <d7b8d777-d97e-6465-01e7-9702efafab43@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|PH0PR11MB5158:EE_
x-ms-office365-filtering-correlation-id: aa1ba217-e337-44ad-f610-08dbb6e32d07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VPkzrqsdsuVdoNjtA46w4/OEUZT0iZlsf2s68+iF1QWbRQhylgXHAbuKz0BXYM5Xf/6Fblm6DHoCCaMW0NKE0fCCvBbkqwBRai2a5jQr6dRI/0QideRys2zzzoTHohjNFbhS6RxOwC9OdBvLLqEf+AyD2nI9DlP9XKIHrz8QE4hXvg/wsIMGOj9CP1A2jtQnZySbk/Def7SeUFIlm8vGpSFtxCMynfrbBZR+9UTYkMhbE5X16rkv9Da4bQ5F56tRKjjsKQclz9OoWcIfB6AlQz1U7afwCn2FguhvpGjoJ8YQwOG8FWHl9epRwYe/JfuP66V3DkNGfYsh0aRMarPUopCgcvqzqtBRD5Wtw7rT5pD6t6w4DFuD3+/LPm7KO2zbhzuv3164OzzQ3O8FD+WieN34y/0mpQ/HKxSB2kYQg5EP5Mli+x7SP+X7iAbpuXbCq5+XFLUJKSSX/bNRomJXfDYwR5D7pDdgMXeR96F2BAUnklKQQDukIidSRWQhxc2ZXFU039GPSatT68Jgj8g04RE5174aXwM4Yn/mF7TGQN2aFv+ADNE2DFUE9ACLh6Rkw87kC89c2dNUEiy6jufVlFPZnWie94Din/aF2Mqt9NeqX/A4iqX/UhbEoYLgH3PV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199024)(186009)(1800799009)(4744005)(2906002)(52536014)(5660300002)(4326008)(8936002)(8676002)(55016003)(107886003)(26005)(41300700001)(316002)(64756008)(66476007)(54906003)(66446008)(76116006)(66946007)(66556008)(110136005)(478600001)(71200400001)(6506007)(7696005)(9686003)(38100700002)(38070700005)(33656002)(82960400001)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUw2VGFVRy9yU2RCL2YvRkFJRk4zaUJjQnpIb2xKc0tCcUs2Z2gwamVpd0dt?=
 =?utf-8?B?cjh6enhzUkdIZy84eFo4SjBkRkVIUUFFYm12clc0QzNRSkdMd3Q1VExkMVhN?=
 =?utf-8?B?eS91WG80Yko3REdKRVZveW9FWWRQMXF6bHR0amlBSStYb254L3ZuV3NrMkVj?=
 =?utf-8?B?QndSWVE3MloxbzdhQ3ZFOHNkZ1JCQUVidVVidU5WcU1lNGp4UGlPQnlpT2tt?=
 =?utf-8?B?TWxnN2ZxSGRHSzFVNXNZZ09QWERxSTdaZVdJY3FsR0VRWkRYMDlkMzAwdFRn?=
 =?utf-8?B?TVN4UnVHdXZOU0krbU9yMzNrWkorSHNWekpaM2NTZzFGMVNSdXVtMk5RU0JF?=
 =?utf-8?B?M2l1M0c2blUycUljZ3Bqa05UYm54TXFNS21xUmpOd2dEQVRCSzg0OTQ5Ykpp?=
 =?utf-8?B?cGJyQkltYVlqaUpPSE5jTFFzRUJrQ3RGWFVyTVFRZXN1OS9VZTdCd0RwV2oy?=
 =?utf-8?B?RnlQb1hSM1ltblBCekhqdEx0bVgvS3F4Ui9BUnlBUjZMOXZoVS9nZTJ1RFNY?=
 =?utf-8?B?M2JwUHVGaW1yNy9zMElSZ1ZWUmxzU3VXOGdvc1J4S1BVbmlET0N5M1o2RUdn?=
 =?utf-8?B?S3RuZlpxa3JHMVNBL0o0ekt0SU1nSmhHT1dHcTVaWlQ2dzZHbEpBRldHcjM5?=
 =?utf-8?B?Vkx0b2k0NmNWR0k3TmpqWE9uUUJpNlkyZXFjUTA2Mjh5dEhHMmNHREo5OSs2?=
 =?utf-8?B?UTFIajd4c2R6eHdYK0VXUStQUW5RWFgzY3F4eXJ1YmFINWFRa29MSkxKRGtT?=
 =?utf-8?B?d2NkeFRKN0RabzZ3dEFmYVIrV3lQVE5lZlRLNGdESXJkb2w5WDFjS0paeWZ3?=
 =?utf-8?B?Q1JRRXZxNE12S0N5d2FlQU9vYVpiQWl1OTRTZWZYSG1aNVZlckZPQmJDRXFk?=
 =?utf-8?B?a292Ny9DSXhsdi93S2Mra3dDMGo5QktlVEhGWk95aThweXIxRGkrWkt4Z3V5?=
 =?utf-8?B?UWhwMjh3M2Y4Kzh3dVk3K01BOW80QnRlWFluVGJkVUZFSlBWYVNBUTdtTnV4?=
 =?utf-8?B?eCs0TmVvbzIvWThHTm9VampCbjRsakkrd0Ryb3poZzdONWZ3Tm10YUQ3U3Y0?=
 =?utf-8?B?UzE3NnJ2aHpRL3o3SHV5Zk5VMlNEUENrbXhrODcwcE9pa2ZKRFMxWnViMGpi?=
 =?utf-8?B?RU93Uk55bVBnNXZOOE9JN3BBSk83dkJwZVlIdU84VmxjeDJ3Z3UzTzBiM1VN?=
 =?utf-8?B?aVFzbWxqL2Eya0VDbHVsbWdhbGdIRUxDMVhFa1hjaFg3U0ZCQzU2NUNkTmZz?=
 =?utf-8?B?aTJ4S2poWk5nMFJFdFY2Q1ZmOTdJdVZEWXRNQWNnMkpkOHBPaSsvQmJ5OUo1?=
 =?utf-8?B?Z214RGgrYnZmeERSK2VFNktmY3ZIdCtNT3J6TVZKWk9XdmN6dUtHdlNzSG8y?=
 =?utf-8?B?c1VFY21BTDFKVDhrQ3o1QUVYWm54Ujc3WGllMTBYYVBvcGpFQkh6S2N0QnN1?=
 =?utf-8?B?TEVYRHFLMGhnWkNpRklyWE9wR0tZQWhYaXNoeHhvejZZVmZlazUxZG5TbVY3?=
 =?utf-8?B?dVJINjhqZlBGMzA0NXlBWnBpVnVpVEh2N0wrNjJReGR0eFA4cVdGODEzN2VP?=
 =?utf-8?B?RGhzZ2U5SHQ3c3loY1BXSDZzMDI0R0l1bm1nU2Q4eVlySEJMUUFmK0JlVUFQ?=
 =?utf-8?B?bndTaTJOY1BkdExkUG8wUjZucHlGSzlrNkxmbVA4QVAyL1Q3Z0pWY0ZoZWti?=
 =?utf-8?B?UUZmaFBjTkkvTWRrbG9XVE5UWHBjUUtPNC9DODhkYlJEV2N1SjFnaTJhOVcz?=
 =?utf-8?B?alhFOFpqWHdZQ1ErUjNzeGN0T3JMbno3TW9Vbk9MQlNvbWZlTXBVTzQ4MW1j?=
 =?utf-8?B?WndhZ1pPd1pTM2pQemxhc1o4MXl4bC85WjdTc1FnK1dROGR1TWZ3SlEvNG5Z?=
 =?utf-8?B?RzRKWEhZVkNiNXZMN20ySGpKbG93OGRva2d0WUVHQklKRDJld3liRTdaYWlB?=
 =?utf-8?B?elpOU3lPc0IxYmQ1OTQ1VXgxUEZQK0p2Q1BpdmVXZ0t2RmdUOVEzNUxwclVq?=
 =?utf-8?B?Q09VTXZhWnFsV2xiNy9SNTZwOTlRZCtwT2VMRDN2dVViWkpvL3hnYWRkYm5u?=
 =?utf-8?B?Z0pTWkdmU21zUmRYYS83TWhML2VEZlgzU1VBR045SVN0MnVSUWVkN2dTWmpS?=
 =?utf-8?Q?PBsZKBQcNNEp8J1yV/CCr351f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1ba217-e337-44ad-f610-08dbb6e32d07
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2023 18:31:43.1855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKzeQXzg1X9SgAejs6ZFpAz5Urc6MWRskxkPzEjwNhHpByhQAscDyal/8FMUHeKM1/2OGcywvulPY+NC8yooTFEdC/8YCyG97WtlbYGHtSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5158
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh
 Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQoNCj4gPj4gSSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBoYXZlIGEgZ2VuZXJp
YyAobm9uLUdVUCkgdmVyc2lvbiBvZg0KPiA+PiBjaGVja19hbmRfbWlncmF0ZV9tb3ZhYmxlX3Bh
Z2VzKCkgYXZhaWxhYmxlIGluIG1pZ3JhdGlvbi5oIHRoYXQNCj4gPj4gZHJpdmVycyBjYW4gdXNl
IHRvIGVuc3VyZSB0aGF0IHRoZXkgZG9uJ3QgYnJlYWsgbWVtb3J5IGhvdHVucGx1Zw0KPiA+PiBh
Y2NpZGVudGFsbHkuDQo+ID4NCj4gPiBEZWZpbmF0ZWx5IG5vdC4NCj4gPg0KPiA+IEVpdGhlciB1
c2UgdGhlIFZNQSBhbmQgcGluX3VzZXJfcGFnZXMoKSwgb3IgaW1wbGVtZW50DQo+ID4gcGluX3Vz
ZXJfcGFnZXNfZmQoKSBpbiBjb3JlIGNvZGUuDQo+ID4NCj4gPiBEbyBub3Qgb3BlbiBjb2RlIHNv
bWV0aGluZyB3b25reSBpbiBkcml2ZXJzLg0KPiANCj4gQWdyZWVkLiBwaW5fdXNlcl9wYWdlc19m
ZCgpIG1pZ2h0IGJlY29tZSByZWxldmFudCBpbiB0aGUgY29udGV4dCBvZg0KPiB2ZmlvL21kZXYg
KyBLVk0gZ21lbSAtLSBkb24ndCBtbWFwIGd1ZXN0IG1lbW9yeSBidXQgaW5zdGVhZCBwcm92aWRl
IGl0DQo+IHZpYSBhIHNwZWNpYWwgbWVtZmQgdG8gdGhlIGtlcm5lbC4NCj4gDQo+IFNvIHRoZXJl
IG1pZ2h0IGJlIHZhbHVlIGluIGhhdmluZyBzdWNoIGEgY29yZSBpbmZyYXN0cnVjdHVyZS4NCk9r
LCBJJ2xsIHdvcmsgb24gYWRkaW5nIHBpbl91c2VyX3BhZ2VzX2ZkKCkgc29vbi4NCg0KVGhhbmtz
LA0KVml2ZWsNCj4gDQo+IC0tDQo+IENoZWVycywNCj4gDQo+IERhdmlkIC8gZGhpbGRlbmINCg0K
