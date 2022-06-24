Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C861B55A3C2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D46710F51D;
	Fri, 24 Jun 2022 21:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3178D10F51D;
 Fri, 24 Jun 2022 21:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656106805; x=1687642805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t/+FODFaJj425dLLc6YGjq4NceItarSXd37aH7PfNXA=;
 b=KHsjvZsya8QUpTzQh1yqUPWBoIhTWfP/hIlZvg3wvYV1+HXU7QkiZpyr
 HQy8PgOrA4tlzcHnVvz7LkenNH1Yq2JGEvnZG1fQLnElt+i4LOLF2Rkrm
 TIjrWvN2zjCuH76GyU0TS2NLsFd3YsUHEVPuUR75RghIzk4J7N87WOLmk
 vtSdF/V8oRmQtNtg0KLXzHw4hhjNnDrHLoSRpSUv3+vRfTfucO5xz9mQ/
 U4ACLI2lrn6kpMYZq9ThSvPuLbWaqQ62HabQfM0lTcm6F41+WRFy6NiDP
 iunfwchDVWZHMPVXo+Byeo8eVbRd6T5liEk5RhGtcRq1tiSPNb1l7fj1T Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="282188056"
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="282188056"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 14:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="589146947"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 24 Jun 2022 14:40:04 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 24 Jun 2022 14:40:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 24 Jun 2022 14:40:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 24 Jun 2022 14:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kbna0BGlOcY6r3PTFw7HhpPWVGvO7hvzFwZFk0goyuHukd3zuH+gbzQatU4bruR0AOeqmt5jcQ1oGFJiCo5XvGJJ2GPrbgoaXPDd8E0zK90buT7WqH5bR8bZkf5l1fMp9jC9CT+A1u915oNL757ob5698Pw0Ptgd1W78+FYLhuWbYe08wXrbP5nTdBhT26XSQVtdks0twxLR9d85sCH+Gh/wBzKlQpvVUBRf27lLro2ApG5kbdil83+ziHYeJq+jLVCYCiXnW5d1b7WoxKQGP2+gENlBLyo3PBVXkK/hHyr/oak4o8P0JYo5esl3oZYY+Q4kAOYgDcdy7nv+BMRp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/+FODFaJj425dLLc6YGjq4NceItarSXd37aH7PfNXA=;
 b=iJTN1n9S6ECa6AaPB/9ncqzjbPOmF3yOvpEysdH/crxwxayM/c//JuMHiArzhOrXTa5bWYqSYIYQVEvjbTsSJVNx3QT+AZ5m6snUMZkHMf/oI3MqdkiUQF9Itu5J2AFfrn0Kz9ntgSV7rzcLmbNeSne2VBxDJNH+pGSeRe0wTa0WqlY+GLwMhWwVHpyvtYLRxW+XNRhEgKmuUZCUJDylhV8BK2YXPxnyQeZfpqCJ+/3G5FEb7JDqsxXs5RqIw4qbfVRyOSYgy8k0OlYl9Tt76hlWA3f4u92i/7ptkzEQ01cQSBxL0j/FkiZjSe0+xCQlZBX6e9w3m4+vhKZaGJ47oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 MN2PR11MB3837.namprd11.prod.outlook.com (2603:10b6:208:f6::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Fri, 24 Jun 2022 21:40:01 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::29a2:9f6:b236:d021]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::29a2:9f6:b236:d021%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 21:40:01 +0000
From: "Chery, Nanley G" <nanley.g.chery@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/fourcc: Document the Intel CCS modifiers' CC plane
 expected pitch
Thread-Topic: [PATCH] drm/fourcc: Document the Intel CCS modifiers' CC plane
 expected pitch
Thread-Index: AQHYhxCGJ9Q/cdfmOkWDJdgLp3HCJK1fFj6ggAABVnA=
Date: Fri, 24 Jun 2022 21:40:01 +0000
Message-ID: <DM4PR11MB5995225A1F50C50866D0C297DCB49@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20220623144955.2486736-1-imre.deak@intel.com>
 <DM4PR11MB59952D0A2E4B2CA1B01E9BAFDCB49@DM4PR11MB5995.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB59952D0A2E4B2CA1B01E9BAFDCB49@DM4PR11MB5995.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdde832a-cd8e-48c8-e5f0-08da562a17e0
x-ms-traffictypediagnostic: MN2PR11MB3837:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tyo0MDs7oUu1Ln3693rcdsCPUxq2m3NFmUqCT24yRpHUoixLu0dbUXKmTiqqM09cPO0RuyI5JBemgAHQc9T2thM4vJwMKMkaS8WgPL5lBo+Blx98fgZL3NrIVkEgBpHAo4t3Jlj988pQ2L2/f8Q3tbjfWQprZk10wwbUNkSx/UxUPvjap8if/Z4w2UBlhF8jIA/Kb3nwmwqQi/i9BMkanwOSu9g7NDTwX1iyIDyLXHewHB8q/j7b+QNHYXGK8g0IKTsODPbuHpf3O2Q0bnmJbIAeCu7kCoqycwl0buAva1NAMauyB73DaqDquApHTDQEBsmZl8SNMCt8nY6guJ+DWpcG+cTO+ioBl69QNs6afLvvt+4JudyYGV0MLEfL6ZDPHtzZfw5ZSaduOOrZDdCvZ3dQ+E1dEcrK3FelWuJzmS3KMO3mS22H32fglx7qlrB5BNZIMLgaT9+BdHhuufpqHvXz5gWq2aq8epeJ2RX1DAHRihG07uqeBEpWfHJOHDnzAbOD6OuSNjWOWnyDOmjucESOKMXiyHVDdU4ZtBTdU99dgLzxAncbpxhmxXNCSHJdEUg8PzDN5NBnN26NU4rNBxmmYNZzAj2ITWKMkNAKULbX2CR1bxwF2505Kb2iDoYuCS4uW+JJBVh6scAPUrvde7f0LGk4wXGd6OuGDRG07C1XTR9KBXxDoH5Fpu8b+NOtmIWdjWqF5Ml66fpOjoy/uoZBgaqgInkjXQ2wb8oM+BSM93ChP81Dhxd1I5VArcQb1/qj/+dAVjj96wAZcvHpn8MUH+WQ+J6E03Xiw1UJx7Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5995.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(396003)(39860400002)(346002)(376002)(64756008)(66476007)(54906003)(66556008)(66446008)(110136005)(5660300002)(4326008)(76116006)(8676002)(66946007)(450100002)(316002)(38100700002)(9686003)(2940100002)(107886003)(186003)(86362001)(478600001)(83380400001)(122000001)(26005)(82960400001)(7696005)(6506007)(53546011)(52536014)(55016003)(38070700005)(71200400001)(41300700001)(2906002)(33656002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V09XWTdhQUhlaVBaT25WSzVpU2M3b3FzS1pNMGhpczRubDlSOHY2N2ZrTDhW?=
 =?utf-8?B?aGo4TXpTWWdtRm56amNteXVjNFlqcTZaTDV2U1dyc3JCQW9tWU1KZmFWbGpl?=
 =?utf-8?B?TW5JTkJHZjZhWFBYajlSZmQ2UzZDbVpNZzRUM1J3cFZQMHdwdlFFZHJ2Wks3?=
 =?utf-8?B?aThuaUs0bnN5TWNxWFcyVjdnRzZYN21hc1NMdlM1c053ZDZCSDlVSFNuVHRC?=
 =?utf-8?B?L0F2KzZMK3Z5cngxUVA0VGFXUzRoejFnUURSb1NIU1VnWmpUUWhhRkZlUzBy?=
 =?utf-8?B?SkpjeDllMkpmOGV0TWtvSjIxb3JwR2lPRS9CWmQ5dHlyTmxvZnhBcWcvSXNB?=
 =?utf-8?B?bGppb25vMXAxZHFiUEdVOENEbDJoZzlJUTBobkZsWG5TcHlOK3YxdCtDZ2JY?=
 =?utf-8?B?MDVzeU9JTXJucmNpNkRzaDBWRkIrOXVDblpSL2NERUppMmFQQ3NBVzV6ZEJl?=
 =?utf-8?B?WVo0WWYzMXlhcmZHR3VHby91K0V5c0xScmdMVHZUd0Y1dzlBSmJxT0hSdnZp?=
 =?utf-8?B?R2VBTm9vU3AxS3JlQUtNMWM4bGVqbkkyd3lBa29vdVZiL2x0VHRCQXU4STZo?=
 =?utf-8?B?N1BrY0VtK0VLbWtEYnMrbGNuSDh0MkNPWlBJMDJuTDRudjErQXY1a203Rng1?=
 =?utf-8?B?Z3JacjF0OU1sWWRTMWZmTXFYdmV1a0JMSkdkNUR0UkczK1M3cDBrRDlmTEpi?=
 =?utf-8?B?MjBqUG9FZysvKzI4Z3phbUtQK3l6SWwxZ2hYZlZHdmx3VmMreHR2dE5PUE9n?=
 =?utf-8?B?T2V3b0FHT0p2SkpBa2srODNMRUpIL0JSZlBwbUFyNnVkVlNqdWJvUVlTM050?=
 =?utf-8?B?SVBxanVNcXRwVmRxTTFyK2xRZENwaTZEZlE2SjRXTTU1bnlkcTlmOXJLeG5z?=
 =?utf-8?B?Y0hVTkxaaWdFMWpTV0RBTjczbEF3VDBsbFpCUUczVmMrcXJGV2grc1hQcllz?=
 =?utf-8?B?YXZBOE5jY2hORVJsamdKUmozZzZlSGVuWXI4bHQ5THZEcTAxclVJdDZwbXAr?=
 =?utf-8?B?WTh5UnUvcjBTSGhVSVQ3aVloMVJkWDUrZUpUdkp4RGlaTk5SdGtNcGFaOTd3?=
 =?utf-8?B?eWdadjg0aGNvZUdmTE9XVk0xYzNHQm5UWDliQ01Oa2VVbXVQemhJeDhsYTEv?=
 =?utf-8?B?ako4ZmQ3Zm5zT1g2Ny8zZkJIdXJWT0xwS09sOGd3MzFFc1IvY1Raam5PM3RV?=
 =?utf-8?B?aWhuVG04RFlGbDVZRERGRjlXczI3UTQvNEhaWjNka2hQUURaQ0ptZXhqb00r?=
 =?utf-8?B?Y0FQSGdsbGR3eHZLdkY3VDRhVTJjc2wveFVlVWtRM0xTUTFCcERaV0J4SWtX?=
 =?utf-8?B?Rk5PVTB6ck9zWDk0TUNTOUwvaDJnUjNrSC9hdTNxcXNES1F0QkF2ODRweFY2?=
 =?utf-8?B?Z0xnSWtDQXVSSGVzbGNXLzZSMXNLREpGQlMzdnJIVC83R2FtL3BRVnF5N3Nk?=
 =?utf-8?B?VDA2cG05a1dsRUhlV1Fhbk8vc2EzeU53NjFHUm1ka3o2S1YxWm5pZWd6eDh5?=
 =?utf-8?B?K1FCUlZYaFZsOE5QTkNUMXByN2M4YnRmTzVVZ3RRd2l6WXFTMnFrZERYTDRj?=
 =?utf-8?B?bFR4SENZd2M3aXVWYW4xZEdSMjhxOSt1dFFKZ2dYaGw2VEl1U1dzV3k5aS9J?=
 =?utf-8?B?cjBGNUkxQVE5SmRiUUJMN2lsMHBHQXVPczVFeFRob09EeEJQZG5EVHpFd2dw?=
 =?utf-8?B?dnA0MXdJTGVwSmo3T0EwRjBJR0NSOHo1MnY4MTRiOFZWdHQ2VGRRd3lkeHhE?=
 =?utf-8?B?SllSWXZxVkVQK0ppdkd1MWZ5ZGVDb3RrNGlabFVBSmszY0Q4bEhTQ25GdFpo?=
 =?utf-8?B?Q2lHSktTRXNYWW5vemxiNVh3dUVvMWRiM3JmQUdvRklKcThJUkNITnVVYXhs?=
 =?utf-8?B?U2EwVDllWFdnK3Q3U2t2aHBHOGhhZ3RlRWdoSE1OVThCNDZnTnUydXNoQ2V6?=
 =?utf-8?B?QmxQbFMxYTE0UWs5QWR4OWxiczEyZnVyK0thbGNPbFhXWnhBQUpyWjNuaElz?=
 =?utf-8?B?cVoxM1BValVlQlplaUFBRFY5U0tsTitEamI5MTczS3pWRU1rUlBjUFdaNDFC?=
 =?utf-8?B?bVZCbEZsU0oyemJ4N3JwL1l1S05OWHFiN3RqZFV0aTk0dURWbW1KdlV2enBD?=
 =?utf-8?Q?YuyqejpjBuZ8FKR18yeIenpEQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdde832a-cd8e-48c8-e5f0-08da562a17e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 21:40:01.5420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2a7Y03/YMgwXazciSxUycw0EI0awIFx++7wWLevZdbRyZdGdCxd7h75SrsvuKbb1e9+me9/8V2XcfyrLCrlBig2+5iAqfEq3YXi+Jvo0JTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3837
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
Cc: "Justen, Jordan L" <jordan.l.justen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWN0dWFsbHkgYWRkIEpvcmRhbiB0aGlzIHRpbWUgOikNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBDaGVyeSwgTmFubGV5IEcNCj4gU2VudDogRnJpZGF5LCBKdW5lIDI0
LCAyMDIyIDU6MzkgUE0NCj4gVG86IERlYWssIEltcmUgPGltcmUuZGVha0BpbnRlbC5jb20+OyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9mb3VyY2M6IERvY3VtZW50
IHRoZSBJbnRlbCBDQ1MgbW9kaWZpZXJzJyBDQyBwbGFuZSBleHBlY3RlZCBwaXRjaA0KPiANCj4g
K0pvcmRhbiAoRllJKQ0KPiANCj4gSSB0aGluayB0aGUgY29tbWl0IG1lc3NhZ2UgaGFzIGFuIGV4
dHJhICJjb2xvciIgbmV4dCB0byAiQ0MiLg0KPiBXaXRoIG9yIHdpdGhvdXQgdGhhdCBkcm9wcGVk
LA0KPiANCj4gUmV2aWV3ZWQtYnk6IE5hbmxleSBDaGVyeSA8bmFubGV5LmcuY2hlcnlAaW50ZWwu
Y29tPg0KPiANCj4gVGhhbmtzIGZvciB0aGUgZml4Lg0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+IEZyb206IERlYWssIEltcmUgPGltcmUuZGVha0BpbnRlbC5jb20+DQo+
ID4gU2VudDogVGh1cnNkYXksIEp1bmUgMjMsIDIwMjIgMTA6NTAgQU0NCj4gPiBUbzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBDaGVyeSwgTmFubGV5IEcgPG5hbmxleS5nLmNoZXJ5QGludGVsLmNvbT4NCj4g
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9mb3VyY2M6IERvY3VtZW50IHRoZSBJbnRlbCBDQ1MgbW9k
aWZpZXJzJyBDQyBwbGFuZSBleHBlY3RlZCBwaXRjaA0KPiA+DQo+ID4gVGhlIGRyaXZlciBleHBl
Y3RzIHRoZSBwaXRjaCBvZiB0aGUgSW50ZWwgQ0NTIENDIGNvbG9yIHBsYW5lcyB0byBiZQ0KPiA+
IDY0IGJ5dGVzIGFsaWduZWQsIGFkanVzdCB0aGUgbW9kaWZpZXIgZGVzY3JpcHRpb25zIGFjY29y
ZGluZ2x5Lg0KPiA+DQo+ID4gQ2M6IE5hbmxleSBDaGVyeSA8bmFubGV5LmcuY2hlcnlAaW50ZWwu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCA4ICsrKystLS0t
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggYi9pbmNs
dWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaA0KPiA+IGluZGV4IGYxOTcyMTU0YTU5NDAuLmMxYjRj
ZmRhNzUwNzUgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgN
Cj4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaA0KPiA+IEBAIC01NTksNyAr
NTU5LDcgQEAgZXh0ZXJuICJDIiB7DQo+ID4gICAqDQo+ID4gICAqIFRoZSBtYWluIHN1cmZhY2Ug
aXMgWS10aWxlZCBhbmQgaXMgYXQgcGxhbmUgaW5kZXggMCB3aGVyZWFzIENDUyBpcyBsaW5lYXIN
Cj4gPiAgICogYW5kIGF0IGluZGV4IDEuIFRoZSBjbGVhciBjb2xvciBpcyBzdG9yZWQgYXQgaW5k
ZXggMiwgYW5kIHRoZSBwaXRjaCBzaG91bGQNCj4gPiAtICogYmUgaWdub3JlZC4gVGhlIGNsZWFy
IGNvbG9yIHN0cnVjdHVyZSBpcyAyNTYgYml0cy4gVGhlIGZpcnN0IDEyOCBiaXRzDQo+ID4gKyAq
IGJlIDY0IGJ5dGVzIGFsaWduZWQuIFRoZSBjbGVhciBjb2xvciBzdHJ1Y3R1cmUgaXMgMjU2IGJp
dHMuIFRoZSBmaXJzdCAxMjggYml0cw0KPiA+ICAgKiByZXByZXNlbnRzIFJhdyBDbGVhciBDb2xv
ciBSZWQsIEdyZWVuLCBCbHVlIGFuZCBBbHBoYSBjb2xvciBlYWNoIHJlcHJlc2VudGVkDQo+ID4g
ICAqIGJ5IDMyIGJpdHMuIFRoZSByYXcgY2xlYXIgY29sb3IgaXMgY29uc3VtZWQgYnkgdGhlIDNk
IGVuZ2luZSBhbmQgZ2VuZXJhdGVzDQo+ID4gICAqIHRoZSBjb252ZXJ0ZWQgY2xlYXIgY29sb3Ig
b2Ygc2l6ZSA2NCBiaXRzLiBUaGUgZmlyc3QgMzIgYml0cyBzdG9yZSB0aGUgTG93ZXINCj4gPiBA
QCAtNjEyLDkgKzYxMiw5IEBAIGV4dGVybiAiQyIgew0KPiA+ICAgKiBvdXRzaWRlIG9mIHRoZSBH
RU0gb2JqZWN0IGluIGEgcmVzZXJ2ZWQgbWVtb3J5IGFyZWEgZGVkaWNhdGVkIGZvciB0aGUNCj4g
PiAgICogc3RvcmFnZSBvZiB0aGUgQ0NTIGRhdGEgZm9yIGFsbCBSQy9SQ19DQy9NQyBjb21wcmVz
c2libGUgR0VNIG9iamVjdHMuIFRoZQ0KPiA+ICAgKiBtYWluIHN1cmZhY2UgcGl0Y2ggaXMgcmVx
dWlyZWQgdG8gYmUgYSBtdWx0aXBsZSBvZiBmb3VyIFRpbGUgNCB3aWR0aHMuIFRoZQ0KPiA+IC0g
KiBjbGVhciBjb2xvciBpcyBzdG9yZWQgYXQgcGxhbmUgaW5kZXggMSBhbmQgdGhlIHBpdGNoIHNo
b3VsZCBiZSBpZ25vcmVkLiBUaGUNCj4gPiAtICogZm9ybWF0IG9mIHRoZSAyNTYgYml0cyBvZiBj
bGVhciBjb2xvciBkYXRhIG1hdGNoZXMgdGhlIG9uZSB1c2VkIGZvciB0aGUNCj4gPiAtICogSTkx
NV9GT1JNQVRfTU9EX1lfVElMRURfR0VOMTJfUkNfQ0NTX0NDIG1vZGlmaWVyLCBzZWUgaXRzIGRl
c2NyaXB0aW9uDQo+ID4gKyAqIGNsZWFyIGNvbG9yIGlzIHN0b3JlZCBhdCBwbGFuZSBpbmRleCAx
IGFuZCB0aGUgcGl0Y2ggc2hvdWxkIGJlIDY0IGJ5dGVzDQo+ID4gKyAqIGFsaWduZWQuIFRoZSBm
b3JtYXQgb2YgdGhlIDI1NiBiaXRzIG9mIGNsZWFyIGNvbG9yIGRhdGEgbWF0Y2hlcyB0aGUgb25l
IHVzZWQNCj4gPiArICogZm9yIHRoZSBJOTE1X0ZPUk1BVF9NT0RfWV9USUxFRF9HRU4xMl9SQ19D
Q1NfQ0MgbW9kaWZpZXIsIHNlZSBpdHMgZGVzY3JpcHRpb24NCj4gPiAgICogZm9yIGRldGFpbHMu
DQo+ID4gICAqLw0KPiA+ICAjZGVmaW5lIEk5MTVfRk9STUFUX01PRF80X1RJTEVEX0RHMl9SQ19D
Q1NfQ0MgZm91cmNjX21vZF9jb2RlKElOVEVMLCAxMikNCj4gPiAtLQ0KPiA+IDIuMzAuMg0KDQo=
