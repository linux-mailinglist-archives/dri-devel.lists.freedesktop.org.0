Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C795AACF1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 12:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3806210E7F2;
	Fri,  2 Sep 2022 10:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5567710E80C;
 Fri,  2 Sep 2022 10:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662116319; x=1693652319;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JjXNjTG/yCmTfoYoMn7GqBVRIkRcprrJh0xgz/60+Og=;
 b=EpP0GbIj9wDtyinqRVnUv8fs1DH0NFvCFdjiXjQOpWjxlHT0mC7igOw6
 G5ggv0w+h0MGNBgVR/uSNEAztKN758wH7q6DwbmKVIymR3Z6DSQBX2Ghl
 M2kXmB4FFr0HN4/0pEeSj0GlAsSFelOo0o+Hvy3+U1dFiCl1qifFE+SUQ
 8GNjd8kEBb90plaIPs90QkE07R4PhBhSJUyeShPAAeuBsWnWIswfFO/H7
 YzWFO3eHZfVtwVY4DA14HqR+7KGKRGv+3Z9HVIs7F1qM0yM6WW7C8vCBX
 okAlSnDTxE18grVLGPQYTaAQ4VfuRBf0s0AzRHCXW+57iGW2dmzRJT0b6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359914328"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="359914328"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 03:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="788621152"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 02 Sep 2022 03:58:38 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 03:58:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 03:58:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 03:58:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk2zDhYL0oT3cQyVc0g7UrzYA5/PpVB9rmGWzk7FPNbSLDE+VrXqWuk6fs3c1hX6h4eVp3b6ZhtXTkZ88hJP58EUarUC40jMVmwawCnzeGB+MoxQQHUlMIX14hdQAZ4syq2eJX1gikGObuEScMmXoPyWUSE9CQisHoipkdaefYC1hkCIfvAYvTOWPFrLwNoRShxLHDCUPrFMTsGpypUhUo5c8ykHdG4MAQ4C4GoGE5D0n12FTDnAdAHKVITDAarHcvnoKxjB/u5p3pxXv3oxVRzi6eu7bfoYUJUPOowE0AX3RkHwtIiQjh5NhxR2oKmVnTXgUUlOUKCgLrR8HOSADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjXNjTG/yCmTfoYoMn7GqBVRIkRcprrJh0xgz/60+Og=;
 b=dwuxgb2Mh9vUTyCZ3jR2N00qkvvvS9G6LlFM9QupEc/GUXFB73WK25GuuRxPM2b3ExrAfwz+i18pcbKPa0X40ftqDM1RvnzNHQWl8rUZkfTUzfG6mDctZjuRI+ToVV74JGpCDvnkQr9rjEJM2FBkfgopEVwzgXC3RD5iQlYApi7SSsO7Ld+1ly/7wO4JNXkBQEji6vd3zTQKZBfS2oSjtGTVyd+6yxVNakYsWQ8keruunB8JP6m9MVu+eY+wC+BZ+EBTVMYEXK5ngQ0D0MhcsJLIl7qSoi+wY6YUU/K65zggmCSYPAIlAxPnBZvaVAel8tTjsD0m1DMYAyPuApKQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB4316.namprd11.prod.outlook.com
 (2603:10b6:5:205::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 10:58:35 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::549e:abb2:40dc:6591]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::549e:abb2:40dc:6591%9]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 10:58:35 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/4] drm: Use original src rect while initializing
 damage iterator
Thread-Topic: [PATCH v2 1/4] drm: Use original src rect while initializing
 damage iterator
Thread-Index: AQHYtuPpnA+iordOikqAnqq/hrllOa3MB99A
Date: Fri, 2 Sep 2022 10:58:35 +0000
Message-ID: <MWHPR1101MB2157B2A014A6A9D0BAE532F8EF7A9@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <20220823112920.352563-2-jouni.hogander@intel.com>
In-Reply-To: <20220823112920.352563-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c70cdd03-9988-4f9b-5be0-08da8cd21539
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3WpygYB1dsHwYSxbGEwmRnsOHPm5Uh6o4Lc4Lsuh+eWlC1KN0/sdF5RfETfFz2a9J8VLHfGMa2Fr+K9Z7Mf1VODHsg82cRKxqt5J2yuoivcoyI5ewzyHr5b6rk0LQEqkqIgYJvxj2FwcEGx5d1N39ydHmsObPI6HKO1GDfpWH/E9hR/QFQpsA61IYsGouYQCsDh+qM3nOz/qFpJifWmDr2LDNaQy9JE3TvLAMp5BSE5MUhVrQQv/Y5QH9tFhkHBfA/VyOLveRGOfTl6/Bi6uRd+JGzvaWXuOaPFrk046qOEwEaf/dwFh+1TKe/0AyTH6vM5r8JqKhxUPaGzjefMqsbCvX3Fi7T7wc+k1YU5PxQO1v/6T0RWjTcEiCR5MuyQ7xuydc5X0I3nl82MXpKJPta86Yjh1h2X1vd/4pbYEEquZx07T2RGbEHih29/WqwGO0bYw8WcHDL8Sy3wpeozbWDb4NPYrY6mA0uTMnlwASqUmmsSp5BdLIEjwiYgU1ZhBOXNECCiUohaaosNpWaGU5XqimXLDtF15nwF7M6Qec45CDk3u8ZtMBL8qK3NkUNM0VBGAfp2haLJ6uzJiEIFpa9JGWSmP6hqwTkj1M2IvvoMHqAT5QAL0NbCRhtpD3Dw9OfTEO6PGuiEWN5vVOVDy84YLr4abhwRC4sP0r8istnnlSSoWWIQ1KN/eQxa+ztx3H9EJATEi8ryP2VYxkHQj3cgnTQTJ1GzO+q98R00X1ud/A2nYQEp15OmIGZu6xelyUXCK5bqDT5eY0vBcXnn4wQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39860400002)(396003)(346002)(366004)(33656002)(2906002)(86362001)(66446008)(4326008)(66556008)(66476007)(66946007)(450100002)(64756008)(76116006)(82960400001)(110136005)(38070700005)(8676002)(316002)(7696005)(186003)(83380400001)(53546011)(5660300002)(6506007)(9686003)(478600001)(52536014)(122000001)(71200400001)(38100700002)(8936002)(26005)(41300700001)(55016003)(66574015)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjdIZFlIT0x2YVEwdmJZOUpieDJwMlhqcEVPcGV6R05hY2E5OEt2UHdvVDNI?=
 =?utf-8?B?eCtOQXZQSXFaeGtIblZhMHI2YlR3dFdkWVNoRVNTenRydjRGYTZEem9wWk5Q?=
 =?utf-8?B?WHdaVmZFTjBIdk81RVRiRTZSZVBVL3IwaFpIa214NkpUYldUTVFJWGlsSmdI?=
 =?utf-8?B?SFNwNlh4WVJ2c3RjQmhJdlY3V3NFS1F5UzlmL3V2SFkvcDdVRHdnZmVjVG5z?=
 =?utf-8?B?REQyclFmSDlLWDJHNC9sWGtFSEpZdkJvV1A1VHh3N3VKTjJJM1FpZE5WRUFL?=
 =?utf-8?B?REhOY3hzUHBjSWlmVTNtaGxVNmZ1NDdJdG13aWpYMWRGbWZ1dElTZGZLSDh2?=
 =?utf-8?B?d08zZXRXNXFRZGZaQUc3ZU9NSlVMRnlEd0FnOVVmc1lCK2RSNndpQzVrQWNX?=
 =?utf-8?B?cGxtSkZIM1RTMXZ6TW55bWFWK2NTMGlBMmhKTkwzenBQTFUrMzhHdmFoeHNW?=
 =?utf-8?B?OFB4Q3NOdW1RbmU2TjhscWtNeDJXMkxZRmRnZVV2SUxXbkxMVjkvZ0Z0b3JM?=
 =?utf-8?B?L0lKbnUrZmpyR0piS3BvMFBmQk9sTDcxM2lnRUtjOW9wYjU4RnAxdjFXcG5Z?=
 =?utf-8?B?N2IvOWRHM01QSFE5VndBMCtlVUM5d050dHF6a1huMnE5U0dXNCtZNGlmUVZa?=
 =?utf-8?B?emNkNC81eit5dmRtN1JjczVseFZ0dmdwTVFQRTdYdWZpV1NoZ3VCNkdzUlF3?=
 =?utf-8?B?UUh4eHZnSmFvKzdTdngyekFqRzJ2YUlFKzJnK3lqZ2I3TWRtdVNTc25VN2Ju?=
 =?utf-8?B?aU5tbXBNbDdRUEtlOENleTdyYUtydGFvajhmcDJGUWVBdVQ0bG05ZmdIQ2hE?=
 =?utf-8?B?ZGR5V3dPN0Q5K0NPckNwZkE5YTVuZTdJUWFibExtL3NBa0RkcDhJVnlaeXQz?=
 =?utf-8?B?M1g1MHNRTnpkcDQ3SS9RREdmMGZXcW5hRzg5SThuWXNBMmxBeFFsdjVranVF?=
 =?utf-8?B?R3Y5SHJNeXU0ZmhKR09XSXhQakJrMXAwUGV1WUlrUjJaWGpFcUpSU1JnVy9x?=
 =?utf-8?B?NnQ3UHVEWEpBZFpBVE8vRU1obURuaVlzdjlmUWNTR21TR2NiMi9jV1BBVktK?=
 =?utf-8?B?SURldEREbm9VK0JROVFyMTNWQ3lkSVBUcFcyRVdPR2FCOUtFZUhqcUNZUzF6?=
 =?utf-8?B?dGg0ZmFOVEJFd2JtdUwybTVnTURYRFh5NEFJSUh2Y2hMMDU1Z1lvNlUyaWJp?=
 =?utf-8?B?YmFUYVl2alJSbENib0lIcTZ0Y2lyZUZCY0g5alVaOE1PZ0pYUWZ3dFR2cnNS?=
 =?utf-8?B?V05ycE9MVWMvU1ZRdlpkQUVxYUl4Q083d09rYkxxSlNzMHRPRURaWEZXcEFJ?=
 =?utf-8?B?QjlTYnZCUUoxcVZDVHo3VzFpWWV3am40R0ljWGRUMEN3ZXI1djl0eXh2ejcr?=
 =?utf-8?B?TDl5MjUyUWtGNEV2U3UrOUZLWCtnUUdTU3F1Q0ZIYnNKNmxoM2hSV0RKMzNw?=
 =?utf-8?B?V2l5Zk12V2pRdTI4VWhxekRud2MyNnk0cEc2NlFRblJPUFRLTVlyZWdyRkVa?=
 =?utf-8?B?bzgzcnV0U1JKQWhPejc1Z2NCRk9QZjlnUDZ1OE5EZlZJU1VyZHlKc0dsc3Rh?=
 =?utf-8?B?Z0s0NnB5UkVwT3dPMk5vOTM5T2tOYlZnd1YzeDhEdTZSdHFNaDZ2UytyZUU4?=
 =?utf-8?B?RTlZZ3hJTVZZSlFoVWpkNEdoNExReUZTVTFYSmFjOUdkUkR0ek1mekZQclp3?=
 =?utf-8?B?NlJpUGxZU1JlQlZSU01MYnA4MXI4SVBNZXNDQmltY1N1RUtTQTk3dExWNjAx?=
 =?utf-8?B?N3F3VE9oSGhpRlRmd1ZlTDJlSVlaaFJFZm5hMmYrTXoxUE84T0pObGh6K2dz?=
 =?utf-8?B?SEhEWTlCWVVhWVMvbEFYWGdJRlIzdWd1ODRHRUQvRGQ3NWMyQnBUMFhlYnJa?=
 =?utf-8?B?Rk9UOGYrUG5mTHUzL0FDempCRkhnWU5wdTgxOS9qcVQvZlhFQ2t5cVF5d1dY?=
 =?utf-8?B?N1VjdENieG5nNnlsQkkyOURYUStaYUw2MlorTnlMdi80Q2x6VFJYT2VOdTR3?=
 =?utf-8?B?b2dQVW1lQUF1aEY5NmZKMzIrUU1hM1ZKNTQwNWtXM1NremdwOVBXYnFiVnYx?=
 =?utf-8?B?ZkdzS3JUTWd4djdvblBZU2tYR2NHTGszN3Z0RXFmTVlibjV5Z04wZEI4QTFu?=
 =?utf-8?Q?zPoYlreWZjGDC560jR+ev9OU3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70cdd03-9988-4f9b-5be0-08da8cd21539
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 10:58:35.2822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ya71ycRvUVecCM7LHWXfvq6tTeKtdOjk2niezKiDi5MbbQObB9hXX1zVlJpiO9DocXfcEABQEYYDxCZDArbag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4316
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
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZl
bC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pDQo+IEjD
tmdhbmRlcg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjMsIDIwMjIgMjoyOSBQTQ0KPiBUbzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAxLzRdIGRybTogVXNlIG9yaWdpbmFsIHNyYyByZWN0IHdo
aWxlIGluaXRpYWxpemluZyBkYW1hZ2UNCj4gaXRlcmF0b3INCj4gDQo+IGRybV9wbGFuZV9zdGF0
ZS0+c3JjIG1pZ2h0IGJlIG1vZGlmaWVkIGJ5IHRoZSBkcml2ZXIuIFRoaXMgaXMgZG9uZSBlLmcu
IGluIGk5MTUNCj4gZHJpdmVyIHdoZW4gdGhlcmUgaXMgYmlnZ2VyIGZyYW1lYnVmZmVyIHRoYW4g
dGhlIHBsYW5lIGFuZCB0aGVyZSBpcyBzb21lIG9mZnNldA0KPiB3aXRoaW4gZnJhbWVidWZmZXIu
IEk5MTUgZHJpdmVyIGNhbGN1bGF0ZXMgc2VwYXJhdGUgb2Zmc2V0IGFuZCBhZGp1c3RzIHNyYyBy
ZWN0DQo+IGNvb3JkcyB0byBiZSByZWxhdGl2ZSB0byB0aGlzIG9mZnNldC4gRGFtYWdlIGNsaXBz
IGFyZSBzdGlsbCByZWxhdGl2ZSB0byBvcmlnaW5hbCBzcmMNCj4gY29vcmRzIHByb3ZpZGVkIGJ5
IHVzZXItc3BhY2UuDQo+IA0KPiBUaGlzIHBhdGNoIGVuc3VyZXMgb3JpZ2luYWwgY29vcmRpbmF0
ZXMgcHJvdmlkZWQgYnkgdXNlci1zcGFjZSBhcmUgdXNlZCB3aGVuDQo+IGluaXRpbGlhemluZyBk
YW1hZ2UgaXRlcmF0b3IuDQo+IA0KTG9va3Mgb2suDQoNClJldmlld2VkLWJ5OiBNaWthIEthaG9s
YSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdh
bmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZGFtYWdlX2hlbHBlci5jIHwgMTEgKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RhbWFnZV9oZWxwZXIuYw0KPiBpbmRleCA5MzdiNjk5YWMyYTguLmQ4YjI5NTVlODhmZCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMNCj4gQEAgLTIyNCw2ICsyMjQsNyBA
QCBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlcl9pbml0KHN0cnVjdA0KPiBkcm1fYXRvbWlj
X2hlbHBlcl9kYW1hZ2VfaXRlciAqaXRlciwNCj4gIAkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX3Bs
YW5lX3N0YXRlICpvbGRfc3RhdGUsDQo+ICAJCQkJICAgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqc3RhdGUpICB7DQo+ICsJc3RydWN0IGRybV9yZWN0IHNyYzsNCj4gIAltZW1zZXQoaXRl
ciwgMCwgc2l6ZW9mKCppdGVyKSk7DQo+IA0KPiAgCWlmICghc3RhdGUgfHwgIXN0YXRlLT5jcnRj
IHx8ICFzdGF0ZS0+ZmIgfHwgIXN0YXRlLT52aXNpYmxlKSBAQCAtMjMzLDEwDQo+ICsyMzQsMTIg
QEAgZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJfaW5pdChzdHJ1Y3QNCj4gZHJtX2F0b21p
Y19oZWxwZXJfZGFtYWdlX2l0ZXIgKml0ZXIsDQo+ICAJaXRlci0+bnVtX2NsaXBzID0gZHJtX3Bs
YW5lX2dldF9kYW1hZ2VfY2xpcHNfY291bnQoc3RhdGUpOw0KPiANCj4gIAkvKiBSb3VuZCBkb3du
IGZvciB4MS95MSBhbmQgcm91bmQgdXAgZm9yIHgyL3kyIHRvIGNhdGNoIGFsbCBwaXhlbHMgKi8N
Cj4gLQlpdGVyLT5wbGFuZV9zcmMueDEgPSBzdGF0ZS0+c3JjLngxID4+IDE2Ow0KPiAtCWl0ZXIt
PnBsYW5lX3NyYy55MSA9IHN0YXRlLT5zcmMueTEgPj4gMTY7DQo+IC0JaXRlci0+cGxhbmVfc3Jj
LngyID0gKHN0YXRlLT5zcmMueDIgPj4gMTYpICsgISEoc3RhdGUtPnNyYy54MiAmIDB4RkZGRik7
DQo+IC0JaXRlci0+cGxhbmVfc3JjLnkyID0gKHN0YXRlLT5zcmMueTIgPj4gMTYpICsgISEoc3Rh
dGUtPnNyYy55MiAmIDB4RkZGRik7DQo+ICsJc3JjID0gZHJtX3BsYW5lX3N0YXRlX3NyYyhzdGF0
ZSk7DQo+ICsNCj4gKwlpdGVyLT5wbGFuZV9zcmMueDEgPSBzcmMueDEgPj4gMTY7DQo+ICsJaXRl
ci0+cGxhbmVfc3JjLnkxID0gc3JjLnkxID4+IDE2Ow0KPiArCWl0ZXItPnBsYW5lX3NyYy54MiA9
IChzcmMueDIgPj4gMTYpICsgISEoc3JjLngyICYgMHhGRkZGKTsNCj4gKwlpdGVyLT5wbGFuZV9z
cmMueTIgPSAoc3JjLnkyID4+IDE2KSArICEhKHNyYy55MiAmIDB4RkZGRik7DQo+IA0KPiAgCWlm
ICghaXRlci0+Y2xpcHMgfHwgIWRybV9yZWN0X2VxdWFscygmc3RhdGUtPnNyYywgJm9sZF9zdGF0
ZS0+c3JjKSkgew0KPiAgCQlpdGVyLT5jbGlwcyA9IE5VTEw7DQo+IC0tDQo+IDIuMzQuMQ0KDQo=
