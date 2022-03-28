Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F084E9E82
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1391B10E11F;
	Mon, 28 Mar 2022 17:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC5E10E75D;
 Mon, 28 Mar 2022 17:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648490301; x=1680026301;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YJBcHswVNNPD5VdUOuV5HvR7n9LqnGZZeucdGZ1aRwA=;
 b=nwzhiXvaECvwcZpJ25U5+md8+iRmdoP1rlTm3k2UJSgPxAQy+mKVDwcX
 ee4ta7VygA4dhRE8dotwXEJ8AyBBGbuyroEx8HUQc3LvPR0mEGhFcUDU9
 E99wJCaDAq5gmghbODnyoGcR0ycw2DuSTXFeNxO/x9K4qsuPlv1nWrUzf
 HfUrYqR2+dB0x8MNcBZXlhvnfsM9b1EifqkOhP2wXSyZ7p7ocvm+Dy/VJ
 S2Zsf6CtbqM1GxLb9Z5D08pJ5gvzliEf07lj3mWPapvTVLdxxkyxvr9Uk
 XloH4O67R7xve09kr3BdgqnZOUmeLOKSM1xDQRo8F+QMNfjalvMcQ1beN A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="257897965"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="257897965"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="546053589"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 28 Mar 2022 10:58:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 10:58:19 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 10:58:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 28 Mar 2022 10:58:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 28 Mar 2022 10:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFXsvXOI+CTW56t9xbGMJ6GaLl6ulKMUlkbjSD9xThVaBdbYSW+Cx2xNUy0P4+rSoy2ZrHIf8ac6n9MQ01yiodu+PTrGigNhfpcsg+buG8E622VItMK78WiZyprocFfrx0qvS6ArYDzEyPVKxLzY/AuLs7H5BFsDbQQkFhiuxrtDJJvoyKG6XjlEtsUXe370Itlh9TDmk/ovgay7wkrFVljlusygXG4QFPUSHIgp16nDT2is1uwnlhD+c1tQ/7eSWlsJdbU7Fx52am+4Xzvk1lCToMg9KlwPPF9M9/ozpiZ68trgsdqQ3+oqwxbXx26eC4lkVXtO0KptJX7Azm4dWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJBcHswVNNPD5VdUOuV5HvR7n9LqnGZZeucdGZ1aRwA=;
 b=H88jiI5RAsGdw/JHFNSjoEaIiJywkR4KnZuRcxeuFmI19FgOuPIMXWs5KRb4D3ZaO0blRgHdQUw0d/45zAXUobnb1TLCsIq4LBKDxm+dirKclC7UgvFrkHvQ/4wTzv0qImPsCdk6RpgRU1sx1cH2eKnQjqHvmaCr5mqLwHc4b4uYQe22tDoSQpJ0LLMc341qCp/dgMgFT8YLLkTqJ3YcetVEejJuSf8sXUYC/bQN4JVVnCJsMSNsIWzD5T9CrR9fw+Ut6IxfF9TTiWeYeFOXOPOYqgzfsaZr9KCGY25zAygt2ebX8lGfuLt4Gd2RSgm1havQ920H47XHrfM+qMKUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CH0PR11MB5298.namprd11.prod.outlook.com (2603:10b6:610:bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 17:58:14 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::f1ed:9074:5f82:150d]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::f1ed:9074:5f82:150d%7]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 17:58:14 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Index: AQHYQlML8hvQSM9IkUicDo8DlkegVazUeWEAgACX9KA=
Date: Mon, 28 Mar 2022 17:58:14 +0000
Message-ID: <BYAPR11MB2567A208A4D90835CAAC20E79A1D9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20220328031607.1810247-1-fei.yang@intel.com>
 <188a2a45-7f83-0ed1-0171-6596d918b225@linux.intel.com>
In-Reply-To: <188a2a45-7f83-0ed1-0171-6596d918b225@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2edc645b-ba83-4d88-8c56-08da10e48816
x-ms-traffictypediagnostic: CH0PR11MB5298:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR11MB5298FF66D6FA7B2F52E6E6A29A1D9@CH0PR11MB5298.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7yHjtT1huDXvoSA4huWMn6Ojeh7FOuTzjsYX3qjUYCyVO8KjTNKzQh+fQ1PUWtCp9fzm9CI+HbXFgJAlodvhIqfnZFShVU6/EOWxqd0JLJZX6WFLTGfCFTsAMErPekR5YkP8qbTZY7ND61u6sKxhpM5Gm2Unjcmv438V/cD4vHEe/OeBc549TlcG9anFLDo7Ikx5L/fhLc5Ij8y9Kayj9WUr3CPSWPh8eQQG1hwP7U1RVIke/M4eepAa76d8cGYdYd27hyFwTUqlEUHD1XjmDS6glsgW0wdIgiSzfmWw77ZooV970Ncq2pO/cPFWQVslU3UDcDMjVMLhXQcfGXEA5aqhvRdIHU9jKXJrSZTtZLeLDlpDiBBaEleVlPoVIzlgYGK8ISLL9lWkN+Ddyg7ZFSiM3Mc2sEdQDgX61FYDVDofHKWdfrRk5bK1UJiqZcKKxEaRDvZLj26sWDtOvWT4MrEqNlMZCROfS+NX+V3F/D4QkFI2zK+uXgO3xmoaaQ/kDq3UpePDd81Rk5iZAD5XQHzbn1PH/s49XiywVpfI9g99azqpz+ZklDFYJtZm1lVfkht6te0mfOHueE/CEN6yXR1+CKW/nng8HLqONrJgst72B6nxTJwnPIr/pcwWBBvAtx5PFvphx78xnvYMDNeZSXw6GAeWK8An2UuBZTwY3X8msc9eMzS/qFLJuzQFGvWM6a1O1q+KdZw8qcZNgaenIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(9686003)(66946007)(66476007)(66556008)(66446008)(71200400001)(64756008)(86362001)(8676002)(4326008)(82960400001)(26005)(76116006)(186003)(316002)(6506007)(38100700002)(110136005)(7696005)(54906003)(508600001)(83380400001)(55016003)(2906002)(8936002)(38070700005)(5660300002)(52536014)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clUvOWw5bUJXbDFzVlJJYnhhR2VEb3gvL2lQWmpndVc4UW95aXVwZVh3czhK?=
 =?utf-8?B?aTM4eG5MTkVqUm81K2NkL0t0T2g1SlliNGpLb2lFUlZ6RG56R1orVGRBalJt?=
 =?utf-8?B?ZnBYYktSV1pya28zaU9tRUVRZ0FiYUJrZ1pKeHpjNEE1UlI4bG81a3NtUnZy?=
 =?utf-8?B?M0xLMTVtWTJSbnB1R3FFZ0k3Rklhd0E1OUt5QzNLSzE2UzdXUUh3YkYvaC9G?=
 =?utf-8?B?N2c0OG45QlUzcGJPMlNyamZWVnpUVWsyZzhKTSt1V1BBbXZxeFlXYTdvcTJu?=
 =?utf-8?B?YlJnazhxaDFLS1BhNHRZZlZmLzJlR09zL0RmQVNpVG9sMTVSV2drWE04bVhG?=
 =?utf-8?B?R2h3TmtwSmRTbHE2cDFmNjZiZkJ6SXIxQUJIWHMvdlJqdXZrcGtOOVNOeGk3?=
 =?utf-8?B?bXZKbmI5bnR5VGIyWFd4Vkh4cGpDMUZEVjlwbFZ1MEdOWVhxK0s2UG14UXZH?=
 =?utf-8?B?eVkxNGN0WXZtNFhkTTJsdC9USXRSazRVT2Eva2FJejZkS0xrTFF4amdOWUp3?=
 =?utf-8?B?M1dZbzRMVXV2TVlwOStOc2RsQ0VDSGprV0tvVnNYVENrbUhYb3lzbVJQVmxD?=
 =?utf-8?B?VktLWUZualJYZi9HQWtoUGIxWllucCtvTDVtTTNkYWRhWHoyTldPcnM2dXVD?=
 =?utf-8?B?djkvSGE5ME5TVnpFaVRCVGE0RlV0czJ1NHZDczI1U3VSQ0NjbXRwZ1E1d0hT?=
 =?utf-8?B?RFIxQW9RTTJaK3ZscWJXcmwxbkg2Z3VNY3crQVhzcnlvZUsya1hJNURrL1BK?=
 =?utf-8?B?b1pwTitGdWU5VHlzYmFNYkI1Vi9NeHFtZnM0dktVY1FTdlo1cmZ2OS8vSngz?=
 =?utf-8?B?dVVGeWFFdGtKQXZPRzF2SDRkUDhBdWVZMUFzK0ttREk3OGVwTmhwUmlueE1Z?=
 =?utf-8?B?VFBQNGxsL3Z1SUNCNzlWaDExb05JWWNLaE9IWWtjRktzRFlsSW1GamlERjRD?=
 =?utf-8?B?RGxVdjY0U1BHR2hPL2Uwcm1SMEpkTzJ1R3g1Zkt6am9xSkFCY0JiSW1kdGR5?=
 =?utf-8?B?eC9RZC9uNzUxRm0xeXRaazRMM3dnMjVFUkNnOTlleGpEdjI1ZVIwbmlvanJ1?=
 =?utf-8?B?VWlvN3R5TmFELzdMcGZTWHc0ZlN0QXFTYWdnMnc5bWlDWldvV3VFUEpaQ1pP?=
 =?utf-8?B?QkFFZDFBTDBQWjNvNnI1OHAvbExFbWJPWWhyRm4vTEtOVVZRRlpYYk52ZTNl?=
 =?utf-8?B?bTJNN09VbzBwcEhxUjF6aEFHRTFTVW9LWWNNYzV6RkxRMDQrUU1qR0xLSTll?=
 =?utf-8?B?S3JXcWFZUnFFSFN0d08xNzQwRmVGRGE2WkFCYk1FTVVBYzF0Q0pMcWJCam53?=
 =?utf-8?B?QTdQRFZtd3Jzei9QOFQ2RnA1STMzck5MMEVPSytZUmIvWFR3U2JsckYxa25O?=
 =?utf-8?B?eGI1QlhmQ1V6dVdGc3VHVFBsRzRNYmpSRmpySkdJRnI3ei9JWmNxWU96anR3?=
 =?utf-8?B?eHhzOWh5c24rZ2p2R1lnTUUvM0dsejV3M0NuWHY5Q2NjSnNJSngwMWZrbU0v?=
 =?utf-8?B?eU51cEJkRm5GY2tsMEpsV0Nqc3ZxQ0VlMEIrSTFhVlN1MnZlVFgwQnI4UytB?=
 =?utf-8?B?LzhWUlVKUG5PWHZHZnB4Y21ENXRkSW8wcWpnajRMR25NSXF6UGhQZWw0TGFh?=
 =?utf-8?B?anlJVkpxTVFqcGR6RStac2dnaXFaSjgyaXhTdlZGd1ZBMmRRbDFhTGVIVjJU?=
 =?utf-8?B?UWxRUEMwMlVWdG5oTlFmL0RDM2JpRVVXQW5sZ2lyWGgwV1N5YWh4K3A4MVJn?=
 =?utf-8?B?ZUJGeHBPbklESGJuMDl3MWsxWmZhRjREL0dhT1Y5UlBjRjhBRkduUXNWelU3?=
 =?utf-8?B?bFhmVG9ibmxmYXdzd2VRam1oRUl1a05vQVZnOXdTWDBZbStEU0RUZGF6d1B1?=
 =?utf-8?B?aXhVSzIxL3YvclYzTC9Hd01TNUJ6TXEwL3VUZzFNc0RiQit4dzU1UC8wbEd6?=
 =?utf-8?B?bnNPeCt4Z3l2YlNubXZKWG9ldWJxNzNDbG43QzJBQWtWckZZMjAzWUpXUlhO?=
 =?utf-8?B?ZWNQVERBVWt5dzZyS2pReU9RckNlSmlLVE1JN0dicHA4RXBTckdOQ0xqTVhD?=
 =?utf-8?B?T2l4Slh6R2Z4NVM5L0RLNU5vVUZMaW05OFVYTWp4Um8zR0RzelZuTHhHRUk4?=
 =?utf-8?B?MUN5R0tudEd6bXdmQyt2NStFYjZlRjFNYXJTVU5wMEpZT3kvWS9DcmZ3T0Zt?=
 =?utf-8?B?WXROQ2lhelI3VEMzalRvOVk3YzlFNEpibFYyTzBPTEtTZmZkd0JGOWNpeHVz?=
 =?utf-8?B?YjQyWnBWbU9hdFBFY2orWXNRaWRlZWZnR1BhY0N4VWp0SWx4ZkhTaXNqc2Fw?=
 =?utf-8?B?TmRhb0VDcDhCZWxNZmVLQVdvS3pIMGNTRWszR09CNlI0djB3a3VNUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edc645b-ba83-4d88-8c56-08da10e48816
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 17:58:14.7644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uaKqKKFJ3TKE9h+ogP1IVQvQCI0SVHoInccEF/TB4EqtSuVrF1ZIwAu25/hGeHSN4UaoYjNoa3hzH/OrdLT5CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5298
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wilson, Chris P" <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4gK3UzMiAqZ2VuMTJfZW1pdF9hdXhfdGFibGVfaW52KGNvbnN0IGk5MTVfcmVnX3QgaW52X3Jl
ZywgdTMyICpjcykNCj4+IC1zdGF0aWMgdTMyICpnZW4xMl9lbWl0X2F1eF90YWJsZV9pbnYoY29u
c3QgaTkxNV9yZWdfdCBpbnZfcmVnLCB1MzIgKmNzKQ0KPg0KPiBJIHRoaW5rIGFsbCBoZWxwZXJz
IHdoaWNoIGVtaXQgdG8gcmluZyB0YWtlIGNzIGFzIHRoZSBmaXJzdCBhcmd1bWVudCBzbyBpdCB3
b3VsZCBiZSBnb29kIHRvIG1ha2UgdGhpcyBjb25zaXN0ZW50Lg0KDQpVcGRhdGVkIHRoZSBwYXRj
aCwgcGxlYXNlIHJldmlldyByZXYxMC4NClRoaXMgaGVscGVyIGZ1bmN0aW9uIGhhcyBiZWVuIHRo
ZXJlIGZvciBhIGxvbmcgd2hpbGUsIEkgd2FzIGhlc2l0YW50IHRvIGNoYW5nZS4gQnV0IEkgYWdy
ZWUgY3Mgc2hvdWxkIGJlIHRoZSBmaXJzdCBhcmd1bWVudC4gU2luY2UgSSByZW1vdmVkIHRoZSAi
c3RhdGljIiBhbnl3YXksIHNvIG1pZ2h0IGp1c3QgY2hhbmdlIHRoZSBvcmRlciBhbGwgdG9nZXRo
ZXIuDQoNCj4+IEBAIC0zMjksMTUgKzMwNiwxMCBAQCBpbnQgZ2VuMTJfZW1pdF9mbHVzaF94Y3Mo
c3RydWN0IGk5MTVfcmVxdWVzdCAqcnEsIHUzMiBtb2RlKQ0KPj4gICAJKmNzKysgPSAwOyAvKiB2
YWx1ZSAqLw0KPj4gICANCj4+ICAgCWlmIChhdXhfaW52KSB7IC8qIGhzZGVzOiAxODA5MTc1Nzkw
ICovDQo+PiAtCQlzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmU7DQo+PiAtCQl1bnNpZ25l
ZCBpbnQgdG1wOw0KPj4gLQ0KPj4gLQkJKmNzKysgPSBNSV9MT0FEX1JFR0lTVEVSX0lNTShod2Vp
Z2h0MzIoYXV4X2ludikpOw0KPj4gLQkJZm9yX2VhY2hfZW5naW5lX21hc2tlZChlbmdpbmUsIHJx
LT5lbmdpbmUtPmd0LCBhdXhfaW52LCB0bXApIHsNCj4+IC0JCQkqY3MrKyA9IGk5MTVfbW1pb19y
ZWdfb2Zmc2V0KGF1eF9pbnZfcmVnKGVuZ2luZSkpOw0KPj4gLQkJCSpjcysrID0gQVVYX0lOVjsN
Cj4+IC0JCX0NCj4+IC0JCSpjcysrID0gTUlfTk9PUDsNCj4+ICsJCWlmIChycS0+ZW5naW5lLT5j
bGFzcyA9PSBWSURFT19ERUNPREVfQ0xBU1MpDQo+PiArCQkJY3MgPSBnZW4xMl9lbWl0X2F1eF90
YWJsZV9pbnYoR0VOMTJfVkQwX0FVWF9OViwgY3MpOw0KPj4gKwkJZWxzZQ0KPj4gKwkJCWNzID0g
Z2VuMTJfZW1pdF9hdXhfdGFibGVfaW52KEdFTjEyX1ZFMF9BVVhfTlYsIGNzKTsNCj4NCj4gTm90
IHN1cmUgaWYsIGhlcmUgYW5kIGJlbG93LCBpdCB3b3VsZCBiZSB3b3J0aCB0byBwdXQgcmVnaXN0
ZXIgaW4gYSBsb2NhbCBhbmQgdGhlbiBoYXZlIGEgc2luZ2xlIGZ1bmN0aW9uIGNhbGwgLSB1cCB0
byB5b3UuDQoNCkkgZmVlbCBpdCdzIGVhc2llciB0byBjaGVjayB0aGUgY29kZSBjb3JyZWN0bmVz
cyBpbiB0aGUgKl9yY3MvKl94Y3MgZnVuY3Rpb25zIGFuZCBsZWF2ZSB0aGUgaGVscGVyIGZ1bmN0
aW9uIGFzIHNpbXBsZSBhcyBwb3NzaWJsZS4NCg0KPg0KPiBBcGFydCBmcm9tIHRoZSBjcyByZS1v
cmRlciBsb29rcyBnb29kIHRvIG1lLg0KDQpJZiBubyBvdGhlciBwcm9ibGVtcyB3aXRoIHJldjEw
LCB3b3VsZCB5b3UgcGxlYXNlIGhlbHAgcHVzaCBpdCB1cHN0cmVhbT8gSSBkb24ndCBoYXZlIHRo
ZSBjb21taXQgcmlnaHQsIHdpbGwgbmVlZCB0byBmaW5kIHNvbWVvbmUgdG8gaGVscCB0YWtlIGl0
IGZ1cnRoZXIuDQoNClRoYW5rcywNCi1GZWkNCg0KPiBSZXZpZXdlZC1ieTogVHZydGtvIFVyc3Vs
aW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCg0K
