Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7F1EA25D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 13:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4FC89F82;
	Mon,  1 Jun 2020 11:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2324289F82
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDg4vzsjF8uFlQgBF7zpFzQbD/g6w2hdZ5KeAR+jDV0=;
 b=3fLVcNjrACnfCFrua7+LjktXjzYeYnd6DulPXL2BM+XjI2km4czgYGbTMB6MN1Ih/SWRUjpy5EiNPV18m2BUpttJYiV/yv8R3xlsukxMB2JdIYhOqlReAM5DtJZUfhoPTYt93Im+tfLuw1wNLT186s4InIsNE4Tfl5NwFzUNRvM=
Received: from AM0PR01CA0095.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::36) by AM5PR0801MB2066.eurprd08.prod.outlook.com
 (2603:10a6:203:4d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Mon, 1 Jun
 2020 11:01:38 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:10e:cafe::a6) by AM0PR01CA0095.outlook.office365.com
 (2603:10a6:208:10e::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18 via Frontend
 Transport; Mon, 1 Jun 2020 11:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Mon, 1 Jun 2020 11:01:38 +0000
Received: ("Tessian outbound d078647f4174:v57");
 Mon, 01 Jun 2020 11:01:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ba0d5ee28de8fa7
X-CR-MTA-TID: 64aa7808
Received: from 1c622e635a00.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A9C93AA-4010-4BB0-A22F-9614F78E13EF.1; 
 Mon, 01 Jun 2020 11:01:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c622e635a00.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 01 Jun 2020 11:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7fjwDBZMJ/vY1Zrf8gnKpjYhTrvowTcF9Y8VWnGE2WdEcVn3bhemOgTqfZrpfwTtmSq9flQQq+MPOSf1/3J3nddDVAesGjD13BeMlqNeT5PoKjlzg6AJO9bmjDzxaq3hCAyysNe4txluE9U9lfcH6iNh1YgqZvdf7FeFoO6DVgXuWv9uuahlZlO2XWp4CH33GkPhJzXJAuknPBIUOI3xL9obtFAktrrVx7a7hm+s/Tsvq15ObEibxdD5zRqnjroACYPavkdUSyko37LLsSEVhiAIXHiIA37aw/ARC9wikPZSB/2NHlFTScIwlJG3XRw4jLtj/3yS7yv95NVmfiQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDg4vzsjF8uFlQgBF7zpFzQbD/g6w2hdZ5KeAR+jDV0=;
 b=ePvXHkGR305NHhX8JdG9uWK5Z/ZxHkNf6/GyKMDWdwMkVqccS9337LeVSIpIeSIMT79yup9YKw50UqfmFahlP+rr/dOP+mSa+fhSjPc32sF3NVaNEbnYdsadjzYi1qqjLVVDYTHR+YGg3NLM+G3kPYA+COTQVJV9P6jZcBuBTrGHqqqa0chSuxHLzBGiTgS8tV2ZWlPB/9yYPjuqWM4j5slfzwdarJIZcxt2hNA52SmaIznBoPG1z2yofnMW6PYlqmHb4JUuEpHFCLM0proLeMXEjCF6SA9rlSAZ9MwnoA35oHh+LUWGDeA8161v1siDOto9LRQJtByyGvTT5MRbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDg4vzsjF8uFlQgBF7zpFzQbD/g6w2hdZ5KeAR+jDV0=;
 b=3fLVcNjrACnfCFrua7+LjktXjzYeYnd6DulPXL2BM+XjI2km4czgYGbTMB6MN1Ih/SWRUjpy5EiNPV18m2BUpttJYiV/yv8R3xlsukxMB2JdIYhOqlReAM5DtJZUfhoPTYt93Im+tfLuw1wNLT186s4InIsNE4Tfl5NwFzUNRvM=
Authentication-Results-Original: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2698.eurprd08.prod.outlook.com (2603:10a6:7:34::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.22; Mon, 1 Jun 2020 11:01:30 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::90de:e751:3ce:d9f0]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::90de:e751:3ce:d9f0%6]) with mapi id 15.20.3045.018; Mon, 1 Jun 2020
 11:01:30 +0000
Date: Mon, 1 Jun 2020 12:01:29 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
Message-ID: <20200601110129.igvpdrh3j7qhumwc@DESKTOP-E1NTVVP.localdomain>
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
Content-Disposition: inline
In-Reply-To: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::16) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17 via Frontend Transport; Mon, 1 Jun 2020 11:01:29 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a3102054-973c-4dde-ab49-08d8061b2894
X-MS-TrafficTypeDiagnostic: HE1PR08MB2698:|AM5PR0801MB2066:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2066B5EE73F11B1A8498F151F08A0@AM5PR0801MB2066.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0421BF7135
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MrbKJpQetZCI5YoYeOG0Jf4hGsYaaE0DrI2PE3Mg41dvhVa0UZjzi9drCHwTW7nmZe3eOB8KYa4+txq2+hS7UB/EBeFON9KN6KsWwkmvZ6x547PimbsSRn93xJ56hpjtOSEzmaX47/vdNhuFZ1LgFoU8w2Y8JevDbmAmk3Pu8iUA28GmK1tHjB6JE58sCligz3TrTLWbKga9QTgMV1mEoQRXEd7S7DKSi3Q7AwwJhKXvJ/LMEg2aQ745AXvhwqGvIZj68Ju4JNvNvpsl8SlmC/f1MmPB4qWtAX3cQhq73a7TKzBXQKZKXPth9G18rxrEjtAtlM8LyVJvC724/Bz8pyPYw3lrxclCKTLG7JhjD9g=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(6916009)(54906003)(1076003)(2906002)(5660300002)(316002)(9686003)(55016002)(26005)(186003)(16526019)(86362001)(6506007)(8676002)(44832011)(478600001)(966005)(66556008)(8936002)(956004)(83380400001)(66946007)(7696005)(52116002)(4326008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0uy2Tu6vGw7jX4rBafTB3sInt200B9rzcVmPBNWtYeKAFfXb0aL4DH0z95zLHqpbHdRLUNFZVPE69LbwRV1h54HoAEwszl2njRBU0OVonGt+mkjE0g8iltJGg5CHHOs0jXQ2xP0ZHZj7VlC7jXLZ0noOqSB6PT/txRejRgE2s+q91OQVrtkyWOvgowMbwO7tkUwaDlGVIYEvEF4vThEX9UMbQrzKuf3AbOT1YymqUk+Bdt1O+ebkmtf60PToo+ReJ4xQfSNJMmA28YbNHFPZgHJUgJKD3DWS8SVo5EAelNfhheNyPbDbkUWePy99c8VCQqjVcG2uz3omTE4AytiLQlCn4+2ueK3eTdvbVXV7F9dzn5WT2WrY3nkncBg54BQc7hWNCkNNkL9pM4ijQUCcDxAlfxmvOhry+YNObkJ+EcYYgumPZtsYkec+xJpTo3nxRWBGlfr1mYUXUcN98cnXNvqjQDcTSQyHl4Iiy8sV08U=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2698
Original-Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(1076003)(5660300002)(4326008)(956004)(478600001)(966005)(47076004)(83380400001)(336012)(82310400002)(2906002)(6862004)(81166007)(82740400003)(356005)(54906003)(186003)(44832011)(16526019)(8936002)(8676002)(9686003)(6506007)(55016002)(86362001)(26005)(7696005)(70586007)(70206006)(36906005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fc8dccc7-f628-4d35-163c-08d8061b2394
X-Forefront-PRVS: 0421BF7135
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lieJVueSO8sOcrnxD6/pmcSnDHbyPgyZUX/3phIj295TGCO7lYmuqD5CI75LWSfllZ8E0K4ocki0+4cJKAaAiFcVvLYMT6K+/LBJxhIKVygjqCKk4PFgRPorK12WSwVrIers1mmJGYswOPequKnnKJFF80h6I05jErqc2L0JWM9mp7ozGg+ueDgYAF0cocft5b3rcVvSdN4rabRxlpHpdJxWXy/6v45tVmAHiozCItVIzgMZwRVfDzCDakh48gbut2q8wP/kcviVS9/wJZZbrVw4wLRhzOFV338OhabjEVxgeUrcsc9dIUWYEIbLFDAj5uJapo0fsxVXdX26fyha4uiKRDKbc3k/tnZMNyGCQKkiM6YdmQuVq3k5V3rOqpREFR5nTF9R5qP9jf0xjVKNhmRIjOsHmWf0HaMesCaXypv5v295TvSPhomlQhX5jjpw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2020 11:01:38.6331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3102054-973c-4dde-ab49-08d8061b2894
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2066
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, nd@arm.com,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29ycnkgZm9yIGNvbW1lbnRpbmcgb24gdGhlIG9ic29sZXRlIHYxIC0gdGhhdCdsbCB0ZWFjaCBt
ZSBmb3IgcmVhZGluZwpteSBiYWNrbG9nIGNocm9ub2xvZ2ljYWxseS4KCk9uIFRodSwgTWF5IDI4
LCAyMDIwIGF0IDAyOjM4OjM2UE0gKzAwMDAsIFNpbW9uIFNlciB3cm90ZToKPiBUaGVyZSBoYXZl
IHN1Z2dlc3Rpb25zIHRvIGJha2UgcGl0Y2ggYWxpZ25tZW50LCBhZGRyZXNzIGFsaWduZW1lbnQs
Cj4gY29udGlndW91cyBtZW1vcnkgb3Igb3RoZXIgcGxhY2VtZW50IChoaWRkZW4gVlJBTSwgR1RU
L0JBUiwgZXRjKQo+IGNvbnN0cmFpbnRzIGludG8gbW9kaWZpZXJzLiBMYXN0IHRpbWUgdGhpcyB3
YXMgYnJvdWdodCB1cCBpdCBzZWVtZWQKPiBsaWtlIHRoZSBjb25zZW5zdXMgd2FzIHRvIG5vdCBh
bGxvdyB0aGlzLiBEb2N1bWVudCB0aGlzIGluIGRybV9mb3VyY2MuaC4KPiAKPiBUaGVyZSBhcmUg
c2V2ZXJhbCByZWFzb25zIGZvciB0aGlzLgo+IAo+IC0gRW5jb2RpbmcgYWxsIG9mIHRoZXNlIGNv
bnN0cmFpbnRzIGluIHRoZSBtb2RpZmllcnMgd291bGQgZXhwbG9kZSB0aGUKPiAgIHNlYXJjaCBz
cGFjZSBwcmV0dHkgcXVpY2tseSAod2Ugb25seSBoYXZlIDY0IGJpdHMgdG8gd29yayB3aXRoKS4K
PiAtIE1vZGlmaWVycyBuZWVkIHRvIGJlIHVuYW1iaWd1b3VzOiBhIGJ1ZmZlciBjYW4gb25seSBo
YXZlIGEgc2luZ2xlCj4gICBtb2RpZmllci4KPiAtIE1vZGlmaWVyIHVzZXJzIGFyZW4ndCBleHBl
Y3RlZCB0byBwYXJzZSBtb2RpZmllcnMuCj4gCj4gdjI6IGFkZCBwYXJhZ3JhcGggYWJvdXQgYWxp
YXNlcyAoRGFuaWVsKQo+IAo+IHYzOiBmaXggdW5yZWxhdGVkIGNoYW5nZXMgc2VudCB3aXRoIHRo
ZSBwYXRjaAo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5m
cj4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
PiBDYzogRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9yZz4KPiBDYzogQmFzIE5pZXV3
ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+IENjOiBEYXZlIEFpcmxpZSA8YWly
bGllZEBnbWFpbC5jb20+Cj4gQ2M6IE1hcmVrIE9sxaHDoWsgPG1hcmFlb0BnbWFpbC5jb20+Cj4g
LS0tCj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTUgKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNj
LmgKPiBpbmRleCA0OTAxNDM1MDBhNTAuLmY0MWZjYjFlZDYzZCAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2Zv
dXJjYy5oCj4gQEAgLTU4LDYgKzU4LDIxIEBAIGV4dGVybiAiQyIgewo+ICAgKiBtYXkgcHJlc2Vy
dmUgbWVhbmluZyAtIHN1Y2ggYXMgbnVtYmVyIG9mIHBsYW5lcyAtIGZyb20gdGhlIGZvdXJjYyBj
b2RlLAo+ICAgKiB3aGVyZWFzIG90aGVycyBtYXkgbm90Lgo+ICAgKgo+ICsgKiBNb2RpZmllcnMg
bXVzdCB1bmlxdWVseSBlbmNvZGUgYnVmZmVyIGxheW91dC4gSW4gb3RoZXIgd29yZHMsIGEgYnVm
ZmVyIG11c3QKPiArICogbWF0Y2ggb25seSBhIHNpbmdsZSBtb2RpZmllci4gQSBtb2RpZmllciBt
dXN0IG5vdCBiZSBhIHN1YnNldCBvZiBsYXlvdXRzIG9mCj4gKyAqIGFub3RoZXIgbW9kaWZpZXIu
IEZvciBpbnN0YW5jZSwgaXQncyBpbmNvcnJlY3QgdG8gZW5jb2RlIHBpdGNoIGFsaWdubWVudCBp
bgo+ICsgKiBhIG1vZGlmaWVyOiBhIGJ1ZmZlciBtYXkgbWF0Y2ggYSA2NC1waXhlbCBhbGlnbmVk
IG1vZGlmaWVyIGFuZCBhIDMyLXBpeGVsCj4gKyAqIGFsaWduZWQgbW9kaWZpZXIuIFRoYXQgc2Fp
ZCwgbW9kaWZpZXJzIGNhbiBoYXZlIGltcGxpY2l0IG1pbmltYWwKPiArICogcmVxdWlyZW1lbnRz
Lgo+ICsgKgo+ICsgKiBGb3IgbW9kaWZpZXJzIHdoZXJlIHRoZSBjb21iaW5hdGlvbiBvZiBmb3Vy
Y2MgY29kZSBhbmQgbW9kaWZpZXIgY2FuIGFsaWFzLAo+ICsgKiBhIGNhbm9uaWNhbCBwYWlyIG5l
ZWRzIHRvIGJlIGRlZmluZWQgYW5kIHVzZWQgYnkgYWxsIGRyaXZlcnMuIEFuIGV4YW1wbGUKPiAr
ICogaXMgQUZCQywgd2hlcmUgYm90aCBBUkdCIGFuZCBBQkdSIGhhdmUgdGhlIGV4YWN0IHNhbWUg
Y29tcHJlc3NlZCBsYXlvdXQuCgpBcyBJIG1lbnRpb25lZCwgdGhpcyBpc24ndCB0cnVlIGZvciBB
RkJDIChhdCBsZWFzdCwgaXQgc2hvdWxkbid0IGJlKSwKc28gSSBkb24ndCB0aGluayB3ZSBjYW4g
dXNlIHRoYXQgYXMgYW4gZXhhbXBsZS4KCldlIGRlZmluZSBhICJjYW5vbmljYWwiIG9yZGVyaW5n
IGluIEFGQkMgZm9yIGV4YWN0bHkgdGhpcyByZWFzb24gLSB0aGUKb3JkZXJpbmcgY2FuIGRpZmZl
ciBhbmQgbm90IGFsbCBkZWNvZGVycyBzdXBwb3J0IGFsbCBvcmRlcmluZ3MsIHNvIHdlCm5lZWQg
dG8gcGljayBvbmUgZm9yIGJlc3QgY29tcGF0aWJpbGl0eS4KClRoYW5rcywKLUJyaWFuCgo+ICsg
Kgo+ICsgKiBVc2VycyBzZWUgbW9kaWZpZXJzIGFzIG9wYXF1ZSB0b2tlbnMgdGhleSBjYW4gY2hl
Y2sgZm9yIGVxdWFsaXR5IGFuZAo+ICsgKiBpbnRlcnNlY3QuIFVzZXJzIG11c24ndCBuZWVkIHRv
IGtub3cgdG8gcmVhc29uIGFib3V0IHRoZSBtb2RpZmllciB2YWx1ZQo+ICsgKiAoaS5lLiB1c2Vy
cyBhcmUgbm90IGV4cGVjdGVkIHRvIGV4dHJhY3QgaW5mb3JtYXRpb24gb3V0IG9mIHRoZSBtb2Rp
ZmllcikuCj4gKyAqCj4gICAqIFZlbmRvcnMgc2hvdWxkIGRvY3VtZW50IHRoZWlyIG1vZGlmaWVy
IHVzYWdlIGluIGFzIG11Y2ggZGV0YWlsIGFzCj4gICAqIHBvc3NpYmxlLCB0byBlbnN1cmUgbWF4
aW11bSBjb21wYXRpYmlsaXR5IGFjcm9zcyBkZXZpY2VzLCBkcml2ZXJzIGFuZAo+ICAgKiBhcHBs
aWNhdGlvbnMuCj4gLS0gCj4gMi4yNi4yCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
