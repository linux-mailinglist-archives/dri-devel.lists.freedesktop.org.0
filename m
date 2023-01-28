Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6850C67F324
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 01:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2763510E2DB;
	Sat, 28 Jan 2023 00:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE3D10E2DB;
 Sat, 28 Jan 2023 00:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674865643; x=1706401643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iFAWZHPghcBiNOD9tTLk6SD86VvpXItMBRsuMiTGrHQ=;
 b=L82bMCG+H93KlivK9z2iEtcXhqi33Iuk4t3qxD0HVSi2AOihG2vn3bpd
 DfnI2gJyvHZFABylgaqxm4qzGX8gHdtt/k32OLaGw9TVPVEygPJqY5A/Q
 YzAbZbN9s88SFpDWH5SbyxIhWmJtwlba8ByNlapvWaXln1FENwyJyeGVN
 77Pw33rrpxhjMNMjkuitE6sxXcjx/797m1BMeK5FXHtH8P6GAcZreaZ8g
 xhaCewJt5T46qWmIFHg5FWxXtgtuEKQ+LdwTgJAlm3Wm+NvVOTtI2HwUq
 KUlynSYx9Zlh/z2MK5OnBITFaLvGBkiJOQW48cFWXFgkom7Gqz4EhQC9H w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="413453864"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="413453864"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 16:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="613378146"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="613378146"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 27 Jan 2023 16:27:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 16:27:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 16:27:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 16:27:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 16:27:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FelKUcmEW7HRkVuAa3yA6jbtYG0CPmE9gb90mj7DVxBii8hGiJc9lBRG+U8ixyA+lvvK5Els0jAlAzSTDE3+mtFCi+/Oc6ub9CvNjErUmZrkIXwbsMOQpgc0v4s7OAjSdEX249wN94GEMUKJ1XEsE9QBXMSOe4OwKzvPUn3sTqzeKj5sufsc1V6Quj903wAK9f60jAzmFC4nCLt0JJXTfqYzEGRqXp7wMWULczB1HO7XauONh3Vi/5vV65HLoQvoUcMi2nN7IVG6QTPozkkYbQ/JAE9/0ARpVn6+U7Wb5nY8PkvOZaT34x4s0uGx5eSAbjJUcbxKuNImGrhEVoqEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFAWZHPghcBiNOD9tTLk6SD86VvpXItMBRsuMiTGrHQ=;
 b=c0NhGCg8det1FNp8fLL0QPu09kdzp1vNhwxjeCyArL62TT2q8ZMWbrkFclHnNt0erB4TfcqYS8v6Q8RtX/bq99WCz+XSBEGYXiyiEdHaAHJhEiJg/HDpEKTTBwfIHPhv8vAhV5KEfLMvASVmd5Y3UptPG4oy+j9KfeqUp594dQQhxifV2bjILsJqp28ld7AQ369BnjVssmrHB4x3SlhDvxlT9X9k+ldG8fwMJ0MnrIRZFunDWrNzc5y7lXYoO5mr+hgFkSVsOL2XfLEoos/pfMQnZuBcF6MakpRLXWTXmhtS2VOcXtzfuYHXMLCmCstJerw5Ms+fDl5pHUh4ykDZmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22; Sat, 28 Jan 2023 00:27:18 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%5]) with mapi id 15.20.6043.028; Sat, 28 Jan 2023
 00:27:18 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/8] drm/i915/pxp: Add ARB session creation with new
 PXP API Ver4.3
Thread-Topic: [PATCH v3 5/8] drm/i915/pxp: Add ARB session creation with new
 PXP API Ver4.3
Thread-Index: AQHZMJQIKpuLrWVPBkya667t3xdJFK6y/WQA
Date: Sat, 28 Jan 2023 00:27:17 +0000
Message-ID: <7b44b5c426d54be43ecab694e2aaf677fe0ab012.camel@intel.com>
References: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
 <20230125080651.100223-6-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230125080651.100223-6-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW3PR11MB4697:EE_
x-ms-office365-filtering-correlation-id: d298d94f-5200-4619-6493-08db00c669af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y+1xEZYVFG4ySfPbcnABU3L/N32EirWNOzKNXHlHj2tBYC8D1ptp+l1uFDAlwtl/WyPlqFFRlBrT59z5C3BqdYeZiFThgOz73GOH7iWL3sYOUS75zcHZvcQV2sv8r/H2q3FRxrmeIKc6aDS9WGwKpIf1V4ZZo3aGBRFV0YK/6zTLPGsc2SXA58UeTegogmpgSS1EHUigvQbbeZ9WAukbxJ7lvDPqc+SMUZkkdoaSqJgwVdS9uh5QattVVvU0IOT35HVaV/jBLeVm6/k8wMXtMBE8tGW7AGaZMlMDS1xJZ9bAcGx9KH4KzazrcQ7AIv3LcbZUtGCDiQHgzHIOi1M3dM+LnlMdz5EnkTD3VejsRzjxQQ83CnwFz2VnYXYGyXbReotQ5DhXAW/ruXLwqw0PRHtdxyU+PJ1Ucyb9Shrf5+J/5Vmd6PsqVJoZZTBn5p9IM21/SHtnIEKjqFwu7/3H7yYVEHRkaw6vvSfloED/UJgulK7Z/ZUrvEqSGIhJcnz1TmieS/iOAsdf7P/l1SQO6kqyl5RXo//EGq7S2TsO9Bf3K5SoUBwCaUo0MIHo5zgwWR7MOcuKJnh/5bXFVfdgyXp5BUhyEUOhUKYOGgGdqVANhUDRIH1Lhja2vQgrncFxj2YWxPmm700vAgraNEQ+qQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199018)(122000001)(64756008)(316002)(54906003)(38100700002)(41300700001)(8676002)(66476007)(36756003)(76116006)(6916009)(4744005)(91956017)(8936002)(38070700005)(66556008)(66946007)(4326008)(86362001)(5660300002)(2906002)(66446008)(82960400001)(6506007)(26005)(478600001)(6512007)(186003)(6486002)(107886003)(71200400001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUowajJ0aVZFVDQ4QUNjWUdBVzc1NjRQTTQwMXZPeFdrOUtYSXZPbjBTUGU1?=
 =?utf-8?B?cVUwRk5RUFRNSE9oVWNEWEwvYko3R3lDb1hQNkU2bWFBN0Jjcm5uM3lUZjZD?=
 =?utf-8?B?T3hyUkxqOFJ0Q1Rhb1NXV0VzSVZlb3Q2Qm1GZFlzUkl0Vm0yQWZYVk5HQ2l1?=
 =?utf-8?B?dXY2NXZaa215WEJRNjZteXM2ckx5WlFuYnhob09PcElncFlMRitFN0xydmlr?=
 =?utf-8?B?V1B1VUR6VDBpWTE0cUk0TVZkdkhFdVZ4V0llZXFLK0FEWGs4dDRBNnRPM0o4?=
 =?utf-8?B?aE1EUmptZnhkT01Nb2ZOdGVPR3FoUWRoOVRLcGZMM1BqK0IxQXRhQjNobTJ3?=
 =?utf-8?B?Ny9ITEhCOGo2NGV0ajltbGhPYk1RR2loaEd4bnNGUmh2UVhjN0dTUEZkMENT?=
 =?utf-8?B?S0dCRE9rTmZPWUgyQ3BMbWFvaWp0dXNncTRKMVBUaU5ZSHcrTldJaFpDVGd3?=
 =?utf-8?B?SEU3THVQelU4TTNZSFltcXdjRmFPd05ubTl6UHVTZmc4RVJRUFQ2N241eXEx?=
 =?utf-8?B?VWpFYXgyMWxjWC9EcDhOV0FHaGdQcGlZekp0cml6c3NySTBvalRVenYraXpy?=
 =?utf-8?B?WlllcEgxcTlIVlljY1U0d2F4WFpreFNWNE1tZ1I2R1RUVmZzQUVBM28vTngw?=
 =?utf-8?B?SFNjVjltWG93dGhzdCtvOGgvWlhOcjIweWl5c1FLN3hkTXFFWkFJckkwaHl1?=
 =?utf-8?B?NjU4SE56Vi90TEtZMXAwWVNZT2VlL2gramdXZDlGa0U5SmEwYTdSZWVXQVdl?=
 =?utf-8?B?d3V6dWxqN1NnTGRuVWVuOC84bi9zSVB3VWpaVHlvSlhWOEM0QXdFcitlZGxn?=
 =?utf-8?B?M3lkTmx2VjZRMVI1dGEraldFaVBqUXl0K3dUSmVad3lyVFgzYk80NE1ZQmc3?=
 =?utf-8?B?SzVmaitSbDgxRU11RDhoRE9jTXdzckNVTE1QQmlIOHZWRGhwRC9SQktDa3RC?=
 =?utf-8?B?aEdDeTYrd1M5TjVkSHVRdGZrNERlL2lLbkliZE82dmZINVRZWk1GSmxaT1gr?=
 =?utf-8?B?U212YllMVGtTVkErbDlhNmEzQVpxM2xzcXh2ZjNqdHplYldpd0xIYjdBWXlF?=
 =?utf-8?B?SWVBcDVzSXZ2OVBkRUl6L0w3dm1VYnlTRDh6bkdNZnVQZnZDR3EydmVWanpq?=
 =?utf-8?B?dWUxdlRtUjNwM3FkSE83bnhHd1VmVEIxcVBQNVRzRHBiL3UxQmpBc3BuNFY4?=
 =?utf-8?B?SUsxU1hiakVRdDF4Ykc3ZkVaN3daU2ttQmxhZ1lyQThscG1FdjdsVkxKdHZq?=
 =?utf-8?B?Q0k0VVRNYkxab1VBSmUvaU85a00vZWNpZ3VmZFp5Qm9ZVk1GaUNwUjJoZGFx?=
 =?utf-8?B?cy94dE5DeVRvc2NmazlLUWp3N3ZKM1J0UG1LdFpzMThzazdHclhkbkIyRDd2?=
 =?utf-8?B?VFFKTWYxTldGL2tqRjhVQlVpOFBIU2Z4bXAwUXM1bVRLOHNBN01ITWROTjdm?=
 =?utf-8?B?YWkvUzM3eWdTTGN1K3pBMXdMY3h2Y3k5UE9DaWVqL2hUSVV4Wmpud0VKY2xK?=
 =?utf-8?B?cWlweERRd0FRQ0dQOTEyakQvSUpJTTA0MU5CeXZLTHpTUlovN1dvakk1c2xL?=
 =?utf-8?B?UkRuT2pZR3MyZEw0RlpiSWwrLzBxeHU0Q3kxeGF6MDdnOGgwekJPekNuUnNi?=
 =?utf-8?B?ZU40MG8yM2FHckF0RmNVVGo3Nkl6L2FGSzZKSXEwWFRZTEEvemJVejJxakh4?=
 =?utf-8?B?T2VOamxIcHdRV1hlUFVCM3E3M0NnS1VobkVZd3FNSHBlWUQ3UUw5a1BORW9J?=
 =?utf-8?B?WUN1SXdmdmJESUdoVU4xTUpCNVZVbHVjM0kyalRib1BFVllXQldIM2tFQWtu?=
 =?utf-8?B?bmpqQnM5OGpKWnkvbWtKTDlwNU12ZkptTWVwd1VPRmtmQ0FxTkpDa2QwUDIx?=
 =?utf-8?B?c2FOMFRjandtdU9nc2twaSs2aE1tUnlnOGZuZ3ovb0lqSExzakd1SUJwSDZ2?=
 =?utf-8?B?Yzl1VnRYU0V0S1c5VG1nTDQyaERucHpkeVRhN0xuOFdtQjZsRUViYkJMdFJO?=
 =?utf-8?B?UC9pWFFTSElUMTZxZVdHOWF5dkNwMGNKZ1hBb3l2aVdRcE5xdXlhU0V0eDN5?=
 =?utf-8?B?WU1IZTRySWs3bkx0bGVremxVYURqTlNyeGhCS1BSQ3ZPMzN2RUVlak1uNlZY?=
 =?utf-8?B?TWFqRjRwMHFza29ROUJkQkJwMUdSMHFjcG8xTTRwZ0RwelY2Yi82bjlNb3VZ?=
 =?utf-8?Q?k6SC7j5/J4tN1j/SPrxY1bH2Q6znDonig8Rdp1tX8L8G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8A6C73117E8C64CA4D003F0FED35C5B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d298d94f-5200-4619-6493-08db00c669af
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2023 00:27:17.9215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xHWxJYnx18ZKM44+L+WDSgohdWcK8MjQb+Kuf9a5uCcmP8Y3VyS9P2u2skQ+r7IgrR0mJvxTXoDVZymZTDMSJo5rRvYVkk78w5tlbZtGLIZkOg0/KN18fO/FcecvPvVk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
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

V2l0aCB0aGUgYWNjZXB0YW5jZSBvZiB0aGUgZXhwbGljaXQtcHgtZnctY21kLXRlcm1pbmF0aW9u
IHNlcmllcyB1cHN0cmVhbQ0KKGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJp
ZXMvMTEzMzA3LyksIHRoaXMgcGF0Y2ggIzUgb2YgdGhpcw0Kc2VyaWVzIHdpbGwgbmVlZCBhIHJl
cmV2IHdpdGggdGhlIGFkZGl0aW9uIG9mIE1UTCdzIHZlcnNpb24gb2YgdGhlDQpleHBsaWNpdCB0
ZXJtaW5hdGlvbiBhcyB3ZWxsLg0KDQouLi5hbGFuDQoNCk9uIFdlZCwgMjAyMy0wMS0yNSBhdCAw
MDowNiAtMDgwMCwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gQWRkIE1UTCdz
IGZ1bmN0aW9uIGZvciBBUkIgc2Vzc2lvbiBjcmVhdGlvbiB1c2luZyBQWFAgZmlybXdhcmUNCj4g
dmVyc2lvbiA0LjMgQUJJIHN0cnVjdHVyZSBmb3JtYXQuDQo+IA0KPiBCZWZvcmUgY2hlY2tpbmcg
dGhlIHJldHVybiBzdGF0dXMsIGxvb2sgYXQgdGhlIEdTQy1DUy1NZW0tSGVhZGVyJ3MNCj4gcGVu
ZGluZy1iaXQgd2hpY2ggbWVhbnMgdGhlIEdTQyBmaXJtd2FyZSBpcyBidXN5IGFuZCB3ZSBzaG91
bGQNCj4gcmVzdWJtaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5w
cmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gLS0tDQphbGFuOnNuaXANCg==
