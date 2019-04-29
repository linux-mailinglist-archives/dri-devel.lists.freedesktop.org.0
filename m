Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A83FE051
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 12:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802AB88FF7;
	Mon, 29 Apr 2019 10:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30051.outbound.protection.outlook.com [40.107.3.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB6D88FF7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 10:12:18 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4926.eurprd08.prod.outlook.com (10.255.114.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Mon, 29 Apr 2019 10:12:16 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::6841:2153:b91f:759]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::6841:2153:b91f:759%4]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 10:12:16 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Yue Haibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/komeda: remove set but not used variable 'kcrtc'
Thread-Topic: [PATCH -next] drm/komeda: remove set but not used variable
 'kcrtc'
Thread-Index: AQHU/nQFKRGNoqlbk0+Sig1ICSf+Kg==
Date: Mon, 29 Apr 2019 10:12:16 +0000
Message-ID: <20190429101209.GA5684@james-ThinkStation-P300>
References: <20190426164202.34932-1-yuehaibing@huawei.com>
In-Reply-To: <20190426164202.34932-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0189.apcprd02.prod.outlook.com
 (2603:1096:201:21::25) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7570a9e2-f74a-487c-ceeb-08d6cc8b27a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4926; 
x-ms-traffictypediagnostic: VE1PR08MB4926:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4926A120D0101D8A52CECDD2B3390@VE1PR08MB4926.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(39860400002)(136003)(346002)(366004)(376002)(396003)(199004)(189003)(4326008)(446003)(86362001)(11346002)(476003)(8676002)(486006)(5660300002)(6436002)(66066001)(2906002)(256004)(14444005)(71200400001)(14454004)(25786009)(1076003)(186003)(81156014)(97736004)(81166006)(8936002)(71190400001)(6916009)(102836004)(68736007)(53936002)(76176011)(6512007)(9686003)(7736002)(66446008)(66556008)(26005)(6506007)(55236004)(6246003)(386003)(478600001)(52116002)(33716001)(305945005)(316002)(99286004)(3846002)(6116002)(58126008)(33656002)(54906003)(229853002)(6486002)(73956011)(66946007)(64756008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4926;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XJpCsxKd3i4+dBh49gLNpYMJ60XSoIn4liWDfQDb3bpCiepoJ+JZ5i5o/zqymEQRQ40u02Qi8nYHGEMtourSlfWGiwm3Le9n7E1y+GLrZvZt7qZqwLc+4q6Yzp+kr5QCrMT376Dxx5ob8SLJP0SFPKhzRjDO+nawFn9CJEfSH7XszbABSWEI1g1A4Su8w2JY6r4Tums2ujpKnq0AG0U2XNe4lVPmd6Gv68rMFS59VyhkrV5PXb0S/D2xSSYiPCwiBpaTNpuLLzmWQB7amyXySFwju/1Qy2Vom3ecpX9P1F/fnejfuZaBLZhWz+OTidXuYuLZvE+0pcakU9hjXIjayUnxH7BO6bmr6seshQr+j2IMpaStGTuyg/grKbnYtKiQcBOc1Aw+gMTAYddrv30yg1N7BsGAcvP5YyU9Qg06Npo=
Content-ID: <ABD117786B1FE14BA40DDC67A3B1193A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7570a9e2-f74a-487c-ceeb-08d6cc8b27a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 10:12:16.0190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8eiD8OVmk5GjtDTrClqvwgOoa1Nd9go9JV0PggyHL0=;
 b=g5w1oBW7hATQjDf2L3oK3tXXEmxjOC/sUgMGLE5R1gVGzPkzmMY48NhacUTkucq1rx97hgqs5UD65R0vbwjR6Zh+YSZU9Czq8gf39mUD/4xG6Dzkea5dvZfAWIIDzLcgpo7Kmt0IEoKF70kAuADs8yjzmCJ3VDag1ySSKf9QmRc=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBcHIgMjcsIDIwMTkgYXQgMTI6NDI6MDJBTSArMDgwMCwgWXVlIEhhaWJpbmcgd3Jv
dGU6Cj4gRnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+IAo+IEZpeGVz
IGdjYyAnLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPiAKPiBkcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jOiBJbiBmdW5jdGlvbiBrb21l
ZGFfcGxhbmVfYXRvbWljX2NoZWNrOgo+IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BsYW5lLmM6NDk6MjI6IHdhcm5pbmc6IHZhcmlhYmxlIGtjcnRjIHNldCBidXQg
bm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gSXQgaXMgbmV2ZXIgdXNl
ZCBzaW5jZSBpbnRyb2R1Y3Rpb24gaW4KPiBjb21taXQgN2QzMWI5ZTdhNTUwICgiZHJtL2tvbWVk
YTogQWRkIGtvbWVkYV9wbGFuZS9wbGFuZV9oZWxwZXJfZnVuY3MiKQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyB8IDIgLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gaW5kZXggMDdlZDBjYy4uMDc1Mzg5MiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
bGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGxhbmUuYwo+IEBAIC01NSw3ICs1NSw2IEBAIGtvbWVkYV9wbGFuZV9hdG9taWNfY2hlY2soc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gIAlzdHJ1Y3Qga29tZWRhX3BsYW5lX3N0YXRlICprcGxh
bmVfc3QgPSB0b19rcGxhbmVfc3Qoc3RhdGUpOwo+ICAJc3RydWN0IGtvbWVkYV9sYXllciAqbGF5
ZXIgPSBrcGxhbmUtPmxheWVyOwo+ICAJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0Owo+
IC0Jc3RydWN0IGtvbWVkYV9jcnRjICprY3J0YzsKPiAgCXN0cnVjdCBrb21lZGFfY3J0Y19zdGF0
ZSAqa2NydGNfc3Q7Cj4gIAlzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcgZGZsb3c7Cj4gIAlp
bnQgZXJyOwo+IEBAIC03Myw3ICs3Miw2IEBAIGtvbWVkYV9wbGFuZV9hdG9taWNfY2hlY2soc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gIAlpZiAoIWNydGNfc3QtPmFjdGl2ZSkKPiAgCQlyZXR1
cm4gMDsKPiAgCj4gLQlrY3J0YyA9IHRvX2tjcnRjKHN0YXRlLT5jcnRjKTsKPiAgCWtjcnRjX3N0
ID0gdG9fa2NydGNfc3QoY3J0Y19zdCk7Cj4gIAo+ICAJZXJyID0ga29tZWRhX3BsYW5lX2luaXRf
ZGF0YV9mbG93KHN0YXRlLCAmZGZsb3cpOwo+IC0tIAo+IDIuNy40Cj4gCgpUaGFuayB5b3UgZm9y
IHRoZSBwYXRjaC4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgpAbGl2aXU6CkNvdWxkIHlvdSBoZWxw
IHRvIGFwcGx5IHRoaXMgcGF0Y2ggdG8gb3VyIHRyZWUuCgpKYW1lcwotLSAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
