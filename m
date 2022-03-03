Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6434CBB2F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7637910EF52;
	Thu,  3 Mar 2022 10:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328E110EF52;
 Thu,  3 Mar 2022 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646302974; x=1677838974;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=MtV4OuKPKOMQnuaptiJPigDcUaagxY4CYNBQpp6vDKg=;
 b=AtXbYS4PXWB12r7QYWG322d0qQp77dqXCGB/dmZiSvsV390f+QSZCKd3
 bgSWhNMuldsm/J3wOazeal7xM1R67/vtKmZJac/xK16Zv7DBqlhpQYV8h
 yABUFtWjG/wTCupCAGaKKK+d9S3CR3ZYKAUgbJPqfhauNWPQjH8peJpP4
 WPPz4P+ARQn7KK1JPBBssPiqI2r81TtRB2YDo1Hs8p57J+tT6fMgUr4mp
 5W24bw9wcabVQxccQy9BOdOd99rSKi4sTWV34KNKgd+SJrrYjdznADxrM
 pUNajnxemU+Bwriq6hOuA60qwsxl0dMVyKdBUEgc41epzMfdojHhxC4XL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="316856128"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="316856128"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="642066910"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 03 Mar 2022 02:22:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 02:22:53 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 02:22:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 02:22:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 02:22:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADDGb/9nAH9wI2/oMWa2Ynp6+StFZABcs/6WubjVPHAIs0PnZlAfltkP4i0K5VWFyL/TmjPdUqHa1NqHI3931Kz/ACZSw0KGtwqVvhbx4M9nrqETrV0ik33LdY85P/0aZp49w0mcCZgu3PoKuLoqpNGBMwo0OYUwbb+7eDHBTkIAnEZ8r67nlYIw01EOuwPgjYO+YcP6YJDcBoqUmsZiCopZpEWEYulecR4IacuPoNhuufegbn1LPD+mBvj60gKdh7Gt2c1q/5ST1c0Ml/xxIpBHr3U5ZJBgvpwtxRDGzZ8xRaluLyT9RjCz+kkaZJJH3zuykB2m1nO/R3wA3YDgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a5scwCRzY3mmyPrAOIB1hU6Vhhb7NHVUJWSW6owPic=;
 b=QRPTMtGmGR5JuY5EON4B41P5OOhsvg7QJGh2l5M7nAfG9pfsXeQYizV4iFZxJt5vyfydeuBCjCMDzjl/YjB3j8yT6YIKzEMbqj2b1hq22y3G5S7je4E/r2ZT9nlS07oKWOQW5+tz5cqBayyN8vIUUbaa1IhMLCJaSH9M3YZrqmwsb4d1L9KbBw/aas2qKu4BJLkM0oVar5Jh+A3uCQ9HH6MeHxw51cgeSYnq9CFRijTFvG5qg1/I8+aMF5n+/kNBMvvgzX5EW7wJFpNUhApZCBDHYVYrcRl8l7s1f/0N64U7ECmhsH0MANXudOLPC4pW53DNG5Nr+jLHkjsOlWxTyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 MN2PR11MB4431.namprd11.prod.outlook.com (2603:10b6:208:18c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 3 Mar
 2022 10:22:50 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::69a8:645d:f48f:1462]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::69a8:645d:f48f:1462%5]) with mapi id 15.20.5017.027; Thu, 3 Mar 2022
 10:22:50 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "jiasheng@iscas.ac.cn" <jiasheng@iscas.ac.cn>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Sripada, Radhakrishna"
 <radhakrishna.sripada@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Handle errors for i915_gem_object_trylock
Thread-Topic: [PATCH] drm/i915/gt: Handle errors for i915_gem_object_trylock
Thread-Index: AQHYLiGD0h296NqzSUeNRv3ikETaoqytdP6A
Date: Thu, 3 Mar 2022 10:22:49 +0000
Message-ID: <c2f150f4a73739b42c3f70002073c2a5de11ef0e.camel@intel.com>
References: <20220302061946.46630-1-jiasheng@iscas.ac.cn>
 <9586bba7-ffb8-945f-eb30-88629e34737d@linux.intel.com>
In-Reply-To: <9586bba7-ffb8-945f-eb30-88629e34737d@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e26ebfc-fc69-4a96-c814-08d9fcffc4ee
x-ms-traffictypediagnostic: MN2PR11MB4431:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB4431A9708324275122339F0697049@MN2PR11MB4431.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ejUmPyrlCGU9Myd3Ef1Dv9GeUaV/VTpGgQ7guBMOpjhHcowTVQefI1AqCVoLweGxjFcRT47RxIHq39ORvumHj4VLaqe7MYbMHen8xm76J54EqTRfLZDQqL72/9XctPoX1AcDYzxVgbeHqox/vbrxjip+oFQ0uXXg0t9MSkK/xIcTyA3WGIBDl9GFoM+tC6SD9L0gqz5VfaDFNOn1Vu5HY7T0B2ztuJN24AS4i+hD7ZGfgAOPMeVemO0pgr9pR/NXu2HpImxbZcpmnFc+GXUTsV1CHPeBOP3P2lOqJDkvIoobdVA2//tveqs2kkHRMe0MmE7G3KhpXHgoq+kvXDzLFUXUjoADHwPID/o3hF6AFHq/HBcJWVzY0GvK6YfBTq9zusSZYFlIYv5mu5ofA03BYSmTLEfnzAw3gxtkOQ/ljB3nb4QVNtWwUSUUKUsbJDWwms7HfEkpHai7W+giyuc4hoFlhL8FUZSmb9RgxOJ60mspxc/WUMabo3NCXBlHUa//aPeFt1S4dMsIujQaXXjuN/aR4XOOYcs6f+JbwahiZLvYicQeVBfXC/xQyLOa3AEFYqJX5yyX6mEFGGl5EuLpTaAOr6eWj2+OmTB2h82XBSlqMbdPDVIvoRm7Twg1nRzb+hK/+DfAr6EZvzaZk95JHG2gtqj2TkSmXPdoc6+N58vgxq2kUQBophooPbkeMpJkR1z+xuuiXZZjE/oZ8R23A88RzHnW+AdsOTk3LNd5wi0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(7416002)(83380400001)(38070700005)(2906002)(38100700002)(91956017)(76116006)(316002)(54906003)(110136005)(2616005)(36756003)(6512007)(4326008)(186003)(26005)(6506007)(82960400001)(53546011)(66556008)(122000001)(921005)(8676002)(66446008)(66476007)(64756008)(86362001)(71200400001)(5660300002)(8936002)(6486002)(6636002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDlNSEk4UUxXVUExRDVkSlR4MVZ1eURQOXUyUFhoblFlY1dvUFlUOTdvTjlQ?=
 =?utf-8?B?b2dSbVFIcXRDZk54Ny9LaFNFUHd5eEQ2bkZveTNYcVFlWWpwaXlZUUFlQVNu?=
 =?utf-8?B?YlV6UGttazNNVlQwMTAvRnkxMGRvOXRKc1NINWt5SXdQbWdYUDhjTHVwN2JY?=
 =?utf-8?B?bXN4VmFRaTIzVy95T3lkYUF4UlZJSUd6cHFsYTJUbmljR1RuTStwdlVYSjVI?=
 =?utf-8?B?Ym1UVFpUYThQNXkyZ3JscVBKYjZjVm9nV0YvRjJVMW9ndXhPc2ttVVovd29r?=
 =?utf-8?B?cjRYbm9xK2RMYndxQUdlNUljQ3lqNVdGaUgvTStyU3RVMlgvVHN3TkU2MGg0?=
 =?utf-8?B?YkV5a1lxS3hseExSek5yZmJvNGhyRno3TVFma3k3SFIxOUsyQ1JuZXg5c3Vl?=
 =?utf-8?B?WEMzOVpscktpeU96SGRoSzJuMks1YUtOTlhGK0NCeUtkeC9Fb0xNd05pd2RQ?=
 =?utf-8?B?WE1JY3VrclBibHNBc3ZYc2JuV0dkWGt5aFRlbXd2ekk0SHI2VUQwN29GSU4z?=
 =?utf-8?B?L3l3ME9COXFnR2Mwelc0a29TUUpLWkk0RFlNK244VEcxdlNLUmd6UFUxdHVp?=
 =?utf-8?B?MVZ4QTJzd1duTVVxcjhnMkdGdjEwVklTbTVPUXRTUFluMi9DRFNNN2hxMlZq?=
 =?utf-8?B?SWpZQWsya21nMUJsZk44cUFoRGpNMEp4RnBsdTZLaURSVUI2dDRuY2hpc3lB?=
 =?utf-8?B?TG1pSEFsaEQzaUtWZXgwWE1YaHVvbVZncFVBSk5FRnNSVmJyMTlmZjJ1YUcz?=
 =?utf-8?B?UzdCZ1lpRWREeW04QUh1WlZEMEFIaUgxOFZkakRoUURTZnZKWTJ5N21PWlFl?=
 =?utf-8?B?K3RXMlJ2YW9RR0IxcFR1ZGRzQ3g5Y1poTTZRb3FGRTJMamdCYjR4dldmM2FP?=
 =?utf-8?B?UTdCNVhXbWw0TmpIcDMwZzdXam5GL1NJa3RPZDVBRVFURTNQSDl2d1VDTkg1?=
 =?utf-8?B?dysvN1ZRcW92bzVZMGdQY0JMV1Q4YkVPQThYRzdZYzVwelpiOUVaL2htbFlj?=
 =?utf-8?B?L1dhZDVSdGswTVBZelhRcE9SWlFyV09wY1dldk1HRjRXZk1GZVVpejZ0ZHlG?=
 =?utf-8?B?dWl0TklPYnc3Ukwyd0diY3ZLYVpCemNEWXVrRnY5eGxXZHFwallDc29kTHkr?=
 =?utf-8?B?eEVTWkVLOEpXUk1hL3c5N3FRMkFXTks4cWFrM1MxTXR2SWJqUk55WTZRcHc2?=
 =?utf-8?B?OHc3VVBsZHpkUXo0cld6ZHpQU3VEdUdibXVCK1l6WWs3U3JOeWhrQ2ZGOS9w?=
 =?utf-8?B?VGpIRmlpSU1yRGFGQnFvaHhVTzJaN0RWQ1J1YXJGQWJtZ2Z4Rkt5dkVaVm9X?=
 =?utf-8?B?U1VpTE9kb0p5TnRZWHVHSDU5cEJ1elFHZ09GZGMwaXYxSUtFMVZJZ2FTNXNz?=
 =?utf-8?B?NHc2NDhiajJ5Tmc4VlBuZkNSZHJhTy95QUJsaTBEUlpFemkzVGNWY3BpNFMy?=
 =?utf-8?B?bTV6SkhlRmphcjlITWdkVnRObE1kb0x2a2FSbHZ6cVJSbmJ0aktZd1dHcnZT?=
 =?utf-8?B?T1BTT3BXQ3B1VVNJenVCNUE4TWE0UC9nT1k3c3ZlNlQ1UTUzTlpOTmovZlE1?=
 =?utf-8?B?SllsaUNjTlRvU2Z5QS8vclV0SXIxMnlwYVRZaDc0dWlKZ1ZWaTM0TGl2L3gw?=
 =?utf-8?B?NjE4cHIrN3dhQllCNmZEN2xKU1BCZlg5K2FreW1OU0VXcHQ0cTZTSGpNK2NK?=
 =?utf-8?B?TXN3RmVoNGU2YVV5Vm5HdmFmaG5iUzArNE1UN1YwODJpY0VBbm90RDFXUXpz?=
 =?utf-8?B?TUdUcTd6N1NCVjdFUkNrUHlQaFM1ak1YaHcvZVJ4SG4wWUVZdHpXVXZkOHVt?=
 =?utf-8?B?SEQ2QUdMYnRUOGhhNnI0SnM2eStuclprMEsyT200dWtzdHg2U2RXNEtsTE9X?=
 =?utf-8?B?QU5RMDAzdFNKbUxqbzlqSkNNVVlSbFV3T0ttK3A3eXVZWm1DZS93K2FHYjFP?=
 =?utf-8?B?YjByTE80dUxhSlJMSnBxYWZoa1FZdVhQWWV6STcyVlZNaGpZOFRMdUIweG5a?=
 =?utf-8?B?Y25GTjRBK2sxZHpOcnNxeXV1VTh2TzVDNWRDTDN6alhFT0g0Uy9FVGJySnln?=
 =?utf-8?B?OXpTK3FIZkNPRlR3QzZDZ0IxNHRwdmdBN2wxZVJVTW9oaGovUTdTNC9hT1Iw?=
 =?utf-8?B?cnZ6VUlnUURyVHloS0kza20vTmljNkQ3bjluTlZxeWJScUV5RVlOclJMZHp3?=
 =?utf-8?B?SWQ4MFNXWkVoSGhjRGM3SVU3cndnbk9JQjJkRFUyS09zMktuUVpRNTJ0MnRq?=
 =?utf-8?Q?A1VuXNN3CqKnNm99wDNtwxP9u8uCG+8PX7b7LobDpQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1724A5505E76E04BBA0C542DB0610333@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e26ebfc-fc69-4a96-c814-08d9fcffc4ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 10:22:49.9229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H104lWyzYd3mVgw/u4lp7B1M3p+7QobdojpVTHVgEqUN1bTqgwMex4ZdH/3aCoeVWF8KdWn+yMxIEJC+UnmgORcCAg74mHlj/MP7fW3xWIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4431
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTAzLTAyIGF0IDEwOjM3ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gDQo+ICsgVGhvbWFzLCBNYXR0DQo+IA0KPiBPbiAwMi8wMy8yMDIyIDA2OjE5LCBKaWFzaGVu
ZyBKaWFuZyB3cm90ZToNCj4gPiBBcyB0aGUgcG90ZW50aWFsIGZhaWx1cmUgb2YgdGhlIGk5MTVf
Z2VtX29iamVjdF90cnlsb2NrKCksDQo+ID4gaXQgc2hvdWxkIGJlIGJldHRlciB0byBjaGVjayBp
dCBhbmQgcmV0dXJuIGVycm9yIGlmIGZhaWxzLg0KPiA+IA0KPiA+IEZpeGVzOiA5NGNlMGQ2NTA3
NmMgKCJkcm0vaTkxNS9ndDogU2V0dXAgYSBkZWZhdWx0IG1pZ3JhdGlvbg0KPiA+IGNvbnRleHQg
b24gdGhlIEdUIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaWFzaGVuZyBKaWFuZyA8amlhc2hlbmdA
aXNjYXMuYWMuY24+DQo+ID4gLS0tDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2Vs
ZnRlc3RfbWlncmF0ZS5jIHwgNiArKysrKy0NCj4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X21pZ3JhdGUuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Qvc2VsZnRlc3RfbWlncmF0ZS5jDQo+ID4gaW5kZXggZmE0MjkzZDI5NDRmLi43OWM2
YzY4ZjczMTYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRl
c3RfbWlncmF0ZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3Rf
bWlncmF0ZS5jDQo+ID4gQEAgLTQ2NSw3ICs0NjUsMTEgQEAgY3JlYXRlX2luaXRfbG1lbV9pbnRl
cm5hbChzdHJ1Y3QgaW50ZWxfZ3QgKmd0LA0KPiA+IHNpemVfdCBzeiwgYm9vbCB0cnlfbG1lbSkN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gb2JqOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gwqAgDQo+ID4gLcKgwqDCoMKgwqDC
oMKgaTkxNV9nZW1fb2JqZWN0X3RyeWxvY2sob2JqLCBOVUxMKTsNCj4gDQo+IEd1eXMgd2h5IGlz
IHRoaXMgYSB0cnlsb2NrIHRvIHN0YXJ0IHdpdGg/IChTaW5jZSBiZWluZyBhZGRlZCBpbiANCj4g
OTRjZTBkNjUwNzZjICgiZHJtL2k5MTUvZ3Q6IFNldHVwIGEgZGVmYXVsdCBtaWdyYXRpb24gY29u
dGV4dCBvbiB0aGUNCj4gR1QiKS4NCj4gDQo+IFN1cmVseSBpdCBjYW4ndCBldmVyIGZhaWwgc2lu
Y2UgdGhlIG9iamVjdCBoYXMganVzdCBiZWVuIGNyZWF0ZWQuDQoNClR5cGljYWxseSBpbiBzb21l
IHNpdHVhdGlvbnMsIHdlIHdhbnQgdG8gY3JlYXRlIGxvY2tlZCBvYmplY3RzIHdoZW4NCndlJ3Jl
IGFscmVhZHkgaW4gYSB3dyB0cmFuc2FjdGlvbiBhbmQgbWlnaHQgbm90IGhhdmUgYWNjZXNzIHRv
IHRoZSB3dw0KY29udGV4dCwgaW4gd2hpY2ggY2FzZSBhbiBvcmRpbmFyeSBzbGVlcGluZyBsb2Nr
IHdvdWxkIHRyaWdnZXIgYQ0KbG9ja2RlcCBzcGxhdCwgc28gYSB0cnlsb2NrIGlzIHVzZWQgaW5z
dGVhZCBzaW5jZSBpdCB3aWxsIG5ldmVyIGZhaWwuDQoNCkkgb25jZSBpbnRyb2R1Y2VkIGEgaTkx
NV9nZW1fb2JqZWN0X2xvY2tfaXNvbGF0ZWQoKSB3cmFwcGVyIGFyb3VuZA0KdHJ5bG9jayB0byBh
bm5vdGF0ZSB0aGlzIHNpdHVhdGlvbiwgYnV0IHRoYXQgd2FzIHJlbW92ZWQgZHVyaW5nIHRoZQ0K
b2JqLT5tbS5sb2NrIHJlbW92YWwgSUlSQy4gU2ltaWxhcmx5IFRUTSBoYXMgYW4gb3B0aW9uIHRv
IGNyZWF0ZSBhbg0Kb2JqZWN0IGxvY2tlZC4NCg0KU28gaGVyZSB3ZSBzaG91bGQgcHJvYmFibHkg
QlVHIG9uIGEgdHJ5bG9jayBmYWlsdXJlLCBpZiBhbnl0aGluZy4NCiBJbiB0aGUgbG9uZyBydW4g
d2Ugc2hvdWxkIHByb2JhYmx5IG1pbWljIFRUTSBhbmQgaW50cm9kdWNlIGFuDQppbnRlcmZhY2Ug
dG8gY3JlYXRlIGFuIG9iamVjdCBsb2NrZWQuDQoNCi9UaG9tYXMNCg0KDQoNCg0KPiANCj4gUmVn
YXJkcywNCg0KPiANCj4gVHZydGtvDQoNCg0KDQoNCg0KPiANCj4gPiArwqDCoMKgwqDCoMKgwqBp
ZiAoIWk5MTVfZ2VtX29iamVjdF90cnlsb2NrKG9iaiwgTlVMTCkpIHsNCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOw0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gRVJSX1BUUigtRUJVU1kpOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoH0NCj4gPiArDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGVyciA9IGk5MTVfZ2Vt
X29iamVjdF9waW5fcGFnZXMob2JqKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikgew0K
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaTkxNV9nZW1fb2JqZWN0X3VubG9j
ayhvYmopOw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIFN3ZWRlbiBBQgpSZWdpc3RlcmVkIE9mZmlj
ZTogSXNhZmpvcmRzZ2F0YW4gMzBCLCAxNjQgNDAgS2lzdGEsIFN0b2NraG9sbSwgU3dlZGVuClJl
Z2lzdHJhdGlvbiBOdW1iZXI6IDU1NjE4OS02MDI3CgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFj
aG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNl
IG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9u
CmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50
ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxs
IGNvcGllcy4K

