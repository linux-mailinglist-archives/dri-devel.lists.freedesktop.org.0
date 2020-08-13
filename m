Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5758B245D0C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159A96E45C;
	Mon, 17 Aug 2020 07:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1746E54C;
 Thu, 13 Aug 2020 07:22:02 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D7LUqM030618; Thu, 13 Aug 2020 07:21:59 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 32vy84871m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 07:21:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlWUUw+yFwRwg/mHRP0iN/K+iIuJWgitnrUR0gqoNgPHYynRe8l1gnq6ckHkj1afXROynKVhI+AHlVKFWnWZVam9CB8WPNBpW2YVkbgZYnCYfLHNp8rbEJ04ClGTKIzs0OSGJhjNEhaJKbpHZQnsr46vuYbtomn+QvToosE+7LH703lS7Bk1QPdP2LRKmSujMLacarRWlt0xJ2ea5M/46eJK2b823pK/eZKBwoQv4bS0JmVPlfMo+jMYHOqIZhPVt0bU63oWS0vKLJhHT/8SdFPLdW9R8fscZBqe7OjZ1cSOzW5Y3Pv0QfQS6l0OpuKNBETj2qCnJlBcOLqiQpOOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyN6lBIyNBOfl6gd1fx12weEEOyzGG41gNvVMJVwv/w=;
 b=Ypj6kNQoGXoacnlDH4bOfiebyseyZDRUmIfCeLoh8be5LjqfD9MR7e4lQ0B/eZPbp5eIegSYjURiQ0NV99COfNxUKea4sW4diJSHhzxibl20geEcnRbc8H+dmAFa3XT5d2HrjVcdjv4ouYz9McBfUtKNx75TbjefaYfjgbUJEVsbuv0JuJBCdSnxYvXljJXlv38UK/Uqfv9v01Ln7Seji2g7I+vXP/MypqouMDPPFgPDfF+dPmIhdmDgxxBq3klDQmVhp8bSEYDP2ae/KZ8M4nQSKxE6ZgD67Z2Qfv/yzdhoLf4Y37Kn40kAS6wdzc+YV/3PBD1Ys34gL2QzQF6qCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyN6lBIyNBOfl6gd1fx12weEEOyzGG41gNvVMJVwv/w=;
 b=OQSc7HeukW4HzcHfnV6gKdNF/iw3+6T94Or7Cjmc93qkcnpY5V6Uc9GIklF90ta24pJordYJn19PY7ZftLxw3zddyanyogcJs7P37+ngU9TajX1N9lIGQZ7zJIwR+EUzoW+2JWBaiajqHCWELdgBYOJPQr8kK6J7dcKFWH1TqomJ6/ZbvwuHMmEB/K9tRu8Pc4f71gY+rFhw8SC4RW+kIn7BMhromWqxJKaRrS28QErvKIQD3fcMZp9P6SdYvnDAMaOvLdblrjvMgNC2vp34y5ARtpVWpUCHo8aNXMKaxWLFcdGX3FYFesjPEu0IlvCDgZ4ob34EkCyvV9QECInxFw==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4882.eurprd03.prod.outlook.com (2603:10a6:208:fb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Thu, 13 Aug
 2020 07:21:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%9]) with mapi id 15.20.3261.026; Thu, 13 Aug 2020
 07:21:56 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
Thread-Topic: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
Thread-Index: AQHWcTn137mCP9TL7kicuRLSt2qi/qk1lI+AgAAJOgCAAASbgA==
Date: Thu, 13 Aug 2020 07:21:56 +0000
Message-ID: <b4069b96-477b-e507-e20c-9cb25376c40d@epam.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
 <7c8cb6e9-8270-d27a-6480-793ef5599d09@epam.com>
 <231ee1e7-c2fa-3c2a-f444-f9f813fc906d@suse.com>
In-Reply-To: <231ee1e7-c2fa-3c2a-f444-f9f813fc906d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c5e9864-6f78-446b-b0f4-08d83f598f6c
x-ms-traffictypediagnostic: AM0PR03MB4882:
x-microsoft-antispam-prvs: <AM0PR03MB4882EB8719486E501690B8D6E7430@AM0PR03MB4882.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lpj0gJuGFffuzE2Q58RzUT3pG4zKIQTMJJwDDizYCBGCn7BIRRzvIeM7sr9TKnnUR0jVw47upoG7NUO4yUnFpGjXPTC+HBFMAi54HQf7KaEbjP39KdnFepgOcqk4IK05puk3fz3pOCT/tRT4PfV0nUKEBzS1oMiZcjqws1CpQQg7o6OrcwFJgXNmCl7xIx7J//J99MM1aFeu73AuTGfYbh6JX6pMhgU4tl3LtmKFrT//3HbrnPdiv2T6Bdl/1SisU+AB94XV3t6mcPCDDIao3ts0Uw6ZczwPLCD+aRm8/AtxAvaqiWhUsPylpYTgLvNi3jeJOO3TRB2jf8plrkUr808/t5zXx9iiAcGCONlN78daWGkyHSq6nzEUIxx32E4iKlQ4CHHM7PaYYqbNa20bhpZWfjxxfr2Ys4hdab9Uq1/0m6zzxCslJwilhXCe1IMLHS0tNd/Rqid22yh8X/N5Jw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(316002)(8936002)(110136005)(5660300002)(26005)(54906003)(6512007)(31696002)(186003)(8676002)(7416002)(53546011)(83380400001)(2616005)(66574015)(6506007)(86362001)(966005)(2906002)(76116006)(66446008)(64756008)(91956017)(6486002)(66476007)(478600001)(4326008)(31686004)(36756003)(71200400001)(66556008)(66946007)(17423001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: MNaRtTqtK+azzqNg7uvmA8+aQ9tU1NBetWBHFoi3kVEumFQDAnqYu4UzATW1Hjnt03OmJAnxtIYaaYL91TQSvKxoLz5lTLqpz6/ARGXPHEiA0fH0DZQF7ehHg5dkdEb5qD800RYNuc1IEaKy6YCGMmUBLdYTFQW9rEyKuLN2V4OVCx9FT3MNPSQGnEAi4eQyRObE3IODkxHa/dKrltPx5VtK2SbfgVzRnRCIQ4weCrkcrrJcVbuvf0LAY4PITokcqw7sAOqdH5Kso1KpavwZdMAUpEvmu0TxjEMrOZbvyALjxoHjOUZ0tSHP50/YVD2DYDkehLiveJEhAoV8Jz8YEBlQOF/A07QISYruoSKRRvnSEeOuQ9aXv1H9hW86+6g7TaNJ33ovnAcUXhVChChS87L9U5lreasJcXdSN0HUDyuOe8zJgayjOWpANr8RwuF5rFdBoCEZ1zwbracm12kQjSCctg1b88NaryoEcY+ZyDcIpSA9ekBpr1KVk0a1tod4qQgezdihqL/xYPbdm7tl8+EeDkrzpBQbft9CdRXCgyDUJGiZHWmoIxiZD3bV2Z6up7b8k7pzoN/foHAN1a808HTwAWZ1RFIK6jfcgodspR1R7yxPfhPZa1qtYXCcZ8QEQkQj3mDCI9rRpRSwQwriLw==
x-ms-exchange-transport-forked: True
Content-ID: <427E0699961EF346958FF0D1F3CA223B@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5e9864-6f78-446b-b0f4-08d83f598f6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 07:21:56.3222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XA/YQAE5b9pLMOXLKRFrFDsxEisbPyc+VuKB/E/TEdxptKHTwl6RHxQWGdZ2QhOgo/NlVfYSrDvbeY45kg5ngE2xrW0zi1XGU5ViuV6N6opg5xrcK8xhlDQdTsKEibhL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4882
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_04:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008130056
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA4LzEzLzIwIDEwOjA1IEFNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPiBPbiAxMy4wOC4y
MCAwODozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBKdWVyZ2VuLCBCb3Jp
cywNCj4+DQo+PiBjYW4gd2UgcGxlYXNlIG1lcmdlIHRoZXNlIHZpYSBYZW4gTGludXggdHJlZSBh
cyBJIGhhdmUgY29sbGVjdGVkIGVub3VnaCBBY2svUi1iPw0KPj4NCj4+IFRoZSBzZXJpZXMgaGFz
IERSTSBwYXRjaGVzLCBidXQgdGhvc2UgYW55d2F5IGFyZSBYZW4gcmVsYXRlZCwgc28gSSB0aGlu
aw0KPj4NCj4+IHRoaXMgc2hvdWxkIGJlIGZpbmUgZnJvbSBEUkkgcG9pbnQgb2Ygdmlldy4NCj4N
Cj4gWWVzLCBmaW5lIHdpdGggbWUuDQpHcmVhdCwgdGhhbmsgeW91DQo+DQo+DQo+IEp1ZXJnZW4N
Cj4NCj4+DQo+PiBUaGFuayB5b3UsDQo+Pg0KPj4gT2xla3NhbmRyDQo+Pg0KPj4gT24gOC8xMy8y
MCA5OjIxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+PiBGcm9tOiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+
Pj4NCj4+PiBIZWxsbywNCj4+Pg0KPj4+IFRoaXMgc2VyaWVzIGNvbnRhaW5zIGFuIGFzc29ydGVk
IHNldCBvZiBmaXhlcyBhbmQgaW1wcm92ZW1lbnRzIGZvcg0KPj4+IHRoZSBYZW4gcGFyYS12aXJ0
dWFsaXplZCBkaXNwbGF5IGRyaXZlciBhbmQgZ3JhbnQgZGV2aWNlIGRyaXZlciB3aGljaA0KPj4+
IEkgaGF2ZSBjb2xsZWN0ZWQgb3ZlciB0aGUgbGFzdCBjb3VwbGUgb2YgbW9udGhzOg0KPj4+DQo+
Pj4gMS4gTWlub3IgZml4ZXMgdG8gZ3JhbnQgZGV2aWNlIGRyaXZlciBhbmQgZHJtL3hlbi1mcm9u
dC4NCj4+Pg0KPj4+IDIuIE5ldyBmb3JtYXQgKFlVWVYpIGFkZGVkIHRvIHRoZSBsaXN0IG9mIHRo
ZSBQViBEUk0gc3VwcG9ydGVkIGZvcm1hdHMNCj4+PiB3aGljaCBhbGxvd3MgdGhlIGRyaXZlciB0
byBiZSB1c2VkIGluIHplcm8tY29weWluZyB1c2UtY2FzZXMgd2hlbg0KPj4+IGEgY2FtZXJhIGRl
dmljZSBpcyB0aGUgc291cmNlIG9mIHRoZSBkbWEtYnVmcy4NCj4+Pg0KPj4+IDMuIFN5bmNocm9u
aXphdGlvbiB3aXRoIHRoZSBsYXRlc3QgcGFyYS12aXJ0dWFsaXplZCBwcm90b2NvbCBkZWZpbml0
aW9uDQo+Pj4gaW4gWGVuIFsxXS4NCj4+Pg0KPj4+IDQuIFNHVCBvZmZzZXQgaXMgbm93IHByb3Bh
Z2F0ZWQgdG8gdGhlIGJhY2tlbmQ6IHdoaWxlIGltcG9ydGluZyBhIGRtYWJ1Zg0KPj4+IGl0IGlz
IHBvc3NpYmxlIHRoYXQgdGhlIGRhdGEgb2YgdGhlIGJ1ZmZlciBpcyBwdXQgd2l0aCBvZmZzZXQg
d2hpY2ggaXMNCj4+PiBpbmRpY2F0ZWQgYnkgdGhlIFNHVCBvZmZzZXQuIFRoaXMgaXMgbmVlZGVk
IGZvciBzb21lIEdQVXMgd2hpY2ggaGF2ZQ0KPj4+IG5vbi16ZXJvIG9mZnNldC4NCj4+Pg0KPj4+
IFRoYW5rIHlvdSwNCj4+PiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbw0KPj4+DQo+Pj4gWzFdIGh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIv
P3A9eGVuLmdpdDthPWNvbW1pdDtoPWMyN2ExODQyMjVlYWI1NGQyMDQzNWM4Y2FiNWFkMGVmMzg0
ZGMyYzBfXzshIUdGXzI5ZGJjUUlVQlBBIWlBSE9kazRNMTY3Vk5NMUF5cE1HVm15S0p1LWlxQzll
NWNYeXU2TjU5NU5wM2l5SVpEblpsME1JQlgzSVJPSlNEMUdTTVhfR2ZRJCBbeGVuYml0c1suXXhl
blsuXW9yZ10NCj4+Pg0KPj4+IENoYW5nZXMgc2luY2UgdjE6DQo+Pj4gPT09PT09PT09PT09PT09
PT0NCj4+Pg0KPj4+IDEuIFJlbW92ZWQgcGF0Y2ggd2hpY2ggYWRkcyBFRElEIHRvIFBWIERSTSBh
cyBpdCBuZWVkcyBtb3JlIHRpbWUgZm9yIHJldmlldzoNCj4+PiAiNS4gVmVyc2lvbiAyIG9mIHRo
ZSBYZW4gZGlzcGxpZiBwcm90b2NvbCBhZGRzIFhFTkRJU1BMX09QX0dFVF9FRElEDQo+Pj4gcmVx
dWVzdCB3aGljaCBhbGxvd3MgZnJvbnRlbmRzIHRvIHJlcXVlc3QgRURJRCBzdHJ1Y3R1cmUgcGVy
DQo+Pj4gY29ubmVjdG9yLiBUaGlzIHJlcXVlc3QgaXMgb3B0aW9uYWwgYW5kIGlmIG5vdCBzdXBw
b3J0ZWQgYnkgdGhlDQo+Pj4gYmFja2VuZCB0aGVuIHZpc2libGUgYXJlYSBpcyBzdGlsbCBkZWZp
bmVkIGJ5IHRoZSByZWxldmFudA0KPj4+IFhlblN0b3JlJ3MgInJlc29sdXRpb24iIHByb3BlcnR5
Lg0KPj4+IElmIGJhY2tlbmQgcHJvdmlkZXMgRURJRCB3aXRoIFhFTkRJU1BMX09QX0dFVF9FRElE
IHJlcXVlc3QgdGhlbg0KPj4+IGl0cyB2YWx1ZXMgbXVzdCB0YWtlIHByZWNlZGVuY2Ugb3ZlciB0
aGUgcmVzb2x1dGlvbnMgZGVmaW5lZCBpbg0KPj4+IFhlblN0b3JlLiINCj4+PiBJIHdpbGwgc2Vu
ZCB0aGlzIGFzIGEgZGVkaWNhdGVkIHBhdGNoLg0KPj4+DQo+Pj4gMi4gQWRkZWQgbWlzc2luZyBD
QyBzdGFibGUgZm9yIHRoZSBwYXRjaGVzIHdpdGggZml4ZXMNCj4+Pg0KPj4+IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvICg1KToNCj4+PiDCoMKgwqAgeGVuL2dudGRldjogRml4IGRtYWJ1ZiBpbXBv
cnQgd2l0aCBub24temVybyBzZ3Qgb2Zmc2V0DQo+Pj4gwqDCoMKgIGRybS94ZW4tZnJvbnQ6IEZp
eCBtaXN1c2VkIElTX0VSUl9PUl9OVUxMIGNoZWNrcw0KPj4+IMKgwqDCoCBkcm0veGVuLWZyb250
OiBBZGQgWVVZViB0byBzdXBwb3J0ZWQgZm9ybWF0cw0KPj4+IMKgwqDCoCB4ZW46IFN5bmMgdXAg
d2l0aCB0aGUgY2Fub25pY2FsIHByb3RvY29sIGRlZmluaXRpb24gaW4gWGVuDQo+Pj4gwqDCoMKg
IGRybS94ZW4tZnJvbnQ6IFBhc3MgZHVtYiBidWZmZXIgZGF0YSBvZmZzZXQgdG8gdGhlIGJhY2tl
bmQNCj4+Pg0KPj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmPCoMKg
wqDCoMKgIHwgMTAgKy0tDQo+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJv
bnQuaMKgwqDCoMKgwqAgfMKgIDIgKy0NCj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVu
X2RybV9mcm9udF9jb25uLmMgfMKgIDEgKw0KPj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3hlbi94
ZW5fZHJtX2Zyb250X2dlbS5jwqAgfCAxMSArLS0NCj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS94
ZW4veGVuX2RybV9mcm9udF9rbXMuY8KgIHzCoCAyICstDQo+Pj4gwqDCoCBkcml2ZXJzL3hlbi9n
bnRkZXYtZG1hYnVmLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOCArKysNCj4+PiDC
oMKgIGluY2x1ZGUveGVuL2ludGVyZmFjZS9pby9kaXNwbGlmLmjCoMKgwqDCoMKgwqAgfCA5MSAr
KysrKysrKysrKysrKysrKysrKysrKy0NCj4+PiDCoMKgIDcgZmlsZXMgY2hhbmdlZCwgMTExIGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pg0KPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
