Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAB2EBE5C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 08:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34176F72D;
	Fri,  1 Nov 2019 07:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00076.outbound.protection.outlook.com [40.107.0.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE336F72D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 07:16:23 +0000 (UTC)
Received: from VI1PR0802CA0031.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::17) by AM0PR08MB4180.eurprd08.prod.outlook.com
 (2603:10a6:208:12d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Fri, 1 Nov
 2019 07:16:20 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR0802CA0031.outlook.office365.com
 (2603:10a6:800:a9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.20 via Frontend
 Transport; Fri, 1 Nov 2019 07:16:20 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Fri, 1 Nov 2019 07:16:20 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Fri, 01 Nov 2019 07:16:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83013ce34c001d37
X-CR-MTA-TID: 64aa7808
Received: from 27f1c32a6e83.2 (cr-mta-lb-1.cr-mta-net [104.47.8.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0223B255-40EA-4E6C-B3BB-4879E5D45889.1; 
 Fri, 01 Nov 2019 07:16:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27f1c32a6e83.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 01 Nov 2019 07:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJiC7GuOCePuuYxUz2f2NiAEVsgMQzIk8bslKDjhIxMIOM/vIOQral+BlUUfpGcf/+NJRp9/nejcfmdHQmZUnD9+xUvhyqRm0+he8mKnQXhyNHBziIoFA6QeoFt07u6/28DC/zz1g7mGl7UrttTHbesmQEw3lurnPLfBIIBfzKIftaiXL5Tqa/x6W/8XA1LKBLrBXLeWmPT+bFMtLJz4n07ymHmbDl+juNLfiuhtMRF7bLh0CxEmY+o4XG3PanI0C7iBeVtF0KacRCcvTVQoxf68ZXXZ0QWFuGZt7NtY5SBtT3uAxwsFBFLFwNdCszLVY3f5GuQGD+Kbf+/XQC9GMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Rvl27dxvy+0NvLeGYi6v1yA/Q/mRy106n1p+mKxy/8=;
 b=OsV80p8fkWs6fV2qBuJgf/YrXQ+gfbNb3uy/McwHNUKYmPV7IKlh1AEqABii5gsiWwQBtE4r0EUs4hnflxJGcCMoM02AgpkRMkAOnSLBZZSkxXNmFjgP2MJoR5CWzqJ8kLW+pSnGp0gvHwcN1rfF4aB44MQUvt+rgtEx60YFyMBenoWrxW4lO+mKRHRHiAyjBiTTOMrWhm2kQLzpAd7dPkzGGAeLS6b2XyHmpRPAwSNF/HlKvHzl1CjHKi127jBggkQaCaQjSgeWtGCcyS7Ns6Z14zFnuO8S6vTtuhSWvWjlTDLasuXC5MYnSBPVsS15d6F5SrgDlcxN13WVbTkoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4974.eurprd08.prod.outlook.com (10.255.158.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 07:16:13 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2387.030; Fri, 1 Nov 2019
 07:16:13 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [2/5] drm/komeda: Remove CONFIG_KOMEDA_ERROR_PRINT
Thread-Topic: [2/5] drm/komeda: Remove CONFIG_KOMEDA_ERROR_PRINT
Thread-Index: AQHVkIQ++XeFcORrh0SX7O3y9pqBSA==
Date: Fri, 1 Nov 2019 07:16:12 +0000
Message-ID: <20191101071605.GA30091@jamwan02-TSP300>
References: <20191021164654.9642-3-mihail.atanassov@arm.com>
In-Reply-To: <20191021164654.9642-3-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ccf0389-81e7-4c31-c284-08d75e9b6508
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:|VE1PR08MB4974:|AM0PR08MB4180:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4180B084079830E8F780AE39B3620@AM0PR08MB4180.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1332;OLM:1332;
x-forefront-prvs: 020877E0CB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(199004)(189003)(25786009)(8936002)(6486002)(6246003)(81166006)(229853002)(14444005)(7736002)(71190400001)(476003)(478600001)(5660300002)(486006)(256004)(8676002)(2906002)(3846002)(71200400001)(305945005)(81156014)(6116002)(64756008)(55236004)(66446008)(102836004)(66066001)(66556008)(86362001)(6506007)(4326008)(186003)(6512007)(66476007)(6436002)(316002)(386003)(6862004)(76176011)(99286004)(26005)(54906003)(14454004)(52116002)(33716001)(9686003)(446003)(11346002)(1076003)(58126008)(6636002)(33656002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4974;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bSB5D2qXRDHJj4Kyt4Sni2GxGhGklJv5BkeS8455aPOg9WPOKg+Nq3QBDeg73XhUSbgRK+M4IxZNFOMDV4yYvAPEJ1t2b8yuKFqDZJE/CaFkfmTnZzLGJfMiEq9G38QL39nq8HOu8ec5vLkIWh5C2dcRJ80Ywc/7GVn1k+utwZx8TBgR/grzaoBBmg+KK7NZXbCEgeID9wC+h9EotBIV5MZX/f/b+Yuieg+iVjNruTVq1IWo/n61Jwjt1AAvHOEYDh4TNPvoygMeb7s/tv/RqlPRbtIFM9GL167cGawWyvmHtFSN8EgA7qsA8iEo76AlNFkgvFFLbSKKB0zbDKfmLiYNUAWyYbw6PajZbBmmJkkWIrNfDJAnkDqJ39Ny6fsetElIOD/sFTE91O26aaaPmqsoCIo7S0daHhQjmS0SjK+h7rOK2/n9kDOj1VvV1tEu
Content-ID: <6AF7F94864C66940BDE85813FB86B2FE@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4974
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(376002)(136003)(346002)(39860400002)(1110001)(339900001)(199004)(189003)(316002)(5660300002)(486006)(186003)(86362001)(47776003)(229853002)(99286004)(107886003)(81166006)(446003)(1076003)(76130400001)(478600001)(8936002)(6862004)(33656002)(4326008)(81156014)(8676002)(336012)(33716001)(6246003)(8746002)(66066001)(22756006)(9686003)(6512007)(476003)(6636002)(126002)(305945005)(105606002)(2906002)(25786009)(7736002)(70206006)(14444005)(6486002)(6116002)(97756001)(11346002)(76176011)(14454004)(46406003)(386003)(26826003)(70586007)(50466002)(356004)(102836004)(6506007)(54906003)(26005)(3846002)(23726003)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4180;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7099d37a-0e75-4296-6899-08d75e9b6079
NoDisclaimer: True
X-Forefront-PRVS: 020877E0CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CVC0zIZmjVniG06VFOQe8TttcgGP9BZOibt1HgIhsfss7U0a4fwkWYslQxuehisstYzAyf4+5vTVIsLLlifF2J0HGDsDk0BKhzjZmKD7vI/NpIpaqKa0+z4tffudaGq5/Gh29GiCqRKULy8JZQSiiolDqNgThD4pN7zurhDPxY13hYIF5u9qZEwQP6RIuUnejQpiI/G5LM3zUbKtH6YnwFGxklw7nNZ9xV/OfsAn3L2yPSfRdOycn/CB94Mjo7PxjNhCqfIMHrF0zkU3iJJDT9mtmxzpwX+pMBjonKR8AQOF8F3NpLPOkdjT1IssCkFz/g6QO8UKko1WmGSvJoUynwKkSXJLr3H7oaz+7OirIuK5dbehgR16wLIXXnYEoPzL2hi4D26h0mEJRbxwUH0hgcIrWvG82tCM9rHWAEDpMw4Nlb6X3CiZ8E9MgH8e1Ji6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2019 07:16:20.3718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccf0389-81e7-4c31-c284-08d75e9b6508
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Rvl27dxvy+0NvLeGYi6v1yA/Q/mRy106n1p+mKxy/8=;
 b=Xb/EI9q4LOuRazAARseG0zsTW9OwnQZ28HOs6kCpQDDbabzUZQf2bGps7MvkmmXTaAjDh509bWx7HkMWejYWyGO5Dw8IU9FN0cdLS9X8QAxgnZLfy4srU1VgazVsxRHoxAHNKId8e/yK/uraRofJWkaULeIJPrWCr4sf1w7Yhf8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Rvl27dxvy+0NvLeGYi6v1yA/Q/mRy106n1p+mKxy/8=;
 b=Xb/EI9q4LOuRazAARseG0zsTW9OwnQZ28HOs6kCpQDDbabzUZQf2bGps7MvkmmXTaAjDh509bWx7HkMWejYWyGO5Dw8IU9FN0cdLS9X8QAxgnZLfy4srU1VgazVsxRHoxAHNKId8e/yK/uraRofJWkaULeIJPrWCr4sf1w7Yhf8=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
Cc: "Lowry Li \(Arm
 Technology China\)" <Lowry.Li@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6NDc6MTlQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBOb3cgdGhhdCB0aGVyZSdzIGEgZGVidWdmcyBub2RlIHRvIGNvbnRyb2wgdGhl
IHNhbWUsIHJlbW92ZSB0aGUKPiBjb25maWcgb3B0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1p
aGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcgICAgICAgICAgICAgfCA2IC0tLS0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlICAgICB8IDUgKystLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggfCA2IC0t
LS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9LY29uZmlnIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcKPiBpbmRleCBlODdmZjg2MjMwNzYu
LmNlYzA2MzllM2FhMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
S2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9LY29uZmlnCj4gQEAg
LTEyLDkgKzEyLDMgQEAgY29uZmlnIERSTV9LT01FREEKPiAgCSAgUHJvY2Vzc29yIGRyaXZlci4g
SXQgc3VwcG9ydHMgdGhlIEQ3MSB2YXJpYW50cyBvZiB0aGUgaGFyZHdhcmUuCj4gIAo+ICAJICBJ
ZiBjb21waWxlZCBhcyBhIG1vZHVsZSBpdCB3aWxsIGJlIGNhbGxlZCBrb21lZGEuCj4gLQo+IC1j
b25maWcgRFJNX0tPTUVEQV9FUlJPUl9QUklOVAo+IC0JYm9vbCAiRW5hYmxlIGtvbWVkYSBlcnJv
ciBwcmludCIKPiAtCWRlcGVuZHMgb24gRFJNX0tPTUVEQQo+IC0JaGVscAo+IC0JICBDaG9vc2Ug
dGhpcyBvcHRpb24gdG8gZW5hYmxlIGVycm9yIHByaW50aW5nLgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQo+IGluZGV4IGYwOTVhMWM2OGFjNy4uMTkzMWE3
ZmExYTE0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
TWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2Vm
aWxlCj4gQEAgLTE2LDEyICsxNiwxMSBAQCBrb21lZGEteSA6PSBcCj4gIAlrb21lZGFfY3J0Yy5v
IFwKPiAgCWtvbWVkYV9wbGFuZS5vIFwKPiAgCWtvbWVkYV93Yl9jb25uZWN0b3IubyBcCj4gLQlr
b21lZGFfcHJpdmF0ZV9vYmoubwo+ICsJa29tZWRhX3ByaXZhdGVfb2JqLm8gXAo+ICsJa29tZWRh
X2V2ZW50Lm8KPiAgCj4gIGtvbWVkYS15ICs9IFwKPiAgCWQ3MS9kNzFfZGV2Lm8gXAo+ICAJZDcx
L2Q3MV9jb21wb25lbnQubwo+ICAKPiAta29tZWRhLSQoQ09ORklHX0RSTV9LT01FREFfRVJST1Jf
UFJJTlQpICs9IGtvbWVkYV9ldmVudC5vCj4gLQo+ICBvYmotJChDT05GSUdfRFJNX0tPTUVEQSkg
Kz0ga29tZWRhLm8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuaAo+IGluZGV4IGI1YmQzZDU4OThlZS4uODMxYzM3NTE4MGY4IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiBAQCAt
MjI2LDEzICsyMjYsNyBAQCB2b2lkIGtvbWVkYV9kZXZfZGVzdHJveShzdHJ1Y3Qga29tZWRhX2Rl
diAqbWRldik7Cj4gIAo+ICBzdHJ1Y3Qga29tZWRhX2RldiAqZGV2X3RvX21kZXYoc3RydWN0IGRl
dmljZSAqZGV2KTsKPiAgCj4gLSNpZmRlZiBDT05GSUdfRFJNX0tPTUVEQV9FUlJPUl9QUklOVAo+
ICB2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMsIHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpOwo+IC0jZWxzZQo+IC1zdGF0aWMgaW5saW5lIHZvaWQga29t
ZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cywKPiAtCQkJCSAgICAg
ICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+IC17fQo+IC0jZW5kaWYKPgoKUmV2aWV3ZWQtYnk6
IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdA
YXJtLmNvbT4KPiAgaW50IGtvbWVkYV9kZXZfcmVzdW1lKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2
KTsKPiAgaW50IGtvbWVkYV9kZXZfc3VzcGVuZChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldik7Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
