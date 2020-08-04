Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7AC23C6BF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4CA6E508;
	Wed,  5 Aug 2020 07:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 14413 seconds by postgrey-1.36 at gabe;
 Tue, 04 Aug 2020 10:34:32 UTC
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448F089E52;
 Tue,  4 Aug 2020 10:34:32 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0746F4Tm030157; Tue, 4 Aug 2020 06:34:13 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 32pxbn0b4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 06:34:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2qMPqEkxAZfZ0d0HW79twlwuxkCI5Eo1wrgrhtUjErGfvOuzhYpK7wVCILinRMYlhz36CJZZi2CBmwMFrbZjAQLZfTfWHUgnKryrYdEKhdkI6ZjVZg5GLfmxYE0RNKsFXoW/+/HdZXJhvi+/St7CjVDExl530VLulyGplLD7fVV/PpB+Cmvvi/tVcufNrF4rL0rhq2u47PtY/4jG0FWsoT4/EjyA+g1Y+f3rdXxovEw3xv2YxVerFmlAY9R4iSfMapA2wHpzizGOdBwlsJqlecFR1rwhpiIFzlVCsk/qFwXSBeICyD2QSJktcrqqtZgbGUHqY6iEKIQf1xCA0uN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dt7A68HQ6gnedq5sqGeegGqbUhQ1pFj77ot3E81bgeg=;
 b=E7c5szBumkGIc5bbhtrksE13bqVScpWRvKU2kS8U8VEOwqQvLrpd70M34blJVzxqlvIjei4fd+Xx2GGLb90hljXtfLkNSNqo53UQru/sq9TdEbLHA9OsxlfHGNw5GjeWQhbTFQ17yEl7OiUnNWgtw1+Fg7S5WGm335ciAPnIF7eYlEIs4ZdSJ1SNi2fhhwWefcorouDxepiuh91fFjXwe2hFDpM16q6BXKDleb3Rq1VGmr8m0yNS+Q4vc3t0LJn6nG38cBYdxKWY/GptEXI3rtCG2PJji7LY3DUs/Mq3tkJ8XAE0Tw4Pi19ZdkYY8yT+m3BvgAsjQcXMLJ4+cmMATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dt7A68HQ6gnedq5sqGeegGqbUhQ1pFj77ot3E81bgeg=;
 b=ZdqmafcCcvAnNy5j2aw2FTlcDKcS4AEP8FokdC4D6MUA71zIXTocU7UUt+EOp4w3g1eOQJPKq8AAdXYAotRVwW0yy1qXHVpC0qNSROHVi/zHmu+bYdB9xEZdfr/ses9/A9w/Ddiwnp58C1Vvst7kY52porwneLV+LMo68WPUHI92XrHL5wdJaQ6u/wY3mYD8wkAI0GzlVMTyFwYIw/+36NWVWmvN1Tr7PpckEkRxy+YPtuImPc345ljkA6z+/gDeBB/7DkNcrw1pGS7cRBW7kl1m7b3tDyrtm+bsZ37DLuzHhaW4jTxujMNIOWYvjNAPZrazy2RrsGsaXO30GS5vsQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6242.eurprd03.prod.outlook.com (2603:10a6:20b:15c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 4 Aug
 2020 06:34:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%9]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 06:34:10 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Oleksandr
 Andrushchenko <andr2000@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "boris.ostrovsky@oracle.com"
 <boris.ostrovsky@oracle.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH 1/6] xen/gntdev: Fix dmabuf import with non-zero sgt offset
Thread-Topic: [PATCH 1/6] xen/gntdev: Fix dmabuf import with non-zero sgt
 offset
Thread-Index: AQHWZzlJKFE4UhNAbk+yHV1cN0npaaknfdGAgAAGQIA=
Date: Tue, 4 Aug 2020 06:34:10 +0000
Message-ID: <df1a02e7-e0e2-cbb1-3d30-9b17c44be6a6@epam.com>
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-2-andr2000@gmail.com>
 <acf507b8-462a-1fa0-c54f-cc5c44d3cc55@suse.com>
In-Reply-To: <acf507b8-462a-1fa0-c54f-cc5c44d3cc55@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8da35b25-f110-4d4c-cf95-08d838406574
x-ms-traffictypediagnostic: AM0PR03MB6242:
x-microsoft-antispam-prvs: <AM0PR03MB6242D3D1695690390E429EA9E74A0@AM0PR03MB6242.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YGxIjuTcC1ym7LSNcIU6NVRpoTZ9yA4Foa8hdQkd8aqwmrmlbStFhQm/C2N7cNHrJzG0ua3qH5OByx7SQW6q8tQSntu1b420l6+aPC7mlXps6gsGxTCp6wsaftmMv5IvCgdIQwBgChLSvgAFqLOkSgofMoaPsDcMnm454rAL/UL78pZlJNtU+Z/nKzzmGAAOVt7eWf5N5pBQf5WXqAjGIvFxm+fsevfn6oEjBK0CMb5r6AN4LVw0JAObMIH3nUC+BmYtFOfkiz+0LljG80CMJPvThh5EtLlPFyFduzaudykOv/lDw0Y5UepytCaGgAnzHjMwDyB8rXIPZ5vxMHaywA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8676002)(316002)(7416002)(8936002)(478600001)(2616005)(31686004)(66556008)(66476007)(2906002)(4744005)(4326008)(91956017)(76116006)(66446008)(64756008)(6512007)(6486002)(71200400001)(5660300002)(31696002)(6506007)(66574015)(110136005)(54906003)(83380400001)(26005)(66946007)(36756003)(53546011)(86362001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: INSR6J7iTUjY9XyKgBhBiirH/eEJSoTgHGW43dLM5sbH4OWEp71/BLqouEecEzd981Fshf40pJZAFUCRQxN/ctPEuWRRI1nWA1zha3L5gHb0pzTQR0dAa4oEwYE0T0yqvM1R27kJwYc+1PgeSZ9KR3y1sg4HW2qWLkdxE3nrIRPlnd7zJDEY64X93gY1PgJcZ/N0sI53weARP/is7kcRJN00Baz32wCFHpTSG3qLLyMbpHNkN+pZtO13UkeaMC2i9yL6S+5I0fEZFnjKWvfn+UfWuYtQ/JCscA3+hgktwk7Rs3MfcwExkGxFGx57cRCddVC/MOxxd/p5ivlXWA35KnVIvXRzzojDdBv9PtcP9YSnYjbDIAagbhrCZM002A2spncp4ARbfDDBtOYikaP0q0OzbhaNovdy5bBnqZCJYT+lH6OmUXSoMFmDXxVV7w8NHRphaZUhJBnYG3UfZM3LaWU/yr/gIEgOhpi61o8bSY7TPEvXLAl0q4A/qLVZnJ3pxLhFZOCdfT4p5YLJii2BcjWJ3C04O6h33Q6wKJamnUTwoRKau+lwZXS9rWSBvm7afbhRoW23aQNCtd6NvAbAnuG9hcpw4D27QPZz4FHgYFijMw5s0+ZfvzjkybirmTRNR754dAwYYc8h51FUW1t3ZA==
x-ms-exchange-transport-forked: True
Content-ID: <44D1CE254150BE4D8C6C2DEB066AFF88@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da35b25-f110-4d4c-cf95-08d838406574
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 06:34:10.3016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hV6Qrp8GB499WVSSD4JV2S2HYxmCfiV8zl3Sl3nW00RX9xOrT4QxFJD4I0FwGBpcx6A2UBbjdChwrBP03UnUjiH7BiMDvjJiAoUkBwsw/ZXYwsLgbPx/efolMd8QANRy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6242
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_02:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040047
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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

DQpPbiA4LzQvMjAgOToxMSBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gT24gMzEuMDcuMjAg
MTQ6NTEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+
IEl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIHNjYXR0ZXItZ2F0aGVyIHRhYmxlIGR1cmluZyBkbWFi
dWYgaW1wb3J0IGhhcw0KPj4gbm9uLXplcm8gb2Zmc2V0IG9mIHRoZSBkYXRhLCBidXQgdXNlci1z
cGFjZSBkb2Vzbid0IGV4cGVjdCB0aGF0Lg0KPj4gRml4IHRoaXMgYnkgZmFpbGluZyB0aGUgaW1w
b3J0LCBzbyB1c2VyLXNwYWNlIGRvZXNuJ3QgYWNjZXNzIHdyb25nIGRhdGEuDQo+Pg0KPj4gRml4
ZXM6IDM3Y2NiNDRkMGIwMCAoInhlbi9nbnRkZXY6IEltcGxlbWVudCBkbWEtYnVmIGltcG9ydCBm
dW5jdGlvbmFsaXR5IikNCj4NCj4gSSBjYW4ndCBmaW5kIHRoaXMgY29tbWl0IGluIHRoZSB0cmVl
LiBEaWQgeW91IG1lYW4gYmY4ZGM1NWIxMzU4Pw0KSSdsbCBkb3VibGUtY2hlY2ssIHRoYW5rIHlv
dQ0KPg0KPiBBbmQgZG9uJ3QgeW91IHdhbnQgdG8gQ2Mgc3RhYmxlIGZvciB0aGlzIHBhdGNoLCB0
b28/DQpIbSwgeWVzLCBzb3VuZHMgcmVhc29uYWJsZQ0KPg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4NCj4NCj4gQWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4NCj4N
Cj4gSnVlcmdlbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
