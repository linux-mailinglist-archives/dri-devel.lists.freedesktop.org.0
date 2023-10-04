Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1127B7AB6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 10:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8BC10E349;
	Wed,  4 Oct 2023 08:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7333E10E348;
 Wed,  4 Oct 2023 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696409523; x=1727945523;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QpWMW+EifYOhROvefcWpXu7ZmwvAeFpEc3fDbVpobno=;
 b=g+7eP7pQpsDB10IpMFIgrwJERMlcswKnt4ETkwlfDaJGYPSxMIKi1A6r
 hVYiaEgMU+tyn2SmhVRscjwpw5ZryYP06wDLpP6Rqm67LfUiZLx66K7RL
 ttDJ3TnImXqlnHwSN1kDlTN+VNUUoEesFc0+0SCKxOqyUWETCK8++MBmb
 t+imSwBjo5xYFJGeJk/894RlbaRF58TS83H+uQYcXi298Q4952jxJMR4f
 esd09RYWEgMwSL9W6Ejxod/w2Hgf+WhVuixCFbbX17YjlbzjbaqmHH92L
 Y4XIreucSJASCBKI9OwVMlKOiVDKyhDNhumE3v0KBk7SYU5ZkN+5THMKD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449600617"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="449600617"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 01:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="925021189"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="925021189"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 01:52:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 01:52:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 01:52:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 01:52:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lovmPozM6S2or9+xiH5QcNiiCiTEvgvZT/XcOFwyVbzVpYYNDfv/pysZs6qp+iWeFvPZUqNR6p5yn2Gw162Dw4NuEKSmX/6Yp91z9QduKLmsidNTk2NCtcpEOYdVfMEy0kJk3+4yUhWzKeltr2kyA8hcQ6n/s79EjVnG3jHJBj2u0A8cBFbESI/Yu8ShqSkGNKDZJ1QJ3xpYEgIm84VYn8U4+rQ82fleI2dU9t2shPH0+oRAmQKINncnHaNpr7XhKAs9dxk4MFt/rjoF1b0U59rTQuCGOkDHMsPeBYb8RaDODDwiAj8qMajqnpJnESpSxlgokUJwQejkENgjX0jR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpWMW+EifYOhROvefcWpXu7ZmwvAeFpEc3fDbVpobno=;
 b=MrcvogWnFzQK/0wEFQKRgYJpJYDTc8iexYstolCvajJ2heKRZybxYGEms8mFO3B/X3G5i9qaOEZIuqNIVhNT8S/RCD2LcBu2JDD27kZLrK/BWcW04cgp4qMQziSWRmVwuqN6Wv8HOsI2wuxteG5iJM+NxNSbh4lVvDTE0tlB32nlUAFjJYBUKknb24qIJv5H7VjqYVj+//Ax2u4TSnsoVwL8l7m/WWhdEpsxeGgdgxRY3j+wadlIwdMX4cAufjmwcKg0urmSHxhwrQuFh1lty5JnaU9QR1h6k5YcpRJ3MkISD/iicEfCo4mzeMk02mtts4UQhQeokd5GjJHXGH2WYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.33; Wed, 4 Oct 2023 08:52:00 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b%6]) with mapi id 15.20.6838.028; Wed, 4 Oct 2023
 08:52:00 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v6 2/6] drm/i915/psr: Move psr specific dpcd init into own
 function
Thread-Topic: [PATCH v6 2/6] drm/i915/psr: Move psr specific dpcd init into
 own function
Thread-Index: AQHZ7FRiEzNxT2ls9EuRcD9zIkTaurA5Zy4A
Date: Wed, 4 Oct 2023 08:52:00 +0000
Message-ID: <DM6PR11MB31772B2B300C9D6B689CE9C3BACBA@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20230921061335.454818-1-animesh.manna@intel.com>
 <20230921061335.454818-3-animesh.manna@intel.com>
In-Reply-To: <20230921061335.454818-3-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|DM4PR11MB5972:EE_
x-ms-office365-filtering-correlation-id: 1e32fc74-dc54-4513-ddbe-08dbc4b72c4c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CdOcxdsSpZL//CcRb2EImhIUqU9/SalSFiv3IopiwTlJ0C4Izak/tmFUNrEBE2pFxNs5I+jBUHwvOCaexVD3Ls+Ql96v8ZE2H3rdsXccDa/Mt4bYeDAE58zmlV/J7FKYAnpO7piTBXGVFyhLgV8F7u//qtWC6szHL4y1durVeudGrBgDrHzlE9dv81tl9gu8WWSYWbz8yyzYRMrpIsvD4e7evhbopxQDyc3cGs9bg7k2g2CIF6/gzQW5W5D2NFQu+z/H9eXx1h9lCPhx2/OhQ6w0czdE67DWnn9Vh7tKaxLpXkbNAz4qZmodlJct4YsV4t8lB6kBpP9c/FFe8dQW67bB0nVkq+jUOhJTs++QEHkNQrvCrCO5wEXaue5uJh3RY4Dpmx0GfmJr0ur8x4FW32A7WtVyXns7xO3x8lyRPpzejtqi7ggwuudzCjlDYFssIX73+FMGZaFFrVd83kv9FqE1jZnHSu7onYwCGv8OWOIRd8TPKXA3yBCyBoSNUaKVlW7wLJo3Eu8jCs/hnWWCzumJPL3lYKVgnYRdGGGI5fSGO9nobs+kKumj7kCJFPswyV4ijcRKzcHulgEYY19SJkheeyuBAiQarHwSosqVvmOxnU1mPjxjSSh9t1lhXBmt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(83380400001)(38070700005)(86362001)(33656002)(82960400001)(122000001)(38100700002)(55016003)(9686003)(66946007)(316002)(76116006)(66446008)(66556008)(64756008)(66476007)(54906003)(7696005)(6506007)(55236004)(110136005)(41300700001)(107886003)(71200400001)(478600001)(53546011)(52536014)(8676002)(26005)(5660300002)(450100002)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFF6a05sUTJ5TVNIZ0NmczFDd2lkeEpiRmZjQ2lMSnYvWTdkQVBEQ255K0hn?=
 =?utf-8?B?aWU3dTFyWXZ6MXBSa0pCcmE5d2Nna1d6V0tUMHAwaDRCYXloZ09NdXNJRXRG?=
 =?utf-8?B?SDlvUWxIV21Gc2FFOE5aMkhKdE1hWitKaGpxOEM1UUlDU09xMDFBT2pmeXpr?=
 =?utf-8?B?OE1LbmowT1NOb0N6bXJrZ0NZU0JRSmFwTDVoR1RWRlI1eENZNUIrTXRIa2Vk?=
 =?utf-8?B?WlBMZkpUSUxYdXVNa1ZMSWNtWDVoVENmMHo1WXFBUEI4MVQ5TE9kT2twd3B3?=
 =?utf-8?B?MmFNcDZ2RlN3TGxpSFI4ZnlCVXM5c05TdEhjN3NiSzdKbVBLSHdGL2V0UFJD?=
 =?utf-8?B?aXpXNkV5MUs4bGFXNStoYVVoUU9JSTdmb2hObUdnbTB1Q1BiLzdLYW5Eby9W?=
 =?utf-8?B?dW9WMkptRlFTeEJaa0YreWE4WHRGZUVmM1NHYUorQjI5TmpkWlp2N2o0TXcv?=
 =?utf-8?B?eU1sa0I1TTc5bGxSWE9YWWhhU3NrZUpzdU1YcWszdXhINUpkMUJPUnZZM1VK?=
 =?utf-8?B?Mi9DUGhJcm95NGZuSDhReko5d2VVc2RMQlRVa3FPdkJkcExuZlBNTmN4Mllx?=
 =?utf-8?B?SkZpdndScFlKb0w5THFXYlV3SXRkREZmaXh6TWNNRkFOd21qWkFXZTZoZXZx?=
 =?utf-8?B?TzRMaEIxNDAraTloL2wxTTZrQW0yTnViVHFQUUdLTHRUcFhEZytudm9YeDRq?=
 =?utf-8?B?OEFZQW11dVI5SWxSeFlzV0IxWHowbGpLOHpuMnBDSkxNTk1QMkd3d2VGeDBq?=
 =?utf-8?B?OW9qWnhxaVJjK3dUZTd0bWxISVFsUW1KV2lQS1ZFUGJ1MlRRS201Rzh6TFdN?=
 =?utf-8?B?aFg3d2RLWTRFZ3hRekxOU0lCbUZHeXlHaXZmcUU5ZFMxYm1RMXJNaFRVL0Rm?=
 =?utf-8?B?aHhDOTBYM2tpN0tBVXorb2dKZHA0aDFnQmx2RTRNZ1F0STNFQXk2RTFGOUNE?=
 =?utf-8?B?c2I0eUY1QXpCd09ZR0ZZR2o0S1BQak0vaDNEQUdDWXB0RHZ2ZTlHMXRwalhp?=
 =?utf-8?B?ZUFzZ2ovQU1RWHdLaEpoUlBqa3orQnNVN1BXaGtQNXo0aGwwbHBlQUlyeCtl?=
 =?utf-8?B?MWxCcUN4eHpNb1h4UFFpaituWjVsVC84RVVMMS83UXBGUHhiQXl5WGpBREJG?=
 =?utf-8?B?TW5wYVJiNElPZVdmMFJHS1ZOV1BaZFI2V3h0SVlxZTRTVFIyMGJqbDJidGlG?=
 =?utf-8?B?bVIwb2JQN3ZoYklKcVZsa2xFN3V1YkZremNxbUc2TkNUWVozNVRqdW9vTVhX?=
 =?utf-8?B?UUNKaDZPRXRiVUZLT1B2TCs0NjJUQlI0Wm8xZEJhRDZXd0pVeFdLcERhWXJW?=
 =?utf-8?B?cEt1VkVrK3FkMnBvNU9XYWlVN1hLbDVpQVUyOXFoWEZSSVJhUjdSWWd3bHBp?=
 =?utf-8?B?eFZxRHpOc2VCRnZZUmI4VDM5Rkg1TEU2OURwMldSN1E0bWVjQXBKQUlreGhY?=
 =?utf-8?B?TmRsZHJCOGZicW43TVJsbGZLbmFNR2RZbHVMbENLOUNab1gxSWJIMHREUFNx?=
 =?utf-8?B?K1JIVlJ5OTE5VDlyM0czZGV2Qi8yVENOOWxCL0hQc0xwdlE4V0p0WUEzdGtI?=
 =?utf-8?B?bXRQQWhoa0VNWTAzR2I2MlBlTldTV0NHcEMrVTEyNVBqazhoZXdoTklLNVBE?=
 =?utf-8?B?V0svazFLZGlDdzVtYmg2MzlMUC9uYXBHVThjM1Z1T3RmS0pBdHRYOEZUVnpB?=
 =?utf-8?B?c2hsNFl3MDhaVEQ4U0duNGExVzh3WEZWTHZQOXdEbVk3Z0N0ejc5dzI3YVRZ?=
 =?utf-8?B?WEFJdmNwdjRvUlRIR0RYQXB3dlB3N3FpeEd2cHNKa3IyQU81QlpQdmp1VHF3?=
 =?utf-8?B?WjVzSFRmbGp4cVlGSzJ6aGN0eVdhZWdET3B3RzNtQ2p0dzBKRXgxaGpHWEV6?=
 =?utf-8?B?NU11V3JRelFNQWVwWjNkVDhmcTBrb2J0S1cyUEVseGNCcFIwNi9Pbmd6U09i?=
 =?utf-8?B?Um0vQ1IxcTdjd003SGptejZmWFdxODNjWHRUWWNiZnhqKzlHaGZXeGIzOEpS?=
 =?utf-8?B?ekFpajNCUG9HeUM4ejRwaE8zcjcySTY1Z0RleHc2UTArNGF0ZnFyaEpONGZU?=
 =?utf-8?B?SU51WHpISkZJUzVMNkt4bTFwY0xobjhCSzZZeE9XMmNhVnpjTTRyOStMT1pO?=
 =?utf-8?Q?RsVpYPoU0lrBewVXBV7eBg63w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e32fc74-dc54-4513-ddbe-08dbc4b72c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 08:52:00.3845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EFESyPhDytERatr1nfjJEGEGSMy0KAorAN2t3mWAdk9Ob4Kd0PdNd6mzLUevZqEuXtyYuWmmM7lCdOQWPocksg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander,
 Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFubmEsIEFuaW1lc2gg
PGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDIx
LCAyMDIzIDExOjQ0IEFNDQo+IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBOaWt1bGEsIEphbmkgPGphbmku
bmlrdWxhQGludGVsLmNvbT47DQo+IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJAaW50
ZWwuY29tPjsgTXVydGh5LCBBcnVuIFINCj4gPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggdjYgMi82XSBkcm0vaTkxNS9wc3I6IE1vdmUgcHNyIHNwZWNpZmljIGRw
Y2QgaW5pdCBpbnRvIG93bg0KPiBmdW5jdGlvbg0KPiANCj4gRnJvbTogSm91bmkgSMO2Z2FuZGVy
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IA0KPiBUaGlzIHBhdGNoIGlzIHByZXBhcmlu
ZyBhZGRpbmcgcGFuZWwgcmVwbGF5IHNwZWNpZmljIGRwY2QgaW5pdC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAtLS0N
ClJldmlld2VkLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCg0K
VGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cg0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyB8IDQxICsrKysr
KysrKysrKystLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyks
IDE4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Bzci5jDQo+IGluZGV4IDg1MGIxMWYyMDI4NS4uNzFmZTJlNGFjYTg1IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gQEAgLTQ3NCwyNyArNDc0
LDIyIEBAIHN0YXRpYyB2b2lkIGludGVsX2RwX2dldF9zdV9ncmFudWxhcml0eShzdHJ1Y3QNCj4g
aW50ZWxfZHAgKmludGVsX2RwKQ0KPiAgCWludGVsX2RwLT5wc3Iuc3VfeV9ncmFudWxhcml0eSA9
IHk7DQo+ICB9DQo+IA0KPiAtdm9pZCBpbnRlbF9wc3JfaW5pdF9kcGNkKHN0cnVjdCBpbnRlbF9k
cCAqaW50ZWxfZHApDQo+ICtzdGF0aWMgdm9pZCBfcHNyX2luaXRfZHBjZChzdHJ1Y3QgaW50ZWxf
ZHAgKmludGVsX2RwKQ0KPiAgew0KPiAtCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJp
diA9DQo+ICsJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPQ0KPiAgCQl0b19pOTE1KGRw
X3RvX2RpZ19wb3J0KGludGVsX2RwKS0+YmFzZS5iYXNlLmRldik7DQo+IA0KPiAtCWRybV9kcF9k
cGNkX3JlYWQoJmludGVsX2RwLT5hdXgsIERQX1BTUl9TVVBQT1JULCBpbnRlbF9kcC0NCj4gPnBz
cl9kcGNkLA0KPiAtCQkJIHNpemVvZihpbnRlbF9kcC0+cHNyX2RwY2QpKTsNCj4gLQ0KPiAtCWlm
ICghaW50ZWxfZHAtPnBzcl9kcGNkWzBdKQ0KPiAtCQlyZXR1cm47DQo+IC0JZHJtX2RiZ19rbXMo
JmRldl9wcml2LT5kcm0sICJlRFAgcGFuZWwgc3VwcG9ydHMgUFNSIHZlcnNpb24NCj4gJXhcbiIs
DQo+ICsJZHJtX2RiZ19rbXMoJmk5MTUtPmRybSwgImVEUCBwYW5lbCBzdXBwb3J0cyBQU1IgdmVy
c2lvbiAleFxuIiwNCj4gIAkJICAgIGludGVsX2RwLT5wc3JfZHBjZFswXSk7DQo+IA0KPiAgCWlm
IChkcm1fZHBfaGFzX3F1aXJrKCZpbnRlbF9kcC0+ZGVzYywgRFBfRFBDRF9RVUlSS19OT19QU1Ip
KSB7DQo+IC0JCWRybV9kYmdfa21zKCZkZXZfcHJpdi0+ZHJtLA0KPiArCQlkcm1fZGJnX2ttcygm
aTkxNS0+ZHJtLA0KPiAgCQkJICAgICJQU1Igc3VwcG9ydCBub3QgY3VycmVudGx5IGF2YWlsYWJs
ZSBmb3IgdGhpcw0KPiBwYW5lbFxuIik7DQo+ICAJCXJldHVybjsNCj4gIAl9DQo+IA0KPiAgCWlm
ICghKGludGVsX2RwLT5lZHBfZHBjZFsxXSAmIERQX0VEUF9TRVRfUE9XRVJfQ0FQKSkgew0KPiAt
CQlkcm1fZGJnX2ttcygmZGV2X3ByaXYtPmRybSwNCj4gKwkJZHJtX2RiZ19rbXMoJmk5MTUtPmRy
bSwNCj4gIAkJCSAgICAiUGFuZWwgbGFja3MgcG93ZXIgc3RhdGUgY29udHJvbCwgUFNSIGNhbm5v
dCBiZQ0KPiBlbmFibGVkXG4iKTsNCj4gIAkJcmV0dXJuOw0KPiAgCX0NCj4gQEAgLTUwMyw4ICs0
OTgsOCBAQCB2b2lkIGludGVsX3Bzcl9pbml0X2RwY2Qoc3RydWN0IGludGVsX2RwICppbnRlbF9k
cCkNCj4gIAlpbnRlbF9kcC0+cHNyLnNpbmtfc3luY19sYXRlbmN5ID0NCj4gIAkJaW50ZWxfZHBf
Z2V0X3Npbmtfc3luY19sYXRlbmN5KGludGVsX2RwKTsNCj4gDQo+IC0JaWYgKERJU1BMQVlfVkVS
KGRldl9wcml2KSA+PSA5ICYmDQo+IC0JICAgIChpbnRlbF9kcC0+cHNyX2RwY2RbMF0gPT0NCj4g
RFBfUFNSMl9XSVRIX1lfQ09PUkRfSVNfU1VQUE9SVEVEKSkgew0KPiArCWlmIChESVNQTEFZX1ZF
UihpOTE1KSA+PSA5ICYmDQo+ICsJICAgIGludGVsX2RwLT5wc3JfZHBjZFswXSA9PSBEUF9QU1Iy
X1dJVEhfWV9DT09SRF9JU19TVVBQT1JURUQpDQo+IHsNCj4gIAkJYm9vbCB5X3JlcSA9IGludGVs
X2RwLT5wc3JfZHBjZFsxXSAmDQo+ICAJCQkgICAgIERQX1BTUjJfU1VfWV9DT09SRElOQVRFX1JF
UVVJUkVEOw0KPiAgCQlib29sIGFscG0gPSBpbnRlbF9kcF9nZXRfYWxwbV9zdGF0dXMoaW50ZWxf
ZHApOw0KPiBAQCAtNTIxLDE0ICs1MTYsMjQgQEAgdm9pZCBpbnRlbF9wc3JfaW5pdF9kcGNkKHN0
cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApDQo+ICAJCSAqIEdUQyBmaXJzdC4NCj4gIAkJICovDQo+
ICAJCWludGVsX2RwLT5wc3Iuc2lua19wc3IyX3N1cHBvcnQgPSB5X3JlcSAmJiBhbHBtOw0KPiAt
CQlkcm1fZGJnX2ttcygmZGV2X3ByaXYtPmRybSwgIlBTUjIgJXNzdXBwb3J0ZWRcbiIsDQo+ICsJ
CWRybV9kYmdfa21zKCZpOTE1LT5kcm0sICJQU1IyICVzc3VwcG9ydGVkXG4iLA0KPiAgCQkJICAg
IGludGVsX2RwLT5wc3Iuc2lua19wc3IyX3N1cHBvcnQgPyAiIiA6ICJub3QgIik7DQo+ICsJfQ0K
PiArfQ0KPiANCj4gLQkJaWYgKGludGVsX2RwLT5wc3Iuc2lua19wc3IyX3N1cHBvcnQpIHsNCj4g
LQkJCWludGVsX2RwLT5wc3IuY29sb3JpbWV0cnlfc3VwcG9ydCA9DQo+IC0JCQkJaW50ZWxfZHBf
Z2V0X2NvbG9yaW1ldHJ5X3N0YXR1cyhpbnRlbF9kcCk7DQo+IC0JCQlpbnRlbF9kcF9nZXRfc3Vf
Z3JhbnVsYXJpdHkoaW50ZWxfZHApOw0KPiAtCQl9DQo+ICt2b2lkIGludGVsX3Bzcl9pbml0X2Rw
Y2Qoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkgew0KPiArCWRybV9kcF9kcGNkX3JlYWQoJmlu
dGVsX2RwLT5hdXgsIERQX1BTUl9TVVBQT1JULCBpbnRlbF9kcC0NCj4gPnBzcl9kcGNkLA0KPiAr
CQkJIHNpemVvZihpbnRlbF9kcC0+cHNyX2RwY2QpKTsNCj4gKw0KPiArCWlmIChpbnRlbF9kcC0+
cHNyX2RwY2RbMF0pDQo+ICsJCV9wc3JfaW5pdF9kcGNkKGludGVsX2RwKTsNCj4gKwkvKiBUT0RP
OiBBZGQgUFIgY2FzZSBoZXJlICovDQo+ICsNCj4gKwlpZiAoaW50ZWxfZHAtPnBzci5zaW5rX3Bz
cjJfc3VwcG9ydCkgew0KPiArCQlpbnRlbF9kcC0+cHNyLmNvbG9yaW1ldHJ5X3N1cHBvcnQgPQ0K
PiArCQkJaW50ZWxfZHBfZ2V0X2NvbG9yaW1ldHJ5X3N0YXR1cyhpbnRlbF9kcCk7DQo+ICsJCWlu
dGVsX2RwX2dldF9zdV9ncmFudWxhcml0eShpbnRlbF9kcCk7DQo+ICAJfQ0KPiAgfQ0KPiANCj4g
LS0NCj4gMi4yOS4wDQoNCg==
