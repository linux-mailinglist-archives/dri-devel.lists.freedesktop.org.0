Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3518516ABF
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 08:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B342710E036;
	Mon,  2 May 2022 06:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-eopbgr90070.outbound.protection.outlook.com [40.107.9.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A6510E036;
 Mon,  2 May 2022 06:08:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFGtjXpzvuyw/juxyGheznU1evYTeFxmCgWIJm+uEj8rr9d1g45mlxFpIf9fVUtWPlXvvqAlyB7BphGAQmPbI8uxJk9zJZ7rxgxRgYD4C8ijtgwgW8DjP2zexBaM3V6pbm0PhmLKN/fBl7tPTkvxzpcKM3UWBWbi5lq6EHQ6XlldXAdH6pyejTyaWs020SJCh7ALgs4s0tyhCYSnE8RjGAVxOM4nyBeFJTWPoZqGYxQQY1Pz/ZDamenKKgaoELvxNAdDvoIHpOy3ZUHaU0MAIYhiyHhky3huhH5nALSYO0yCPmu+UfXi5008icFDB+wn9Z8xaLDTMWjSljmEsqD6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/EBrk4yXocSq1uXt1rmkY24Gj1Jcwg/H9UQP4mMtng=;
 b=PACRTgWRX8JAtEKi1FDd7f0RLMDfXToDjxkACyWyZCheVHsKT+kZyyQNM8vv+HXeVTvH6vmqpYe5Tjo3aM/3Ud55PFXY1H9jrc5UGiLW579GnMwXWaX/Nh+VUv8KWViYgs3CokjoE2wwmOz2HQH2ZQb+6G/SE2rD7AMa0DUQ3OV3jdmuvubP24gpsh9Hh4b5iXq3AXrWFYUA7xtbXVU81kexGkXIxRZmMuUlmEbGQKPwTSWt//yE8AuEITq2tgMsYFbdMrraR4LuSL0PfKChQrRrytKQqZkKMhKBIRya79q9E+PnfDgDXJihqlgBrX195nJdXPVZAFRjQXs0qz/hJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB4182.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 2 May
 2022 06:08:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 06:08:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>
Subject: Re: [PATCH v5 1/2] module: update dependencies at try_module_get()
Thread-Topic: [PATCH v5 1/2] module: update dependencies at try_module_get()
Thread-Index: AQHYXM2Zzg+jtoGoAkWIXKiaR0JBfK0LHH2A
Date: Mon, 2 May 2022 06:08:32 +0000
Message-ID: <d728cc1b-d34f-77a5-a1fb-81cc117a3620@csgroup.eu>
References: <cover.1651348913.git.mchehab@kernel.org>
 <ad2a9fe66cf502e2e2e2325f1f04d0fae36aa82b.1651348913.git.mchehab@kernel.org>
In-Reply-To: <ad2a9fe66cf502e2e2e2325f1f04d0fae36aa82b.1651348913.git.mchehab@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c26fb09f-f817-47f4-0405-08da2c022f69
x-ms-traffictypediagnostic: PR1P264MB4182:EE_
x-microsoft-antispam-prvs: <PR1P264MB41826717BAA7EDDAD8B95DF3EDC19@PR1P264MB4182.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZQuNuV2XYhk3VxXmiSGUmnN8rLTsI2Uj9bucYd7NGKj7EN8F+psZ6KhBLDXyFlfyQoYriUz/Ng0EKA56QgLy3rM8FiLo6jwwzwzUM3WNKTI3nJLAtTnU0U7mWn/QgXsDc6/v7kRaOmOyAPNHEjZP/kIIUDXcmbbIPaUjr11rhWO8fyKmL9M7RZvqGs6Pgmo2dmLFXVGMCMiHXkrH06s/WX8XHI4lMqyN1EpXrmdan/7MiIy2oK8+WhStNiLWsPAts1QTopxSlSNvSwKRG13NbT/8FAMQexwlEGGN5zXRuE4SOA1HLN+eb+wkxsjWqPmLoKKIn6U+hvD0uUi5uwXGeGoSVhg/W/uy0yQrTKyhsFI4eE2f6wDnGY67BJNjYgJGGSjWVZ11eI4dW17hCmYn6n1dgPPvSWJZu++mzeKInNZrAMcksoxDpSSkcnP1oTraHLj+gaKax7m4zvHvZ7htOPdpLFm7DO5jbkeb18aONI4Fpq6WRqBCWGMywiXQT/dfx68vhf8xHHr3tqR8DsYJiB+P0pucGE5M8660AKRJu1OooYDqSM6q+WnyNsH390+eE8+brl1oRHo+b15rIsLRQc80aAzoLP0CudyUgDhTCwxKO8gTXKI9C2NyQWzlnDFXRW5bBImG2//9+5DiVj9vYlyU5Uvz2fxKtnfu2BTK2lQcK8iMo92BVD2Q4rw6+CSoMLRa6PjWykJrIhBiYB21ma6oc/OijDtbfmpiuCIy5mmKw7qYvIC7PtuK55q7hy3zHOJPLY6NAnB7/HaJOuJm/Eort7+DjytiwoBucDLR9AfyaE/4ecWMbeuv8QWEKCEbpxT8kDGwwk1RbTaAN2Xg6D9YpqI/TyaEvDxyj1LJHOo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(6486002)(36756003)(966005)(31686004)(508600001)(83380400001)(66446008)(66476007)(66556008)(64756008)(110136005)(71200400001)(4326008)(8676002)(91956017)(66946007)(76116006)(54906003)(5660300002)(8936002)(44832011)(316002)(66574015)(26005)(186003)(2616005)(6506007)(6512007)(2906002)(31696002)(86362001)(122000001)(38070700005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2VUcVgzaWVMZUJ0TU0rRWk3QUxua3EzS1RkeDY2VDkyUVRDS0ZZbDA3TldV?=
 =?utf-8?B?c05veEdBcDl0KzAzSC9JS3EyZDVxM1pjYmlwQzY4ZlNIVjFnTDYrdnV3RjM1?=
 =?utf-8?B?V0xjS3RJSXBHenYvMGorSDdtaW1HZFpwUCtIRjY3b2FGWGQ5M3I5NVI4ME1z?=
 =?utf-8?B?ajRRU3YxTE9TWXRFOTdzQ3VudFBEbUgyM055WWJtcGs1eFk0Yy9rRDZuNjln?=
 =?utf-8?B?Y2lrUkR0MW4wQUU5NzlHUURWRHNKOC9ld1RGMC9WYlQvQnd6RUR1cDBKTDRt?=
 =?utf-8?B?amJva0p0RnNjVjVldWhnc2xQUzl2V09XVlUrcXlLaGR5SS95RFBCZklJTmV2?=
 =?utf-8?B?RU9pSFhnOVVNTDdUSFNrZSt0M0MvNFlBSmNhME10cFZBQ2VLeDh2UVJsNEh6?=
 =?utf-8?B?UW1tMHdKU3dZVlArMVJ6LzBQWURJNDVFTElDV1BnemNaUlFGYVFJeUZIZi9q?=
 =?utf-8?B?N29SbXNxYVR5bTdJQlpqZkxRVjZJdENIQWFHaDk5a0Z5ZTZrOTRaTGhRUXI4?=
 =?utf-8?B?aVpEN2NsQ0dOd3l6WlFiY0tlRXp6L2pGWld4NmNEaWJrM0lyTDFXV1c5V0NL?=
 =?utf-8?B?TjhxWUtOMEY5aTVCVW1Hc29wUE8zVnhsR1FmZ0xtZHVkcGM5MmlGLzRBUTVo?=
 =?utf-8?B?dXp6SE45aVdJVnMwQWtCb05DQldURlcwY1BIb21BMDJ2STBpaURQZ1hQbm1E?=
 =?utf-8?B?eHhKamthV042dkJQNFh2T2dNTnRZVG1Mei9ESGxrMExoRTZBY09OWnV2M2U0?=
 =?utf-8?B?NklCNk1MWmhadXpkL3J2T2psRVNTRVlUK0hXdngxTFBYOUdxbnRGTi9YNU11?=
 =?utf-8?B?bW9CNWxhWjdDY1I0a293VG1QRm9UaEE5WVZyc3RaTnRobS9UWXRWdXl1YlZ0?=
 =?utf-8?B?VTFpOGRWOVN5RHJuSFhJWmcrVHNXV3c5NnYrY1M4VVo3ckNSYWlyak02YTJ6?=
 =?utf-8?B?dzhGUFZEU0c5MHR3T21WVk5EdWlNb1pYYi9tZ3JyUkJHMTA5QWpGSlNqVndP?=
 =?utf-8?B?aGQ2SUZCRmlaeDM4dUhzWERTcnFCMWVNMmYzM0JITHl1QW5UN2o0YTBoYW9N?=
 =?utf-8?B?TUw4ZG9RTWJpZFVIS2pQMlUzSkFGSC91UDVienRFdGNycFluZG14NEJnY2Ra?=
 =?utf-8?B?enVGR0gxclRpVEU2byt1UjhnQWhIZGtWRzFFZ1luQkJlNkV5b004SWpPMitI?=
 =?utf-8?B?UTh5N0VYTTVuc2gwSWNSdThKc1lvVE5EMFl2bjB4VThEOHR4cEhMRkkrRzVl?=
 =?utf-8?B?elMzRWtGU200dXZaamZ2bnRBR3ZvbmRXNTZ6dkkvQmRQMlNrQlc0TW11Y09p?=
 =?utf-8?B?bTBwbHcySWp3RXUxbWxYUjllcHJPMUNRa1RBQmM5YWlNK1Z3Q1ZTdndsM1FT?=
 =?utf-8?B?M0MvWUNaRGNwQTJSVmFpT3NDbWI2Qmo0YklocFZzRG96R1BXVUJTSEF5Ym51?=
 =?utf-8?B?ZUJjWXF5QWd1Nldic2l3ZVpQZkRhbVc2aE9lL0g0U0RyWUVQNEpLckxjU2cx?=
 =?utf-8?B?SmozNm40YzlzdThONmRuUVVVeUhVRmFTWERLcXM1MERONTdiQkpPWDk3bjlS?=
 =?utf-8?B?d3RnOE5DTjZYTFdXT1FieGpKYjJZaGhuZjVjRmJRbkdmRnd1TVgxUGtmK3FG?=
 =?utf-8?B?UXZmeFNURVFVMjREeHA1S0szMmtEUVMxV2gwQ1ZhNEdmVm96L2ZTQmMwcHVt?=
 =?utf-8?B?MDg0ZGRYV3pIRlowVmpIRnlweTh4RmJPRzdGV05KckdqTkVib28rTjFIb0ZL?=
 =?utf-8?B?M1c5UEhlT3RhTWVwempqbTZWeExJUUgxbStIU0VIRW1ZdFROcjlGL0s0d1dt?=
 =?utf-8?B?WkwvMUNwL3MzcEdjTkxmQUl5Ry9BOGdNYmJyVXRUU2VjamxSMVVuSUVEVlV4?=
 =?utf-8?B?MmU5L1luZVRlcHh1TmxORCt4elo1di9OcUtzemh6VEpydHJ6YUhxQ0RqMEd2?=
 =?utf-8?B?VlhtWkUzbkJwcVhIMkUrcGM2L1E2eC9samdvSUFMMk5iQXdUd0ZKMmNYNVRV?=
 =?utf-8?B?MDJiNk9aVzdTK3Y1cGo5L2xsYkZoYXJ0cFZPYWp5UFNiV3BNV08vNjRpZ1d3?=
 =?utf-8?B?WjNhLzBhK2xmUzJoTGwvakpxZTZxakZoeUFFYjhaS3RjcGNhNDVNd0ZsYmNq?=
 =?utf-8?B?RGFyckJVVWdnZDhXbWd2d0dGVS9qQjdtbVBXa2dvWVdSZUhFbS9Ybk10ekhH?=
 =?utf-8?B?U0lDM0c3VTdmMk5RYS9iQUNLWTBhd2I0cW5kT2djOVExTXR1RXJ3ZkZPUlY3?=
 =?utf-8?B?NUVaUzhmcWUrQ3ZjV1hpd3BBN0piSFhpZVdhOVJSZlNIMDJkYjNlUTRvdE5R?=
 =?utf-8?B?a0JLNXNmamRkOVhUcXhqS213VUhwRXlPRDBVcXdpSFBUSFZuY2FVSVpzZmFC?=
 =?utf-8?Q?cRA5jO4crZHw6tj4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BDFAFF9AFD47C4C99F077D2A1C28FDD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c26fb09f-f817-47f4-0405-08da2c022f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 06:08:32.2368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j9/KGkp/NWuUGk+WoyA0VzVFzDdPsJOmIHFg4nFxrBbUKG/u7dbZZX7CB+/inAKEnbFfTVNXq45XLFH22O0h7C5Ign+P5qb3ridLfLJcPXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB4182
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
 "mauro.chehab@linux.intel.com" <mauro.chehab@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@intel.com>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCkxlIDMwLzA0LzIwMjIgw6AgMjI6MDQsIE1hdXJvIENhcnZhbGhvIENoZWhhYiBhIMOpY3Jp
dMKgOg0KPiBTb21ldGltZXMsIGRldmljZSBkcml2ZXJzIGFyZSBib3VuZCBpbnRvIGVhY2ggb3Ro
ZXIgdmlhIHRyeV9tb2R1bGVfZ2V0KCksDQo+IG1ha2luZyBzdWNoIHJlZmVyZW5jZXMgaW52aXNp
YmxlIHdoZW4gbG9va2luZyBhdCAvcHJvYy9tb2R1bGVzIG9yIGxzbW9kLg0KPiANCj4gQWRkIGEg
ZnVuY3Rpb24gdG8gYWxsb3cgc2V0dGluZyB1cCBtb2R1bGUgcmVmZXJlbmNlcyBmb3Igc3VjaA0K
PiBjYXNlcywgYW5kIGNhbGwgaXQgd2hlbiB0cnlfbW9kdWxlX2dldCgpIGlzIHVzZWQuDQo+IA0K
PiBSZXZpZXdlZC1ieTogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+DQo+
IFJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2Vy
bmVsLm9yZz4NCj4gLS0tDQo+IA0KPiBTZWUgW1BBVENIIHY1IDAvMl0gYXQ6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNjUxMzQ4OTEzLmdpdC5tY2hlaGFiQGtlcm5lbC5vcmcv
DQo+IA0KPiAgIGluY2x1ZGUvbGludXgvbW9kdWxlLmggfCAgOCArKysrLS0NCj4gICBrZXJuZWwv
bW9kdWxlL21haW4uYyAgIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21vZHVsZS5oIGIvaW5jbHVk
ZS9saW51eC9tb2R1bGUuaA0KPiBpbmRleCA0NmQ0ZDVmMjUxNmUuLjNkOWQzOGM0MjZiNCAxMDA2
NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9tb2R1bGUuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4
L21vZHVsZS5oDQo+IEBAIC02MjAsMTIgKzYyMCwxMiBAQCBleHRlcm4gdm9pZCBfX21vZHVsZV9n
ZXQoc3RydWN0IG1vZHVsZSAqbW9kdWxlKTsNCj4gICANCj4gICAvKiBUaGlzIGlzIHRoZSBSaWdo
dCBXYXkgdG8gZ2V0IGEgbW9kdWxlOiBpZiBpdCBmYWlscywgaXQncyBiZWluZyByZW1vdmVkLA0K
PiAgICAqIHNvIHByZXRlbmQgaXQncyBub3QgdGhlcmUuICovDQo+IC1leHRlcm4gYm9vbCB0cnlf
bW9kdWxlX2dldChzdHJ1Y3QgbW9kdWxlICptb2R1bGUpOw0KPiArZXh0ZXJuIGJvb2wgdHJ5X21v
ZHVsZV9nZXRfb3duZXIoc3RydWN0IG1vZHVsZSAqbW9kdWxlLCBzdHJ1Y3QgbW9kdWxlICp0aGlz
KTsNCg0KWW91IG1heSB3YW50IHRvIHJlbW92ZSB0aGF0IHVzZWxlc3MgJ2V4dGVybicuDQoNCidj
aGVja3BhdGNoIC0tc3RyaWN0JyB3aWxsIGxpa2VseSB0ZWxsIHlvdSB0byBkbyBzby4NCg0KPiAg
IA0KPiAgIGV4dGVybiB2b2lkIG1vZHVsZV9wdXQoc3RydWN0IG1vZHVsZSAqbW9kdWxlKTsNCj4g
ICANCj4gICAjZWxzZSAvKiFDT05GSUdfTU9EVUxFX1VOTE9BRCovDQo+IC1zdGF0aWMgaW5saW5l
IGJvb2wgdHJ5X21vZHVsZV9nZXQoc3RydWN0IG1vZHVsZSAqbW9kdWxlKQ0KPiArc3RhdGljIGlu
bGluZSBib29sIHRyeV9tb2R1bGVfZ2V0X293bmVyKHN0cnVjdCBtb2R1bGUgKm1vZHVsZSwgc3Ry
dWN0IG1vZHVsZSAqdGhpcykNCj4gICB7DQo+ICAgCXJldHVybiAhbW9kdWxlIHx8IG1vZHVsZV9p
c19saXZlKG1vZHVsZSk7DQo+ICAgfQ0KPiBAQCAtNzQwLDcgKzc0MCw3IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBfX21vZHVsZV9nZXQoc3RydWN0IG1vZHVsZSAqbW9kdWxlKQ0KPiAgIHsNCj4gICB9
DQo+ICAgDQo+IC1zdGF0aWMgaW5saW5lIGJvb2wgdHJ5X21vZHVsZV9nZXQoc3RydWN0IG1vZHVs
ZSAqbW9kdWxlKQ0KPiArc3RhdGljIGlubGluZSBib29sIHRyeV9tb2R1bGVfZ2V0X293bmVyKHN0
cnVjdCBtb2R1bGUgKm1vZHVsZSwgc3RydWN0IG1vZHVsZSAqdGhpcykNCj4gICB7DQo+ICAgCXJl
dHVybiB0cnVlOw0KPiAgIH0NCj4gQEAgLTg3NSw2ICs4NzUsOCBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgbW9kdWxlX3NpZ19vayhzdHJ1Y3QgbW9kdWxlICptb2R1bGUpDQo+ICAgfQ0KPiAgICNlbmRp
ZgkvKiBDT05GSUdfTU9EVUxFX1NJRyAqLw0KPiAgIA0KPiArI2RlZmluZSB0cnlfbW9kdWxlX2dl
dChtb2QpIHRyeV9tb2R1bGVfZ2V0X293bmVyKG1vZCwgVEhJU19NT0RVTEUpDQo+ICsNCj4gICBp
bnQgbW9kdWxlX2thbGxzeW1zX29uX2VhY2hfc3ltYm9sKGludCAoKmZuKSh2b2lkICosIGNvbnN0
IGNoYXIgKiwNCj4gICAJCQkJCSAgICAgc3RydWN0IG1vZHVsZSAqLCB1bnNpZ25lZCBsb25nKSwN
Cj4gICAJCQkJICAgdm9pZCAqZGF0YSk7DQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvbW9kdWxlL21h
aW4uYyBiL2tlcm5lbC9tb2R1bGUvbWFpbi5jDQo+IGluZGV4IDA1YTQyZDhmY2Q3YS4uMjE4YzQz
MDhiYjdhIDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvbW9kdWxlL21haW4uYw0KPiArKysgYi9rZXJu
ZWwvbW9kdWxlL21haW4uYw0KPiBAQCAtMTUwLDYgKzE1MCwyNCBAQCBpbnQgdW5yZWdpc3Rlcl9t
b2R1bGVfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYikNCj4gICB9DQo+ICAgRVhQ
T1JUX1NZTUJPTCh1bnJlZ2lzdGVyX21vZHVsZV9ub3RpZmllcik7DQo+ICAgDQo+ICtzdGF0aWMg
Ym9vbCBfX3RyeV9tb2R1bGVfZ2V0KHN0cnVjdCBtb2R1bGUgKm1vZHVsZSkNCj4gK3sNCj4gKwli
b29sIHJldCA9IHRydWU7DQo+ICsNCj4gKwlpZiAobW9kdWxlKSB7DQo+ICsJCXByZWVtcHRfZGlz
YWJsZSgpOw0KPiArCQkvKiBOb3RlOiBoZXJlLCB3ZSBjYW4gZmFpbCB0byBnZXQgYSByZWZlcmVu
Y2UgKi8NCj4gKwkJaWYgKGxpa2VseShtb2R1bGVfaXNfbGl2ZShtb2R1bGUpICYmDQo+ICsJCQkg
ICBhdG9taWNfaW5jX25vdF96ZXJvKCZtb2R1bGUtPnJlZmNudCkgIT0gMCkpDQo+ICsJCQl0cmFj
ZV9tb2R1bGVfZ2V0KG1vZHVsZSwgX1JFVF9JUF8pOw0KPiArCQllbHNlDQo+ICsJCQlyZXQgPSBm
YWxzZTsNCj4gKw0KPiArCQlwcmVlbXB0X2VuYWJsZSgpOw0KPiArCX0NCj4gKwlyZXR1cm4gcmV0
Ow0KPiArfQ0KPiArDQo+ICAgLyoNCj4gICAgKiBXZSByZXF1aXJlIGEgdHJ1bHkgc3Ryb25nIHRy
eV9tb2R1bGVfZ2V0KCk6IDAgbWVhbnMgc3VjY2Vzcy4NCj4gICAgKiBPdGhlcndpc2UgYW4gZXJy
b3IgaXMgcmV0dXJuZWQgZHVlIHRvIG9uZ29pbmcgb3IgZmFpbGVkDQo+IEBAIC0xNjAsNyArMTc4
LDcgQEAgc3RhdGljIGlubGluZSBpbnQgc3Ryb25nX3RyeV9tb2R1bGVfZ2V0KHN0cnVjdCBtb2R1
bGUgKm1vZCkNCj4gICAJQlVHX09OKG1vZCAmJiBtb2QtPnN0YXRlID09IE1PRFVMRV9TVEFURV9V
TkZPUk1FRCk7DQo+ICAgCWlmIChtb2QgJiYgbW9kLT5zdGF0ZSA9PSBNT0RVTEVfU1RBVEVfQ09N
SU5HKQ0KPiAgIAkJcmV0dXJuIC1FQlVTWTsNCj4gLQlpZiAodHJ5X21vZHVsZV9nZXQobW9kKSkN
Cj4gKwlpZiAoX190cnlfbW9kdWxlX2dldChtb2QpKQ0KPiAgIAkJcmV0dXJuIDA7DQo+ICAgCWVs
c2UNCj4gICAJCXJldHVybiAtRU5PRU5UOw0KPiBAQCAtNjMxLDYgKzY0OSwzMyBAQCBzdGF0aWMg
aW50IHJlZl9tb2R1bGUoc3RydWN0IG1vZHVsZSAqYSwgc3RydWN0IG1vZHVsZSAqYikNCj4gICAJ
cmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGludCByZWZfbW9kdWxlX2RlcGVuZGVu
Y3koc3RydWN0IG1vZHVsZSAqbW9kLCBzdHJ1Y3QgbW9kdWxlICp0aGlzKQ0KDQpXaGF0IGlzICd0
aGlzJyA/IENhbiB3ZSBnaXZlIGl0IGEgbW9yZSBwcmVjaXNlIG5hbWUgPyBJcyBpdCBhIGNoaWxk
LCBhIA0KcGFyZW50LCBhIG93bmVyLCBzb21ldGhpbmcgZWxzZSA/DQoNCj4gK3sNCj4gKwlpbnQg
cmV0Ow0KPiArDQo+ICsJaWYgKCF0aGlzIHx8ICF0aGlzLT5uYW1lKQ0KPiArCQlyZXR1cm4gLUVJ
TlZBTDsNCj4gKw0KPiArCWlmIChtb2QgPT0gdGhpcykNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4g
KwltdXRleF9sb2NrKCZtb2R1bGVfbXV0ZXgpOw0KPiArDQo+ICsJcmV0ID0gcmVmX21vZHVsZSh0
aGlzLCBtb2QpOw0KPiArDQo+ICsjaWZkZWYgQ09ORklHX01PRFVMRV9VTkxPQUQNCg0KTG9va3Mg
bGlrZSB0aGF0ICNpZmRlZiBjb3VsZCBiZSBhdm9pZGVkIGFuZCByZXBsYWNlZCBieSANCklTX0VO
QUJMRUQoQ09ORklHX01PRFVMRV9VTkxPQUQpDQoNClNvbWV0aGluZyBsaWtlOg0KDQoJaWYgKCFJ
U19FTkFCTEVEKENPTkZJR19NT0RVTEVfVU5MT0FEKSB8fCByZXQpDQoJCWdvdG8gcmV0Ow0KDQoN
Cj4gKwlpZiAocmV0KQ0KPiArCQlnb3RvIHJldDsNCj4gKw0KPiArCXJldCA9IHN5c2ZzX2NyZWF0
ZV9saW5rKG1vZC0+aG9sZGVyc19kaXIsDQo+ICsJCQkJJnRoaXMtPm1rb2JqLmtvYmosIHRoaXMt
Pm5hbWUpOw0KPiArI2VuZGlmDQo+ICsNCj4gK3JldDoNCj4gKwltdXRleF91bmxvY2soJm1vZHVs
ZV9tdXRleCk7DQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiAgIC8qIENsZWFyIHRoZSB1
bmxvYWQgc3R1ZmYgb2YgdGhlIG1vZHVsZS4gKi8NCj4gICBzdGF0aWMgdm9pZCBtb2R1bGVfdW5s
b2FkX2ZyZWUoc3RydWN0IG1vZHVsZSAqbW9kKQ0KPiAgIHsNCj4gQEAgLTg0MSwyNCArODg2LDE2
IEBAIHZvaWQgX19tb2R1bGVfZ2V0KHN0cnVjdCBtb2R1bGUgKm1vZHVsZSkNCj4gICB9DQo+ICAg
RVhQT1JUX1NZTUJPTChfX21vZHVsZV9nZXQpOw0KPiAgIA0KPiAtYm9vbCB0cnlfbW9kdWxlX2dl
dChzdHJ1Y3QgbW9kdWxlICptb2R1bGUpDQo+ICtib29sIHRyeV9tb2R1bGVfZ2V0X293bmVyKHN0
cnVjdCBtb2R1bGUgKm1vZHVsZSwgc3RydWN0IG1vZHVsZSAqdGhpcykNCg0KU2FtZSBoZXJlLCB3
aGF0IGlzICd0aGlzJyBleGFjdGx5ID8NCg0KPiAgIHsNCj4gLQlib29sIHJldCA9IHRydWU7DQo+
ICsJaW50IHJldCA9IF9fdHJ5X21vZHVsZV9nZXQobW9kdWxlKTsNCj4gICANCj4gLQlpZiAobW9k
dWxlKSB7DQo+IC0JCXByZWVtcHRfZGlzYWJsZSgpOw0KPiAtCQkvKiBOb3RlOiBoZXJlLCB3ZSBj
YW4gZmFpbCB0byBnZXQgYSByZWZlcmVuY2UgKi8NCj4gLQkJaWYgKGxpa2VseShtb2R1bGVfaXNf
bGl2ZShtb2R1bGUpICYmDQo+IC0JCQkgICBhdG9taWNfaW5jX25vdF96ZXJvKCZtb2R1bGUtPnJl
ZmNudCkgIT0gMCkpDQo+IC0JCQl0cmFjZV9tb2R1bGVfZ2V0KG1vZHVsZSwgX1JFVF9JUF8pOw0K
PiAtCQllbHNlDQo+IC0JCQlyZXQgPSBmYWxzZTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZWZfbW9k
dWxlX2RlcGVuZGVuY3kobW9kdWxlLCB0aGlzKTsNCj4gICANCj4gLQkJcHJlZW1wdF9lbmFibGUo
KTsNCj4gLQl9DQo+ICAgCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAtRVhQT1JUX1NZTUJPTCh0cnlf
bW9kdWxlX2dldCk7DQo+ICtFWFBPUlRfU1lNQk9MKHRyeV9tb2R1bGVfZ2V0X293bmVyKTsNCj4g
ICANCj4gICB2b2lkIG1vZHVsZV9wdXQoc3RydWN0IG1vZHVsZSAqbW9kdWxlKQ0KPiAgIHs=
