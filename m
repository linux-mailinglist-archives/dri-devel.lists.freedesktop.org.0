Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45156632A3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 10:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A008895E7;
	Tue,  9 Jul 2019 08:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40073.outbound.protection.outlook.com [40.107.4.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3503089452
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 08:08:53 +0000 (UTC)
Received: from DB7PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:5:16::39) by
 AM0PR08MB4947.eurprd08.prod.outlook.com (2603:10a6:208:158::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.17; Tue, 9 Jul
 2019 08:08:50 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by DB7PR08CA0026.outlook.office365.com
 (2603:10a6:5:16::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.19 via Frontend
 Transport; Tue, 9 Jul 2019 08:08:50 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 9 Jul 2019 08:08:48 +0000
Received: ("Tessian outbound 86cdd11d53e6:v23");
 Tue, 09 Jul 2019 08:08:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 968706cc3ede4a85
X-CR-MTA-TID: 64aa7808
Received: from 0a7ffd86b13f.1 (cr-mta-lb-1.cr-mta-net [104.47.14.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B88D8989-687E-4BA7-9884-ABCCD7B97499.1; 
 Tue, 09 Jul 2019 08:08:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a7ffd86b13f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 09 Jul 2019 08:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQDrlxFdvDJHdO48n9ovL2Ym9rm/D8m5N/HLqTOuo0QCmQ1mEqhsCaIXQTC3+eMKn+Ai0X/DgFEz9RNXBkuY4hrvPw9+L9qIi6xGFj80IE6Zz9UDrdKQ7mXO8niILWif7oVq/gq2HUA/tb/fgXlhOZnNMnbAl3lLqWV85fLttz/FBMnUqx+Xb9uX8oTQla4S9R3nZkDWixckt32DHKfBJG8kbMwzHBx8iAI8sWuvs1Juyxfi50qbQkX2Ed0uLkS8n8THTOfb2fX1xfSN+g+qJEF8uhqoe/9rP/ZrU5t9MEroxmHAYGGuYflblGWwBbQHYrmH/LW2leZADAhypnNE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeqtQcu9aukcf+XZviz2iXhAMlzuzjK3KoiWLK7S5H0=;
 b=Avm+j0PvCi1pVaVRvVAlI8QiD73ers7azCpJZUgaxUyFGRkIwrzbaR9408tNqLPiOALtbTc5p9Oz2TKBhNYMSbbQFsb41uowXsyFuySCZP21UjYZH5SOo4Gk87LVm350pUKiTlO/g94y0A5mmajVhM2kdQQ/SGfGOEdTgcBT+MNdQV1pa+7fMpXwPFFxs0WAU4cLMORuzpoThTgSKV400EL2hhcoo2Xi5l4uQdDpd9sAEQvvQAG84Qa4xp8Wz7bPxGevzKtq19WmtHe/ChlgMRXNT9MP4xthMgjJ4bdYHkWeb34ASJEJL8r1P+ZMsf31na3b+trCxrW+3qFw8BVEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1SPR01MB0008.eurprd08.prod.outlook.com (20.179.193.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 08:08:37 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Tue, 9 Jul 2019
 08:08:37 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/5] drm/komeda: Remove layer_split property
Thread-Topic: [PATCH 4/5] drm/komeda: Remove layer_split property
Thread-Index: AQHVMyqc9ECzCCIPekm/n51qvD/SwqbB9KaA
Date: Tue, 9 Jul 2019 08:08:36 +0000
Message-ID: <20190709080829.GD22276@jamwan02-TSP300>
References: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
 <20190705121006.26085-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20190705121006.26085-4-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0219.apcprd02.prod.outlook.com
 (2603:1096:201:20::31) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d2361575-6580-4b1e-8b82-08d70444ac1b
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1SPR01MB0008; 
X-MS-TrafficTypeDiagnostic: VE1SPR01MB0008:|AM0PR08MB4947:
X-Microsoft-Antispam-PRVS: <AM0PR08MB49478F5E5166523E3D0763E4B3F10@AM0PR08MB4947.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0093C80C01
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(189003)(199004)(1076003)(73956011)(52116002)(66556008)(66476007)(66946007)(64756008)(66446008)(66066001)(14454004)(33716001)(6916009)(6436002)(6506007)(386003)(102836004)(71200400001)(71190400001)(53936002)(68736007)(55236004)(5660300002)(25786009)(9686003)(86362001)(6512007)(316002)(58126008)(33656002)(11346002)(6246003)(5024004)(256004)(2906002)(446003)(8936002)(478600001)(26005)(229853002)(4326008)(76176011)(6486002)(486006)(7736002)(476003)(305945005)(54906003)(6116002)(99286004)(3846002)(8676002)(81166006)(186003)(81156014)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1SPR01MB0008;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: Fi86DFGh2vT9Dq3BHYhEXfxaXRAGUtMGLRSijBhqwc3iqWTgP7XtGLG5FtRzw0+lBJtyuGC7nJpoDEkNkosrbmHH9XbKHr23vHAz2VbNNoILf1v5Rzfgagvqa+4t08/09/lAmGVglym8EURg+E+eh4nQBxOJtdAyDx+BEUw5723W3iQMntr65s+npYioMRdttGFafm9Zvdjwi/T2mqQUCFsnmImUTiXXobFF4IX5CedyaKJm04tKhnl8bBoO3M43kx3VIYz7hz4HoKXK7bdw9tCgmBf5UQnJTGd57+b1iXQWqR7kISv86+kMcen451VksY7xpHMKU365sQzqnWRZcgGmUeLglzF4H17XyFSYfCaxiHFrOTuvIrpmlrW7J29MubzMAwtYYg4AecAeWcG7gJsbaB8/BWpaoSYgdzcR9gw=
Content-ID: <112DB5AF26E9874BA7B544C3856BBBFD@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1SPR01MB0008
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(199004)(189003)(6506007)(386003)(6246003)(99286004)(2906002)(356004)(33656002)(4326008)(14454004)(76176011)(66066001)(486006)(50466002)(7736002)(58126008)(446003)(47776003)(63370400001)(126002)(6862004)(46406003)(305945005)(54906003)(33716001)(25786009)(476003)(11346002)(5024004)(63350400001)(316002)(26005)(70586007)(3846002)(22756006)(23726003)(229853002)(36906005)(478600001)(102836004)(9686003)(8676002)(1076003)(76130400001)(97756001)(81156014)(26826003)(6512007)(81166006)(70206006)(6486002)(86362001)(186003)(5660300002)(6116002)(8746002)(8936002)(336012)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4947;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8ea16728-735b-41dc-c22a-08d70444a471
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR08MB4947; 
NoDisclaimer: True
X-Forefront-PRVS: 0093C80C01
X-Microsoft-Antispam-Message-Info: EWPLPKa+wnMyEWnNph7enKGEYbbcXQ1SfxX2MOe7So7JrnRO7lDZD1/tshl0/Ij3quZvmnBrbKxu6Klmxx9lyvrZYKYDWgVJiwR8kfgu796CKJBvfQPD9+curtr9YjaI+h8q3s6mpdkXHNwgUJUNqqOCPl15WTIWZSTiSeBjSN1pieQF31AFcrylZh7u4zbtxJi4eqPNwOIvF9FjmKyY0+72qmQr63tF/6U8fGRahKyeNM3EnAqDEPvgNLM6e3lnkyaX7nyH9FTm6pwvygomCa3aS5rXCHi0ALXX2ZoZx5AaV5O9CbaKzjRkOpmp7FSL5j2omBNiudhl5hjXn5QpHBpa7l7oc5vo8wZlX9gDhAra/g2Bh/uFzU6/z50WQpVXLinceIer4Y+jigMuFSH272aJ3AEwanTM0pSNnel2vY0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 08:08:48.6667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2361575-6580-4b1e-8b82-08d70444ac1b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4947
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeqtQcu9aukcf+XZviz2iXhAMlzuzjK3KoiWLK7S5H0=;
 b=EsapQzBcI/NwVYhabGvJ05R3wWd/7Xt193mvGCYjkRhwUuB9t2YxEQXQ4hlwUqKw+TV4ZWTah15k730jQ9ig3ddgPYgfydaIIRtP7zKai7JUVUqQlC2y9ZL3cFJNp84kQpkb/Z8rCP81z3e8HDb4rU5a25qGlTOK2hUW62Vkr6o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeqtQcu9aukcf+XZviz2iXhAMlzuzjK3KoiWLK7S5H0=;
 b=EsapQzBcI/NwVYhabGvJ05R3wWd/7Xt193mvGCYjkRhwUuB9t2YxEQXQ4hlwUqKw+TV4ZWTah15k730jQ9ig3ddgPYgfydaIIRtP7zKai7JUVUqQlC2y9ZL3cFJNp84kQpkb/Z8rCP81z3e8HDb4rU5a25qGlTOK2hUW62Vkr6o=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>, "Lowry Li \(Arm
 Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDI6MTA6MDVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBQcm9wZXJ0aWVzIGFyZSB1YXBpIGxpa2UgYW55dGhpbmcgZWxzZSwgd2l0aCBhbGwg
dGhlIHVzdWFsIHJ1bGVzCj4gcmVnYXJkaW5nIHJldmlldywgdGVzdGNhc2VzLCBvcGVuIHNvdXJj
ZSB1c2Vyc3BhY2UgLi4uIEZ1cnRoZXJtb3JlCj4gZHJpdmVyLXByaXZhdGUga21zIHByb3BlcnRp
ZXMgYXJlIGhpZ2hseSBkaXNjb3VyYWdlZCwgb3ZlciB0aGUgcGFzdAo+IGZldyB5ZWFycyB3ZSd2
ZSByZWFsaXplZCB3ZSBuZWVkIHRvIG1ha2UgYSBzZXJpb3VzIGVmZm9ydCBhdCBiZXR0ZXIKPiBz
dGFuZGFyZGl6aW5nIHRoaXMgc3R1ZmYuCj4gCj4gQWdhaW4gdGhpcyBwcm9iYWJseSBuZWVkcyBt
dWx0aXBsZSBwaWVjZXMgdG8gc29sdmUgdGhpcyBwcm9wZXJseToKPiAKPiAtIEluc3RlYWQgb2Yg
ZXhwZWN0aW5nIHVzZXJzcGFjZSB0byBjb21wdXRlIHRoaXMgKGFuZCBkdXBsaWNhdGluZwo+ICAg
bW9kZXNldCBjb2RlKSwgdGhlIGtlcm5lbCBkcml2ZXIgc2hvdWxkIGNvbXB1dGUgd2hlbiBpdCdz
IG5lY2Vzc2FyeQo+ICAgdG8gZW5hYmxlIGxheWVyX3NwbGl0IG1vZGUgdG8gbWFrZSBhIGNvbmZp
Z3VyYXRpb24gcG9zc2libGUuIEkuZS4gaW4KPiAgIGtvbWVkYV9wbGFuZV9hdG9taWNfY2hlY2so
KSBmaXJzdCB0cnkga29tZWRhX2J1aWxkX2xheWVyX2RhdGFfZmxvdygpCj4gICBhbmQgaWYgdGhh
dCBmYWlscywgdHJ5IGtvbWVkYV9idWlsZF9sYXllcl9zcGxpdF9kYXRhX2Zsb3coKSwgYW5kIHNl
dAo+ICAgZGZsb3cuZW5fc3BsaXQgYWNjb3JkaW5nbHkuIEFzc3VtaW5nIEkgdW5kZXJzdGFuZCBz
b21ld2hhdCBjb3JyZWN0bHkKPiAgIHdoYXQgdGhpcyBkb2VzLgo+IAo+IC0gSWYgdGhpcyBpcyBu
ZWVkZWQgZm9yIHZhbGlkYXRpb24gdGhlbiB5b3Ugd2FudCBhIGRlYnVnZnMgZmlsZSB0bwo+ICAg
Zm9yY2UgdGhpcyBvbmUgd2F5IG9yIHRoZSBvdGhlciwgb3IgYWx0ZXJuYXRpdmVseSAgdXNlCj4g
ICAtPmF0b21pY19wcmludF9zdGF0ZSB0byBkdW1wIHN1Y2ggaGlkZGVuIGRyaXZlci1wcml2YXRl
IHN0YXRlLgo+ICAgRGVwZW5kcyB1cG9uIGhvdyB5b3UgZG8geW91ciB2YWxpZGF0aW9uIG9mYy4K
PiAKPiBGaXhlczogYTQwN2E2NTA5MzkzICgiZHJtL2tvbWVkYTogQWRkIGxheWVyIHNwbGl0IHN1
cHBvcnQiKQo+IENjOiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBh
cm0uY29tPgo+IENjOiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFt
ZXMucWlhbi53YW5nQGFybS5jb20+Cj4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0u
Y29tPgo+IENjOiBNYWxpIERQIE1haW50YWluZXJzIDxtYWxpZHBAZm9zcy5hcm0uY29tPgo+IENj
OiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpIaSBEYW5pZWw6ClRoYW5r
IHlvdSBmb3IgdGhlIHBhdGNoIQoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRl
Y2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KCj4gLS0tCj4gIC4uLi9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAzIC0KPiAgLi4uL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIHwgNjEgLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDY0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gaW5kZXggZmIy
YWRjMjMzNzYwLi4wYzAwNjU3NmEyNWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAo+IEBAIC0zMyw5ICszMyw2IEBAIHN0cnVjdCBr
b21lZGFfcGxhbmUgewo+ICAJICogTGF5ZXJzIHdpdGggc2FtZSBjYXBhYmlsaXRpZXMuCj4gIAkg
Ki8KPiAgCXN0cnVjdCBrb21lZGFfbGF5ZXIgKmxheWVyOwo+IC0KPiAtCS8qKiBAcHJvcF9sYXll
cl9zcGxpdDogZm9yIG9uL29mZiBsYXllcl9zcGxpdCAqLwo+IC0Jc3RydWN0IGRybV9wcm9wZXJ0
eSAqcHJvcF9sYXllcl9zcGxpdDsKPiAgfTsKPiAgCj4gIC8qKgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+IGluZGV4IDIzZGIzODY1
MGE0Ni4uNWJiODU1M2NjMTE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gQEAgLTE4OCw0MCArMTg4LDYgQEAga29tZWRh
X3BsYW5lX2F0b21pY19kZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAJ
a2ZyZWUodG9fa3BsYW5lX3N0KHN0YXRlKSk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQKPiAta29t
ZWRhX3BsYW5lX2F0b21pY19nZXRfcHJvcGVydHkoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4g
LQkJCQkgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUsCj4gLQkJCQkgc3RydWN0
IGRybV9wcm9wZXJ0eSAqcHJvcGVydHksCj4gLQkJCQkgdWludDY0X3QgKnZhbCkKPiAtewo+IC0J
c3RydWN0IGtvbWVkYV9wbGFuZSAqa3BsYW5lID0gdG9fa3BsYW5lKHBsYW5lKTsKPiAtCXN0cnVj
dCBrb21lZGFfcGxhbmVfc3RhdGUgKnN0ID0gdG9fa3BsYW5lX3N0KHN0YXRlKTsKPiAtCj4gLQlp
ZiAocHJvcGVydHkgPT0ga3BsYW5lLT5wcm9wX2xheWVyX3NwbGl0KQo+IC0JCSp2YWwgPSBzdC0+
bGF5ZXJfc3BsaXQ7Cj4gLQllbHNlCj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4gLQo+IC0JcmV0dXJu
IDA7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbnQKPiAta29tZWRhX3BsYW5lX2F0b21pY19zZXRfcHJv
cGVydHkoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gLQkJCQkgc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqc3RhdGUsCj4gLQkJCQkgc3RydWN0IGRybV9wcm9wZXJ0eSAqcHJvcGVydHksCj4gLQkJ
CQkgdWludDY0X3QgdmFsKQo+IC17Cj4gLQlzdHJ1Y3Qga29tZWRhX3BsYW5lICprcGxhbmUgPSB0
b19rcGxhbmUocGxhbmUpOwo+IC0Jc3RydWN0IGtvbWVkYV9wbGFuZV9zdGF0ZSAqc3QgPSB0b19r
cGxhbmVfc3Qoc3RhdGUpOwo+IC0KPiAtCWlmIChwcm9wZXJ0eSA9PSBrcGxhbmUtPnByb3BfbGF5
ZXJfc3BsaXQpCj4gLQkJc3QtPmxheWVyX3NwbGl0ID0gISF2YWw7Cj4gLQllbHNlCj4gLQkJcmV0
dXJuIC1FSU5WQUw7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gLX0KPiAtCj4gIHN0YXRpYyBib29sCj4g
IGtvbWVkYV9wbGFuZV9mb3JtYXRfbW9kX3N1cHBvcnRlZChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSwKPiAgCQkJCSAgdTMyIGZvcm1hdCwgdTY0IG1vZGlmaWVyKQo+IEBAIC0yNDEsMzIgKzIwNyw5
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIGtvbWVkYV9wbGFuZV9mdW5j
cyA9IHsKPiAgCS5yZXNldAkJCT0ga29tZWRhX3BsYW5lX3Jlc2V0LAo+ICAJLmF0b21pY19kdXBs
aWNhdGVfc3RhdGUJPSBrb21lZGFfcGxhbmVfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSwKPiAgCS5h
dG9taWNfZGVzdHJveV9zdGF0ZQk9IGtvbWVkYV9wbGFuZV9hdG9taWNfZGVzdHJveV9zdGF0ZSwK
PiAtCS5hdG9taWNfZ2V0X3Byb3BlcnR5CT0ga29tZWRhX3BsYW5lX2F0b21pY19nZXRfcHJvcGVy
dHksCj4gLQkuYXRvbWljX3NldF9wcm9wZXJ0eQk9IGtvbWVkYV9wbGFuZV9hdG9taWNfc2V0X3By
b3BlcnR5LAo+ICAJLmZvcm1hdF9tb2Rfc3VwcG9ydGVkCT0ga29tZWRhX3BsYW5lX2Zvcm1hdF9t
b2Rfc3VwcG9ydGVkLAo+ICB9Owo+ICAKPiAtc3RhdGljIGludAo+IC1rb21lZGFfcGxhbmVfY3Jl
YXRlX2xheWVyX3Byb3BlcnRpZXMoc3RydWN0IGtvbWVkYV9wbGFuZSAqa3BsYW5lLAo+IC0JCQkJ
ICAgICBzdHJ1Y3Qga29tZWRhX2xheWVyICpsYXllcikKPiAtewo+IC0Jc3RydWN0IGRybV9kZXZp
Y2UgKmRybSA9IGtwbGFuZS0+YmFzZS5kZXY7Cj4gLQlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSA9
ICZrcGxhbmUtPmJhc2U7Cj4gLQlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpwcm9wID0gTlVMTDsKPiAt
Cj4gLQkvKiBwcm9wZXJ0eTogbGF5ZXIgc3BsaXQgKi8KPiAtCWlmIChsYXllci0+cmlnaHQpIHsK
PiAtCQlwcm9wID0gZHJtX3Byb3BlcnR5X2NyZWF0ZV9ib29sKGRybSwgRFJNX01PREVfUFJPUF9B
VE9NSUMsCj4gLQkJCQkJCSJsYXllcl9zcGxpdCIpOwo+IC0JCWlmICghcHJvcCkKPiAtCQkJcmV0
dXJuIC1FTk9NRU07Cj4gLQkJa3BsYW5lLT5wcm9wX2xheWVyX3NwbGl0ID0gcHJvcDsKPiAtCQlk
cm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIHByb3AsIDApOwo+IC0JfQo+
IC0KPiAtCXJldHVybiAwOwo+IC19Cj4gLQo+ICAvKiBmb3Iga29tZWRhLCB3aGljaCBpcyBwaXBl
bGluZSBjYW4gYmUgc2hhcmUgYmV0d2VlbiBjcnRjcyAqLwo+ICBzdGF0aWMgdTMyIGdldF9wb3Nz
aWJsZV9jcnRjcyhzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiAgCQkJICAgICAgc3RydWN0
IGtvbWVkYV9waXBlbGluZSAqcGlwZSkKPiBAQCAtMzYwLDEwICszMDMsNiBAQCBzdGF0aWMgaW50
IGtvbWVkYV9wbGFuZV9hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4gIAlpZiAoZXJy
KQo+ICAJCWdvdG8gY2xlYW51cDsKPiAgCj4gLQllcnIgPSBrb21lZGFfcGxhbmVfY3JlYXRlX2xh
eWVyX3Byb3BlcnRpZXMoa3BsYW5lLCBsYXllcik7Cj4gLQlpZiAoZXJyKQo+IC0JCWdvdG8gY2xl
YW51cDsKPiAtCj4gIAllcnIgPSBkcm1fcGxhbmVfY3JlYXRlX2NvbG9yX3Byb3BlcnRpZXMocGxh
bmUsCj4gIAkJCUJJVChEUk1fQ09MT1JfWUNCQ1JfQlQ2MDEpIHwKPiAgCQkJQklUKERSTV9DT0xP
Ul9ZQ0JDUl9CVDcwOSkgfAo+IC0tIAo+IDIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
