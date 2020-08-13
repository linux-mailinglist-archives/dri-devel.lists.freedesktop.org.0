Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E42245D15
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613146E454;
	Mon, 17 Aug 2020 07:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEE66EA4F;
 Thu, 13 Aug 2020 16:31:00 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07DGQsjV006014; Thu, 13 Aug 2020 16:30:57 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 32w215sqj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 16:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfN30pMtihY4CZwvcijOrWllZkIpz1Jgd2T5OVA4YNm8HYfR/gWz6SCJkJ7eV4AHwcqFFRKDHdhsbvQNf5+mtVRy6QSSsP8rIWg/SUWSAdUsz6FChSZBMRu8o/bEPBCgEPNDhFBc0/TrLSJB/nES1RnsPmWC98EgyspzwnNJOshD4r3THPp4a+YPSfIo2TfM4IDjb73+x1F7SbyHXjsSzCz5V9JChUq+z5lvBl38jsu7ShmZROSGa/8mvP4yfUrau5AANo+mNdlgW2qdGs1fXAaGU9kUgu62/xlIuh3QlRcXnmGKfrU80W7dWxKUa4PEwWW/bKnRqLz1dXCUFJSH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0BRes2kv5VyYulwL1rNMQfS7B1ywuFciCS+jE/h/u4=;
 b=lZDsIkxXQc9SrbGT/NUJWiAgErw390XXQhQpaOojTL7q/c45Km/kpetYwL/7maHNwx/ykNG+1JOY1AqtcNzZaqyKaTcXaG+gH4sB/NO0LLY4hguneL9qPcYURfKWVl5UZo8eUyTntjhujCVRNnWPhjDY2xe7aWt90HNvsV8RTDSrW4ATcrk1M1CrVSnVSjgJq82diJmWmoZ6YAcdt3nOxrM5AxJtgK+9EW6epGvVzACBOclhUdG9GHNVdLLLRHqOcZohvLRXLc7dAYbq026g0nq1czunF2ldzSmvKwBvLPRaU/f8LrSkOclHvg/HU/jhWUDIP0Z4u01bhq70++qF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0BRes2kv5VyYulwL1rNMQfS7B1ywuFciCS+jE/h/u4=;
 b=hSJ+cy3k1uZD1b3w4VfdvFhYt//4krQbgHwo4QQ+dDiAF9tyWHqHasDUeAlRkUTAgiPbidRL7vvOIiyjlVu6pp6LmfujI92y380LPRD1Ka4odc/9TbyWnq4oNMK7QejTFPiXz8Pq3HkBG548/nRHfkf7eApOgOjsHg0PlvEZcq3xg/iUMVBDiQ0fmlQtnm4WQoqtAK0f8jqIINb0XklHhv5XT24xHUXNC8M4g0lR17VaLxs/CXALOODRj7LiYUFAgX0eF8J3XZ3o/mZldg6lmfFtrMZUy8xYw4rKAIKcMeuQtMrX58kj6RhNie+nJSt+93pZXblwOEXYjm5FQWP+iw==
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB4453.eurprd03.prod.outlook.com (2603:10a6:20b:10::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 16:30:54 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1c2:462c:58b8:7ee9]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1c2:462c:58b8:7ee9%7]) with mapi id 15.20.3283.018; Thu, 13 Aug 2020
 16:30:54 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Oleksandr
 Andrushchenko <andr2000@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "boris.ostrovsky@oracle.com"
 <boris.ostrovsky@oracle.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
Thread-Topic: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
Thread-Index: AQHWcTn137mCP9TL7kicuRLSt2qi/qk2IyIAgAACToCAAACzgIAAFaKA
Date: Thu, 13 Aug 2020 16:30:54 +0000
Message-ID: <cd20468d-8469-8a7f-8630-5e7c63e2f73f@epam.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
 <366f5998-4346-6140-b133-23c9abef6589@suse.com>
 <5a71bca8-df90-a239-6a5e-cbc9af30771e@epam.com>
 <2b7568cd-a3e6-a672-e9c4-3e58eecde43b@suse.com>
In-Reply-To: <2b7568cd-a3e6-a672-e9c4-3e58eecde43b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ddfb8d7-3fe1-4db3-9df7-08d83fa64050
x-ms-traffictypediagnostic: AM6PR03MB4453:
x-microsoft-antispam-prvs: <AM6PR03MB4453D84921C9AE0814AAFAC5E7430@AM6PR03MB4453.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eB1k35EnZz/XR6f0fMgnns1w0bxfeTS4Lse7P2mK3If1FnI/DHvREcp9TkjnaBs3dBCHUAw+bm1a0nmIOewMeldBsVR6Z0vIAA7t3M+U4THJJRVNjpq+QfkA9qIO1412nRozedOcH8hKkAfnciwLcflBCXaD87PEviXi/otQaAiaedn9EPYiOxkIGF+zXpYF4oxsOz3SydJuxnA/QpA5xy064g4W5o28TE32YgoCFw23NQDEHkfKA1PzwJh27/ygOaPF7b20Uhajj1r1ktcpTLnDWs6JTznDy/BDFunY1HqZlzzG3Q7DI8Eiziv0D+yVsa/HygC3HoFU2Q+rLpIJ6h4XmUqYYUFAa/CT/JVxyXidB+M6Gp/aDZ5u6c1RH6Lr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR03MB6325.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(86362001)(66556008)(66446008)(66476007)(71200400001)(66946007)(76116006)(2616005)(7416002)(4326008)(64756008)(54906003)(316002)(6506007)(110136005)(6512007)(53546011)(8936002)(8676002)(31686004)(186003)(5660300002)(31696002)(36756003)(26005)(6486002)(4744005)(2906002)(478600001)(17423001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: pEdu3Qa/5zpqGycwMON7QxILy54e04XoBoso3g/XhbZTrT+VTi5xlEm73U4qzDBcWGjbRNXMFJu+MR+d33DmgtTHWin8BQLs3MHGvxicen8Du1vniCJETelyshRqwCS3j8zcYx/Te6yptMYumkFYjNJZpaymk6Tta+CD0XtDzlff3Uw3+KtR/aFUcAJuYFpop4xrluFBSzLtljc9pu5haJBRC/c+Jfmfdn6cfTZeeBSs/a6npyVO8xrhLQ3P5quj8FH8uqMySo0Oo1WIYLVi5ZaCSde1Ls2IiLh+BNYhSbJF9sLqQWzE/TLcg+hxyLn6W0divsRzCximiM5d8Ga528Ax9QFfytXfE6bIAK5fkhD/ybk07QKCM8j2WEZUpWM3YlTQp960c/8ntbjD7js7NSnSRKD43lbOqZLadhNDH/BCZOyuk1UdnImbUp77muXlfFlYG6G9szKFS+Y7lea6NPrv8Yu5BTaZDCwNF5Ie4gtukqbhiE7SMgRkBZAg24YAdqLG79im7d8CtoX18gFrTu9wktyMsostnT1VCJQ1eUzEup/4x/jad+lkkQl8pTDbOKBd3Bi0NoL9Hw+Amdc6QqPq7agThS4LmVKUzWaHw4Y1G53cRaCct4SXxKuPhb1gt5mPhOgPNIYK+gpfqMinyA==
x-ms-exchange-transport-forked: True
Content-ID: <2C396F522A21914492F920C0B051592F@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddfb8d7-3fe1-4db3-9df7-08d83fa64050
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 16:30:54.8553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcAqkli8+FEuRFBfVCJW53LSh/iXHSz/Vcg0SrbyjmyywqU76s+2ylJVPYfjEA4KvwCCL2qYJe1+T2u0Pv28Od6X+mWnDJAuLwinWVoVllWCHtKj551okIof80K64LWo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4453
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_14:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130119
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

DQpPbiA4LzEzLzIwIDY6MTMgUE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDEzLjA4LjIw
IDE3OjEwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+DQo+PiBPbiA4LzEzLzIw
IDY6MDIgUE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4gT24gMTMuMDguMjAgMDg6MjEsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4NCj4+PiBTZXJp
ZXMgcHVzaGVkIHRvOg0KPj4+DQo+Pj4geGVuL3RpcC5naXQgZm9yLWxpbnVzLTUuOQ0KPj4+DQo+
PiBUaGUgdG9wIHBhdGNoIGhhcyBzdHJhbmdlIHRpdGxlIHRob3VnaDoNCj4+DQo+PiAiU3ViamVj
dDogW1BBVENIIHYyIDUvNV0gZHJtL3hlbi1mcm9udDogUGFzcyBkdW1iIGJ1ZmZlciBkYXRhIG9m
ZnNldCB0byB0aGUgYmFja2VuZCINCj4NCj4gT2gsIGluZGVlZC4gSSBoYWQgdG8gcmVwYWlyIGl0
IG1hbnVhbGx5IGFzIGl0IHNlZW1zIHNvbWUgbWFpbCBzeXN0ZW0NCj4gKHByb2JhYmx5IG9uIG15
IGVuZCkgbWFuZ2xlZCBpdCBhIGxpdHRsZSBiaXQuDQo+DQo+IFdpbGwgcmVwYWlyIGl0Lg0KPg0K
Tm93IGV2ZXJ5dGhpbmcgaXMgZ3JlYXQsDQoNClRoYW5rIHlvdSENCg0KPg0KPiBKdWVyZ2VuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
