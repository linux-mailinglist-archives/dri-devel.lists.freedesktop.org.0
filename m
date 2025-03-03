Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDFCA4C69B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A616710E46F;
	Mon,  3 Mar 2025 16:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="VpzXxlU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010013.outbound.protection.outlook.com
 [52.103.68.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C388310E46C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:18:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxx/+/cJ6i5NBrnvokCrKKehpWSKhm/Z6OwIa7pLXjc6n84CjYo73uXa9I1QPQWk0E49uQEzbZpGDmXHDBjmWeG9mO5I5K39fIS43AVJ3Wnoihk6KQsRvenZoXn/OPl5iFVHc4Ezy3l2Avid9vAdiE3/U3F9LSYUaziZvif+Pwa6yh42+YJ7pRBjQhgp1HL1CS5B6ASCmhSw5NzEy0cIQhQGbLQ5TRggMwkHH/h8I0n1xcD2cqnUVUf5c1/adS5h7PNe7Kx9r27sO+ulXWVmaRpqHGfdptdv4o/QLc+Baa2PaLDXGzixCBgr94kmUOVffs/W3kc+GmdbfLqPntgiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hk5eSDsJeXHjwXW6YwaknfG1hGdkCLw1UPEeb+hhmE=;
 b=UsBPzveb/5lY3gynwreUNQhiWrwB65GepmR6A5SiI6T7w+UlueI+xelICNLHbyiIimqVd2KsgrMTnkMI4CCv2L4Wso/AXpc5g9grElWzs2hW1rgYLBTH2MI/YhR2CunmGYVDxfy1sGSrzZ0R586brYY9qs5DyjE1/cNG03qv1sPlJQpo6nNCAysD5OVpugTsKP4za/L5u2L8YAP+Yv8lamW4SnusKgY3xl5QiI4z3ktkUTYL/YUIo2Szje5vhjfTyYFxIzXRvEHXt8FZcyqpZy/b9I9TiSILynJVan50yE9Q3jFcUrjymL0Idd9taPpdK24eCh0o+FeygeuxaNJZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hk5eSDsJeXHjwXW6YwaknfG1hGdkCLw1UPEeb+hhmE=;
 b=VpzXxlU0/gk6RbS/Q8qkAv7W7+h+lvP4gYG++Sz/aOcRQd6/jKDr+SPSFKTfRJV8iecG3p//DRwffP+pOiQETZJB3vEYzzwrSc37XKFuusQDoP4oNx8izsY1gC7M0l6qmnGpCS5YRW0/tlG0v3ur7+3kAjCNCXPkgu3fLVjGJbqJLUX7cTeq9oKlXOSfVLMn3HSVlHLuMmouIPyjbVC1PIJJED8ZEYBbT+lqBDvd7e54yPJbfysaB5xY7tVy7r1FRdgZp3AbS/FMCcQIIOdNd7pmPmFSHebobWNw50lrmYTRxUDmBenew8/BV+Kz7CzIXLBGrbDFOPVdbeZq0I9MZg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB6355.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:4f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Mon, 3 Mar
 2025 16:18:16 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:18:15 +0000
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
Subject: Re: [PATCH v7 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v7 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbjFfdub6PmjPszUqhJ7dFLBMJsg==
Date: Mon, 3 Mar 2025 16:18:15 +0000
Message-ID: <PN3PR01MB95972F1CD27FDF6FF6DA37EAB8C92@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB6355:EE_
x-ms-office365-filtering-correlation-id: 990289e4-4793-4092-eb92-08dd5a6f008d
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|6072599003|8062599003|12121999004|15080799006|19110799003|7092599003|8060799006|3412199025|10035399004|102099032|440099028|4302099013|4295299021|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?UWtRNmR5N0ovcitJTzh1U3l1a3lvdnpCcTh1d056N1dsdC9qSzQrU0I2aU00?=
 =?utf-8?B?TGxZU2ppZlZvZGN0NHV1cUdIVWlwK1dFMWNsQ05hTUFDalAwZGRaZlBlMXl0?=
 =?utf-8?B?OUhaMnZRekl4UmRlNWZnQmFxTEk2VHpaMmQwU2ZDWXNRaWJyNklXRWQ0dTU5?=
 =?utf-8?B?a25Dbm1jQ0M1WnRJS3F3dHU4TDN2dHdRa3grelBkQ1ZKZTIzYy9COHp1SmNR?=
 =?utf-8?B?ZkhjWWljUzMvODlDd2k3S0FjZWg1ZU5ENDl1ajNZR0h6U0xPQk4xWnU5UEx1?=
 =?utf-8?B?N2lMcENrRFM1NzBkNWFKM1BPNmQ2WkJHMmdEQzZITURWTHlEZ1BvZU5veTJh?=
 =?utf-8?B?aktKakd6amtzTXVMRExsRFhIL3hYdVJMdEdIaG1SM1NHa3ZGWno1QXl1MUd0?=
 =?utf-8?B?TVhvVkxCcE82eFBPTjgzUWZkaDV2Z3A4aEhiaFNteVZyU1JzbkVqV1FqbVd2?=
 =?utf-8?B?RnB5aldFUXlNRXgxMDVZWHVrMkh3WW8yMVZpSWVyYjVDaUF6djBodURRbkNw?=
 =?utf-8?B?V0pJc2RKZmJqb0c4QkpzVlZxNWt0RGNRcy9QVUlMN2FoQktjbFJDdjZYcGMz?=
 =?utf-8?B?WUthWDRQbWlHM1Z2SnJ6UG1LY1J4SXFoMVQrU1p5OUVua09DYU82ZDk2dWhW?=
 =?utf-8?B?NS9GVUUxb3c4RktSNHBRVFdLS2RzdldHUHQrc3dtL01pektPTVZ3a3lPM240?=
 =?utf-8?B?RFR5aU1IUStubUdwWVNNWkFzRjlEbU9rd1dtc1FFazVKTjAzcXJ6eG9DODY3?=
 =?utf-8?B?RlhPaXk1ZjFRWi9jLzR5eDZpZVlZUUw2K1o0alhpSGRjNElDbUNMVXFCanJt?=
 =?utf-8?B?ZjZlVGUrVWpMWkxldXVZcFNtODJ3VWdHMHNQZVpOYTVsNFZxSjFxdnV4R2hD?=
 =?utf-8?B?NXRxOC9pSDh0cVdzUkhLOTRjUkdZZWRHQ1NTZ0pOaWZWOU85M0xJdXFtK3Nx?=
 =?utf-8?B?Qm9ZV0NUR2swaVpPcnVLM0FQcTlzcFJJU0VlanI5MW9CQ1ZjWGdNWjZUZ1dZ?=
 =?utf-8?B?QndYLy9iTnBQYnY0c1hhUk9weUdDWWEwc2FVRzY2SkhYeC9WM1V6K0phL0Jz?=
 =?utf-8?B?Wi9YeHJyL3BZVGkwbzZzYjY4b2t4RUZyN3NONTRyekxjaVhrWVRJcWxKd1JS?=
 =?utf-8?B?R0lYRkx3dTQvVllWSzM1ZHZuSXpIbC9Mb2cwRWp2d1JzUmU2SUZNTW56OTdz?=
 =?utf-8?B?VTFOb3VNSlBTbDdEWnlVcUNvK0dqMWUyb2pjZEllVHpzOFd0Nm4zQlZZTVU1?=
 =?utf-8?B?NkxFcGtheWVXL0lOSnhuc0tTQXRsYStyc21JMXEyZVNKZWZIbzI2UnJiRnlv?=
 =?utf-8?B?STVtOUNXQjMwaG11NWlzdVBOSHZ1OUZqeklIbmFCRU5XaG91OTlsZkhNRTZO?=
 =?utf-8?B?UFNuKzAzay9jMGJWQUFRM0p4VGF5Z3NaL1VvM1pkVytYR1dJQ2k5THpoOCsv?=
 =?utf-8?B?UHNDUkRMbTBobjk4bWRVcFdDUG5zeURTelNWVWsrQzNxVkpHZUJVOE0wYncr?=
 =?utf-8?B?emFQVHBTZzVMTnNPVGU1TkJQUExHSGxwcmx1R1lhWGZwbFBobUY3bWRLQzN1?=
 =?utf-8?B?N0doQ2V3RG9GSllEcmdvZExnRzJEeVdPazA1eitoSFFOVXU1Wit4N3padWds?=
 =?utf-8?B?Ly9LaTNzczg2K1g2KzBFY2VmVkZyb3F5c2tBeUtOQWxXQ2ZEMXV1YkZjVkx6?=
 =?utf-8?Q?+/pTuHTmvPvjRKHe0R3r?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEpZUW5FMWErYmp4ZlhValJ6SEpIODZTNmtaZU1DeTFSUTZwZjZURkVDN1RV?=
 =?utf-8?B?R2s5YVNtcHRpVGxiM3ZGQ2FmUkEzYVZpZy9QUU1COXlzM3FGek03UmhnOCtY?=
 =?utf-8?B?QXpPa1ZyaDUwNkgrb3JiWU5PWnFDMjJTUTNtcHdiVUx5RUF3ek5xRmV0OTIz?=
 =?utf-8?B?V0VLS1Z1V0VrQVZCNVNPRWszRnpscUtrUVEvanZVbVVja0E5M0Y4WldjajVW?=
 =?utf-8?B?MndMa1dvWkt1bkJrQWhLZzVHRlZoejdteVpDTEFUVk1FUDRPck8zaXhzNThR?=
 =?utf-8?B?bTZzeEFpbENQYmpqSXBmb2x6RWVoZjV4aXJtakNPTjVNYkhFY0k5b1NncEVz?=
 =?utf-8?B?UndqRm8xcWZyazJrRHdDWlVtZjFsNG1KVGJrc3VTaEZLL0U5VWFsVWJPcUhO?=
 =?utf-8?B?dXZVVmRUR29lMEFUSW5NS3JCSjd3ZDJMYTdCVUJxOHorZDB0K2xic0kvbUpC?=
 =?utf-8?B?TEh5L3NQK1F5YXRzaC9TaVFVWXoybEhYMEFaS2VRK21tYlNJcHlRWjFOL1Zr?=
 =?utf-8?B?ck9RNWhPckpoK1FnYjJvMXlGaGJpNFVFdHloeVhKLzN6ZTJScUlYY1FvZTg1?=
 =?utf-8?B?Nzg4N0lpdklNNDlZWE1sRldpcllDdGNjNGcwR2IxTnVSS2E3Wlg2bmhXM3ZV?=
 =?utf-8?B?QStUZkRqSnA2aFJQT2NFTUdJbDNQNFBLWFdrMWdITnpzUmhDL2g1bGZUZitU?=
 =?utf-8?B?YWRkTXMwOU8zWE1jelJ3UWZmMllTdGsvMm1SSzR1YlNvUndkTWVObXU0SlZZ?=
 =?utf-8?B?d1JIU2ZPc0xWN3NwVllzd0xZenRlSWV5bngzTFFsZ3VGQ2ZYV0dZeFM4Q3hz?=
 =?utf-8?B?VWdnV0tJNWJDWHpHRWxCc3JzZGI5UFBESmtwY0h1SjBrK3p3ZnZrUERweXVi?=
 =?utf-8?B?eTNMNlFhM2xXSEhXaDlHdVNHM3IyU0NUTGNqZEtHdEwxSVBqclo4RWVSc0lo?=
 =?utf-8?B?Z0Y2dEVIQ2JlRG1vTk1WQmtXcFBwSTVSRVNtUGdCdXdBSkFmYkhkQ2hndm4x?=
 =?utf-8?B?b2t4UTBuV2E3a0pjUzZWZzAwaWZzYW93UzV5d0ZRV2puS2grb2xrd1l5SDdu?=
 =?utf-8?B?SkNVZDdoY2F1US9EMlBBSXdCUjZmSGszVVY2U2k2MWl0S3UxUEcvMzcrcXFo?=
 =?utf-8?B?Y2ZzUHh3SVNOa2hlTEM3S3RnTXpyNjFqeFBIZmFBRm9oYVJOcGFwS0ZtckVP?=
 =?utf-8?B?MG90VElYUktnNitQL0ZUZThLdUFFWnZnODFuVlhmQ1cwRHFKWVUzT1ZNZjJo?=
 =?utf-8?B?TVUyMENNeUhjZDgwZWJka2hGMnB6SUN5d3UrNHFPYVpUQS9CSHBLVFRkSEpy?=
 =?utf-8?B?dUFWMlY0S1ZNaWFZMFJsdk45Qkl5RVJDdHRPZFBMR2lDcWJMRndlbXc5QTIv?=
 =?utf-8?B?Y2hLUTlka2tURGU1NTF1eThNelo4bVNrM3lQVU8vOU5UV25JRk1HRm43bjNi?=
 =?utf-8?B?L28wOGF4NGN5Y2NZVHhnbHlHdjZLVlBXcDAzTTRFOU5VQktPVnI2OW1rbmd5?=
 =?utf-8?B?TllCd0txOXV5YWE1MlMzK1NpU2RKS1FjN1lnVUZack1BU1hDNE9vckdJODlC?=
 =?utf-8?B?cTdlTnhxakl5Nm1xdENxRE5RdVlkUk5LM1U1bXZDaXNlWVl6VXo5Yi9ZbTNk?=
 =?utf-8?B?QTQwVWovY1BtTmNUNTRrVGk4cSsxV2FGTVNJSkpJS25obEdOOXI0blB1azVW?=
 =?utf-8?B?ZE5ROFM4eWtyWHIrUDN1K3hydHIxdWwxV0V5MTh1ciswVlUyOE1RUjZ3TE9j?=
 =?utf-8?Q?Jn4U+ytNbWIJ6utT4A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0042329BE87874A8EC3DD3132115981@sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 990289e4-4793-4092-eb92-08dd5a6f008d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 16:18:15.3522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6355
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

DQoNCj4gT24gMyBNYXIgMjAyNSwgYXQgOToxNeKAr1BNLCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPiDvu79IaQ0KPiANCj4+IEFtIDI3LjAyLjI1
IHVtIDEwOjQyIHNjaHJpZWIgQWRpdHlhIEdhcmc6DQo+Pj4+IE9uIDI3IEZlYiAyMDI1LCBhdCAz
OjA04oCvUE0sIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToN
Cj4+PiDvu79IaQ0KPj4+PiBBbSAyNi4wMi4yNSB1bSAxNzowNCBzY2hyaWViIEFkaXR5YSBHYXJn
Og0KPj4+PiBGcm9tOiBLZXJlbSBLYXJhYmF5IDxrZWtyYnlAZ21haWwuY29tPg0KPj4+PiBUaGUg
VG91Y2ggQmFycyBmb3VuZCBvbiB4ODYgTWFjcyBzdXBwb3J0IHR3byBVU0IgY29uZmlndXJhdGlv
bnM6IG9uZQ0KPj4+PiB3aGVyZSB0aGUgZGV2aWNlIHByZXNlbnRzIGl0c2VsZiBhcyBhIEhJRCBr
ZXlib2FyZCBhbmQgY2FuIGRpc3BsYXkNCj4+Pj4gcHJlZGVmaW5lZCBzZXRzIG9mIGtleXMsIGFu
ZCBvbmUgd2hlcmUgdGhlIG9wZXJhdGluZyBzeXN0ZW0gaGFzIGZ1bGwNCj4+Pj4gY29udHJvbCBv
dmVyIHdoYXQgaXMgZGlzcGxheWVkLg0KPj4+PiBUaGlzIGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9y
IHRoZSBkaXNwbGF5IGZ1bmN0aW9uYWxpdHkgb2YgdGhlIHNlY29uZA0KPj4+PiBjb25maWd1cmF0
aW9uLiBGdW5jdGlvbmFsaXR5IGZvciB0aGUgZmlyc3QgY29uZmlndXJhdGlvbiBoYXMgYmVlbg0K
Pj4+PiBtZXJnZWQgaW4gdGhlIEhJRCB0cmVlLg0KPj4+PiBOb3RlIHRoYXQgdGhpcyBkcml2ZXIg
aGFzIG9ubHkgYmVlbiB0ZXN0ZWQgb24gVDIgTWFjcywgYW5kIG9ubHkgaW5jbHVkZXMNCj4+Pj4g
dGhlIFVTQiBkZXZpY2UgSUQgZm9yIHRoZXNlIGRldmljZXMuIFRlc3Rpbmcgb24gVDEgTWFjcyB3
b3VsZCBiZQ0KPj4+PiBhcHByZWNpYXRlZC4NCj4+Pj4gQ3JlZGl0IGdvZXMgdG8gQmVuIChCaW5n
eGluZykgV2FuZyBvbiBHaXRIdWIgZm9yIHJldmVyc2UgZW5naW5lZXJpbmcNCj4+Pj4gbW9zdCBv
ZiB0aGUgcHJvdG9jb2wuDQo+Pj4+IEFsc28sIGFzIHJlcXVlc3RlZCBieSBBbmR5LCBJIHdvdWxk
IGxpa2UgdG8gY2xhcmlmeSB0aGUgdXNlIG9mIF9fcGFja2VkDQo+Pj4+IHN0cnVjdHMgaW4gdGhp
cyBkcml2ZXI6DQo+Pj4+IC0gQWxsIHRoZSBwYWNrZWQgc3RydWN0cyBhcmUgYWxpZ25lZCBleGNl
cHQgZm9yIGFwcGxldGJkcm1fbXNnX2luZm9ybWF0aW9uLg0KPj4+PiAtIFdlIGhhdmUgdG8gcGFj
ayBhcHBsZXRiZHJtX21zZ19pbmZvcm1hdGlvbiBzaW5jZSBpdCBpcyByZXF1aXJlbWVudCBvZg0K
Pj4+PiAgdGhlIHByb3RvY29sLg0KPj4+PiAtIFdlIGNvbXBhcmVkIGJpbmFyaWVzIGNvbXBpbGVk
IGJ5IGtlZXBpbmcgdGhlIHJlc3Qgc3RydWN0cyBfX3BhY2tlZCBhbmQNCj4+Pj4gIG5vdCBfX3Bh
Y2tlZCB1c2luZyBibG9hdC1vLW1ldGVyLCBhbmQgX19wYWNrZWQgd2FzIG5vdCBhZmZlY3Rpbmcg
Y29kZQ0KPj4+PiAgZ2VuZXJhdGlvbi4NCj4+Pj4gLSBUbyBtYWludGFpbiBjb25zaXN0ZW5jeSwg
cmVzdCBzdHJ1Y3RzIGhhdmUgYmVlbiBrZXB0IF9fcGFja2VkLg0KPj4+PiBJIHdvdWxkIGFsc28g
bGlrZSB0byBwb2ludCBvdXQgdGhhdCBzaW5jZSB0aGUgZHJpdmVyIHdhcyByZXZlcnNlLWVuZ2lu
ZWVyZWQNCj4+Pj4gdGhlIGFjdHVhbCBkYXRhIHR5cGVzIG9mIHRoZSBwcm90b2NvbCBtaWdodCBi
ZSBkaWZmZXJlbnQsIGluY2x1ZGluZywgYnV0DQo+Pj4+IG5vdCBsaW1pdGVkIHRvLCBlbmRpYW5u
ZXNzLg0KPj4+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vaW1idXNodW8vREZSRGlzcGxheUtt
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEtlcmVtIEthcmFiYXkgPGtla3JieUBnbWFpbC5jb20+DQo+
Pj4+IENvLWRldmVsb3BlZC1ieTogQXRoYXJ2YSBUaXdhcmkgPGV2ZXBvbG9uaXVtQGdtYWlsLmNv
bT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQXRoYXJ2YSBUaXdhcmkgPGV2ZXBvbG9uaXVtQGdtYWls
LmNvbT4NCj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxp
dmUuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxp
dmUuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBdW4tQWxpIFphaWRpIDxhZG1pbkBrb2RlaXQu
bmV0Pg0KPj4+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4+PiBUaGFua3MgZm9yIHRoZSBlZmZvcnQuIEFzIGZhciBhcyBJJ20gY29uY2VybmVk
LCB0aGlzIGRyaXZlciBsb29rcyBnb29kLiBJZiBubyBmdXJ0aGVyIGNvbW1lbnRzIGNvbWUgaW4s
IEkgY2FuIGFkZCBpdCB0byB0aGUgRFJNIHRyZWUgaW4gYSBmZXcgZGF5cy4NCj4+IFRoYW5rcyBh
IGxvdCBUaG9tYXMsIGFzIHdlbGwgYXMgQW5keSBmb3IgcmV2aWV3aW5nIHRoZSBkcml2ZXIgYW5k
IG1ha2luZyBpdCBiZXR0ZXIhDQo+IA0KPiBJJ3ZlIG1lcmdlZCB0aGUgZHJpdmVyIGludG8gdGhl
IERSTSBtaXNjIHRyZWUgYW5kIGl0IHNob3VsZCBiZSBhdmFpbGFibGUgaW4gdjYuMTUuDQoNClRo
YW5rcyBUaG9tYXMhDQo=
