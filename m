Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B7BDB62
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 11:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AB76E830;
	Wed, 25 Sep 2019 09:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AAF6E830
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 09:48:25 +0000 (UTC)
Received: from VI1PR08CA0102.eurprd08.prod.outlook.com (2603:10a6:800:d3::28)
 by AM5PR0801MB1619.eurprd08.prod.outlook.com (2603:10a6:203:3b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Wed, 25 Sep
 2019 09:48:21 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VI1PR08CA0102.outlook.office365.com
 (2603:10a6:800:d3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Wed, 25 Sep 2019 09:48:21 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Wed, 25 Sep 2019 09:48:20 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Wed, 25 Sep 2019 09:48:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9612447dfafb14a
X-CR-MTA-TID: 64aa7808
Received: from 3951e8f2968b.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BFE2200B-9675-402D-A9F6-3130351B7EAF.1; 
 Wed, 25 Sep 2019 09:48:14 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3951e8f2968b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 25 Sep 2019 09:48:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/Gdz61n16ZY9vFBqtkOEQnpwjj7zztpDuzNHRViFR4ODURrJelmoY7vGMLlyCShknlGMmvuqlp0eS9GASL4EfkOLBTcWfQVGaWVcSi/5NamAOP9ed0k8xjPDVOM9dKaEhP1Nl+3FcHE+QwAw8Ur/QOaW8+9N5DYlWD0WSBnkPmTq21jK57k9VncLphRKBl1/IIGH3pO5tH8qAgXkH7INFwlrcLC8jG8xY28tUpzBv484bTt1qn4QUN5NjAR1TXQ970kyl12UeqGZHa+B0cCSR68zrnag62PV1v6u9iDLk7OOomzGeqitF+P4lnWeMhKdjMKG1KlU74/1GdA6JlD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT9TiMn8fCfYuFAz9/p8gjs8ol/FhfFwFX0TadnKOXA=;
 b=Pk8TUc9KWsywUVrNr5I5SaH+ZtW31s+FTZ/kMf/coVkAX7vqwyKjFrIgzJfUOWLmXCVnSuJpK6tEVBMd8hnVJ/nAsBkWOS8HFFSfdw90zvsHniCl0ouC/IfEKEUXJ757vyRd5Tw1lb1RNx2XzgBxrT6vmicFE7y1ozvJtxN6GePyz28R9eFvDo3orpb5x7qyVBI7209SdHCe96LzUFCidVowK7cpa8rI8FUg7r7KLi7Of1fzN8NVGz30n+MwtAtmqYzt6r4bDliq9opubabK1jKqXbIiP2VMbdGVbi6SEayrFxpimbzrxeqxzAu4Gxg6F+6jgSZerXEosJbqrnW5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB4231.eurprd08.prod.outlook.com (20.179.18.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 09:48:12 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 09:48:12 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Topic: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Index: AQHVb5fml3iiEtk+MEOqXjNduhm+kKc5MiiAgADp5ICAAhFyAA==
Date: Wed, 25 Sep 2019 09:48:11 +0000
Message-ID: <20190925094810.fbeyt7fxvyhaip33@DESKTOP-E1NTVVP.localdomain>
References: <20190920094329.17513-1-lowry.li@arm.com>
 <20190923121604.jqi6ewln27yvdajw@DESKTOP-E1NTVVP.localdomain>
 <20190924021313.GA15776@jamwan02-TSP300>
In-Reply-To: <20190924021313.GA15776@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.32]
x-clientproxiedby: AM3PR05CA0091.eurprd05.prod.outlook.com
 (2603:10a6:207:1::17) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a528d5e0-bb4d-41ed-ca7b-08d7419d7f88
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB4231; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB4231:|AM6PR08MB4231:|AM5PR0801MB1619:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1619E6EF45EBA1F64379289EF0870@AM5PR0801MB1619.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(189003)(199004)(102836004)(6436002)(305945005)(486006)(6862004)(44832011)(6246003)(1076003)(7736002)(2906002)(14454004)(86362001)(476003)(229853002)(66446008)(81166006)(81156014)(8676002)(11346002)(446003)(8936002)(6486002)(64756008)(66066001)(58126008)(316002)(66556008)(66476007)(54906003)(9686003)(6512007)(66946007)(256004)(99286004)(4744005)(25786009)(4326008)(478600001)(26005)(186003)(3846002)(71200400001)(71190400001)(6116002)(386003)(6506007)(6636002)(5660300002)(76176011)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4231;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: sDkKLmIQzTa44AB9zscpluNU4dhVKCTfuhMlcOgpqvaC4WsZHnxYw9whVJreYTq8707VCYArvGCZzYzj4RgJ56caHBj7nevRky8zl18u86mgwx/6XoDkvZVPX+XPmzLdtKqhWM/DEaosL60dH1sd9y9M2hTMLNuMSLu3naszfxaJvXW1cjNMJXALXcpXPfYMH1RSSwsyJD/7ClNuzDWVIfjCWKW4kzbjDOP4EdaeuBYFZ4rZtzZ4Yj9W1UalZ+Rlr0J1FmFYlrioOwHzUSwpBS1Lssr/Y7WTGXEzcNeOD9G6kXBQOqcLMQ+UiOk/FTxXhok2XpPvIDRCi5ioQL25qBh43EoMycJJwCaCzD6r/k5sloNBz3W7DmjLxQcec9zOLLsSK0CtXHEWPYHFocKPTTCABwt4gNpBD+5qR9xVFDM=
Content-ID: <CD3FA5EF4B04414FA91BB47E413CA53A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4231
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(102836004)(6246003)(186003)(70206006)(70586007)(76130400001)(8746002)(86362001)(81156014)(8676002)(6862004)(97756001)(25786009)(4326008)(46406003)(126002)(446003)(26826003)(476003)(478600001)(63350400001)(486006)(2906002)(6636002)(11346002)(81166006)(23726003)(1076003)(305945005)(7736002)(3846002)(6116002)(5660300002)(47776003)(66066001)(336012)(14454004)(4744005)(6486002)(22756006)(54906003)(356004)(76176011)(229853002)(99286004)(50466002)(9686003)(6512007)(26005)(316002)(8936002)(58126008)(386003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1619;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 79ba2cde-347d-4f03-34a0-08d7419d7a51
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM5PR0801MB1619; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: X3mFIMZTZx0sRJX4DdF1JteB+L/Xb95A2vRsKtC+hls/coEE35QbnMIXrVRbu9TtTln2JVkez0Nayv+Nm4u7VPhZnJW4/V8wZlnThXbyfs07HJBrY7fxQmayCOuK7XEqeM3FOuEJ8tqoNN9Uu2b9rZIGNcjrTc2B00k/VtTKat6SVkXfRA2Ojegdc7O6mi6+1W0Stgna1FpsS6k/7lVjWAaGCDQn6lDabty11jCPUl3Y9rS4si8HePixwCQwms0MeZsy2Hqvfa+VfWgv6O9ieFikHLvGVX8YaUmwhfUfnODxEh8hwIgXufHcFiakXiczhQPzAvfPeFo/PhtaoLHaP/xrfTDPhvho9daVw9sG3fRylRna3zSkyIp9Bf4xgq1a4vEyeLSSIdSwGOAkmYEb2qKmaL4/dXXhXgIIG26RNMo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 09:48:20.1016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a528d5e0-bb4d-41ed-ca7b-08d7419d7f88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1619
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT9TiMn8fCfYuFAz9/p8gjs8ol/FhfFwFX0TadnKOXA=;
 b=j7vKzcLhM1P5jDRL/PZD/Ef/GR1bUZmvB9TlNP2eInZCrPiDJEV2q8jjkmLobD52p04rMPpOqBrSmbkUhNU6+JGSzHf0J2T3PF5dgcyyU2PBVXj6fLExf45QABQY+KFG08flrttyH4XBDR+2jddm3VAtMRb1A5rWbu84PjEraOw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT9TiMn8fCfYuFAz9/p8gjs8ol/FhfFwFX0TadnKOXA=;
 b=j7vKzcLhM1P5jDRL/PZD/Ef/GR1bUZmvB9TlNP2eInZCrPiDJEV2q8jjkmLobD52p04rMPpOqBrSmbkUhNU6+JGSzHf0J2T3PF5dgcyyU2PBVXj6fLExf45QABQY+KFG08flrttyH4XBDR+2jddm3VAtMRb1A5rWbu84PjEraOw=
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
Cc: nd <nd@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsCgpPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCAwMjoxMzoyN0FNICswMDAwLCBqYW1l
cyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiAKPiBIaSBCcmlhbjoK
PiAKPiBTaW5jZSBvbmUgbW9uaXRvciBjYW4gc3VwcG9ydCBtdXRpcGxlIGNvbG9yLWZvcm1hdHMs
IHRoaXMgRFQgcHJvcGVydHkKPiBzdXBwbHkgYSB3YXkgZm9yIHVzZXIgdG8gc2VsZWN0IGEgc3Bl
Y2lmaWMgb25lIGZyb20gdGhpcyBzdXBwb3J0ZWQKPiBjb2xvci1mb3JtYXRzLgoKTW9kaWZ5aW5n
IERUIGlzIGEgX3JlYWxseV8gdXNlci11bmZyaWVuZGx5IHdheSBvZiBzcGVjaWZ5aW5nCnByZWZl
cmVuY2VzLiBJZiB3ZSB3YW50IGEgdXNlciB0byBiZSBhYmxlIHRvIHBpY2sgYSBwcmVmZXJyZWQg
Zm9ybWF0LAp0aGVuIGl0IHNob3VsZCBwcm9iYWJseSBiZSB2aWEgdGhlIGF0b21pYyBBUEkgYXMg
VmlsbGUgbWVudGlvbmVkLgoKQ2hlZXJzLAotQnJpYW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
