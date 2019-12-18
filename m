Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618E124D13
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 17:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E7E89D49;
	Wed, 18 Dec 2019 16:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700041.outbound.protection.outlook.com [40.107.70.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C6989D49;
 Wed, 18 Dec 2019 16:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBnQd6t9NS7xG7jjHYCXGk+cBBwhNR8wUiLECiKr9gN48DJKgoF0HPrKAQkh9jg99e4fjg/ViM/GV8TYhjfDivILLPCz/9VuGPDjRRF1mSFavNtNN0K5bqIFYcCdDXl4bUNXc9wgugc04QBu/QAHutdszeWLVT7HTY5MvVVOFoIkFO+pIVDXO43Cn+7Bow+9bx7kkEVNOcPZo5NdwZtJLCCvUJL2XzLQHRSgbfr7Bc3v/+AeyLb7vHw0MfDblX9mQG2nOmQLmqJQCU3WIA4MbSjzf6XUGRQychU9LmSCqvURNpLF05Omuooo+96gPWXMZGpNy1PUyJL84TOjlbVCFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCR6jDgi+He5xnB31HfQoTEZLdM4t4/m01Brgk41Dr4=;
 b=fusP6bG9OuZZTbp5MIahmw6x6dGu2qKhHXAf7RUZxaIKCCUwllpgiklMYdqKdtcsG6cpJFNS0L5yooe0PhCOg+M2XSinLEVeQP01UOJhoubhh0KKZV7GxdgCitW+TpwNoy9oJwsF9K62gYUh6FObLGprLy2gmWqLMPjub3NddHuS7XSb5KuqlSUebfdBgm+TSSKXHkWMcsOjwMccgzaDHzGUH2eHBSPeNtvj6GQwMAN3AvzlEtzjoSAc1avandq32iDACCR3grwCYMzQVZJ6ROImKqJLG9t0X1ZCDTKUXHGkByoGEGWi0+WAJknySvVDDzqAw32RpYgwX29zVim6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCR6jDgi+He5xnB31HfQoTEZLdM4t4/m01Brgk41Dr4=;
 b=2nDs9JZSCih86r71eLxF+FjT2gTRh5faQiVr/QzaEesmYAhEiZvlteKyTv4ANiYKqXTiQYpEwkfxzmrTrPZE8uGy+3+Iifexf8DVfszU9UGG2uXkU6F/XmvGJHGGxILT/EylaxhzogT1R1LTuHwWxqMMQQGIVyjLAOwabqBTFs0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0135.namprd12.prod.outlook.com (10.172.75.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Wed, 18 Dec 2019 16:22:25 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 16:22:25 +0000
Subject: Re: [PATCH v2 2/9] drm/amd/display: Fix compilation issue.
To: "Manna, Animesh" <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20191218151350.19579-1-animesh.manna@intel.com>
 <20191218151350.19579-3-animesh.manna@intel.com>
 <03119efd-5130-3851-5dec-bd4ef5b8cfd5@amd.com>
 <0a2bc02e-e3fa-b177-0c3b-fe7c323337a0@intel.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <660ecbbe-4a19-dd9d-fc99-002ccd64743c@amd.com>
Date: Wed, 18 Dec 2019 11:22:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
In-Reply-To: <0a2bc02e-e3fa-b177-0c3b-fe7c323337a0@intel.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::22) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YTOPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::22) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 18 Dec 2019 16:22:24 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 950960b7-6c48-4763-9678-08d783d67775
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0135:|CY4PR1201MB0135:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB013527F5DEA6601D8E367EDC8C530@CY4PR1201MB0135.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0255DF69B9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(5660300002)(316002)(186003)(53546011)(31686004)(16576012)(478600001)(2906002)(81156014)(16526019)(956004)(81166006)(36756003)(26005)(54906003)(7416002)(8676002)(31696002)(4326008)(6486002)(2616005)(66556008)(66476007)(66946007)(4001150100001)(52116002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0135;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jdvbcjX/LVCDQmd4UlFDeOi1694J1tUuA+yKq75/W7N6gohKpFGDlYekd1ufchtlXNUn7RaQmhLXy6vLpih9vTlFLWA4RT09Rh4HbxnnrZw43bTzvpJIP7p3VUunAo2ymY5IYqVT04Biq3GeCw4NvuZUEnCF5HHBrU6pVb7cw37c7L/oJzyWttPay6bnN69NecMqAV+a5U4O9zBRuXS6iGg91b8oGVftawAhEDJ7onhTzv2RlGGXE4ZtYZOVgYsQOcEvdPcbWYtzzf3VOKAfAP2VUXPgw6bPPKAttfcNUGFlFkW6B0S8ollxg0qBjH0Q9fBUZouN7bdoqPOwSmPAZeE5hq0OhK8P4LJ/gK52wC/EyMXbIkWDBzdPSPiA+LgLVsnw1odmWEdPC1Yn3Yrt54qsnosNEWmZt+VjGlQyBR928IgRPT8dPLMJLf2Od4X1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950960b7-6c48-4763-9678-08d783d67775
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2019 16:22:24.8908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBHgjJbgteebO/9w8RpFGu40mlAqo4N7E0gcht+t9lUA0gdv8Qt034h1vDbZPa45C5+Hlrs8OQiyxx1mcTEN7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0135
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com, manasi.d.navare@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMi0xOCAxMToxMyBhLm0uLCBNYW5uYSwgQW5pbWVzaCB3cm90ZToKPiAKPiBPbiAx
OC0xMi0yMDE5IDIxOjEyLCBIYXJyeSBXZW50bGFuZCB3cm90ZToKPj4gT24gMjAxOS0xMi0xOCAx
MDoxMyBhLm0uLCBBbmltZXNoIE1hbm5hIHdyb3RlOgo+Pj4gW1doeV06Cj4+PiBBbGlnaCB3aXRo
IERQIHNwZWMgd2FudGVkIHRvIGZvbGxvdyBzYW1lIG5hbWluZyBjb252ZW50aW9uLgo+Pj4KPj4+
IFtIb3ddOgo+Pj4gQ2hhbmdlZCB0aGUgbWFjcm8gbmFtZSBvZiB0aGUgZHBjZCBhZGRyZXNzIHVz
ZWQgZm9yIGdldHRpbmcgcmVxdWVzdGVkCj4+PiB0ZXN0LXBhdHRlcm4uCj4+Pgo+PiBQbGVhc2Ug
cm9sbCB0aGlzIGludG8geW91ciBwYXRjaCB0aGF0IHJlbmFtZXMgdGhlIGRlZmluaXRpb24uIEFs
bAo+PiBwYXRjaGVzIHNob3VsZCBjb21waWxlIG9uIHRoZWlyIG93bi4KPiAKPiAKPiBUaGFua3Mg
SGFycnkgZm9yIHJldmlldywgd2FudGVkIHRvIGZvbGxvdyBzaW1pbGFyIGNvbW1pdC1kZXNjcmlw
dGlvbgo+IGZvcm1hdCBmb2xsb3dlZCBpbiBhbWQtZHJpdmVyIGNvbXBhcmUgdG8gaTkxNSBhbmQg
Y3JlYXRlZCBhIHNlcGFyYXRlCj4gcGF0Y2guIE1heWJlIGlzIGl0IGdvb2QgaWRlYSB0byBjaGFu
Z2UgdGhlIHBhdGNoIHNlcXVlbmNlIGFuZCBtYWtlIGl0IGFzCj4gZmlyc3QgcGF0Y2guCj4gCgpU
aGFua3MgZm9yIGxvb2tpbmcgdG8gZm9sbG93IHRoZSBjb21taXQgc3R5bGUgZnJvbSB0aGUgcmVz
dCBvZiB0aGUgYW1kCmRyaXZlciBidXQgaW4gdGhpcyBjYXNlIHdlIG5lZWQgdG8gY29tYmluZSB0
aGVtIG9yIHlvdSdsbCBiZSBsZWZ0IHdpdGgKb25lIHBhdGNoIGluIHRoZSBzZXF1ZW5jZSB0aGF0
IHdvbid0IGJ1aWxkIG9uIGl0cyBvd24uCgpIYXJyeQoKPiBSZWdhcmRzLAo+IEFuaW1lc2gKPiAK
Pj4KPj4gVGhhbmtzLAo+PiBIYXJyeQo+Pgo+Pj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53
ZW50bGFuZEBhbWQuY29tPgo+Pj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFA
aW50ZWwuY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2RwLmMgfCAyICstCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwo+Pj4gaW5kZXggNDJhYTg4OWZkMGY1Li4x
YTYxMDliZTJmY2UgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RwLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX2xpbmtfZHAuYwo+Pj4gQEAgLTI0OTEsNyArMjQ5MSw3IEBAIHN0YXRpYyB2
b2lkCj4+PiBkcF90ZXN0X3NlbmRfcGh5X3Rlc3RfcGF0dGVybihzdHJ1Y3QgZGNfbGluayAqbGlu
aykKPj4+IMKgwqDCoMKgwqAgLyogZ2V0IHBoeSB0ZXN0IHBhdHRlcm4gYW5kIHBhdHRlcm4gcGFy
YW1ldGVycyBmcm9tIERQIHJlY2VpdmVyICovCj4+PiDCoMKgwqDCoMKgIGNvcmVfbGlua19yZWFk
X2RwY2QoCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaW5rLAo+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgRFBfVEVTVF9QSFlfUEFUVEVSTiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIERQX1BIWV9URVNUX1BBVFRFUk4sCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAmZHBjZF90ZXN0X3BhdHRlcm4ucmF3LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2l6ZW9mKGRwY2RfdGVzdF9wYXR0ZXJuKSk7Cj4+PiDCoMKgwqDCoMKgIGNvcmVfbGlua19yZWFk
X2RwY2QoCj4+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
