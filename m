Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C2C2CE740
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 06:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21936E12D;
	Fri,  4 Dec 2020 05:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8D86E122;
 Fri,  4 Dec 2020 05:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZ40D2i3kWnlhwtoOe4rSnotzA152Wk983IHieehlqA2gsXzBD/VMpSpaeXFM0ywbwQleQw7uqcKwI0F1beFZYgeFiIHBPWFf99HAce1XEwUACwUOSksDByiX67t6CYVVLaxoW6eZ0hsK7U+gzaL+SZIZRQERsNb5H9dm/yuaxa9l3oA9ltZ8E9Gc5k6dOlVfGe9ZSC4sn4+mZBfpVFaGKeTAG5m75FSfrrnoR+8sqx0aNfqnODURIJbAHcyd0hAsHETjQc5sz1onqEEv6XHaeFQOXaYVrmUjUU1cFXjhounAZS89oih1xTBLmfpcc7D3V/VK2xNvE8y6MRP5iavNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qfz/p2SJMn0J4hIrCSqfY7spU8TAvbCW9g2WDwgoAIk=;
 b=L9v45AGVSG1BleTMfU1Z7TAgJgIdm5F6iR2+f7kVQDIeOLBs46sh0ipqRZ13ZoB0FVFxp4/V4xDP+12wmxjvP24ACXPzlQvpnip/2s7eHPwMeB1CKPTQRnQ3p250DlNySwzM2LmUrvGpYPfXE16e3iZn+4yY8FX4D8In6t5aP9yovmfY3DYs5gTp4VKRuklxQye3vMZYOQdz/PdYCpxJjNZ/P09zzeNwZD8xo/nU6UoMfdrmTueqkw8rT7MMJThe+7SkmRq0yioqKX124OvjYowSsgiFyNEXF80N2yZx5iHDgMT2VWvfifLD+2koG6aBhg1zpR0YSJpiuE1cPDjnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qfz/p2SJMn0J4hIrCSqfY7spU8TAvbCW9g2WDwgoAIk=;
 b=ac2ku/XCmYrL0dMvXRZbmjdjTEc8h+XaDG1knHiXbA5g2AG5pBPeu+MopLQj55OTviiPrUYfCzwhNDowmcedkjuQvAMqS127Q+qMW34FTcVKrUb5wsstPPc1WBNiQol4wSopMFzilwMdPUJ7NauKyOVD5K9cP6KoPPyB5NwANNs=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by BL0PR05MB4977.namprd05.prod.outlook.com (2603:10b6:208:37::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Fri, 4 Dec
 2020 05:06:07 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6%7]) with mapi id 15.20.3654.005; Fri, 4 Dec 2020
 05:06:06 +0000
From: Zack Rusin <zackr@vmware.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Thread-Topic: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Thread-Index: AQHWwlaG5WlZT6CPxU6T7GsrbIaTjanhMtCAgAJLGYCAAGvzgIAAE2oAgAAHUICAALlJAIAAytiAgADo8wA=
Date: Fri, 4 Dec 2020 05:06:06 +0000
Message-ID: <C6EE783E-18E4-477F-ABF7-3243DED61A85@vmware.com>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
 <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
 <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
 <FBC4840D-C1A8-4492-9E2E-D31E00B8D61A@vmware.com>
 <CAKMK7uFaCVLu9GWR0Jkvf8iXP4RdcG3TmMsLmFVDoERBOk1ZOQ@mail.gmail.com>
 <96A4A47D-4B6B-4038-B094-DD490B99C698@vmware.com>
 <20201203151221.GA401619@phenom.ffwll.local>
In-Reply-To: <20201203151221.GA401619@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79f0de58-f50c-41ad-ddc8-08d898124ead
x-ms-traffictypediagnostic: BL0PR05MB4977:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR05MB49771590EE046CEE9EB3CE65CEF10@BL0PR05MB4977.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RADlCn0mtHfWQ9XJoP9gGmHo88QrEhUDd8/Pg/IHH0jwtK1ABIBz91gkJcFVk8gzA+xvIJWxWp7U8mEfU/tCfXDBoCyPLSRhS1rw/0TVPfcVZBb7DJz3oy10OsgyRMpf3SdY7NME53ePa9Wu3j4etK+psIuo+hPx2tL8gNffUBPU/O/HZZcOGS3kad1UkvvJargCZYxBQ1nIXlnP2jn6SIWwfzkBRc4veXgQsUvxHoYodlEFCJOz5tO4D9NZvVbZ0IDy8Q+VgKFX11hNXO7N41ZQYjhcR267/28Fsfv/MSbw7y4hseni9frPnttfTbv9QDF8zscHIkbP9sN5yoe+mYWmPiscaIGCh45ESmBZ1FoWkaZb3/lnBCFswhBUGCn5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(66476007)(2616005)(83380400001)(66556008)(26005)(478600001)(66946007)(66446008)(64756008)(86362001)(54906003)(71200400001)(186003)(2906002)(76116006)(316002)(7416002)(6916009)(6512007)(53546011)(5660300002)(6486002)(8676002)(6506007)(33656002)(8936002)(4326008)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZEgrMmsrQW5xa1pyYVNVMUswK2pNZGZZcG1xdkpMSlRZWE5LOVUrdEZCWmNh?=
 =?utf-8?B?ckMzbVJiUEQ5ZDhFdHBQQmFuSVFQK3c4SG5ENjVwQVhlZWhzVUtJMGwzWGJ1?=
 =?utf-8?B?Z3FiWnMwSEo3Rmg0UkdoZHM4SmZNd3NhSUE1ZWt3cTByZ3dBNlFTd1JGaEdI?=
 =?utf-8?B?eGwyOVo4cWFJR2JnaDFBVFczay9ZRi8wTm40UUVwYyt3dVFIRmdsb1lPcEFn?=
 =?utf-8?B?WE00QWhmYjFnY2x3ZlI1RlhnVzRQNzZ4V1dwajBFdUIrb0lRSlVVUklDVytT?=
 =?utf-8?B?bW5STElOcUVOaXI0azRQZTVTbHpmbCt6cFZJVnorUHlmbWRtVHNvUVNTQk1x?=
 =?utf-8?B?dHBxRnl1eUp3VjdmSGorRllzL0VQZTFaYzlyZVNaNjE5Wkl0TjM5ejhUdWJw?=
 =?utf-8?B?OXFsdm9iYjBhemhGSVZTM21pYlc5MXRUajIxbGR2dzVtVTI4TGhFTjRrd0lU?=
 =?utf-8?B?eTUzNktYem4yWU9jck5YM1N5aVhPUEc0Ris3UWkwcWVNUnl1Y21SWTBpeERv?=
 =?utf-8?B?TGhYNEpQbVY0ZU1RMk9sRlA0aDQ4UEhxMnE3bFlSRGFEQzNnMzh6cnFMMGFk?=
 =?utf-8?B?NWoyNWdqSWdqOGFhdWxQUFBBM2c3TldralVhT2lXU2k0TVVBRXhrM0pZd3dO?=
 =?utf-8?B?clF5c0lCeXNDcmF0SnM4L0p3UzN1Y3BwSm5mUUJOV0FyalFOTTMwRjZCdWRI?=
 =?utf-8?B?UkdUaE81UUtvOVQ0NC9Ic0lNamtDOVhVZ3BRUWR4aXovdVJwWHlwZTBHZ1J5?=
 =?utf-8?B?bmRHak5JalRFSU1kVHphUm13RTRjZCtyOXlXTmovV1N1WVB4Z0FxK09xeUEw?=
 =?utf-8?B?V3RHSS9TT0g0VWdsSU9MVUl5cXMxaW1DV25TWHZ3RTZYa3hmUkU4K1dNcitl?=
 =?utf-8?B?KzBSazRtajI3VjVVNWRQYWU5QXl6dVZ1akg4SThjSHM0WlBFSitwK3NvRmNC?=
 =?utf-8?B?clFrS3ZQeTZGL1RCVVprV3BUR3ZZTVJDSG8rVjhNZVRZaUhLdko4SEM1QmVD?=
 =?utf-8?B?ZlFnTlpVeFNjRjlSb1hnUDdYSS9rcFVWZ2l2WHlUU0h0Mnd1SUlwRVpERGFk?=
 =?utf-8?B?Q0FGdHFlYmhadXYrNUZEbFVXOVFGeXdLQkkyOXFxa2RhWWI5SXg5eVJYdmxM?=
 =?utf-8?B?V0RuS0hENU8xY2hDWmpSZXNsbU4vVWxpaVVqYnJyOUtETTlXN3lmRzJ1Zzhn?=
 =?utf-8?B?Q2R5NDExTjcyK1dBbWhOV01sSHNhK3paRlREWGtVVDlKTU9TN3Vrd0lKVkhX?=
 =?utf-8?B?eXhZdEZQSUJNRVA1V2Z6VlVTcUtTdFJ2Q29JRzhnWVBvQjZjSFAxaVJSSjBs?=
 =?utf-8?Q?YhtWuh1Bue3EDhRMZlYLI9rqifKr2Gp0Mg?=
Content-ID: <637CB26065A3354A8B6C250191B94762@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f0de58-f50c-41ad-ddc8-08d898124ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 05:06:06.7966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJMh608RAclhLhXIA1nrbfSjW1m8eYbiylsKDgDbkcCrKb2j84iKPLMNXWyQdoxVjD+FoUZcJt/4Tma2pjudYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB4977
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gRGVjIDMsIDIwMjAsIGF0IDEwOjEyLCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDM6MDY6MjBBTSAr
MDAwMCwgWmFjayBSdXNpbiB3cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gRGVjIDIsIDIwMjAsIGF0
IDExOjAzLCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOg0KPj4+IA0KPj4+
IE9uIFdlZCwgRGVjIDIsIDIwMjAgYXQgNDozNyBQTSBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUu
Y29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiANCj4+Pj4+IE9uIERlYyAyLCAyMDIwLCBh
dCAwOToyNywgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0K
Pj4+Pj4gDQo+Pj4+PiBIaQ0KPj4+Pj4gDQo+Pj4+PiBBbSAwMi4xMi4yMCB1bSAwOTowMSBzY2hy
aWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4+Pj4+IEhpDQo+Pj4+Pj4gQW0gMzAuMTEuMjAgdW0g
MjE6NTkgc2NocmllYiBaYWNrIFJ1c2luOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBP
biBOb3YgMjQsIDIwMjAsIGF0IDA2OjM4LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4gd3JvdGU6DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFVzaW5nIHN0cnVjdCBkcm1fZGV2
aWNlLnBkZXYgaXMgZGVwcmVjYXRlZC4gQ29udmVydCB2bXdnZnggdG8gc3RydWN0DQo+Pj4+Pj4+
PiBkcm1fZGV2aWNlLmRldi4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPj4+Pj4+Pj4gDQo+Pj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4+Pj4+Pj4+IENjOiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4N
Cj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21k
YnVmLmMgfCAgOCArKysrLS0tLQ0KPj4+Pj4+Pj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfZHJ2LmMgICAgfCAyNyArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPj4+Pj4+Pj4gZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZmIuYyAgICAgfCAgMiArLQ0KPj4+Pj4+PiANCj4+
Pj4+Pj4gUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo+Pj4+Pj4g
Q291bGQgeW91IGFkZCB0aGlzIHBhdGNoIHRvIHRoZSB2bXdnZnggdHJlZT8NCj4+Pj4+IA0KPj4+
Pj4gQU1EIGRldnMgaW5kaWNhdGVkIHRoYXQgdGhleSdkIHByZWZlciB0byBtZXJnZSB0aGUgcGF0
Y2hzZXQgdHJvdWdoIGRybS1taXNjLW5leHQuIElmIHlvdSdyZSBPSyB3aXRoIHRoYXQsIEknZCBt
ZXJnZSB0aGUgdm13Z2Z4IHBhdGNoIHRocm91Z2ggZHJtLW1pc2MtbmV4dCBhcyB3ZWxsLg0KPj4+
PiANCj4+Pj4gU291bmRzIGdvb2QuIEnigJlsbCBtYWtlIHN1cmUgdG8gcmViYXNlIG91ciBsYXRl
c3QgcGF0Y2ggc2V0IG9uIHRvcCBvZiBpdCB3aGVuIGl04oCZcyBpbi4gVGhhbmtzIQ0KPj4+IA0K
Pj4+IGJ0dyBpZiB5b3Ugd2FudCB0byBhdm9pZCBtdWx0aS10cmVlIGNvb3JkaW5hdGlvbiBoZWFk
YWNoZXMsIHdlIGNhbg0KPj4+IGFsc28gbWFuYWdlIHZtd2dmeCBpbiBkcm0tbWlzYyBhbmQgZ2l2
ZSB5b3UgJiBSb2xhbmQgY29tbWl0IHJpZ2h0cw0KPj4+IHRoZXJlLiBVcCB0byB5b3UuIFRoZXJl
IGlzIHNvbWUgc2NyaXB0aW5nIGludm9sdmVkIGZvciBub3cgKGJ1dCBJIGhvcGUNCj4+PiB3aGVu
ZXZlciB3ZSBtb3ZlIHRvIGdpdGxhYiB3ZSBjb3VsZCBkbyB0aGUgY2hlY2tzIHNlcnZlci1zaWRl
KToNCj4+IA0KPj4gSeKAmWQgYmUgaGFwcHkgdG8gdGFrZSB5b3UgdXAgb24gdGhhdC4gSSB3b3Vs
ZCBsaWtlIHRvIG1vdmUgYSBsb3QgbW9yZSBvZg0KPj4gb3VyIGRldmVsb3BtZW50IGludG8gcHVi
bGljIHJlcG9zIGFuZCByZWR1Y2luZyB0aGUgYnVyZGVuIG9mIG1haW50YWluaW5nDQo+PiBtdWx0
aXBsZSB0cmVlcyB3b3VsZCBoZWxwLiBJcyB0aGVyZSBhIGxvdCBvZiBjaGFuZ2VzIHRvIGRybSBj
b3JlIHRoYXQNCj4+IGRvZXNu4oCZdCBnbyB0aHJvdWdoIGRybS1taXNjPyBPciBhbHRlcm5hdGl2
ZWx5IGlzIGRybS1taXNjIG9mdGVuIHB1bGxpbmcNCj4+IGZyb20gTGludXPigJkgbWFzdGVyPyBJ
4oCZbSB0cnlpbmcgdG8gZmlndXJlIG91dCBob3cgbXVjaCB3b3VsZCBvdXIgbmVlZCB0bw0KPj4g
cmViYXNlL21lcmdlIGJlIHJlZHVjZWQgaWYgd2UganVzdCB1c2VkIGRybS1taXNjLW5leHQvZHJt
LW1pc2MtZml4ZXMNCj4+IGJlY2F1c2UgdGhhdCB3b3VsZCBhbHNvIGFsbG93IG1lIHRvIHBvaW50
IHNvbWUgaW50ZXJuYWwgdGVzdGluZw0KPj4gaW5mcmFzdHJ1Y3R1cmUgYXQgaXQgYXMgd2VsbC4N
Cj4gDQo+IEkgdGhpbmsgbm93YWRheXMgcHJldHR5IG11Y2ggYWxsIHRoZSBjcm9zcy1kcml2ZXIg
d29yayBsYW5kcyB0aHJvdWdoDQo+IGRybS1taXNjLiBFeGNlcHRpb24gaXMganVzdCBuZXcgc3R1
ZmYgdGhhdCdzIG9ubHkgdXNlZCBieSBhIHNpbmdsZSBkcml2ZXIuDQo+IA0KPiBGb3IgdGVzdGlu
ZyB0aGVyZSdzIGFsc28gZHJtLXRpcCwgd2hpY2ggdHJpZXMgdG8gcHVsbCBpdCBhbGwgdG9nZXRo
ZXIgKGJ1dA0KPiB5b3UgbWlnaHQgc3RpbGwgd2FudCB0byBwb2ludCB5b3VyIENJIGF0IGJyYW5j
aGVzKS4NCj4gDQo+IEFsc28gbm90ZSB0aGF0IGRybS1taXNjLW5leHQgZG9lc24ndCBoYXZlIGEg
bWVyZ2Ugd2luZG93IGZyZWV6ZSBwZXJpb2QNCj4gKHdpdGggaGF2ZSB0aGUgZHJtLW1pc2MtbmV4
dC1maXhlcyBicmFuY2ggZHVyaW5nIHRoYXQgdGltZSBmb3IgbWVyZ2UNCj4gd2luZG93IGZpeGVz
KSwgc28geW91IGNhbiB0cmVhdCBpdCBsaWtlIGEgbWFpbiBkZXZlbG9wbWVudCBicmFuY2ggbGlr
ZQ0KPiBlLmcuIGluIG1lc2EsIHdpdGggdGhlIC1maXhlcyBicmFuY2hlcyBhcyB0aGUgcmVsZWFz
ZSBicmFuY2hlcy4gT25seQ0KPiBkaWZmZXJlbmNlIGlzIHRoYXQgd2UgZG9uJ3QgY2hlcnJ5IHBp
Y2sgcGF0Y2hlcyBmcm9tIHRoZSBtYWluIGJyYW5jaCB0bw0KPiB0aGUgcmVsZWFzZSBicmFuY2hl
cyAoYXQgbGVhc3Qgbm90IGFzIHRoZSBub3JtYWwgZmxvdykuDQo+IA0KPiBJZiB5b3UgZG8gbmVl
ZCBhIGJhY2ttZXJnZSBmb3IgcGF0Y2hlcyBmcm9tIExpbnVzIHRvIGRybS1taXNjLW5leHQgYmVj
YXVzZQ0KPiBvZiBzb21lIGZlYXR1cmUgd29yayAob3IgY29uZmxpY3RzIHdpdGggb3RoZXIgc3R1
ZmYgaW4gZ2VuZXJhbCkgZHJtLW1pc2MNCj4gbWFpbnRhaW5lcnMgZG8gdGhhdC4gVXN1YWxseSBo
YXBwZW5zIGV2ZXJ5IGZldyB3ZWVrcy4NCg0KUGVyZmVjdCwgdGhhbmtzIGEgbG90ISBUaGlzIGhh
cyBiZWVuIHNvbWV0aGluZyBJIHdhbnRlZCBvdXIgZHJpdmVyIHRvIGRvIGZvciBhIHdoaWxlLCBJ
4oCZbGwgZ28gYWhlYWQgYW5kIHN3aXRjaCBvdXIgaW50ZXJuYWwgZGV2IHRvIGRybS1taXNjLg0K
DQp6DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
