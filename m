Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D6E7DB637
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7AE10E258;
	Mon, 30 Oct 2023 09:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A72E10E257;
 Mon, 30 Oct 2023 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698658526; x=1730194526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AVB++CZLacWYFQZ6D0/DngzERLZfttyOpDa30a2uouI=;
 b=NuYDSv0k1XmPoqXRvFQ7poBWZ9lj+9dm24ffDz30gedBf1OAk9v8NxxT
 GXjov6qL+m58fVbKD/RRMePimmFMRkijXcywTLatzcjelDU4p07gbkmVd
 FA3nkDXh7AKUAfk0lk3SstSRAoHsYHsL8u5TMymvq2jiYyKu/pI86oZLu
 Wr3K74GhISNZhe1Af+4YdZuPDu2BeYXnGxAa3BbOQTQZVxFYn1jI1BUOP
 7ogzZ2ZSvubtRrh4zKI8vjE1DzEJtDUdgBVp+mNotHZkNhbJqstFUuj4D
 KmSVx/MxYxWtqIAmGkGcGl6yKo/zlTRYGPqnQq6w367v8xsu7/N7aR391 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="378414288"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="378414288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 02:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1407682"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 02:35:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 02:35:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 02:35:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 02:35:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 02:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjrvXI+iy8Ar63zmj5gDKpfiZTAz26ZwWQTfW1KGE9U4FsbGpnlOss0b/9Vx5ooplX3yHY1PWEpWpRw5jsnq+kWyLQSpFulvfF9FWCXJmLs3xv8RMVgaJfeNgqCIQ83EbhxpmhZw5dBvAfi/g/hX+5Jx4Y2nCRuE6slre/0ltQcO2c31dcnVyHF+fu8eWEhPLuH5Basq+E0svV+x4T9M8k4/0eJCtZgcE7IIPUpEZ83qJMBtFeu7d3/hekCiR1eeVOA+nDSLv8erdMAZl1dyVG+vrU2mllp6qtoB9ndigeR/dzUpqiWeP5CMoByi8SKn0NlqbbHn4AAzZ8PisE+3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVB++CZLacWYFQZ6D0/DngzERLZfttyOpDa30a2uouI=;
 b=GAR2NlKjTJNPN7JZLa1Z6VPxAARvb+ixd/0JHo2H40IE5NskjsEI30dMDQFdGoFLTO1690SIk96JwvFhNN2sRILW8RDIEmi8GneCPFBFxUFndsdyHkzjWFJg4giE1ltHoPSlPbXSBQrroeUWxj4xmAgEmyPGE1mpOsLw7HqLXw87fbgzM0XOYhexlW5ESscVrhhQzMqAzIMlDdRrKe5auBPRXm/Op8+DVSNraS0sHt7Xt5oLHlUnoTnFwTPKxuD0Vj0C/wqVluc9r76+/QHRJL62fDHVZHJ5F6UmyHPL9S+1ZoB6oL950FfdYnDiscnEqYvk/nL0GGxN1ek0lNNaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8740.namprd11.prod.outlook.com (2603:10b6:8:1b4::5) by
 CYXPR11MB8756.namprd11.prod.outlook.com (2603:10b6:930:d6::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.28; Mon, 30 Oct 2023 09:35:21 +0000
Received: from DS0PR11MB8740.namprd11.prod.outlook.com
 ([fe80::bca3:68ba:7857:1bf4]) by DS0PR11MB8740.namprd11.prod.outlook.com
 ([fe80::bca3:68ba:7857:1bf4%6]) with mapi id 15.20.6933.026; Mon, 30 Oct 2023
 09:35:21 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v7 4/6] drm/i915/panelreplay: Enable panel replay dpcd
 initialization for DP
Thread-Topic: [PATCH v7 4/6] drm/i915/panelreplay: Enable panel replay dpcd
 initialization for DP
Thread-Index: AQHZ/DUgWy70CGYF006sAYrMUHAkxLBL2NJggAHUzICAFIEbQA==
Date: Mon, 30 Oct 2023 09:35:21 +0000
Message-ID: <DS0PR11MB8740702947726CA25DD66FC3BAA1A@DS0PR11MB8740.namprd11.prod.outlook.com>
References: <20231011110936.1851563-1-animesh.manna@intel.com>
 <20231011110936.1851563-5-animesh.manna@intel.com>
 <DM6PR11MB3177BB6B336FA437EEB4EF3CBAD7A@DM6PR11MB3177.namprd11.prod.outlook.com>
 <BL1PR11MB59790B8105EF15D5A2221D5EF9D6A@BL1PR11MB5979.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB59790B8105EF15D5A2221D5EF9D6A@BL1PR11MB5979.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8740:EE_|CYXPR11MB8756:EE_
x-ms-office365-filtering-correlation-id: e64953b3-d64b-4c80-bcf5-08dbd92b8957
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BwpXKdQ7r5zUlcurptP5gYijBc4xiz0m54J0r3iTMI2O32ayUos3ZmHXZ4JlWJdZw7onJUE6FQUiXIcaHnTS9hgyQn8su5tdpLGrS/mQX+cxXl7hYyD6YdPO7ly17KwZ0GsnsVxLReeH4ZwXuyFtxhX8flyCK4Z6iS2wcWqBvWQta04kjiIS/mCrKMW0AtktcSw/EZ5R2PwY662SuakAmQzWm9WR+bCsM7eetckUmXVu73i5kHca6PRku84vXfEW0U5R/cDNKiCjlIgbTof0u4Bu9qvsVBits6InmZpiYjoe74oRS98LDRfTFp/rIIkfw3Vnwv1KubTgVwmll/d1wpFssIZ+m8OVllxkQHn+kVxAf54IHMnwfAXe63SfmJGfKyZ+YYmD39TeOlW66sprKkiOm5D7hQIKSPQNIKQuKh+CnDTt35RB3zWHSZ+JQ1qyE1xb70tBfVUCaziCdDONcewZrU7kJf6xAnFYIqdUD0pC74+3825AgywBt4vJXb16+A6l5Aa1WP1pyYo6oRGmpH6tqjc611NfUFmgqd2GRsJw2DxDDcuU6JBKBl7j7AG7GqH9AgjKL8g7+EFyO89Gvcaa0IyQkMtyg5/3HGXSfyKScRSEj5SCRc1mop6BH1mq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8740.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(55016003)(26005)(55236004)(9686003)(2906002)(38100700002)(38070700009)(33656002)(122000001)(86362001)(82960400001)(83380400001)(5660300002)(6506007)(478600001)(53546011)(107886003)(7696005)(71200400001)(8936002)(4326008)(8676002)(450100002)(64756008)(66946007)(66556008)(66476007)(66446008)(54906003)(316002)(52536014)(41300700001)(76116006)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXpRSmtkMyszQUlqNy92dHpncjlQR2FJZ3VHRTNMTndOZGRKclhscWFPcFZV?=
 =?utf-8?B?VVkwNWVQczRXVXJzdmpQd01FVnNkenM0QXRBR0twUm9UYVNRME1mdnIvMmdX?=
 =?utf-8?B?YjNIVlNSc3FqdUhyU1JiSUlmZ0FUbmk0eTVoS3JwRHhFdjhBaCtwbi9ZSjBy?=
 =?utf-8?B?TjJtelVjei9sY3hKUjVZKzRwUVI4UlY2QmI1WVdYcXp5aFJ2WXBhQ2FKUDZk?=
 =?utf-8?B?cEloMFNkOFZsLys4MCtiSzJ0OXpjRDZOVzIxQzlqRXlwblgrMjdrK045cDZo?=
 =?utf-8?B?Ym5Ga2U0Ni9YQkFSM2s1WTcyYWxOeVdpd2NBZGpUcUpRdVYzMC92OW9nblBi?=
 =?utf-8?B?Vmg3cndaZVVNUkc1Z1hDeUp5U0g0VkJ5TEtkYUZLemFvTlNnLytxeXpoZzZz?=
 =?utf-8?B?OWZ6RGRTaUlteGRNNmN1WElkeUg3UHIxWC82VTY1R2l6OCtxQ012WjVud0RQ?=
 =?utf-8?B?VkJvVUhwaU5OM0hMYmpCZHVBdVZDcHBuYmJFM2lUb1hJUy9VenYwU0d5Njht?=
 =?utf-8?B?cXY3OWNkV2MydHdzZGhJWlNoQ2VzOTM1WS95YkYrbG1OL09Vd01DUXpGQzdi?=
 =?utf-8?B?RklidEFJOTdCaEdPSkplRFhiVnovUW5PTmpHMmFIUTF0YlErZ01uZlM1NDZD?=
 =?utf-8?B?Yjhaek43UzdXcVRoeGR2SVR3VFJ5aHdzNWg0VUpCZ0w0Qm9CQ1d0cDRSQ3V6?=
 =?utf-8?B?eEVsZWVCY0kvVFU0dDZqQTdodmxGMmpzUjBXRXVPZGF4S0ZtWE5rR3V1N2x2?=
 =?utf-8?B?Si9IRThFUzIxanpLeFNJYlQySXNpdDZJckRpc3hCbVJuMnV5M0wyQ3VsMzZH?=
 =?utf-8?B?dE5yUmFKcE9aMmJ4aVdsZVRGcVlhbWxWRFlERXdIbnk2a1MzYVBXMWljeTA0?=
 =?utf-8?B?WDhEbFVCZkVnNGR3WGl2Vm5ZdXV6SFhzRlB4RXpwa3ZoR29MVlh0YmhrWTlJ?=
 =?utf-8?B?MWljZUxuZUdmaXdRdUsrdkVlSm94Z1RlTk5rVmZVMUUxZjVha3ZlNCtEMUx1?=
 =?utf-8?B?V2JsS3Z4QUFJRi8xR3lNZ25xanBFbHRqYjM2YkRkc2J0MHo4Q3FyMkpvRzhI?=
 =?utf-8?B?T2hvYmx4R280YnhvQURwZFdmODdtY1NOL2VrYjlUMVZLZWZMRHRYdDJ3VEVa?=
 =?utf-8?B?VzMrY1JzN3VFSHE5akN1cXBDdnhtYTJWZkFKRStGRWU3ZjhiNEd6NGxaZFhR?=
 =?utf-8?B?UUdWWTAraHlZT1FOZG13L3lzcGxDak96VmZhVGJWTkEvRDhtL3ZYVWNvWDll?=
 =?utf-8?B?VnpnWk1JMGRiaVpzUlZVK05Md205S0ExNVM2UFMwZ3c2Yk5kN3gwM0RrTTZJ?=
 =?utf-8?B?bi9JalY3SlZHRzRYUjVnTzFBRkw1ZldrcWo3WmthZnMxWS8rYjlBYkZDYWZ3?=
 =?utf-8?B?NUpHdjN1NUxjVmgvYUZxOUxvVC9rNnFSTUNDa3N3UnQwMFNRelBpaUlZeDBC?=
 =?utf-8?B?aVZUUCtlbUxTZnBDWXl6alpRY2lqRXc1L0QwUnNLd1FoVTJwTG5SdXdFYi9F?=
 =?utf-8?B?NHZJSWFnKzdpU1A0bStjZWNsMEpaSmtVd2R6RC93dVl0R0FhU09HSjR2UVli?=
 =?utf-8?B?Slkrb2V2Z3E3VjFMWE5ENWVzczJFRnlaNDJwYUdESWR4cWdCVGdyS3BZblp3?=
 =?utf-8?B?K082OEl2Z2E3OHFvdjFsQUo4WGpEUUp3NlVnSE9yQi83N25XM3JBT1FFVVB3?=
 =?utf-8?B?dmRCNU1EVVpKSkE4d1E1TXZqSDZaZTVDN1FmMHpHU1VDZGtuc2tSUVpra3Er?=
 =?utf-8?B?YmpCbGM5VWRyejV0U3BDeWF5L2tlTjhjSlA5aXhGZ1RZWUh4T1kycWY5ZEhY?=
 =?utf-8?B?U3hXUTMyR25kWURhYWRuT1JTNzhNQlZ4U20rNFBGaVNOdUxvZG04dndHcVY5?=
 =?utf-8?B?elFiL0Z6azhBc2Q2VFBrckNYRm5uN3BvU0U4YzljK2FDcDdEV0w1NmJ0RGho?=
 =?utf-8?B?QzV1YWpzcWJwRTQxL01KaDlSU1NFMnY0bkI3c0Nwc0lyejhnaTdiM2tEUkd2?=
 =?utf-8?B?MlZOOUhLQ3N4My96OFlkbWd1S2YyN3hqYjd2Uk5jT2pzUU04Vk53LytGVmRj?=
 =?utf-8?B?T0JZdUJlanhzdzBxS2g2TFBHR1VWc2d3M2ZMd1FzSXhwazlQZVcwRy8yalV5?=
 =?utf-8?Q?1iLv2hyKQCB0TcBEFzqxxxoa3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8740.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64953b3-d64b-4c80-bcf5-08dbd92b8957
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 09:35:21.4103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A826BcycIW/BdFDJQZ+zd9oFX0TB9apFvHT4gwRjSqXDVD955XTErZgZpwPaye5P/ihgWMdj/rXD9eZyOSQ+Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8756
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
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFubmEsIEFuaW1lc2gg
PGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDE3LCAy
MDIzIDE6NTIgUE0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNv
bT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IEhvZ2FuZGVyLCBKb3VuaQ0KPiA8am91bmkuaG9nYW5kZXJAaW50
ZWwuY29tPjsgTmlrdWxhLCBKYW5pIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6
IFJFOiBbUEFUQ0ggdjcgNC82XSBkcm0vaTkxNS9wYW5lbHJlcGxheTogRW5hYmxlIHBhbmVsIHJl
cGxheSBkcGNkDQo+IGluaXRpYWxpemF0aW9uIGZvciBEUA0KPiANCj4gDQo+IA0KPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogTXVydGh5LCBBcnVuIFIgPGFydW4uci5t
dXJ0aHlAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxNiwgMjAyMyA5OjU2
IEFNDQo+ID4gVG86IE1hbm5hLCBBbmltZXNoIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT47IGlu
dGVsLQ0KPiA+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgSG9nYW5kZXIsIEpvdW5pDQo+ID4gPGpvdW5pLmhvZ2FuZGVy
QGludGVsLmNvbT47IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+IFN1
YmplY3Q6IFJFOiBbUEFUQ0ggdjcgNC82XSBkcm0vaTkxNS9wYW5lbHJlcGxheTogRW5hYmxlIHBh
bmVsIHJlcGxheQ0KPiA+IGRwY2QgaW5pdGlhbGl6YXRpb24gZm9yIERQDQo+ID4NCj4gPg0KPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IE1hbm5hLCBBbmltZXNo
IDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2Jl
ciAxMSwgMjAyMyA0OjQwIFBNDQo+ID4gPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IE1hbm5hLCBB
bmltZXNoDQo+ID4gPiA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBIb2dhbmRlciwgSm91bmkN
Cj4gPiA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPjsNCj4gPiA+IE11cnRoeSwgQXJ1biBSIDxh
cnVuLnIubXVydGh5QGludGVsLmNvbT47IE5pa3VsYSwgSmFuaQ0KPiA+ID4gPGphbmkubmlrdWxh
QGludGVsLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2NyA0LzZdIGRybS9pOTE1L3BhbmVs
cmVwbGF5OiBFbmFibGUgcGFuZWwgcmVwbGF5DQo+ID4gPiBkcGNkIGluaXRpYWxpemF0aW9uIGZv
ciBEUA0KPiA+ID4NCj4gPiA+IER1ZSB0byBzaW1pbGFyaXR5IHBhbmVsIHJlcGxheSBkcGNkIGlu
aXRpYWxpemF0aW9uIGdvdCBhZGRlZCBpbiBwc3INCj4gPiA+IGZ1bmN0aW9uIHdoaWNoIGlzIHNw
ZWNpZmljIGZvciBlZHAgcGFuZWwuIFRoaXMgcGF0Y2ggZW5hYmxlcyBwYW5lbA0KPiA+ID4gcmVw
bGF5IGluaXRpYWxpemF0aW9uIGZvciBkcCBjb25uZWN0b3IuDQo+ID4gPg0KPiA+IElmIHBhbmVs
cmVwbGF5IGluaXRpYWxpemF0aW9uIHRoZW4gd2h5IGlzIHRoZSBmdW5jdGlvbiBuYW1lIHBzcl9p
bml0X2RwY2QoKSA/DQo+ID4gQWxzbyBpdCBpdHMgc2ltaWxhciB0byBQU1IgdGhlbiB0aGVzZSBk
cGNkIHNob3VsZCBhbHJlYWR5IGJlIGF2YWlsYWJsZS4NCj4gDQo+IEhpIEFydW4sDQo+IA0KPiBU
aGUgZmlyc3QgY2FsbCBmb3IgaW50ZWxfcHNyX2luaXRfZHBjZCgpIGdldCBjYWxsZWQgZnJvbSBp
bnRlbF9lZHBfaW5pdF9kcGNkKCkNCj4gd2hpY2ggaXMgbm90IHJlYWNoYWJsZSBmb3IgRFAuDQo+
IFNvLCBpbiB0aGlzIHBhdGNoIG5lZWQgdG8gYWRkIGludGVsX3Bzcl9pbml0X2RwY2QoKSBmb3Ig
RFAobm9uLWVkcCkgaW4NCj4gaW50ZWxfcHNyX2luaXQoKS4NCj4gUGFuZWwgcmVwbGF5IGluaXRp
YWxpemF0aW9uIGFkZGVkIGluIGludGVsX3Bzcl9pbml0KCkgYXMgcGVyIHByZXZpb3VzIGZlZWRi
YWNrIGp1c3QNCj4gdG8gYWxpZ24gcGFuZWwtcmVwbGF5IHdpdGggcHNyIGZyYW1ld29yay4NCj4g
DQpSZXZpZXdlZC1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQoN
ClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0N
Cg0KPiBSZWdhcmRzLA0KPiBBbmltZXNoDQo+ID4NCj4gPiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+
ID4gQXJ1biBSIE11cnRoeQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiA+IENj
OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gPiA+IENjOiBB
cnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gPiA+IENjOiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5pbWVz
aCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIHwgMyArKysNCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+ID4gaW5kZXggZjk4MzcwMDFhYTVm
Li5hMmUwNjM3YzUzZmIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Bzci5jDQo+ID4gPiBAQCAtMjczOCw2ICsyNzM4LDkgQEAgdm9pZCBpbnRlbF9w
c3JfaW5pdChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQ0KPiA+ID4gIAlpZiAoIShIQVNfUFNS
KGRldl9wcml2KSB8fCBIQVNfRFAyMChkZXZfcHJpdikpKQ0KPiA+ID4gIAkJcmV0dXJuOw0KPiA+
ID4NCj4gPiA+ICsJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKQ0KPiA+ID4gKwkJaW50
ZWxfcHNyX2luaXRfZHBjZChpbnRlbF9kcCk7DQo+ID4gPiArDQo+ID4gPiAgCS8qDQo+ID4gPiAg
CSAqIEhTVyBzcGVjIGV4cGxpY2l0bHkgc2F5cyBQU1IgaXMgdGllZCB0byBwb3J0IEEuDQo+ID4g
PiAgCSAqIEJEVysgcGxhdGZvcm1zIGhhdmUgYSBpbnN0YW5jZSBvZiBQU1IgcmVnaXN0ZXJzIHBl
ciB0cmFuc2NvZGVyDQo+ID4gPiBidXQNCj4gPiA+IC0tDQo+ID4gPiAyLjI5LjANCg0K
