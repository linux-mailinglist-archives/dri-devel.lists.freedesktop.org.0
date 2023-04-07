Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9096DA7EA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 05:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AA110E11D;
	Fri,  7 Apr 2023 03:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA74C10E11D;
 Fri,  7 Apr 2023 03:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680837076; x=1712373076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OMZJW4XVBM5AjUYZj4pmKwEPAe62k4+F//tzVWlGx0w=;
 b=NeLt3CgNDP4ptxcx7TIl7pq270Oc9+oV9EKjmClKoDnwUansMhCvkl70
 bhrV2galZI6TzDGKA8TmWTfNrAazc0mzfEfrbqyIHtlCWWusypkREKSfB
 b1vU2tnRVgr58f5Lx+Qzb4DxvkYl/g5GnPMkXcEGwfdJq9to7zEv0yzDk
 5iYvWogUXILPRXNC/oE0Fvqkmv6GH+RrWI+ZycHf5XsDWpx3h4FpMf+tD
 UqBwhx77Kf46t0vse203EJ2UoVfqaEI5Ap6r8fXbYZZp86EbGTCyhvitf
 o5eJFLEoGMpHb1vINvy6hfUzATr6F62WFjfmPCGRvI0Gen4Vkv/xvJWtv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341667631"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="341667631"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 20:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776708523"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="776708523"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 20:11:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 20:11:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 20:11:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 20:11:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 20:11:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6r3U/4D7yaaRtxuYAbHarNmVczI5lHAxUhs+uI+Bw1fqmOmSf/vWzjlXeHPIWqqiM9Cx7CKqDBEqHPMU9b2JTdHRWciA7/8DPQEq9u6X5dN4/qKqwbyyhor4FOLoV1qGnoOZJO+BYKtkQ4pqo1MhkZqrlhrTIa/iqhxNwd45u6rvfBeIVytjAmxvIWpLri+6k+ONklSXOeBXJBEPBsAUhilDeytwwoJOw0snzbD951KSp2rfve8LF66JkniuOx3LYtLlyoanQq0tOWPFqL5czxqhYo4hsAeSmQuUKxloyN5vyGvmpstOG6JWblIPNfQdwLzVI1PTIH3h6tIhJBAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMZJW4XVBM5AjUYZj4pmKwEPAe62k4+F//tzVWlGx0w=;
 b=jQtKZABl+/IMHA/X+FYh0+87ZGwunpzY6dMcGKB93eIxT8dway7AHYYBoOpRzT371tK57uE3Yj4aIWVVn8G4IWpDbukOQLrw+4rWqMc0yGXUKDAVgRaO+bz+2en88ngzAPMwElvCnb85q300JIe6t2mOYOd8QgKsKC8G1dJes6OixvLk214NOb1wasCtcwBsGVcCRBmxfBuK40UabY97SFN2mybCrk1X/rnix7ySTBLxAYUuXfWSL4sUa52ni4J2li+79sGRZ1N0/ja78nufDgYl98nvkXJXLQM3W72DCuEm+GbmBYKHi6abXENjroR7Oo6zNsxq3/144h0Niq4VZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 03:11:12 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993%9]) with mapi id 15.20.6254.033; Fri, 7 Apr 2023
 03:11:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 0/7] Enable YCbCr420 format for VDSC
Thread-Topic: [PATCH 0/7] Enable YCbCr420 format for VDSC
Thread-Index: AQHZRn8nw/kWjfeWPkyOdd90kbBg6K7w1cUAgB+MCmCADwqYgIAAA2KA
Date: Fri, 7 Apr 2023 03:11:12 +0000
Message-ID: <SN7PR11MB6750280505C5150C647BBCD0E3969@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <87ttyvbhuz.fsf@intel.com>
 <SN7PR11MB6750FDE3318A85E0A2541831E3889@SN7PR11MB6750.namprd11.prod.outlook.com>
 <e4fbeb9d-25f6-fe19-99ee-fa4f8a689535@linaro.org>
In-Reply-To: <e4fbeb9d-25f6-fe19-99ee-fa4f8a689535@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|IA1PR11MB6516:EE_
x-ms-office365-filtering-correlation-id: 006e95f0-2677-4e4b-5004-08db3715be0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gwLU1Kf1O425Pa6Jcyk9fhHvub7k/yEGWdLgkNmU/tVjn5hRqXu4Zd1rcYH4Suj0vkw4CYb5xUOsrDanP/NHVT/NcWwoRBaSWlaCq8IhfJZpzxk8AI25ekmMyxPYAh4aIBexWdS2e/prktl4ZTKQ5XuYf8yCKp///HHEYDOwcyOtFRbX5l2o530BFqKz6utxo2RtwFywlrGICpT1clCUeiXKeIAAhRXKm0IaEq0Ux1xAyONiXZK9Mqn6Cy49MdWIYv7E/Q/MF5KwLlNaubgUtFAyXVLui3a7Uq9c2g2zlTuw8MXDYYsLgh1PmLwYxwbafBcIvV/ioNelh61RFYDkNzeDeiaW3PTDMVWE3iGSpShGEquSCp4Y1oDjC02WnHkm+3f1HhnO138gzasIT5pTki80C6Xg+8Fs2uxv4ZgPaNoDUgxJaK+8fevGEc3BGAgBfUfDvfcmPtXM1+eH6lw74CYBIavYVvWsdZNrXhUjGa5BADZk8CyLvekFwZe/rJYA0cZF36+o9IurqS97PEi+BWV6U2Kyz7MnX6VD3nxHnZG7aFHzK6Jue7fmWmAaclkr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(38100700002)(5660300002)(86362001)(64756008)(8936002)(53546011)(122000001)(26005)(966005)(6506007)(9686003)(38070700005)(82960400001)(52536014)(66476007)(71200400001)(66556008)(33656002)(478600001)(66946007)(76116006)(83380400001)(8676002)(7696005)(66446008)(55016003)(4326008)(186003)(41300700001)(110136005)(54906003)(316002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czRUVnRVTmVyQ0xhb2VickFGcWdUc1g3bFJjT2tGcW42NjJqcDJTbWNucmJC?=
 =?utf-8?B?SlhyTVdKQlRocDRaQ01ENWRtZjNBcTVaVzJMRDV0TlhOODRjOFIyb3V5RnQ3?=
 =?utf-8?B?VDR5SVQrRWpZZmM5Zkd4VHJnOWtBdHN6QWxNekxTMEU3eXZ6VmF2R3RqTkxH?=
 =?utf-8?B?TEEwWVpiS3hYL3ZJSHZRQVI0MG52TFhlaDU0RjBWanc5NG1DbjlZOUwxclFC?=
 =?utf-8?B?MGZydDA2NmdMYUJDY3YzbHkyTXkxUnJhaGJyc0NNRmlaRWFpSnViaGVlaDFX?=
 =?utf-8?B?Qms3RVYzNmtRSEFJazBRek1iL3ZlY0lZdWlnVUtaaHNQWXFwQVBPdVRISVFz?=
 =?utf-8?B?NmtnemMwTWU1TEI0bUhFZTFGWDVxYXN0MUJ5WDJYdGRPLysra1NIbXR4WTFS?=
 =?utf-8?B?SXkvSERiMVJsTldzZlArTlQ2NXdxQWwvUXRtZzdNUWtrcWhZVGlGUjUzZXpY?=
 =?utf-8?B?WDByUE1lWXBsODJOaWVpd2E1MGZ6Ky83T1VYVnFKTWJSZjFVVDVhbmdtNzRq?=
 =?utf-8?B?QzIxeUFVb3BOell3ZWtNdkpveDJTSGlua0VuRTlEeHl1UHBKWktwSkFYN3lV?=
 =?utf-8?B?STlSYWRpM3QxYWtJSGk2NnRzWHBMUWszMEJMTUdEbTl5eGIxTzI3WldHRzJa?=
 =?utf-8?B?RjFsb3I0S0ExMGJUa3VXa2J4clpsTVdjczVXV3lGdHBtYWtYSGcyaWJXVzg5?=
 =?utf-8?B?cVZxN2NwMWU4UU0zUWYzS2RaOUFJWVQ2Y0NHbGpucFAwTUhFMElBam82UTU3?=
 =?utf-8?B?K1ZDZzBtV21pNlQ3WkhXWkhCNEc0eWdnN3UzSDlsK2cyQ2RCR211bCtnRkpD?=
 =?utf-8?B?dXdIOVk1Ylc4N011SkRPbTRUaHhGZTd1eWswL3F0U3I3OUN6ZVhxYi9pOVU4?=
 =?utf-8?B?STh6R0ptSVF6RHpsRTZURFlxd2dmcFErdkJHL093dFkvYVdnOFg2YWlBV2Vv?=
 =?utf-8?B?L2RjdEFIZVorK25JTE8remFqcnhHWm9ULzJINWtwQ0huUkMxV1Z0UVNoUXkz?=
 =?utf-8?B?ckhqUk9reWQ5QVcyaWg5cDZjN1R2Q2RCcWI0NEhobmpXQURFZ3ZqVXUzeUdw?=
 =?utf-8?B?eVRJQW50SDFBWHlNWEpNYUJ0ZjlMeU10RFpvM1RNaWJVcUdqZFlETjRzZmxW?=
 =?utf-8?B?SUxLOVhyWlZDWk43bW56RHZuRWl6MEcrQk40aDZsVFJ2YmZseGZlWmhidEdG?=
 =?utf-8?B?MTBpRVJ6aTBCSUFuY1BlbWRnRVFJOTBITmNHTGVXZUR3UnpFY3k3d2ViSlhS?=
 =?utf-8?B?WmNYd1pCcXNES2lTZ2hlV2JKWVpBc2xNaTBScXFVSXZHWjk0bEcrclVZZDk2?=
 =?utf-8?B?bU5uQXVPbTRoMVMxTTJ6Z01PS0x0RGpBT2NORDJMamM0NU45ZjlCYUF6bTFl?=
 =?utf-8?B?RzFnRTlVT1h1c2YzREpRMHBCVVp6dVEvU2JDa05uQkg0Z1MyN1JERkZaaldk?=
 =?utf-8?B?cjFhSC9FNERTbThXTDEwMmswQjFOeXlJWGxoK3BDYTBIQzBXblJ2ZDRpLzRI?=
 =?utf-8?B?Tit6VmVsMVBmOS9yZVNqaTFiSzhQSlZuSUNLcUlwVVJiYnlBNDlDOXNxUFFZ?=
 =?utf-8?B?OTcxTzJzZkhqaSs5bjVhZGxVckUzcWNYazdIcExUYkM0MEpDTGxodVRGeEdT?=
 =?utf-8?B?NFptU0lrVWJ0ZytGZlB4L0VGZ2tBNHhUYmgxcE53TzIyVWxieEtyMjVBR3FX?=
 =?utf-8?B?WnZPTVM2RTJTZlFuMERRSUdQSERmNnJiMFAwZ2RYSHJRWFdTQUszSWw0MFdI?=
 =?utf-8?B?WEY0Uzd0bVlwa0lIQUE2NzR5emlqNjJNVlZHYkhqZEdWZDJubUV4RHp1MEwr?=
 =?utf-8?B?OEg1UWRMZUx0ZDN0MVc1c3pEMmx3Z3pNamdxU0JTMGRqUDZMUjhId1NXUmVC?=
 =?utf-8?B?dzk5UXd6NU92emNoRVQvTXNJckVWOE5IMmR1amtlMHFFQThFZEhoVW9kejBV?=
 =?utf-8?B?ZFdmSjFrNEU0Z0h4cmgweUVWMXNhZWpCbDl0clU3ZXY1VFJOWnozN2paUlVT?=
 =?utf-8?B?dE1YUWNXaThiUHhXK2VBREwxbDBOME9kZVlpc3E5OXNIWUI2VUt4SXl3WXN1?=
 =?utf-8?B?b3pDWC94RTRsUm9ma3FtelN6aGpxekg2bThNQ2l5TW5UWUoyWGhnSkVqVEov?=
 =?utf-8?Q?w1sJU+LF4HgmaccJt3n077M61?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006e95f0-2677-4e4b-5004-08db3715be0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 03:11:12.5257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x815LFMHSwAjKuqVDBmcVparIR8OgVUEApFJyLWfB7kjV2CQ3t5SNS1QSrXClCOZ369urWHDjbRwBW+0n0MlRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEbWl0
cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRh
eSwgQXByaWwgNywgMjAyMyA4OjI4IEFNDQo+IFRvOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2Fu
ZHBhbEBpbnRlbC5jb20+OyBKYW5pIE5pa3VsYQ0KPiA8amFuaS5uaWt1bGFAbGludXguaW50ZWwu
Y29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IGdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IE5hdXRpeWFsLCBBbmtpdCBLIDxhbmtpdC5rLm5hdXRp
eWFsQGludGVsLmNvbT47IFNoYW5rYXIsIFVtYQ0KPiA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsg
TWFhcnRlbiBMYW5raG9yc3QNCj4gPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzddIEVuYWJsZSBZQ2JDcjQyMCBmb3JtYXQgZm9yIFZE
U0MNCj4gDQo+IEhpIFN1cmFqDQo+IA0KPiBPbiAyOC8wMy8yMDIzIDE2OjIwLCBLYW5kcGFsLCBT
dXJhaiB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYNCj4gPj4gT2YgSmFuaSBOaWt1bGENCj4gPj4gU2VudDogV2VkbmVzZGF5
LCBNYXJjaCA4LCAyMDIzIDU6MDAgUE0NCj4gPj4gVG86IEthbmRwYWwsIFN1cmFqIDxzdXJhai5r
YW5kcGFsQGludGVsLmNvbT47IGRyaS0NCj4gPj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBEbWl0cnkgQmFyeXNo
a292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+OyBOYXV0aXlhbCwgQW5raXQgSw0KPiA+
PiA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+OyBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2Fy
QGludGVsLmNvbT47DQo+ID4+IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNv
bT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzddIEVuYWJsZSBZQ2JDcjQyMCBmb3JtYXQg
Zm9yIFZEU0MNCj4gPj4NCj4gPj4gT24gV2VkLCAyMiBGZWIgMjAyMywgU3VyYWogS2FuZHBhbCA8
c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+IHdyb3RlOg0KPiA+Pj4gVGhpcyBwYXRjaCBzZXJpZXMg
YWltcyB0byBlbmFibGUgdGhlIFlDYkNyNDIwIGZvcm1hdCBmb3IgRFNDLg0KPiA+Pj4gQ2hhbmdl
cyBhcmUgbW9zdGx5IGNvbXB1dGUgcGFyYW1zIHJlbGF0ZWQgZm9yIGhkbWksZHAgYW5kIGRzaSBh
bG9uZw0KPiA+Pj4gd2l0aCB0aGUgYWRkaXRpb24gb2YgbmV3IHJjX3RhYmxlcyBmb3IgbmF0aXZl
XzQyMCBhbmQgY29ycmVzcG9uZGluZw0KPiA+Pj4gY2hhbmdlcyB0byBtYWNyb3MgdXNlZCB0byBm
ZXRjaCB0aGVtLg0KPiA+Pj4gVGhlcmUgaGF2ZSBiZWVuIGRpc2N1c3Npb25zIHByaW9yIHRvIHRo
aXMgc2VyaWVzIGluIHdoaWNoIHNvbWUNCj4gPj4+IHBhdGNoZXMgaGF2ZSBnb3R0ZW4gcmIgYW5k
IGNhbiBiZSBmb3VuZCBpbiB0aGUgYmVsb3cgbGluaw0KPiA+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMTM3MjkNCj4gPj4NCj4gPj4gSSB0aGluayBpdCB3b3Vs
ZCBiZSB1c2VmdWwgdG8gZ2V0IFsxXSBmcm9tIERtaXRyeSBtZXJnZWQgdG8NCj4gPj4gZHJtLW1p
c2MtbmV4dCBmaXJzdCwgaGF2ZSB0aGF0IGluIGRybS1uZXh0LCBhbmQgYWdhaW4gYmFja21lcmdl
ZCB0bw0KPiA+PiBkcm0taW50ZWwtbmV4dCBiZWZvcmUgdGhpcy4gQXQgbGVhc3QgcGF0Y2hlcyAx
LTUuDQo+ID4+DQo+ID4+IFRoZXJlJ3Mgbm90IG11Y2ggcG9pbnQgaW4gYWxsIGRyaXZlcnMgZHVw
bGljYXRpbmcgdGhlIHBhcmFtZXRlcnMsIGFuZA0KPiA+PiB3ZSBuZWVkIHRvIG1vdmUgdG93YXJk
cyBjb21tb24gY29kZS4gRG1pdHJ5IGhhcyBiZWVuIGhlbHBmdWwgaW4NCj4gPj4gY29udHJpYnV0
aW5nIHRoaXMgdG8gdXMuDQo+ID4+DQo+ID4+IEJSLA0KPiA+PiBKYW5pLg0KPiA+Pg0KPiA+Pg0K
PiA+DQo+ID4gSGkgSmFuaSwNCj4gPiBNYWFydGVuIGhhcyBhY2tlZCB0aGUgcGF0Y2ggc2VyaWVz
IHRvIGJlIG1lcmdlZCB0aHJvdWdoIGRybS1pbnRlbCBhbmQNCj4gPiBpbiB0aGUgbWVhbnRpbWUg
SSB3aWxsIHdvcmsgd2l0aCBEbWl0cnkgdG8gcHVsbCB0aGUgY29tbW9uIGNvZGUgdG8NCj4gPiBh
dm9pZCBkdXBsaWNhdGlvbg0KPiANCj4gSSB3YW50ZWQgdG8gY2hlY2ssIGFyZSB0aGVyZSBhbnkg
dXBkYXRlcyBmcm9tIHlvdXIgc2lkZSByZWdhcmRpbmcgdGhlIHNlcmllcw0KPiBhdCBbMV0gPw0K
PiANCg0KV2lsbCBoYXZlIGEgbG9vayBhbmQgZmxvYXQgY29tbWVudHMgaWYgYW55IGJ5ICBNb25k
YXkNCg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBTdXJhaiBLYW5kcGFsDQo+ID4NCj4gPj4gWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTE0NDczLw0KPiANCj4g
DQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0KDQpSZWdhcmRzLA0KU3Vy
YWogS2FuZHBhbA0K
