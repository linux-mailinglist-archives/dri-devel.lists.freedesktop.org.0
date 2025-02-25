Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7088A438A2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 10:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E860110E5CD;
	Tue, 25 Feb 2025 09:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="njiXGBgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011037.outbound.protection.outlook.com
 [52.103.68.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F7010E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:05:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7Zn0o2fANMO51+VCVWb9q+FbfJXk89TBH4aAGkdUwky3+EJHeiZ97I/TDKEginVL7aRetOPwGCl8hjhPSCcVJjyhHbkeECe8LgaQA+V3YscAqm38Ha8YsfL0sXg1atPeiMFap9cUGNX/BWqMWHmaIUJwQX4f4pwP1vTZBxzMTyfLfqXvrF+q0GurZloV1QfjuReubkt6kEGMSN7F79xDDpp49Nesttr7RuOH1M9jWf1Xh7knggboJGNMMrrlIGeyVZCVkdjtfg/wivM/8WQEyEiKODuAUKknFF6rR2TZBc30zzUvengBAaAh5ymBWuLfg1HqWblAOrzHWS4vJ0kjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aou5PD7Hujkti+NoZTtzn6lGsmYrjphCudYsUHOORXw=;
 b=UCbsJXn+dnVKKkhgDZ+EM+kgVzDM8BEPsACYzFqEBO7auJ+kPzDYJunWCaMYQr7iegwWFCXvSccAR5oPencRQbH4y97HcanvGJoTHdPTYULPHV1MxPoUx9CfREMSVUBtY6RHFGWf3JIgg7mVJ76iMArq0qZKK9ZmXVs3wV82ae6u7UtB9aP9KwAB1ShmR+VbvkncUB6O2quEjdGLaq+qA8MHzAlYulWnNDZ+qPyWtOyaJofzVM5+H0SlXttJyO/J2qwjzE4emMqdaC3TgJtyc3lDeH4liouZlFfsN0yOoBriulAn10dNzEwiC9U2YhsWSmU7iAKhWr97CYuAKI8+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aou5PD7Hujkti+NoZTtzn6lGsmYrjphCudYsUHOORXw=;
 b=njiXGBgUXZCXf9dbr9mNSOUzGURxnaglPnx2WMLuk82VqpRvlWkX3jH26VSXNNKiPUiP3kC7rNYADo9Rr5PL9y68SkNaUMjawn49iantuc3r3hVlMJJdUQ1gFXdFAeGT/1TSBguP65jpKkl1pcq2loDKzW9Hgr5ndKMaELzMKBCZqUDttziIziPXFDZlS1GIJk3N/2MpoFnO7kQTsoegbEVWrdYqsF2C7tvFEQhqHb/PzjTs3apSZuqXPC8r7E487j/TbIvW+5ToI2PCKnQKCLzO7THLUdweuuFHd9tVROrouUVG490fQofUwB81mB5BOqiJRGnISij1RqWuCyvTkw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PPF729037332.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::1b1)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Tue, 25 Feb
 2025 09:04:51 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 09:04:51 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWrTuIgAD67QCAABL7QA==
Date: Tue, 25 Feb 2025 09:04:51 +0000
Message-ID: <PN3PR01MB95979D1B21250604F834357FB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <PN3PR01MB95974D5EB5A25386A8BF6FDAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ca34309a-f2b2-4082-92df-86a775952348@suse.de>
In-Reply-To: <ca34309a-f2b2-4082-92df-86a775952348@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PPF729037332:EE_
x-ms-office365-filtering-correlation-id: d533ee21-6c37-4d15-9377-08dd557b76ae
x-microsoft-antispam: BCL:0;
 ARA:14566002|6072599003|15080799006|461199028|7092599003|8060799006|8062599003|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: =?utf-8?B?a2lmNU1aYnZQdkFiMFZzZW5PdzZpSkJJZnRtUHdJYktlbUUzc3pqenpFNXZa?=
 =?utf-8?B?aFZGcXBNOWs2UlZhWjJGd0VLRlFPdGlYaUswWEo1eUNNZDZHS2NZamhPMnVI?=
 =?utf-8?B?VVhXNG41VWZnajFLMkhXQjFwTjFrK3BFRkhDbXdqNU1TNkVVekE3Tyt6UGo0?=
 =?utf-8?B?UVJDTmtVSVBhL3VNL20wMXM0RzFqQ2VzL3pWSU5xdXBOSXlvR2VTemdvV05V?=
 =?utf-8?B?WmIvbnY2MFZPaG40a2tRY0VXOXVHUTlqZ3N6MUFmUWNTL3YxSGcyK0doRStz?=
 =?utf-8?B?Y0wzNzltcGJHcGdBUHJ4eVIvdzI4TUNvNVNVdWVhS1RQbGN5akcwVmVJc3RY?=
 =?utf-8?B?VFRKRWVwMnMvd3hwcXRxd1pZTU1DQ0RYUExGblhmQVlkVGZYQXU4dXIwNTMz?=
 =?utf-8?B?c3U1TFpseXBDb2VjTVgxQ2lpYW9qRG54a0pMWlR3NVRyWDBndmNTRkZSQXo4?=
 =?utf-8?B?N0xNbEdGMzZKaXVrSDB1L1l2cmppRGJCMDBYTkpQV015STBMdVlveDgyeTZ3?=
 =?utf-8?B?R0QvUGtqTFdiTGFFbEtsNWVmVktibndGYWs5UUtTZENxZmNRT25lbTdsNVBC?=
 =?utf-8?B?Y2pqT1UremlZaC9qYUcydjZEVi9lNGo2YW5Rd1hIOW1haTBydncxVG1taThq?=
 =?utf-8?B?NWUwOE5TUlprWWlmV3A2ZkpFRHMvSTB2TEF0alhPSVQ1c3ZOYzl5TVFiODc3?=
 =?utf-8?B?cjV6eW5CdVUrS1ZZZTNxeHNCTnpWY1RtVDFFYmNHMURWdTFGUnN0MFRMc0or?=
 =?utf-8?B?NTZLc2tLTW5MWER1alZRVkpSMjUySVBTSnBjaGwxWitLZFEvQVdiQk00QzZV?=
 =?utf-8?B?a0w2cGZQS0NEenNJbEYxQUU2RGNIL1JFVDRiNGVQTVl5UkNkTmFSaVdGWFFy?=
 =?utf-8?B?eTVoVlNUSlZwSUduYXRLZmJJN2VCUTFHYWlWSEd0Und3a3JvQjZoVzlVbnM5?=
 =?utf-8?B?WkRWUWVxQ3diQjJnZktxQjhhcVJvL053N2NRb1N0Z2pBTXZvOFRXSXhPdkgx?=
 =?utf-8?B?eUVIQ25tL0Uxb3hRelc0NkZtQ3MyQzZ5NWtMTXBqczFKZEE1ODRNNm53cmlF?=
 =?utf-8?B?NWhvUjBJZldLZnBicncvTERkbmRKOElBenBsNEluTEpMTGp1U3Y0RzYrT3N3?=
 =?utf-8?B?ZERscm5GN2k2V1lWWW5lMnhhd3IvU29HSXdUbXZMc3EyUEdBRFowOEhkVUdG?=
 =?utf-8?B?bk9TbTYvWTR5aXFTbzYrMzQyZU9EcHppMmNVRmFNckE4aG9STmJTVi93OG5E?=
 =?utf-8?B?Q2tWRndjSFpVQk1xcVFxV3FWLzVOcEtSUWtxVk10a2EzNnhSMER6cGFuZGNu?=
 =?utf-8?B?dFV5UFRNY2hXVWFSQlRRM3Vqbjc0V2ZVOWs5Y1daam5nZmg0S2NuYUM0cW5F?=
 =?utf-8?B?WUNOMnZUaksxT01CNjBNM25scG5OcHYxUEZxM3ZzUXNlMnJndmJnWVIxS2Fh?=
 =?utf-8?B?K1VRWFBydDVFcTNUMEo2Vjc5UHpsNWVrNkJOVHk2eW5mT0cvNTl1R3Vkcmd4?=
 =?utf-8?Q?H1Va+Q=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzhvbHdIN0l1MDQ2bHV4STdVYXpkK0F6eGtSVEQxNnphNFZPRDN3MDVTYmpG?=
 =?utf-8?B?Q1ZhOWhUaWxhOTNmdWJ1ejRCM0s4MEplMnh2YWJnQklFU1dRUCs0dENhRlA3?=
 =?utf-8?B?VEYraHJ5b1JQOXFqSW9DVHlpaXdqOVRZUzl2bWJ5L0FKS2xIZ3luR2tWenJS?=
 =?utf-8?B?bGFQMExUK2pBMXYyZStIY2JOWms3UUtUWXFaeXM4b0x4S3ZnRUJGays0d2I2?=
 =?utf-8?B?RlpjZlFYdFArRXVyTiszQnNiUG5ZNkpISTFSVmtVZjhOTTlnM3YvUDVoMmxG?=
 =?utf-8?B?c1JDUkgraTVQcTRiR1Q5Z3IxSWxRUlpHbnFnalFYSmQyZEFKYk9LN0RaTnlG?=
 =?utf-8?B?K1p1MlJQS3FId1cwMlBDV1Nhcmt5RTRYeHVWWVMwN0VqY3dKUDhtZ1h0aWJ4?=
 =?utf-8?B?OStxZXhSVmVSTEVxSHNIdWYyRldnYW1ZKzQwZFNrajFPMHhsbXFOOTlWSXlJ?=
 =?utf-8?B?ZTBIOGNKUkRnN2tIOThhbXlZNW5laTRKb0J2MHJBZHN5YWpleWxEM1ltWmRW?=
 =?utf-8?B?RjlHWkdrRVJ5d2xjdWIySkVuYkExNjk3K3piak9XaVdpRUJISi9tNEN4MThn?=
 =?utf-8?B?Q1dZaGZUdXcyY04wZTVzVzJ5aUNBR28rakYyeWVwb2tselZ5bEtRSmVuajJh?=
 =?utf-8?B?VFd3Qm5IOE5aSzBhdit2N1d6b3pLSm5nRytKSnhzSk4rNzFoUnowbTV5SWpS?=
 =?utf-8?B?c0dqSE1vbjNxSVllbW13VDJnZHZhTHlhZHpJUmcrV0xrYllwYVA3bHZHL1BS?=
 =?utf-8?B?eWxlZ2s5WGYzNjVQd2o4aXpFUHFqYTlydGI0S0hFZlUrRitqSXlMQ0NjaTQz?=
 =?utf-8?B?YzJBbXoxMnh3S1h2UThMNDdmYjZvT1Q3UWhsOUlxSXZmclhvK3NUZnBpcURo?=
 =?utf-8?B?aWdhK0wxV3FzZVFzVHAvQXRMNktvVnlHOUlLWC9kaVVTY1BWUzlQZ1BqaDRD?=
 =?utf-8?B?Uk1NUVVtSWpNc0liZ1hqS0xBdEREZlpNdGhRS1I3UnV0M3NUOUxNdGVlT2RY?=
 =?utf-8?B?TGhuaVZqZEpEa3NFaDQxUWRVR09ZL0d4U0JRc0hyM2xIem44VndiTVU5OU9T?=
 =?utf-8?B?NVZVUGd2ZVgxVzZOTW9DVVFtNjZDNE5WTi9OS25qQ3IwZjRNOTM5VWEzb3B1?=
 =?utf-8?B?ZU5sOWNKZThiR3hhMEJXdHRNUVJ3Yk55cFhZZWp2S2ZFNXN0N0VKbEtoVitu?=
 =?utf-8?B?cWIvRFpSekpIejNPM1ZKcytaMUdtUmFXUUQzREprMjNhQUpBZWo4SGwwK2l4?=
 =?utf-8?B?MTJteDBsMTA4WXd2aU9TTDNTWHhqTDFDOEhxMG4zWnN6NUdBYWpMWFlDTW41?=
 =?utf-8?B?TUZ3cnNKenhZcTVTYlE4MEswNEpHWWZ5SmNMczZpTG1Qdkp3OG9reUgwbWFF?=
 =?utf-8?B?RVNnTUpQc1BtREdrU1RlTTNUb3ZGeGNySE9Hb2tyR0lhQWpXNkpoVlpQeVcv?=
 =?utf-8?B?bEdvOXVxc0hjT0IvcFdQUTZqeldPVC9WMFErYVFQTWx5UHNLbXlWbkFhNGFB?=
 =?utf-8?B?UVhhS0JRZk51eHNSMzY1Y2JHQmlhb0FBK0FaaURJRmZGcEQ0MkhEM05ZL202?=
 =?utf-8?B?WWlZUWY3cStpSU5haldwOW1ORHdDWHZKUjIxNHJ4QnFoY2I4Ym5QR2tWbUF2?=
 =?utf-8?B?T2s3UXJoTjl5b2pLb3h6Q1NHUzBzQ3FuSkQvaFBIWi9iM2labEJ1bFdpK0hX?=
 =?utf-8?B?VHlORHpodnRPZWs5d0NBNm5wNlpERE40SFRZWVArV2JWSy9oTlBjRitlMnBq?=
 =?utf-8?Q?echyciKamHgADCV8QY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d533ee21-6c37-4d15-9377-08dd557b76ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 09:04:51.6934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF729037332
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDE6MjfigK9QTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4g77u/SGkNCj4gDQo+IEFtIDI0LjAyLjI1
IHVtIDE3OjU4IHNjaHJpZWIgQWRpdHlhIEdhcmc6DQo+IFsuLi5dDQo+Pj4gDQo+Pj4gK2NvbmZp
ZyBEUk1fQVBQTEVUQkRSTQ0KPj4+ICsgICAgdHJpc3RhdGUgIkRSTSBzdXBwb3J0IGZvciBBcHBs
ZSBUb3VjaCBCYXJzIg0KPj4+ICsgICAgZGVwZW5kcyBvbiBEUk0gJiYgVVNCICYmIE1NVQ0KPj4+
ICsgICAgc2VsZWN0IERSTV9HRU1fU0hNRU1fSEVMUEVSDQo+Pj4gKyAgICBzZWxlY3QgRFJNX0tN
U19IRUxQRVINCj4+PiArICAgIHNlbGVjdCBISURfQVBQTEVUQl9CTA0KPj4gQnR3IEkgaGF2ZSBh
IGRvdWJ0IHJlZ2FyZGluZyB0aGlzIGRlcGVuZGVuY3kuIFdoaWxlIGhpZC1hcHBsZXRiLWJsIGhh
cyBtYWRlIGludG8gdGhlIGxpbnV4LW5leHQgdHJlZSwgaXQgaGFzIHN0aWxsIG5vdCBiZWVuIG1l
cmdlZCBpbnRvIExpbnVzJyB0cmVlLCBhbmQgbmVpdGhlciB0aGUgZHJtIHRyZWUgSSBhc3N1bWUu
IEl0IHBvdGVudGlhbGx5IGNvdWxkIGNhdXNlIGlzc3Vlcz8NCj4gDQo+IFllcy4gV2UgY2Fubm90
IG1lcmdlIHRoaXMgZHJpdmVyIHVudGlsIHdlIGhhdmUgdGhpcyBzeW1ib2wgaW4gb3VyIHRyZWUu
IEJ1dCB0aGF0IHdpbGwgaGFwcGVuIHNvb25lciBvciBsYXRlci4NCj4gDQo+IE1vcmUgcHJvYmxl
bWF0aWMgaXMgdGhhdCB5b3VyIGRyaXZlciBzZWxlY3RzIEhJRF9BUFBMRVRCX0JMLiBGcm9tIHdo
YXQgSSd2ZSBzZWVuLCB0aGlzIHN5bWJvbCBpcyB1c2VyIGNvbmZpZ3VyYWJsZSwgc28gdGhlIGRy
aXZlciBzaG91bGRuJ3Qgc2VsZWN0IGl0LiBZb3UgbmVlZCB0byB1c2UgJ2RlcGVuZHMgb24nIGlu
c3RlYWQgb2YgJ3NlbGVjdCcgaGVyZS4NCg0KTG9va2luZyBhdCB0aGlzIGFnYWluLCBtYXliZSBp
dCBzaG91bGQgYmUgc2VsZWN0ZWQuIElmIHlvdSBzZWUgdGhlIGtlcm5lbCBjb25maWcgb2YgVElO
WURSTV9IWDgzNTdELCB3aGljaCBpcyBhbHNvIGluIGRybS90aW55LCBpdCBpcyBzZWxlY3Rpbmcg
QkFDS0xJR0hUX0NMQVNTX0RFVklDRS4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4g
DQo+PiANCj4+PiArICAgIHNlbGVjdCBISURfTVVMVElUT1VDSA0KPj4+ICsgICAgaGVscA0KPj4+
ICsgICAgICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50IHN1cHBvcnQgZm9yIHRoZSBkaXNwbGF5IG9m
IFRvdWNoIEJhcnMgb24geDg2DQo+Pj4gKyAgICAgIE1hY0Jvb2sgUHJvcy4NCj4+PiArDQo+Pj4g
KyAgICAgIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6
IHRoZQ0KPj4+ICsgICAgICBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgYXBwbGV0YmRybS4NCj4+PiAr
DQo+IA0KPiAtLQ0KPiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPiBHRjogSXZvIFRvdGV2
LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQo+IEhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0KPiANCg==
