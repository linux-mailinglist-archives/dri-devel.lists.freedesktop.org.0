Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E915519A5D1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB81F6E8EB;
	Wed,  1 Apr 2020 07:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292306E264
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbVHZvYQSo8WEaG5tyBaF75ebj1E6rEOguJStGghRBXxI5lG27RViebd0+hRVILVis/1W1VzjZ13AcYpk0gDnfQ8+NxgIaeWTbgJKfrV8FAEFkgatX8L0l3SnW82HhSDafPhfNzV+o81T4U6nW5ka+RwiQcLfnvKMAfZBfs46YQfiJimNCkQ0qnkd/TEq3fxS4oqt64C+plW/gFRJNmfr++tDnjC6XJQuQkWvfE6dYVdUjsPRl6Rfx76rvvMbyNSwvs7sHVytLfYks3UOqm4SjzU3ReKHGsAK13iOB/HDEeS+wGd0HGmjCLou5QG5IGGACA3T3+vvzot6jPiIJfNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDgClzBf/Hti3579BZ19ywYfTGYv5EUbB3FPmLePVDE=;
 b=ksdZn/fejDxiUA+GscFQBQAJSKMLqoxWX42V6I1WH4HllO5E8Cr14MZwA17JRYmNgGtlSjW/RpMtDPK2HZPtWNjQnMkdCmEt/+AH6suirEOh+34nsv19gnSkKmb5SjbfhJ8YZhiu8Ekd5F6j8YIE0GHnJQRrp8jr9Ghf52SluHZJzZnEB1xeq3EF2u0AY619RE3IXwF2IaH5D5WMIfE2hqbmT4aJ6TVvCfU0U+SRzy0sO833eSCAhQU0bXHB9h7pxgMVjB/sSgk1o0Ai3jsAGRsCcJFHs3haFx3+JVR89VP5jgUasc3WSMcbVu1rDnYns3+w9J73RzCc5rApAd1htA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=c-s.fr smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDgClzBf/Hti3579BZ19ywYfTGYv5EUbB3FPmLePVDE=;
 b=RVI5RsBxdSGY0U2xeeg0M+ok9Lqoi1PuwW7hLBMbt2SBm0BqpeEp5YGUxa6+frKB8coh/mNVksd3F1gW51nwwYdyTxCVE+tqfHndsnXTrD5Ut/CJEV1Q3ajNTeNW1U0IGqoZr1TYUaQ2yR//Ltm4eg6FnW/yagU5H0czyU7SMss=
Received: from SN4PR0501CA0032.namprd05.prod.outlook.com
 (2603:10b6:803:40::45) by BL0PR02MB5523.namprd02.prod.outlook.com
 (2603:10b6:208:84::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 06:59:57 +0000
Received: from SN1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:40:cafe::e) by SN4PR0501CA0032.outlook.office365.com
 (2603:10b6:803:40::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.12 via Frontend
 Transport; Tue, 31 Mar 2020 06:59:57 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; c-s.fr; dkim=none (message not signed)
 header.d=none; c-s.fr; dmarc=bestguesspass action=none header.from=xilinx.com; 
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT027.mail.protection.outlook.com (10.152.72.99) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2856.17
 via Frontend Transport; Tue, 31 Mar 2020 06:59:56 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJAsO-0004WQ-09; Mon, 30 Mar 2020 23:59:56 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jJAsI-0003Q5-Ss; Mon, 30 Mar 2020 23:59:50 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02V6xiVp004073; 
 Mon, 30 Mar 2020 23:59:44 -0700
Received: from [172.30.17.108] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jJAsB-0003OK-Jh; Mon, 30 Mar 2020 23:59:43 -0700
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <adb18d3b-fd30-c328-cedd-bac5d8611fa2@xilinx.com>
Date: Tue, 31 Mar 2020 08:59:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
Content-Language: en-US
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(426003)(316002)(186003)(110136005)(966005)(2616005)(26005)(54906003)(4326008)(6666004)(478600001)(356004)(7366002)(8936002)(31686004)(336012)(8676002)(53546011)(44832011)(47076004)(82740400003)(2906002)(70586007)(7416002)(81166006)(81156014)(31696002)(9786002)(7406005)(36756003)(5660300002)(70206006);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79617cb0-b9ca-4211-a17e-08d7d5411f19
X-MS-TrafficTypeDiagnostic: BL0PR02MB5523:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <BL0PR02MB552360521C0297D1FE74A6EDC6C80@BL0PR02MB5523.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0359162B6D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RoxM6hOZlHdjJ8rjXjfETbqRf1ywO8mmR6/uTeNbVdkNR2R9Pn8vHx3wJSF5SXnwJf20P082QK4A4TvLPgiY97WlZGw+VZDQNNWfvADw3qXBHeK0m0CEpDEI2OmJ3e1wQqlNIiw17RepTVJP/+egr65/geJ98UWWN5QjWfOUg+NzTmUSLfCdSLvuXfbLJZkjiQhawG19ff5DFGFqyqkx9E/OBGooDbE/KSuuznKk4Zzas6LTG+Gd1pvv3lrF3FFb0TLruvSWbVHklISJxdrq5IMK267vPWe5hnN91rDFPOu03yTlURFYnhYe/gHDqnu3Y4n21Y/rDbq2pPSSEYiVZVlqDG5Dz2GRqQxMmcDswudr4u8UPWPK8qlomIpd5XbIMv+bW7IZkSwYTGAXuAHwP/JvTiQzlQXI+pEgLdEWlKIFbYhulSjRwHuKdge9lSoIs1d7BLPfScfkhK9XBJYZe7Sc29q85vj9VaG5Z20NIkY2dUuALD3LgbUIGdSvCVSomt4IthhosEPNG98H/mhsMc+Ysp9EZfmcrYGO2/ZGriQguEGH9UcuQ11JUFXgdbdqt41trJlQzRbFWRB045L69pq+1o/kFGmFcmm7vFS26Y=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 06:59:56.5449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79617cb0-b9ca-4211-a17e-08d7d5411f19
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5523
X-Mailman-Approved-At: Wed, 01 Apr 2020 07:03:42 +0000
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Michal Simek <monstr@monstr.eu>, Wei Hu <weh@microsoft.com>,
 Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzEuIDAzLiAyMCA4OjU2LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+IExlIDMx
LzAzLzIwMjAgw6AgMDc6MzAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoKPj4gQ2hyaXN0
b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+IHdyaXRlczoKPj4+IExlIDI3LzAz
LzIwMjAgw6AgMTU6MTQsIEFuZHkgU2hldmNoZW5rbyBhIMOpY3JpdMKgOgo+Pj4+IE9uIEZyaSwg
TWFyIDI3LCAyMDIwIGF0IDAyOjIyOjU1UE0gKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+
Pj4+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDI6MTUgUE0gQW5keSBTaGV2Y2hlbmtvCj4+Pj4+
IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Pj4+Pj4gT24gRnJp
LCBNYXIgMjcsIDIwMjAgYXQgMDM6MTA6MjZQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+Pj4+Pj4+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDAxOjU0OjMzUE0gKzAxMDAsIEFybmQg
QmVyZ21hbm4gd3JvdGU6Cj4+Pj4+Pj4+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDE6MTIgUE0g
TWljaGFsIFNpbWVrCj4+Pj4+Pj4+IDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4gd3JvdGU6Cj4+
Pj4gLi4uCj4+Pj4KPj4+Pj4+Pj4gSXQgZG9lcyByYWlzZSBhIGZvbGxvdy11cCBxdWVzdGlvbiBh
Ym91dCBwcGM0MHggdGhvdWdoOiBpcyBpdAo+Pj4+Pj4+PiB0aW1lIHRvCj4+Pj4+Pj4+IHJldGly
ZSBhbGwgb2YgaXQ/Cj4+Pj4+Pj4KPj4+Pj4+PiBXaG8ga25vd3M/Cj4+Pj4+Pj4KPj4+Pj4+PiBJ
IGhhdmUgaW4gcG9zc2Vzc2lvbiBuaWNlIFdEIE15IEJvb2sgTGl2ZSwgYmFzZWQgb24gdGhpcwo+
Pj4+Pj4+IGFyY2hpdGVjdHVyZSwgYW5kIEkKPj4+Pj4+PiB3b24ndCBpdCBnb25lIGZyb20gbW9k
ZXJuIGtlcm5lbCBzdXBwb3J0LiBPVE9IIEkgdW5kZXJzdGFuZCB0aGF0Cj4+Pj4+Pj4gYW1vdW50
IG9mIHJlYWwKPj4+Pj4+PiB1c2VycyBub3QgdG9vIGJpZy4KPj4+Pj4+Cj4+Pj4+PiArQ2M6IENo
cmlzdGlhbiBMYW1wYXJ0ZXIsIHdob20gSSBvd2UgZm9yIHRoYXQgV0QgYm94Lgo+Pj4+Pgo+Pj4+
PiBBY2NvcmRpbmcgdG8gaHR0cHM6Ly9vcGVud3J0Lm9yZy90b2gvd2QvbXlib29rbGl2ZSwgdGhh
dCBvbmUgaXMKPj4+Pj4gYmFzZWQgb24KPj4+Pj4gQVBNODIxODEvcHBjNDY0LCBzbyBpdCBpcyBh
Ym91dCBzZXZlcmFsIGdlbmVyYXRpb25zIG5ld2VyIHRoYW4gd2hhdCBJCj4+Pj4+IGFza2VkIGFi
b3V0IChwcGM0MHgpLgo+Pj4+Pgo+Pj4+Pj4+IEFoLCBhbmQgSSBoYXZlIEFtaWdhIGJvYXJkLCBi
dXQgdGhhdCBvbmUgaXMgYmVpbmcgdXNlZCBvbmx5IGZvcgo+Pj4+Pj4+IHRlc3RpbmcsIHNvLAo+
Pj4+Pj4+IEkgZG9uJ3QgY2FyZSBtdWNoLgo+Pj4+Pgo+Pj4+PiBJIHRoaW5rIHRoZXJlIGFyZSBh
IGNvdXBsZSBvZiBwcGM0NDAgYmFzZWQgQW1pZ2EgYm9hcmRzLCBidXQgYWdhaW4sCj4+Pj4+IG5v
dCA0MDUKPj4+Pj4gdG8gbXkga25vd2xlZGdlLgo+Pj4+Cj4+Pj4gQWgsIHlvdSBhcmUgcmlnaHQu
IE5vIG9iamVjdGlvbnMgZnJvbSBwcGM0MHggcmVtb3ZhbCEKPj4+Cj4+PiBSZW1vdmluZyA0MHgg
d291bGQgaGVscCBjbGVhbmluZyB0aGluZ3MgYSBiaXQuIEZvciBpbnN0YW5jZSA0MHggaXMgdGhl
Cj4+PiBsYXN0IHBsYXRmb3JtIHN0aWxsIGhhdmluZyBQVEVfQVRPTUlDX1VQREFURVMuIFNvIGlm
IHdlIGNhbiByZW1vdmUgNDB4Cj4+PiB3ZSBjYW4gZ2V0IHJpZCBvZiBQVEVfQVRPTUlDX1VQREFU
RVMgY29tcGxldGVseS4KPj4+Cj4+PiBJZiBubyBvbmUgb2JqZWN0cywgSSBjYW4gcHJlcGFyZSBh
IHNlcmllcyB0byBkcm9wIHN1cHBvcnQgZm9yIDQweAo+Pj4gY29tcGxldGVseS4KPj4+Cj4+PiBN
aWNoYWVsLCBhbnkgdGhvdWdodCA/Cj4+Cj4+IEkgaGF2ZSBubyBhdHRhY2htZW50IHRvIDQweCwg
YW5kIEknZCBjZXJ0YWlubHkgYmUgaGFwcHkgdG8gaGF2ZSBsZXNzCj4+IGNvZGUgaW4gdGhlIHRy
ZWUsIHdlIHN0cnVnZ2xlIHRvIGtlZXAgZXZlbiB0aGUgbW9kZXJuIHBsYXRmb3JtcyB3ZWxsCj4+
IG1haW50YWluZWQuCj4+Cj4+IEF0IHRoZSBzYW1lIHRpbWUgSSBkb24ndCB3YW50IHRvIHJlbmRl
ciBhbnlvbmUncyBoYXJkd2FyZSBvYnNvbGV0ZQo+PiB1bm5lY2Vzc2FyaWx5LiBCdXQgaWYgdGhl
cmUncyByZWFsbHkgbm8gb25lIHVzaW5nIDQweCB0aGVuIHdlIHNob3VsZAo+PiByZW1vdmUgaXQs
IGl0IGNvdWxkIHdlbGwgYmUgYnJva2VuIGFscmVhZHkuCj4+Cj4+IFNvIEkgZ3Vlc3MgcG9zdCBh
IHNlcmllcyB0byBkbyB0aGUgcmVtb3ZhbCBhbmQgd2UnbGwgc2VlIGlmIGFueW9uZQo+PiBzcGVh
a3MgdXAuCj4+Cj4gCj4gT2ssIHNlcmllcyBzZW50IG91dCwgc2VlCj4gaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9saXN0Lz9zZXJpZXM9MTY3NzU3Cgpv
ay4gSSBzZWUgeW91IGhhdmUgZG9uZSBpdCBjb21wbGV0ZWx5IGluZGVwZW5kZW50bHkgb2YgbXkg
cGF0Y2hzZXQuCldvdWxkIGJlIGJldHRlciBpZiB5b3UgY2FuIGJhc2UgaXQgb24gdGhlIHRvcCBv
ZiBteSAyIHBhdGNoZXMgYmVjYXVzZQp0aGV5IGFyZSBpbiBjb25mbGljdCBub3cgYW5kIEkgbmVl
ZCB0byBhbHNvIHJlbW92ZSB2aXJ0ZXggNDR4IHBsYXRmb3JtCmFsc28gd2l0aCBhbHNhIGRyaXZl
ci4KClRoYW5rcywKTWljaGFsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
