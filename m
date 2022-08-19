Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B3059954C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 08:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3E410E78B;
	Fri, 19 Aug 2022 06:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481E4890CD;
 Fri, 19 Aug 2022 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660890631; x=1692426631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7oAYezxuepTrxo+iZXth5HCFvEXCBMSgHoN3KXz3A/g=;
 b=GlaCSKs6ZpotBAdnQ+wRMrabQovDxlLQOhuPsgxOtUhhv1SDYoZKXvK1
 85DyFF0zsfqobekLMn1rg6EPpor559NUuzLJHsN/33X2FyLuVeKfwz0R7
 PYME92E5W4Y33YCA2tO0fYDikUCWrhWKmYsD3h3fgve4Txsb/2dgUFfgW
 5KpLQ51JbVHfjrcmG9cIqQgvZlyQ1WD0cWmspf/5FQKgYPyVtl+7MZQJc
 0dZmzmmz4rEJ4672v59D6+WAsMDlPosMywr4q6KbeptKbYGjzEGmAckIS
 JDCcGQZCyu91uZpnsDxYx8PhNPg9WmZeV25wVQiPpmoBoBbeyiND+TU+3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="354688459"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="354688459"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 23:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="558834711"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 18 Aug 2022 23:30:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 18 Aug 2022 23:30:30 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 23:30:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 18 Aug 2022 23:30:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 18 Aug 2022 23:30:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gB7O7wptewQL/iV7TVuWunZQQ5rvPI9p8r48w3weu6KSdAIB4wmbtufokmEqt33w/UAAGKCL9uZN3G7+CIbyhk3q3oMwihxsYPJzbJkaH3O3j3tYQNBUiIQy7WvzcVVPIdW4mCLWSV8Xt2b34aTUkgZsa/F0clU7dQDndeN6e/Xn3HFNSQ7av63hm7XsqnYWnBk/x5OJyb679h891nYbxTzBZXeetsRrH5NmCzaHqKMIbkZrppXwSLLeoHXKDVm/FR2qg9I04VpEgVlBD/jHIWqsuA119uNoH8gT+XjkIv5ocN+jA3H2xuv8AH1alWEkZoCpL/4CaMdKZsrg0vyEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oAYezxuepTrxo+iZXth5HCFvEXCBMSgHoN3KXz3A/g=;
 b=FHYxu7GsEKxNiwiEkZrNmelgNTMJ1WAWGxkb3fypEEHEBXu/7HbF2r0NzuGTy9z7gWlcMX/5w0y9IQs4C0HKaEEZAJH8AcORxJF2UNDnNt98aHrP7pf4s0KXcrc09KChZLuaqYf/LbDFaIokkVX7ZEbKobvr+/SD3GiCY0KLSJ+uHOvxGypR4eYmBOQEUP8FZh7L/FUp2kHeK1dUlKWce37JwfbUiZuONJ6yBI8hizHKgLgUuqQx2DaQniEwDB3BQXf6RJNubXX1PBG5kZ3E1cDNmone8azBuXH+AqkcJK+WVC6ANynbM8ksX2f4IyV8jjWUYOW078DOxiGDhOCj6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY4PR1101MB2152.namprd11.prod.outlook.com (2603:10b6:910:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 19 Aug
 2022 06:30:21 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fd9b:c721:15c5:50aa]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fd9b:c721:15c5:50aa%7]) with mapi id 15.20.5525.011; Fri, 19 Aug 2022
 06:30:21 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm: Use original src rect while
 initializing damage iterator
Thread-Topic: [Intel-gfx] [PATCH 1/3] drm: Use original src rect while
 initializing damage iterator
Thread-Index: AQHYmFH9/cgIngT/x0SE64A5V3kXLq2qDNkAgAvs0QA=
Date: Fri, 19 Aug 2022 06:30:21 +0000
Message-ID: <389bcc8371d4c47ac45db1a131faa67bbfb7ce75.camel@intel.com>
References: <20220715134958.2605746-1-jouni.hogander@intel.com>
 <20220715134958.2605746-2-jouni.hogander@intel.com>
 <YvUtGBkK7B3DZgjc@phenom.ffwll.local>
In-Reply-To: <YvUtGBkK7B3DZgjc@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ce624d5-c74f-438f-e938-08da81ac4ade
x-ms-traffictypediagnostic: CY4PR1101MB2152:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jY3bSyD2yGeXu6pdFGbPSM4MxSocAAbLefqof4yCs3I8v/MLaz18vKQiNMEe14TNBlwwor7T9TmlR1e3A9UXqVqMO1yVZ2mSZp948SJKz7Cn3AksZo0EtQ19uOPwtemieKlvq0A3MAqnriMZKa1bOstobjfoyKkbs/KZKvii2DwaVBCKn8Ne5ilH+jJIJDH+9/9QNHYWHV+jMDZnTYPEsoT4TI5fgw7Z1HE4Jl+JjVWddMYyBK0HF4Slb5OONVTSrFUDeE1+DCHUEi8sHwfH49EVOjR4ItUxFaqg3rk/qSAwc2U0+frGDR2d0+7EcIV+A81Wp+NMH5Yq5FO9UMhXFrwF3YtP6wixmaMq70BCRgc8FmtQgh0DGKpKc+2pUfrsGO0cw3rSLdCXbhH97Mb7zYpPdF7l62F9ogUbUFYO/m/yVLTWn4/n+HOdyMtp76U6vpjlO+fm0Bn0FhY/+rC9UmFDuRL2sAkw3GcaO4X1lVMjs6ivHleNxcgO62V4VCzbfryv2Fge7wt5yEI5CgGWjhVolDbyEtpLjVAJ7Log9lv7e4EeyLvtontTuTre1uKqItWytWv2PGZ1iEmdvqozAy740EkVUDSeVMdkwMa7Wo/PO4yuWRM3FMyxhB+Gc9vLLnUhEy7oHjWQkyjO6Rracn7BBW8dCdZUC1edAnNfoerblZU52Mj76YAx82caixrNjxT6aXjxwN6EV4+/PgRPlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(366004)(39860400002)(396003)(376002)(122000001)(6916009)(316002)(54906003)(82960400001)(36756003)(186003)(38100700002)(71200400001)(86362001)(2616005)(6486002)(6512007)(66574015)(5660300002)(38070700005)(478600001)(64756008)(91956017)(76116006)(66476007)(66946007)(966005)(8676002)(66556008)(66446008)(6506007)(8936002)(26005)(83380400001)(2906002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjhyODkzaHFPNlBkTWdOLzFjUHFkYjg3cmw2NFFZLyswM3RKQmFmUzlXQ0g1?=
 =?utf-8?B?WDVPK2JZQmlqcjZKSitRS3dFWEs2anlIeXlqWWM1UUFibFlaSVUxeXZybTZh?=
 =?utf-8?B?WWplOHNNTG1PM2t5eU9OaEhNdjRiZFBCNEhDNFlsMzRNcFRSdUdiWjI5SDVZ?=
 =?utf-8?B?dll6Kzhia2lKeEJibGhITkMxejhocXFHYmpNNWlsVm5nY0k5MGRHRTRidW9V?=
 =?utf-8?B?akpESmZrQnZtV00rYVR5aEpTaG1KbDNqTzR3L2tibTJCRFpUaHpiemx0cXNv?=
 =?utf-8?B?QW9wNHpOdVNpSFIvWXBxeHZDdXhWcU5NNDQ5TTlxQWVLaHJKTDFUQjBPa3Mx?=
 =?utf-8?B?ay8zVjFjOElTM1c3dGN5a2U3Qi9Bc0RPUTQ4cTlBL0hVNU5rZDIwZjl5d1VL?=
 =?utf-8?B?Z2syVFZCS2NWc1dhWEdRb3gxYWxBT0lvV2hTbG51L055dExjUm1LK1pyOUN6?=
 =?utf-8?B?QVF6RDh3N01sNWt3bDgzNmJZbExsTzBrWEozUUZNRWswUzhJUHpRNkxBbXBq?=
 =?utf-8?B?bFBmMzVsMmR1dEIwNnBEUkIrS1FXSUxmZkhWbHJ3bmNNb1FQVnlYK1BCWll5?=
 =?utf-8?B?QUlBdGdzM21qUSt0djFaZWRzZnhZbTd4b2I3ZmVDa3BMTmF1WkMvZ050TEpI?=
 =?utf-8?B?M3NIR2xxcEdUNVU0UnRIN0NlNUc0cFlOeERFZys1eWNNTXFuTlh5cDVWdy8z?=
 =?utf-8?B?K0pyUVIxcU9GTEhZM05KUExXRW9HcTJRZC9YVk9XNEJIcTltZzVTekx3WUZI?=
 =?utf-8?B?ZUYwK05iWjBoNkRrQ0VCN3RCQ3VSeWU2eVdOaEtFTHNHZ3VxdmIvZWZEQVRV?=
 =?utf-8?B?cUFiZzZEbkNnNVlzenl2YXpTYkxhSmVhdHBVdjhrek9VL2J3WHBmSDl1UTJX?=
 =?utf-8?B?Wk9CMkVXb1hyQ3AzNWpTRTJiNC91djJsMU95cXRzempaWHNFb1B6WGUwT3RH?=
 =?utf-8?B?WFNGVDYvSGNhYldOeGVmTHVqTnBHQ2ZvclNSdkllK1ZmYS9NUUtnc3BJcVB6?=
 =?utf-8?B?cC9QeHE0RmZ2SGJsSlgzRmx5RnJMeHo5VExVc0wwSVpWbExIVjBWN25QVU15?=
 =?utf-8?B?SDh2RG15UXZVWDhjRzFKNDROQnlUZlV6dHJXdmlaRTFBWTJIRDR6cVh6cGdi?=
 =?utf-8?B?UVdjaFk0VHFUT0pSNnd0R2VFclM3dmhHTGQ0a3JYeGI4U1hRUmw1d2dDUmR5?=
 =?utf-8?B?YjNzaW1Eemx1cWEySjBMSWlBMDQ1WmJvUW9MT2w4QlVkUVZZY1pkMDlabVdN?=
 =?utf-8?B?RlB1a1g3YjhZWExXSWRhMjM4YzRubnJEUkoxUXNWd0k5cHhOZW55MlY4d1BH?=
 =?utf-8?B?UmxhRDlPcDE4ekJURm1VR3k1bDdub2swTjFIdjJGTUZ6SmVhY0I0L2RWYXh6?=
 =?utf-8?B?cVVsOHQ1ODB4Y3lHV0JvS3pMcFdWNDJsd3ZaNDZFV2FLL3FrRXNuOGFXTE1H?=
 =?utf-8?B?eFlqa3hYODRpMW9RV0VFY09nUUFFTk56Z0hIcTZnck5KUjhNcnNZS2szWjYw?=
 =?utf-8?B?Qmc4MU15aVd1REpwK0RwdC9tYmQwdGFlaStQbzJGTmtjd2FyUEQ2K1R1Zkg5?=
 =?utf-8?B?RHNydnlXbEN1Rjc2bER5VldmSTJKZDJrY3FVWTRDbDFmUFRLcGc4UFZleS9w?=
 =?utf-8?B?WVl2V3JvNkliUVlYMVlYUVVNeWZmM0dTSW9DdmZ4TzcrSk51andoNzNuM3o5?=
 =?utf-8?B?b1F1TG5SaERxOCtXR3BYRzdYNWRCdVJlRFFwcDlmekNpM2UxVTdjQnc4ZmNU?=
 =?utf-8?B?YkJEdS81ZG5SSVplQWE4MW1IdlhvNXNmZTJMMXJXUWs5YVVQclU5T2FYZm1V?=
 =?utf-8?B?WllMZmNWNVBGdCtwSHB2QzcvbnY2MFdGS3hMcHMramNoZ1R2YzJmbXFPUUNq?=
 =?utf-8?B?dzlZY2xlc21XdnZYbThVazhIaXhtRDlSNVduU0VFWlhYY2tSQlUwdUhWRU1k?=
 =?utf-8?B?RDNBME9hSEFVMW9RdGMrV2kzcHR2REFzeUFGbTB5dy9XZ2VFWUEzMmw1STA3?=
 =?utf-8?B?ekRZbngvWWI5LzlqMjk0NVZiTFFsQTFLai9UNEZqaHkzNEdJQVROU25OLzFk?=
 =?utf-8?B?R2g5a0gxZEFCM01vYVlsMUtudGFOTFI5R1creUsrdlB1dE9Ud2V5ekpyVzRG?=
 =?utf-8?B?dlRrTUYwaXl3T1hnS3BtN2VGUnlvY2oxRlluMWVFM1FuOHVNSE8xOStKZW1U?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF143287677BC647B65874AF89B35F1E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce624d5-c74f-438f-e938-08da81ac4ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 06:30:21.6670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HtH904W7rU3c/H2Z/QpaQ1WBFAcgANANOyN8Fc20nFdoviYpBZ+x2qGaW9Zf0q8EEhwwpoI78QZr/flqIMmf7c94ZlzyG670yXYcC3BmYrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2152
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA4LTExIGF0IDE4OjIzICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBGcmksIEp1bCAxNSwgMjAyMiBhdCAwNDo0OTo1NlBNICswMzAwLCBKb3VuaSBIw7ZnYW5k
ZXIgd3JvdGU6DQo+ID4gZHJtX3BsYW5lX3N0YXRlLT5zcmMgbWlnaHQgYmUgbW9kaWZpZWQgYnkg
dGhlIGRyaXZlci4gVGhpcyBpcyBkb25lDQo+ID4gZS5nLiBpbiBpOTE1IGRyaXZlciB3aGVuIHRo
ZXJlIGlzIGJpZ2dlciBmcmFtZWJ1ZmZlciB0aGFuIHRoZSBwbGFuZQ0KPiA+IGFuZCB0aGVyZSBp
cyBzb21lIG9mZnNldCB3aXRoaW4gZnJhbWVidWZmZXIuIEk5MTUgZHJpdmVyIGNhbGN1bGF0ZXMN
Cj4gPiBzZXBhcmF0ZSBvZmZzZXQgYW5kIGFkanVzdHMgc3JjIHJlY3QgY29vcmRzIHRvIGJlIHJl
bGF0aXZlIHRvIHRoaXMNCj4gPiBvZmZzZXQuIERhbWFnZSBjbGlwcyBhcmUgc3RpbGwgcmVsYXRp
dmUgdG8gb3JpZ2luYWwgc3JjIGNvb3Jkcw0KPiA+IHByb3ZpZGVkIGJ5IHVzZXItc3BhY2UuDQo+
ID4gDQo+ID4gVGhpcyBwYXRjaCBlbnN1cmVzIG9yaWdpbmFsIGNvb3JkaW5hdGVzIHByb3ZpZGVk
IGJ5IHVzZXItc3BhY2UgYXJlDQo+ID4gdXNlZCB3aGVuIGluaXRpbGlhemluZyBkYW1hZ2UgaXRl
cmF0b3IuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+DQo+IA0KPiBBaCBrdW5pdCB0ZXN0IGZvciB0aGlzIHdvdWxkIGJl
IGF3ZXNvbWUuIElpcmMgd2UgaGF2ZSBhIGZldyBhbHJlYWR5DQo+IGZvcg0KPiByZWN0L2RhbWFn
ZSBzdHVmZiwgZGVmbyBzaG91bGQgZXh0ZW5kL2ZpeCB0aG9zZS4NCg0KQ2FuIHlvdSBwbGVhc2Ug
cHJvdmlkZSBtZSBzb21lIHBvaW50ZXIgdG8gdGhlc2UgdGVzdHM/IEkgaGF2ZSB3cml0dGVuDQpl
YXJsaWVyIG9uZSBpZ3QgdGVzdCB3aGljaCByZXZlYWxzIHRoaXMgaXNzdWU6DQoNCmh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTAzNjYxLw0KaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMDQ0ODgvDQoNCj4gLURhbmllbA0KPiANCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMgfCAxMSArKysrKysr
LS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RhbWFnZV9oZWxw
ZXIuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMNCj4gPiBpbmRl
eCA5MzdiNjk5YWMyYTguLmQ4YjI5NTVlODhmZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RhbWFnZV9oZWxwZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZGFtYWdlX2hlbHBlci5jDQo+ID4gQEAgLTIyNCw2ICsyMjQsNyBAQCBkcm1fYXRvbWljX2hlbHBl
cl9kYW1hZ2VfaXRlcl9pbml0KHN0cnVjdA0KPiA+IGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9p
dGVyICppdGVyLA0KPiA+ICAJCQkJICAgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9zdGF0ZQ0KPiA+
ICpvbGRfc3RhdGUsDQo+ID4gIAkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpz
dGF0ZSkNCj4gPiAgew0KPiA+ICsJc3RydWN0IGRybV9yZWN0IHNyYzsNCj4gPiAgCW1lbXNldChp
dGVyLCAwLCBzaXplb2YoKml0ZXIpKTsNCj4gPiAgDQo+ID4gIAlpZiAoIXN0YXRlIHx8ICFzdGF0
ZS0+Y3J0YyB8fCAhc3RhdGUtPmZiIHx8ICFzdGF0ZS0+dmlzaWJsZSkNCj4gPiBAQCAtMjMzLDEw
ICsyMzQsMTIgQEAgZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJfaW5pdChzdHJ1Y3QNCj4g
PiBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlciAqaXRlciwNCj4gPiAgCWl0ZXItPm51bV9j
bGlwcyA9IGRybV9wbGFuZV9nZXRfZGFtYWdlX2NsaXBzX2NvdW50KHN0YXRlKTsNCj4gPiAgDQo+
ID4gIAkvKiBSb3VuZCBkb3duIGZvciB4MS95MSBhbmQgcm91bmQgdXAgZm9yIHgyL3kyIHRvIGNh
dGNoIGFsbA0KPiA+IHBpeGVscyAqLw0KPiA+IC0JaXRlci0+cGxhbmVfc3JjLngxID0gc3RhdGUt
PnNyYy54MSA+PiAxNjsNCj4gPiAtCWl0ZXItPnBsYW5lX3NyYy55MSA9IHN0YXRlLT5zcmMueTEg
Pj4gMTY7DQo+ID4gLQlpdGVyLT5wbGFuZV9zcmMueDIgPSAoc3RhdGUtPnNyYy54MiA+PiAxNikg
KyAhIShzdGF0ZS0+c3JjLngyICYNCj4gPiAweEZGRkYpOw0KPiA+IC0JaXRlci0+cGxhbmVfc3Jj
LnkyID0gKHN0YXRlLT5zcmMueTIgPj4gMTYpICsgISEoc3RhdGUtPnNyYy55MiAmDQo+ID4gMHhG
RkZGKTsNCj4gPiArCXNyYyA9IGRybV9wbGFuZV9zdGF0ZV9zcmMoc3RhdGUpOw0KPiA+ICsNCj4g
PiArCWl0ZXItPnBsYW5lX3NyYy54MSA9IHNyYy54MSA+PiAxNjsNCj4gPiArCWl0ZXItPnBsYW5l
X3NyYy55MSA9IHNyYy55MSA+PiAxNjsNCj4gPiArCWl0ZXItPnBsYW5lX3NyYy54MiA9IChzcmMu
eDIgPj4gMTYpICsgISEoc3JjLngyICYgMHhGRkZGKTsNCj4gPiArCWl0ZXItPnBsYW5lX3NyYy55
MiA9IChzcmMueTIgPj4gMTYpICsgISEoc3JjLnkyICYgMHhGRkZGKTsNCj4gPiAgDQo+ID4gIAlp
ZiAoIWl0ZXItPmNsaXBzIHx8ICFkcm1fcmVjdF9lcXVhbHMoJnN0YXRlLT5zcmMsICZvbGRfc3Rh
dGUtDQo+ID4gPnNyYykpIHsNCj4gPiAgCQlpdGVyLT5jbGlwcyA9IE5VTEw7DQo+ID4gLS0gDQo+
ID4gMi4yNS4xDQo+ID4gDQoNCg==
