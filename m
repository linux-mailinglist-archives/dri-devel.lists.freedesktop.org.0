Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43331C12EF
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 05:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8B76E29B;
	Sun, 29 Sep 2019 03:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30049.outbound.protection.outlook.com [40.107.3.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3783F6E29B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 03:26:51 +0000 (UTC)
Received: from DB6PR0802CA0047.eurprd08.prod.outlook.com (2603:10a6:4:a3::33)
 by AM6PR08MB3701.eurprd08.prod.outlook.com (2603:10a6:20b:8b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19; Sun, 29 Sep
 2019 03:26:47 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by DB6PR0802CA0047.outlook.office365.com
 (2603:10a6:4:a3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Sun, 29 Sep 2019 03:26:47 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sun, 29 Sep 2019 03:26:46 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Sun, 29 Sep 2019 03:26:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d019f9c4b4c08c50
X-CR-MTA-TID: 64aa7808
Received: from d51c355ab390.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F670F9C4-1214-4A51-928F-E4E45F68C521.1; 
 Sun, 29 Sep 2019 03:26:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d51c355ab390.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Sun, 29 Sep 2019 03:26:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkufrvGUe2u0q84huNwDWv9zJ9J0lFG2r3vCfaKKJ+6cPs7wu4zhPXM4iULnJQGCXHrvGWbmv+hrsdeGodkPIbcxcIgZA1OuMgdBKmOxz6drBXyLfgs5Mz82rXCqrYsdf7J5RVtg52zKyYYphsRt1JrfDM8khkQrO2vPqAXk12hc4TO/dPsob2+18TqmcSnHmJhRsYf9iqXxFVDItj0dU/zOiaUUg9PObeBg8j/cGdfd7bU8OYUAhP0N2pPBVQbAIKbC8gGTDDrHWq1p9pSmWZqMsYmG5JRGyg6DyfsCN3YVK/1GNoszaDRY+8KpFGO5y1FeoII5W/0noXxWoFwB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQUMJ/KHvy6Fw3Jt0ojdvB/x+XAr3Kg1GqxM7j5PdmI=;
 b=dUg1akc5N0r1T+CBecLbwKDiohsLrJxE/O16O9Q5wCaWDSmnPr6Xtop3KxjZc6A8kgFewmj3SRDUW2hYp09ps5YkZlKWBkzhW5ZMyLMjo8Kp65xXOojOCy0nm7No1on5KjVjudNQ56nH+Lpu6A5wZ4JJMdavPJC36V9RtY/jFsBZF61y3kEAC9/R/yIj4L0jPfi70lLv0wGmEu9inEbKjiob4sbIPaqGsb4n5nEDZv2LGtce7+9kRliKX4HPri4TneXP3wu+ZwF4ts0hNuHjpAXkIwCcZ+oW8ElxV51tcM++cQG7HtvaHVL3yH/ZohyoNDpZSakLQ5W3Ux/3rIkK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4781.eurprd08.prod.outlook.com (10.255.114.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Sun, 29 Sep 2019 03:26:39 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.028; Sun, 29 Sep 2019
 03:26:38 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Sandy Huang <hjc@rock-chips.com>
Subject: Re: [v2,1/3] drm: Add some new format DRM_FORMAT_NVXX_10
Thread-Topic: [v2,1/3] drm: Add some new format DRM_FORMAT_NVXX_10
Thread-Index: AQHVdnWzqsA4YhPoH0G4L3W1+ovDcg==
Date: Sun, 29 Sep 2019 03:26:38 +0000
Message-ID: <20190929032630.GA26869@jamwan02-TSP300>
References: <1569486289-152061-2-git-send-email-hjc@rock-chips.com>
In-Reply-To: <1569486289-152061-2-git-send-email-hjc@rock-chips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:202:2::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4d1804d8-29a3-44c6-2da4-08d7448cdb7a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4781:|AM6PR08MB3701:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3701FC0548C350100FC5F255B3830@AM6PR08MB3701.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
x-forefront-prvs: 017589626D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39850400004)(346002)(136003)(396003)(366004)(376002)(199004)(189003)(476003)(386003)(26005)(54906003)(8936002)(8676002)(81166006)(52116002)(11346002)(446003)(58126008)(6506007)(102836004)(81156014)(99286004)(76176011)(55236004)(186003)(486006)(64756008)(4326008)(33716001)(33656002)(66556008)(6246003)(66946007)(6512007)(9686003)(66476007)(229853002)(6486002)(6436002)(305945005)(7736002)(5660300002)(71200400001)(71190400001)(66446008)(256004)(86362001)(25786009)(478600001)(1076003)(66066001)(3846002)(6116002)(2906002)(316002)(6916009)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4781;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jnB10YajSvhHGYDVvtMEeCB1lT+OJ+o8OUyrhJyGzT2KbEbbsREmTrRboHeSV4R/ErNt86nkzdmmsTjPR4jUAei18Je9Yb3myx+9kefquBhgZ7tIajtIVN8hR1c28aAMrD2coOfYkY083yOM86aLSlHG+RhPkp+Ur1BB5JPKwVxtVsOZd/K8DfP4EVtzLe/7sBokWpPrUMO3VyTy7bpWMlDxPEIU7c1Z08I+0WtNlWEznBN2teE5RxYYanda2aD6T5l87LovStnTFBtnxG3jGBwFYkeLku1py/UeHylHdPw92FtPRDnz/6wsmBcYabjiT85QwbUDdvGgo0ib+6EKYJOE+kWM/9bbahxGsR3pgqb2Bn+GS/gY9hkzGlp0e635kM3S4w22a7PKnfa9lf1M9ojdAC13GlNmGMHEo6c50hY=
x-ms-exchange-transport-forked: True
Content-ID: <FEF978B46090B04D86508D5484487008@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4781
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(396003)(376002)(346002)(39850400004)(189003)(199004)(316002)(11346002)(63350400001)(81166006)(97756001)(33656002)(46406003)(33716001)(6512007)(476003)(47776003)(486006)(446003)(50466002)(102836004)(4326008)(336012)(22756006)(386003)(81156014)(5660300002)(186003)(6486002)(76130400001)(25786009)(9686003)(6506007)(126002)(66066001)(70586007)(70206006)(54906003)(14454004)(26005)(23726003)(26826003)(6116002)(6246003)(229853002)(2906002)(3846002)(58126008)(86362001)(356004)(1076003)(6862004)(478600001)(7736002)(76176011)(8746002)(305945005)(8936002)(8676002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3701;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1855e459-4ddd-41f2-5502-08d7448cd665
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB3701; 
NoDisclaimer: True
X-Forefront-PRVS: 017589626D
X-Microsoft-Antispam-Message-Info: dBwCk4TPT7GZVFI8Y3yVmoaKddLWuy2qPs2GYpUAO7obpdTrpPxq236cljpIzi9OGsHrJvejVFNvWR5OSO0NrDMeYqYeM+OmzYEBB9Qx6eY9WL07AobT+iMUGCi3rI3TAfcjWbPw19DGBFJq0roYQ28G+EE/DNEM2OaAHpMISOUk3HLAkdLQAlTy+/PzznJIhYouXvTWqVEtZ9uvuc59r36sdjG9Ga8HH5T6HWl/t3w0oUvCbHAg8xvNmZxsgU/Ts5dZpSytPar9xHWQAot9Xcxniiyvt/kYkUL1EfIoF4tSczrQIIkyDTDbqEew+2sKsFTuidqQNtRjvXmT7KBp2XOcotJEfOsjhSFlZe5owAf0aizg8UCwb3bg+87w/xr6JeX2JFhZjSEhWDfk5LU/LN8yLsPAmHW5dWzCarM8UrI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2019 03:26:46.4061 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1804d8-29a3-44c6-2da4-08d7448cdb7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3701
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQUMJ/KHvy6Fw3Jt0ojdvB/x+XAr3Kg1GqxM7j5PdmI=;
 b=pLsHE+lGMMdgPniIRPV5erkqg8DLKmSuREFAAYS5WpLpwIWG1C5eMpG0uNVcNJxi3yx1j5RnNPLHWlgM1ZDo0aAzYyLhSaHVzMtQAJlBT86uPmflC/uuAJtzeL+sZK2SLeyfhZUKk8pI7HqkXKA8hs0Y2LFzVznKwwSI4Kczp4Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQUMJ/KHvy6Fw3Jt0ojdvB/x+XAr3Kg1GqxM7j5PdmI=;
 b=pLsHE+lGMMdgPniIRPV5erkqg8DLKmSuREFAAYS5WpLpwIWG1C5eMpG0uNVcNJxi3yx1j5RnNPLHWlgM1ZDo0aAzYyLhSaHVzMtQAJlBT86uPmflC/uuAJtzeL+sZK2SLeyfhZUKk8pI7HqkXKA8hs0Y2LFzVznKwwSI4Kczp4Y=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDQ6MjQ6NDdQTSArMDgwMCwgU2FuZHkgSHVhbmcgd3Jv
dGU6Cj4gVGhlc2UgbmV3IGZvcm1hdCBpcyBzdXBwb3J0ZWQgYnkgc29tZSByb2NrY2hpcCBzb2Nz
Ogo+IAo+IERSTV9GT1JNQVRfTlYxMl8xMC9EUk1fRk9STUFUX05WMjFfMTAKPiBEUk1fRk9STUFU
X05WMTZfMTAvRFJNX0ZPUk1BVF9OVjYxXzEwCj4gRFJNX0ZPUk1BVF9OVjI0XzEwL0RSTV9GT1JN
QVRfTlY0Ml8xMAo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlw
cy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgIHwgMTggKysrKysr
KysrKysrKysrKysrCj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTQgKysrKysr
KysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZvdXJjYy5jCj4gaW5kZXggYzYzMDA2NC4uY2NkNzhhMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZvdXJjYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2Mu
Ywo+IEBAIC0yNjEsNiArMjYxLDI0IEBAIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKl9f
ZHJtX2Zvcm1hdF9pbmZvKHUzMiBmb3JtYXQpCj4gIAkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9Q
MDE2LAkJLmRlcHRoID0gMCwgIC5udW1fcGxhbmVzID0gMiwKPiAgCQkgIC5jaGFyX3Blcl9ibG9j
ayA9IHsgMiwgNCwgMCB9LCAuYmxvY2tfdyA9IHsgMSwgMCwgMCB9LCAuYmxvY2tfaCA9IHsgMSwg
MCwgMCB9LAo+ICAJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwKPiAr
CQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMTJfMTAsCQkuZGVwdGggPSAwLCAgLm51bV9wbGFu
ZXMgPSAyLAo+ICsJCSAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tfdyA9
IHsgNCwgNCwgMCB9LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9LAoKSGkgU2FuZHk6CgpUaGVpciBp
cyBhIHByb2JsZW0gaGVyZSBmb3IgY2hhcl9wZXJfYmxvY2sgc2l6ZSBvZiBwbGFuZVswXToKClNp
bmNlOiA1ICogOCAhPSA0ICogNCAqIDEwOwoKU2VlbXMgeW91IG1pcy1zZXQgdGhlIGJsb2NrX3cv
aCwgcGVyIHlvdXIgYmxvY2sgc2l6ZSB0aGUgYmxvY2sgaXMgMngyLCBhbmQgaXQgc2hvdWxkIGJl
OgoKIC5jaGFyX3Blcl9ibG9jayA9IHsgNSwgMTAsIDAgfSwgLmJsb2NrX3cgPSB7IDIsIDIsIDAg
fSwgLmJsb2NrX2ggPSB7IDIsIDIsIDAgfSwKCgpCZXN0IFJlZ2FyZHM6CkphbWVzCgo+ICsJCSAg
LmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwKPiArCQl7IC5mb3JtYXQgPSBE
Uk1fRk9STUFUX05WMjFfMTAsCQkuZGVwdGggPSAwLCAgLm51bV9wbGFuZXMgPSAyLAo+ICsJCSAg
LmNoYXJfcGVyX2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tfdyA9IHsgNCwgNCwgMCB9LCAu
YmxvY2tfaCA9IHsgNCwgNCwgMCB9LAo+ICsJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195
dXYgPSB0cnVlfSwKPiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMTZfMTAsCQkuZGVwdGgg
PSAwLCAgLm51bV9wbGFuZXMgPSAyLAo+ICsJCSAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAxMCwg
MCB9LCAuYmxvY2tfdyA9IHsgNCwgNCwgMCB9LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9LAo+ICsJ
CSAgLmhzdWIgPSAyLCAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVlfSwKPiArCQl7IC5mb3JtYXQg
PSBEUk1fRk9STUFUX05WNjFfMTAsCQkuZGVwdGggPSAwLCAgLm51bV9wbGFuZXMgPSAyLAo+ICsJ
CSAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tfdyA9IHsgNCwgNCwgMCB9
LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9LAo+ICsJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDEsIC5p
c195dXYgPSB0cnVlfSwKPiArCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMjRfMTAsCQkuZGVw
dGggPSAwLCAgLm51bV9wbGFuZXMgPSAyLAo+ICsJCSAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAx
MCwgMCB9LCAuYmxvY2tfdyA9IHsgNCwgNCwgMCB9LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9LAo+
ICsJCSAgLmhzdWIgPSAxLCAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVlfSwKPiArCQl7IC5mb3Jt
YXQgPSBEUk1fRk9STUFUX05WNDJfMTAsCQkuZGVwdGggPSAwLCAgLm51bV9wbGFuZXMgPSAyLAo+
ICsJCSAgLmNoYXJfcGVyX2Jsb2NrID0geyA1LCAxMCwgMCB9LCAuYmxvY2tfdyA9IHsgNCwgNCwg
MCB9LCAuYmxvY2tfaCA9IHsgNCwgNCwgMCB9LAo+ICsJCSAgLmhzdWIgPSAxLCAudnN1YiA9IDEs
IC5pc195dXYgPSB0cnVlfSwKPiAgCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX1AyMTAsCQkuZGVw
dGggPSAwLAo+ICAJCSAgLm51bV9wbGFuZXMgPSAyLCAuY2hhcl9wZXJfYmxvY2sgPSB7IDIsIDQs
IDAgfSwKPiAgCQkgIC5ibG9ja193ID0geyAxLCAwLCAwIH0sIC5ibG9ja19oID0geyAxLCAwLCAw
IH0sIC5oc3ViID0gMiwKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNj
LmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+IGluZGV4IDNmZWVhYTMuLjA4ZTIy
MjEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiArKysgYi9p
bmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+IEBAIC0yMzgsNiArMjM4LDIwIEBAIGV4dGVy
biAiQyIgewo+ICAjZGVmaW5lIERSTV9GT1JNQVRfTlY0MgkJZm91cmNjX2NvZGUoJ04nLCAnVics
ICc0JywgJzInKSAvKiBub24tc3Vic2FtcGxlZCBDYjpDciBwbGFuZSAqLwo+ICAKPiAgLyoKPiAr
ICogMiBwbGFuZSBZQ2JDcgo+ICsgKiBpbmRleCAwID0gWSBwbGFuZSwgWTM6WTI6WTE6WTAgMTA6
MTA6MTA6MTAKPiArICogaW5kZXggMSA9IENiOkNyIHBsYW5lLCBDYjM6Q3IzOkNiMjpDcjI6Q2Ix
OkNyMTpDYjA6Q3IwIDEwOjEwOjEwOjEwOjEwOjEwOjEwOjEwCj4gKyAqIG9yCj4gKyAqIGluZGV4
IDEgPSBDcjpDYiBwbGFuZSwgQ3IzOkNiMzpDcjI6Q2IyOkNyMTpDYjE6Q3IwOkNiMCAxMDoxMDox
MDoxMDoxMDoxMDoxMDoxMAo+ICsgKi8KPiArI2RlZmluZSBEUk1fRk9STUFUX05WMTJfMTAJZm91
cmNjX2NvZGUoJ04nLCAnQScsICcxJywgJzInKSAvKiAyeDIgc3Vic2FtcGxlZCBDcjpDYiBwbGFu
ZSAqLwo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyMV8xMAlmb3VyY2NfY29kZSgnTicsICdBJywg
JzInLCAnMScpIC8qIDJ4MiBzdWJzYW1wbGVkIENiOkNyIHBsYW5lICovCj4gKyNkZWZpbmUgRFJN
X0ZPUk1BVF9OVjE2XzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICc2JykgLyogMngxIHN1
YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KPiArI2RlZmluZSBEUk1fRk9STUFUX05WNjFfMTAJZm91
cmNjX2NvZGUoJ04nLCAnQScsICc2JywgJzEnKSAvKiAyeDEgc3Vic2FtcGxlZCBDYjpDciBwbGFu
ZSAqLwo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyNF8xMAlmb3VyY2NfY29kZSgnTicsICdBJywg
JzInLCAnNCcpIC8qIG5vbi1zdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCj4gKyNkZWZpbmUgRFJN
X0ZPUk1BVF9OVjQyXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnNCcsICcyJykgLyogbm9uLXN1
YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPiArCj4gKy8qCj4gICAqIDIgcGxhbmUgWUNiQ3IgTVNC
IGFsaWduZWQKPiAgICogaW5kZXggMCA9IFkgcGxhbmUsIFsxNTowXSBZOnggWzEwOjZdIGxpdHRs
ZSBlbmRpYW4KPiAgICogaW5kZXggMSA9IENyOkNiIHBsYW5lLCBbMzE6MF0gQ3I6eDpDYjp4IFsx
MDo2OjEwOjZdIGxpdHRsZSBlbmRpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
