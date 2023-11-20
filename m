Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AB87F0BC4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 07:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCC010E07B;
	Mon, 20 Nov 2023 06:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E4D10E07B;
 Mon, 20 Nov 2023 06:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700460542; x=1731996542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LDhAn0inSqiMfJBUC4wTo5vMOqTqW5ElfiLcvFuKnIg=;
 b=gBEGmw3kGRMeW5JDN47/0RGvdy8ZhW3aLVvi3QenwIqkj04nuC1Biq5I
 41jTri2k1j8rYSmVeMJxJ7iRrpPdo4tkbiJ/zVNn24hQxtDrQDURwyX1K
 UvyKOU2TM7p6JQO019P/41y7c182+gnXvPKQ1GuNQbXqbuCPktz3q5HU8
 ycuzyxiUM56rsXKK+G9f3CstHi1OwIl4Ajb8WxZuRDBjY3y4w8Sh9WeTu
 EHnSPWxtmT4PtmIrQIz5L+J2gmJ0BK74GmCf/9Q9LenIoDDv5ZFN8wY83
 a1HSPOICbjEQTNGO8y4e0c3TBqn9xPTbXXiIO8XZ0JjEJwW9VBydgJWe/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="376593357"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="376593357"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 22:09:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1013491425"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="1013491425"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2023 22:08:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 22:08:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 22:08:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 22:08:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZlcRh/8huBGfxmlxMdaMYXB0fMZY68vvvH7fnKF6JQqnMxg4UmXIpzXgCAv8BgNHtrdo5zr31m3wQgERXOPchKHUII76PMXrb4s/t3aed94klQcosYjfUW/CaKeAFMeUrAz/Q+d8y8wj5ieq18+UemPy/fX1RZ8JufUpPyYpBq8ohISI1iisGEZSf6UdvhuqDF6yWzyFUKfV/jAN0ggx7LpSOMlsWwr8dC+6yv2irrzE1/j2XtcAIP3VyynbdqiT1FiVGthuhO04tWUoTkLbcM8+poAbFJNeItURtdYptxw704x5Ap6nc4EVer60Li8j9c7OnF6xumZyC65QQ/kZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDhAn0inSqiMfJBUC4wTo5vMOqTqW5ElfiLcvFuKnIg=;
 b=jSpaV1bF+549vQPloXB3rtAi+b3Z2aGAKPtVeETkGgPfMyy3rTIiEU6dGQVbSQjPwyNvyNaQaEtVo9BFr8qM85saDRhl51S+yWb4CmlspY/Z60hc0+/MMA3iwD2w0vwSAszGtf9SWNRlem8A+bJDU6ffH6n7uIOLwgeeCT0y765JR/p40nROdJ2XqTy8gbS8AJ3flGdb+oRCogzhw11TByGW976DbkXM/tozu7Wvcz0nVHS3P4fZUwOX6sbC5343ytQxntKHd+t84E54hV6TdZ6g72MDb5XAbqSy4vpGOIYmD86HmLb4nVSDp7fN8NBvhb2Xe3fUFHQcmPZp50UiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 06:08:58 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 06:08:57 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/4] drm/i915: Adjust LUT rounding rules
Thread-Topic: [PATCH 2/4] drm/i915: Adjust LUT rounding rules
Thread-Index: AQHZ/ddLrsyoyDPVlE6Yho4Fu486/rCC9C1w
Date: Mon, 20 Nov 2023 06:08:57 +0000
Message-ID: <SJ1PR11MB612921FEBAC75CFA6407F14CB9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <20231013131402.24072-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20231013131402.24072-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH8PR11MB7968:EE_
x-ms-office365-filtering-correlation-id: a3056234-b454-4f0b-f594-08dbe98f2e9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DQq8uXiQPdAVfbLaBOxal2tpti5tCcGL7pWK6Pw0mQDUTcnfkZmp16yjD7xTtgY/zx4GGEBiCT/q0iZ6fmGgO8805oxKY1EIHapXX9+c6lelSbbW8P6THwaq7MXGsW6AKOmAUqlKpKa11DlrVN03IkXWzau4lPmyBDKu8OpeL0qGpGpUAUrflR4bcDKeLRbANfvnq3TfP4wdY5m96oBrvdyfcM/VZkEHo70aXtMIcixay3U2YK0gS4WHh7HmkJktWAz9LiOVA7Gd0wQ3sXv9enStuKvYPMU7AlFcc2dtSxHyiKuY6Jsipqsh+MLaoUgMyU9chUDzAxyjfhBx6R5gdq5SFSQoaSptZb9OHHYhhxfJUJPWG4muk/XDNY48Hv+BMx9rm+wIs8yohUnzN3bz18mIt8yJknvfEvi5ggInfEP1tWOdP5Fh9vnllsYdkFDUf5Ov2kr2kapbS9pL4ZQ9zjlMVG0kuVnzgXMo4HJXzn49JuQBSPiRbjeZ8Qj9Dbffnff8D/4KHPsm66EPhZGRm/zgoh+6I0x32ZfRQ6obpDQ/HkrG4lweO6RuV39bNovJjQuEqE2bQte3nSrcl+RDpdccf7b12v0p7SG5M9gHatEo7Xll2qvMlkagRKk1LpNR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(122000001)(86362001)(82960400001)(38100700002)(38070700009)(33656002)(110136005)(66946007)(316002)(76116006)(64756008)(53546011)(66556008)(66476007)(66446008)(26005)(55016003)(478600001)(9686003)(71200400001)(7696005)(6506007)(5660300002)(2906002)(4326008)(41300700001)(8676002)(8936002)(52536014)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RCtJUEdJOTBSSE9sdjQySStGSmUyN3ZndHV2TDl4MTJlVVNQKzY2OVJNTVBN?=
 =?utf-8?B?VHZjVlhIbHU4c3Z4OHBkMk1SRGE2TTJKL0RqM3poVmdTdWx3SW1nWExXNVA3?=
 =?utf-8?B?dkhwVXBUVDNpa0lVUTN4Mi9kdWMreFhWZWNxaXJEMHA2L2N4cFNLK3VhZEdW?=
 =?utf-8?B?eXp3aGQzTkRpZ1N5YW9ZVjNqNnFlQkVxdkZXcmw3dkh3aGk1cGJiSVlETGZi?=
 =?utf-8?B?ekVaamJjSGtBUmhDanoyQUlOQnArK0laNTN5YjVhTDNrb0h2cjY4YTk2b0JP?=
 =?utf-8?B?TTA5QVpxaWdnd1JVeFRUS1dMa05wRElPcEdJc0podG41YjdGSWorM3JJYlA2?=
 =?utf-8?B?TzFobENSQ0VnOEk5TmVQQUk2T1QwWXQ2WDNjTkljQWRsaWJGTmVGOU45UmUz?=
 =?utf-8?B?WE1aSit1K2pKSXFmUXljbXdGSUV2ZWZFVm1DT0krZjRndW1ab2xXdFp4cUtk?=
 =?utf-8?B?N3R3akJWWW9VcWQ5M0pzRzZCQVdCYTdFQXJHaVBCenEzU1FBUWFTWmx0N1dt?=
 =?utf-8?B?UWRqWXZLbWdoZjZtbWNsMGdxNzFMeC9nOSttL2FWdW0rWXJoT0hXM2hHZnVE?=
 =?utf-8?B?N2xCMDhjYmtmN05oMHhSUTNvUWdsaXFRaUpEZGNHaGFPM3VHeC9KN2FZSjgz?=
 =?utf-8?B?NGhHRVRJQ1hhVmlhYkRHVjhIYzJIS2dudnM5bDFqMk1JSmJwZEtITyt4TlFm?=
 =?utf-8?B?RVF0bUV5QzNZMVlaYlliZzVadXlGMmVBUm5VZlVKbE5tdHNybVRLWU1FVk5z?=
 =?utf-8?B?bVBIVXgyV0p6aFFBekJ5L0dlYTJacW15YnE0dkdSZGw3MnRwTlJ4N2VKeTJt?=
 =?utf-8?B?bmdBN1h4S0R3cGUwcXdPM1dEV2did3YwMmd3TU94Z2RDVkRxRW45b0tmNi9J?=
 =?utf-8?B?ZlhUak1mU2Y3bHI4MUNudFVmd0lhenlKL293VEZDTmpzOE9KZk5IdlU2SHA2?=
 =?utf-8?B?R1V5NVk5bGVyanhmSWJjMVFvSGUyQzhTaU9HS2w2aXdpQklRZy9ybzQzZm5I?=
 =?utf-8?B?SUpCVGMycVNKVXM4bEwzTHdkNGZwTFQzZ2NncmwxWUR4enpvelhEMmFlUitM?=
 =?utf-8?B?M1RvcDlaV2FoUWJwcjhpdHhOZWtBM0ZWODZRMFRxYWdQVFlZS0U2enFUYXM5?=
 =?utf-8?B?dWdhTEQ0bjl3SllxMVh2Wlh4Z29FNUhyWEVWeW4reFRvanI0aDlHdXhaWjNJ?=
 =?utf-8?B?aHZna24zaEdxemlCOXpTWWttUG9lSlBWam1ud2pNL2dxNWhsQ0lITGJKM2dY?=
 =?utf-8?B?NHZmblhKSE9uSTBMNXFRVnR6bXRiQXlkTHV2RVNFQ0Q3emQ1bXlabzdQTUVL?=
 =?utf-8?B?Q1lzSUFHNkpMYTdGZkNWUzEvTXVubGJjVjZSWjZTOW5IeWpYaTJFRUxOSGY2?=
 =?utf-8?B?bVFXR2R3UzgzNXUyNVlYM25aQWYzVU1Ecm9SUEZVZmhFRTVUUE5RSkFUL09G?=
 =?utf-8?B?R0twRk9Bdm5nSXZvYWZKV0xIS0xsRHBiYXBpSWFTd2Fwb0NNalZXVXk0QXg3?=
 =?utf-8?B?YW14Tk9YSVI1Y2h0cXNESnBRVlRQUUlLSHFYSWNCaEdGc1NwaW9PblU2bFUz?=
 =?utf-8?B?eVBlRlRUT2xyaVMyS1oxQUJwNmwvSXo0S3o0UE9FemU5U2ZTcU9tTW95YlNv?=
 =?utf-8?B?NmttaUppb1c5aFJRZ2NqYzIyT3h2U1crN2xIREhkcUxFOTh6SXhrUHFFUDBj?=
 =?utf-8?B?VHpicnVjZ2g0TVgvY01wK3ZTNHI4ZlUzSlFhV3ZXVUl1TFRkeWRqejlGbkRP?=
 =?utf-8?B?YkZNVDBwbDk4RnNSWCtSTWRSUy9RWDg1N01kYkdzZ1pyQktxNEtRaU5NUGF2?=
 =?utf-8?B?U3NhZEZRRkk3Y3BIQ2prekpsZlloTGY0MWlTRzU3TlR4Q0NrSXdiTU80RytJ?=
 =?utf-8?B?TjZwckVxZGtuUDlCamhSRUFsM3pQQWk3cjJlWTdqZ3BKcDFWeGVRSG5FQmNZ?=
 =?utf-8?B?YVhHU2FLSk1TZUdQUGNqVENRUC8za3Y1T0p5V3lqWThvZExvTDdoVURYbUdZ?=
 =?utf-8?B?ekZaVWFwVVNxaVBxUnVPajMxS1JDL0s5NHBaTEF0UnR2OGt3SmxmZS8rY3lz?=
 =?utf-8?B?VjBGNWx1bXEyMFo0T2N3dFA4eURlQnVkeGlMb1JnQ2pZSjNTMUZ1b2JKSXF6?=
 =?utf-8?B?czRLaGZlMm9HUW83S1Q1bS9RRm5FTk51aGs2MjJ0bGxwcW5lcXlRSjl3VTlO?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3056234-b454-4f0b-f594-08dbe98f2e9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 06:08:57.4041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxQeawxVgD1bHcMt2GElkzZhZuBL6QLGjfqMfVbxxBBM2atJeuZfcf+Oy/IrEZ7mB0oBhYgcsM8dvYVbKFqmGKihVCOwEVIQCoPkwvgacA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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

SGVsbG8gVmlsbGUsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJp
LWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZiBWaWxsZQ0KPiBTeXJqYWxhDQo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxMywgMjAyMyA2
OjQ0IFBNDQo+IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCAyLzRdIGRybS9p
OTE1OiBBZGp1c3QgTFVUIHJvdW5kaW5nIHJ1bGVzDQo+IA0KPiBGcm9tOiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiANCj4gZHJtX2NvbG9yX2x1dF9l
eHRyYWN0KCkgcm91bmRpbmcgd2FzIGNoYW5nZWQgdG8gZm9sbG93IHRoZSBPcGVuR0wgaW50PC0N
Cj4gPmZsb2F0IGNvbnZlcnNpb24gcnVsZXMuIEFkanVzdCBpbnRlbF9jb2xvcl9sdXRfcGFjaygp
IHRvIG1hdGNoLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2NvbG9yLmMgfCAxNCArKysrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMNCj4gaW5kZXggMmEyYTE2M2VhNjUyLi5i
MDFmNDYzYWY4NjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfY29sb3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2NvbG9yLmMNCj4gQEAgLTc4NSwxNCArNzg1LDEyIEBAIHN0YXRpYyB2b2lkIGNodl9hc3NpZ25f
Y3NjKHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ICpjcnRjX3N0YXRlKQ0KPiAgLyogY29udmVy
dCBodyB2YWx1ZSB3aXRoIGdpdmVuIGJpdF9wcmVjaXNpb24gdG8gbHV0IHByb3BlcnR5IHZhbCAq
LyAgc3RhdGljIHUzMg0KPiBpbnRlbF9jb2xvcl9sdXRfcGFjayh1MzIgdmFsLCBpbnQgYml0X3By
ZWNpc2lvbikgIHsNCg0KSXMgdGhpcyBvcGVyYXRpb24gdW5pcXVlIHRvIEludGVsLiBTaG91bGQg
dGhlcmUgYmUgYSBkcm0gaGVscGVyIGZvciB0aGlzPw0KDQpSZWdhcmRzDQoNCkNoYWl0YW55YQ0K
DQo+IC0JdTMyIG1heCA9IDB4ZmZmZiA+PiAoMTYgLSBiaXRfcHJlY2lzaW9uKTsNCj4gLQ0KPiAt
CXZhbCA9IGNsYW1wX3ZhbCh2YWwsIDAsIG1heCk7DQo+IC0NCj4gLQlpZiAoYml0X3ByZWNpc2lv
biA8IDE2KQ0KPiAtCQl2YWwgPDw9IDE2IC0gYml0X3ByZWNpc2lvbjsNCj4gLQ0KPiAtCXJldHVy
biB2YWw7DQo+ICsJaWYgKGJpdF9wcmVjaXNpb24gPiAxNikNCj4gKwkJcmV0dXJuIERJVl9ST1VO
RF9DTE9TRVNUX1VMTChtdWxfdTMyX3UzMih2YWwsICgxIDw8IDE2KQ0KPiAtIDEpLA0KPiArCQkJ
CQkgICAgICgxIDw8IGJpdF9wcmVjaXNpb24pIC0gMSk7DQo+ICsJZWxzZQ0KPiArCQlyZXR1cm4g
RElWX1JPVU5EX0NMT1NFU1QodmFsICogKCgxIDw8IDE2KSAtIDEpLA0KPiArCQkJCQkgKDEgPDwg
Yml0X3ByZWNpc2lvbikgLSAxKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdTMyIGk5eHhfbHV0Xzgo
Y29uc3Qgc3RydWN0IGRybV9jb2xvcl9sdXQgKmNvbG9yKQ0KPiAtLQ0KPiAyLjQxLjANCg0K
