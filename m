Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9CE22B6E
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 07:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C50D89024;
	Mon, 20 May 2019 05:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E01789024
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 05:50:54 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4736.eurprd08.prod.outlook.com (10.255.112.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 20 May 2019 05:50:51 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 05:50:51 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v1 2/2] drm/komeda: Enable color-encoding (YUV format)
 support
Thread-Topic: [PATCH v1 2/2] drm/komeda: Enable color-encoding (YUV format)
 support
Thread-Index: AQHVDs/7vFgM5dRw00SFo47Uai6Ylg==
Date: Mon, 20 May 2019 05:50:51 +0000
Message-ID: <20190520055045.GB2308@james-ThinkStation-P300>
References: <1557987170-24032-1-git-send-email-lowry.li@arm.com>
 <1557987170-24032-3-git-send-email-lowry.li@arm.com>
In-Reply-To: <1557987170-24032-3-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c93503e3-f3f4-4c91-846c-08d6dce71d8e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4736; 
x-ms-traffictypediagnostic: VE1PR08MB4736:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB47367A85DA85E36F77641C77B3060@VE1PR08MB4736.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(376002)(396003)(39860400002)(346002)(136003)(366004)(189003)(199004)(386003)(14454004)(4326008)(1076003)(66446008)(6506007)(2906002)(6862004)(5660300002)(25786009)(66476007)(6636002)(58126008)(52116002)(76176011)(64756008)(33656002)(26005)(6116002)(102836004)(55236004)(73956011)(66066001)(66556008)(54906003)(99286004)(66946007)(68736007)(3846002)(186003)(11346002)(6512007)(33716001)(446003)(86362001)(486006)(316002)(476003)(229853002)(6436002)(256004)(71190400001)(81156014)(8936002)(478600001)(7736002)(305945005)(9686003)(14444005)(71200400001)(6246003)(6486002)(81166006)(53936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4736;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E2hz8Br/2fAeh1qlhziq3aJikycHy5hjPNU/x740KSWvQY8Sr78mIpuZqCNLFTZ0paSTuB4pMouhhdg8xy4+GNLwUQowk7/nFKngDFCKwplqFUjeZlGFxn65LpOqndoR939d7MEvMGBELfOrSzkAnXjhDteqBOkEHSkl+z+EBtLFF54bd0n+DvE8cF/Ou7mUW73kK8i3DN9+hNyXfH+IQqnpmrDhaSZHr83wZRATRK1lKCgI+BIs1EYcnpilYx3tj+gXmwg5bztmruqoGxnoGdThnAP7GeXKLRl0dOZnNhg2Ke7uEUhY+sR6elmCcwy7gcAQgOCDDvmD5HauJ4LI0uzo5GSfzQpAIb4Dr+mb6HCgo0rtAoZwr6jADxeeaTR+etloYkshlZxdkXs+wgyYaVRTjPdRw54AbGGVB2Cd4us=
Content-ID: <D37877883B0AAD4F9EAF426F1E9DDAEB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93503e3-f3f4-4c91-846c-08d6dce71d8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 05:50:51.3507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlRklOFJ9ctjy9xcn/4SSyiX5hPBiZwEO6F0Zb4isrQ=;
 b=LTb/hl0xZ8x+NpkaGDKDdE9tG8NEEkA9v1Bgm7pr0FZEt61Ng1ufYUiDClwMHs65JttSXwaO3YDwtWkp3Yr8l1FmncxVVfjANFbsC+58cY90Lw356O2zHRg3uG3cFz77qSxDHzeyl+O/zyZ199BZ5El+FF95QM//9xJ1TZNq4Xg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDI6MTM6MTNQTSArMDgwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBBZGRzIGNvbG9yLWVuY29kaW5nIHByb3BlcnRpZXMg
aWYgbGF5ZXIgY2FuIHN1cHBvcnQgWVVWIGZvcm1hdC4KPiBVcGRhdGVzIEhXIFlVVi1SR0IgbWF0
cml4IHN0YXRlIGFjY29yZGluZyB0byB0aGUgY29sb3ItZW5jb2RpbmcKPiBwcm9wZXJ0aWVzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5
LmxpQGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
TWFrZWZpbGUgICAgICAgIHwgIDEgKwo+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
ZDcxL2Q3MV9jb21wb25lbnQuYyB8ICA2ICsrCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfY29sb3JfbWdtdC5jIHwgNjcgKysrKysrKysrKysrKysrKysrKysrKwo+ICAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaCB8IDE3ICsr
KysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5j
ICB8IDEzICsrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlCj4gaW5kZXggZDdlMjlmYy4uNzNiOGU4YiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQo+IEBAIC04
LDYgKzgsNyBAQCBrb21lZGEteSA6PSBcCj4gIAlrb21lZGFfZHJ2Lm8gXAo+ICAJa29tZWRhX2Rl
di5vIFwKPiAgCWtvbWVkYV9mb3JtYXRfY2Fwcy5vIFwKPiArCWtvbWVkYV9jb2xvcl9tZ210Lm8g
XAo+ICAJa29tZWRhX3BpcGVsaW5lLm8gXAo+ICAJa29tZWRhX3BpcGVsaW5lX3N0YXRlLm8gXAo+
ICAJa29tZWRhX2ZyYW1lYnVmZmVyLm8gXAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiBpbmRleCBkZmM3MGY1Li5i
ODU1MTRiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
ZDcxL2Q3MV9jb21wb25lbnQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IEBAIC0xMCw2ICsxMCw3IEBACj4gICNpbmNsdWRl
ICJrb21lZGFfa21zLmgiCj4gICNpbmNsdWRlICJtYWxpZHBfaW8uaCIKPiAgI2luY2x1ZGUgImtv
bWVkYV9mcmFtZWJ1ZmZlci5oIgo+ICsjaW5jbHVkZSAia29tZWRhX2NvbG9yX21nbXQuaCIKPiAg
Cj4gIHN0YXRpYyB2b2lkIGdldF9yZXNvdXJjZXNfaWQodTMyIGh3X2lkLCB1MzIgKnBpcGVfaWQs
IHUzMiAqY29tcF9pZCkKPiAgewo+IEBAIC0yMzksNiArMjQwLDExIEBAIHN0YXRpYyB2b2lkIGQ3
MV9sYXllcl91cGRhdGUoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsCj4gIAkJfQo+ICAKPiAg
CQltYWxpZHBfd3JpdGUzMihyZWcsIExBWUVSX1JfQ09OVFJPTCwgdXBzYW1wbGluZyk7Cj4gKwkJ
bWFsaWRwX3dyaXRlX2dyb3VwKHJlZywgTEFZRVJfWVVWX1JHQl9DT0VGRjAsCj4gKwkJCQkgICBL
T01FREFfTl9ZVVYyUkdCX0NPRUZGUywKPiArCQkJCSAgIGtvbWVkYV9zZWxlY3RfeXV2MnJnYl9j
b2VmZnMoCj4gKwkJCQkJcGxhbmVfc3QtPmNvbG9yX2VuY29kaW5nLAo+ICsJCQkJCXBsYW5lX3N0
LT5jb2xvcl9yYW5nZSkpOwo+ICAJfQo+ICAKPiAgCW1hbGlkcF93cml0ZTMyKHJlZywgTEFZRVJf
Rk1ULCBrZmItPmZvcm1hdF9jYXBzLT5od19pZCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYwo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uOWQxNGE5Mgo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMK
PiBAQCAtMCwwICsxLDY3IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4gKy8qCj4gKyAqIChDKSBDT1BZUklHSFQgMjAxOSBBUk0gTGltaXRlZC4gQWxsIHJpZ2h0cyBy
ZXNlcnZlZC4KPiArICogQXV0aG9yOiBKYW1lcy5RaWFuLldhbmcgPGphbWVzLnFpYW4ud2FuZ0Bh
cm0uY29tPgo+ICsgKgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlICJrb21lZGFfY29sb3JfbWdtdC5o
Igo+ICsKPiArLyogMTBiaXQgcHJlY2lzaW9uIFlVVjJSR0IgbWF0cml4ICovCj4gK3N0YXRpYyBj
b25zdCBzMzIgeXV2MnJnYl9idDYwMV9uYXJyb3dbS09NRURBX05fWVVWMlJHQl9DT0VGRlNdID0g
ewo+ICsJMTE5MiwgICAgMCwgMTYzNCwKPiArCTExOTIsIC00MDEsIC04MzIsCj4gKwkxMTkyLCAy
MDY2LCAgICAwLAo+ICsJICA2NCwgIDUxMiwgIDUxMgo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0
IHMzMiB5dXYycmdiX2J0NjAxX3dpZGVbS09NRURBX05fWVVWMlJHQl9DT0VGRlNdID0gewo+ICsJ
MTAyNCwgICAgMCwgMTQzNiwKPiArCTEwMjQsIC0zNTIsIC03MzEsCj4gKwkxMDI0LCAxODE1LCAg
ICAwLAo+ICsJICAgMCwgIDUxMiwgIDUxMgo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHMzMiB5
dXYycmdiX2J0NzA5X25hcnJvd1tLT01FREFfTl9ZVVYyUkdCX0NPRUZGU10gPSB7Cj4gKwkxMTky
LCAgICAwLCAxODM2LAo+ICsJMTE5MiwgLTIxOCwgLTU0NiwKPiArCTExOTIsIDIxNjMsICAgIDAs
Cj4gKwkgIDY0LCAgNTEyLCAgNTEyCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3QgczMyIHl1djJy
Z2JfYnQ3MDlfd2lkZVtLT01FREFfTl9ZVVYyUkdCX0NPRUZGU10gPSB7Cj4gKwkxMDI0LCAgICAw
LCAxNjEzLAo+ICsJMTAyNCwgLTE5MiwgLTQ3OSwKPiArCTEwMjQsIDE5MDAsICAgIDAsCj4gKwkg
ICAwLCAgNTEyLCAgNTEyCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3QgczMyIHl1djJyZ2JfYnQy
MDIwW0tPTUVEQV9OX1lVVjJSR0JfQ09FRkZTXSA9IHsKPiArCTEwMjQsICAgIDAsIDE0NzYsCj4g
KwkxMDI0LCAtMTY1LCAtNTcyLAo+ICsJMTAyNCwgMTg4NCwgICAgMCwKPiArCSAgIDAsICA1MTIs
ICA1MTIKPiArfTsKPiArCj4gK2NvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZm
cyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSkKPiArewo+ICsJYm9vbCBuYXJy
b3cgPSBjb2xvcl9yYW5nZSA9PSBEUk1fQ09MT1JfWUNCQ1JfTElNSVRFRF9SQU5HRTsKPiArCWNv
bnN0IHMzMiAqY29lZmZzOwo+ICsKPiArCXN3aXRjaCAoY29sb3JfZW5jb2RpbmcpIHsKPiArCWNh
c2UgRFJNX0NPTE9SX1lDQkNSX0JUNzA5Ogo+ICsJCWNvZWZmcyA9IG5hcnJvdyA/IHl1djJyZ2Jf
YnQ3MDlfbmFycm93IDogeXV2MnJnYl9idDcwOV93aWRlOwo+ICsJCWJyZWFrOwo+ICsJY2FzZSBE
Uk1fQ09MT1JfWUNCQ1JfQlQ2MDE6Cj4gKwkJY29lZmZzID0gbmFycm93ID8geXV2MnJnYl9idDYw
MV9uYXJyb3cgOiB5dXYycmdiX2J0NjAxX3dpZGU7Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIERSTV9D
T0xPUl9ZQ0JDUl9CVDIwMjA6Cj4gKwkJY29lZmZzID0geXV2MnJnYl9idDIwMjA7Cj4gKwkJYnJl
YWs7Cj4gKwlkZWZhdWx0Ogo+ICsJCWNvZWZmcyA9IE5VTEw7Cj4gKwkJYnJlYWs7Cj4gKwl9Cj4g
Kwo+ICsJcmV0dXJuIGNvZWZmczsKPiArfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAuLmEyZGYyMTgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCj4gQEAg
LTAsMCArMSwxNyBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+
ICsvKgo+ICsgKiAoQykgQ09QWVJJR0hUIDIwMTkgQVJNIExpbWl0ZWQuIEFsbCByaWdodHMgcmVz
ZXJ2ZWQuCj4gKyAqIEF1dGhvcjogSmFtZXMuUWlhbi5XYW5nIDxqYW1lcy5xaWFuLndhbmdAYXJt
LmNvbT4KPiArICoKPiArICovCj4gKwo+ICsjaWZuZGVmIF9LT01FREFfQ09MT1JfTUdNVF9IXwo+
ICsjZGVmaW5lIF9LT01FREFfQ09MT1JfTUdNVF9IXwo+ICsKPiArI2luY2x1ZGUgPGRybS9kcm1f
Y29sb3JfbWdtdC5oPgo+ICsKPiArI2RlZmluZSBLT01FREFfTl9ZVVYyUkdCX0NPRUZGUwkJMTIK
PiArCj4gK2NvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3Jf
ZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSk7Cj4gKwo+ICsjZW5kaWYKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiBpbmRleCBmMzQ0
MDQ4Li5iY2YzMGE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BsYW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gQEAgLTEzNSw2ICsxMzUsOCBAQCBzdGF0aWMgdm9pZCBr
b21lZGFfcGxhbmVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gIAkJc3RhdGUtPmJh
c2UucGl4ZWxfYmxlbmRfbW9kZSA9IERSTV9NT0RFX0JMRU5EX1BSRU1VTFRJOwo+ICAJCXN0YXRl
LT5iYXNlLmFscGhhID0gRFJNX0JMRU5EX0FMUEhBX09QQVFVRTsKPiAgCQlzdGF0ZS0+YmFzZS56
cG9zID0ga3BsYW5lLT5sYXllci0+YmFzZS5pZDsKPiArCQlzdGF0ZS0+YmFzZS5jb2xvcl9lbmNv
ZGluZyA9IERSTV9DT0xPUl9ZQ0JDUl9CVDYwMTsKPiArCQlzdGF0ZS0+YmFzZS5jb2xvcl9yYW5n
ZSA9IERSTV9DT0xPUl9ZQ0JDUl9MSU1JVEVEX1JBTkdFOwo+ICAJCXBsYW5lLT5zdGF0ZSA9ICZz
dGF0ZS0+YmFzZTsKPiAgCQlwbGFuZS0+c3RhdGUtPnBsYW5lID0gcGxhbmU7Cj4gIAl9Cj4gQEAg
LTMzMCw2ICszMzIsMTcgQEAgc3RhdGljIGludCBrb21lZGFfcGxhbmVfYWRkKHN0cnVjdCBrb21l
ZGFfa21zX2RldiAqa21zLAo+ICAJaWYgKGVycikKPiAgCQlnb3RvIGNsZWFudXA7Cj4gIAo+ICsJ
ZXJyID0gZHJtX3BsYW5lX2NyZWF0ZV9jb2xvcl9wcm9wZXJ0aWVzKHBsYW5lLAo+ICsJCQlCSVQo
RFJNX0NPTE9SX1lDQkNSX0JUNjAxKSB8Cj4gKwkJCUJJVChEUk1fQ09MT1JfWUNCQ1JfQlQ3MDkp
IHwKPiArCQkJQklUKERSTV9DT0xPUl9ZQ0JDUl9CVDIwMjApLAo+ICsJCQlCSVQoRFJNX0NPTE9S
X1lDQkNSX0xJTUlURURfUkFOR0UpIHwKPiArCQkJQklUKERSTV9DT0xPUl9ZQ0JDUl9GVUxMX1JB
TkdFKSwKPiArCQkJRFJNX0NPTE9SX1lDQkNSX0JUNjAxLAo+ICsJCQlEUk1fQ09MT1JfWUNCQ1Jf
TElNSVRFRF9SQU5HRSk7Cj4gKwlpZiAoZXJyKQo+ICsJCWdvdG8gY2xlYW51cDsKPiArCj4gIAly
ZXR1cm4gMDsKPiAgY2xlYW51cDoKPiAgCWtvbWVkYV9wbGFuZV9kZXN0cm95KHBsYW5lKTsKPiAt
LSAKPiAxLjkuMQo+IAogClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9s
b2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgpMb29rcyBnb29kIHRvIG1lCgpU
aGFuayB5b3UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
