Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D886D245D11
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B40E6E457;
	Mon, 17 Aug 2020 07:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D076E20B;
 Thu, 13 Aug 2020 15:11:05 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07DF5DcT026990; Thu, 13 Aug 2020 15:11:01 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 32vh5jksw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 15:11:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2tpb5Q/ufwkpfOQdAJhsdxj4z0zFcKvYHyw0ceL9yLBpdmjPQL5xD+5XTIwZt80prgxt44M0RRBZiXj++H7lmqu894SvqQEKWU+63QjPwc/dWAjtcj+S/OQ4E/+hlU0KKyYrnk41ULswv7HjR25OTwQLTfbGK34CGK9LTWNILKtSCNKaG44/t1TvnanfPM8Rb8rZUETQghzr4msGxqKVOmS8CIR621yV7lPdkcIIhZKsxAgyan6SMzmvOOftFbBikYBgnV3e5TfEq2ZirfbBWs/myR1vwA1YXR8//iGAXnrM7dzDj2nTIbJaGLEIubo2/hf0V6WKaTX2XMSFNK+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbT7E3FnZGjpsellB1VJc0QjmMvxVvvNsgmOtXFlCtQ=;
 b=BW2OA4dtdpW9vYidmO6VPyr6E0yU1pp5kAtgQKkeFMShBcQ6AgklmXRv7WpEGQqk2HGGp5zsAlXC8zYauz4MVvfxklOsatNvDJ4Gh5XHWbrHGa+uh1tCRQXTqad/CEEKukj9lTrG5dqC2HngnEmm0tYhQyy3Pfh9ShC3oPcM+MbNaqwgx73wb/TMDkUIkxI4g2WCJQydafGn8+f+7mHRdioRB01jI/lVjJPeW9VbRLIz/LDe0JHBlxkw2arEqCYQEV0OTwUh6Q26Nxw+OrmPlaIoNNEcf0NTiTtd+OOGTQrHs4FkBDFsD93JzkDSzcUfLreVpSSvUJ/YWARoFwg2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbT7E3FnZGjpsellB1VJc0QjmMvxVvvNsgmOtXFlCtQ=;
 b=t6MCFvMTEsK8ApQ2twcRHGAUlcTPwJVfF7TcP/9ttKtzeAzSuidsCaH9r60FU0RokiPloYpDKMWtjLYn0BOQhi1/3LEOBhzqp3qAEPrqfC/L+ubAC3gxWuiJGrLZG4SGrE5W8+vElcWKEhTqyvtmtdKY8upBOaP02FGiXCqm7aeQ1rvpPNTKPuzJGMkfGhwbCOo3w90MsB8x28Cv1fnn5gKR/7N0/hZLOLLwIjuTyuzHt2ubSiE7wVLyujMPRlYeez3MiQ/fopzuYu1i98ngeptSU1Q5qPjFTmQaVk0A4vDGl3R11Y5uP1/c3xNkgwXQFuHkwCE6HYTXnY2lme7CPw==
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR0302MB3239.eurprd03.prod.outlook.com (2603:10a6:209:1c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 15:10:58 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1c2:462c:58b8:7ee9]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1c2:462c:58b8:7ee9%7]) with mapi id 15.20.3283.018; Thu, 13 Aug 2020
 15:10:58 +0000
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
Thread-Index: AQHWcTn137mCP9TL7kicuRLSt2qi/qk2IyIAgAACToA=
Date: Thu, 13 Aug 2020 15:10:58 +0000
Message-ID: <5a71bca8-df90-a239-6a5e-cbc9af30771e@epam.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
 <366f5998-4346-6140-b133-23c9abef6589@suse.com>
In-Reply-To: <366f5998-4346-6140-b133-23c9abef6589@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f6f3d8c-cff3-4472-e294-08d83f9b159e
x-ms-traffictypediagnostic: AM6PR0302MB3239:
x-microsoft-antispam-prvs: <AM6PR0302MB3239E7AA5C98D2E1D0F6F988E7430@AM6PR0302MB3239.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s/7GZrRMyRp3x1pOd/nbYaE3oW11IM/7BmLXFYIPZPoH3o+X1KeIhi72CLJSK240actFF5fD0Y5rbc+xS3Fl6SdcppWYVihuUMQf5xT4QYOpGpk1uNvSZxB9i2UHfE15J8rHzh8A/osNCdTZ9Lug7x1k4PS+yyHX3Pni5VW0Vb/LRicqsto31papkzWhrFFzm900dQTWuuWLrf55aFfo1K954xY888ptDKhdWUgXPEb3HScAJERsgRwaXfTAVTC+HWrInRkvJZD0yru8HIY+QmOvvtsVyF4iYcSK7yeXy8rLK1ViAFtGadVPVbLCmvIMj6HSGyK5EnWef37TzGOoQuozFYsGXc6aSznlNWjpFjS9G+ngNtu4EwWp2awFMtJK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR03MB6325.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(316002)(54906003)(110136005)(4326008)(8936002)(6512007)(31686004)(71200400001)(8676002)(7416002)(478600001)(64756008)(26005)(31696002)(186003)(4744005)(86362001)(6486002)(2906002)(2616005)(66946007)(36756003)(76116006)(66556008)(6506007)(53546011)(66446008)(66476007)(5660300002)(17423001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: vcvXPYC0pdIEErRqfvgFP4YjLHF0ehENmsA4/+0lbZnRNiKY2IxSkx0zG0VPiXwt17EakE8aJgmVrY0wOUhj5DEpWiTm2r9z1ToPMEOtiAcix0kMzPyh1kADstq1Hur//e89W1VX92H+UUmvUMdEq/Fv2lMX/+DkLG5zoC9/V/kNzh1Pigs9ogrYHjH3r/amXarM4sWpB8KI7yicuK0imZsPJIDpVzeiNlI6qioGzDX/FnFrzUeP0sUBEuLzcwPqJgCjiZL9gGNIusZkjIosidib7q3yxZZu31udysPOBgSkLJZVM7l9/mcg4GVBhko15YZAvpUDlE3V4TvzVXJ6aK9I07sO8gzU19L7wdSTNIIMkRtIWc8LBQx+ZqORtiGUHFmRyrNOpoTm9FZJacqXzj1cLECQyoWolWhhkpUuh1odoeU4fL0TVqdxbMRWcYun8Uur+BYvvdM9eWEr8fppzBu0mpCuUKla/QRANfGjgv5Vs2wRsG3altz7fGgo/phQPJT8f0DjTyvUPIyxYOzFsjXUzRFV9StKvjchR49aIId4G0IrpvJpYqv1F+izz3wPbO2+dXXK9IWPeKComZ8gKX6R9DFgZeaZqYnTtvCxqEr8AoW3HIruUwo18xba0BeyXoKozXFtslwk59WCyD5UVQ==
x-ms-exchange-transport-forked: True
Content-ID: <67608A17853B3D4E8758991A02FB6D54@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6f3d8c-cff3-4472-e294-08d83f9b159e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 15:10:58.6815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sW7sNcl4A0S5smUsAfoJB+gTZiYSs0BOwv0FArFl7quZC8r7lJyiAhIF/bL1qX2GkMUmv5tJgslFaTB2p5IqgR/C//QkSTIic44M5b6NThiUmZ+rbfcxckWglQzrBwyg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0302MB3239
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_14:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=933
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008130114
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

DQpPbiA4LzEzLzIwIDY6MDIgUE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDEzLjA4LjIw
IDA4OjIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4NCj4g
U2VyaWVzIHB1c2hlZCB0bzoNCj4NCj4geGVuL3RpcC5naXQgZm9yLWxpbnVzLTUuOQ0KPg0KVGhl
IHRvcCBwYXRjaCBoYXMgc3RyYW5nZSB0aXRsZSB0aG91Z2g6DQoNCiJTdWJqZWN0OiBbUEFUQ0gg
djIgNS81XSBkcm0veGVuLWZyb250OiBQYXNzIGR1bWIgYnVmZmVyIGRhdGEgb2Zmc2V0IHRvIHRo
ZSBiYWNrZW5kIg0KDQo+DQo+IEp1ZXJnZW4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
