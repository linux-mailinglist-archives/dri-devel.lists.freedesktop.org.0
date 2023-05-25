Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028D8711888
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B0010E763;
	Thu, 25 May 2023 20:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79F710E762;
 Thu, 25 May 2023 20:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685048112; x=1716584112;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xna7eIckhTO0Cyw3MWjX2foa+S/jI9kV6oiurSGEUKQ=;
 b=NxGsSWKaCSi3RIRiqyzkMSSUQ91H/M87DikWtLZfOUhxajzm7APHVF9K
 y8TgyEwY2550IybEFvV7mUUcV6rX9v9DoBmEBSHULrGhDPG1hfUggeIJh
 AdOTHa0kpSwj/b48bD2jgL0uMhto/Vw26zvPz4AJhi6N02DB057yk2slU
 F+tGGVAYECiJVtFMjqSiWG46aZQMBfXx4pbW12VS/kGSwR8z3cPlRi6LK
 rg1YVr8fcw8/tgO3XnUCkevdiRRkzzRd9ODzEgM+tMY/VMfqbbO1E82tr
 fe58f/56T2qLeaXa9akp2dnfRFT/8plt2YEFudWt3oXyKwlbrkb5ZREBE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334368515"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334368515"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 13:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="774817443"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="774817443"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 25 May 2023 13:55:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 13:55:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 13:55:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 13:55:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 13:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eezxy9ZmLnQWNW0E+Ab35D+E1YB10We2+8XMlLWrPu1ri3N/I3FT6OdQGUhMW3YxI8Jq3OGL5Z4EfIfaRmZXhuNa+oNylSme4z/qVjC0kphyL/p5tboAcNNxlvJ/u9pHLx7wZpvzTYx1yBXjdLtaO20x9sxMaiM3s1zregWyX8jfbVrd+sMoEmHE0g2Jr8wCx4Iu4OoArszvcFO5M1jAm8rM+VYDzc0E7fkLmYC2meEUFlpZjPoCnFnu2dCe0bCJmsjHq1Nk7eMFY2mkgWKKW4yHOqbign+SZAGzty5264eQ9pozdPcte4cSXEhgblC2SPBeBVA5MDhC8ODSAZB07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xna7eIckhTO0Cyw3MWjX2foa+S/jI9kV6oiurSGEUKQ=;
 b=DIGJyuJw8WpZ9/XOaB4shKsWlz2mzFIgcBD7mU2wVEPkOsrf6ubqu1cro23BxqjCpUsZEjJulX2UVCtOuKAqDI70X73w7cahj0MABIbg4AdCblhRyHix4MlSUSNfxpikntXQOh8QaQp7Xx9349bci4glk4/OjlwPo8yGuL7FLwX+DShAby5n2BMLUg59LxCKdNSiLqADXkigyHkh+PvBANC31xjFBSMG8PdQW3wvOvDnycHeiPb4fF6Ty6QIiCfpsDwwvUoIYtj6uqsIGJgW3ODbRssVdEdlxd82mm+GUg/teQIyFdnaA/uGbMjabBfNKR1LoswHY+QVzirHappAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA1PR11MB6465.namprd11.prod.outlook.com (2603:10b6:208:3a7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Thu, 25 May 2023 20:55:08 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284%5]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:55:08 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 3/7] drm/i915: Fix CHV CGM CSC coefficient sign handling
Thread-Topic: [PATCH v2 3/7] drm/i915: Fix CHV CGM CSC coefficient sign
 handling
Thread-Index: AQHZbigA/XBPFxmulEafTrD8A9+bvq9ruOnQ
Date: Thu, 25 May 2023 20:55:08 +0000
Message-ID: <DM4PR11MB636031F61EE8864E316FB1C3F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
 <20230413164916.4221-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20230413164916.4221-4-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA1PR11MB6465:EE_
x-ms-office365-filtering-correlation-id: 57bd7314-21bd-409d-bd02-08db5d6252ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9H2xIidEn1GaqVc9tj5PTeMdPyj6IhpHI+aJGXxZewX4hYdXJDytWmIM7gOOK566LTCA2sFEg9GlDR4rmP7+THiJ/5RDr9cmDmTTvUe1r4PjDkOb7irEa116qB/+9nwALdLKJ68uZ53LYRRDgvqL3/7WAR+nC10lGGEBbniGi6hsas7KvJFlYlAWLBfcq3TYs8iWvE8T+F8/p92snAXOs3uHJ3txUXnhZUnb5vrWZwegeII8eVMetPwSciaWT8SrCp5JnBApAp0D2MITwnqEEsJI7tAdI02/RcnO84zKlHCoaBRd/gvWB72Lz8IYP7dnYAyeUCRYJkI9lf0IkAwwbT41Kdgwk/od0xBK1O/JokEKkkOKZF5mlizy+B8BfW26Quhb2dwiEFvOI+Awt2rkubNa/K4YLgjx5hQqe/UQFemnwoXrX5cEgiTQWarw0rOq0Mgt1II2Oki/7KypCTWJR61M1iYlWCSG3Hm2WJFsj3Rr2qBOxOc6GP/SZzdHg2ZbylfKtYVSPlK5HsVKb5hs4IzcQrMP/4GExNtSsqk1dqVpfBjhb0oHWNkMF9BM0QPmxWIapsirLBrCOYnux54ZoT0I8K8ghYHiyk07NBG5G6v7JjH3WPHQvTtwp5wMu6l4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(136003)(39860400002)(396003)(84040400005)(451199021)(110136005)(82960400001)(478600001)(66446008)(86362001)(66946007)(38070700005)(66476007)(66556008)(122000001)(83380400001)(38100700002)(2906002)(66574015)(7696005)(76116006)(64756008)(316002)(4326008)(8676002)(8936002)(71200400001)(53546011)(33656002)(26005)(52536014)(186003)(5660300002)(9686003)(55016003)(6506007)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzVCbE1nNWhQTm5WR0p0NE9XSFM3cTVLOEtVNWtlVzRnYzBlb2dFdlF2aWxZ?=
 =?utf-8?B?L3Z5MVl0eWNPQS85Z3pHK25La1BTNEFwUm5DbEpBdHdxWGprdlR2OWRxMmF6?=
 =?utf-8?B?akp0bVpmUTRRcjRYdFM4bXBaNjhnMkVUK1BYYStYTjBoOVd0bVdmV3ROUEhG?=
 =?utf-8?B?eFFQVVV0K0thc0VVOVFlbE1HVEJiaG1RcFlITkFJR2lBd1h2N1BkVFZxSlZ5?=
 =?utf-8?B?V3FYNHBtSDhNTDlkYUFQaVY2SnhRZTF0NjVzSDlPQlp1dk43WGNDZlVkN2Y1?=
 =?utf-8?B?TGRNZXBiUmQ5YUlCdDdFc1BISDdCYlZRdG1adFIzakwzS3F4ellza3NYRXp3?=
 =?utf-8?B?eVpaMmI3NTFlR2lOVXBuWFcrOGp3YmF0VkdBai9zV0t1NTZ3cGh4VDNpaWIr?=
 =?utf-8?B?cEowTkZSVlRQYmloWDNWZVhBSC9wUlNpV3hiazQ3d3FVaWdybDkxeWI4OTBx?=
 =?utf-8?B?MmcwazkzOXJadXZ5U2hsQUJhNEV2SW9IVDJpMDhhNU5kMWhNQzIwTERKOGZU?=
 =?utf-8?B?bTNiSVk4QVllekt6eWFXRGVkTjZMaWRkSWkyMTJ3MThaM2NrOGVHdkJoMFhP?=
 =?utf-8?B?ZCtqKy9BTElhRUcyU05VcjEvTU5ITWJnZVhVUWh5T21Fd0NkV2lqV3JuUEhY?=
 =?utf-8?B?R01kRDFSbWpRM0EyWHlEeksrcU9XNjZVV3JCbzB1TW0vYUthTmE4N0VwZTFV?=
 =?utf-8?B?N1hzR3I5Y29ReE14R1pnSW9RNi9oVnlRMExKMzlSRE01eTFvZ1kwOVRTQzBW?=
 =?utf-8?B?SnloREhmeGFTOThFZGt3QnRTU21JVDVQbjgyeENwSTVkQi9uVU5yTGZOVDU2?=
 =?utf-8?B?ZGNkREIvVWJPUXhrdm5KRlY0d3VQTzZMS3M0R2JmYjBlekVNWDhQdE4xQXZu?=
 =?utf-8?B?SVU1VDZMcjNGOU9HY3lvelR2TUtOZkcwczRZek5hZzk0SlIwQVpBRlRid2FD?=
 =?utf-8?B?QU8rWG1kaFJGN1l1eWRhYnV3K3BwbUpZM3FtNmZkYVMwT0haenZOdlEzRVpy?=
 =?utf-8?B?d0hxNFA5bEVCMTFQS0RncDl0Ykw1QUZoamtua2Z4MVJCU21UQ1JxQVBBemtk?=
 =?utf-8?B?UVg1QW5nRW9DN2FOek80MmJHSEFDSWNybysyOEJ2OTJtN3VZbTg5bHVPSExX?=
 =?utf-8?B?ZkVscnRhLzJlS1dnR3ROd3B4WVRlSU1kUXJSYTZJMVZTNUxLMlh2VmpVOEw4?=
 =?utf-8?B?U3BqdUZlTGZ1ZkZxMFRmL1JGQXF3SDdQZXE4dDZLTlAyYVNuRnQrUXFZUjl2?=
 =?utf-8?B?ay9WSlhLSXh6VU1xOFd4NFBhM1VKZUJDYmlob0poYXlKN2V6bDloK08rYWFR?=
 =?utf-8?B?L0UyK1ZKL3k1REpuWmxiaDBPOW1SdDEzbDBTVmVFR2hjTXpHSnVDMm5rM1hX?=
 =?utf-8?B?R3pHTElZb3VhaG0vYzVCNVRBSm4vV0VzTGYzOEozZTJVYzYxZFVUVDN4enF0?=
 =?utf-8?B?Z2hIY05NQURnSkVXUXJKd214Snc3YmFWZXNyMGZaTFhDR3BNeFFFdU9lWWpF?=
 =?utf-8?B?WnpveDZKQk1MK0dvUmhsV3FZeWkwMW5iN2h0eXBBMS9yR2VvRnBvQTdWYnc5?=
 =?utf-8?B?Ly9rRDVLcGVYM3ZvODMwaWV5clJsZlNVK2pucjcwYXFNVTVuWGFUTnVQQmxC?=
 =?utf-8?B?YjJKNXQzQ3VDVWdvLzBqZE81M3ZjSUY3Z0dKV0Z3QVNBemN2SjQyWTBoaE03?=
 =?utf-8?B?ZHZpM00xNit6Y0NVcTVlYnRYa3phM25iY0lLbjVYOFlvRW85OU5MRGlBSzRx?=
 =?utf-8?B?MXFtL21Kb3RWSmRlMUt1aXkzcEhzaXB5azVWSHMzZ0RpV1JGYlFDUnlDUDc0?=
 =?utf-8?B?dWJOM1k4L3dLWXd0YWM5SzNFTjNOK3FkcmdBRnpxNjkxOW1weVhLTDlLdFNN?=
 =?utf-8?B?T0FXUlordU1WRGpVdmw1Y0VLN291WlB2dEp2WFVCWHh3NjdmMks2OVFDUlRX?=
 =?utf-8?B?d3ZCUFZzbDR6L2luSlh6OWJKU3VUdGJEclFBTGszU3cwSFJnMWVUaTV6QTVx?=
 =?utf-8?B?cEJNYXc3M0c4eGJwSi9tMnJWbXJCQ2lBVGlnM0hwVENLRzdGWHlSZUlXWFpD?=
 =?utf-8?B?aFZQWWhpWk5zVXJYTUdXN2l3aGJwY29lUjRIRktwSkVxQ1I1eDdJSXN6b25Q?=
 =?utf-8?Q?oOkJ/BK+HDQos/AibgqF1XThQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bd7314-21bd-409d-bd02-08db5d6252ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 20:55:08.2342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qurSlXPNDqYFz5M/d2KWHIwBxflyhjMtETxfcWtReF9KTKBY6U3IS9iIEOZhZuZ8Ms8Jr+HBCwk7WXrpQ3Q9bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6465
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaWxsZSBT
eXJqYWxhDQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxMywgMjAyMyAxMDoxOSBQTQ0KPiBUbzog
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMy83XSBkcm0vaTkxNTogRml4IENI
ViBDR00gQ1NDIGNvZWZmaWNpZW50IHNpZ24gaGFuZGxpbmcNCj4gDQo+IEZyb206IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBUaGUgQ0hWIENH
TSBDU0MgY29lZmZpY2llbnRzIGFyZSBpbiBzNC4xMiB0d28ncyBjb21wbGVtZW50IGZvcm1hdC4g
Rml4IHRoZSBDVE0tDQo+ID5DR00gY29udmVyc2lvbiB0byBoYW5kbGUgdGhhdCBjb3JyZWN0bHkg
aW5zdGVhZCBvZiBwcmV0ZW5kaW5nIHRoYXQgdGhlIGh3DQo+IGNvZWZmaWNpZW50cyBhcmUgYWxz
byBpbiBzb21lIHNpZ24tbWFnbml0dWRlIGZvcm1hdC4NCg0KU3BlYyBpcyBzbGlnaHRseSBjb25m
dXNpbmcgd2hlbiBpdCBzYXlzOg0KIkNHTSBDU0MgOiAgSW5wdXQgcGl4ZWxzIHRvIHRoZSBDR00g
Q1NDIGFyZSAxNCBiaXRzLiAodS4xNCBmb3JtYXQpLiBDb2VmZmljaWVudHMgYXJlIDE2IGJpdHMg
KHMzLjEyKS4iDQpBbHNvIGhlcmU6DQoiUHJvZ3JhbW1hYmxlIHBhcmFtZXRlcnMgOiANCmMwWzE1
IDowXSwgYzFbMTUgOjBdLCBjMlsxNSA6MF0sIGMzWzE1IDowXSwgYzRbMTUgOjBdLCBjNVsxNSA6
MF0sIGM2WzE1IDowXSwgYzdbMTUgOjBdLCBjOFsxNSA6MF0gOyAvLyBzaWduZWQgbWF0cml4IGNv
ZWZmaWNpZW50cyAgKHMzLjEyKSINCg0KQnV0IHRoZSBjb2VmZmljaWVudHMgYXJlIDE2Yml0cywg
Y2FuIHlvdSBoZWxwIHVuZGVyc3RhbmQgaG93IHdlcmUgeW91IGFibGUgdG8gY3JhY2sgdGhpcyDw
n5iKDQoNCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2NvbG9yLmMgfCA0NiArKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jDQo+IGluZGV4IDRmYzE2Y2FjMDUyZC4u
NjMxNDFmNGVkMzcyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2NvbG9yLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9jb2xvci5jDQo+IEBAIC01NjgsMjkgKzU2OCw0MSBAQCBzdGF0aWMgdm9pZCBpY2xfbG9hZF9j
c2NfbWF0cml4KGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0K
PiAgCQlpY2xfdXBkYXRlX291dHB1dF9jc2MoY3J0YywgJmNydGNfc3RhdGUtPm91dHB1dF9jc2Mp
OyAgfQ0KPiANCj4gK3N0YXRpYyB1MTYgY3RtX3RvX3R3b3NfY29tcGxlbWVudCh1NjQgY29lZmYs
IGludCBpbnRfYml0cywgaW50DQo+ICtmcmFjX2JpdHMpIHsNCj4gKwlzNjQgYyA9IENUTV9DT0VG
Rl9BQlMoY29lZmYpOw0KPiArDQo+ICsJLyogbGVhdmUgYW4gZXh0cmEgYml0IGZvciByb3VuZGlu
ZyAqLw0KPiArCWMgPj49IDMyIC0gZnJhY19iaXRzIC0gMTsNCj4gKw0KPiArCS8qIHJvdW5kIGFu
ZCBkcm9wIHRoZSBleHRyYSBiaXQgKi8NCj4gKwljID0gKGMgKyAxKSA+PiAxOw0KPiArDQo+ICsJ
aWYgKENUTV9DT0VGRl9ORUdBVElWRShjb2VmZikpDQo+ICsJCWMgPSAtYzsNCj4gKw0KPiArCWMg
PSBjbGFtcChjLCAtKHM2NClCSVQoaW50X2JpdHMgKyBmcmFjX2JpdHMgLSAxKSwNCj4gKwkJICAo
czY0KShCSVQoaW50X2JpdHMgKyBmcmFjX2JpdHMgLSAxKSAtIDEpKTsNCj4gKw0KPiArCXJldHVy
biBjICYgKEJJVChpbnRfYml0cyArIGZyYWNfYml0cykgLSAxKTsgfQ0KPiArDQo+ICsvKg0KPiAr
ICogQ0hWIENvbG9yIEdhbXV0IE1hcHBpbmcgKENHTSkgQ1NDDQo+ICsgKiB8cnwgICB8IGMwIGMx
IGMyIHwgICB8cnwNCj4gKyAqIHxnfCA9IHwgYzMgYzQgYzUgfCB4IHxnfA0KPiArICogfGJ8ICAg
fCBjNiBjNyBjOCB8ICAgfGJ8DQo+ICsgKg0KPiArICogQ29lZmZpY2llbnRzIGFyZSB0d28ncyBj
b21wbGVtZW50IHM0LjEyLg0KPiArICovDQo+ICBzdGF0aWMgdm9pZCBjaHZfY2dtX2NzY19jb252
ZXJ0X2N0bShjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4gIAkJ
CQkgICAgc3RydWN0IGludGVsX2NzY19tYXRyaXggKmNzYykNCj4gIHsNCj4gIAljb25zdCBzdHJ1
Y3QgZHJtX2NvbG9yX2N0bSAqY3RtID0gY3J0Y19zdGF0ZS0+aHcuY3RtLT5kYXRhOw0KPiAgCWlu
dCBpOw0KPiANCj4gLQlmb3IgKGkgPSAwOyBpIDwgOTsgaSsrKSB7DQo+IC0JCXU2NCBhYnNfY29l
ZmYgPSAoKDFVTEwgPDwgNjMpIC0gMSkgJiBjdG0tPm1hdHJpeFtpXTsNCj4gLQ0KPiAtCQkvKiBS
b3VuZCBjb2VmZmljaWVudC4gKi8NCj4gLQkJYWJzX2NvZWZmICs9IDEgPDwgKDMyIC0gMTMpOw0K
PiAtCQkvKiBDbGFtcCB0byBoYXJkd2FyZSBsaW1pdHMuICovDQo+IC0JCWFic19jb2VmZiA9IGNs
YW1wX3ZhbChhYnNfY29lZmYsIDAsIENUTV9DT0VGRl84XzAgLSAxKTsNCj4gLQ0KPiAtCQljc2Mt
PmNvZWZmW2ldID0gMDsNCj4gLQ0KPiAtCQkvKiBXcml0ZSBjb2VmZmljaWVudHMgaW4gUzMuMTIg
Zm9ybWF0LiAqLw0KPiAtCQlpZiAoY3RtLT5tYXRyaXhbaV0gJiAoMVVMTCA8PCA2MykpDQo+IC0J
CQljc2MtPmNvZWZmW2ldIHw9IDEgPDwgMTU7DQo+IC0NCj4gLQkJY3NjLT5jb2VmZltpXSB8PSAo
KGFic19jb2VmZiA+PiAzMikgJiA3KSA8PCAxMjsNCj4gLQkJY3NjLT5jb2VmZltpXSB8PSAoYWJz
X2NvZWZmID4+IDIwKSAmIDB4ZmZmOw0KPiAtCX0NCj4gKwlmb3IgKGkgPSAwOyBpIDwgOTsgaSsr
KQ0KPiArCQljc2MtPmNvZWZmW2ldID0gY3RtX3RvX3R3b3NfY29tcGxlbWVudChjdG0tPm1hdHJp
eFtpXSwgNCwgMTIpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIGNodl9sb2FkX2NnbV9jc2Mo
c3RydWN0IGludGVsX2NydGMgKmNydGMsDQo+IC0tDQo+IDIuMzkuMg0KDQo=
