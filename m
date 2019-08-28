Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BE8A0899
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 19:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1299D89DD8;
	Wed, 28 Aug 2019 17:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20082.outbound.protection.outlook.com [40.107.2.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3709989DA2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 17:35:23 +0000 (UTC)
Received: from VI1PR0802CA0006.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::16) by AM6PR08MB4950.eurprd08.prod.outlook.com
 (2603:10a6:20b:ea::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Wed, 28 Aug
 2019 17:35:18 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by VI1PR0802CA0006.outlook.office365.com
 (2603:10a6:800:aa::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 17:35:18 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 17:35:17 +0000
Received: ("Tessian outbound d33df262a6a7:v27");
 Wed, 28 Aug 2019 17:35:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff02e6fc9ca3fa80
X-CR-MTA-TID: 64aa7808
Received: from 556320bb45eb.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D76D364-2A04-4506-9C16-3753AA8D3AFE.1; 
 Wed, 28 Aug 2019 17:35:08 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 556320bb45eb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2019 17:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njW2fldL+V7Yt71ZfbsEec1T0BiQsIdRWLp3UyHU91HRrkzJE4EBiFgevdB+fJsuQpuCbnzhBHTe/oiVmQb+2vY2ditCzf4jYMjTbOZJ1F4R87yNc3iDdPdrwPLoMFY8N44L1HuCqig7iHUX+qUnOYplSx/jkL8sDjOytYQjjWsVQZnD1tbw+94NlRnZX3fVfyGgfIfNiguRZlXdB0Rqqy8Udj3ygXci2uK7+9MP2wRh1UiIVGSwninpGzL+vPQkezWyzCzI9jfKrZrQkhmVVxhQfhTwHLnj6GC86V1nIZAijys7RLkxjzTt57iflEkksqB40u896r5dB2WGZjyoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qdkevifMfV+b5NbBlWel2GHSpSNDJM3viovPfVmkuc=;
 b=h9hIQQkiYoultgePxvD6hi3QiW4MRnFLKCt5mjvUy1tT3rk79AH5/aAK/TQSXFT0H4aoG72xIn3fbjeLh+WTCLMrVudQq5i0TJoEag36FE08+Tn68a+RlmLRQCBx+T7AQdfY9Z/j+ZDG1x6bFxYCiWuF4rdarMQKBd2w7r5wWDCtu3iyUpq5oLBUnxnpd9TZTJeizi3jEnb+7JDxT4U1Lf4pHctUdtFIhgPAPZHZ1yVGX167V1rvsQQF7MbekQJ/kAkMqRgwoaKUS0HtdewyHqvIMXnEwKw2oxME/ebbwwip6qnjLQzrZZa3i7VPeY+GaZFFofUMi+FP91b4NMMqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.212.135) by
 AM0PR08MB5044.eurprd08.prod.outlook.com (20.179.39.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Wed, 28 Aug 2019 17:35:05 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::1de:178b:2ca:42e5]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::1de:178b:2ca:42e5%2]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 17:35:05 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2] drm/komeda: Reordered the komeda's de-init functions
Thread-Topic: [PATCH v2] drm/komeda: Reordered the komeda's de-init functions
Thread-Index: AQHVXbFOPtkOyMBO7Em37TZu77ub2acQt18AgAAbGAA=
Date: Wed, 28 Aug 2019 17:35:04 +0000
Message-ID: <20190828173504.GA21758@arm.com>
References: <20190828145945.15904-1-ayan.halder@arm.com>
 <20190828155806.GA7020@jamwan02-TSP300>
In-Reply-To: <20190828155806.GA7020@jamwan02-TSP300>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::29) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::7)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3a3a9c27-e144-4dd0-fe26-08d72bde177b
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB5044; 
X-MS-TrafficTypeDiagnostic: AM0PR08MB5044:|AM6PR08MB4950:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49500F82BA54C0BA60985FD7E4A30@AM6PR08MB4950.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:480;OLM:480;
x-forefront-prvs: 014304E855
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(199004)(189003)(478600001)(2906002)(4326008)(1076003)(8936002)(14444005)(186003)(256004)(102836004)(6486002)(476003)(6512007)(44832011)(66066001)(76176011)(5024004)(305945005)(446003)(6246003)(37006003)(8676002)(66556008)(26005)(66446008)(6116002)(64756008)(66476007)(6436002)(66946007)(316002)(14454004)(71200400001)(25786009)(52116002)(54906003)(7736002)(81156014)(33656002)(81166006)(71190400001)(86362001)(486006)(6862004)(3846002)(6506007)(5660300002)(2616005)(99286004)(11346002)(6636002)(229853002)(386003)(53936002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5044;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: x2Rip5b0M2bNurK6+zyh9o5kUlrC6B0HyNE+5n1jdXZ0d1lOmWGlw1atYs1ncrImYf2hQzK72uFbt22Ji8HMRUq6zEF6PhuKjK7HCwmWpJDQmNk1dk5QLN8JbDx4fzqBR74XrxwNx4GB1zaAYopnvdNc4dcCUk/B9nOTfrbu5KJ7hF4dD0jUcUJWcpQsakImmDBbZeeYvZHge0Jsjf0u/xQsj8EGWw6ivy/aN4jIQ8om7eIgILyDuZSb3D10cbQfJIVDOyFm0mR8LNB3Ry8Jnua2CWkYhrVBXdHZXX/uhPmmMy7mi3gTlT+xGo1gxZaws0tdkfQfeKGq069wwYWhCelZwQ21JmNa27yIDXUImwKi+5pRUr0po/ysPWq8hxWyRr3p+5uU1EPvlRhWb8NAmJ3NbdmTKrvzGVx0d53tQKE=
Content-ID: <96B089E83AC54C42A5115C3580979B48@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5044
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(199004)(189003)(33656002)(26826003)(356004)(6486002)(336012)(70206006)(14454004)(6246003)(8746002)(316002)(8676002)(46406003)(3846002)(97756001)(4326008)(86362001)(6636002)(2906002)(186003)(70586007)(6116002)(25786009)(1076003)(5660300002)(23726003)(229853002)(54906003)(8936002)(66066001)(63350400001)(76130400001)(446003)(6506007)(126002)(386003)(50466002)(2616005)(47776003)(14444005)(63370400001)(476003)(76176011)(5024004)(99286004)(486006)(102836004)(37006003)(26005)(22756006)(7736002)(81166006)(6512007)(11346002)(81156014)(305945005)(478600001)(6862004)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4950;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4949fa36-80ca-49cc-bbcc-08d72bde0ffc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB4950; 
NoDisclaimer: True
X-Forefront-PRVS: 014304E855
X-Microsoft-Antispam-Message-Info: pWhCcgSQb7U6RP/Kssatw+rNC3HH4IdHeHA5HnOZufiXXEWx1MoyazGQa6zV3Ws3rQjTR0Nehseo7Y2OosL+dMIslFRiKG+RdaIHqecRwOZsIA5d+OjmS17zgL5fZK9bdP1q5xyFw9/flPyGvV6tZm7FjgNUTH+72GugUqbnvdk1qVrf+dJotq8xsg9jnk0/W1uh0R/QXHdWlxaoDVgrYxabDhJRENwzvX/O4mcXVtMTockwhnA3W458owuxytN4HiOFE0Dvu+7iyzUBmhQOzHOrL+dJM4GFccLkDZTlIJbN7ZpPsYnXo3fL6TMB3TZPrWZa28iLMJg35NOjtS+m4k0OVSs8n9D+pgWxsCMB7Fng79OByCzgT2KZ6nL13CEKUQnwX9vfy2ke2dcOS117QbxFnAZaChd+kFgqD/umAfU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 17:35:17.2380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3a9c27-e144-4dd0-fe26-08d72bde177b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qdkevifMfV+b5NbBlWel2GHSpSNDJM3viovPfVmkuc=;
 b=Z38YO9SOdq0gyyQMDLhOMGNNU8Ua27CRzzw7URRQdArzbmtX15yFLpTcTGKLQj0suRj5YBPLtWPDGr37bV4A3ll5gly9O9ZqxGpc0QLkY8u6myOwohg/GRKte9rU83zwafLJQQTM1wWBs6NvGs1wc6LWHXM+Brllw8nP//csJgM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qdkevifMfV+b5NbBlWel2GHSpSNDJM3viovPfVmkuc=;
 b=Z38YO9SOdq0gyyQMDLhOMGNNU8Ua27CRzzw7URRQdArzbmtX15yFLpTcTGKLQj0suRj5YBPLtWPDGr37bV4A3ll5gly9O9ZqxGpc0QLkY8u6myOwohg/GRKte9rU83zwafLJQQTM1wWBs6NvGs1wc6LWHXM+Brllw8nP//csJgM=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDM6NTg6MTJQTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQg
MDM6MDA6MTlQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3JvdGU6Cj4gPiBGcm9tOiBBeWFuIEhhbGRl
ciA8QXlhbi5IYWxkZXJAYXJtLmNvbT4KPiA+IAo+ID4gVGhlIGRlLWluaXQgcm91dGluZSBzaG91
bGQgYmUgZG9pbmcgdGhlIGZvbGxvd2luZyBpbiBvcmRlcjotCj4gPiAxLiBVbnJlZ2lzdGVyIHRo
ZSBkcm0gZGV2aWNlCj4gPiAyLiBTaHV0IGRvd24gdGhlIGNydGNzIC0gZmFpbGluZyB0byBkbyB0
aGlzIG1pZ2h0IGNhdXNlIGEgY29ubmVjdG9yIGxlYWthZ2UKPiA+IFNlZSB0aGUgJ2NvbW1pdCAx
MDljNGQxOGU1NzQgKCJkcm0vYXJtL21hbGlkcDogRW5zdXJlIHRoYXQgdGhlIGNydGNzIGFyZQo+
ID4gc2h1dGRvd24gYmVmb3JlIHJlbW92aW5nIGFueSBlbmNvZGVyL2Nvbm5lY3RvciIpJwo+ID4g
My4gRGlzYWJsZSB0aGUgaW50ZXJydXB0cwo+ID4gNC4gVW5iaW5kIHRoZSBjb21wb25lbnRzCj4g
PiA1LiBGcmVlIHVwIERSTSBtb2RlX2NvbmZpZyBpbmZvCj4gPiAKPiA+IENoYW5nZXMgZnJvbSB2
MTotCj4gPiAxLiBSZS1vcmRlcmVkIHRoZSBoZWFkZXIgZmlsZXMgaW5jbHVzaW9uCj4gPiAyLiBS
ZWJhc2VkIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IGRybS1taXNjLWZpeGVzCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmhhbGRlckBhcm0uY29tPgo+ID4gUmV2
aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAK
PiBMb29rcyBnb29kIHRvIG1lLgo+IAo+IFJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4KUHVzaGVkIHRv
IGRybS1taXNjLWZpeGVzIC0gNjk3OGJjZTA1NDI0N2U0Y2ZjY2RmNjg5Y2UyNjNlMDc2NDk5Zjkw
NQogCj4gPiAtLS0KPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5jICAgfCAyMyArKysrKysrKysrKystLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiBpbmRleCAxZjBlM2Y0ZThkNzQu
LjY5ZDllMjZjNjBjOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9rbXMuYwo+ID4gQEAgLTE0LDggKzE0LDggQEAKPiA+ICAjaW5jbHVk
ZSA8ZHJtL2RybV9nZW1fY21hX2hlbHBlci5oPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9m
cmFtZWJ1ZmZlcl9oZWxwZXIuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4KPiA+IC0j
aW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9o
ZWxwZXIuaD4KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KPiA+ICAKPiA+ICAjaW5j
bHVkZSAia29tZWRhX2Rldi5oIgo+ID4gICNpbmNsdWRlICJrb21lZGFfZnJhbWVidWZmZXIuaCIK
PiA+IEBAIC0zMDYsMTEgKzMwNiwxMSBAQCBzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmtvbWVkYV9r
bXNfYXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ID4gIAkJCSAgICAgICBrb21lZGFf
a21zX2lycV9oYW5kbGVyLCBJUlFGX1NIQVJFRCwKPiA+ICAJCQkgICAgICAgZHJtLT5kcml2ZXIt
Pm5hbWUsIGRybSk7Cj4gPiAgCWlmIChlcnIpCj4gPiAtCQlnb3RvIGNsZWFudXBfbW9kZV9jb25m
aWc7Cj4gPiArCQlnb3RvIGZyZWVfY29tcG9uZW50X2JpbmRpbmc7Cj4gPiAgCj4gPiAgCWVyciA9
IG1kZXYtPmZ1bmNzLT5lbmFibGVfaXJxKG1kZXYpOwo+ID4gIAlpZiAoZXJyKQo+ID4gLQkJZ290
byBjbGVhbnVwX21vZGVfY29uZmlnOwo+ID4gKwkJZ290byBmcmVlX2NvbXBvbmVudF9iaW5kaW5n
Owo+ID4gIAo+ID4gIAlkcm0tPmlycV9lbmFibGVkID0gdHJ1ZTsKPiA+ICAKPiA+IEBAIC0zMTgs
MTUgKzMxOCwyMSBAQCBzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmtvbWVkYV9rbXNfYXR0YWNoKHN0
cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ID4gIAo+ID4gIAllcnIgPSBkcm1fZGV2X3JlZ2lzdGVy
KGRybSwgMCk7Cj4gPiAgCWlmIChlcnIpCj4gPiAtCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7
Cj4gPiArCQlnb3RvIGZyZWVfaW50ZXJydXB0czsKPiA+ICAKPiA+ICAJcmV0dXJuIGttczsKPiA+
ICAKPiA+IC1jbGVhbnVwX21vZGVfY29uZmlnOgo+ID4gK2ZyZWVfaW50ZXJydXB0czoKPiA+ICAJ
ZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRybSk7Cj4gPiAgCWRybS0+aXJxX2VuYWJsZWQgPSBm
YWxzZTsKPiA+ICsJbWRldi0+ZnVuY3MtPmRpc2FibGVfaXJxKG1kZXYpOwo+ID4gK2ZyZWVfY29t
cG9uZW50X2JpbmRpbmc6Cj4gPiArCWNvbXBvbmVudF91bmJpbmRfYWxsKG1kZXYtPmRldiwgZHJt
KTsKPiA+ICtjbGVhbnVwX21vZGVfY29uZmlnOgo+ID4gIAlkcm1fbW9kZV9jb25maWdfY2xlYW51
cChkcm0pOwo+ID4gIAlrb21lZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7Cj4gPiAr
CWRybS0+ZGV2X3ByaXZhdGUgPSBOVUxMOwo+ID4gKwlkcm1fZGV2X3B1dChkcm0pOwo+ID4gIGZy
ZWVfa21zOgo+ID4gIAlrZnJlZShrbXMpOwo+ID4gIAlyZXR1cm4gRVJSX1BUUihlcnIpOwo+ID4g
QEAgLTMzNywxMyArMzQzLDE0IEBAIHZvaWQga29tZWRhX2ttc19kZXRhY2goc3RydWN0IGtvbWVk
YV9rbXNfZGV2ICprbXMpCj4gPiAgCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSAma21zLT5iYXNl
Owo+ID4gIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGRybS0+ZGV2X3ByaXZhdGU7Cj4gPiAg
Cj4gPiAtCWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKPiA+IC0JbWRldi0+ZnVuY3MtPmRpc2Fi
bGVfaXJxKG1kZXYpOwo+ID4gIAlkcm1fZGV2X3VucmVnaXN0ZXIoZHJtKTsKPiA+ICAJZHJtX2tt
c19oZWxwZXJfcG9sbF9maW5pKGRybSk7Cj4gPiArCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3du
KGRybSk7Cj4gPiArCWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKPiA+ICsJbWRldi0+ZnVuY3Mt
PmRpc2FibGVfaXJxKG1kZXYpOwo+ID4gIAljb21wb25lbnRfdW5iaW5kX2FsbChtZGV2LT5kZXYs
IGRybSk7Cj4gPiAtCWtvbWVkYV9rbXNfY2xlYW51cF9wcml2YXRlX29ianMoa21zKTsKPiA+ICAJ
ZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKPiA+ICsJa29tZWRhX2ttc19jbGVhbnVwX3By
aXZhdGVfb2JqcyhrbXMpOwo+ID4gIAlkcm0tPmRldl9wcml2YXRlID0gTlVMTDsKPiA+ICAJZHJt
X2Rldl9wdXQoZHJtKTsKPiA+ICB9Cj4gPiAtLSAKPiA+IDIuMjEuMApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
