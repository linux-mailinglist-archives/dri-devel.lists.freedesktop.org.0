Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE5869F97
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 19:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F2B10E825;
	Tue, 27 Feb 2024 18:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUAFmfO+";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F19210E595;
 Tue, 27 Feb 2024 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709060076; x=1740596076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GuoaNNP8DQVAkT0Oa5oI5VclHECa3PHEsTHHk7TPSQs=;
 b=cUAFmfO+YpgFcFoiN2WpLTs16IpH7PHiwKgG2FeYQUFvglx7dmJY7Nea
 M+puSf884Kz0PGE/Tv4wcu8YSwAswC2YW9zglmOtrzH21hyci+g9E3xiA
 mmxKgPNOxLM5EuzH5XEmpznG3S/gxrYNNUguL3Lzo+xN4eIqbDmfUxgOP
 pbMCi69QGpaKyk4UpqV89NG0HdYRvblAoDjTIk3JX+gzun9huTed4mVAl
 srBhuysfTfPS/ucRrh6s9qGq4jyWJphOvaoyWKttawdGVOPy2KCrU6rA0
 DfdbfJuEw6fbYZMflvI2N8WMZteDwUqf26bROcnh7WRGW/fsQjh1N5fj3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14575117"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="14575117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:54:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="11739701"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 10:54:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 10:54:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 10:54:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 10:54:33 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:54:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1e3ev70IXhD2SErUQ1hmZc+5eRhryp5PLeR+TjSZKpAXFnox46jZRhgCkN1lAfpuEvrKEs91z9pflAU8840rhuzDeEwM/epoe0u+gI8uUFmt23CqInHeoArciIRPFEgdGUjo5msuivZTzDYOL+15LKER1B4pC4cAtrG+ucFzRookG9bl2KOvH5iwab452ew6ztb9KCXenIDvDOlp6YzPBREwNJ99R0JlKSYRW8263+hJeZlIjKsGrna5p0m8ZYvlV+f9THhDAOd1fCVfiVScaIG1kwBhfDQS7NMGk/1fPS+xsuc7kiPqDGaDjRDxxTPq74uAdU7lpZF5yY9m8fUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuoaNNP8DQVAkT0Oa5oI5VclHECa3PHEsTHHk7TPSQs=;
 b=PBbmOoNkYtuhcZS1hiv6HzWCAi2BKqpW13RkLie/ZIVQzLfIvOHZwiVUZojlfOPGK4DeZscSJ7kr+Ifties7pVjbJ4GOSG9vM+Uo1bbZ+o9VxIdR2ug5R5Z1dyXwOtiTQx9dfsXSpsdpY6c7mvCuKx23lLvSLCuqpVXOBUa3Hq6ZnJwmSp+SzG9XIPHkEDs3Gvkr1e/aQ7fwp9yilaa2w2nEqgSebkKRyOKJFGZpOOB8eIRpbEkmsJFeKkGE1252PGlOqEkUEmEJF275D0uKx69Osm16UXSQhjSrow0NeXPZhbC3U/aiUjZ+Gi0sPt/Q7GhBL2WBgueyvpJe1kz8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Tue, 27 Feb
 2024 18:54:26 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7c99:bd32:fb4a:d8a5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7c99:bd32:fb4a:d8a5%7]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 18:54:26 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
CC: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Subject: Re: [PATCH] drm/i915/guc: Correct capture of EIR register on hang
Thread-Topic: [PATCH] drm/i915/guc: Correct capture of EIR register on hang
Thread-Index: AQHaZpeznhUSGdN8LU2utjrbyQaj+bEej5KA
Date: Tue, 27 Feb 2024 18:54:26 +0000
Message-ID: <4c8456f426854e91aa7a01df61c741d8b6b971f8.camel@intel.com>
References: <20240223203204.1533410-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240223203204.1533410-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB6401:EE_
x-ms-office365-filtering-correlation-id: 82748986-c93a-4e64-c224-08dc37c5851e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ePCy3MANUZBBdouG3UZfvq+lmiGDMRTHJ7ccbT1cM0eEvzPhBj+hCDvRBg/oZZmK4yviTgvS2TPBJy5qSdEIbP1dCMSQC3FP0jSy+coLSkgGikpOLbJxdxVTwZN+pP32GBv5aHt/a18HQpkcRvkPuMPBhkJbUfenUvGcuLoJ9at3TaIWe0LUn6Pz/7sRMWoAY0KMnjpg0Hfv+VzrZod6gtbZcG3zJU8km5es+TB1bazIQUPXdhbF4IV8Caphiw0yUZ8KRX7AyKuGUBLOCdMtsFxbpc1b3BcUQs+a3S1uugD7cYBcRp0OUR5IqkDYXIR9IWJWJoG6C0g4DngWn1v0VnLUhwZedgzjNfdThG4SFyBjE36xkYiBbhbNOJpMT3j+ZxNk400mmIX/pSWWPI5a76PfymUmbFbIYBAXN6y1JEZYLg9BiRMMVsqIiIfOVtrMD2qpyZMSTiJ2mi/Uwt4kwNkStN6emhl1jXgijSEFg9kNAYuP4gfBQn1baMQKE8sWodZJDz92qF3RT5pHHww2ij6+rQoDLovC9u6BY/0bId9JxzQBM3d+aFuJZuIubE5oDRx0EwqhglACMLIiJ6uwQLjXsZvpn3RrreXWAP2RR9kDvv1Ysa//RtFO1fMxH6e8Ef8tf8nHyq3ek2eFqFwmLAe2GlZyxUdjAJFdU2zPbcCnQjuz2V/ESwFdoUz2BcLYaLUXxS5kcJpxWhm9TplQlkyhrJRBPHSmBFmx6X04ReE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFhXd0YrWE1RYVhpYnhTODlIemx6bmh3dmJnQnA0aVFKdkluSGJ5SUQ1aFln?=
 =?utf-8?B?UElQUytpdTBybGFieG9MWm9SWlMwbVIwemY0cFJXR3BGZ1FIbEg0UE5RNVEz?=
 =?utf-8?B?R2dYdThTWkNFNkpycmpVWDJleldJeGgzVHZBSFJ0aTd1cysrK20wZUp5OG5J?=
 =?utf-8?B?ZXFpdWN1MG8yejZDUmtaZmhzVDBscUhRZ3k2TEI5azk0SmF2OTYwdUdLWk1L?=
 =?utf-8?B?NkZFV1RmM1BHOWZzRWx4eHVJcHJURkN2aStyRFFoU0dTYk9PTVNZOXpIbjBs?=
 =?utf-8?B?SGhxdjhsNjNSOG5Hai9JeTZlMk1ITDlZUnUrbWpYYVpvK0M5dDNnVkNycy9t?=
 =?utf-8?B?cjlWcUs2b3J0djRILyt5c1NjRGM3d2ZyRzV3dVUwQ2Q5SEU5TGsxTEpGMlRE?=
 =?utf-8?B?N255YjR2ZGRJb3ZabkhXMElucTZuWDZBdkNFN1pyMFpQZEZHcjRtcTZhMlpE?=
 =?utf-8?B?WmpZdDcrY3piVEJPcGIvVlNUZnlLc1NHeDN0eCthRjduK0FvMVNXNktUNDJZ?=
 =?utf-8?B?c2RIUlYvL1lrVjFRT1B5TTFTUXUwOXpjM1VRWGV2VTh0U3NEODdvM3ZNSWZl?=
 =?utf-8?B?M2tSVUtGcXI5ZE40bFdyTk5zQ1UyTmJxdWJ1WXRXWHlOaTc2Q2lnY2xCT2xH?=
 =?utf-8?B?MERCcTd3VDlLUWxTWjY3cUJ1SGprcUlvOVU5S0h1clI0REFCVGg2VGh1T0Y5?=
 =?utf-8?B?TFIxU203UGFkVnBDZTBaS1J5Y1crd1FYOWRJcHZxK202VWo0cjF0YVV5SkY4?=
 =?utf-8?B?QXdmS0NVMEtQKzdPSTl6MWJjeGQvdFhaekFLbTc4eU9YczF3Y25FbGVpSWFK?=
 =?utf-8?B?MDNiak9FOXNkelZ6bWoyYVo5N0tQWE80bUI0aWtLTkJQNGZ5Z21wRDFEVGRZ?=
 =?utf-8?B?OG8va1d1NUkwWVZUWERqd1E3SG5yamZHV285cVZLaThESmc5SlJnSlRLWXlJ?=
 =?utf-8?B?RDdUNHVvT3Exb200UktCdEMyRy9hRVBiV2hMdkZ1STF0aXpqV1cyWXE5NzMv?=
 =?utf-8?B?WVlneWhNbWpJVHI5QUE1dFRmdkROZjBSV2UzcHZibTVYOTNzakl3eDU5UXF2?=
 =?utf-8?B?VkpmS3VTOTFHUVRVdUpWa3ppQTE5emh4aVMwMzJPRHk2d1ZsWGVpcVBFUS92?=
 =?utf-8?B?THk2eExobFhMMTRDN3hDWHZ6aTQwakxRU01Wbzg2THZjUEI1cGw4WHgyTFpr?=
 =?utf-8?B?c2NYODhFMzEyRjY1RTlIMG1uNWlXQjdWRUcyQiszbTZJQXlrd002RHF5T1dj?=
 =?utf-8?B?VGduVlY1VWY1eXZVWmZFRzJmcDdKR0U4VTU3YlRXQ01CcndLRnhKdlN3amh1?=
 =?utf-8?B?dEtodjRiWnY0WS82ZklncnlyTXpZZkt2alRFcXpIUlZWNUFIR0Fic2YveTB2?=
 =?utf-8?B?QytINE1UNHNwazVncTZ4d3FQWVo2bXdTdHpjbWtQdkRLTWpCbmwwaTlYaVFi?=
 =?utf-8?B?WXozdXNlczVvWUQwZVBXT3lFT3FnbzRndmdrZWdSeFdJbWo5WU9FM05UWGRt?=
 =?utf-8?B?Rkx0NHBvY1FkQ0MyOUFmQllsOHI0eEpnNG8yN3lsNFA3blFDTEFqb2Q0OGtj?=
 =?utf-8?B?WHMyS0dmK2RSRThqVUJGTUNwZ1RySmdxbzRyS0JBNDJzTFk2QzJsdDZTMWli?=
 =?utf-8?B?NFVSaWtBMEtaUE5lSFc1VFdZVHdZSlZIUWdzREhybmpoQkQzNGw3c3AvcVJk?=
 =?utf-8?B?RG10OHI0VHQwNExnNkRNYzNseFVIK2ExVXZWdlIwMXAzbXl2ZzBtOWsxKzBI?=
 =?utf-8?B?RjN5bzR5Q2xLSEt0RlF0TDVYYVgvMVdXMGg2V3pycVFLOGFWUzZZekhTblk2?=
 =?utf-8?B?L25uakN6MmR0aFc3N1ZwUVBQVjliTTArbnd3Y3IvREtQdEJtUlFEWFFLdVRB?=
 =?utf-8?B?dlpLVTYybDNnRkdhRzF3dXB5RzFnbXk1Wks3SHVxaW9ObzhIQW1YSEw2WHB2?=
 =?utf-8?B?VUNWcVFMTDdPUmR5UmZUVkNqbVpGSTRQeFFsVGFJaGl1cE01VURiUGdoUWgy?=
 =?utf-8?B?cFI0anVHZC9SK05IMEdCeDFxcHZtZ2dkQzkxaFRvMC9FNEdkK3NINThDemov?=
 =?utf-8?B?U3QzRldyWC9SNUhQZjdTS25HbmNIa1FIM052c0Fxcnl6ZmVMSHlqTU5MeGRG?=
 =?utf-8?B?YUk0VUlpeUhGRStYRzRkd0FpOThadTZEaEdpRnJUb3V3SFpPdm4vZTF6c24y?=
 =?utf-8?Q?w+i14u17VwlqWNNdwfXxAHI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2927E7E564FE2A4DABDAF00D274B931B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82748986-c93a-4e64-c224-08dc37c5851e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 18:54:26.0910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGp0zY2zEngen60fjnNJ4okJLIvQ4ATBPniEdNNf5MbHQkmnRMkwV3B0gAd3fROWWsm2xjcdQ20R18COX62NRUpCYGhCwXY7REZhRis23fLkoCZ7n6x2RmgnjL2159Dt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
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

T24gRnJpLCAyMDI0LTAyLTIzIGF0IDEyOjMyIC0wODAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOgo+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5j
b20+CmFsYW46c25pcAoKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9n
dWNfY2FwdHVyZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3Vj
X2NhcHR1cmUuYwo+IEBAIC01MSw2ICs1MSw3IEBACj4gwqDCoMKgwqDCoMKgwqDCoHsgUklOR19F
U1IoMCkswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCzCoMKgwqDCoMKgIDAsICJFU1IiIH0s
IFwKPiDCoMKgwqDCoMKgwqDCoMKgeyBSSU5HX0RNQV9GQUREKDApLMKgwqDCoMKgwqDCoMKgwqAg
MCzCoMKgwqDCoMKgIDAsICJSSU5HX0RNQV9GQUREX0xEVyIgfSwKPiBcCj4gwqDCoMKgwqDCoMKg
wqDCoHsgUklOR19ETUFfRkFERF9VRFcoMCkswqDCoMKgwqAgMCzCoMKgwqDCoMKgIDAsICJSSU5H
X0RNQV9GQUREX1VEVyIgfSwKPiBcCj4gK8KgwqDCoMKgwqDCoMKgeyBSSU5HX0VJUigwKSzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLMKgwqDCoMKgwqAgMCwgIkVJUiIgfSwgXAo+IMKgwqDC
oMKgwqDCoMKgwqB7IFJJTkdfSVBFSVIoMCkswqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLMKgwqDC
oMKgwqAgMCwgIklQRUlSIiB9LCBcCj4gwqDCoMKgwqDCoMKgwqDCoHsgUklOR19JUEVIUigwKSzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAswqDCoMKgwqDCoCAwLCAiSVBFSFIiIH0sIFwKPiDCoMKg
wqDCoMKgwqDCoMKgeyBSSU5HX0lOU1RQUygwKSzCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLMKgwqDC
oMKgwqAgMCwgIklOU1RQUyIgfSwgXAo+IEBAIC04MCw5ICs4MSw2IEBACj4gwqDCoMKgwqDCoMKg
wqDCoHsgR0VOOF9SSU5HX1BEUF9MRFcoMCwgMykswqAgMCzCoMKgwqDCoMKgIDAsICJQRFAzX0xE
VyIgfSwgXAo+IMKgwqDCoMKgwqDCoMKgwqB7IEdFTjhfUklOR19QRFBfVURXKDAsIDMpLMKgIDAs
wqDCoMKgwqDCoCAwLCAiUERQM19VRFciIH0KPiDCoAo+IC0jZGVmaW5lIENPTU1PTl9CQVNFX0hB
U19FVSBcCj4gLcKgwqDCoMKgwqDCoMKgeyBFSVIswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDAswqDCoMKgwqDCoCAwLCAiRUlSIiB9Cj4gLQphbGFuOnNuaXAKCmFs
YW46IFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcyBvbmUuClJldmlld2VkLWJ5OiBBbGFuIFByZXZp
biA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4K
