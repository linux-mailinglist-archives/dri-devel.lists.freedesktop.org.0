Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D623F6E4FBD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 19:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C0A10E081;
	Mon, 17 Apr 2023 17:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B0C10E081;
 Mon, 17 Apr 2023 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681754177; x=1713290177;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qb+U9myqKQWOLMrMPnH5pARq/KgazLNaFh5ed3wnJEw=;
 b=Y8HvMJBlzRiqLEnCKD1PNpgqViPDaOwrUg78OrbBQ9p6AN49G1Uu7nrS
 3nnBlFQPcjZSJkIqthVlORX31w9oPlf/hcVeY1tJG6bpsRuzugV4672n8
 p8bUzwQjRWBy1HKm89yacCz9VaE64arjRvLVXEIu2F2XUN9ihxMjY39Kz
 7hr5KofSMeIt+1IKc4d8khH5quFzAxDT6ZUqrm8iIzysZUee/txUCFlnl
 vv4cYGZqiKzXw+Ri/ImnQOsg7H/Mg4MQ6mkDCTc6VJIMEynz+zqm4QKlg
 TnbbTiNnX2PJizVI6/CItd5sxyipt/w9zz2LZVzFvnswxueH+GJoWu98w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="324582672"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="324582672"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 10:56:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="780192921"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="780192921"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Apr 2023 10:56:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 10:56:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 10:56:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 10:56:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 10:56:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Re3oqqU/VPlEdVsuVbK52ROE639wC/+A4FPe0cwhRZAWQEk28k9OWNBVn2R12AQMtmrSA1oTT7IGRQLpOOVVqINIbFL9PPIMiltrKYN5XXp9Kg24uMWWEuO0sTKkITGJkuOlcw4VMGRKArEIzAb7FJFLwngawNZ47MGUZX/eMIB9WlnQPSgmJQW/3nnu3dbuh6hGfoAV5nfql9Nq5wclOuLvdAkwOvkcRAKZsaMCNce8GG7dThsDjB9ruxXHP7l1rhzxwh4uDd9dI2mRo4spDIUM3GGBsYZs0g+FtAYJ4gq+kwAiUqaN1/ggNqWVJspaHEkzpx0g8p/bbsItxzwaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb+U9myqKQWOLMrMPnH5pARq/KgazLNaFh5ed3wnJEw=;
 b=hdul5IekwtLwoXITLOBV7QIwyWT/1x9Pc8AXIusyWtTX2yMD2anUl9NkD++eznFMJZWoCPU/lPaE8EZdrGD3FzpDz9jyzDhkTCegpLTByGqcILCU6U6D249kt1wrQkO+UdbPHEWCS/h6bTKWCkzO4GyHOwG3UFGWMu3R2OxqTO1w5bwqN7eqQpTdY92wpOByALX5nQjg7FhZ1wgQwsWvIFkrBQNRXy+SZKkm9l/py5qz0ge6t42UhEcUCg1vJF5K19O31XfeSI1r2zjk9Fbv9AWIo0iNhTh8fub+Pg1ZKY2jmfl9SPMa7QhxfMNaYlZV+h1GV3dEE5w7xQsXUZBtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 17:56:12 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 17:56:12 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v7 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Topic: [PATCH v7 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Index: AQHZaK9z5aho5IXEU06BYu2dCBUQ168kvKcAgAsdwgA=
Date: Mon, 17 Apr 2023 17:56:12 +0000
Message-ID: <f6ba19ef1483a0272f34bfd6a79ea76643615ca7.camel@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-4-alan.previn.teres.alexis@intel.com>
 <b568ae8f-64a7-6a56-6760-ac0b2ff63191@intel.com>
In-Reply-To: <b568ae8f-64a7-6a56-6760-ac0b2ff63191@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN2PR11MB4645:EE_
x-ms-office365-filtering-correlation-id: ec2d6759-607c-4735-c894-08db3f6d0849
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p6053p8UhsGBj1YDlcHr1UOrvKqTRyVKVVZtjqlS5kTC0tdL0GlgWUNV9SjG1ocjzomQOGFKX09adEJLfaXHsLh3JIjakOgYkmv51qdjRL/nt4/11rnP7r1cb6M6H6fLC8qmFF9eXRL8Nk+13cnQohffrvhHQ6NW4vbrS9WyOBle12Hkskdpc1BohnarJQ61zgugIb4Clwl2/dzSVyHBetLmTraFfwDYbEisaMmibCQJ1gjO8reuYV7AdFT1yvc/9W5haQKKOPXyNCmUyloQnFs6ENg3GFfm3rKUkOnV0VpnfuIFLVPzFXLdQjI5EAEKqHpZGgrLCxFT9CpZ+VudOAmH2+NVS7uQqQPLYocwO8i/FPTc2Rt1TeKNFiQPRdCeETx9zKFYTp7w3IAhkVmskMUnTKbwI+zmPJk+5vVfwtN35ONyV4icO6yc7ZqNme5aDWeiwmOtrX5wNJOUSH8KbUoPqVy5OM0wwXXWG2mI3LfDEhFWJ5D6OCuYNLvGbsQgEU1h53YdOEDst9dxlw2HaUqtoKSY0y3wIhZY36WQ/BbeUkdwLT6ZKvsXuuNrxp0DM6bp+HLA27F+2UmcZ4WcOM3n2NBuaiseFOdRaUKC2Z4bOhohFR3jkvldJ84DciAF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(64756008)(66476007)(66556008)(4326008)(66446008)(66946007)(2906002)(86362001)(2616005)(5660300002)(8936002)(41300700001)(76116006)(36756003)(91956017)(110136005)(54906003)(478600001)(316002)(6486002)(71200400001)(186003)(122000001)(82960400001)(26005)(6506007)(107886003)(83380400001)(6512007)(38070700005)(8676002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkY2WFByRGc4N0ZOQVdsMkFHcWFlSzBkSWhKcWx1NVhXTFVUQVRGbTFUNDBm?=
 =?utf-8?B?Y1R2OUg0Sjh3YkFSZU1vN2c3YTR0V29QSE8wdDY4bE9JajQ0MTM0bE1peVdI?=
 =?utf-8?B?YXQ2SHVmTmtaN0hBU3hoSDNtVWRReDI1a3dzdW92YVlKOUJ4NUFqSHloSkJT?=
 =?utf-8?B?WW1vN25vRG5wbnBTWk9NSTZBc2lzVzJoazMrUlB5Rlh4TnhlT1NkOWdQWnNW?=
 =?utf-8?B?dVNUVjlISmFSSG4wSXZTMGk2aHBablBINGJGTm9NOG81d1JkMEF1dk42VWht?=
 =?utf-8?B?Nzl0Z3V5cW1YTDh2aFdodUFoMWNkLzNCYWpycUlZVG9veFBlU3VhR0VycGl1?=
 =?utf-8?B?MW1pQk10cmExbEF1clUvcHFQR2RtNUdMNzVPNUZkVVRuN2VPVUg4RHNrQ2hS?=
 =?utf-8?B?Z2YwSnlURm5janB0YWNsaHhFM04rR3gveklyQmoxbmU3MUIwTHdleUdDdW1H?=
 =?utf-8?B?Q2Nxd3lqcGN6ZytJNzBDakMzNDk0a2VtY1ZEMmlJaFVrQ1lITUxMcEhZL3hD?=
 =?utf-8?B?NnB1YlJxWUhNNGlaV0ZJcm1jS09QQzVldnZRV2hlWEw1WVFQZThGaTFTODdH?=
 =?utf-8?B?VWplWDk0ZlNkaWJiNkhGUE1oZVdpSGo1TjhUTFF3azJ0TzZKUVMyT1NJRlAy?=
 =?utf-8?B?MzFwSmNKWk8rdVlwZDNyRndGNjcwZWtPSXJQZTdTVGNVK0RyQXhJRXI1enlH?=
 =?utf-8?B?WW1wTmtmRmozS0YzR2FEM3c5UVM5K2Z4QVBMSTJGdmMreHc0eGMwU0pGWDBm?=
 =?utf-8?B?SVZvNFZLdjlmR1NBeGJhVzIvdHhmb0ZBN00vOXZFbkhoZUpKQTV1eVBuWmR1?=
 =?utf-8?B?dnJLVmlXQnNTKzdrMG9YYmF4Vzd6NVhobVFDcGxaQml1YUJwdTM5dkVJdjhR?=
 =?utf-8?B?cUlISk5QbjJFR0hMZ2s2ZWZLOVhjallicWhUbTNNcm81OTVZUFRNdjNvMFl4?=
 =?utf-8?B?Uk1FbmdlcUI0RUtMSUFYTWFwV3BWcXcrTkZKeU1oZy82V3h5VzZkVitZaDMy?=
 =?utf-8?B?SEJjdnBvRG9OMmFlSlhzUG5uM2laWEVMS2FKUTk1bk44QVBvYk82VzhVQ2FW?=
 =?utf-8?B?ZGNhZFpqcm50UE5QcVg2SDE4ODR0UHdvbUdWbEpEdmg2QVVVTzdMVjJOVEY2?=
 =?utf-8?B?R0s3WHl3YmMxVmowaVVtK0NYckkrdFlncEtFeDRtYThHdC83UVFCTTdXN1B4?=
 =?utf-8?B?dnFxNmFpWmNFNGJKc3FxeENudHI3SUZIM2FKQzYrdFlxSHVRR3hRREVRMVdn?=
 =?utf-8?B?SDNMRzJzYjYzbHJXY0JjWGNCM3JOczNMK0FNdFA5TW9mazBTRVpyeGw0MEFk?=
 =?utf-8?B?ak5XZm1uTGNIMUFuUW83aS9SV3JXUUlkMnE1SHBCTjNtUklPSEcxM1YwZUsy?=
 =?utf-8?B?b09iSi9LeTJtVWo5VC92aGQ1T1JKTWR0elF4QWNuaVB2Tm5YaCtBTHZDWTAx?=
 =?utf-8?B?SG1WUDdLNFh5K1VtS2ticXFsNTU5YmZhRDFjV2pERE1GcCtmR1lQcGNldU1k?=
 =?utf-8?B?YzFZU3crS2IyYm5wTG1kcXp3d0JBaGluWmFpcmxLeTBHdEFtaDV0Q2puM0Ni?=
 =?utf-8?B?VWNJWVBCSzNqemJiQmNtc3NYbkpsMnRHWlljaUl0NDI5YWFaelJUQmJLZFly?=
 =?utf-8?B?L3huV1VTemthZ1FPMGZabkFHbnpXRFlDUDJoRHczWXRCZGhGNll3KytIbDFB?=
 =?utf-8?B?TTFDemFvd2VEU2tVM0VuYlMrdDF3ZVJNalZ4RTRsOVp5SXFwN280Sm9XdFNh?=
 =?utf-8?B?b2dZbmpGNmVGV0lIZXRGeWdNR0ZNMFVnaWM5ZFZrNzhvbFc0czFOZVhIS3dw?=
 =?utf-8?B?dzdvaGZLRktWajRVZHd4WWdlN3dVcytjeFNHQzhXaVkvS3FMbE5ybUVLR0Ez?=
 =?utf-8?B?bmc1OUZ4a2crUHUyTW1GVlB5RGlwdFRzclorM1VkaFl0bDBKbStDSVhRdHVN?=
 =?utf-8?B?ZnJVb3dycWVFYjVZRVF4WjkxQTlLNm52K0tBWWRPaENyVFRUcEFKVDI2dHBo?=
 =?utf-8?B?eWkyY3VLL29VK0pKdnpnWUtaM0lJNUFaVmhPdnNiVzQ4MmFYeURicmlaTnNr?=
 =?utf-8?B?S3Jmc0owNyszaG91S1c2MS9TbVNleVNjNGV5Y2thaXVBUVg3ZnV1QUU1TlZD?=
 =?utf-8?B?bmlnbi9MVmRZQVpneU5KYVorQjUrYXVOV0hNOEpBYm1MdmNpNFdJcmFpZmdl?=
 =?utf-8?Q?j3eLEXHzg7Y+mZQhU7ghyG8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85C994FB0AF41840BFE301FC4BF5666A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2d6759-607c-4735-c894-08db3f6d0849
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 17:56:12.5975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DM0qEMEq0MbcPR9TKM3HgL2cLWLOrLD7BAyOzyrwaFo2LHDqGFSlxF/TRAkawx35TRFVsri4Q2z3daYUvGueubOcsv1AIATuEdEVXOK9GjnzohoELgLawIGNZvoa8V5l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA0LTEwIGF0IDA5OjEwIC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gDQphbGFuOnNuaXANCg0KPiA+ICtpbnQNCj4gPiAraW50ZWxfZ3NjX3VjX2hl
Y2lfY21kX3N1Ym1pdF9ub25wcml2KHN0cnVjdCBpbnRlbF9nc2NfdWMgKmdzYywNCj4gPiArCQkJ
CSAgICAgc3RydWN0IGludGVsX2NvbnRleHQgKmNlLA0KPiA+ICsJCQkJICAgICBzdHJ1Y3QgaW50
ZWxfZ3NjX2hlY2lfbm9uX3ByaXZfcGt0ICpwa3QsDQo+ID4gKwkJCQkgICAgIHUzMiAqY21kLCBp
bnQgdGltZW91dF9tcykNCj4gPiArew0KPiA+ICsJc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5n
Ow0KPiANCj4gV2UgYWx3YXlzIHVzZSAiZW5naW5lIiBmb3IgZW5naW5lX2NzIHZhcmlhYmxlcy4g
SU1PIGl0J3MgYmV0dGVyIHRvIHN0aWNrIA0KPiB0byB0aGF0IGhlcmUgYXMgd2VsbCBmb3IgY29u
c2lzdGVuY3kgYWNyb3NzIHRoZSBjb2RlLg0KYWxhbjogd2lsbCBkbw0KPiANCj4gPiArCXN0cnVj
dCBpOTE1X2dlbV93d19jdHggd3c7DQo+ID4gKwlzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycTsNCj4g
PiArCWludCBlcnIsIHRyaWFscyA9IDA7DQo+ID4gKw0KPiANCj4gSXMgdGhlIGFzc3VtcHRpb24g
dGhhdCB0aGUgY2FsbGVyIGlzIGhvbGRpbmcgYSB3YWtlcmVmIGFscmVhZHk/IA0KPiBPdGhlcndp
c2Ugd2UncmUgZ29pbmcgdG8gbmVlZCBhbmQgZW5naW5lX3BtX2dldCgpIGhlcmUgKGFzc3VtaW5n
IGl0IA0KPiBkb2Vzbid0IGludGVyZmVyZSB3aXRoIGFueSBsb2NraW5nLCBvdGhlcndpc2UgaXQg
aGFzIHRvIGJlIGluIHRoZSBjYWxsZXIpDQphbGFuOiByaWdodCBub3cgdGhlIG9ubHkgcGxhY2Vz
IHRoaXMgY2FuIGdldCBjYWxsZWQgZnJvbSBpcyB2aWEgaW50ZWxfcHhwX2dzY2NzX2NyZWF0ZV9z
ZXNzaW9uIG9yDQppbnRlbF9weHBfZ3NjY3NfZW5kX2FyYl9md19zZXNzaW9uLiBUaGVzZSBmdW5j
dGlvbnMgYXJlIGVpdGhlciBiZWluZyBjYWxsZWQgYnkgaW50ZWxfcHhwX3N0YXJ0DQpvciBpbnRl
bF9weHBfZW5kLiBpbnRlbF9weHBfc3RhcnQgY2FsbHMgaW50ZWxfcnVudGltZV9wbV9nZXRfaWZf
aW5fdXNlIGluZGlyZWN0bHkgZnJvbSB0aGUNCnNlc3Npb24td29ya2VyIGFuZCB3aGlsZSBpbnRl
bF9weHBfZW5kIHRha2VzIGFuIGV4cGxpY2l0IGludGVsX3J1bnRpbWVfcG1fZ2V0IChzaW5jZSBp
dCBpcw0KZm9yIHN1c3BlbmQvc2h1dGRvd24gY2xlYW51cCBhbmQgZG9lc24ndCB1c2UgdGhlIHdv
cmtlcikuIEknbSBhc3N1bWluZyBydW50aW1lX3BtIHdvcmtzIHJpZ2h0Pw0Kd2UgaGF2ZSBhIHNp
bWlsYXIgbG9naWMgYWNyb3NzIHRoZSBwYXRocyBmcm9tIEFETCB2ZXJzaW9uIHdoZXJlIHdlIGRv
bnQgdGFrZSBleHBsaWNpdA0KZW5naW5lX3BtX2dldCBmb3IgdGhlIHRlcm1pbmF0aW9uIHZpYSBW
REJPWCBiZWNhdXNlIGl0cyBwYXJ0IG9mIHRoZSBzYW1lIGNvZGUgcGF0aHMuDQoNCmFsYW46c25p
cA0KDQo+ID4gKwllcnIgPSBpOTE1X3ZtYV9tb3ZlX3RvX2FjdGl2ZShwa3QtPmJiX3ZtYSwgcnEs
IEVYRUNfT0JKRUNUX1dSSVRFKTsNCj4gDQo+IG5pdDogSSBkb24ndCB0aGluayB3ZSBuZWVkIEVY
RUNfT0JKRUNUX1dSSVRFIGZvciB0aGUgYmIgYXMgd2UncmUgbm90IA0KPiBnb2luZyB0byB3cml0
ZSBpdC4NCmFsYW46IHllcyAtIHdpbGwgcmVtb3ZlLiAoaGFkIGFjY2lkZW50YWxseSBrZXB0IGFi
b3ZlIGZsYWcgZnJvbSBvZmZsaW5lDQpkZWJ1Z2dpbmcgdmVyc2lvbiBvZiB0aGUgY29kZSB0aGF0
IGhhZCBhZGRpdGlvbmFsIHN0b3JlIGR3b3JkcyBpbnRvIGJiKS4NCg0KPiANCj4gPiArCWlmIChl
cnIpDQo+ID4gKwkJZ290byBvdXRfcnE7DQo+ID4gKwllcnIgPSBpOTE1X3ZtYV9tb3ZlX3RvX2Fj
dGl2ZShwa3QtPmhlY2lfcGt0X3ZtYSwgcnEsIEVYRUNfT0JKRUNUX1dSSVRFKTsNCj4gPiArCWlm
IChlcnIpDQo+ID4gKwkJZ290byBvdXRfcnE7DQo+ID4gKw0KPiA+ICsJZW5nID0gcnEtPmNvbnRl
eHQtPmVuZ2luZTsNCj4gPiArCWlmIChlbmctPmVtaXRfaW5pdF9icmVhZGNydW1iKSB7DQo+ID4g
KwkJZXJyID0gZW5nLT5lbWl0X2luaXRfYnJlYWRjcnVtYihycSk7DQo+ID4gKwkJaWYgKGVycikN
Cj4gPiArCQkJZ290byBvdXRfcnE7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJZXJyID0gZW5nLT5l
bWl0X2JiX3N0YXJ0KHJxLCBpOTE1X3ZtYV9vZmZzZXQocGt0LT5iYl92bWEpLCBQQUdFX1NJWkUs
IDApOw0KPiA+ICsJaWYgKGVycikNCj4gPiArCQlnb3RvIG91dF9ycTsNCj4gPiArDQo+ID4gKwll
cnIgPSBjZS0+ZW5naW5lLT5lbWl0X2ZsdXNoKHJxLCAwKTsNCj4gPiArCWlmIChlcnIpDQo+ID4g
KwkJZHJtX2VycigmZ3NjX3VjX3RvX2d0KGdzYyktPmk5MTUtPmRybSwNCj4gPiArCQkJIkZhaWxl
ZCBlbWl0LWZsdXNoIGZvciBnc2MtaGVjaS1ub24tcHJpdi1wa3RlcnI9JWRcbiIsIGVycik7DQo+
ID4gKw0KPiA+ICtvdXRfcnE6DQo+ID4gKwlpOTE1X3JlcXVlc3RfZ2V0KHJxKTsNCj4gPiArDQo+
ID4gKwlpZiAodW5saWtlbHkoZXJyKSkNCj4gPiArCQlpOTE1X3JlcXVlc3Rfc2V0X2Vycm9yX29u
Y2UocnEsIGVycik7DQo+ID4gKw0KPiA+ICsJaTkxNV9yZXF1ZXN0X2FkZChycSk7DQo+ID4gKw0K
PiA+ICsJaWYgKCFlcnIpIHsNCj4gPiArCQlpZiAoaTkxNV9yZXF1ZXN0X3dhaXQocnEsIEk5MTVf
V0FJVF9JTlRFUlJVUFRJQkxFLA0KPiA+ICsJCQkJICAgICAgbXNlY3NfdG9famlmZmllcyh0aW1l
b3V0X21zKSkgPCAwKQ0KPiA+ICsJCQllcnIgPSAtRVRJTUU7DQo+ID4gKwl9DQo+ID4gKw0KPiA+
ICsJaTkxNV9yZXF1ZXN0X3B1dChycSk7DQo+ID4gKw0KPiA+ICtvdXRfdW5waW5fY2U6DQo+ID4g
KwlpbnRlbF9jb250ZXh0X3VucGluKGNlKTsNCj4gPiArb3V0X3d3Og0KPiA+ICsJaWYgKGVyciA9
PSAtRURFQURMSykgew0KPiA+ICsJCWVyciA9IGk5MTVfZ2VtX3d3X2N0eF9iYWNrb2ZmKCZ3dyk7
DQo+ID4gKwkJaWYgKCFlcnIpIHsNCj4gPiArCQkJaWYgKCsrdHJpYWxzIDwgMTApDQo+ID4gKwkJ
CQlnb3RvIHJldHJ5Ow0KPiA+ICsJCQllbHNlDQo+ID4gKwkJCQllcnIgPSBFQUdBSU47DQo+ID4g
KwkJfQ0KPiA+ICsJfQ0KPiA+ICsJaTkxNV9nZW1fd3dfY3R4X2ZpbmkoJnd3KTsNCj4gPiArDQo+
ID4gKwlyZXR1cm4gZXJyOw0KPiA+ICt9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19oZWNpX2NtZF9zdWJtaXQuaCBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19oZWNpX2NtZF9zdWJtaXQuaA0KPiA+IGluZGV4
IDNkNTZhZTUwMTk5MS4uM2FkZGNlODYxODU0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19oZWNpX2NtZF9zdWJtaXQuaA0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19oZWNpX2NtZF9zdWJtaXQu
aA0KPiA+IEBAIC04LDcgKzgsMTAgQEANCj4gPiAgIA0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+DQo+ID4gICANCj4gPiArc3RydWN0IGk5MTVfdm1hOw0KPiA+ICtzdHJ1Y3QgaW50ZWxf
Y29udGV4dDsNCj4gPiAgIHN0cnVjdCBpbnRlbF9nc2NfdWM7DQo+ID4gKw0KPiA+ICAgc3RydWN0
IGludGVsX2dzY19tdGxfaGVhZGVyIHsNCj4gPiAgIAl1MzIgdmFsaWRpdHlfbWFya2VyOw0KPiA+
ICAgI2RlZmluZSBHU0NfSEVDSV9WQUxJRElUWV9NQVJLRVIgMHhBNTc4ODc1QQ0KPiA+IEBAIC00
Nyw3ICs1MCw3IEBAIHN0cnVjdCBpbnRlbF9nc2NfbXRsX2hlYWRlciB7DQo+ID4gICAJICogd2Ug
ZGlzdGluZ3Vpc2ggdGhlIGZsYWdzIHVzaW5nIE9VVEZMQUcgb3IgSU5GTEFHDQo+ID4gICAJICov
DQo+ID4gICAJdTMyIGZsYWdzOw0KPiA+IC0jZGVmaW5lIEdTQ19PVVRGTEFHX01TR19QRU5ESU5H
CTENCj4gPiArI2RlZmluZSBHU0NfT1VURkxBR19NU0dfUEVORElORyAxDQo+IA0KPiBOaXQ6IHRo
aXMgY2hhbmdlIG9uIHRoZSBkZWZpbmUgaXMgbm90IHJlYWxseSBuZWVkZWQNCnN1cmUgLSB3aWxs
IGZpeC4NCj4gDQo+IERhbmllbGUNCg0K
