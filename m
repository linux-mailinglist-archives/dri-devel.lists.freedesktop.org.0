Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65791EDDC0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC316E270;
	Thu,  4 Jun 2020 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B7D89CB8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 08:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKqHLPJfV92BcKD4TqEkzYddFLvVr6PUvkwVxWCDMynuAkeujrDPQp1UPu8PHmcl+JlSOurJAfuZXwBCHct481Tiq4JcBHknIM69IrrBDHtxWjPE6hGoXi6nc7Iww4j3CeoQspCK/QXvEE1T/TiKWnp29eIJVLdNhYzWMdBVwzbHM/s3NqDrGQJ3l7CYNQClml6EQ+Zx/sjA7/S+fbVXFO0x9LvQNM2l80yaBRrC+btaimq166jFUHhG3Vp9u34yQrUVJ75ehZQYMQ/5NjWWMwnO3lKkfxCeBwJYjz7aosfs+KKfgDzwI3tGdfzI2IIzAhtP7xTlO+g9jLvrAhSIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtFp6PwT2CGy6QdjLu02TSmCqjoPU2PJNjHoVdHjyq0=;
 b=gUJyIve8L53L+hkDPEsF4wggE1MwyM+74QbQXds9C8wDwvSeSdzc8T0DglzZe/YNBdq1ZwZPaICUX1L4aN0H7Dv7uqA+WLdnzdDrzbOg88DTDYWx1I+Cpq5o26JJo3MKpfYszu1f+1QYFVdoj3hXMxiscvzbwsk/3SDaZGYZMY0Qvt/bHDD+VC19Y+wO6jFdmH4YG82KpbKFIos7XlZTLQqqqH/G84wUHrKsmP05q3y313hsqlpYzWwxxXt7ylGtHc6D78mvEAS2a0UbQD6nS4d8vz2fsGW2rSUNjDuJr6HFw3Gvnsj4JLCSSfVrct8APpBK5nqP5Mj2c0y3FxRpxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=csgroup.eu smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtFp6PwT2CGy6QdjLu02TSmCqjoPU2PJNjHoVdHjyq0=;
 b=atN0GZ+QkAjSj3RZRo0NxuRt8M6FAe6wUGTq+9ldnvX7NXPOKHXkgPyOcOwQ6LnpipKHto9YzKsMFsRW53F9Z7NYKrSUVRZgY8eSinMaxBBisKnz7OGpTvVqOcIrS0LwtQixm0K7Zp3UzWL+l5SXFk351EQIsYc7YadTTPqndI8=
Received: from MN2PR11CA0027.namprd11.prod.outlook.com (2603:10b6:208:23b::32)
 by BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Wed, 3 Jun
 2020 08:20:35 +0000
Received: from BL2NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23b:cafe::74) by MN2PR11CA0027.outlook.office365.com
 (2603:10b6:208:23b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Wed, 3 Jun 2020 08:20:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT043.mail.protection.outlook.com (10.152.77.95) with Microsoft SMTP
 Server id 15.20.3045.17 via Frontend Transport; Wed, 3 Jun 2020 08:20:34
 +0000
Received: from [149.199.38.66] (port=37825 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jgOcm-0005xa-CQ; Wed, 03 Jun 2020 01:19:48 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jgOdV-0000gq-NL; Wed, 03 Jun 2020 01:20:33 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0538KNoq025997; 
 Wed, 3 Jun 2020 01:20:23 -0700
Received: from [172.30.17.109] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jgOdL-0000MD-2d; Wed, 03 Jun 2020 01:20:23 -0700
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michal Simek <michal.simek@xilinx.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Takashi Iwai <tiwai@suse.de>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
 <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
 <87wo4yerom.fsf@mpe.ellerman.id.au>
 <4b807ebc-8d8f-ad76-f5e2-9ce8410dc70c@xilinx.com>
 <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <aeb6da47-2072-ea25-0c11-27a5c23f0e78@xilinx.com>
Date: Wed, 3 Jun 2020 10:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
Content-Language: en-US
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(136003)(39850400004)(396003)(346002)(376002)(46966005)(426003)(8936002)(336012)(186003)(31686004)(44832011)(82310400002)(6666004)(83380400001)(2616005)(81166007)(36756003)(82740400003)(26005)(110136005)(54906003)(47076004)(316002)(5660300002)(9786002)(966005)(70586007)(7366002)(7406005)(478600001)(7416002)(2906002)(66574014)(31696002)(8676002)(4326008)(356005)(70206006)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eb09405-8068-4558-9486-08d80796fd33
X-MS-TrafficTypeDiagnostic: BYAPR02MB4886:
X-Microsoft-Antispam-PRVS: <BYAPR02MB48860603B24E66E20C40E584C6880@BYAPR02MB4886.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWwIkId2jRyeO7aQbPQq5eoWONbnWBZF0nhOOxmvtlOxaBhvSUwXcyyvNe1K2fgiwQbdwttHTlDt2243a/BBRil2Jeq7btiL9dJppKAhYMqZpZareH4ZvbJosuY4QC3u77e3j1tupO741NdEuWxOdpDtLpI8kukuw5+db/gqrKAhlMT8c9XG0vQjw0vR1AeGZkSWukoEJASfPGQ+WTG5jIr+Sb1aTEniKfeU7HLidndUVjIlVsCmb9iLfJhfzM/+3k0lM5UgbvTNXZL9raNU+B/qml9qKU3asUusXw9K5FosvOeKTs1UuCsN8N5dXUPrKuq5GHwMlWpLBqf0dfsMpt35rUB0IK5m0Zu/zPR+J2vwPxQYD76OJmkXrHnbVeXzGWMfehejYJU5n/zCs+TYGVjL78vCkxgI+DGvQf8276p4LyzoDhSe/GCA8oBqbD74qiTwT5EdJTIK3EcCPqb+A0UsD4mbC6aN87NNA+3bio+AlEasqJpTfvCxSU79Ym92
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 08:20:34.6730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb09405-8068-4558-9486-08d80796fd33
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4886
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, sfr@canb.auug.org.au,
 Jonathan Corbet <corbet@lwn.net>, maz@kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMuIDA2LiAyMCAxMDoxMywgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiBIaSwKPiAKPiBM
ZSAwMy8wNi8yMDIwIMOgIDEwOjEwLCBNaWNoYWwgU2ltZWsgYSDDqWNyaXTCoDoKPj4gSGkgTWlj
aGFlbCwKPj4KPj4gT24gMjYuIDA1LiAyMCAxNTo0NCwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToK
Pj4+IE1pY2hhbCBTaW1layA8bW9uc3RyQG1vbnN0ci5ldT4gd3JpdGVzOgo+Pj4+IEhpIE1pY2hh
ZWwsCj4+Pj4KPj4+PiBPbiAwMS4gMDQuIDIwIDEzOjMwLCBNaWNoYWwgU2ltZWsgd3JvdGU6Cj4+
Pj4+IE9uIDAxLiAwNC4gMjAgMTI6MzgsIFRha2FzaGkgSXdhaSB3cm90ZToKPj4+Pj4+IE9uIFdl
ZCwgMDEgQXByIDIwMjAgMTI6MzU6MTYgKzAyMDAsCj4+Pj4+PiBNaWNoYWVsIEVsbGVybWFuIHdy
b3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNv
bT4gd3JpdGVzOgo+Pj4+Pj4+PiBPbiAwMS4gMDQuIDIwIDQ6MDcsIE1pY2hhZWwgRWxsZXJtYW4g
d3JvdGU6Cj4+Pj4+Pj4+PiBNaWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4aWxpbnguY29tPiB3
cml0ZXM6Cj4+Pj4+Pj4+Pj4gSGksCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiByZWNlbnRseSB3ZSB3
YW50ZWQgdG8gdXBkYXRlIHhpbGlueCBpbnRjIGRyaXZlciBhbmQgd2UgZm91bmQKPj4+Pj4+Pj4+
PiB0aGF0IGZ1bmN0aW9uCj4+Pj4+Pj4+Pj4gd2hpY2ggd2Ugd2FudGVkIHRvIHJlbW92ZSBpcyBz
dGlsbCB3aXJlZCBieSBhbmNpZW50IFhpbGlueAo+Pj4+Pj4+Pj4+IFBvd2VyUEMKPj4+Pj4+Pj4+
PiBwbGF0Zm9ybXMuIEhlcmUgaXMgdGhlIHRocmVhZCBhYm91dCBpdC4KPj4+Pj4+Pj4+PiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1uZXh0LzQ4ZDMyMzJkLTBmMWQtNDJlYS0zMTA5LWY0
NGJiYWJmYTJlOEB4aWxpbnguY29tLwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBJ
IGhhdmUgYmVlbiB0YWxraW5nIGFib3V0IGl0IGludGVybmFsbHkgYW5kIHRoZXJlIGlzIG5vCj4+
Pj4+Pj4+Pj4gaW50ZXJlc3QgaW4gdGhlc2UKPj4+Pj4+Pj4+PiBwbGF0Zm9ybXMgYW5kIGl0IGlz
IGFsc28gb3JwaGFuIGZvciBxdWl0ZSBhIGxvbmcgdGltZS4gTm9uZSBpcwo+Pj4+Pj4+Pj4+IHJl
YWxseQo+Pj4+Pj4+Pj4+IHJ1bm5pbmcvdGVzdGluZyB0aGVzZSBwbGF0Zm9ybXMgcmVndWxhcmx5
IHRoYXQncyB3aHkgSSB0aGluawo+Pj4+Pj4+Pj4+IGl0IG1ha2VzIHNlbnNlCj4+Pj4+Pj4+Pj4g
dG8gcmVtb3ZlIHRoZW0gYWxzbyB3aXRoIGRyaXZlcnMgd2hpY2ggYXJlIHNwZWNpZmljIHRvIHRo
aXMKPj4+Pj4+Pj4+PiBwbGF0Zm9ybS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFUtQm9vdCBzdXBw
b3J0IHdhcyByZW1vdmVkIGluIDIwMTcgd2l0aG91dCBhbnlib2R5IGNvbXBsYWluCj4+Pj4+Pj4+
Pj4gYWJvdXQgaXQKPj4+Pj4+Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L3UtYm9vdC14
bG54L2NvbW1pdC85OGY3MDVjOWNlZmRmZGJhNjJjMDY5ODIxYmJiYTEwMjczYTBhOGVkCj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEJhc2VkIG9uIGN1cnJlbnQgcHBjL25leHQuCj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBJZiBhbnlvbmUgaGFzIGFueSBvYmplY3Rpb24gYWJvdXQgaXQs
IHBsZWFzZSBsZXQgbWUga25vdy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBUaGFua3MgZm9yIHRha2lu
ZyB0aGUgdGltZSB0byBmaW5kIGFsbCB0aGlzIGNvZGUgYW5kIHJlbW92ZSBpdC4KPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBJJ20gbm90IGdvaW5nIHRvIHRha2UgdGhpcyBzZXJpZXMgZm9yIHY1LjcsIGl0
IHdhcyBwb3N0ZWQgdG9vCj4+Pj4+Pj4+PiBjbG9zZSB0bwo+Pj4+Pj4+Pj4gdGhlIG1lcmdlIHdp
bmRvdywgYW5kIGRvaW5nIHNvIHdvdWxkbid0IGdpdmUgcGVvcGxlIG11Y2ggdGltZQo+Pj4+Pj4+
Pj4gdG8gb2JqZWN0LAo+Pj4+Pj4+Pj4gZXNwZWNpYWxseSBnaXZlbiBwZW9wbGUgYXJlIGRpc3Ry
YWN0ZWQgYXQgdGhlIG1vbWVudC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJJ20gaGFwcHkgdG8gdGFr
ZSBpdCBmb3IgdjUuOCwgYXNzdW1pbmcgdGhlcmUncyBubyBtYWpvcgo+Pj4+Pj4+Pj4gb2JqZWN0
aW9ucy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU3VyZS4gSnVzdCB0byBsZXQgeW91IGtub3cgQ2hyaXN0
b3BoZSBMZXJveSBpbmNsdWRlZCB0aGlzIHBhdGNoCj4+Pj4+Pj4+IGluIGhpcwo+Pj4+Pj4+PiBz
ZXJpZXMgYWJvdXQgcHBjNDA1IHJlbW92YWwuIEl0IHNob3VsZCBiZSB0aGUgc2FtZS4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gSWYgeW91IGRvbid0IHdhbnQgdG8gdGFrZSB0aGF0IGFsc2EgcGF0Y2ggSSBj
YW4gc2VuZCBpdAo+Pj4+Pj4+PiBzZXBhcmF0ZWx5IGFuZAo+Pj4+Pj4+PiB0aGlzIHBhdGNoIGNh
biBiZSB0YWtlbiBmcm9tIGhpcyBzZXJpZXMuIEkgZG9uJ3QgcmVhbGx5IG1pbmQgYnV0Cj4+Pj4+
Pj4+IHBsZWFzZQo+Pj4+Pj4+PiBsZXQgbWUga25vdyB3aGF0IHdheSB5b3UgcHJlZmVyLgo+Pj4+
Pj4+Cj4+Pj4+Pj4gSXQncyBiZXR0ZXIgdG8ga2VlcCBpdCBhbGwgdG9nZXRoZXIsIHNvIEknbSBo
YXBweSB0YWtlIHRoZSBhbHNhCj4+Pj4+Pj4gcGF0Y2ggYXMKPj4+Pj4+PiB3ZWxsLCBpdCdzIGFs
cmVhZHkgYmVlbiBhY2tlZC4KPj4+Pgo+Pj4+IENhbiB5b3UgcGxlYXNlIHRha2UgdGhpcyBzZXJp
ZXM/IEkga25vdyB0aGF0IHRoZXJlIGlzIHY1IGZyb20KPj4+PiBDaHJpc3RvcGhlCj4+Pj4gd2hp
Y2ggaGFzIHRoaXMgMS8yIGFzIDEvMTMuIEJ1dCBJIG5lZWQgdGhpcyBhbHNhIHBhdGNoIHRvbyBh
bmQgSSB3b3VsZAo+Pj4+IGxpa2UgdG8gY2xvc2UgdGhpcyBiZWNhdXNlIGl0IGlzIGFyb3VuZCBm
b3IgYWxtb3N0IDIgbW9udGhzIGFuZCBub25lCj4+Pj4gcmFpc2VkIGEgY29uY2VybiBhYm91dCBy
ZW1vdmluZyBqdXN0IHRoZXNlIFhpbGlueCBwbGF0Zm9ybXMuCj4+Pgo+Pj4gU29ycnkgSSBtZWFu
dCB0byByZXBseSB0byB5b3VyIGxhc3QgbWFpbC4KPj4+Cj4+PiBJIGhhdmUgQ2hyaXN0b3BoZSdz
IHNlcmllcyBpbiBteSB0ZXN0aW5nIGJyYW5jaCwgcGxhbm5pbmcgZm9yIGl0IHRvIGJlCj4+PiBp
biB2NS44Lgo+Pj4KPj4+IEV2ZW4gaWYgdGhlIHJlc3Qgb2YgaGlzIHNlcmllcyBkb2Vzbid0IG1h
a2UgaXQgZm9yIHNvbWUgcmVhc29uLCBhcyB5b3UKPj4+IHNheSB0aGUgWGlsaW54IHJlbW92YWwg
aXMgdW5jb250cm92ZXJzaWFsIHNvIEknbGwga2VlcCB0aGF0IGluLgo+Pj4KPj4+IEkgZm9yZ290
IGFib3V0IHRoZSBzb3VuZCBwYXRjaCwgSSdsbCBwaWNrIHRoYXQgdXAgYXMgd2VsbC4KPj4KPj4g
SSB0b29rIGEgbG9vayBhdCB5b3VyCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3Bvd2VycGMvbGludXguZ2l0IHJlcG8KPj4gYW5kIEkgY2FuJ3Qgc2Vl
IGFueSBicmFuY2ggd2l0aCBteSBwYXRjaGVzLgo+PiBBbHNvIHdhcyBjaGVja2luZyBsaW51eC1u
ZXh0IGFuZCBteSBwYXRjaGVzIGFyZSBhbHNvIG5vdCB0aGVyZS4KPj4gVGhhdCdzIHdoeSBJIGFt
IGN1cmlvdXMgaWYgdGhpcyB3aWxsIGJlIGdvIHY1LjggaW4gTVcuCj4gCj4gSSBzZWUgdGhlbSBp
bgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Bvd2Vy
cGMvbGludXguZ2l0IGluCj4gbmV4dC10ZXN0IGJyYW5jaC4KCmFoLiBNeSBiYWQuCgpUaGFua3Ms
Ck1pY2hhbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
