Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD66034F7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 23:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F13D10F018;
	Tue, 18 Oct 2022 21:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A021F10E956;
 Tue, 18 Oct 2022 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666128573; x=1697664573;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=byxAF7yMBTTsGmWqpzhQG8m6PNArFslYWBnw5glY8kI=;
 b=nOVqqw2jM0OdlixHaQW3b6uwGkRRRwHw/zwDPGjeSgc/DCK/6lQGwAva
 g3nDv0wZcpPUsXlfU6O7fbRDN/Q8I4fuwwpJy2i1vOShpTSOO/d613TBD
 L1PbXyIIcdpcYJrse5p4WGklap3TiZWr51Z2m8QvQHlD/8FLdbFfx5S2q
 DXsaWUOm/VfzIYTuhowKP64A7deUV7ZmyXZmuBa8a+o4v8n2PNSRwm58W
 7B1rJQrWNPhFt7/DS/n1iNjvYt0oO3gDiCSnY4NEOzGHZhvRF7O3MQg2d
 theBSO48PXZS8UEhuqp6SyQMzKgoUyXbc4LPZxeFClt1yWiatdO7xgqPQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="307349500"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="307349500"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 14:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="733860330"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="733860330"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2022 14:29:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 14:29:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 14:29:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 14:29:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bxt3eglvrtXma6ahWawUpSvXpEkMjZLlZyGFUv+JN3nlbGMLUEJTM80XbT7rxLIkUqCvrP8yDoxAOreRZzWXdzYVNZd3Y5Mrs7+ELberw1alYMU47BzgC6pX5BYoc19U1fVxUN4Kyzpp0GlpH2tNf1iY6rA6BFzlu5tOo2yxSd7fpDlyqTWyxwP2qtU72cYaeIsf+RzBl57Ii3kLUVoVveFCN/gj80syQMPiU9yWDddlD+1gJ6idQowV7DB3uskAr1jtiO0tm57EEtJAUUrIZzmn8YvW61/n63Ahu3ZwMLm00raeCPJnlJGijQx3H8kEEdI86pffJ8ipjDDqzPOzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byxAF7yMBTTsGmWqpzhQG8m6PNArFslYWBnw5glY8kI=;
 b=nO6DL5167Dg7qSMarIJoUBFo678oZaGaFBVBcMt8lA9BSHUlehh03+dA7I2a7kd3a6jOUS7UhEfsFTSHpFD18heM7s8w4f10aHkpPKx1dgYuvzTVUKUMD0Lc1fkKtctAlBolgCL0uukfaJbL/8xE0bAWQEjF+MLWDRn2wOLi3W/vIrlGeCFF7yuHv1liNk7W9tIM6SdGj0H8t/9Gm9NfgPYtsPTwzVnW2rTMsFBcwLvtgFl0ZY8pNHy0+Uc0folLyfPJHVhWVaAduN4Tz9YXV1/WtqsEGefZuXju0uHq3Bn9OAZgt9e0FQ2HQn1p9fPikC+z5M5eEEyF4M7PjrarWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Tue, 18 Oct
 2022 21:29:22 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::9565:8fb8:2340:6430]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::9565:8fb8:2340:6430%5]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 21:29:22 +0000
From: "Chegondi, Harish" <harish.chegondi@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/pvc: Update forcewake domain for CCS register
 ranges
Thread-Topic: [PATCH] drm/i915/pvc: Update forcewake domain for CCS register
 ranges
Thread-Index: AQHY4CT54h4dXt0NW0CYnLBTScWs264UsRYA
Date: Tue, 18 Oct 2022 21:29:22 +0000
Message-ID: <fbd6db944c2ac9be808d5b262576828ac0ea06b5.camel@intel.com>
References: <20221014233004.1053678-1-matthew.d.roper@intel.com>
In-Reply-To: <20221014233004.1053678-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6278:EE_|SJ0PR11MB4879:EE_
x-ms-office365-filtering-correlation-id: c186065d-0ce9-40cb-33e1-08dab14fd308
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fS3k3kGGrX9hgVfBTC6Ck+Mt9SgQlVE+jVKaNo+ed5AAvpor8cH3yxef6NsniC1P/ejPFOW8k/yBafJk4gal0xMlEAI5q8wxkBdq+5YMKgHSavdNQqS0kdwvAFwhA0H+tihU09+bB8nthDLubdFK87dWKiplwEW8fNEAHMs7wZQh/J4rxlDCtACpVd8NgbWYi5eQdDvxKLhYmg9P9jo2D/mj6ExqNZnpBmeAz+TTGbK9H3fL94nbb0g5LeXHCQOsu3DKSe9GMNxyIQR+CwbZO7dTiE8HEcoeTQlMWyM2Nb90cCtn0RdXgVb/13xm5ggXI/5GiHoIHTrMc7LgwnRc7K3IpRCHwwIH/c/4ZRtj8c1MrFB2PbxBpF8544MuYNSehndDSkNDn6bc/yGa8xJQ5tvZCE5BZMWkbWswzzGV5LC4TmEcQd4HRm5j0frAkcmKLsV/Ia455diGjI6eSwiYfxoi6zV1sZc0AjctCtgxPIt+Wed1+WUPCSl0oXDbYOSluWVSYO6/r8xWumuqLOnrT8vgggaH5BH3IWafga4QA1VE+2aYs2ZPylrDCe6hwZwQqD2auGPweA7Is4YClbOUmv6GQZ4LroawR+Y7lRA+C6IvrWzaPGm1J8541mr0d2MJXmNN6uqTsCGAEQ/IScGPO44+jMwntFjjumsX5F26FHkll7TfZ6QiFNN6vkKnmfYfkxEOV4LDe1f1tPZ7znGaFVAE1uOCr0FQHeZWwuNREnNXUllqZ7su7MYpol5w8ff2u2fz2brsnBDE+nj32MXHyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199015)(86362001)(36756003)(38070700005)(38100700002)(122000001)(82960400001)(2906002)(4001150100001)(83380400001)(5660300002)(8936002)(15650500001)(6512007)(186003)(2616005)(6506007)(26005)(6486002)(316002)(478600001)(110136005)(71200400001)(4326008)(91956017)(76116006)(66446008)(64756008)(8676002)(66946007)(66556008)(66476007)(41300700001)(450100002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3lHbmR4L3EyODdwa1c1N3lXVlJMZGFjY2xpTFRLOUxtTkszUTNnemNyTTJD?=
 =?utf-8?B?TER1a3Z0bHdmS1ExSFZ4RlhvZEprbm91TFBTVmtIQlZJb2YzcUlqSEdXb1RR?=
 =?utf-8?B?QTVmTkREZnBPdm5KemUzSGg3MGg4NGRXeFg2VUR6RGRyV3N3bEE4KzRmcldh?=
 =?utf-8?B?dTVvdWt5R0ZsWUs1TFE3VFkvL1pMOFhIdmRLR01XZ1BEbi9XQXVmVEhYNDJx?=
 =?utf-8?B?OFJvKzRSUUVwL1M3Nk8yd0hiL0t3T2NqNTZaTHhQU21ibCs4N3Bod0c4MzAy?=
 =?utf-8?B?NUlnTEhFNjE4eHpCVkhRcXdNU2w4eWJTTFVRU3g1T1NoWVROL0FVNFVRRDBr?=
 =?utf-8?B?MC95Y3ZRajkrOEY3YVZwU2diSWNBN3V6UmY0ckpRNGpMZ0dXSWltbmhsMGts?=
 =?utf-8?B?YmxMS0FtV09tbWlCelo2bjBrbGVqWnFFdXUwbWlKSEZnTDhkNEhEaG5RQ2cv?=
 =?utf-8?B?R002WWtYY1cxaUVNNjBPY3d6aTBIV2VraTNLdXZoOWRuV281WUJFVEFLOXJr?=
 =?utf-8?B?U0VFOGZWdnFUVndEdVhCTVV5dk5CRFJucHNkUFhVSHhQMVRPL3h5MEN4T0FP?=
 =?utf-8?B?TlVERlJWTE5GTzBwa1h1OG5ZcGUvdkpJUXV5c2VwQ1VuVzJZa3BtT0ZVU3Bt?=
 =?utf-8?B?OU1yN1F0QThoMjBTenpUZEdmVmp5WWs0R05pd1F5VlJ1a2F0VVVjOFlxK25n?=
 =?utf-8?B?aVhyUUliYTR4cTh2SERFM2dtSVNZZDZiNDJzNXNKeFlRU2Z2WmFmN2o1VlBM?=
 =?utf-8?B?N2RmWXVTYjJzOWJlWERXd2o2MkhVUkRqRVRLb0VKcklSMEFuc2ViVjZEQ2Rk?=
 =?utf-8?B?TWxLNEFYRUY2UWl6Sk52ZzNnQ2x5TGN6MW5wQ1BDRTRCN2pvdUdOMGxwa2lF?=
 =?utf-8?B?d0NrRHRaVGo5ZjhwT2dweXN4ZVJ5QXpZV1V1WW9COStGc3VIbDZqWEN2ZUto?=
 =?utf-8?B?a1A2NWE4eEhjNUhQZXdqNlFySWFJVUtidFNzKzFXRDlaTTFBK1BRZ0dFbzVa?=
 =?utf-8?B?bURBZGR0bk5qY0VFMWlYR2VzK1EyZi9Id2hrMVV3bWxic09MN0V1bGFjQk5H?=
 =?utf-8?B?WCt0OGN6aFdYZ28wbUNxSDk0M3FLODZlRHd0c0p4UndpVzBhbVdlaStJeEkr?=
 =?utf-8?B?U1dER3dsRnVES0lVcFdhZXU2OWExMzcybG1uM1FrQ3E3MEo1STE5NHorTkx4?=
 =?utf-8?B?MnZYUG9rWDBBZmtkb3N4am9abGg0RnA0cGtxcHRXZkFTbFM2MEZ2bnVRZVpx?=
 =?utf-8?B?TlN1VzdaZjh5N0FKZG1oMXIzZEJLMmpFcGZkZDFFaFRjOEI3Wi92S0tYQnFY?=
 =?utf-8?B?VjZqcHdOSUhLaHAxcUY3aE9RSmhkaDZCMjVhSit5ejc5a2gzRG43djJGZ1l4?=
 =?utf-8?B?L0lueFRDQzgrTlk4bXAwZFlDbTVRcjVuNzJlNFZRMzdRQ3dkQUJVcXhYc0w3?=
 =?utf-8?B?dFBwUExtampPMTFOVHNnQjV3akhaZlJEL1ZrdTVmR3ZJT2pMM2JWcHczTXhJ?=
 =?utf-8?B?bk5DdUVmOHhUTXIzb3ZsR3ZMTnNqaHI2RC9PN2RVTXlPUk1HV3MvUHA4Q01m?=
 =?utf-8?B?RFJvSm90WjdvNVo4bUVvb21pUmlVYTB2QzRrZFhiU1F2NThzdUxpZFh5K0hs?=
 =?utf-8?B?cGhoWUU5c2NuS05ta0s4YjhyT1NWeDdQcVVxQTBISU8wYUpMcUZhamp6aTIw?=
 =?utf-8?B?SXV2S3lYdW15dXZoRDJlQXZFOHQ4NzlWaGZRenR5UzlndVozY3RxY0dBTnlw?=
 =?utf-8?B?clFaZGdHRFJmdDhORUpTdVRrTGM1NTZMNEU0bHFoQVY5NXhpVXJmZ1gzRnRP?=
 =?utf-8?B?V3d0UmVWMzh4RS9kR21Md2JGaVNwM2lrbThrbU52Nm5WNzFIMVNrbkRpVnI0?=
 =?utf-8?B?eDJxMFNGclkyOWQ2NHVIdzgyMzdtWjlUOC9XbDIzTGZ1dEIwdlNYTUdha0Zw?=
 =?utf-8?B?SmpsZW03OWxEYXVTSnY1b1NnWCs5d2RMRElCTUlBdFZwaXhLVzJsRmpLa2FB?=
 =?utf-8?B?anFDWWNTcmFEUW9lRlVSaXBaQWJ6cUVjTTAzc3VjVCtHbFA1Z0JnMnk5eXB2?=
 =?utf-8?B?QXZVNGMwZ2JZaEQ0cFpOeDVqTHhUbVovblY0bzhjOGpVeGs5TXY3ZW1PWTFH?=
 =?utf-8?B?WVFsaWxrTzdYN25ndWVhMmFWNFpMa21mcit6c0Q0dWdZSHk1YVM2TjlhUkRL?=
 =?utf-8?Q?SpOYAlf8S/PoKAN5gDz+C8M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B8BFE77F963DB4FA7703ADA36DCBBF6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c186065d-0ce9-40cb-33e1-08dab14fd308
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2022 21:29:22.7253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k9didmOq+wpKbrtuX2nKpwUJe5QRSbKoH+H262GXsYs9rVk9Zdm0RZFEzZgMeuLeY/6exM0h9kKocytimwQcbhN/N8zVpykPno+8iNleTlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTEwLTE0IGF0IDE2OjMwIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOgo+IFRo
ZSBic3BlYyB3YXMganVzdCB1cGRhdGVkIHdpdGggYSBjb3JyZWN0aW9uIHRvIHRoZSBmb3JjZXdh
a2UgZG9tYWluCj4gcmVxdWlyZWQgd2hlbiBhY2Nlc3NpbmcgcmVnaXN0ZXJzIGluIHRoZSBDQ1Mg
ZW5naW5lIHJhbmdlcyAoMHgxYTAwMCAtCj4gMHgxZmZmZiBhbmQgMHgyNjAwMCAtIDB4MjdmZmYp
IG9uIFBWQzsgdGhlc2UgcmFuZ2VzIHJlcXVpcmUgYSB3YWtlIG9uCj4gdGhlIFJFTkRFUiBkb21h
aW4sIG5vdCB0aGUgR1QgZG9tYWluLgo+IAo+IEJzcGVjOiA2NzYwOQo+IFNpZ25lZC1vZmYtYnk6
IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogSGFy
aXNoIENoZWdvbmRpIDxoYXJpc2guY2hlZ29uZGlAaW50ZWwuY29tPgoKPiDCoGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX3VuY29yZS5jIHwgMjIgKysrKysrKysrKysrLS0tLS0tLS0tLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF91bmNvcmUuYwo+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaW50ZWxfdW5jb3JlLmMKPiBpbmRleCBjMDU4Y2RjNmQ4YTAuLjJhM2Uy
ODY5ZmU3MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF91bmNvcmUu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5jCj4gQEAgLTE2ODIs
MjUgKzE2ODIsMjcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9mb3JjZXdha2VfcmFuZ2UK
PiBfX3B2Y19md19yYW5nZXNbXSA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgR0VOX0ZXX1JBTkdFKDB4
MTIwMDAsIDB4MTJmZmYsIDApLCAvKgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
MHgxMjAwMCAtIDB4MTI3ZmY6IGFsd2F5cyBvbgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgMHgxMjgwMCAtIDB4MTJmZmY6IHJlc2VydmVkICovCj4gLcKgwqDCoMKgwqDCoMKgR0VO
X0ZXX1JBTkdFKDB4MTMwMDAsIDB4MjNmZmYsIEZPUkNFV0FLRV9HVCksIC8qCj4gK8KgwqDCoMKg
wqDCoMKgR0VOX0ZXX1JBTkdFKDB4MTMwMDAsIDB4MTlmZmYsIEZPUkNFV0FLRV9HVCksIC8qCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDEzMDAwIC0gMHgxMzVmZjogZ3QKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MTM2MDAgLSAweDE0N2ZmOiByZXNlcnZl
ZAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgxNDgwMCAtIDB4MTUzZmY6IGd0
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MTU0MDAgLSAweDE5ZmZmOiByZXNl
cnZlZAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDFhMDAwIC0gMHgxZmZmZjog
Z3QKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgyMDAwMCAtIDB4MjFmZmY6IHJl
c2VydmVkCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MjIwMDAgLSAweDIzZmZm
OiBndCAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDE1NDAwIC0gMHgxOWZm
ZjogcmVzZXJ2ZWQgKi8KPiArwqDCoMKgwqDCoMKgwqBHRU5fRldfUkFOR0UoMHgxYTAwMCwgMHgy
MWZmZiwgRk9SQ0VXQUtFX1JFTkRFUiksIC8qCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoDB4MWEwMDAgLSAweDFmZmZmOiByZW5kZXIKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgMHgyMDAwMCAtIDB4MjFmZmY6IHJlc2VydmVkICovCj4gK8KgwqDCoMKgwqDCoMKgR0VO
X0ZXX1JBTkdFKDB4MjIwMDAsIDB4MjNmZmYsIEZPUkNFV0FLRV9HVCksCj4gwqDCoMKgwqDCoMKg
wqDCoEdFTl9GV19SQU5HRSgweDI0MDAwLCAweDI0MTdmLCAwKSwgLyoKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoDI0MDAwIC0gMHgyNDA3ZjogYWx3YXlzIG9uCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAyNDA4MCAtIDB4MjQxN2Y6IHJlc2VydmVkICovCj4gLcKg
wqDCoMKgwqDCoMKgR0VOX0ZXX1JBTkdFKDB4MjQxODAsIDB4M2ZmZmYsIEZPUkNFV0FLRV9HVCks
IC8qCj4gK8KgwqDCoMKgwqDCoMKgR0VOX0ZXX1JBTkdFKDB4MjQxODAsIDB4MjVmZmYsIEZPUkNF
V0FLRV9HVCksIC8qCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDI0MTgwIC0g
MHgyNDFmZjogZ3QKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MjQyMDAgLSAw
eDI1MWZmOiByZXNlcnZlZAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgyNTIw
MCAtIDB4MjUyZmY6IGd0Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MjUzMDAg
LSAweDI1ZmZmOiByZXNlcnZlZAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDI2
MDAwIC0gMHgyN2ZmZjogZ3QKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgyODAw
MCAtIDB4MmZmZmY6IHJlc2VydmVkCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4
MzAwMDAgLSAweDNmZmZmOiBndCAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAw
eDI1MzAwIC0gMHgyNWZmZjogcmVzZXJ2ZWQgKi8KPiArwqDCoMKgwqDCoMKgwqBHRU5fRldfUkFO
R0UoMHgyNjAwMCwgMHgyZmZmZiwgRk9SQ0VXQUtFX1JFTkRFUiksIC8qCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoDB4MjYwMDAgLSAweDI3ZmZmOiByZW5kZXIKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgyODAwMCAtIDB4MmZmZmY6IHJlc2VydmVkICovCj4gK8Kg
wqDCoMKgwqDCoMKgR0VOX0ZXX1JBTkdFKDB4MzAwMDAsIDB4M2ZmZmYsIEZPUkNFV0FLRV9HVCks
Cj4gwqDCoMKgwqDCoMKgwqDCoEdFTl9GV19SQU5HRSgweDQwMDAwLCAweDFiZmZmZiwgMCksCj4g
wqDCoMKgwqDCoMKgwqDCoEdFTl9GV19SQU5HRSgweDFjMDAwMCwgMHgxYzNmZmYsIEZPUkNFV0FL
RV9NRURJQV9WREJPWDApLCAvKgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgx
YzAwMDAgLSAweDFjMmJmZjogVkQwCgo=
