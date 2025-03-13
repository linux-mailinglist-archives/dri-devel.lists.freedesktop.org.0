Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FBA5EF3F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 10:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048B710E0E8;
	Thu, 13 Mar 2025 09:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="CKuGIUTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011025.outbound.protection.outlook.com
 [52.103.68.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844DC10E0E8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iu0K4JD2VrL7xsY7r/+CAC394zXk4bggElrZ2XrV4wUf2AaZ+L5Yuidfgc+h9AUqhOpx0v7oP2EMvvJGBZV+/vFLwqsChACb7csxZBey6HcAQ7X6FVCRZsVY7g42xUeBxEPycGDzZSxCeECzraaEg2RqrgOmVwo/vRvbyJK7vl5qZ59OPjRyW6ZQbpi8Ud/rROSGKtSpL8JZjsO2tKvb620TvWfviM5nHUcgMoROxeb5X1zjBulim4eR65fzs6MxLX1diNY7dSF/QjrLxJgMc0tE4pAbxEkak9zfpEEzu9oJOFN5do/1ioWqu2gBbw3uX0XT935/rUmUYPXZSMDLAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDtTVpFIlUa7RrwAkb62H6Ez77v49Su7PhfOl7YqbgY=;
 b=XnZlT67Bhvc8sCaISDAEtmjxlLzv57MAE1PNrN0JrkcSApwOR4fmCVpp3uijIAbLhmdCsMu02EMA8Cj4SvhRlh4RtwYftEkriF8LvRrV0xcjV+VxKbWAMzCNVrGaaISK32RGQKJk8P8CrA8csGgC/ffvBymSTBt+jK5ri+TjwuCjlLr2O8lFBhmIVHW+3QturlxmB0GgqzMRhucnkXFc6KmS9nSqly7vNC9+nytYCczvyzx5O1rbomTiSGCouVWJK6LZEqq8/dmVJ/pk+Ez9WdIzOEnhtwrGzDMpRYZIRxNy0hhbBF0OFzXvkAS3ddfACIBUenjFQXrGa1NqGsBx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDtTVpFIlUa7RrwAkb62H6Ez77v49Su7PhfOl7YqbgY=;
 b=CKuGIUTeVBJu9X0QxTeAxxfQpa8pmMLyYgQ7yoxVs3jbQh/WPrKLoi79peZfTkBBVb/JGrw+uhnc5JwHed/V7ma8qONeeTNx57rrWWzFbLHdIArb5/OiLRBb/rVNb4HOkARDSlItRdWzBXB3d6ppm98wdkiVYB5y6ePYmgRlepJFpsL1OsebyUriGFpRDRBaib1s4bSsektDbQn+/aTZ11fPUzkVu92P/Lw0/IzoTFIknQhvyayE2Ad58Y8GuUKXT/4Of7WNDw7NqJBOtbfgHit4KtOhkR6+LranFj0+cKm0d0rpD8uhVJDYxfpVDX4a1AY5pAdc65luQj34uOmAlw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB7575.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:25::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Thu, 13 Mar
 2025 09:13:23 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.025; Thu, 13 Mar 2025
 09:13:23 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index: AQHbky3sGKkFjHx1MkmFN9rVUAvYHLNvYl0AgAAA5jqAAAKdAIAAAT1vgAA66ACAAD2b+IAAA9kAgADIeYCAABcugIAAAUrBgAAA64CAAASlVw==
Date: Thu, 13 Mar 2025 09:13:23 +0000
Message-ID: <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <b74df4b5-ecda-45ba-a98a-c84b0a29e380@suse.de>
 <PN3PR01MB9597AC6A02B0BF873920D94CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
 <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
 <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
 <PN3PR01MB959780176C0B16C36FBD59C3B8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9KdzZUxs3vlwp0Z@smile.fi.intel.com>
In-Reply-To: <Z9KdzZUxs3vlwp0Z@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB7575:EE_
x-ms-office365-filtering-correlation-id: 670eb226-33b0-4b21-a3b3-08dd620f4e5d
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|6072599003|7092599003|15080799006|8062599003|461199028|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?bFNINWdaUVE4N1Y3MGRIVUFKS0Q4ZXU2ZWgwQVZFS3lHQUVJaXFtNElrOEg0?=
 =?utf-8?B?Y3RCZFlFTGdYelFZdXZMR3lSYWJpcFExT3J3V3lvcmhVNFBxUUxwSUQvZEhS?=
 =?utf-8?B?ZDROdDZpcUhLYjNrNm50S0VicUNMZEdWNys0Nk02dEhldHBOSnBqNnBMWk1U?=
 =?utf-8?B?L2dzT0pYTzVuVWZxbjREZlRtU29OVno1dG15RHlRSFlkNzdRc2h1c0NRcWFq?=
 =?utf-8?B?M1JsdDFSQzErN3d0anZ2NWdFZnFBd1NoNkZGZ0pmYjd0MGVEV1lUcnJwVnpG?=
 =?utf-8?B?YU1IUFFZVys5WkE5bDFYL0JwaFlpWkxHWmxRVGRlQTVuYW55aHRLaW9HRFFt?=
 =?utf-8?B?Rms1Wko2WmlQUldhS2tQRnpWM2p0cklwYXY5a1paRnRKdUtJTW1zSWVIdWR0?=
 =?utf-8?B?dktzdFo4WUI2NkZZemxTN0d1blpGUVo2MWsxWTZua2ZGTUh3d2dRcFQyTVVZ?=
 =?utf-8?B?V0hvNGx2a1BsejVOaGVzSG5LRHFETklDTXJEMjhySzk0aUtacU5vNE9BTDJ6?=
 =?utf-8?B?QVJkbE9kMDFKZFArWEZDQjZBRjFpQmhoNHBVU1lVR3Zka2ZHbTBySVZxaWZq?=
 =?utf-8?B?RXpxQVp5RTR5Y3NDbEdIRDAxc2NpbzV6WW5SeXgyWkw4blIvT2djNFBmZ0Y2?=
 =?utf-8?B?RWxqdUtFRGFnVWFEalBtTG0rK2czZWhwcFk1K282Vnh1SytabXRBQ09FLzgy?=
 =?utf-8?B?cDB1RFRXbEF1QWduTFA0bHBMRXdCZUo5eThnRUdCWVNhcFIvc25LUFR4SEVa?=
 =?utf-8?B?U0dWMmFPZ2tPTzVaTGROZ21zSCtoNjJIa0kzU3l2ZFhseDZwZTBwLzMwZisx?=
 =?utf-8?B?QXpkL1p1QVZHQWQ3VUZIWmIyVTdpNW0rZkR4dFR6bzhLMXJFWVFkN3dGb3Vh?=
 =?utf-8?B?NW8zb3c4QWJSMzB6OGp1amc1R05HSkdUV3A4L2F1QUpweFk4akhLNDRjQjgz?=
 =?utf-8?B?RVJZTk9NeHBsNzlFNkFxaVNnYXI1UE9IN2NyU3Fpa0JRcDdIZ1FzZFByV1dX?=
 =?utf-8?B?YjFDUU40aHJwbEdyR2JqdzdjUW05MHBrMFB5cTZFQTBlRStNSUtEeHlOZWsy?=
 =?utf-8?B?ZGpCbFBPVWo1ajF4VkJCd0IzSWdzampRb1VIWDMvNDZZK0xlSlJkT2w2SVpK?=
 =?utf-8?B?UHlHVEdzY3g4alFiTVVrcHIxa29hc0c2c21FMlQ5QSt4elozbklCYzdIVFY4?=
 =?utf-8?B?UmdCOHpOT1hjYVNFbE9iQ2F6OUh4MkpsM2J1QktDZTVha0R2VytMV205MDZO?=
 =?utf-8?B?bEZUbXh3aFNCeVJBbThKWGhoR0FSNERzalViN00rUlV1NFhVM3NVT0NBdXJP?=
 =?utf-8?B?em5hanErK1ZjNDA3VVl1SEE3bFdoS2N6MVFiWG9jNVJrSk0zMTlQa3ZNVEhu?=
 =?utf-8?B?VktHSzZiUkVvakE0YnJrK1ZQRHhUQzhWRlpQcjNNRHR6UjVsbUcwTzZ5ZHVm?=
 =?utf-8?B?VGxDS3BsUlJxSXo4QzlEdmVqZmZ4K01WaFdaVDdwbzJqUjNKTWhzRmFLb1Zr?=
 =?utf-8?Q?kV8FMc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UW9sVDJaaTBZZUovZUhpK1lGeFgvT1Q0RnYrTGg5MVF5c0tvd1VnVzZWWVZv?=
 =?utf-8?B?RmV1RW9jQS96emlNWU1BWUdNcVBFRVpNQU5rMkU1c01WQW9WUjBQYUdidmh3?=
 =?utf-8?B?aTFWS3dZVXdoWitVRGQ0OVhvMXJjKyttVDVYeDNBUjZ4WkUyWDF5V3hzQk96?=
 =?utf-8?B?R1J6cytrQTYyUlNHUldoalIyeFg0SkRleUJvOGV6bVY1ZGRscjVYOVlnRHVL?=
 =?utf-8?B?VEc2bkdaVzRIdC9aQkhLbU9SbE1IcnYrNG1USmI4dStvYzZTOG5neDBaZ3I1?=
 =?utf-8?B?YWpTY1MxTk9LR3dxc2VQZUFVRE5tZm9yeGRTL1RDaWduM3d1VW5qbWhrUXVs?=
 =?utf-8?B?dXNpVDJleHFqbFFoVDE2blpWc1NVeHNDa05DYVNhZ25XU1ROUGVaYWJVK055?=
 =?utf-8?B?U3JUV081VkFDOG5BWi9FYUNCRFAwQ0ZiRElMN0sxQ0dVK0k5WmVjWFh3UzJ2?=
 =?utf-8?B?QXhBY3VaUXhWOFdBWjJjWWZuRXZuU3l5R3BzQ1kvQ0syNVhSY0lxeXJURDI5?=
 =?utf-8?B?b2lyVWVJQzU5UEg1K0EvR25qRTBHdXRIcGtmTUM1MnNYNEgzTjRGV1dSTFkw?=
 =?utf-8?B?QzBPK0k2dHMzTDEyeFJwOGlQckxVS2YrK1FlRTAzSVI3Zno3VmM0L2hwQXFF?=
 =?utf-8?B?VWtPQmNVaDdYalo5YnAwL1NKZVNIQnFKWmNreWY3aEpEYUE3d1lvbjBTZ2pk?=
 =?utf-8?B?SUpkSThBSk9welkvOXJzZ1BNNGhJUzczRG9tVVdPdktvcVgwcXR0WnUxYkF4?=
 =?utf-8?B?OXB2ekFPNUtwU2hpMzdaRGYrWFVXSXFwV1ZiY25RSWpvUjNmU0hZMGdTUTU1?=
 =?utf-8?B?by9PbnFIdlVqZGVSaysvNVpXTDVrQWh0dkJLKzI3VG5IcC9oVXlsZzZVRnRo?=
 =?utf-8?B?bERlV0RYMExsMTJwS28ySlVrNlNZK1lDZklEUmNwOWxoOUJ6WGRSeVQ4VlB6?=
 =?utf-8?B?UGF6eVZZSmdxY3FMUkJscUUxcXlJbk1uNHpVbElQbU9oTjdzbThoUWRUQ3h2?=
 =?utf-8?B?bFhkZGhFVVBMc0RTMy9sU1ZlZ1dQTGRFU1QraEcwTDhEY1I1bGQxbXJLdHJi?=
 =?utf-8?B?OWFyb2wraDhZRU11QURCNXZEZ1p2SGVaZmt5Ny9LUHBhb1hlUFdlVEJuemgv?=
 =?utf-8?B?dkNVYVUvR1BrOGJkL3E4d0hqc0gvRGNmclVhWnhqblV2a0lLMENCYW55M0sw?=
 =?utf-8?B?S3I1c3ljTlp2NUp3T0dyM1BMWnpWVExuK2IyN1o1SzZTK0FzNmRZNHJncktY?=
 =?utf-8?B?djkrTFJ2VmNFR1A3SGRsTXpQUEFnOFZHQTlkTS9PaW9EUlVOamxBQW50OTJC?=
 =?utf-8?B?NmxUT1dIVFBMWG4vcGlnb082enBxelA4OWw0aHdKZGxJdWpDblFud0lGRzQ0?=
 =?utf-8?B?bmRsZXJ0NzlIbWxsVjVKdytUY0VDbmxDOVphRUJ0eFlQNE5CS0JPNlI0NUlG?=
 =?utf-8?B?TGlXYzJ3Y0xVaXhIa2dtTGlyazdOUkEvNHlpZXd1UjZodVpvdjY4REFnNDNL?=
 =?utf-8?B?NEtzY0dMOWVhWXc0Y0lHRUJYZjRUNCtGRmdFcFNkUzMzckJzZngvMmZFc2pN?=
 =?utf-8?B?SE9idm5lN3pUSTRRc0dQVmVxbDB4TjUrNnFBVU4vUTlkSHA0VVJRQ3Fqb1RZ?=
 =?utf-8?B?NFRBMXVYbUQ4dVR4by9TaTZWZmp6aHV3NldPaTJ5L2xycWRHRTdKaUhiVDRp?=
 =?utf-8?B?NkVIT09Uam53ajRLVng3SHJHTDc1ckVlRTU0MUZPTU5FMExxdmFDVGd3dXRl?=
 =?utf-8?Q?vhRHItYl/O2oNZ1dEc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 670eb226-33b0-4b21-a3b3-08dd620f4e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 09:13:23.5223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7575
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

DQoNCj4gT24gMTMgTWFyIDIwMjUsIGF0IDI6MjfigK9QTSwgQW5keSBTaGV2Y2hlbmtvIDxhbmRy
aXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gVGh1LCBN
YXIgMTMsIDIwMjUgYXQgMDg6NTM6MjhBTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+
IE9uIDEzIE1hciAyMDI1LCBhdCAyOjE54oCvUE0sIEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNo
ZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4+PiBPbiBUaHUsIE1hciAxMywgMjAy
NSBhdCAwNzoyNjowNUFNICswMDAwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+Pj4+PiBPbiAxMyBN
YXIgMjAyNSwgYXQgMTI6NTjigK9BTSwgQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5r
b0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPj4+Pj4gT24gV2VkLCBNYXIgMTIsIDIwMjUgYXQg
MDc6MTQ6MzZQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+Pj4+IE9uIDEyIE1hciAy
MDI1LCBhdCA5OjA14oCvUE0sIFN2ZW4gUGV0ZXIgPHN2ZW5Ac3ZlbnBldGVyLmRldj4gd3JvdGU6
DQo+Pj4+Pj4+IE9uIFdlZCwgTWFyIDEyLCAyMDI1LCBhdCAxMzowMywgQWRpdHlhIEdhcmcgd3Jv
dGU6DQo+IA0KPiAuLi4NCj4gDQo+Pj4+Pj4+IEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9u
IGVpdGhlciB3YXk6IGZvciBTTUMgSSBqdXN0IG5lZWQgdG8gcHJpbnQNCj4+Pj4+Pj4gRm91ckND
IGtleXMgZm9yIGRlYnVnZ2luZyAvIGluZm9ybWF0aW9uIGluIGEgZmV3IHBsYWNlcy4NCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IEknbSBwcmVwYXJpbmcgdGhlIFNNQyBkcml2ZXIgZm9yIHVwc3RyZWFtaW5n
IGFnYWluIChhZnRlciBhIHR3byB5ZWFyIGRlbGF5IDotKCkNCj4+Pj4+Pj4gYW5kIHdhcyBqdXN0
IGdvaW5nIHRvIHVzZSBtYWNyb3MgdG8gcHJpbnQgdGhlIFNNQyBGb3VyQ0Mga2V5cyBzaW1pbGFy
IHRvDQo+Pj4+Pj4+IERSTV9NT0RFX0ZNVC9EUk1fTU9ERV9BUkcgZm9yIG5vdyB0byBrZWVwIHRo
ZSBzZXJpZXMgc21hbGxlciBhbmQgcmV2aXNpdA0KPj4+Pj4+PiB0aGUgdG9waWMgbGF0ZXIuDQo+
Pj4+Pj4+IA0KPj4+Pj4+PiBSaWdodCBub3cgSSBoYXZlIHRoZXNlIGluIG15IGxvY2FsIHRyZWUg
KG9ubHkgY29tcGlsZSB0ZXN0ZWQgc28gZmFyKToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+ICNkZWZpbmUg
U01DX0tFWV9GTVQgIiVjJWMlYyVjICgweCUwOHgpIg0KPj4+Pj4+PiAjZGVmaW5lIFNNQ19LRVlf
QVJHKGspIChrKT4+MjQsIChrKT4+MTYsIChrKT4+OCwgKGspLCAoaykNCj4+Pj4+PiANCj4+Pj4+
PiBUaGF0IHNlZW1zIHRvIGJlIGEgbmljZSBhbHRlcm5hdGl2ZSwgd2hpY2ggSSBndWVzcyBUaG9t
YXMgd2FzIGFsc28gc3VnZ2VzdGluZy4NCj4+Pj4+IA0KPj4+Pj4gSSBkb24ndCB0aGluayBpdCdz
ICJuaWNlIi4gRWFjaCBvZiB0aGUgYXBwcm9hY2hlcyBoYXMgcHJvcyBhbmQgY29ucy4NCj4+Pj4+
IFlvdSBjYW4gc3RhcnQgZnJvbSBibG9hdC1vLW1ldGVyIGhlcmUgYW5kIGNvbXBhcmUgaXQgd2l0
aCB5b3VyICVwIGV4dGVuc2lvbi4NCj4+Pj4+IA0KPj4+Pj4gQWxzbywgY2FuIHlvdSBzaG93IHRo
ZSBibG9hdC1vLW1ldGVyIG91dHB1dCBmb3IgdGhlIHZzcHJpbnRmLmM/DQo+Pj4+IA0KPj4+PiBI
ZXJlIGFyZSB5b3VyIG91dHB1dHM6DQo+Pj4gDQo+Pj4gVGhhbmsgeW91IQ0KPj4+IA0KPj4+PiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4+Pj4gRm9yIGFwcGxldGJkcm06DQo+Pj4+IA0KPj4+PiBhZGl0eWFATWFj
Qm9vazp+L2xpbnV4JCAuL3NjcmlwdHMvYmxvYXQtby1tZXRlciAkUDQgJE1BQ1JPDQo+Pj4+IGFk
ZC9yZW1vdmU6IDAvMCBncm93L3NocmluazogMS8xIHVwL2Rvd246IDY0Ly0xOSAoNDUpDQo+Pj4+
IEZ1bmN0aW9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3
ICAgZGVsdGENCj4+Pj4gYXBwbGV0YmRybV9yZWFkX3Jlc3BvbnNlICAgICAgICAgICAgICAgICAg
ICAgMzk1ICAgICA0NTkgICAgICs2NA0KPj4+PiBhcHBsZXRiZHJtX3Byb2JlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDE3ODYgICAgMTc2NyAgICAgLTE5DQo+Pj4+IFRvdGFsOiBCZWZvcmU9
MTM0MTgsIEFmdGVyPTEzNDYzLCBjaGcgKzAuMzQlDQo+Pj4gDQo+Pj4gVGhpcyBpcyBlbm91Z2gs
IG5vIG5lZWQgdG8gcmVwZWF0IHRoaXMgZm9yIGV2ZXJ5IHBhcmFtZXRlci4NCj4+PiANCj4+Pj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+Pj4+IEZvciB2c3ByaW50ZjoNCj4+Pj4gDQo+Pj4+IGFkaXR5YUBNYWNC
b29rOn4vbGludXgkIC4vc2NyaXB0cy9ibG9hdC1vLW1ldGVyICRPTEQgJE5FVw0KPj4+PiBhZGQv
cmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDEvMCB1cC9kb3duOiAyMjAvMCAoMjIwKQ0KPj4+PiBG
dW5jdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAg
IGRlbHRhDQo+Pj4+IGZvdXJjY19zdHJpbmcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDQ3OSAgICAgNjk5ICAgICsyMjANCj4+Pj4gVG90YWw6IEJlZm9yZT0yNjQ1NCwgQWZ0ZXI9MjY2
NzQsIGNoZyArMC44MyUNCj4+PiANCj4+PiBTbywgd2UgZ2V0ICsyMjAgYnl0ZXMgdnMgKzQzIGJ5
dGVzLiBJdCBtZWFucyBpZiB3ZSBmb3VuZCA1KyB1c2VycywgaXQgd29ydGgNCj4+PiBkb2luZy4N
Cj4+IA0KPj4gV2lsbCBpdCBhbHNvIGRlcGVuZCB1cG9uIHRoZSBudW1iZXIgb2YgdGltZXMgaXQn
cyBiZWluZyB1c2VkPyBJbiBhcHBsZXRiZHJtLA0KPj4gaXQgaXMgYmVpbmcgdXNlZCAzIHRpbWVz
LiBQcm9iYWJseSBtb3JlIGluIEFzYWhpIFNNQy4NCj4gDQo+IFJpZ2h0LCBpdCBkZXBlbmRzIG9u
IHRoZSB1c2FnZSBjb3VudC4gQWxzbyBvbiBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcyBpdCBtYXkN
Cj4gZ2l2ZSBkaWZmZXJlbnQgcmVzdWx0cy4gT24gMzItYml0IGl0IHByb2JhYmx5IGdpdmVzIGJl
dHRlciBzdGF0aXN0aWNzLg0KDQpCZXN0IHRvIGdvIGFoZWFkIHdpdGggdnNwcmludGYgdGhlbi4g
UGV0ciwgYXJlIHlvdSBzdGlsbCB0aGVyZT8NCj4gDQo+Pj4+Pj4+IHdoaWNoIGFyZSB0aGVuIHVz
ZWQgbGlrZSB0aGlzOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gZGV2X2luZm8oZGV2LA0KPj4+Pj4+PiAg
ICAiSW5pdGlhbGl6ZWQgKCVkIGtleXMgIiBTTUNfS0VZX0ZNVCAiIC4uICIgU01DX0tFWV9GTVQg
IilcbiIsDQo+Pj4+Pj4+ICAgICBzbWMtPmtleV9jb3VudCwgU01DX0tFWV9BUkcoc21jLT5maXJz
dF9rZXkpLA0KPj4+Pj4+PiAgICAgU01DX0tFWV9BUkcoc21jLT5sYXN0X2tleSkpOw0KPiANCj4g
LS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCj4gDQo=
