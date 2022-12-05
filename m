Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCFE643611
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 21:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CBD10E2A5;
	Mon,  5 Dec 2022 20:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04F810E29C;
 Mon,  5 Dec 2022 20:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670273479; x=1701809479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=C5WmcG+aJ/jx72ZXbHuqW44UCr+fga+99+7h6g8HYVo=;
 b=Xva5MDwetg72VpLCMEQrd333KROXokYMWbisyMW2WnFuQfcvly4rFkz8
 kSLDqxgfOg7GAXRWEk4wSvCa0AjAGhBynB54TUXO3fCQSHap6nA5g9wba
 wq2pk/Yv+XIm+rmKBTxhLhgACwYGlFU7r9BH/fAO1aM5F3wTWQISYhFLL
 mPq8Eh+CfvS3HvSC6hCrkaevy+y7vfA8BYRHeBr3MOM4J11UD2lZtg6Il
 HI+hJVzYouyBUBIIY3WfDUXbUHBP0s9BfmG2vcgfbG3pFiRom8Q5xTJAU
 4VTpaesSorhqBSo3usNSLXTPVBrHSfd9aMVhDLvo2DTmBBPyYVPUNir8W g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="378623106"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="378623106"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 12:51:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="788224978"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="788224978"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2022 12:51:18 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 12:51:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 12:51:17 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 12:51:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAKyjaR3AWWkCCe8PzyEutWixp+9i6/KN+Ygz5ghrKFIP/zoxTkHpNaFmdLqFMi8RehXp1T/tBwkL2p/ac+Yqbf+FDf94Ycd8IMjShtPQECvgceOYLE+cjS+D1dwb3T3CkU10WSOVgDAzsc3x+gY3Luwp2z3gK2OkYFgUqSvmQJiqHdnPP3iAhFPzGZ3SnZ4PNN7f5P9Wu0xsQYTdoJ8NoZd3YXdLr9CF9LGn/aNBquyxjLy7jutEvQrYTGE21i8SD1ZW7WPVZTaDWUaKYE3dszKc4llVXs7z/vtSQTlEd905J7ygPGehgz80WCYFDyLyeIlYgHUdhRIFtks4obBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5WmcG+aJ/jx72ZXbHuqW44UCr+fga+99+7h6g8HYVo=;
 b=bUveFJRYgKIBIwlAqyANkSkaCjUT8fBV/Ss3mUXfDc4tUgZw+YRFt4nVwvhXKpxy5rXVhHEUeJUSgk+FO12ytWLE7ZR3Y2QmB0TiO5XZ874r0WNM4sRQyHwxoJAsXTk9em05NQw7Fxb2PQQoV5NoPD/apbU5RlKiUaokhm0Pa47v/l7Ta6VS77GZBugXmXPt5W7H2mfjNF4jH06WOCfRD67R4PDK+/JNpBV5LEcsVtYgMYHLRjyOyNLiquOIVgM4Ebils55ktZgnmTlOaYFO1vKvC4pXA3QStfzoJd+aigTdeHpeQ35itKOtvJM3qVsygkMibw2QFFxD6mAMVgRsxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB7120.namprd11.prod.outlook.com (2603:10b6:510:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 20:51:16 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 20:51:16 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v8 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Thread-Topic: [PATCH v8 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Thread-Index: AQHZBqVvCNxykvRMx0GwcV7wAR5h3K5fuROAgAARDQA=
Date: Mon, 5 Dec 2022 20:51:16 +0000
Message-ID: <a349fa6e605ac633b978ced5e66fd9495326329c.camel@intel.com>
References: <20221202232821.4144884-1-alan.previn.teres.alexis@intel.com>
 <9f03dd59-07d9-a7f1-d59e-8c57cc0f64d6@intel.com>
In-Reply-To: <9f03dd59-07d9-a7f1-d59e-8c57cc0f64d6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB7120:EE_
x-ms-office365-filtering-correlation-id: feacad35-d46b-43b5-2cba-08dad702741b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8ybW7PFbfR2lyzk99nBUbpgKBIg+eUhtQczULVk6NMpFFn1sIK67y6BNlFJ0m9FbIjX5fz96vn7Y1+RQ3FKNdshHLND/j4EMDFfjbdCE4eiVcLjXQbmr+VeJezdo4EKcBcPxQWsM3deJSNPL24bIBazDfajohpWiVoyE2O3d4DK8yDyZ1y3wOhUkcS6f64vJJbHhHNO/us6sOcag01W8z/y74e/OIvMxD/Tnfodje8kTwEQI4wAPsakRrntTV/x8vrxvaUcOdAjel8YybBs051hZF2nXtBbvkdfHFHJXwjnzkZ/KaFOsNEAUKjbYy6GnQ0iQhDfGrorB/1bA/k5tX9IvHARRCmj9d5uOJiTUof98teIQW2kGGJrwtHfS7xQmvAPMo0NNpMnUQ6iCNcJd2Plqf8UShe45YeWXNTjsk87cgrRKM+K6ju9nn8DwbehdZVGavHI9CLsZpKuLAS2Q+T6BXfDQBYui2OQact6BI8WSTL6qPtnkdLTXyYhlRemJHQoM15ugS8icYYmJvgl/JVJxBQZNJh/S/6YbEsLUOKK179h+nFVnt6F1REcXXGPDsqchQaaBI0O2u+lZfrmkB013quWJEBqMNDcnH6ppUNkUx3cb+lAayK4266nHKQUHCIMtsy3RBQ0B2OZWH0/EwjU+bgKmf22qotfKRnehL3RPccUMUPx4htR9epvdgpsMTA8pCyP3uNR/WXsWBvX6qw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(83380400001)(5660300002)(41300700001)(2906002)(186003)(8936002)(86362001)(38100700002)(36756003)(122000001)(38070700005)(82960400001)(6506007)(2616005)(316002)(6512007)(6486002)(26005)(478600001)(110136005)(54906003)(8676002)(64756008)(66446008)(4326008)(66476007)(66556008)(91956017)(76116006)(71200400001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djZONkVpNWlrMjE4eitrN0d2Ym1aZ0lsMVovaW5XSW1IUUxCdS9Xb2Jiclor?=
 =?utf-8?B?L1FYN0E4Y05MNHZQQWZ3cVRXaERER3dqTmNGMHRVQVNkbE5SQ1hIcm41VkE3?=
 =?utf-8?B?UUlSUzduejRXdHVqYmRjZmFXcEIzbGlQdWNCWU16ZWVFY0V5YTRabTV3SytK?=
 =?utf-8?B?WnZMbTJLK1MzbmVna2E5SGg0WlRDOTV0WGcvcm9GVEM0Yjk3dDh3Wndqd2Vx?=
 =?utf-8?B?U0RldEJVTllmcStZNDQvSHBmV1k5aUtQMS81N2lST25uL29SWStGcDRrOXBV?=
 =?utf-8?B?TGZRUzg3T1NwT1dtQWtKdndwTy9VOXMrTUtHbnNxWnM5bEsxRGNGeXNjYnNM?=
 =?utf-8?B?cFM0Nk1jekhoamQyUVBWd2U3K3pKbERiRzhGWFBTeVoyR05NQkE2WXJEMWU5?=
 =?utf-8?B?Q04rVm9CMHpFYW0zVHU4K2ZzTVFZa0R6SGgrUllpTXRHSUZGV3kzdlR3Z3VO?=
 =?utf-8?B?SUgrSEszVmJaZVA3aUtHYmJhajd6MjNtcXppbXlNSzVhU3pGUVlzcjAwalVk?=
 =?utf-8?B?WDk0a1NHSDY5VTJ0S2hRdnkwSUNucytCNkRKWjl2RlA2VUJwTlRXVWFmTkp0?=
 =?utf-8?B?Q3VSd3dCdDN6ZU1ZeG1HanNpV3h3THhqUnY1eE12TVNxcDFFRkVBampZdWYy?=
 =?utf-8?B?cXdOeHVyb1plTy9EWHhwNFJWczBJWjV3RWl3VXJFRU8zb2ZsUUxYbVJsTmRk?=
 =?utf-8?B?eUg2VUg0UXBPcjhBTE1wd010dW8vWVZGV0VESDNFd1ovbUpQY3ZDbFA1cWlo?=
 =?utf-8?B?SmxVeU5XRFFNdUJJdjlvVHQ4cFRIUzJLd0U0M1kybE01aVlmeE40YTRFSC9S?=
 =?utf-8?B?dGRIRzh5bkd3empZV0RCRGErRzBzQU8wQmVHN3dGRlFMVW9WanVPN1hpWUdj?=
 =?utf-8?B?eGM4dWJ2c2hvL3d3UGU5YmNzQjhnOEg2WkI2RFB3bFJoMEwxSVpNSWZjMmRF?=
 =?utf-8?B?SnNEV1h0VzhKUXVkR2hJVm5vV1RaRWxwZ0hzQldlWmhiSGZuam9xL1Q1NXN5?=
 =?utf-8?B?TEJ5aG4zbEFzR0xCdXZqR2REU0Roa0V3eExvODQ2U3RXUndHMjFscG05bW84?=
 =?utf-8?B?Y3U4U04veS91VnVncFJTWkZEZWdzOWJMOE1yQ2ErVWZrYm9rSmwvbE5QdHZF?=
 =?utf-8?B?a0FKQWphT3pITUR6UmplZ3hMZ21RMWxhUUVCMnBrWXhsekRIT3I2T3k5UU1x?=
 =?utf-8?B?ZzlqYitCSWJ4QzR0eWk5QzFVU2hCWWJGUGdHOGhvMTY1cGFYM3VCTXZhek83?=
 =?utf-8?B?VjBESlZvVk1CelljRnZ5Qmd1THBMZFhoTVNCMkxYaTBDc1RnWUcwajhyUTdV?=
 =?utf-8?B?TnlqZjBQck5DaUtGMDY4WGNYV05VcUs0cFp5WFRGTjFuN0xLY1dNL2FTUk9Z?=
 =?utf-8?B?eUxsNCtQUjRDc0JFTHdPQVZIb2h5UG9tMnVTZnVBaGlwcjFsTlZ1ekNkdGJa?=
 =?utf-8?B?cVFxM3pNZUNaZWhFL3Z3UGkyaXpocFphZnNXVjhmY2xGRHpYNEJJTzJiSEtU?=
 =?utf-8?B?OWVFeTgyNWxhN2tURGVUK3hCVks3aUdGaXdWbi9UbzZMQmVoeURBRzBhdGZE?=
 =?utf-8?B?V0U2Z3kwMFB5Tk05VmlLenJZTWhVM1Fia3N4aTI3eWtzU1RlcExtK3M5blBZ?=
 =?utf-8?B?S01pVmFtdzdmNlRZYlNNQ0hBbERIdjVtaXQvQjFUVWM4M1hDUXJuRlJpU2c1?=
 =?utf-8?B?OWRMSGRVdXZ6OHA3bnI4M2hETVo2bUJaaTBwcTUrOTczSDlCQ0V2bi8xWHZk?=
 =?utf-8?B?Mm56d2NOSDUrOS9GMWZZb1kyZkkzMXhVd2hNajV2aTJlU0czRnlNdVNtSng3?=
 =?utf-8?B?SHZQMnU2MFJPcEVBdTJQL1psUDI2cHROOGFlUkFaWkEvTU0xRW5IVlFzeVRh?=
 =?utf-8?B?eTd3NmFJSnpyN0ZGM09zbHhzZlJEcTUvZ2NySnFDdnZ0M0Z3ODVqNEoxY1lr?=
 =?utf-8?B?UEdkVHZkM1EyY01nM0pPemhFWlhmQ3dqRXlpOXdOa2NGMEcyRWVBcSt5aHZy?=
 =?utf-8?B?Z1JLM05KSCtzZ2FoWStOSFAweFFXMm43QjJuR1lLaXozUjBoeVJDNS9TeGpy?=
 =?utf-8?B?K0p6NjVRUElTNWJCdWlDK3diR0EzZmp6b3hVR2hhcVVGOTJqOXhWUkxHWTdn?=
 =?utf-8?B?NHdwTGNsYnZkL3F0YjFJMTlXYStoYjdzQjh0dm1SR1g5VFd2NUUrWUJtTUFO?=
 =?utf-8?Q?FMBDheH1fE2DGLiSATn9/iQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FA66BA291BB6A49A3730BC077638B2A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feacad35-d46b-43b5-2cba-08dad702741b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 20:51:16.4034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEljIk3Wsw4DOkScvAFE4ozqPEWmjWQuOw+8LIQ7pkSK8mqNRJDNrHOeyM4sL/KY5iwlTp5j8rVKcTHley0LFkvgwshtAD4VC4zW43zNxjBrakW1qYbfzYdM0R3yjHgS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7120
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIE1vbiwgMjAyMi0xMi0wNSBhdCAxMTo1MyAtMDgwMCwgQ2VyYW9sbyBTcHVyaW8sIERh
bmllbGUgd3JvdGU6DQo+IA0KQWxhbjpbc25pcF0NCj4gPiAgIA0KPiA+ICAgCWV4dF9kYXRhLT5m
bGFncyB8PSBJOTE1X0JPX1BST1RFQ1RFRDsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMNCj4gPiBpbmRleCAyOWU5ZThkNWI2ZmUuLmVkNzRk
MTczYTA5MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fZXhlY2J1ZmZlci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX2V4ZWNidWZmZXIuYw0KPiA+IEBAIC04NjksNyArODY5LDcgQEAgc3RhdGljIHN0cnVjdCBp
OTE1X3ZtYSAqZWJfbG9va3VwX3ZtYShzdHJ1Y3QgaTkxNV9leGVjYnVmZmVyICplYiwgdTMyIGhh
bmRsZSkNCj4gPiAgIAkJICovDQo+ID4gICAJCWlmIChpOTE1X2dlbV9jb250ZXh0X3VzZXNfcHJv
dGVjdGVkX2NvbnRlbnQoZWItPmdlbV9jb250ZXh0KSAmJg0KPiA+ICAgCQkgICAgaTkxNV9nZW1f
b2JqZWN0X2lzX3Byb3RlY3RlZChvYmopKSB7DQo+ID4gLQkJCWVyciA9IGludGVsX3B4cF9rZXlf
Y2hlY2soJnZtLT5ndC0+cHhwLCBvYmosIHRydWUpOw0KPiA+ICsJCQllcnIgPSBpbnRlbF9weHBf
a2V5X2NoZWNrKHZtLT5ndC0+aTkxNS0+cHhwLCBvYmosIHRydWUpOw0KPiANCj4gbml0OiBlYi0+
aTkxNS0+cHhwIGlzIG9uZSBsZXNzIHBvaW50ZXIganVtcA0KPiANCkFsYW46IG9rYXkNCkFsYW46
W3NuaXBdDQo+IA0KDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX2d0X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVn
ZnMuYw0KPiA+IGluZGV4IGRkNTM2NDFmMzYzNy4uNzg3NmY0YzNkMGYxIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0KPiA+IEBAIC05OSw3
ICs5OSw2IEBAIHZvaWQgaW50ZWxfZ3RfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgaW50ZWxfZ3Qg
Kmd0KQ0KPiA+ICAgCWludGVsX3NzZXVfZGVidWdmc19yZWdpc3RlcihndCwgcm9vdCk7DQo+ID4g
ICANCj4gPiAgIAlpbnRlbF91Y19kZWJ1Z2ZzX3JlZ2lzdGVyKCZndC0+dWMsIHJvb3QpOw0KPiA+
IC0JaW50ZWxfcHhwX2RlYnVnZnNfcmVnaXN0ZXIoJmd0LT5weHAsIHJvb3QpOw0KPiANCj4gTml0
OiB0aGUgcHhwIGhlYWRlciBpbmNsdXNpb24gY2FuIG5vdyBiZSByZW1vdmVkIGZyb20gdGhpcyBm
aWxlLg0KPiANCkFsYW46IG9rYXkgLSB3aWxsIGZpeC4NCkFsYW46W3NuaXBdDQoNCj4gDQo+ID4g
Kw0KPiA+ICtib29sIGludGVsX3B4cF9pc19zdXBwb3J0ZWQoY29uc3Qgc3RydWN0IGludGVsX3B4
cCAqcHhwKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gKElTX0VOQUJMRUQoQ09ORklHX0RSTV9JOTE1
X1BYUCkgJiYgcHhwLT5jdHJsX2d0ICYmDQo+ID4gKwkJSU5URUxfSU5GTyhweHAtPmN0cmxfZ3Qt
Pmk5MTUpLT5oYXNfcHhwICYmIFZEQk9YX01BU0socHhwLT5jdHJsX2d0KSk7DQo+ID4gICB9DQo+
ID4gICANCj4gPiAgIGJvb2wgaW50ZWxfcHhwX2lzX2VuYWJsZWQoY29uc3Qgc3RydWN0IGludGVs
X3B4cCAqcHhwKQ0KPiA+IEBAIC0xMzAsNyArMTQyLDcgQEAgc3RhdGljIHZvaWQgcHhwX2luaXRf
ZnVsbChzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ID4gICAJaWYgKHJldCkNCj4gPiAgIAkJZ290
byBvdXRfY29udGV4dDsNCj4gPiAgIA0KPiA+IC0JZHJtX2luZm8oJmd0LT5pOTE1LT5kcm0sICJQ
cm90ZWN0ZWQgWGUgUGF0aCAoUFhQKSBwcm90ZWN0ZWQgY29udGVudCBzdXBwb3J0IGluaXRpYWxp
emVkXG4iKTsNCj4gPiArCWRybV9pbmZvKCZndC0+aTkxNS0+ZHJtLCAiUHJvdGVjdGVkIFhlIFBh
dGggdjdCIChQWFApIHByb3RlY3RlZCBjb250ZW50IHN1cHBvcnQgaW5pdGlhbGl6ZWRcbiIpOw0K
PiANCj4gVGhpcyBsb29rcyBsaWtlIGEgbGVmdG92ZXIgZGVidWcgYWRkaXRpb24NCj4gDQpBbGFu
OiBvb29wcyAtIHllYWggdGhpcyB3YXMgbm90IHN1cHBvc2VkIHRvIGJlIHBhcnQgb2YgdGhlIGNo
YW5nZSAtIG15IG1pc3Rha2UuDQpBbGFuOltzbmlwXQ0KDQo+ID4gLXZvaWQgaW50ZWxfcHhwX2lu
aXQoc3RydWN0IGludGVsX3B4cCAqcHhwKQ0KPiA+ICtzdGF0aWMgc3RydWN0IGludGVsX2d0ICpw
eHBfZ2V0X2N0cmxfZ3Qoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpDQo+ID4gICB7DQo+
ID4gLQlzdHJ1Y3QgaW50ZWxfZ3QgKmd0ID0gcHhwX3RvX2d0KHB4cCk7DQo+ID4gKwlzdHJ1Y3Qg
aW50ZWxfZ3QgKmd0ID0gTlVMTDsNCj4gPiArCWludCBpID0gMDsNCj4gPiArDQo+ID4gKwlmb3Jf
ZWFjaF9ndChndCwgaTkxNSwgaSkgew0KPiA+ICsJCS8qIFRoZXJlIGNhbiBiZSBvbmx5IG9uZSBH
VCB0aGF0IHN1cHBvcnRzIFBYUCAqLw0KPiA+ICsJCWlmIChIQVNfRU5HSU5FKGd0LCBHU0MwKSkN
Cj4gPiArCQkJcmV0dXJuIGd0Ow0KPiA+ICsJfQ0KPiANCj4gTm90ZSB0aGF0IHRoZSBHU0MgZW5n
aW5lIHdpbGwgYmUgZGlzYWJsZWQgaWYgdGhlIEdTQyBGVyBpcyBub3QgDQo+IGF2YWlsYWJsZSwg
c28gaW4gdGhhdCBjYXNlIGZhbGxpbmcgYmFjayB0byB0aGUgcm9vdCBHVCB3aWxsIGJlIGFuIGVy
cm9yLiANCj4gTWF5YmUganVzdCBjaGFuZ2UgdGhlIGJlbG93IGNoZWNrIHRvIGJlOg0KPiANCj4g
LyoNCj4gIMKgKiBUaGUgR1NDIGVuZ2luZSBjYW4gYmUgdHVybmVkIG9mZiwgYnV0IG9uIHBsYXRm
b3JtIHRoYXQNCj4gIMKgKiBjYW4gaGF2ZSBpdCB3ZSBkb24ndCB3YW50IHRvIGZhbGwgYmFjayB0
byByb290IEdULg0KPiAgwqAqIE9uIG9sZGVyIHBsYXRmb3JtcyB3ZSByZWx5IGluc3RlYWQgb24g
dGhlIG1laSBQWFAgbW9kdWxlLg0KPiAgwqAqLw0KPiBpZiAoSVNfRU5BQkxFRChDT05GSUdfSU5U
RUxfTUVJX1BYUCkgJiYgITkxNS0+bWVkaWFfZ3QpDQo+IA0KQWxhbjogb2theSAtIG1ha2VzIHNl
bnNlLiB3aWxsIGRvLg0KQWxhbjpbc25pcF0NCg0KPiANCj4gPiAgIA0KPiA+ICAgCS8qIHdlIHJl
bHkgb24gdGhlIG1laSBQWFAgbW9kdWxlICovDQo+ID4gLQlpZiAoIUlTX0VOQUJMRUQoQ09ORklH
X0lOVEVMX01FSV9QWFApKQ0KPiA+IC0JCXJldHVybjsNCj4gPiArCWlmIChJU19FTkFCTEVEKENP
TkZJR19JTlRFTF9NRUlfUFhQKSkNCj4gPiArCQlyZXR1cm4gJmk5MTUtPmd0MDsNCj4gPiArDQo+
ID4gKwlyZXR1cm4gTlVMTDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAraW50IGludGVsX3B4cF9pbml0
KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQ0KPiA+ICt7DQo+ID4gKwlpOTE1LT5weHAg
PSBremFsbG9jKHNpemVvZigqaTkxNS0+cHhwKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIWk5
MTUtPnB4cCkNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gDQo+IEEgZmFpbHVyZSBpbiBpbnRl
bF9weHBfaW5pdCBpcyBub24tZmF0YWwsIHNvIHdlIGNhbiBleGl0IGhlcmUgd2l0aG91dCANCj4g
YWxsb2NhdGluZyBpOTE1LT5weHAgYW5kIHN0aWxsIGNvbXBsZXRlIGRyaXZlciBsb2FkIChhbHRo
b3VnaCBpdCdzIHZlcnkgDQo+IHVubGlrZWx5KS4gVGhpcyBtZWFucyB0aGF0IGZ1bmN0aW9ucyB0
aGF0IGNhbiBiZSBjYWxsZWQgZnJvbSBvdXRzaWRlIHRoZSANCj4gUFhQIHN1YnN5c3RlbSBuZWVk
IHRvIGNoZWNrIGlmIHRoZSBweHAgc3RydWN0dXJlIGlzIGFsbG9jYXRlZC4NCj4gDQoNCkFsYW46
IE9rYXkgLSB0aGlzIGlzIGEgZ29vZCBjYXRjaCAtIGJ1dCBpbiB0aGF0IGNhc2Ugb2Yga2VybmVs
IG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUsIHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gZmFpbA0K
dGhlIGRyaXZlciBsb2FkIGluc3RlYWQ/IChjb25zaWRlcmluZyBpdHMgb2J2aW91c2x5IGEgbW9y
ZSBzZXJpb3VzIHN5c3RlbSB3aWRlIGlzc3VlPykuDQoNCj4gPiArDQo+ID4gKwlpOTE1LT5weHAt
PmN0cmxfZ3QgPSBweHBfZ2V0X2N0cmxfZ3QoaTkxNSk7DQo+ID4gKwlpZiAoIWk5MTUtPnB4cC0+
Y3RybF9ndCkNCj4gPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gDQo+IEkgd291bGQgZG8gYSBrZnJl
ZSBoZXJlLCBzbyB0aGUgb25seSBwb2ludGVyIHRoYXQgbmVlZHMgdG8gYmUgY2hlY2tlZCBpcyAN
Cj4gaTkxNS0+cHhwIChpLmUuLCBndWFyYW50ZWUgdGhhdCBpZiBpOTE1LT5weHAgaXMgdmFsaWQg
dGhlbiANCj4gaTkxNS0+cHhwLT5jdHJsX2d0IGlzIGFsc28gdmFsaWQpLCBvdGhlcndpc2UgcHhw
X3RvX2d0IGNvdWxkIHJldHVybiBOVUxMIA0KPiB3aGVuIHBhc3NpbmcgaW4gYSB2YWxpZCBQWFAg
cG9pbnRlcjsgYWx0aG91Z2ggSSB0aGluayB0aGF0IGFsbCB0aGUgY2FsbHMgDQo+IHRvIHB4cF90
b19ndCBhcmUgZ3VhcmRlZCB2aWEgYSBweHBfaXNfZW5hYmxlZC9zdXBwb3J0ZWQgY2hlY2ssIGl0
J3Mgbm90IA0KPiBpbnR1aXRpdmUgZm9yIHRoYXQgZnVuY3Rpb24gdG8gcmV0dXJuIE5VTEwgKGFs
bCBvdGhlciBjYWxsZXJzIG9mIHRoYXQgDQo+IHR5cGUgdGhhdCB3ZSBoYXZlIGRvIGFsd2F5cyBy
ZXR1cm4gYSB2YWxpZCBwb2ludGVyKS4NCj4gDQpBbGFuOiBva2F5IHN1cmUgLSBJIGd1ZXNzIHRo
aXMgd291bGQgYWxzbyBhbGlnbiB3ZWxsIHdpdGggYSBmdXR1cmUgd2hlcmUgbW9yZSBhbmQgbW9y
ZSBzdWJzeXN0ZW0gc3RydWN0dXJlcyBhcmUNCmFsbG9jYXRlZCAoYXMgd2UgdHJ5IHRvIHJlZHVj
ZSBpOTE1IGJ1aWxkIHRpbWVzIGJ5IGNvbnRyb2xsaW5nIHRoZSBoZWFkZXItaW5jbHVkZS1oaWVy
YXJjaHkpIGFuZCB0aGVyZWZvcmUgYSBudWxsDQpzdWJzeXN0ZW0gc3RydWN0dXJlcyB3b3VsZCBt
ZWFuIHRoZXkgYXJlIG5vdCBlbmFibGVkLW9yLXN1cHBvcnRlZC4NCkFsYW46W3NuaXBdDQoNCj4g
PiArdm9pZCBpbnRlbF9weHBfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgaW50ZWxfcHhwICpweHAp
DQo+ID4gICB7DQo+ID4gLQlzdGF0aWMgY29uc3Qgc3RydWN0IGludGVsX2d0X2RlYnVnZnNfZmls
ZSBmaWxlc1tdID0gew0KPiA+IC0JCXsgImluZm8iLCAmcHhwX2luZm9fZm9wcywgTlVMTCB9LA0K
PiA+IC0JCXsgInRlcm1pbmF0ZV9zdGF0ZSIsICZweHBfdGVybWluYXRlX2ZvcHMsIE5VTEwgfSwN
Cj4gPiAtCX07DQo+ID4gLQlzdHJ1Y3QgZGVudHJ5ICpyb290Ow0KPiA+ICsJc3RydWN0IGRybV9t
aW5vciAqbWlub3I7DQo+ID4gKwlzdHJ1Y3QgZGVudHJ5ICpweHByb290Ow0KPiA+ICAgDQo+ID4g
LQlpZiAoIWd0X3Jvb3QpDQo+ID4gKwlpZiAoIWludGVsX3B4cF9pc19zdXBwb3J0ZWQocHhwKSkN
Cj4gPiAgIAkJcmV0dXJuOw0KPiA+ICAgDQo+ID4gLQlpZiAoIUhBU19QWFAoKHB4cF90b19ndChw
eHApLT5pOTE1KSkpDQo+ID4gKwltaW5vciA9IHB4cC0+Y3RybF9ndC0+aTkxNS0+ZHJtLnByaW1h
cnk7DQo+ID4gKwlweHByb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJweHAiLCBtaW5vci0+ZGVi
dWdmc19yb290KTsNCj4gDQo+IGNhbiBtaW5vci0+ZGVidWdmc19yb290IGJlIE5VTEwgPyBpbiBn
dF9kZWJ1Z2ZzX3JlZ2lzdGVyIHdlIGNoZWNrIGZvciB0aGF0Lg0KPiANCkFsYW46IEknbSBub3Qg
c3VyZSBidXQgSSdsbCBhZGQgdGhhdCBjaGVjayBmb3IgY29uc2lzdGVuY3kuDQoNCg0KDQo=
