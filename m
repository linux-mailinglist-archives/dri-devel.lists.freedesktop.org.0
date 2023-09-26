Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1EF7AF263
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 20:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DB010E417;
	Tue, 26 Sep 2023 18:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C6010E415;
 Tue, 26 Sep 2023 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695751484; x=1727287484;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WSDkCsxhGEw2TdHcapyu/lz+jZItV5v1ZSSm777hPyY=;
 b=lebeea0W5uzG5t2Z1aHrTdSJrHaeANtOmyIyQrzOy1dlxb3IUtuqbcgA
 6SAAXVmJclj1EBVBeguJI+V7EHgU/ofJTQ05Ieob3gOLROHPhQ6+XONcw
 Z1Jnh2pne4/Y+ZFKLdzAugxINbTZe9ZBC3g0mpJrefnzV9zFL1yMRGytD
 ILq3Gzz+u8pgZ+q7EcN8UuYCh/XdJO+fIhtH/fblcmBLB+Fo1tgInOpWD
 qouHyZrIOKSACjf9c14it11fmN1lYxAqX4yU20GVAJVN0p9pO6apdRqFS
 V2fuvPhNzT/Ds7hVFdnlrLEx9SAeqhQTQE6nI+vqm4c5alTwN1AYF6cpW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445763398"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="445763398"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 11:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864488484"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="864488484"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 11:04:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 11:04:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 11:04:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 11:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2488hRARySekyOPQRmQbrXIAvt8c19ZJVmYS4pw78mPs71M/55W77KxcIhLve/42Zjqs4AIie1pKEsdQOdsvXkrvwfxvhmnFHlix/pJry81+jjuko8hkefSypOfy9X9ECFbTKJ6BR512FxMBe1XFpmS+1w7Chs2LT0U9sZDC1oDOMlKUn/TPMLGNlIbjALhHCSq/W38pY2b+EbZbkk8MJqfe2Al84wsyHIoiTmXzu3azje4TMeoyEqaWQurZ2+higcdgagpOK4b8gYzG0Jdig1aG8YCfhzj4WzZBirra98ZitKKZvmpBCBYrhxlEv6lNGsTIDoShQ60guYQFvwWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSDkCsxhGEw2TdHcapyu/lz+jZItV5v1ZSSm777hPyY=;
 b=QC9BEoLbxfhaXhVeuRk23qUBk6uKgRRgoyfS+/kYUAWa/N6jY2UjsL8s6f9aTs+hD3owgrHmoOSramnJ004BoQthWj7tDev9Bcu3nX8VU9bJ6FrNqRFcPs+OObwf+v3NRYaQcsqKI60Vs8F2qKlH6beXjgIuOOpU7vRL3c/SW2EiHrWOdy9uIwRBKX9qHSQ3oLkGdUCvr76D/aJQBXh9/Z8Je7aEwqCg8U/GGbh3iO9wC1cjwcpCku0IdwPZLYCmj9QuD3mfwPBBGu/Vr0xuZqzNEN+JGISB6MrjHmEwwWKUmP/ZiRo+koa+FPan5gItKOndBKm6qBj2/u8Gt7jiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SJ0PR11MB5582.namprd11.prod.outlook.com (2603:10b6:a03:3aa::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Tue, 26 Sep
 2023 18:04:29 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 18:04:29 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 6/6] drm/eld: add helpers to modify the SADs of an ELD
Thread-Topic: [PATCH 6/6] drm/eld: add helpers to modify the SADs of an ELD
Thread-Index: AQHZ4W28HsofFf7IFk6mJuxc7bxbJrAthC1g
Date: Tue, 26 Sep 2023 18:04:29 +0000
Message-ID: <IA1PR11MB6348148057ED22D16AEC1700B2C3A@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
 <817e224b7da1d907b252665255421e07a160617a.1694078430.git.jani.nikula@intel.com>
In-Reply-To: <817e224b7da1d907b252665255421e07a160617a.1694078430.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SJ0PR11MB5582:EE_
x-ms-office365-filtering-correlation-id: eed09c80-ab4c-4e99-c3b5-08dbbebb0746
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WwXOCn8FtZ23HYohVmLqW+zZWbaI3KlQmqcQdNEjGyNtvSZKB4bv9gpMVSByAgPP81NDs3PIiuTqu5xPrw2xJ8pQxthUi69kiA2FCnVfcc9iPM5OFYLpHGkmodH0AQ2hD4g9WN8zowQ644E9zZWwY0yp1w8gYhXJw4i2xwICHinxHdH6DpY7IPX3nBE9TRe/HYk/0xEX8TZmcWJgpjCQdldGbGyBtD4V82ptZIZ1qsnWRX9C+oTdJe9DQsv6YIqYgp5BXmMwAPT1uLtnXcg0+uxL2yBG+yvS1h/gV554UV5veCeKqQVWtsVyZaTBkboL7g3nZEQ65IVMVSSp84OO81GIlODUpo3FFpN+ohtkAZ9XNvFBE8P+npaDRKEnsg4kQN9DHvpPx5lkFYjjRQ8icJaKod1JCrSDp/SE/LeYAaWMXAtfPh2c8PgdJSOI6BwyfdSB5axaem2h7xf7ko+XjJx4+S7xMTxcdTxBFiAYzrpqPCvEKSYcBeLDpVmfrTpXaKi+VOux9bY6MvOjKm45F0bRk/VDC7Wza3pndrRh8bjX94T5CvRjaxkiDSgQdetxjuvlby8s/H/+RuI9x+Vwdh5qtbtKmgYIQTyaF0nq928=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(186009)(451199024)(1800799009)(2906002)(8936002)(4326008)(450100002)(5660300002)(8676002)(52536014)(316002)(41300700001)(64756008)(66446008)(66556008)(55016003)(66946007)(110136005)(66476007)(76116006)(26005)(53546011)(9686003)(71200400001)(6506007)(33656002)(82960400001)(38070700005)(122000001)(86362001)(55236004)(478600001)(7696005)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YS9RUktRUmRIOXRobzJzUFZlLzlzbEQ3YlhTRWxheE9velR5ZjF4emFBZE5C?=
 =?utf-8?B?RVd6MUdiNUZKam1ZbC9lcTRIek5qN2pMSHNrUWlDWVhXMitwMEdHZ0pkRUo3?=
 =?utf-8?B?ekJVc3ZvcGMva1dvVTlGRHp5T3pkbXlKd01Fb1ZpRVFBMjBSZVcwaXZZVUlD?=
 =?utf-8?B?NVJtLzBQREgrcm1CdkVaUEQ2Tjc3MHdETy9yU2EvZTZJV3pUZjJlYWlSSUNT?=
 =?utf-8?B?WGpDMHBRMWV4VmQyWng5NjYxMjNrM1JHZFE3NUxhUWI4d0gyZ1lhVnExM25o?=
 =?utf-8?B?S3dabE44WFl2ajNwZTV0V0xRRytvL1RodlAwTE5nRzN0bUMyN01XSEd5cWZ2?=
 =?utf-8?B?SFRCRVBtbjREOERXZVo2U1JZa1Bnb1EzMVJHODRtUit6cEVCQ2tjRzE0V1Q3?=
 =?utf-8?B?Q2U2SVFrWXA5N1lyYTBleUFvRFREUVBwR2pseHBmNWtwNEFNLy9MWUZJSDlK?=
 =?utf-8?B?TVJaWjlmWXE1YlFzd29QTjVvMEF2eDR2Wk9pRDFqeVFoVTRFSzhreHdYdndE?=
 =?utf-8?B?RTBUVVlsVUN6UDdPZEVSNEZzMjBXMXZZTmxURkd6Q1k4LzJpT1RqVmFuM0ZZ?=
 =?utf-8?B?ZlZtWGJkYTNPakJJakZzMUVsUWpUdDNRNEsrcHErSFhqSHhra3YyR2JUMTdC?=
 =?utf-8?B?WnhtYmtCZWEwRElZZnJxbjVUNzhNbzM4QXIrTVVCamhMa3Z2WkoxLytTRyt6?=
 =?utf-8?B?U2poRmZ5NTlGa2djdkxjZWU5cWpOQnl2bVlHblVDK1Z3clNHazlLVE1HZmlO?=
 =?utf-8?B?Q3NHZ2FSZlpIRVFjTnFmRDBrblpQeWJJUHR6b2dseDRkNUZ3elpXaG9iMGt6?=
 =?utf-8?B?RERHSWc1RFlKVWlPZzUrTHdvRzhwNWUvYXB0dUI1U0Jvc3BUZXJ2eU9Fanpy?=
 =?utf-8?B?aEI5MEZoN2c1QVB2U2EybmtvWHgwS3Z2czV1ZUxYVUxFUWRCc1NtaEFCNmMw?=
 =?utf-8?B?blRBMjlIenArQ3dCZDFPZjNWMXBjNlhkQ0VEVlBTSFRxaGJNYjhMZnZlWTJ4?=
 =?utf-8?B?NGl6UklwWkdIakpUMFM5WnpxZkxKdE5kVjF6cTVNVzdDRFV5ci84UWJHSVhI?=
 =?utf-8?B?cDVvUnJab28xeFFSOWJaRC9rSDhzRzFCTXFpN0V3a2NDeE9qellYL1JsTG1T?=
 =?utf-8?B?NE4wSVEwUEQ3RUFKQ3VjQUVwSWlIS3IrZDhKR3lWTWtqOFNSNytkTW5vMmFF?=
 =?utf-8?B?RE5vcndQTlU1MGxIeHJwQU42Mjg0UjdSWVhYRXdHRXZnanJad3Q2enZXR2tH?=
 =?utf-8?B?aGgvQmkxeHdlMXJqd21EZE9rWHFUaURQbHNmRzUrazJKQ1ZGOXExQmdOUzZh?=
 =?utf-8?B?a2RucjFibUtJZ0xLSlprSXBkTEJ5V0R4QjFibHJEMnFudzhhTUV0Ykt4VlVv?=
 =?utf-8?B?aXJxcSt5aGtwR0pvSnZ2aXluV0lkRk5SWmg2dWxVWFhQV2wvZUJKZHpDdzlR?=
 =?utf-8?B?am9KWG01VE5BWlFjVklFNDZGNmNyQTk0R3BLYTNtQjJCNzMyOHJyOHFhM3Zo?=
 =?utf-8?B?YzJ3RHZBQVhDdkRFc0Z5a2ZnMTVLdTNTQkxHeS9NSHdVaHpFb3RjREVJOTVZ?=
 =?utf-8?B?azhKTUpvdmF6OEhNWVVSWmE5TjB6NExvK0dJN01VOFBDem8wMVpFQVZ1M0VW?=
 =?utf-8?B?bUxJZjhQRWlmd3ZGVUVYY0UxbVFJbWN2SFVFaXdHNTFHWWNQWDJaOEt2T2Jz?=
 =?utf-8?B?U1gwNjVVd3c2WjRQMU1xMTJKYmZMclRINXFrbnlCWnFYR2d4OFFQWmZyOU5w?=
 =?utf-8?B?MXlORWZiL2ZKa2lBdHZvdy8xTWpWcHVLNVo1NkJwQ3lYcElmLzRNZ2crN29s?=
 =?utf-8?B?aUdUbTZkQTRpYnBtK2ZiY01QYVZFaEUwY2JVWE9Jd3JsS2hGaFhzWXhCUm9q?=
 =?utf-8?B?WE51SnVrRUZUSWtLSGxFNXFiVzA3OU0zTS9HaUM3VDFuWUJ2UzRKSDNUNkp6?=
 =?utf-8?B?a0ZSckVZTzMvdGNIRE5hNjlOR0Z3L2hSMU9HTEx3MkJMT3Y1eUZic0drak1p?=
 =?utf-8?B?cHV5Q0YyMlFTYkhKRXBOczM1WVZ4Z1ZwV2ErSHZEQkFDdDhEemxlaG16eWR6?=
 =?utf-8?B?Y3FtYmwvM0hJTCtMc3lPTkJyUE9CbXNuL0VpK01vMUgzZ0pibjI4LzBERzR2?=
 =?utf-8?B?eDU1YloycmxISXY1LzBFa3h3UUpiVHl4clJZNXZ3aVhBTm0ydFNkblRMb2NO?=
 =?utf-8?Q?B+7dXm829PlXZpLd1HPYIq4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed09c80-ab4c-4e99-c3b5-08dbbebb0746
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 18:04:29.3085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8odBMhrCuhhKcRzLBtY1DL5wf+RHyKN2pR8FZyUnVInSxvAH/yfC8xDI2KfOTtz40ECzXvOEhYpG5Ei8Afn6yyX6WMNW+zTRuMKX4RHxTDDX8WbFXeWjFqsYOHEYVtg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5582
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWt1bGEsIEphbmkgPGphbmku
bmlrdWxhQGludGVsLmNvbT4NCj4gU2VudDogMDcgU2VwdGVtYmVyIDIwMjMgMTQ6NTgNCj4gVG86
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsNCj4g
R29sYW5pLCBNaXR1bGt1bWFyIEFqaXRrdW1hciA8bWl0dWxrdW1hci5haml0a3VtYXIuZ29sYW5p
QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDYvNl0gZHJtL2VsZDogYWRkIGhlbHBlcnMg
dG8gbW9kaWZ5IHRoZSBTQURzIG9mIGFuIEVMRA0KPiANCj4gT2NjYXNpb25hbGx5IGl0J3MgbmVj
ZXNzYXJ5IGZvciBkcml2ZXJzIHRvIG1vZGlmeSB0aGUgU0FEcyBvZiBhbiBFTEQsIGJ1dCBpdCdz
DQo+IG5vdCBzbyBjb29sIHRvIGhhdmUgZHJpdmVycyBwb2tlIGF0IHRoZSBFTEQgYnVmZmVyIGRp
cmVjdGx5Lg0KPiANCj4gVXNpbmcgdGhlIGhlbHBlcnMgdG8gdHJhbnNsYXRlIGJldHdlZW4gMy1i
eXRlIFNBRCBhbmQgc3RydWN0IGNlYV9zYWQsIGFkZA0KPiBFTEQgaGVscGVycyB0byBnZXQvc2V0
IHRoZSBTQURzIGZyb20vdG8gYW4gRUxELg0KPiANCj4gQ2M6IE1pdHVsIEdvbGFuaSA8bWl0dWxr
dW1hci5haml0a3VtYXIuZ29sYW5pQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBO
aWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2dw
dS9kcm0ta21zLWhlbHBlcnMucnN0IHwgIDMgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmls
ZSAgICAgICAgICAgICAgfCAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VsZC5jICAgICAg
ICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2RybS9k
cm1fZWxkLmggICAgICAgICAgICAgICAgIHwgIDUgKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDY0
IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJt
X2VsZC5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxw
ZXJzLnJzdA0KPiBiL0RvY3VtZW50YXRpb24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3QNCj4gaW5k
ZXggZjBmOTNhYTYyNTQ1Li5kZjkxYjdjZDk5MmUgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJt
LWttcy1oZWxwZXJzLnJzdA0KPiBAQCAtMzY2LDYgKzM2Niw5IEBAIEVESUQgSGVscGVyIEZ1bmN0
aW9ucyBSZWZlcmVuY2UgIC4uIGtlcm5lbC1kb2M6Og0KPiBpbmNsdWRlL2RybS9kcm1fZWxkLmgN
Cj4gICAgIDppbnRlcm5hbDoNCj4gDQo+ICsuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJt
L2RybV9lbGQuYw0KPiArICAgOmV4cG9ydDoNCj4gKw0KPiAgU0NEQyBIZWxwZXIgRnVuY3Rpb25z
IFJlZmVyZW5jZQ0KPiAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9NYWtl
ZmlsZSBpbmRleA0KPiAyMTVlNzhlNzkxMjUuLjYzMmU3NGQ4MjNlOCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmls
ZQ0KPiBAQCAtMjIsNiArMjIsNyBAQCBkcm0teSA6PSBcDQo+ICAJZHJtX2Rydi5vIFwNCj4gIAlk
cm1fZHVtYl9idWZmZXJzLm8gXA0KPiAgCWRybV9lZGlkLm8gXA0KPiArCWRybV9lbGQubyBcDQo+
ICAJZHJtX2VuY29kZXIubyBcDQo+ICAJZHJtX2ZpbGUubyBcDQo+ICAJZHJtX2ZvdXJjYy5vIFwN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWxkLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2VsZC5jIG5ldw0KPiBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwMC4u
MzRlMGQ3MWMzNTUwDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9lbGQuYw0KPiBAQCAtMCwwICsxLDU1IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24N
Cj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+DQo+ICsjaW5jbHVkZSA8
ZHJtL2RybV9lbGQuaD4NCj4gKw0KPiArI2luY2x1ZGUgImRybV9pbnRlcm5hbC5oIg0KPiArDQo+
ICsvKioNCj4gKyAqIGRybV9lbGRfc2FkX2dldCAtIGdldCBTQUQgZnJvbSBFTEQgdG8gc3RydWN0
IGNlYV9zYWQNCj4gKyAqIEBlbGQ6IEVMRCBidWZmZXINCj4gKyAqIEBpOiBTQUQgbnVtYmVyDQo+
ICsgKiBAY3RhX3NhZDogZGVzdGluYXRpb24gc3RydWN0IGNlYV9zYWQNCj4gKyAqDQo+ICsgKiBA
cmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIG9yIG5lZ2F0aXZlIG9uIGVycm9ycyAgKi8gaW50DQo+ICtk
cm1fZWxkX3NhZF9nZXQoY29uc3QgdTggKmVsZCwgaW50IGksIHN0cnVjdCBjZWFfc2FkICpjdGFf
c2FkKSB7DQoNCkNvdWxkIHdlIHVzZSBhIG1vcmUgZGVzY3JpcHRpdmUgdmFyaWFibGUgbmFtZSB0
aGFuICdpJyBmb3IgYmV0dGVyIGNvZGUgcmVhZGFiaWxpdHkgaW4gdGhlIGZ1bmN0aW9ucyBkcm1f
ZWxkX3NhZF9nZXQgYW5kIGRybV9lbGRfc2FkX3NldD8NCnBvc3NpYmx5IHNvbWV0aGluZyBsaWtl
LCBgc2FkX251bWJlcmAgb3IgYGluZGV4YCA/DQoNClJlZ2FyZHMsDQpNaXR1bA0KPiArCWNvbnN0
IHU4ICpzYWQ7DQo+ICsNCj4gKwlpZiAoaSA+PSBkcm1fZWxkX3NhZF9jb3VudChlbGQpKQ0KPiAr
CQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCXNhZCA9IGVsZCArIERSTV9FTERfQ0VBX1NBRChk
cm1fZWxkX21ubChlbGQpLCBpKTsNCj4gKw0KPiArCWRybV9lZGlkX2N0YV9zYWRfc2V0KGN0YV9z
YWQsIHNhZCk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0woZHJt
X2VsZF9zYWRfZ2V0KTsNCj4gKw0KPiArLyoqDQo+ICsgKiBkcm1fZWxkX3NhZF9zZXQgLSBzZXQg
U0FEIHRvIEVMRCBmcm9tIHN0cnVjdCBjZWFfc2FkDQo+ICsgKiBAZWxkOiBFTEQgYnVmZmVyDQo+
ICsgKiBAaTogU0FEIG51bWJlcg0KPiArICogQGN0YV9zYWQ6IHNvdXJjZSBzdHJ1Y3QgY2VhX3Nh
ZA0KPiArICoNCj4gKyAqIEByZXR1cm46IDAgb24gc3VjY2Vzcywgb3IgbmVnYXRpdmUgb24gZXJy
b3JzICAqLyBpbnQNCj4gK2RybV9lbGRfc2FkX3NldCh1OCAqZWxkLCBpbnQgaSwgY29uc3Qgc3Ry
dWN0IGNlYV9zYWQgKmN0YV9zYWQpIHsNCj4gKwl1OCAqc2FkOw0KPiArDQo+ICsJaWYgKGkgPj0g
ZHJtX2VsZF9zYWRfY291bnQoZWxkKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlz
YWQgPSBlbGQgKyBEUk1fRUxEX0NFQV9TQUQoZHJtX2VsZF9tbmwoZWxkKSwgaSk7DQo+ICsNCj4g
Kwlkcm1fZWRpZF9jdGFfc2FkX2dldChjdGFfc2FkLCBzYWQpOw0KPiArDQo+ICsJcmV0dXJuIDA7
DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9lbGRfc2FkX3NldCk7DQo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fZWxkLmggYi9pbmNsdWRlL2RybS9kcm1fZWxkLmggaW5kZXgNCj4g
N2I2NzQyNTZiOWFhLi41YjMyMDE1NzY4NGMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9lbGQuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZWxkLmgNCj4gQEAgLTgsNiArOCw4IEBA
DQo+IA0KPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+IA0KPiArc3RydWN0IGNlYV9zYWQ7
DQo+ICsNCj4gIC8qIEVMRCBIZWFkZXIgQmxvY2sgKi8NCj4gICNkZWZpbmUgRFJNX0VMRF9IRUFE
RVJfQkxPQ0tfU0laRQk0DQo+IA0KPiBAQCAtNzUsNiArNzcsOSBAQCBzdGF0aWMgaW5saW5lIGlu
dCBkcm1fZWxkX21ubChjb25zdCB1OCAqZWxkKQ0KPiAgCXJldHVybiAoZWxkW0RSTV9FTERfQ0VB
X0VESURfVkVSX01OTF0gJg0KPiBEUk1fRUxEX01OTF9NQVNLKSA+PiBEUk1fRUxEX01OTF9TSElG
VDsgIH0NCj4gDQo+ICtpbnQgZHJtX2VsZF9zYWRfZ2V0KGNvbnN0IHU4ICplbGQsIGludCBpLCBz
dHJ1Y3QgY2VhX3NhZCAqY3RhX3NhZCk7IGludA0KPiArZHJtX2VsZF9zYWRfc2V0KHU4ICplbGQs
IGludCBpLCBjb25zdCBzdHJ1Y3QgY2VhX3NhZCAqY3RhX3NhZCk7DQo+ICsNCj4gIC8qKg0KPiAg
ICogZHJtX2VsZF9zYWQgLSBHZXQgRUxEIFNBRCBzdHJ1Y3R1cmVzLg0KPiAgICogQGVsZDogcG9p
bnRlciB0byBhbiBlbGQgbWVtb3J5IHN0cnVjdHVyZSB3aXRoIHNhZF9jb3VudCBzZXQNCj4gLS0N
Cj4gMi4zOS4yDQoNCg==
