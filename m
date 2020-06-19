Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3C2008E0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398D66ECA3;
	Fri, 19 Jun 2020 12:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130049.outbound.protection.outlook.com [40.107.13.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D22B6EC57
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 12:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nojVMKPLcnObmoNknNitu6aV29n9qxeX9P8k6BsctyU=;
 b=QVSnZi4r+dmspyOxlffZM/Xx+Yj2XbCOwek4ZycJzjaKGbMaENsFuK7ObEd8p3nJVBF4JeOuPrAry/caMdeqop/GOghDUDcYJRdeH0Qu2WgsCILkV8xHYuxZ2xe1F3TKmPUy2eEZJYBtiEg1FL/uBkNxhFfWwAV3AnAN6qvc4oc=
Received: from DB6PR0601CA0015.eurprd06.prod.outlook.com (2603:10a6:4:7b::25)
 by AM5PR0802MB2578.eurprd08.prod.outlook.com (2603:10a6:203:9e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 12:39:47 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::21) by DB6PR0601CA0015.outlook.office365.com
 (2603:10a6:4:7b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Fri, 19 Jun 2020 12:39:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 12:39:47 +0000
Received: ("Tessian outbound 147ff5d152c1:v59");
 Fri, 19 Jun 2020 12:39:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1e7b787b20bb9e7
X-CR-MTA-TID: 64aa7808
Received: from 42aa4aaf4aa1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 863DBD63-8C34-4267-8B86-E7BA287FEEFB.1; 
 Fri, 19 Jun 2020 12:39:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 42aa4aaf4aa1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Jun 2020 12:39:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LckrnJiu2MzIqCD3KmanLf7UFVq6VL0a1E0HFr3qucob9CwcdsEani2IZsvfBYFHEJ2wzC0Nyp8BqVVnYKa6977P8+77TZWHkFxUf001aBYORUX/Mv/DGPjckng5/7y9az6japY0RbXOF8Rlk1NVKBFU3Ba8FEJJYzVo/euJ6XsocQiYiWquOygJ8Yin37aF2UjdJi49y9IxEwFoIpN2aGlk20FZGoNCI9SRGbtEmvs4SOlPl8Xn5apxVSRsULfzl/ejeXJOB+LwEJu5Yu9paqJH6Hp0bxcs4e+mKPaVxCZNCYGLLXaNafUs7Q37GoXvkR8z4JN9X9p80/olEJAzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nojVMKPLcnObmoNknNitu6aV29n9qxeX9P8k6BsctyU=;
 b=GijB/bqUfhek8NJJUSe0dgdn0cGeLVk+6q+oVd16GkRvcr9ke8UlQOxRy72wVAzZFY2J0SOAMgXzY9AsVTLTm0yAp1blWtMYVlA4XbwimQalhgkcVAfaOKRMqEjPo2fqP+yNpKFQtBqafBbfbErm5BYiLUnLLiX9+Y6IVhSvHMr8hIvn479jx+jvd1ZQJMpTnEIcT13n9zakPaK05Zq7gNqcIV+yx9R/ceTNX1j/8/wj2ddu6gJD8ve44P+5Nu+IfU0I2w4PaB9siZnflU2KyD2KAf8Y5wca4MAYjudEmYhoM0+1TCTzamwBZkOyPiMWwvGjXjXagOpOERAibYBHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nojVMKPLcnObmoNknNitu6aV29n9qxeX9P8k6BsctyU=;
 b=QVSnZi4r+dmspyOxlffZM/Xx+Yj2XbCOwek4ZycJzjaKGbMaENsFuK7ObEd8p3nJVBF4JeOuPrAry/caMdeqop/GOghDUDcYJRdeH0Qu2WgsCILkV8xHYuxZ2xe1F3TKmPUy2eEZJYBtiEg1FL/uBkNxhFfWwAV3AnAN6qvc4oc=
Authentication-Results-Original: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2778.eurprd08.prod.outlook.com (2603:10a6:7:34::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Fri, 19 Jun 2020 12:39:38 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::90de:e751:3ce:d9f0]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::90de:e751:3ce:d9f0%6]) with mapi id 15.20.3088.028; Fri, 19 Jun 2020
 12:39:38 +0000
Date: Fri, 19 Jun 2020 13:39:34 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4] drm/fourcc: document modifier uniqueness requirements
Message-ID: <20200619123934.m6mul3sul5rvumfh@DESKTOP-E1NTVVP.localdomain>
References: <vlSGwy1E6HtqHtZVsFs1gEiN4t9ofmU-YtyumzN0U0DjbusaQj7C3pTFcd0uI9oN_zMCkh0Wb7FxqK6RGtFgGXwHXflBG6bEE-DvjB1vuAI=@emersion.fr>
Content-Disposition: inline
In-Reply-To: <vlSGwy1E6HtqHtZVsFs1gEiN4t9ofmU-YtyumzN0U0DjbusaQj7C3pTFcd0uI9oN_zMCkh0Wb7FxqK6RGtFgGXwHXflBG6bEE-DvjB1vuAI=@emersion.fr>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.29 via Frontend Transport; Fri, 19 Jun 2020 12:39:37 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2019b4ad-f0dd-4f1d-002d-08d8144dd9b4
X-MS-TrafficTypeDiagnostic: HE1PR08MB2778:|AM5PR0802MB2578:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2578789D1145E27A36EA0D09F0980@AM5PR0802MB2578.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: VOSChaaAOBEiKTMDqtQ1cBL78YkusDHk2YwsJemapORkXTZoNhebVnLnv1YT+NbvbRzuEiJBJHhXr2Vnf8UssPZ/34xYzZAF1q7JQxS6og6v1PUc62/SKFUFX38vJSfyMOnKXARC5i0dG0alEGXqqJ1ZyeMctfxcsgnodsmydKbuywxDiYK++GqEtZjjAKGvf/jwK5gGIHisSUJtzR+rDIea3Li/Eaq/Uxkp2EZ1eewTp52kqsw/CjEkTZGHl7CAU7kzVBpvsnsLplfFAbjOilCDacnhV13JES6494FlDzIE3b/hgwZoFXma9b0pc59USJNK2uRegqu5cuDa4V5CGA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(2906002)(7416002)(86362001)(6916009)(44832011)(54906003)(956004)(52116002)(316002)(8936002)(478600001)(186003)(1076003)(5660300002)(66946007)(66556008)(6506007)(8676002)(66476007)(9686003)(6666004)(16526019)(7696005)(55016002)(26005)(66574015)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qYEk6VnNu0npdUvIRund8cHf1bX1iplxr6bbQvPUj7+eF01LZpQZt3RHT0Ljig6fLso/FzsEv3+xgMwmkU5rsqgQepWnZAOO+3NLbUq0Fy5qLjjhwfVsARQiVCjB2Oiq1GZMw+RezbCGetQaQ4u3vG1AmFhBJovT5fwSFo5vLfRCW31+7Xys9o9I/b/kganzq5VDixQlEUgW/7nmvAuXRMxAtRhRriMN/yr84C3BNpLDKFFe0ELtwpfl5RkrhGtasN+hEl1UuKqlVQQKH2OL9EMx2+Y+w7cXTJk9dXBL0MQqciFMiMOrIi9RXlEQuYvL6Tm7SbSehGTaKrsGWg+3n6cwG8e0gJj9LGE9mEeFHJea3BbWq4nKtjZlMFrTvkKys9r9CwX+bz0FhC8ohNTElFlbbAgI8/yae1BfV9eCOhOS9eF4iEJqOw+AXhKK/THfVYWW5qAH8mUn7dIFUSaLNyTvX1b8kR0z1EGUzrwg8FUp5SLqMhr257SXiwjfYUwH
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2778
Original-Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966005)(26005)(478600001)(54906003)(9686003)(16526019)(316002)(82740400003)(47076004)(8936002)(186003)(66574015)(55016002)(4326008)(70586007)(70206006)(8676002)(6506007)(2906002)(1076003)(5660300002)(336012)(82310400002)(6862004)(7696005)(356005)(44832011)(86362001)(956004)(6666004)(81166007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c212334c-42cd-4177-141d-08d8144dd496
X-Forefront-PRVS: 0439571D1D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BO4/HijQD6SsHMBJSzAd/QCdmzS8Yfgp3XrApA6mpsbiOHxrecY87afK6Fk+yGIV5bzzEYp96e8wrTYlOF3vMavjiMCuiYmHRA9UQcbwn6R9nbiW8fQ609rfn/1CerEfLpoSb6K3jycK13BYleesqPnPQDMvz3b52wn51pAg7uV5xVFiBZG7W9gmtU26nVgAsW4ExjSTIUUs7NcKdUL8S67tETyHK/pj4iV/6khpwH3/II2sgBLc1Dln2QP3zMDOHbhcEJmr8TTIG+HBdxqfSSt3OqUzZnQa7PAqfW5QCTcIwntOMpvB7MyvijdXMGn75fqIbjcEElKjQxMiwfFWuo0nM8RobspyUnJxvS4vZwCDVv5xsEewCDX2uceMFAvy1fJgF1rwgcmBLF92PrHfQg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 12:39:47.0105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2019b4ad-f0dd-4f1d-002d-08d8144dd9b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2578
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

SGkgU2ltb24sCgpPbiBGcmksIEp1biAxOSwgMjAyMCBhdCAxMToxMjoyNUFNICswMDAwLCBTaW1v
biBTZXIgd3JvdGU6Cj4gVGhlcmUgaGF2ZSBzdWdnZXN0aW9ucyB0byBiYWtlIHBpdGNoIGFsaWdu
bWVudCwgYWRkcmVzcyBhbGlnbmVtZW50LAo+IGNvbnRpZ3VvdXMgbWVtb3J5IG9yIG90aGVyIHBs
YWNlbWVudCAoaGlkZGVuIFZSQU0sIEdUVC9CQVIsIGV0YykKPiBjb25zdHJhaW50cyBpbnRvIG1v
ZGlmaWVycy4gTGFzdCB0aW1lIHRoaXMgd2FzIGJyb3VnaHQgdXAgaXQgc2VlbWVkCj4gbGlrZSB0
aGUgY29uc2Vuc3VzIHdhcyB0byBub3QgYWxsb3cgdGhpcy4gRG9jdW1lbnQgdGhpcyBpbiBkcm1f
Zm91cmNjLmguCj4gCj4gVGhlcmUgYXJlIHNldmVyYWwgcmVhc29ucyBmb3IgdGhpcy4KPiAKPiAt
IEVuY29kaW5nIGFsbCBvZiB0aGVzZSBjb25zdHJhaW50cyBpbiB0aGUgbW9kaWZpZXJzIHdvdWxk
IGV4cGxvZGUgdGhlCj4gICBzZWFyY2ggc3BhY2UgcHJldHR5IHF1aWNrbHkgKHdlIG9ubHkgaGF2
ZSA2NCBiaXRzIHRvIHdvcmsgd2l0aCkuCj4gLSBNb2RpZmllcnMgbmVlZCB0byBiZSB1bmFtYmln
dW91czogYSBidWZmZXIgY2FuIG9ubHkgaGF2ZSBhIHNpbmdsZQo+ICAgbW9kaWZpZXIuCj4gLSBN
b2RpZmllciB1c2VycyBhcmVuJ3QgZXhwZWN0ZWQgdG8gcGFyc2UgbW9kaWZpZXJzIChleGNlcHQg
ZHJpdmVycykuCj4gCj4gdjI6IGFkZCBwYXJhZ3JhcGggYWJvdXQgYWxpYXNlcyAoRGFuaWVsKQo+
IAo+IHYzOiBmaXggdW5yZWxhdGVkIGNoYW5nZXMgc2VudCB3aXRoIHRoZSBwYXRjaAo+IAo+IHY0
OiBkaXNhbWJpZ3VhdGUgdXNlcnMgYmV0d2VlbiBkcml2ZXIgYW5kIGhpZ2hlci1sZXZlbCBwcm9n
cmFtcyAoQnJpYW4sCj4gRGFuaWVsKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29u
dGFjdEBlbWVyc2lvbi5mcj4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiBDYzogRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9yZz4K
PiBDYzogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+IENjOiBE
YXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+Cj4gQ2M6IE1hcmVrIE9sxaHDoWsgPG1hcmFl
b0BnbWFpbC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPgo+
IENjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IE1pY2hl
bCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+Cj4gQ2M6IEJyaWFuIFN0YXJrZXkgPGJyaWFu
LnN0YXJrZXlAYXJtLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgg
fCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIv
aW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiBpbmRleCA0OTAxNDM1MDBhNTAuLjRkM2Y4
MTlkY2EwYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ICsr
KyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gQEAgLTU4LDYgKzU4LDI4IEBAIGV4
dGVybiAiQyIgewo+ICAgKiBtYXkgcHJlc2VydmUgbWVhbmluZyAtIHN1Y2ggYXMgbnVtYmVyIG9m
IHBsYW5lcyAtIGZyb20gdGhlIGZvdXJjYyBjb2RlLAo+ICAgKiB3aGVyZWFzIG90aGVycyBtYXkg
bm90Lgo+ICAgKgo+ICsgKiBNb2RpZmllcnMgbXVzdCB1bmlxdWVseSBlbmNvZGUgYnVmZmVyIGxh
eW91dC4gSW4gb3RoZXIgd29yZHMsIGEgYnVmZmVyIG11c3QKPiArICogbWF0Y2ggb25seSBhIHNp
bmdsZSBtb2RpZmllci4gQSBtb2RpZmllciBtdXN0IG5vdCBiZSBhIHN1YnNldCBvZiBsYXlvdXRz
IG9mCj4gKyAqIGFub3RoZXIgbW9kaWZpZXIuIEZvciBpbnN0YW5jZSwgaXQncyBpbmNvcnJlY3Qg
dG8gZW5jb2RlIHBpdGNoIGFsaWdubWVudCBpbgo+ICsgKiBhIG1vZGlmaWVyOiBhIGJ1ZmZlciBt
YXkgbWF0Y2ggYSA2NC1waXhlbCBhbGlnbmVkIG1vZGlmaWVyIGFuZCBhIDMyLXBpeGVsCj4gKyAq
IGFsaWduZWQgbW9kaWZpZXIuIFRoYXQgc2FpZCwgbW9kaWZpZXJzIGNhbiBoYXZlIGltcGxpY2l0
IG1pbmltYWwKPiArICogcmVxdWlyZW1lbnRzLgo+ICsgKgo+ICsgKiBGb3IgbW9kaWZpZXJzIHdo
ZXJlIHRoZSBjb21iaW5hdGlvbiBvZiBmb3VyY2MgY29kZSBhbmQgbW9kaWZpZXIgY2FuIGFsaWFz
LAo+ICsgKiBhIGNhbm9uaWNhbCBwYWlyIG5lZWRzIHRvIGJlIGRlZmluZWQgYW5kIHVzZWQgYnkg
YWxsIGRyaXZlcnMuIEFuIGV4YW1wbGUKPiArICogaXMgQUZCQywgd2hlcmUgYm90aCBBUkdCIGFu
ZCBBQkdSIGhhdmUgdGhlIGV4YWN0IHNhbWUgY29tcHJlc3NlZCBsYXlvdXQuCgpJIHN0aWxsIGRv
bid0IGFncmVlIHdpdGggdGhpcyBzZW50ZW5jZS4gQVJHQiBhbmQgQUJHUiBoYXZlIGRpZmZlcmVu
dApjb21wcmVzc2VkIGxheW91dHMgaW4gQUZCQy4KClRoYW5rcywKLUJyaWFuCgo+ICsgKgo+ICsg
KiBUaGVyZSBhcmUgdHdvIGtpbmRzIG9mIG1vZGlmaWVyIHVzZXJzOgo+ICsgKgo+ICsgKiAtIEtl
cm5lbCBhbmQgdXNlci1zcGFjZSBkcml2ZXJzOiBmb3IgZHJpdmVycyBpdCdzIGltcG9ydGFudCB0
aGF0IG1vZGlmaWVycwo+ICsgKiAgIGRvbid0IGFsaWFzLCBvdGhlcndpc2UgdHdvIGRyaXZlcnMg
bWlnaHQgc3VwcG9ydCB0aGUgc2FtZSBmb3JtYXQgYnV0IHVzZQo+ICsgKiAgIGRpZmZlcmVudCBh
bGlhc2VzLCBwcmV2ZW50aW5nIHRoZW0gZnJvbSBzaGFyaW5nIGJ1ZmZlcnMgaW4gYW4gZWZmaWNp
ZW50Cj4gKyAqICAgZm9ybWF0Lgo+ICsgKiAtIEhpZ2hlci1sZXZlbCBwcm9ncmFtcyBpbnRlcmZh
Y2luZyB3aXRoIEtNUy9HQk0vRUdML1Z1bGthbi9ldGM6IHRoZXNlIHVzZXJzCj4gKyAqICAgc2Vl
IG1vZGlmaWVycyBhcyBvcGFxdWUgdG9rZW5zIHRoZXkgY2FuIGNoZWNrIGZvciBlcXVhbGl0eSBh
bmQgaW50ZXJzZWN0Lgo+ICsgKiAgIFRoZXNlIHVzZXJzIG11c24ndCBuZWVkIHRvIGtub3cgdG8g
cmVhc29uIGFib3V0IHRoZSBtb2RpZmllciB2YWx1ZQo+ICsgKiAgIChpLmUuIHRoZXkgYXJlIG5v
dCBleHBlY3RlZCB0byBleHRyYWN0IGluZm9ybWF0aW9uIG91dCBvZiB0aGUgbW9kaWZpZXIpLgo+
ICsgKgo+ICAgKiBWZW5kb3JzIHNob3VsZCBkb2N1bWVudCB0aGVpciBtb2RpZmllciB1c2FnZSBp
biBhcyBtdWNoIGRldGFpbCBhcwo+ICAgKiBwb3NzaWJsZSwgdG8gZW5zdXJlIG1heGltdW0gY29t
cGF0aWJpbGl0eSBhY3Jvc3MgZGV2aWNlcywgZHJpdmVycyBhbmQKPiAgICogYXBwbGljYXRpb25z
Lgo+IC0tIAo+IDIuMjcuMAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
