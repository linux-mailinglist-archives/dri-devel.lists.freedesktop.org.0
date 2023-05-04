Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F06F647F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 07:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB6610E38B;
	Thu,  4 May 2023 05:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B53E10E38B;
 Thu,  4 May 2023 05:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683178984; x=1714714984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o2R+6qEqM2uY7kxm0LUCayY8sBjYfZ0fxqQ0B4UJDWY=;
 b=CxX3/Pfa1bq4/72L3PpttlGOIOh/zQnCPnSA3xjuKPlG3oJEWxCsPON2
 1zdw37jCdbv+iNy6oZ/dJgjmc0LcG1f7Db3Zhxdg6uQq6/rDPBOeObGpf
 ufzssANmDj6sSppplln8CzQNrqbsp2wEg8cmRHxgfJDrzJ9dll/4yhxdW
 Y5SzTsiP3eD0WPBELtKuRpW7OB47/xH4hVDsK8CxTM9dcA6SOm67paw71
 mDzbhE9CwavMHOwIPW8+wmlt8g+aA8TWvikdYAYgPfsmRjvA2u1mBc+TJ
 +b6DrKHxNl6Ho7ZKbEIwuOtWpMHS+Rmennm4jKBLVOFONCJhQg25DDQ/A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="435145964"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="435145964"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 22:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674405981"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674405981"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 03 May 2023 22:43:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 22:43:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 22:43:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 22:43:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 22:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKR1QuSwR33ornwJ0uDv844SxvIvWbUM+EBhMSZEinc049sctgd3Y4/gmEMSEzEF67Ms80dYxl1HDlvn6+zxxQq0y2s6zDA/8mJkZ0hW32uuYG9r29tSU1ZjpCKaEnAmXTQx0wSmbsxFEXPtELmxPSx0qZEIkMQMIqZPerBXZnZIv02O6AfuLRiE8ymhWFMvq/Ke+bpoq4wa6Mfp0eLxHbzedhkCTXGdOUlecnBDXsermPJqYQKPd/+u5+cNTIJ2J7aBjDWt+x4zY6vc1iy/0IGz/NzNR3aNa6UG3SQO+B6RhwV1XC0T9zalxSLzfFCOclc662ScHcZmnMtNCbgwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2R+6qEqM2uY7kxm0LUCayY8sBjYfZ0fxqQ0B4UJDWY=;
 b=YLCMnWnbAH57rCeDoboV5JJ+wja667MWHcCiMogr00DRQyDh9QCusmaf2tKj4FeWUjOlyMExKoExR4nmx0mXRxQSs7xckL/Acr3hZDV5K8roN3WXnAfMnGehWMhNAa0Id2fm+CHTf7CMIabYXKRwN8Nuyt7eI4xeR9ZRXfjZZWTf5mk7FnMUGI2ZoYRM3k4hgKtL6R+EX6aOhf/W3JrM5xLzdbJtJO71s62JXNFQ0LKchbubyCd8p8KlEPJ/3zaA976sRJcOzTp0wx+gkniZOOHF2tGswFga2d5gqNWUSJ3IswEzdANAR3FswSdH7MRkbwaKG3Fq5l5HweUauRcEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 05:42:54 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 05:42:54 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/4] mei: gsc_proxy: add gsc proxy driver
Thread-Topic: [PATCH v3 2/4] mei: gsc_proxy: add gsc proxy driver
Thread-Index: AQHZfRSqzb9U0JtpzUS9e+cbfQgsUK9JnF8A
Date: Thu, 4 May 2023 05:42:54 +0000
Message-ID: <6d04273a2702c21f6902be62104392cb9830b89a.camel@intel.com>
References: <20230502163854.317653-1-daniele.ceraolospurio@intel.com>
 <20230502163854.317653-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230502163854.317653-3-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB4778:EE_
x-ms-office365-filtering-correlation-id: 750c84e4-dfef-420a-4a07-08db4c626872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qoMzQsypqfpSTln2R4FMzW2UsXS5WP0Nl7Yjxv/eS31UtPKUCc5dGoUbX6+Yy+jabKXAinOm7R7JCRxHu6W9Ycacip5JyhjrRnNgraiXYkPVjUpabzeUoJefhmMjLyhnCfr8geTBfzIWxNDdLGHOZo4xhUyYbHaJlF66zPkqpx7z+VvI7TgeN7TdZwovLBZ/00T7DUIGz/ZCCZNxtn4sc+n0vREfhM78LUGn8YIkXhzheyPo7NMGNFrosT0XVSJkg5IKBjhLpX03ejHSYS+kDv15S/c+mpBz7CzWZJ6l467DaVg9u/B7Cc/PWcQnFRVzNSTmgoWqJ+1zdWgOs8nngojlke1ew6Rl/zu2MoxTOYIu0OaUywEzDC9CN3CiljIcms4gw+9TpF5xH/5+iepUhklj6YIcCxs2uKmXKjJPFpX4FZKXMrZXk01i1R1zeCwxMjaQW7Is/xhH1SmZg94gbKwfxrxzuX5RkvE9U1QQ7YDjnZCH/qdUwaThOoAtf4IgxwY0zUj/CeOKU3pvKfIrjOSc9bWAvyb1jxXKC/ccJgRTWXsc/jXMJFVxiZ9X84Kkahgw8Sa3hImrYqVdcEIwtQ4WvukdtjCzny0SPojRhf7j3xtPEGjHM51ResfoY2IQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(71200400001)(38100700002)(110136005)(86362001)(478600001)(54906003)(38070700005)(83380400001)(186003)(6506007)(6512007)(26005)(2616005)(36756003)(6486002)(122000001)(82960400001)(5660300002)(8676002)(8936002)(41300700001)(64756008)(2906002)(4744005)(91956017)(316002)(76116006)(66446008)(66476007)(66556008)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3k5UDhhWXpKbGM3Uloxc1gxOFJuS2lVcHlqbjBMc3J5NURuMUdmT0RJZ2hO?=
 =?utf-8?B?VTgweElTZEd1OWJQU0V1UU1oT0tsMXd5b3FYdmNwSDlmWDgzMlh1NThTM2li?=
 =?utf-8?B?dEhhWkh4dkF3dDg0bVBnN2h0ZVRMYVQyb2plVDhXR2VhQnQ4SDlPeDdSMmg2?=
 =?utf-8?B?cU02S0dYL2VlUjR0OXhBNHpEUDNsTW5odjc3REFCM2VNMm9paUFlRWUyVHBO?=
 =?utf-8?B?RXdQMUxWUnU2clA3NTh1b1daMk5sQnRpREc5Mml6dG5RdG1nZ3JNbTFVd3F1?=
 =?utf-8?B?ZXNYaUtvcXdjK0FYaHc3MEZJbnVmM3BseE9lVzQ3WER3dytsUzMrdGthdmhM?=
 =?utf-8?B?NmdiU25XZ1FhQ1BpOXB5U2ZYNXc5ckprTEVYbnJuT00wNEE3dFZSckxLT2Q2?=
 =?utf-8?B?Uit5SXYwalhHOVlxZjlsSnhlVjJiU2tiSFUyaW0wV2dDVk51UkFTbk45UHg2?=
 =?utf-8?B?dHlPT0J6VmdEQm1vVGF6S3FDa08zNGI4NWhzSTZWWW1RZ2YvWXZhbUx2aXMw?=
 =?utf-8?B?Y000YlRPYVROaXpXMzRsaml5NGlrVXFVS2xuN1NORGorMEx2aDNNOUl6cnhs?=
 =?utf-8?B?eW40MCsvcXBJa1hYdGNKYWtkTjR3em9DbWE3NFAxb203bjhVSndtQzVYNHRQ?=
 =?utf-8?B?b3hKOCtZbWRyaHg1Q3J5dDZlTFFUMU9mTWxzU2ZHYm1wcUlpN2pydFN4ZlFF?=
 =?utf-8?B?SmZ6Yy9TNkxJUHFpbkJscENobkJtUDdZQ0U2OUtYeEdTcnlVWlJ1VEZ5SCt5?=
 =?utf-8?B?aWl1Z2gvTFo3TGdJaWlOR2VSTDhzcy9jOUNNRDk3b3o3WTh2SHlTS3JBVVU2?=
 =?utf-8?B?UG5ycVJqWXVsVG9TREVrTVp2WU85NjhLQlFXZmhCYlRTK3N1QktLYTJqeWFN?=
 =?utf-8?B?SkdSbm00b2tUdi9oREU5MmZOZVRzSldMTlM1cW1sbExNNDEyOHpUT3lNcXla?=
 =?utf-8?B?N0dwZUR4TkVNNGVuQ2VTeUtvYklWZld0R2M3a0hZWnJscVA4dVEwTHRQTjdv?=
 =?utf-8?B?RGxsUm9tVjlLbmFRVURNcURDUHBxb3JGZWJzdzlSU3hWamZ4bzA0eFI2S3NF?=
 =?utf-8?B?NnhFTk9QSlI0ZFhBK3NjZGxEK0JIWlo3dVhrY0VEWjkyUkR6WW9LZ0Y1V2RT?=
 =?utf-8?B?Ri91NTJTN3lpTUhuYXEvREFJZ3lkS0RkL1RXb082N3h6UmsxdFZsTnNram81?=
 =?utf-8?B?KzZGVkpISzM2bzZMQnN6Nkhndzh5RG40YkdNN2M2SWxNMG1xOHM5SjRmOGx3?=
 =?utf-8?B?Q1pOMFAyM2ljTHFyTHhtRUJwQUI5bHJYaWtNWG5UTWFmWnJ5NnJJandLeEd6?=
 =?utf-8?B?dDNCNTQ5UUVrbm4rTnMwZUpLT3RyenBHdDNUOG1Jb3JEMi9GWWRVK29wRjNK?=
 =?utf-8?B?bldlZkRVSDFpUGZZek81VU5hVjlnQzVRQ2ZLZjlsbXpZSUo0Yy80VTNBd0Nt?=
 =?utf-8?B?cGEzYkhFVjFJYUpxcWVNUE1BbEJoa1BDKzR6T0tWQTFKRzJlS1FIcE1jRTlV?=
 =?utf-8?B?ektVb3h1Y3pac2VNMDdhTDJMcmM3dDN6SGk1VExqTUhFc1Z2N3YzdmIyNVZG?=
 =?utf-8?B?MnRjTmhxSlE3cFRPSXlPQ05XaVR3WU1QOU5GT29nVWtjZ084MlFTZGQxUmpL?=
 =?utf-8?B?ZWdrVUtud1JvbFVJMWdVRW5TbDFxK3U3RWl3Z04wTFRaWGdYRTY0YVBPM2Vs?=
 =?utf-8?B?ZFNMT3NmRjQzODArL0VYemowNDZ4dEVtaVdIek9yVjJoT0JSa29KZG5adUtL?=
 =?utf-8?B?TlBpUEtHMjBVcjNXYUtqYStxUHhJV1dIcUlSTkozM2drcytZNWU3dm95ZXJp?=
 =?utf-8?B?TFh4NmUyVSsyR3FOSE9YZUNLWGdNdDhoOU1ka3dhaWJ0Y1Uxc2hUZEdTb0Fw?=
 =?utf-8?B?THpqVzFrTUNOUXI2OWxIYm5xSFA3dHFwdytqcE9RQmFHZWJSYTZXM2NsZFNY?=
 =?utf-8?B?c0s1MTd0NE5XS0NwdFZLLzROQTBGYkhpYVRqKyt4aEVObWxMVXR0ckdzQ3NG?=
 =?utf-8?B?ZENuazdUWVlLOGtVcEg3ZmJPSlhTeUdQQ29aNnVDd0duVnRqMlFjZHZkYVdN?=
 =?utf-8?B?MWpSNlUvK20rZUNPVXhTWlpHYlFRdVFTWFJVUkV5NVAvakVJV1k5TGVLVnls?=
 =?utf-8?B?Qzk2d0diOUtycW1IVlNPNUVyR3VVSVVZeGl1M09zOWVEZUh2RnNvU1RwQWIy?=
 =?utf-8?Q?0niNIOCketSOntOGteImkbM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFF08E00075BCB4D84E3A7B1DE9C3FA3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750c84e4-dfef-420a-4a07-08db4c626872
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 05:42:54.5624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGVJslHc9/K51eSbkOVaVACHC358eV1vzjWbhj26rrqi/R4ES+f9icD+7ot9R4RU+wy0i9xIlt5DDW/9BLXtuXWs2YxXdst7uIXuXZI4wi5aPgVDGBSr3mLX5bmtIuAJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugb25seSBoYWQgbml0cyBiZWZvcmUgYW5kIGFsbCBzb3J0ZWQgbm93LCBzby4uDQpSZXZpZXdl
ZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoN
Ck9uIFR1ZSwgMjAyMy0wNS0wMiBhdCAwOTozOCAtMDcwMCwgQ2VyYW9sbyBTcHVyaW8sIERhbmll
bGUgd3JvdGU6DQo+IEZyb206IEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBp
bnRlbC5jb20+DQo+IA0KPiBBZGQgR1NDIHByb3h5IGRyaXZlci4gSXQgdG8gYWxsb3dzIG1lc3Nh
Z2luZyBiZXR3ZWVuIEdTQyBjb21wb25lbnQNCj4gb24gSW50ZWwgZ3JhcGhpY3MgY2FyZCBhbmQg
Q1NFIGRldmljZS4NCj4gDQo+IENjOiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxl
eGlzQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhh
bmRlci51c3lza2luQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVG9tYXMgV2lua2xlciA8
dG9tYXMud2lua2xlckBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IEFja2VkLWJ5OiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiAtLS0NCj4g
DQo+IHYyOiByZS1vcmRlciBpbmNsdWRlcywgZHJvcCByZWZlcmVuY2UgdG8gIm9uIGJvYXJkIiBj
YXJkIGluIGNvbW1pdA0KPiBtZXNzYWdlIGFuZCBjb21tZW50cy4NCg0K
