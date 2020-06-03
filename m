Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560A71EDDC2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7306E283;
	Thu,  4 Jun 2020 07:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BA389BBD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 20:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqGtEZUotHwvImq6gQMI3bB586y0d8XYDAoWHH5j9iuGiI4yKNllKbIzDlMJ3wYfANfh9J5ChldxpEs2dkcq7a2TZYGerUhuDEBdDaGdIFOJQBKm4jey3PqQ3tjafiFopkwXHP5YAG51ZupTkb6SehgqCi4z3Awga7YaJC5Tq1ZE5d/OhCQClUq3DsMkNoofcsoSMs3RaBUSnwsrIfisFkQEQlsYEXeJ20KaHG5Dc7Itc1m8/JLYtKcke/tIMtHs+BBGSK/efP/Zxsbdxg4IaWPXA1oEm1sGqqhvZnolKIvxKPL54gbMuvixg0AuIB5QvHcbpZ33jZrARRZ8+Of71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHcRcr+afO3Qs4zkkCgV2ucA9xp7mBMigCKrn5AqN6o=;
 b=O2+zSbkbIjR1CKIHPp0oI/W2sCJl1R8ZP+G9zjtE1hJk+RBuQfpJ+ASOlpOW1DIg+VuWXjsTFI/5kcCbOHfYm3cp+oGvOfPFHzW5rphVqlFTmjMopCbX93DCvi7l2DRkOBCK7oi2wCbGhojsEsoty+YhPWZIDorgOCZp/syKYCEUgSatbGP6pVypHt20HQMj9d1IwNRm7/kzcM9/ChZeMtfu4R4WYLEMZnqpCNCjSdhsJAh98kmoiwNYLcd0Uce0fqSWCG77BhlXHEnpOB2mICQz7Y/goeisaCKuhKdf9N6oxZxxQMIpw48kSOCSV97JberlGYTBYFzZdijJe3gr5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHcRcr+afO3Qs4zkkCgV2ucA9xp7mBMigCKrn5AqN6o=;
 b=E3FpMLtUev+f/kmt5loMM0plKCCsHXTI9j1Hex4VL2qlgEggRj0vQIL6apZDlXL7o34oRY0PRkye5kwVSB8FQFzPi2Wp3/qGejrR04BBh1Abe1AQF23sPIDDXx5zfT28uuYfjDhZarNX6DvugQYMXqIu2AdSpmcUdaYeCMU7shA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB4461.eurprd05.prod.outlook.com (2603:10a6:803:40::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 3 Jun
 2020 20:13:46 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e%7]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 20:13:45 +0000
Date: Wed, 3 Jun 2020 17:13:37 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dave Airlie <airlied@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200603201337.GA225528@ziepe.ca>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
X-ClientProxiedBy: MN2PR15CA0053.namprd15.prod.outlook.com
 (2603:10b6:208:237::22) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (193.47.165.251) by
 MN2PR15CA0053.namprd15.prod.outlook.com (2603:10b6:208:237::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Wed, 3 Jun 2020 20:13:45 +0000
Received: from jgg by mlx with local (Exim 4.93)	(envelope-from
 <jgg@mellanox.com>)	id 1jgZlZ-000wuT-6Q; Wed, 03 Jun 2020 17:13:37 -0300
X-Originating-IP: [193.47.165.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f854f429-4ea0-4ca5-cc45-08d807fa9e55
X-MS-TrafficTypeDiagnostic: VI1PR05MB4461:
X-Microsoft-Antispam-PRVS: <VI1PR05MB44610C9D5D320520E5B5FBFBCF880@VI1PR05MB4461.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7dphUCF79o5P+QCoLjy8doT0f0iiQy1x2gNSgGeD3z0AfJw+uOvlFDJy2dewrV/1+cRlsJhU1aafVmtohsv2+MkiJR/SYwlBR0vmk9sKytRCqQP+aw+qsqNUo6CViq4cY82wGOM92cPz2sxIulNI2Q8rmpbG0/tPJOxIvngG2CjDytB/3k1JfxO3fdampgVxjF8C/MgeWrNG114baeCGh9YsimvPbm+Z6k1Fw3fHyDQYugPq/93dT0oEiYGFjf1PQudYpgp/Tqr1V2oaACVMVKPZbt9s+ET0YxLRiPXWK6dirXb+nlcB2OC6+jt18GkodgCe7GEal8DzSEwvfTN5tVoFJoGrCjwx8zdgsQTD+FsiAHZCMsmYOswH+Pbc43lbkL6zISNElzrscmaoion1e5oRUbnUzcLaxcB5VjM2iGjoBN9gKp5tat6upsyPTaQ9jT+0ljLx1lxRJLv2iZI0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB4141.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(2906002)(8936002)(316002)(33656002)(426003)(86362001)(8676002)(4326008)(9686003)(26005)(66574014)(186003)(36756003)(9746002)(9786002)(66476007)(110136005)(478600001)(54906003)(83380400001)(1076003)(66556008)(66946007)(966005)(5660300002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: W3awLMfh4boklwVoIALszg/zdG91lmylg4OehcXuP6cc2zocxUaLNUMpv44KDEe4PxJfFJGgHC+6CSbteicxWG+xWc50eNDNEoeJc0gCerUXslsHxT9cVO9rUWCfobQfKECP2zbgifoXpfstn8Hb9EPYf/wZnydBEaNgUBjyexoG2Up75Eb0NY318pgi46LtmRMKLdaKx53QfWMriFSEiktJGdMndg8DVGnlDD5eCRbw3ZEyHjXLhl4gSEHcZ5yXMGHM0decYH1Wx0xW/IAoCPUc0hQwShWdJjEFhM/HGk/wK6YgnxJ+I8HtuoUZqc15sJDQk65n9hihb1wmnYcKt/gvUxjC35ILhDmZXYBuvrECmamDHuJtScJInRidjgUlZbG1SzUthPH1dbKjokd1ahC8og9atxpIW1JQL0gjqoL15uQF8QYW3ggEgo0jZa/9sLJGZqvLWs+oP6XlUZ6HaEf77z97r015QKmq3WmtujFufdZ7h7MSYajgg3lt5mpz
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f854f429-4ea0-4ca5-cc45-08d807fa9e55
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 20:13:45.7343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUv08PUESsfMQo9YK2C7zLjPWDkGYJHYLLE9MFM3/ZeLOLOrMt5m0VI4dsjM9WR2e8RcdCBs4mKW3ltjp2K/nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4461
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Logan Gunthorpe <logang@deltatee.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMDQ6MDY6MzJQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gSGkgTGludXMsCj4gCj4gVGhpcyBpcyB0aGUgbWFpbiBkcm0gcHVsbCByZXF1ZXN0IGZv
ciA1LjgtcmMxLgo+IAo+IEhpZ2hsaWdodHM6Cj4gQ29yZSBEUk0gaGFkIGEgbG90IG9mIHJlZmFj
dG9yaW5nIGFyb3VuZCBtYW5hZ2VkIGRybSByZXNvdXJjZXMgdG8gbWFrZQo+IGRyaXZlcnMgc2lt
cGxlci4KPiBJbnRlbCBUaWdlcmxha2Ugc3VwcG9ydCBpcyBvbiBieSBkZWZhdWx0Cj4gYW1kZ3B1
IG5vdyBzdXBwb3J0IHAycCBQQ0kgYnVmZmVyIHNoYXJpbmcgYW5kIGVuY3J5cHRlZCBHUFUgbWVt
b3J5CgpDaHJpc3RvcGggSGVsbHdpZyBiYXNpY2FsbHkgTkFLJ2QgdGhpcyBhcHByb2FjaCwgd2h5
IGlzIGl0IGdldHRpbmcKbWVyZ2VkIGFsbCBvZiBhIHN1ZGRlbj8/CgpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9pbnRlbC1nZngvMjAyMDAzMTExNTI4MzguR0EyNDI4MEBpbmZyYWRlYWQub3JnLwoK
QXJlIHdlIG5vdyBPSyB3aXRoIHRoaXMgc2FtZSBhcHByb2FjaCBvcGVuIGNvZGVkIGluIGEgZHJp
dmVyPwoKVGhpcyB3YXNuJ3QgQ2MnZCB0byB0aGUgdXN1YWwgcGVvcGxlIGRvaW5nIHdvcmsgaW4g
dGhpcyBQQ0kgUDJQIGFyZWE/PwoKU2VlCgpjb21taXQgZjQ0ZmZkNjc3ZmIzNTYyYWMwYTFmZjlj
OGFlNTI2NzJiZTc0MWYwMApBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KRGF0ZTogICBGcmkgTWFyIDIzIDE2OjU2OjM3IDIwMTggKzAxMDAKCiAgICBk
cm0vYW1kZ3B1OiBhZGQgc3VwcG9ydCBmb3IgZXhwb3J0aW5nIFZSQU0gdXNpbmcgRE1BLWJ1ZiB2
MwogICAgCiAgICBXZSBzaG91bGQgYmUgYWJsZSB0byBkbyB0aGlzIG5vdyBhZnRlciBjaGVja2lu
ZyBhbGwgdGhlIHByZXJlcXVpc2l0ZXMuCiAgICAKICAgIHYyOiBmaXggZW50cmllIGNvdW50IGlu
IHRoZSBzZ3QKICAgIHYzOiBtYW51YWxseSBjb25zdHJ1Y3QgdGhlIHNnCiAgICAKICAgIFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KICAg
IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgogICAgQWNr
ZWQtYnk6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CiAgICBMaW5rOiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzU5Mjk1CgpbLi5dCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwppbmRleCA4MmEzMjk5
ZTUzYzA0Mi4uMTI4YTY2N2VkOGZhMGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92cmFtX21nci5jCkBAIC0yMiw2ICsyMiw3IEBACiAgKiBBdXRob3JzOiBDaHJpc3Rp
YW4gS8O2bmlnCiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+CiAjaW5jbHVk
ZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3ZtLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2F0
b21maXJtd2FyZS5oIgpAQCAtNDU4LDYgKzQ1OSwxMDQgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Zy
YW1fbWdyX2RlbChzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKIAltZW0tPm1tX25v
ZGUgPSBOVUxMOwogfQogCisvKioKKyAqIGFtZGdwdV92cmFtX21ncl9hbGxvY19zZ3QgLSBhbGxv
Y2F0ZSBhbmQgZmlsbCBhIHNnIHRhYmxlCisgKgorICogQGFkZXY6IGFtZGdwdSBkZXZpY2UgcG9p
bnRlcgorICogQG1lbTogVFRNIG1lbW9yeSBvYmplY3QKKyAqIEBkZXY6IHRoZSBvdGhlciBkZXZp
Y2UKKyAqIEBkaXI6IGRtYSBkaXJlY3Rpb24KKyAqIEBzZ3Q6IHJlc3VsdGluZyBzZyB0YWJsZQor
ICoKKyAqIEFsbG9jYXRlIGFuZCBmaWxsIGEgc2cgdGFibGUgZnJvbSBhIFZSQU0gYWxsb2NhdGlv
bi4KKyAqLworaW50IGFtZGdwdV92cmFtX21ncl9hbGxvY19zZ3Qoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCisJCQkgICAgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSwKKwkJCSAgICAgIHN0
cnVjdCBkZXZpY2UgKmRldiwKKwkJCSAgICAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwK
KwkJCSAgICAgIHN0cnVjdCBzZ190YWJsZSAqKnNndCkKK3sKKwlzdHJ1Y3QgZHJtX21tX25vZGUg
Km5vZGU7CisJc3RydWN0IHNjYXR0ZXJsaXN0ICpzZzsKKwlpbnQgbnVtX2VudHJpZXMgPSAwOwor
CXVuc2lnbmVkIGludCBwYWdlczsKKwlpbnQgaSwgcjsKKworCSpzZ3QgPSBrbWFsbG9jKHNpemVv
Zigqc2cpLCBHRlBfS0VSTkVMKTsKKwlpZiAoISpzZ3QpCisJCXJldHVybiAtRU5PTUVNOworCisJ
Zm9yIChwYWdlcyA9IG1lbS0+bnVtX3BhZ2VzLCBub2RlID0gbWVtLT5tbV9ub2RlOworCSAgICAg
cGFnZXM7IHBhZ2VzIC09IG5vZGUtPnNpemUsICsrbm9kZSkKKwkJKytudW1fZW50cmllczsKKwor
CXIgPSBzZ19hbGxvY190YWJsZSgqc2d0LCBudW1fZW50cmllcywgR0ZQX0tFUk5FTCk7CisJaWYg
KHIpCisJCWdvdG8gZXJyb3JfZnJlZTsKKworCWZvcl9lYWNoX3NnKCgqc2d0KS0+c2dsLCBzZywg
bnVtX2VudHJpZXMsIGkpCisJCXNnLT5sZW5ndGggPSAwOworCisJbm9kZSA9IG1lbS0+bW1fbm9k
ZTsKKwlmb3JfZWFjaF9zZygoKnNndCktPnNnbCwgc2csIG51bV9lbnRyaWVzLCBpKSB7CisJCXBo
eXNfYWRkcl90IHBoeXMgPSAobm9kZS0+c3RhcnQgPDwgUEFHRV9TSElGVCkgKworCQkJYWRldi0+
Z21jLmFwZXJfYmFzZTsKKwkJc2l6ZV90IHNpemUgPSBub2RlLT5zaXplIDw8IFBBR0VfU0hJRlQ7
CisJCWRtYV9hZGRyX3QgYWRkcjsKKworCQkrK25vZGU7CisJCWFkZHIgPSBkbWFfbWFwX3Jlc291
cmNlKGRldiwgcGh5cywgc2l6ZSwgZGlyLAorCQkJCQlETUFfQVRUUl9TS0lQX0NQVV9TWU5DKTsK
KwkJciA9IGRtYV9tYXBwaW5nX2Vycm9yKGRldiwgYWRkcik7CisJCWlmIChyKQorCQkJZ290byBl
cnJvcl91bm1hcDsKKworCQlzZ19zZXRfcGFnZShzZywgTlVMTCwgc2l6ZSwgMCk7CisJCXNnX2Rt
YV9hZGRyZXNzKHNnKSA9IGFkZHI7CisJCXNnX2RtYV9sZW4oc2cpID0gc2l6ZTsKICAgICAgICAg
ICAgICAgIF5eXl5eXl5eXl5eXl5eCiAgCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
