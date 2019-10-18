Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB242DC3E4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 13:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1928C6EB1A;
	Fri, 18 Oct 2019 11:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30057.outbound.protection.outlook.com [40.107.3.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ECE6EB1A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:21:47 +0000 (UTC)
Received: from VI1PR0801CA0073.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::17) by AM6PR08MB4472.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 18 Oct
 2019 11:21:42 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VI1PR0801CA0073.outlook.office365.com
 (2603:10a6:800:7d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18 via Frontend
 Transport; Fri, 18 Oct 2019 11:21:42 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 11:21:40 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Fri, 18 Oct 2019 11:21:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7facaeab60f54ac9
X-CR-MTA-TID: 64aa7808
Received: from fdc714573029.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0D0F47C-F187-408E-BA14-B88891B9BAA6.1; 
 Fri, 18 Oct 2019 11:21:27 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fdc714573029.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 18 Oct 2019 11:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7yuF9/Ys5BNF3eEwJVgv8SFbTBYOq6Zq4b2ueAV9EMSkFB7bxt+Ai1mtf3184iWnRNa2O/ZCRIGKEEDEFNf4atqsXD28pp/Au0WuP9HxvEQ7pBm6G0V5qTILthrcOmu1N6o2wv0TJLLfyCHZ6qKe03bGfLnrZLnbCLm4AXLbLLdS3mJ2ST++IXfgGAVd0/5Leu7jgeY6t/XDMoTdPE8Yh7D8Iz7eZ7Ww6L94pfM/Fd7LclPzRAf7LkG6XtaHUpojv44WCdGMzCt5XHXAGyxINOA2jnwfkbWV+5UolwYOjfzBXjpSYo2QU1GZy98Rj9MRHm+vtnJuBN830MaleD5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPLZIxh1tncLt4b/YZOh+TII6ZSm9Q/ESf/wWcPJUGA=;
 b=KT2TiDJ26J4w//WJPSvBhvEPqEoO0hYQ/ChzpxaoX1dUwRJO/B9LQ2iRK0Icu4EYxyLnbvxbr5PEy+tQMjadfAur9SUjMSHKkdkisTBc9QVEWJw3O7sKu8X0d6p3aeCH6ekKltatVNGOAGSIexcIet2efEXWPYPrT3qIr0CPmnetxkthvBjsqr0eXQM/OiR3NqMeP9kVNo3LHtOqwaGz9AWtlcokd6dk6nOzvZk1HLFFnzIQG5Y17CqKgxct62p/Twvg07cJN3/vu3pgqvDo2WgUn19lifQSxgU+Zf6FXrpoYXoZiwAqey/PHZy/uAgtzBK9l01kR/V4n2WEuxvKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3784.eurprd08.prod.outlook.com (20.178.89.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 18 Oct 2019 11:21:26 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 11:21:26 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v12 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
Thread-Topic: [PATCH v12 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
Thread-Index: AQHVhXQyqD9ep8kHGkCj5GCPsl03U6dgQXEA
Date: Fri, 18 Oct 2019 11:21:26 +0000
Message-ID: <20191018112124.grjgqrn3ckuc7n4v@DESKTOP-E1NTVVP.localdomain>
References: <20191018052323.21659-1-john.stultz@linaro.org>
 <20191018052323.21659-5-john.stultz@linaro.org>
In-Reply-To: <20191018052323.21659-5-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0423.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::27) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 91ba1ed6-4bc1-47f0-d8d9-08d753bd5940
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3784:|AM6PR08MB3784:|AM6PR08MB4472:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4472596DA62E99D61FAE273DF06C0@AM6PR08MB4472.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(189003)(199004)(9686003)(14444005)(54906003)(6512007)(5660300002)(256004)(25786009)(58126008)(316002)(86362001)(44832011)(66066001)(476003)(6916009)(305945005)(229853002)(446003)(52116002)(486006)(11346002)(99286004)(7416002)(14454004)(478600001)(6486002)(7736002)(4744005)(66476007)(66556008)(64756008)(26005)(66446008)(66946007)(6246003)(76176011)(6116002)(3846002)(4326008)(1076003)(71190400001)(8936002)(81166006)(81156014)(8676002)(71200400001)(386003)(186003)(6506007)(2906002)(102836004)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3784;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8lhuemaxl5ATSrmo/7W+8i0b5C0t2Szsnbo4pKoyKeTJR6Hr2TUlNgYh9SgRui5BB3R6UcEyRm1Kf8c1r2+nyA55Mr81QRD/ThGspiLTjkJT/2RVMy+Rei99kQus4zt7PfexZog4a8oTxurHPixfH3DgF1FOz1uS9IaNawCHwBIMJl2zub9AAz+l2SkdH3lxRIlpDTvxrXT9dwvAI7Psl2fwkkmayVK44UjF65FgtqqPjz8WqfoWThu87U4R7/fCXnSbMQi/T0Ji5PPecnqws29biEb0nZtjkQPw1tVkbca3cZz+iNoc5iQADDONQfyl1Ov82j2qfsyCZDcUFsdCQsgBkkkJBxlwLT81oAsiEsaNdjZYlLY/5DqCoCTEib3ThqVdpx72kAn6WmnctDuEucRy+JG9zZe3ovD2uFWhdD8=
Content-ID: <0FA79C5A3857CD428812B53E127A0C4A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3784
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(199004)(189003)(316002)(4744005)(6512007)(9686003)(81156014)(8936002)(8676002)(8746002)(6246003)(4326008)(6862004)(66066001)(47776003)(81166006)(356004)(2906002)(26826003)(14454004)(1076003)(478600001)(14444005)(97756001)(25786009)(36906005)(229853002)(7736002)(6486002)(305945005)(3846002)(6116002)(23726003)(5660300002)(476003)(54906003)(102836004)(26005)(446003)(11346002)(63350400001)(76130400001)(336012)(126002)(70586007)(99286004)(86362001)(76176011)(486006)(50466002)(70206006)(22756006)(186003)(46406003)(58126008)(6506007)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4472;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f2f75511-d717-44a6-04a6-08d753bd5073
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLQElPUvx18XnRNTKuTdVSZm43ZxTqYRdZHV8Jq5ZmQKfxReqz8/KCp/tNRvUtPxGiHjfNmJh/GDvqulklKR3d5+weCaX3h7evY6XiPScq3TLv12uaFUUt41slPP56ZK7+aO90VKzoVGtHtljk2v2xir3ywIeFJHzLn8d4P8e3vbtEc724C8rAJpL0tpXA9+0Qmop2BCxnIZo6Bw+htKaD1MvZKta/6ceciqoSIoVPoZSEmrwMC3zlWmWnNG1MSoRHoCVGVGxkTZ+vGX9kwVKzCRhErfyTyCegeiSwRjLINzIhVC4tNd6yLralJYKl58uno8XEdaac1rqy+kOOUBZRDBo516V6lwGvxBY7U0YFTuNjHqIpuefp3j7H/Vrz/GNP+IxXKTFRZHwGQJF2tpeAUQSdogt20VShX/dG780Fk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 11:21:40.7030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ba1ed6-4bc1-47f0-d8d9-08d753bd5940
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4472
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPLZIxh1tncLt4b/YZOh+TII6ZSm9Q/ESf/wWcPJUGA=;
 b=aFjIyDS0MLQvyciYJ+kRe4l3rDt14eDtt9IMXyuCFkki51jYazkPyKqPM5K0WCInNTWzOFwdAgrC4PMfxxGr5qvSnhZvkt/pwgtmGF7S4mBfJRRTjp51KeRMNHMHtEkkAbvRRXMXUY0uEsw0RKTjxbdaXa50GoJKDePRSYVriVw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPLZIxh1tncLt4b/YZOh+TII6ZSm9Q/ESf/wWcPJUGA=;
 b=aFjIyDS0MLQvyciYJ+kRe4l3rDt14eDtt9IMXyuCFkki51jYazkPyKqPM5K0WCInNTWzOFwdAgrC4PMfxxGr5qvSnhZvkt/pwgtmGF7S4mBfJRRTjp51KeRMNHMHtEkkAbvRRXMXUY0uEsw0RKTjxbdaXa50GoJKDePRSYVriVw=
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDU6MjM6MjJBTSArMDAwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gVGhpcyBhZGRzIGEgQ01BIGhlYXAsIHdoaWNoIGFsbG93cyB1c2Vyc3BhY2UgdG8gYWxs
b2NhdGUKPiBhIGRtYS1idWYgb2YgY29udGlndW91cyBtZW1vcnkgb3V0IG9mIGEgQ01BIHJlZ2lv
bi4KPiAKPiBUaGlzIGNvZGUgaXMgYW4gZXZvbHV0aW9uIG9mIHRoZSBBbmRyb2lkIElPTiBpbXBs
ZW1lbnRhdGlvbiwgc28KPiB0aGFua3MgdG8gaXRzIG9yaWdpbmFsIGF1dGhvciBhbmQgbWFpbnRh
aW50ZXJzOgo+ICAgQmVuamFtaW4gR2FpZ25hcmQsIExhdXJhIEFiYm90dCwgYW5kIG90aGVycyEK
PiAKPiBOT1RFOiBUaGlzIHBhdGNoIG9ubHkgYWRkcyB0aGUgZGVmYXVsdCBDTUEgaGVhcC4gV2Ug
d2lsbCBlbmFibGUKPiBzZWxlY3RpdmVseSBhZGRpbmcgb3RoZXIgQ01BIG1lbW9yeSByZWdpb25z
IHRvIHRoZSBkbWFidWYgaGVhcHMKPiBpbnRlcmZhY2Ugd2l0aCBhIGxhdGVyIHBhdGNoICh3aGlj
aCByZXF1aXJlcyBhIGR0IGJpbmRpbmcpCgpUaGF0J2xsIHRlYWNoIG1lIGZvciByZWFkaW5nIG15
IGVtYWlsIGluIEZJRk8gb3JkZXIuCgpUaGlzIGFwcHJvYWNoIG1ha2VzIHNlbnNlIHRvIG1lLgoK
LUJyaWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
