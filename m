Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3823CEDE3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 22:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A451D89D4B;
	Mon, 19 Jul 2021 20:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0193389872;
 Mon, 19 Jul 2021 20:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYGfd5DXDfAZtkBepJZVnlyMtGaWSSUZkeU2P5a280NXKHHsz7b0NzEnBwB7vR6+9aY8ylRF1xxIQd4lA6sQ0m1TpYO7HafiNFQFOpmPsORVXOab2skyYxa5NSPV5R+igQZrcmjC5a6BDlflOE7/p2PMVtRkx+ItY+3vMRFiDRefK6Typ5paMgSwVGBGTUn9pOo0c1H8OxB/amRGR1BD9NbEMuR4wmG/zQfR/KKmChEgVqtZneynDBAS6V5kUMtrqsoKTUS4VMIVJepnSJjqsPdAMhnPTPv8BKGZOjBuuaWIGDWmOtZIcmI8+TiINzG4e5fFWP+Abvcg/A8erL0jTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX3SQ3Or61skBf6/NfUIptE4NTvuGN0ceBJeg6YzNtA=;
 b=KlCxbxX9IlWHiOO7eiudUuVBFdPzHGA0c8os2BU17CMXGf+IGaN4BHwC3gtSypCXq565BBCh5RaYuqJSIV67Z6VveRYJfQ10WJs9xQmQWYAsUtEiXzr3/jNRXZqjPv3bCrzjZ68w4sebuVp1xMmu5G1QiRgzXdIokKXtlcuuGuWVDK3KJdkkoIbKToPJUNVcnKPIBzPEYKRNKELxusEg2/Q7ETqa+FUvzOn64PLYdqkV6EH8vZK07azUzvZwhuS8biQ04CC5/gbudtV9jXSX7QcIa0s2o1yDCNjryKhir7fZCfto0at20rt5YC2Vc0K7IjP7/oGLgqQXTv+NqRvHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX3SQ3Or61skBf6/NfUIptE4NTvuGN0ceBJeg6YzNtA=;
 b=tDC0qvMQbQEkBjFfL1x0vgNdOK5mLF2/Aj8aLAnikE2dy3AH3azPz1dRnQFEBViO4SHZD65mp25yR7RtZIrxIDks8X0rXEPChpX7zFCWknp86sTAsdarknGDPdU9K7GepfUvKtofdcaLfsEEN1cxyzBn/K+RIHnPbRyi19WCDHg=
Received: from DM4PR12MB5374.namprd12.prod.outlook.com (2603:10b6:5:39a::11)
 by DM4PR12MB5263.namprd12.prod.outlook.com (2603:10b6:5:39b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 20:47:05 +0000
Received: from DM4PR12MB5374.namprd12.prod.outlook.com
 ([fe80::6958:68e2:61a1:466f]) by DM4PR12MB5374.namprd12.prod.outlook.com
 ([fe80::6958:68e2:61a1:466f%3]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:47:05 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>, "linux-ext4@vger.kernel.org"
 <linux-ext4@vger.kernel.org>, "linux-xfs@vger.kernel.org"
 <linux-xfs@vger.kernel.org>
Subject: Re: [PATCH v4 06/13] include/linux/mm.h: helpers to check zone device
 generic type
Thread-Topic: [PATCH v4 06/13] include/linux/mm.h: helpers to check zone
 device generic type
Thread-Index: AQHXe0ER59bX/5sOz0+NLdfh5DYtsqtKhOUA
Date: Mon, 19 Jul 2021 20:47:04 +0000
Message-ID: <25BBA6FE-5134-4CF8-B0B2-BF3BE907AC38@amd.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
 <20210717192135.9030-7-alex.sierra@amd.com>
In-Reply-To: <20210717192135.9030-7-alex.sierra@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.49.21050901
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ed1e2d4-a4bc-4d9d-7485-08d94af65e26
x-ms-traffictypediagnostic: DM4PR12MB5263:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB52634722A79FB80E967DAC2680E19@DM4PR12MB5263.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YFV0xcTrVCoecCWYpEgqgxjwO0ZuFVwN/PoQuOdaVuH1sgx5za4ZLgd6bZQEn+kxFvpu9pgwOlq7Ld4GYhfLdkrs5ht8ldhfZ19/al1V6GXu6lPbLMGOB1tl+8xjPlysZpsmHnZcKMeJQcs+TF/Q1kOarCXzLPdcClGQIQI9Snv7KtkAQWqQ/RC0L9siM02RWFWJoQc+FnIMqkAo/QJrGbkJh6NfbRnRIFom6FxhQsOxxMt4z3qhVFyXyG4Buq6mwIYxJgmUqCCT7Vu+fGTqITX438aHIUSkA/n1pfgZZAR2RkSwI7oWVlf2c0GtKe+fYAH6WvsdWsua39hn5J+qhLz8W6sdthiWqjbs2lzqLiBxv4aCJolrY8jIL5t+FebGUxaj8GQST4fzr/0eKiDleI8qDT/TyCiEy2tUIQjRtiM0UhraNU09+YnCcKCDVR9VjzJ049i06gqayxnON/Uxk4U3HNdzOvANiYvx6ne3bLDubAx/SUb5vPCVxJM5DwLSbnT7DqqAuHl+lL0eBDec/PD/cJrpI+3Roeoq8U17V/+oM9YImKKXhoDr0P7A1jHMHs3suUU5YGl06B9R+kSDVGcYEqV2n7EAT4V4vefoyFc5B7fkW5C38d6TQ9jZ+8di9RSE9fFss28IpokaYskR669fhRiIy9pYSBWIWy0JnItKDLItXozMtM6TxyAbeOpXGCYkZ4AbGkTJdRqUWd6lH3TL9SRn4sXy3ArD4MrnAnqZ5zH+Kim9LebDS0PN8A3G1sUV+hPEBYNr69FYCaGb4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5374.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(71200400001)(2906002)(8936002)(122000001)(66946007)(8676002)(91956017)(76116006)(316002)(110136005)(66446008)(66476007)(66556008)(64756008)(45080400002)(2616005)(54906003)(966005)(36756003)(26005)(6506007)(6512007)(478600001)(186003)(86362001)(33656002)(7416002)(5660300002)(4326008)(6486002)(38100700002)(41533002)(45980500001)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlJ2ZWtFWHE5U0czVnY0Ym9PQm5WU2haalZhUTZSRTEraHBCWlJtaC82THhB?=
 =?utf-8?B?NWVFbDlHUGRnejFaRkc5anJWSi9xcHNmNGJsVVVLT0lRRE1FbVB1MzdxN0JV?=
 =?utf-8?B?cjNSaG51R0lNQldxL0ZzQnM3cW5BRkJFclA2NU8vSTVJVzZRc1YyL0l1emtx?=
 =?utf-8?B?RXhnNVRWcm1IakRvNkVvNGRvb2tOQTdOT3FiaFhDUVJ3VE15a0RkNXRCeG9s?=
 =?utf-8?B?V25LWGM2OXdVUElneFdxUzRZV1VCamhqZVVFdkNTTmFZSEhoejF5NkgxVVVZ?=
 =?utf-8?B?NW9ZR0NnTG5vTEhCL1EwRVBBeFF1RVBpRmJlanQwcms2UUxDTVpJck1HOThT?=
 =?utf-8?B?bG1LQWJ6blcrRmJRSTRtV0hLd3Zvb3AvSmFYdThuQnRHc0tYOVNiUjEyUzlx?=
 =?utf-8?B?T3hra2FxT2lTK0FvMElLWmJPZ1BJWGFJQnFmNUFIU0JTMmlwbHY5QnBPeW5L?=
 =?utf-8?B?VlhSVmRsT204eElIekhDaStkRU41bGRVWlZtSjNtQ20yOWVQTnNZUGozdVJZ?=
 =?utf-8?B?NG0zektZTjcxYlRZdW93MWg5T29DSXJtTURDcVQzaC9Yd1hwRGg0eTg5anlM?=
 =?utf-8?B?ZzVvUEZKWEVJZVdXWnl0RStrSGhXcTJNUm11WTBFSzFPeitSSENYRTFiWnN4?=
 =?utf-8?B?TGZad0pRNXZwVStNRGQ0L1VHckQ1Sk9SY20xVnlTUi9Xa2Z1azRqcDRHQjdP?=
 =?utf-8?B?QmRzS2FneEFPOFBnNjJvSlVhZzZnSVVwZ0hMQTJXQVAxVVdsR1M0WXlNbFZU?=
 =?utf-8?B?VkdBcHdnS3htbW4xYzZjY1FKZndJendSSGI3cktzd2dud1YvQW1ZUVR6Nkp1?=
 =?utf-8?B?OWtNd21uQTZteWR3djJZN0lsZ3ZhMVA2MjZ5ZFJEdHRGeStxSnVIb2d1MFFj?=
 =?utf-8?B?ZFh6alBDamN0RmtraE9JMnVQbk1ndFJYQU5WRmZ2WS84YU1NMXV0K1dkb3Jp?=
 =?utf-8?B?VFlydEJpZjUrY0hyUTlCZ3lucjNmdXFGbG5LbXNjUmpwN2EzT1hBSzZpUjd4?=
 =?utf-8?B?NnlwWW11Y2xpNHdRanNMRGZXRTQ3djYwQldIR0x6ZDJHYTIvd3ZpdXlQVjdE?=
 =?utf-8?B?Q3JPSWoySklwMUM2WnkwTENTWHprenlzZ3RidmNFMlpQU29iWktyM1pKSnNG?=
 =?utf-8?B?L0lBVjNwYk9wOTNJa09PaldUNWZrN0F0VGRqMTJVdDBSbWd0KzJpa1hNNlNR?=
 =?utf-8?B?WjlhZE1tRWNLZWw5TmZUS2taN1gvRk9MdzM4d1BaU0N4c2FVaEhLYXM4cGtE?=
 =?utf-8?B?VmlJNXg3Wm0yQ3ZpdlZwenVlNTRBdjl1aWRwa0Jtd2tSbUNINmpSazY5ZTV5?=
 =?utf-8?B?NW8xRThOQkNLM21WSUN0REJrd0VMR2FPbG9WaTFXSGhKUGRFSUwrRkl1SEhO?=
 =?utf-8?B?clNPZU5RRmxEaWdsRERKQXZuNS94US9lNHRGN2tKUDFxeDlqd2RHc2R6QVJJ?=
 =?utf-8?B?Q0xtdHNhT2dTMkVBT1g3d0t4YlRNUzQ0THVjL0g3OVBHb3VpNFZiZ1B1NThC?=
 =?utf-8?B?bnFlUmRvZ2VzU2prUENUOGh1eXdCbzZsbGxWNjAvRCt0VjFCakp5YjFwbVlB?=
 =?utf-8?B?Rnh5Y3VWTzMyMC9FNnJEamdsbFBINm01WUp3a2Joejlzb0VaaGRHc0FmZmVK?=
 =?utf-8?B?ZzNOU2FhVm1SUWRRNE9yenlZSVVyRHVYbEd0UmtTNzdIekRrczgrN1dYdE9E?=
 =?utf-8?B?UjRmRVVjejF6dlpjNjlWV2ZPbUlFMC9GS0lwQkF1OHRhcWNSUzlUOHp6QXBF?=
 =?utf-8?B?QUFCend6cW40R01SeTJmSzZwOFhPMGR0RXk3dkFxNUNqN2pCMjhUNFlDcTF5?=
 =?utf-8?B?UmxtWVQwQThuTVgxanVkUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D6C144B8F654F49974F1FFAFDE60CFB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed1e2d4-a4bc-4d9d-7485-08d94af65e26
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 20:47:05.0609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPtqYAHX7QFOXR/5HgjL1/h6YHmdpUGqTRBd9HrMn03guw+jjj+hZlzRuEq6OSIU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5263
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
Cc: "jglisse@redhat.com" <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNClJlZ2FyZHMsDQpPYWsgDQoNCiANCg0K77u/T24gMjAyMS0wNy0xNywgMzoyMiBQTSwgImFt
ZC1nZnggb24gYmVoYWxmIG9mIEFsZXggU2llcnJhIiA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZyBvbiBiZWhhbGYgb2YgQWxleC5TaWVycmFAYW1kLmNvbT4gd3JvdGU6DQoN
CiAgICBUd28gaGVscGVycyBhZGRlZC4gT25lIGNoZWNrcyBpZiB6b25lIGRldmljZSBwYWdlIGlz
IGdlbmVyaWMNCiAgICB0eXBlLiBUaGUgb3RoZXIgaWYgcGFnZSBpcyBlaXRoZXIgcHJpdmF0ZSBv
ciBnZW5lcmljIHR5cGUuDQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBBbGV4IFNpZXJyYSA8YWxleC5z
aWVycmFAYW1kLmNvbT4NCiAgICAtLS0NCiAgICAgaW5jbHVkZS9saW51eC9tbS5oIHwgOCArKysr
KysrKw0KICAgICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQoNCiAgICBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oDQogICAgaW5kZXgg
ZDhkNzliYjk0YmU4Li5mNWIyNDdhNjMwNDQgMTAwNjQ0DQogICAgLS0tIGEvaW5jbHVkZS9saW51
eC9tbS5oDQogICAgKysrIGIvaW5jbHVkZS9saW51eC9tbS5oDQogICAgQEAgLTExMjUsNiArMTEy
NSwxNCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfZGV2aWNlX3ByaXZhdGVfcGFnZShjb25zdCBz
dHJ1Y3QgcGFnZSAqcGFnZSkNCiAgICAgCQlwYWdlLT5wZ21hcC0+dHlwZSA9PSBNRU1PUllfREVW
SUNFX1BSSVZBVEU7DQogICAgIH0NCg0KICAgICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfZGV2aWNl
X3BhZ2UoY29uc3Qgc3RydWN0IHBhZ2UgKnBhZ2UpDQoNClRoZSBmdW5jdGlvbiBuYW1lIGhlcmUg
aXMgY29uZnVzaW5nLiBUaGVvcmV0aWNhbGx5IGFzIGxvbmcgYXMgcGFnZSdzIHpvbmUgbnVtYmVy
IGlzIFpPTkVfREVWSUNFLCB0aGVuIHRoZSBwYWdlIGlzIGEgZGV2aWNlIHBhZ2UuIFlvdSBwdXQg
dGhlIGNvbmRpdGlvbiBtb3JlIHN0cmljdCBiZWxvdyBqdXN0IGJlY2F1c2UgdGhlIGtmZCBzdm0g
aW1wbGVtZW50YXRpb24gb25seSB1c2VzIE1FTU9SWV9ERVZJQ0VfUFJJVkFURS9HRU5FUklDLiBC
dXQgTUVNT1JZX0RFVklDRV9GU19EQVggYW5kIE1FTU9SWV9ERVZJQ0VfUENJX1AyUERNQSBpcyBh
bHNvIGRldmljZSBtZW1vcnkgKGNvbXBhcmVkIHRvIG5vcm1hbCBjcHUgc3lzdGVtIG1lbW9yeSku
DQoNCiAgICArew0KICAgICsJcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0RFVl9QQUdFTUFQX09Q
UykgJiYNCiAgICArCQlpc196b25lX2RldmljZV9wYWdlKHBhZ2UpICYmDQogICAgKwkJKHBhZ2Ut
PnBnbWFwLT50eXBlID09IE1FTU9SWV9ERVZJQ0VfUFJJVkFURSB8fA0KICAgICsJCSBwYWdlLT5w
Z21hcC0+dHlwZSA9PSBNRU1PUllfREVWSUNFX0dFTkVSSUMpOw0KICAgICt9DQogICAgKw0KICAg
ICBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcGNpX3AycGRtYV9wYWdlKGNvbnN0IHN0cnVjdCBwYWdl
ICpwYWdlKQ0KICAgICB7DQogICAgIAlyZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfREVWX1BBR0VN
QVBfT1BTKSAmJg0KICAgIC0tIA0KICAgIDIuMzIuMA0KDQogICAgX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiAgICBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
ICAgIGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQogICAgaHR0cHM6Ly9uYW0xMS5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wNCU3
QzAxJTdDb2FrLnplbmclNDBhbWQuY29tJTdDNmEwMTg0NWZkMTUyNDM2MGQ3OWEwOGQ5NDk1ODMz
NjUlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NjIxNDY1
NDMxODUxMjkyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENK
UUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3Nk
YXRhPW5IYmxaZEdZeVl1UVZ3cyUyQmdHNEhnbktwR2lRWENmeHhFbldadW96S3k5ZyUzRCZhbXA7
cmVzZXJ2ZWQ9MA0KDQo=
