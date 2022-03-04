Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A090C4CD1C1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 10:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A329810E851;
	Fri,  4 Mar 2022 09:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ECD10E81F;
 Fri,  4 Mar 2022 09:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646387801; x=1677923801;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=03WYUczy4ROtaX4aBkPytgRyrVWvvt9Xn43hRY8Ciyc=;
 b=irLJWMaP212jBVV6Z4SYPk1Umj63HtRo23H3UorpafNHf5dxzsqYGZQS
 xE0Ot71UR3lpc7zQUJGK/tWbhmD0tzigMus3zFEJ9ZegQOkI/fLxVt4Jq
 wRGLhpgwvOKlm4PvYlGuOifycwQeuhE6Fgavg4H2pupnJ1vWom7L/88tB
 1yocQQlWQR1lBeAZVPOjF+NM5VTe/iwHH/kCsFVISX3/VGtvpAI/VPqAQ
 ITDUEHsJkDXMvfinHukUH3d3ECknlpqyJmVOTfw6k58F9wbrZe0ScN4Ne
 Rrj5TzAee6m7qgOzj2Su3CunWxIdcYxmVHXxOx9fWKxBPH1Y+OfqarI9z w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233902277"
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="233902277"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 01:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="508937947"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 04 Mar 2022 01:56:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 01:56:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 01:56:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 01:56:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LswZ4r09+msUvbwJvGLthwsRW6mM8Dr6qFW2ohIXruXhCKRn2HuXobgX3L/EOOvOLQLQ5EuynJwDN066riio0tuTH8fSpCoLhJ4Xv1aoUtIzsTRdMfq5doYMI4ez2IDFtpQZfFQyjaTG21/XoOl2nWfqAqu9UDa+u8qeMpUtioKYMaL6Df7mxtPiD3IYzGD+TixvOCo82m8ivf7mLtbNn1ijJ7cCmQYVxcrbSb7WazlVsD0cEbtcxUjQW2D1/xA/5Ya1o0DiHACS7PhbCQXQLAvJT6Bb9Ck11hO1ywWX/HAB53omZfsDNJaj0JkGHi6+sb+BNndjyewmvSpWmHZ2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03WYUczy4ROtaX4aBkPytgRyrVWvvt9Xn43hRY8Ciyc=;
 b=jADUbuEOBI+IdSOMxeByZmshkwnA7SL7L3+CLexxQddZ27WZIxn2vc/PhGwVaQHPcCnRVoaLfUCshB6UtPLoLv0OnIiYn7Wx+mS62h+9bta5qbOUv8oAoK1vM5TLGxFYDsV2o7q1Was6a5bAW0/1tVau0MqzjcxIfmr/HlWuLmTgjORCn5UYC2awYO2ZoIvSu5JVzlgxKCgLeAeXdGN2IWAbW+okBgYUROWm/LgD/UTGTWzXz5E3c6yPDG/PQjlGerjyiLxdebaBAxRJUt5rvOAN1pK5Fre3NQmpN1crQ7zJDxiZbWfvnXAvwFmgGGLkrUVHEhPkY76OF6sCkE00gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by CY4PR1101MB2216.namprd11.prod.outlook.com (2603:10b6:910:25::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 09:56:37 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133%6]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 09:56:36 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Thread-Topic: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Thread-Index: AQHYGBFjkzht//tf006vXTl+IOhLcKyANJuAgAAJCYCAAAMWAIAAJNoAgCXncoCAAnYugIAARKuAgAAFXYCAABSgAIADdIKAgAABCACAAYHWAIABC+0g
Date: Fri, 4 Mar 2022 09:56:36 +0000
Message-ID: <MWHPR11MB174187335183FC24BE0F1EA5E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com> <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
 <87v8xxs2hz.fsf@intel.com>
 <CAF6AEGtdnWWhGp7U7nAPD4r3Uoe5BJKVm2rQ2MS=q5GqF6MYDA@mail.gmail.com>
 <YhyB0WmJDWVFO1se@pendragon.ideasonboard.com> <871qzn6vmc.fsf@intel.com>
 <Yhy/6+z7QshG+qOo@pendragon.ideasonboard.com>
 <YhzROBOwTUkZw3Ez@pendragon.ideasonboard.com>
 <4d8daabe-10d9-a3cf-d305-68414cffe4ed@quicinc.com>
 <Yh+4EOKA5FgrlZrF@pendragon.ideasonboard.com>
 <0cfd36a2-26e4-309d-d8e9-e3bf8a5d2417@quicinc.com>
In-Reply-To: <0cfd36a2-26e4-309d-d8e9-e3bf8a5d2417@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 694806df-83bf-4546-862d-08d9fdc545b5
x-ms-traffictypediagnostic: CY4PR1101MB2216:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR1101MB221662F7598F29B471FF1040E3059@CY4PR1101MB2216.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PSzqO1K21Y5Bj5R03RKFFv6l3bwC9SGoPvKo/qu5+iIPb1nEo8LL8jwwyoRfGig2mfEycQXK7PI5z6hgYbxQhpRNF7iQVMp+orJ/ooTM+Yh0edb1mSZSoRO2wkcap0O+0UF7vcd4x5gVoY73DxOXgGaHpXjJ6IeaFunIaRA7PIKw/a8MLal4U/edJ+TB2B0cS0cjnakebxNcTQvzKGN5ojEg8wuw/CLHwJsOMpQ/fkHXtiN8yy2AkL+WOnxZ5zJsB7OSyHOUck9Gp9djv6rEChRTnK6ytArtasBopu5H2XrXlKJrsZrBassjdcO0Y4y6/JfDSxUHH77v/0OuWIymHAEtQjcO9ajwMdqCW3sFlQVXou6aGR7n8VJbLaX07im9ybuxRuynRGkQ6J33Jc143JbVmGBC2Yi+GYcSHdubRTo/V9TPTLWIeWwuruz4h8Fwf12xj4M/7F3DEXFFoPlp9fMHixoakjfImMuSwWGcMsH9bKkSr/QwT/Jjw8IYT+B0MV8GBlQP3IMmTUjIjE0h7yW5D/O9ohGIp8md2iDh3iim2RcB9DoXVprgHIOqjrN/vB9nDLGAj5S2K8yIH/bd3qgrL/9i28BdNlS5GVYw8LZLrqMfJu27RJ1Yqm1M2p63vYh5UEL1mSw3BBSWIE/glIyYXPKoAA8xs5psHJnZ8+T27q6cMteOrPJNtgvylhhpM8F8QI7JToVAT4i3Rm1OGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(82960400001)(122000001)(38100700002)(52536014)(7696005)(6506007)(55016003)(9686003)(33656002)(186003)(2906002)(71200400001)(316002)(26005)(8936002)(54906003)(4326008)(8676002)(66446008)(66476007)(64756008)(508600001)(66556008)(66946007)(76116006)(38070700005)(110136005)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akJLd29ySDdPVFlHYWNDRDVGUGs1dElKRW51OGpXOEVCTis1Qk43YU1uOGVS?=
 =?utf-8?B?SksxNzdZSWRpRU1QdGtyRlY1U1krbFFtUHBjaDZtb1hRQkdOYXBCdFEzcGdL?=
 =?utf-8?B?MFNEWXR5czJyZ1g1dFR4ZCtRN3l6SnpQVXQ3SEdCNUtmTCs3Tk9IdE5taUhO?=
 =?utf-8?B?b2RPekpmeGh0Y2svNi9aMGRjZzI5SEQ5TTNmSitOT3NZaTUvbk43Y1FZVTRT?=
 =?utf-8?B?MU4rTjlFSGh5NHhMdm9xczFab2Z0Qys3d0ZPeHFlR2JzQ0lkckZJbFFoeE15?=
 =?utf-8?B?cXRQUDdNOHM2bGdacTJTN3BzdHI4Z3JZZnRxMDFDNTBIUTkxOVhmeGxDRWlY?=
 =?utf-8?B?Z2xqK0hzcFJoWExUbGRnNWxKY0ZUdS82Ty9yUytKRGxTR0cvUGxzNDlZUFdj?=
 =?utf-8?B?dVUyVW9uY0NDK2lxOXlNcUV3eVpLMjc0ZllRUnEzemptTVhSekRXU0MvUC90?=
 =?utf-8?B?bHJ0UU9KbDRBbEZGanZ4OTJCT0JFdlpGbzhjaVM5TmNQWnViWnBrZE9Kc3lQ?=
 =?utf-8?B?SWxDcWZDYm91amZ2ZzhXbkFrR1dkaUZZejF5M3NyTHZZbUhEN3E4MEhJZVBk?=
 =?utf-8?B?VndrY0Nrd2J5ZkZjTFNJY0lsQS9Zem80Umh3V2VMQTRxYjVYdUlHMlBGZFBO?=
 =?utf-8?B?NkpwRHBMckVGdnZDbDJITzd4TXRlMlZaMGZpVENqSFN4MlN2aml2S0dGZmpE?=
 =?utf-8?B?NitIMllZZE84N0tFb1dMR0tKeUJGZC9zS3Q1Y0c4dHdYUDBsbkozTlNSUVpO?=
 =?utf-8?B?SDFZRnNHYUxkdUhTUjArMEthcndCaERiVWQ2eUFxRXM2RkVtSy82MnVkZkEz?=
 =?utf-8?B?SlFEYlM5alh4K2poSUVGS1NpQWhCTEIxQ1FBbkVKQ0ZUMXMzS0pTSUZ6eCtI?=
 =?utf-8?B?Qllpamt2YnhveGpaR1Q5WUNlMG1JbWtlMWZTOWJjYU9tVDVoNXFYMGwyUUNY?=
 =?utf-8?B?TlpRWDhZTHZ3bVY3Ulg1VFVNRXNyZWtTb1ZFMFdEV0crZW9wNmhkWlpTTWNR?=
 =?utf-8?B?WTBrOWJQaDljekdqaWJBa0R1eEhsRGoxdndlY2xhRDN0UXJKZEpSczg3cEx3?=
 =?utf-8?B?bzNrc2VBNXhjUFQ1MDMySEZHajBmWVQyd2VXemp2cGt2OWordGQyWEUwR3Vs?=
 =?utf-8?B?WnY1N1d3eERhRnBWaXF1VW9ZcXY5b05OUDMvNndWYXprNGMweXk3Qzllc29Y?=
 =?utf-8?B?dzFqTlBKWEFnSml6OWIzM0ZSQ2FweUdNYlUrbG5JUmEwOUg2RDloc25McWJJ?=
 =?utf-8?B?dEZKc2tnUXVTQUZTeWtQTldQaHZ2TG82akYwZUNBZUVqUHA2SUhDVG1aYmNZ?=
 =?utf-8?B?cG1PbkFkdzBBbGVqOGJFU0JtUFFEWDIrSmRaN0JETEVvRmFUcHM1blNqUi9x?=
 =?utf-8?B?QmI5Ui83Z1F6Mk9Ld2NlM0dKMnR0U3hDK2E5dzVGQWhhRTJ5L2VISVViWUV1?=
 =?utf-8?B?dkc3T04yYmRub0FjRGVycTc5c24rUTVBd1JNTE5hdm5CSmRaUUpoS2VSZlZx?=
 =?utf-8?B?Y3pyUEhFTHJrbW8raUZ2bE9WWHFWODE2S1hTYzdYdnhRWXNhOFZPelBqQmt1?=
 =?utf-8?B?bm1mbjkyZmpBa0dWN243bFpxa0pFSitvYWp6SFNncENPZCtwbUlIZEF1VU54?=
 =?utf-8?B?NGRKN0g5Z1J4Mm14Sjl0eGYrZlMyR3RhcUF4Q3RHeVUzL1NTaE9Palo2MXVa?=
 =?utf-8?B?YTBNM3NHaE9KbTBiRGEwUHpQdDVEMkIwUlh1M3dnUVEwVXNLajU0RlpGMlk4?=
 =?utf-8?B?UEtxdzgrby80N3ZyNFpWZk9QelRwN1NGeTVPOW5KY09EVnBkUzJub045UStm?=
 =?utf-8?B?bUNOOUNQOUxxeTh5L0lFREdVSVBWTUhZYUVGV2EySXRjR2poTUtKUTBieHhS?=
 =?utf-8?B?TUNZNTBSZzFvaGlxVzRjSHRjRm5TRDhEeXliQWF2L2krUlFkZnZabWxnV2s3?=
 =?utf-8?B?WUVMK1V2aHJMeXQzY1J2SlU5MDB3YUJXbldVMHQxcWYzSFRDeEtyUUdaKzRa?=
 =?utf-8?B?VUlONW8rVW96eDlhWjlIQlNpMG0rWjJLOHFZdVJUczFzZmdlU2R6cjhUU2Fy?=
 =?utf-8?B?UUZVMnNIT0pGNWhtWnlyOVNkV09TcERTRjZBeW1tcklQSkRGZ3ZTd0Z2cElj?=
 =?utf-8?B?NXZ6WndkdGFTeHZ6RXZVYzA0aGpuaGNOZ1RSQ29qQXVodHU4N0kxOFRRcElC?=
 =?utf-8?Q?GQ4Ua8awYUzuGynFB8Hr7pA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694806df-83bf-4546-862d-08d9fdc545b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 09:56:36.8138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgOBtyX6czKnGOWCFDjaj54KXQxX/ERS/YGNRtnp08U+7vgQYrK/f0TvzIISKHaHOwxil8Ns5r5Xoo1ZQ5pETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2216
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWJoaW5hdiwNCj4gSGkgTGF1cmVudA0KPiANCj4gT2sgc3VyZSwgSSBjYW4gdGFrZSB0aGlz
IHVwIGJ1dCBJIG5lZWQgdG8gdW5kZXJzdGFuZCB0aGUgcHJvcG9zYWwgYSBsaXR0bGUgYml0DQo+
IG1vcmUgYmVmb3JlIHByb2NlZWRpbmcgb24gdGhpcy4gU28gd2Ugd2lsbCBkaXNjdXNzIHRoaXMg
aW4gYW5vdGhlciBlbWFpbA0KPiB3aGVyZSB3ZSBzcGVjaWZpY2FsbHkgdGFsayBhYm91dCB0aGUg
Y29ubmVjdG9yIGNoYW5nZXMuDQo+IA0KPiBBbHNvLCBJIGFtIHdpbGxpbmcgdG8gdGFrZSB0aGlz
IHVwIG9uY2UgdGhlIGVuY29kZXIgcGFydCBpcyBkb25lIGFuZCBtZXJnZWQNCj4gc28gdGhhdCBh
dGxlYXN0IHdlIGtlZXAgbW92aW5nIG9uIHRoYXQgYXMgTVNNIFdCIGltcGxlbWVudGF0aW9uIGNh
bg0KPiBwcm9jZWVkIHdpdGggdGhhdCBmaXJzdC4NCj4gDQo+IEhpIEphbmkgYW5kIFN1cmFqDQo+
IA0KPiBBbnkgY29uY2VybnMgd2l0aCBzcGxpdHRpbmcgdXAgdGhlIHNlcmllcyBpbnRvIGVuY29k
ZXIgYW5kIGNvbm5lY3RvciBPUiByZS0NCj4gYXJyYW5naW5nIHRoZW0/DQo+IA0KPiBMZXQgbWUg
a25vdyBpZiB5b3UgY2FuIGRvIHRoaXMgT1IgSSBjYW4gYWxzbyBzcGxpdCB0aGlzIHVwIGtlZXBp
bmcgU3VyYWoncw0KPiBuYW1lIGluIHRoZSBDby1kZXZlbG9wZWQgYnkgdGFnLg0KSSB3YXMgYWN0
dWFsbHkgdGhpbmtpbmcgb2YgZmxvYXRpbmcgYSBuZXcgcGF0Y2ggc2VyaWVzIHdpdGggYm90aCBl
bmNvZGVyIGFuZCANCmNvbm5lY3RvciBwb2ludGVyIGNoYW5nZXMgYnV0IHdpdGggYSBjaGFuZ2Ug
aW4gaW5pdGlhbGl6YXRpb24gZnVuY3Rpb25zIHdoZXJlaW4NCndlIGFsbG9jYXRlIGEgY29ubmVj
dG9yIGFuZCBlbmNvZGVyIGluY2FzZSB0aGUgZHJpdmVyIGRvZXNu4oCZdCBoYXZlIGl0cyBvd24g
dGhpcw0Kc2hvdWxkIG1pbmltaXplIHRoZSBlZmZlY3Qgb24gb3RoZXIgZHJpdmVycyBhbHJlYWR5
IHVzaW5nIGN1cnJlbnQgZHJtIHdyaXRlYmFjayANCmZyYW1ld29yayBhbmQgYWxzbyBhbGxvdyBp
OTE1IHRvIGNyZWF0ZSBpdHMgb3duIGNvbm5lY3Rvci4NCldlIGNhbiB3b3JrIG9uIExhdXJlbnQn
cyBzdWdnZXN0aW9uIGJ1dCB0aGF0IHdvdWxkIGZpcnN0IHJlcXVpcmUgdGhlIGluaXRpYWwgUkZD
DQpwYXRjaGVzIGFuZCB0aGVuIGEgcmV3b3JrIGZyb20gYm90aCBvZiBvdXIgZHJpdmVycyBzaWRl
IHRvIHNlZSBpZiB0aGV5IGdlbCB3ZWxsIA0Kd2l0aCBvdXIgY3VycmVudCBjb2RlIHdoaWNoIHdp
bGwgdGFrZSBhIGNvbnNpZGVyYWJsZSBhbW91bnQgb2YgdGltZS4gV2UgY2FuIGZvcg0Kbm93IGhv
d2V2ZXIgZmxvYXQgdGhlIHBhdGNoIHNlcmllcyB1cCB3aGljaCBtaW5pbWFsbHkgYWZmZWN0cyB0
aGUgY3VycmVudCBkcml2ZXJzDQphbmQgYWxzbyBhbGxvd3MgaTkxNSBhbmQgbXNtIHRvIG1vdmUg
Zm9yd2FyZCB3aXRoIGl0cyB3cml0ZWJhY2sgaW1wbGVtZW50YXRpb24NCm9mZiBjb3Vyc2Ugd2l0
aCBhIHByb3BlciBkb2N1bWVudGF0aW9uIHN0YXRpbmcgbmV3IGRyaXZlcnMgc2hvdWxkbid0IHRy
eSB0byBtYWtlDQp0aGVpciBvd24gY29ubmVjdG9ycyBhbmQgZW5jb2RlcnMgYW5kIHRoYXQgZHJt
X3dyaXRlYmFjayB3aWxsIGRvIHRoYXQgZm9yIHRoZW0uDQpPbmNlIHRoYXQncyBkb25lIGFuZCBt
ZXJnZWQgd2UgY2FuIHdvcmsgd2l0aCBMYXVyZW50IG9uIGhpcyBwcm9wb3NhbCB0byBpbXByb3Zl
IA0KdGhlIGRybSB3cml0ZWJhY2sgZnJhbWV3b3JrIHNvIHRoYXQgdGhpcyBpc3N1ZSBjYW4gYmUg
c2lkZSBzdGVwcGVkIGVudGlyZWx5IGluIGZ1dHVyZS4NCkZvciBub3cgSSB3b3VsZCBsaWtlIHRv
IGtlZXAgdGhlIGVuY29kZXIgYW5kIGNvbm5lY3RvciBwb2ludGVyIGNoYW5nZXMgdG9nZXRoZXIu
DQoNCkJlc3QgUmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg==
