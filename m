Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1850D71AE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 11:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C296E796;
	Tue, 15 Oct 2019 09:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00072.outbound.protection.outlook.com [40.107.0.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE8D6E794
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 09:00:05 +0000 (UTC)
Received: from VI1PR08CA0276.eurprd08.prod.outlook.com (2603:10a6:803:dc::49)
 by AM0PR08MB5011.eurprd08.prod.outlook.com (2603:10a6:208:166::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 08:59:59 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR08CA0276.outlook.office365.com
 (2603:10a6:803:dc::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 08:59:59 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 08:59:57 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Tue, 15 Oct 2019 08:59:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1904d8ef4fa598e7
X-CR-MTA-TID: 64aa7808
Received: from 3a57419f3a64.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6CA53FE3-F3D8-4963-984D-FE548D58D684.1; 
 Tue, 15 Oct 2019 08:59:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3a57419f3a64.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 08:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZezBNl3yO4O/w7+qHaRWGAJ4mo+KIBysyCzFFmjOzIHYD22Xv9MYh05C28MON2VFkJePGF9XyHtIzggIa9twGrZPOBIQsWqCZpWe0TScd499Of6+IqgNFgK54WCuN8T5t5uhvkJNLlAap+DYDYmiR2os33j75VI0PaRELh9FJk86kayXETbbxM6vOkaHQtj49tI9XrJTu/BjtnVIzgOYPrtyJYyB/vPEH1DPTQ1SRjL/7f/FRoU3oM3OLRNVlmcpVu3+JMAK/SfGyLEbRC/HPZsS2ig5Fx70i3lBh0clXTwqaF3xoRdMWRa40sKxdb2kXWirs4iw2oLIZQbJqLGaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7hzIMd7l0GcjS+dSpQOJi0mVi0M1923Q08g1GSg5eA=;
 b=WUZrkeDGapHVtdTV9WBT6cHPghLYZXOzbay2PMva69rIvum3/Esq7kvM4fuiuwv4HxecOEKACx0Sjnce+FmVO3glYVd80rl7diadQDVg+qgu4vc7Ev+ndecb4S4l3awfkzhlJ1Y7I/OV7bzvH6O++L465gZmNI+RNyKs3GwW3LJJQDgrhmyYG1x0YpeMP+vg5yCXIi06HWI4lS37J+uCN4debRqGQdWMf6sCPM3eXG0qLpSw/jWmfA3ep/J++qsICcXd3sc2qjZa1c3NhWEwdUAWr75DZR/+28o0si5zKjZwWV91hRryWtvyfJE3Jhuo6WQ8A4wXVrNP+TxbKnh6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4704.eurprd08.prod.outlook.com (10.255.115.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 15 Oct 2019 08:59:44 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 08:59:44 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/bDNAzoDxuLVU+by7UkFix6lKdaUJkAgACbswCAAHbuAIAACpaA
Date: Tue, 15 Oct 2019 08:59:44 +0000
Message-ID: <20191015085937.GA1751@jamwan02-TSP300>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <CAKb7Uvik6MZSwCQ4QF7ed1wttfufbR-J4vNdOtYzM+1tqPE_vw@mail.gmail.com>
 <20191015011604.GA26941@jamwan02-TSP300> <1687889.77CWzybTeB@e123338-lin>
In-Reply-To: <1687889.77CWzybTeB@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0198.apcprd02.prod.outlook.com
 (2603:1096:201:21::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2a93747b-03b5-4561-ef51-08d7514e0dee
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4704:|VE1PR08MB4704:|AM0PR08MB5011:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB501158F0779A6CAAAD7D2385B3930@AM0PR08MB5011.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(396003)(346002)(136003)(366004)(199004)(189003)(478600001)(9686003)(6512007)(33656002)(486006)(256004)(54906003)(99286004)(6246003)(2906002)(7736002)(305945005)(76176011)(4326008)(52116002)(25786009)(3846002)(6116002)(6486002)(6436002)(229853002)(71200400001)(26005)(6862004)(14454004)(186003)(71190400001)(102836004)(55236004)(1076003)(53546011)(6506007)(386003)(8936002)(446003)(8676002)(81156014)(81166006)(58126008)(316002)(33716001)(6636002)(66476007)(66556008)(66446008)(66946007)(64756008)(11346002)(476003)(66066001)(86362001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4704;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uRQR+v8inLgw/oaDOiL0VHAhAhNTDiITFagYnKabx0kdwGPZkebXoy3UEHiEDDuaFHKzjS02D5wwKQ6iOfWKwnb96SsjBQVxna19MVqGgcmlzDhyNOMh9P57ioSQypZGdSNcaj5tEojXyqlP7efSV4d0VZxtkHDzI5ywUWy9IZ+4wJ9X/mL0wvZj+3eF3X9HMqzSUWXzjKkaDRWInZ73ytedCj2UC58IUwsODRvC4fRUlxvK8uNxWNR3OM1bz4I5MyUAakn85Zc/KkZq3omm0kgdSkhXrb9ROT93yeNOI3v7tVDK457vw2p+AVBIkYyZ6NmrNTuTO2f1P0+PzfKH1lr8jUzXty0rz73D4DGB5eHBtjiZ8g1jE+WNZDol4Snn4vIYcL2ozn223vWNA7QKUhOG+mY281hZ/dDqWkUWJ1I=
Content-ID: <8EB86220C170F745A11A504C1DD3E4D0@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4704
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(39860400002)(376002)(136003)(396003)(189003)(199004)(446003)(102836004)(11346002)(46406003)(97756001)(186003)(6636002)(26826003)(478600001)(26005)(76130400001)(70586007)(33656002)(70206006)(486006)(63350400001)(8746002)(8936002)(476003)(7736002)(6862004)(81156014)(33716001)(81166006)(8676002)(126002)(305945005)(4326008)(6246003)(53546011)(47776003)(229853002)(66066001)(14454004)(22756006)(25786009)(336012)(36906005)(54906003)(58126008)(76176011)(6486002)(9686003)(316002)(1076003)(23726003)(5660300002)(2906002)(50466002)(86362001)(356004)(99286004)(3846002)(6512007)(6116002)(386003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5011;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7463c02c-f9e2-4b10-51bf-08d7514e05a3
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iAG+QC6L0jjrDBMdq0kE0duRsjzCTb6PwApLFaOJNGEmtOKF2jnO1zXYa7/2X+Mh4jNfauXv+VYvxs7sn0GRysZgssJVnsnulw/EGqrVu3SiZwzfsI8O8HC3L5VUxwbw3rLU0JiCHtJtMcPsH2ShoLh3R0mJeT5wtfruBwqtKFEDKLioSTNIesID8ynBgBBwL3LDTYZmS92LQr8EWix3kHrB5vufCHpJTwXr3Vv/9bpCuaT8+JbvtwovRpMTvGO/GpkVpyuYUElLfpS3QE/C83plpfP0GcjZJ9eZVY0uMlo+Eaia2X3i8KIPL6qK8tqhduZEzxEBUubhwDvm+YSynDNG4QF5STYSDg1lRbdO0NckNTwRvYH7P712nwD8Hq/dzIzWTWUx4LAJ9MFiqA+m4+eRMHS5vQQAUCGOynBvPc4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 08:59:57.8545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a93747b-03b5-4561-ef51-08d7514e0dee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5011
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7hzIMd7l0GcjS+dSpQOJi0mVi0M1923Q08g1GSg5eA=;
 b=eCCm8hlyQbDXvAUtshDjVYN2cK5KHfnsfSKJ1aiU4hjbddvBKPql9X4ogBHUhmMJ/K4lAh0nAkhr0iGYN2ko150owhYfMBRTwz1pi2Zk8DXA1pRSf5tfvPpct9+68CelED/zeGgj2D4QMfHpiMIHNYkyb1R94E8AlRvQe3QyMn0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7hzIMd7l0GcjS+dSpQOJi0mVi0M1923Q08g1GSg5eA=;
 b=eCCm8hlyQbDXvAUtshDjVYN2cK5KHfnsfSKJ1aiU4hjbddvBKPql9X4ogBHUhmMJ/K4lAh0nAkhr0iGYN2ko150owhYfMBRTwz1pi2Zk8DXA1pRSf5tfvPpct9+68CelED/zeGgj2D4QMfHpiMIHNYkyb1R94E8AlRvQe3QyMn0=
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
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDg6MjE6NDRBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBPbiBUdWVzZGF5LCAxNSBPY3RvYmVyIDIwMTkgMDI6MTY6MTEgQlNUIGphbWVz
IHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gT24gTW9uLCBPY3Qg
MTQsIDIwMTkgYXQgMTE6NTg6NDhBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gPiA+IE9u
IEZyaSwgT2N0IDExLCAyMDE5IGF0IDE6NDMgQU0gamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5v
bG9neSBDaGluYSkKPiA+ID4gPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPiB3cm90ZToKPiA+ID4g
Pgo+ID4gPiA+IEFkZCBhIG5ldyBoZWxwZXIgZnVuY3Rpb24gZHJtX2NvbG9yX2N0bV9zMzFfMzJf
dG9fcW1fbigpIGZvciBkcml2ZXIgdG8KPiA+ID4gPiBjb252ZXJ0IFMzMS4zMiBzaWduLW1hZ25p
dHVkZSB0byBRbS5uIDIncyBjb21wbGVtZW50IHRoYXQgc3VwcG9ydGVkIGJ5Cj4gPiA+ID4gaGFy
ZHdhcmUuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gPiA+ID4gLS0t
Cj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIHwgMjMgKysrKysrKysr
KysrKysrKysrKysrKysKPiA+ID4gPiAgaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCAgICAg
fCAgMiArKwo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiA+ID4g
Pgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gPiA+ID4gaW5kZXggNGNlNWM2ZDhk
ZTk5Li4zZDUzM2QwYjQ1YWYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb2xvcl9tZ210LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21n
bXQuYwo+ID4gPiA+IEBAIC0xMzIsNiArMTMyLDI5IEBAIHVpbnQzMl90IGRybV9jb2xvcl9sdXRf
ZXh0cmFjdCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKQo+ID4g
PiA+ICB9Cj4gPiA+ID4gIEVYUE9SVF9TWU1CT0woZHJtX2NvbG9yX2x1dF9leHRyYWN0KTsKPiA+
ID4gPgo+ID4gPiA+ICsvKioKPiA+ID4gPiArICogZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1f
bgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBAdXNlcl9pbnB1dDogaW5wdXQgdmFsdWUKPiA+ID4g
PiArICogQG06IG51bWJlciBvZiBpbnRlZ2VyIGJpdHMKPiA+ID4gCj4gPiA+IElzIHRoaXMgdGhl
IGZ1bGwgMidzIGNvbXBsZW1lbnQgdmFsdWU/IGkuZS4gaW5jbHVkaW5nIHRoZSAic2lnbiIgYml0
Cj4gPiA+IG9mIHRoZSAyJ3MgY29tcGxlbWVudCByZXByZXNlbnRhdGlvbj8gSSdkIGtpbmRhIGFz
c3VtZSB0aGF0IG0gPSAzMiwgbgo+ID4gPiA9IDAgd291bGQganVzdCBnZXQgbWUgdGhlIGludGVn
ZXIgcG9ydGlvbiBvZiB0aGlzLCBmb3IgZXhhbXBsZS4KPiA+IAo+ID4gQG0gZG9lc24ndCBpbmNs
dWRlICJzaWduLWJpdCIKPiA+IAo+ID4gYW5kIGZvciB0aGlzIGNvbnZlcnNpb24gb25seSBzdXBw
b3J0IG0gPD0gMzEsIG4gPD0gMzIuCj4gPiAKPiA+ID4gPiArICogQG46IG51bWJlciBvZiBmcmFj
dGluYWwgYml0cwo+ID4gPiAKPiA+ID4gZnJhY3Rpb25hbAo+ID4gCj4gPiBUaGFuayB5b3UuCj4g
PiA+IAo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBDb252ZXJ0IGFuZCBjbGFtcCBTMzEuMzIgc2ln
bi1tYWduaXR1ZGUgdG8gUW0ubiAyJ3MgY29tcGxlbWVudC4KPiA+ID4gPiArICovCj4gPiA+ID4g
K3VpbnQ2NF90IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9pbnB1
dCwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IG0sIHVpbnQzMl90IG4pCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICAgIHU2NCBtYWcgPSAodXNl
cl9pbnB1dCAmIH5CSVRfVUxMKDYzKSkgPj4gKDMyIC0gbik7Cj4gPiA+ID4gKyAgICAgICBib29s
IG5lZ2F0aXZlID0gISEodXNlcl9pbnB1dCAmIEJJVF9VTEwoNjMpKTsKPiA+ID4gPiArICAgICAg
IHM2NCB2YWw7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgLyogdGhlIHJhbmdlIG9mIHNpZ25l
ZCAycyBjb21wbGVtZW50IGlzIFstMl5uK20sIDJebittIC0gMV0gKi8KPiA+ID4gCj4gPiA+IFRo
aXMgaW1wbGllcyB0aGF0IG4gPSAzMiwgbSA9IDAgd291bGQgYWN0dWFsbHkgeWllbGQgYSAzMy1i
aXQgMidzCj4gPiA+IGNvbXBsZW1lbnQgbnVtYmVyLiBJcyB0aGF0IHdoYXQgeW91IG1lYW50Pwo+
ID4gCj4gPiBZZXMsIHNpbmNlIG0gZG9lc24ndCBpbmNsdWRlIHNpZ24tYml0IFNvIGEgUTAuMzIg
aXMgYSAzM2JpdCB2YWx1ZS4KPiA+IAo+IAo+IEkgZ290dGEgc2F5IHRoaXMgd291bGQgYmUgcXVp
dGUgY29uZnVzaW5nLiBUaGVyZSBpcyBubyBzaWduIGJpdCBpbiAyJ3MKPiBjb21wbGVtZW50LCBw
ZXIgc2UuIFRoZSBNU2JpdCBqdXN0IGhhcyBhIG5lZ2F0aXZlIHdlaWdodC4gUTE2LjE2IGlzIGEK
PiAzMi1iaXQgdmFsdWUsIHNvIFEwLjMyIHNob3VsZCBhbHNvIGJlIGEgMzItYml0IHZhbHVlIHdp
dGggd2VpZ2h0cwo+IC0yXi0xLCArMl4tMiwgZXRjLgo+IAo+IEJlc3QgdG8gZm9sbG93IHdoYXQg
V2lraXBlZGlhIHNheXMsIHJpZ2h0IDopLgoKU29ycnksIE15IGZhdWx0ISB3aWxsIGNvcnJlY3Qg
aW4gdjUuCgo+ID4gPiAKPiA+ID4gPiArICAgICAgIHZhbCA9IGNsYW1wX3ZhbChtYWcsIDAsIG5l
Z2F0aXZlID8gQklUKG4gKyBtKSA6IEJJVChuICsgbSkgLSAxKTsKPiA+ID4gCj4gPiA+IEknbSBn
b2luZyB0byBwbGF5IHdpdGggbnVtcHkgdG8gY29udmluY2UgbXlzZWxmIHRoYXQgdGhpcyBpcyBy
aWdodAo+ID4gPiAoZXNwIHdpdGggdGhlIGVuZHBvaW50cyksIGJ1dCBpbiB0aGUgbWVhbndoaWxl
LCB5b3UgcHJvYmFibHkgd2FudCB0bwo+ID4gPiB1c2UgQklUX1VMTCBpbiBjYXNlIG4gKyBtID4g
MzIgKEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHRoZSBjYXNlIHdpdGggYW55Cj4gPiA+IGN1cnJlbnQg
aGFyZHdhcmUgdGhvdWdoKS4KPiA+IAo+ID4gWWVzLCB5b3UgYXJlIHJpZ2h0LCBJIG5lZWQgdG8g
dXNlIEJJVF9VTEwsIGFuZCBNaWhhaWwgYWxzbyBwb2ludCB0aGlzIG91dC4KPiA+IFRoaXMgaXMg
ZnVuY3Rpb24gaXMgZHJpdmVkIGZyb20gb3VyIGludGVybmFsIHMzMV8zMl90b19xMl8xNCgpCj4g
PiAKPiA+ID4gCj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgcmV0dXJuIG5lZ2F0aXZlID8gMGxs
IC0gdmFsIDogdmFsOwo+ID4gPiAKPiA+ID4gV2h5IG5vdCBqdXN0ICJuZWdhdGl2ZSA/IC12YWwg
OiB2YWwiPwo+ID4gCj4gPiB3aWxsIGNvcnJlY3QgaXQuCj4gPiAKPiA+ID4gCj4gPiA+ID4gK30K
PiA+ID4gPiArRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsKPiA+
ID4gPiArCj4gPiA+ID4gIC8qKgo+ID4gPiA+ICAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdt
dCAtIGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50IHByb3BlcnRpZXMKPiA+ID4gPiAgICogQGNydGM6
IERSTSBDUlRDCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210
LmggYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oCj4gPiA+ID4gaW5kZXggZDFjNjYyZDky
YWI3Li42MGZlYTU1MDE4ODYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nv
bG9yX21nbXQuaAo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiA+
ID4gPiBAQCAtMzAsNiArMzAsOCBAQCBzdHJ1Y3QgZHJtX2NydGM7Cj4gPiA+ID4gIHN0cnVjdCBk
cm1fcGxhbmU7Cj4gPiA+ID4KPiA+ID4gPiAgdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0
KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVjaXNpb24pOwo+ID4gPiA+ICt1
aW50NjRfdCBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQs
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBt
LCB1aW50MzJfdCBuKTsKPiA+ID4gPgo+ID4gPiA+ICB2b2lkIGRybV9jcnRjX2VuYWJsZV9jb2xv
cl9tZ210KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQgZGVnYW1tYV9sdXRfc2l6ZSwKPiA+ID4gPiAtLQo+ID4gPiA+IDIu
MjAuMQo+ID4gPiA+Cj4gPiAKPiAKPiAKPiAtLSAKPiBNaWhhaWwKPiAKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
