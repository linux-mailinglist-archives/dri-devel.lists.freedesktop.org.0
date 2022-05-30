Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE7537566
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 09:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEEB10E2CC;
	Mon, 30 May 2022 07:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F8510E28F;
 Mon, 30 May 2022 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653895831; x=1685431831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5dULrcEKieFgHLYgxPVTGc4h2JsfkVndR2kx4dEyZo4=;
 b=GZDijZLlkkavlPfIgiqiwotqQ0d3w1u2ECenBfTMTQSE0v8J1OgNLbg7
 lGNe67J5KoIpWKzQKKarC/77vPExkAwwVLRCcYnzyYiUyMRaXjU5uxS5l
 njiFkpfCcm5mR1WuaA514t0Y3KuDfSX2w3A7lRndvrHgtupCfLjZd5uN0
 E1IHQHhoxnC4jwW02lWkxH5NpPQpmXDX3vWBRh5haKkhIceJ0acH44fhs
 UIqdqJee7TcwGNzl9hSiM1SEqtHNS8jroVVoBsJVCHAFC5S8ZjL5Pez+p
 0xW0rexux2yAeDvn5lsD/gcdZG6/30oXQsmOFPmNjQaucoZGh6hvb+LSA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="361298931"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="361298931"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 00:30:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="561812694"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 30 May 2022 00:30:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 30 May 2022 00:30:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 30 May 2022 00:30:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 30 May 2022 00:30:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 30 May 2022 00:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2iMC3KQHQKfsmIW/g2hasmZVFiuBMrtwGTeGg6e7W3UwvxHvm3fmVP+4arrWOWknCp6GbubyHlMVmDdEnPOe59Yl1idrvNZGMhnHADQ2CoNd2x6mzC2BIz5fftTGxbRT3kM2SM9Q9bLF5lnQfZ/tYOHQzRNDrRKleNSSRGRn/Nh40hOrNG+jkUhxtAPOU/AoAeaxWL/vtBohTOaGXqgNmwcDoqoFdLlwSu032I8hxBLqoBoiPp2lyncg38VUKODeGkos5XVAKDju7RHZQUl2t4V289s6uTt2CZfzt9knGBpZiBPLWNVJ9a/U0bEPzjUlJrr3bPmzt5sOkOgjMw7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dULrcEKieFgHLYgxPVTGc4h2JsfkVndR2kx4dEyZo4=;
 b=j3/jbp+nAohBvqN9eoMPj1/EzVQDBHJsv7ronGZ66GUHQrgcpcEf9Aj2/uv+8seMhbEDF0LqG+D14IkES8RG1mn1w8VKEjlDaDZe6629NKtYDnEjvnW3ZpzI3hvaDjhx9FMf2nlK4XpAsZS7FMpTueMnDXZcGoGs5f3GDiSwY56cMm8nZiAtTBxmU3GIpgIAuZGFhqbqn9kjyRRGyNPvfQrHuMgcVgL/NU7lVltVluhiYbxUwQo+CtZ5r3OaNKFrc6cBjE+YXRMjaNpDZvioWvB/WIRczgW7I2SRx5QGCTqtRacQNUIrf4wa4sTtK1DYDJmVY6/O3yMw40vAeua8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23)
 by MN2PR11MB3791.namprd11.prod.outlook.com (2603:10b6:208:f9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Mon, 30 May
 2022 07:30:13 +0000
Received: from CO1PR11MB4962.namprd11.prod.outlook.com
 ([fe80::859f:cb33:294d:d652]) by CO1PR11MB4962.namprd11.prod.outlook.com
 ([fe80::859f:cb33:294d:d652%9]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 07:30:12 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH RESEND v6] drm/i915/display: disable HPD workers before
 display driver unregister
Thread-Topic: [PATCH RESEND v6] drm/i915/display: disable HPD workers before
 display driver unregister
Thread-Index: AQHYa9DPMnjG8+21r0G/p9RzaPw3Ia03Fo+A
Date: Mon, 30 May 2022 07:30:12 +0000
Message-ID: <340284cee0d2b1250e61040833d59ae6d8852874.camel@intel.com>
References: <20220519223520.3935225-1-andrzej.hajda@intel.com>
In-Reply-To: <20220519223520.3935225-1-andrzej.hajda@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42845d8a-ea12-4506-8f52-08da420e3be6
x-ms-traffictypediagnostic: MN2PR11MB3791:EE_
x-microsoft-antispam-prvs: <MN2PR11MB3791D9918C0CA756A2606813F6DD9@MN2PR11MB3791.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hxRYSS48RzU0ikSe9092ppv6BXyGL2+ceuhBGOAttXtEhTz8e95J9H9TlL96s76RMiomH7qkJlwJrXwnrc/MjN6mYozFonTsy4QyPEK1rzI4qR3wTNcILEetab6/EdRGgFLMFySXeDbQRRekhrfb/2vM/yaFO0iEitVNEIhoT24bc0ZNtGO3NYhOpzLpQf8G3sOauBB6u6Qmw1x0eSj9u5aeWLgPxdgD2YEE/eI6ZB5G5jEQvqiK6/hpGiqBTfVaEuqD+lVxgq1w47dPq/NmJuEsmdTPvwwmxOXiuADWGgSVFlXNgyRU80pLDUMI8xVpUhc65G28hjSaD6IQRxMkDd/as9gt3+87lFX3dLwqo5V7+ytF0ah5gqqqIlbCA3KnJZM72gjmt7Taj3HGpG2SPtMs6zrObf2GDaprmXk87ixh9ABo8xRTOAgmxWJv/4j7Au33dibeBspFZ150GhOs3M5BF1NexX0b5Qjn7VywYrnkT2IwEfB5Veb+M+ADoomBlY3jQjd1j2RxbRqaGU2bxV0ZmytM0vwSmBN4gny92w6VyvaUIhRJGo1K0gF7s/dE3buvGQspUomJ8o+GbSxYZAUemJyhfMeDuZ82RPak5EqO4vLR80QwMlXVxJZ6Eo17NoRu2C7pYW/kYh/PRWZrcVjj1roVF4GjuIfMaPJ2vF41upvFIztNwiUluNOQX6ZU99ZVS2Wy3l2hvj0Q/eugIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4962.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(186003)(66946007)(4326008)(64756008)(8676002)(82960400001)(122000001)(91956017)(71200400001)(66446008)(66476007)(66556008)(6506007)(86362001)(5660300002)(508600001)(6486002)(966005)(83380400001)(8936002)(38070700005)(2906002)(316002)(38100700002)(36756003)(2616005)(107886003)(6512007)(26005)(110136005)(450100002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sno4SkZwTW9EMFUyZmJSQklBR1BYMk54TjNIOUFxK3N6M0M0Nks4c0JRK05u?=
 =?utf-8?B?QUo2bkxxd0dDUGZ1cWFBcTBWK0VrcWU0K0hzeVVhMHUxQm9ZRWFNTURSRDVh?=
 =?utf-8?B?ajhIQW9xTExXRDJZaUZ0TE9uM0ZUSDBucUVUbTdMRHQ5bUZUdnlXcDA5Uy9l?=
 =?utf-8?B?aUxGY08zN1hpWWlCQzgrZUh4aXRPVjJlOE93SWFmOVE0TGk1d09IcHFVcDdD?=
 =?utf-8?B?Q25RK3MyRDRKbjJyUXVkbm11SzAwL0loRnNoZlZsQ2tpUktUeVZNcW9qMlly?=
 =?utf-8?B?NURBSk1UeWtBUjNFV25lbU5Fd2ZDYnpuaytRbWMwWkJGQW5TMVphZFNPQVlD?=
 =?utf-8?B?emF1SHpoVHIyZ1huenpPclpHdUhURnJhQUhrNTFocjlsWVFwdnAwWEZqcXNj?=
 =?utf-8?B?d1A0U2VET3pOTjBFbVpVb3lvdlNnQnpCakMwYnMxc3pQbTBFSDQ2KzNhSC9T?=
 =?utf-8?B?a3M0VzE1VWlSMW5uUjBpUHBSbFBpQTZkSFY0UDRNRTE0bTJ5eTJPTW1LcHZV?=
 =?utf-8?B?Wi9MOEV6TE81eDRDR1JoNDNWSllpWGJkY2xkeURMcm1PTEV3NDZvcGR5dHpo?=
 =?utf-8?B?aUx2UldqUUZxYUxhY0JOTU1aT0pZWW1Fc2RPcG5CN1FRQkxSc2NFaFdLbXJB?=
 =?utf-8?B?bERDdDBSQWRWeGlaRERHU3VoMzdhY3padG8vRnpjMnZXK1VaTHE1SlNhRFBE?=
 =?utf-8?B?NjhPMGZnU3pBaXhyaDdnYi91R25KMlo1VW1LdzlFUUFQUXRYTlZSM1RUa2k3?=
 =?utf-8?B?bmZpcGhvSFFreG5DcHR0eTNSSGU5b0pFa1NPTnZDRmdIc2o3Y21BRTFPMkNy?=
 =?utf-8?B?bmVSdW5hMFpIUStudXBaZzRwaUM5b0g2Q0dwOEVJZG9vYjlBOXRyTytqa2pt?=
 =?utf-8?B?ZnZWam1xV09SU0NNZzNEQTRvdnYycDNLWXFCckR4STZ5RVZ3YzBiaGU0cXdR?=
 =?utf-8?B?OHBhWmlBTkNheXFQTkRJSlEwS25UclV6bkJVYzJIKzZWODR2R1gxUVU5Zmhh?=
 =?utf-8?B?YXQ5TEFYMGIxUkNWQUJsVStqVzlMWVpNYUlIeHVQckptajk3ZFEyYVVXWVkw?=
 =?utf-8?B?WW1sdGJxOXRzWWI5Tk92Z0NYQURYeElGNUxvR0l5a21lQ0ZkN1BRNUJwWGNz?=
 =?utf-8?B?N3lMNUFtc0k3dllXSkJhVlcyYzF6Rng1RXBnRUZHdm9nY1pXVThzOU44bGVz?=
 =?utf-8?B?YmdGalpMWTcxTWNqaTlTeEVqbU9WTUNYd25YTzVxNzl3M2JUUVlad2Y4dkpH?=
 =?utf-8?B?d2ZmOHBOTXh4azEyN2hwQkJUWkVyRmRNSWtnVyt2MjlxVlFkbWVJQXdvTGNE?=
 =?utf-8?B?TUp6eDcvWU5XaDBJMWt0SHRjYzdZUXN4dkJTc29lazZFNGZyaURtOXlvZjFn?=
 =?utf-8?B?SjFLKyt6UXJrZStXcVkwWTVtSE44UTJIS20xanRlY3FBVUZNVTlocFRtV252?=
 =?utf-8?B?RXUzaGFZbDlIZlVTc3Q4V1VwOVlzMGJHaFRVcmVmZFA1Y0JmYW5kcnljZlB2?=
 =?utf-8?B?VUZKaEFrMjlwMmd3M1pVc1BtWlZhZHBGb1M0R084by9rNkxVb2JHTFBNMDlh?=
 =?utf-8?B?TzMwak5VMWdIeTRCUnZ4WS9DQkRiUmZDc0RSK09oVHBhTlVSbWgxdWhjS0pn?=
 =?utf-8?B?Qjd2MTVUV3hMekM2OGtOREx5RUJSbGxpbW5tK1g0MmNiQUd0VDRXbkZnZFk1?=
 =?utf-8?B?ZHdEUHY2cnZGSXFCeU1YVEVuMWtwTVhIaWVULzBlU2loeGYwUkIzQ3JPV2hv?=
 =?utf-8?B?NzYvYzdCMjIyWVlFZHhWTzVmWUlxaktmemNpYVZQS0kvVjUyOE15QWZtQ3dv?=
 =?utf-8?B?K2pDZTFnbUJaSEJRcHFrRU9LcEZKdk9ENUt1b3J2MWd1c0xXZzZEbG1lWlRV?=
 =?utf-8?B?MUtETXR4WnU3NDk2RXpvQWVPaDNCdUh2eEo5Y3dIZUtSSm9nME1YNGN1YzJi?=
 =?utf-8?B?TXh3dWxQOGlGQmswdGtORGRxaGR6UDc2MGZneVY5YWNwWUNhc2krSy9OMG1J?=
 =?utf-8?B?TDd5eS9wOXJldFgrMUZvb0lMWE5TRWI1U29yWmJGQTNJUnczMUpSK1psUmtI?=
 =?utf-8?B?YUM2UVF3NElDQkxpeWlnWDk2MlpHV3F2N3RzYUlyK05UMGIwVzhxMTczUElU?=
 =?utf-8?B?MThVRGM3S3kwOW1oVGhYTVlIakQrdEhPcm1kbUxkZUdZejRGUjdUMXd6NHkw?=
 =?utf-8?B?empQN0R2RWt5UklFc0tzNHBoQ0NzbGFPTnN4Vkl3cVYwcUJGQkkrVnVobXd5?=
 =?utf-8?B?TXhkSy9rNU8vQjhsYVJzWEtmQ29zcHdwYTFXRytXSjFQMy9sVlJ6OGtEbUhC?=
 =?utf-8?B?MThyYzRTaTFFOXc5UUZLaUZiRW5UdENuOGlxZ1p1OFJ6ZzRzWEFESERxbEtX?=
 =?utf-8?Q?MrcgqEx8v+u7RYraSjJ0OIX1ieYGl5VhuEL2O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED1342986594ED4C8E3FA433D8A4DCB8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4962.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42845d8a-ea12-4506-8f52-08da420e3be6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 07:30:12.7975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yOgC/8L+Tjwuh8o/GCM7vZ0ywJmsTNG709C6Qem9/igYta7EdEdln3/medrl+1YmVeLoGf2y9DckU0IQQiD6FurPPEyS/aMSeK4BRQWgXFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3791
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA1LTIwIGF0IDAwOjM1ICswMjAwLCBBbmRyemVqIEhhamRhIHdyb3RlOg0K
PiBIYW5kbGluZyBIUEQgZHVyaW5nIGRyaXZlciByZW1vdmFsIGlzIHBvaW50bGVzcywgYW5kIGNh
biBjYXVzZSBkaWZmZXJlbnQNCj4gdXNlLWFmdGVyLWZyZWUvY29uY3VycmVuY3kgaXNzdWVzOg0K
PiAxLiBTZXR1cCBvZiBkZWZlcnJlZCBmYmRldiBhZnRlciBmYmRldiB1bnJlZ2lzdHJhdGlvbi4N
Cj4gMi4gQWNjZXNzIHRvIERQLUFVWCBhZnRlciBEUC1BVVggcmVtb3ZhbC4NCg0KVGhhbmtzLg0K
DQpSZXZpZXdlZC1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBp
bnRlbC5jb20+DQoNCj4gDQo+IEJlbG93IHN0YWNrdHJhY2VzIG9mIGJvdGggY2FzZXMgb2JzZXJ2
ZWQgb24gQ0k6DQo+IA0KPiBbMjcyLjYzNDUzMF0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBw
cm9iYWJseSBmb3Igbm9uLWNhbm9uaWNhbCBhZGRyZXNzIDB4NmI2YjZiNmI2YjZiNmI2YjogMDAw
MA0KPiBbIzFdIFBSRUVNUFQgU01QIE5PUFRJDQo+IFsyNzIuNjM0NTM2XSBDUFU6IDAgUElEOiA2
MDMwIENvbW06IGk5MTVfc2VsZnRlc3QgVGFpbnRlZDogRyAgICAgVSAgICAgICAgICAgIDUuMTgu
MC1yYzUtDQo+IENJX0RSTV8xMTYwMy1nMTJkY2NmNGY1ZWVmKyAjMQ0KPiBbMjcyLjYzNDU0MV0g
SGFyZHdhcmUgbmFtZTogSW50ZWwgQ29ycG9yYXRpb24gUmFwdG9yIExha2UgQ2xpZW50IFBsYXRm
b3JtL1JQTC1TIEFEUC1TIEREUjUgVURJTU0NCj4gQ1JCLCBCSU9TIFJQTFNGV0kxLlIwMC4yMzk3
LkEwMS4yMTA5MzAwNzMxIDA5LzMwLzIwMjENCj4gWzI3Mi42MzQ1NDVdIFJJUDogMDAxMDpmYl9k
b19hcGVydHVyZXNfb3ZlcmxhcC5wYXJ0LjE0KzB4MjYvMHg2MA0KPiAuLi4NCj4gWzI3Mi42MzQ1
ODJdIENhbGwgVHJhY2U6DQo+IFsyNzIuNjM0NTgzXSAgPFRBU0s+DQo+IFsyNzIuNjM0NTg1XSAg
ZG9fcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycysweDU5LzB4YTANCj4gWzI3Mi42MzQ1
ODldICByZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKzB4MmQvMHhjMA0KPiBbMjcyLjYz
NDU5Ml0gIHJlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzKzB4YzgvMHgxMTANCj4g
WzI3Mi42MzQ1OTVdICBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1
ZmZlcnMrMHg1Mi8weDcwDQo+IFsyNzIuNjM0NjA0XSAgaTkxNV9kcml2ZXJfcHJvYmUrMHg2M2Ev
MHhkZDAgW2k5MTVdDQo+IA0KPiBbMjgzLjQwNTgyNF0gY3B1X2xhdGVuY3lfcW9zX3VwZGF0ZV9y
ZXF1ZXN0IGNhbGxlZCBmb3IgdW5rbm93biBvYmplY3QNCj4gWzI4My40MDU4NjZdIFdBUk5JTkc6
IENQVTogMiBQSUQ6IDI0MCBhdCBrZXJuZWwvcG93ZXIvcW9zLmM6Mjk2DQo+IGNwdV9sYXRlbmN5
X3Fvc191cGRhdGVfcmVxdWVzdCsweDJkLzB4MTAwDQo+IFsyODMuNDA1OTEyXSBDUFU6IDIgUElE
OiAyNDAgQ29tbToga3dvcmtlci91NjQ6OSBOb3QgdGFpbnRlZCA1LjE4LjAtcmM2LVBhdGNod29y
a18xMDM3Mzh2My0NCj4gZzE2NzJkMWM0M2U0MysgIzENCj4gWzI4My40MDU5MTVdIEhhcmR3YXJl
IG5hbWU6IEludGVsIENvcnBvcmF0aW9uIFJhcHRvciBMYWtlIENsaWVudCBQbGF0Zm9ybS9SUEwt
UyBBRFAtUyBERFI1IFVESU1NDQo+IENSQiwgQklPUyBSUExTRldJMS5SMDAuMjM5Ny5BMDEuMjEw
OTMwMDczMSAwOS8zMC8yMDIxDQo+IFsyODMuNDA1OTE2XSBXb3JrcXVldWU6IGk5MTUtZHAgaTkx
NV9kaWdwb3J0X3dvcmtfZnVuYyBbaTkxNV0NCj4gWzI4My40MDYwMjBdIFJJUDogMDAxMDpjcHVf
bGF0ZW5jeV9xb3NfdXBkYXRlX3JlcXVlc3QrMHgyZC8weDEwMA0KPiAuLi4NCj4gWzI4My40MDYw
NDBdIENhbGwgVHJhY2U6DQo+IFsyODMuNDA2MDQxXSAgPFRBU0s+DQo+IFsyODMuNDA2MDQ0XSAg
aW50ZWxfZHBfYXV4X3hmZXIrMHg2MGUvMHg4ZTAgW2k5MTVdDQo+IFsyODMuNDA2MTMxXSAgPyBm
aW5pc2hfc3dhaXQrMHg4MC8weDgwDQo+IFsyODMuNDA2MTM5XSAgaW50ZWxfZHBfYXV4X3RyYW5z
ZmVyKzB4YzUvMHgyYjAgW2k5MTVdDQo+IFsyODMuNDA2MjE4XSAgZHJtX2RwX2RwY2RfYWNjZXNz
KzB4NzkvMHgxMzAgW2RybV9kaXNwbGF5X2hlbHBlcl0NCj4gWzI4My40MDYyMjddICBkcm1fZHBf
ZHBjZF9yZWFkKzB4ZTIvMHhmMCBbZHJtX2Rpc3BsYXlfaGVscGVyXQ0KPiBbMjgzLjQwNjIzM10g
IGludGVsX2RwX2hwZF9wdWxzZSsweDEzNC8weDU3MCBbaTkxNV0NCj4gWzI4My40MDYzMDhdICA/
IF9fZG93bl9raWxsYWJsZSsweDcwLzB4MTQwDQo+IFsyODMuNDA2MzEzXSAgaTkxNV9kaWdwb3J0
X3dvcmtfZnVuYysweGJhLzB4MTUwIFtpOTE1XQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcnpl
aiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiBIaSBhbGwsDQo+IA0K
PiBUaGlzIGlzIHJlc2VuZCBvZiBbMV0uIEZvciB1bmtub3duIHJlYXNvbiBDQy1pbmcgcHBsIGRp
ZCBub3Qgd29yaywNCj4gc28gSSd2ZSBkZWNpZGVkIHRvIHJlc2VuZC4gSSBob3BlIHRoaXMgdGlt
ZSBpdCB3aWxsIHdvcmsuDQo+IFRoZSBwYXRjaCB3YXMgYWxyZWFkeSBzdWNjZXNmdWxseSB0ZXN0
ZWQgYnkgQ0kgKHJldjYsIHJldjcgb2YgWzFdKS4NCj4gDQo+IFsxXTogaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMDM4MTEvDQo+IA0KPiBSZWdhcmRzDQo+IEFuZHJ6
ZWoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
YyB8IDExICsrKystLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5LmMNCj4gaW5kZXggODA2ZDUwYjMwMmFiOTIuLjAwN2JjNmRhZWY3ZDMxIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0K
PiBAQCAtMTA0ODYsMTMgKzEwNDg2LDYgQEAgdm9pZCBpbnRlbF9tb2Rlc2V0X2RyaXZlcl9yZW1v
dmVfbm9pcnEoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpDQo+ICAJICovDQo+ICAJaW50
ZWxfaHBkX3BvbGxfZmluaShpOTE1KTsNCj4gIA0KPiAtCS8qDQo+IC0JICogTVNUIHRvcG9sb2d5
IG5lZWRzIHRvIGJlIHN1c3BlbmRlZCBzbyB3ZSBkb24ndCBoYXZlIGFueSBjYWxscyB0bw0KPiAt
CSAqIGZiZGV2IGFmdGVyIGl0J3MgZmluYWxpemVkLiBNU1Qgd2lsbCBiZSBkZXN0cm95ZWQgbGF0
ZXIgYXMgcGFydCBvZg0KPiAtCSAqIGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKCkNCj4gLQkgKi8N
Cj4gLQlpbnRlbF9kcF9tc3Rfc3VzcGVuZChpOTE1KTsNCj4gLQ0KPiAgCS8qIHBvbGwgd29yayBj
YW4gY2FsbCBpbnRvIGZiZGV2LCBoZW5jZSBjbGVhbiB0aGF0IHVwIGFmdGVyd2FyZHMgKi8NCj4g
IAlpbnRlbF9mYmRldl9maW5pKGk5MTUpOw0KPiAgDQo+IEBAIC0xMDU4NCw2ICsxMDU3NywxMCBA
QCB2b2lkIGludGVsX2Rpc3BsYXlfZHJpdmVyX3VucmVnaXN0ZXIoc3RydWN0IGRybV9pOTE1X3By
aXZhdGUgKmk5MTUpDQo+ICAJaWYgKCFIQVNfRElTUExBWShpOTE1KSkNCj4gIAkJcmV0dXJuOw0K
PiAgDQo+ICsJaW50ZWxfZHBfbXN0X3N1c3BlbmQoaTkxNSk7DQo+ICsJaW50ZWxfaHBkX2NhbmNl
bF93b3JrKGk5MTUpOw0KPiArCWRybV9rbXNfaGVscGVyX3BvbGxfZGlzYWJsZSgmaTkxNS0+ZHJt
KTsNCj4gKw0KPiAgCWludGVsX2ZiZGV2X3VucmVnaXN0ZXIoaTkxNSk7DQo+ICAJaW50ZWxfYXVk
aW9fZGVpbml0KGk5MTUpOw0KPiAgDQo=
