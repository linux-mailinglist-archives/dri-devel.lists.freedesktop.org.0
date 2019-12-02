Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A610E945
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 12:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9FB89B83;
	Mon,  2 Dec 2019 11:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00046.outbound.protection.outlook.com [40.107.0.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B416D89B83
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 11:08:05 +0000 (UTC)
Received: from HE1PR08CA0058.eurprd08.prod.outlook.com (2603:10a6:7:2a::29) by
 DB8PR08MB5084.eurprd08.prod.outlook.com (2603:10a6:10:38::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 11:08:01 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by HE1PR08CA0058.outlook.office365.com
 (2603:10a6:7:2a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Mon, 2 Dec 2019 11:08:01 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Mon, 2 Dec 2019 11:08:01 +0000
Received: ("Tessian outbound d55de055a19b:v37");
 Mon, 02 Dec 2019 11:07:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6d8f8852ab7fa30
X-CR-MTA-TID: 64aa7808
Received: from b8fd53e17d71.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 37580B3D-7091-43F5-AAE4-4FB28579F711.1; 
 Mon, 02 Dec 2019 11:07:54 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8fd53e17d71.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Dec 2019 11:07:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFG1nCdXONjYJBha3WejRIqVSNVgGScdigg4xwMvCwR92VykKb0fvRMOcSWDC/pj8DCLLJmtM6mCsYZ1/VeUPQPcoWLX/28fAV4xFM4Ghf+cwkVE/Lg+VF4Q2JB8+BJj44rn9jCZzJuS8EXw6Ux9yKTYixnCroQIZOP1vppPTZdwhBZG932W+dQb8wy1Ov5xzJelmYgzbRXF6vnE6Pw/uBtWd3Q61dQqmPSix3Gh6ZUAGca9rXF1fJpMl2tibnZTzxkjmCzGnhcEH92hlrIlM0p90k+DX76ymgfFjDiMXLjoTokZTm8/1+5XiSqeKHhxR5IjP8XHhJdjE0njZRMCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZP+y+mLEBtGUUH7f/yCOcI3dXKnWIX3blNz+PP9TKc=;
 b=cpk70qyXqhv06y+O1W3AsJCWzmn7OzZ5jh7ssLDcwZAEfxyPhTEBJRi7YK3zQJjTEDKdDoIyv7gMskn9W+XJHWq0rfJ6WaN39z7AoOEAatiiuYoc8zQW7PkzC9665+BOvT8shsaS8fwQR9ygC3VOJVrqnQRpd2R2mkNLDodUQCq85a+SvAYiZIjn8MeyG3ocoF8CRjO3vruZuIeHMUE1j0szxOGACSuvpdVFdEKZnoLncJkh191eSASCFskzWPJcN78cIhYBzJ4eC7j4ShCU7AfHpsRmINslfX/EuPcSDZ00++V0h4Ctofqz/V/e803Af8oG2nEanIbN0PzVPH/1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3280.eurprd08.prod.outlook.com (52.134.30.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 11:07:52 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 11:07:52 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Topic: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Index: AQHVoEQsEzx6hPV6tkqMxpVwDMM7k6emwEqA
Date: Mon, 2 Dec 2019 11:07:52 +0000
Message-ID: <15788924.1fOzIsmBsr@e123338-lin>
References: <20191121081717.29518-1-james.qian.wang@arm.com>
 <20191121081717.29518-3-james.qian.wang@arm.com>
In-Reply-To: <20191121081717.29518-3-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::18) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b82d2897-e816-495b-7db6-08d77717e597
X-MS-TrafficTypeDiagnostic: VI1PR08MB3280:|VI1PR08MB3280:|DB8PR08MB5084:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB5084FE9D4FBE26DDEDA581438F430@DB8PR08MB5084.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0239D46DB6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(346002)(396003)(376002)(136003)(189003)(199004)(6486002)(316002)(54906003)(2906002)(305945005)(8936002)(33716001)(7736002)(25786009)(81166006)(3846002)(26005)(99286004)(8676002)(6116002)(81156014)(66066001)(14444005)(256004)(11346002)(446003)(4326008)(6436002)(6246003)(71200400001)(71190400001)(6636002)(6862004)(186003)(478600001)(229853002)(86362001)(66446008)(66556008)(66476007)(66946007)(76176011)(52116002)(386003)(6506007)(64756008)(102836004)(5660300002)(6512007)(9686003)(14454004)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3280;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0dTHrLfnwn9HVDr2v9oNRP/+S2iCBtlHf1vf19nt8J9539EjPvz15GkoJ/sFci5kVDzmHK/a2/v+zxBTjOOfTLvRlEwC7p/cTE7ec4seyaaTM+oOACcByq25i3zUrQahqtTH/JvzDvK4yWqrBuXgpC+fUNTEa8wD78+NtnxvoJpzBU36wUfjjcgRmwDzlyLoi+X2Ax5omLl3OGNn7+8BxqnOTobTP/ooo429luQzVl8+nW4/j6ZS0u4cDqNHSnOz/8sPESf/DbcGwqSEuTWwzCl0TCCjLcnl0OTgUEwFDnohTxQ6ODNMx4iw0MPHSMftCZOnXat5O9Griemm1ZbMGzEGHTM2UdfvHFWGFQLGPpZ7dL7di2MOXo+ewKq3FcSySPY0RcOutjZL7jzjqpYNmqYwBMRECSeP4FEd58YCASTz5bQZ8WyhbREEAJ+0D0Kc
Content-ID: <85D38DF456872B48AD5F4C60CB24323E@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3280
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(97756001)(186003)(76176011)(6636002)(336012)(86362001)(446003)(81166006)(81156014)(8936002)(11346002)(8746002)(50466002)(22756006)(478600001)(305945005)(7736002)(2906002)(26005)(3846002)(6116002)(23726003)(14454004)(33716001)(6506007)(26826003)(46406003)(8676002)(25786009)(6246003)(54906003)(9686003)(76130400001)(99286004)(106002)(6486002)(6862004)(5660300002)(14444005)(356004)(66066001)(4326008)(47776003)(316002)(6512007)(70206006)(229853002)(102836004)(70586007)(386003)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5084;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 27fae5a3-311e-450a-ff20-08d77717e019
NoDisclaimer: True
X-Forefront-PRVS: 0239D46DB6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Ib2ax7dQ9X8UnEnbi0iU+22KA1NQ+jnZGZekuxlFf+OFYIr8G/CFe4WrQi+ahTQih/v6D3W9Wykbum35WHRIFSpaGLNLwVr/DKLU2bdwK+gXTbdMLB2hPR/gQa8qN5KR8gDSXhxUhTCxH9tKqqNKfZDw9CFCOCNVoEDDCqlLAK1N98ddoA+aWWFFex2woLIQ/sgpD7yelZCuY9bT8xtFrF8uItQMqAag+GnlJG7n9oPQEmTNoZvM+iEGIGS1JCS3mkiM5ZYeb3C0O91Ik46yFMgaRdL9LC4YkWMqhmooKwisw0O0QwcHacjnKEos3DYfn/wBxTDx+irwKq4VWgkXfM2115nt9awk47OoSgiWbOCHwv49mrvcaS7Ukn26QaUmbdw3TXUYR7kidtkV+M57SpSidcf6JOQ3Bl+dRmXrlDfzevVhkx+zZlhFFT6AJhj
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 11:08:01.5507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b82d2897-e816-495b-7db6-08d77717e597
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5084
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZP+y+mLEBtGUUH7f/yCOcI3dXKnWIX3blNz+PP9TKc=;
 b=cpdEphxnIZHIigTjaxb5ZdW6H5GB361TBf8csoEsR43YQoYZTbSEMs2JWM9N0qFkOxamfvoWDUVt+1wBEKWjqGox4DSiyO+rvwcTLF/0qMVdiNQf1ONiOajiGgyTSdFfSwNzI7vYaXIInF3eOMmPJ1TFrnkSYpzNYPOLlKWvJxU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZP+y+mLEBtGUUH7f/yCOcI3dXKnWIX3blNz+PP9TKc=;
 b=cpdEphxnIZHIigTjaxb5ZdW6H5GB361TBf8csoEsR43YQoYZTbSEMs2JWM9N0qFkOxamfvoWDUVt+1wBEKWjqGox4DSiyO+rvwcTLF/0qMVdiNQf1ONiOajiGgyTSdFfSwNzI7vYaXIInF3eOMmPJ1TFrnkSYpzNYPOLlKWvJxU=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIDIxIE5vdmVtYmVyIDIwMTkgMDg6MTc6NDUgR01UIGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IEQzMiBpcyBzaW1wbGUgdmVyc2lvbiBv
ZiBENzEsIHRoZSBkaWZmZXJlbmNlIGlzOgo+IC0gT25seSBoYXMgb25lIHBpcGVsaW5lCj4gLSBE
cm9wIHRoZSBwZXJpcGggYmxvY2sgYW5kIG1lcmdlIGl0IHRvIEdDVQo+IAo+IHYyOiBSZWJhc2Uu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGlu
YSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+IC0tLQo+ICAuLi4vZHJtL2FybS9kaXNwbGF5
L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaCAgfCAgMyArLQo+ICAuLi4vYXJtL2Rpc3BsYXkva29t
ZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAgMiArLQo+ICAuLi4vZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgfCA0MyArKysrKysrKysrKystLS0tLS0tCj4gIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaCB8IDEzICsrKysrKwo+
ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jICAgfCAgMSArCj4g
IDUgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9w
cm9kdWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJv
ZHVjdC5oCj4gaW5kZXggOTZlMmU0MDE2MjUwLi5kYmQzZDQ3NjUwNjUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmgK
PiBAQCAtMTgsNyArMTgsOCBAQAo+ICAjZGVmaW5lIE1BTElEUF9DT1JFX0lEX1NUQVRVUyhfX2Nv
cmVfaWQpICAgICAoKChfX3UzMikoX19jb3JlX2lkKSkgJiAweEZGKQo+ICAKPiAgLyogTWFsaS1k
aXNwbGF5IHByb2R1Y3QgSURzICovCj4gLSNkZWZpbmUgTUFMSURQX0Q3MV9QUk9EVUNUX0lEICAg
MHgwMDcxCj4gKyNkZWZpbmUgTUFMSURQX0Q3MV9QUk9EVUNUX0lECTB4MDA3MQo+ICsjZGVmaW5l
IE1BTElEUF9EMzJfUFJPRFVDVF9JRAkweDAwMzIKPiAgCj4gIHVuaW9uIGtvbWVkYV9jb25maWdf
aWQgewo+ICAJc3RydWN0IHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gaW5kZXggNmRhZGY0NDEzZWYzLi5jN2Y3
ZTljNTQ1YzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gQEAgLTEyNzQsNyArMTI3NCw3IEBAIHN0YXRp
YyBpbnQgZDcxX3RpbWluZ19jdHJscl9pbml0KHN0cnVjdCBkNzFfZGV2ICpkNzEsCj4gIAo+ICAJ
Y3RybHIgPSB0b19jdHJscihjKTsKPiAgCj4gLQljdHJsci0+c3VwcG9ydHNfZHVhbF9saW5rID0g
dHJ1ZTsKPiArCWN0cmxyLT5zdXBwb3J0c19kdWFsX2xpbmsgPSBkNzEtPnN1cHBvcnRzX2R1YWxf
bGluazsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMKPiBpbmRleCA5YjNiZjM1M2I2Y2MuLjJkNDI5
ZTMxMGU1YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2Q3MS9kNzFfZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2Q3MS9kNzFfZGV2LmMKPiBAQCAtMzcxLDIzICszNzEsMzMgQEAgc3RhdGljIGludCBkNzFfZW51
bV9yZXNvdXJjZXMoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIAkJZ290byBlcnJfY2xlYW51
cDsKPiAgCX0KPiAgCj4gLQkvKiBwcm9iZSBQRVJJUEggKi8KPiArCS8qIE9ubHkgdGhlIGxlZ2Fj
eSBIVyBoYXMgdGhlIHBlcmlwaCBibG9jaywgdGhlIG5ld2VyIG1lcmdlcyB0aGUgcGVyaXBoCj4g
KwkgKiBpbnRvIEdDVQo+ICsJICovCj4gIAl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5wZXJp
cGhfYWRkciwgQkxLX0JMT0NLX0lORk8pOwo+IC0JaWYgKEJMT0NLX0lORk9fQkxLX1RZUEUodmFs
dWUpICE9IEQ3MV9CTEtfVFlQRV9QRVJJUEgpIHsKPiAtCQlEUk1fRVJST1IoImFjY2VzcyBibGsg
cGVyaXBoIGJ1dCBnb3QgYmxrOiAlZC5cbiIsCj4gLQkJCSAgQkxPQ0tfSU5GT19CTEtfVFlQRSh2
YWx1ZSkpOwo+IC0JCWVyciA9IC1FSU5WQUw7Cj4gLQkJZ290byBlcnJfY2xlYW51cDsKPiArCWlm
IChCTE9DS19JTkZPX0JMS19UWVBFKHZhbHVlKSAhPSBENzFfQkxLX1RZUEVfUEVSSVBIKQo+ICsJ
CWQ3MS0+cGVyaXBoX2FkZHIgPSBOVUxMOwo+ICsKPiArCWlmIChkNzEtPnBlcmlwaF9hZGRyKSB7
Cj4gKwkJLyogcHJvYmUgUEVSSVBIRVJBTCBpbiBsZWdhY3kgSFcgKi8KPiArCQl2YWx1ZSA9IG1h
bGlkcF9yZWFkMzIoZDcxLT5wZXJpcGhfYWRkciwgUEVSSVBIX0NPTkZJR1VSQVRJT05fSUQpOwo+
ICsKPiArCQlkNzEtPm1heF9saW5lX3NpemUJPSB2YWx1ZSAmIFBFUklQSF9NQVhfTElORV9TSVpF
ID8gNDA5NiA6IDIwNDg7Cj4gKwkJZDcxLT5tYXhfdnNpemUJCT0gNDA5NjsKPiArCQlkNzEtPm51
bV9yaWNoX2xheWVycwk9IHZhbHVlICYgUEVSSVBIX05VTV9SSUNIX0xBWUVSUyA/IDIgOiAxOwo+
ICsJCWQ3MS0+c3VwcG9ydHNfZHVhbF9saW5rCT0gISEodmFsdWUgJiBQRVJJUEhfU1BMSVRfRU4p
Owo+ICsJCWQ3MS0+aW50ZWdyYXRlc190YnUJPSAhISh2YWx1ZSAmIFBFUklQSF9UQlVfRU4pOwo+
ICsJfSBlbHNlIHsKPiArCQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5nY3VfYWRkciwgR0NV
X0NPTkZJR1VSQVRJT05fSUQwKTsKPiArCQlkNzEtPm1heF9saW5lX3NpemUJPSBHQ1VfTUFYX0xJ
TkVfU0laRSh2YWx1ZSk7Cj4gKwkJZDcxLT5tYXhfdnNpemUJCT0gR0NVX01BWF9OVU1fTElORVMo
dmFsdWUpOwo+ICsKPiArCQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5nY3VfYWRkciwgR0NV
X0NPTkZJR1VSQVRJT05fSUQxKTsKPiArCQlkNzEtPm51bV9yaWNoX2xheWVycwk9IEdDVV9OVU1f
UklDSF9MQVlFUlModmFsdWUpOwo+ICsJCWQ3MS0+c3VwcG9ydHNfZHVhbF9saW5rCT0gR0NVX0RJ
U1BMQVlfU1BMSVRfRU4odmFsdWUpOwo+ICsJCWQ3MS0+aW50ZWdyYXRlc190YnUJPSBHQ1VfRElT
UExBWV9UQlVfRU4odmFsdWUpOwo+ICAJfQo+ICAKPiAtCXZhbHVlID0gbWFsaWRwX3JlYWQzMihk
NzEtPnBlcmlwaF9hZGRyLCBQRVJJUEhfQ09ORklHVVJBVElPTl9JRCk7Cj4gLQo+IC0JZDcxLT5t
YXhfbGluZV9zaXplCT0gdmFsdWUgJiBQRVJJUEhfTUFYX0xJTkVfU0laRSA/IDQwOTYgOiAyMDQ4
Owo+IC0JZDcxLT5tYXhfdnNpemUJCT0gNDA5NjsKPiAtCWQ3MS0+bnVtX3JpY2hfbGF5ZXJzCT0g
dmFsdWUgJiBQRVJJUEhfTlVNX1JJQ0hfTEFZRVJTID8gMiA6IDE7Cj4gLQlkNzEtPnN1cHBvcnRz
X2R1YWxfbGluawk9IHZhbHVlICYgUEVSSVBIX1NQTElUX0VOID8gdHJ1ZSA6IGZhbHNlOwo+IC0J
ZDcxLT5pbnRlZ3JhdGVzX3RidQk9IHZhbHVlICYgUEVSSVBIX1RCVV9FTiA/IHRydWUgOiBmYWxz
ZTsKPiAtCj4gIAlmb3IgKGkgPSAwOyBpIDwgZDcxLT5udW1fcGlwZWxpbmVzOyBpKyspIHsKPiAg
CQlwaXBlID0ga29tZWRhX3BpcGVsaW5lX2FkZChtZGV2LCBzaXplb2Yoc3RydWN0IGQ3MV9waXBl
bGluZSksCj4gIAkJCQkJICAgJmQ3MV9waXBlbGluZV9mdW5jcyk7Cj4gQEAgLTQxNSw3ICs0MjUs
NyBAQCBzdGF0aWMgaW50IGQ3MV9lbnVtX3Jlc291cmNlcyhzdHJ1Y3Qga29tZWRhX2RldiAqbWRl
dikKPiAgCX0KPiAgCj4gIAkvKiBsb29wIHRoZSByZWdpc3RlciBibGtzIGFuZCBwcm9iZSAqLwo+
IC0JaSA9IDI7IC8qIGV4Y2x1ZGUgR0NVIGFuZCBQRVJJUEggKi8KPiArCWkgPSAxOyAvKiBleGNs
dWRlIEdDVSAqLwo+ICAJb2Zmc2V0ID0gRDcxX0JMT0NLX1NJWkU7IC8qIHNraXAgR0NVICovCj4g
IAl3aGlsZSAoaSA8IGQ3MS0+bnVtX2Jsb2Nrcykgewo+ICAJCWJsa19iYXNlID0gbWRldi0+cmVn
X2Jhc2UgKyAob2Zmc2V0ID4+IDIpOwo+IEBAIC00MjUsOSArNDM1LDkgQEAgc3RhdGljIGludCBk
NzFfZW51bV9yZXNvdXJjZXMoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIAkJCWVyciA9IGQ3
MV9wcm9iZV9ibG9jayhkNzEsICZibGssIGJsa19iYXNlKTsKPiAgCQkJaWYgKGVycikKPiAgCQkJ
CWdvdG8gZXJyX2NsZWFudXA7Cj4gLQkJCWkrKzsKPiAgCQl9Cj4gIAo+ICsJCWkrKzsKClRoaXMg
Y2hhbmdlIGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIGlmIHlvdSB3YW50IHRvIGNvdW50IGhvdyBt
YW55CmJsb2NrcyBhcmUgYXZhaWxhYmxlLCBzaW5jZSB5b3UncmUgbm93IGNvdW50aW5nIHRoZSBy
ZXNlcnZlZCBvbmVzLCB0b28uCgpPbiB0aGUgY291bnRpbmcgbm90ZSwgdGhlIHByaW9yIGNvZGUg
cmlkZXMgb24gdGhlIGFzc3VtcHRpb24gdGhlIHBlcmlwaApibG9jayBpcyBsYXN0IGluIHRoZSBt
YXAsIGFuZCBJIGRvbid0IHNlZSBob3cgeW91IHN0aWxsIGhhbmRsZSBub3QKY291bnRpbmcgaXQg
aW4gdGhlIEQ3MSBjYXNlLgoKPiAgCQlvZmZzZXQgKz0gRDcxX0JMT0NLX1NJWkU7Cj4gIAl9Cj4g
IAo+IEBAIC02MDMsNiArNjEzLDcgQEAgZDcxX2lkZW50aWZ5KHUzMiBfX2lvbWVtICpyZWdfYmFz
ZSwgc3RydWN0IGtvbWVkYV9jaGlwX2luZm8gKmNoaXApCj4gIAo+ICAJc3dpdGNoIChwcm9kdWN0
X2lkKSB7Cj4gIAljYXNlIE1BTElEUF9ENzFfUFJPRFVDVF9JRDoKPiArCWNhc2UgTUFMSURQX0Qz
Ml9QUk9EVUNUX0lEOgo+ICAJCWZ1bmNzID0gJmQ3MV9jaGlwX2Z1bmNzOwo+ICAJCWJyZWFrOwo+
ICAJZGVmYXVsdDoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
ZDcxL2Q3MV9yZWdzLmgKPiBpbmRleCAxNzI3ZGM5OTM5MDkuLjgxZGU2YTIzZTdmMyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5o
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3Mu
aAo+IEBAIC03Miw2ICs3MiwxOSBAQAo+ICAjZGVmaW5lIEdDVV9DT05UUk9MX01PREUoeCkJKCh4
KSAmIDB4NykKPiAgI2RlZmluZSBHQ1VfQ09OVFJPTF9TUlNUCUJJVCgxNikKPiAgCj4gKy8qIEdD
VV9DT05GSUdVUkFUSU9OIHJlZ2lzdGVycyAqLwo+ICsjZGVmaW5lIEdDVV9DT05GSUdVUkFUSU9O
X0lEMAkweDEwMAo+ICsjZGVmaW5lIEdDVV9DT05GSUdVUkFUSU9OX0lEMQkweDEwNAo+ICsKPiAr
LyogR0NVIGNvbmZpZ3VyYXRpb24gKi8KPiArI2RlZmluZSBHQ1VfTUFYX0xJTkVfU0laRSh4KQko
KHgpICYgMHhGRkZGKQo+ICsjZGVmaW5lIEdDVV9NQVhfTlVNX0xJTkVTKHgpCSgoeCkgPj4gMTYp
Cj4gKyNkZWZpbmUgR0NVX05VTV9SSUNIX0xBWUVSUyh4KQkoKHgpICYgMHg3KQo+ICsjZGVmaW5l
IEdDVV9OVU1fUElQRUxJTkVTKHgpCSgoKHgpID4+IDMpICYgMHg3KQo+ICsjZGVmaW5lIEdDVV9O
VU1fU0NBTEVSUyh4KQkoKCh4KSA+PiA2KSAmIDB4NykKPiArI2RlZmluZSBHQ1VfRElTUExBWV9T
UExJVF9FTih4KQkoKCh4KSA+PiAxNikgJiAweDEpCj4gKyNkZWZpbmUgR0NVX0RJU1BMQVlfVEJV
X0VOKHgpCSgoKHgpID4+IDE3KSAmIDB4MSkKPiArCj4gIC8qIEdDVSBvcG1vZGUgKi8KPiAgI2Rl
ZmluZSBJTkFDVElWRV9NT0RFCQkwCj4gICNkZWZpbmUgVEJVX0NPTk5FQ1RfTU9ERQkxCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiBpbmRl
eCBiN2ExMDk3YzQ1YzQuLmFkMzhiYmM3NDMxZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCj4gQEAgLTEyNSw2ICsxMjUsNyBAQCBz
dGF0aWMgaW50IGtvbWVkYV9wbGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGtvbWVkYV9vZl9t
YXRjaFtdID0gewo+ICAJeyAuY29tcGF0aWJsZSA9ICJhcm0sbWFsaS1kNzEiLCAuZGF0YSA9IGQ3
MV9pZGVudGlmeSwgfSwKPiArCXsgLmNvbXBhdGlibGUgPSAiYXJtLG1hbGktZDMyIiwgLmRhdGEg
PSBkNzFfaWRlbnRpZnksIH0sCj4gIAl7fSwKPiAgfTsKPiAgCj4gCgoKLS0gCk1paGFpbAoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
