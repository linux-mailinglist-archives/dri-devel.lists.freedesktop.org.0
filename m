Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6913853B3D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 20:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ED810E8FC;
	Tue, 13 Feb 2024 19:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8S0V7EI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95E310E8FE;
 Tue, 13 Feb 2024 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707853094; x=1739389094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5RKQF0PJQhTMOR6zqJjOEAN0Bzbn8Zu5ReJImUxjSM0=;
 b=E8S0V7EI0INqdT302sbiT9bZkVfqEmhjxnZGi6ezZsOcCpT2EULrBOPo
 Xn9vLUMK/KWjdZBiaHza3Bm4g50AQR2OpX2JznJVXDmOcCiQK8E79FCQ7
 ANmkjaOZBr4d1VEgVosaB5yamhfp/KrzojQZMWkVUc5j3LZcW2hMgi+3K
 Gvphy3j42HFdMzxHfJXh/tPymmeD5PeoRH6zePRoVWwTOv1Co6yhvjVmm
 KF+mqhGe1h/Hmv1WWHY+JM+OS7J/M0Bl0wl0b6sAprHz+7v9axxFJEWni
 P82PrqXehd1MtQwOa/pypI+l9Lhd+/Qi0xgBqluyZRyhdbgdJN/x3B+Mk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="4846394"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="4846394"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 11:38:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3328079"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 11:38:13 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 11:38:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 11:38:12 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 11:38:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tn2ozeFNvnSNcX/oLUNeovlQ82bu9vf5bZ4nVhLUT4nHKxhelilZV40BcFWYHi5AHrX4OQHEaeOrT//HrNNVKMmFIJso0AKUyqkiRbclrv3tzOJ4EpTBn18dzyvuEYkDfV7DVTve0rt6wxoL9sUNbMeEaXEeUHz1bs+NYEyTuMUDZZWCSw8Wxl9VqI/bWgXI1Bw+Z3NKASI1w50mlGqRihfLFFzhRZnG9C7UG/0G3FzD/CBKrKMGw83wW8rvzKttdL1Q71G+zo09BAtJgzrKwyFaDedrLC9kX3GULy1yXm+GpwDM6YwujKBi7wp/OAtevDSOpwhxlGipUIuSTXIdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RKQF0PJQhTMOR6zqJjOEAN0Bzbn8Zu5ReJImUxjSM0=;
 b=ma1R1JCmj0pcqUED9ZDGOM0cLYGSKvYxrDDVH+5E/vvZn8Uhx9gLXfBil24Gwqh0d9RdDOPOl6EMsj2SuYctxg7mU7o25MXhnXda7HqljDEFKEr+Y/jqNiUmt3IQQhgSpYXuTmef7uUNqil345rLnEUnjCQI28+GMQp0y/njP2j7UxLqTAFVEZRwIG2QkVv0GkdY1TLjWhqAPnhDfR70skaaqa17FlHdJGMI4L8Zn1Ty6SBjKzqqmrDgq6w9oU/5QbTDZo3BJvNopEyBbHCjfbqo7i6rkcORU2O6CijuPaQD6etqgcP4dQtiPKeS+bsT006y4oH9qNBafGCRMdGPNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 19:38:09 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 19:38:09 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
CC: "kenneth@whitecape.org" <kenneth@whitecape.org>, "Zanoni, Paulo R"
 <paulo.r.zanoni@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "Ghuge, Sagar" <sagar.ghuge@intel.com>
Subject: Re: [PATCH v2] drm/i915: Add GuC submission interface version query
Thread-Topic: [PATCH v2] drm/i915: Add GuC submission interface version query
Thread-Index: AQHaWmhhgwFANVHU4kmlLC0PYFc33rEAgdiAgAAIDQCAAAWcAIAAK8oAgAD+WwCABvnfgA==
Date: Tue, 13 Feb 2024 19:38:09 +0000
Message-ID: <3a475197da9820f2f26e8ec095133188f6b8997e.camel@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
 <20240208082510.1363268-1-tvrtko.ursulin@linux.intel.com>
 <8a0a964cc1312e5fcccf0850d72e6374bb578943.camel@intel.com>
 <db762e07-a5e1-4c47-b1b6-85742ce6498b@linux.intel.com>
 <5daf0215abaf92d9b34fef732d1be010d59bd69c.camel@intel.com>
 <0c282ce6fd922ef2cad2bbf84b51214bb66a0411.camel@intel.com>
 <fbc915a2-5fc2-4a4b-adf7-ade2f5ceffa6@linux.intel.com>
In-Reply-To: <fbc915a2-5fc2-4a4b-adf7-ade2f5ceffa6@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SN7PR11MB7512:EE_
x-ms-office365-filtering-correlation-id: 8221612e-df0a-4354-c075-08dc2ccb4f0c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2jBsRkGdvc3IvZ9LaDEPlZkOsV2SSNzVqqeU5IBWDjcGEsK8Z8cTj1JyEdkU++1glmZpt+wTtIPQfuZ0RJL1i7/TQyT8/pInXOzguC+4WnkQ/MAWLkqe6WnB+rYQaSJ0f4DYBsE9rGD1tvFUsg8v6RwRV7Z77Z34S6nIkKKLolIk5WaOyodRkD00QssR7g7nQUOkwxCCNfk6Qt1DJhBeIVYY9se2Wbze0K/6aeAnvwk6iUQIlRXPIH16kECsbLurKlZttA4ageOl66HxnE+GirOj3wJ/wWLNO7/WWMf9yQK6nDJxwHFKJPDRDsPZPz9JLBt3ksTGDK+YC4+EQEkRiWWxHsWEb6ykTcZWxgKBzJdcxgNAVs84RjC2wPLEMJC3OU0EvqESg2GouXe2JxOxMr6tRI/6kHLjawTX+0GtgmvgziXlfsO01mjenIfcMyZWbgv9pVGvxhz9c52bml8Hj7eX5QvdC7HpCWoFyljPGLq02JrfYxxLUL1eqkoIujjDtAmt15tcHBw/PORy29YXwlwvDAUitACI0/AKm7qqTrbWevN4i3vQtIx6pzZ0n/DDFzanMigXXvCviP8BQhnyNPV1tZABECuiR6tjsE6+fNg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(82960400001)(26005)(41300700001)(2616005)(83380400001)(122000001)(38100700002)(4326008)(66446008)(478600001)(64756008)(66556008)(66946007)(66476007)(8676002)(8936002)(76116006)(5660300002)(2906002)(966005)(53546011)(6486002)(6506007)(6512007)(316002)(110136005)(54906003)(36756003)(38070700009)(71200400001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFhDYnZxb0JQVzB5UllzNTRzOTNQdENtVWJrV3FibXYyZCtjU3lkb0d2bThL?=
 =?utf-8?B?NERLSkw3azBrc3ZuQjdmK2dkU3NGMnovUCtuc0hyaUVxN3dsTWpubk5iL09q?=
 =?utf-8?B?ZXNmZENocTdKUitLZFk5NUpVanlPdjY2WlVIdldHbzN3dDFKaHJqejRXUWlI?=
 =?utf-8?B?cUo3d2o3U2VraWZnbkNDN3JBQjc3OTVRVjVmc2M5RXJ1a09lV3ZsTTVER3dt?=
 =?utf-8?B?Y3hFaFJielNzdjFzZnBIRUtFVlp5OU5Nb2NZNkpEWmpybmNGU0dPektBV2VI?=
 =?utf-8?B?UUx6K2NDMEhYamRicHcxU1BPSGtSZXkwaGMyOHJtYlI3U3g4d1puK0EvRHV5?=
 =?utf-8?B?bGZtWHh2MDkya3VKSjUrcENZL0lGa1NISklDZXhZS0xRTXVNNVVDdDU4VVl3?=
 =?utf-8?B?blZGYmVqTlV3NnY2ZGtRR2VGdkVjcXUzZlh5SHV0cjMrYUpDTWNBaWtrNW51?=
 =?utf-8?B?dlBCd1RVZy9yK3F1Tk4rZmtTZlh0N1lwc3R4RlFaOEpId0toYjN1OEtVY2wy?=
 =?utf-8?B?OU9TTG01dEltV1lFSkF5dC9SMWcvQTBxNjN6MmxxalVSNzdSL1pGbS9RNERk?=
 =?utf-8?B?U0RUN3ZsRkpRbFU0MDdWVU1oQ2ZjalpHcDY5WnZWN3JiN0Rvb2dvWkFhVGx0?=
 =?utf-8?B?QzQ5VGszVVB2ZXBKaDVDUTFmRkVieUtBNGxuN3lWL0VIU3FNbWVWTEJETjRY?=
 =?utf-8?B?RlhMeFhnMVdNUm9lUjRMemd4Mm0rYmVhaXJ4SHNVKzQ1V3ZsVzhNMzI1bnFP?=
 =?utf-8?B?aVFBUXU4RUo5NUV1YURSdm9ybW1jb0UrQksrOUtFaCtaZ2ZlN1F6OTJqRGNT?=
 =?utf-8?B?QUdmdksvVHJrUUVxdi9QNjBhTktuN0tBNStmelhOYTZkRWs0YklpZWFsM0JW?=
 =?utf-8?B?Z3p6WUZLV3ZFUVNicGduWXE0UzNYd2lhTUN2YzlMR1l3aTNNQXZtTlBJcmhq?=
 =?utf-8?B?M3BKbEU2UDFjeng4WXBXZFZVY0pZbzhKdUhLZzFCOTFFK055RS85UGJzaEl6?=
 =?utf-8?B?WEVBbWhjbnNBSjRVdW53S0xUOFVWaEo3S1lteU9yR2FIVVdMaGRjU0c1L1Zx?=
 =?utf-8?B?Uk5iVEszeGhNaU5jRU55aHBncXhLNU9RU0MyYWtwRkhPQ2NYK0drR0swa1pz?=
 =?utf-8?B?ZjBoazJ2RnNnMFo0Sjl3ZGlYT1Urc2Q0RjJGVXgzelJTWjg4SnlzMVRZd2s2?=
 =?utf-8?B?a21RN0U3bHhKWHhsYWRNUTFIWG8yMmtsRTJFTC8yZS83SmZ4LzFCdXRFMG8x?=
 =?utf-8?B?dHhGMzljN3JxRWhDTC9kZVl4ajRXZitqcGhKOG9NNFpKbmU3dnVFWk9zUFFa?=
 =?utf-8?B?bGZYY0JESmJ6Tlo2VjUyNlNyMzNrbHBDZFIyODdyVGVud05lQnFlNE1OTnpj?=
 =?utf-8?B?TzV3M29hTzFyMGJqUDBlQzdQSCt2TFJ5VisyalFaQVh0MVllZW51Z1YvUHlL?=
 =?utf-8?B?aEpaL1ovQ3M2NXFLc3BlTzNoa2N6UjNOVzF3ZzBJd25YZHl4dHovWlVZSHZo?=
 =?utf-8?B?YTFmVngxMXhNUHNvb1ZMVzFsOW83RFN4eDBweXVrOHdCeEd1U3hrajNCYUxm?=
 =?utf-8?B?ck9VQUNSSTJyUWRSUk8xT2dYV3JxdzBkUWJzdi92RVpMbEE3d0FDSnpnZSs4?=
 =?utf-8?B?a0U2UzR0QVM4M1FyN21OQzlHRW04Si9jSEd6Tk1XMWJ5ODE3bkw3bldKdVZh?=
 =?utf-8?B?VGJnUGhhWUdlSzRuN0Eydmszdm95VTdvTzNUZkQrRkFkYjhMNU5zRjVydmtF?=
 =?utf-8?B?ZmZZWmxVZXZpSWF6QXRwU0xoV0VwMGgyRDR4MGpzTVh1cW1KUFl5VU5vUTls?=
 =?utf-8?B?VkM5N3Y0eE9LM0srT2R2dVEzMkhQK01tZEZyZEdMNzlzQmR1NGp6QjRENU5r?=
 =?utf-8?B?Y1dWZ0xKRW40SDB5emk2a0syeUswWUlncmdNSEZIT0VoSVhtbUdOaG5nK2dG?=
 =?utf-8?B?RTE2TGFNSCtuVzJmOE9Mc3BHbG1pYkt6MC9QQ1h6aGQvS1hLZkF4OEdBWTkr?=
 =?utf-8?B?NVBIc0h4UVhueFJ0U0lseGNSTjBqajFoeXovZzBRQUdEQjFQK2JGT2RqUU0y?=
 =?utf-8?B?eE5iMkNIcjRObElPaGlWMmU2Q3dwVWJaRFpCaGtpM003dldXUzFZVVV6SThH?=
 =?utf-8?B?alUvWWxjVE9oQzlzR1BMbmNLeTJJVU41MWU4aUZrUVBzY0dpaU9ONTRNUmI2?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B6942B2FADA9D45B153427A1ED028C0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8221612e-df0a-4354-c075-08dc2ccb4f0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 19:38:09.5433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUfq3qPQdF8tv/x8CR5vL2jCragfZvulvSvM8FJWZ8YUsxFmrgDucE2i7fiSH5z6cMwVmSi8SAGtcDHNFvvung==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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

T24gRnJpLCAyMDI0LTAyLTA5IGF0IDA5OjA2ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gT24gMDgvMDIvMjAyNCAxNzo1NSwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gT24gVGh1LCAy
MDI0LTAyLTA4IGF0IDA3OjE5IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIHdyb3RlOg0K
PiA+ID4gT24gVGh1LCAyMDI0LTAyLTA4IGF0IDE0OjU5ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3
cm90ZToNCj4gPiA+ID4gT24gMDgvMDIvMjAyNCAxNDozMCwgU291emEsIEpvc2Ugd3JvdGU6DQo+
ID4gPiA+ID4gT24gVGh1LCAyMDI0LTAyLTA4IGF0IDA4OjI1ICswMDAwLCBUdnJ0a28gVXJzdWxp
biB3cm90ZToNCj4gPiA+ID4gPiA+IEZyb206IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxp
bkBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEFkZCBhIG5ldyBxdWVyeSB0
byB0aGUgR3VDIHN1Ym1pc3Npb24gaW50ZXJmYWNlIHZlcnNpb24uDQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IE1lc2EgaW50ZW5kcyB0byB1c2UgdGhpcyBpbmZvcm1hdGlvbiB0byBjaGVjayBm
b3Igb2xkIGZpcm13YXJlIHZlcnNpb25zDQo+ID4gPiA+ID4gPiB3aXRoIGEga25vd24gYnVnIHdo
ZXJlIHVzaW5nIHRoZSByZW5kZXIgYW5kIGNvbXB1dGUgY29tbWFuZCBzdHJlYW1lcnMNCj4gPiA+
ID4gPiA+IHNpbXVsdGFuZW91c2x5IGNhbiBjYXVzZSBHUFUgaGFuZ3MgZHVlIGlzc3VlcyBpbiBm
aXJtd2FyZSBzY2hlZHVsaW5nLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBCYXNlZCBvbiBw
YXRjaGVzIGZyb20gVml2YWlrIGFuZCBKb29uYXMuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
IENvbXBpbGUgdGVzdGVkIG9ubHkuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IHYyOg0KPiA+
ID4gPiA+ID4gICAgKiBBZGRlZCBicmFuY2ggdmVyc2lvbi4NCj4gPiA+ID4gPiANCj4gPiA+ID4g
PiBSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5j
b20+DQo+ID4gPiA+ID4gVGVzdGVkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4NCj4gPiA+ID4gPiBVTUQ6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8yNTIzMw0KPiA+ID4gPiANCj4gPiA+ID4g
VGhhbmtzLCBidXQgcGxlYXNlIHdlIGFsc28gbmVlZCB0byBjbG9zZSBkb3duIG9uIHRoZSBicmFu
Y2ggbnVtYmVyDQo+ID4gPiA+IHNpdHVhdGlvbi4gSS5lLiBiZSBzdXJlIHdoYXQgaXMgdGhlIGZh
aWx1cmUgbW9kZSBpbiBzaGlwcGluZyBNZXNhIHdpdGgNCj4gPiA+ID4gdGhlIGNoYW5nZSBhcyBp
dCBzdGFuZHMgaW4gdGhlIE1SIGxpbmtlZC4gV2hhdCBwbGF0Zm9ybXMgY291bGQgc3RhcnQNCj4g
PiA+ID4gZmFpbGluZyBhbmQgd2hlbiwgZGVwZW5kaW5nIG9uIEd1QyBGVyByZWxlYXNlIGV2ZW50
dWFsaXRpZXMuDQo+ID4gPiANCj4gPiA+IHllcywgSSBoYXZlIGFza2VkIEpvaG4gSGFycmlzb24g
Zm9yIGEgZG9jdW1lbnRhdGlvbiBsaW5rIGFib3V0IHRoZSBmaXJtd2FyZSB2ZXJzaW9uaW5nLg0K
PiA+IA0KPiA+IEdvdCB0aGUgZG9jdW1lbnRhdGlvbiBsaW5rLCBNUiB1cGRhdGVkLg0KPiA+IFdp
bGwgYXNrIGZvciByZXZpZXdzIGluIE1lc2Egc2lkZS4NCj4gDQo+IElzIGl0IHRoZW4gdW5kZXJz
dG9vZCBhbmQgYWNjZXB0ZWQgdGhhdCBzaG91bGQgR3VDIGV2ZXIgdXBkYXRlIHRoZSANCj4gYnJh
bmNoIG51bWJlciBvbiBhbnkgZ2l2ZW4gcGxhdGZvcm0sIHRoYXQgcGxhdGZvcm0sIGZvciBhbGwg
ZGVwbG95ZWQgDQo+IE1lc2EncyBpbiB0aGUgZmllbGQsIHdpbGwgYXV0b21hdGljYWxseSByZXZl
cnQgdG8gbm8gYXN5bmMgcXVldWVzIGFuZCBzbyANCj4gY2F1c2UgYSBzaWxlbnQgcGVyZm9ybWFu
Y2UgcmVncmVzc2lvbj8NCg0KeWVzLCB1bmRlcnN0b29kIGFuZCBhY2NlcHRlZC4NClRoZSBNZXNh
IE1SIGlzIG5vdyByZXZpZXdlZCwgdGhhbmsgeW91IFNhZ2FyLg0KDQo+IA0KPiBSZWdhcmRzLA0K
PiANCj4gVHZydGtvDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBSZWdhcmRz
LA0KPiA+ID4gPiANCj4gPiA+ID4gVHZydGtvDQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4gPiA+
ID4gPiA+IENjOiBLZW5uZXRoIEdyYXVua2UgPGtlbm5ldGhAd2hpdGVjYXBlLm9yZz4NCj4gPiA+
ID4gPiA+IENjOiBKb3NlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+
IENjOiBTYWdhciBHaHVnZSA8c2FnYXIuZ2h1Z2VAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gQ2M6
IFBhdWxvIFphbm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gQ2M6
IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4gPiA+ID4gPiBD
YzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gQ2M6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiBDYzogVHZy
dGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IENjOiBW
aXZhaWsgQmFsYXN1YnJhd21hbmlhbiA8dml2YWlrLmJhbGFzdWJyYXdtYW5pYW5AaW50ZWwuY29t
Pg0KPiA+ID4gPiA+ID4gQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4
LmludGVsLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gICAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9xdWVyeS5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ID4gPiA+ID4gICAgaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oICAgICAgIHwgMTIg
KysrKysrKysrKysNCj4gPiA+ID4gPiA+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9u
cygrKQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9xdWVyeS5j
DQo+ID4gPiA+ID4gPiBpbmRleCAwMDg3MWVmOTk3OTIuLmQ0ZGJhMTI0MGI0MCAxMDA2NDQNCj4g
PiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcXVlcnkuYw0KPiA+ID4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9xdWVyeS5jDQo+ID4gPiA+ID4g
PiBAQCAtNTUxLDYgKzU1MSwzOCBAQCBzdGF0aWMgaW50IHF1ZXJ5X2h3Y29uZmlnX2Jsb2Ioc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUsDQo+ID4gPiA+ID4gPiAgICAJcmV0dXJuIGh3Y29u
ZmlnLT5zaXplOw0KPiA+ID4gPiA+ID4gICAgfQ0KPiA+ID4gPiA+ID4gICAgDQo+ID4gPiA+ID4g
PiArc3RhdGljIGludA0KPiA+ID4gPiA+ID4gK3F1ZXJ5X2d1Y19zdWJtaXNzaW9uX3ZlcnNpb24o
c3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUsDQo+ID4gPiA+ID4gPiArCQkJICAgICBzdHJ1
Y3QgZHJtX2k5MTVfcXVlcnlfaXRlbSAqcXVlcnkpDQo+ID4gPiA+ID4gPiArew0KPiA+ID4gPiA+
ID4gKwlzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfZ3VjX3N1Ym1pc3Npb25fdmVyc2lvbiBfX3VzZXIg
KnF1ZXJ5X3B0ciA9DQo+ID4gPiA+ID4gPiArCQkJCQkgICAgdTY0X3RvX3VzZXJfcHRyKHF1ZXJ5
LT5kYXRhX3B0cik7DQo+ID4gPiA+ID4gPiArCXN0cnVjdCBkcm1faTkxNV9xdWVyeV9ndWNfc3Vi
bWlzc2lvbl92ZXJzaW9uIHZlcjsNCj4gPiA+ID4gPiA+ICsJc3RydWN0IGludGVsX2d1YyAqZ3Vj
ID0gJnRvX2d0KGk5MTUpLT51Yy5ndWM7DQo+ID4gPiA+ID4gPiArCWNvbnN0IHNpemVfdCBzaXpl
ID0gc2l6ZW9mKHZlcik7DQo+ID4gPiA+ID4gPiArCWludCByZXQ7DQo+ID4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gPiArCWlmICghaW50ZWxfdWNfdXNlc19ndWNfc3VibWlzc2lvbigmdG9fZ3QoaTkx
NSktPnVjKSkNCj4gPiA+ID4gPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ID4gKwlyZXQgPSBjb3B5X3F1ZXJ5X2l0ZW0oJnZlciwgc2l6ZSwgc2l6ZSwgcXVl
cnkpOw0KPiA+ID4gPiA+ID4gKwlpZiAocmV0ICE9IDApDQo+ID4gPiA+ID4gPiArCQlyZXR1cm4g
cmV0Ow0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKwlpZiAodmVyLmJyYW5jaCB8fCB2ZXIu
bWFqb3IgfHwgdmVyLm1pbm9yIHx8IHZlci5wYXRjaCkNCj4gPiA+ID4gPiA+ICsJCXJldHVybiAt
RUlOVkFMOw0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKwl2ZXIuYnJhbmNoID0gMDsNCj4g
PiA+ID4gPiA+ICsJdmVyLm1ham9yID0gZ3VjLT5zdWJtaXNzaW9uX3ZlcnNpb24ubWFqb3I7DQo+
ID4gPiA+ID4gPiArCXZlci5taW5vciA9IGd1Yy0+c3VibWlzc2lvbl92ZXJzaW9uLm1pbm9yOw0K
PiA+ID4gPiA+ID4gKwl2ZXIucGF0Y2ggPSBndWMtPnN1Ym1pc3Npb25fdmVyc2lvbi5wYXRjaDsN
Cj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsJaWYgKGNvcHlfdG9fdXNlcihxdWVyeV9wdHIs
ICZ2ZXIsIHNpemUpKQ0KPiA+ID4gPiA+ID4gKwkJcmV0dXJuIC1FRkFVTFQ7DQo+ID4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gPiArCXJldHVybiAwOw0KPiA+ID4gPiA+ID4gK30NCj4gPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiA+ICAgIHN0YXRpYyBpbnQgKCogY29uc3QgaTkxNV9xdWVyeV9mdW5jc1td
KShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsDQo+ID4gPiA+ID4gPiAgICAJCQkJ
CXN0cnVjdCBkcm1faTkxNV9xdWVyeV9pdGVtICpxdWVyeV9pdGVtKSA9IHsNCj4gPiA+ID4gPiA+
ICAgIAlxdWVyeV90b3BvbG9neV9pbmZvLA0KPiA+ID4gPiA+ID4gQEAgLTU1OSw2ICs1OTEsNyBA
QCBzdGF0aWMgaW50ICgqIGNvbnN0IGk5MTVfcXVlcnlfZnVuY3NbXSkoc3RydWN0IGRybV9pOTE1
X3ByaXZhdGUgKmRldl9wcml2LA0KPiA+ID4gPiA+ID4gICAgCXF1ZXJ5X21lbXJlZ2lvbl9pbmZv
LA0KPiA+ID4gPiA+ID4gICAgCXF1ZXJ5X2h3Y29uZmlnX2Jsb2IsDQo+ID4gPiA+ID4gPiAgICAJ
cXVlcnlfZ2VvbWV0cnlfc3Vic2xpY2VzLA0KPiA+ID4gPiA+ID4gKwlxdWVyeV9ndWNfc3VibWlz
c2lvbl92ZXJzaW9uLA0KPiA+ID4gPiA+ID4gICAgfTsNCj4gPiA+ID4gPiA+ICAgIA0KPiA+ID4g
PiA+ID4gICAgaW50IGk5MTVfcXVlcnlfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlKQ0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0u
aA0KPiA+ID4gPiA+ID4gaW5kZXggNTUwYzQ5NmNlNzZkLi44NGZiN2Y3ZWE4MzQgMTAwNjQ0DQo+
ID4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2k5MTVfZHJtLmgNCj4gPiA+ID4gPiA+
ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaA0KPiA+ID4gPiA+ID4gQEAgLTMwMzgs
NiArMzAzOCw3IEBAIHN0cnVjdCBkcm1faTkxNV9xdWVyeV9pdGVtIHsNCj4gPiA+ID4gPiA+ICAg
IAkgKiAgLSAlRFJNX0k5MTVfUVVFUllfTUVNT1JZX1JFR0lPTlMgKHNlZSBzdHJ1Y3QgZHJtX2k5
MTVfcXVlcnlfbWVtb3J5X3JlZ2lvbnMpDQo+ID4gPiA+ID4gPiAgICAJICogIC0gJURSTV9JOTE1
X1FVRVJZX0hXQ09ORklHX0JMT0IgKHNlZSBgR3VDIEhXQ09ORklHIGJsb2IgdUFQSWApDQo+ID4g
PiA+ID4gPiAgICAJICogIC0gJURSTV9JOTE1X1FVRVJZX0dFT01FVFJZX1NVQlNMSUNFUyAoc2Vl
IHN0cnVjdCBkcm1faTkxNV9xdWVyeV90b3BvbG9neV9pbmZvKQ0KPiA+ID4gPiA+ID4gKwkgKiAg
LSAlRFJNX0k5MTVfUVVFUllfR1VDX1NVQk1JU1NJT05fVkVSU0lPTiAoc2VlIHN0cnVjdCBkcm1f
aTkxNV9xdWVyeV9ndWNfc3VibWlzc2lvbl92ZXJzaW9uKQ0KPiA+ID4gPiA+ID4gICAgCSAqLw0K
PiA+ID4gPiA+ID4gICAgCV9fdTY0IHF1ZXJ5X2lkOw0KPiA+ID4gPiA+ID4gICAgI2RlZmluZSBE
Uk1fSTkxNV9RVUVSWV9UT1BPTE9HWV9JTkZPCQkxDQo+ID4gPiA+ID4gPiBAQCAtMzA0Niw2ICsz
MDQ3LDcgQEAgc3RydWN0IGRybV9pOTE1X3F1ZXJ5X2l0ZW0gew0KPiA+ID4gPiA+ID4gICAgI2Rl
ZmluZSBEUk1fSTkxNV9RVUVSWV9NRU1PUllfUkVHSU9OUwkJNA0KPiA+ID4gPiA+ID4gICAgI2Rl
ZmluZSBEUk1fSTkxNV9RVUVSWV9IV0NPTkZJR19CTE9CCQk1DQo+ID4gPiA+ID4gPiAgICAjZGVm
aW5lIERSTV9JOTE1X1FVRVJZX0dFT01FVFJZX1NVQlNMSUNFUwk2DQo+ID4gPiA+ID4gPiArI2Rl
ZmluZSBEUk1fSTkxNV9RVUVSWV9HVUNfU1VCTUlTU0lPTl9WRVJTSU9OCTcNCj4gPiA+ID4gPiA+
ICAgIC8qIE11c3QgYmUga2VwdCBjb21wYWN0IC0tIG5vIGhvbGVzIGFuZCB3ZWxsIGRvY3VtZW50
ZWQgKi8NCj4gPiA+ID4gPiA+ICAgIA0KPiA+ID4gPiA+ID4gICAgCS8qKg0KPiA+ID4gPiA+ID4g
QEAgLTM1OTEsNiArMzU5MywxNiBAQCBzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfbWVtb3J5X3JlZ2lv
bnMgew0KPiA+ID4gPiA+ID4gICAgCXN0cnVjdCBkcm1faTkxNV9tZW1vcnlfcmVnaW9uX2luZm8g
cmVnaW9uc1tdOw0KPiA+ID4gPiA+ID4gICAgfTsNCj4gPiA+ID4gPiA+ICAgIA0KPiA+ID4gPiA+
ID4gKy8qKg0KPiA+ID4gPiA+ID4gKyogc3RydWN0IGRybV9pOTE1X3F1ZXJ5X2d1Y19zdWJtaXNz
aW9uX3ZlcnNpb24gLSBxdWVyeSBHdUMgc3VibWlzc2lvbiBpbnRlcmZhY2UgdmVyc2lvbg0KPiA+
ID4gPiA+ID4gKyovDQo+ID4gPiA+ID4gPiArc3RydWN0IGRybV9pOTE1X3F1ZXJ5X2d1Y19zdWJt
aXNzaW9uX3ZlcnNpb24gew0KPiA+ID4gPiA+ID4gKwlfX3UzMiBicmFuY2g7DQo+ID4gPiA+ID4g
PiArCV9fdTMyIG1ham9yOw0KPiA+ID4gPiA+ID4gKwlfX3UzMiBtaW5vcjsNCj4gPiA+ID4gPiA+
ICsJX191MzIgcGF0Y2g7DQo+ID4gPiA+ID4gPiArfTsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4g
PiA+ICAgIC8qKg0KPiA+ID4gPiA+ID4gICAgICogRE9DOiBHdUMgSFdDT05GSUcgYmxvYiB1QVBJ
DQo+ID4gPiA+ID4gPiAgICAgKg0KPiA+ID4gPiA+IA0KPiA+ID4gDQo+ID4gDQoNCg==
