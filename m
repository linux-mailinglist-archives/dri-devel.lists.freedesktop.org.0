Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD561D8ED2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 13:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63776E02D;
	Wed, 16 Oct 2019 11:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64FB6E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 11:02:25 +0000 (UTC)
Received: from VI1PR0801CA0071.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::15) by AM0PR08MB4514.eurprd08.prod.outlook.com
 (2603:10a6:208:13a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Wed, 16 Oct
 2019 11:02:20 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by VI1PR0801CA0071.outlook.office365.com
 (2603:10a6:800:7d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Wed, 16 Oct 2019 11:02:20 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 11:02:18 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Wed, 16 Oct 2019 11:02:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 703af21a9037f482
X-CR-MTA-TID: 64aa7808
Received: from 20899ea1f40f.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EFA097B1-0D9D-47F5-96C8-34D5D7E3FCCA.1; 
 Wed, 16 Oct 2019 11:02:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 20899ea1f40f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 11:02:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joEVvcGYxv48zdFxficsYqLo4rt3cMBWpFEe4SMpBkrv1gomMou5lzOhpzPH3GUVYcNEZFuhVmWcHscp5RzJmm7cg4MSat7qlP4poFqMf3qlsyvY883iqqsn+f5INHHnyNeC5v66U2ZzpJiXmb9a9o7P6eLRfa9zA8bOctOk/upyf6eNqLHVPWPKU6U9WCGKkN35gErCUcuQDKdEAdJeuRe2fZuugkSX3lA2hROin5xLj5w/66unpSSGFY9SBSsf0RNFsxtFvVgyImLWaTVDfDTzmkKJFysb7MmI0NhXRDBs2/xDWurVepQfAybniCRoAJdZTAvSilBWDVES/zTu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bteAoqvg6Ja7R9NYtOBEL85RrNKJif/A9bVzjsytrpE=;
 b=cF0R6fXkhT7vmRszwraXL9FWYn9hFwozl0qeLdpB1DNiE7LjFF+QVkp/3aF0j8MZXoWUzi6Iex5LYVwoVTJTdk39okqBasmEXAx5l5Y86C4bHiZYI4nGGKAHje1xh6SSpugdqt9q+2hNgj/5mJxbp654gukbzHSL5Sopw5HFFxFfw9UZJaUGpar4UTPq1sXlBBzVa3KFrp7YjqbvI/srSz+kiqAKtvhpZNkq89WBteHzwAWUzcCd9lZs8yftCvaoJuzDDUky03BaFFp2l45snDfF9L4c++6uvV4y15fhMLor8Vh9JJiGF6TKjT3+ah/LY+kJdkgkO2nH/aDX2LuROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3135.eurprd08.prod.outlook.com (52.133.15.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 16 Oct 2019 11:02:03 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 11:02:03 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v5 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v5 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVhA1Dae0PEifxdEmUeEe4shI0vKddGiuA
Date: Wed, 16 Oct 2019 11:02:03 +0000
Message-ID: <2404938.QDdPyV61sH@e123338-lin>
References: <20191016103339.25858-1-james.qian.wang@arm.com>
 <20191016103339.25858-2-james.qian.wang@arm.com>
In-Reply-To: <20191016103339.25858-2-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: AM0PR02CA0020.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9eab4b9e-8741-4c39-4088-08d752284ff3
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3135:|VI1PR08MB3135:|AM0PR08MB4514:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB45144DD7FE8F7378B81B87278F920@AM0PR08MB4514.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(366004)(136003)(346002)(376002)(39860400002)(199004)(189003)(64756008)(386003)(9686003)(102836004)(76176011)(6506007)(6862004)(25786009)(71190400001)(6246003)(6636002)(478600001)(7736002)(305945005)(66066001)(14454004)(71200400001)(229853002)(6486002)(26005)(99286004)(4326008)(6512007)(186003)(6436002)(52116002)(66946007)(66446008)(66476007)(66556008)(11346002)(81156014)(476003)(86362001)(486006)(316002)(54906003)(8936002)(81166006)(446003)(5660300002)(33716001)(8676002)(6116002)(3846002)(2906002)(256004)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3135;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: XwnRvE4YMgo0g9LJ9EffP+InukiUBP6DMJGL84gN1ICBO2t3EKnP1y1EPun2EMP5SlvkXxIt1o9yM3IYcnpdc2vLtsOCm9DOTMTzyRdrbu3YZEqMHUn206n0zD5TKiyVmILrsjUdVAsEkJ9n7dV4yhGt6aMVL1ruDCbO4w36k/iprdjGcCy9puTvpC6I5w9wwaUt1Pp4vPNkjE2gJ+ezYs8v+zKsaZs1M7KgUJ0R+sbXmiFxnWbhwl7LTLp2HV8AfpvhE9gRaGxENseqEEAqAhZKy8Y4YmpczuE9xQhJLQlm8op51jJYBk8usd7xsISmJ3LvsbrkvgyumWgltk+RVFHCA4tHJvqOL5W7K96ZK4IMkzz8qtkcKJ0UF0UczZ9nXoE8nTwRR65SN1c+SsFXIAffFX9SwVR5RjO4QV8C76A=
Content-ID: <92977D79E52F4F47A3B721E0CA643AF6@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3135
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(346002)(136003)(376002)(396003)(199004)(189003)(81156014)(4326008)(5660300002)(316002)(186003)(81166006)(8676002)(50466002)(25786009)(6246003)(8746002)(54906003)(6862004)(8936002)(2906002)(107886003)(23726003)(3846002)(26826003)(63350400001)(6116002)(9686003)(6512007)(478600001)(6636002)(47776003)(486006)(446003)(11346002)(126002)(476003)(336012)(305945005)(22756006)(86362001)(229853002)(46406003)(14454004)(102836004)(386003)(97756001)(70206006)(26005)(76130400001)(356004)(6486002)(36906005)(6506007)(33716001)(66066001)(70586007)(7736002)(76176011)(99286004)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4514;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 483f1ccb-28fa-4879-6dd8-08d75228465f
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1CGeOSHD3+3zAUYwPZA+F8xPXQMG8lgfO1lIGWsDYgnsmjRE4dPMrtre6G+429nI7IrZ0GgHBSsqpP/TieBb6POt33jWVvxznlmlq3AzdfcX7RTi8pAQBnZfbs5VNi8KbMqb5uEmcl9hdKgeu60NW5a4tB2A3zK+8vzpULdfRuk+chd0/KXkZ1YSWboIPyyidUOFqxaRelNCyilE9UfIEMkjPbLOU+PW9Gr7OYDkk52QRpt6FGeD2zPGFlvvIV/cGq2odrZ1ZOKqeKkquM6nJex51QrAWBv2kaJDQNrTvgfH2HIzmxOH8s+3IICQ5ddbz4RVPdpt5BvtbmDwok3nejkug0qUI6vgnTpbdD1M0Wy3hvbbLUI7cTFZwIfd3ed5vMfuoQENPoMC7bsWZ3k9XJV1xz+b4M1yp3UXJqxwGk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 11:02:18.8675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eab4b9e-8741-4c39-4088-08d752284ff3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bteAoqvg6Ja7R9NYtOBEL85RrNKJif/A9bVzjsytrpE=;
 b=8BGuotcfc+c3ZCGaT+WhNUt+Xv95jrjmR3MyWsx9JfJjCOxVLclOmqLcyq6vRe6SDzMwezgjXSquK8RdIGeE0DE4le4fOQEv63PTh3lVNYOP/JlfizEhSxD0lzvooyh3q5sfq0X9tB6RzGw+PkpRY7QHy+vA+LqsfNax/E31/5Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bteAoqvg6Ja7R9NYtOBEL85RrNKJif/A9bVzjsytrpE=;
 b=8BGuotcfc+c3ZCGaT+WhNUt+Xv95jrjmR3MyWsx9JfJjCOxVLclOmqLcyq6vRe6SDzMwezgjXSquK8RdIGeE0DE4le4fOQEv63PTh3lVNYOP/JlfizEhSxD0lzvooyh3q5sfq0X9tB6RzGw+PkpRY7QHy+vA+LqsfNax/E31/5Q=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCAxNiBPY3RvYmVyIDIwMTkgMTE6MzQ6MDggQlNUIGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+IEFkZCBhIG5ldyBoZWxwZXIgZnVuY3Rp
b24gZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbigpIGZvciBkcml2ZXIgdG8KPiBjb252ZXJ0
IFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBjb21wbGVtZW50IHRoYXQgc3VwcG9y
dGVkIGJ5Cj4gaGFyZHdhcmUuCj4gCj4gVjQ6IEFkZHJlc3MgTWloYWksIERhbmllbCBhbmQgSWxp
YSdzIHJldmlldyBjb21tZW50cy4KPiBWNTogSW5jbHVkZXMgdGhlIHNpZ24gYml0IGluIHRoZSB2
YWx1ZSBvZiBtIChRbS5uKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiBSZXZpZXdl
ZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCAgICAgfCAgMiArKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQu
Ywo+IGluZGV4IDRjZTVjNmQ4ZGU5OS4uZDMxM2YxOTRmMWVjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9j
b2xvcl9tZ210LmMKPiBAQCAtMTMyLDYgKzEzMiwzMyBAQCB1aW50MzJfdCBkcm1fY29sb3JfbHV0
X2V4dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikKPiAg
fQo+ICBFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdCk7Cj4gIAo+ICsvKioKPiAr
ICogZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbgo+ICsgKgo+ICsgKiBAdXNlcl9pbnB1dDog
aW5wdXQgdmFsdWUKPiArICogQG06IG51bWJlciBvZiBpbnRlZ2VyIGJpdHMsIGluY2x1ZGUgdGhl
IHNpZ24tYml0LCBzdXBwb3J0IHJhbmdlIGlzIFsxLCAzMl0KCkFueSByZWFzb24gd2h5IG51bWJl
cnMgbGlrZSBRMC4zMiBhcmUgZGlzYWxsb3dlZD8gSW4gdGhvc2UgY2FzZXMsIHRoZQonc2lnbicg
Yml0IGFuZCB0aGUgZmlyc3QgZnJhY3Rpb25hbCBiaXQganVzdCBoYXBwZW4gdG8gYmUgdGhlIHNh
bWUgYml0LgpUaGUgbG9uZ2VyIEkgbG9vayBhdCBpdCwgdGhlIG1vcmUgSSB0aGluayBtZW50aW9u
aW5nIGEgJ3NpZ24tYml0JyBoZXJlCm1pZ2h0IGNvbmZ1c2UgcGVvcGxlIG1vcmUsIHNpbmNlIDIn
cyBjb21wbGVtZW50IGRvZXNuJ3QgaGF2ZSBhCmRlZGljYXRlZCBiaXQganVzdCBmb3IgdGhlIHNp
Z24uIEhvdyBhYm91dCByZWR1Y2luZyBpdCBzaW1wbHkgdG86CgogKiBAbTogbnVtYmVyIG9mIGlu
dGVnZXIgYml0cywgbSA8PSAzMi4KCj4gKyAqIEBuOiBudW1iZXIgb2YgZnJhY3Rpb25hbCBiaXRz
LCBvbmx5IHN1cHBvcnQgbiA8PSAzMgo+ICsgKgo+ICsgKiBDb252ZXJ0IGFuZCBjbGFtcCBTMzEu
MzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAoc2lnbmVkIDIncyBjb21wbGVtZW50KS4gVGhlCj4g
KyAqIGhpZ2hlciBiaXRzIHRoYXQgYWJvdmUgbSArIG4gYXJlIGNsZWFyZWQgb3IgZXF1YWwgdG8g
c2lnbi1iaXQgQklUKG0rbikuCgpbbml0XSBCSVQobSArIG4gLSAxKSBpZiB3ZSBjb3VudCBmcm9t
IDAuCgo+ICsgKi8KPiArdWludDY0X3QgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1aW50
NjRfdCB1c2VyX2lucHV0LAo+ICsJCQkJICAgICAgdWludDMyX3QgbSwgdWludDMyX3QgbikKPiAr
ewo+ICsJdTY0IG1hZyA9ICh1c2VyX2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+PiAoMzIgLSBuKTsK
PiArCWJvb2wgbmVnYXRpdmUgPSAhISh1c2VyX2lucHV0ICYgQklUX1VMTCg2MykpOwo+ICsJczY0
IHZhbDsKPiArCj4gKwlXQVJOX09OKG0gPCAxIHx8IG0gPiAzMiB8fCBuID4gMzIpOwo+ICsKPiAr
CS8qIHRoZSByYW5nZSBvZiBzaWduZWQgMidzIGNvbXBsZW1lbnQgaXMgWy0yXihtLTEpLCAyXiht
LTEpIC0gMl4tbl0gKi8KPiArCXZhbCA9IGNsYW1wX3ZhbChtYWcsIDAsIG5lZ2F0aXZlID8KPiAr
CQkJCUJJVF9VTEwobiArIG0gLSAxKSA6IEJJVF9VTEwobiArIG0gLSAxKSAtIDEpOwo+ICsKPiAr
CXJldHVybiBuZWdhdGl2ZSA/IC12YWwgOiB2YWw7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1f
Y29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsKPiArCj4gIC8qKgo+ICAgKiBkcm1fY3J0Y19lbmFi
bGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50IHByb3BlcnRpZXMKPiAgICog
QGNydGM6IERSTSBDUlRDCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210
LmggYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oCj4gaW5kZXggZDFjNjYyZDkyYWI3Li42
MGZlYTU1MDE4ODYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiBAQCAtMzAsNiArMzAsOCBAQCBz
dHJ1Y3QgZHJtX2NydGM7Cj4gIHN0cnVjdCBkcm1fcGxhbmU7Cj4gIAo+ICB1aW50MzJfdCBkcm1f
Y29sb3JfbHV0X2V4dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNp
c2lvbik7Cj4gK3VpbnQ2NF90IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24odWludDY0X3Qg
dXNlcl9pbnB1dCwKPiArCQkJCSAgICAgIHVpbnQzMl90IG0sIHVpbnQzMl90IG4pOwo+ICAKPiAg
dm9pZCBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4g
IAkJCQl1aW50IGRlZ2FtbWFfbHV0X3NpemUsCj4gCgoKLS0gCk1paGFpbAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
