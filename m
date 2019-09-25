Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233AEBDAEE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 11:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1351C6EB59;
	Wed, 25 Sep 2019 09:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40059.outbound.protection.outlook.com [40.107.4.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F996EB59
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 09:28:56 +0000 (UTC)
Received: from VE1PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:803:104::25)
 by HE1PR0802MB2154.eurprd08.prod.outlook.com (2603:10a6:3:c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Wed, 25 Sep
 2019 09:28:51 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VE1PR08CA0012.outlook.office365.com
 (2603:10a6:803:104::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 25 Sep 2019 09:28:51 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25 via Frontend Transport; Wed, 25 Sep 2019 09:28:49 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Wed, 25 Sep 2019 09:28:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41fddb4900c77cd9
X-CR-MTA-TID: 64aa7808
Received: from 070cc776db6c.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FA97B3C-748A-46CE-9B3C-2E08A2BC77AC.1; 
 Wed, 25 Sep 2019 09:28:30 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 070cc776db6c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Sep 2019 09:28:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRm0iCAV3Wlbq/WKff+NlkC0pgVrd4oRfBW34LRKxfghGCpj23IWHb6tdcGahi4vKfVHAFZK2G2UjiZQ3CUkJXjoTvUx5P7DE336TLSc6a9C+pe1jUBqUppNRH4pp9n763czA3Xjkctf1bVS8WZUhhbBKxmlMQo2zY1vZUrOwlMQ+Gx35jK7dqGbzm7SlGhr4G652Hx6J19rs1+A+9wrFDu33PqN8evSvkfb9qJZ49u2R2grykwHJBvx31C+e0HhZfdIIfQK4hcinn5HwCxw7w+lugwbU/IkK+bKSNAtBK/8+gYURhVKxeVLcAOH7dNR8Cl49jmvuu/sRMPbwzpjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+twphkDJ9JcFdEgLrB08rYZxiEbo19/WzIrJ+I0j9LM=;
 b=FUZlxYopA9Ggztqdas0LmhZcp54A1GmdKyhef3V91bny9ZGVHNKyIG4hpdJXb9PIhHcUHZhvhnbwOX3Zerp7aNSi4qVjlFeLlJz06Xsi+jw9JOVQHdXY4kKwboU+rHnff8EKN3CbCHZQ1iMPq4rE2LPnvrM3h6zDAeBh5HpbPxk6xDSg1XO4aWZ8sn44zO3vFXTykOlfaIF7A3GSm6l0H5hVOjMsF3p+axgX68iU6bwMV2oKjU1iquRHTmremvgRjgsOkeJ5xfAe4oDnmiTok0NMEJcDa+l8MIcexP0qlTMyOpH7Y5KKSQ6H/UF2Qp9lq/AvauadoMTzL5tppAG1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from DB8PR08MB5354.eurprd08.prod.outlook.com (52.133.240.216) by
 DB8PR08MB5066.eurprd08.prod.outlook.com (10.255.17.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Wed, 25 Sep 2019 09:28:27 +0000
Received: from DB8PR08MB5354.eurprd08.prod.outlook.com
 ([fe80::b076:40e8:6e7b:6a18]) by DB8PR08MB5354.eurprd08.prod.outlook.com
 ([fe80::b076:40e8:6e7b:6a18%3]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 09:28:27 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] drm/rockchip: Add AFBC support
Thread-Topic: [PATCH] drm/rockchip: Add AFBC support
Thread-Index: AQHVcglQgFQKNg7dnEKeB+EcOCgUI6c5SHCAgAAcMgCAAr5zAA==
Date: Wed, 25 Sep 2019 09:28:26 +0000
Message-ID: <20190925092824.GA21018@arm.com>
References: <20190923122014.18229-1-andrzej.p@collabora.com>
 <da7f0c5e-9ca9-020d-5366-2b21a42acdff@baylibre.com>
 <332335a5-dc7f-2cce-601f-f73e9243dee5@collabora.com>
In-Reply-To: <332335a5-dc7f-2cce-601f-f73e9243dee5@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::19) To DB8PR08MB5354.eurprd08.prod.outlook.com
 (2603:10a6:10:114::24)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 88959839-4a53-4235-aaf2-08d7419ac5de
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR08MB5066; 
X-MS-TrafficTypeDiagnostic: DB8PR08MB5066:|HE1PR0802MB2154:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <HE1PR0802MB21545E97F3B274EAB50189B7E4870@HE1PR0802MB2154.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(199004)(189003)(51744003)(66946007)(2906002)(5660300002)(6486002)(476003)(86362001)(2616005)(52116002)(54906003)(102836004)(81166006)(81156014)(6436002)(256004)(44832011)(6506007)(386003)(1076003)(316002)(33656002)(229853002)(4326008)(8676002)(7416002)(486006)(76176011)(66066001)(36756003)(8936002)(71200400001)(186003)(25786009)(66446008)(6916009)(7736002)(14454004)(6512007)(478600001)(413944005)(966005)(26005)(66556008)(11346002)(64756008)(66476007)(6306002)(71190400001)(446003)(6116002)(6246003)(305945005)(99286004)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5066;
 H:DB8PR08MB5354.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: GbH09oawjotp5S9z4ljqkGA4ZHEEknf86gj4ndVzLNFzjN5idLQygrc7fnU9ryT4JRHCxheHC4E2eX0DM15SoN4F+KULbjwEKsWGNK76v0RxsSYZM9tbcOMnk8TDrgI/nTUyzLPlpADnZujNtNZEHkKJCmxrzXATdyld8IrhUq3rKq23vuHrT83CVBkCiH6uL2qXFAsc5rr1hrbuorEJat3b92NhdZzSmlf5LytGwplUvJM29l7UdA4kfnU51Kf517wBT9ZPTIyith10d2lcclAMDbhT1pUpOouo5poYceXzlCRh24nEhGaBYcOrCbIOhkpq9x0eAAWroBGAiHU2TACPxtb5HW6Uu7a7xblRjRhDI0yA2p4hHtS9SuIUqpTZM3s+ncMBPZQdZhrxo/Rj9NNmjwoY5Xt9dLSIRzw/yRb/f8RQj/HYjMaPiS6AgYokQdbtVra2ZAndBR1vBxVxxA==
x-ms-exchange-transport-forked: True
Content-ID: <5495A5E01BDFF9419EECBCB110C451E4@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5066
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(51744003)(189003)(199004)(7736002)(2616005)(316002)(6512007)(81166006)(36756003)(26005)(102836004)(186003)(33656002)(386003)(70206006)(70586007)(47776003)(99286004)(356004)(3846002)(6116002)(5660300002)(54906003)(6506007)(8746002)(76130400001)(8936002)(66066001)(305945005)(23756003)(4326008)(86362001)(63350400001)(126002)(446003)(26826003)(36906005)(476003)(1076003)(8676002)(478600001)(413944005)(76176011)(486006)(966005)(6246003)(22756006)(11346002)(50466002)(81156014)(2906002)(14454004)(229853002)(336012)(6862004)(6486002)(25786009)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2154;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ad1ed8a6-a03b-4305-ecc8-08d7419ab7a4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:HE1PR0802MB2154; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: dpND30kTynyYGbgk1vmyuKP27reGuEWEvCiDxzkx3YDFUEgMEVj+kC7q1nqkwC2Uow8TMVGgjPtr0Mi4LhqYQRGQs0E4SgZeLDB29WjfJrdXvNbqClJsgauyTfGtPnY91ainfmXmvkTRyDpwlITcVaB1FVdzIciXowlFm6mGYXxWIK6FeBkcxZiNaM6ovMc4vg4HjtzELUQBIeUzcRbB9z7ErmsBuErF0K6CmHnGuIxbskekKnBqHaAxOaz3BKdc6lJxcLvU1cCnLosWZp5IplxF+mtcYl5OLCu/9YFBKKVWii9A9CrBszutFwkuqeNnolr+VuMNkrPQYhTYc+QB9+Et/1N6OPCwIKTxc/OP6wp5PgK/ONEjSp/Svs2/HFq0k13A3dlLS9DDI0iBMwHJdJJOnee9cuEk2m6tXMnNGEYtAuIgAoTt0/1Fk3+XGtIpZhJIdzON+Dg49+XQ9YzWfQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 09:28:49.6137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88959839-4a53-4235-aaf2-08d7419ac5de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2154
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+twphkDJ9JcFdEgLrB08rYZxiEbo19/WzIrJ+I0j9LM=;
 b=VsGpBtBeyepsWqPxtbndxEmMG4YlQ3ZOWwsatHRJwCEPThkkD5lyT8Qi9hqUqOMBkAtu/D37eI1kQRZkSjumuvgR3iWkpN54HN3LCOljC7lFL4G+DcvxD81eEkEg59daVGeq62StjA+4mb0d01xAErNUXb5QvdCsbBlz2ptzRVA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+twphkDJ9JcFdEgLrB08rYZxiEbo19/WzIrJ+I0j9LM=;
 b=VsGpBtBeyepsWqPxtbndxEmMG4YlQ3ZOWwsatHRJwCEPThkkD5lyT8Qi9hqUqOMBkAtu/D37eI1kQRZkSjumuvgR3iWkpN54HN3LCOljC7lFL4G+DcvxD81eEkEg59daVGeq62StjA+4mb0d01xAErNUXb5QvdCsbBlz2ptzRVA=
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
Cc: nd <nd@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Maxime Ripard <mripard@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDU6MzQ6MTRQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IERlYXIgQWxsLAo+IAo+IEFzIGEgcmVzdWx0IG9mIG15IG1pc3Rha2Ug
SSd2ZSBzZW50IHRoaXMgcGF0Y2ggd2l0aCBhbiBpbmNvcnJlY3QgU09CIGNoYWluLgo+IFBsZWFz
ZSBraW5kbHkgZGlzcmVnYXJkIHRoaXMgcGF0Y2guCj4gCj4gQE5laWw6IHRoYW5rIHlvdSBmb3Ig
eW91ciB0aW1lIHlvdSBzcGVudCByZXZpZXdpbmcgaXQgYW5kIGFuc3dlcmluZyBhbmQgSSdtCj4g
c29ycnkgaXQncyB0byBubyBlZmZlY3QuCj4gQEV6ZXF1aWVsLCBAVG9tZXU6IEkgYXBvbG9naXpl
IHRvIHlvdS4gTXkgbWlzdGFrZS4KPiAKPiBSZWdhcmRzLAo+IAo+IEFuZHJ6ZWogUGlldHJhc2ll
d2ljego+IAo+IAo+IFcgZG5pdSAyMy4wOS4yMDE5IG/CoDE1OjUzLCBOZWlsIEFybXN0cm9uZyBw
aXN6ZToKPiA+T24gMjMvMDkvMjAxOSAxNDoyMCwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3Rl
Ogo+ID4+RnJvbTogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgo+ID4+
Cj4gPj5BRkJDIGlzIGEgcHJvcHJpZXRhcnkgbG9zc2xlc3MgaW1hZ2UgY29tcHJlc3Npb24gcHJv
dG9jb2wgYW5kIGZvcm1hdC4KPiA+Pkl0IGhlbHBzIHJlZHVjZSBtZW1vcnkgYmFuZHdpZHRoIG9m
IHRoZSBncmFwaGljcyBwaXBlbGluZSBvcGVyYXRpb25zLgo+ID4+VGhpcywgaW4gdHVybiwgaW1w
cm92ZXMgcG93ZXIgZWZmaWNpZW5jeS4KPiA+Pgo+ID4+U2lnbmVkLW9mZi1ieTogRXplcXVpZWwg
R2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgo+ID4+W2xvY2tpbmcgaW1wcm92ZW1lbnRz
XQo+ID4+U2lnbmVkLW9mZi1ieTogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3Jh
LmNvbT4KPiA+PltzcXVhc2hpbmcgdGhlIGFib3ZlLCBjb21taXQgbWVzc2FnZSBhbmQgUm9ja2No
aXAgQUZCQyBtb2RpZmllcl0KPiA+PlNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2lj
eiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gPj4tLS0KPiA+PiAgZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jICB8IDI3ICsrKysrKwo+ID4+ICBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIHwgOTQgKysrKysrKysrKysrKysrKysr
KystCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmggfCAx
MiArKysKPiA+PiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcuYyB8
IDE4ICsrKysKPiA+PiAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggICAgICAgICAgICAg
ICB8ICAzICsKPiA+PiAgNSBmaWxlcyBjaGFuZ2VkLCAxNTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiA+Pgo+ID4KPiA+Wy4uLl0KPiA+Cj4gPj5kaWZmIC0tZ2l0IGEvaW5jbHVkZS91
YXBpL2RybS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ID4+
aW5kZXggM2ZlZWFhM2Y5ODdhLi5iYTZjYWYwNmM4MjQgMTAwNjQ0Cj4gPj4tLS0gYS9pbmNsdWRl
L3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ID4+KysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91
cmNjLmgKPiA+PkBAIC03NDIsNiArNzQyLDkgQEAgZXh0ZXJuICJDIiB7Cj4gPj4gICAqLwo+ID4+
ICAjZGVmaW5lIEFGQkNfRk9STUFUX01PRF9CQ0ggICAgICgxVUxMIDw8IDExKQo+ID4+KyNkZWZp
bmUgQUZCQ19GT1JNQVRfTU9EX1JPQ0tDSElQIFwKPiA+PisJKEFGQkNfRk9STUFUX01PRF9CTE9D
S19TSVpFXzE2eDE2IHwgQUZCQ19GT1JNQVRfTU9EX1NQQVJTRSkKPiA+Cj4gPlRoaXMgZGVmaW5l
IGxvb2tzIHVzZWxlc3MsIHdoYXQncyBSb2NrY2hpcCBzcGVjaWZpYyBoZXJlID8KPiA+ClBsZWFz
ZSByZXVzZSB0aGUgZXhpc3RpbmcgQUZCQyBtb2RpZmllcnMuCgpIYXZlIGEgbG9vayBhdCBtYWxp
ZHBfZm9ybWF0X21vZGlmaWVyc1tdIGluIHdoaWNoIHdlIGhhdmUgZGVmaW5lZAp0aGUgbW9kaWZp
ZXJzKGZvciBvdXIgZHJpdmVyKSB3ZSBhcmUgdXNpbmcuCgpJbiB5b3VyIGNhc2UsIGl0IHdpbGwg
YmUKRFJNX0ZPUk1BVF9NT0RfQVJNX0FGQkMoQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfMTZ4
MTZ8QUZCQ19GT1JNQVRfTU9EX1NQQVJTRSkKCj4gPk5laWwKPiA+Cj4gPj4rCj4gPj4gIC8qCj4g
Pj4gICAqIEFsbHdpbm5lciB0aWxlZCBtb2RpZmllcgo+ID4+ICAgKgo+ID4+Cj4gPgo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
