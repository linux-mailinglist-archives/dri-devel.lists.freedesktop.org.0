Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B34407410
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 01:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CF16EADE;
	Fri, 10 Sep 2021 23:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B89A6EADE;
 Fri, 10 Sep 2021 23:53:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="208439601"
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="208439601"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 16:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="541028074"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2021 16:53:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 16:53:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 10 Sep 2021 16:53:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 10 Sep 2021 16:53:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrpZlr6nVV+7qT2EKmqpSByGI+JuE6ZkKpu2uTSn1QeixE4IIsqt72jbnn+YU3dHBROXQ6BskSj+RGAi3/xX1/En/3edIPnb0pzbt6YpOJG8VtSvHQ4brVh2eR6a2MSNaggDi/pyLVSZsqbynPcQtBAe3aiYryfcmQB4pFSXZDsuBnb8hCk+Ca6oy2yQtvqRlJQ/JTtKPjbvp0jl94X+zgomBe2IQmiKk1Z2gSb1UDhJPzd76rMxnu0sYKxJiZVEcrFHsd1nxtx0W7zyvalJ4jxGSGWbiVn3XC1c8JuIZXOQBjpOhztB0c0w6QP2G4oue1arNZWv+YSxUSEeOP/6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8hDIcvmiTj9PlSrs5LPOzIIg2QyZbIbMP8uh3LmfpzQ=;
 b=AhTJpslRF/VXMOCsbnTbeRLJHWLdHKPMlmlUdv9mOMRlGOaynCVd+kleaHc2Isqx0wcgQ2l/WCxTtgRALuvT3rbX2s7asJvbjbldNKl5yXeY88NNReW5fHlj22aAKMBFDorjaF+3v4PqU4q3qJ4AtZosvEEKM0JWcsrEgzrZXjpBIJPa0no8xoV1wighHvOSRnBNBkMMAcjqW+jRkWhjMKUwBK7oqp4LgIrK1/dHUmg8vVG2rfKj068FVpKDHTCnsiDDve0//nylXAjXY6vN2rJ+hn4SxsISl/LTaOprj8Sc3Bzxx1PQCGLH6ya/CDqz+22MJmwO7aKIvKixNpnzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hDIcvmiTj9PlSrs5LPOzIIg2QyZbIbMP8uh3LmfpzQ=;
 b=fRww9NZfaSjWNoCS3DYDBDsLIR0XWlZGtKWjudegZVuc0BxwbrXbLWxewQulQfdWLbbpHM/tp7ifRvRtfJGk5aj1UY8793FQnB37gbqYM4QMOMioMmqUyBySqzZ8Op/MxKAhCc8rqNq4hKQwgNPvhndscUjvHyZ7LrcKbx14QG4=
Received: from MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 by BL0PR11MB3267.namprd11.prod.outlook.com (2603:10b6:208:6b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 23:53:53 +0000
Received: from MN2PR11MB4661.namprd11.prod.outlook.com
 ([fe80::f0c3:b6cd:cd36:7181]) by MN2PR11MB4661.namprd11.prod.outlook.com
 ([fe80::f0c3:b6cd:cd36:7181%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 23:53:53 +0000
From: "Yokoyama, Caz" <caz.yokoyama@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Shyti,
 Andi" <andi.shyti@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "chris@chris-wilson.co.uk"
 <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: rename debugfs_gt_pm files
Thread-Topic: [Intel-gfx] [PATCH 3/4] drm/i915: rename debugfs_gt_pm files
Thread-Index: AQHXpRT5570wkmGiNE2uQNMAeuK+zqudjzaAgAA4VYCAAAqFAIAAIfuA
Date: Fri, 10 Sep 2021 23:53:53 +0000
Message-ID: <ebf513d9b96ba92a376aa02fe08b26d6f2605f3d.camel@intel.com>
References: <20210909004941.379035-1-lucas.demarchi@intel.com>
 <20210909004941.379035-3-lucas.demarchi@intel.com>
 <20210910175257.oo3wbqnwx2inbcr3@ldmartin-desk2>
 <43256f639e37c2a4a862d42add314fcda48b99fb.camel@intel.com>
 <20210910215214.rl5zccqxkj4id7bh@ldmartin-desk2>
In-Reply-To: <20210910215214.rl5zccqxkj4id7bh@ldmartin-desk2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12639aef-fc8d-40a2-9b8d-08d974b63ecc
x-ms-traffictypediagnostic: BL0PR11MB3267:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB3267FBAC355E632F545ACD749FD69@BL0PR11MB3267.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BKDB//3Iam6q7OCeIuuGvfDhiYmKUoHtZDAGoy/d/NFXCVfw3lrTq3qSl4A3NmsmbSTLPYaNAb4I957AGzuGm60HoWo4GoZwPDyJQcJq+qBIFZC7AqCH9Coct5SIo9JzaOu3QnGfBlvz+D0BR3N/xqBEAxiqorD6+gMdHZrHBv+m+ULdcbZ2eO60JXPo76X8f3ix8Jvo31e30UevyyhDnwLUx7x/zXVzPynRAf/DlsZ+/GBLM9Dvo68NS+u3LFK4eygSilKhWnSyJJe62uH83hbRO4hMz4t1sdFvGxkbFh3xuZbDnRK2YJTFPM0a3id7xDkayXjjlGIj8SmeqwOCmJhzWfZRzaZNEQh5h2D9oiJ+YjIgxq1JgTiHtyvtYnqbBHi5svsq31HCyRfB7c+N78zrsBNUT/DoNhnpAy3YLETd0et5M3hECSFIii+Go1DeXOZ5bUIhw4Q4JlVaa8NBHmr3JP0FLc+FmDRuoy11/zd324pWEZWkbJwouoAtwPOpWuqieP3HzVgPN5u7xBqJVrB8/FQNwMAf5eCckqBQSqRMrgdhux6PNcuv94pQKf4D8qNW8NTJ1GRE1KqBwhzJh9eCJHpn3Fy0Rf3m89vWC/yRrqI7GzUMRDXxHbtL2PhBfNrCddMEc9Z6rHklNBgIMxbEws6TAfXn2GIyOko8HTqWGf68HrZUUo8ZhJ7OCwI5AD/4S9Qp8b2ZtD6/gegXd9swBG6CS/QiMdVWvSVf1oU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4661.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(66446008)(66476007)(37006003)(6512007)(4326008)(64756008)(83380400001)(8676002)(6506007)(6862004)(36756003)(66556008)(316002)(6486002)(8936002)(66946007)(122000001)(91956017)(2906002)(76116006)(38100700002)(54906003)(86362001)(38070700005)(26005)(478600001)(186003)(5660300002)(2616005)(6636002)(71200400001)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWhhNG9aTTNuQ0xadXFWMllCcm8wL0cvbUVSSmNsYkRMUG5EYVdOQmdDaGli?=
 =?utf-8?B?WElscy9KRzlrUXN1K1JVMVdSTkVOZkYwSnNFWHV2THpBU2RwVVp4eXR0WmxR?=
 =?utf-8?B?ZXNGcmFMd1l1MHg4OEJlNzRCbkJtUFBpTEN5VmdaWHNBRExJL3dIY0srelJn?=
 =?utf-8?B?RFBSejB3SjlFVUZZY2pMWGtHcW9JMUxUbG1IMXVrekZ2VkpKeitSbDNEaGE3?=
 =?utf-8?B?a21iZU5CbmZ0QUhZVzFTMHIyQm5BbTllTTIwOFZhK05sYWpmNTFlenl0WmV1?=
 =?utf-8?B?SjNzWGREeThvd3lFcXlnQXF3TXJkVU9FZkp1MWlOVlNtK1NLK3VhdU5mV3FG?=
 =?utf-8?B?NkhhbVIveE5jdEo5SG5XWVlhN2g5aEVaeE5Cb0lackNmalNYWE5NNm1EQzhw?=
 =?utf-8?B?UVYxVkhCekVsUnJmRFA0TnBHNElzSitrbnkwOG1mS3JDM3ZENE1VT1hFVnpi?=
 =?utf-8?B?MlFoVTAwSVc3V2tBUWRRMm1kM1JwY0tmdVVGWUhnL3Fsc0cveWlIcUZnWlJy?=
 =?utf-8?B?K3A1NUJVM0s5WjlLMVBDNS9UOVFDemhNazRMa2hub2dNelZVRS9WcVFrdXBJ?=
 =?utf-8?B?dklCcTl6VkNqSndTUzBWREtGNlVtQzU4NEgyc09ra09hSEptSXZVUDY0cHRH?=
 =?utf-8?B?dEhiNFR6Q29aRHhtUTVCbmZNM2lFVGtQVzhXYWhaMFRSZmVvaEJSSnNaVUhq?=
 =?utf-8?B?Q1lQVG1MbkRPVGs0YXZZQmJzdjR5T21jeE5GVE1YdlRLMnRBc1ZmVXJ2bW5a?=
 =?utf-8?B?dWgza0wvTlFpKzg5OXV5aVJjNzZZeUFLa2J5eE9iRnlxaGlxVkNQT24rWnVq?=
 =?utf-8?B?QXo4Skg5Y3JOMTNuNHJaT0tTaGtmMDlMWVh2b0pFR2lrS25JeFhNdUg0ZWJU?=
 =?utf-8?B?MzFxZm5WRVY1ZUh2UmtXb0hvNWxCTndoZFd5cVc3d1ZuRE1BVzN0WXpFdXhS?=
 =?utf-8?B?K21QM3FIdmpjUjZhMk9sSlRlTU1BNFNCcG5nd25tRFgxS2h6T3crSW1OeG5K?=
 =?utf-8?B?QzJ1Y0xYWDJBQmdlSnkyWURQaGJKZUVPSlBiT2dVc2pIdXlsMFEyL09taTBs?=
 =?utf-8?B?ckc0QVpWMWYvWU5JM1Bmb1lHSXpVRHdUb2VLQmQzMmUxS1EyaVd4M1NlblN6?=
 =?utf-8?B?MHl0VmRuNW1QOWpBNHFNZVhCcDJGOWt0L0VycVNPc1VQamRZckRoaUlyc2tP?=
 =?utf-8?B?bWZuU3hBazFlWjVha1hxSk9sMTVqTHhPb1lRNjVDRms0OGdEUG5NbUpPTEhx?=
 =?utf-8?B?dnFtTGs2WlhnODB0Q05MU1g0dHRpMG9PQi9uSjFyR1loWHlDRWw2YXFKT0VH?=
 =?utf-8?B?UGpxdnhmUXl1K1ZUUUZrelkrR21KVDZTTmRjakxDTE5SWW16eU54cEVRVlMw?=
 =?utf-8?B?a2t3cHFaSmxHb3ROdEZhSVdJa1FhUDFZQWUwV0dQUFo3RnFzcHF5UmdnT3J3?=
 =?utf-8?B?d2xyeFA5SnpLaUZxSkJwb0ZWZXMyQ1ZnSjhQU0FnZ0tXbUx2V1BSTzk2NXhZ?=
 =?utf-8?B?dytVcE1XTjgxbDZEVlpITmRoNUd2QlNpRGZwcHh3c1pSbWFvNzRmc09DTmxz?=
 =?utf-8?B?MHB6RmhZUXNxdDZXcmwyekEyWFJtUVRSZDRiTGI3YU51dWlSalZuOFZqZ2I0?=
 =?utf-8?B?c3kyak1BUDFna2xWaTVUSGNlaDJQUmlVZysweVFoazJHaHkzZGo1bVdPL1RZ?=
 =?utf-8?B?cGh2VUdxbW5BNWxZcHQ4SWxMRUcrRjFqckVQV0FBNFRseGR2cW9JalVhYlla?=
 =?utf-8?B?aTdEWmpvNUl1WCtpZGE5YmMwc3Rod0JUelQ2MWhoL2xSWFZuOFNzL2M3VUx6?=
 =?utf-8?B?REV1Qm1rWU82ZWJOYnFuZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE9B1792BA9C3B44A57E6D7859CB7795@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4661.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12639aef-fc8d-40a2-9b8d-08d974b63ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 23:53:53.5206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53XyCA8TRMCBoMLXZc81s6umDJVtNCmooyqUK/QtW6ITX0wrDz5MtnT89S8EjsZnalYJgPOBV/RhbVyeDXUN7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3267
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTA5LTEwIGF0IDE0OjUyIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIEZyaSwgU2VwIDEwLCAyMDIxIGF0IDA5OjE0OjM3UE0gKzAwMDAsIFlva295YW1hLCBD
YXogd3JvdGU6DQo+ID4gT24gRnJpLCAyMDIxLTA5LTEwIGF0IDEwOjUyIC0wNzAwLCBMdWNhcyBE
ZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIFNlcCAwOCwgMjAyMSBhdCAwNTo0OTo0MFBN
IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiA+IFdlIHNob3VsZG4ndCBiZSB1
c2luZyBkZWJ1Z2ZzXyBuYW1lc3BhY2UgZm9yIHRoaXMNCj4gPiA+ID4gZnVuY3Rpb25hbGl0eS4N
Cj4gPiA+ID4gUmVuYW1lDQo+ID4gPiA+IGRlYnVnZnNfZ3RfcG0uW2NoXSB0byBpbnRlbF9ndF9w
bV9kZWJ1Z2ZzLltjaF0gYW5kIHRoZW4gbWFrZQ0KPiA+ID4gPiBmdW5jdGlvbnMsIGRlZmluZXMg
YW5kIHN0cnVjdHMgZm9sbG93IHN1aXQuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiA+ID4gLS0t
DQo+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0NCj4gPiA+ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZGVidWdmc19ndF9w
bS5oICAgICAgICAgICAgfCAxNCAtLS0tLQ0KPiA+ID4gPiAtLS0tDQo+ID4gPiA+IC0tLS0tDQo+
ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYyAgICAgICAg
IHwgIDQgKystLQ0KPiA+ID4gPiAuLi4vZ3Qve2RlYnVnZnNfZ3RfcG0uYyA9PiBpbnRlbF9ndF9w
bV9kZWJ1Z2ZzLmN9ICB8ICA0ICsrLS0NCj4gPiA+ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfZ3RfcG1fZGVidWdmcy5oICAgICAgfCAxNA0KPiA+ID4gPiArKysrKysrKysrKysrKw0K
PiA+ID4gPiA1IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQ0KPiA+ID4gPiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZGVi
dWdmc19ndF9wbS5oDQo+ID4gPiA+IHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC97ZGVi
dWdmc19ndF9wbS5jID0+DQo+ID4gPiA+IGludGVsX2d0X3BtX2RlYnVnZnMuY30gKDk5JSkNCj4g
PiA+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L2ludGVsX2d0X3BtX2RlYnVnZnMuaA0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvTWFrZWZpbGUNCj4gPiA+ID4gaW5kZXggMjMyYzk2NzNhMmU1Li5kZDY1NmYyZDc3MjEgMTAw
NjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlDQo+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlDQo+ID4gPiA+IEBAIC03OSw3ICs3
OSw2IEBAIGk5MTUtJChDT05GSUdfUEVSRl9FVkVOVFMpICs9IGk5MTVfcG11Lm8NCj4gPiA+ID4g
DQo+ID4gPiA+ICMgIkdyYXBoaWNzIFRlY2hub2xvZ3kiIChha2Egd2UgdGFsayB0byB0aGUgZ3B1
KQ0KPiA+ID4gPiBndC15ICs9IFwNCj4gPiA+ID4gLQlndC9kZWJ1Z2ZzX2d0X3BtLm8gXA0KPiA+
ID4gPiAJZ3QvZ2VuMl9lbmdpbmVfY3MubyBcDQo+ID4gPiA+IAlndC9nZW42X2VuZ2luZV9jcy5v
IFwNCj4gPiA+ID4gCWd0L2dlbjZfcHBndHQubyBcDQo+ID4gPiA+IEBAIC0xMDMsNiArMTAyLDcg
QEAgZ3QteSArPSBcDQo+ID4gPiA+IAlndC9pbnRlbF9ndF9lbmdpbmVzX2RlYnVnZnMubyBcDQo+
ID4gPiA+IAlndC9pbnRlbF9ndF9pcnEubyBcDQo+ID4gPiA+IAlndC9pbnRlbF9ndF9wbS5vIFwN
Cj4gPiA+ID4gKwlndC9pbnRlbF9ndF9wbV9kZWJ1Z2ZzLm8gXA0KPiA+ID4gPiAJZ3QvaW50ZWxf
Z3RfcG1faXJxLm8gXA0KPiA+ID4gPiAJZ3QvaW50ZWxfZ3RfcmVxdWVzdHMubyBcDQo+ID4gPiA+
IAlndC9pbnRlbF9ndHQubyBcDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9kZWJ1Z2ZzX2d0X3BtLmgNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC9kZWJ1Z2ZzX2d0X3BtLmgNCj4gPiA+ID4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
PiA+IGluZGV4IDRjZjVmNWM5ZGE3ZC4uMDAwMDAwMDAwMDAwDQo+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2RlYnVnZnNfZ3RfcG0uaA0KPiA+ID4gPiArKysgL2Rldi9udWxs
DQo+ID4gPiA+IEBAIC0xLDE0ICswLDAgQEANCj4gPiA+ID4gLS8qIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBNSVQgKi8NCj4gPiA+ID4gLS8qDQo+ID4gPiA+IC0gKiBDb3B5cmlnaHQgwqkgMjAx
OSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ID4gPiAtICovDQo+ID4gPiA+IC0NCj4gPiA+ID4gLSNp
Zm5kZWYgREVCVUdGU19HVF9QTV9IDQo+ID4gPiA+IC0jZGVmaW5lIERFQlVHRlNfR1RfUE1fSA0K
PiA+ID4gPiAtDQo+ID4gPiA+IC1zdHJ1Y3QgaW50ZWxfZ3Q7DQo+ID4gPiA+IC1zdHJ1Y3QgZGVu
dHJ5Ow0KPiA+ID4gPiAtDQo+ID4gPiA+IC12b2lkIGRlYnVnZnNfZ3RfcG1fcmVnaXN0ZXIoc3Ry
dWN0IGludGVsX2d0ICpndCwgc3RydWN0IGRlbnRyeQ0KPiA+ID4gPiAqcm9vdCk7DQo+ID4gPiA+
IC0NCj4gPiA+ID4gLSNlbmRpZiAvKiBERUJVR0ZTX0dUX1BNX0ggKi8NCj4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0KPiA+ID4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0KPiA+ID4gPiBp
bmRleCBlNWQxNzNjMjM1YTMuLjQwOTZlZTg5M2I2OSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfZGVidWdmcy5jDQo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0KPiA+ID4gPiBAQCAtNSwx
MCArNSwxMCBAQA0KPiA+ID4gPiANCj4gPiA+ID4gI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4N
Cj4gPiA+ID4gDQo+ID4gPiA+IC0jaW5jbHVkZSAiZGVidWdmc19ndF9wbS5oIg0KPiA+ID4gPiAj
aW5jbHVkZSAiaTkxNV9kcnYuaCINCj4gPiA+ID4gI2luY2x1ZGUgImludGVsX2d0X2RlYnVnZnMu
aCINCj4gPiA+ID4gI2luY2x1ZGUgImludGVsX2d0X2VuZ2luZXNfZGVidWdmcy5oIg0KPiA+ID4g
PiArI2luY2x1ZGUgImludGVsX2d0X3BtX2RlYnVnZnMuaCINCj4gPiBXaHkgbG9jYXRlIGhlcmU/
IFdoeSBub3QganVzdCByZXBsYWNlIGRlYnVnZnNfZ3RfcG0uaD8gQ29tcGlsZQ0KPiA+IGVycm9y
Pw0KPiANCj4gYXJlIHlvdSBhc2tpbmcgd2h5IEkgbW92ZWQgdGhlIGluY2x1ZGU/IEJlY2F1c2Ug
c29ydGluZyB0aGVtDQo+IGFscGhhYmV0aWNhbGx5IGF2b2lkIGJpZyBtZXNzZXMgaW4gdGhlc2Ug
aW5jbHVkZXMNCkFzIHRoZSBwYXRjaCwgaXQgaXMgZWFzeSB0byBzZWUgaWYgLSBhbmQgKyBsaW5l
cyBhcmUgc2lkZSBieSBzaWRlLg0KQW55d2F5LCBJIGhvbm9yIGFuZCByZXNwZWN0IHlvdXIgZGVj
aXNpb24uDQotY2F6DQoNCj4gDQo+IEx1Y2FzIERlIE1hcmNoaQ0KPiANCj4gPiAtY2F6DQo+ID4g
DQo+ID4gPiA+ICNpbmNsdWRlICJpbnRlbF9zc2V1X2RlYnVnZnMuaCINCj4gPiA+ID4gI2luY2x1
ZGUgInVjL2ludGVsX3VjX2RlYnVnZnMuaCINCj4gPiA+ID4gDQo+ID4gPiA+IEBAIC0yNCw3ICsy
NCw3IEBAIHZvaWQgaW50ZWxfZ3RfcmVnaXN0ZXJfZGVidWdmcyhzdHJ1Y3QNCj4gPiA+ID4gaW50
ZWxfZ3QNCj4gPiA+ID4gKmd0KQ0KPiA+ID4gPiAJCXJldHVybjsNCj4gPiA+ID4gDQo+ID4gPiA+
IAlpbnRlbF9ndF9lbmdpbmVzX3JlZ2lzdGVyX2RlYnVnZnMoZ3QsIHJvb3QpOw0KPiA+ID4gPiAt
CWRlYnVnZnNfZ3RfcG1fcmVnaXN0ZXIoZ3QsIHJvb3QpOw0KPiA+ID4gPiArCWludGVsX2d0X3Bt
X3JlZ2lzdGVyX2RlYnVnZnMoZ3QsIHJvb3QpOw0KPiA+ID4gDQo+ID4gPiBUaGlzIGlzIG9uZSBj
YXNlIEkgdXN1YWxseSBkb24ndCBrbm93IHdoYXQgY29udmVudGlvbiB0byBmb2xsb3cNCj4gPiA+
IHNpbmNlDQo+ID4gPiBpdA0KPiA+ID4gY2hhbmdlcyBpbiBkaWZmZXJlbnQgcGxhY2VzLg0KPiA+
ID4gDQo+ID4gPiBJIGRpZCBpdCBsaWtlIHh4eHhfcmVnaXN0ZXJfZGVidWdmcyBiZWNhdXNlIG9m
IGNhbGxzIGxpa2UNCj4gPiA+IGludGVsX2d0X2luaXRfc2NyYXRjaCgpLCB4eHhfaW5pdF9odywg
ZXRjLiBIb3dldmVyIGhlcmUgSSBzZWUNCj4gPiA+IHRoYXQNCj4gPiA+IGp1c3QNCj4gPiA+IGJl
bG93IHdlIGhhdmUgaW50ZWxfc3NldV9kZWJ1Z2ZzX3JlZ2lzdGVyKCksIHNvIG1heWJlIEkgc2hv
dWxkDQo+ID4gPiBjb25zaWRlcg0KPiA+ID4gZGVidWdmcyBhcyBwYXJ0IG9mIHRoZSBuYW1lc3Bh
Y2U/DQo+ID4gPiANCj4gPiA+IEx1Y2FzIERlIE1hcmNoaQ0K
