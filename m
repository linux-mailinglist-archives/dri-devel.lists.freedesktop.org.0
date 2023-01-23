Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D30678AE7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADBC10E5B0;
	Mon, 23 Jan 2023 22:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF29810E5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 22:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674513684; x=1706049684;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tfm3IanKWT0HgwyVqoZb45l8o7NGI+jGDe9n+3Vr4bg=;
 b=EEfpnodpdgARxQYtIyDPG8d4gZwDE9TaTeChH1yo0CIDYhiC6IO2fgfC
 3fQR1TK37CZeGPUjaL82VkzkumIrOoMV2Q8XcMfKRpRupTb9uOnKV8Tkj
 pp6oDuDuiJ4PWFJmmZg8ddApbHR6kBI7o8KPFqvlzHIOZaxf0WAGXd8Kn
 ATTgNNrIV+xX4PfYmhes28odiJP6IrIU/FzibOzDj/ltk/rgGtxZ0KAzm
 wcz1JmDU4sm7ALK1NE6KCjhszCvfHbKVIpr/+Im6PhXbuLBtqgUdp9Rxe
 vrXy3AaJDMmH0vx4CoJbu//dhO+jo1S4GZhuCtzqOo2+LOv3csrBSlzBA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305835047"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="305835047"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 14:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="611791831"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="611791831"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 23 Jan 2023 14:41:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 14:41:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 14:41:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 14:41:21 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 14:41:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLX0ztC1zFlN0ZaWZKP0Obacj6gyZCNeAt2m1ynNwQFQljiWyTlMAN4+4zFRTLILNLswwQvaWqJyFEVyzXXrkB1Y+uoXzQjcKle53JwhKWd/hzz8gVl7aXh3PS0EPaUEUyKLtunTtkdegNUjU86CgsockRYTX2IcOgGfIAM0RGmGu8Yob6M+jLqfLTi87pnD7Mw5OBVYpvBT3XOj19hxDaITO2mPubuZLflGEDD/M0zxDEGVXOt0oTgiQEsrRQvEApAg2zj4EYhfu6Czidqxkld99FmmhceAhOWzUq0uUWsIBbFKWJExpYdeMzzC1apZtuIWQ6qNIW2bF9kD5LqG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfm3IanKWT0HgwyVqoZb45l8o7NGI+jGDe9n+3Vr4bg=;
 b=V3AAyJ7y/kExAR6XtnKERY8M6advyLUXDifOm1AVTi1O5KJFUVngvuHgEPw1i4DjVmbAdEiCQxD+sXxzHfroeEMbJE7lmbP20OiYgPf/IxWXyp9EoAk8N4jJKyHOTqficNQu70IyvtRACZkt4q/5it4rZPxkjdazLm+jO/L1WTcYQY0sr50/KQHEoSwF8zCj7YDbt4B8h7pFPbGuZL4Kwi1Fk73A65cX5A++9oHdr2ALaSoDtJ6ErsQJbKGlHjjMU9H7U+JNybVxvMrWPeCPzRvLmU476xdits12aFVCymEYpEw5M+fuywsquq0h+jesiTEsiro9Dnn40qnxMt0ysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by DS0PR11MB7336.namprd11.prod.outlook.com (2603:10b6:8:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 22:41:20 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::ee2c:e87b:970a:a3f4]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::ee2c:e87b:970a:a3f4%8]) with mapi id 15.20.6002.027; Mon, 23 Jan 2023
 22:41:19 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "sj@kernel.org" <sj@kernel.org>
Subject: Re: [PATCH v2 1/1] Docs/subsystem-apis: Remove '[The ]Linux' prefixes
 from titles of listed documents
Thread-Topic: [PATCH v2 1/1] Docs/subsystem-apis: Remove '[The ]Linux'
 prefixes from titles of listed documents
Thread-Index: AQHZLpIpYKkgfyAt90KsNE3IDKSRLq6smneA
Date: Mon, 23 Jan 2023 22:41:19 +0000
Message-ID: <836ba864ed1de79979829310cda798a592e5da6d.camel@intel.com>
References: <20230122184834.181977-1-sj@kernel.org>
In-Reply-To: <20230122184834.181977-1-sj@kernel.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (3.46.3-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|DS0PR11MB7336:EE_
x-ms-office365-filtering-correlation-id: a8af50a7-3749-4bab-3c05-08dafd92f24a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XyDX3ChfprONJpY3AJK8wuJ1V0BaVbVczUWg278GoTmgVxtHD0aVb0cqLDWCMy8hjOiypyY/Mh8tiez4ZdV9mJ+sybnPwW4Ja3neXTSUgPiSwoX3z8vX9kVcP6sdiUVcKIcNbUQ1Tg6wCvbb9skfMg872/l7sER6l5GEWB8/G95qsNg/CQLuRrVRzuCQshug2ZjU5dGQJWxPLxGBClwaGA48jgZA6/qny5eFS/EgEcEf6503CdX/brR1pE16CYGh8oKRN5Xij9VyJU1DfWEGpXqGTr3Q/4WIbMIdoQJIyAoV6u96dbOGNeRoYaHV3tgZ0adgZpz8kyURRi9VxXGB+1p+dhflKvIg5MzNjY/3J+yWQ0tXq1eadDTVksdXE2PhvmvMtExSU5AajVCCjJJFxuqI7KXGS6kTsKLBH40aB7Lb8EY63coY8tEL7asIXQFcvWGiR21Gm6xF9r8p4iQIsuXdTZPS2rjijlQYcupGr0ZMp7muwi87xgQK7xlT6Nh9IAzkPnQQDAUgvb3cqec6L30ghRfHlkiKjrwZT7aQEO5rtSFbIjbfbNtyEFNzf9QujbqtqBwyByhOncoGH/9huTvGFv2DCzsKg7IYlymfjQEZ7WkYoUJiC25HDD7wrfGB0p1GL9VTBOHA1ID+3vAYTv4sniJ/Z1cgH22JcEH61x1Xe0/ghpi2XGU0Bn0jRn8PJIsSEdwensnjDiN1qda6hCHwS1NuGvYOCnOxus3KLe8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199015)(36756003)(38070700005)(86362001)(2906002)(5660300002)(38100700002)(82960400001)(7406005)(8936002)(7416002)(4326008)(41300700001)(122000001)(83380400001)(66476007)(6486002)(478600001)(71200400001)(110136005)(91956017)(6506007)(6512007)(8676002)(186003)(26005)(2616005)(316002)(66946007)(66446008)(76116006)(64756008)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UE5sKzlGYXltZ0lONHMrMkVXa2VnYUZqRzMvU2d2eTY0M3AzWkpBby8zR1Rz?=
 =?utf-8?B?WEJJQTFuNVJDcElDVzJBWUdRU0ZON05jeEtiZVZXemE4WE91dE40dUhrTmNX?=
 =?utf-8?B?OUVwWDJDYis0TXZ3RmJJRFdjaXR4b3RJM0N6dVhzaUpNSE8xSk9VclQrRFY1?=
 =?utf-8?B?RXJ2eGMrRUZaL0pPYWVreHc4QmpkNUJUQ3R1cnRnQ1FSWFFTaE5JWktXZ3pD?=
 =?utf-8?B?MDB4dmt1eDYvdUh1eGlpVWhkdisxakhqQldSV29zcHRHbnZXTFJCN0hUZTFp?=
 =?utf-8?B?Y0hnbHdoNk42SUxFKzZaUmNwN3Ezd1ZnNHBpODNaR2txWElUYlRHa3hBdnNP?=
 =?utf-8?B?MzE2aE5XekpDN3NIS3JRZitnTUhJS05hZ0p1U3VTbzJLdk95Q0tVTnZKRlFM?=
 =?utf-8?B?R0kzSkZHeTZRaU9RQVVicjNjdG5BbmFMR1Y0VjhOSEtmRE1WeUNjclhVaTZQ?=
 =?utf-8?B?S3dEK2M4c0xCak9WQ3hzbDNqdG9JSXVzdHlHMnJvUVV6RVZ4RzJuWkxqR05r?=
 =?utf-8?B?YVY0WEtRYWFaaFhYMzBiQkpvMjJpS29XWWNwUDBGYUsrR2pJTXhwWWl2VWMr?=
 =?utf-8?B?Tmt2dlVZa1l5UW5BTzlLakhrbm5qR0dYaGJKWDVjSm5sVGJoanNJUEVZUysz?=
 =?utf-8?B?VVZ0cTFCYllOa0tJaXNqVmhYTEZaUWd4UXE1ckZUZnZBRnJOMm8vdUlKZklV?=
 =?utf-8?B?MU9zd2UwM1pNRWhrT2MvdGlCL2NwV0dFT0hhS2ZIWW81ZWc4RHBkWVAxYm9Z?=
 =?utf-8?B?dG9WTkxkYTlCeTlDdmROeGFIRCtGbFNXMnA0R1lNNFNlOTRSTVpscDVnUDl4?=
 =?utf-8?B?ajRVOHVLZkVtSTg3bitjVTZtbXdkZEpqcEowek5hV0Y2UGdTb3U1aGRkTkVV?=
 =?utf-8?B?SVR6c0Q1ODM2Y2RiMTY1bWtjTEVrZ2hSeFRKTitlcDJhT0xvZFRGWFVDbmxl?=
 =?utf-8?B?UXJkZDR5WmV6ZkdDQzVrWmpVUlNPbDVpMVNvUFRDNmJ6cFcwZTFZTm5udTNn?=
 =?utf-8?B?eUkzaGN0blJTaE1WU1NtQ3lpYWdub1pkUDY4L3N6RUFlRHZWT01XMUtIc29m?=
 =?utf-8?B?SXVYMkVWMDEvemhDTHVCMUF4aHZPYm8xSEJGck1QbVVmaDVJZ0V6SzB5Wmli?=
 =?utf-8?B?eVEyVHZISC9wUUQ4NGRobG85U04vSVdIS1lTNi9pNGtzWGp5a2hPUjRXZ3Fn?=
 =?utf-8?B?WGdiaXowRmR2SmxKYUNxaHQ5cWk4TnNUbXF1V3BHcjJXeDQ4R2pQSW1lQnNB?=
 =?utf-8?B?NG5ScDNBeXZJT1lNc2kwRDBTRzdoTEpCejF4OWF5ais5MGNmcERtdy9JNmw4?=
 =?utf-8?B?UnVVWHhPQ2xtSEFQMHVqNTZuRS9PZ3grSjliNFdVb0hIcnZhUWdsczlnQjR6?=
 =?utf-8?B?WHp6ZWVqZjByMXVoeWxpZEx0UnNKNFhTdU5WcWo2cWt3WmUvS0FlR3BST3BW?=
 =?utf-8?B?YmxLQWdRaVNPcHluWW9vSkZoWEgxRHQ3eEszZnlkdGYyWTRuR0ozdlFzTkda?=
 =?utf-8?B?SkwxaUllRXA4d3V0V3RRaEZyM0JDcGpiYzU5RFB0anp4MXhXOXltb2Q4RCsr?=
 =?utf-8?B?OFdzSHNZeXg2SFFXU1RaYW8wTFV4SGRHZ3VUWE1oeU1tU0ZzUXlyRDdmdzBp?=
 =?utf-8?B?SnZZRExjVmprOFJmTWxNcmpvZVc0NjFYZzhTSVlsN2Ewb2xZNUV3dVVYRS9z?=
 =?utf-8?B?UHZ2Nk9tVEVtdThKdWVSUFczbHNIN1RMOXFEK3JsNlh5dTY4UXQ1cklocnp3?=
 =?utf-8?B?bE5uaWdOTmJVWXpGZnBPdGlhVDNtL2kwaXlDNmJjS0NyTlBQYkJFajNCMnlW?=
 =?utf-8?B?Z1VpZTd5enNtMmp4YVNJRWFNWjhraW40Ym8wSEM3R3o3MFhiTE9kaFpUVitP?=
 =?utf-8?B?T2FsQnc3MnhOT1l2MjdUamcrMlV2ZFZpNnZHcU02WklWN3VyVVFSOEplSVJL?=
 =?utf-8?B?eXVWY0tCSGRyZHVFWEFXR09wV3VuZ2h0Wk80Yy81aVNWKzR1UE1LRk0xMWp6?=
 =?utf-8?B?YndiN2lVVmtwbDhxUktTcWJXNnRFRG42RDRrNysvMWhNdEZrKzBvLzExNThC?=
 =?utf-8?B?NVBwNnpjUXoxTW5RN1I1NmlQTWlwaTNmOU5scWhVSjlVYlpPZjB2ejdPN2pN?=
 =?utf-8?B?dVZzenZ5YjkranVTdHF0dXFoMTdWUk5SREtPTTIrK2xoRnA4RGprSzdFUmtJ?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4733F5D8A028B44F978D638D6EF85C16@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8af50a7-3749-4bab-3c05-08dafd92f24a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 22:41:19.8194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdtkmBUftZFOM9IjP/S+ABsajZYV5P+xwkpuUMm37FProtdkBKk6oIZIbSpUgkFt5TewOGtMWNUGXeJM9j7KHho7vNBolQHZhtKkF/+LvJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7336
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "perex@perex.cz" <perex@perex.cz>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIzLTAxLTIyIGF0IDE4OjQ4ICswMDAwLCBTZW9uZ0phZSBQYXJrIHdyb3RlOg0K
PiBTb21lIGRvY3VtZW50cyB0aGF0IGxpc3RlZCBvbiBzdWJzeXN0ZW0tYXBpcyBoYXZlICdMaW51
eCcgb3IgJ1RoZSBMaW51eCcNCj4gdGl0bGUgcHJlZml4ZXMuwqAgSXQncyBkdXBsaWNhdGVkIGlu
Zm9ybWF0aW9uLCBhbmQgbWFrZXMgZmluZGluZyB0aGUNCj4gZG9jdW1lbnQgb2YgaW50ZXJlc3Qg
d2l0aCBodW1hbiBleWVzIG5vdCBlYXN5LsKgIFJlbW92ZSB0aGUgcHJlZml4ZXMgZnJvbQ0KPiB0
aGUgdGl0bGVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pAa2VybmVs
Lm9yZz4NCg0KRm9yIERvY3VtZW50YXRpb24vcGVjaS9pbmRleC5yc3QNCg0KQWNrZWQtYnk6IEl3
b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gQ2hh
bmdlcyBmcm9tIHYxDQo+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwMTE0MTk0
NzQxLjExNTg1NS0xLXNqQGtlcm5lbC5vcmcvKQ0KPiAtIERyb3Agc2Vjb25kIHBhdGNoICh3aWxs
IHBvc3QgbGF0ZXIgZm9yIGVhY2ggc3Vic3lzdGVtKQ0KPiANCj4gwqBEb2N1bWVudGF0aW9uL1BD
SS9pbmRleC5yc3TCoMKgwqDCoMKgwqDCoCB8IDYgKysrLS0tDQo+IMKgRG9jdW1lbnRhdGlvbi9j
cHUtZnJlcS9pbmRleC5yc3TCoMKgIHwgNiArKystLS0NCj4gwqBEb2N1bWVudGF0aW9uL2NyeXB0
by9pbmRleC5yc3TCoMKgwqDCoCB8IDYgKysrLS0tDQo+IMKgRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpL2luZGV4LnJzdCB8IDYgKysrLS0tDQo+IMKgRG9jdW1lbnRhdGlvbi9ncHUvaW5kZXgucnN0
wqDCoMKgwqDCoMKgwqAgfCA2ICsrKy0tLQ0KPiDCoERvY3VtZW50YXRpb24vaHdtb24vaW5kZXgu
cnN0wqDCoMKgwqDCoCB8IDYgKysrLS0tDQo+IMKgRG9jdW1lbnRhdGlvbi9pbnB1dC9pbmRleC5y
c3TCoMKgwqDCoMKgIHwgNiArKystLS0NCj4gwqBEb2N1bWVudGF0aW9uL21tL2luZGV4LnJzdMKg
wqDCoMKgwqDCoMKgwqAgfCA2ICsrKy0tLQ0KPiDCoERvY3VtZW50YXRpb24vcGVjaS9pbmRleC5y
c3TCoMKgwqDCoMKgwqAgfCA2ICsrKy0tLQ0KPiDCoERvY3VtZW50YXRpb24vc2NoZWR1bGVyL2lu
ZGV4LnJzdMKgIHwgNiArKystLS0NCj4gwqBEb2N1bWVudGF0aW9uL3Njc2kvaW5kZXgucnN0wqDC
oMKgwqDCoMKgIHwgNiArKystLS0NCj4gwqBEb2N1bWVudGF0aW9uL3NvdW5kL2luZGV4LnJzdMKg
wqDCoMKgwqAgfCA2ICsrKy0tLQ0KPiDCoERvY3VtZW50YXRpb24vdmlydC9pbmRleC5yc3TCoMKg
wqDCoMKgwqAgfCA2ICsrKy0tLQ0KPiDCoERvY3VtZW50YXRpb24vd2F0Y2hkb2cvaW5kZXgucnN0
wqDCoCB8IDYgKysrLS0tDQo+IMKgMTQgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwg
NDIgZGVsZXRpb25zKC0pDQo=
