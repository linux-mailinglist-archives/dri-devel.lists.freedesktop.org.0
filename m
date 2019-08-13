Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0646A8B466
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367A46E0D6;
	Tue, 13 Aug 2019 09:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3357A6E094;
 Tue, 13 Aug 2019 09:41:56 +0000 (UTC)
Received: from HE1PR08CA0073.eurprd08.prod.outlook.com (2603:10a6:7:2a::44) by
 DB6PR0801MB1847.eurprd08.prod.outlook.com (2603:10a6:4:3c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Tue, 13 Aug 2019 09:41:52 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by HE1PR08CA0073.outlook.office365.com
 (2603:10a6:7:2a::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Tue, 13 Aug 2019 09:41:51 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 13 Aug 2019 09:41:49 +0000
Received: ("Tessian outbound 40a263b748b4:v26");
 Tue, 13 Aug 2019 09:41:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd2db3c5eba21ce8
X-CR-MTA-TID: 64aa7808
Received: from db7b77fb75dc.1 (cr-mta-lb-1.cr-mta-net [104.47.5.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4580C59-62BD-492F-9592-7236E6AC32C1.1; 
 Tue, 13 Aug 2019 09:41:44 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db7b77fb75dc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Aug 2019 09:41:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjBsGI8BMSdgZi909YkfWuJxLNTqNNYychu2EwDkvqLbEJscLBe2Fgoet3XWcZqRwn2HqbdWvukgniop8zUwzqPUEMp6z/uXA+hlpxfNA0e2FEXkudjialHGObAyv5TrfPMA9oK2/sECMNPOW1m9hTpl5FSl8rqSmf2XOYnK7+gsNL0r9ei4cevaEXzwN5KPB7jT8HbTwb9m0Sh1Qwl4VUmpsDiIraPfv9JHBM3i2SGR8Ejjiaeuz9nwnIk+xEw7/8qQV4m+AsqxFmsQxK9RNx6kF8iji/1Y+weUbxjDZg6v8piya5lBMWcl0+E52uFA5nJrEZMc8aGrSSgh7Z1jLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzaHccnJbSdH9rd2auSZTcwmPU6dnHbcr8K+4xH2GNE=;
 b=oMHRL89M4q2x9Ucj5DJIWwvux9PBqm6eWSTIPHFcMGoDwEtzAzTcyeWwDlO3P24mmV6t8/0NzYV277FOXHBUtpz7lir9spmHO0h8kI1yOc0B2pKPw06+tg0lEFoVj2LDrE/nP0wCIcN2tmtGef48LkoMyCN7ZkkUquBjWGDa2iOQ1xWYvQiJhh0NSSQUw+N4Ly9EkYrotL2zpvlFBY8yic0ObSWRwpgAU1KbIrdid9bvA+QFJBWNm0qMXz1vQ2hQuA9udnXAC2LAruJfdpwxqOSps9u2l0tzOA9PhV2STgX529hqXskmALPNcvuohio2WFxc+veJYe5SUvL2RtyAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4959.eurprd08.prod.outlook.com (10.255.158.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Tue, 13 Aug 2019 09:41:42 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 09:41:42 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v7,01/16] drm: Add Enhanced Gamma LUT precision structure
Thread-Topic: [v7,01/16] drm: Add Enhanced Gamma LUT precision structure
Thread-Index: AQHVUbtPRTG3vyo2gEmytrY5agQf4g==
Date: Tue, 13 Aug 2019 09:41:41 +0000
Message-ID: <20190813094134.GA26945@jamwan02-TSP300>
References: <1553804174-2651-2-git-send-email-uma.shankar@intel.com>
In-Reply-To: <1553804174-2651-2-git-send-email-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::36) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 54f2a257-e23d-4ca6-9613-08d71fd27732
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4959; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4959:|DB6PR0801MB1847:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1847D827F9D0EDAAE3954A0CB3D20@DB6PR0801MB1847.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 01283822F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(189003)(199004)(3846002)(14454004)(478600001)(66946007)(66556008)(33656002)(66476007)(64756008)(66446008)(1076003)(33716001)(5660300002)(316002)(58126008)(6116002)(8676002)(54906003)(186003)(81156014)(229853002)(52116002)(102836004)(7736002)(386003)(6506007)(8936002)(55236004)(305945005)(6916009)(476003)(26005)(76176011)(99286004)(81166006)(66066001)(53936002)(25786009)(4326008)(71200400001)(71190400001)(256004)(86362001)(6246003)(2906002)(6436002)(11346002)(6486002)(9686003)(446003)(6512007)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4959;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: lh1VizYuCVza6pAagCnxIblzcvrp+q0XwCpr90oZhnWgUsEQ5WsCI+ZP8fTBYoLhNdeTU3qhPBDeHe7Yfc+r3qPFgejVB1kVmClIIRX92RXwGgoKKcKzLQCBGLclP1ANPbyWf+ypl64arqZNfZXoX65ZFTNiP8vLtl+pO1bT7uVxo6FK3Os/9M0iL94Wc4o2PDHt2ztnvtsTT0K/VRr13FOfYiNY2coDhJbWkhwmMDrpwu91bFbRZA/9iVoOCl7A0lHHkoVZgIYQLQSK6o9sJnVX0j3dNYOCiC+DTE+5pBu+JLqcz73OXKxe2+Bw/KAZrY8aAtKT8QU14lSi4QJAUaRBZ7yjkc6oQj1U3drx0/SodFrQFWSNKUIHsI5EUaiAYYNV/7ZrLFFjrbdpuQg1jb0tyAR97jvJkG3EFK/rbgA=
x-ms-exchange-transport-forked: True
Content-ID: <826022437A937D49A68AD0948919C2C6@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4959
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(199004)(189003)(8676002)(33716001)(54906003)(6246003)(25786009)(22756006)(6862004)(2906002)(66066001)(1076003)(81166006)(81156014)(99286004)(33656002)(8746002)(8936002)(229853002)(478600001)(86362001)(50466002)(6512007)(6116002)(9686003)(356004)(26826003)(47776003)(6486002)(23726003)(3846002)(63350400001)(102836004)(446003)(186003)(14454004)(305945005)(7736002)(26005)(76176011)(97756001)(11346002)(126002)(63370400001)(336012)(58126008)(316002)(450100002)(476003)(46406003)(76130400001)(70206006)(386003)(70586007)(6506007)(5660300002)(4326008)(486006)(36906005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1847;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8bb119b9-38dc-4171-3226-08d71fd27243
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1847; 
NoDisclaimer: True
X-Forefront-PRVS: 01283822F8
X-Microsoft-Antispam-Message-Info: XQhl0w6bJfmwd9yfjijjKrSPiTUxoIOY2qmEWSejnfD5uj+mLWlEK0bVsH/5rOLz5Bjw35n6NNWrZVf7F9YNrvBsdjmfHr3MSIEpu9MVclJFBB8bvUdYIeTo+3W4AG28ggNX3MooKY0GBDWJTX/KcuTPEWFrXhfcrq2ZzcxAfLAva5bOIyyfrQcHmENCdn5CnuBhALQillRfB5FM90xJMj4JkBPv+UgcoMR3pWmc/G3nzeOBTGyzN/mG8lSG0zYKz9ztmDFXsvj2yU9Nst+jROweTO4IoOCYI7gAnkIZUwnS9J9x/J//ztBKgjTCk3fFgRkRdtlFEl5mNaGhSkNheBSyf9og3mApkNQWbOZoSt2bNPKN5xuGrOraNnZ6KE4xiReBib25KG4/OJzh3NlaKLJohOwiVZ0Vy5O4RrqFi40=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 09:41:49.7680 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f2a257-e23d-4ca6-9613-08d71fd27732
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzaHccnJbSdH9rd2auSZTcwmPU6dnHbcr8K+4xH2GNE=;
 b=vdcwtKpQiAyDCmpWMd5dNJt7wxAPm7UaNEeegylUZqvDKLatK+pXkDn4t1lCpT2xf3aXGTpj1eoBAnAMVDVfZ7C3O2vG9+1ZyYJCwdMu+jWsG41ZGrghw4BRq9BkUcRzl5Sjm3J1cFhU/Y9OHsSZ0u3uFFdY9E1jsRKrTFQ7+SE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzaHccnJbSdH9rd2auSZTcwmPU6dnHbcr8K+4xH2GNE=;
 b=vdcwtKpQiAyDCmpWMd5dNJt7wxAPm7UaNEeegylUZqvDKLatK+pXkDn4t1lCpT2xf3aXGTpj1eoBAnAMVDVfZ7C3O2vG9+1ZyYJCwdMu+jWsG41ZGrghw4BRq9BkUcRzl5Sjm3J1cFhU/Y9OHsSZ0u3uFFdY9E1jsRKrTFQ7+SE=
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
Cc: "ville.syrjala@intel.com" <ville.syrjala@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, "maarten.lankhorst@intel.com" <maarten.lankhorst@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMjksIDIwMTkgYXQgMDE6NDU6NTlBTSArMDUzMCwgVW1hIFNoYW5rYXIgd3Jv
dGU6Cj4gRXhpc3RpbmcgTFVUIHByZWNpc2lvbiBzdHJ1Y3R1cmUgaXMgaGF2aW5nIG9ubHkgMTYg
Yml0Cj4gcHJlY2lzaW9uLiBUaGlzIGlzIG5vdCBlbm91Z2ggZm9yIHVwY29taW5nIGVuaGFuY2Vk
IGhhcmR3YXJlcwo+IGFuZCBhZHZhbmNlIHVzZWNhc2VzIGxpa2UgSERSIHByb2Nlc3NpbmcuIEhl
bmNlIGFkZGVkIGEgbmV3Cj4gc3RydWN0dXJlIHdpdGggMzIgYml0IHByZWNpc2lvbiB2YWx1ZXMu
IEFsc28gYWRkZWQgdGhlIGNvZGUsCj4gZm9yIGV4dHJhY3RpbmcgdGhlIHNhbWUgZnJvbSB2YWx1
ZXMgcGFzc2VkIGZyb20gdXNlcnNwYWNlLgo+IAo+IHY0OiBSZWJhc2UKPiAKPiB2NTogUmVsb2Nh
dGVkIHRoZSBoZWxwZXIgZnVuY3Rpb24gdG8gZHJtX2NvbG9yX21nbXQuYy4gRGVjbGFyZWQKPiB0
aGUgc2FtZSBpbiBhIGhlYWRlciBmaWxlIChBbGV4YW5kcnUgR2hlb3JnaGUpCj4gCj4gdjY6IEVu
aGFuY2VkIGdhbW1hIGx1dCBzdHJ1Y3R1cmUgdG8gdGFrZSBVMzIuMzIgZm9ybWF0IGFzIGlucHV0
Lgo+IFRoaXMgaXMgbmVlZGVkIGZvciBIRFIgdXNlY2FzZSB3aGljaCByZXF1aXJlIGhpZ2hlciBw
cmVjaXNpb24uCj4gCj4gdjc6IEFkZHJlc3NlZCBNYWFydGVuJ3MgcmV2aWV3IGNvbW1lbnRzIGFu
ZCBmaXhlZCB0aGUgY2FsY3VsYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIg
PHVtYS5zaGFua2FyQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogQWxleGFuZHJ1IEdoZW9yZ2hl
IDxhbGV4YW5kcnUtY29zbWluLmdoZW9yZ2hlQGFybS5jb20+CgpIaSBVbWEKCldoZW4gY2FuIHdl
IG1lcmdlIHRoZXNlIHBsYW5lIGNvbG9yLW1nbXQgc3VwcG9ydCBpbnRvIHVwc3RyZWFtID8Kb3Ig
Y2FuIHdlIG1lcmdlIHRoZSBEUk0tQ09SRSBwYXJ0IHBhdGNoZXMgZmlyc3RseT8KCnRoYW5rcwpq
YW1lcwoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgfCAyMCArKysr
KysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oICAgICB8ICAx
ICsKPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oICAgICAgfCAxNSArKysrKysrKysrKysr
KysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9j
b2xvcl9tZ210LmMKPiBpbmRleCBkNWQzNGQwLi43OWZmODc0IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9j
b2xvcl9tZ210LmMKPiBAQCAtMTI4LDYgKzEyOCwyNiBAQCB1aW50MzJfdCBkcm1fY29sb3JfbHV0
X2V4dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikKPiAg
fQo+ICBFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdCk7Cj4gIAo+ICsvKgo+ICsg
KiBBZGRlZCB0byBhY2NvbW1vZGF0ZSBlbmhhbmNlZCBMVVQgcHJlY2lzaW9uLgo+ICsgKiBNYXgg
TFVUIHByZWNpc2lvbiBpcyAzMiBiaXRzLgo+ICsgKi8KPiArdTY0IGRybV9jb2xvcl9sdXRfZXh0
cmFjdF9leHQodTY0IHVzZXJfaW5wdXQsIHUzMiBiaXRfcHJlY2lzaW9uKQo+ICt7Cj4gKwl1NjQg
dmFsID0gdXNlcl9pbnB1dCAmIDB4ZmZmZmZmZmY7Cj4gKwl1MzIgbWF4ID0gMHhmZmZmZmZmZiA+
PiAoMzIgLSBiaXRfcHJlY2lzaW9uKTsKPiArCj4gKwkvKiBSb3VuZCBvbmx5IGlmIHdlJ3JlIG5v
dCB1c2luZyBmdWxsIHByZWNpc2lvbi4gKi8KPiArCWlmIChiaXRfcHJlY2lzaW9uIDwgMzIpIHsK
PiArCQl2YWwgKz0gMVVMIDw8ICgzMiAtIGJpdF9wcmVjaXNpb24gLSAxKTsKPiArCQl2YWwgPj49
IDMyIC0gYml0X3ByZWNpc2lvbjsKPiArCX0KPiArCj4gKwlyZXR1cm4gKCh1c2VyX2lucHV0ICYg
MHhmZmZmZmZmZjAwMDAwMDAwKSB8Cj4gKwkJY2xhbXBfdmFsKHZhbCwgMCwgbWF4KSk7Cj4gK30K
PiArRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfbHV0X2V4dHJhY3RfZXh0KTsKPiArCj4gIC8qKgo+
ICAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50
IHByb3BlcnRpZXMKPiAgICogQGNydGM6IERSTSBDUlRDCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9jb2xvcl9tZ210LmggYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oCj4gaW5k
ZXggZDFjNjYyZC4uYzlkMjc0NiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29sb3Jf
bWdtdC5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+IEBAIC0zMCw2ICsz
MCw3IEBACj4gIHN0cnVjdCBkcm1fcGxhbmU7Cj4gIAo+ICB1aW50MzJfdCBkcm1fY29sb3JfbHV0
X2V4dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbik7Cj4g
K3U2NCBkcm1fY29sb3JfbHV0X2V4dHJhY3RfZXh0KHU2NCB1c2VyX2lucHV0LCB1MzIgYml0X3By
ZWNpc2lvbik7Cj4gIAo+ICB2b2lkIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKPiAgCQkJCXVpbnQgZGVnYW1tYV9sdXRfc2l6ZSwKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9k
ZS5oCj4gaW5kZXggMDlkNzI5Ni4uY2E4MTQxMCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkv
ZHJtL2RybV9tb2RlLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgKPiBAQCAt
NjI5LDYgKzYyOSwyMSBAQCBzdHJ1Y3QgZHJtX2NvbG9yX2x1dCB7Cj4gIAlfX3UxNiByZXNlcnZl
ZDsKPiAgfTsKPiAgCj4gKy8qCj4gKyAqIENyZWF0aW5nIDY0IGJpdCBwYWxldHRlIGVudHJpZXMg
Zm9yIGJldHRlciBkYXRhCj4gKyAqIHByZWNpc2lvbi4gVGhpcyB3aWxsIGJlIHJlcXVpcmVkIGZv
ciBIRFIgYW5kCj4gKyAqIHNpbWlsYXIgY29sb3IgcHJvY2Vzc2luZyB1c2VjYXNlcy4KPiArICov
Cj4gK3N0cnVjdCBkcm1fY29sb3JfbHV0X2V4dCB7Cj4gKwkvKgo+ICsJICogRGF0YSBpcyBVMzIu
MzIgZml4ZWQgcG9pbnQgZm9ybWF0Lgo+ICsJICovCj4gKwlfX3U2NCByZWQ7Cj4gKwlfX3U2NCBn
cmVlbjsKPiArCV9fdTY0IGJsdWU7Cj4gKwlfX3U2NCByZXNlcnZlZDsKPiArfTsKPiArCj4gICNk
ZWZpbmUgRFJNX01PREVfUEFHRV9GTElQX0VWRU5UIDB4MDEKPiAgI2RlZmluZSBEUk1fTU9ERV9Q
QUdFX0ZMSVBfQVNZTkMgMHgwMgo+ICAjZGVmaW5lIERSTV9NT0RFX1BBR0VfRkxJUF9UQVJHRVRf
QUJTT0xVVEUgMHg0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
