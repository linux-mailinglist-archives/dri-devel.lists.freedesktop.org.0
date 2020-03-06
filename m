Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E101D17B540
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 05:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA0B6EC62;
	Fri,  6 Mar 2020 04:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150052.outbound.protection.outlook.com [40.107.15.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD5D6EC62
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 04:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdGZK1M043VUAXFwrt7mZbDAURyW59AfhIAZaK830uE=;
 b=p8Wwl+TRJTvcA16geSlBiPW9bhZL+omovKjcft8+gGQsGafS6wBD01sNFRZVoiAYlMDF5b5Zqmgd7N0Nq7VV71jpZnjxJaJeBaDBOPAq/7QrssE0BDl9b3R0X7WDmiQ4w9o0ntWpcP7tU/g+jzQVBkid0aVN7MQK2opdhUs80QY=
Received: from AM6P194CA0015.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::28)
 by VI1PR08MB5536.eurprd08.prod.outlook.com (2603:10a6:803:13b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Fri, 6 Mar
 2020 04:14:20 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::2) by AM6P194CA0015.outlook.office365.com
 (2603:10a6:209:90::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend
 Transport; Fri, 6 Mar 2020 04:14:20 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.11 via Frontend Transport; Fri, 6 Mar 2020 04:14:20 +0000
Received: ("Tessian outbound d1ceabc7047e:v42");
 Fri, 06 Mar 2020 04:14:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9dde48dfb3e92a2
X-CR-MTA-TID: 64aa7808
Received: from 11d069585b45.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18866953-21F0-4712-864C-DD612C9DE2D0.1; 
 Fri, 06 Mar 2020 04:14:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11d069585b45.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Mar 2020 04:14:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Box0GlS9s13Rh/amg1DXMIUpvZmRJKcnWitU1E70QHRkC5scTho7MT4D3+4XeKh8/mYbJAZDCMvnY0wUkeDW+n1RT/TF6Yi0BjRS54ZXo/pDiRTI/EcxyGOwIV5WwSqTr261Fj2zUNBa4nyBR/mwzlvAbWpvVR2PHFYdbPg6D4ayWy6Fs5UQXPfyP3MF7Tu7EPSvq23BVAAo1oncpiWNcWCQns4o1hVYGJ/+pAaKpqr7vtjlUpEmtLqQFrgwssgnxSnsDHC/pbwDl73xl+l/7fLE3gLwStsv6zwAUM+uCbnxouf/mhTTNX/rIwJv/KRsUA7SE2JJlwgv6FxQLeZn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdGZK1M043VUAXFwrt7mZbDAURyW59AfhIAZaK830uE=;
 b=XMY7MnSWaAyBMA9qdYWuvghnnhqn1614VoIudmIORPN8OlQp36gydM46Xx1cZgpqcYvfYH+XHDYW8q/hNyU22iaWGvaNlfFe4FDbmqtmwqVkG0TAkLiGKPiBnQsPXmR+55ZTggcgYoQr3eq+VYvs1RyIQUdxLsVa3roWdyOvnPfyOrcUANTisKOS18VECrTyVaFn6YpIXNu5wAQRKEidnWKdaTLc613vFehVw+iPV7YQ09JEOSs6s3cDUKhTkpFi5dW7FMfd3Y4sxjhsk6rGQHZGVe4JoxCxMQPUUFgsGx5LYZBr9P/81qCBAhrdQqOgAvH2BzLlCDvjc+5eHTszMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdGZK1M043VUAXFwrt7mZbDAURyW59AfhIAZaK830uE=;
 b=p8Wwl+TRJTvcA16geSlBiPW9bhZL+omovKjcft8+gGQsGafS6wBD01sNFRZVoiAYlMDF5b5Zqmgd7N0Nq7VV71jpZnjxJaJeBaDBOPAq/7QrssE0BDl9b3R0X7WDmiQ4w9o0ntWpcP7tU/g+jzQVBkid0aVN7MQK2opdhUs80QY=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4640.eurprd08.prod.outlook.com (10.255.27.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.19; Fri, 6 Mar 2020 04:14:13 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 04:14:13 +0000
Date: Fri, 6 Mar 2020 12:14:07 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] drm: komeda: Make rt_pm_ops dependent on CONFIG_PM
Message-ID: <20200306041407.GA27096@jamwan02-TSP300>
References: <20200304145412.33936-1-vincenzo.frascino@arm.com>
 <20200305184255.GH364558@e110455-lin.cambridge.arm.com>
Content-Disposition: inline
In-Reply-To: <20200305184255.GH364558@e110455-lin.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK0PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:203:b0::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (113.29.88.7) by
 HK0PR03CA0108.apcprd03.prod.outlook.com (2603:1096:203:b0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.11 via Frontend Transport; Fri, 6 Mar 2020 04:14:12 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: baf4eed4-c053-47b6-a4d2-08d7c184d867
X-MS-TrafficTypeDiagnostic: VE1PR08MB4640:|VE1PR08MB4640:|VI1PR08MB5536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB55366458AAB022765CE98F50B3E30@VI1PR08MB5536.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:277;OLM:277;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(136003)(376002)(346002)(396003)(199004)(189003)(66946007)(6666004)(316002)(6636002)(6862004)(4326008)(54906003)(8676002)(66476007)(33656002)(478600001)(66556008)(2906002)(1076003)(33716001)(81156014)(186003)(81166006)(86362001)(956004)(9686003)(52116002)(26005)(6496006)(55236004)(16526019)(6486002)(8936002)(966005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4640;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: vlw2USzsPm7IND3S/XzQ+q3M3r5ayrcw4fj/D+VXVSFH0LXn6jQg1k5r+ysM2HNbuWtklaHy6eebjEZ+Hr1sQESi2WnAKHJryHiOH346oP099RTS63Dot3GLcKimNOMQEUtA9YhD07wYQ1d+p5JgZK3OTTZR/ATKQrt87vyXtDkFMAykCAQ9J3YtPqFE7pjhbe8vvjHK/FAKZhvKwwYbGQDN3brBQ5qW/bfZIN174gvL/o7AMZwl6PpBwyTBDOzzklzEDmEH1kzuZINXygyRG6uXPc9PUGfiX+5L3d0+ySRRPpzL1Vnb5q+Knjd/PNdEtWNHTFN3VUGcuddpczsfN4K4Pn0rioKi6gv4FRNFeEG02gQ/8aX7Lc5TO7MRhL0YEomWgHhJ+qvAqkzcaJY5H+T6ANAP34zEc2UxrZUJDPjQftn6MZZFqceYZ9MaDQUGQsd1/pbBPeEVALNPVQfsy2atJug3muIm8Gec0A6sURk=
X-MS-Exchange-AntiSpam-MessageData: Ko74YP0/H8prN/c2PEKqDP+SRo0SrqLXVQ9uia0A2TsiKAP8JxT8CHPE2Z1JxBWE1BMXOGuNim/7VWHHTy0FnIyJ2EyRkm1Lv5PHdquVQrcQhgMAUOB/GrIyC3DIomDAr+8cZJ+O/KW/uKXa2USiqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4640
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(136003)(346002)(39860400002)(396003)(199004)(189003)(26826003)(956004)(6486002)(186003)(54906003)(81156014)(33716001)(2906002)(81166006)(966005)(9686003)(26005)(6666004)(356004)(4326008)(6862004)(478600001)(336012)(70586007)(316002)(6636002)(5660300002)(16526019)(8936002)(70206006)(6496006)(86362001)(1076003)(33656002)(8676002)(36906005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5536;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e5adc120-25ac-4fdd-b723-08d7c184d405
X-Forefront-PRVS: 0334223192
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nChUQ3X4FE+Bxo8QJHM3s3VxIbIGT36LASRjZBbGUbw1n4Vwk7R6VPIeK2dvUCyyPMg13n0zC70rAdqUerxWmJiPrXJorVcmza1MM1JL7xGMRMOOvTfO6teToErEd7XZ7/cRDS+JRC9770Sc8ZxUe/a5wowUEkAcYcKEDNDom2hJicaGa8MPRPjzM/PS5K2pwdd9gtNkxrcLq4AYPYUAZ3q+WQjKmLHDMtQD7QmwbtBQf63T3y4C1afSEdRG6s+OX6JmrS33sRcaan/gRMETxgWD3efeDyIrNW5O96cHsnuQia/pu7+2jStlhEI6visPTCK6Z6EE8Rqt9Pu0Dtfd6dQsWa2TlUUadN0jEFzv36Z9KMy8USZA2HV2KF/xvbLzyrNKZ27RKP7X2CzZNgkMZDNHDVfnBa63VehOHax+yGS6wrKAjGOGvprk6gw8NANjHq4UXwDneyzCbLCDI1EXhtbjM7ZIAlhyAZxSn6v2J8c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 04:14:20.6138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baf4eed4-c053-47b6-a4d2-08d7c184d867
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5536
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
Cc: nd@arm.com, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vincenzo Frascino <Vincenzo.Frascino@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDI6NDI6NTVBTSArMDgwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gT24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDI6NTQ6MTJQTSArMDAwMCwgVmluY2Vuem8g
RnJhc2Npbm8gd3JvdGU6Cj4gPiBrb21lZGFfcnRfcG1fc3VzcGVuZCgpIGFuZCBrb21lZGFfcnRf
cG1fcmVzdW1lKCkgYXJlIGNvbXBpbGVkIG9ubHkgd2hlbgo+ID4gQ09ORklHX1BNIGlzIGVuYWJs
ZWQuIEhhdmluZyBpdCBkaXNhYmxlZCB0cmlnZ2VycyB0aGUgZm9sbG93aW5nIHdhcm5pbmcKPiA+
IGF0IGNvbXBpbGUgdGltZToKPiA+IAo+ID4gbGludXgvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZHJ2LmM6MTU2OjEyOgo+ID4gd2FybmluZzog4oCYa29tZWRhX3J0
X3BtX3Jlc3VtZeKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCj4g
PiAgc3RhdGljIGludCBrb21lZGFfcnRfcG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+IGxpbnV4L2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jOjE0OToxMjoKPiA+IHdhcm5pbmc6IOKA
mGtvbWVkYV9ydF9wbV9zdXNwZW5k4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1m
dW5jdGlvbl0KPiA+ICBzdGF0aWMgaW50IGtvbWVkYV9ydF9wbV9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiA+IAo+ID4gTWFrZSBrb21lZGFfcnRfcG1fc3VzcGVuZCgpIGFuZCBrb21lZGFf
cnRfcG1fcmVzdW1lKCkgZGVwZW5kZW50IG9uCj4gPiBDT05GSUdfUE0gdG8gYWRkcmVzcyB0aGUg
aXNzdWUuCj4gPiAKPiA+IENjOiAiSmFtZXMgKFFpYW4pIFdhbmciIDxqYW1lcy5xaWFuLndhbmdA
YXJtLmNvbT4KPiA+IENjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiA+IENj
OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gPiBDYzogQnJp
YW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8dmluY2Vuem8uZnJhc2Npbm9A
YXJtLmNvbT4KPgoKSGkgVmluY2Vuem86CgpUaGFua3MgZm9yIHRoZSBwYXRjaC4KCmFuZCBWaW5j
ZW56byAmIExpdml1LCBzb3JyeQoKU2luY2UgdGhlcmUgaXMgYSBwYXRjaCBmb3IgdGhpcyBwcm9i
bGVtIGFscmVhZHk6Cmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNzE3
MjEvCgpBbmQgSSBoYXZlIHB1c2hlZCB0aGF0IG9sZCBmaXggdG8gZHJtLW1pc2MtZml4ZXMganVz
dCBiZWZvcmUgSSBzYXcKdGhpcyBtYWlsLiBzb3JyeS4KCj4gQWNrZWQtYnk6IExpdml1IER1ZGF1
IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLCBJIHdpbGwg
cHVzaCBpdCBpbnRvIGRybS1taXNjLWZpeGVzIHRvbW9ycm93Lgo+IAo+IEJlc3QgcmVnYXJkcywK
PiBMaXZpdQo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZHJ2LmMgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kcnYuYwo+ID4gaW5kZXggZWE1Y2QxZTE3MzA0Li5kZDNhZTNkODg2ODcgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiA+
IEBAIC0xNDYsNiArMTQ2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQga29t
ZWRhX29mX21hdGNoW10gPSB7Cj4gPiAgCj4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwga29t
ZWRhX29mX21hdGNoKTsKPiA+ICAKPiA+ICsjaWZkZWYgQ09ORklHX1BNCj4gPiAgc3RhdGljIGlu
dCBrb21lZGFfcnRfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgewo+ID4gIAlz
dHJ1Y3Qga29tZWRhX2RydiAqbWRydiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4gQEAgLTE1
OSw2ICsxNjAsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV9ydF9wbV9yZXN1bWUoc3RydWN0IGRldmlj
ZSAqZGV2KQo+ID4gIAo+ID4gIAlyZXR1cm4ga29tZWRhX2Rldl9yZXN1bWUobWRydi0+bWRldik7
Cj4gPiAgfQo+ID4gKyNlbmRpZiAvKiBDT05GSUdfUE0gKi8KPiA+ICAKPiA+ICBzdGF0aWMgaW50
IF9fbWF5YmVfdW51c2VkIGtvbWVkYV9wbV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+
ICB7Cj4gPiAtLSAKPiA+IDIuMjUuMQo+ID4gCj4gCj4gLS0gCj4gPT09PT09PT09PT09PT09PT09
PT0KPiB8IEkgd291bGQgbGlrZSB0byB8Cj4gfCBmaXggdGhlIHdvcmxkLCAgfAo+IHwgYnV0IHRo
ZXkncmUgbm90IHwKPiB8IGdpdmluZyBtZSB0aGUgICB8Cj4gIFwgc291cmNlIGNvZGUhICAvCj4g
ICAtLS0tLS0tLS0tLS0tLS0KPiAgICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
