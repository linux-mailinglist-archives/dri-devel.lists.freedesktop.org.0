Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29239A4231B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C69810E3C0;
	Mon, 24 Feb 2025 14:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="lOIEfzjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010014.outbound.protection.outlook.com
 [52.103.67.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0120510E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hl4V6Iz+F/MFAdaPuitKiCgwKTijo0vEVJ5BtzT8y7VmRiWETP4qVuOGP5cn97LqOj51U+zUZ9DCdVy4zLlydlp2zvNsnK9PDmMrrX1Y//bwVe+qqDBOJ/NbNSG3h1j8DhBB7BAsBYhgZWg1sYNpDPWmtjUDESfDXi/bNj/e1axNnofWT8jaEfjvG4CMKaxsJnJYJylTJOPAuC094rKmroD16cCmDkIdapz+Fa6LrzZxx1XR9znnmPpMYQtnavLW0VPK2+J/EAtPFfZ/qokENRrITYC83ZCp8x5JO68mPSoopG7NxXJ9a1HbBnQMZd9dPsviMSRWjHlypHPr2vWJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY3w2o5pmk2M5H4/D9wrCeIDznHTbHqq2B4ejnAm6B8=;
 b=Vi1j0vBzmwtXaZpQ5NywWw4gqrJjBAuhCx47FdxkUvQUhBAZIy1zvRRJtVn0X58cJV+OpJ4kurjNE1sEql8lAsgs1+x4XcBnR8XjN7k7ikeAWCNAv35qJuRnZhMZQVXryfQkvu3CLjMrd+ZLxzyqbCoV+DNs2AwlnCz20WrBF4DSyNc0KywRFiVZguO/bn/UiP+j0a1pwP7evKWONhqyk92ahMkrtpJIiu//VDRq325plUyH4hUzFd7BwrF145tOXivWSE2avPMc+MuGy4JmNW3ByQXvQ+NcY7tpEA608EM8ccwg0DEV9vA24H/AOj3BKJnHdMGRTMyXRSgT4O9VGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY3w2o5pmk2M5H4/D9wrCeIDznHTbHqq2B4ejnAm6B8=;
 b=lOIEfzjBVQV14VnFjY1ocDiKv0sdiUpHarKKb0Lvkk7w6i3uqKxOahHvcqbiIwx8RpdAV8h0zAU5uus2bVdc/GoSGssmXPmaiEfhwlUHACotyFvEQepO6H8dbMLDlH36GDeSArF3g+9913Z2EO8PgaZ3dakr2b356oLrAeAAcDLXUECfMJpJyvbhUmEs89u8qakmPa7zqW3z+v7Dd7mtOuaDKydmO+/e5hzKR91ytNimGf7l9DJmdnqC5m5F1zLcAiZyRSdimlqvk5/kUWT2VMgenwUsPlQF4jsrpFkCbabnIsVNser8dVIDpKB9/Oo7FHBZOp6cDkleHnwfFlrp4w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA1PPFC66815D91.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a04::a9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 14:32:37 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 14:32:37 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWe38AgAAI1YA=
Date: Mon, 24 Feb 2025 14:32:37 +0000
Message-ID: <5BC3A795-99C2-4F00-ADD0-7ECD0285CDD0@live.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <Z7x7kMjaDbCp_LB2@smile.fi.intel.com>
In-Reply-To: <Z7x7kMjaDbCp_LB2@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA1PPFC66815D91:EE_
x-ms-office365-filtering-correlation-id: d561f999-3ede-4285-92ab-08dd54e01615
x-microsoft-antispam: BCL:0;
 ARA:14566002|12121999004|8060799006|15080799006|7092599003|19110799003|8062599003|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: =?utf-8?B?QVRhbFZudnkvdkJRVGZrdG5nMkdaR2ZhdzZ0Qjd2c3VjdTc0eGhQbkxhWkxu?=
 =?utf-8?B?UVRoUzR0MDh2VU0xN0ErYUo1Qm1RanNCWVlRU3ZBU0xrbUM2dFZIRGNGM054?=
 =?utf-8?B?RTNmNk9DeFUreitKdGJ3Q2lFZEFVTk5Mc2E2S1VPcDM1eTNmbC84SkVtcTFz?=
 =?utf-8?B?MmxDREs1RjlKT2RheS9NZkl2WGZJZmRkTlk5ZW5JNTFialU0WE0vN2Z6cURv?=
 =?utf-8?B?Rm0yQms1T0hiYUJwRE8rakxRTFN6bVdLQ0M3VGpSV2RaQTJlNkFhdjBGTzl1?=
 =?utf-8?B?VFFOYW8xZ0FyazZMbCtUQ2ZtOWFCdjIwQ1pseXBBVzlwS2pmNjM3UGdoT2VK?=
 =?utf-8?B?bVZyeCtJaVdNU094eThSb3JITEY1N3drekp4WFZlVUdZWnh4N2xNSGRibHlz?=
 =?utf-8?B?cXI0aEtaTk5JRlNPMkVyNldwVkZieXhqNzZBbWxmKzNGa1NNYkRKR3RhL3BT?=
 =?utf-8?B?QWI4TEJobEFUKzRZREp1OEtzZU5HT2dLMUxiN0N4aUFIZlAra2RPMjk3UEtN?=
 =?utf-8?B?T1M4UDBMSjdDZnF6NmR5SDVmaTFHMFl5cVZnaVNWTlA5NjVjd1J1NGEvSUtL?=
 =?utf-8?B?RVJwMnArdGZmTmt6MHNzeWpicXdDVEV5U3RpZEpBZFFXYzhmdGJ4VU1waVUw?=
 =?utf-8?B?Z3VBcm93TFpqa0VRZkJCa0dYcUFYZHAxNVc2NUJ0T0tQdXNxam81SjdTMFZh?=
 =?utf-8?B?dDlTTnExdXhFK0szVklMV3BRdkIrd2tIQnkydzE3R0VvMEwvQVIrZjk2Wlgz?=
 =?utf-8?B?RGZENkNzemdxRXpUWlBQdkRhRG1IVEJOUlN6NUNLQlZFUlR5OXc1MkVIakNt?=
 =?utf-8?B?ekY1VWtRY1QwNXA0aUNxK000SzB6Ky9SR3JGWjQyelZic1krRkw5WnIzamVY?=
 =?utf-8?B?ZklNTU1HN3RBM0RFaUpNUDJSaE1QbEN0azFGc3kwanlFRmE1OEEzb1c5T25w?=
 =?utf-8?B?SUlCQXNTdFRvc0FYT0Z2elNsZUFINmdUbTZrSmRYM0pGT2htYlRiWUloT1lk?=
 =?utf-8?B?M21GbFBEaEhlaDFrUGhCNEJwWCtxdVhlU2ZRSEJ5QTdEMjM2d0pRRFgzQjFT?=
 =?utf-8?B?ZGtBUmlCREhiY2dzc3RCRmpqUDhJaWYrQTBYN3JnY2dYd0FiSnRITENmcVFG?=
 =?utf-8?B?c0VGRFFJYXIzajIyL0liSktoNlR4aDE1NGRibkk5dE5KRGsyR01BTktKcWtX?=
 =?utf-8?B?R3lGS1FiaVBsQjB6MHpwM0hQWmMwSVduMFBKTU1NLzRSTkx1ME5UMWYwSHVq?=
 =?utf-8?B?djFUanpEYUxRQ2o0dTdLemFoYjN1d055RTV2Q0llc1JiOE1GMnA3d3p2Q2RN?=
 =?utf-8?B?b3R0cFFmeXRlbitLTkY1dkVUR2toWGJ0SXZGelI0djJvVkxselkzazVCc0li?=
 =?utf-8?B?aVJNbVRVd2VsemJ1eDRjN1RzSFY0THpvYnJyZUFjS1FhbTJ2QUNvcGhtUTdm?=
 =?utf-8?B?VS9LL2xGbDFRNXRZOUM5YktpbDc5emdTUXJGOWFjTTJiMG9USmcxNytSdFdY?=
 =?utf-8?Q?vHDaLY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGF3QXZmaXV2Q1hRR2VuMkJVdzdUMEZVaUd0Vm5jekRyeEtUd3B1M3c1VnZ0?=
 =?utf-8?B?bXcrMmF2NU5Bcy9aSHVyT21MbEp6bkhYdlJEVUZzUXZIVkpPdHRUWjM5aVJC?=
 =?utf-8?B?NEd2Z0hHN2pkRzJsNWRvdDIvVXQ3dVQvNnZCWTd0Sm9Ub0E2V2NXZzdaTmVy?=
 =?utf-8?B?N2RXVFBBSE1keUVpNTE3NGJTcDlPdlBwN1VxUWtma3JJdGZqRzk1eWExR09G?=
 =?utf-8?B?K3RQUVc5d0hGZGlobUZzMnlIb2w4blg1Z25wUHlIN1dLd1lwakhmTmxpcERF?=
 =?utf-8?B?Z2JPNEhCbW1GMHBwUCtyS2s0ZExkazI3WFFKQm14VHZlekswTEthRXpGc0FW?=
 =?utf-8?B?Ym9OWFN5RlRKanhZa3QvN1pSNHoyWVc3KzF3WEUzdkE2b1pDMUlBSFoveThj?=
 =?utf-8?B?WURYQnN0L1E2aVpWS2NjMFBkbDhtVzRsL0RiVzlHTzFjYVZpcjM0OUZ6cXIz?=
 =?utf-8?B?VE1TaEU0dWx6dzRHa2N4cTVxR1BzblB5UFpJbDR1QzhtN0VzQ2hKT0NqaytB?=
 =?utf-8?B?VzRQS3dsR1AveUptUkE4SS9hcURzODhHK1FSelFlQ3lNbkoraUk1cy80VmJi?=
 =?utf-8?B?c3BCTFhRa0RrdUhsZit1R2F4dWpGV0wram02VUY3bzhKbzZqa0VHZEhsdGFX?=
 =?utf-8?B?MGRyNGNERU80bE41K0ordW05Ump0ZjRtQTQxaFFIZGVrNzhLU09neFl2NU9j?=
 =?utf-8?B?M3hZNTg2bnlWZmoyMUh2K2tyUVhJRjhzSnJiRkhUdFBScllJMG54ektDeXVW?=
 =?utf-8?B?bFdKRnlBOXNQZm5RQ2pDY0p4Z05UeDZWMm9sTnlOOWFPUUJncWkreXgzbTU2?=
 =?utf-8?B?QjBIQkJxWUV1Q2gvU1hyNU9idW03ZnkvZ1FLOG1zLzQ4ZGYxcHp5WFBYSjZi?=
 =?utf-8?B?WlJZRFU2Q0s1NW95MUh4MXJ4ZDY1VFZLSDQ0WkpQZFIvTkZma29iNmFMUDhq?=
 =?utf-8?B?clcxTTRJdGJHVVBoaC90Nk54VnVqeVpsYUlzVGtnUzlFTVBJaXRqVHpwcFFi?=
 =?utf-8?B?b1Z6eEhZTmJLZXVEZkphYmQ4VGE1MjQyZ1RFYjlsUWMrMHFHQmEza2xzdWph?=
 =?utf-8?B?ajJjZ1JmTnlCZEV0a1R3d0JJblRtSFI2ODN1RUloWUVnNXNhRDRYdGNRMXVQ?=
 =?utf-8?B?UTVEbG9qeE9LUnlJWWNqMjN6YzF2UURKbXppN2s0WVY2eWl1MWRzbDVDZndi?=
 =?utf-8?B?d2hoY3dBRTVjdUFHWDNSQ0tVSmphQ29oVldLa0V1TWdjRTN5ZmFSV0JRQk42?=
 =?utf-8?B?M0hIQVc5WERrbWpKRGVWb2QwQVU3dFp4N0VkcUNzUGplblFySkhCVDcyWTNm?=
 =?utf-8?B?bzc2R0VRT0QyNVdueTZ1bzY1eThxU2RlQmlMdHdFaDZqWGxJOFQzOGJtbEtu?=
 =?utf-8?B?WEs0Y2ZuWkQvWUlZTFBZOVpyMHREdDZvSGpHa3lRL2FWOTNNbDV0MHFjNkVL?=
 =?utf-8?B?Qm1BdlY3eUVRczVWdm1jWEpod3ZwVXdVL3pyeGN6NU5DK1BsQ3RTOTFLcXhV?=
 =?utf-8?B?dHJBc1NZaDFUWjBEai9FeTYzcWVsVWJmWXpkYUdDcVdoekNXZnF2WnZRVFd5?=
 =?utf-8?B?c3BPaVJRU0xCNDdqQmNGSm1DUzMzL2N2Z2c5cFVVVTMwYnAvQ0V2WndQNnlS?=
 =?utf-8?B?WTNBUFJzM0hVbStXS3hpMlkyREJqdFJjUngwOCtvUllFQituSFZKVFlUU25y?=
 =?utf-8?B?akZSMzZlZ3BEeE1oQzRlSkt4MEZuams0LzR6NU9zV3NEUUdmMTNzQ0Z0NTEz?=
 =?utf-8?Q?HLEGeALIRhYtr/guS0Mg616KCPLXrKF/ZMlAjiu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED1F8F8C6CE6714CAE58CD45D6501046@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d561f999-3ede-4285-92ab-08dd54e01615
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 14:32:37.6021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PPFC66815D91
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDc6MzDigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4gT24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDE6NDA6
MjBQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiBGcm9tOiBLZXJlbSBLYXJhYmF5IDxr
ZWtyYnlAZ21haWwuY29tPg0KPj4gDQo+PiBUaGUgVG91Y2ggQmFycyBmb3VuZCBvbiB4ODYgTWFj
cyBzdXBwb3J0IHR3byBVU0IgY29uZmlndXJhdGlvbnM6IG9uZQ0KPj4gd2hlcmUgdGhlIGRldmlj
ZSBwcmVzZW50cyBpdHNlbGYgYXMgYSBISUQga2V5Ym9hcmQgYW5kIGNhbiBkaXNwbGF5DQo+PiBw
cmVkZWZpbmVkIHNldHMgb2Yga2V5cywgYW5kIG9uZSB3aGVyZSB0aGUgb3BlcmF0aW5nIHN5c3Rl
bSBoYXMgZnVsbA0KPj4gY29udHJvbCBvdmVyIHdoYXQgaXMgZGlzcGxheWVkLg0KPj4gDQo+PiBU
aGlzIGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBkaXNwbGF5IGZ1bmN0aW9uYWxpdHkgb2Yg
dGhlIHNlY29uZA0KPj4gY29uZmlndXJhdGlvbi4gRnVuY3Rpb25hbGl0eSBmb3IgdGhlIGZpcnN0
IGNvbmZpZ3VyYXRpb24gaGFzIGJlZW4NCj4+IG1lcmdlZCBpbiB0aGUgSElEIHRyZWUuDQo+PiAN
Cj4+IE5vdGUgdGhhdCB0aGlzIGRyaXZlciBoYXMgb25seSBiZWVuIHRlc3RlZCBvbiBUMiBNYWNz
LCBhbmQgb25seSBpbmNsdWRlcw0KPj4gdGhlIFVTQiBkZXZpY2UgSUQgZm9yIHRoZXNlIGRldmlj
ZXMuIFRlc3Rpbmcgb24gVDEgTWFjcyB3b3VsZCBiZQ0KPj4gYXBwcmVjaWF0ZWQuDQo+PiANCj4+
IENyZWRpdCBnb2VzIHRvIEJlbiAoQmluZ3hpbmcpIFdhbmcgb24gR2l0SHViIGZvciByZXZlcnNl
IGVuZ2luZWVyaW5nDQo+PiBtb3N0IG9mIHRoZSBwcm90b2NvbC4NCj4+IA0KPj4gQWxzbywgYXMg
cmVxdWVzdGVkIGJ5IEFuZHksIEkgd291bGQgbGlrZSB0byBjbGFyaWZ5IHRoZSB1c2Ugb2YgX19w
YWNrZWQNCj4+IHN0cnVjdHMgaW4gdGhpcyBkcml2ZXI6DQo+PiANCj4+IC0gQWxsIHRoZSBwYWNr
ZWQgc3RydWN0cyBhcmUgYWxpZ25lZCBleGNlcHQgZm9yIGFwcGxldGJkcm1fbXNnX2luZm9ybWF0
aW9uLg0KPj4gLSBXZSBoYXZlIHRvIHBhY2sgYXBwbGV0YmRybV9tc2dfaW5mb3JtYXRpb24gc2lu
Y2UgaXQgaXMgcmVxdWlyZW1lbnQgb2YNCj4+ICB0aGUgcHJvdG9jb2wuDQo+PiAtIFdlIGNvbXBh
cmVkIGJpbmFyaWVzIGNvbXBpbGVkIGJ5IGtlZXBpbmcgdGhlIHJlc3Qgc3RydWN0cyBfX3BhY2tl
ZCBhbmQNCj4+ICBub3QgX19wYWNrZWQgdXNpbmcgYmxvYXQtby1tZXRlciwgYW5kIF9fcGFja2Vk
IHdhcyBub3QgYWZmZWN0aW5nIGNvZGUNCj4+ICBnZW5lcmF0aW9uLg0KPj4gLSBUbyBtYWludGFp
biBjb25zaXN0ZW5jeSwgcmVzdCBzdHJ1Y3RzIGhhdmUgYmVlbiBrZXB0IF9fcGFja2VkLg0KPiAN
Cj4gLi4uDQo+IA0KPj4gKyNkZWZpbmUgX19BUFBMRVRCRFJNX01TR19TVFI0KHN0cjQpICgoX19s
ZTMyIF9fZm9yY2UpKChzdHI0WzBdIDw8IDI0KSB8IChzdHI0WzFdIDw8IDE2KSB8IChzdHI0WzJd
IDw8IDgpIHwgc3RyNFszXSkpDQo+IA0KPiBBcyBjb21tZW50ZWQgcHJldmlvdXNseSB0aGlzIGlz
IHF1aXRlIHN0cmFuZ2Ugd2hhdCdzIGdvaW5nIG9uIHdpdGggZW5kaWFuZXNzIGluDQo+IHRoaXMg
ZHJpdmVyLiBFc3BlY2lhbGx5IHRoZSBhYm92ZSB3ZWlyZG5lc3Mgd2hlbiBnZXRfdW5hbGlnbmVk
X2JlMzIoKSBpcyBiZWluZw0KPiBvcGVuIGNvZGVkIGFuZCBmb3JjZS1jYXN0IHRvIF9fbGUzMi4N
Cg0KSSB3b3VsZCBhc3N1bWUgaXQgd2FzIGFsc28gbWltaWNrZWQgZnJvbSB0aGUgV2luZG93cyBk
cml2ZXIsIHRob3VnaCBJIGhhdmVuJ3QgcmVhbGx5IHRyaWVkIGV4cGxvcmluZyB0aGlzIHRoZXJl
Lg0KDQpJ4oCZZCByYXRoZXIgYmUgaGFwcHkgaWYgeW91IGdpdmUgbWUgY29kZSBjaGFuZ2Ugc3Vn
Z2VzdGlvbnMgYW5kIGxldCBtZSByZXZpZXcgYW5kIHRlc3QgdGhlbQ0KDQo+IA0KPiAuLi4NCj4g
DQo+PiArc3RydWN0IGFwcGxldGJkcm1fbXNnX2luZm9ybWF0aW9uIHsNCj4+ICsgc3RydWN0IGFw
cGxldGJkcm1fbXNnX3Jlc3BvbnNlX2hlYWRlciBoZWFkZXI7DQo+PiArIHU4IHVua18xNFsxMl07
DQo+PiArIF9fbGUzMiB3aWR0aDsNCj4+ICsgX19sZTMyIGhlaWdodDsNCj4+ICsgdTggYml0c19w
ZXJfcGl4ZWw7DQo+PiArIF9fbGUzMiBieXRlc19wZXJfcm93Ow0KPj4gKyBfX2xlMzIgb3JpZW50
YXRpb247DQo+PiArIF9fbGUzMiBiaXRtYXBfaW5mbzsNCj4+ICsgX19sZTMyIHBpeGVsX2Zvcm1h
dDsNCj4+ICsgX19sZTMyIHdpZHRoX2luY2hlczsgLyogZmxvYXRpbmcgcG9pbnQgKi8NCj4+ICsg
X19sZTMyIGhlaWdodF9pbmNoZXM7IC8qIGZsb2F0aW5nIHBvaW50ICovDQo+PiArfSBfX3BhY2tl
ZDsNCj4gDQo+IEhhdmVuJ3QgbG9va2VkIGRlZXBseSBpbnRvIHRoZSBwcm90b2NvbCwgYnV0IHN0
aWxsIG1ha2VzIG1lIHRoaW5rIHRoYXQNCj4gdGhlIGFib3ZlIChzaW5jZSBpdCdzIHRoZSBvbmx5
IF9fcGFja2VkIGRhdGEgdHlwZSByZXF1aXJlZCkgbWlnaHQgYmUgc2ltcGx5DQo+IGRlcGljdGVk
IHdyb25nbHkgdy5yLnQuIGVuZGlhbmVzcyAvIGRhdGEgdHlwZXMgaW4gdXNlLiBJdCBtaWdodCBi
ZSB0aGF0DQo+IHRoZSBkYXRhIHR5cGVzIGhhdmUgc29tZXRoaW5nIGNvbWJpbmVkIGFuZCAvIG9y
IGRpZmZlcmVudCB0eXBlcy4NCj4gDQo+IERvIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkgdGhhdCB0
aGUgcHJvdG9jb2wgd2FzIGJhc2ljYWxseSByZXZlcnNlLWVuZ2luZWVyZWQ/DQoNClllcy4gQWx0
aG91Z2ggaXQgd2FzIHJldmVyc2UgZW5naW5lZXJlZCBieSB0aGUgcGVyc29uIHdobyB3cm90ZSB0
aGUgV2luZG93cyBkcml2ZXIuIFRoZSBhdXRob3IgaGFzIGp1c3QgbWFkZSBhIExpbnV4IHBvcnQu
DQpTbywgYXMgZmFyIGFzIGhvdyBpcyB3YXMgcmV2ZXJzZSBlbmdpbmVlcmVkLCBpdCBub3QgcmVh
bGx5IHBvc3NpYmxlIGZvciBtZSB0byBleHBsYWluLiBJIGRvbid0IGV2ZW4gaGF2ZSBhbnkgY29u
dGFjdCB3aXRoIHRoZSBwZXJzb24gd2hvIHdyb3RlIHRoZSBXaW5kb3dzIGRyaXZlci4gVGhlIG9u
bHkgcG9pbnQgaGVyZSB3b3VsZCBiZSB0byBteXNlbGYgUkUgdGhlIGhhcmR3YXJlIGFnYWluLCB3
aGljaCB0YmggaXNuJ3QgdmVyeSBtb3RpdmF0aW5nLCBjb25zaWRlcmluZyB0aGF0IHdlIGhhdmUg
YSB3b3JraW5nIGRyaXZlci4NCj4gDQo+IC4uLg0KPiANCj4+ICsgLyoNCj4+ICsgICogVGhlIGNv
b3JkaW5hdGUgc3lzdGVtIHVzZWQgYnkgdGhlIGRldmljZSBpcyBkaWZmZXJlbnQgZnJvbSB0aGUN
Cj4+ICsgICogY29vcmRpbmF0ZSBzeXN0ZW0gb2YgdGhlIGZyYW1lYnVmZmVyIGluIHRoYXQgdGhl
IHggYW5kIHkgYXhlcyBhcmUNCj4+ICsgICogc3dhcHBlZCwgYW5kIHRoYXQgdGhlIHkgYXhpcyBp
cyBpbnZlcnRlZDsgc28gd2hhdCB0aGUgZGV2aWNlIHJlcG9ydHMNCj4+ICsgICogYXMgdGhlIGhl
aWdodCBpcyBhY3R1YWxseSB0aGUgd2lkdGggb2YgdGhlIGZyYW1lYnVmZmVyIGFuZCB2aWNlDQo+
PiArICAqIHZlcnNhDQo+IA0KPiBNaXNzaW5nIHBlcmlvZC4NCg0KQWxyaWdodC4gRm9yIHNvbWUg
cmVhc29uIChhIG1pc3Rha2Ugb24gbXkgcGFydCksIHNvbWUgZGV2X2Vycl9wcm9iZSB3ZXJlIGFs
c28gc3RpbGwgbGVmdCBpbiB0aGlzIHZlcnNpb24uIEnigJlsbCBzZW5kIGEgdjUuDQo+IA0KPj4g
KyAgKi8NCj4gDQo+IC4uLg0KPiANCj4gT3RoZXJ3aXNlIGl0J3MgbmljZSB0aW55IGRyaXZlci4N
Cj4gDQo+IC0tIA0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQoNCg0K
