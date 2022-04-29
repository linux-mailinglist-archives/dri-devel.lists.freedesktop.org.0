Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A9514CD4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 16:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F8910ED90;
	Fri, 29 Apr 2022 14:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1268E10ED90;
 Fri, 29 Apr 2022 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651242464; x=1682778464;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZzAYCAdp9yTWU70BaA5gVhnkgYL+2V7O1uVAp470v3U=;
 b=HmgbGWG+AsBo58+k0/1przudOi/ICBUWEac/+x5DYVrKmSBcB8X6TZmv
 3GAByPO+eS12apwlmsalnmJUpvu7Rs5lDQBRhpOfuGCUmux4aEUEqiM5G
 mC+O5kzjuRIvyQebGloaSIZpicVIIw6w41++H1nxs3MUvrGlkIxri/u3o
 SynomohhS7TJJleHhd1FHJE/xEsyvsfFAOtRw9fAHvkI7eo0XZM019OJ5
 cCnDnAQ6f+cl8hwa71wvVHWDSORzrnQJlQUCONs8MXIdAjWl69Li6mrdT
 9stxO/D6T3wCQJRdMgtldmoyZ4B07NU1j+E/0Jin3SNXXhcuzT1b/oLJX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="327155302"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="327155302"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="534515339"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 29 Apr 2022 07:27:43 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 07:27:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 07:27:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 07:27:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJZJ79qDI5t7DKxiX7/fHalcMU2dNZZDYkH9wlpKJ2UMs/NDqo3nX2djrgSwNDLdkz8BalY5bW0yuuQ4MuoNVXopI26coyMEhGWRcotUxPRooNHxQNv7Fv4vANEfPFIroDU3ycLFK0uxocCA34JEXNmgQBfZ7jC610FIuWZsoDT+XoLMiRNvdfROVJqrSAa3qo43UrjKGKwcUDrc5c5/Y+IRiLfBT5HyT4fvC2iJNoa8ekOJ06DM1Mht9TLAQxmN71HvGMzpOYmV0SdK5Fx4KZxlucIcXNIT5RMXNlhEiO+t2CxD51AQS8trjAgH87OgnRiWpRQ2Ah/8qIp5CyDGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzAYCAdp9yTWU70BaA5gVhnkgYL+2V7O1uVAp470v3U=;
 b=B5V+9lzh59bdBOC4/sExbI/AnWoHQD6a3bCTUIvC+53VgzsX5LjSTJHdptzXFLegNGWNxYo91dnROMNeJTminp67yPWvl4ADSp7SLo1LEvjbJ+0CpdLmQVPCNIj96kuZ254Pg8MqlmaI60oLH9MbcpJMD1WvaclUHnPNaCCtMy0s5OzL7GzIxXn73BwJCtXfXqhLJqr3vAdbgYcDfH4Z/UNXujkFltxh0GgpPurbBBdcGAXaYzJGLuvOfWTAmqMU9ahlu/e7lVbIp8YH/+gJ3zCunp7ebo+tQFwrrnjPDqxWOGLBcHLnUdeWE2BoN8etdlSvf4oUYGMfGZmInoZNOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 BL3PR11MB5697.namprd11.prod.outlook.com (2603:10b6:208:33c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 29 Apr
 2022 14:27:41 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::dc18:9af3:5549:4d3d]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::dc18:9af3:5549:4d3d%7]) with mapi id 15.20.5186.023; Fri, 29 Apr 2022
 14:27:41 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [Intel-gfx] [V2 1/3] drm/debug: Expose connector's max supported
 bpc via debugfs
Thread-Topic: [Intel-gfx] [V2 1/3] drm/debug: Expose connector's max supported
 bpc via debugfs
Thread-Index: AQHYTYoPTD0ImcdaekemoKoQ7l19ra0HDsJA
Date: Fri, 29 Apr 2022 14:27:41 +0000
Message-ID: <DM6PR11MB31778E7D4B07EC0B429EA593BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220411095129.1652096-2-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f0a4629-0799-4f06-4e76-08da29ec6b25
x-ms-traffictypediagnostic: BL3PR11MB5697:EE_
x-microsoft-antispam-prvs: <BL3PR11MB56971C7A0EDF597A137AE6F6BAFC9@BL3PR11MB5697.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wez0Ga1FqB7hvOn5vuA7gIvEno19E51D3Ey5cit0uS9zOjxacHFx+aFYixx7QyeHIzXdY5JABcjbBX/4agbCKrEymLWEClPByMsbfgBXwtO9GVJn5o3e5gfz1LHwDgorxV21s6HK0w1tDzKqsmvSr/srk296q0cu5AvjOZ2J0Ye2iRyLdXT5c6u64xXaM3nbmt2yL6w9d9b+Hb5R0aCIM11ZUy+SQwFNfMEo0KWVPf1JHv1WIVNmDL1kcnLERCZyuja5qnxXYhq6/FQAl7ntQggv/Y0eBNxmR+AGwdq+uWijRjHz80tUALsTaN02BA5H7Gnm1Z4sIXToM7GHW7C4X7yX/QbZAfa0R8crPtUY7iT5wT2kGxvUYFLTTZZJ5JfQpSbo8BtS/eJ9JplslX9lf8i8drk/4sxaUyFl01Z17+nnVA1Se81g30PrjGhJCGw+5dSmlNlqYYaKPRJzE6eRNlsWY/qOY/dTY6exhR1Xs346XwwSNJJusihmxpqbLXa9Z9SOvfF7yMZpqayK5Sx9vhbea/RE1e2mAMCeiAq2yZKWnGiUEtoNFmPpm+nonyJw/be3eIuy7F4LaQNYTzMnNXi2OZyUFBmX99acU/qn8bDF0551A9P1V8iCE/i/M6oykS4i27M+i0yrw7gjVvaIukag2BbuWNCQ+WFtlqhtSXvxzfVHE+rWXUQGhJzCywKrdDmKZIj29315vNSyBdGlu2h05+WMzTfWu9mNzgd4Fcw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66446008)(64756008)(8676002)(186003)(71200400001)(76116006)(26005)(2906002)(66946007)(66556008)(55236004)(86362001)(9686003)(52536014)(7696005)(508600001)(6506007)(8936002)(5660300002)(33656002)(55016003)(38070700005)(558084003)(38100700002)(316002)(6636002)(82960400001)(110136005)(921005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emZsSmk3SmlJWUhrcEpCNkhhNUNaZTB1YTUza3dYeUdET1FPZ2xaWjJZZHE1?=
 =?utf-8?B?K3c1Q0lWQ2svdEtpblRSWnR3MWtRRGRFMUdtTFhtN0RIS0dWOUZBMmpEc1RD?=
 =?utf-8?B?eXAreDB4dEY4eXdVUnlsZUpPUTV4dy9LNzAwRjhWZmQySytLMGM1SFlhVzd6?=
 =?utf-8?B?WWZWMDdaVnE3bGhzUkgxVElnNFdqWlg1dDZuZXJ6OTFtd2laaUVreW1IZVNO?=
 =?utf-8?B?ZE9Qc3UzcDRnVENldTBaVGdBZHBrZ1NEOGhJYnQ3TitlM0RVcFpSSTNOWXk2?=
 =?utf-8?B?UG83WjhhenJCZkhqMWpZRGd2TmFzWVBoQmliT2MzeEtLRm1DUm5JV08rNkZv?=
 =?utf-8?B?M25aNGlMcDRxQW81cEtXRGxvMHlkMVJabitHL1lSUkF2bk1aczlhSTBDMUV5?=
 =?utf-8?B?bmZ5MUdqNzFQWmhFRGFFQU93SUtQTmQzcHdIWEpJeU9XdHVVRkkwK3VqRDJ2?=
 =?utf-8?B?MmszNldEdWk5aVdCUXNKc1Rib3FNWHJ4VVE2bk40ZFRxT0NoV3Q0TGZiY1V2?=
 =?utf-8?B?aGJSbjhjYmYvWHIvRVMwNUpLRVZrQlJjb0ROY09nNWdOdjJjREtVK3hrZi9n?=
 =?utf-8?B?d0NnSTJXVEFFa0Z5RUNVaTd0dGYzQ3V0RHhHWGFLcUMwQXNId3BrVjVJK2NI?=
 =?utf-8?B?Z1lIdDBBWGpoME1mK1oyOXQ4TitrQTFpTGxqV1VZeGttRVVxZHlTZ3dVVTR0?=
 =?utf-8?B?TEVJelNRZWg4MkY3WmIrbGI3V0oxdk5WZCswS2xMa3l6K2ZHN3NSKzBQMyt1?=
 =?utf-8?B?aG45M3B4allVNCt3R0VRd2dEUVAzVkEyaXZscC9kNE5VU2pNdjNmbDVHdlRw?=
 =?utf-8?B?bGdEVDdDQkJDL0lZbnQvd2xDRFRabUFORE9CbE12ZGY3eU55OC9Md3ZJVElZ?=
 =?utf-8?B?SmNhSDcvRWpTeXVJdlo4OG54NjBoNHZOZTRMUUJEN3VxU0pTZGhyQlk0QW04?=
 =?utf-8?B?U3YvVXVsS1RpRnR4eGtEMDdYMFZ5K2lVNGw2OEgyZWt5THRJNVFKaG5lMnJa?=
 =?utf-8?B?YjBJVm1zbHhJWGowLzcvbVJCSDUrMkYxUlZ1MEhCbjhFZlpkMldjUnRseUhJ?=
 =?utf-8?B?T2J4RThZOVNWTFkrNVVuQWFMdG51WTl4WStWM3RtRWd4VGxNLzJ5TUtJR1g0?=
 =?utf-8?B?dFNGOGxaUG85QjlKR01BMWg5cU5nSzZkb1ptOUVFaHlFQjR5UzdFckJlclBN?=
 =?utf-8?B?SkU5WWhFYkxiQXl4UHFyZm9zbW5MckxBNUNoWmxkVE1qamxhVEZueXR0Vitp?=
 =?utf-8?B?QndDQkF6Ym9iNVRVZmpyeHZHNXlQZGEwaW52a3VWN1kxa0RXYm9VU1RtVkdz?=
 =?utf-8?B?RnNvK3RBU0hKeFZLZUFwL0JiL3JuYThQWUVMeDlVZkNidVl4T25qR2l1by9V?=
 =?utf-8?B?V2FQZ3BqTnR3cWphVnU3NGpxOXZBTjc5alR1N1hBZVJ0QnVUVGN2aC85S0Ix?=
 =?utf-8?B?UlNwdVB2U1dQTE14NVdDR1p2c1MyL0hlOHdYTUJMZklVQlNQTGM5d1dGeVpF?=
 =?utf-8?B?UVNOWFNnTEprSTZPb3AvZ1lWWEdLalM0YWxOVUVjMFB1dFBoM0ZXcTF3UVAw?=
 =?utf-8?B?czJ3SmhicDNIbllxS0dhMVBRSWdLVFNZaWU3bTVjb2ZxWkRXODF0QmZTejdT?=
 =?utf-8?B?SWxtM291aC9YcHlxOUM0R2syZFBIaWRMNWdMSDVEbXBBaU1XZEo1Q0p5YmxS?=
 =?utf-8?B?dW9sakE1ZHFPbmdVd2ZLc1EwdkJKdE1YUG5WRmFCRmdxUTN0aFNmOFFYalFP?=
 =?utf-8?B?SG9OV01IT2k4clZmWUE5bUlYMUxwVkw4VnQzWUtXMFozY3M0Q2x4d3ZWRjhx?=
 =?utf-8?B?QUY1VlRpYnZDSEVOREVGZGRuZi95ZjRydTViZHdMVFRyNG9FLzNjb2JsWnd6?=
 =?utf-8?B?azNpa0tjSEw3ZHlJNC9aUTh6WDF1ZEJkdGRibk5nVEFJdlJxaXZ4L0RwYzlY?=
 =?utf-8?B?UGhPc1I3ckw5elRrRWVXVWkydWhyTWRMM1FBR1htZEJ5T0oreXpFZUFyWkpz?=
 =?utf-8?B?dkhjTG5ucXZRbkRBZ0FidGNzTy81MmdSbWFSOTd4cmtKTENNVzlCNC9XU0Vn?=
 =?utf-8?B?WXVVTEIrL01SQisrVzduT0s3R01PSVhhb0dZalNMWG9UNmp4S0NaN1RQS2wx?=
 =?utf-8?B?NWFXaUk2aVl3azF5c3VxbUtvM3dMNmFJL0RqcU0zeldnQjlxVUk4bEI5bTZR?=
 =?utf-8?B?VjlzTnFJUVEwQ2RCRVVpUFoyNFBvZGxYMVM2WHVyKzVMWEFpRHFCNmF1alhM?=
 =?utf-8?B?S3dJNE55eExwN0YwQlc3ZDZjb05oaEsrZmc2WkRSOU8xNXgvMzlOMGMwZTU2?=
 =?utf-8?B?aEw4Si9UVHpraTFUQVlUWjdlNTVma0dPNTJueTJBUC9Xa3RRTGcrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0a4629-0799-4f06-4e76-08da29ec6b25
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 14:27:41.2505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V8gRBFBsdhosAMPaIORzGKUjVtxgcxSBNvcu++rxXVSxkI5NKIWJ1KsWVszs1rrIjyCGygqUj4XcKyIwelo1Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5697
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

PiArc3RhdGljIGludCBvdXRwdXRfYnBjX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpk
YXRhKSB7DQoNCkNhbiB3ZSBoYXZlIGEgbWVhbmluZ2Z1bCBuYW1lIGluc3RlYWQgb2YgJ20nID8N
ClVwb24gY2hhbmdpbmcgdGhpcyBwYXJhbWV0ZXIgbmFtZSwgeW91IGNhbiBoYXZlIG15DQpSZXZp
ZXdlZC1CeTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQoNClRoYW5r
cyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo=
