Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2879D3DBE19
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 20:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0924E6E42F;
	Fri, 30 Jul 2021 18:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3496E42F;
 Fri, 30 Jul 2021 18:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627668620; x=1659204620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SXCHGRVkokNBBhM+e2r3BOByGl6swR1Ffa9TZY1kKCo=;
 b=LmHzPQhZG682vGIHgRDW+U5lw8R3gSlCiok4UCEySDeYpJUF1rHmvk/G
 VOafOTtSiTXwlnbmUeJ6Y/0motuHSpUtiPhg6cMKcDGMGW3Q4riCCLgUd
 Ctv2425NoiPnJE1hiFWCs1iiN7G5Z2Oa9bGk3lha4eLK5yzFJ4dgjlQPG
 QNGwrAS76XVj9F8lykIbkKZwC5aLv8JH78ZIqMWYf+qrOR+FF18uobHQv
 x7Ndk355i86ewPq9345LECvym1myvd1jeOF2bCENrUEe5x6cLunHZb2Kf
 ogxCOROaD58rROkGEvvWCKy3aq6PNP+btZc4Dmz22Hwuz0xfG+te+kgX9 Q==;
IronPort-SDR: 9qNj91mrdveFNWLWa2cP1fpEKL7F2j/cFhbibRFrHOExGPgmrUk5EjW/R69AG8895mLwgOOLCw
 hspNzsNGCmm/1G/qBXRDEG0ma6wHX841iVZ/Jtcx5YaThj9V/RaPLSQN2c9p6r/AW38fFVzUJ0
 LHwsxLyi+6Yd7EwWpHO/IXvPkYtG+4OOKQd6cJokLAd7SWvqpg2hXNnigPT6tmbuPy/FKTWdTO
 mRQ1+574Y0kG32aeWtSWN3FE6B3oSS+lbFZoj94SIRLpD+d2z5ucX1+b8/LemMcPBqACGiPry4
 bC6tiZLsHm/iNdmTTFrJXYmH
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="130458808"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jul 2021 11:10:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 11:10:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Fri, 30 Jul 2021 11:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HApO0bAZ94hToPZ1ptBwmqhzO9kvxDa7nrfeDGQK15pDMsLpBSdc2molVoW0+xec83yi8GqqhjNQ+W5Gp4x/OhWdgk8TSGWeNdxLS/vz48Le/zlGFnkzoUujkjbsvwBbWd+RCOQoTZSPKE8K38TJa3/DNwm1JlyPfIaBnfaJB/xwq0R/H4lDBg8ECabnzMeIMflL31YXv6MboHsr2WrIfcDV4K4NzeD0COKQ7ePS9N94MfqhOAhS4AoYPx4kzAS9mWX6W+rYh4L71UGDkVpgNcCs6d6+GRsnkSZX2f7fnPX5VnHdamzb3S0rHoHQpqkwr/PbcpdSimm6nDSMHMpOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXCHGRVkokNBBhM+e2r3BOByGl6swR1Ffa9TZY1kKCo=;
 b=MI6aGzzH8zUlWTpFzFfYDvm4LpdymR/A2SBsOGF8AhsqxlMZv6LSMrYuqs6WL7AdJlSYssEYzGPP15ZKm8n0F0y6adiX9RJn2lAjw7nAS3NKj/YrzD0D3oufIndvUQHf8HlthTKlDNSCy9aWrgS4/zjJ0Ugb+LnBXTQ5KQq67/nH/s4kmjBJvLa5obyjex0KFWedHfZf4IJWgscImajcvAGbfg4Jr7ul3/QwPn1abKJlJJAwDLlGkajm/xPPkqRnlQHnkn7VYjsi4cfmQP2qjLn3GvoYJmQoZ3odH7lH9OsHuqBORk5nzBYVuStcjGwlSMCyUc5X6gLd7oH4uZMjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXCHGRVkokNBBhM+e2r3BOByGl6swR1Ffa9TZY1kKCo=;
 b=em6mzt3lbZEPLK8jMzQ/n/zcXySqsb717fCSQ+znGhKGOOjEaqA8YB3YVuZvVdPRENFBhA1ieu/Om14I85QpEBMdwxgaLaayaOzcuhNoqOVn8XWlU0+LJ1rRO29am8nZjH6vmsW29w87WoRcTVlr9a2ehMVvMmf2rjtQBBsLuLo=
Received: from BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 18:10:15 +0000
Received: from BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf]) by BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf%5]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 18:10:15 +0000
From: <Dan.Sneddon@microchip.com>
To: <tzimmermann@suse.de>, <Dan.Sneddon@microchip.com>, <sam@ravnborg.org>
CC: <daniel@ffwll.ch>, <airlied@linux.ie>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <liviu.dudau@arm.com>, <brian.starkey@arm.com>,
 <bbrezillon@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <stefan@agner.ch>, 
 <alison.wang@nxp.com>, <patrik.r.jakobsson@gmail.com>,
 <anitha.chrisanthus@intel.com>, <robdclark@gmail.com>,
 <edmund.j.dea@intel.com>, <sean@poorly.run>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <jyri.sarha@iki.fi>,
 <tomba@kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
Subject: Re: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Topic: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ
 interfaces
Thread-Index: AQHXg+V9u4IBzc/SHUWKaqikrAmiK6tY0cGAgAGDewCAAAg/gIAAAfQAgADTeQCAAKGWAA==
Date: Fri, 30 Jul 2021 18:10:15 +0000
Message-ID: <23a61afc-05d3-f7e8-712e-b443616026f9@microchip.com>
References: <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
 <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
 <YQMF8X7gwKE/c2/R@ravnborg.org>
 <38656c7b-d9ad-c704-515e-f56582742532@microchip.com>
 <5eaae583-3efb-837d-22b0-22369096400f@suse.de>
In-Reply-To: <5eaae583-3efb-837d-22b0-22369096400f@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65bf69ef-1bc9-4b99-87b4-08d953854813
x-ms-traffictypediagnostic: SJ0PR11MB5184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB518465DB9DAC6F12557B3CBFE1EC9@SJ0PR11MB5184.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:327;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qulP29D5UyGrard2RfjfeKUsug33K0mThL9rmykjDmiVcJXHqoCQH/xHp+/DttXa5Z3NiLHshV5LErjM43llB82NAt1iLXc2Vd1mGUdCz4NIZTY8jeDm25x3SQASm/pXl2L2t88Y4wqBoeb+odB1Hw5zUPIYYQgiTXpwUilQUOtmsfzD2WrJWFsC4W7nVJtzcxQ6IWAtg/MHRSIc3ijUvVERxkTPzegTOksINkSi5bgF5rZgnj6WOLRkfdk+kNlziUi1fBCqf0IaoD1RGoscrih6o8dffwxwHUVKRTe+bS90jkwWC6sMLpGrzaww5Wg9ovmf38BzN71eWdrxnKaTTU4mkA7uIYQ3eY/A8fpElJypsUE6ahDLIlVzedALNbDymhOOVvRoXj3/eov6P9HiXVb/hHlNMj8KqCpMbdKHLagXbRlavO5Qkkr787pIP+evqN0C05b7RDe3AyFibZLCYBp9jF8Ykf/p7i3W2ysIq40vUK5SxQVGA5jILpHv2mHk9GPg/3OJRfM8KBoZ7OJ7L2cyKK9HK7n9kmI178h0H9gcDTkxlMYO+A1PsE8CoMVeCs5DKXWoGMllfaR51PRSQrDcThH1C+b6n2wsNpOZjoDPRX+BWXuNoiiI4gVyz4NhVYNh0oDYHE4Yy78wOtoLAwmLLb4z+D2SD/1mj/u1CNUcqLQ1XtMBw4qQndPFsas2E1tVcPsIe2AZR0mqCeN/PJUmlo92mMGLGAWEVErZl3Knbw1NbVx5pqvi8R/g5/4tEf/ZvpwUgtFN7S2SUAM8zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4007.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(346002)(366004)(39860400002)(8676002)(2616005)(31686004)(2906002)(7416002)(8936002)(478600001)(186003)(66946007)(31696002)(66476007)(38070700005)(91956017)(66556008)(76116006)(66446008)(64756008)(71200400001)(110136005)(54906003)(83380400001)(36756003)(38100700002)(122000001)(53546011)(6506007)(6486002)(26005)(5660300002)(4326008)(6512007)(316002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXpNTFBzbVJzTWw4aHNtMldDRW9hRGxqZGFWQ0x3TU0wSW1MK1ZlVjV1VTlh?=
 =?utf-8?B?d2Vvd1IwUHgxSVA3TnF3VDFPRi9MQ3l0by9OazRuWkRnQzIwUis3Q1JlUHZz?=
 =?utf-8?B?YURvdFU4UzRNYzc4bE1hejUwVkdEbEhCMGIyU0Q1SFB6c1l2cEV3T1NGVVFj?=
 =?utf-8?B?RVgwL1FodjNPTS8xKzU2M1h3eFpHU1RpR2Zob1N6TWNuYy82OUs4WDRBZjhD?=
 =?utf-8?B?dUM5Si9wYUNEQTJSY1NVTC9xckdDVlVJZDRpRjN0c1BwaEVPeHN1Vzc4R2Vj?=
 =?utf-8?B?R2Z5dTM0cWNHTnJyUjBDZ2d5YzZHWTcxejRzTHNiRnVBaWR5WW5OTC9IRGVr?=
 =?utf-8?B?azBoMkJiWE5KdXNxeUNHOTN2Njlob1R6MnNQMFdCU1M2cHlyekNBcGNGWmI5?=
 =?utf-8?B?bFBzMXhjalNOblV1bEt3UzJUYitpRmZkOVFLNDFRcFV0STlzTmJscVJEZDBW?=
 =?utf-8?B?ZUl5UlovWkY3Nmk3ZGdEYzE5Ri80bFZLeUVpdmFlU0lvaVJqa3Z3bTZKZ255?=
 =?utf-8?B?SVorWDdYUG5DbVJ0bUJsQ3E2OVA2U0xyL1hKeDlYU0MrUTR0S1c2NVhiaG9t?=
 =?utf-8?B?b0tqd2QwK3BJcnFVRFpZUzlZVnUzVUora0lZTjBDTmU0SlpYVjVTZUJubmli?=
 =?utf-8?B?czNVR3hNcnFuVE8vb0NGUG5ZU1hYZnlTUzBlQitqMXF2Zk5UWU44WkhWOGVF?=
 =?utf-8?B?Kzg3VTR5UTA5V0tjYVdVdEZNQUt6SSthQVQ0QlhaZXUyNzZYNjRGVmRoK0RM?=
 =?utf-8?B?TUREa1BXUWdnVW1aOEVWMEJKK1BhQW1kVmcxc0RaMEh5cTg1K3JkaVpVOWh0?=
 =?utf-8?B?dnNmODJBbXFLVGZ1a1VUTGl4RGNBdGV4RmNOT3ZJdk5FMDMvWVF1Mm5KTGR1?=
 =?utf-8?B?NE9hUWNYMkJISXZRWWJnUExlN1RUcE81UUoyRzVROWRhUEJIY0cvY3RBRC9F?=
 =?utf-8?B?M2w2Nmhib1E2MkV3WHFkTGpGcnhDZmFXMXZwR0JUQTE2S2tZeGUzUlFEREJO?=
 =?utf-8?B?ZklCeWg0U00weVNCeUxRcWtxYnhmQThVMTNDZW9Cay9WSDJWUjhLUDkrVGNp?=
 =?utf-8?B?N0R4MFNBSVpIN2RmYXJ5ZGQ3TUZxUG1yRGFydVFNZjJMc0dpdUZ3NWtmMHE2?=
 =?utf-8?B?TVRpRDJmU3NUQW5DUnB2YkFTMlNFbEVSZW0wQ09tOG0zM3kyQUpKRk1OMXJx?=
 =?utf-8?B?V0wrV2dnTGVGb254UG1peVRiR09YRGtWN3JXOERJTTNZeU5IUkpBeU9JNXFI?=
 =?utf-8?B?VGFFSmtvZnUxcDNzQmFHR1VMbGxTZWJNdjhnZ1Z4NThjS2d3eTVLaDFMMVhz?=
 =?utf-8?B?WFlWR2p4NWlwaE1FRitJRUpHRUtjVHQyRHdScGdxY3diODd6aHA1Zk5uSG9H?=
 =?utf-8?B?cGo4WSt2OEt4R2NwemRINlA2cVZjcWJqbU8yMTU0Ym5ZYXBPQmhhV2xZL04y?=
 =?utf-8?B?WmplM3p4ZnZUNEVWSXFVSVlNc2NLcWV3U0tNWk5iYURuZngwWStackhja2Q1?=
 =?utf-8?B?SEN1aklZQU5xbEdEY0VLVTVVMEU5cXJwQmlvakwzcXR4OG8vVENwcDNhYjFI?=
 =?utf-8?B?aXU2OUcrNVJSSTEzeUt2dEFuVGNURzFtSFRoZXlCNXNVTjFCT2pPVEF3SW9h?=
 =?utf-8?B?aGFpMkFkUElDdTl1UE02M0hQaGtqQW0zeVVKN0gvRmVvbWhLYTZQamQvQnlE?=
 =?utf-8?B?c2luMlRNUWdpYnhOQ0FQNFU3Vmg5VmNKN0I0bmFoL3RkWWh4MHN1TGJ5MTBL?=
 =?utf-8?Q?axKIeF0A7eFghuGRFA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C959F45F1774D444B853DE5776156DE5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4007.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65bf69ef-1bc9-4b99-87b4-08d953854813
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 18:10:15.2992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvbYBAbP+ldm/1uJP7JrFguSq00jqE/mdGMFlxGp0/M7ZEQL/7nMjHf8K9yKeNWDxqqIU9LQ4UILu82t4ifg15Fq6ge4ZeALCGqrWrfWxQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

T24gNy8zMC8yMSAxOjMxIEFNLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4gSGkgRGFuIGFu
ZCBTYW0NCj4gDQo+IEFtIDI5LjA3LjIxIHVtIDIxOjU1IHNjaHJpZWIgRGFuLlNuZWRkb25AbWlj
cm9jaGlwLmNvbToNCj4+IEhpIFRob21hcyBhbmQgU2FtLA0KPj4gT24gNy8yOS8yMSAxMjo0OCBQ
TSwgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IA0KPj4+IGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZQ0KPj4+DQo+Pj4gSGkgVGhvbWFzLA0KPj4+DQo+Pj4+DQo+Pj4+IEFyZSB5b3Ug
c3VyZSwgeW91J3JlIHRlc3Rpbmcgd2l0aCB0aGUgbGF0ZXN0IGRybS1taXNjLW5leHQgb3IgZHJt
LXRpcD8NCj4+Pj4gQmVjYXVzZSB1c2luZyBpcnFfZW5hYmxlZCBpcyBkZXByZWNhdGVkIGFuZCB0
aGUgZmxhZyB3YXMgcmVjZW50bHkgDQo+Pj4+IHJlcGxhY2VkDQo+Pj4+IGJ5IGNvbW1pdCAxZTRj
ZDc4ZWQ0OTMgKCJkcm06IERvbid0IHRlc3QgZm9yIElSUSBzdXBwb3J0IGluIFZCTEFOSyANCj4+
Pj4gaW9jdGxzIikuDQo+Pg0KPj4gT2ssIE15IGZhdWx0IGZvciB0ZXN0aW5nIG9uIHRoZSB3cm9u
ZyBicmFuY2guwqAgV2hlbiBJIHRlc3QgdGhpcyBwYXRjaCBvbg0KPj4gZHJtLW1pc2MtbmV4dCBp
dCB3b3JrcyBncmVhdC7CoCBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbiENCj4+DQo+Pj4NCj4+PiBJ
IHdhcyBsb29raW5nIGF0IGRybS1taXNjLWZpeGVzIHdoaWNoIGRpZCBub3QgaGF2ZSB0aGlzIGNv
bW1pdCA6LSgNCj4+PiBKdXN0IG15IHNpbGx5IGV4Y3VzZSB3aHkgSSB3YXMgY29udmluY2VkIHRo
aXMgd2FzIHRoZSBpc3N1ZS4NCj4gDQo+IERvbid0IHdvcnJ5Lg0KPiANCj4gSSdsbCBhZGQgU2Ft
J3MgUi1iIGFuZCBhIFRlc3RlZC1ieSBmcm9tIERhbiB0byB0aGUgcGF0Y2guIElzIHRoYXQgb2s/
DQoNClRoZSB0ZXN0ZWQtYnkgd29ya3MgZm9yIG1lISAgVGhhbmtzIQ0KPiANCj4gQmVzdCByZWdh
cmRzDQo+IFRob21hcw0KPiANCj4gDQo+Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgU2FtDQo+
Pj4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBEYW4NCj4+DQo+IA0KDQo=
