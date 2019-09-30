Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F83FC2107
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 14:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28116E40D;
	Mon, 30 Sep 2019 12:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6A46E409;
 Mon, 30 Sep 2019 12:57:31 +0000 (UTC)
Received: from VE1PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:803:104::35)
 by DB6PR08MB2821.eurprd08.prod.outlook.com (2603:10a6:6:19::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Mon, 30 Sep
 2019 12:57:24 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VE1PR08CA0022.outlook.office365.com
 (2603:10a6:803:104::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Mon, 30 Sep 2019 12:57:24 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 12:57:22 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 30 Sep 2019 12:57:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 658172648fde7548
X-CR-MTA-TID: 64aa7808
Received: from 6ec6039c0c8e.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A987AD6-F5B5-43A4-B63F-0FCF2E162C24.1; 
 Mon, 30 Sep 2019 12:57:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ec6039c0c8e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 12:57:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYOiB3r8/4a5Vfanp4BMv7fimgNKKXkGBFozyIZCvnfxrRBBFOKs0oyGLZLmZ7f0xy5Kw7/TMuSa0+c954VtN3ZAI83zDZ4L0Yqih+wpJMeehjL40apIvBB+5CIn7dRyfJEZ/Dir0BcdZfW1KL/mdDWsHPr9o+3SaWgVL5LTxdgyxcA8gwet//j8lu/gJJiMaj9HfiM6TDr5nlVMdK5vnwBSiDXf+n6rXDAn9+w3ILSaDGXQkDMNtM4zSdNVlezb7Gp2XtQ/xdOZbKJu1u0KQMooasBun7YnM/3c9nsc3BL3OzEh/Givbk1F3Zj8T3XyBVphPbILElrKHrMri28Jog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USp/qlFSQOazI9QsvjgI5381RR+OS6ck15PFpYy+uQ4=;
 b=J2ypG7TTXsDwcX8Azu6gHW5VUgzDZmse9wZhZnq4gu1GZ7djmMtojZJFOtzXMwLsAaLXerOgOR7s0BgMCMtKdZRgoqNhlx73R0DYA4vUJeuBkOXe7bOXixNdrwFkXC/9FYeBbZdAHdD82/Cir3fMzvmrTYVU+CgeOKjl6eG7/Yrt52H92EvSTXkhXRhN+EaLxGUazsFjQqi//1rQmlAEBCoMiRuOf0DFGn4b9RDjiNHEMxU52WkZzOhe43MYMJ83gl0WmzuJXozlZRzxriZZPLNoyezmOZkAY2K4JiWbDDaaXUsmTv3B9ReJKyCZ3pxcub7A5m6oRA3vsK3Fh+pJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5334.eurprd08.prod.outlook.com (10.141.172.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 12:57:02 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 12:57:02 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [RFC PATCH] drm:- Add a modifier to denote 'protected' framebuffer
Thread-Topic: [RFC PATCH] drm:- Add a modifier to denote 'protected'
 framebuffer
Thread-Index: AQHVZxR6T7KOwVbC3kmqPMMH1PUhIKcv34OAgAA2VwCAAAJLAIAAFqWAgBPsV4CAADPPgA==
Date: Mon, 30 Sep 2019 12:57:02 +0000
Message-ID: <20190930125701.GA13998@arm.com>
References: <20190909134241.23297-1-ayan.halder@arm.com>
 <20190917125301.GQ3958@phenom.ffwll.local>
 <20190917160730.hutzlbuqtpmmtdz3@e110455-lin.cambridge.arm.com>
 <11689dc3-6c3e-084b-b66d-e6ccf75cb8fb@baylibre.com>
 <CAKMK7uF7oKV4609Ca4mLj7gYC1rkWnWAV7_hM5Z48Ez1cBoMqA@mail.gmail.com>
 <20190930095134.xjcucw2rrij5f4np@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190930095134.xjcucw2rrij5f4np@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0297.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::21) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3b21f747-2c20-4ccd-b955-08d745a5bc16
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:|AM7PR08MB5334:|DB6PR08MB2821:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB28216CEFA97D9C8B8AA52905E4820@DB6PR08MB2821.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(476003)(6506007)(36756003)(386003)(76176011)(186003)(52116002)(5660300002)(30864003)(66066001)(26005)(66556008)(2906002)(66446008)(64756008)(66476007)(66946007)(2616005)(99286004)(54906003)(86362001)(53546011)(102836004)(316002)(37006003)(3846002)(11346002)(446003)(6116002)(1076003)(44832011)(6246003)(14454004)(486006)(6636002)(33656002)(7416002)(7736002)(81166006)(8936002)(305945005)(25786009)(8676002)(6306002)(4326008)(71190400001)(81156014)(6862004)(71200400001)(6436002)(6512007)(6486002)(5024004)(14444005)(256004)(587094005)(478600001)(229853002)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5334;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rryBQIJ6ZaCQr6mBRCqxkhDF7ori6dp04AHgNnRznKfiTI0kWTjoDvRu3u85WYKYUHL2OeACQHl50iLzSwQZlrOufg31Z3KjtR9y4NGSHlFqo7JeXvwI0ae/pnm3G8jyMp7cwLF4FJOnlu8z1JJ830O9HQQSVrp4qV0orf4LF5+J2DHc3szrehJsGC4sfzZl2P8Ey97yDgxXymVnTpbY8GW6tbJJWF27GKRgf8FbbuVWrpfd66MKIx7DOWQn49vjrpBn0KkekJF34l0quxip1gurlfK0ZHb6NLbvP0kw4mmorv+yfg1x8RRkdPzp2QrJCkZn8fHWHQ7rbU6QC9jrI09l0hV4+QYiziNdmDeUGFU0wUnf1+7r+EDh4qe7aQ7QmYb5xLBdZI+9wCh1gcH8k70JNQTmRBliD7MZy4lGM4mwzHiZkHyxHOtM8BMN9yD9A/nztfKNvqnS5xrRT9VYXQ==
Content-ID: <9568E100547F3741B9126710B9C45687@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(486006)(66066001)(63350400001)(476003)(11346002)(450100002)(6246003)(6306002)(54906003)(305945005)(33656002)(50466002)(70586007)(6862004)(22756006)(1076003)(70206006)(126002)(7736002)(2616005)(6116002)(229853002)(47776003)(446003)(76130400001)(30864003)(336012)(6512007)(46406003)(37006003)(6486002)(36756003)(5660300002)(316002)(8676002)(5024004)(966005)(25786009)(102836004)(587094005)(6636002)(97756001)(356004)(386003)(53546011)(14454004)(6506007)(86362001)(186003)(81156014)(81166006)(99286004)(14444005)(8936002)(26005)(478600001)(26826003)(8746002)(4326008)(76176011)(23726003)(2906002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2821;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3b2dca0f-0023-4135-dcf6-08d745a5b00d
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aa8Th8CcooTnxGuKOrTe7KoDWuTd6aBD0FrNLcMukLbFGg6BlBlop7deVxTFzIcVen6sKzeGFKCYFDDEqdQ+AlbIRStPNY7z56GueOPICjkZf1cQVyGaqYOvjX9I8aPLi8tcfZjFfc1p2FxukSheESxPtYDOydS7XAqk1ntMKh1i7otet6AnLzemfuVCpYms2Os1iYunElBtf8m5Gn964RYyQVZEQTGIqolUw55wzuWoXFObj+i4FqrrI1fReY5vUNrZUTx8udjcLaA0tYUkEUmVPMU7uCdobvVEPO6UDI0ytM/RMlCOAmeem8UH3vswGL5V1nMaHJzuPbtqAWvhNw7i8U4eTiHtcmDbbbkpUWxdVk3wuG4YAlang1cZUFmSfvPi2gjexTVA5Umhs9HyOnTIi0zVu3Q4swyKJLvoOo3wuah8ImqRot1waXcSvM6qXxH43JettycUeo0mBkHFZA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 12:57:22.2890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b21f747-2c20-4ccd-b955-08d745a5bc16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2821
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USp/qlFSQOazI9QsvjgI5381RR+OS6ck15PFpYy+uQ4=;
 b=dmjZr3YqADMirePygpObaB2T5b7avNE0QrDiEtAUS5St3lTwJssdSXWFzoLtc3QCLDiyvNOG3FWGry4SlJtOEpHMpMUK0buP9/kdyV3beEv+2VmOnInGwx5X0zBzMQ3yKEnmbaSDH2KFBst7psrj5CMic+cnoNNfdc1leCXdqwI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USp/qlFSQOazI9QsvjgI5381RR+OS6ck15PFpYy+uQ4=;
 b=dmjZr3YqADMirePygpObaB2T5b7avNE0QrDiEtAUS5St3lTwJssdSXWFzoLtc3QCLDiyvNOG3FWGry4SlJtOEpHMpMUK0buP9/kdyV3beEv+2VmOnInGwx5X0zBzMQ3yKEnmbaSDH2KFBst7psrj5CMic+cnoNNfdc1leCXdqwI=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDk6NTE6MzVBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSwKPiAKPiBPbiBUdWUsIFNlcCAxNywgMjAxOSBhdCAwNzozNjo0NVBNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgNjoxNSBQ
TSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBIaSwKPiA+ID4KPiA+ID4gT24gMTcvMDkvMjAxOSAxODowNywgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gPiA+ID4gT24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDI6NTM6MDFQTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiA+ID4gPj4gT24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDE6NDI6
NTNQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3JvdGU6Cj4gPiA+ID4+PiBBZGQgYSBtb2RpZmllciAn
RFJNX0ZPUk1BVF9NT0RfQVJNX1BST1RFQ1RFRCcgd2hpY2ggZGVub3RlcyB0aGF0IHRoZSBmcmFt
ZWJ1ZmZlcgo+ID4gPiA+Pj4gaXMgYWxsb2NhdGVkIGluIGEgcHJvdGVjdGVkIHN5c3RlbSBtZW1v
cnkuCj4gPiA+ID4+PiBFc3NlbnRpYWxseSwgd2Ugd2FudCB0byBzdXBwb3J0IEVHTF9FWFRfcHJv
dGVjdGVkX2NvbnRlbnQgaW4gb3VyIGtvbWVkYSBkcml2ZXIuCj4gPiA+ID4+Pgo+ID4gPiA+Pj4g
U2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4uaGFsZGVyQGFybS5jb20+Cj4g
PiA+ID4+Pgo+ID4gPiA+Pj4gLy0tIE5vdGUgdG8gcmV2aWV3ZXIKPiA+ID4gPj4+IEtvbWVkYSBk
cml2ZXIgaXMgY2FwYWJsZSBvZiByZW5kZXJpbmcgRFJNIChEaWdpdGFsIFJpZ2h0cyBNYW5hZ2Vt
ZW50KSBwcm90ZWN0ZWQKPiA+ID4gPj4+IGNvbnRlbnQuIFRoZSBEUk0gY29udGVudCBpcyBzdG9y
ZWQgaW4gYSBmcmFtZWJ1ZmZlciBhbGxvY2F0ZWQgaW4gc3lzdGVtIG1lbW9yeQo+ID4gPiA+Pj4g
KHdoaWNoIG5lZWRzIHNvbWUgc3BlY2lhbCBoYXJkd2FyZSBzaWduYWxzIGZvciBhY2Nlc3MpLgo+
ID4gPiA+Pj4KPiA+ID4gPj4+IExldCB1cyBpZ25vcmUgaG93IHRoZSBwcm90ZWN0ZWQgc3lzdGVt
IG1lbW9yeSBpcyBhbGxvY2F0ZWQgYW5kIGZvciB0aGUgc2NvcGUgb2YKPiA+ID4gPj4+IHRoaXMg
ZGlzY3Vzc2lvbiwgd2Ugd2FudCB0byBmaWd1cmUgb3V0IHRoZSBiZXN0IHdheSBwb3NzaWJsZSBm
b3IgdGhlIHVzZXJzcGFjZQo+ID4gPiA+Pj4gdG8gY29tbXVuaWNhdGUgdG8gdGhlIGRybSBkcml2
ZXIgdG8gdHVybiB0aGUgcHJvdGVjdGVkIG1vZGUgb24gKGZvciBhY2Nlc3NpbmcgdGhlCj4gPiA+
ID4+PiBmcmFtZWJ1ZmZlciB3aXRoIHRoZSBEUk0gY29udGVudCkgb3Igb2ZmLgo+ID4gPiA+Pj4K
PiA+ID4gPj4+IFRoZSBwb3NzaWJsZSB3YXlzIGJ5IHdoaWNoIHRoZSB1c2Vyc3BhY2UgY291bGQg
YWNoaWV2ZSB0aGlzIGlzIHZpYTotCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gMS4gTW9kaWZpZXJzIDot
IFRoaXMgbG9va3MgdG8gbWUgdGhlIGJlc3Qgd2F5IGJ5IHdoaWNoIHRoZSB1c2Vyc3BhY2UgY2Fu
Cj4gPiA+ID4+PiBjb21tdW5pY2F0ZSB0byB0aGUga2VybmVsIHRvIHR1cm4gdGhlIHByb3RlY3Rl
ZCBtb2RlIG9uIGZvciB0aGUga29tZWRhIGRyaXZlcgo+ID4gPiA+Pj4gYXMgaXQgaXMgZ29pbmcg
dG8gYWNjZXNzIG9uZSBvZiB0aGUgcHJvdGVjdGVkIGZyYW1lYnVmZmVycy4gVGhlIG9ubHkgcHJv
YmxlbSBpcwo+ID4gPiA+Pj4gdGhhdCB0aGUgY3VycmVudCBtb2RpZmllcnMgZGVzY3JpYmUgdGhl
IHRpbGluZy9jb21wcmVzc2lvbiBmb3JtYXQuIEhvd2V2ZXIsIGl0Cj4gPiA+ID4+PiBkb2VzIG5v
dCBodXJ0IHRvIGV4dGVuZCB0aGUgbWVhbmluZyBvZiBtb2RpZmllcnMgdG8gZGVub3RlIG90aGVy
IGF0dHJpYnV0ZXMgb2YKPiA+ID4gPj4+IHRoZSBmcmFtZWJ1ZmZlciBhcyB3ZWxsLgo+ID4gPiA+
Pj4KPiA+ID4gPj4+IFRoZSBvdGhlciByZWFzb24gaXMgdGhhdCBvbiBBbmRyb2lkLCB3ZSBnZXQg
YW4gaW5mbyBmcm9tIEdyYWxsb2MKPiA+ID4gPj4+IChHUkFMTE9DX1VTQUdFX1BST1RFQ1RFRCkg
d2hpY2ggdGVsbHMgdXMgdGhhdCB0aGUgYnVmZmVyIGlzIHByb3RlY3RlZC4gVGhpcyBjYW4KPiA+
ID4gPj4+IGJlIHVzZWQgdG8gc2V0IHVwIHRoZSBtb2RpZmllci9zIChBZGRGQjIpIGR1cmluZyBm
cmFtZWJ1ZmZlciBjcmVhdGlvbi4KPiA+ID4gPj4KPiA+ID4gPj4gSG93IGRvZXMgdGhpcyBtZXNo
IHdpdGggb3RoZXIgbW9kaWZpZXJzLCBsaWtlIEFGQkM/IFRoYXQncyB3aGVyZSBJIHNlZSB0aGUK
PiA+ID4gPj4gaXNzdWUgaGVyZS4KPiA+ID4gPgo+ID4gPiA+IEFGQkMgbW9kaWZpZXJzIGFyZSBj
dXJyZW50bHkgdW5kZXIgQXJtJ3MgbmFtZXNwYWNlLCB0aGUgdGhvdWdodCBiZWhpbmQgdGhlIERS
TQo+ID4gPiA+IG1vZGlmaWVycyB3b3VsZCBiZSB0byBoYXZlIGl0IGFzIGEgImdlbmVyaWMiIG1v
ZGlmaWVyLgo+ID4gCj4gPiBCdXQgaWYgaXQncyBhIGdlbmVyaWMgZmxhZywgaG93IGRvIHlvdSBj
b21iaW5lIHRoYXQgd2l0aCBvdGhlcgo+ID4gbW9kaWZpZXJzPyBMaWtlIGlmIHlvdSBoYXZlIGEg
dGlsZWQgYnVmZmVyLCBidXQgYWxzbyBlbmNyeXB0ZWQ/IE9yCj4gPiBhZmJjIGNvbXByZXNzZWQs
IG9yIHdoYXRldmVyIGVsc2UuIEknZCBleHBlY3QgZm9yIHlvdXIgaHcgZW5jcnlwdGlvbgo+ID4g
aXMgb3J0aG9nb25hbCB0byB0aGUgYnVmZmVyL3RpbGluZy9jb21wcmVzc2lvbiBmb3JtYXQgdXNl
ZD8KPiAKPiBUaGlzIGJpdCBkb2Vzbid0IG92ZXJsYXAgd2l0aCBhbnkgb2YgdGhlIG90aGVyIEFG
QkMgbW9kaWZpZXJzLCBzbyBhcwo+IHlvdSBzYXkgaXQnZCBiZSBvcnRob2dvbmFsLCBhbmQgY291
bGQgYmUgc2V0IG9uIEFGQkMgYnVmZmVycyAoaWYgd2UKPiB3ZW50IHRoYXQgcm91dGUpLgo+IAo+
ID4gCj4gPiA+ID4+PiAyLiBGcmFtZWJ1ZmZlciBmbGFncyA6LSBBcyBvZiB0b2RheSwgdGhpcyBj
YW4gYmUgb25lIG9mIHRoZSB0d28gdmFsdWVzCj4gPiA+ID4+PiBpZSAoRFJNX01PREVfRkJfSU5U
RVJMQUNFRC9EUk1fTU9ERV9GQl9NT0RJRklFUlMpLiBVbmxpa2UgbW9kaWZpZXJzLCB0aGUgZHJt
Cj4gPiA+ID4+PiBmcmFtZWJ1ZmZlciBmbGFncyBhcmUgZ2VuZXJpYyB0byB0aGUgZHJtIHN1YnN5
c3RlbSBhbmQgaWRlYWxseSB3ZSBzaG91bGQgbm90Cj4gPiA+ID4+PiBpbnRyb2R1Y2UgYW55IGRy
aXZlciBzcGVjaWZpYyBjb25zdHJhaW50L2ZlYXR1cmUuCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gMy4g
Q29ubmVjdG9yIHByb3BlcnR5Oi0gSSBjb3VsZCBzZWUgdGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVz
IHVzZWQgZm9yIERSTQo+ID4gPiA+Pj4gcHJvdGVjdGVkIGNvbnRlbnQ6LQo+ID4gPiA+Pj4gRFJN
X01PREVfQ09OVEVOVF9QUk9URUNUSU9OX0RFU0lSRUQgLyBFTkFCTEVEIDotICJUaGlzIHByb3Bl
cnR5IGlzIHVzZWQgYnkKPiA+ID4gPj4+IHVzZXJzcGFjZSB0byByZXF1ZXN0IHRoZSBrZXJuZWwg
cHJvdGVjdCBmdXR1cmUgY29udGVudCBjb21tdW5pY2F0ZWQgb3Zlcgo+ID4gPiA+Pj4gdGhlIGxp
bmsiLiBDbGVhcmx5LCB3ZSBhcmUgbm90IGNvbmNlcm5lZCB3aXRoIHRoZSBwcm90ZWN0aW9uIGF0
dHJpYnV0ZXMgb2YgdGhlCj4gPiA+ID4+PiB0cmFuc21pdHRlci4gU28sIHdlIGNhbm5vdCB1c2Ug
dGhpcyBwcm9wZXJ0eSBmb3Igb3VyIGNhc2UuCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gNC4gRFJNIHBs
YW5lIHByb3BlcnR5Oi0gQWdhaW4sIHdlIHdhbnQgdG8gY29tbXVuaWNhdGUgdGhhdCB0aGUgZnJh
bWVidWZmZXIod2hpY2gKPiA+ID4gPj4+IGNhbiBiZSBhdHRhY2hlZCB0byBhbnkgcGxhbmUpIGlz
IHByb3RlY3RlZC4gU28gaW50cm9kdWNpbmcgYSBuZXcgcGxhbmUgcHJvcGVydHkKPiA+ID4gPj4+
IGRvZXMgbm90IGhlbHAuCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gNS4gRFJNIGNydGMgcHJvcGVydHk6
LSBGb3IgdGhlIHNhbWUgcmVhc29uIGFzIGFib3ZlLCBpbnRyb2R1Y2luZyBhIG5ldyBjcnRjCj4g
PiA+ID4+PiBwcm9wZXJ0eSBkb2VzIG5vdCBoZWxwLgo+ID4gPiA+Pgo+ID4gPiA+PiA2LiBKdXN0
IHRyYWNrIHRoaXMgYXMgcGFydCBvZiBidWZmZXIgYWxsb2NhdGlvbiwgaS5lLiBJIHRoaW5rIGl0
IGRvZXMKPiA+ID4gPj4gbWF0dGVyIGhvdyB5b3UgYWxsb2NhdGUgdGhlc2UgcHJvdGVjdGVkIGJ1
ZmZlcnMuIFdlIGNvdWxkIGFkZCBhICJpcwo+ID4gPiA+PiBwcm90ZWN0ZWQgYnVmZmVyIiBmbGFn
IGF0IHRoZSBkbWFfYnVmIGxldmVsIGZvciB0aGlzLgo+IAo+IEkgYWxzbyBsaWtlIHRoaXMgYXBw
cm9hY2guIFRoZSBwcm90ZWN0ZWQtbmVzcyBpcyBhIHByb3BlcnR5IG9mIHRoZQo+IGFsbG9jYXRp
b24sIHNvIG1ha2VzIHNlbnNlIHRvIHN0b3JlIGl0IHdpdGggdGhlIGFsbG9jYXRpb24gSU1PLgo+
IAo+ID4gPiA+Pgo+ID4gPiA+PiBTbyB5ZWFoIGZvciB0aGlzIHN0dWZmIGhlcmUgSSB0aGluayB3
ZSBkbyB3YW50IHRoZSBmdWxsIHVzZXJzcGFjZSBzaWRlLAo+ID4gPiA+PiBmcm9tIGFsbG9jYXRv
ciB0byByZW5kZXJpbmcgc29tZXRoaW5nIGludG8gdGhpcyBwcm90ZWN0ZWQgYnVmZmVycyAobm8g
bmVlZAo+ID4gPiA+PiB0byBhbHNvIGhhdmUgdGhlIGVudGlyZSAiZGVjb2RlIGEgcHJvdGVjdGVk
IGJpdHN0cmVhbSBwYXJ0IiBpbW8sIHNpbmNlCj4gPiA+ID4+IHRoYXQgd2lsbCBmcmVhayBwZW9w
bGUgb3V0KS4gVW5mb3J0dW5hdGVseSwgaW4gbXkgZXhwZXJpZW5jZSwgdGhhdCBraWxscwo+ID4g
PiA+PiBpdCBmb3IgdXBzdHJlYW0gOi0vIEJ1dCBhbHNvIGluIG15IGV4cGVyaWVuY2Ugb2YgbG9v
a2luZyBpbnRvIHRoaXMgZm9yCj4gPiA+ID4+IG90aGVyIGdwdSdzLCB3ZSByZWFsbHkgbmVlZCB0
byBoYXZlIHRoZSBmdWxsIHBpY3R1cmUgaGVyZSB0byBtYWtlIHN1cmUKPiA+ID4gPj4gd2UncmUg
bm90IHNjcmV3aW5nIHRoaXMgdXAuCj4gPiA+ID4KPiA+ID4gPiBNYXliZSBBeWFuIGNvdWxkJ3Zl
IGJlZW4gYSBiaXQgY2xlYXJlciBpbiBoaXMgbWVzc2FnZSwgYnV0IHRoZSBhc2sgaGVyZSBpcyBm
b3IgaWRlYXMKPiA+ID4gPiBvbiBob3cgdXNlcnNwYWNlICJjb21tdW5pY2F0ZXMiIChzdG9yZXM/
KSB0aGUgZmFjdCB0aGF0IHRoZSBidWZmZXJzIGFyZSBwcm90ZWN0ZWQgdG8KPiA+ID4gPiB0aGUg
a2VybmVsIGRyaXZlci4gSW4gb3VyIGRpc3BsYXkgcHJvY2Vzc29yIHdlIG5lZWQgdG8gdGhlIHRo
ZSBoYXJkd2FyZSB0aGF0IHRoZQo+ID4gPiA+IGJ1ZmZlcnMgYXJlIHByb3RlY3RlZCBiZWZvcmUg
aXQgdHJpZXMgdG8gZmV0Y2ggdGhlbSBzbyB0aGF0IGl0IGNhbiAxKSBlbmFibGUgdGhlCj4gPiA+
ID4gYWRkaXRpb25hbCBoYXJkd2FyZSBzaWduYWxpbmcgdGhhdCBzZXRzIHRoZSBwcm90ZWN0aW9u
IGFyb3VuZCB0aGUgc3RyZWFtOyBhbmQgMikgcmVhZAo+ID4gPiA+IHRoZSBwcm90ZWN0ZWQgYnVm
ZmVycyBpbiBhIHNwZWNpYWwgbW9kZSB3aGVyZSB0aGVyZSB0aGUgbWFnaWMgaGFwcGVucy4KPiA+
IAo+ID4gVGhhdCB3YXMgY2xlYXIsIGJ1dCBmb3IgdGhlIGZ1bGwgcGljdHVyZSB3ZSBhbHNvIG5l
ZWQgdG8ga25vdyBob3cKPiA+IHRoZXNlIGJ1ZmZlcnMgYXJlIHByb2R1Y2VkIGFuZCB3aGVyZSB0
aGV5IGFyZSBhbGxvY2F0ZWQuIE9uZSBhcHByb2FjaAo+ID4gd291bGQgYmUgdG8gaGF2ZSBhIGRt
YS1idWYgaGVhcCB0aGF0IGdpdmVzIHlvdSBlbmNyeXB0ZWQgYnVmZmVycyBiYWNrLgo+ID4gV2l0
aCB0aGF0IHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgb25seSBlbmNyeXB0aW9uLWF3YXJlIGRy
aXZlcnMKPiA+IGFsbG93IHN1Y2ggYnVmZmVycyB0byBiZSBpbXBvcnRlZCwgYW5kIHRoZSBlbnRp
cmUgcHJvYmxlbSBiZWNvbWVzIGEKPiA+IGtlcm5lbC1pbnRlcm5hbCBvbmUgLSBhc2lkZSBmcm9t
IGFsbG9jYXRpbmcgdGhlIHJpZ2h0IGtpbmQgb2YgYnVmZmVyCj4gPiBhdCB0aGUgcmlnaHQgcGxh
Y2UuCj4gPiAKPiAKPiBJbiBvdXIgY2FzZSwgd2UnZCBiZSBzdXBwb3J0aW5nIGEgc3lzdGVtIGxp
a2UgVFpNUC0xLCB0aGVyZSdzIGEKPiBMaW5hcm8gY29ubmVjdCBwcmVzZW50YXRpb24gb24gaXQg
aGVyZToKPiBodHRwczovL2Nvbm5lY3QubGluYXJvLm9yZy9yZXNvdXJjZXMvaGtnMTgvaGtnMTgt
NDA4Lwo+IAo+IFRoZSBzaW1wbGVzdCB3YXkgdG8gaW1wbGVtZW50IHRoaXMgaXMgZm9yIGZpcm13
YXJlIHRvIHNldCB1cCBhCj4gY2FydmVvdXQgd2hpY2ggaXQgdGVsbHMgbGludXggaXMgc2VjdXJl
LiBBIGxpbnV4IGFsbG9jYXRvciAoaW9uLCBnZW0sCj4gdmIyLCB3aGF0ZXZlcikgY2FuIGFsbG9j
YXRlIGZyb20gdGhpcyBjYXJ2ZW91dCwgYW5kIHRhZyB0aGUgYnVmZmVyIGFzCj4gc2VjdXJlLgo+
IAo+IEluIHRoaXMga2luZCBvZiBzeXN0ZW0sIGxpbnV4IGRvZXNuJ3QgbmVjZXNzYXJpbHkgbmVl
ZCB0byBrbm93Cj4gYW55dGhpbmcgYWJvdXQgaG93IGJ1ZmZlcnMgYXJlIHByb3RlY3RlZCwgb3Ig
d2hhdCBIVyBpcyBjYXBhYmxlIG9mIC0KPiBpdCBvbmx5IG5lZWRzIHRvIGNhcnJ5IGFyb3VuZCB0
aGUgImlzX3Byb3RlY3RlZCIgZmxhZy4KPiAKPiBIZXJlLCB0aGUgVEVFIGlzIHVsdGltYXRlbHkg
cmVzcG9uc2libGUgZm9yIGRlY2lkaW5nIHdoaWNoIEhXIGdldHMKPiBhY2Nlc3MgdG8gYSBidWZm
ZXIuIEkgZG9uJ3Qgc2VlIGEgYmVuZWZpdCBvZiBoYXZpbmcgbGludXggZGVjaWRlIHdoaWNoCj4g
ZHJpdmVycyBjYW4gb3IgY2Fubm90IGltcG9ydCBhIGJ1ZmZlciwgYmVjYXVzZSB0aGF0IGRlY2lz
aW9uIHNob3VsZCBiZQo+IGhhbmRsZWQgYnkgdGhlIFRFRS4KPiAKPiBGb3IgcHJvdmluZyBvdXQg
dGhlIHBpcGVsaW5lLCBJTU8gaXQgZG9lc24ndCBtYXR0ZXIgd2hldGhlciB0aGUKPiBidWZmZXJz
IGFyZSBwcm90ZWN0ZWQgb3Igbm90LiBGb3Igb3VyIERQVSwgYWxsIHRoYXQgbWF0dGVycyBpcyB0
aGF0IGlmCj4gdGhlIGJ1ZmZlciBjbGFpbXMgdG8gYmUgcHJvdGVjdGVkLCB3ZSBoYXZlIHRvIHNl
dCBvdXIgcHJvdGVjdGVkCj4gY29udHJvbCBiaXQuIE5vdGhpbmcgbW9yZS4gQUZBSUsgaXQgc2hv
dWxkIHdvcmsgdGhlIHNhbWUgZm9yIG90aGVyCj4gVFpNUC0xIGltcGxlbWVudGF0aW9ucy4KPiAK
PiA+ID4gPiBTbyB5ZWFoLCB3ZSBrbm93IHdlIGRvIHdhbnQgZnVsbCB1c2Vyc3BhY2Ugc3VwcG9y
dCwgd2UncmUgcHJvZGRpbmcgdGhlIGNvbW11bml0eSBvbgo+ID4gPiA+IGFuc3dlcnMgb24gaG93
IHRvIGJlc3QgbGV0IHRoZSBrZXJuZWwgc2lkZSBrbm93IHdoYXQgdXNlcnNwYWNlIGhhcyBkb25l
Lgo+ID4gPgo+ID4gPiBBY3R1YWxseSB0aGlzIGlzIGludGVyZXN0aW5nIGZvciBvdGhlciBtdWx0
aW1lZGlhIFNvQ3MgaW1wbGVtZW50aW5nIHNlY3VyZSB2aWRlbyBkZWNvZGUKPiA+ID4gcGF0aHMg
d2hlcmUgdmlkZW8gYnVmZmVycyBhcmUgYWxsb2NhdGVkIGFuZCBtYW5hZ2VkIGJ5IGEgdHJ1c3Rl
ZCBhcHAuCj4gPiAKPiA+IFllYWggSSBleHBlY3QgdGhlcmUncyBtb3JlIHRoYW4ganVzdCBhcm0g
d2FudGluZyB0aGlzLiBJIGFsc28gd29uZGVyCj4gPiBob3cgdGhhdCBpbnRlcmFjdHMgd2l0aCB0
aGUgc2VjdXJlIG1lbW9yeSBhbGxvY2F0b3IgdGhhdCB3YXMgYm9iYmluZwo+ID4gYXJvdW5kIG9u
IGRyaS1kZXZlbCBmb3IgYSB3aGlsZSwgYnV0IHNlZW1zIHRvIG5vdCBoYXZlIGdvbmUgYW55d2hl
cmUuCj4gPiBUaGF0IHRoaW5nIGltcGxlbWVudGVkIG15IGlkZWEgb2YgInNlY3VyZSBtZW1vcnkg
aXMgb25seSBhbGxvY2F0ZWQgYnkKPiA+IGEgc3BlY2lhbCBlbnRpdHkiLgo+ID4gLURhbmllbAo+
IAo+IExpa2UgSSBzYWlkLCBmb3IgdXMgYWxsIHdlIG5lZWQgaXMgYSB3YXkgdG8gY2FycnkgYXJv
dW5kIGEgMS1iaXQKPiAiaXNfcHJvdGVjdGVkIiBmbGFnIHdpdGggYSBidWZmZXIuIENvdWxkIG90
aGVyIGZvbGtzIHNoYXJlIHdoYXQncwo+IG5lZWRlZCBmb3IgdGhlaXIgc3lzdGVtcyBzbyB3ZSBj
YW4gcmVhc29uIGFib3V0IHNvbWV0aGluZyB0aGF0IHdvcmtzCj4gZm9yIGFsbD8KClRvIG1ha2Ug
dGhpbmdzIGEgYml0IG1vcmUgc3BlY2lmaWMsIHdlIGFyZSB0aGlua2luZyBvZiB0aGUgZm9sbG93
aW5nCnBhdGNoIDotCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEtYnVmLmggYi9pbmNs
dWRlL2xpbnV4L2RtYS1idWYuaAppbmRleCBlYzIxMmNiMjdmZGMuLjM2ZjA4MTMwNzNhMiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKKysrIGIvaW5jbHVkZS9saW51eC9kbWEt
YnVmLmgKQEAgLTI3OSw2ICsyNzksNyBAQCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgewogICogICAgICAg
ICBrZXJuZWwgbW9kdWxlLgogICogQGxpc3Rfbm9kZTogbm9kZSBmb3IgZG1hX2J1ZiBhY2NvdW50
aW5nIGFuZCBkZWJ1Z2dpbmcuCiAgKiBAcHJpdjogZXhwb3J0ZXIgc3BlY2lmaWMgcHJpdmF0ZSBk
YXRhIGZvciB0aGlzIGJ1ZmZlciBvYmplY3QuCisgKiBAaXNfcHJvdGVjdGVkOiBkZW5vdGVzIHRo
YXQgdGhlIGJ1ZmZlciBpcwpzZWN1cmUvcHJvdGVjdGVkL2VuY3J5cHRlZC90cnVzdGVkLgogICog
QHJlc3Y6IHJlc2VydmF0aW9uIG9iamVjdCBsaW5rZWQgdG8gdGhpcyBkbWEtYnVmCiAgKiBAcG9s
bDogZm9yIHVzZXJzcGFjZSBwb2xsIHN1cHBvcnQKICAqIEBjYl9leGNsOiBmb3IgdXNlcnNwYWNl
IHBvbGwgc3VwcG9ydApAQCAtMzA2LDYgKzMwNyw3IEBAIHN0cnVjdCBkbWFfYnVmIHsKICAgICAg
ICBzdHJ1Y3QgbW9kdWxlICpvd25lcjsKICAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Rfbm9k
ZTsKICAgICAgICB2b2lkICpwcml2OworICAgICAgIGJvb2wgaXNfcHJvdGVjdGVkOwogICAgICAg
IHN0cnVjdCBkbWFfcmVzdiAqcmVzdjsKIAogICAgICAgIC8qIHBvbGwgc3VwcG9ydCAqLwoKQGFs
bCwgQGFtZGdwdS1mb2xrcyA6LSBJcyB0aGlzIHNvbWV0aGluZyB5b3UgY2FuIHVzZSBvZiB0byBk
ZW5vdGUKc2VjdXJlL3Byb3RlY3RlZC9lbmNyeXB0ZWQvdHJ1c3RlZCBidWZmZXJzID8KClRoZSB3
YXkgJ2lzX3Byb3RlY3RlZCcgZmxhZyBnZXRzIHVzZWQgdG8gYWxsb2NhdGUKc2VjdXJlL3Byb3Rl
Y3RlZC9lbmNyeXB0ZWQgYnVmZmVycyB3aWxsIGJlIHZlbmRvciBzcGVjaWZpYy4KClBsZWFzZSBj
b21tZW50IHRvIGxldCB1cyBrbm93IGlmIGl0IGxvb2tzIHVzZWZ1bCB0byBub24gQXJtIGZvbGtz
Lgo+IAo+IFRoYW5rcyEKPiAtQnJpYW4KPiAKPiA+IAo+ID4gPgo+ID4gPiBOZWlsCj4gPiA+Cj4g
PiA+ID4KPiA+ID4gPiBCZXN0IHJlZ2FyZHMsCj4gPiA+ID4gTGl2aXUKPiA+ID4gPgo+ID4gPiA+
Cj4gPiA+ID4+IC1EYW5pZWwKPiA+ID4gPj4KPiA+ID4gPj4+Cj4gPiA+ID4+PiAtLS8KPiA+ID4g
Pj4+Cj4gPiA+ID4+PiAtLS0KPiA+ID4gPj4+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2Mu
aCB8IDkgKysrKysrKysrCj4gPiA+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KQo+ID4gPiA+Pj4KPiA+ID4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9m
b3VyY2MuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gPiA+ID4+PiBpbmRleCAz
ZmVlYWEzZjk4N2EuLjM4ZTVlODFkMTFmZSAxMDA2NDQKPiA+ID4gPj4+IC0tLSBhL2luY2x1ZGUv
dWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gPiA+ID4+PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2Ry
bV9mb3VyY2MuaAo+ID4gPiA+Pj4gQEAgLTc0Miw2ICs3NDIsMTUgQEAgZXh0ZXJuICJDIiB7Cj4g
PiA+ID4+PiAgICovCj4gPiA+ID4+PiAgI2RlZmluZSBBRkJDX0ZPUk1BVF9NT0RfQkNIICAgICAo
MVVMTCA8PCAxMSkKPiA+ID4gPj4+Cj4gPiA+ID4+PiArLyoKPiA+ID4gPj4+ICsgKiBQcm90ZWN0
ZWQgZnJhbWVidWZmZXIKPiA+ID4gPj4+ICsgKgo+ID4gPiA+Pj4gKyAqIFRoZSBmcmFtZWJ1ZmZl
ciBpcyBhbGxvY2F0ZWQgaW4gYSBwcm90ZWN0ZWQgc3lzdGVtIG1lbW9yeSB3aGljaCBjYW4gYmUg
YWNjZXNzZWQKPiA+ID4gPj4+ICsgKiB2aWEgc29tZSBzcGVjaWFsIGhhcmR3YXJlIHNpZ25hbHMg
ZnJvbSB0aGUgZHB1LiBUaGlzIGlzIHVzZWQgdG8gc3VwcG9ydAo+ID4gPiA+Pj4gKyAqICdHUkFM
TE9DX1VTQUdFX1BST1RFQ1RFRCcgaW4gb3VyIGZyYW1lYnVmZmVyIGZvciBFR0xfRVhUX3Byb3Rl
Y3RlZF9jb250ZW50Lgo+ID4gPiA+Pj4gKyAqLwo+ID4gPiA+Pj4gKyNkZWZpbmUgRFJNX0ZPUk1B
VF9NT0RfQVJNX1BST1RFQ1RFRCAgICAgICBmb3VyY2NfbW9kX2NvZGUoQVJNLCAoMVVMTCA8PCA1
NSkpCj4gPiA+ID4+PiArCj4gPiA+ID4+PiAgLyoKPiA+ID4gPj4+ICAgKiBBbGx3aW5uZXIgdGls
ZWQgbW9kaWZpZXIKPiA+ID4gPj4+ICAgKgo+ID4gPiA+Pj4gLS0KPiA+ID4gPj4+IDIuMjMuMAo+
ID4gPiA+Pj4KPiA+ID4gPj4KPiA+ID4gPj4gLS0KPiA+ID4gPj4gRGFuaWVsIFZldHRlcgo+ID4g
PiA+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+ID4gPj4gaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKPiA+ID4gPgo+ID4gPgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
PiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+IAo+ID4gCj4gPiAK
PiA+IC0tIAo+ID4gRGFuaWVsIFZldHRlcgo+ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCj4gPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
