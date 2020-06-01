Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C9D1EA1F0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 12:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7AF6E228;
	Mon,  1 Jun 2020 10:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4126E228
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ak7q3cuuQOfhuA9CAkALTpuic+JVLdgoNVLG70KOG4=;
 b=L2S5GasIT5qSdKxg+QtBXOeQuZX8SWuh9IkrkkArLrXzNQ1vUE2aK2OjAWCBfg9X5hXryuSdCvTQr/iE5UHuhywjeYO7hmQpYQCmEmqXhkCYITYmD56VSjkuRe0EXCoB16BWPxDBhwK5HOPcIjGezMcbuJquyCrgsnDDiN8oiL4=
Received: from AM6PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:20b:6e::33)
 by HE1PR08MB2684.eurprd08.prod.outlook.com (2603:10a6:7:2c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Mon, 1 Jun
 2020 10:36:07 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::b8) by AM6PR02CA0020.outlook.office365.com
 (2603:10a6:20b:6e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Mon, 1 Jun 2020 10:36:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Mon, 1 Jun 2020 10:36:07 +0000
Received: ("Tessian outbound facc38080784:v57");
 Mon, 01 Jun 2020 10:36:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81a393443126d08c
X-CR-MTA-TID: 64aa7808
Received: from d5461f528c5c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D900EBF-8350-4B81-817D-FF46F2952E3F.1; 
 Mon, 01 Jun 2020 10:36:02 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5461f528c5c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 01 Jun 2020 10:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8Mf1S3Nzgreke/iVeeQJnWInq2rdfZUr5qs9eOlTCK6b+dmXaErvBjQHgD7J4UBq2JvBmPJso7/eZoh/ddFDNJwpQ4ekKqosY/ZPWSV0OCDxXpdb0StA/2DrtdM17y0DqnRUr3C4B9/ObzuZOS4u5EzV8z8gKN6hWPYFlOYy9OMNzaXCr+xuYxIZjHLzpQ/NdlLUKUdqu3BTk1TDQ80AtPSTd6FnkmxcRV9tV31Zuo3hn0ryiNMIpmK8DJxcmXb8z3VsPf8uZEelaA3N2CNT5YrfiBYSRhUlE0PnTiJJAEJfF+pEhKPpK57p6wLBdlV6q0GQ0gYERa6bmGl0ncOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ak7q3cuuQOfhuA9CAkALTpuic+JVLdgoNVLG70KOG4=;
 b=eoS8al8LBSvmGcnz8dB4Q0CNkmFCdJZn8h7fMGlRI0o3D6zdSwQakPQUygMIOiIGRucTv3KdymPP/5/JxpcPHmM0dFYCjyOwUvePwl8h2tPQhiCigMjjK8qM4uviE1Et5Nh1OCelRxggncLcaUR5qFkOGM29nvLtIP6IBcuEvE1plWuI7uq1XvK0RmQOzCaDTJC2uf82QQu/vnXV6KjjYHaf6j2AkFts5NVZQ0fZxf7PhxKpM9T4nQHOQ0uCjarLZMGgA/7CU/VwZt770/jx2FxwSJqZ0TWlHouaL8vGlveFSMlrIhj6UXp77JYFZzBeddksTMDQBCL/IEsDwawBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ak7q3cuuQOfhuA9CAkALTpuic+JVLdgoNVLG70KOG4=;
 b=L2S5GasIT5qSdKxg+QtBXOeQuZX8SWuh9IkrkkArLrXzNQ1vUE2aK2OjAWCBfg9X5hXryuSdCvTQr/iE5UHuhywjeYO7hmQpYQCmEmqXhkCYITYmD56VSjkuRe0EXCoB16BWPxDBhwK5HOPcIjGezMcbuJquyCrgsnDDiN8oiL4=
Authentication-Results-Original: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2633.eurprd08.prod.outlook.com (2603:10a6:7:37::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.19; Mon, 1 Jun 2020 10:35:57 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::90de:e751:3ce:d9f0]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::90de:e751:3ce:d9f0%6]) with mapi id 15.20.3045.018; Mon, 1 Jun 2020
 10:35:57 +0000
Date: Mon, 1 Jun 2020 11:35:54 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/fourcc: document modifier uniqueness requirements
Message-ID: <20200601103554.25geaqbevnn7256t@DESKTOP-E1NTVVP.localdomain>
References: <oiOTNO-CVtaRiMyv-cHHP3CGvE4-9eSZRMmmdzXMb56vWw6CppnmT95NRUStbuV_RJLF-G_7usijW0kXKm64IuTJK9g49DycnAuE80yGlyo=@emersion.fr>
 <20200527085534.GP206103@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20200527085534.GP206103@phenom.ffwll.local>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO3P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::20) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO3P123CA0015.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.19 via Frontend Transport; Mon, 1 Jun 2020 10:35:55 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7bf6fb8c-bfde-4423-1611-08d806179817
X-MS-TrafficTypeDiagnostic: HE1PR08MB2633:|HE1PR08MB2684:
X-Microsoft-Antispam-PRVS: <HE1PR08MB2684B19F58A3DB3EB26EBEE5F08A0@HE1PR08MB2684.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-Forefront-PRVS: 0421BF7135
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Tup1AKziDGb8Q5+ImSw3e8AFkD+i6FvlEHa9hKHvITRGzbSR4I82QnC9NAT8BcsVyFBCrSzJ3VfUgfCemqS9pgEitl1y66jySXfpjzsHvbWyM4XIX3PXFcnEW+c1VUq7cOkgmplODnN2NcfdHJiPBNCK0BKW4GkTIPfRygTseXfL3UeBlU1d1bT1BnptBL+Q/G2N5xYgCLHw78dHaPj2523OfMxU5z4oew3DMEhO5Bv+73jiCyq6tgmllUmK1hHmwOwgKNOVnMEQuGmSNpS4fbDyoIWbEimaiQC2Sj9eucymeb2KVJU1LfiOYRhEFkIvacaiGgsNxWoTjxCYXB1ufSSo+JSZNs8bxPMDkHE+0hVwdjrBR3dRoGKkFtzAqrBGNSrXC9yIFccfW1MXXGqqdQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(6506007)(316002)(478600001)(44832011)(956004)(5660300002)(26005)(16526019)(186003)(6916009)(66946007)(4326008)(66556008)(66476007)(86362001)(8936002)(8676002)(2906002)(1076003)(55016002)(9686003)(54906003)(83380400001)(52116002)(966005)(83080400001)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: dRHFow/04AbCx4bwLzc2oHm/TUUgOnBJiYFd31YwxyCRrGPAqmR5/+AUK/7i8nGNzoe5fsyRZ9gWAZFbQC2VoktCNgoQHvHIod9fG5/JZG4E/oPU4sPzM1HZ2Qx+YbRrnCprS5VGK44h0qCrtlzLRgxSQOpFxwBjW2BAcI8jgQTGBrKxfDezE86Ftqa/tcGF1x7QSAyDRMC5PrPgIPr/9oq0wvV5ANBfhgmMYjKSuPq5bhD11NA5cZqiWQ/GH4EHk1urbF1jdIVjndBEpFfbSmCbSKD/m+ZMi0HVBsP04X/65mqzLJqFprbFPTI9/koHe6IXzZVDhjm/QlmArsm34gM9U3yQngqcHts1nefWWChEVi2nRlIsjLzRg+0kwut+ZvaCkKAcdAiSYFMuPMx6VvHxokO6iWYX1JzhzlRIwNl7Lj1Fi8fLis+pq/QNQdbPq731a1d8psLLAC12Nu3Huxl9mehmVfNGFkfqcek0Fi+zLwXVJgAJxmjy8WWMkSCN
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2633
Original-Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(83380400001)(6862004)(8676002)(5660300002)(956004)(26005)(70586007)(70206006)(36906005)(8936002)(4326008)(316002)(336012)(9686003)(6506007)(47076004)(86362001)(82310400002)(1076003)(55016002)(966005)(478600001)(81166007)(186003)(16526019)(83080400001)(356005)(44832011)(82740400003)(7696005)(2906002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 830a5541-fc1c-4b7e-d819-08d80617911a
X-Forefront-PRVS: 0421BF7135
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9p4dVTo4TzpjwpiuT+B5IpJJXYkm06PI/oafpWa6IK1JuS9FANp1hYsW9gtLnfWYzikgX94dv29dupWxFnjsW2c9XLRd5gR7X6bFntd4KbiMkQuBo2rLcOTQNZde2GvyvqVeglx9Q9e4f8lr7YMJQ8nNZE/mJH2V10WE73wp/IbxYlc1mGwpKdA7+fvBzmNSeC6TAPaFZq0Qb3tAyEcc9QbtseZ9lHzOKPdWHVisWAs3BxWKaboiuvYvXORw9Iowt4WP38LVFNCd0d2a/5oef7D5RLqQY0x7U1ovUTjg/fOJRUNwXytBAyNOzSM91NB9In4tYl1D1mi8SoH7DTx9n5umnauDQoOp7iQYBaOOVatvuNwE7TuWuF7J/IvMaV+vPCTMfS2rSY2QCFYvEyRfQzFIrF9PxPa7zKzWUoSxyMzXsHHVRFnn31lUD7r5NQhnKG6/X8KDJT3wLBnBRVLfGXY2OOa16w5nEhgaoM8clQA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2020 10:36:07.7940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf6fb8c-bfde-4423-1611-08d806179817
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2684
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
Cc: nd@arm.com, dri-devel@lists.freedesktop.org,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjcsIDIwMjAgYXQgMTA6NTU6MzRBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIE1heSAyNywgMjAyMCBhdCAwODo1MjowMEFNICswMDAwLCBTaW1vbiBT
ZXIgd3JvdGU6Cj4gPiBUaGVyZSBoYXZlIHN1Z2dlc3Rpb25zIHRvIGJha2UgcGl0Y2ggYWxpZ25t
ZW50LCBhZGRyZXNzIGFsaWduZW1lbnQsCj4gPiBjb250aWd1b3VzIG1lbW9yeSBvciBvdGhlciBw
bGFjZW1lbnQgKGhpZGRlbiBWUkFNLCBHVFQvQkFSLCBldGMpCj4gPiBjb25zdHJhaW50cyBpbnRv
IG1vZGlmaWVycy4gTGFzdCB0aW1lIHRoaXMgd2FzIGJyb3VnaHQgdXAgaXQgc2VlbWVkCj4gPiBs
aWtlIHRoZSBjb25zZW5zdXMgd2FzIHRvIG5vdCBhbGxvdyB0aGlzLiBEb2N1bWVudCB0aGlzIGlu
IGRybV9mb3VyY2MuaC4KPiA+IAo+ID4gVGhlcmUgYXJlIHNldmVyYWwgcmVhc29ucyBmb3IgdGhp
cy4KPiA+IAo+ID4gLSBFbmNvZGluZyBhbGwgb2YgdGhlc2UgY29uc3RyYWludHMgaW4gdGhlIG1v
ZGlmaWVycyB3b3VsZCBleHBsb2RlIHRoZQo+ID4gICBzZWFyY2ggc3BhY2UgcHJldHR5IHF1aWNr
bHkgKHdlIG9ubHkgaGF2ZSA2NCBiaXRzIHRvIHdvcmsgd2l0aCkuCj4gPiAtIE1vZGlmaWVycyBu
ZWVkIHRvIGJlIHVuYW1iaWd1b3VzOiBhIGJ1ZmZlciBjYW4gb25seSBoYXZlIGEgc2luZ2xlCj4g
PiAgIG1vZGlmaWVyLgo+ID4gLSBNb2RpZmllciB1c2VycyBhcmVuJ3QgZXhwZWN0ZWQgdG8gcGFy
c2UgbW9kaWZpZXJzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RA
ZW1lcnNpb24uZnI+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4g
Q2M6IERhbmllbCBTdG9uZSA8ZGFuaWVsQGZvb2lzaGJhci5vcmc+Cj4gPiBDYzogQmFzIE5pZXV3
ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+ID4gQ2M6IERhdmUgQWlybGllIDxh
aXJsaWVkQGdtYWlsLmNvbT4KPiA+IENjOiBNYXJlayBPbMWhw6FrIDxtYXJhZW9AZ21haWwuY29t
Pgo+ID4gLS0tCj4gPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCAxMSArKysrKysr
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFwaS9kcm0v
ZHJtX2ZvdXJjYy5oCj4gPiBpbmRleCA0OTAxNDM1MDBhNTAuLjk3ZWIwZjFjZjlmOCAxMDA2NDQK
PiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gPiArKysgYi9pbmNsdWRl
L3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ID4gQEAgLTU4LDYgKzU4LDE3IEBAIGV4dGVybiAiQyIg
ewo+ID4gICAqIG1heSBwcmVzZXJ2ZSBtZWFuaW5nIC0gc3VjaCBhcyBudW1iZXIgb2YgcGxhbmVz
IC0gZnJvbSB0aGUgZm91cmNjIGNvZGUsCj4gPiAgICogd2hlcmVhcyBvdGhlcnMgbWF5IG5vdC4K
PiA+ICAgKgo+ID4gKyAqIE1vZGlmaWVycyBtdXN0IHVuaXF1ZWx5IGVuY29kZSBidWZmZXIgbGF5
b3V0LiBJbiBvdGhlciB3b3JkcywgYSBidWZmZXIgbXVzdAo+ID4gKyAqIG1hdGNoIG9ubHkgYSBz
aW5nbGUgbW9kaWZpZXIuIEEgbW9kaWZpZXIgbXVzdCBub3QgYmUgYSBzdWJzZXQgb2YgbGF5b3V0
cyBvZgo+ID4gKyAqIGFub3RoZXIgbW9kaWZpZXIuIEZvciBpbnN0YW5jZSwgaXQncyBpbmNvcnJl
Y3QgdG8gZW5jb2RlIHBpdGNoIGFsaWdubWVudCBpbgo+ID4gKyAqIGEgbW9kaWZpZXI6IGEgYnVm
ZmVyIG1heSBtYXRjaCBhIDY0LXBpeGVsIGFsaWduZWQgbW9kaWZpZXIgYW5kIGEgMzItcGl4ZWwK
PiA+ICsgKiBhbGlnbmVkIG1vZGlmaWVyLiBUaGF0IHNhaWQsIG1vZGlmaWVycyBjYW4gaGF2ZSBp
bXBsaWNpdCBtaW5pbWFsCj4gPiArICogcmVxdWlyZW1lbnRzLgo+IAo+IEkgdGhpbmsgd2Ugc2hv
dWxkIGFsc28gYWRkIHRoZSBhbGlhc2luZyB3aGVuIHRoZSBmb3VyY2MgY29kZXMgYXJlCj4gaW52
b2x2ZWQsIHdpdGggYWZiYyBhcyBleGFtcGxlLiBNYXliZToKPiAKPiBGb3IgbW9kaWZpZXJzIHdo
ZXJlIHRoZSBjb21iaW5hdGlvbiBvZiBmb3VyY2MgY29kZSBhbmQgbW9kaWZpZXIgY2FuIGFsaWFz
LAo+IGEgY2Fub25pY2FsIHBhaXIgbmVlZHMgdG8gYmUgZGVmaW5lZCBhbmQgdXNlZCBieSBhbGwg
ZHJpdmVycy4gQW4gZXhhbXBsZQo+IGlzIGFmYmMsIHdoZXJlIGJvdGggYXJnYiBhbmQgYWJnciBo
YXZlIHRoZSBleGFjdCBzYW1lIGNvbXByZXNzZWQgbGF5b3V0LgoKVGhhdCdzIGFjdHVhbGx5IGV4
cGxpY2l0bHkgX25vdF8gdGhlIGNhc2UgZm9yIEFGQkMsIHdoaWNoIHdhcyBvbmUgb2YKdGhlIHRo
aW5ncyBJIHdhcyB0cnlpbmcgdG8gZG9jdW1lbnQgaW4gYWZiYy5yc3QuCgo+IAo+IFdpdGggc29t
ZXRoaW5nIGxpa2UgdGhhdCBhZGRlZDoKPiAKPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAKPiAKPiA+ICsgKgo+ID4gKyAqIFVzZXJzIHNlZSBt
b2RpZmllcnMgYXMgb3BhcXVlIHRva2VucyB0aGV5IGNhbiBjaGVjayBmb3IgZXF1YWxpdHkgYW5k
Cj4gPiArICogaW50ZXJzZWN0LiBVc2VycyBtdXNuJ3QgbmVlZCB0byBrbm93IHRvIHJlYXNvbiBh
Ym91dCB0aGUgbW9kaWZpZXIgdmFsdWUKPiA+ICsgKiAoaS5lLiB1c2VycyBhcmUgbm90IGV4cGVj
dGVkIHRvIGV4dHJhY3QgaW5mb3JtYXRpb24gb3V0IG9mIHRoZSBtb2RpZmllcikuCj4gPiArICoK
CkRvZXNuJ3QgdGhpcyBjb25mbGljdCB3aXRoICJpbXBsaWNpdCBtaW5pbWFsIHJlcXVpcmVtZW50
cyIgYWJvdmU/CgpDZXJ0YWlubHkgZm9yIGEgYnVuY2ggb2YgZGlmZmVyZW50IEFGQkMgbW9kaWZp
ZXJzLCB0aGUgYWxsb2NhdG9yIHdvdWxkCm5lZWQgdG8gdW5kZXJzdGFuZCBzb21lIGZpZWxkcyBp
biBvcmRlciB0byBwcm9wZXJseSBhbGlnbi11cCB0aGUKYnVmZmVyIHNpemUuCgpUaGFua3MsCi1C
cmlhbgoKPiA+ICAgKiBWZW5kb3JzIHNob3VsZCBkb2N1bWVudCB0aGVpciBtb2RpZmllciB1c2Fn
ZSBpbiBhcyBtdWNoIGRldGFpbCBhcwo+ID4gICAqIHBvc3NpYmxlLCB0byBlbnN1cmUgbWF4aW11
bSBjb21wYXRpYmlsaXR5IGFjcm9zcyBkZXZpY2VzLCBkcml2ZXJzIGFuZAo+ID4gICAqIGFwcGxp
Y2F0aW9ucy4KPiA+IC0tIAo+ID4gMi4yNi4yCj4gPiAKPiA+IAo+IAo+IC0tIAo+IERhbmllbCBW
ZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxv
Zy5mZndsbC5jaAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
