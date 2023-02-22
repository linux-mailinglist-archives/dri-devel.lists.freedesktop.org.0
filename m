Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0959969FFAF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 00:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C8710E458;
	Wed, 22 Feb 2023 23:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3F210E416;
 Wed, 22 Feb 2023 23:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677109301; x=1708645301;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PJ3VJoi3nRTGcRh7EBz9TPj9aCmKRPlFH5CU+Yp2lsk=;
 b=CyhZ8KCH4x9F/dlNKHb1vv67J6rTmWOTkY3+PED5oKPUQqGzKUENOqlk
 nJzy5FOkU4sAvl4a1V/DGH/mdGd8MPxPKHukOmzzhbZoFShFgAuzaCFOS
 rclT6NA46PpQ1ck8BovLpyYDswe5xHka010TuyqtSv1AT4pRK14qs24t2
 SkZzJj3ARc5KY3BvghZ+LZFNFb1ifjYQreBsSgkScMqkCYxSJMjjiV7jn
 DyfrldC4R//tSrO8qj2iU1Thnif5RDjkEUuhCwyE3dbYqaWFwbqj7a/6y
 p9ppbNObVIZNlHcbiWSqr+Nns8vraTuJXEG917wtxrwYLAb/K3G63dTsw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="419293505"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="419293505"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 15:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="741044815"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="741044815"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2023 15:41:41 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:41:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:41:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 15:41:40 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 15:41:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oG8NYP+d7vTRD3abyguOvDs48PslHofHbNDRbFqtqdHRFOr3LcOV/bjTB2NOp8X6yx2ccvvLCFN5xuaLROQYhffef2bCv1UigtRcFginrCzUobTTb8reIx7z77xBz7v//eIoaK4FxQqkahHsEpQQKCJHPQ2TnZgEMk2Z0hlE8vywGPCBcny+Q3RjAeYnUfstvP88zJHgesey/TsShSomywUGry2pHvzbEQRul+qaW5VcmRm3R2SkKYZYu5RWGHBT3hR+iOh7d9Wxgbmkkr58Snfgc8+hqkKtr8GO+/RtLW45ybSMMBJrfNLQn5HCWz1p2iJEp5nCebLupj6o1rbqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJ3VJoi3nRTGcRh7EBz9TPj9aCmKRPlFH5CU+Yp2lsk=;
 b=cO4WJMVAWMSltbRXvBA8D/kVtOy5htIGUEUQFhwBsY7Fgv2pSxDM94OTqEt/f4J6Wme+B7BR+64LxHuqz7u7s06/8Oe9dTxM8QjaR0nSmKV8o++PKGCw8UOQgSLZEqz0rdfYsg4F9ebbWnX37kVBGArpMUrg46BXm7rXGLz0Zh+UChmb3yki96MLpNrdq4t53OUD8tUrfLX0zlyNgZQl1NPThBC3EKZgj23o7D4e9OE0vgsPnLlVJL6vFgajqYcRLfgfXE8CpwAi07IOiyV7FOCcfBwrfQlHPH9fa0XBsZ81ppY38Qpy5Htf34CMNiX9o0TPncI46jN62z7127vEXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 23:41:38 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 23:41:38 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Topic: [PATCH v5 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Index: AQHZQLy8kRPROlCwoUOV2NgZvyf9La7brO0A
Date: Wed, 22 Feb 2023 23:41:38 +0000
Message-ID: <7121c77d434c0495ac23e0d8b0c3fb7d2130a906.camel@intel.com>
References: <20230214213844.2890382-1-alan.previn.teres.alexis@intel.com>
 <20230214213844.2890382-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230214213844.2890382-4-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB7003:EE_
x-ms-office365-filtering-correlation-id: 4e538749-6a3e-4849-fc40-08db152e575e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1/9mFTBWYmDLgfAo+COqn+eBCXVSOPeXfSk0KSGzaWBQ4Qb636Hi46BYxALGVC9AjwvN9SsjQ4S5gfGhgISCrCkC31H/u7bY8nNXCWqulYROcAzfp3kxhLDGAewDerN2t/tXr4Y7Hqn1Wh+3Xu8dbHIK2StFdqPOwSKfpQjRSpzNOktSor0I2Lcl57gZfhUfuSqbFIFyoPfU8GRqsQZ2pshX1CU2RyDp+EcozmMO1FH8lJU4kdupsn7r4aYTlHvEkQGpZAyEFxyGlyKLuTfDbvilp0MpAUSChAsJMvNigx+wQTHhqdVs+FRMnr4wNcWwFbToYgbWizINqa+rSkmFUo4aPeytt1kx4ZJF9iOJD266ljeOI1OUuWAZdIvbi2Wr6KKR8k8QTi2CfAcSE4CF7t8secQDyZtW1h2yuhbJ7waxF0zOrFZGR+uWEy+QdNTkspomljcG/gQ8EzLrRQO/L+Bm2y8C0VpwXCKBdjoMcqqik3MINC11vunmNMUczs9f9tdeb4/0dplh6RQ8p3b9m0YdpT3Y049GzvlSF8IP+QClAFhuN1B5YvUGOhBcnOcmfBA351XpEeVtiE/zCS92s1XxleGwV4/smS869poLWJQd4xuyd6d7hMkD3bEqRSlsLGEmgV3t0+JOlLF/k4jmxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199018)(966005)(83380400001)(2906002)(5660300002)(36756003)(6486002)(107886003)(86362001)(6512007)(478600001)(8936002)(54906003)(41300700001)(6506007)(71200400001)(2616005)(122000001)(38100700002)(38070700005)(26005)(186003)(66446008)(66556008)(64756008)(8676002)(316002)(6916009)(66476007)(66946007)(91956017)(4326008)(76116006)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TU9Lc3ozY0F1Y3JKTExHN09uSldCdVBoOVRndi94R1FSU2dyN25ldHNIRFdj?=
 =?utf-8?B?OVJiQ0lwckNMMXYyUVMxeE55cGtIa0xsbWYvODZQMk1RbE0yVnRWN0h0Z1px?=
 =?utf-8?B?K2hKSXh3NEozeWRTL3lkU0JHRk5UNThOMVpyeXErNE85WVdLNjZOVEZBR0t4?=
 =?utf-8?B?THVTQUVYNW50RUtHbGVDS0JXVmdLZmdDclRIU25ZYVlMQ3pCTGM3SHBXbWdl?=
 =?utf-8?B?WVVURW9MYndQZkxqVEpGV0E3MFo2NkdFT3VOd3pma3VNMWRiTW11TjE4SFU3?=
 =?utf-8?B?RmZabzQ3dEdvZEVIM1oyNk01UmUrdHlvdE5CZHk5UEY2Z2lvaThOdUhVcjlI?=
 =?utf-8?B?Mjg2MjFlR013NWJBaGFjTFNUSFFtUmRxc3VlQkxxSk1rYk5IZ1RDSkZPOFVx?=
 =?utf-8?B?bE92MjN2U0VnMlFGaXN6cWtrRStxS2U3MUlnUVYxbkRtM2d0c25xamRvemZn?=
 =?utf-8?B?bWFTVjZyN3YydUJsQnR1NUFqMGRPZWNtUkRFQ0I5MWpHMnR3a0kwb0dPNytn?=
 =?utf-8?B?dDQwbDdreW02V0xlY1pIbldFcTViTkI1VnlFT0hhSjNndTJQczRRRy9QRzBN?=
 =?utf-8?B?QkhqbXRRbnNSRUw1Tm1nQm5GbmphT1E4RjJPT0cxUjNaOHlIVzg4aGJEZWFL?=
 =?utf-8?B?ZWF4SmdMTTFRYlh2WS9oQzJIQ283N0NKNlR1cUVGRDZsaFB5b2pYVnl0Qm9P?=
 =?utf-8?B?MHNZZ2JmT1ZOTXgwVlExTzUyRGtXOFhza2xDbXhvRjU2Z0VwbUZjYVJRcUhM?=
 =?utf-8?B?NW41L0RsOXVCTSs3TDZBTTh6MldlbEF2RUNYVktVTnJOdFRDYUNjbGlkcVJr?=
 =?utf-8?B?bXU5ODI2dU80clRQTEwzOEhIUWdMdjhCQ3RzMnNlemtuNUFOZ0FJVUdyOXFO?=
 =?utf-8?B?NkNlelpqQ3ZaMjNTSzNjaUVjcExLSXJsN0dobUJmQWZMNU1oZlpBVVV6Q2FQ?=
 =?utf-8?B?djhYNXFPQlJiQzN5d2xobDd2VzYzN2RzS3JwR0pmbUV3VFpCajhPcVJrakdR?=
 =?utf-8?B?UzFRQTlRRTNpRjBqVVZiZCt0aWxRT2RWUWNvaVh1aFhIdFU0dWN2TzF4WG44?=
 =?utf-8?B?dEFCRTN5VG03eUs2TCtxcjVlS3Z6b2E3RTFGOTdjQVF3dzEwd2FZd1puKytY?=
 =?utf-8?B?M0YwL2xyL0Q5YnNpNHdtdnVDaGZ2QlBNVnRISjFGTVpIRzNaODdFQzRDUWFY?=
 =?utf-8?B?V0VyZmJKc0pZL1k2NUJ0eVU4OTUzMEs4bDYwaVkvOVI2L1UyQW1LU016NlVu?=
 =?utf-8?B?WFAvT21hQkYzeTVrNVM2aXBNNXQzYjF0Z0FZUnEvdlp5THBWYUYyL2hoM2N2?=
 =?utf-8?B?V2hXbGQxTDRpQlpxSE9rc2hSWlVnUWRWRGZVS1ZKTENuMDBneDhQUENVQXRJ?=
 =?utf-8?B?QlluSHJjR3dLRWIvK3RlS0xjS1JKUHhyOWtpVEhyYVhGYXdXQ0hIUCtrVWRJ?=
 =?utf-8?B?SjRvV3g3ZEYySGxEbldiU2NFMklzVXB5ZnB2aFQzWVNYeFNaNjE3WElmODBL?=
 =?utf-8?B?a1E4WUFLUC92Y2haTFR2VCs5cnNZNC8vemIwRUYrMy9ZUEtxOW1JZFdZSURY?=
 =?utf-8?B?amJUcWtNOHVYaU9BRUVyelJvTW5vcmtEcXl4c1lVL0VOOXdTQ0pRU0VueStn?=
 =?utf-8?B?K1JMSDJRT2RDRkZ5RHhXeE44NHJQcEFDQUxkK2xxTDAwMWZGbDk1R3pjc2Vk?=
 =?utf-8?B?S3ErU1dJWks2QktNUnV5OFJyM3Fza0xDWHd3c0Ewd2NRUjV0TkpNcWg2TmZ3?=
 =?utf-8?B?ak1sQ0RFMTFpQU9sWmZsK01qdnhEYnNXVzdJQUZzQkdSQ2YrQjZrdGtmeUNl?=
 =?utf-8?B?OU00c2hVbzMrZUpEaEJ5TDJyVDA3K0pHMkJtV0NnWk00cU0rT1krbmZJdDRr?=
 =?utf-8?B?UnVHMXlGdk5LTVJ3dkFlNjhDTnJIakdOM0pCQm9iSXRwUTh1ZWtuS0RiS2lL?=
 =?utf-8?B?Um1yOUpxMTFkVm9RZEY4Vi9ibUZSMGk5Nk9wUG5TMmIvU2JrUXcyV29BQUps?=
 =?utf-8?B?Tjd0WVlOV3d5LzlzNjY0bmlzY3RVUG4vdmFuTG40VVJMSmF5WTdtUmhGejJP?=
 =?utf-8?B?UVBLUmdsSzIvc3kyNHJINE9DaUxKSlNJZmxYQlpBRTA3UVFhQ2FOYkgveFhU?=
 =?utf-8?B?eHdBcmw2VFBNbDlmczRBNzVVbjFERWdyQXhXR2h5UjQvUEhyWGR4OEtGWU1N?=
 =?utf-8?Q?BR8P2JPsdoKYNOwmTQJzWPYvXWw4gfRj4cc4dge9X/GI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88DF46DBA7184244B3E1DE2DACC51E00@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e538749-6a3e-4849-fc40-08db152e575e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 23:41:38.0953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dO55tZUu23T/C/iLuzK3yTrPRYOTir2hS/6/AJRNjFZqc1OPRuzckYj2SOlzYQynGK2x0QOGXUNVyXuVNXbe9ems/WEO6HfORhOxzEPomvInT1Mbx2tZhKWPUBgo3KAM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAyLTE0IGF0IDEzOjM4IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBBZGQgaGVscGVyIGZ1bmN0aW9ucyBpbnRvIGEgbmV3IGZpbGUgZm9yIGhl
Y2ktcGFja2V0LXN1Ym1pc3Npb24uDQo+IFRoZSBoZWxwZXJzIHdpbGwgaGFuZGxlIGdlbmVyYXRp
bmcgdGhlIE1UTCBHU0MtQ1MgTWVtb3J5LUhlYWRlcg0KPiBhbmQgc3VibWlzc2lvbiBvZiB0aGUg
SGVjaS1DbWQtUGFja2V0IGluc3RydWN0aW9ucyB0byB0aGUgZW5naW5lLg0KPiANCj4gTk9URTE6
IFRoZXNlIGNvbW1vbiBmdW5jdGlvbnMgZm9yIGhlY2ktcGFja2V0LXN1Ym1pc3Npb24gd2lsbCBi
ZSB1c2VkDQo+IGJ5IGRpZmZlcmVudCBpOTE1IGNhbGxlcnM6DQo+ICAgICAgMS0gR1NDLVNXLVBy
b3h5OiBUaGlzIGlzIHBlbmRpbmcgdXBzdHJlYW0gcHVibGljYXRpb24gYXdhaXRpbmcNCj4gICAg
ICAgICBhIGZldyByZW1haW5pbmcgb3BlbnMNCj4gICAgICAyLSBNVEwtSERDUDogQW4gZXF1aXZh
bGVudCBwYXRjaCBoYXMgYWxzbyBiZWVuIHB1Ymxpc2hlZCBhdDoNCj4gICAgICAgICBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzExMTg3Ni8uIChQYXRjaCAxKQ0KPiAg
ICAgIDMtIFBYUDogVGhpcyBzZXJpZXMuDQo+IA0KPiBOT1RFMjogQSBkaWZmZXJlbmNlIGluIHRo
aXMgcGF0Y2ggdnMgd2hhdCBpcyBhcHBlYXJpbmcgaXMgaW4gYnVsbGV0IDINCj4gYWJvdmUgaXMg
dGhhdCBIRENQIChhbmQgU1ctUHJveHkpIHdpbGwgYmUgdXNpbmcgcHJpdmVsZWdlZCBzdWJtaXNz
aW9uDQo+IChHR1RUIGFuZCBjb21tb24gZ3NjLXVjLWNvbnRleHQpIHdoaWxlIFBYUCB3aWxsIGJl
IHVzaW5nIG5vbi1wcml2ZWxlZ2VkDQo+IFBQR1RULCBjb250ZXh0IGFuZCBiYXRjaCBidWZmZXIu
IFRoZXJlZm9yZSB0aGlzIHBhdGNoIHdpbGwgb25seSBzbGlnaHRseQ0KPiBvdmVybGFwIHdpdGgg
dGhlIE1UTC1IRENQIHBhdGNoZXMgZGVzcGl0ZSBoYXZlIHZlcnkgc2ltaWxhciBmdW5jdGlvbg0K
PiBuYW1lcyAoZW1pdF9mb28gdnMgZW1pdF9ub25wcml2X2ZvbykuIFRoaXMgaXMgYmVjYXVzZSBI
RUNJX0NNRF9QS1QNCj4gaW5zdHJ1Y3Rpb25zIHJlcXVpcmUgZGlmZmVyZW50IGZsb3dzIGFuZCBo
dy1zcGVjaWZpYyBjb2RlIHdoZW4gZG9uZQ0KPiB2aWEgUFBHVFQgYmFzZWQgc3VibWlzc2lvbiAo
bm90IGRpZmZlcmVudCBmcm9tIG90aGVyIGVuZ2luZXMpLiBNVEwtSERDUA0KPiBjb250YWlucyB0
aGUgc2FtZSBpbnRlbF9nc2NfbXRsX2hlYWRlcl90IHN0cnVjdHVyZXMgYXMgdGhpcyBidXQgdGhl
DQo+IGhlbHBlcnMgdGhlcmUgYXJlIGRpZmZlcmVudC4gQm90aCBhZGQgdGhlIHNhbWUgbmV3IGZp
bGUgbmFtZXMuDQo+IA0KDQphbGFuOiBzbmlwDQoNCj4gK2ludA0KPiAraW50ZWxfZ3NjX3VjX2hl
Y2lfY21kX3N1Ym1pdF9ub25wcml2KHN0cnVjdCBpbnRlbF9nc2NfdWMgKmdzYywNCj4gKwkJCQkg
ICAgIHN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZSwNCj4gKwkJCQkgICAgIHN0cnVjdCBpbnRlbF9n
c2NfaGVjaV9ub25fcHJpdl9wa3QgKnBrdCwNCj4gKwkJCQkgICAgIHUzMiAqY21kLCBpbnQgdGlt
ZW91dF9tcykNCj4gK3sNCj4gKwlzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmc7DQo+ICsJc3Ry
dWN0IGk5MTVfcmVxdWVzdCAqcnE7DQo+ICsJaW50IGVycjsNCj4gKw0KPiArCXJxID0gaW50ZWxf
Y29udGV4dF9jcmVhdGVfcmVxdWVzdChjZSk7DQoNCmFsYW46IGkgbmVlZCB0byDCoHRoaXMgdG8g
YmVsb3cgdGhlIHZtYS1sb2NrLXVubG9jayBwYWlycyBiZWxvdyB0byBhdm9pZCBhbnkga2luZCBv
ZiBsb2NrZGVwIHdhcm5pbmcgYmVjYXVzZSBvZiBleHBlY3RlZCBwcmltZWQgb3JkZXJpbmcgb2Yg
Y2FsbHMgYWNyb3NzIGRyaXZlcg0KDQo+ICsJaWYgKElTX0VSUihycSkpDQo+ICsJCXJldHVybiBQ
VFJfRVJSKHJxKTsNCj4gKw0KPiArCWVtaXRfZ3NjX2hlY2lfcGt0X25vbnByaXYoY21kLCBwa3Qp
Ow0KPiArDQo+ICsJaTkxNV92bWFfbG9jayhwa3QtPmJiX3ZtYSk7DQo+ICsJZXJyID0gaTkxNV92
bWFfbW92ZV90b19hY3RpdmUocGt0LT5iYl92bWEsIHJxLCBFWEVDX09CSkVDVF9XUklURSk7DQo+
ICsJaTkxNV92bWFfdW5sb2NrKHBrdC0+YmJfdm1hKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1
cm4gZXJyOw0KPiArDQo+ICsJaTkxNV92bWFfbG9jayhwa3QtPmhlY2lfcGt0X3ZtYSk7DQo+ICsJ
ZXJyID0gaTkxNV92bWFfbW92ZV90b19hY3RpdmUocGt0LT5oZWNpX3BrdF92bWEsIHJxLCBFWEVD
X09CSkVDVF9XUklURSk7DQo+ICsJaTkxNV92bWFfdW5sb2NrKHBrdC0+aGVjaV9wa3Rfdm1hKTsN
Cj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1cm4gZXJyOw0KPiArDQo+ICsJZW5nID0gcnEtPmNvbnRl
eHQtPmVuZ2luZTsNCj4gKwlpZiAoZW5nLT5lbWl0X2luaXRfYnJlYWRjcnVtYikgew0KPiArCQll
cnIgPSBlbmctPmVtaXRfaW5pdF9icmVhZGNydW1iKHJxKTsNCj4gKwkJaWYgKGVycikNCj4gKwkJ
CWdvdG8gb3V0X3JxOw0KPiArCX0NCg0KYWxhbjogc25pcA0K
