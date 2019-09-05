Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FDEAA428
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 15:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646796E0D3;
	Thu,  5 Sep 2019 13:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700040.outbound.protection.outlook.com [40.107.70.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED8B6E0D2;
 Thu,  5 Sep 2019 13:17:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa4j93z59d4xwwpS/Nj+CBM8uhHQvFUlFkqfd+FkwNCWDpmO2jzsqT30iQ+BXLprmZ9U4F7NaJKg5KwFa7TUMUD5vJGW9rz2OevpwkXiMrB+HAzX6uxwFFfQXNj1KTxO+WB3GRAwDkTsSOTVikcXpBgfwqI+k1ufPWn8gAt7PSU5ZfPlxnCYaQFLxoqHXJFj/3M2fAj5GVxhL6Xprh3m/GPxUVNpvYss46FR652UaDy2/QoJw6x5ljzgOJvWnN1aCfxVV4HFwCA2AZqBNgsUcumMBBFw9VAHKQ7VqrM5mwCBeEY8Yj4a/+GVKH//Oq1DQpdfjtUzJu75S3CcDwGSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVTmM3a0Z1LL3nxtcwTLTK+lmTNNgQZj8TQjhIg9/84=;
 b=hbyZrcCPApPEuzhVOBnSMTk+vzoMplc3TSuPCggREG4N+CWp7uUfsvZoT/sPSwiG2R3uWO/8hf5taLOzZpGoLLpLMdSvIua7Z1/97XIYZQDHroVT9UKCkYNskA4pBAaVbl8K4wjvqEtyazgE4La0ZpP0ifpjLMyt/ezI9ylQfbQwzFdnYUOYRkHzPvn7XkPSsNnhmhulnRz+0YnwUkX6VdIBTQ/gRrivinErNcJsBBQhx0CuYRpUk882POUGfbn1iT72aKotjM92fyRs3p9SOWiqdJVYdRycM6QlJUmpNDZXtjH8/9iPn3kxmWjItwjj+KXS4sY1/5yz1AV8IUMYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0232.namprd12.prod.outlook.com (10.174.52.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Thu, 5 Sep 2019 13:17:14 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 13:17:14 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 4 (amd/display/)
Thread-Topic: linux-next: Tree for Sep 4 (amd/display/)
Thread-Index: AQHVY2OBXMezq3awGkCsLLALyRll+qcdEayA
Date: Thu, 5 Sep 2019 13:17:14 +0000
Message-ID: <752f74d6-f6ff-6013-25ad-a8fdce934d17@amd.com>
References: <20190904233443.3f73c46b@canb.auug.org.au>
 <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
In-Reply-To: <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:925f:916c::2]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4b54925-03ea-4518-e384-08d732035dff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0232; 
x-ms-traffictypediagnostic: CY4PR1201MB0232:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB02325ADDA607B3D789B7E8608CBB0@CY4PR1201MB0232.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(199004)(189003)(53754006)(486006)(6306002)(99286004)(446003)(14444005)(4326008)(6512007)(11346002)(478600001)(476003)(2616005)(14454004)(966005)(36756003)(25786009)(256004)(229853002)(53936002)(71190400001)(46003)(71200400001)(6246003)(6486002)(31686004)(52116002)(6436002)(65956001)(65806001)(31696002)(4744005)(5660300002)(6116002)(81156014)(81166006)(8676002)(186003)(58126008)(76176011)(66476007)(66556008)(66946007)(66446008)(64756008)(8936002)(7736002)(386003)(102836004)(6506007)(316002)(53546011)(2906002)(110136005)(305945005)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0232;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vr8Qt0hj8MmbyEtAM4B1R+94qbhO5Vc5tHiBSSOXP4GCl7yQq7c8GCzkZa4PNLaIXkbdm09dEsIBiTkTbxd+8X0YOnTPG5vNDjI62J/xsS45+ykcuSji+BkJ3jOQSeC2HxADQT7t9tQtCKnWEgRcDr8G5ixSwQx/8qyftaPQW1Jfv85bdTdpnJ8bp7xSd8Z9o0kEbQESIiOs2wCUCP61hV+NVUINKMJ5U0RP7pNly+n1/u86NBkUztAm3FpL84LGNhpst67GGn08umoLbu9AyfWag3F4F+FMkBGbv2cGjIZzmDH/I1zl4erob7INkjBIeZjvFwcC5DiDstAvAxvj9CXhcEAfW7s4XICF+sdfd/Ege+cunh9QNEYKq08SJlCTMbM8XK1x+VFr4x6Ajqs0CG7t52CZnwJMq4WVG6U6ruI=
Content-ID: <C2E148370D9A45438625E22C870190C8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b54925-03ea-4518-e384-08d732035dff
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 13:17:14.3764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJtQcbnVEA1TLmfwJ79NE01a6aKt2SvcWziquaCLUtj/o2nmYxsNadRt/1hkIkvSdSbIaR807HsbSg2R8rcr+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0232
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVTmM3a0Z1LL3nxtcwTLTK+lmTNNgQZj8TQjhIg9/84=;
 b=IU6LoCZV9XJmKxznDGS/0w0ta8hOpOIF1iB7VhbB8F5Z4pbqmObP8UK09UCv0SGr8lvILw8hDJGYVxW5Q9KahxAGSFny5PF37WgU3ewEUBTqfphz0+gP4tmedBVqymk0IgIfUCU9ubSxzaJu0wo+N0nbH3qflO6vXZXjstPBuHw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA5LTA0IDQ6NTggcC5tLiwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDkvNC8x
OSA2OjM0IEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+PiBIaSBhbGwsCj4+Cj4+IE5ld3M6
IHRoaXMgd2lsbCBiZSB0aGUgbGFzdCBsaW51eC1uZXh0IEkgd2lsbCByZWxlYXNlIHVudGlsIFNl
cHQgMzAuCj4+Cj4+IENoYW5nZXMgc2luY2UgMjAxOTA5MDM6Cj4+Cj4gCj4gb24geDg2XzY0Ogo+
IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2RjL2RtbC9kY24yMC9kaXNwbGF5X3JxX2RsZ19jYWxjXzIwdjIuYzo3NzowOgo+
IC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2RjbjIwLy4u
L2RtbF9pbmxpbmVfZGVmcy5oOiBJbiBmdW5jdGlvbiDigJhkbWxfbWlu4oCZOgo+IC4uL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2RjbjIwLy4uL2RtbF9pbmxp
bmVfZGVmcy5oOjM0OjE6IGVycm9yOiBTU0UgcmVnaXN0ZXIgcmV0dXJuIHdpdGggU1NFIGRpc2Fi
bGVkCj4gCgpJcyB0aGF0IGZpeGVkIGJ5IFN0ZXBoZW4ncyBmaXh1cCBoZXJlPwoKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktU2VwdGVtYmVyLzIz
NDI5Mi5odG1sCgpUaGFua3MsCkhhcnJ5Cgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
