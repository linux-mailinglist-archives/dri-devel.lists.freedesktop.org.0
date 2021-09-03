Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF63FFAE4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 09:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB656E095;
	Fri,  3 Sep 2021 07:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459D56E095;
 Fri,  3 Sep 2021 07:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgeZW1wvZt4wgnNDqiH7E0VEMRjSECCDex3xXzp5e0e88PSEReqb3AUYDzG5cpR/BwpRCdK126mPTQPYODEg5JTKv/ATqFI7wh0rl+rQYopmIIxsMGxJzHIZB2J7I7a7I2OfVMlf4Gsxgd1jAvlX+dE9uD/j17F+8yzZHGu8w7GqIutMGba0AEyCDsF9TvYuWACtApa1NYBcgAHElCSwBpCIu61QoMB1vFgm9v2TGbYydX+LZ8gJJ2/NpjK1rvin6skrC7VwaTrxEw/mnVEroI8/lE2yftnhJOOhm43kVAecb1YlvWfH5Ublujz5R2OLkTxkzO3wlccgD3GW7HP37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5vlxC8+vgGF8XyqonrBmCO0juF0XCl3UMUHMuZNaiJk=;
 b=WLr9dtmETmRHfLYjFkM7FusrV6xj8RtHR6QdoXf8eaK4PxghdERWuXc3SeX2jrxo7LkQeanhqdaUSo+Nh82m1DrDVpkfaq9hNeiLmlVk7jAjIxW1GbwmorCaQsOrQQKmTQx+EY6UI62CrnW/E+d/3AanEv7q1ZAmqc6jGI7uS1AQ5YbRRQZZBoX6s9giYOMphfayavmFF/2pXverZOdlc0c7h7hX9GuD4V/XTw8YFRvZsBRn1q2J8lqfw5RpjIHmp03Rod0csL+K23kycRoUNODZ5ghlDOyVKOF8AxunUaHeoWyQ28yZOEWNbO+lJVj6bCAwxhj9jPbTAWMUPhEgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vlxC8+vgGF8XyqonrBmCO0juF0XCl3UMUHMuZNaiJk=;
 b=fxgh6gFQyg/MZAkrZmRsRVcmEFd/ZQH5Jg2w3Pwv8MBiY99Nm0cL4ECG8wPnXDSJC5ePfH4QncIjBexxDEmrREZLUNR/rN9lpdyVP97ozD+osc6VuYPJVc2HAS2s0uDWrORoYIArlsD8yh9LlnfwKi3WanY4KlWRvZp0+Oy9g0k=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5102.namprd12.prod.outlook.com (2603:10b6:5:391::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17; Fri, 3 Sep 2021 07:15:33 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca%9]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 07:15:33 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, amd-gfx
 <amd-gfx-bounces@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
Thread-Topic: [PATCH 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
Thread-Index: AQHXoI/nSfVQHdsoy0mdoJw6k5ntZKuR4sKAgACJMoA=
Date: Fri, 3 Sep 2021 07:15:33 +0000
Message-ID: <866A4D9E-18AB-4FF0-9437-E4E47A518BD9@amd.com>
References: <88539BB5-333A-4019-A411-D09859291404@amd.com>
 <627484d5-3cfc-5ac2-125d-5a902c852222@amd.com>
In-Reply-To: <627484d5-3cfc-5ac2-125d-5a902c852222@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.1f.0.191110
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 441d0ee9-bed8-461e-7981-08d96eaa9ee4
x-ms-traffictypediagnostic: DM4PR12MB5102:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5102869D029437A574F8C22087CF9@DM4PR12MB5102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:231;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IqMTQxQY98JJ8RJISkhpzyLXj11J4l0XAMET/TizIrcu5LGB0Q6Hhk0emPYz4tI4J9luMTDw54DuSJH/rXX0WxCQK0i+y/h8pkvdvRAu+jwluq/ovLWFrgk5jthdpsqNY7yrM24OAnTHSmvxgaFsErtgnd+YIoQnqT/Pxu9iTYeWiryOrQOGuncwFTZIfvCh1abmjidmjoNnyTPlVM+nI5amdaX8EpUfGCsTw9QMPvfJ31fAB85QUlqlsPRbomwlJxJo9szmgHBzFNXnTdg4klymnauynUId4ljiN4ra5dgrYMYpddSb19aQx2q+XEPkjynxt423cJkxdvlBsH9mWwwurfsw+S84NmZn8DMUD0eOCo2nIfr5wIB7jDwLDfXSPEXVWvQ9KYlkCtflhvOLzUrbhry+6964Ox4ZwUyl5xVsEQBS6OWhZ7w+/bJjZnYcuzHxVTContnniCiulIn0phLMUzP3MqJe+PD+D1mfNsVuxvBMa4J6cU/d9HnOKrf0VawNyu0qawjobD46aj4py+tDQx0RqTZ9jJnJ1+vScuhF6DmKbDlZvKhl0zbpX339DECG0vxladNUtvSaWPkFFb4NhcastcFPBfI//c0ChBDnSmFfNwDflgryZJ6v6NVKzdT5K07cxdmD+ihb5WFvnb/lgyx1DCpkqmINrHxnJAB4Uu/JJVvtIMfQGF3enco9d4PGJpp4rDMknPyoMx6+GSNOuI4ZCucB6IfLFYtyOPw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(66476007)(76116006)(91956017)(316002)(86362001)(38070700005)(66946007)(66556008)(2616005)(8676002)(66446008)(186003)(38100700002)(64756008)(6486002)(122000001)(508600001)(6506007)(71200400001)(36756003)(54906003)(110136005)(2906002)(83380400001)(26005)(33656002)(4326008)(6512007)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1AyQlNGdWEzOU9VSE5WYmtNUllnYnVPbkRhNGJIb25tSnZWbUd0K0ZnQTZB?=
 =?utf-8?B?b2QvZUFxcDV3bUxhVUtreUREVTQvVko5REdFOWVsWEx5VHBiY01Ncis0R05Z?=
 =?utf-8?B?aGlzajBFdG9JVVVLYnJIdmt6TVZ1Sm42bGtlYkdRUXR2MFE3ZU1oaHZIUXl6?=
 =?utf-8?B?VVFzckFQemM5QXJuL3pCa0ttaGxyd3RwbUpmUUc5TThRWEZiZHNJaVQycU9k?=
 =?utf-8?B?N2NsQWI1UTVJK1YvNkNKQmtaaVRybjI2UjFZZkppNlB5dUFCdW41RmtNZDZW?=
 =?utf-8?B?anI3czRNOEVMdVU1QnRYS1hLcjA1cEhkQ0g0ODJRN3h1TkVrSDJZMzdsdW5s?=
 =?utf-8?B?Q3VEN2ZSQTV4N3FwMzlWaHVwUHZZZCtJVkRRSVlyS2Izc2NEdFEvMy9GNHJj?=
 =?utf-8?B?VHNJNFZ6czN4OXdpL3B3cXFLU2Y4VGowbUpsRkFMU2NIOFk2cm9XMjFqdHZP?=
 =?utf-8?B?QVBPMSs4OXZ0Z2syZ0lNbUQvbmwvYlU1NVRXdVIrdmNLVnhGUXowVEFxYmFy?=
 =?utf-8?B?ZWZTUTRGNUExUS9kd09BVmNJSFoxc05UTGprMFJsRVNiZVhNRGR4WlRqYVVr?=
 =?utf-8?B?R3BuVHMwZWJpc2tFMmw2ZnRyQy9oSEtMcXhFL3dORGJzeG0wZTVXdW1ORTdQ?=
 =?utf-8?B?dzJHeWkvb1JjN3E5N0FCbUVrQXVtdWtDc3RmRWUxK092MDlwWU55c1Zqampt?=
 =?utf-8?B?OVhxZjdxaFpiWlRiR2k0Ym1qTTd5RUMwL3V5ZGFjZXhtZk42Yk95WVFWK0ti?=
 =?utf-8?B?UXpWUUlXWEdrMzBzbWtWQ2JOd1FtaTBMVUxOdVVaRXlibmtmMG9CT1c3K0sx?=
 =?utf-8?B?Q2dWMjByR21nSFdQaFdvOEJWbWMwdjl3WVN4RktLRnM1YmNLRzdRS3dKUGhl?=
 =?utf-8?B?SVNqbTViVzFHTk9xbkNzYlY4K2R2VTZkbENvWkEzNUt2ZklCMkU0cWF3Ullv?=
 =?utf-8?B?ek5QZFMzTnoxWjNLZTB2OUFtM09DNGdoSzBrNmVTekxOMXdUTUVuQm5KcWti?=
 =?utf-8?B?VTNDbTlNVStRS01jRVdJM2xjSzBobUVPVFFXbXNKQkJ4c1R5ZjdWYjlWa0hU?=
 =?utf-8?B?bnRRNXBDVzlDYzR2RkRRNFlPV2JLRlJlUG0vc1FrMXdqQzVrMU51MlZDNVhs?=
 =?utf-8?B?V1h4UXVqOStxWDlsWUdHN0JteHFjcmp6aStWT3Q1a21PZkErdXlyYjdqaGV0?=
 =?utf-8?B?OVNOWUIrSDBEblBobytoN2RaS1REYW9FNUxUZ3VEL1hiWVQzNGtoYlVLZy9R?=
 =?utf-8?B?QndPUkV3WEJWb2tDWWF3VmF2UmNZL2tOOThJdGxvci9kSGR0T2NDSjZ2VHQr?=
 =?utf-8?B?RStUcVNRaGxmc1Y2a3FBbDhSb01Ma2VNaWppMXhUNGNmMjZDSHVRblR2ODc3?=
 =?utf-8?B?NkhNOGdVNi9DcEFOL2d3d0tic3ZOWE12V2hQQ3Zrd0prak5CVTJqclZzTW9L?=
 =?utf-8?B?UzFBQ1NJalJxYnBkUTNmSi9SOGhtTlFYVFYrSmdMaHEzWk9MaW9OMjZvOTRw?=
 =?utf-8?B?S0UrRXl5ZUh3Qk4rRVlxSHlTdlRxVGJxNDV4MEFYcmJ1UC9lZDBEbDhaTGs3?=
 =?utf-8?B?R1ZFVzZreWtVUHNHckxqQlhjU0dkaW5nZjBZaXBuaGpDWnpXWlh1bW04U2Qw?=
 =?utf-8?B?bWZIMkk1WGd0RHFtWnVmNWEwV0ZLdlJsZkxyVW5kL2M3dXBaQUw2aWNieXBp?=
 =?utf-8?B?U3hydURLZzkyNXYrdnNNUi9rZHMydTZXbjZSUWVrNENYbWYybDVrVytqUXlS?=
 =?utf-8?B?c0NITGZJYXlaMmFheks4K25vRXNqTEl5eFZ3ZlVzeDJ4cVJpNisvVlB6RkMy?=
 =?utf-8?B?RlZicnhuOGs2OG9xU01lQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <066FF0635C82D048BC5D6CCB1ADF6B70@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441d0ee9-bed8-461e-7981-08d96eaa9ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2021 07:15:33.7879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 06amE1qG8Dq6g7P/X6y58Oa2SSB6nHQ1HVdA5r52IbVe0sBgBAo6CZ+V40EpSZYR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5102
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

DQoNCu+7v+WcqCAyMDIxLzkvMyAxNTowNO+8jOKAnEtvZW5pZywgQ2hyaXN0aWFu4oCdPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT4g5YaZ5YWlOg0KDQogICAgQW0gMDMuMDkuMjEgdW0gMDg6NDkg
c2NocmllYiBQYW4sIFhpbmh1aToNCiAgICA+IExpa2UgdmNlL3ZjbiBkb2VzLCB2aXNpYmxlIFZS
QU0gaXMgb2sgZm9yIGliIHRlc3QuDQogICAgPiBBbmQgaW4gaWIgdGVzdCBzdGFnZSwgVlJBTSBp
cyBzdWZmaWNpZW50Lg0KICAgIA0KICAgIE5BSywgdGhhdCB3b24ndCB3b3JrIGZvciBvbGRlciBo
dyBnZW5lcmF0aW9ucyAoZS5nLiBTSSwgbWF5YmUgQ0lLIGFzIA0KICAgIHdlbGwpIHdoZXJlIHRo
ZSBJQnMgbXVzdCBiZSBpbiBhIHNwZWNpZmljIEdUVCBoYXJkd2FyZSB3aW5kb3cuDQogICAgDQog
ICAgQ2hyaXN0aWFuLg0KICANCk5vdCBoYXMgb2xkZXIgSFcgb24gaGFuZCBmb3IgdGVzdC4NCkJ1
dCB0aGUgdXZkIGNvZGUgc2F5cyBiZWxvdy4gTG9va3MgbGlrZSBJQnMgc2hvdWxkIGJlIGluIHNw
ZWNpZmljIFZSQU0gcmFuZ2VbMCAtIDI1Nk1CXT8NCiAgICAgICAgaWYgKCFyaW5nLT5hZGV2LT51
dmQuYWRkcmVzc182NF9iaXQpIHsNCiAgICAgICAgICAgICAgICBzdHJ1Y3QgdHRtX29wZXJhdGlv
bl9jdHggY3R4ID0geyB0cnVlLCBmYWxzZSB9Ow0KDQogICAgICAgICAgICAgICAgYW1kZ3B1X2Jv
X3BsYWNlbWVudF9mcm9tX2RvbWFpbihibywgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSk7DQogICAg
ICAgICAgICAgICAgYW1kZ3B1X3V2ZF9mb3JjZV9pbnRvX3V2ZF9zZWdtZW50KGJvKTsNCiAgICAg
ICAgICAgICAgICByID0gdHRtX2JvX3ZhbGlkYXRlKCZiby0+dGJvLCAmYm8tPnBsYWNlbWVudCwg
JmN0eCk7DQogICAgICAgICAgICAgICAgaWYgKHIpDQogICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIGVycjsgDQogICAgICAgIH0NCiAgDQogICAgPg0KICAgID4gU2lnbmVkLW9mZi1ieTogeGlu
aHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPg0KICAgID4gLS0tDQogICAgPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYyB8IDQgKystLQ0KICAgID4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KICAgID4NCiAgICA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMNCiAgICA+IGluZGV4IGQ0NTFjMzU5
NjA2YS4uMWMwOTliNzlkMTJjIDEwMDY0NA0KICAgID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3V2ZC5jDQogICAgPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdXZkLmMNCiAgICA+IEBAIC0xMTc4LDcgKzExNzgsNyBAQCBpbnQgYW1kZ3B1
X3V2ZF9nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhh
bmRsZSwNCiAgICA+ICAgCWludCByLCBpOw0KICAgID4gICANCiAgICA+ICAgCXIgPSBhbWRncHVf
Ym9fY3JlYXRlX3Jlc2VydmVkKGFkZXYsIDEwMjQsIFBBR0VfU0laRSwNCiAgICA+IC0JCQkJICAg
ICAgQU1ER1BVX0dFTV9ET01BSU5fR1RULA0KICAgID4gKwkJCQkgICAgICBBTURHUFVfR0VNX0RP
TUFJTl9WUkFNLA0KICAgID4gICAJCQkJICAgICAgJmJvLCBOVUxMLCAodm9pZCAqKikmbXNnKTsN
CiAgICA+ICAgCWlmIChyKQ0KICAgID4gICAJCXJldHVybiByOw0KICAgID4gQEAgLTEyMTAsNyAr
MTIxMCw3IEBAIGludCBhbWRncHVfdXZkX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZSwNCiAgICA+ICAgCWludCByLCBpOw0KICAgID4gICAN
CiAgICA+ICAgCXIgPSBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVkKGFkZXYsIDEwMjQsIFBBR0Vf
U0laRSwNCiAgICA+IC0JCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fR1RULA0KICAgID4gKwkJ
CQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLA0KICAgID4gICAJCQkJICAgICAgJmJvLCBO
VUxMLCAodm9pZCAqKikmbXNnKTsNCiAgICA+ICAgCWlmIChyKQ0KICAgID4gICAJCXJldHVybiBy
Ow0KICAgIA0KICAgIA0KDQo=
