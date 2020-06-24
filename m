Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D602071D0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 13:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B5B6EAD5;
	Wed, 24 Jun 2020 11:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00084.outbound.protection.outlook.com [40.107.0.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5610C6EAD5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeP4GACzxJt2bZYut6/N5tSg44NanBL+O5jIDfelmUE=;
 b=BGKEZwG4DUaPmbudyMlvDJbEEMArzsPGt7sHgHBjQPanrDWt6dQ1/DA4zdBMdvviA7jcr6plHoxlYjN6JCGw7Bgikgoh30gU1Sp6OBPeNhaMdqt60GVtbZINpSlxJU/aOiwEOq77eo5SDmgFGMuM+ZEvymc7wWO/BTbbeCXPRS0=
Received: from MR2P264CA0048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::36) by
 DB7PR08MB3657.eurprd08.prod.outlook.com (2603:10a6:10:4d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20; Wed, 24 Jun 2020 11:08:15 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::d2) by MR2P264CA0048.outlook.office365.com
 (2603:10a6:500::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Wed, 24 Jun 2020 11:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 11:08:14 +0000
Received: ("Tessian outbound f44be76249db:v59");
 Wed, 24 Jun 2020 11:08:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0def39503f388b59
X-CR-MTA-TID: 64aa7808
Received: from c5a06575b6f3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7107F26A-4612-4C1E-94E2-8996AA2E490D.1; 
 Wed, 24 Jun 2020 11:08:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5a06575b6f3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Jun 2020 11:08:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvNC2vbfOv+M/hSZuxMfNHcDA+Fj1Qh2j7Xqthgf7reOGVMLzOGtdWw81V2324dC4L/6q+xjM9g09c3Okt+UCrW1+rb+5a9DIZroQm/TJqvl+RyJouPseK557DF89Lfborev4rw5gksAIoo/gyMGStst0QRlmLSYKtFDSDZ7jrRyDfM0s+Ph7/DlzS1EYSvO5BZBwMktLoVx82mU8BSMK7tS/inLIoJvd025frIhA8h5CBqmaPN5jBe3znl3dv1EGtpY4v1F+1tLJuA8TCWirAEB6lkG61tI3IYaJaAGWpZcWOPrMvMZK4Pv8vpcil5ulmJ46ZtzczuVlCU4puOtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeP4GACzxJt2bZYut6/N5tSg44NanBL+O5jIDfelmUE=;
 b=K3/9A1LbY38tpwq955abrKE9L/AnDplUHq5psgilCRHM7dy4qYboWYVYHA3P4hxFT7yvTW8K4+pBUcRnbIAqsl1PReqz6Oc3Ytu56ofqq43tjEOEVhDVTNQBqrKauB9RJAg6JOiud/M/pVod35rs6rBrto0OrhXbEdw4kX+uw2kWsXopp5IwHkoUBrIvPrGMEjwbRem2mk9TEi5XzbF1hSGwoA3S1daEOBcKVZBZp1VuBPZVsZ2RBE3mLTSeDJKamYV9iwMcHYKY9ylE/65eDtVRaj+oqOT1hhFsBY07/LO3/QRALGTDPdk7ABSo6c1IqTt0cEOkR55hQpnBpTc0qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeP4GACzxJt2bZYut6/N5tSg44NanBL+O5jIDfelmUE=;
 b=BGKEZwG4DUaPmbudyMlvDJbEEMArzsPGt7sHgHBjQPanrDWt6dQ1/DA4zdBMdvviA7jcr6plHoxlYjN6JCGw7Bgikgoh30gU1Sp6OBPeNhaMdqt60GVtbZINpSlxJU/aOiwEOq77eo5SDmgFGMuM+ZEvymc7wWO/BTbbeCXPRS0=
Authentication-Results-Original: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2684.eurprd08.prod.outlook.com (2603:10a6:7:2c::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20; Wed, 24 Jun 2020 11:08:06 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2%7]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 11:08:06 +0000
Date: Wed, 24 Jun 2020 12:08:04 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5] drm/fourcc: document modifier uniqueness requirements
Message-ID: <20200624110804.fynorcdkxcbqbasj@DESKTOP-E1NTVVP.localdomain>
References: <rq4ENYWGZ-rcmWZd1GT2lfUyU6n5fhimWeCPOct0dFKVK4OJ0pKbujgy6A4ldMZkg5ldKUzDMX_6Vjnjb_Vnst3a0YCI2RFQin42nUn_Hgk=@emersion.fr>
Content-Disposition: inline
In-Reply-To: <rq4ENYWGZ-rcmWZd1GT2lfUyU6n5fhimWeCPOct0dFKVK4OJ0pKbujgy6A4ldMZkg5ldKUzDMX_6Vjnjb_Vnst3a0YCI2RFQin42nUn_Hgk=@emersion.fr>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LNXP265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::14) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LNXP265CA0026.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.25 via Frontend Transport; Wed, 24 Jun 2020 11:08:05 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d9c5564-c150-40a4-84af-08d8182ee433
X-MS-TrafficTypeDiagnostic: HE1PR08MB2684:|DB7PR08MB3657:
X-Microsoft-Antispam-PRVS: <DB7PR08MB3657873BC758C4DAFC6639D4F0950@DB7PR08MB3657.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KKCRRTjqeH8Q7IRDdNd/AGuD+yL4eKb5xPLkueT9lzjj4DK38vKTZHo7twtdFbpdnb4TdpuRjAW2wqP9DmimihC6z16TaTHqgwRFNGC2xyN0lQca9spHoNX/tmeUQrWcCDI3Cl9+tJrD9MFn+GwujMO+oF8cqrVl35UsTZSV+6zucWQwvsHj3Ur+bn+TDJJC2a8c84pA/GASNEdUQ7zSYvvq7lz9IwmFiekyr/UQeRUtd+yYo7tcNKIldyhfJmrLLvZNSvoTGvnHZYqd/SugtuL22FeYPpBIES5Kgpj5ndUU+8Pwjkr8RfiJYKWlWY9IppX4/R4bTEcq1xOInhEIBg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(66946007)(66476007)(66556008)(1076003)(44832011)(8676002)(4326008)(478600001)(8936002)(26005)(16526019)(2906002)(186003)(55016002)(66574015)(6506007)(5660300002)(52116002)(6916009)(3716004)(7696005)(956004)(316002)(54906003)(9686003)(7416002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4Es9Nheed1gNqf2lsGZwtEmx114LIE+TiLAiBkiJ9gqO7aJHmv1679bVhc5JQuOOtoOR6I8kURzqbI5BiHGlo/I0HT6vTz/whBUVeNtGRrMqUYvGNRe4C1JivPmInZqPuOcGn+pbiFBiwl8IVrfH2DyaXWmZEZoJZ1jh8CNVnfBMFKKucJGwj/kTJ0p3jqUcUPIftQIsIQ1e5oDHgM2/lsBCxdntR8cIRI5hRMvPt/jDKBIm4fYr8ziC+KRsQDNmBDtdEhk6f2BcFpKlnYMq+SH8oTXjgaGzyTAIP4ESFYlcpVg12RqaJODoa+EAMBfrdv9Bda4YMhIvshqoTU8rkaDigG7/uZlOf7UtydtqdBQZJofdzUA06jZJ+XGkxh8oyOeFYhvI3um1Slxc8sEfCgb9y9rh3ERe707m2lBuX/q4N4f1Vm7n8PvzITbe+FGvPimCa1cfKJFoh7P/iFCE+Dp6CqwIHCqckXjJtNnHtstxhbMftvQg8IAYkjrY4IvR
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2684
Original-Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966005)(8676002)(5660300002)(7696005)(3716004)(47076004)(86362001)(54906003)(9686003)(316002)(36906005)(956004)(82740400003)(6506007)(70586007)(4326008)(478600001)(8936002)(336012)(70206006)(82310400002)(356005)(44832011)(16526019)(1076003)(26005)(6862004)(55016002)(81166007)(66574015)(186003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 29c5eb3b-f433-402e-2771-08d8182edf07
X-Forefront-PRVS: 0444EB1997
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b1kaWGpq3Si0jBLFVJ7wUvFb56UtqFtAoaWiotWoC01r0MRGtU/MFolo9MmgwD88rQrN7nlpu3r96UW7Kd9R3tIQVfRx1wNkRscfbmeQr6iwUUAFnKy/2upUwhrlFkczJExAOjka6+t99sxpizhup24gf29cERTmehUtsCSvyURNPUwrnn0XX6Nf8d59GjM0SVDmLERfAp86CY1eZa5Kov/YDP8zkAGG75smEzGfAfeIpryStkzZVQBGPbeodkaq1GMa3hBIYCw0sOEo4hqg8r3aI01mMCSb6p7qCAbWMHNtpLRw0BVilmm3JiLZxtw//uZJUdUGveFo2Mp/rBChAsuladWs8JLDtPmNMyPXso+b95y+94BPsNk/HzI6Wr80Ixskz5Gj/ZIgSm2mjTV3Wg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 11:08:14.7939 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9c5564-c150-40a4-84af-08d8182ee433
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3657
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
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIEp1biAyMywgMjAyMCBhdCAwMzoyNTowOFBNICswMDAwLCBTaW1vbiBTZXIg
d3JvdGU6Cj4gVGhlcmUgaGF2ZSBzdWdnZXN0aW9ucyB0byBiYWtlIHBpdGNoIGFsaWdubWVudCwg
YWRkcmVzcyBhbGlnbmVtZW50LAo+IGNvbnRpZ3VvdXMgbWVtb3J5IG9yIG90aGVyIHBsYWNlbWVu
dCAoaGlkZGVuIFZSQU0sIEdUVC9CQVIsIGV0YykKPiBjb25zdHJhaW50cyBpbnRvIG1vZGlmaWVy
cy4gTGFzdCB0aW1lIHRoaXMgd2FzIGJyb3VnaHQgdXAgaXQgc2VlbWVkCj4gbGlrZSB0aGUgY29u
c2Vuc3VzIHdhcyB0byBub3QgYWxsb3cgdGhpcy4gRG9jdW1lbnQgdGhpcyBpbiBkcm1fZm91cmNj
LmguCj4gCj4gVGhlcmUgYXJlIHNldmVyYWwgcmVhc29ucyBmb3IgdGhpcy4KPiAKPiAtIEVuY29k
aW5nIGFsbCBvZiB0aGVzZSBjb25zdHJhaW50cyBpbiB0aGUgbW9kaWZpZXJzIHdvdWxkIGV4cGxv
ZGUgdGhlCj4gICBzZWFyY2ggc3BhY2UgcHJldHR5IHF1aWNrbHkgKHdlIG9ubHkgaGF2ZSA2NCBi
aXRzIHRvIHdvcmsgd2l0aCkuCj4gLSBNb2RpZmllcnMgbmVlZCB0byBiZSB1bmFtYmlndW91czog
YSBidWZmZXIgY2FuIG9ubHkgaGF2ZSBhIHNpbmdsZQo+ICAgbW9kaWZpZXIuCj4gLSBNb2RpZmll
ciB1c2VycyBhcmVuJ3QgZXhwZWN0ZWQgdG8gcGFyc2UgbW9kaWZpZXJzIChleGNlcHQgZHJpdmVy
cykuCj4gCj4gdjI6IGFkZCBwYXJhZ3JhcGggYWJvdXQgYWxpYXNlcyAoRGFuaWVsKQo+IAo+IHYz
OiBmaXggdW5yZWxhdGVkIGNoYW5nZXMgc2VudCB3aXRoIHRoZSBwYXRjaAo+IAo+IHY0OiBkaXNh
bWJpZ3VhdGUgdXNlcnMgYmV0d2VlbiBkcml2ZXIgYW5kIGhpZ2hlci1sZXZlbCBwcm9ncmFtcyAo
QnJpYW4sCj4gRGFuaWVsKQo+IAo+IHY1OiBmaXggQUZCQyBleGFtcGxlIChCcmlhbiwgRGFuaWVs
KQo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPiBS
ZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzog
RGFuaWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9yZz4KPiBDYzogQmFzIE5pZXV3ZW5odWl6
ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEBn
bWFpbC5jb20+Cj4gQ2M6IE1hcmVrIE9sxaHDoWsgPG1hcmFlb0BnbWFpbC5jb20+Cj4gQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPgo+IENjOiBOZWlsIEFybXN0cm9uZyA8
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+Cj4gQ2M6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiAt
LS0KPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCAyOCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBpL2Ry
bS9kcm1fZm91cmNjLmgKPiBpbmRleCA0OTAxNDM1MDBhNTAuLjgyOTYxOTcxODliZiAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ICsrKyBiL2luY2x1ZGUvdWFw
aS9kcm0vZHJtX2ZvdXJjYy5oCj4gQEAgLTU4LDYgKzU4LDM0IEBAIGV4dGVybiAiQyIgewo+ICAg
KiBtYXkgcHJlc2VydmUgbWVhbmluZyAtIHN1Y2ggYXMgbnVtYmVyIG9mIHBsYW5lcyAtIGZyb20g
dGhlIGZvdXJjYyBjb2RlLAo+ICAgKiB3aGVyZWFzIG90aGVycyBtYXkgbm90Lgo+ICAgKgo+ICsg
KiBNb2RpZmllcnMgbXVzdCB1bmlxdWVseSBlbmNvZGUgYnVmZmVyIGxheW91dC4gSW4gb3RoZXIg
d29yZHMsIGEgYnVmZmVyIG11c3QKPiArICogbWF0Y2ggb25seSBhIHNpbmdsZSBtb2RpZmllci4g
QSBtb2RpZmllciBtdXN0IG5vdCBiZSBhIHN1YnNldCBvZiBsYXlvdXRzIG9mCj4gKyAqIGFub3Ro
ZXIgbW9kaWZpZXIuIEZvciBpbnN0YW5jZSwgaXQncyBpbmNvcnJlY3QgdG8gZW5jb2RlIHBpdGNo
IGFsaWdubWVudCBpbgo+ICsgKiBhIG1vZGlmaWVyOiBhIGJ1ZmZlciBtYXkgbWF0Y2ggYSA2NC1w
aXhlbCBhbGlnbmVkIG1vZGlmaWVyIGFuZCBhIDMyLXBpeGVsCj4gKyAqIGFsaWduZWQgbW9kaWZp
ZXIuIFRoYXQgc2FpZCwgbW9kaWZpZXJzIGNhbiBoYXZlIGltcGxpY2l0IG1pbmltYWwKPiArICog
cmVxdWlyZW1lbnRzLgo+ICsgKgo+ICsgKiBGb3IgbW9kaWZpZXJzIHdoZXJlIHRoZSBjb21iaW5h
dGlvbiBvZiBmb3VyY2MgY29kZSBhbmQgbW9kaWZpZXIgY2FuIGFsaWFzLAo+ICsgKiBhIGNhbm9u
aWNhbCBwYWlyIG5lZWRzIHRvIGJlIGRlZmluZWQgYW5kIHVzZWQgYnkgYWxsIGRyaXZlcnMuIEFu
IGV4YW1wbGUKPiArICogaXMgQUZCQywgd2hlcmUgYm90aCBBUkdCIGFuZCBBQkdSIGhhdmUgdGhl
IGV4YWN0IHNhbWUgY29tcHJlc3NlZCBsYXlvdXQuCgpUaGUgbmV3IHBhcmFncmFwaCBiZWxvdyBs
b29rcyBnb29kLCBidXQgdGhpcyBzZW50ZW5jZSBmcm9tIHRoZSBlbmQgb2YKdGhlIHBhcmFncmFw
aCBhYm92ZSBzdGlsbCBuZWVkcyB0byBiZSByZW1vdmVkOgoKICBBbiBleGFtcGxlIGlzIEFGQkMs
IHdoZXJlIGJvdGggQVJHQiBhbmQgQUJHUiBoYXZlIHRoZSBleGFjdCBzYW1lIGNvbXByZXNzZWQg
bGF5b3V0LgoKV2l0aCB0aGF0IGZpeGVkOgoKUmV2aWV3ZWQtYnk6IEJyaWFuIFN0YXJrZXkgPGJy
aWFuLnN0YXJrZXlAYXJtLmNvbT4KClRoYW5rcywKLUJyaWFuCgo+ICsgKgo+ICsgKiBGb3IgbW9k
aWZpZXJzIHdoZXJlIHRoZSBjb21iaW5hdGlvbiBvZiBmb3VyY2MgY29kZSBhbmQgbW9kaWZpZXIg
Y2FuIGFsaWFzLAo+ICsgKiBhIGNhbm9uaWNhbCBwYWlyIG5lZWRzIHRvIGJlIGRlZmluZWQgYW5k
IHVzZWQgYnkgYWxsIGRyaXZlcnMuIFByZWZlcnJlZAo+ICsgKiBjb21iaW5hdGlvbnMgYXJlIGFs
c28gZW5jb3VyYWdlZCB3aGVyZSBhbGwgY29tYmluYXRpb25zIG1pZ2h0IGxlYWQgdG8KPiArICog
Y29uZnVzaW9uIGFuZCB1bm5lY2Vzc2FyaWx5IHJlZHVjZWQgaW50ZXJvcGVyYWJpbGl0eS4gQW4g
ZXhhbXBsZSBmb3IgdGhlCj4gKyAqIGxhdHRlciBpcyBBRkJDLCB3aGVyZSB0aGUgQUJHUiBsYXlv
dXRzIGFyZSBwcmVmZXJyZWQgb3ZlciBBUkdCIGxheW91dHMuCj4gKyAqCj4gKyAqIFRoZXJlIGFy
ZSB0d28ga2luZHMgb2YgbW9kaWZpZXIgdXNlcnM6Cj4gKyAqCj4gKyAqIC0gS2VybmVsIGFuZCB1
c2VyLXNwYWNlIGRyaXZlcnM6IGZvciBkcml2ZXJzIGl0J3MgaW1wb3J0YW50IHRoYXQgbW9kaWZp
ZXJzCj4gKyAqICAgZG9uJ3QgYWxpYXMsIG90aGVyd2lzZSB0d28gZHJpdmVycyBtaWdodCBzdXBw
b3J0IHRoZSBzYW1lIGZvcm1hdCBidXQgdXNlCj4gKyAqICAgZGlmZmVyZW50IGFsaWFzZXMsIHBy
ZXZlbnRpbmcgdGhlbSBmcm9tIHNoYXJpbmcgYnVmZmVycyBpbiBhbiBlZmZpY2llbnQKPiArICog
ICBmb3JtYXQuCj4gKyAqIC0gSGlnaGVyLWxldmVsIHByb2dyYW1zIGludGVyZmFjaW5nIHdpdGgg
S01TL0dCTS9FR0wvVnVsa2FuL2V0YzogdGhlc2UgdXNlcnMKPiArICogICBzZWUgbW9kaWZpZXJz
IGFzIG9wYXF1ZSB0b2tlbnMgdGhleSBjYW4gY2hlY2sgZm9yIGVxdWFsaXR5IGFuZCBpbnRlcnNl
Y3QuCj4gKyAqICAgVGhlc2UgdXNlcnMgbXVzbid0IG5lZWQgdG8ga25vdyB0byByZWFzb24gYWJv
dXQgdGhlIG1vZGlmaWVyIHZhbHVlCj4gKyAqICAgKGkuZS4gdGhleSBhcmUgbm90IGV4cGVjdGVk
IHRvIGV4dHJhY3QgaW5mb3JtYXRpb24gb3V0IG9mIHRoZSBtb2RpZmllcikuCj4gKyAqCj4gICAq
IFZlbmRvcnMgc2hvdWxkIGRvY3VtZW50IHRoZWlyIG1vZGlmaWVyIHVzYWdlIGluIGFzIG11Y2gg
ZGV0YWlsIGFzCj4gICAqIHBvc3NpYmxlLCB0byBlbnN1cmUgbWF4aW11bSBjb21wYXRpYmlsaXR5
IGFjcm9zcyBkZXZpY2VzLCBkcml2ZXJzIGFuZAo+ICAgKiBhcHBsaWNhdGlvbnMuCj4gLS0gCj4g
Mi4yNy4wCj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
