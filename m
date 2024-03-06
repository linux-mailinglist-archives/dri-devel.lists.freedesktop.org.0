Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00355873946
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B638610F364;
	Wed,  6 Mar 2024 14:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="zVZq0e5S";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="tb3giCua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB2110FB13
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709735736; x=1741271736;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4/QFMm9KuTNLj0f7lTO9WY/T1CAF36+xNPSmIfFqToM=;
 b=zVZq0e5SVxs2+S+74eNgJg5JspmnypWvVya7ndQ2JOtIz19JKOa+php0
 uvEPPUcFK8kTEi3P9CkUz7Sl5y+hgI60Hmdn+MmA35tzTaoBWWtImVLiw
 vgQ8wzDKp5sDlO7qQ5SC8NSO3cGxAuNIpKMQwsfKZ7WOpSlaCqkg2IsFe
 It20vbDSo5hrEzy3gY9kGhrn5fFQ/bw2CLbj4CA0VBfZXMpuHPEqN1z5m
 HYqUbWGbP94qLt/FjfFYo5cF9zsaMHwuJfCBfWJszWJrbz1+FrL1uVBA1
 sfC/Py+86ORz3jpj9B00MeLEMGpqxgdf8sIl2tnanKD9XWEolRCK9/fR1 g==;
X-CSE-ConnectionGUID: Id7gX3V3QGuELn9+NjWdvg==
X-CSE-MsgGUID: 8N2HSE1UR1ODzibl93ATYw==
X-IronPort-AV: E=Sophos;i="6.06,208,1705388400"; d="scan'208";a="17277655"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Mar 2024 07:35:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 07:35:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 07:35:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGh9VWCnsNsPObrItibC8GFvqMwYgK2eC0Cgh0PT7DW9/vTITmkfdmSXWTTQhJV26tcnEWsmAz7n+bDzr9fQEjXR6J9qqoS9yWuXAawg9V+pOOzO8AURl4CoEo4x3JA5EgB3WvNEPJmo0L5w8LUHIyz95NwJnbWw0LArjPQUvyGjoAGzNLBt3QGyHtUNvbGfTSFCNlXJIIktMTPg4tZvQQxNACgRjZxuDCrdDUGCIZEwGZ+gIuYcazvXPa8Eq6g8rn7P7vBEuweonQ6zq+2tcWFWMqoR0db2nS/KHpuQKLBFC8p2FUyc5edzwDaHe/NHEGIYL7cOUtyNEKHOD7ZVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/QFMm9KuTNLj0f7lTO9WY/T1CAF36+xNPSmIfFqToM=;
 b=SOdhaAti4xWjSB4KwUue9PVnJwF0Nnmp1kfXlLERsjDI9s9rTULC7Km2UtaD91jE02cnZeO5ruv+r+m+ux/s7prQ1fwyszniMQuVu4pWeeonk1N4WgVfwtfIYFbkMcbMxjn6hW7/92IqOZOLVuTjRAsaT/HrH908yS7D8mZLuQzMuUY24oIsgLE4aMnCaXJss+WvCNEgbgFxOAGQiiOjfiOOVMnpsE8JmsjwHCWtUMciLHASw96vQaf8gZ/HUoBGIjJL5nKeNTPqrycjgsv5ENVBdJvJ0PYL/cOiforjLxquEGURr0Poaja014cpYzmSvtJEyi2c62pTtGqsbRRBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/QFMm9KuTNLj0f7lTO9WY/T1CAF36+xNPSmIfFqToM=;
 b=tb3giCuavxKDZjQv/qy1HIOTgI/umWTDGRDaeEA75xaqGQlFjLsu4Dh0jiPAUV1IDzPFmJ/BmBHun9mEb1bikp5Ap9SbJJF4Ap6POM2GLB+ckhOF/QrCWrluM98KNfc/eJqzxHgX2Fr5wRdbusIvlZaNUOOPuY+AU+8o9idEgji9gdpzZFRtbk8t0uPDqE2m+tmfHGpoChEcPhDkOP6BWGbAXs/FwkJd190b5lDJas0smWb9hp9is+4N9/N55BcHHyBYnEiD8WMikpmPwHtFi4vKC5OQ8OsFLvUnTssC2KrOtvw6I0V+haF4Cl4H/ZojRaQASsbNp49N1rThTBxg2A==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 14:35:15 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd%3]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 14:35:14 +0000
From: <Dharma.B@microchip.com>
To: <robh@kernel.org>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: display: atmel,lcdc: convert to dtschema
Thread-Topic: [PATCH v3] dt-bindings: display: atmel, lcdc: convert to dtschema
Thread-Index: AQHabkCPzXhfZiNH0USPLHqXgkqUkrEoIqEAgAKn3gA=
Date: Wed, 6 Mar 2024 14:35:14 +0000
Message-ID: <d3ae3196-4e8a-4e73-bc36-f53541598ab2@microchip.com>
References: <20240304-lcdc-fb-v3-1-8b616fbb0199@microchip.com>
 <20240304220154.GA1115739-robh@kernel.org>
In-Reply-To: <20240304220154.GA1115739-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SA1PR11MB5777:EE_
x-ms-office365-filtering-correlation-id: 5f2faf95-b7cc-4fb1-76e3-08dc3deaa328
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oFHTxicJfGxwZCsMZv+ivUZqBiYKoNT0NDalsPbXRb7NkrieuUX7JBhnC+ciwm7ljqKn0O2pPAlyA10x8Q12fSQBX02llieC/cpuyp1/e+TRLRLr3dJsqIs/TV0OoUODgliRp2R+b94rlFSGwXb4ZN5oYXIEv4sZruf5XBBkSz8nh48iy55rSLM3jjCUZncZKtXmlJCdMoQssMjXEQNUHW+Vz2Qk2TvVnXqmd0V5r06XqAObjlbTJSjTbKv1aEyHeu/kFf/l6TY56W4ps0Z8QFvRIw9Jakadg5BCTqFsy7sD1D5suLU/lkSJp5QVYwh3kJPC31iqczDaR7FYnS8rd/7cLBOZ2BWUYn9hOO7NN5kMFNWKWgVFajaxQmT1wCJbWmya1ggb5TQDgMUsNSPWEbzUNLWwXadw7uRg7Ook3ZXtz3lhFuvMl82Rn7XRyb5SviINdLv6obQlCHXkq9i69q4mIi9TLUTDtcQpQhfmE0g+XcTaXrZ2SygTGcWWIu7xCBLgAIyX8jd4dyOzLhM+BdTWNKmg5Dy+l6Y4gtjfcxjrliE7Up8E//z9iMCcG+tj/CExFJtzb0ZWEqVOdv3woW3mAY37rCWwwEHsm7RQegqX2ye6o3aMXz5VT1LVQA3aj4yklt3cgTVvgv/b/6abnhJ2Ryt3ky9nBg4T0oSnjls=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTNUMnpBYm9sQ1hBMlE3VFlCTUhrWFRJV3B2UmQ5SCtWN2NHbjZlRmlKK3Bw?=
 =?utf-8?B?TmU5MjA1MXN2bWN4NTQ2VzJGaXNjOHhkMndXM1QySHYvWWR6OGRTV0dUT0gy?=
 =?utf-8?B?VWt3MkpOemE3VHMvSVBHYlpOVzhWUVR3cFdlMVJXSmVWdiszMUxKQU85dDZO?=
 =?utf-8?B?TmhZU1dYMkJZOXE5aFR6QjZBUmJieVFFd3diK1lyZ2xaWHdPOGpoeHZrRkk4?=
 =?utf-8?B?NzR6R3RKNlNtTUNyb1lCM09qakZZOE9BWnd3QXBaT1Z3cVdodUg5eWJrWGRJ?=
 =?utf-8?B?K1N2M1lyQmRQSjB6S2YxZUU5ajlZaFlYYkx0OFpXOFhVQzFaK29IeC9iN1Qw?=
 =?utf-8?B?MXhZRlhoS2piQmhCNjNZT3dtVXQvWVpaUWU4blVjc1FtbHVxSExGbFVUU1Fj?=
 =?utf-8?B?RERkTTNnbVNJTnZLTENmZVJVZ1ZGamRKODlJWmRubDEyVTUxbWcvSlIzR2Y5?=
 =?utf-8?B?cWs1ZDM1YmZ0YkRoNFlrNGl2cUhZOGxkQlF0TlMwL3Nib3FDdkR0eUpZVlVS?=
 =?utf-8?B?ckNvbGNzWklFUHpTTS9vYUJ2UnV1ZlB1djdhRktIWUNoVVBYYnlONERtNVVQ?=
 =?utf-8?B?SWVaMEF5UzRyWTIwMndKVklTZ01yWlROdEZVNHBiWCt1UXQraXNWR0xkVEZ2?=
 =?utf-8?B?WGliZWJzL1B1eVl3YS8xOEFsVk45ZUx0dlZmTlVHYllWRGJ2RFllWjVTdnY1?=
 =?utf-8?B?WWp5bm5UL0dHRnBRVEQ1UEorWlBwRW5YNnMvL2lnVVVCckVPNEp2MnoyZUsr?=
 =?utf-8?B?N1J4Y3ZRaUVhNVkwVmxqYWZOcFVRWUszYVF6RmsxekVqTUlnSFhIRlBNbFZN?=
 =?utf-8?B?VkdMYUxCZUlRdXFybXA4MDdMTnMrYUFGS3FhdmFuTENDdWxob0hyQ2VhREc3?=
 =?utf-8?B?bjNhcFFJTzU1Q3YxQ2tkVFFpekJmOTF0OHpoNHVPL1lybXJFVXg3Ry9aOWZP?=
 =?utf-8?B?VjhESUxWZnM2QkRqZkxhaENBR1QwZ1VFaXFVeVo3WTNUT2lyVjlSQ3NCSXlI?=
 =?utf-8?B?QUZyK2prNXlOOFI3OUlJbkZhSVVCL0ZoRmpzaFp2b0ZxckJGUmROZGoyUHVG?=
 =?utf-8?B?STFpOEN1V01nVlB3QXpZRSt6YjROL2dVZkZzZkthSFREOStQM1h5dnAwdDY2?=
 =?utf-8?B?T1ZndWJNaFFlRFRpUDRjWmZnNjYyRjl1NWMrZ2cwTEdTTUJPeVNrZm5jSS9I?=
 =?utf-8?B?alVFUnRlckltREdHRDJQRXY2NlNnaDNNU3ByR1oyaElnU2gvdFBBY2RabGpw?=
 =?utf-8?B?RHVuVDZKcENkaXgrRkY2MzJWbFBUVmtaUkRoYytMNTNxV3FXZHpqOG5XTno0?=
 =?utf-8?B?dDE1cEwyZmJTTGU0b2JaeDNsMDRzUm1HVWhxYkNnUyt3RmxrZ21qUmlKbWg0?=
 =?utf-8?B?QWIyR1lEdFVKODczSnNlUk5mdVozZmhjVGRDV3MzUzFYbFpZbjhFMjZIS0FB?=
 =?utf-8?B?TXhQSUxDQUhFR1VjZmZ4ZFRqaXpzNFZrL3gyRmZvTnB0RUJDNENkNVRpYnYr?=
 =?utf-8?B?NnU0OHZiQlVPMDJDTVRGa29sVitLZlN6S2k5UXY2bXVjYUE0UisreUdZM0Z4?=
 =?utf-8?B?TU5Yd1FmOHlteFhuU0prMTdsVUJsdkZNRXY2S3ZySlhlVFk4elNaUkFrYm5k?=
 =?utf-8?B?YW9SZ3U0Q2pBTTA3RlgzTXozdVY0TzdiVlAyUnYweERKL25mSjNXKzNMOWJB?=
 =?utf-8?B?K0pweXBIbGNBc2haK3FZQXNaQzMyVXpLYzdCYjFKRkl1dGxuS1lBYlRVV3lP?=
 =?utf-8?B?bzB4YXhzemh1V0ZrUnhicVYxZEhuUVJIYW85UkorQmNEcW45ektwbVl5L041?=
 =?utf-8?B?LzlGRU5aVVBkWnYyMzVvQ21DdjJiMzM2cURpM2dEWlZzVHBOSXJUWUIxZnNi?=
 =?utf-8?B?NksrdDZDbGtVTk9CbFdnUkFoVFBUWjlnQUlVT0lTcDlaVVpINmZpK2pxYVhD?=
 =?utf-8?B?WlIyVXN6NnNTbFhKMEFiL3pBSlZQRGFCQXJGM0l0T0ZGc3h0K3Y0K3llT0M0?=
 =?utf-8?B?VzdNcmI2bTlsams5dnZNdVBwVmozRFM3VlJJTzFtSDFueWRaR3d2ODFxSTlK?=
 =?utf-8?B?L25MbWRZc0xjRnAycmQ1Nm81RUJ4Y1dwaGhmZlNzbTFXY3FUbkJrWFBFTHU2?=
 =?utf-8?Q?gW8prZQfWvFyIRpxjeypSjEub?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBA6FC9234302649B39B21BFC4CBF4DE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2faf95-b7cc-4fb1-76e3-08dc3deaa328
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 14:35:14.8126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kcb9dFtPjOc8g9oRuz3KCE4/w4OLUJAyNkBZXLQs0IQgsL1VHwSd0yeAL3s49UzALI39visrRbMQjTBLP5iulA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
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

DQpPbiAwNS8wMy8yNCAzOjMxIGFtLCBSb2IgSGVycmluZyB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBNb24sIE1hciAwNCwgMjAyNCBhdCAwODow
MDowM1BNICswNTMwLCBEaGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6DQo+PiBDb252ZXJ0IHRo
ZSBhdG1lbCxsY2RjIGJpbmRpbmdzIHRvIERUIHNjaGVtYS4NCj4+IENoYW5nZXMgZHVyaW5nIGNv
bnZlcnNpb246IGFkZCBtaXNzaW5nIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMgcHJvcGVydGllcy4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1p
Y3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IFRoaXMgcGF0Y2ggY29udmVydHMgdGhlIGV4aXN0aW5n
IGxjZGMgZGlzcGxheSB0ZXh0IGJpbmRpbmcgdG8gSlNPTiBzY2hlbWEuDQo+PiBUaGUgYmluZGlu
ZyBpcyBzcGxpdCBpbnRvIHR3byBuYW1lbHkNCj4+IGxjZGMueWFtbA0KPj4gLSBIb2xkcyB0aGUg
ZnJhbWUgYnVmZmVyIHByb3BlcnRpZXMNCj4+IGxjZGMtZGlzcGxheS55YW1sDQo+PiAtIEhvbGRz
IHRoZSBkaXNwbGF5IHBhbmVsIHByb3BlcnRpZXMgd2hpY2ggaXMgYSBwaGFuZGxlIHRvIHRoZSBk
aXNwbGF5DQo+PiBwcm9wZXJ0eSBpbiBsY2RjIGZiIG5vZGUuDQo+Pg0KPj4gVGhlc2UgYmluZGlu
Z3MgYXJlIHRlc3RlZCB1c2luZyB0aGUgZm9sbG93aW5nIGNvbW1hbmQuDQo+PiAnbWFrZSBEVF9D
SEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2snDQo+PiAtLS0NCj4+IENoYW5nZXMgaW4g
djM6DQo+PiAtIFJlbW92ZSB0aGUgZ2VuZXJpYyBwcm9wZXJ0eSAiYml0cy1wZXItcGl4ZWwiDQo+
PiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAzMDQtbGNkYy1m
Yi12Mi0xLWExNGI0NjNjMTU3YUBtaWNyb2NoaXAuY29tDQo+Pg0KPj4gQ2hhbmdlcyBpbiB2MjoN
Cj4+IC0gUnVuIGNoZWNrcGF0Y2ggYW5kIHJlbW92ZSB3aGl0ZXNwYWNlIGVycm9ycy4NCj4+IC0g
QWRkIHRoZSBzdGFuZGFyZCBpbnRlcnJ1cHQgZmxhZ3MuDQo+PiAtIFNwbGl0IHRoZSBiaW5kaW5n
IGludG8gdHdvLCBuYW1lbHkgbGNkYy55YW1sIGFuZCBsY2RjLWRpc3BsYXkueWFtbC4NCj4+IC0g
TGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDIyMy1sY2RjLWZiLXYx
LTEtNGM2NGNiNjI3N2RmQG1pY3JvY2hpcC5jb20NCj4+IC0tLQ0KPj4gICAuLi4vYmluZGluZ3Mv
ZGlzcGxheS9hdG1lbCxsY2RjLWRpc3BsYXkueWFtbCAgICAgICB8IDk3ICsrKysrKysrKysrKysr
KysrKysrKysNCj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hdG1lbCxsY2Rj
LnR4dCAgICAgfCA4NyAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYXRtZWwsbGNkYy55YW1sICAgIHwgNzAgKysrKysrKysrKysrKysrKw0K
Pj4gICAzIGZpbGVzIGNoYW5nZWQsIDE2NyBpbnNlcnRpb25zKCspLCA4NyBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYXRtZWwsbGNkYy1kaXNwbGF5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9hdG1lbCxsY2RjLWRpc3BsYXkueWFtbA0KPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNWUwYjcwNmQ2OTVkDQo+PiAtLS0gL2Rl
di9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9hdG1lbCxsY2RjLWRpc3BsYXkueWFtbA0KPj4gQEAgLTAsMCArMSw5NyBAQA0KPj4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFN
TCAxLjINCj4+ICstLS0NCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rp
c3BsYXkvYXRtZWwsbGNkYy1kaXNwbGF5LnlhbWwjDQo+PiArJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+PiArDQo+PiArdGl0bGU6IE1pY3Jv
Y2hpcCdzIExDREMgRGlzcGxheQ0KPj4gKw0KPj4gK21haW50YWluZXJzOg0KPj4gKyAgLSBOaWNv
bGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+DQo+PiArICAtIERoYXJtYSBC
YWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4NCj4+ICsNCj4+ICtkZXNjcmlw
dGlvbjoNCj4+ICsgIFRoZSBMQ0QgQ29udHJvbGxlciAoTENEQykgY29uc2lzdHMgb2YgbG9naWMg
Zm9yIHRyYW5zZmVycmluZyBMQ0QgaW1hZ2UgZGF0YQ0KPj4gKyAgZnJvbSBhbiBleHRlcm5hbCBk
aXNwbGF5IGJ1ZmZlciB0byBhIFRGVCBMQ0QgcGFuZWwuIFRoZSBMQ0RDIGhhcyBvbmUgZGlzcGxh
eQ0KPj4gKyAgaW5wdXQgYnVmZmVyIHBlciBsYXllciB0aGF0IGZldGNoZXMgcGl4ZWxzIHRocm91
Z2ggdGhlIHNpbmdsZSBidXMgaG9zdA0KPj4gKyAgaW50ZXJmYWNlIGFuZCBhIGxvb2stdXAgdGFi
bGUgdG8gYWxsb3cgcGFsbGV0aXplZCBkaXNwbGF5IGNvbmZpZ3VyYXRpb25zLiBUaGUNCj4+ICsg
IExDREMgaXMgcHJvZ3JhbW1hYmxlIG9uIGEgcGVyIGxheWVyIGJhc2lzLCBhbmQgc3VwcG9ydHMg
ZGlmZmVyZW50IExDRA0KPj4gKyAgcmVzb2x1dGlvbnMsIHdpbmRvdyBzaXplcywgaW1hZ2UgZm9y
bWF0cyBhbmQgcGl4ZWwgZGVwdGhzLg0KPj4gKw0KPj4gKyMgV2UgbmVlZCBhIHNlbGVjdCBoZXJl
IHNpbmNlIHRoaXMgc2NoZW1hIGlzIGFwcGxpY2FibGUgb25seSBmb3Igbm9kZXMgd2l0aCB0aGUN
Cj4+ICsjIGZvbGxvd2luZyBwcm9wZXJ0aWVzDQo+PiArDQo+PiArc2VsZWN0Og0KPj4gKyAgYW55
T2Y6DQo+PiArICAgIC0gcmVxdWlyZWQ6IFsgJ2F0bWVsLGRtYWNvbicgXQ0KPj4gKyAgICAtIHJl
cXVpcmVkOiBbICdhdG1lbCxsY2Rjb24yJyBdDQo+PiArICAgIC0gcmVxdWlyZWQ6IFsgJ2F0bWVs
LGd1YXJkLXRpbWUnIF0NCj4+ICsNCj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAgYXRtZWwsZG1hY29u
Og0KPj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIN
Cj4+ICsgICAgZGVzY3JpcHRpb246IGRtYSBjb250cm9sbGVyIGNvbmZpZ3VyYXRpb24NCj4+ICsN
Cj4+ICsgIGF0bWVsLGxjZGNvbjI6DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMg0KPj4gKyAgICBkZXNjcmlwdGlvbjogbGNkIGNvbnRyb2xsZXIg
Y29uZmlndXJhdGlvbg0KPj4gKw0KPj4gKyAgYXRtZWwsZ3VhcmQtdGltZToNCj4+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+PiArICAgIGRlc2Ny
aXB0aW9uOiBsY2QgZ3VhcmQgdGltZSAoRGVsYXkgaW4gZnJhbWUgcGVyaW9kcykNCj4gDQo+IElz
IHRoZXJlIGEgbWF4aW11bT8NCg0KVGhlIGRhdGFzaGVldCAoaHR0cHM6Ly93d3cua2VpbC5jb20v
ZGQvY2hpcC80MjEwLmh0bSkgZm9yIGJvdGggDQpBVDkxU0FNOTI2MSBhbmQgQVQ5MVNBTTkyNjMg
c3BlY2lmaWVzIHRoZSBHVUFSRF9USU1FIGZpZWxkIHdpdGhpbiB0aGUgDQpQV1JDT04gcmVnaXN0
ZXIuIFRoaXMgZmllbGQgaXMgNyBiaXRzIHdpZGUgKGJpdHMgMS03KSBhbmQgYWN0cyBhcyBhIG1h
c2sgDQp0byBkZWZpbmUgdGhlIGd1YXJkIHRpbWUgZGVsYXkuDQoNCkhlbmNlIHRoZSBtYXhpbXVt
IHZhbHVlIGZvciB0aGUgZ3VhcmQgdGltZSBmb3IgYm90aCBBVDkxU0FNOTI2MSBhbmQgDQpBVDkx
U0FNOTI2MyBTb0NzIGlzIDEyNyB3aGVuIHVzaW5nIHRoZSBHVUFSRF9USU1FIGZpZWxkIGluIHRo
ZSBQV1JDT04gDQpyZWdpc3Rlci4NCg0KVGhlIGRhdGFzaGVldCBkb2Vzbid0IHNwZWNpZnkgdGhl
IGR1cmF0aW9uIG9mIGVhY2ggImZyYW1lIHBlcmlvZC4iIFNvLCANCnRoaXMgdmFsdWUgb25seSBy
ZXByZXNlbnRzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBmcmFtZSBwZXJpb2RzIHRoYXQgY2FuIA0K
YmUgc2V0IGZvciB0aGUgZ3VhcmQgdGltZSwgbm90IHRoZSBhY3R1YWwgdGltZSBkZWxheSBpbiBz
ZWNvbmRzIG9yIA0KbWlsbGlzZWNvbmRzLg0KDQo+IA0KPj4gKw0KPj4gKyAgYml0cy1wZXItcGl4
ZWw6DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQz
Mg0KPj4gKyAgICBkZXNjcmlwdGlvbjogbGNkIHBhbmVsIGJpdC1kZXB0aC4NCj4gDQo+IENvbnN0
cmFpbnRzPw0KDQpUaGUgYml0cy1wZXItcGl4ZWwgdmFsdWUgY2FuIGJlIDEsIDIsIDQsIDgsIDE2
IG9yIDI0Lg0KDQo+IA0KPj4gKw0KPj4gKyAgYXRtZWwsbGNkY29uLWJhY2tsaWdodDoNCj4+ICsg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZw0KPj4gKyAgICBk
ZXNjcmlwdGlvbjogZW5hYmxlIGJhY2tsaWdodA0KPj4gKw0KPj4gKyAgYXRtZWwsbGNkY29uLWJh
Y2tsaWdodC1pbnZlcnRlZDoNCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvZmxhZw0KPj4gKyAgICBkZXNjcmlwdGlvbjogaW52ZXJ0IGJhY2tsaWdodCBQV00g
cG9sYXJpdHkNCj4+ICsNCj4+ICsgIGF0bWVsLGxjZC13aXJpbmctbW9kZToNCj4+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvbm9uLXVuaXF1ZS1zdHJpbmctYXJy
YXkNCj4gDQo+IElzbid0IHRoaXMganVzdCBhIHNpbmdsZSBzdHJpbmcgcmF0aGVyIHRoYW4gYW4g
YXJyYXk/DQo+IA0KPj4gKyAgICBkZXNjcmlwdGlvbjogbGNkIHdpcmluZyBtb2RlICJSR0IiIG9y
ICJCUkciDQo+IA0KPiBlbnVtOg0KPiAgICAtIFJHQg0KPiAgICAtIEJSRw0KPiANCj4gTm8gQkdS
Pw0KDQpJbiB0aGUgY3VycmVudCBkcml2ZXIgaW1wbGVtZW50YXRpb24sIHdlIGhhdmUgaW50ZXJw
cmV0ZWQgdGhlIHdpcmluZw0KbW9kZSByZXByZXNlbnRlZCBieSBBVE1FTF9MQ0RDX1dJUklOR19C
R1IgYXMgJ0JSRycgaW4gdGhlIGFycmF5DQphdG1lbF9sY2RmYl93aXJpbmdfbW9kZXMuIENvbnNp
ZGVyaW5nIGNvbnZlbnRpb25hbCBjb2xvciByZXByZXNlbnRhdGlvbiwNCndvdWxkIGl0IGJlIGFw
cHJvcHJpYXRlIHRvIGNvbnNpZGVyIG1vZGlmeWluZyB0aGUgZXhpc3RpbmcgZHJpdmVyIHRvIHVz
ZQ0KdGhlICdCR1InIHN0cmluZyBpbnN0ZWFkIG9mICdCUkcnIGZvciBiZXR0ZXIgYWxpZ25tZW50
IHdpdGggc3RhbmRhcmQNCm5hbWluZyBjb252ZW50aW9ucz8NCg0Kc3RhdGljIGNvbnN0IGNoYXIg
KmF0bWVsX2xjZGZiX3dpcmluZ19tb2Rlc1tdID0gew0KICAgICAgICAgW0FUTUVMX0xDRENfV0lS
SU5HX0JHUl0gPSAiQlJHIiwNCiAgICAgICAgIFtBVE1FTF9MQ0RDX1dJUklOR19SR0JdID0gIlJH
QiIsDQp9Ow0KDQoNCj4gDQo+IEJ1dCB3YWl0LCB0aGUgZXhhbXBsZSBzaG93cyB0aGUgdmFsdWUg
aXMgJzEnLiBUaGF0IHNob3VsZCBmYWlsIHRlc3RpbmcuDQo+IEl0IGRpZG4ndCwgYnV0IEkndmUg
bm93IGZpeGVkIHRoYXQuDQoNCkl0IHNlZW1zIGNvcnJlY3RseSBjb25maWd1cmVkIGluIG91ciBk
dHMgZmlsZXMgYnV0IGRpZG4ndCBub3RpY2VkIHRoZSANCnNhbWUgaW4gdGhlIGJpbmRpbmdzIGV4
YW1wbGUsIHRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93LCBJIHdpbGwgY29ycmVjdCANCml0IGlu
IHRoZSBuZXh0IHJldmlzaW9uLg0KDQo+IA0KPj4gKw0KPj4gKyAgYXRtZWwscG93ZXItY29udHJv
bC1ncGlvOg0KPj4gKyAgICBkZXNjcmlwdGlvbjogZ3BpbyB0byBwb3dlciBvbiBvciBvZmYgdGhl
IExDRCAoYXMgbWFueSBhcyBuZWVkZWQpDQo+IA0KPiBtYXhJdGVtczogMQ0KDQpUaGFua3MsIEkg
d2lsbCBhZGQgaXQuDQo+IA0KPj4gKw0KPj4gKyAgZGlzcGxheS10aW1pbmdzOg0KPj4gKyAgICAk
cmVmOiBwYW5lbC9kaXNwbGF5LXRpbWluZ3MueWFtbCMNCj4+ICsNCj4+ICtyZXF1aXJlZDoNCj4+
ICsgIC0gYXRtZWwsZG1hY29uDQo+PiArICAtIGF0bWVsLGxjZGNvbjINCj4+ICsgIC0gYXRtZWws
Z3VhcmQtdGltZQ0KPj4gKyAgLSBiaXRzLXBlci1waXhlbA0KPj4gKw0KPj4gK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPj4gKw0KPj4gK2V4YW1wbGVzOg0KPj4gKyAgLSB8DQo+PiArICAg
IGRpc3BsYXk6IHBhbmVsIHsNCj4+ICsgICAgICBiaXRzLXBlci1waXhlbCA9IDwzMj47DQo+PiAr
ICAgICAgYXRtZWwsbGNkY29uLWJhY2tsaWdodDsNCj4+ICsgICAgICBhdG1lbCxkbWFjb24gPSA8
MHgxPjsNCj4+ICsgICAgICBhdG1lbCxsY2Rjb24yID0gPDB4ODAwMDgwMDI+Ow0KPj4gKyAgICAg
IGF0bWVsLGd1YXJkLXRpbWUgPSA8OT47DQo+PiArICAgICAgYXRtZWwsbGNkLXdpcmluZy1tb2Rl
ID0gPDE+Ow0KPj4gKw0KPj4gKyAgICAgIGRpc3BsYXktdGltaW5ncyB7DQo+PiArICAgICAgICBu
YXRpdmUtbW9kZSA9IDwmdGltaW5nMD47DQo+PiArICAgICAgICB0aW1pbmcwOiB0aW1pbmcwIHsN
Cj4+ICsgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDkwMDAwMDA+Ow0KPj4gKyAgICAgICAg
ICBoYWN0aXZlID0gPDQ4MD47DQo+PiArICAgICAgICAgIHZhY3RpdmUgPSA8MjcyPjsNCj4+ICsg
ICAgICAgICAgaGJhY2stcG9yY2ggPSA8MT47DQo+PiArICAgICAgICAgIGhmcm9udC1wb3JjaCA9
IDwxPjsNCj4+ICsgICAgICAgICAgdmJhY2stcG9yY2ggPSA8NDA+Ow0KPj4gKyAgICAgICAgICB2
ZnJvbnQtcG9yY2ggPSA8MT47DQo+PiArICAgICAgICAgIGhzeW5jLWxlbiA9IDw0NT47DQo+PiAr
ICAgICAgICAgIHZzeW5jLWxlbiA9IDwxPjsNCj4+ICsgICAgICAgIH07DQo+PiArICAgICAgfTsN
Cj4+ICsgICAgfTsNCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBCLg0KDQo=
