Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD4623B5A5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E958E6E43D;
	Tue,  4 Aug 2020 07:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1128 seconds by postgrey-1.36 at gabe;
 Tue, 04 Aug 2020 06:54:22 UTC
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1536E42C;
 Tue,  4 Aug 2020 06:54:22 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0746ZVhp008400; Tue, 4 Aug 2020 06:35:31 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 by mx0b-0039f301.pphosted.com with ESMTP id 32n6tpwcm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 06:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeAFWw1N8FMLvd6BjNQnvnM5GdsTvmZ1cmiMLHI+i2FOoWa+nUngMNOfW1nZ0CRrWmdc2d5iuYLRxBaAx5abb6nq3xn9jZCUfh1y5nMTAvTkfslrK+shhl/Al4Pe1rF5dV1vW8CvUUSORBeC0kB2kx37c3gumRTgbtkh2bQ5X/Y8YBraD/I7tQrN/JxGFw+lVCwrAjPvENgc7veZ9l4bzVSbtSVp9B2ConrPpxknG3UeHmi2wnbhqUVYDhzuPfvM1BL/qrUrS4j/Xv5EcRvfm/z7kXI/vzWREEq1+Rs3qXEMbMKEwZPw3kDjzjXcRRu2l/1YIkX3WQ54QFFh73llmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc4bC+XGhCr1+jTG6XrTRAZNK53WspKNeV6btNcHLOQ=;
 b=Fh8C+9D3jY8xg8DY5Vw5G7iO9/yNOj8BIkPiRjbh9PohbGhnPqgUfecL5tWSd2Yn01ZSMTvSCukP9H/eUinIj/kFQNL5uYoytZry9WJhlkMzarGz0IyQZli1sxs82Ap8cTNRn32MXbW8ZWRHQLJQ7OgcBrmGCryqRJ0YNUzdN8+UXgzgwmgG6QshI4BI6Y9YjBJN2RH/I1/Mu6OZGsYDtB7gB4LTBQcXB1kfBRf577E94pWwY4xPuMJrtfg30Fpk9kRPi2QHQzbhyaDwjhfhT1qK+LJmkcjVBf8lXhYzUbGb5YNfYYSLjLPvxple9ZZAphNE+SrTqaf6Gy1O96ifyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc4bC+XGhCr1+jTG6XrTRAZNK53WspKNeV6btNcHLOQ=;
 b=W1yKdZ3xXeFkNfbDw0Mw8vicuaylfoLjpGSFJ36M9uzzFArpOOrEcpcFpqZBvHE9JvlkdRe8THPAdCvq+wmDqbe3Mv9ZCtYCd9OJwOGoE+2jBkjX2j9aNvvLivM0bANzCduMvuk204g7u7orZi0AVmgr9gSCXv6iq1YPm7bmKyovE50VbQVeOSvWz43ELuZzmrFcJpP20IHOALSNSH/iXa+Rbe9jmA3brDUuMIl0p9ScmoUj6XPKUP8XZn3rNxjoOUL9hbf6/p5sfYAujpSAftj55WHQYoY2pSjwPzJs4/NTlTB5IRYD6CLwbe6mD5KQvp7HSrq55ZShQ4BAYASVmA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4018.eurprd03.prod.outlook.com (2603:10a6:208:73::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 4 Aug
 2020 06:35:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%9]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 06:35:20 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Oleksandr
 Andrushchenko <andr2000@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "boris.ostrovsky@oracle.com"
 <boris.ostrovsky@oracle.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH 2/6] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
Thread-Topic: [PATCH 2/6] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
Thread-Index: AQHWZzlL0sSwpF/GAkKOn1bzUQtIbaknfhgAgAAGTYA=
Date: Tue, 4 Aug 2020 06:35:20 +0000
Message-ID: <0ed5082f-0280-16c0-7410-f6a90262bcee@epam.com>
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-3-andr2000@gmail.com>
 <6d719ab2-d9f6-2c3c-8979-b12a4d10b96d@suse.com>
In-Reply-To: <6d719ab2-d9f6-2c3c-8979-b12a4d10b96d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bacc23d0-ea50-4283-2028-08d838408f3a
x-ms-traffictypediagnostic: AM0PR03MB4018:
x-microsoft-antispam-prvs: <AM0PR03MB4018A320EF9328C686A18CC1E74A0@AM0PR03MB4018.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sqyyZXAPZ/z3H/Ly6eF9f8KwJNrs3gHUd7BkzkMkooK993gYHTEATALdExOL6H9QMcfJh1tDL2F2gwXEZ0ME7/72z7KqgNkXvoTmiDLlx5bTRl+ZP16OVYb0lrrMHo1eyUxSTCJq3eIy6/Dsks54lUK3XTaFimEAKBd0jZaRh2P84kzti5xVgu6/ZcT8RxVM6hwlwe0DoQpLkW/V/IXpXDvpfq/Lns6qRLTneUgA11tahXTc2sCHWrJ9EsUlHc1V2p9Im/D2U/BpvZ8NCFsccFDhCq1OK2HF0NLKlj679PC3ECOf+81fWOdbJVEoP6SylEsJdb16FTFtdKuDtrrGEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(66574015)(6506007)(6512007)(8676002)(53546011)(4326008)(186003)(26005)(83380400001)(36756003)(31686004)(8936002)(5660300002)(316002)(91956017)(66946007)(66476007)(86362001)(66556008)(2906002)(64756008)(7416002)(478600001)(31696002)(110136005)(6486002)(2616005)(71200400001)(54906003)(66446008)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: QhMR69WQhyMQBpqeJiEZEx3t6YQfRYIHmcl9/oJQ/HDt4ZL3N+44TRYBCNnSIpLxDYIQSw0S5kIlIyqqePFeblBo8NkLY7Cf5pdFsUpKe300DENnQ5ZJ7gmILqCvA9rgn6afos3kr/OLASAShgamTSZZcVNFTgfO9UjUz20464hy6mpgQ+cljP/al8X4dOVSJrTMm4qJuSJve63M9Q/+Ev2iPQtDUw1efwrofG6IhBb6eJKdtMzjW1phYKSxZ3Qikm/w/azdvKxxXvC3ygYg9gNrd6eXb/wnuSS7FSZfSCDo4gJgV3S5Rnpl5kIGy/O0kJ73dd7yUansAwehyR4kr6STB4ZkJoQagqEzVxosgv3Ske/p1Pw+V1Cyyclm2lniAkuR+nmOGLJRb2gzYhJfBIwJAjqrWVZ3NwETooCK2l11zbOiLNL7sH1AFGuKmdNG/pejZJse0a1QybQAYtkFGwq1YJ7wmiTrEavtc7O4Urm9feUSZ1L7eQI10ZF1JvsUJPtratVDP8SR8o/S0VS728f3BH/r23Ep/yd/5lJ/D5o64U63zZ/sAr0eUuJfS/f33YwzFCqOlVd7nz4jvvOgm+80i1M+a9HOA0sz0UsIGsnpeHwZP0by9EO7qb/ZP+D9vSi4SUt4MhrVrRT/U4mvGQ==
x-ms-exchange-transport-forked: True
Content-ID: <5ABBA776A8DB0E4FA17CEE06E29E6409@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bacc23d0-ea50-4283-2028-08d838408f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 06:35:20.3465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eWW9QHSAhzV90syBmS6r/Z9p4/KgvXA0vEqEkQWozdMl3VOe2ymlHHY9Nfl97BEU53Knv0qBk4HcSN5cf6Tr8jBETyEVY2WLegbTT8kNbuOsKC6ByeJxghM8NwIZyVgh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4018
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_02:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040048
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA4LzQvMjAgOToxMiBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gT24gMzEuMDcuMjAg
MTQ6NTEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+
IFRoZSBwYXRjaCBjNTc1YjdlZWI4OWY6ICJkcm0veGVuLWZyb250OiBBZGQgc3VwcG9ydCBmb3Ig
WGVuIFBWDQo+PiBkaXNwbGF5IGZyb250ZW5kIiBmcm9tIEFwciAzLCAyMDE4LCBsZWFkcyB0byB0
aGUgZm9sbG93aW5nIHN0YXRpYw0KPj4gY2hlY2tlciB3YXJuaW5nOg0KPj4NCj4+IMKgwqDCoMKg
ZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jOjE0MCB4ZW5fZHJtX2Zyb250
X2dlbV9jcmVhdGUoKQ0KPj4gwqDCoMKgwqB3YXJuOiBwYXNzaW5nIHplcm8gdG8gJ0VSUl9DQVNU
Jw0KPj4NCj4+IGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYw0KPj4gwqDC
oMKgIDEzM8KgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqeGVuX2RybV9mcm9udF9nZW1fY3JlYXRl
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+PiDCoMKgwqAgMTM0wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IHNpemUpDQo+PiDCoMKgwqAgMTM1wqAgew0K
Pj4gwqDCoMKgIDEzNsKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgeGVuX2dlbV9vYmplY3QgKnhl
bl9vYmo7DQo+PiDCoMKgwqAgMTM3DQo+PiDCoMKgwqAgMTM4wqDCoMKgwqDCoMKgwqDCoMKgIHhl
bl9vYmogPSBnZW1fY3JlYXRlKGRldiwgc2l6ZSk7DQo+PiDCoMKgwqAgMTM5wqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChJU19FUlJfT1JfTlVMTCh4ZW5fb2JqKSkNCj4+IMKgwqDCoCAxNDDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfQ0FTVCh4ZW5fb2JqKTsNCj4+
DQo+PiBGaXggdGhpcyBhbmQgdGhlIHJlc3Qgb2YgbWlzdXNlZCBwbGFjZXMgd2l0aCBJU19FUlJf
T1JfTlVMTCBpbiB0aGUNCj4+IGRyaXZlci4NCj4+DQo+PiBGaXhlczrCoCBjNTc1YjdlZWI4OWY6
ICJkcm0veGVuLWZyb250OiBBZGQgc3VwcG9ydCBmb3IgWGVuIFBWIGRpc3BsYXkgZnJvbnRlbmQi
DQo+DQo+IEFnYWluIGZvcmdvdCB0byBDYyBzdGFibGU/DQoNCkkgd2FzIGp1c3Qgbm90IHN1cmUg
aWYgdGhlc2UgbWlub3IgZml4ZXMgbmVlZCB0byBnbyB0aGUgc3RhYmxlLCBidXQgSSB3aWxsIGFk
ZA0KDQpUaGFuayB5b3UNCg0KPg0KPg0KPiBKdWVyZ2VuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
