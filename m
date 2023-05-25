Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC5C71190A
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 23:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B523A10E783;
	Thu, 25 May 2023 21:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F6210E781;
 Thu, 25 May 2023 21:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050033; x=1716586033;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s23k7MXA8ImzbiriUQ8IcrgoWfv+TobAF+g2qT8SopA=;
 b=UcucO1srEFSMy5UPbxwx42bSaw7wa8fu96bbuVKrM+/Vt1ImRuc13MHl
 HIxrgXF5Y3Y21MDVfPFQYrMhUwB1WU5xzj6/LQ4gAFwqPDK8YNP1f54ok
 BDRKBs1vskDulBg+GZXV3VRDybIhpGdSbaL2DwMkywK64HPflHp5Yhjv/
 x28ShklKm+LyPIi96gAVCUwkDIkMOIcXjGah62skKTR7RiWbJs1gCrVfG
 +OLc4HjQUTvRFtLuEGWAdFVb86QEyBKnvs623d+n+xP+zxsSStwLEA/A2
 Er9iLtCZbXMe28ZQqU6sj8uXlkEk+fmkO+C4jUROukEQ3r6jtI2kFA4l6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357283468"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="357283468"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="699156466"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="699156466"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 25 May 2023 14:27:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 14:27:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 14:27:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 14:27:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 14:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9Zj4UqcgS+eaw3sJUncKFU9yB4moyArTGhea1Ex55Aq+feKoBhjI7skbIiKwtQv3sxpSuIbEMv+zMFQiLCD/+OxfX5u3hdJz5USKKiTySMgaF3vp0pE3LFu2VGyKezhlgh+5jkbxbGsjAvSMs+0X2BYd1nxZhcHzPuTPHg8ms0KEhGppDguT+YYJDdwDXBBeJGjl43QyjddFbYRVPes2P2FpmO1N7FHpFDeG9UlXPsgQGFAuMYOhYRdmASKoXu4QoeC9b6ozYIsjfaWS2BCxOvZeEiIQ0f5EuFWChppo4k8XVj38eqgcgu0A7pNtHfl0YHicks6FVoIHywjkKPXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s23k7MXA8ImzbiriUQ8IcrgoWfv+TobAF+g2qT8SopA=;
 b=bL0XssfHz1wwrW6r1tvaHhGoK/XauN1yqC2tlBOVFf2cuDVrdNijXJvCO7RkxWBi5bfr6aY8Rq0mkAepvPk0+5Fj12+Nwqr/mmPCoVtf9qZ/GQ/ntj2nt/GfEurBkXuvbRgIZ/gUKpMyDNjDxWve8U6JRtY2RIkqueRCDacCWWG6Hdak2FYm/QBvrTA+ESxkbo+D2mMbqHCoVpV02RCWCif953Vn32O+iDwN79KtARjjiBDAZ/burNOBtrXCwK9U4jD09lXTjWta1uaD2M76XOk7dWip3Gu3Zi8XZY22q+sYL6exR60nrrPf/3z3hQUM8vEZcwgyaKRBrNbdao4sAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15; Thu, 25 May 2023 21:27:07 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284%5]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 21:27:07 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 3/7] drm/i915: Fix CHV CGM CSC coefficient sign handling
Thread-Topic: [PATCH v2 3/7] drm/i915: Fix CHV CGM CSC coefficient sign
 handling
Thread-Index: AQHZbigA/XBPFxmulEafTrD8A9+bvq9ruOnQgAAJwUA=
Date: Thu, 25 May 2023 21:27:06 +0000
Message-ID: <DM4PR11MB63603173DAE762A2DFF3ABB3F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
 <20230413164916.4221-4-ville.syrjala@linux.intel.com>
 <DM4PR11MB636031F61EE8864E316FB1C3F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB636031F61EE8864E316FB1C3F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY5PR11MB6233:EE_
x-ms-office365-filtering-correlation-id: 38ccc39c-c625-4608-cd91-08db5d66ca81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7l2sC/Uv9B+hMKqs8iMtOYulcAaZEWQgYRbwk7gBaOhyez02GocbWVcml8LUdwlO4Ohh3KK9+/PVYrFRxYjzccHh5ywlihhe60yzO+A+SGOE7Mnod2yu6/BOXZe+Il+KexrIDINLep9dxq0PjzTnffG32mG5LVzLpSqlILQURHjS7u6Diep2ufBX3F1z4UXbf5RRQi12EIAZKq2NBtjH6J1ZpqeHPEtmMeoinG4wh9uR8FEo3GixxD4vnDSUY4B6r6DiVR6yb1vpVTG6BRdDKZkbXkrM53GrSdc+dy2/zR7rhCwlZhq+FT6mmOgJ+K6UfzVtoqoFdftYLlgo2WbHHY2b5pVrCzgNEzCEy4F686XMGHp7oYOKe/b8bsWOlwK34YZDU3/6EdqOjdmXZLQU60MM4rv13FBGdJjEsvHD416oC3hK9xqbfAv5NKQm1nmXKVNmENYwMjyK92eGw8jJlpMy7sykPi+kc27RInSSE+J31BSbxYek4swL7CFu9U9oRk3MXTBFPsPJHlc90A58/u6s7VHdc0Q0x+lishZNnSN8HnOxPp3zUfNV+PID9TS42GFmZQ4byaQUuJ4TWHWE1I9UB1KsiaV1/hCQ8WcqCFcPoKp9o+CBneW4bbRMjkNy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(396003)(39860400002)(136003)(84040400005)(451199021)(82960400001)(110136005)(38070700005)(122000001)(38100700002)(76116006)(66946007)(66476007)(66556008)(66446008)(478600001)(86362001)(4326008)(64756008)(71200400001)(33656002)(7696005)(66574015)(83380400001)(316002)(41300700001)(186003)(2906002)(2940100002)(9686003)(53546011)(26005)(52536014)(6506007)(5660300002)(8936002)(8676002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEVWU1BwRkFUMmJtV1cvK01va25GM1lWV05uRG5hdUpkZG80V2pQNlVSTWYv?=
 =?utf-8?B?bSs0cTdhdFhNQUV3dGMvS2laQkRCVzhiT1lyM0tCSjVDVEdKNlRaclNUUU8y?=
 =?utf-8?B?ZEdyaXdTNlg0SmRIbytwaVRhdkhyaldoS1B5ZjAwM3YveDZZc3NSeXZlRXBH?=
 =?utf-8?B?LzVXTm9hNndyK1p4M1F1KzRVSElJYW4xbzNpZ0Z0eXdRZTBPTmx3dmkxeHRw?=
 =?utf-8?B?WnhHblpsYUYreG5wSFhMOC84TmhpZmNpaXBwVU9xRHNHMCtJWUx4SlYrSnUx?=
 =?utf-8?B?K0pXSk02UFQrOWFjRGV5eDNkc2thekY2eWE3Y25aT1h1N21MZEZwL1ZXMjQ4?=
 =?utf-8?B?THNwYnU1M0J2SWE4ZG9icjc4a2ovMlV4UmZHQTlyVTByblZxbTVKNDk1TUFP?=
 =?utf-8?B?eTRNc3FpSUEvL3ZEOUdUd1BueW5wS0JiTjJLeEV1SGhXZWZlQ2NVWkJiYThF?=
 =?utf-8?B?bWo4T094OU5UWTlZKy9YcEVRZkN3OUt5d2xRanhQSytFblQ5MUg3Z0pLOExG?=
 =?utf-8?B?SjZNblY3UGFRb2FQdCtUTnN5cG9lOGY4MTA3RCtVZCtLbEF4TW1KL083cnZF?=
 =?utf-8?B?STJsSXZCbjRJNUt5Tys0TEdRNWJlbVk3MUZEakdqY0kycXdOQ214MUZNVE8w?=
 =?utf-8?B?VHcweVNHQXRGamlXTjZLNTVjdUR6Ly85NWpHQ1ZwQ2ZxL1kxTERDQlp2ZVNq?=
 =?utf-8?B?L1M0MklVTkdMVzBtM3duemxKRFdHN2lMSDVLcDgrU1Y3eVNRSjFlN1VOU2cz?=
 =?utf-8?B?bUlRQ1h1Q3Q5cjA2UkIvTDlJaG5wdS9LNHpORjMrem5jbWIrT3N4NndVMnhP?=
 =?utf-8?B?K0p5Vzk1cDhRQWtMcE45MjJkb2pkYWhMRC9uWDRaVlFaRVc2VlEvNUI3ZHlx?=
 =?utf-8?B?SUlxTW1TQmhJYUJFaXErNnpkd1BLemRvcTI1YTRNSEZycUhOejVWUzJ5dmg3?=
 =?utf-8?B?NVVRcU4yZ1puOHRKQjBzcnNhOEg0N3dieXJhNGpTKzNBb2VaRHg0WW5GMGts?=
 =?utf-8?B?S0owN09obUlJdUV3TFZjRS9JUEkrWEE1bVdJWXhCQUFtaTNlV0dCNFZvVmJ3?=
 =?utf-8?B?emUvMEN2eE1RT25Xdlh2Q3VIWHBJVGJsTElPK21WdnRBdnNhV2JRcksvSmpQ?=
 =?utf-8?B?QU9lU1VpeXpSVnIva1lxU0RvV0QrYmJKU3c3L1JNMHdDZUVDQlJHdXVnVEVy?=
 =?utf-8?B?cngrMlczbmxPMklEcWxSaTN1TmQ3RVBubFFLaDk5QzZiQ1pQUEZiWExTRldp?=
 =?utf-8?B?eVYxWURtVG1ZMGl4ZWJ2M0ZuaEJsbEJEb2pDQkRpQ3Fua1pTcndDRVNTazUz?=
 =?utf-8?B?M3NtRGF2U20xT3daTEZaT3N3bkZEMysvM2R3K0ZDaE1CdmtEREdWQ0Vkcllo?=
 =?utf-8?B?aS9IMThQbGE3NG15dnBnVTVObjgwYkxYRE9DTUhZRmZZbXhBMTJsSjJLSms4?=
 =?utf-8?B?TEpGY3N1eVhVa1pNQ2RIRFAwclluQWxVb05GQnNnMW0yK0hVUStPdkg5RGZ6?=
 =?utf-8?B?eG9QTklrSnhyVi9EOUtNUzl0dWNzU0JoMUtkRjRNcmJlRVJVSmdONlVNL1hF?=
 =?utf-8?B?am5ZVW9uYnRUeloxalBPSnBCUTBaYi9hWFlMcVEwUDYwN2VsOTRyTHJEMTR1?=
 =?utf-8?B?cFd5dUE2Wm1Ib3VKTGZOZVJJd3BOYlR2ODQxYUFyUDBFUk10TnZGejBWcTY0?=
 =?utf-8?B?STBiZ0dZVWJicGFEWGVyZSszZWdqWmFWUCs0NHhncTgvcERKVDVWMzFtWTNn?=
 =?utf-8?B?WFAwV2Y0MUJIY3VHWmk3SzdGOHhRK01WNVBXT1VESTZkMzlRWnZZczlBcWJR?=
 =?utf-8?B?YzRFQkw4MHhLYjFXOUEzR3lkcGVaU0JscmxRdlZIazNRc1FUMzM4a1dMNVQ2?=
 =?utf-8?B?RFduQXdCNlJGWmRuTHVhOVRoVU0vRE5GckhqcEd3b0dmZEFEWDFuQ0F6Y1pD?=
 =?utf-8?B?V3UxVytBMlI0WVpOalQzcmFNNitjcURpNldJL3o1RXAvVndHeXhBY2Y3SWZt?=
 =?utf-8?B?U2V0SDJWS1Rrc0JZMVovSlJJV01HTVJzYkJiNWpaUkRSK1IwNHV0eXQ1WkdK?=
 =?utf-8?B?aG8zcFNCOGZZYXFmOUZKSlFHTDZyNjV0NWdINEdxRUVha0QvMGdwS09uSExY?=
 =?utf-8?Q?rzyoJG8zox8GqLdg4KydjOIUT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ccc39c-c625-4608-cd91-08db5d66ca81
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 21:27:06.8478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RNes64INf5AjaMhcfJKpu/pT+xrUc7ZR1Gzyk2TjFf1uZmHkpQ8ZYWluRAejtWJmS8K+96gpBk8anQv0J4LgnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhbmthciwgVW1hDQo+
IFNlbnQ6IEZyaWRheSwgTWF5IDI2LCAyMDIzIDI6MjUgQU0NCj4gVG86IFZpbGxlIFN5cmphbGEg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0
OiBSRTogW1BBVENIIHYyIDMvN10gZHJtL2k5MTU6IEZpeCBDSFYgQ0dNIENTQyBjb2VmZmljaWVu
dCBzaWduIGhhbmRsaW5nDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4gVmlsbGUgU3lyamFsYQ0KPiA+IFNlbnQ6IFRodXJz
ZGF5LCBBcHJpbCAxMywgMjAyMyAxMDoxOSBQTQ0KPiA+IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMy83XSBkcm0vaTkxNTogRml4IENIViBDR00gQ1NDIGNvZWZm
aWNpZW50IHNpZ24NCj4gPiBoYW5kbGluZw0KPiA+DQo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPg0KPiA+IFRoZSBDSFYgQ0dNIENT
QyBjb2VmZmljaWVudHMgYXJlIGluIHM0LjEyIHR3bydzIGNvbXBsZW1lbnQgZm9ybWF0LiBGaXgN
Cj4gPiB0aGUgQ1RNLQ0KPiA+ID5DR00gY29udmVyc2lvbiB0byBoYW5kbGUgdGhhdCBjb3JyZWN0
bHkgaW5zdGVhZCBvZiBwcmV0ZW5kaW5nIHRoYXQNCj4gPiA+dGhlIGh3DQo+ID4gY29lZmZpY2ll
bnRzIGFyZSBhbHNvIGluIHNvbWUgc2lnbi1tYWduaXR1ZGUgZm9ybWF0Lg0KPiANCj4gU3BlYyBp
cyBzbGlnaHRseSBjb25mdXNpbmcgd2hlbiBpdCBzYXlzOg0KPiAiQ0dNIENTQyA6ICBJbnB1dCBw
aXhlbHMgdG8gdGhlIENHTSBDU0MgYXJlIDE0IGJpdHMuICh1LjE0IGZvcm1hdCkuIENvZWZmaWNp
ZW50cyBhcmUNCj4gMTYgYml0cyAoczMuMTIpLiINCj4gQWxzbyBoZXJlOg0KPiAiUHJvZ3JhbW1h
YmxlIHBhcmFtZXRlcnMgOg0KPiBjMFsxNSA6MF0sIGMxWzE1IDowXSwgYzJbMTUgOjBdLCBjM1sx
NSA6MF0sIGM0WzE1IDowXSwgYzVbMTUgOjBdLCBjNlsxNSA6MF0sIGM3WzE1IDowXSwNCj4gYzhb
MTUgOjBdIDsgLy8gc2lnbmVkIG1hdHJpeCBjb2VmZmljaWVudHMgIChzMy4xMikiDQo+IA0KPiBC
dXQgdGhlIGNvZWZmaWNpZW50cyBhcmUgMTZiaXRzLCBjYW4geW91IGhlbHAgdW5kZXJzdGFuZCBo
b3cgd2VyZSB5b3UgYWJsZSB0byBjcmFjaw0KPiB0aGlzIPCfmIoNCg0KSSB0aGluayBJIGdvdCBp
dC4gTG9va3MgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5r
YXJAaW50ZWwuY29tPg0KDQo+ID4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jIHwgNDYNCj4gPiArKysrKysrKysrKysrKy0tLS0t
LS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2NvbG9yLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29s
b3IuYw0KPiA+IGluZGV4IDRmYzE2Y2FjMDUyZC4uNjMxNDFmNGVkMzcyIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiA+IEBAIC01Njgs
MjkgKzU2OCw0MSBAQCBzdGF0aWMgdm9pZCBpY2xfbG9hZF9jc2NfbWF0cml4KGNvbnN0IHN0cnVj
dA0KPiA+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ID4gIAkJaWNsX3VwZGF0ZV9v
dXRwdXRfY3NjKGNydGMsICZjcnRjX3N0YXRlLT5vdXRwdXRfY3NjKTsgIH0NCj4gPg0KPiA+ICtz
dGF0aWMgdTE2IGN0bV90b190d29zX2NvbXBsZW1lbnQodTY0IGNvZWZmLCBpbnQgaW50X2JpdHMs
IGludA0KPiA+ICtmcmFjX2JpdHMpIHsNCj4gPiArCXM2NCBjID0gQ1RNX0NPRUZGX0FCUyhjb2Vm
Zik7DQo+ID4gKw0KPiA+ICsJLyogbGVhdmUgYW4gZXh0cmEgYml0IGZvciByb3VuZGluZyAqLw0K
PiA+ICsJYyA+Pj0gMzIgLSBmcmFjX2JpdHMgLSAxOw0KPiA+ICsNCj4gPiArCS8qIHJvdW5kIGFu
ZCBkcm9wIHRoZSBleHRyYSBiaXQgKi8NCj4gPiArCWMgPSAoYyArIDEpID4+IDE7DQo+ID4gKw0K
PiA+ICsJaWYgKENUTV9DT0VGRl9ORUdBVElWRShjb2VmZikpDQo+ID4gKwkJYyA9IC1jOw0KPiA+
ICsNCj4gPiArCWMgPSBjbGFtcChjLCAtKHM2NClCSVQoaW50X2JpdHMgKyBmcmFjX2JpdHMgLSAx
KSwNCj4gPiArCQkgIChzNjQpKEJJVChpbnRfYml0cyArIGZyYWNfYml0cyAtIDEpIC0gMSkpOw0K
PiA+ICsNCj4gPiArCXJldHVybiBjICYgKEJJVChpbnRfYml0cyArIGZyYWNfYml0cykgLSAxKTsg
fQ0KPiA+ICsNCj4gPiArLyoNCj4gPiArICogQ0hWIENvbG9yIEdhbXV0IE1hcHBpbmcgKENHTSkg
Q1NDDQo+ID4gKyAqIHxyfCAgIHwgYzAgYzEgYzIgfCAgIHxyfA0KPiA+ICsgKiB8Z3wgPSB8IGMz
IGM0IGM1IHwgeCB8Z3wNCj4gPiArICogfGJ8ICAgfCBjNiBjNyBjOCB8ICAgfGJ8DQo+ID4gKyAq
DQo+ID4gKyAqIENvZWZmaWNpZW50cyBhcmUgdHdvJ3MgY29tcGxlbWVudCBzNC4xMi4NCj4gPiAr
ICovDQo+ID4gIHN0YXRpYyB2b2lkIGNodl9jZ21fY3NjX2NvbnZlcnRfY3RtKGNvbnN0IHN0cnVj
dCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLA0KPiA+ICAJCQkJICAgIHN0cnVjdCBpbnRl
bF9jc2NfbWF0cml4ICpjc2MpICB7DQo+ID4gIAljb25zdCBzdHJ1Y3QgZHJtX2NvbG9yX2N0bSAq
Y3RtID0gY3J0Y19zdGF0ZS0+aHcuY3RtLT5kYXRhOw0KPiA+ICAJaW50IGk7DQo+ID4NCj4gPiAt
CWZvciAoaSA9IDA7IGkgPCA5OyBpKyspIHsNCj4gPiAtCQl1NjQgYWJzX2NvZWZmID0gKCgxVUxM
IDw8IDYzKSAtIDEpICYgY3RtLT5tYXRyaXhbaV07DQo+ID4gLQ0KPiA+IC0JCS8qIFJvdW5kIGNv
ZWZmaWNpZW50LiAqLw0KPiA+IC0JCWFic19jb2VmZiArPSAxIDw8ICgzMiAtIDEzKTsNCj4gPiAt
CQkvKiBDbGFtcCB0byBoYXJkd2FyZSBsaW1pdHMuICovDQo+ID4gLQkJYWJzX2NvZWZmID0gY2xh
bXBfdmFsKGFic19jb2VmZiwgMCwgQ1RNX0NPRUZGXzhfMCAtIDEpOw0KPiA+IC0NCj4gPiAtCQlj
c2MtPmNvZWZmW2ldID0gMDsNCj4gPiAtDQo+ID4gLQkJLyogV3JpdGUgY29lZmZpY2llbnRzIGlu
IFMzLjEyIGZvcm1hdC4gKi8NCj4gPiAtCQlpZiAoY3RtLT5tYXRyaXhbaV0gJiAoMVVMTCA8PCA2
MykpDQo+ID4gLQkJCWNzYy0+Y29lZmZbaV0gfD0gMSA8PCAxNTsNCj4gPiAtDQo+ID4gLQkJY3Nj
LT5jb2VmZltpXSB8PSAoKGFic19jb2VmZiA+PiAzMikgJiA3KSA8PCAxMjsNCj4gPiAtCQljc2Mt
PmNvZWZmW2ldIHw9IChhYnNfY29lZmYgPj4gMjApICYgMHhmZmY7DQo+ID4gLQl9DQo+ID4gKwlm
b3IgKGkgPSAwOyBpIDwgOTsgaSsrKQ0KPiA+ICsJCWNzYy0+Y29lZmZbaV0gPSBjdG1fdG9fdHdv
c19jb21wbGVtZW50KGN0bS0+bWF0cml4W2ldLCA0LCAxMik7DQo+ID4gIH0NCj4gPg0KPiA+ICBz
dGF0aWMgdm9pZCBjaHZfbG9hZF9jZ21fY3NjKHN0cnVjdCBpbnRlbF9jcnRjICpjcnRjLA0KPiA+
IC0tDQo+ID4gMi4zOS4yDQoNCg==
