Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAFD5E3A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C916E1D6;
	Mon, 14 Oct 2019 09:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D39F6E1A7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 09:08:34 +0000 (UTC)
Received: from VI1PR08CA0249.eurprd08.prod.outlook.com (2603:10a6:803:dc::22)
 by DBBPR08MB4919.eurprd08.prod.outlook.com (2603:10a6:10:f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Mon, 14 Oct
 2019 09:08:30 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0249.outlook.office365.com
 (2603:10a6:803:dc::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Mon, 14 Oct 2019 09:08:30 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 14 Oct 2019 09:08:29 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Mon, 14 Oct 2019 09:07:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6893c55ad21ed4d0
X-CR-MTA-TID: 64aa7808
Received: from f1d0f99d31f6.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6051C042-7D77-45B3-9722-36AB93295E73.1; 
 Mon, 14 Oct 2019 09:07:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1d0f99d31f6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2019 09:07:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIPfekzQwOqXLDHOKcGbOfxzjMdRtyjsue0rFoRWH5ydnxcZm4aeYgWb8HA5jCz/ttN+nsFVkAeEw2g7KNItFbtUSQ5NT7Ma0iDz+AymTLWXHKe+Hg9CfPVk7tFK/fJtfEI3g56YpZgGu8B1JDu+8TRn9OsJRjlR79dnHebOD/xPoYzrnE7pMdf5TDq3s1JF5XhUS8O3UO0qAMLqTsRJudjYSjrRX6hPQKRVqnYATZH71f/d15tWaF24SeEh1PS893YIdezylxR1s4Q503kknL8nhx4ytlmSbgAwrhUA+F8Emz5Xh/jUd1oPrmH3ChiY1RrRcKIfF8ldbTu/Y7+y2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjdDfb2ZFQ9iD52Ik3iojUa2NvjUXapar9HY1cG5/8M=;
 b=NknVqJaew47OpKod+6emI7lS8rUSSCktqlTFzHWiaW7cQbThJgaj+r9bBFw/xu5vWgtxmzPuVN8IOcmT0BFG7RM9gb9Z6e/wSkDej4fmAHS+wA2T+06YFNCL4dnd7T0hYYMOXQOZxN8miKkn8jVwBE2F9zpaQ12/JzMSbJ9uCZ+YOn5lUUXGkEQL4lCo12yNFWwcq0EcNCxvki2S4UyJu3gBpuHbo476nxJmc+hazV7t28193EkjguIopCqZ9vUzDMGKSKMLX6ed2NSHiSgk+3xm8pTfuwwP2LujBFz930Pe9EmOq9Q/z8IpKJCCQZ/gN5gdhjJuBs2n9BBG67a3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB4914.eurprd08.prod.outlook.com (10.255.99.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 09:07:29 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 09:07:29 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVZOOE06vVhxy1kU6dQZ4T2LR+pw==
Date: Mon, 14 Oct 2019 09:07:29 +0000
Message-ID: <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
In-Reply-To: <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0462.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::18) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 91dc45c8-446a-44ee-df7c-08d75086147b
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB4914:|AM6PR08MB4914:|DBBPR08MB4919:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB49191B0BC8451EE15E240639F0900@DBBPR08MB4919.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01901B3451
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(189003)(199004)(3846002)(6246003)(256004)(4326008)(6436002)(6486002)(229853002)(6116002)(8676002)(4744005)(6306002)(6512007)(9686003)(81156014)(81166006)(8936002)(1076003)(66066001)(476003)(44832011)(486006)(86362001)(66446008)(64756008)(66556008)(66476007)(66946007)(25786009)(478600001)(966005)(14454004)(71200400001)(71190400001)(99286004)(316002)(7416002)(5660300002)(58126008)(6916009)(54906003)(446003)(386003)(102836004)(305945005)(186003)(26005)(7736002)(2906002)(52116002)(76176011)(6506007)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4914;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fe8atxKmxTrtkdKdXSGFMSA08UDia2T9xUjCq3y8Ii4ZO7GAKK0KVXIoFdCSCZ02/EmeLbclx1Nf+raA4LP8s09fLaetnZ3XOnxVGfybi3PChZZOA94kXv9wUtL/O9CwvccdpiWWlP3yZWwOEjhds5KKxlvs1jNDOTKcfwcBEtlmDXiuIrj5FCEToW6oQfTEKVxoeJz27DX9v+kImrTreQULikC4Ek0PjFD5geY+FD8bFh73zU4Qii1Lp/RHBjphRfbncHmo2joqfprb2meLMvZrHDaK1NPhlC+LKTkj0SBafT5Fd6HMBetGfjhAleOgbU7g9g2bb0D8W7bJKklOY9YX25nqrgeusW1fNaSXkHXMx/UTDeUX5Uc8X7x800pCpS7jdY+FRPR72MacoUGo0aoK0q5DVWQJZLq8DVefAkNEzV3DfYu4YbtvzfRadJBQHT6zRocftwQne9vpzDor2w==
Content-ID: <C42850FCE9C80E459D13CAF63C20B26B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4914
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(189003)(199004)(4326008)(6246003)(25786009)(6862004)(107886003)(966005)(14454004)(97756001)(478600001)(26826003)(66066001)(47776003)(99286004)(76176011)(386003)(6506007)(81156014)(8676002)(81166006)(70206006)(70586007)(50466002)(76130400001)(8936002)(8746002)(102836004)(22756006)(7736002)(186003)(486006)(23726003)(356004)(26005)(11346002)(476003)(305945005)(126002)(336012)(63350400001)(446003)(1076003)(4744005)(5660300002)(6486002)(46406003)(86362001)(2906002)(58126008)(54906003)(316002)(3846002)(6116002)(229853002)(36906005)(6306002)(9686003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4919;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 079c6380-2cea-43ac-f456-08d75085f066
NoDisclaimer: True
X-Forefront-PRVS: 01901B3451
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZvRDAZkzFoISHN65fDkikMLqFd4dVP1KbxZ5q3CWgGZ0z+hjyMJ0Sd9xaP1Ki2/Ana2Z8WvTtlr0V5qU8vqsUoKS4y3Jqh/uj7HNDY5NJI2/UvkegPPhQOkzPBCZMi4A6sk9NDf/gdO/c4hEejTFi1BtNJylYbD6llfXtQiqmA927v8LK0/h4+ePRhV1esLchbdZKBSWdRuYIOyie0zAF3yDfaqfyrdGfkyrV5pSfZhYG/59nmf2fdX57jvQazOWlKxej0QD9fmNNukA0S2vUr+uAhdatHpJLfqQy5uv/81KpSa6SUjsrnzy0WSst8yu9Ayi6DPHuLuEq+rPECAI5y8qNVFt3s4OplDmVXe8AOs7KWgwy3F70io0dLK/D1oHsqMSLGDTITzUloqx3d5hnebr5n0L+BKFlJVv92ua184i17bxk0H60Ke6rxeXviS1UXrSicsV4OwZo5TWdDcDXQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 09:08:29.5156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91dc45c8-446a-44ee-df7c-08d75086147b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjdDfb2ZFQ9iD52Ik3iojUa2NvjUXapar9HY1cG5/8M=;
 b=4mJg6S6fwApZQNjvZND1dGyczNYmf0KcvA7QLW0+aSaV/f4Y4ZAcBUoEc1kKxWgMOIL/ILiZZO8cI9xZtYTPQA72doVQy+Cd7rWY2QRoaKO6QHfSg24USXgGaxIqskf/50OP3hUu6pGJM72ZZ5lrbd6JT+m8ZZapw1owBuJuGPE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjdDfb2ZFQ9iD52Ik3iojUa2NvjUXapar9HY1cG5/8M=;
 b=4mJg6S6fwApZQNjvZND1dGyczNYmf0KcvA7QLW0+aSaV/f4Y4ZAcBUoEc1kKxWgMOIL/ILiZZO8cI9xZtYTPQA72doVQy+Cd7rWY2QRoaKO6QHfSg24USXgGaxIqskf/50OP3hUu6pGJM72ZZ5lrbd6JT+m8ZZapw1owBuJuGPE=
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
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV3LAoKT24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDI6Mjc6MTVQTSAtMDQwMCwgQW5k
cmV3IEYuIERhdmlzIHdyb3RlOgo+IFRoZSBDTUEgZHJpdmVyIHRoYXQgcmVnaXN0ZXJzIHRoZXNl
IG5vZGVzIHdpbGwgaGF2ZSB0byBiZSBleHBhbmRlZCB0bwo+IGV4cG9ydCB0aGVtIHVzaW5nIHRo
aXMgZnJhbWV3b3JrIGFzIG5lZWRlZC4gV2UgZG8gc29tZXRoaW5nIHNpbWlsYXIgdG8KPiBleHBv
cnQgU1JBTSBub2RlczoKPiAKPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8zLzIxLzU3NQo+
IAo+IFVubGlrZSB0aGUgc3lzdGVtL2RlZmF1bHQtY21hIGRyaXZlciB3aGljaCBjYW4gYmUgY2Vu
dHJhbGl6ZWQgaW4gdGhlCj4gdHJlZSwgdGhlc2UgZXh0cmEgZXhwb3J0ZXJzIHdpbGwgcHJvYmFi
bHkgbGl2ZSBvdXQgaW4gb3RoZXIgc3Vic3lzdGVtcwo+IGFuZCBzbyBhcmUgYWRkZWQgaW4gbGF0
ZXIgc3RlcHMuCj4gCj4gQW5kcmV3CgpJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHRo
ZSAiY21hX2Zvcl9lYWNoX2FyZWEiIGxvb3AgaW4gcGF0Y2gKNCB3b3VsZCBkbyB0aGF0IChhZGRf
Y21hX2hlYXBzKS4gSXMgaXQgbm90IHRoZSBjYXNlPwoKVGhhbmtzLAotQnJpYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
