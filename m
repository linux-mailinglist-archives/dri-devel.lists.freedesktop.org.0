Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB91A42146
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C7410E471;
	Mon, 24 Feb 2025 13:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="X6MEcJxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04olkn2038.outbound.protection.outlook.com [40.92.47.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29DB10E00F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 00:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Srp/pKNphbcde4TPti9DIrY/G/h3KGvVCESkbsaaHH9BTWQ6uap2GIjO5HEUCNRQ6mr9/nto9xsHoKcfK7wVyU6jL7yIObDhZ0s0c5S6v7iDKi0pC3VOahj+HKofKhY14bqAhbq/qeP3lwsjACs6PdSLwLNd6ZzM2HXg7ZrT4ufTzh4vXVEQ+fJEusshYrnH64amcfDYIBy1QZepm4Xdc3YKHmIkoSJOiZ4ELtgSO8AWLBR0yqFaAXbcX/kO7eLQ6JBZ1XdDS71gZD+zdFE7cIRoEFDX9+1qFpGXgL71cJDlRiBLAMJEZ2mEFWc9vdppI5Pl//uo37oEAAvmjr0ZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UArnqnxZHfUyNv7/xqjomWrD37FwXSQ0M0Uao5j2ueI=;
 b=QObV3wr4uSAbvfhtImLmsUolgfOf/gGzTV9Hlq3klrFcTTGjgMcL6bXs6cVm6u3aSTHHog5BvoJq5Jz65XmUj6EKuXXFX5zhLOkmrfonYjDF6kO0No7arGBjdHs0bpTe1KyFers9r9nG2RQpwC3APKIRwyBQUZRkTcbvll0TVO7eqgWFsjRSJgjMu8qRSJ/fRduXe1o1nzlroRQTkEq0svmd0l+j0xzOaA8sShjTAnc7cRB3tu3tQVVV6P9Oaju2PcbVhzm1UWizoDN+xbNxkmLWiHPWc8EAni9aR2formkCAXhVznKY4k8cK+5N+Wx1gbArJzNl58MZIbrXTCI8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UArnqnxZHfUyNv7/xqjomWrD37FwXSQ0M0Uao5j2ueI=;
 b=X6MEcJxsDndjE/eV103gAei3gMt1cfmoqVioUUofisPqJuC/d+bXzHaqrcjWywIXSRKw9mBKTaxNYNyiFSi4OT12DN98byFzeGRyGmzzHP3QjxBj28qwZWMKjr54om2TyJhTEyjUV8VZnaxd/QfxAUiZ89VmQPBPcdXuAuHbGVCJBeGgSsxRvfHIM3q6Ge42xpZyIM5v2RQQVg/rCZBDQQsuWaPFhRomgB1dNaQvLVZSGFpO6AYXatmIh4bNkO2vWCKr9vVdI4wkG359U+602n3ZDctYRxwJKift2NOhvBAJcuJhDQSGCGVVi8jDG3eUILCbFXYc0x70Kx5bJI8Wig==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH0PR02MB8105.namprd02.prod.outlook.com (2603:10b6:610:10a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 00:38:22 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 00:38:22 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
CC: "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>, "deller@gmx.de" <deller@gmx.de>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ssengar@microsoft.com" <ssengar@microsoft.com>
Subject: RE: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Thread-Topic: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Thread-Index: AQHbf4rly0L2XRweZkiIboVOb0veYbNN636ggAWzc4CAAC5VwIABLMSAgACuCkA=
Date: Mon, 24 Feb 2025 00:38:22 +0000
Message-ID: <SN6PR02MB41571ED5CEA6B91A7F35AC3FD4C02@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1739611240-9512-1-git-send-email-ssengar@linux.microsoft.com>
 <SN6PR02MB4157813782C1D9E6D1225582D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250222172715.GA28061@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB4157F6CF7CACF45C398933C4D4C62@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250223140933.GA16428@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20250223140933.GA16428@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH0PR02MB8105:EE_
x-ms-office365-filtering-correlation-id: 89dcd46e-7e5b-48d2-366c-08dd546b8ade
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|15080799006|19110799003|8062599003|461199028|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info: =?utf-8?B?ZDRxbVN6ZHN4MkRXZE1GcjUvVnMraE5hbitGTnEzM0JmT0xCVndlck9FWkx1?=
 =?utf-8?B?bFFYRlZUNlR5OFVkMU82aGREM3NpblRtK2h6Uk9JT3h6enZnYkwxQk9EdVlu?=
 =?utf-8?B?Yk9yM01LYXZ6OEY2cUNDb3JZQjc2Mkx1NjFzNWY3dUUzSjBNTWZlSy9iZVpG?=
 =?utf-8?B?N1Z0YSs1RG9XTE5hOVVEdGs2TlloTUs3ZXBueGxYUmYzN2l5bml1YnI4cnNn?=
 =?utf-8?B?eWNHWS9PamlTYWhwelN4UDl6T3dnMFNsTjV4by9pMnJuNjhoWkFkMVkxWm40?=
 =?utf-8?B?YWxHZlFYczBVRC8rWmltc0xyR2J2NThJSk03c1VINVhDcit3RDRtN1A3OVY3?=
 =?utf-8?B?YytZVUY4U3dWT1Q2dnFSM2FETVF3dVVsVG1tSG9FRExwTmNYb1NjaTcvZllN?=
 =?utf-8?B?WDZKQXBuNDNzR1NGQ2RIbWpkdndpSVQ5SDZaeGtHMG9vVnJSRXRzdFoxUTdl?=
 =?utf-8?B?TGdxdXA1ZjdDZFVaWDcwSHRLN2ZycjdNUC9KOWJxZHZ6OUZKRlVySVpvL2pY?=
 =?utf-8?B?MEMxUUtPSjBKTVlCRUZCbVJRQVFRKzVJUUxVYUNnRWQ1VTI5anVHejdFbzl3?=
 =?utf-8?B?bXovSGJTbVNDVElxZnJDUEVYa01hb1NGNzdybUw2R2NIVXNqWFZqcmVaeFYw?=
 =?utf-8?B?NFZUdWVNVVNXYjErUkdBVFpWSjFhWEkrMXpoaU5lbHBiUWlhQzVnSmYvQmZh?=
 =?utf-8?B?UkczRk5udU9GUUdvR053eVp0YVBuUGlBZUF6eDJHVTFrdEowWWR2QXZxWTkr?=
 =?utf-8?B?RkpkYXhHRFJoRjg5VXdMQVJvY0h0dkE3YXYzVWUyT2JQWmZBdEtqUWpGT0Vs?=
 =?utf-8?B?a2gvQVAwZ09XVWV0SmdFb3FTdFNlODNCM1M3VGY1WlFycDZZMGFrZDFPOS9V?=
 =?utf-8?B?UVYzVWFUWkthR21YKy82OW1NN0U4Y0IveVVOMk8vZGsrZUxSdkQxUGJDOVhk?=
 =?utf-8?B?bDI4aGZiSUV5Qm5iYnNNZlZIVllaM1RlUmU0R28wVklHeWlMK25tSWJIVUpq?=
 =?utf-8?B?VFFpcVNobEs0d3dLeThjOGk0YW5keklpRDFmd3VMZld1L29EbWdqb2dHQ2lN?=
 =?utf-8?B?WjNBOXZuV2ZEemdlR3AyaTJuNzdGQkVESjVxaGxUNjV4Umc2WXNJTHZZd2E2?=
 =?utf-8?B?dWF4VG5XUDdQOWFLb0VOMmlmUGNNcktkZERpZVBocStKZjRvanFVdUYrbUgr?=
 =?utf-8?B?WmRlZnliVm9GYmhmdkxTSGtteHBVTTM5aXFiYVp1VnVFZDZLRjRjZmJHL3pv?=
 =?utf-8?B?T0ExbzRhRXF3WkpLNGZ2Tm5vMlN4K1p1QXNja2VDRlUyUWU1cVlZbGt3ZXdH?=
 =?utf-8?B?VlFOdW9hVG5XN0NoUTVvUHVPbk9wWEYvVVAyMjhnTEJjMWx0MUVLZzdsK2pK?=
 =?utf-8?B?QVFEeEEwV3lialJBNUJhNnkwdDkwQnI5cGFPVm03QzVIazc4MHpKSVV1S2dD?=
 =?utf-8?B?NDd2a3ZCd0FJYkF4MVd5Tm5rMVE1Um1SbnlZbEhRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUdRQ0pOSXpEcWpnc0laaFo3MWlRWWt4bGNVdTZCY2FoekdCSGxiWm5tYzFr?=
 =?utf-8?B?WHY5YlNIRmNMSzdQbTdRajVoWDZqV1RPLytZSnVuSHVwNTZRNmtnMmJZcWRL?=
 =?utf-8?B?R1FKQytjQ3VIWXdjNzNtVVJEOXlhU0NRMWpMeVB0ZlpBOXBrQTE2SE0yZFlz?=
 =?utf-8?B?dlZTbFU3Mm5uNHR6TjVJcGJKY2NqNWxqN2RodDFreXUxY1pycDEzTDFaZG16?=
 =?utf-8?B?Ym1oeDBmdThhRmQzVmdxUTB4KzBmQkl2MDd6dmZteHN4eHFmMCtlUzI0MERI?=
 =?utf-8?B?eVdZSUw5S1IyWmxFN1ZDZzNWYWIzaXJQY0c2VlBlRUExUFVtTW1xWHA2VDJl?=
 =?utf-8?B?OS8veUNkM3lLWmhkY29HL2JyZU1UZDNtY0g2cUlKOUpjbXVEc3pGeFA3aC84?=
 =?utf-8?B?SVRwVHRua0N0T3A1OEV5NTVKUURNRmlhaVhwN3NCMURiNGdRQkNFRldJa3Ux?=
 =?utf-8?B?U0g1aWRYakk3QzJpdmFRNmhIWi91T1FBYjFUTUg1N3hYcUdRT1dnQ3dUSmR1?=
 =?utf-8?B?aXRaYkhmekc0QkEyVlRPYjJWSFlwU25rTTc2LzNuR1ZmTzhaSFZiaGtvaTR4?=
 =?utf-8?B?ajYvbFFMSGNIQmhKU3NsZnR1UlNjd05YcjRQdk9Tdm1VU3QyQmNVYnhieFlX?=
 =?utf-8?B?TDhxcTBqNkd4UkxZY2UvYzIrT3pPNDVPRDFhenRhaHlvUmM2WUlpL3g0N1o4?=
 =?utf-8?B?QnA4TDFyTzNlYzBhQ2R3Z3IrMTF4clAzRGJTamdJMWNGOERmcno3M1IyczQ5?=
 =?utf-8?B?VjducHN3SkF1a0lteDgvMkdyVGJ3QXB2TDdGblpnakFkdFNTa2RwejkyYW4y?=
 =?utf-8?B?YzRzS0lDenFnb3l2VTlZbnFjam1HTlVwbUhyc3Zjb3RqMzZHN09pbFhPL05w?=
 =?utf-8?B?aGdKNzhVS1pmQ0Job25uT29wUFlkR3BwcDQ4dXFoTjg5Z0FvUDJSMDR1NnNV?=
 =?utf-8?B?VEtyNTRJWi9xMkkzZ29IUlFXTWdlRVhHMEpmU0YzZ1dYcW1rSFVsMm5heDll?=
 =?utf-8?B?U3ZMaENvZVBZYlZTS1ZWUVptUjhNcVhRV0FhM3ZuYTFtSUhMWkRsVmd1ZjNS?=
 =?utf-8?B?NTB4aHRBU0VrQUVnR1VRYk44ZjA3anNxZUJIZjNVSTlKU0xURDBvOWNsL2dq?=
 =?utf-8?B?emFIRGVrQkhsWS9aV0JjQzhSUTFGVmZxdzIzc3hvZzVZV1BjT3FGYzh1RWJr?=
 =?utf-8?B?Z0x3dGF4NFQ1OWhydG5Kb1JFbURNSS94NldSVlV5RDgyTEhwVlBtd3BvNWl1?=
 =?utf-8?B?UStMdFVhRURPcHRnZU54eFhpYnYvUTlRUkpHdDFOVUoxaDV2b00zKzNFVmZu?=
 =?utf-8?B?cm9qYlpiT3dpTDh3MHNIN2J4aXM4OGt2OWJiZ0NjYjNuSEtqUE1XckN5NlJX?=
 =?utf-8?B?MVRSV2wxOTk4ZllncWJlaE9SVmZPR0pDaDVkdlRJQmtNWU4yb3dmMU5KVm5o?=
 =?utf-8?B?bFlmNldJRlUwZGplMk9Rekt2NkpTL1NnQTRUa3R4REFHdU8rbElqNFlxR2lI?=
 =?utf-8?B?RkxyekQ1SDkvaGxoNitNMXBJaFRWeERGaDZObEhxcENFdEo1TUNPUVppU1FF?=
 =?utf-8?B?MjRUa1czMlVQZ2tkVG1SaGUzcEFVdEE3NklGaVhOV0ZyQW9VdUx3bzkvNlIr?=
 =?utf-8?Q?Q4B1DjxdbEOPaoAMfDOhXy1XSuAM7FWNbMzA2PtpZqlY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dcd46e-7e5b-48d2-366c-08dd546b8ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 00:38:22.3933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8105
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

RnJvbTogU2F1cmFiaCBTaW5naCBTZW5nYXIgPHNzZW5nYXJAbGludXgubWljcm9zb2Z0LmNvbT4g
U2VudDogU3VuZGF5LCBGZWJydWFyeSAyMywgMjAyNSA2OjEwIEFNDQo+IA0KPiBPbiBTYXQsIEZl
YiAyMiwgMjAyNSBhdCAwODoxNjo1M1BNICswMDAwLCBNaWNoYWVsIEtlbGxleSB3cm90ZToNCj4g
PiBGcm9tOiBTYXVyYWJoIFNpbmdoIFNlbmdhciA8c3NlbmdhckBsaW51eC5taWNyb3NvZnQuY29t
PiBTZW50OiBTYXR1cmRheSwgRmVicnVhcnkgMjIsIDIwMjUgOToyNyBBTQ0KPiA+ID4NCg0KW2Fu
aXBdDQoNCj4gPiA+DQo+ID4gPiBJIGhhZCBjb25zaWRlcmVkIG1vdmluZyB0aGUgZW50aXJlIGBo
dmZiX3B1dG1lbSgpYCBmdW5jdGlvbiB0byBgZGVzdHJveWAsDQo+ID4gPiBidXQgSSB3YXMgaGVz
aXRhbnQgZm9yIHR3byByZWFzb25zOg0KPiA+ID4NCj4gPiA+ICAgMS4gSSB3YXNu4oCZdCBhd2Fy
ZSBvZiBhbnkgc2NlbmFyaW8gd2hlcmUgdGhpcyB3b3VsZCBiZSB1c2VmdWwuIEhvd2V2ZXIsDQo+
ID4gPiAgICAgIHlvdXIgZXhwbGFuYXRpb24gaGFzIGNvbnZpbmNlZCBtZSB0aGF0IGl0IGlzIG5l
Y2Vzc2FyeS4NCj4gPiA+ICAgMi4gYGh2ZmJfcmVsZWFzZV9waHltZW0oKWAgcmVsaWVzIG9uIHRo
ZSBgaGRldmAgcG9pbnRlciwgd2hpY2ggcmVxdWlyZXMNCj4gPiA+ICAgICAgbXVsdGlwbGUgYGNv
bnRhaW5lcl9vZmAgb3BlcmF0aW9ucyB0byBkZXJpdmUgaXQgZnJvbSB0aGUgYGluZm9gIHBvaW50
ZXIuDQo+ID4gPiAgICAgIEkgd2FzIHVuc3VyZSBpZiB0aGUgY29tcGxleGl0eSB3YXMganVzdGlm
aWVkLCBidXQgaXQgc2VlbXMgd29ydGh3aGlsZSBub3cuDQo+ID4gPg0KPiA+ID4gSSB3aWxsIG1v
dmUgYGh2ZmJfcHV0bWVtKClgIHRvIHRoZSBgZGVzdHJveWAgZnVuY3Rpb24gaW4gVjIsIGFuZCBJ
IGhvcGUgdGhpcw0KPiA+ID4gd2lsbCBhZGRyZXNzIGFsbCB0aGUgY2FzZXMgeW91IG1lbnRpb25l
ZC4NCj4gPiA+DQo+ID4NCj4gPiBZZXMsIHRoYXQncyB3aGF0IEkgZXhwZWN0IG5lZWRzIHRvIGhh
cHBlbiwgdGhvdWdoIEkgaGF2ZW4ndCBsb29rZWQgYXQgdGhlDQo+ID4gZGV0YWlscyBvZiBtYWtp
bmcgc3VyZSBhbGwgdGhlIG5lZWRlZCBkYXRhIHN0cnVjdHVyZXMgYXJlIHN0aWxsIGFyb3VuZC4g
TGlrZQ0KPiA+IHlvdSwgSSBqdXN0IGhhZCB0aGlzIHNlbnNlIHRoYXQgaHZmYl9wdXRtZW0oKSBt
aWdodCBuZWVkIHRvIGJlIG1vdmVkIGFzDQo+ID4gd2VsbCwgc28gSSB0cmllZCB0byBwcm9kdWNl
IGEgZmFpbHVyZSBzY2VuYXJpbyB0byBwcm92ZSBpdCwgd2hpY2ggdHVybmVkIG91dA0KPiA+IHRv
IGJlIGVhc3kuDQo+ID4NCj4gPiBNaWNoYWVsDQo+IA0KPiBJIHdpbGwgYWRkIHRoaXMgaW4gVjIg
YXMgd2VsbC4gQnV0IEkgaGF2ZSBmb3VuZCBhbiBhbm90aGVyIGlzc3VlIHdoaWNoIGlzDQo+IG5v
dCB2ZXJ5IGZyZXF1ZW50Lg0KPiANCj4gDQo+IFsgIDE3Ni41NjIxNTNdIC0tLS0tLS0tLS0tLVsg
Y3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiBbICAxNzYuNTYyMTU5XSBmYjA6IGZiX1dBUk5fT05f
T05DRShwYWdlcmVmLT5wYWdlICE9IHBhZ2UpDQo+IFsgIDE3Ni41NjIxNzZdIFdBUk5JTkc6IENQ
VTogNTAgUElEOiAxNTIyIGF0IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jOjY3
DQo+IGZiX2RlZmVycmVkX2lvX21rd3JpdGUrMHgyMTUvMHgyODANCj4gDQo+IDxzbmlwPg0KPiAN
Cj4gWyAgMTc2LjU2MjI1OF0gQ2FsbCBUcmFjZToNCj4gWyAgMTc2LjU2MjI2MF0gIDxUQVNLPg0K
PiBbICAxNzYuNTYyMjYzXSAgPyBzaG93X3JlZ3MrMHg2Yy8weDgwDQo+IFsgIDE3Ni41NjIyNjld
ICA/IF9fd2FybisweDhkLzB4MTUwDQo+IFsgIDE3Ni41NjIyNzNdICA/IGZiX2RlZmVycmVkX2lv
X21rd3JpdGUrMHgyMTUvMHgyODANCj4gWyAgMTc2LjU2MjI3NV0gID8gcmVwb3J0X2J1ZysweDE4
Mi8weDFiMA0KPiBbICAxNzYuNTYyMjgwXSAgPyBoYW5kbGVfYnVnKzB4MTMzLzB4MWEwDQo+IFsg
IDE3Ni41NjIyODNdICA/IGV4Y19pbnZhbGlkX29wKzB4MTgvMHg4MA0KPiBbICAxNzYuNTYyMjg0
XSAgPyBhc21fZXhjX2ludmFsaWRfb3ArMHgxYi8weDIwDQo+IFsgIDE3Ni41NjIyODldICA/IGZi
X2RlZmVycmVkX2lvX21rd3JpdGUrMHgyMTUvMHgyODANCj4gWyAgMTc2LjU2MjI5MV0gID8gZmJf
ZGVmZXJyZWRfaW9fbWt3cml0ZSsweDIxNS8weDI4MA0KPiBbICAxNzYuNTYyMjkzXSAgZG9fcGFn
ZV9ta3dyaXRlKzB4NGQvMHhiMA0KPiBbICAxNzYuNTYyMjk2XSAgZG9fd3BfcGFnZSsweGU4LzB4
ZDUwDQo+IFsgIDE3Ni41NjIzMDBdICA/IF9fX3B0ZV9vZmZzZXRfbWFwKzB4MWMvMHgxYjANCj4g
WyAgMTc2LjU2MjMwNF0gIF9faGFuZGxlX21tX2ZhdWx0KzB4YmUxLzB4MTBlMA0KPiBbICAxNzYu
NTYyMzA3XSAgaGFuZGxlX21tX2ZhdWx0KzB4MTdmLzB4MmUwDQo+IFsgIDE3Ni41NjIzMDldICBk
b191c2VyX2FkZHJfZmF1bHQrMHgyZDEvMHg4ZDANCj4gWyAgMTc2LjU2MjMxNF0gIGV4Y19wYWdl
X2ZhdWx0KzB4ODUvMHgxZTANCj4gWyAgMTc2LjU2MjMxOF0gIGFzbV9leGNfcGFnZV9mYXVsdCsw
eDI3LzB4MzANCj4gDQo+IExvb2tzIHRoaXMgaXMgYmVjYXVzZSBkcml2ZXIgaXMgdW5iaW5kIHN0
aWxsIFhvcmcgaXMgdHJ5aW5nIHRvIHdyaXRlDQo+IHRvIG1lbW9yeSB3aGljaCBpcyBjYXVzaW5n
IHNvbWUgcGFnZSBmYXVsdHMuIEkgaGF2ZSBjb25maXJtZWQgUElEIDE1MjINCj4gaXMgb2YgWG9y
Zy4gSSB0aGluayB0aGlzIGlzIGJlY2F1c2Ugd2UgbmVlZCB0byBjYW5jZWwgdGhlIGZyYW1lYnVm
ZmVyDQo+IGRlZmVycmVkIHdvcmsgYWZ0ZXIgZmx1c2hpbmcgaXQuDQoNCkRvZXMgdGhpcyBuZXcg
aXNzdWUgb2NjdXIgZXZlbiBhZnRlciBtb3ZpbmcgaHZmYl9wdXRtZW0oKQ0KaW50byB0aGUgZGVz
dHJveSgpIGZ1bmN0aW9uPyAgSSdtIGhvcGluZyBpdCBkb2Vzbid0LiBJJ3ZlDQpsb29rZWQgYXQg
dGhlIGZiX2RlZmVycmVkX2lvIGNvZGUsIGFuZCBjYW4ndCBxdWl0ZSBmaWd1cmUgb3V0DQpob3cg
dGhhdCBkZWZlcnJlZCBJL08gd29yayBpcyBzdXBwb3NlZCB0byBnZXQgY2FuY2VsbGVkLiBPcg0K
bWF5YmUgaXQncyBqdXN0IG5vdCBzdXBwb3NlZCB0byBnZXQgc3RhcnRlZCBhZ2FpbiBhZnRlciB0
aGUgZmx1c2guDQoNCklmIHRoZSBuZXcgaXNzdWUgc3RpbGwgaGFwcGVucywgdGhhdCBzZWVtcyBs
aWtlIG1vcmUgb2YgYSBmbGF3DQppbiB0aGUgZmIgZGVmZXJyZWQgSS9PIG1lY2hhbmlzbSBub3Qg
c2h1dHRpbmcgaXRzZWxmIGRvd24NCnByb3Blcmx5Lg0KDQpNaWNoYWVsDQoNCj4gDQo+IEFmdGVy
IGFkZGluZyB0aGUgYmVsb3cgaW4gaHZmYl9yZW1vdmUgSSBkb24ndCBzZWUgdGhpcyBpc3N1ZSBh
bnltb3JlLg0KPiBBbHRob3VnaCBhcyB0aGUgaXNzdWUgaXMgbm90IHZlcnkgZnJlcXVlbnQgSSBh
bSBub3QgMTAwJSBzdXJlLg0KPiANCj4gCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmaW5mby0+
ZGVmZXJyZWRfd29yayk7DQo+IA0KPiBJZiB5b3UgdGhpbmsgdGhpcyBpcyByZWFzb25hYmxlIEkg
Y2FuIGFkZCB0aGlzIGFzIHdlbGwgaW4gVjIuDQo+IA0K
