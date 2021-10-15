Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F0142F9F9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 19:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6146E0E1;
	Fri, 15 Oct 2021 17:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC72C6E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 17:17:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="225416982"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="225416982"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 10:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="593039254"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 15 Oct 2021 10:17:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 15 Oct 2021 10:17:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 15 Oct 2021 10:17:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 15 Oct 2021 10:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6idiZlK+0aZaRl3dQxiKFC6eN7OfIseWg73VwYqHfWEn14Wl0Twa0laiyBAWnH+/zmUlYGgfdg8soj0VnUP8XgOvlMIWW8/S1nZuDpHaBtzxxSzWtrgCVapa/RknPkcqD+9kCp4WSKOpcPcg36Nwcc2L0l/KsYqz2Kjd2QAQ5qGvkvQDHUHNxKjQl+PPmBM2+g/FLwyO0M5zvWNRfWRSnDVKDOKvZcep51OFkHtX7jW+YCaPiWxjjtHoIqdRUz7Cw9qg/d7NesFdMgY0XBQ/XnMUThYKAUm9i4hf+VzueIrGbeAj641zXESjHKgREaYuXH6erzKiCVoWEySlNKS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dWZdnHU8knNn4WrXGazz3+AVWDPi0Aq3DWlt0ABSEo=;
 b=UACR3yqi0QjD361Gaicz2hGYBnExqGKx88BgmuEtMDRZyR/q/rmdIo2GK0KvvBkECbiNjf7bS7nptSzALR7ABi8jWarIQ8bnWdJldjPq+q9XwwKy4ndxV5XH8UT26SRo4ggFBvOjEZNAhYM3oXIvnUJ8sVG1kV0WJlc1Gl1j9rZsg+PqmqnG8ZGiDYFEsYwseN2LgOlqXhbMIjqNwkoNzJIvtzSo3p+su2qSr4wBXn/ZRQ+KL/znLsyBon43NyyR5k8cKLxjeJZ73kg62OPpIwTA8MNU7hp340vGQySG89fPWlrl5ZULNjmwYJf2g9YCxY8aNcJmzVNKhKpQHYzDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dWZdnHU8knNn4WrXGazz3+AVWDPi0Aq3DWlt0ABSEo=;
 b=vPO7MZGTgf5ecTfsHJtxrOAjXLv6zKgFURUXajic8XkoCQYe+Hoz+lLEX9qL+JFEfIU3vw6zqxNZJZPuLX5UFUXxsMP/wMHjKK5Fa2U6VcQ6yLinj6eqDypuWUfSf/GXl4Un36Ui7AQ15YNAdnbVTJrGhzMEQEqhaoMcdEvfm6Y=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 17:17:24 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::18c0:1369:4bff:1835]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::18c0:1369:4bff:1835%7]) with mapi id 15.20.4587.030; Fri, 15 Oct 2021
 17:17:24 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "sam@ravnborg.org" <sam@ravnborg.org>, "Dea, Edmund J"
 <edmund.j.dea@intel.com>
Subject: RE: [PATCH v3 7/7] drm/kmb: Enable support for framebuffer console
Thread-Topic: [PATCH v3 7/7] drm/kmb: Enable support for framebuffer console
Thread-Index: AQHXwItRpfWINtcgfkC/eglMwnZayKvScwIAgAHclkA=
Date: Fri, 15 Oct 2021 17:17:24 +0000
Message-ID: <BY5PR11MB418211E0BC394D3FB22811CC8CB99@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
 <20211013233632.471892-7-anitha.chrisanthus@intel.com>
 <81a14354-e03a-7768-ed90-effc5adf19f2@suse.de>
In-Reply-To: <81a14354-e03a-7768-ed90-effc5adf19f2@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 035478dc-bb94-4acd-5914-08d98fffa7cd
x-ms-traffictypediagnostic: BY5PR11MB3909:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB39090E9E220B605D0C1870E28CB99@BY5PR11MB3909.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NB0hU0ui41MQf/54A+QYgt5HE9ZJDZB45Iuw6dDWW/ThwSxUHap8aSe57LlbRnbahYkBGqjgAzz42RUsMoykcYAZr88ehKHLbgDDTE47rez4/kx2ds2vw3QGHA0ZNiJV7ybsU+A7WgvzcYMa8eB20ZB9bPIGTOoxhwNQ35McHGEkWOOdaJQpV0M0v5MvxQDfpPue3RStCStCkAPna1BX6Y/LY0uCCeRzzDDod/7G4rRM/VrYwW3P0XeD80yBs+6Uh1qbqgz5539aDn4pNY9ZdLAXp5PMr/0pl7pe7jWLJ3PH61HAyPgpQU2gvW4tIcU8VXZDBZzHCdf/EJl1XwbDL1gUNbxIn2t41dTs2kUoI5gsImbBEWKU1KR1tzWUwe5tNkEJQ/Lu711huo1eXqV84RiOf2V4T3GA6ieaUbZCwfvEgFg4B+0U5kKdSG3WZeoBFhewaxln+Yef0xGm4PlV7n0dg+IcvjghjrC+83GmbDNLMdAddaZcaorYmwU0RoIEPfebDrnQqsLi7J9n2WZeUCSONXTiuEiZO9f73IQXOdGU9/gcnLf9EB4oMv6pm+mBdHoHp85+VneTDRnsHQck4fJ5e8al/vAKEaXFiRPPgGfvEJOCJsWbau1BhsNtHOc4qbOTsgh0j1WFs+EWfSfkmq4dDNN/8ACoKCZJurV8UVJ0Ti2ObLBMTDV+NXNkgXn16K5NqPeIfD9cwIKqzYy1wg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(38070700005)(316002)(38100700002)(122000001)(7696005)(71200400001)(54906003)(110136005)(9686003)(76116006)(64756008)(186003)(66446008)(8676002)(4326008)(33656002)(107886003)(86362001)(6506007)(66476007)(53546011)(66556008)(66946007)(82960400001)(52536014)(508600001)(8936002)(83380400001)(26005)(5660300002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUptVUhzS3ZFd3NEOXkzbStFd2Jwa25HV1hPTGZYTlE0eFpyN2VpVGdMY1Vm?=
 =?utf-8?B?RFhoUGdzRUdPcjM1d0VDY1BtdmNxODd5UWIvNHp4VG5mV0g2ZEIyZHpMeG1o?=
 =?utf-8?B?VDhzZ0VHYng1NWVVYm1xQm9iWERHcDU2a2FtUHpDUUlWczhCa0NZQkpUMU5B?=
 =?utf-8?B?dE9WTUs1YUdFR2RBZjRrU2szby9YMlBqV0NhdmpUZ3JPY3kyOFhHNERUN2V2?=
 =?utf-8?B?SlRaekMrdGdCZWt6QWt2ZGZsMGxuWENDU1lEZnVPT2NsaEVibWpTeWdiRFJM?=
 =?utf-8?B?TnQrcmxjTW1ILzZmNVlwQ0VhZS9vNmprS2tJOVBGVThEWGEzdEQxdVhkdXhV?=
 =?utf-8?B?T0pZNnhIT3BtVm9wNHVoS2JZQ3VHQU5lbkZqdmxCRFdGN1podnNiY2hmT09l?=
 =?utf-8?B?SGp5MHdPMXJmYjFub1RiK0VpZVgvRTJIZWk0enFjTHZzbSthVHloUHN2ZmdN?=
 =?utf-8?B?Z0R3K1Z2eHR3ci8wS3c1enBmTE1yZUFIR1ZUek1WckowTEs1T3Q2dkRTeGVW?=
 =?utf-8?B?N0ZxYU9tYVJaMElya2t2THJ2MHZMWktRSUdNdld4VVErKzd2c0srUFY0ODNw?=
 =?utf-8?B?dzErNjNNVE5UMHhLLzhjY3BUTU1tU1BTMXg5RTIreGVnNm1uYVhVK2JDNUZC?=
 =?utf-8?B?RGZHbzJ2bG1nbTZkRlhZeGViakFLR3l2cStqT0R0RWRmK3BRbjJvWCt6MWxB?=
 =?utf-8?B?cFcxTk8zRXRQR1kybDJnUk5mU3hWa2VIL3JXcWxqUmxtT3g5ZVZoY3c2OGI4?=
 =?utf-8?B?YWFsR251OTFxWmk4K05OeHVqeUcwSHI1ejYxY2lQdVA2RlJ2aDhCSWhsMUZJ?=
 =?utf-8?B?ejJLcFBNSGloZjYzWEZVb1RqNWlSRXY0NmpoUlRCRVBLNXZtSU9NZ1dCUzdS?=
 =?utf-8?B?QXBmU1M4dWc2VEs3bjJOYktIUHFSd3lUajF5dmlNZUVvZTVQQmtCYjh0Nmlh?=
 =?utf-8?B?ZUR5cENBVEZESFdEc0x3bFkvaVZXeGljY3ByK0dZUytOOEZWZWZhSG5TcC9G?=
 =?utf-8?B?dTNVQ2xKVlAvUUdNWnVLTHRIMWpNV0RleFZTdDJ2RndFVlpaL0VoZEw3VnN6?=
 =?utf-8?B?UURUMUZtQTNQU0FPNU9NVG1TTHpRMm0zS0xCbkNzQ01xU0pDWHhxQnNUaFZY?=
 =?utf-8?B?NE9lRjgvYVEvRmdmN09zVUVwakpIbWtoSnpTZkhydmVVZnBZY21QUHpxVXdL?=
 =?utf-8?B?aU94eVJQWDMxUW5NQVRoMTN6Rkd5a3NTc1ZVZ0gyU2Q4Q3E4ZHN4YUtJVlk0?=
 =?utf-8?B?V0xzeU5ueVgya085SkF6SFRtY3dIdGs5ZFdSQ0dhdm1IUUZxNTdNTTBCVWI4?=
 =?utf-8?B?bUJwU3lwclFOa1c0YkE5ZnM0ckYwQ1ZtczhkOVRaNzdNN1Qzd1E2SDJPK29x?=
 =?utf-8?B?SlRsOFFKbVR2SkdZUUJOZGxhbnEvZ2xSQ0l6ZVlUV0pUNU5uT1hJbjZQQUhi?=
 =?utf-8?B?djhYOU5ZZHQ5SG12UUowZnFUQ09PQ0w4MDRoSWR0UXpCR0xVdk4yZGQzc1dt?=
 =?utf-8?B?TFRlWWYwTnRTUmM4Uk1vOVVMSVVVeXlFVHpteUp6cDZsbGYzQ2xUcVRLR201?=
 =?utf-8?B?bXl2QWE2UnRscHZweXJnWnZLMk5paHM2cVh3cVovcjlnOFMyWGJGaWgydXpS?=
 =?utf-8?B?Y2NkanBuRFR5bzhYeXRnbUFiL0M2TlYvUlowTWp1VURwTnE5eEIvd1JJbVlh?=
 =?utf-8?B?WmR3Z0xjVy82NFhRekd2Y0lhcEhsMEZTL3JHL3RWM1hiZDhicG5aK2tLbFZh?=
 =?utf-8?Q?Nks1/Yj0k+QDxW3X4A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035478dc-bb94-4acd-5914-08d98fffa7cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 17:17:24.3341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBA09/S3fsDQQQkb5y1xC9AhRtJk1jb76G6iZj9qTaqQgXitKThK/xz+vm3wpIg6UOhhtGU0S9Eo7G12biNV99x9A6C3Pma9rEr6/T+Ocpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3909
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLA0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTQsIDIwMjEgNTo1MCBBTQ0KPiBUbzogQ2hy
aXNhbnRodXMsIEFuaXRoYSA8YW5pdGhhLmNocmlzYW50aHVzQGludGVsLmNvbT47IGRyaS0NCj4g
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBzYW1AcmF2bmJvcmcub3JnOyBEZWEs
IEVkbXVuZCBKIDxlZG11bmQuai5kZWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYzIDcvN10gZHJtL2ttYjogRW5hYmxlIHN1cHBvcnQgZm9yIGZyYW1lYnVmZmVyIGNvbnNvbGUN
Cj4gDQo+IEhpDQo+IA0KPiBBbSAxNC4xMC4yMSB1bSAwMTozNiBzY2hyaWViIEFuaXRoYSBDaHJp
c2FudGh1czoNCj4gPiBFbmFibGUgc3VwcG9ydCBmb3IgZmJjb24gKGZyYW1lYnVmZmVyIGNvbnNv
bGUpLg0KPiA+IFRoZSB1c2VyIGNhbiBpbml0aWFsaXplIGZiY29uIGJ5IGxvYWRpbmcga21iLWRy
bSB3aXRoIHRoZSBwYXJhbWV0ZXINCj4gPiBjb25zb2xlPTEuDQo+ID4NCj4gPiB2MjogYWRkZWQg
bWlzc2luZyBzdGF0aWMgY2xrX2VuYWJsZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRWRtdW5k
IERlYSA8ZWRtdW5kLmouZGVhQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbml0aGEg
Q2hyaXNhbnRodXMgPGFuaXRoYS5jaHJpc2FudGh1c0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0va21iL2ttYl9kcnYuYyB8IDExICsrKysrKysrKysrDQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9rbWIva21iX2Rydi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2ttYi9rbWJf
ZHJ2LmMNCj4gPiBpbmRleCA5NjFhYzZmYjVmY2YuLmI0ZTY2ZWFjNjNiNSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0va21iL2ttYl9kcnYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9rbWIva21iX2Rydi5jDQo+ID4gQEAgLTUsNiArNSw3IEBADQo+ID4NCj4gPiAgICNpbmNs
dWRlIDxsaW51eC9jbGsuaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFtLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvb2Zf
Z3JhcGguaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiA+ICAgI2lu
Y2x1ZGUgPGxpbnV4L29mX3Jlc2VydmVkX21lbS5oPg0KPiA+IEBAIC0xNSw2ICsxNiw3IEBADQo+
ID4NCj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4NCj4gPiAgICNpbmNs
dWRlIDxkcm0vZHJtX2Rydi5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4N
Cj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9jbWFfaGVscGVyLmg+DQo+ID4gICAjaW5jbHVk
ZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+DQo+ID4gICAjaW5jbHVkZSA8ZHJt
L2RybV9wcm9iZV9oZWxwZXIuaD4NCj4gPiBAQCAtMjQsNiArMjYsMTIgQEANCj4gPiAgICNpbmNs
dWRlICJrbWJfZHNpLmgiDQo+ID4gICAjaW5jbHVkZSAia21iX3JlZ3MuaCINCj4gPg0KPiA+ICsv
KiBNb2R1bGUgUGFyYW1ldGVycyAqLw0KPiA+ICtzdGF0aWMgYm9vbCBjb25zb2xlOw0KPiA+ICtt
b2R1bGVfcGFyYW0oY29uc29sZSwgYm9vbCwgMDQwMCk7DQo+ID4gK01PRFVMRV9QQVJNX0RFU0Mo
Y29uc29sZSwNCj4gPiArCQkgIkVuYWJsZSBmcmFtZWJ1ZmZlciBjb25zb2xlIHN1cHBvcnQgKDA9
ZGlzYWJsZSBbZGVmYXVsdF0sDQo+IDE9b24pIik7DQo+IA0KPiBUaGVyZSdzIGFscmVhZHkgZmJk
ZXZfZW11bGF0aW9uIGluIGRybV9mYl9oZWxwZXIuYy4gTm8gbmVlZCBmb3IgYQ0KPiBzZXBhcmF0
ZSBwYXJhbWV0ZXIgaGVyZS4NCkdvb2QgY2F0Y2gsIEknbGwgY2hhbmdlIGl0IGluIFY0Lg0KPiAN
Cj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4gPiArDQo+ID4gICBzdGF0aWMgaW50IGtt
Yl9kaXNwbGF5X2Nsa19lbmFibGUoc3RydWN0IGttYl9kcm1fcHJpdmF0ZSAqa21iKQ0KPiA+ICAg
ew0KPiA+ICAgCWludCByZXQgPSAwOw0KPiA+IEBAIC01NTksNiArNTY3LDkgQEAgc3RhdGljIGlu
dCBrbWJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIAlpZiAocmV0
KQ0KPiA+ICAgCQlnb3RvIGVycl9yZWdpc3RlcjsNCj4gPg0KPiA+ICsJaWYgKGNvbnNvbGUpDQo+
ID4gKwkJZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoJmttYi0+ZHJtLCAzMik7DQo+ID4gKw0KPiA+
ICAgCXJldHVybiAwOw0KPiA+DQo+ID4gICAgZXJyX3JlZ2lzdGVyOg0KPiA+DQo+IA0KPiAtLQ0K
PiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPiBHZXNjaMOk
ZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=
