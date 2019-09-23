Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A88BBE51
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 00:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895196E9A6;
	Mon, 23 Sep 2019 22:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50052.outbound.protection.outlook.com [40.107.5.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBC96E9A6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 22:10:04 +0000 (UTC)
Received: from VI1PR0802CA0019.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::29) by AM0PR08MB3779.eurprd08.prod.outlook.com
 (2603:10a6:208:101::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Mon, 23 Sep
 2019 22:09:57 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR0802CA0019.outlook.office365.com
 (2603:10a6:800:aa::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.22 via Frontend
 Transport; Mon, 23 Sep 2019 22:09:57 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 22:09:55 +0000
Received: ("Tessian outbound 55d20e99e8e2:v31");
 Mon, 23 Sep 2019 22:09:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 986c322c4087359b
X-CR-MTA-TID: 64aa7808
Received: from 0f8e15793f5c.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2131CFEF-9C7A-4E04-ACAD-27B878361B4E.1; 
 Mon, 23 Sep 2019 22:09:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f8e15793f5c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 23 Sep 2019 22:09:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moFzZi6DEGuWhiDk8GgugjrnFYLlxqjyFiXJBP/DJRtJ1eu9mBn9yF6ooV64LT4Xj/dPiJqZEMrtFSBGlkJ5ef1gaF0TygR0zKRFRtQPCPvJDlSCiU2jXpkZgux1kw/ooXlzo7q2Wxc69Dgg2KcT6FTFjcfGduggvN/AnsrUxePu7BUJ59Uile9jD0U+j+flkc24PjrWV8/pxYfcjoJE1KeRnCk/JUdF/6u3Re35nfaw6r8mcGZ8RC2HK6h/dZn5QPq5L6CKtEZJSBFKy6tFjtdPQrx9f5ZAze/CF7VZdpDbb2Ly+HkNhsXe8BkiX7SPheMtJTY/ILsOFmg9f8PuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc8Tfh34zAPh9+3AfK/FXg9bVZJdBA3AvUnXSOf12GU=;
 b=Ycgh0T+P4e8GFRezkiZIKbGAnvKAaWyELii+cZSnw3hvcLGSNMh187WzZKCHGagihEvk4zEEKhcCNG1x7PrGtODBtFtfCe2qe0SxA0z+/k+5awVlN9G2DzSJewBapoMDlwvBHBH35kQnXszVEQWBrvVximZmD9romhuEffOGxwkWhxTL5kO4UV081k6F96leYGjlgTZTaE4YMiRm5Pyll5xXqYqpb1/COQY0Uga3ATGOjtCgbv93JCe5QXf+cw5uejct//wof9JCtRdpRJZFSt07tatO8C3YjhMMXNKqwOm7G1jBQf/aMND9WpZIBggHraHRI6i7Xc391puJXEYUMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 22:09:39 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 22:09:39 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 3/5] dma-buf: heaps: Add system heap to dmabuf
 heaps
Thread-Topic: [RESEND][PATCH v8 3/5] dma-buf: heaps: Add system heap to dmabuf
 heaps
Thread-Index: AQHVZOOHJe6ZtAME/0aSh1asthmU3Kc57WGA
Date: Mon, 23 Sep 2019 22:09:39 +0000
Message-ID: <20190923220933.htme33l5naj7r2dy@DESKTOP-E1NTVVP.localdomain>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190906184712.91980-4-john.stultz@linaro.org>
In-Reply-To: <20190906184712.91980-4-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [195.233.151.100]
x-clientproxiedby: DB7PR03CA0054.eurprd03.prod.outlook.com
 (2603:10a6:5:2a::31) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e238e5a5-8442-4298-789c-08d74072c448
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB3829; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB3829:|AM6PR08MB3829:|AM0PR08MB3779:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3779B7F9C942E0BC5DF99CF6F0850@AM0PR08MB3779.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(189003)(199004)(6506007)(26005)(7736002)(81166006)(186003)(52116002)(316002)(99286004)(64756008)(66476007)(66446008)(229853002)(66946007)(4326008)(25786009)(66556008)(446003)(9686003)(386003)(76176011)(6512007)(6246003)(102836004)(7416002)(58126008)(305945005)(476003)(6436002)(11346002)(5660300002)(2906002)(14454004)(71200400001)(71190400001)(54906003)(6486002)(486006)(81156014)(256004)(44832011)(1076003)(6916009)(4744005)(8676002)(6116002)(478600001)(8936002)(66066001)(86362001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3829;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: M7i3YGRSQ365TBmuk/8wzjLkfXTpcMAV4Ap2q6b95T8OAPQMvQEfq+y02eA6gHY26YbrFMLT9b9Y4e3AX4ldUUN7RdZNimiPIazd1nUpItanN5Y5toID/kPIQXrlSG4LXuf2EXFQshjZvnUUW0e5pFO5jtS36CuNsLrkk0GVwzppqgZShlDLjKBTvUdZ5KUOpzQphMzmpoU3gLRC9wgDTqhSgueWG/CDNy5nTKZQxNxT5UczELlPAkhtWfZ5aXdxTnmqPTCPPfgchSI/OQ2q7Bn24cTcna/NYM/RJZjCsVCdWsqFYIR6LMHXXGRoJKkNvu1xcqt/7rhI/6YwJ9ldzHruH0h8n5Ce50TDDDXpDjUoEuK8okUNzDw4+4r6h4U511t6P4hXlYeKWHa8pgzPvGVpP0Ds10QMXfIaBnii0nc=
Content-ID: <D174ADD896DF4142AD1D0767135D08A7@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3829
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(189003)(199004)(99286004)(126002)(6512007)(9686003)(36906005)(70586007)(54906003)(70206006)(305945005)(356004)(446003)(11346002)(8936002)(76130400001)(76176011)(386003)(102836004)(86362001)(498600001)(6506007)(5660300002)(7736002)(1076003)(8676002)(58126008)(25786009)(66066001)(47776003)(26826003)(229853002)(8746002)(6246003)(476003)(63350400001)(6862004)(26005)(186003)(14454004)(336012)(4326008)(50466002)(97756001)(486006)(6116002)(2906002)(46406003)(81156014)(3846002)(81166006)(22756006)(6486002)(23726003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3779;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6d0895c4-4de8-4214-0bcf-08d74072ba47
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3779; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: kGpIW/bxYVcY0tg2pazBq8cAstinHZJeuzvBXtDA5kWVtk8i9Nr/4wnuaG2l5XoHSroaro8cb8/ggZYnZIWQ2miKHcM2wrtjqW4p8aY+ysE3W13Au9avQrhjqouVmdJKdjtNfg90NIVQgQLU5xncAkI9sQug5xnbpjNdkiiW/OEeNL3HcpcC7vMweFFx/rUJ/SCwjibl9lOUPVYERoQFsJvNkh1IEdBXXzbJIzcwnj+u42/xPax38BaiSTCR2PIXtJEj+L2lfjIm02bsmcJWcSxyqviJcdAk86Rz1c7OKUzPALZvoK6rSaWXeBi4r+bBYhuIFZ01nBNjbfxv1d1udeGesxsBEqcIRqIwOqjY3ZhvQUAfBSSvNiXeg6VrIbfvWGqBS9gMKO1PQaov6ptiwhpXQRsdMn4f7pMgD+x8Gns=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 22:09:55.9207 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e238e5a5-8442-4298-789c-08d74072c448
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3779
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc8Tfh34zAPh9+3AfK/FXg9bVZJdBA3AvUnXSOf12GU=;
 b=VqxtY4qXwsDOaAnf00MunlnYis06IjUtlgk+pT9jTSHxm1FE3K7reDi0GaeyawFGdozs1Jlxer0iNSp+3f4FO5TYfS1Uwid5WjpKNS0PYsP+k0ZPxe8mx3sILnaNOOh8kp4nvYieHJs2WQm+KYGBshVreoKRhRgjU83C551u2h0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc8Tfh34zAPh9+3AfK/FXg9bVZJdBA3AvUnXSOf12GU=;
 b=VqxtY4qXwsDOaAnf00MunlnYis06IjUtlgk+pT9jTSHxm1FE3K7reDi0GaeyawFGdozs1Jlxer0iNSp+3f4FO5TYfS1Uwid5WjpKNS0PYsP+k0ZPxe8mx3sILnaNOOh8kp4nvYieHJs2WQm+KYGBshVreoKRhRgjU83C551u2h0=
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
Cc: nd <nd@arm.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDY6NDc6MTBQTSArMDAwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gVGhpcyBwYXRjaCBhZGRzIHN5c3RlbSBoZWFwIHRvIHRoZSBkbWEtYnVmIGhlYXBzIGZy
YW1ld29yay4KPiAKPiBUaGlzIGFsbG93cyBhcHBsaWNhdGlvbnMgdG8gZ2V0IGEgcGFnZS1hbGxv
Y2F0b3IgYmFja2VkIGRtYS1idWYKPiBmb3Igbm9uLWNvbnRpZ3VvdXMgbWVtb3J5Lgo+IAo+IFRo
aXMgY29kZSBpcyBhbiBldm9sdXRpb24gb2YgdGhlIEFuZHJvaWQgSU9OIGltcGxlbWVudGF0aW9u
LCBzbwo+IHRoYW5rcyB0byBpdHMgb3JpZ2luYWwgYXV0aG9ycyBhbmQgbWFpbnRhaW50ZXJzOgo+
ICAgUmViZWNjYSBTY2h1bHR6IFphdmluLCBDb2xpbiBDcm9zcywgTGF1cmEgQWJib3R0LCBhbmQg
b3RoZXJzIQo+IAo+IENjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KPiBDYzog
QmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gQ2M6IFN1
bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IExpYW0gTWFyayA8bG1h
cmtAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IFByYXRpayBQYXRlbCA8cHJhdGlrcEBjb2RlYXVyb3Jh
Lm9yZz4KPiBDYzogQnJpYW4gU3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPgo+IENjOiBW
aW5jZW50IERvbm5lZm9ydCA8VmluY2VudC5Eb25uZWZvcnRAYXJtLmNvbT4KPiBDYzogU3VkaXB0
byBQYXVsIDxTdWRpcHRvLlBhdWxAYXJtLmNvbT4KPiBDYzogQW5kcmV3IEYuIERhdmlzIDxhZmRA
dGkuY29tPgo+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Cj4gQ2M6
IENoZW5ibyBGZW5nIDxmZW5nY0Bnb29nbGUuY29tPgo+IENjOiBBbGlzdGFpciBTdHJhY2hhbiA8
YXN0cmFjaGFuQGdvb2dsZS5jb20+Cj4gQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29n
bGUuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gUmV2aWV3ZWQt
Ynk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgoKTEdUTToK
ClJldmlld2VkLWJ5OiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
