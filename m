Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5758D146
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 02:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADFEAFC04;
	Tue,  9 Aug 2022 00:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6250FAFBC8;
 Tue,  9 Aug 2022 00:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660004119; x=1691540119;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HGcBnXj4y5TmjbiQ2T7e5zBwuh5JnzuyphmQ649LvHg=;
 b=Cpxla8GlQE8VAx4yev/HaU2Pab1pPcv/C0XMU2DfJenpBW3E8iwH32Qz
 LZpSxwYjrMsZlGyCRX/Ma5aKdPG2/q5PdlI2FTbc/uPz6ocRfF4Jpn3tB
 vQ0p8xL7oSsSMSz6acvB+iTVCzTVLkTdVaUVF2sgNaj3VmCKKqt4ZA5TW
 bwQtXqviJUojDoejURfs1aR3Prj8ifagKAQ4lAzGCWJRKwhNiikf0aM0B
 E/3POP93oSy6zJTkcgXshK4Ae0f6oEh6aSyQE4QiWdxXGlsDCB7/dejwN
 oVPeybPH+TDjG0Z0Ajhp0IhN6ngstYc5b4FUsEDyJXcPIDx96jycJID6G Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="291957907"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="291957907"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 17:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="780678407"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 08 Aug 2022 17:15:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 17:15:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 17:15:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 17:15:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 8 Aug 2022 17:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeCkzhi+pvT/A/RI7/u3HhPTRBkptW5cyFWx+bHrJWbqRx5lHYaD66PqYgje+BOMj7S90PV47f05k6OezKm42OUDVlupj8g4QuOK+dU/Hsf5fe9g9yjsuIbcSK9QOJeVmTwvxHMqzYds7XmmjViBNS8pSkBCwa36LS69SeCHjZDoeClfDUYEtFX3gz4GZqEAqtvDnrVRTa6d1WzXIzKEbIDJzBFEOijGG9nHQX7JQV6549A3Du8As5+mDkPjrCbDMjW9tSIHu3nagoBGA6D7SpG1rkZ0n2huVHDLIADLlSlh9DKsgkAC+X3TXtHu2heGSnEw21rilSo4ZZlw282E6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGcBnXj4y5TmjbiQ2T7e5zBwuh5JnzuyphmQ649LvHg=;
 b=H09w0KUcyz0wNtaXfYb8ZY1cSIX/rGc+KEltKT6kvTb6jukSSMIled/i23DbH3kPcT+V8OTTPNWH2HD9BMToeBoZ9CqMom/QJRZfl/QHkBwSA5ob2L3MaJlJSrZsE1F45MwLVgm7Ya4aANKtwFIaxBEzJpbo5LZf1UPjTIDbAKB7+rBpVoWQNzPcEmH/n4ZykwJyaH6XmLz6XcjYjYKCTJBKl3XJ2FI6RD1bx7+QRNxoDrFlK17MxsLtr5zCkBv8DsKLU+pcLvfZXa9pOnHaRw4jBeJeiQqNGK4cEGdseirhiRVjsL4cH+Nad9ebgxnjH3t94Ur837F3u2RToQyK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 9 Aug
 2022 00:15:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 00:15:15 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/3] drm/i915: pass a pointer for tlb seqno
 at vma_invalidate_tlb()
Thread-Topic: [Intel-gfx] [PATCH v3 1/3] drm/i915: pass a pointer for tlb
 seqno at vma_invalidate_tlb()
Thread-Index: AQHYp9UVl6cWfqIYUEmmhJorqvqxd62lOsQAgAAo3YCAAEShgIAAEkOA
Date: Tue, 9 Aug 2022 00:15:14 +0000
Message-ID: <aabd5eff13bde62966ca9ad2a483978e4557c55f.camel@intel.com>
References: <cover.1659598090.git.mchehab@kernel.org>
 <f9550e6bacea10131ff40dd8981b69eb9251cdcd.1659598090.git.mchehab@kernel.org>
 <YvE75o0uOtDGayNK@alfio.lan> <YvFeLbUcC6yiCL5G@intel.com>
 <YvGXv5td47ky+CnY@alfio.lan>
In-Reply-To: <YvGXv5td47ky+CnY@alfio.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43b135f7-58cb-470a-5309-08da799c3b89
x-ms-traffictypediagnostic: DM5PR11MB1914:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eYGI49tzYFo9VkpLc8gRG9sllTmpUcq3cbUb1+YwFOjq65Qji2/yCoKO82T7tFP6et3g7u9OkP/LCfdsRDXcYU3UQaleZVvSC4W0QKRyUZxgi3hUW9tnTEjMNdcZWqqlDLlXaeZXA2gee8hjfJ4Qlvdan75oCBWidOZQHJuc7OeJLi75f/ttYpYvg5lcmcjcCRlPyOQ2v/mAeMHrUVlDEyOAaUjyMoLhJJwwv1K3+nR33t2hBM9dpSDNsY+nMl2VOBr33WdvStrrczhQB9tMxdfpbC+Nfsx+bHq58VfzMWFg2amul/fCwMzikw4zD/wVAW6//tNqBOP3i7v1sfR4kOWp2+/9KqqZw5yo/x1L5UHgWyJOKoNPGH4Ebd7whMvl5K77fvVwP3u+R5v3BF+LCXov//hhWnyrQ2BJdEZEpASkEd4DwVsf7N1JgoqRX872C78EBwvroemPa2is69heO8eUf62x91mAr6Z/LQHDSL9J6QzsgYjcA6MF+xml0nz/ivsdIkA2exUsjZKInynwIWmPJKu4rj7mK+h51AWNs58MFaxttGWIhKr9q1g8+yH29U/4MUhohF+5+3b2Vher5GnazNqAhpoNIHuI4DJRBNG7H35lEcPgUb8+MlXPbygQylfoPjVGHqwaoBIq8Q2SRsBucKJxvBQfZIcaTHf/0Pc8SIIGsp1lllJtbJJb5dsPxsGtBCjtiOm5ETMxc+BXOGIc49VK+B3Bg+sG5UzJ/yJFxjq4V5hN443Iko/KQ35EE93Tub0i1yCco+i0BY909TrLmGneWSlHzHYCiZmWQk9/5htXE3CKXa+Yu912aK7V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(39860400002)(376002)(136003)(366004)(38100700002)(91956017)(122000001)(4326008)(76116006)(8936002)(66476007)(66946007)(66556008)(66446008)(64756008)(38070700005)(6916009)(316002)(36756003)(5660300002)(54906003)(8676002)(6512007)(26005)(186003)(86362001)(6486002)(478600001)(2616005)(82960400001)(2906002)(6506007)(83380400001)(71200400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1VtVzhReG9FVEhXaUdZZ1dqU1A5bXBFSmE0YVhiWG8xSkRyMnRNaHlwUmMx?=
 =?utf-8?B?Y2oxQ2JnYTYyNU5EZXlITmlqaWFEamlhb3M3Z1NDdlRNcEdLNU1MUWhWaEF6?=
 =?utf-8?B?Zm5LNktIbFByRXBIenR0R0NWMzdIMk5rYVBWejc0RENhdHZlcW9icTJCbWFz?=
 =?utf-8?B?dUd4YXdCTGwxYXcvRWNRMkxPZktNQURkMkU4bllZNjExUVBqVkZGT1YvMjN1?=
 =?utf-8?B?aUlxTG9jdlNSK1phb0o0cXNUK25KZ3ZRMVVxMlluTGVoaG01bzFaWWhNVGVn?=
 =?utf-8?B?VVdHdU5IVVhSSndob3dQTmJsd1Z4QVozQ1Jwc2NWd0dNd3RlVnJBdkVMTlF3?=
 =?utf-8?B?SUJzcTc0SnpNaGNFTDN4YW1GYUhWVkM2THRxdTBYQVd2amMvdEl1bGMrL3dH?=
 =?utf-8?B?cHlNcFlrZHdyRFR2bWxBRFBxdUtRc2Z5TGx4bjFVaVd6K2k3aG83bDNDL3NR?=
 =?utf-8?B?NUVTU3BldzluY3UrT2RvbTNVTm9GSUZKdkRwU0FGdzh6blE0RTJTMHplSCtr?=
 =?utf-8?B?ZGxSaTA5MjZHSTJ0Q051UGZmcUtCREV6T0FQQ0gwbDRHMkFITHJEaXMxSUxk?=
 =?utf-8?B?eUMxSjdHdlBNUWJOMmdXZHhSNm9kc0VrcVhYN3Rtd1NveXRHYU8vUW02VXBC?=
 =?utf-8?B?K20rK3BmaHJLUi9ZOWRqdkVSYW5lZ1ZybU9xZnRpK0NVRE5hR25Lb3M0eExu?=
 =?utf-8?B?V05QSWJ3RzU4SUo4OURBd2svTFVtSWRkZFpmSkJCVGZoeDVGY0wxbFFiVlVt?=
 =?utf-8?B?YWlyN0dQL3krWmxoTHROMGV6SEFLakZjemZ0OFNVZmNCOXlCL2V0Y1hGOVFz?=
 =?utf-8?B?NkIyZFJuMnY3RThNOFM1aDBpaDFpUGE3dGJXQlJ5amwyVTZrcWV0dVppcGxR?=
 =?utf-8?B?S2J4S0EvN0hXdEVaVzJwR3FVZkV2c2R3MkowMlZaL3FDekhNOGlPMm9HVzdq?=
 =?utf-8?B?cmRhMGNYRXFVMGdZMndIK0xXRk5sYUR5ODhTaFVvb3F0TlA0Q200eDEwV0Qv?=
 =?utf-8?B?cVZ5cmtUNjlXQ0ppWkt2WFV3SDdRVXhWK0grVnJ2NncydWJ2Zms5Q3I0NnFp?=
 =?utf-8?B?UFZHTXFOdmthK3lCMzdObVE0cGNidEpBZnVsU01HbGQva1VUZm9KMER0SjBW?=
 =?utf-8?B?OElwSU0ySjVvZWtyNlEwbGVrNFJac1lGc2NOSTVaQXo2THovbXJPZ2ZDSzBK?=
 =?utf-8?B?UlNRYWpoSXorak9lQ0hGcHhzTFk1cE9LSHkwc1V3ckREM1dWMm12WGhRdTVq?=
 =?utf-8?B?N1JWSTkvVFJZVE42OXZWSG10VG16VjFaMythaTBPSThuRXFOSERlWWhlbzdm?=
 =?utf-8?B?TGlveSsrTmgvQ2JBRVI1R0tJc0NEeXJIbmU5aytkdnVsYmdnVHhVMC9rbzAy?=
 =?utf-8?B?U085Z2I5SnkxT3JyZXNzN2hDdjZvRkx2ZFppMGJBQnFXK1pLYkh1djVXcWtR?=
 =?utf-8?B?TC9UckRsY2Q0TmdreXlpMjFZZVRTWkNhcnltWGxWUG1HTWZzUHBMTmo0SmtQ?=
 =?utf-8?B?eFlrMmp2V0xkWHdram1OOElLdEF0S0NYZ0VyanRNaHQrNVc1TXM3cEVQTlVV?=
 =?utf-8?B?Rk5nTFhCOHhOQklLMG94ejhWd1F1dWdvRW5MNWdDTUJZNXVBdWVJSDlOVEx1?=
 =?utf-8?B?a3FNenFHYVQ1NndkYVdCMFNLeU8xUjZvVnRuOG95RVlhZXRFd2FSNFpDV2Z2?=
 =?utf-8?B?Zm5IZW5vR3NxaDloakdyZy9JQUcxMnRzbUpGdlRsUkE0NjhEeGpEdHlhRGRB?=
 =?utf-8?B?OFR3SWxQc1hOaXp1bHg3SGlMYWJXWW9jTWM5Z0JTeGhhRjhscW5icWdaenUz?=
 =?utf-8?B?dUNkVU04bUxCNkllNFpTTStCcTNUNEN5YmZYdmZXZy9TbjVaOHB3cWlic2hR?=
 =?utf-8?B?VFUwL2EydkJ5eHdVa0lKcU92WUhCOWNkQVRSc0xMQ2tvZ0R5UUxMRmV0RWp3?=
 =?utf-8?B?ZFNxTUl1U3BuVjdmcWkwd3dDWXk0WXR1eGpONVYrTm9iZ2NiaTJOb3RVWjdq?=
 =?utf-8?B?bDk5ak5ybm5ZQlMydFBMQk1lWTAyaW9IZTJHb0FIR1FYVVZtM3R4ZzFWalY3?=
 =?utf-8?B?SzFOYkQvNUhDbWxUdU1Nb2U5OWxuZjFVQ1ljd1phcFVXUld4ckpLVjVneWJH?=
 =?utf-8?B?VUlqQWEwU3laajg2a0JRbGpjZmtkWjBoajBKZEdWQjJmS3V1UGNqY3FBemdD?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEC142614EE1D94C97CBFC4F61DCBCFF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b135f7-58cb-470a-5309-08da799c3b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 00:15:14.6591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+8fImnV4lsuZCV9aTXUS4RQRyoSN2G0TA25x+TIK0KLrTTk3wmC6a5zeh1tCLpoCEA+qkm/jmp1hzE5V/1+sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1914
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Cheng, 
 Michael" <michael.cheng@intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA4LTA5IGF0IDAxOjA5ICswMjAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiBI
aSBSb2RyaWdvLA0KPiANCj4gT24gTW9uLCBBdWcgMDgsIDIwMjIgYXQgMDM6MDQ6MTNQTSAtMDQw
MCwgUm9kcmlnbyBWaXZpIHdyb3RlOg0KPiA+IE9uIE1vbiwgQXVnIDA4LCAyMDIyIGF0IDA2OjM3
OjU4UE0gKzAyMDAsIEFuZGkgU2h5dGkgd3JvdGU6DQo+ID4gPiBIaSBNYXVybywNCj4gPiA+IA0K
PiA+ID4gT24gVGh1LCBBdWcgMDQsIDIwMjIgYXQgMDk6Mzc6MjJBTSArMDIwMCwgTWF1cm8gQ2Fy
dmFsaG8gQ2hlaGFiDQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gV1JJVEVfT05DRSgpIHNob3VsZCBo
YXBwZW4gYXQgdGhlIG9yaWdpbmFsIHZhciwgbm90IG9uIGEgbG9jYWwNCj4gPiA+ID4gY29weSBv
ZiBpdC4NCj4gPiA+ID4gDQo+ID4gPiA+IEZpeGVzOiA1ZDM2YWNiNzE5OGIgKCJkcm0vaTkxNS9n
dDogQmF0Y2ggVExCIGludmFsaWRhdGlvbnMiKQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXVy
byBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4NCj4gPiA+IA0KPiA+ID4gUmV2
aWV3ZWQtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAbGludXguaW50ZWwuY29tPg0KPiA+IA0K
PiA+IFRoYW5rcyBhbmQgcHVzaGVkLi4uDQo+IA0KPiBUaGFua3MhDQo+IA0KPiA+ID4gDQo+ID4g
PiBBcmUgeW91IGdvaW5nIHRvIHNlbmQgaXQgdG8gdGhlIHN0YWJsZSBtYWlsaW5nIGxpc3Q/DQo+
ID4gDQo+ID4gSSBhZGRlZCBjYyBzdGFibGUgd2hpbGUgcHVzaGluZyBhbmQgdGhlIGNoZXJyeS1w
aWNrIHRvIGRybS1pbnRlbC0NCj4gPiBuZXh0LWZpeGVzDQo+ID4gaGFzIHRoZSByaWdodCBzaGEs
IHNvIEknZCBhc3N1bWUgdGhpcyB3b3VsZCBiZSBhdXRvbWFnaWNhbGx5IG5vdy4NCj4gPiBCdXQg
eWVhcCwgaXQgd291bGQgYmUgZ29vZCBpZiBNYXVybyBjYW4gZm9sbG93IHVwIHdoZW5ldmVyIHRo
aXMNCj4gPiBnZXRzDQo+ID4gdG8gTGludXMgdHJlZSBhbmQgR3JlZydzIHNjcmlwdCBzdGFydCB0
byBwb3AgdXAgdGhlIGhlYWRzLXVwDQo+ID4gbWVzc2FnZXMuDQo+IA0KPiBUaGF0J3Mgd2hhdCBJ
IG1lYW50Li4uIGRvZXMgTWF1cm8gbm93IG5lZWQgdG8gc2VuZCB0aGUgZS1tYWlsDQo+IGFnYWlu
IGZvciB0aGUgc3RhYmxlPw0KPiANCj4gSSB0aG91Z2h0IHRoZXJlIHdhcyBzb21lIHN1c3BpY2lv
biB0b3dhcmRzIGUtbWFpbHMgcHVzaGVkIHdpdGhvdXQNCj4gYmVpbmcgZmlyc3Qgc2VudCB0byBi
b3RoIHN0YWJsZSBhbmQgdXBzdHJlYW0gbWFpbGluZyBsaXN0cw0KPiBiZWNhdXNlIHRoZXkgY2Fu
IGdldCBsb3N0IG9yIGZvcmdvdHRlbi4uLiBtYXliZSBJJ20gd3JvbmcuDQoNCkl0IGRvZXNuJ3Qg
aGVscCB0byBzZW5kIG5vdyB0byBzdGFibGUgbWwgYmVjYXVzZSBpdCBjYW4gb25seSBiZSBtZXJn
ZWQNCnRoZXJlIGFmdGVyIGl0IHJlYWNoZXMgdGhlIExpbnVzJyBtYXN0ZXIgdHJlZS4NClJpZ2h0
IG5vdyB3aXRoIHRoZSByaWdodCBmaXhlcyBhbmQgY2M6c3RhYmxlIGl0IHNob3VsZCBiZSBhdXRv
bWF0aWNhbGx5DQphbmQgaGUgc2hvdWxkbid0IHdvcnJ5Lg0KQnV0IGluIGNhc2UgaGUgbm90aWNl
cyB0aGF0IHRoZSBmaXJzdCBwYXRjaCBnb3QgaW4gYnV0IHRoZSBzZWNvbmQNCmRpZG4ndCB0aGVu
IGl0IGlzIHdoZW4gd2Ugc2VuZCB0aGUgcGF0Y2ggZGlyZWN0bHkgdG8gdGhlIHN0YWJsZSBtbC4N
Cg0KDQo+IA0KPiBBbmRpDQo+IA0KPiA+IFRoYW5rcywNCj4gPiBSb2RyaWdvLg0KPiA+IA0KPiA+
ID4gDQo+ID4gPiBBbmRpDQoNCg==
