Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F760D3D0B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 12:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1BA6EC00;
	Fri, 11 Oct 2019 10:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8668C6EC00
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 10:13:11 +0000 (UTC)
Received: from VE1PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:803:104::25)
 by AM0PR08MB5540.eurprd08.prod.outlook.com (2603:10a6:208:144::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 10:13:08 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by VE1PR08CA0012.outlook.office365.com
 (2603:10a6:803:104::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 10:13:07 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 10:13:06 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Fri, 11 Oct 2019 10:12:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 393a5c948f6a3472
X-CR-MTA-TID: 64aa7808
Received: from fb8db4d7c804.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC712224-6FE3-4261-859B-EC83DFFDAC0C.1; 
 Fri, 11 Oct 2019 10:12:54 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb8db4d7c804.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 10:12:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8cbvrY9aMpcJ05g7wAaUbdx6mKWCcWvFyeomeWReK6K76XfFAG/TSW+tdTYZfkxTCx4CMgwW0M7h5BnfedBWRgu3HDsX9V0j9Kz6PSDLlaMkhr0nW2++1nRFgVpHaK+xF/3z/MSWVqhla7mTEei3A+CkJnMwu/kmCaOnrrlk7e6lZ9HTHtQBusGW0tw6oDpo0O7OwMXZwCqCdN8ocFHqK/JUZDUJEUZ9Mu1KChQtik/C5/5/oOKfL5QkAJE6oBNlZysMfsGOat3EJFA+wJVFB2/mbv4b1H3vE8x8MZcvQSi3O1cenFP4UapSudm2i3K4DCoO/53EnwPZeJT/sg11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXUhkcZysD0JLDCufCIZouin04Du52uPxuW73AOw8pU=;
 b=Sp8koNbA6V5btuha3xOkhgZtIxhPblC2TtxRrT2vgeWXlJTzkO6biK6PsBKwQftBhWCy/4HXkIOHrBHyGRRGFUuwV23Ha3835FbJuvhq17pgATLEpcv9hNYd0u1KOQcxyoh/KxEalowN9tafLTvmx/f5lApS/S19memqHYkUt+TvjN7LGBHYikA44ZymgqwdVirhME7MjzYTrSRNLt6or9oan6c7Fhrzl9VUTTUsv3B0ZE96PtX8LnvjIKnsGGVeCPbryPnrJvujWZ0dIUbXTb8uJygHxLGjXtwlZqBv5trAetj804w6eRq7zi+7ErMjgu+W0rZIRrFtmbDqDRAvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3981.eurprd08.prod.outlook.com (20.178.126.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 10:12:52 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9%4]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 10:12:51 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform support
 for DOU-IPS
Thread-Topic: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVf/cpkaYtgOCh2EeGNF1NL51m6adVIu6AgAAV/AA=
Date: Fri, 11 Oct 2019 10:12:51 +0000
Message-ID: <20191011101244.GA13428@lowli01-ThinkStation-P300>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
 <20191011054459.17984-5-james.qian.wang@arm.com>
 <8416585.jh9292Gg6g@e123338-lin>
In-Reply-To: <8416585.jh9292Gg6g@e123338-lin>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0044.apcprd04.prod.outlook.com
 (2603:1096:202:14::12) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d36338d8-1038-412a-1006-08d74e339c06
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3981:|VI1PR08MB3981:|AM0PR08MB5540:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB55401EBE33B849D401C655A99F970@AM0PR08MB5540.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(39860400002)(366004)(376002)(346002)(136003)(189003)(199004)(66066001)(71200400001)(71190400001)(81166006)(316002)(81156014)(8676002)(58126008)(54906003)(446003)(486006)(66476007)(11346002)(6862004)(14454004)(478600001)(66946007)(6246003)(8936002)(4326008)(5660300002)(476003)(66556008)(64756008)(66446008)(25786009)(3846002)(6436002)(6116002)(6512007)(9686003)(99286004)(6486002)(2906002)(76176011)(33656002)(6506007)(186003)(386003)(1076003)(26005)(52116002)(55236004)(229853002)(102836004)(86362001)(33716001)(14444005)(256004)(7736002)(305945005)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3981;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0zJeOGsb7a7+P8rPkriRPqVFrs4mGawOwyiQ6pln8DwS/L7zUXEyPdzL91bhCnCvqpGVRJHTWv9yv0biflWFOyDMvHm+F3X9KdsNxLifFiBczFV8kG6BV0/VmUyW5adMWv3wd2HkL1joIyeCUiDkXhv+YefGRdYdkrnBz1men8Ga60IeqXMV1tQIhSI0/65x4Iwv/MViufMsk6wNLLTC7ZCWt5b7aK0wZ1/Yfh0iOy47nlweQ+E6JQPW3FT/ABSAk4U7v/YLvO8H1R9PgOYGKUWJs6nraaXkVJPdwYT57wjTRQuXBETwu4mdm8AwHSgJfa0VaAMAuNR0dOckwAyqeXbkK+9S/Ft+HqpGYsx7aU0UvOGz4TeUMEkQoZVjwDkIvAZYREnmDt0VPEr0WmQMhlYxW/w8C8f3gipXhM0Q+Jc=
Content-ID: <0243169099F92A47A256B1BECB486C33@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3981
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(136003)(396003)(39860400002)(346002)(199004)(189003)(9686003)(8936002)(46406003)(25786009)(81166006)(81156014)(8746002)(33656002)(6486002)(8676002)(47776003)(336012)(14444005)(66066001)(6512007)(6636002)(486006)(26005)(476003)(6116002)(6246003)(23726003)(3846002)(4326008)(126002)(186003)(5660300002)(305945005)(7736002)(76130400001)(6506007)(386003)(11346002)(356004)(50466002)(63350400001)(102836004)(316002)(14454004)(33716001)(1076003)(22756006)(6862004)(446003)(229853002)(26826003)(86362001)(36906005)(478600001)(97756001)(70586007)(99286004)(54906003)(58126008)(76176011)(2906002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5540;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e32a0491-bd93-46e7-de20-08d74e339320
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DbJyGWykAzkdXccLMDetanoVbWbg0m3Qf0iretHHRs1XPkchTdPFAwN6SdRUoFRBXaQ8Bcww+qrDb193jp24G3+pxH0zuysL5r3IZwZ5/Md5o/wX0PKzPAnsQgiseAJU/Mim/JqWDdpjuVOHUu49X04nRTyo9e8JyEc5FFRm3tH7xz/RXbGkXECpnn2ldv/NnwoxbR7mKC9pypU58XPRtL7loFtTh+1K6f/Z/hSvjARu0xMXIL4+zajc8nWaY2bAGCPs5bT2KZpVt0p8nTT3FPUo9A9cBWRivY05lXs88EDQu3kugYM3UWc8eQUaiRqnegx4VheJGOpKjLIApFUA7TJyApk0aeqgMpeXliv2V6rcHwZ8Ohv+J9kyfrrnc7P/fMGSbN6poxASUGm3g00FUT+cil3Y9Du0T33O6tYF/wc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 10:13:06.3025 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d36338d8-1038-412a-1006-08d74e339c06
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXUhkcZysD0JLDCufCIZouin04Du52uPxuW73AOw8pU=;
 b=F98YlC+XmZB6jdSRXhZl5uKRqL96Dfuycnpx9gCEunwgNtKungUsCBJT8BzmcpzfmBix4us+3+MOg1H0cwCxrshudirJAEjVRV6+gWWAEhn8zxkr5EamDCw/VHaNCE/B18zkZITrTjm91nR83IrZW5E69opwVlKH76nKir7+SAQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXUhkcZysD0JLDCufCIZouin04Du52uPxuW73AOw8pU=;
 b=F98YlC+XmZB6jdSRXhZl5uKRqL96Dfuycnpx9gCEunwgNtKungUsCBJT8BzmcpzfmBix4us+3+MOg1H0cwCxrshudirJAEjVRV6+gWWAEhn8zxkr5EamDCw/VHaNCE/B18zkZITrTjm91nR83IrZW5E69opwVlKH76nKir7+SAQ=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Jonathan Chai \(Arm Technology
 China\)" <Jonathan.Chai@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsLApPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAwODo1NDowM0FNICswMDAwLCBNaWhh
aWwgQXRhbmFzc292IHdyb3RlOgo+IEhpIEphbWVzLCBMb3dyeSwKPiAKPiBPbiBGcmlkYXksIDEx
IE9jdG9iZXIgMjAxOSAwNjo0NTo1MCBCU1QgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9n
eSBDaGluYSkgd3JvdGU6Cj4gPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5h
KSIgPExvd3J5LkxpQGFybS5jb20+Cj4gPiAKPiA+IEFkZHMgZ2FtbWEgYW5kIGNvbG9yLXRyYW5z
Zm9ybSBzdXBwb3J0IGZvciBET1UtSVBTLgo+ID4gQWRkcyB0d28gY2FwcyBtZW1iZXJzIGZnYW1t
YV9jb2VmZnMgYW5kIGN0bV9jb2VmZnMgdG8ga29tZWRhX2ltcHJvY19zdGF0ZS4KPiA+IElmIGNv
bG9yIG1hbmFnZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFuZCBjb2xvci10cmFuc2Zvcm0gYWNj
b3JkaW5nbHkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9n
eSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYXJtL2Rpc3BsYXkv
a29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAyNCArKysrKysrKysrKysrKysrKysrCj4g
PiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgIDIgKysK
PiA+ICAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMyAr
KysKPiA+ICAuLi4vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAg
NiArKysrKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jCj4gPiBpbmRleCBjM2QyOWMwYjA1MWIuLmU3ZTVhOGU0NDMwZSAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25l
bnQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcx
X2NvbXBvbmVudC5jCj4gPiBAQCAtOTQyLDE1ICs5NDIsMzkgQEAgc3RhdGljIGludCBkNzFfbWVy
Z2VyX2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKPiA+ICBzdGF0aWMgdm9pZCBkNzFfaW1wcm9j
X3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKPiA+ICAJCQkgICAgICBzdHJ1Y3Qg
a29tZWRhX2NvbXBvbmVudF9zdGF0ZSAqc3RhdGUpCj4gPiAgewo+ID4gKwlzdHJ1Y3QgZHJtX2Ny
dGNfc3RhdGUgKmNydGNfc3QgPSBzdGF0ZS0+Y3J0Yy0+c3RhdGU7Cj4gSSdtIG5vdCBzdXJlIGl0
J3MgYSBnb29kIGlkZWEgdG8gaW50cm9kdWNlIGEgZGVwZW5kZW5jeSBvbiBkcm0gc3RhdGUKPiBz
byBmYXIgZG93biBpbiB0aGUgSFcgZnVuY3MsIGlzIHRoZXJlIGEgZ29vZCByZWFzb24gZm9yIHRo
ZSBkaXJlY3QgcHJvZD8KV2UgZGljdXNzZWQgYWJvdXQgdGhpcyBiZWZvcmUuIFRvIGRlY2lkZSB1
c2luZyB0aGlzIHdheSBpcyB0byBhdm9pZCBvZgpkdXBsaWNhdGVkIHN0YXRlIGJldHdlZW4gRFJN
IGFuZCBLb21lZGEuCgpSZWdhcmRzLApMb3dyeQo+ID4gIAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19z
dGF0ZSAqc3QgPSB0b19pbXByb2Nfc3Qoc3RhdGUpOwo+ID4gKwlzdHJ1Y3QgZDcxX3BpcGVsaW5l
ICpwaXBlID0gdG9fZDcxX3BpcGVsaW5lKGMtPnBpcGVsaW5lKTsKPiA+ICAJdTMyIF9faW9tZW0g
KnJlZyA9IGMtPnJlZzsKPiA+ICAJdTMyIGluZGV4Owo+ID4gKwl1MzIgbWFzayA9IDAsIGN0cmwg
PSAwOwo+ID4gIAo+ID4gIAlmb3JfZWFjaF9jaGFuZ2VkX2lucHV0KHN0YXRlLCBpbmRleCkKPiA+
ICAJCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX0lOUFVUX0lEMCArIGluZGV4ICogNCwKPiA+ICAJ
CQkgICAgICAgdG9fZDcxX2lucHV0X2lkKHN0YXRlLCBpbmRleCkpOwo+ID4gIAo+ID4gIAltYWxp
ZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXplKSk7
Cj4gPiArCj4gPiArCWlmIChjcnRjX3N0LT5jb2xvcl9tZ210X2NoYW5nZWQpIHsKPiA+ICsJCW1h
c2sgfD0gSVBTX0NUUkxfRlQgfCBJUFNfQ1RSTF9SR0I7Cj4gPiArCj4gPiArCQlpZiAoY3J0Y19z
dC0+Z2FtbWFfbHV0KSB7Cj4gPiArCQkJbWFsaWRwX3dyaXRlX2dyb3VwKHBpcGUtPmRvdV9mdF9j
b2VmZl9hZGRyLCBGVF9DT0VGRjAsCj4gPiArCQkJCQkgICBLT01FREFfTl9HQU1NQV9DT0VGRlMs
Cj4gPiArCQkJCQkgICBzdC0+ZmdhbW1hX2NvZWZmcyk7Cj4gPiArCQkJY3RybCB8PSBJUFNfQ1RS
TF9GVDsgLyogZW5hYmxlIGdhbW1hICovCj4gPiArCQl9Cj4gPiArCj4gPiArCQlpZiAoY3J0Y19z
dC0+Y3RtKSB7Cj4gPiArCQkJbWFsaWRwX3dyaXRlX2dyb3VwKHJlZywgSVBTX1JHQl9SR0JfQ09F
RkYwLAo+ID4gKwkJCQkJICAgS09NRURBX05fQ1RNX0NPRUZGUywKPiA+ICsJCQkJCSAgIHN0LT5j
dG1fY29lZmZzKTsKPiA+ICsJCQljdHJsIHw9IElQU19DVFJMX1JHQjsgLyogZW5hYmxlIGdhbXV0
ICovCj4gPiArCQl9Cj4gPiArCX0KPiA+ICsKPiA+ICsJaWYgKG1hc2spCj4gPiArCQltYWxpZHBf
d3JpdGUzMl9tYXNrKHJlZywgQkxLX0NPTlRST0wsIG1hc2ssIGN0cmwpOwo+ID4gIH0KPiA+ICAK
PiA+ICBzdGF0aWMgdm9pZCBkNzFfaW1wcm9jX2R1bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQg
KmMsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gPiBpbmRleCA5YmVlZGEwNDgxOGIuLjQwNmI5
ZDBjYTA1OCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NydGMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfY3J0Yy5jCj4gPiBAQCAtNTkwLDYgKzU5MCw4IEBAIHN0YXRpYyBpbnQga29t
ZWRhX2NydGNfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAo+ID4gIAo+ID4gIAljcnRj
LT5wb3J0ID0ga2NydGMtPm1hc3Rlci0+b2Zfb3V0cHV0X3BvcnQ7Cj4gPiAgCj4gPiArCWRybV9j
cnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMsIDAsIHRydWUsIEtPTUVEQV9DT0xPUl9MVVRfU0la
RSk7Cj4gPiArCj4gPiAgCXJldHVybiBlcnI7Cj4gPiAgfQo+ID4gIAo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gPiBp
bmRleCBiMzIyZjUyYmE4ZjIuLmM1YWI4MDk2Yzg1ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKPiA+IEBA
IC0xMSw2ICsxMSw3IEBACj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgo+ID4gICNpbmNsdWRlICJtYWxpZHBfdXRp
bHMuaCIKPiA+ICsjaW5jbHVkZSAia29tZWRhX2NvbG9yX21nbXQuaCIKPiA+ICAKPiA+ICAjZGVm
aW5lIEtPTUVEQV9NQVhfUElQRUxJTkVTCQkyCj4gPiAgI2RlZmluZSBLT01FREFfUElQRUxJTkVf
TUFYX0xBWUVSUwk0Cj4gPiBAQCAtMzI0LDYgKzMyNSw4IEBAIHN0cnVjdCBrb21lZGFfaW1wcm9j
IHsKPiA+ICBzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSB7Cj4gPiAgCXN0cnVjdCBrb21lZGFf
Y29tcG9uZW50X3N0YXRlIGJhc2U7Cj4gPiAgCXUxNiBoc2l6ZSwgdnNpemU7Cj4gPiArCXUzMiBm
Z2FtbWFfY29lZmZzW0tPTUVEQV9OX0dBTU1BX0NPRUZGU107Cj4gPiArCXUzMiBjdG1fY29lZmZz
W0tPTUVEQV9OX0NUTV9DT0VGRlNdOwo+ID4gIH07Cj4gPiAgCj4gPiAgLyogZGlzcGxheSB0aW1p
bmcgY29udHJvbGxlciAqLwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gPiBpbmRleCAwYmE5YzZh
YTM3MDguLjRhNDBiMzdlYjFhNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiA+IEBA
IC03NTYsNiArNzU2LDEyIEBAIGtvbWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9p
bXByb2MgKmltcHJvYywKPiA+ICAJc3QtPmhzaXplID0gZGZsb3ctPmluX3c7Cj4gPiAgCXN0LT52
c2l6ZSA9IGRmbG93LT5pbl9oOwo+ID4gIAo+ID4gKwlpZiAoa2NydGNfc3QtPmJhc2UuY29sb3Jf
bWdtdF9jaGFuZ2VkKSB7Cj4gPiArCQlkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoa2NydGNfc3Qt
PmJhc2UuZ2FtbWFfbHV0LAo+ID4gKwkJCQkJIHN0LT5mZ2FtbWFfY29lZmZzKTsKPiA+ICsJCWRy
bV9jdG1fdG9fY29lZmZzKGtjcnRjX3N0LT5iYXNlLmN0bSwgc3QtPmN0bV9jb2VmZnMpOwo+ID4g
Kwl9Cj4gPiArCj4gPiAgCWtvbWVkYV9jb21wb25lbnRfYWRkX2lucHV0KCZzdC0+YmFzZSwgJmRm
bG93LT5pbnB1dCwgMCk7Cj4gPiAgCWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ct
PmlucHV0LCAmaW1wcm9jLT5iYXNlLCAwKTsKPiA+ICAKPiA+IAo+IAo+IAo+IC0tIAo+IE1paGFp
bAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
